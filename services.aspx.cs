using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace primeonx_global
{
    public partial class services : System.Web.UI.Page
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindServices();
                ApplySeo();
            }
        }

        private void ApplySeo()
        {
            var master = Master as SiteMaster;
            if (master == null) return;

            string title = T("Services | Primeonx", "Hizmetler | Primeonx");
            string desc = T(
                "Primeonx services: SEO-first websites, performance optimization, automation, and analytics.",
                "Primeonx hizmetleri: SEO-odaklı web siteleri, performans optimizasyonu, otomasyon ve analitik."
            );

            string canonical = master.GetSiteBaseUrl().TrimEnd('/') + master.L("services");

            master.SetSeo(
                seoTitle: title,
                metaDescription: desc,
                canonicalUrl: canonical,
                ogTitle: title,
                ogType: "website"
            );

            // ✅ Hreflang (EN default + TR)
            litHreflang.Text = BuildHreflang(master, "services");
        }

        private void BindServices()
        {
            string sql = @"
SELECT Id, Slug, SortOrder, Title, ShortDescription, ListTags, ListImageUrl
FROM dbo.Services
WHERE IsActive = 1
ORDER BY SortOrder ASC, Id ASC;";

            using (var conn = new SqlConnection(connStr))
            using (var cmd = new SqlCommand(sql, conn))
            {
                conn.Open();
                using (var da = new SqlDataAdapter(cmd))
                {
                    var dt = new DataTable();
                    da.Fill(dt);

                    rptServices.DataSource = dt;
                    rptServices.DataBind();
                }
            }
        }

        protected void rptServices_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
                return;

            var row = (DataRowView)e.Item.DataItem;
            string tagsRaw = row["ListTags"] == DBNull.Value ? "" : row["ListTags"].ToString();

            var tags = SplitCsv(tagsRaw);

            var rptTags = (Repeater)e.Item.FindControl("rptTags");
            if (rptTags != null)
            {
                rptTags.DataSource = tags;
                rptTags.DataBind();
            }
        }

        private List<string> SplitCsv(string csv)
        {
            if (string.IsNullOrWhiteSpace(csv)) return new List<string>();

            return csv
                .Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries)
                .Select(x => x.Trim())
                .Where(x => x.Length > 0)
                .Distinct(StringComparer.OrdinalIgnoreCase)
                .Take(6)
                .ToList();
        }

        public string ServiceUrl(object slugObj)
        {
            var slug = (slugObj ?? "").ToString().Trim().ToLowerInvariant();
            if (string.IsNullOrWhiteSpace(slug))
                return ResolveUrl("~/services");

            return GetRouteUrl("ServiceDetails", new { slug = slug }) ?? ResolveUrl("~/services");
        }

        public string ServicesListUrl()
        {
            return GetRouteUrl("ServicesList", null) ?? ResolveUrl("~/services");
        }

        public string SafeImageUrl(object urlObj)
        {
            var url = (urlObj ?? "").ToString().Trim();
            if (string.IsNullOrWhiteSpace(url))
                url = "assets/images/service/27.webp";

            return ResolveUrl("~/" + url.TrimStart('~', '/'));
        }

        public string HtmlAttrEncode(object s)
        {
            return HttpUtility.HtmlAttributeEncode((s ?? "").ToString());
        }

        public string T(string en, string tr)
        {
            var master = Master as SiteMaster;
            var lang = (master?.GetCurrentLang() ?? "en").ToLowerInvariant();
            return (lang == "tr" && !string.IsNullOrWhiteSpace(tr)) ? tr : en;
        }

        private string BuildHreflang(SiteMaster master, string slug)
        {
            var baseUrl = master.GetSiteBaseUrl().TrimEnd('/');

            // ✅ URL Standardı:
            // EN: /{slug}
            // TR: /tr/{slug}
            string Url(string lang)
            {
                lang = (lang ?? "en").ToLowerInvariant();
                if (lang == "tr") return $"{baseUrl}/tr/{slug}";
                return $"{baseUrl}/{slug}";
            }

            return $@"
<link rel=""alternate"" hreflang=""en"" href=""{Url("en")}"" />
<link rel=""alternate"" hreflang=""tr"" href=""{Url("tr")}"" />
<link rel=""alternate"" hreflang=""x-default"" href=""{Url("en")}"" />
";
        }
    }
}