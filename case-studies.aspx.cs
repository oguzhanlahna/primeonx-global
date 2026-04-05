using System;

namespace primeonx_global
{
    public partial class case_studies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var m = Master as SiteMaster;
            if (m == null) return;

            var title = m.T(
                "Case Studies | Primeonx",
                "Vaka Çalışmaları | Primeonx"
            );

            var desc = m.T(
                "Real growth stories backed by execution — measurable impact through SEO, conversion, and performance tracking.",
                "Uygulamayla desteklenen gerçek büyüme hikayeleri — SEO, dönüşüm ve performans takibi ile ölçülebilir etki."
            );

            var canonical = m.GetSiteBaseUrl().TrimEnd('/') + m.L("case-studies");
            m.SetSeo(title, desc, canonical, ogTitle: title, ogType: "website");

            // Hreflang (en default + tr)
            litHreflang.Text = BuildHreflang(m, "case-studies");
        }

        private string BuildHreflang(SiteMaster master, string slug)
        {
            var baseUrl = master.GetSiteBaseUrl().TrimEnd('/');

            // EN default: /case-studies
            // TR: /tr/case-studies
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