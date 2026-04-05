using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace primeonx_global
{
    public partial class service_details : System.Web.UI.Page
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string slug = (RouteData.Values["slug"] as string ?? "").Trim().ToLowerInvariant();

                // backward compatible: old links (?slug=)
                if (string.IsNullOrWhiteSpace(slug))
                    slug = (Request.QueryString["slug"] ?? "").Trim().ToLowerInvariant();

                if (string.IsNullOrWhiteSpace(slug))
                {
                    Response.Redirect(GetRouteUrl("ServicesList", null) ?? ResolveUrl("~/services"), true);
                    return;
                }

                LoadService(slug);
            }
        }

        private void LoadService(string slug)
        {
            var master = Master as SiteMaster;
            if (master == null) return;

            string lang = (master.GetCurrentLang() ?? "en").ToLowerInvariant();
            if (lang != "tr") lang = "en";

            // ✅ Hreflang (EN default + TR /tr/)
            litHreflang.Text = BuildHreflang(master, "services/" + slug);

            // Column chooser (EN/TR)
            string C(string baseName) => (lang == "tr") ? (baseName + "Tr") : baseName;

            using (var conn = new SqlConnection(connStr))
            using (var cmd = new SqlCommand(@"
SELECT TOP 1
    Id, Slug, Title,

    BreadcrumbTitle      = COALESCE(NULLIF(" + C("BreadcrumbTitle") + @",''), NULLIF(BreadcrumbTitle,''), NULLIF(Title,'')),
    H1Title              = COALESCE(NULLIF(" + C("H1Title") + @",''), NULLIF(H1Title,''), NULLIF(Title,'')),
    CoverImageUrl        = COALESCE(NULLIF(CoverImageUrl,''), 'assets/images/service/27.webp'),
    VideoUrl             = COALESCE(NULLIF(VideoUrl,''), ''),

    WorkPreTitle         = COALESCE(NULLIF(" + C("WorkPreTitle") + @",''), NULLIF(WorkPreTitle,''), ''),
    WorkTitle            = COALESCE(NULLIF(" + C("WorkTitle") + @",''), NULLIF(WorkTitle,''), ''),
    WorkDescription      = COALESCE(NULLIF(" + C("WorkDescription") + @",''), NULLIF(WorkDescription,''), ''),
    WorkImageUrl         = COALESCE(NULLIF(WorkImageUrl,''), 'assets/images/service/28.webp'),

    Step1Title           = COALESCE(NULLIF(" + C("Step1Title") + @",''), NULLIF(Step1Title,''), ''),
    Step1Description     = COALESCE(NULLIF(" + C("Step1Description") + @",''), NULLIF(Step1Description,''), ''),
    Step1Tags            = COALESCE(NULLIF(" + C("Step1Tags") + @",''), NULLIF(Step1Tags,''), ''),

    Step2Title           = COALESCE(NULLIF(" + C("Step2Title") + @",''), NULLIF(Step2Title,''), ''),
    Step2Description     = COALESCE(NULLIF(" + C("Step2Description") + @",''), NULLIF(Step2Description,''), ''),
    Step2Tags            = COALESCE(NULLIF(" + C("Step2Tags") + @",''), NULLIF(Step2Tags,''), ''),

    Step3Title           = COALESCE(NULLIF(" + C("Step3Title") + @",''), NULLIF(Step3Title,''), ''),
    Step3Description     = COALESCE(NULLIF(" + C("Step3Description") + @",''), NULLIF(Step3Description,''), ''),
    Step3Tags            = COALESCE(NULLIF(" + C("Step3Tags") + @",''), NULLIF(Step3Tags,''), ''),

    FaqTitle             = COALESCE(NULLIF(" + C("FaqTitle") + @",''), NULLIF(FaqTitle,''), ''),
    FaqIntro             = COALESCE(NULLIF(" + C("FaqIntro") + @",''), NULLIF(FaqIntro,''), ''),
    FaqImageUrl          = COALESCE(NULLIF(FaqImageUrl,''), 'assets/images/service/29.webp'),

    FaqQ1                = COALESCE(NULLIF(" + C("FaqQ1") + @",''), NULLIF(FaqQ1,''), ''),
    FaqA1                = COALESCE(NULLIF(" + C("FaqA1") + @",''), NULLIF(FaqA1,''), ''),
    FaqQ2                = COALESCE(NULLIF(" + C("FaqQ2") + @",''), NULLIF(FaqQ2,''), ''),
    FaqA2                = COALESCE(NULLIF(" + C("FaqA2") + @",''), NULLIF(FaqA2,''), ''),
    FaqQ3                = COALESCE(NULLIF(" + C("FaqQ3") + @",''), NULLIF(FaqQ3,''), ''),
    FaqA3                = COALESCE(NULLIF(" + C("FaqA3") + @",''), NULLIF(FaqA3,''), ''),

    CtaTitle             = COALESCE(NULLIF(" + C("CtaTitle") + @",''), NULLIF(CtaTitle,''), ''),
    CtaText              = COALESCE(NULLIF(" + C("CtaText") + @",''), NULLIF(CtaText,''), ''),
    CtaButtonText        = COALESCE(NULLIF(" + C("CtaButtonText") + @",''), NULLIF(CtaButtonText,''), ''),
    CtaButtonUrl         = COALESCE(NULLIF(CtaButtonUrl,''), ''),

    SeoTitle             = COALESCE(NULLIF(" + C("SeoTitle") + @",''), NULLIF(SeoTitle,''), ''),
    SeoDescription       = COALESCE(NULLIF(" + C("SeoDescription") + @",''), NULLIF(SeoDescription,''), NULLIF(ShortDescription,''), ''),
    CanonicalPath        = COALESCE(NULLIF(CanonicalPath,''), '')
FROM dbo.Services
WHERE IsActive = 1 AND Slug = @Slug;", conn))
            {
                cmd.Parameters.AddWithValue("@Slug", slug);

                conn.Open();
                using (var r = cmd.ExecuteReader())
                {
                    if (!r.Read())
                    {
                        Response.StatusCode = 404;
                        Response.TrySkipIisCustomErrors = true;
                        Response.Redirect(GetRouteUrl("ServicesList", null) ?? ResolveUrl("~/services"), true);
                        return;
                    }

                    // UI
                    string breadcrumb = Safe(r["BreadcrumbTitle"], T("Service Details", "Hizmet Detayı"));
                    string h1 = Safe(r["H1Title"], Safe(r["Title"], T("Service", "Hizmet")));

                    litBreadcrumbTitle.Text = HttpUtility.HtmlEncode(breadcrumb);
                    litH1Title.Text = HttpUtility.HtmlEncode(h1);

                    string coverRel = Safe(r["CoverImageUrl"], "assets/images/service/27.webp");
                    imgCover.Src = ResolveUrl("~/" + coverRel.TrimStart('~', '/'));

                    string videoUrl = Safe(r["VideoUrl"], "");
                    if (!string.IsNullOrWhiteSpace(videoUrl))
                    {
                        phVideo.Visible = true;
                        lnkVideo.HRef = videoUrl;
                    }
                    else
                    {
                        phVideo.Visible = false;
                    }

                    litWorkPreTitle.Text = HttpUtility.HtmlEncode(Safe(r["WorkPreTitle"], T("Work Planning", "Çalışma Planı")));
                    litWorkTitle.Text = HttpUtility.HtmlEncode(Safe(r["WorkTitle"], ""));
                    litWorkDescription.Text = HttpUtility.HtmlEncode(Safe(r["WorkDescription"], ""));
                    imgWork.Src = ResolveUrl("~/" + Safe(r["WorkImageUrl"], "assets/images/service/28.webp").TrimStart('~', '/'));

                    BindStep(phStep1, litStep1Title, litStep1Desc, rptStep1Tags,
                        Safe(r["Step1Title"], ""), Safe(r["Step1Description"], ""), Safe(r["Step1Tags"], ""));

                    BindStep(phStep2, litStep2Title, litStep2Desc, rptStep2Tags,
                        Safe(r["Step2Title"], ""), Safe(r["Step2Description"], ""), Safe(r["Step2Tags"], ""));

                    BindStep(phStep3, litStep3Title, litStep3Desc, rptStep3Tags,
                        Safe(r["Step3Title"], ""), Safe(r["Step3Description"], ""), Safe(r["Step3Tags"], ""));

                    litFaqTitle.Text = HttpUtility.HtmlEncode(Safe(r["FaqTitle"], T("Frequently Asked Questions", "Sık Sorulan Sorular")));
                    litFaqIntro.Text = HttpUtility.HtmlEncode(Safe(r["FaqIntro"], ""));
                    imgFaq.Src = ResolveUrl("~/" + Safe(r["FaqImageUrl"], "assets/images/service/29.webp").TrimStart('~', '/'));

                    BindFaq(phFaq1, litFaqQ1, litFaqA1, Safe(r["FaqQ1"], ""), Safe(r["FaqA1"], ""));
                    BindFaq(phFaq2, litFaqQ2, litFaqA2, Safe(r["FaqQ2"], ""), Safe(r["FaqA2"], ""));
                    BindFaq(phFaq3, litFaqQ3, litFaqA3, Safe(r["FaqQ3"], ""), Safe(r["FaqA3"], ""));

                    string ctaTitle = Safe(r["CtaTitle"], T("Book a Free Consultation", "Ücretsiz Danışmanlık"));
                    string ctaText = Safe(r["CtaText"], T(
                        "Tell us what you’re building — we’ll reply with a clear plan and next steps.",
                        "Ne inşa ettiğini anlat — net bir plan ve sonraki adımlarla dönüş yapalım."
                    ));
                    string ctaBtnText = Safe(r["CtaButtonText"], T("Request a Call", "Görüşme Talep Et"));
                    string ctaBtnUrl = Safe(r["CtaButtonUrl"], "");

                    litCtaTitle.Text = HttpUtility.HtmlEncode(ctaTitle);
                    litCtaText.Text = HttpUtility.HtmlEncode(ctaText);
                    litCtaBtnText.Text = HttpUtility.HtmlEncode(ctaBtnText);
                    lnkCta.HRef = string.IsNullOrWhiteSpace(ctaBtnUrl) ? master.L("contact") : ctaBtnUrl;

                    // SEO
                    string seoTitle = Safe(r["SeoTitle"], Safe(r["Title"], h1) + " | Primeonx");
                    string seoDesc = Safe(r["SeoDescription"], "");

                    string canonicalPath = Safe(r["CanonicalPath"], "");
                    if (string.IsNullOrWhiteSpace(canonicalPath))
                        canonicalPath = "/services/" + slug;

                    if (!canonicalPath.StartsWith("/"))
                        canonicalPath = "/" + canonicalPath;

                    string canonical = master.GetSiteBaseUrl().TrimEnd('/') + canonicalPath;

                    // OG Image: DB'de OgImageUrl yok -> CoverImageUrl'dan üret
                    string ogImg = master.GetSiteBaseUrl().TrimEnd('/') + "/" + coverRel.TrimStart('~', '/');

                    master.SetSeo(
                        seoTitle: seoTitle,
                        metaDescription: seoDesc,
                        canonicalUrl: canonical,
                        ogTitle: seoTitle,
                        ogType: "website",
                        ogImageUrl: ogImg
                    );
                }
            }
        }

        public string T(string en, string tr)
        {
            var master = Master as SiteMaster;
            var lang = (master?.GetCurrentLang() ?? "en").ToLowerInvariant();
            return (lang == "tr" && !string.IsNullOrWhiteSpace(tr)) ? tr : en;
        }

        private void BindStep(System.Web.UI.WebControls.PlaceHolder ph,
            System.Web.UI.WebControls.Literal litTitle,
            System.Web.UI.WebControls.Literal litDesc,
            System.Web.UI.WebControls.Repeater rptTags,
            string title, string desc, string tagsCsv)
        {
            if (string.IsNullOrWhiteSpace(title))
            {
                ph.Visible = false;
                return;
            }

            ph.Visible = true;
            litTitle.Text = HttpUtility.HtmlEncode(title);
            litDesc.Text = HttpUtility.HtmlEncode(desc);

            rptTags.DataSource = SplitCsv(tagsCsv);
            rptTags.DataBind();
        }

        private void BindFaq(System.Web.UI.WebControls.PlaceHolder ph,
            System.Web.UI.WebControls.Literal q,
            System.Web.UI.WebControls.Literal a,
            string question, string answer)
        {
            if (string.IsNullOrWhiteSpace(question) || string.IsNullOrWhiteSpace(answer))
            {
                ph.Visible = false;
                return;
            }

            ph.Visible = true;
            q.Text = HttpUtility.HtmlEncode(question);
            a.Text = HttpUtility.HtmlEncode(answer);
        }

        private string Safe(object val, string fallback)
        {
            if (val == null || val == DBNull.Value) return fallback;
            var s = val.ToString();
            return string.IsNullOrWhiteSpace(s) ? fallback : s;
        }

        private List<string> SplitCsv(string csv)
        {
            if (string.IsNullOrWhiteSpace(csv)) return new List<string>();

            return csv
                .Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries)
                .Select(x => x.Trim())
                .Where(x => x.Length > 0)
                .Distinct(StringComparer.OrdinalIgnoreCase)
                .Take(8)
                .ToList();
        }

        private string BuildHreflang(SiteMaster master, string pathNoLang)
        {
            var baseUrl = master.GetSiteBaseUrl().TrimEnd('/');

            // pathNoLang örn: "services/my-slug"
            string p = (pathNoLang ?? "").Trim().TrimStart('/');

            // ✅ EN default: /{p}
            // ✅ TR: /tr/{p}
            string Url(string lang)
            {
                lang = (lang ?? "en").ToLowerInvariant();
                if (lang == "tr") return $"{baseUrl}/tr/{p}";
                return $"{baseUrl}/{p}";
            }

            return $@"
<link rel=""alternate"" hreflang=""en"" href=""{Url("en")}"" />
<link rel=""alternate"" hreflang=""tr"" href=""{Url("tr")}"" />
<link rel=""alternate"" hreflang=""x-default"" href=""{Url("en")}"" />
";
        }
    }
}