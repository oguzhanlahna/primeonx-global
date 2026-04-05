using System;

namespace primeonx_global
{
    public partial class terms_of_service : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var master = Master as SiteMaster;
            if (master == null) return;

            var title = T(
                "Terms of Service | Primeonx",
                "Hizmet Şartları | Primeonx"
            );

            var desc = T(
                "These Terms govern your use of the Primeonx website and service engagements initiated through the site.",
                "Bu şartlar Primeonx web sitesinin kullanımını ve site üzerinden başlatılan hizmet çalışmalarını düzenler."
            );

            // ✅ URL Standardı:
            // EN: /terms-of-service
            // TR: /tr/terms-of-service
            var canonical = master.GetSiteBaseUrl().TrimEnd('/') + master.L("terms-of-service");

            master.SetSeo(title, desc, canonical, ogTitle: title, ogType: "website");

            // ✅ Hreflang (EN default + TR /tr/)
            litHreflang.Text = BuildHreflang(master, "terms-of-service");
        }

        public string T(string en, string tr)
        {
            var master = Master as SiteMaster;
            var lang = (master?.GetCurrentLang() ?? "en").ToLowerInvariant();

            if (lang == "tr")
                return string.IsNullOrWhiteSpace(tr) ? en : tr;

            return en;
        }

        private string BuildHreflang(SiteMaster master, string slug)
        {
            var baseUrl = master.GetSiteBaseUrl().TrimEnd('/');

            // ✅ EN default: /{slug}
            // ✅ TR: /tr/{slug}
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