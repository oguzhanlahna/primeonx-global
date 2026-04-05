using System.Web;
using System.Web.Optimization;

namespace primeonx_global
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            // CSS Bundle
            bundles.Add(new StyleBundle("~/bundles/css").Include(
                "~/assets/css/vendor/bootstrap.min.css",
                "~/assets/css/style.css",
                "~/assets/css/plugins/fontawesome.css",
                "~/assets/css/plugins/swiper.css",
                "~/assets/css/plugins/metismenu.css",
                "~/assets/css/plugins/magnifying-popup.css",
                "~/assets/css/plugins/odometer.css"
            ));

            // JS Bundle
            bundles.Add(new ScriptBundle("~/bundles/js").Include(
                "~/assets/js/plugins/jquery.js",
                "~/assets/js/plugins/jquery-appear.js",
                "~/assets/js/plugins/odometer.js",
                "~/assets/js/plugins/gsap.js",
                "~/assets/js/plugins/split-text.js",
                "~/assets/js/plugins/scroll-trigger.js",
                "~/assets/js/plugins/smooth-scroll.js",
                "~/assets/js/plugins/metismenu.js",
                "~/assets/js/plugins/popup.js",
                "~/assets/js/plugins/contact.form.js",
                "~/assets/js/vendor/bootstrap.min.js",
                "~/assets/js/plugins/swiper.js",
                "~/assets/js/main.js"
            ));
        }
    }
}
