using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace primeonx_global
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        private static readonly HashSet<string> AllowedLangs =
            new HashSet<string>(StringComparer.OrdinalIgnoreCase) { "en", "tr" };

        public string SeoTitle { get; private set; }
        public string MetaDescription { get; private set; }
        public string CanonicalUrl { get; private set; }
        public string OgType { get; private set; }
        public string OgTitle { get; private set; }
        public string OgImageUrl { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(SeoTitle))
                SeoTitle = "Primeonx";

            if (string.IsNullOrWhiteSpace(MetaDescription))
                MetaDescription = "Primeonx builds SEO-first web experiences and marketing systems designed for measurable growth.";

            if (string.IsNullOrWhiteSpace(OgTitle))
                OgTitle = SeoTitle;

            if (string.IsNullOrWhiteSpace(OgType))
                OgType = "website";

            if (string.IsNullOrWhiteSpace(CanonicalUrl))
                CanonicalUrl = GetCanonicalDefault();

            if (string.IsNullOrWhiteSpace(OgImageUrl))
                OgImageUrl = FixUrl(ResolveUrl("~/assets/images/og/primeonx-og.jpg"));

            if (litHreflang != null)
                litHreflang.Text = BuildHreflangLinks();

            if (litJsonLd != null)
                litJsonLd.Text = BuildJsonLdBlocks();
        }

        public string T(string en, string tr)
        {
            var lang = GetCurrentLang();
            return lang == "tr" ? (string.IsNullOrWhiteSpace(tr) ? en : tr) : en;
        }

        public void SetSeo(string seoTitle, string metaDescription, string canonicalUrl, string ogTitle = null, string ogType = null, string ogImageUrl = null)
        {
            SeoTitle = Normalize(seoTitle, 200);
            MetaDescription = Normalize(metaDescription, 320);

            CanonicalUrl = FixUrl(NormalizeUrlOrNull(canonicalUrl)) ?? GetCanonicalDefault();

            if (!string.IsNullOrWhiteSpace(ogTitle)) OgTitle = Normalize(ogTitle, 200);
            if (!string.IsNullOrWhiteSpace(ogType)) OgType = Normalize(ogType, 30);
            if (!string.IsNullOrWhiteSpace(ogImageUrl)) OgImageUrl = FixUrl(NormalizeUrlOrNull(ogImageUrl));
        }

        public string GetSeoTitle() => SeoTitle ?? "Primeonx";
        public string GetMetaDescription() => MetaDescription ?? "";
        public string GetCanonicalUrl() => FixUrl(CanonicalUrl) ?? GetCanonicalDefault();
        public string GetOgType() => OgType ?? "website";
        public string GetOgTitle() => OgTitle ?? GetSeoTitle();
        public string GetOgImageUrl() => FixUrl(OgImageUrl) ?? FixUrl(ResolveUrl("~/assets/images/og/primeonx-og.jpg"));

        public string GetCurrentLang()
        {
            var rdLang = Page?.RouteData?.Values["lang"]?.ToString();
            if (!string.IsNullOrWhiteSpace(rdLang) && AllowedLangs.Contains(rdLang))
                return rdLang.ToLowerInvariant();

            var req = HttpContext.Current?.Request;
            var path = (req?.Url?.AbsolutePath ?? "/").Trim('/');
            if (!string.IsNullOrEmpty(path))
            {
                var first = path.Split('/')[0];
                if (AllowedLangs.Contains(first))
                    return first.ToLowerInvariant();
            }
            return "en";
        }

        public string L(string path)
        {
            var lang = GetCurrentLang();
            path = (path ?? "").Trim().TrimStart('/');

            var app = (HttpContext.Current?.Request?.ApplicationPath ?? "/").TrimEnd('/');
            if (string.IsNullOrWhiteSpace(app)) app = "/";
            var basePath = app == "/" ? "" : app;

            if (string.IsNullOrWhiteSpace(path))
                return basePath + "/" + lang;

            return basePath + "/" + lang + "/" + path;
        }

        public string SwitchLangUrl(string targetLang)
        {
            targetLang = (targetLang ?? "").Trim().ToLowerInvariant();
            if (!AllowedLangs.Contains(targetLang))
                targetLang = "en";

            var req = HttpContext.Current?.Request;
            if (req == null) return L("");

            var absPath = (req.Url.AbsolutePath ?? "/");
            var appPath = (req.ApplicationPath ?? "/").TrimEnd('/');

            if (!string.IsNullOrWhiteSpace(appPath) && appPath != "/" &&
                absPath.StartsWith(appPath + "/", StringComparison.OrdinalIgnoreCase))
            {
                absPath = absPath.Substring(appPath.Length);
            }

            var path = absPath.Trim('/');
            var query = req.Url.Query ?? "";

            var segments = path.Length == 0
                ? Array.Empty<string>()
                : path.Split(new[] { '/' }, StringSplitOptions.RemoveEmptyEntries);

            if (segments.Length > 0 && AllowedLangs.Contains(segments[0]))
                segments = segments.Skip(1).ToArray();

            var rest = string.Join("/", segments);
            var newLocal = string.IsNullOrEmpty(rest) ? "/" + targetLang : "/" + targetLang + "/" + rest;

            var basePath = (appPath == "/" ? "" : appPath);
            return basePath + newLocal + query;
        }

        public string GetSiteBaseUrl()
        {
            var req = HttpContext.Current?.Request;
            if (req == null) return "";

            var authority = req.Url.GetLeftPart(UriPartial.Authority);

            var forwardedProto = req.Headers["X-Forwarded-Proto"];
            if (!string.IsNullOrWhiteSpace(forwardedProto))
            {
                try
                {
                    var uri = new Uri(authority);
                    authority = forwardedProto.Trim().ToLowerInvariant() + "://" + uri.Authority;
                }
                catch { }
            }

            return authority.TrimEnd('/');
        }

        private string GetCanonicalDefault()
        {
            var req = HttpContext.Current?.Request;
            if (req == null) return "";

            var baseUrl = GetSiteBaseUrl();
            var absPath = (req.Url.AbsolutePath ?? "/");
            var lang = GetCurrentLang();

            var appPath = (req.ApplicationPath ?? "/").TrimEnd('/');
            var pathNoApp = absPath;

            if (!string.IsNullOrWhiteSpace(appPath) && appPath != "/" &&
                absPath.StartsWith(appPath + "/", StringComparison.OrdinalIgnoreCase))
            {
                pathNoApp = absPath.Substring(appPath.Length);
            }

            var local = pathNoApp.Trim('/');
            var segs = local.Length == 0 ? Array.Empty<string>() : local.Split('/');
            bool hasLang = segs.Length > 0 && AllowedLangs.Contains(segs[0]);

            string normalizedLocal = hasLang
                ? "/" + string.Join("/", segs)
                : (string.IsNullOrEmpty(local) ? ("/" + lang) : ("/" + lang + "/" + local));

            var basePath = (appPath == "/" ? "" : appPath);
            return (baseUrl + basePath + normalizedLocal).TrimEnd('/');
        }

        private string BuildHreflangLinks()
        {
            var sb = new StringBuilder();
            foreach (var lang in AllowedLangs)
            {
                var href = FixUrl(SwitchLangUrl(lang));
                sb.AppendLine($"<link rel=\"alternate\" hreflang=\"{lang}\" href=\"{HttpUtility.HtmlAttributeEncode(href)}\" />");
            }

            var xDefault = FixUrl(SwitchLangUrl("en"));
            sb.AppendLine($"<link rel=\"alternate\" hreflang=\"x-default\" href=\"{HttpUtility.HtmlAttributeEncode(xDefault)}\" />");
            return sb.ToString();
        }

        private string BuildJsonLdBlocks()
        {
            // JSON-LD içinde absolute URL'leri garanti ediyoruz
            var baseUrl = GetSiteBaseUrl();
            var logoAbs = FixUrl(ResolveUrl("~/assets/images/logo/primeonx.svg"));

            var orgJson =
$@"<script type=""application/ld+json"">
{{
  ""@context"": ""https://schema.org"",
  ""@type"": ""Organization"",
  ""name"": ""Primeonx"",
  ""url"": ""{Js(baseUrl)}"",
  ""logo"": ""{Js(logoAbs)}"",
  ""sameAs"": [""https://www.linkedin.com/""]
}}
</script>";

            var siteJson =
$@"<script type=""application/ld+json"">
{{
  ""@context"": ""https://schema.org"",
  ""@type"": ""WebSite"",
  ""name"": ""Primeonx"",
  ""url"": ""{Js(baseUrl)}"",
  ""potentialAction"": {{
    ""@type"": ""SearchAction"",
    ""target"": ""{Js(baseUrl)}/en/blog?q={{search_term_string}}"",
    ""query-input"": ""required name=search_term_string""
  }}
}}
</script>";

            return orgJson + Environment.NewLine + siteJson;
        }

        private static string Normalize(string s, int maxLen)
        {
            if (string.IsNullOrWhiteSpace(s)) return s;
            s = s.Trim();
            return s.Length <= maxLen ? s : s.Substring(0, maxLen);
        }

        private static string NormalizeUrlOrNull(string s)
        {
            if (string.IsNullOrWhiteSpace(s)) return null;
            return s.Trim();
        }

        private static string Js(string s)
        {
            if (s == null) return "";
            // JSON string safe minimal escaping
            return s.Replace("\\", "\\\\").Replace("\"", "\\\"");
        }

        private string FixUrl(string url)
        {
            if (string.IsNullOrWhiteSpace(url)) return null;
            url = url.Trim();

            if (url.StartsWith("~"))
                url = ResolveUrl(url);

            if (url.StartsWith("http://", StringComparison.OrdinalIgnoreCase) ||
                url.StartsWith("https://", StringComparison.OrdinalIgnoreCase))
                return url;

            if (url.StartsWith("/"))
                return GetSiteBaseUrl().TrimEnd('/') + url;

            return GetSiteBaseUrl().TrimEnd('/') + "/" + url.TrimStart('/');
        }
    }
}