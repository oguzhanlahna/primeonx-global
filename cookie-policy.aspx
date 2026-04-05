<%@ Page Title="Cookie Policy | Primeonx" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cookie-policy.aspx.cs" Inherits="primeonx_global.cookie_policy" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <asp:Literal ID="litHreflang" runat="server" />
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="rts-service-details-breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-area">
                        <ul>
                            <li>
                                <a href="<%: ((primeonx_global.SiteMaster)Master).L("") %>">
                                    <%: ((primeonx_global.SiteMaster)Master).T("Home","Ana Sayfa") %>
                                </a>
                            </li>
                            <li><i class="fa fa-chevron-right"></i></li>
                            <li><a href="#" class="active"><%: ((primeonx_global.SiteMaster)Master).T("Cookie Policy","Çerez Politikası") %></a></li>
                        </ul>

                        <h1 class="title rts-text-anime-style-1">
                            <%: ((primeonx_global.SiteMaster)Master).T("Cookie Policy","Çerez Politikası") %>
                        </h1>

                        <p class="disc mt--20">
                            <%: ((primeonx_global.SiteMaster)Master).T(
                                "This Cookie Policy explains how Primeonx uses cookies and similar technologies on this website.",
                                "Bu Çerez Politikası, Primeonx’in bu web sitesinde çerezleri ve benzer teknolojileri nasıl kullandığını açıklar."
                            ) %>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="rts-faq-area-start rts-section-gapBottom">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="accordon-pricing-wrapper-three full-width">

                        <div class="mb--30">
                            <p class="disc">
                                <strong><%: ((primeonx_global.SiteMaster)Master).T("Effective date","Yürürlük tarihi") %>:</strong> January 01, 2026
                                <span class="ms-3"></span>
                                <strong><%: ((primeonx_global.SiteMaster)Master).T("Last updated","Son güncelleme") %>:</strong> February 14, 2026
                            </p>
                        </div>

                        <div class="rts-cookie-article">

                            <h3 class="title">1. <%: ((primeonx_global.SiteMaster)Master).T("What Are Cookies?","Çerez Nedir?") %></h3>
                            <p class="disc">
                                <%: ((primeonx_global.SiteMaster)Master).T(
                                    "Cookies are small text files stored on your device when you visit a website. They help websites function properly, improve user experience, and provide analytical information about site usage.",
                                    "Çerezler, bir web sitesini ziyaret ettiğinizde cihazınıza kaydedilen küçük metin dosyalarıdır. Site işlevselliğini destekler, deneyimi iyileştirir ve kullanım analizi sağlar."
                                ) %>
                            </p>

                            <h3 class="title">2. <%: ((primeonx_global.SiteMaster)Master).T("How We Use Cookies","Çerezleri Nasıl Kullanırız") %></h3>
                            <p class="disc">
                                <%: ((primeonx_global.SiteMaster)Master).T(
                                    "Primeonx may use cookies and similar technologies to:",
                                    "Primeonx, çerezleri ve benzer teknolojileri şunlar için kullanabilir:"
                                ) %>
                            </p>
                            <ul class="disc">
                                <li><%: ((primeonx_global.SiteMaster)Master).T("Ensure core website functionality","Temel site işlevlerini sağlamak") %></li>
                                <li><%: ((primeonx_global.SiteMaster)Master).T("Enhance performance and load speed","Performans ve yükleme hızını artırmak") %></li>
                                <li><%: ((primeonx_global.SiteMaster)Master).T("Understand aggregate traffic and usage patterns","Toplu trafik ve kullanım eğilimlerini anlamak") %></li>
                                <li><%: ((primeonx_global.SiteMaster)Master).T("Improve security and prevent abuse","Güvenliği artırmak ve kötüye kullanımı önlemek") %></li>
                            </ul>

                            <h3 class="title">3. <%: ((primeonx_global.SiteMaster)Master).T("Managing Cookies","Çerez Yönetimi") %></h3>
                            <p class="disc">
                                <%: ((primeonx_global.SiteMaster)Master).T(
                                    "You can control or disable cookies through your browser settings. Disabling certain cookies may affect website functionality.",
                                    "Çerezleri tarayıcı ayarlarınızdan kontrol edebilir veya devre dışı bırakabilirsiniz. Bazı çerezleri kapatmak site işlevlerini etkileyebilir."
                                ) %>
                            </p>

                            <h3 class="title">4. <%: ((primeonx_global.SiteMaster)Master).T("Contact","İletişim") %></h3>
                            <p class="disc">
                                <%: ((primeonx_global.SiteMaster)Master).T(
                                    "If you have questions about our use of cookies, please contact us through our website.",
                                    "Çerez kullanımıyla ilgili sorularınız varsa web sitemiz üzerinden bize ulaşın."
                                ) %>
                            </p>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>