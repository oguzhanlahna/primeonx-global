<%@ Page Title="Case Studies" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="case-studies.aspx.cs" Inherits="primeonx_global.case_studies" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <asp:Literal ID="litHreflang" runat="server" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!-- rts service-details-breadcrumb-area-start -->
<div class="rts-service-details-breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-area">
                    <ul>
                        <li>
                            <a href="<%= ResolveUrl(((primeonx_global.SiteMaster)Master != null) ? ((primeonx_global.SiteMaster)Master).L("") : "/") %>">
                                <%: ((primeonx_global.SiteMaster)Master).T("Home","Ana Sayfa") %>
                            </a>
                        </li>
                        <li><i class="fa fa-chevron-right"></i></li>
                        <li>
                            <a href="#" class="active">
                                <%: ((primeonx_global.SiteMaster)Master).T("Case Studies","Vaka Çalışmaları") %>
                            </a>
                        </li>
                    </ul>

                    <h1 class="title rts-text-anime-style-1">
                        <%: ((primeonx_global.SiteMaster)Master).T(
                            "Real Growth Stories Backed by Execution",
                            "Uygulamayla Desteklenen Gerçek Büyüme Hikayeleri"
                        ) %>
                    </h1>

                    <p class="disc mt--30">
                        <%: ((primeonx_global.SiteMaster)Master).T(
                            "We focus on measurable impact — combining strategy, execution, and performance tracking to deliver sustainable growth.",
                            "Ölçülebilir etkiye odaklanırız — sürdürülebilir büyüme için strateji, uygulama ve performans takibini birleştiririz."
                        ) %>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- rts service-details-breadcrumb-area-end -->


