<%@ Page Title="Primeonx | Growth Systems for Modern Brands" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="primeonx_global._Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <%-- Home için ekstra head gerekiyorsa buraya eklersin. Hreflang master'dan geliyor. --%>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- rts banner area start -->
    <div class="rts-banner-data-science rts-section-gap bg_image">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 order-change-2">
                    <div class="banner-content-left-data-science">

                        <span class="pre"><%: T("Growth, SEO & Marketing Automation", "Büyüme, SEO ve Pazarlama Otomasyonu") %></span>

                        <h1 class="title rts-text-anime-style-1">
                            <%: T("SEO + Automation","SEO + Otomasyon") %> <br>
                            <%: T("Systems for","Sistemleri") %> <br>
                            <span>Primeonx</span>
                            <span><img src="<%: ResolveUrl("~/assets/images/banner/29.webp") %>" alt=""></span>
                        </h1>

                        <p class="disc">
                            <%: T(
                                "We build growth systems that attract qualified traffic, convert visitors into leads, and turn marketing into a measurable engine. From SEO architecture to conversion-focused pages and automation—Primeonx executes end-to-end.",
                                "Nitelikli trafik çeken, ziyaretçileri lead’e dönüştüren ve pazarlamayı ölçülebilir bir motora çeviren büyüme sistemleri kuruyoruz. SEO mimarisinden dönüşüm odaklı sayfalara ve otomasyona kadar—Primeonx uçtan uca uygular."
                            ) %>
                        </p>

                        <div class="button-wrapper">
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("services") %>" class="rts-btn btn-primary with-arrow">
                                <%: T("Explore Services","Hizmetleri İncele") %>
                                <i class="fa-regular fa-arrow-up up-right"></i>
                            </a>

                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("contact") %>" class="rts-btn btn-border btn-primary with-arrow">
                                <%: T("Get a Proposal","Teklif Al") %>
                                <i class="fa-regular fa-arrow-up up-right"></i>
                            </a>
                        </div>

                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="thumbnail-banner-right-data">
                        <div class="thumbnail">
                            <img src="<%: ResolveUrl("~/assets/images/banner/28.webp") %>" alt="">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- rts banner area end -->

    <section id="home" class="rts-banner-marketing-automation">
        <div class="bg-banner-bottom-marquree-content">
            <div class="row">
                <div class="col-lg-12">
                    <div class="marquree-main-wrapper-1">
                        <div class="single-marquree">

                            <div class="single-item"><span><%: T("SEO Strategy","SEO Stratejisi") %></span></div>
                            <div class="single-item"><img src="<%: ResolveUrl("~/assets/images/banner/star.svg") %>" alt=""></div>

                            <div class="single-item"><span><%: T("Lead Generation","Lead Üretimi") %></span></div>
                            <div class="single-item"><img src="<%: ResolveUrl("~/assets/images/banner/star.svg") %>" alt=""></div>

                            <div class="single-item"><span><%: T("Conversion Optimization","Dönüşüm Optimizasyonu") %></span></div>
                            <div class="single-item"><img src="<%: ResolveUrl("~/assets/images/banner/star.svg") %>" alt=""></div>

                            <div class="single-item"><span><%: T("Marketing Automation","Pazarlama Otomasyonu") %></span></div>
                            <div class="single-item"><img src="<%: ResolveUrl("~/assets/images/banner/star.svg") %>" alt=""></div>

                            <div class="single-item"><span><%: T("CRM Integration","CRM Entegrasyonu") %></span></div>
                            <div class="single-item"><img src="<%: ResolveUrl("~/assets/images/banner/star.svg") %>" alt=""></div>

                            <div class="single-item"><span><%: T("Analytics & Tracking","Analitik ve Takip") %></span></div>
                            <div class="single-item"><img src="<%: ResolveUrl("~/assets/images/banner/star.svg") %>" alt=""></div>

                            <div class="single-item"><span><%: T("Content Systems","İçerik Sistemleri") %></span></div>
                            <div class="single-item"><img src="<%: ResolveUrl("~/assets/images/banner/star.svg") %>" alt=""></div>

                            <!-- repeat for smooth marquee -->
                            <div class="single-item"><span><%: T("SEO Strategy","SEO Stratejisi") %></span></div>
                            <div class="single-item"><img src="<%: ResolveUrl("~/assets/images/banner/star.svg") %>" alt=""></div>

                            <div class="single-item"><span><%: T("Lead Generation","Lead Üretimi") %></span></div>
                            <div class="single-item"><img src="<%: ResolveUrl("~/assets/images/banner/star.svg") %>" alt=""></div>

                            <div class="single-item"><span><%: T("Conversion Optimization","Dönüşüm Optimizasyonu") %></span></div>
                            <div class="single-item"><img src="<%: ResolveUrl("~/assets/images/banner/star.svg") %>" alt=""></div>

                            <div class="single-item"><span><%: T("Marketing Automation","Pazarlama Otomasyonu") %></span></div>
                            <div class="single-item"><img src="<%: ResolveUrl("~/assets/images/banner/star.svg") %>" alt=""></div>

                            <div class="single-item"><span><%: T("CRM Integration","CRM Entegrasyonu") %></span></div>
                            <div class="single-item"><img src="<%: ResolveUrl("~/assets/images/banner/star.svg") %>" alt=""></div>

                            <div class="single-item"><span><%: T("Analytics & Tracking","Analitik ve Takip") %></span></div>
                            <div class="single-item"><img src="<%: ResolveUrl("~/assets/images/banner/star.svg") %>" alt=""></div>

                            <div class="single-item"><span><%: T("Content Systems","İçerik Sistemleri") %></span></div>
                            <div class="single-item"><img src="<%: ResolveUrl("~/assets/images/banner/star.svg") %>" alt=""></div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- rts feature area start -->
    <div class="rts-feature-area-three rts-section-gap">
        <div class="container">
            <div class="row g-5">

                <div class="col-xl-6 col-lg-8">
                    <div class="feature-area-left-three">
                        <div class="title-left-wrapper">
                            <span class="pre"><%: T("Services","Hizmetler") %></span>
                            <h2 class="title rts-text-anime-style-1">
                                <%: T("Systems That Drive","Büyümeyi Tetikleyen Sistemler") %> <br>
                                <%: T("Predictable Growth","Öngörülebilir Büyüme") %>
                            </h2>
                        </div>
                        <a href="<%: ((primeonx_global.SiteMaster)Master).L("services") %>" class="btn-line">
                            <span><%: T("View All Services","Tüm Hizmetleri Gör") %></span>
                            <i class="fa-solid fa-chevron-right"></i>
                        </a>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
                    <div class="single-feature-area-three data-science">
                        <div class="icon">
                            <img src="<%: ResolveUrl("~/assets/images/feature/09.svg") %>" alt="">
                        </div>
                        <div class="content">
                            <h3 class="title"><%: T("SEO Architecture","SEO Mimarisi") %></h3>
                            <p class="disc"><%: T("Technical SEO, intent-based structure, and scalable content planning.","Teknik SEO, niyet odaklı yapı ve ölçeklenebilir içerik planlaması.") %></p>
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("services/seo-web") %>" class="round-btn">
                                <%: T("Learn More","Detay") %>
                                <i class="fa-sharp-duotone fa-light fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
                    <div class="single-feature-area-three data-science">
                        <div class="icon">
                            <img src="<%: ResolveUrl("~/assets/images/feature/10.svg") %>" alt="">
                        </div>
                        <div class="content">
                            <h3 class="title"><%: T("Conversion Systems","Dönüşüm Sistemleri") %></h3>
                            <p class="disc"><%: T("Landing pages, UX improvements, and conversion rate optimization.","Landing page’ler, UX iyileştirmeleri ve dönüşüm oranı optimizasyonu.") %></p>
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("services/conversion-optimization") %>" class="round-btn">
                                <%: T("Learn More","Detay") %>
                                <i class="fa-sharp-duotone fa-light fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
                    <div class="single-feature-area-three data-science">
                        <div class="icon">
                            <img src="<%: ResolveUrl("~/assets/images/feature/11.svg") %>" alt="">
                        </div>
                        <div class="content">
                            <h3 class="title"><%: T("Marketing Automation","Pazarlama Otomasyonu") %></h3>
                            <p class="disc"><%: T("Email flows, lead routing, CRM integrations, and automation playbooks.","E-posta akışları, lead yönlendirme, CRM entegrasyonları ve otomasyon kurguları.") %></p>
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("services/marketing-automation") %>" class="round-btn">
                                <%: T("Learn More","Detay") %>
                                <i class="fa-sharp-duotone fa-light fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
                    <div class="single-feature-area-three data-science">
                        <div class="icon">
                            <img src="<%: ResolveUrl("~/assets/images/feature/12.svg") %>" alt="">
                        </div>
                        <div class="content">
                            <h3 class="title"><%: T("Analytics & Tracking","Analitik ve Takip") %></h3>
                            <p class="disc"><%: T("GA4, event tracking, dashboards, and performance measurement setup.","GA4, event takibi, dashboard’lar ve performans ölçüm kurulumu.") %></p>
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("services/analytics-tracking") %>" class="round-btn">
                                <%: T("Learn More","Detay") %>
                                <i class="fa-sharp-duotone fa-light fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
                    <div class="single-feature-area-three data-science">
                        <div class="icon">
                            <img src="<%: ResolveUrl("~/assets/images/feature/13.svg") %>" alt="">
                        </div>
                        <div class="content">
                            <h3 class="title"><%: T("Content Engine","İçerik Motoru") %></h3>
                            <p class="disc"><%: T("Content that ranks, converts, and supports long-term authority building.","Sıralama alan, dönüştüren ve uzun vadeli otoriteyi destekleyen içerik.") %></p>
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("services/content-seo") %>" class="round-btn">
                                <%: T("Learn More","Detay") %>
                                <i class="fa-sharp-duotone fa-light fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
                    <div class="single-feature-area-three data-science">
                        <div class="icon">
                            <img src="<%: ResolveUrl("~/assets/images/feature/14.svg") %>" alt="">
                        </div>
                        <div class="content">
                            <h3 class="title"><%: T("Web Experience","Web Deneyimi") %></h3>
                            <p class="disc"><%: T("Fast, modern websites optimized for performance and lead generation.","Performans ve lead üretimi için optimize edilmiş hızlı, modern web siteleri.") %></p>
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("services/web-development") %>" class="round-btn">
                                <%: T("Learn More","Detay") %>
                                <i class="fa-sharp-duotone fa-light fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- rts feature area end -->

    <div class="rts-feature-area rts-section-gapBottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="rts-feature-main-wrapper-data">

                        <div class="row g-5 align-items-center rts-section-gapBottom">
                            <div class="col-lg-6">
                                <div class="single-feature-data-thumbnail">
                                    <img src="<%: ResolveUrl("~/assets/images/feature/06.webp") %>" alt="feature">
                                </div>
                            </div>
                            <div class="col-lg-6 pl--70 pl_lg--20 plr_md--10 plr_sm--10">
                                <div class="feature-right-content-inner">
                                    <div class="title-left-wrapper">
                                        <span class="pre"><%: T("How We Work","Nasıl Çalışıyoruz") %></span>
                                        <h2 class="title rts-text-anime-style-1">
                                            <%: T("Strategy → Execution","Strateji → Uygulama") %> <br>
                                            <%: T("→ Measurement","→ Ölçüm") %>
                                        </h2>
                                    </div>

                                    <p class="disc">
                                        <%: T(
                                            "We don’t guess. We build a plan, execute fast, and track outcomes with clear KPIs—so growth becomes predictable.",
                                            "Tahmin etmiyoruz. Bir plan kuruyor, hızlı uyguluyor ve net KPI’larla sonuçları takip ediyoruz—böylece büyüme öngörülebilir hale geliyor."
                                        ) %>
                                    </p>

                                    <div class="feature-wrapper-list">
                                        <div class="single-feature">
                                            <div class="icon">
                                                <img src="<%: ResolveUrl("~/assets/images/feature/07.svg") %>" alt="feature">
                                            </div>
                                            <div class="content">
                                                <h5 class="title"><%: T("Blueprint & Roadmap","Plan & Yol Haritası") %></h5>
                                                <p><%: T("Audit, priorities, and a clear execution plan.","Denetim, öncelikler ve net bir uygulama planı.") %></p>
                                            </div>
                                        </div>

                                        <div class="single-feature">
                                            <div class="icon">
                                                <img src="<%: ResolveUrl("~/assets/images/feature/08.svg") %>" alt="feature">
                                            </div>
                                            <div class="content">
                                                <h5 class="title"><%: T("Execution Sprints","Uygulama Sprintleri") %></h5>
                                                <p><%: T("Implement improvements weekly and iterate.","Haftalık iyileştirmeler uygular ve iterasyon yaparız.") %></p>
                                            </div>
                                        </div>
                                    </div>

                                    <a href="<%: ((primeonx_global.SiteMaster)Master).L("case-studies") %>" class="rts-btn btn-primary with-arrow">
                                        <%: T("See Case Studies","Vaka Çalışmalarını Gör") %>
                                        <i class="fa-regular fa-arrow-up up-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12"><hr></div>
                        </div>

                        <div class="row g-5 align-items-center rts-section-gapTop">
                            <div class="col-lg-6 pr--70 pr_lg--20 plr_md--10 plr_sm--10">
                                <div class="feature-right-content-inner">
                                    <div class="title-left-wrapper">
                                        <span class="pre"><%: T("What You Get","Ne Kazanırsınız") %></span>
                                        <h2 class="title rts-text-anime-style-1">
                                            <%: T("A Growth System","Bir Büyüme Sistemi") %> <br>
                                            <%: T("Not Just a Website","Sadece Bir Web Sitesi Değil") %>
                                        </h2>
                                    </div>

                                    <p class="disc">
                                        <%: T(
                                            "Primeonx builds a complete system: acquisition, conversion, retention, and tracking. You’ll know what’s working and where to scale.",
                                            "Primeonx uçtan uca bir sistem kurar: edinim, dönüşüm, elde tutma ve takip. Neyin işe yaradığını ve nerede ölçekleneceğini bilirsiniz."
                                        ) %>
                                    </p>

                                    <div class="feature-wrapper-list">
                                        <div class="single-feature">
                                            <div class="icon">
                                                <img src="<%: ResolveUrl("~/assets/images/feature/07.svg") %>" alt="feature">
                                            </div>
                                            <div class="content">
                                                <h5 class="title"><%: T("Tracking & Attribution","Takip ve Atıf") %></h5>
                                                <p><%: T("Events, funnels, and dashboards.","Event’ler, funnel’lar ve dashboard’lar.") %></p>
                                            </div>
                                        </div>

                                        <div class="single-feature">
                                            <div class="icon">
                                                <img src="<%: ResolveUrl("~/assets/images/feature/08.svg") %>" alt="feature">
                                            </div>
                                            <div class="content">
                                                <h5 class="title"><%: T("Automation & CRM","Otomasyon ve CRM") %></h5>
                                                <p><%: T("Lead routing, sequences, and workflows.","Lead yönlendirme, sekanslar ve iş akışları.") %></p>
                                            </div>
                                        </div>
                                    </div>

                                    <a href="<%: ((primeonx_global.SiteMaster)Master).L("services") %>" class="rts-btn btn-primary with-arrow">
                                        <%: T("Explore Services","Hizmetleri İncele") %>
                                        <i class="fa-regular fa-arrow-up up-right"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="single-feature-data-thumbnail">
                                    <img src="<%: ResolveUrl("~/assets/images/feature/07.webp") %>" alt="feature">
                                </div>
                            </div>
                        </div>

                    </div><!-- rts-feature-main-wrapper-data -->
                </div>
            </div>
        </div>
    </div>

    <!-- rts about area start -->
    <div class="rts-about-area rts-section-gap bg_light">
        <div class="container">
            <div class="row">

                <div class="col-xl-3 col-lg-3 col-md-7 col-sm-6 col-6">
                    <div class="cyber-security-about-left">
                        <img class="top" src="<%: ResolveUrl("~/assets/images/about/text-01.png") %>" alt="">
                        <div class="bottom-iamge">
                            <img src="<%: ResolveUrl("~/assets/images/about/13.webp") %>" alt="">
                            <div class="content">
                                <h3 class="title"><%: T("System","Sistem") %></h3>
                                <p><%: T("First Approach","Önce Sistem") %></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-6 col-lg-5 pl--50 pl_lg--20 pl_md--10 pl_sm--10 order-change-2">
                    <div class="about-cybar-mid">
                        <div class="title-area-between">
                            <div class="title-left-wrapper">
                                <span class="pre"><%: T("About Primeonx","Primeonx Hakkında") %></span>
                                <h2 class="title rts-text-anime-style-1">
                                    <%: T("We Build Growth","Büyüme İnşa Ediyoruz") %> <br>
                                    <%: T("That Compounds","Katlanarak Artan") %>
                                </h2>

                                <p class="disc">
                                    <%: T(
                                        "Primeonx helps businesses scale with SEO, performance-driven web experiences, and marketing automation. Our focus is simple: ship fast, track everything, and improve continuously.",
                                        "Primeonx; SEO, performans odaklı web deneyimleri ve pazarlama otomasyonu ile işletmelerin ölçeklenmesine yardımcı olur. Odağımız basit: hızlı teslim et, her şeyi takip et ve sürekli iyileştir."
                                    ) %>
                                </p>

                                <div class="button-wrapper">
                                    <a href="<%: ((primeonx_global.SiteMaster)Master).L("about") %>" class="rts-btn btn-primary with-arrow btn-white btn-border">
                                        <i class="fa-regular fa-arrow-up up-right"></i>
                                        <%: T("Learn More","Daha Fazla") %>
                                    </a>
                                    <img src="<%: ResolveUrl("~/assets/images/about/15.webp") %>" alt="">
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-5 col-sm-6 col-6">
                    <div class="thumbnail-right-about-cyber">
                        <img src="<%: ResolveUrl("~/assets/images/about/14.webp") %>" alt="">
                        <div class="content">
                            <h3 class="title">KPI</h3>
                            <p><%: T("Driven","Odaklı") %> <br> <%: T("Results","Sonuçlar") %></p>
                            <img src="<%: ResolveUrl("~/assets/images/about/02.svg") %>" alt="">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- rts about area end -->

