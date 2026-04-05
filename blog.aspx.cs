using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web;

namespace primeonx_global
{
    public partial class blog : System.Web.UI.Page
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        private const int PageSize = 6;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtSearch.Text = GetQuery("q");

                // placeholder (EN/TR)
                txtSearch.Attributes["placeholder"] = T("Enter keyword", "Anahtar kelime");

                BindSidebar();
                BindPosts();
                ApplySeo();
            }
        }

        // =========================
        // Lang helpers (EN/TR)
        // =========================
        private string CurrentLang()
        {
            var master = Master as SiteMaster;
            var lang = (master?.GetCurrentLang() ?? "en").Trim().ToLowerInvariant();
            return lang == "tr" ? "tr" : "en";
        }

        private bool IsTr() => CurrentLang() == "tr";

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
            var p = sm?.L("blog");
            if (!string.IsNullOrWhiteSpace(p)) return p;
            return IsTr() ? "/tr/blog" : "/blog";
        }

        private string BlogPostPath(string slug)
        {
            // /blog/{slug} veya /tr/blog/{slug}
            slug = (slug ?? "").Trim();
            if (slug.Length == 0) return BlogListPath();
            return BlogListPath().TrimEnd('/') + "/" + HttpUtility.UrlPathEncode(slug);
        }

        private string GetSiteBaseUrlSafe()
        {
            // Master'da varsa onu kullan, yoksa authority
            var sm = Master as SiteMaster;
            try
            {
                var baseUrl = sm?.GetSiteBaseUrl();
                if (!string.IsNullOrWhiteSpace(baseUrl))
                    return baseUrl.TrimEnd('/');
            }
            catch { /* ignore */ }

            return Request.Url.GetLeftPart(UriPartial.Authority).TrimEnd('/');
        }

        // =========================
        // Actions
        // =========================
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string q = (txtSearch.Text ?? "").Trim();
            Response.Redirect(BuildListUrl(q, GetQuery("category"), GetQuery("tag"), 1), true);
        }

        // =========================
        // SEO (Master'a set)
        // =========================
        private void ApplySeo()
        {
            string q = GetQuery("q");
            string category = GetQuery("category");
            string tag = GetQuery("tag");
            int page = GetIntQuery("page", 1);
            if (page < 1) page = 1;

            bool isTr = IsTr();

            string title = "Blog | Primeonx";
            string desc = isTr
                ? "Primeonx blog: SEO, büyüme, mühendislik ve performans üzerine pratik rehberler."
                : "Primeonx blog: SEO, growth, engineering and performance playbooks for modern businesses.";

            if (!string.IsNullOrWhiteSpace(category))
            {
                title = isTr ? $"Blog Kategori: {category} | Primeonx" : $"Blog Category: {category} | Primeonx";
                desc = isTr
                    ? $"{category} kategorisindeki Primeonx yazıları. Uygulanabilir rehberler ve stratejiler."
                    : $"Primeonx articles in {category}. Practical guides, case studies, and actionable strategies.";
            }

            if (!string.IsNullOrWhiteSpace(tag))
            {
                title = isTr ? $"Blog Etiket: {tag} | Primeonx" : $"Blog Tag: {tag} | Primeonx";
                desc = isTr
                    ? $"{tag} etiketli Primeonx yazıları. Uygulanabilir rehberler ve stratejiler."
                    : $"Primeonx articles tagged {tag}. Practical guides, case studies, and actionable strategies.";
            }

            if (!string.IsNullOrWhiteSpace(q))
            {
                title = isTr ? $"Arama: {q} | Primeonx Blog" : $"Search: {q} | Primeonx Blog";
                desc = isTr ? $"Primeonx blogunda “{q}” için arama sonuçları." : $"Search results for “{q}” on the Primeonx blog.";
            }

            // canonical (query dahil, dil prefix dahil)
            string canonical = GetSiteBaseUrlSafe() + BuildListUrl(q, category, tag, page);

            var sm = Master as SiteMaster;
            if (sm != null)
            {
                sm.SetSeo(
                    seoTitle: title,
                    metaDescription: desc,
                    canonicalUrl: canonical,
                    ogTitle: title,
                    ogType: "website",
                    ogImageUrl: null
                );
            }
            else
            {
                Page.Title = title;
            }
        }

        // =========================
        // Main binding
        // =========================
        private void BindPosts()
        {
            string q = GetQuery("q");
            string category = GetQuery("category");
            string tag = GetQuery("tag");

            int page = GetIntQuery("page", 1);
            if (page < 1) page = 1;

            int totalCount;
            DataTable posts = GetPosts(q, category, tag, page, PageSize, out totalCount);

            if (posts.Rows.Count == 0)
            {
                phEmpty.Visible = true;
                rptPosts.DataSource = null;
                rptPosts.DataBind();
                phPagination.Visible = false;
            }
            else
            {
                phEmpty.Visible = false;

                // Perf: kopya DataTable oluşturma -> mevcut DataTable'a computed kolon ekle
                EnsureColumn(posts, "Url", typeof(string));
                EnsureColumn(posts, "PublishedAtText", typeof(string));

                foreach (DataRow r in posts.Rows)
                {
                    string slug = Convert.ToString(r["Slug"]);
                    r["Url"] = BlogPostPath(slug);
                    r["PublishedAtText"] = ToPrettyDate(r["PublishedAt"]);
                }

                rptPosts.DataSource = posts;
                rptPosts.DataBind();

                BindPagination(q, category, tag, page, totalCount);
            }

            BindActiveFiltersUi(q, category, tag);
        }

        private void EnsureColumn(DataTable dt, string name, Type type)
        {
            if (!dt.Columns.Contains(name))
                dt.Columns.Add(name, type);
        }

        private void BindPagination(string q, string category, string tag, int page, int totalCount)
        {
            int totalPages = (int)Math.Ceiling(totalCount / (double)PageSize);

            if (totalPages <= 1)
            {
                phPagination.Visible = false;
                return;
            }

            phPagination.Visible = true;

            bool isTr = IsTr();

            litPageInfo.Text = isTr
                ? $"<span style='opacity:.85;'>Sayfa <strong>{page}</strong> / <strong>{totalPages}</strong></span>"
                : $"<span style='opacity:.85;'>Page <strong>{page}</strong> of <strong>{totalPages}</strong></span>";

            lnkPrev.Text = isTr ? "← Önceki" : "← Prev";
            lnkNext.Text = isTr ? "Sonraki →" : "Next →";

            if (page > 1)
            {
                lnkPrev.Visible = true;
                lnkPrev.NavigateUrl = BuildListUrl(q, category, tag, page - 1);
            }
            else
            {
                lnkPrev.Visible = false;
            }

            if (page < totalPages)
            {
                lnkNext.Visible = true;
                lnkNext.NavigateUrl = BuildListUrl(q, category, tag, page + 1);
            }
            else
            {
                lnkNext.Visible = false;
            }
        }

        private void BindSidebar()
        {
            var cats = GetCategoriesWithCounts();
            EnsureColumn(cats, "Url", typeof(string));
            foreach (DataRow r in cats.Rows)
                r["Url"] = BuildListUrl("", Convert.ToString(r["Slug"]), "", 1);

            rptCategories.DataSource = cats;
            rptCategories.DataBind();

            var recent = GetRecentPosts(5);
            EnsureColumn(recent, "Url", typeof(string));
            EnsureColumn(recent, "PublishedAtText", typeof(string));
            foreach (DataRow r in recent.Rows)
            {
                r["Url"] = BlogPostPath(Convert.ToString(r["Slug"]));
                r["PublishedAtText"] = ToPrettyDate(r["PublishedAt"]);
            }

            rptRecent.DataSource = recent;
            rptRecent.DataBind();

            var tags = GetPopularTags(20);
            EnsureColumn(tags, "Url", typeof(string));
            foreach (DataRow r in tags.Rows)
                r["Url"] = BuildListUrl("", "", Convert.ToString(r["Slug"]), 1);

            rptTags.DataSource = tags;
            rptTags.DataBind();
        }

        private void BindActiveFiltersUi(string q, string category, string tag)
        {
            var parts = new List<string>();
            bool isTr = IsTr();

            if (!string.IsNullOrWhiteSpace(q))
                parts.Add("<a href='" + BuildListUrl("", category, tag, 1) + "' style='margin-right:10px;'>" +
                          (isTr ? "arama" : "q") + ": <strong>" + HttpUtility.HtmlEncode(q) + "</strong> ✕</a>");

            if (!string.IsNullOrWhiteSpace(category))
                parts.Add("<a href='" + BuildListUrl(q, "", tag, 1) + "' style='margin-right:10px;'>" +
                          (isTr ? "kategori" : "category") + ": <strong>" + HttpUtility.HtmlEncode(category) + "</strong> ✕</a>");

            if (!string.IsNullOrWhiteSpace(tag))
                parts.Add("<a href='" + BuildListUrl(q, category, "", 1) + "' style='margin-right:10px;'>" +
                          (isTr ? "etiket" : "tag") + ": <strong>" + HttpUtility.HtmlEncode(tag) + "</strong> ✕</a>");

            phActiveFilters.Visible = parts.Count > 0;
            litActiveFilters.Text = string.Join("", parts);

            // Sol blokta label
            litActiveFiltersLabel.Text = isTr ? "Aktif filtreler:" : "Active filters:";
        }

        // =========================
        // URL helpers (dil prefix dahil)
        // =========================
        private string BuildListUrl(string q, string category, string tag, int page)
        {
            var qs = HttpUtility.ParseQueryString(string.Empty);

            if (!string.IsNullOrWhiteSpace(q)) qs["q"] = q;
            if (!string.IsNullOrWhiteSpace(category)) qs["category"] = category;
            if (!string.IsNullOrWhiteSpace(tag)) qs["tag"] = tag;

            // page=1 canonical temizliği
            if (page > 1) qs["page"] = page.ToString(CultureInfo.InvariantCulture);

            var query = qs.ToString();
            var basePath = BlogListPath(); // /blog veya /tr/blog

            return string.IsNullOrWhiteSpace(query) ? basePath : basePath + "?" + query;
        }

        private string GetQuery(string key) => (Request.QueryString[key] ?? "").Trim();

        private int GetIntQuery(string key, int defaultValue)
        {
            int val;
            return int.TryParse(Request.QueryString[key], out val) ? val : defaultValue;
        }

        private string ToPrettyDate(object dt)
        {
            if (dt == null || dt == DBNull.Value) return "";
            return Convert.ToDateTime(dt).ToString("dd MMM, yyyy", UiCulture());
        }

        // =========================
        // DB: Posts
        // =========================
        private DataTable GetPosts(string q, string categorySlug, string tagSlug, int page, int pageSize, out int totalCount)
        {
            totalCount = 0;
            int offset = (page - 1) * pageSize;

            string where = "WHERE p.IsPublished = 1";
            string joins = "";

            if (!string.IsNullOrWhiteSpace(categorySlug))
            {
                joins += @"
INNER JOIN dbo.BlogPostCategories pc ON pc.PostId = p.Id
INNER JOIN dbo.BlogCategories c ON c.Id = pc.CategoryId";
                where += " AND c.Slug = @CategorySlug";
            }

            if (!string.IsNullOrWhiteSpace(tagSlug))
            {
                joins += @"
INNER JOIN dbo.BlogPostTags pt ON pt.PostId = p.Id
INNER JOIN dbo.BlogTags t ON t.Id = pt.TagId";
                where += " AND t.Slug = @TagSlug";
            }

            if (!string.IsNullOrWhiteSpace(q))
                where += " AND (p.Title LIKE @Q OR p.Excerpt LIKE @Q OR p.ContentHtml LIKE @Q)";

            string sqlList = @"
SELECT
    p.Id, p.Title, p.Slug,
    ISNULL(NULLIF(p.Excerpt,''), '') AS Excerpt,
    ISNULL(NULLIF(p.FeaturedImageUrl,''), '/assets/images/blog/01.webp') AS FeaturedImageUrl,
    ISNULL(NULLIF(p.AuthorName,''), 'Primeonx Editorial') AS AuthorName,
    p.PublishedAt,
    ISNULL((
        SELECT TOP 1 c2.Name
        FROM dbo.BlogPostCategories pc2
        JOIN dbo.BlogCategories c2 ON c2.Id = pc2.CategoryId
        WHERE pc2.PostId = p.Id
        ORDER BY c2.SortOrder, c2.Name
    ), N'General') AS PrimaryCategoryName
FROM dbo.BlogPosts p
" + joins + @"
" + where + @"
ORDER BY p.PublishedAt DESC
OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY;";

            string sqlCount = @"
SELECT COUNT(DISTINCT p.Id)
FROM dbo.BlogPosts p
" + joins + @"
" + where + ";";

            var dt = new DataTable();

            using (var conn = new SqlConnection(connStr))
            using (var cmdList = new SqlCommand(sqlList, conn))
            using (var cmdCount = new SqlCommand(sqlCount, conn))
            {
                if (!string.IsNullOrWhiteSpace(categorySlug))
                {
                    cmdList.Parameters.AddWithValue("@CategorySlug", categorySlug);
                    cmdCount.Parameters.AddWithValue("@CategorySlug", categorySlug);
                }

                if (!string.IsNullOrWhiteSpace(tagSlug))
                {
                    cmdList.Parameters.AddWithValue("@TagSlug", tagSlug);
                    cmdCount.Parameters.AddWithValue("@TagSlug", tagSlug);
                }

                if (!string.IsNullOrWhiteSpace(q))
                {
                    string like = "%" + q + "%";
                    cmdList.Parameters.AddWithValue("@Q", like);
                    cmdCount.Parameters.AddWithValue("@Q", like);
                }

                cmdList.Parameters.AddWithValue("@Offset", offset);
                cmdList.Parameters.AddWithValue("@PageSize", pageSize);

                conn.Open();
                totalCount = Convert.ToInt32(cmdCount.ExecuteScalar());

                using (var da = new SqlDataAdapter(cmdList))
                    da.Fill(dt);
            }

            return dt;
        }

        // =========================
        // DB: Sidebar
        // =========================
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
            {
                da.Fill(dt);
            }

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

            return dt;
        }
    }
}