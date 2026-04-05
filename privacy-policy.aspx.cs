using System;

namespace primeonx_global
{
    public partial class privacy_policy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var master = Master as SiteMaster;
            if (master == null) return;

            var title = T(
                "Privacy Policy | Primeonx",
                "Gizlilik Politikası | Primeonx"
            );

            var desc = T(
                "How Primeonx collects, uses, and protects information when you visit our website or contact us.",
                "Primeonx’in web sitesini ziyaret ettiğinizde veya bize ulaştığınızda bilgileri nasıl topladığı, kullandığı ve koruduğu."
            );

            // canonical: dil bazlı url dönüyorsa en doğrusu master.L("privacy-policy")
            var canonical = master.GetSiteBaseUrl().TrimEnd('/') + master.L("privacy-policy");
            master.SetSeo(title, desc, canonical, ogTitle: title, ogType: "website");

            // ✅ Hreflang (EN default + TR /tr/)
            litHreflang.Text = BuildHreflang(master, "privacy-policy");
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
            string s = (slug ?? "").Trim().TrimStart('/');

            // ✅ EN default: /{slug}
            // ✅ TR: /tr/{slug}
            string Url(string lang)
            {
                lang = (lang ?? "en").ToLowerInvariant();
                if (lang == "tr") return $"{baseUrl}/tr/{s}";
                return $"{baseUrl}/{s}";
            }

            return $@"
<link rel=""alternate"" hreflang=""en"" href=""{Url("en")}"" />
<link rel=""alternate"" hreflang=""tr"" href=""{Url("tr")}"" />
<link rel=""alternate"" hreflang=""x-default"" href=""{Url("en")}"" />
";
        }
    }
}