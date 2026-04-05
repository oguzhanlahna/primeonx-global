<%@ Page Title="Why Choose Primeonx | Digital Engineering for Growth & Scale" Language="C#"
    MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="why-choose-us.aspx.cs" Inherits="primeonx_global.why_choose_us" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- ✅ Hreflang buraya basılacak -->
    <asp:Literal ID="litHreflang" runat="server" />
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- about breadcrumb cyber -->
    <div class="rts-about-breadcrumb-cyber rts-section-gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="about-cyber-security-wrapper">

                        <span class="pre"><%: T("Why Primeonx","Neden Primeonx") %></span>

                        <h1 class="title">
                            <%: T(
                                "Digital Systems Engineered for Speed, Trust, and Scale",
                                "Hız, Güven ve Ölçek için Tasarlanmış Dijital Sistemler"
                            ) %>
                        </h1>

                        <p class="disc">
                            <%: T(
                                "Modern growth is built on reliable digital infrastructure. Primeonx designs and delivers high-performance websites, automation platforms, and business systems that are secure, measurable, and ready to scale—so your product, marketing, and operations move faster with fewer risks.",
                                "Modern büyüme, güvenilir dijital altyapı üzerine kurulur. Primeonx; güvenli, ölçülebilir ve ölçeklenmeye hazır yüksek performanslı web siteleri, otomasyon platformları ve iş sistemleri tasarlar ve teslim eder—böylece ürün, pazarlama ve operasyonlarınız daha az riskle daha hızlı ilerler."
                            ) %>
                        </p>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- about breadcrumb cyber end -->

    <div class="luminos-solution-key-feature mt--50">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="luminos-main-solutioin-key">

                        <h3 class="title animated fadeIn"><%: T("Choose Primeonx for:","Primeonx’i seçin çünkü:") %></h3>

                        <div class="check-wrapper">
                            <div class="single-check">
                                <img src="<%: ResolveUrl("~/assets/images/why-choose/05.svg") %>" alt="Primeonx expertise" />
                                <p><%: T("Senior Engineering, Not Templates","Şablon Değil, Kıdemli Mühendislik") %></p>
                            </div>
                            <div class="single-check">
                                <img src="<%: ResolveUrl("~/assets/images/why-choose/05.svg") %>" alt="Performance and SEO" />
                                <p><%: T("Performance-First Builds (Core Web Vitals + SEO)","Performans Öncelikli İnşa (Core Web Vitals + SEO)") %></p>
                            </div>
                            <div class="single-check">
                                <img src="<%: ResolveUrl("~/assets/images/why-choose/05.svg") %>" alt="Automation systems" />
                                <p><%: T("Automation That Reduces Manual Work","Manuel İşi Azaltan Otomasyon") %></p>
                            </div>
                            <div class="single-check">
                                <img src="<%: ResolveUrl("~/assets/images/why-choose/05.svg") %>" alt="Reliable delivery" />
                                <p><%: T("Clean Delivery: Scope, Timeline, and Documentation","Temiz Teslimat: Kapsam, Zaman Planı ve Dokümantasyon") %></p>
                            </div>
                        </div>

                        <div class="tag-wrapper">
                            <div class="single-tag"><span><%: T("Technical SEO","Teknik SEO") %></span></div>
                            <div class="single-tag"><span><%: T("Web Engineering","Web Mühendisliği") %></span></div>
                            <div class="single-tag"><span><%: T("Automation Platforms","Otomasyon Platformları") %></span></div>
                        </div>

                    </div>
                </div>

                <div class="col-lg-7 mt_sm--50 mt_md--50">
                    <div class="thumbnail-main-wrapper-choose-us">
                        <img src="<%: ResolveUrl("~/assets/images/why-choose/07.webp") %>" alt="Primeonx digital engineering" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- work-process -->
    <div class="rts-work-process-area rts-section-gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 pr--70 pr_md--10 pr_sm--10">
                    <div class="work-process-content">
                        <div class="title-left-wrapper">
                            <span class="pre"><%: T("How We Work","Nasıl Çalışıyoruz") %></span>

                            <h2 class="title rts-text-anime-style-1">
                                <%: T(
                                    "A Clear Engineering Process <br> for Predictable Delivery <br> and Better Outcomes",
                                    "Öngörülebilir Teslimat <br> ve Daha İyi Sonuçlar İçin <br> Net Bir Mühendislik Süreci"
                                ) %>
                            </h2>
                        </div>

                        <div class="thumbnail-plunning-service-detials mt--60">
                            <img src="<%: ResolveUrl("~/assets/images/process/06.webp") %>" alt="Primeonx process" />
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 mt_md--50 mt_sm--50">
                    <div class="working-process-list-wrapper">

                        <div class="single-working-process-area">
                            <h5 class="title"><%: T("Discovery, Audit & Success Metrics","Keşif, Denetim ve Başarı Metrikleri") %></h5>
                            <p class="disc">
                                <%: T(
                                    "We start with a focused audit of your site, stack, and funnel. Then we define measurable outcomes—speed, conversions, SEO targets, operational savings—so delivery is aligned to business impact.",
                                    "Site, teknoloji yığını ve funnel için odaklı bir denetimle başlarız. Sonra ölçülebilir çıktıları tanımlarız—hız, dönüşüm, SEO hedefleri, operasyonel tasarruf—böylece teslimat iş etkisine hizalanır."
                                ) %>
                            </p>
                            <div class="tag-area-wrapper">
                                <span class="tag-area"><%: T("Technical Audit","Teknik Denetim") %></span>
                                <span class="tag-area"><%: T("KPI Definition","KPI Tanımı") %></span>
                                <span class="tag-area"><%: T("Requirements","Gereksinimler") %></span>
                            </div>
                        </div>

                        <div class="single-working-process-area">
                            <h5 class="title"><%: T("Architecture & Roadmap","Mimari ve Yol Haritası") %></h5>
                            <p class="disc">
                                <%: T(
                                    "We design the system before we build—information architecture, SEO structure, data flows, integrations, and security considerations—then map delivery into clear milestones.",
                                    "İnşa etmeden önce sistemi tasarlarız—bilgi mimarisi, SEO yapısı, veri akışları, entegrasyonlar ve güvenlik—sonra teslimatı net milestone’lara böleriz."
                                ) %>
                            </p>
                            <div class="tag-area-wrapper">
                                <span class="tag-area"><%: T("System Design","Sistem Tasarımı") %></span>
                                <span class="tag-area"><%: T("SEO Architecture","SEO Mimarisi") %></span>
                                <span class="tag-area"><%: T("Roadmap","Yol Haritası") %></span>
                            </div>
                        </div>

                        <div class="single-working-process-area">
                            <h5 class="title"><%: T("Build, QA & Launch","Geliştirme, QA ve Yayın") %></h5>
                            <p class="disc">
                                <%: T(
                                    "We implement with clean code and rigorous QA. Before launch we verify performance, accessibility, tracking, and indexing fundamentals—then ship with documentation and a stable handover.",
                                    "Temiz kod ve sıkı QA ile geliştiririz. Yayın öncesi performans, erişilebilirlik, takip (tracking) ve indeksleme temelini doğrularız—sonra dokümantasyon ve stabil handover ile teslim ederiz."
                                ) %>
                            </p>
                            <div class="tag-area-wrapper">
                                <span class="tag-area"><%: T("Engineering","Mühendislik") %></span>
                                <span class="tag-area"><%: T("Quality Assurance","Kalite Güvence") %></span>
                                <span class="tag-area"><%: T("Deployment","Dağıtım") %></span>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- CTA -->
    <div class="rts-call-to-action-area rts-section-gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="call-to-action-wrapper-three">
                        <h3 class="title rts-text-anime-style-1">
                            <%: T("Build something that performs—today and at scale.","Bugün ve ölçeklenince de performans veren bir şey inşa edin.") %>
                        </h3>
                        <p class="disc">
                            <%: T(
                                "Tell us what you’re building. We’ll respond with a clear plan, realistic timeline, and the right execution path—website, automation, or a full digital system.",
                                "Ne inşa ettiğinizi anlatın. Net bir plan, gerçekçi zaman çizelgesi ve doğru uygulama yolu ile döneceğiz—web sitesi, otomasyon veya tam bir dijital sistem."
                            ) %>
                        </p>
                        <a href="<%: ((primeonx_global.SiteMaster)Master).L("contact") %>" class="rts-btn btn-primary">
                            <%: T("Request a Consultation","Danışmanlık Talep Et") %>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>