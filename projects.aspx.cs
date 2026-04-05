using System;

namespace primeonx_global
{
    public partial class projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var master = Master as SiteMaster;
            if (master == null) return;

            var title = master.T("Projects | Primeonx", "Projeler | Primeonx");

            var desc = master.T(
                "A selection of Primeonx projects—SEO foundations, CRO, tracking and automation.",
                "Primeonx projelerinden seçkiler—SEO temeli, CRO, takip ve otomasyon."
            );

            // canonical: /{lang}/projects (virtual directory uyumlu)
            var canonical = master.GetSiteBaseUrl().TrimEnd('/') + master.L("projects");

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