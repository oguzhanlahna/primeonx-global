using System;
using System.Collections.Generic;
using System.Globalization;
using System.Threading;
using System.Web;
using System.Web.Routing;
using System.Web.UI; // ✅ ScriptResourceMapping + ValidationSettings

namespace primeonx_global
{
    public class Global : HttpApplication
    {
        private static readonly HashSet<string> AllowedLangs =
            new HashSet<string>(StringComparer.OrdinalIgnoreCase) { "en", "tr" };

        protected void Application_Start(object sender, EventArgs e)
        {
            // ✅ WebForms "WebForms UnobtrusiveValidationMode requires a ScriptResourceMapping for 'jquery'"
            // jQuery dosyan zaten var: ~/assets/js/plugins/jquery.js
            try
            {
                ScriptManager.ScriptResourceMapping.AddDefinition(
                    "jquery",
                    new ScriptResourceDefinition
                    {
                        Path = "~/assets/js/plugins/jquery.js",
                        DebugPath = "~/assets/js/plugins/jquery.js",
                        CdnSupportsSecureConnection = true
                    }
                );
            }
            catch
            {
                // mapping zaten eklendiyse geç
            }

            // ✅ Unobtrusive'ı kapat (validator vb. yüzünden submit/JS karışmasın)
            try
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            }
            catch { }

            RegisterRoutes(RouteTable.Routes);
        }

        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            try
            {
                var rd = Request?.RequestContext?.RouteData;
                var lang = rd?.Values["lang"]?.ToString();

                if (string.IsNullOrWhiteSpace(lang)) lang = "en";
                lang = lang.ToLowerInvariant();

                if (!AllowedLangs.Contains(lang)) lang = "en";

                var culture = lang == "tr" ? new CultureInfo("tr-TR") : new CultureInfo("en-US");
                Thread.CurrentThread.CurrentCulture = culture;
                Thread.CurrentThread.CurrentUICulture = culture;
            }
            catch { /* ignore */ }
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            try
            {
                var url = Request?.Url;
                if (url == null) return;

                var path = (url.AbsolutePath ?? "").Trim();
                if (!path.EndsWith(".aspx", StringComparison.OrdinalIgnoreCase))
                    return;

                var parts = path.Split(new[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
                if (parts.Length != 2) return;

                var lang = parts[0].ToLowerInvariant();
                if (!AllowedLangs.Contains(lang)) return;

                var page = parts[1];
                var slug = page.Substring(0, page.Length - 5).ToLowerInvariant();

                if (slug == "default" || slug == "home") slug = "";

                var target = "/" + lang + (string.IsNullOrEmpty(slug) ? "" : "/" + slug);

                var qs = url.Query;
                if (!string.IsNullOrEmpty(qs)) target += qs;

                Response.StatusCode = 301;
                Response.RedirectLocation = target;
                Response.End();
            }
            catch { /* ignore */ }
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.Ignore("{resource}.axd/{*pathInfo}");

            var langConstraint = new RouteValueDictionary(new { lang = "en|tr" });

            routes.MapPageRoute("L_Home", "{lang}", "~/default.aspx", false, null, langConstraint, null);

            routes.MapPageRoute("L_About", "{lang}/about", "~/about.aspx", false, null, langConstraint, null);

            routes.MapPageRoute("L_BlogList", "{lang}/blog", "~/blog.aspx", false, null, langConstraint, null);
            routes.MapPageRoute("L_BlogDetail", "{lang}/blog/{slug}", "~/blog-detail.aspx", false, null, langConstraint, null);

            routes.MapPageRoute("L_FAQ", "{lang}/faq", "~/faq.aspx", false, null, langConstraint, null);
            routes.MapPageRoute("L_Contact", "{lang}/contact", "~/contact.aspx", false, null, langConstraint, null);
            routes.MapPageRoute("L_Projects", "{lang}/projects", "~/projects.aspx", false, null, langConstraint, null);
            routes.MapPageRoute("L_WhyChooseUs", "{lang}/why-choose-us", "~/why-choose-us.aspx", false, null, langConstraint, null);
            routes.MapPageRoute("L_CaseStudies", "{lang}/case-studies", "~/case-studies.aspx", false, null, langConstraint, null);

            routes.MapPageRoute("L_ServicesList", "{lang}/services", "~/services.aspx", false, null, langConstraint, null);
            routes.MapPageRoute("L_ServiceDetails", "{lang}/services/{slug}", "~/service-details.aspx", false, null, langConstraint, null);

            routes.MapPageRoute("L_Privacy", "{lang}/privacy-policy", "~/privacy-policy.aspx", false, null, langConstraint, null);
            routes.MapPageRoute("L_Terms", "{lang}/terms-of-service", "~/terms-of-service.aspx", false, null, langConstraint, null);
            routes.MapPageRoute("L_Cookie", "{lang}/cookie-policy", "~/cookie-policy.aspx", false, null, langConstraint, null);

            routes.MapPageRoute("Home", "", "~/default.aspx");
            routes.MapPageRoute("About", "about", "~/about.aspx");
            routes.MapPageRoute("BlogList", "blog", "~/blog.aspx");
            routes.MapPageRoute("BlogDetail", "blog/{slug}", "~/blog-detail.aspx");
            routes.MapPageRoute("FAQ", "faq", "~/faq.aspx");
            routes.MapPageRoute("Contact", "contact", "~/contact.aspx");
            routes.MapPageRoute("Projects", "projects", "~/projects.aspx");
            routes.MapPageRoute("WhyChooseUs", "why-choose-us", "~/why-choose-us.aspx");
            routes.MapPageRoute("CaseStudies", "case-studies", "~/case-studies.aspx");
            routes.MapPageRoute("ServicesList", "services", "~/services.aspx");
            routes.MapPageRoute("ServiceDetails", "services/{slug}", "~/service-details.aspx");
            routes.MapPageRoute("Privacy", "privacy-policy", "~/privacy-policy.aspx");
            routes.MapPageRoute("Terms", "terms-of-service", "~/terms-of-service.aspx");
            routes.MapPageRoute("Cookie", "cookie-policy", "~/cookie-policy.aspx");
        }
    }
}