<%--    <!-- rts contact area start -->
    <div class="rts-contact-area rts-section-gap">
        <div class="container">
            <div class="row">

                <div class="col-lg-6">
                    <div class="contact-area-left-wrapper-cyber">
                        <div class="title-left-wrapper">
                            <span class="pre"><%: T("Contact","İletişim") %></span>
                            <h2 class="title rts-text-anime-style-1">
                                <%: T("Let’s Build Your","Sizin İçin") %> <br>
                                <%: T("Growth System","Büyüme Sistemini Kuralım") %>
                            </h2>
                        </div>

                        <div class="single-contact-area">
                            <h5 class="title"><%: T("Email","E-posta") %></h5>
                            <span><%: T("Tell us about your business and goals.","İşinizi ve hedeflerinizi anlatın.") %></span>
                        </div>

                        <div class="single-contact-area">
                            <h5 class="title"><%: T("Response Time","Yanıt Süresi") %></h5>
                            <span><%: T("We typically reply within 24–48 hours.","Genelde 24–48 saat içinde yanıtlarız.") %></span>
                        </div>

                    </div>
                </div>

                <div class="col-lg-6">
                    <div action="#" class="cyber-secyrity-contact">
                        <h4 class="title"><%: T("Get in Touch","Bize Ulaşın") %></h4>

                        <div class="single-input-cyber">
                            <input type="text" placeholder="<%: T("First Name","Ad") %>">
                        </div>

                        <div class="single-input-cyber">
                            <input type="email" placeholder="<%: T("Email","E-posta") %>" required>
                        </div>

                        <div class="single-input-cyber">
                            <input type="text" placeholder="<%: T("Subject","Konu") %>">
                        </div>

                        <div class="single-input-cyber">
                            <textarea placeholder="<%: T("Your Message","Mesajınız") %>"></textarea>
                        </div>

                        <button class="rts-btn btn-primary"><%: T("Send a Message","Mesaj Gönder") %></button>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- rts contact area end -->--%>

    <!-- rts blog area start -->
    <div class="rts-blog-area rts-section-gap bg_light2">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="title-area-between">
                        <div class="title-left-wrapper">
                            <span class="pre"><%: T("Insights & Blog","İçgörüler ve Blog") %></span>
                            <h2 class="title rts-text-anime-style-1"><%: T("Insights & Resources","İçgörüler ve Kaynaklar") %></h2>
                        </div>

                        <div class="right-area">
                            <p class="disc">
                                <%: T(
                                    "SEO, conversion, automation, and growth systems—practical content for businesses that want to scale.",
                                    "SEO, dönüşüm, otomasyon ve büyüme sistemleri—ölçeklenmek isteyen işletmeler için pratik içerikler."
                                ) %>
                            </p>

                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("blog") %>" class="btn-line">
                                <span><%: T("View All Articles","Tüm Yazıları Gör") %></span>
                                <i class="fa-solid fa-chevron-right"></i>
                            </a>
                        </div>

                    </div>
                </div>
            </div>

            <div class="row g-5 mt--30">

                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single-blog-style-one in-cyber-security br-8">
                        <a href="<%: ((primeonx_global.SiteMaster)Master).L("blog/seo-architecture") %>" class="thumbnail-blog br-10">
                            <img src="<%: ResolveUrl("~/assets/images/blog/10.webp") %>" alt="blog">
                        </a>
                        <div class="inner-content-blog">
                            <span>SEO</span>
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("blog/seo-architecture") %>">
                                <h5 class="title"><%: T("SEO Architecture: How to Structure Pages That Rank","SEO Mimarisi: Sıralama Alan Sayfa Yapısı Nasıl Kurulur?") %></h5>
                            </a>
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("blog/seo-architecture") %>" class="btn-line">
                                <span><%: T("Learn More","Detay") %></span>
                                <i class="fa-solid fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single-blog-style-one in-cyber-security br-8">
                        <a href="<%: ((primeonx_global.SiteMaster)Master).L("blog/conversion-systems") %>" class="thumbnail-blog br-10">
                            <img src="<%: ResolveUrl("~/assets/images/blog/11.webp") %>" alt="blog">
                        </a>
                        <div class="inner-content-blog">
                            <span><%: T("Conversion","Dönüşüm") %></span>
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("blog/conversion-systems") %>">
                                <h5 class="title"><%: T("Conversion Systems: Turning Traffic into Qualified Leads","Dönüşüm Sistemleri: Trafiği Nitelikli Lead’e Çevirmek") %></h5>
                            </a>
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("blog/conversion-systems") %>" class="btn-line">
                                <span><%: T("Learn More","Detay") %></span>
                                <i class="fa-solid fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single-blog-style-one in-cyber-security br-8">
                        <a href="<%: ((primeonx_global.SiteMaster)Master).L("blog/marketing-automation") %>" class="thumbnail-blog br-10">
                            <img src="<%: ResolveUrl("~/assets/images/blog/12.webp") %>" alt="blog">
                        </a>
                        <div class="inner-content-blog">
                            <span><%: T("Automation","Otomasyon") %></span>
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("blog/marketing-automation") %>">
                                <h5 class="title"><%: T("Marketing Automation: The Basics for Fast-Growing Teams","Pazarlama Otomasyonu: Hızla Büyüyen Ekipler İçin Temeller") %></h5>
                            </a>
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("blog/marketing-automation") %>" class="btn-line">
                                <span><%: T("Learn More","Detay") %></span>
                                <i class="fa-solid fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
    <!-- rts blog area end -->

    <!-- rts call to action area start -->
    <div class="rts-call-to-action-area rts-section-gapBottom demo-app-development">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="call-to-action-wrapper-three">
                        <h3 class="title rts-text-anime-style-1"><%: T("Book a Free Consulting","Ücretsiz Danışmanlık Al") %></h3>
                        <p class="disc"><%: T("Tell us what you’re building—we’ll map the fastest path to measurable growth.","Ne inşa ettiğini anlat—ölçülebilir büyümeye giden en hızlı yolu birlikte çıkaralım.") %></p>
                        <a href="<%: ((primeonx_global.SiteMaster)Master).L("contact") %>" class="rts-btn btn-primary with-arrow btn-white">
                            <%: T("Get Started","Başlayalım") %>
                            <i class="fa-regular fa-arrow-up up-right"></i>
                        </a>
                        <div class="round one"></div>
                        <div class="round two"></div>
                        <div class="round three"></div>
                        <div class="bg-shape one"><img src="<%: ResolveUrl("~/assets/images/cta/shape-01.svg") %>" alt=""></div>
                        <div class="bg-shape two"><img src="<%: ResolveUrl("~/assets/images/cta/shape-02.svg") %>" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- rts call to action area end -->

</asp:Content>