<!-- rts case studies area start -->
<div class="rts-case-studies rts-section-gapBottom">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="accordion-faq-one in-working-process in-case-cyber">

                    <div class="accordion" id="accordionExample">

                        <!-- Case 01 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button" type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne"
                                    aria-expanded="true"
                                    aria-controls="collapseOne">
                                    <span>2024. </span>
                                    <%: ((primeonx_global.SiteMaster)Master).T(
                                        "Service Business – SEO Growth Transformation",
                                        "Hizmet İşletmesi – SEO Büyüme Dönüşümü"
                                    ) %>
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                                <div class="accordion-body">

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Challenge","Zorluk") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "Low organic visibility, weak keyword positioning, and inconsistent inbound leads.",
                                            "Düşük organik görünürlük, zayıf anahtar kelime konumları ve düzensiz inbound lead akışı."
                                        ) %>
                                    </p>

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Strategy","Strateji") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "Full technical SEO audit, restructuring service pages around search intent, and strengthening internal linking architecture.",
                                            "Kapsamlı teknik SEO denetimi, hizmet sayfalarını arama niyetine göre yeniden kurgulama ve internal link mimarisini güçlendirme."
                                        ) %>
                                    </p>

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Execution","Uygulama") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "On-page optimization, content refinement, schema implementation, and performance monitoring via GA4.",
                                            "On-page optimizasyon, içerik iyileştirme, schema implementasyonu ve GA4 ile performans takibi."
                                        ) %>
                                    </p>

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Outcome","Sonuç") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "Improved search visibility, higher-quality traffic, and measurable growth in qualified inquiries.",
                                            "Daha güçlü arama görünürlüğü, daha kaliteli trafik ve nitelikli taleplerde ölçülebilir artış."
                                        ) %>
                                    </p>

                                </div>
                            </div>
                        </div>

                        <!-- Case 02 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo"
                                    aria-expanded="false"
                                    aria-controls="collapseTwo">
                                    <span>2024. </span>
                                    <%: ((primeonx_global.SiteMaster)Master).T(
                                        "E-commerce – Conversion Rate Optimization",
                                        "E-ticaret – Dönüşüm Oranı Optimizasyonu"
                                    ) %>
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                <div class="accordion-body">

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Challenge","Zorluk") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "Strong traffic volume but low conversion rate and high drop-off.",
                                            "Yüksek trafik hacmi ama düşük dönüşüm oranı ve yüksek terk oranı."
                                        ) %>
                                    </p>

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Strategy","Strateji") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "UX refinement, trust-building content blocks, and clearer CTA hierarchy.",
                                            "UX iyileştirmeleri, güven artıran içerik blokları ve daha net CTA hiyerarşisi."
                                        ) %>
                                    </p>

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Execution","Uygulama") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "Messaging update, page speed optimization, restructuring landing flow, and A/B testing.",
                                            "Mesajlaşma/metin güncellemesi, sayfa hız optimizasyonu, landing akışını yeniden kurgulama ve A/B test."
                                        ) %>
                                    </p>

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Outcome","Sonuç") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "Higher conversion efficiency and improved cost-per-acquisition metrics.",
                                            "Daha yüksek dönüşüm verimliliği ve daha iyi edinme maliyeti metrikleri."
                                        ) %>
                                    </p>

                                </div>
                            </div>
                        </div>

                        <!-- Case 03 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree"
                                    aria-expanded="false"
                                    aria-controls="collapseThree">
                                    <span>2023. </span>
                                    <%: ((primeonx_global.SiteMaster)Master).T(
                                        "Local Business – Search Visibility Expansion",
                                        "Yerel İşletme – Arama Görünürlüğü Genişletme"
                                    ) %>
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                <div class="accordion-body">

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Challenge","Zorluk") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "Limited map pack visibility and inconsistent local traffic.",
                                            "Sınırlı map pack görünürlüğü ve düzensiz yerel trafik."
                                        ) %>
                                    </p>

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Strategy","Strateji") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "Local SEO framework including geo-targeted landing pages and Google Business Profile optimization.",
                                            "Lokasyon odaklı landing sayfaları ve Google Business Profile optimizasyonunu içeren Local SEO kurgusu."
                                        ) %>
                                    </p>

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Execution","Uygulama") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "NAP consistency fixes, structured data implementation, and review generation workflow.",
                                            "NAP tutarlılığı düzeltmeleri, structured data implementasyonu ve review toplama akışı."
                                        ) %>
                                    </p>

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Outcome","Sonuç") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "Stronger local positioning and increased high-intent inquiries.",
                                            "Daha güçlü yerel konumlanma ve yüksek niyetli taleplerde artış."
                                        ) %>
                                    </p>

                                </div>
                            </div>
                        </div>

                        <!-- Case 04 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#collapseFour"
                                    aria-expanded="false"
                                    aria-controls="collapseFour">
                                    <span>2023. </span>
                                    <%: ((primeonx_global.SiteMaster)Master).T(
                                        "B2B Company – Lead Generation System Build",
                                        "B2B Şirket – Lead Generation Sistem Kurulumu"
                                    ) %>
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                <div class="accordion-body">

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Challenge","Zorluk") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "No structured lead funnel and poor tracking visibility.",
                                            "Yapılandırılmış lead funnel yok ve tracking görünürlüğü zayıf."
                                        ) %>
                                    </p>

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Strategy","Strateji") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "Funnel design, SEO landing pages, and marketing automation setup.",
                                            "Funnel tasarımı, SEO landing sayfaları ve pazarlama otomasyonu kurulumu."
                                        ) %>
                                    </p>

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Execution","Uygulama") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "CRM integration, event tracking, and conversion-focused content structure.",
                                            "CRM entegrasyonu, event tracking ve dönüşüm odaklı içerik kurgusu."
                                        ) %>
                                    </p>

                                    <p class="disc"><strong><%: ((primeonx_global.SiteMaster)Master).T("Outcome","Sonuç") %>:</strong><br>
                                        <%: ((primeonx_global.SiteMaster)Master).T(
                                            "More predictable lead flow and measurable performance tracking.",
                                            "Daha öngörülebilir lead akışı ve ölçülebilir performans takibi."
                                        ) %>
                                    </p>

                                </div>
                            </div>
                        </div>

                    </div><!-- accordion -->

                </div>
            </div>
        </div>
    </div>
</div>
<!-- rts case studies area end -->

</asp:Content>