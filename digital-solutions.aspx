<%@ Page Title="Digital Solutions | Primeonx" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="digital-solutions.aspx.cs" Inherits="primeonx_global.digital_solutions" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <asp:Literal ID="litHreflang" runat="server" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="rts-about-breadcrumb-cyber rts-section-gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="about-cyber-security-wrapper">
                        <span class="pre"><%: T("Digital Solutions","Dijital Çözümler") %></span>

                        <h1 class="title"><%: T(
                            "Digital Systems Built for Performance, SEO, and Scale",
                            "Performans, SEO ve Ölçek için Dijital Sistemler"
                        ) %></h1>

                        <p class="disc">
                            <%: T(
                                "Primeonx delivers modern digital solutions—high-performance websites, automation platforms, and scalable internal systems. We engineer clean architecture with measurable outcomes: faster load times, stronger search visibility, higher conversions, and reduced operational friction.",
                                "Primeonx modern dijital çözümler sunar: yüksek performanslı web siteleri, otomasyon platformları ve ölçeklenebilir iç sistemler. Ölçülebilir sonuçlar için temiz mimari kurarız: daha hızlı yükleme, daha güçlü görünürlük, daha yüksek dönüşüm, daha az operasyon yükü."
                            ) %>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="awards-area-inner rts-section-gapBottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="award-area-inner-page">
                        <h2 class="title"><%: T(
                            "Trusted Standards, <br> Modern Delivery",
                            "Güvenilir Standartlar, <br> Modern Teslimat"
                        ) %></h2>

                        <div class="row g-5 mt--20">
                            <div class="col-lg-20 col-md-4 col-sm-6 col-6"><div class="single-awards"><img src="<%: ResolveUrl("~/assets/images/award/11.webp") %>" alt="engineering standards"></div></div>
                            <div class="col-lg-20 col-md-4 col-sm-6 col-6"><div class="single-awards"><img src="<%: ResolveUrl("~/assets/images/award/02.webp") %>" alt="performance optimization"></div></div>
                            <div class="col-lg-20 col-md-4 col-sm-6 col-6"><div class="single-awards"><img src="<%: ResolveUrl("~/assets/images/award/03.webp") %>" alt="technical SEO"></div></div>
                            <div class="col-lg-20 col-md-4 col-sm-6 col-6"><div class="single-awards"><img src="<%: ResolveUrl("~/assets/images/award/04.webp") %>" alt="secure delivery"></div></div>
                            <div class="col-lg-20 col-md-4 col-sm-6 col-6"><div class="single-awards"><img src="<%: ResolveUrl("~/assets/images/award/05.webp") %>" alt="automation systems"></div></div>
                            <div class="col-lg-20 col-md-4 col-sm-6 col-6"><div class="single-awards"><img src="<%: ResolveUrl("~/assets/images/award/06.webp") %>" alt="quality assurance"></div></div>
                            <div class="col-lg-20 col-md-4 col-sm-6 col-6"><div class="single-awards"><img src="<%: ResolveUrl("~/assets/images/award/07.webp") %>" alt="scalable architecture"></div></div>
                            <div class="col-lg-20 col-md-4 col-sm-6 col-6"><div class="single-awards"><img src="<%: ResolveUrl("~/assets/images/award/08.webp") %>" alt="integration readiness"></div></div>
                            <div class="col-lg-20 col-md-4 col-sm-6 col-6"><div class="single-awards"><img src="<%: ResolveUrl("~/assets/images/award/09.webp") %>" alt="analytics and measurement"></div></div>
                            <div class="col-lg-20 col-md-4 col-sm-6 col-6"><div class="single-awards"><img src="<%: ResolveUrl("~/assets/images/award/10.webp") %>" alt="documentation and handover"></div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="rts-testimonials-style-three rts-section-gap">
        <div class="container pb--50">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-center-wrapper">
                        <span class="pre"><%: T("Client Voices","Müşteri Görüşleri") %></span>
                        <h2 class="title rts-text-anime-style-1"><%: T("What teams value most","Ekiplerin en çok değer verdiği") %></h2>
                    </div>
                </div>

                <div class="col-lg-12 pt--60">
                    <div class="testimominas-single-wrapper-three">
                        <div class="swiper mySwiper-testimonials-three">
                            <div class="swiper-wrapper">

                                <div class="swiper-slide">
                                    <div class="single-testimonails-three">
                                        <div class="left-thumbnmail">
                                            <img src="<%: ResolveUrl("~/assets/images/testimonials/06.webp") %>" alt="testimonial">
                                            <div class="small-image"><img src="<%: ResolveUrl("~/assets/images/testimonials/07.webp") %>" alt="testimonial"></div>
                                        </div>
                                        <div class="right-content">
                                            <div class="top">
                                                <div class="brand"><img src="<%: ResolveUrl("~/assets/images/testimonials/08.webp") %>" alt="testimonial"></div>
                                                <div class="content">
                                                    <p class="disc"><%: T(
                                                        "Primeonx delivered a performance-first website with a clear SEO structure. The roadmap was precise, communication was direct, and the launch was smooth.",
                                                        "Primeonx performans odaklı, SEO yapısı net bir site teslim etti. Roadmap netti, iletişim direkt, launch sorunsuzdu."
                                                    ) %></p>
                                                </div>
                                            </div>
                                            <div class="bottom">
                                                <h5 class="title"><%: T("Founder","Kurucu") %></h5>
                                                <span><%: T("B2B Product","B2B Ürün") %></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="swiper-slide">
                                    <div class="single-testimonails-three">
                                        <div class="left-thumbnmail">
                                            <img src="<%: ResolveUrl("~/assets/images/testimonials/06.webp") %>" alt="testimonial">
                                            <div class="small-image"><img src="<%: ResolveUrl("~/assets/images/testimonials/07.webp") %>" alt="testimonial"></div>
                                        </div>
                                        <div class="right-content">
                                            <div class="top">
                                                <div class="brand"><img src="<%: ResolveUrl("~/assets/images/testimonials/08.webp") %>" alt="testimonial"></div>
                                                <div class="content">
                                                    <p class="disc"><%: T(
                                                        "We reduced manual operational work through automation and integrations. The solution was clean, secure, and documented for long-term ownership.",
                                                        "Otomasyon ve entegrasyonlarla manuel operasyon yükünü azalttık. Çözüm temiz, güvenli ve uzun vadeli sahiplik için dokümanteydi."
                                                    ) %></p>
                                                </div>
                                            </div>
                                            <div class="bottom">
                                                <h5 class="title"><%: T("Operations Lead","Operasyon Sorumlusu") %></h5>
                                                <span><%: T("Internal Systems","İç Sistemler") %></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="swiper-slide">
                                    <div class="single-testimonails-three">
                                        <div class="left-thumbnmail">
                                            <img src="<%: ResolveUrl("~/assets/images/testimonials/06.webp") %>" alt="testimonial">
                                            <div class="small-image"><img src="<%: ResolveUrl("~/assets/images/testimonials/07.webp") %>" alt="testimonial"></div>
                                        </div>
                                        <div class="right-content">
                                            <div class="top">
                                                <div class="brand"><img src="<%: ResolveUrl("~/assets/images/testimonials/08.webp") %>" alt="testimonial"></div>
                                                <div class="content">
                                                    <p class="disc"><%: T(
                                                        "Strong engineering standards from day one—architecture, QA, and measurable outcomes. It finally feels like we have a scalable digital foundation.",
                                                        "İlk günden güçlü mühendislik standartları—mimari, QA ve ölçülebilir sonuçlar. Artık ölçeklenebilir bir dijital temelimiz var."
                                                    ) %></p>
                                                </div>
                                            </div>
                                            <div class="bottom">
                                                <h5 class="title"><%: T("Product Manager","Ürün Yöneticisi") %></h5>
                                                <span><%: T("Growth & Platform","Growth & Platform") %></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="swiper-button-next"><i class="fa-solid fa-chevron-right"></i></div>
                            <div class="swiper-button-prev"><i class="fa-solid fa-chevron-left"></i></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="rts-call-to-action-area rts-section-gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="call-to-action-wrapper-three">
                        <h3 class="title rts-text-anime-style-1"><%: T(
                            "Ready to build a system that performs?",
                            "Performanslı bir sistem kurmaya hazır mısın?"
                        ) %></h3>

                        <p class="disc"><%: T(
                            "Share your goals and current setup. We’ll respond with a clear execution plan—website, automation, or a full platform build.",
                            "Hedeflerini ve mevcut yapını paylaş. Net bir planla döneceğiz—web, otomasyon veya tam platform."
                        ) %></p>

                        <a href="<%= ResolveUrl(((primeonx_global.SiteMaster)Master != null) ? ((primeonx_global.SiteMaster)Master).L("contact") : "/contact") %>" class="rts-btn btn-primary">
                            <%: T("Request a Consultation","Danışmanlık Talep Et") %>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>