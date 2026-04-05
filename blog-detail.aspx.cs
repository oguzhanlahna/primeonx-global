using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web;

namespace primeonx_global
{
    public partial class blog_detail : System.Web.UI.Page
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtSearch.Text = (Request.QueryString["q"] ?? "").Trim();
                txtSearch.Attributes["placeholder"] = T("Enter keyword", "Anahtar kelime");

                BindSidebar();

                string slug = GetSlugFromRoute();
                if (string.IsNullOrWhiteSpace(slug))
                {
                    RenderNotFound();
                    return;
                }

                BindPost(slug);
            }
        }

        // =========================
        // Lang helpers (EN/TR) - C#5
        // =========================
        private string CurrentLang()
        {
            var sm = Master as SiteMaster;
            var lang = (sm != null ? sm.GetCurrentLang() : "en");
            lang = (lang ?? "en").Trim().ToLowerInvariant();
            return lang == "tr" ? "tr" : "en";
        }

        private bool IsTr()
        {
            return CurrentLang() == "tr";
        }

        public string T(string en, string tr)
        {
            return IsTr() && !string.IsNullOrWhiteSpace(tr) ? tr : en;
        }

        private CultureInfo UiCulture()
        {
            return IsTr() ? new CultureInfo("tr-TR") : new CultureInfo("en-US");
        }

        private string BlogListPath()
        {
            // /blog veya /tr/blog
            var sm = Master as SiteMaster;
            var p = sm != null ? sm.L("blog") : null;
            if (!string.IsNullOrWhiteSpace(p)) return p;
            return IsTr() ? "/tr/blog" : "/blog";
        }

        private string BlogPostPath(string slug)
        {
            slug = (slug ?? "").Trim();
            if (slug.Length == 0) return BlogListPath();
            return BlogListPath().TrimEnd('/') + "/" + HttpUtility.UrlPathEncode(slug);
        }

        private string GetSiteBaseUrlSafe()
        {
            var sm = Master as SiteMaster;
            try
            {
                var baseUrl = sm != null ? sm.GetSiteBaseUrl() : null;
                if (!string.IsNullOrWhiteSpace(baseUrl))
                    return baseUrl.TrimEnd('/');
            }
            catch { /* ignore */ }

            return Request.Url.GetLeftPart(UriPartial.Authority).TrimEnd('/');
        }

        // =========================
        // Search
        // =========================
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var q = (txtSearch.Text ?? "").Trim();

            if (string.IsNullOrWhiteSpace(q))
                Response.Redirect(BlogListPath(), true);

            Response.Redirect(BlogListPath() + "?q=" + HttpUtility.UrlEncode(q), true);
        }

        // =========================
        // Route slug
        // =========================
        private string GetSlugFromRoute()
        {
            var obj = Page.RouteData.Values["slug"];
            return obj == null ? "" : obj.ToString().Trim();
        }

        // =========================
        // Bind Post
        // =========================
        private void BindPost(string slug)
        {
            var post = GetPostBySlug(slug);
            if (post == null)
            {
                RenderNotFound();
                return;
            }

            phNotFound.Visible = false;
            phContent.Visible = true;

            int postId = Convert.ToInt32(post["Id"]);
            string title = Convert.ToString(post["Title"]);
            string excerpt = Convert.ToString(post["Excerpt"]);
            string contentHtml = Convert.ToString(post["ContentHtml"]);
            string author = Convert.ToString(post["AuthorName"]);
            string featuredImage = Convert.ToString(post["FeaturedImageUrl"]);

            DateTime? publishedAt = post["PublishedAt"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(post["PublishedAt"]);

            string seoTitle = Convert.ToString(post["SeoTitle"]);
            string seoDesc = Convert.ToString(post["SeoDescription"]);
            string canonicalOverride = Convert.ToString(post["CanonicalUrl"]);
            string ogImageOverride = Convert.ToString(post["OgImageUrl"]);

            if (string.IsNullOrWhiteSpace(seoTitle))
                seoTitle = title + " | Primeonx Blog";

            if (string.IsNullOrWhiteSpace(seoDesc))
                seoDesc = !string.IsNullOrWhiteSpace(excerpt) ? excerpt : T("Primeonx blog article.", "Primeonx blog yazısı.");

            // canonical: dil prefix dahil
            string canonical = !string.IsNullOrWhiteSpace(canonicalOverride)
                ? canonicalOverride
                : (GetSiteBaseUrlSafe() + BlogPostPath(slug));

            // og:image absolute
            string ogImage = !string.IsNullOrWhiteSpace(ogImageOverride)
                ? MakeAbsoluteUrl(ogImageOverride)
                : MakeAbsoluteUrl(string.IsNullOrWhiteSpace(featuredImage) ? "/assets/images/blog/05.webp" : featuredImage);

            var sm = Master as SiteMaster;
            if (sm != null)
            {
                sm.SetSeo(
                    seoTitle: seoTitle,
                    metaDescription: seoDesc,
                    canonicalUrl: canonical,
                    ogTitle: seoTitle,
                    ogType: "article",
                    ogImageUrl: ogImage
                );
            }
            else
            {
                Page.Title = seoTitle;
            }

            // UI
            litBreadcrumbTitle.Text = HttpUtility.HtmlEncode(title);
            litTitleH1.Text = HttpUtility.HtmlEncode(title);

            litTitle.Text = HttpUtility.HtmlEncode(title);
            litAuthor.Text = HttpUtility.HtmlEncode(string.IsNullOrWhiteSpace(author) ? "Primeonx Editorial" : author);
            litDate.Text = publishedAt.HasValue ? publishedAt.Value.ToString("dd MMM, yyyy", UiCulture()) : "";

            // featured image: URL normalize
            string img = string.IsNullOrWhiteSpace(featuredImage) ? "/assets/images/blog/05.webp" : featuredImage;
            imgFeatured.ImageUrl = ResolveUrl(img);
            imgFeatured.AlternateText = title;

            // ContentHtml HTML olarak basılır (admin panel varsa sanitize şart)
            litContentHtml.Text = contentHtml;

            rptPostCategories.DataSource = GetPostCategories(postId);
            rptPostCategories.DataBind();

            rptPostTags.DataSource = GetPostTags(postId);
            rptPostTags.DataBind();

            litJsonLd.Text = BuildJsonLd(title, seoDesc, canonical, ogImage, publishedAt);
        }

        private void RenderNotFound()
        {
            Response.StatusCode = 404;
            Response.TrySkipIisCustomErrors = true;

            phNotFound.Visible = true;
            phContent.Visible = false;

            var sm = Master as SiteMaster;
            if (sm != null)
            {
                sm.SetSeo(
                    seoTitle: T("Not Found | Primeonx Blog", "Bulunamadı | Primeonx Blog"),
                    metaDescription: T("The requested article was not found.", "İstenen yazı bulunamadı."),
                    canonicalUrl: GetSiteBaseUrlSafe() + BlogListPath(),
                    ogTitle: T("Not Found | Primeonx Blog", "Bulunamadı | Primeonx Blog"),
                    ogType: "website",
                    ogImageUrl: null
                );
            }
            else
            {
                Page.Title = T("Not Found | Primeonx Blog", "Bulunamadı | Primeonx Blog");
            }
        }

        // =========================
        // Sidebar
        // =========================
        private void BindSidebar()
        {
            rptCategories.DataSource = GetCategoriesWithCounts();
            rptCategories.DataBind();

            rptRecent.DataSource = GetRecentPosts(5);
            rptRecent.DataBind();

            rptTags.DataSource = GetPopularTags(20);
            rptTags.DataBind();
        }

        // =========================
        // URL helpers
        // =========================
        private string BuildListUrl(string q, string category, string tag, int page)
        {
            var qs = HttpUtility.ParseQueryString(string.Empty);

            if (!string.IsNullOrWhiteSpace(q)) qs["q"] = q;
            if (!string.IsNullOrWhiteSpace(category)) qs["category"] = category;
            if (!string.IsNullOrWhiteSpace(tag)) qs["tag"] = tag;

            if (page > 1) qs["page"] = page.ToString(CultureInfo.InvariantCulture);

            var query = qs.ToString();
            var basePath = BlogListPath();

            return string.IsNullOrWhiteSpace(query) ? basePath : basePath + "?" + query;
        }

        private string MakeAbsoluteUrl(string maybeRelative)
        {
            if (string.IsNullOrWhiteSpace(maybeRelative)) return "";

            if (maybeRelative.StartsWith("http://", StringComparison.OrdinalIgnoreCase) ||
                maybeRelative.StartsWith("https://", StringComparison.OrdinalIgnoreCase))
                return maybeRelative;

            var baseUrl = GetSiteBaseUrlSafe();
            if (!maybeRelative.StartsWith("/")) maybeRelative = "/" + maybeRelative;
            return baseUrl + maybeRelative;
        }

        // =========================
        // JSON-LD
        // =========================
        private string BuildJsonLd(string title, string description, string canonical, string image, DateTime? publishedAt)
        {
            string pub = publishedAt.HasValue ? publishedAt.Value.ToString("yyyy-MM-dd") : "";

            string json = @"{
  ""@context"": ""https://schema.org"",
  ""@type"": ""BlogPosting"",
  ""headline"": """ + JsonEscape(title) + @""",
  ""description"": """ + JsonEscape(TrimTo(description, 320)) + @""",
  ""mainEntityOfPage"": { ""@type"": ""WebPage"", ""@id"": """ + JsonEscape(canonical) + @""" }" +
  (string.IsNullOrWhiteSpace(image) ? "" : @",
  ""image"": [""" + JsonEscape(image) + @"""]") +
  (string.IsNullOrWhiteSpace(pub) ? "" : @",
  ""datePublished"": """ + pub + @"""") +
  @"
}";

            return @"<script type=""application/ld+json"">" + json + "</script>";
        }

        private string TrimTo(string s, int max)
        {
            if (string.IsNullOrWhiteSpace(s)) return "";
            s = s.Trim();
            return s.Length <= max ? s : s.Substring(0, max);
        }

        private string JsonEscape(string s)
        {
            if (s == null) return "";
            return s.Replace("\\", "\\\\").Replace("\"", "\\\"").Replace("\r", "").Replace("\n", "");
        }

        // =========================
        // DB
        // =========================
        private DataRow GetPostBySlug(string slug)
        {
            string sql = @"
SELECT TOP (1)
    Id, Title, Slug, Excerpt, ContentHtml,
    ISNULL(NULLIF(FeaturedImageUrl,''), '/assets/images/blog/05.webp') AS FeaturedImageUrl,
    ISNULL(NULLIF(AuthorName,''), 'Primeonx Editorial') AS AuthorName,
    PublishedAt,
    SeoTitle, SeoDescription, CanonicalUrl, OgImageUrl
FROM dbo.BlogPosts
WHERE IsPublished = 1 AND Slug = @Slug;";

            var dt = new DataTable();
            using (var conn = new SqlConnection(connStr))
            using (var cmd = new SqlCommand(sql, conn))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.Parameters.AddWithValue("@Slug", slug);
                da.Fill(dt);
            }

            return dt.Rows.Count == 0 ? null : dt.Rows[0];
        }

        private DataTable GetPostCategories(int postId)
        {
            string sql = @"
SELECT c.Name, c.Slug
FROM dbo.BlogPostCategories pc
JOIN dbo.BlogCategories c ON c.Id = pc.CategoryId
WHERE pc.PostId = @PostId AND c.IsActive = 1
ORDER BY c.SortOrder, c.Name;";

            var dt = new DataTable();
            using (var conn = new SqlConnection(connStr))
            using (var cmd = new SqlCommand(sql, conn))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.Parameters.AddWithValue("@PostId", postId);
                da.Fill(dt);
            }

            dt.Columns.Add("Url", typeof(string));
            foreach (DataRow r in dt.Rows)
                r["Url"] = BuildListUrl("", Convert.ToString(r["Slug"]), "", 1);

            return dt;
        }

        private DataTable GetPostTags(int postId)
        {
            string sql = @"
SELECT t.Name, t.Slug
FROM dbo.BlogPostTags pt
JOIN dbo.BlogTags t ON t.Id = pt.TagId
WHERE pt.PostId = @PostId AND t.IsActive = 1
ORDER BY t.Name;";

            var dt = new DataTable();
            using (var conn = new SqlConnection(connStr))
            using (var cmd = new SqlCommand(sql, conn))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.Parameters.AddWithValue("@PostId", postId);
                da.Fill(dt);
            }

            dt.Columns.Add("Url", typeof(string));
            foreach (DataRow r in dt.Rows)
                r["Url"] = BuildListUrl("", "", Convert.ToString(r["Slug"]), 1);

            return dt;
        }

        private DataTable GetCategoriesWithCounts()
        {
            string sql = @"
SELECT
    c.Name,
    c.Slug,
    COUNT(DISTINCT pc.PostId) AS PostCount
FROM dbo.BlogCategories c
LEFT JOIN dbo.BlogPostCategories pc ON pc.CategoryId = c.Id
LEFT JOIN dbo.BlogPosts p ON p.Id = pc.PostId AND p.IsPublished = 1
WHERE c.IsActive = 1
GROUP BY c.Name, c.Slug, c.SortOrder
ORDER BY c.SortOrder, c.Name;";

            var dt = new DataTable();
            using (var conn = new SqlConnection(connStr))
            using (var cmd = new SqlCommand(sql, conn))
            using (var da = new SqlDataAdapter(cmd))
                da.Fill(dt);

            dt.Columns.Add("Url", typeof(string));
            foreach (DataRow r in dt.Rows)
                r["Url"] = BuildListUrl("", Convert.ToString(r["Slug"]), "", 1);

            return dt;
        }

        private DataTable GetRecentPosts(int take)
        {
            string sql = @"
SELECT TOP (@Take)
    Title, Slug,
    ISNULL(NULLIF(FeaturedImageUrl,''), '/assets/images/blog/01.webp') AS FeaturedImageUrl,
    PublishedAt
FROM dbo.BlogPosts
WHERE IsPublished = 1
ORDER BY PublishedAt DESC;";

            var dt = new DataTable();
            using (var conn = new SqlConnection(connStr))
            using (var cmd = new SqlCommand(sql, conn))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.Parameters.AddWithValue("@Take", take);
                da.Fill(dt);
            }

            dt.Columns.Add("Url", typeof(string));
            dt.Columns.Add("PublishedAtText", typeof(string));

            foreach (DataRow r in dt.Rows)
            {
                r["Url"] = BlogPostPath(Convert.ToString(r["Slug"]));

                r["PublishedAtText"] = r["PublishedAt"] == DBNull.Value
                    ? ""
                    : Convert.ToDateTime(r["PublishedAt"]).ToString("dd MMM, yyyy", UiCulture());
            }

            return dt;
        }

        private DataTable GetPopularTags(int take)
        {
            string sql = @"
SELECT TOP (@Take)
    t.Name, t.Slug,
    COUNT(*) AS UsageCount
FROM dbo.BlogTags t
JOIN dbo.BlogPostTags pt ON pt.TagId = t.Id
JOIN dbo.BlogPosts p ON p.Id = pt.PostId AND p.IsPublished = 1
WHERE t.IsActive = 1
GROUP BY t.Name, t.Slug
ORDER BY UsageCount DESC, t.Name;";

            var dt = new DataTable();
            using (var conn = new SqlConnection(connStr))
            using (var cmd = new SqlCommand(sql, conn))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.Parameters.AddWithValue("@Take", take);
                da.Fill(dt);
            }

            dt.Columns.Add("Url", typeof(string));
            foreach (DataRow r in dt.Rows)
                r["Url"] = BuildListUrl("", "", Convert.ToString(r["Slug"]), 1);

            return dt;
        }
    }
}