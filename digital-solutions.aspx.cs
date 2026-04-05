using System;

namespace primeonx_global
{
    public partial class digital_solutions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var master = Master as SiteMaster;
            if (master == null) return;

            // --- SEO (EN/TR) ---
            var title = T(
                "Digital Solutions | Primeonx",
                "Dijital Çözümler | Primeonx"
            );

            var desc = T(
                "High-performance websites, automation platforms, and scalable internal systems—engineered for speed, SEO, and measurable outcomes.",
                "Hız, SEO ve ölçülebilir sonuçlar için yüksek performanslı web siteleri, otomasyon platformları ve ölçeklenebilir iç sistemler."
            );

            // canonical: dil bazlı path döndürüyorsa en doğrusu master.L("digital-solutions")
            var canonical = master.GetSiteBaseUrl().TrimEnd('/') + master.L("digital-solutions");

            master.SetSeo(title, desc, canonical, ogTitle: title, ogType: "website");

            // Hreflang: sadece en + tr + x-default
            litHreflang.Text = BuildHreflang(master, "digital-solutions");
        }

        // 2 dil çeviri helper (C#5 uyumlu)
        public string T(string en, string tr)
        {
            var master = Master as SiteMaster;

            var lang = "en";
            if (master != null)
                lang = (master.GetCurrentLang() ?? "en");

            lang = lang.ToLowerInvariant();

            if (lang == "tr")
                return string.IsNullOrWhiteSpace(tr) ? en : tr;

            return en;
        }

        private string BuildHreflang(SiteMaster master, string slug)
        {
            var baseUrl = master.GetSiteBaseUrl().TrimEnd('/');

            // EN default: /digital-solutions
            // TR: /tr/digital-solutions
            string Url(string lang)
            {
                if (lang == "tr")
                    return baseUrl + "/tr/" + slug;

                return baseUrl + "/" + slug;
            }

            return @"
<link rel=""alternate"" hreflang=""en"" href=""" + Url("en") + @""" />
<link rel=""alternate"" hreflang=""tr"" href=""" + Url("tr") + @""" />
<link rel=""alternate"" hreflang=""x-default"" href=""" + Url("en") + @""" />
";
        }
    }
}