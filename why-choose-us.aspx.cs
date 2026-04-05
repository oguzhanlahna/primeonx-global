using System;

namespace primeonx_global
{
    public partial class why_choose_us : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var master = Master as SiteMaster;
            if (master == null) return;

            var title = T(
                "Why Choose Primeonx | Digital Engineering for Growth & Scale",
                "Neden Primeonx | Büyüme ve Ölçek için Dijital Mühendislik"
            );

            var desc = T(
                "Primeonx builds high-performance websites and automation systems with clean delivery: speed, technical SEO, measurable outcomes, and scale-ready architecture.",
                "Primeonx; yüksek performanslı web siteleri ve otomasyon sistemlerini temiz teslimatla kurar: hız, teknik SEO, ölçülebilir çıktılar ve ölçeklenebilir mimari."
            );

            // ✅ canonical düzgün birleştirme
            var canonical = master.GetSiteBaseUrl().TrimEnd('/') + master.L("why-choose-us");

            master.SetSeo(title, desc, canonical, ogTitle: title, ogType: "website");

            // ✅ Sayfa içindeki literal'a hreflang bas
            litHreflang.Text = BuildHreflang(master, "why-choose-us");
        }

        public string T(string en, string tr)
        {
            var master = Master as SiteMaster;
            var lang = master?.GetCurrentLang() ?? "en";
            return (lang == "tr") ? (string.IsNullOrWhiteSpace(tr) ? en : tr) : en;
        }

        private string BuildHreflang(SiteMaster master, string slug)
        {
            var baseUrl = master.GetSiteBaseUrl().TrimEnd('/');

            // Eğer senin URL yapın /en/slug ve /tr/slug ise bu doğru.
            // Eğer L() farklı route basıyorsa söyle, ona göre 100% uyarlayayım.
            string Url(string lang) => $"{baseUrl}/{lang}/{slug}";

            return $@"
<link rel=""alternate"" hreflang=""en"" href=""{Url("en")}"" />
<link rel=""alternate"" hreflang=""tr"" href=""{Url("tr")}"" />
<link rel=""alternate"" hreflang=""x-default"" href=""{Url("en")}"" />
";
        }
    }
}