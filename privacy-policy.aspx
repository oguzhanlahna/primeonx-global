<%@ Page Title="Privacy Policy | Primeonx" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="privacy-policy.aspx.cs" Inherits="primeonx_global.privacy_policy" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <asp:Literal ID="litHreflang" runat="server" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="rts-service-details-breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-area">
                    <ul>
                        <li>
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("") %>">
                                <%: T("Home","Ana Sayfa") %>
                            </a>
                        </li>
                        <li><i class="fa fa-chevron-right"></i></li>
                        <li><a href="#" class="active"><%: T("Privacy Policy","Gizlilik Politikası") %></a></li>
                    </ul>

                    <h1 class="title rts-text-anime-style-1"><%: T("Privacy Policy","Gizlilik Politikası") %></h1>

                    <p class="disc mt--20">
                        <%: T(
                            "This Privacy Policy describes how Primeonx collects, uses, and protects information when you visit our website or contact us.",
                            "Bu Gizlilik Politikası, Primeonx’in web sitesini ziyaret ettiğinizde veya bize ulaştığınızda bilgileri nasıl topladığını, kullandığını ve koruduğunu açıklar."
                        ) %>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="rts-faq-area-start rts-section-gapBottom">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">

                <div class="accordon-pricing-wrapper-three full-width">
                    <div class="accordion" id="pricingAccordion">

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <%: T("Information we collect","Topladığımız bilgiler") %>
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#pricingAccordion">
                                <div class="accordion-body">
                                    <%: T(
                                        "We collect information you provide directly (such as your name, email address, company name, and message content) when you submit a form or contact us. We may also collect limited technical data (such as IP address, device type, browser type, and pages visited) for security, analytics, and performance improvements.",
                                        "Form gönderdiğinizde veya bize ulaştığınızda doğrudan sağladığınız bilgileri (ad, e-posta, şirket adı, mesaj içeriği) toplarız. Güvenlik, analiz ve performans iyileştirmeleri için sınırlı teknik veriler (IP, cihaz türü, tarayıcı, ziyaret edilen sayfalar) de toplanabilir."
                                    ) %>
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <%: T("How we use your information","Bilgileri nasıl kullanırız") %>
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#pricingAccordion">
                                <div class="accordion-body">
                                    <%: T(
                                        "We use information to respond to requests, provide services, improve our website, measure performance, and protect against abuse or security incidents. We do not sell your personal information.",
                                        "Bilgileri; taleplere yanıt vermek, hizmet sağlamak, web sitemizi geliştirmek, performansı ölçmek ve suistimal/güvenlik olaylarına karşı korumak için kullanırız. Kişisel bilgilerinizi satmayız."
                                    ) %>
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <%: T("Cookies and analytics","Çerezler ve analitik") %>
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#pricingAccordion">
                                <div class="accordion-body">
                                    <%: T(
                                        "We may use cookies or similar technologies to support core site functionality and understand aggregated usage. You can control cookies through your browser settings. Disabling cookies may affect certain site features.",
                                        "Temel işlevleri desteklemek ve toplu kullanımı anlamak için çerezler kullanılabilir. Çerezleri tarayıcı ayarlarından yönetebilirsiniz. Bazı çerezleri kapatmak özellikleri etkileyebilir."
                                    ) %>
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    <%: T("Sharing with service providers","Hizmet sağlayıcılarla paylaşım") %>
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#pricingAccordion">
                                <div class="accordion-body">
                                    <%: T(
                                        "We may share information with trusted service providers that help us run the website and communications (hosting, email delivery, analytics, security). Providers may only process data to deliver services to Primeonx. We may also disclose information if required by law or to protect rights and safety.",
                                        "Web sitesi ve iletişimi yürütmemize yardımcı olan güvenilir hizmet sağlayıcılarla (hosting, e-posta, analitik, güvenlik) bilgi paylaşabiliriz. Sağlayıcılar veriyi yalnızca Primeonx hizmeti için işler. Ayrıca yasa gereği veya güvenlik/ hak koruması için açıklama yapılabilir."
                                    ) %>
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFive">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                    <%: T("Data retention","Veri saklama") %>
                                </button>
                            </h2>
                            <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#pricingAccordion">
                                <div class="accordion-body">
                                    <%: T(
                                        "We retain personal information only as long as needed to fulfill the purposes described in this policy, comply with legal obligations, and maintain business records. Retention depends on data type and context.",
                                        "Kişisel bilgileri yalnızca bu politikadaki amaçları yerine getirmek, yasal yükümlülüklere uymak ve iş kayıtlarını tutmak için gerekli süre kadar saklarız. Süre; veri türü ve bağlama göre değişir."
                                    ) %>
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingSix">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                    <%: T("Your rights and contact","Haklarınız ve iletişim") %>
                                </button>
                            </h2>
                            <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#pricingAccordion">
                                <div class="accordion-body">
                                    <%: T(
                                        "Depending on your location, you may have rights to access, correct, or delete your personal information. To request changes or ask questions, contact us via our contact page. We will respond within a reasonable timeframe.",
                                        "Bulunduğunuz yere göre kişisel bilgilerinize erişme, düzeltme veya silme haklarınız olabilir. Talep için iletişim sayfamızdan bize ulaşın; makul süre içinde yanıtlarız."
                                    ) %>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="mt--30">
                        <p class="disc"><strong>Effective date:</strong> January 01, 2026</p>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>

</asp:Content>