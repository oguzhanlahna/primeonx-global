<%@ Page Title="Contact Us Test" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Net.Mail" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script>
        // Tema JS'leri click/submit'i yakalamasın
        (function () {
            document.addEventListener("click", function (e) {
                try {
                    var btn = e.target && (e.target.closest ? e.target.closest("#btnTest") : null);
                    if (btn) { e.stopImmediatePropagation(); e.stopPropagation(); }
                } catch (err) { }
            }, true);

            document.addEventListener("submit", function (e) {
                try { e.stopImmediatePropagation(); e.stopPropagation(); } catch (err) { }
            }, true);
        })();
    </script>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="padding:40px 0;">
        <h2>SMTP Master Test (Inline)</h2>

        <p>
            <asp:Button ID="btnTest" runat="server"
                Text="SEND TEST MAIL"
                OnClick="btnTest_Click"
                UseSubmitBehavior="false"
                CausesValidation="false"
                CssClass="rts-btn btn-primary" />
        </p>

        <div style="margin-top:15px;">
            <asp:Literal ID="lit" runat="server" />
        </div>
    </div>

    <script runat="server">
        protected void btnTest_Click(object sender, EventArgs e)
        {
            var trace = Guid.NewGuid().ToString("N").Substring(0, 8);
            lit.Text = "<p style='color:orange'>SERVER HIT (Trace: " + Server.HtmlEncode(trace) + ")</p>";

            var host = (ConfigurationManager.AppSettings["CONTACT_SMTP_HOST"] ?? "").Trim();
            var port = int.Parse(ConfigurationManager.AppSettings["CONTACT_SMTP_PORT"] ?? "587");
            var user = (ConfigurationManager.AppSettings["CONTACT_SMTP_USER"] ?? "").Trim();
            var pass = (ConfigurationManager.AppSettings["CONTACT_SMTP_PASSWORD"] ?? "").Trim();
            var to   = (ConfigurationManager.AppSettings["CONTACT_MAIL_TO"] ?? "").Trim();
            var from = (ConfigurationManager.AppSettings["CONTACT_MAIL_FROM"] ?? "").Trim();
            var ssl  = string.Equals(ConfigurationManager.AppSettings["CONTACT_SMTP_ENABLESSL"], "true", StringComparison.OrdinalIgnoreCase);

            try
            {
                using (var msg = new MailMessage(from, to, "SMTP MASTER TEST " + trace, "Hello test " + DateTime.UtcNow.ToString("u")))
                using (var smtp = new SmtpClient(host, port))
                {
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential(user, pass);
                    smtp.EnableSsl = ssl;
                    smtp.Send(msg);
                }

                lit.Text = "<p style='color:green'>SENT OK (Trace: " + Server.HtmlEncode(trace) + ")</p>";
            }
            catch (Exception ex)
            {
                lit.Text = "<p style='color:red'>FAIL (Trace: " + Server.HtmlEncode(trace) + "): "
                         + Server.HtmlEncode(ex.ToString()) + "</p>";
            }
        }
    </script>

</asp:Content>