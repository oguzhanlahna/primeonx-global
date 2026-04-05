using System;

namespace primeonx_global
{
    public partial class cookie_policy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var m = Master as SiteMaster;
            if (m == null) return;

            var title = m.T("Cookie Policy | Primeonx", "Çerez Politikası | Primeonx");

            var desc = m.T(
                "This Cookie Policy explains how Primeonx uses cookies and similar technologies on this website.",
                "Bu Çerez Politikası, Primeonx’in bu web sitesinde çerezleri ve benzer teknolojileri nasıl kullandığını açıklar."
            );

            var canonical = m.GetSiteBaseUrl().TrimEnd('/') + m.L("cookie-policy");
            m.SetSeo(title, desc, canonical, ogTitle: title, ogType: "website");

            // ✅ Hreflang (EN default + TR /tr/)
            litHreflang.Text = BuildHreflang(m, "cookie-policy");
        }

        private string BuildHreflang(SiteMaster master, string slug)
        {
            var baseUrl = master.GetSiteBaseUrl().TrimEnd('/');
            string s = (slug ?? "").Trim().TrimStart('/');

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