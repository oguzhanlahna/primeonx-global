using System;

namespace primeonx_global
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var master = Master as SiteMaster;
            if (master == null) return;

            var title = master.T(
                "Primeonx | Growth Systems for Modern Brands",
                "Primeonx | Modern Markalar için Büyüme Sistemleri"
            );

            var desc = master.T(
                "Primeonx builds SEO-first web experiences and marketing systems designed for measurable growth.",
                "Primeonx, ölçülebilir büyüme için SEO-odaklı web deneyimleri ve pazarlama sistemleri inşa eder."
            );

            // canonical: /{lang} (virtual directory uyumlu)
            var canonical = master.GetSiteBaseUrl().TrimEnd('/') + master.L("");

            master.SetSeo(
                seoTitle: title,
                metaDescription: desc,
                canonicalUrl: canonical,
                ogTitle: title,
                ogType: "website"
            );
        }

        // ASPX içinde <%: T("en","tr") %> kullanımı için
        public string T(string en, string tr)
        {
            var master = Master as SiteMaster;
            return master?.T(en, tr) ?? en;
        }
    }
}