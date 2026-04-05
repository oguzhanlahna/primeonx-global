<%@ Page Title="Projects | Primeonx" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="projects.aspx.cs" Inherits="primeonx_global.projects" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- breadcrumb / hero -->
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
                            <li><a href="#" class="active"><%: T("Projects","Projeler") %></a></li>
                        </ul>

                        <h1 class="title rts-text-anime-style-1"><%: T("Projects","Projeler") %></h1>

                        <p class="disc mt--20" style="max-width: 760px;">
                            <%: T(
                                "A small selection of projects and build concepts we’ve shipped—focused on SEO foundations, conversion-led UX, and measurable growth.",
                                "Teslim ettiğimiz işlerden kısa bir seçki—SEO temeli, dönüşüm odaklı UX ve ölçülebilir büyümeye odaklanır."
                            ) %>
                        </p>

                        <!-- quick capability chips -->
                        <div class="d-flex flex-wrap justify-content-center gap-2 mt--25">
                            <span class="rts-btn btn-border btn-primary" style="padding: 8px 14px; pointer-events:none;">
                                <%: T("SEO Architecture","SEO Mimarisi") %>
                            </span>
                            <span class="rts-btn btn-border btn-primary" style="padding: 8px 14px; pointer-events:none;">
                                <%: T("Landing Pages","Landing Page’ler") %>
                            </span>
                            <span class="rts-btn btn-border btn-primary" style="padding: 8px 14px; pointer-events:none;">
                                <%: T("Analytics / GA4","Analitik / GA4") %>
                            </span>
                            <span class="rts-btn btn-border btn-primary" style="padding: 8px 14px; pointer-events:none;">
                                <%: T("Automation","Otomasyon") %>
                            </span>
                            <span class="rts-btn btn-border btn-primary" style="padding: 8px 14px; pointer-events:none;">
                                <%: T("Performance","Performans") %>
                            </span>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb / hero end -->


    <!-- projects grid -->
    <div class="rts-blog-area rts-section-gap bg_light2">
        <div class="container">

            <div class="row align-items-end">
                <div class="col-lg-8">
                    <div class="title-left-wrapper">
                        <span class="pre"><%: T("Selected Work","Seçili Çalışmalar") %></span>
                        <h2 class="title rts-text-anime-style-1"><%: T("Systems we’ve built for growth","Büyüme için kurduğumuz sistemler") %></h2>
                        <p class="disc" style="max-width: 720px;">
                            <%: T(
                                "No long case-study pages here—just a clear snapshot of what we delivered and the outcomes we optimized for.",
                                "Uzun vaka çalışmaları yok—yalnızca teslim edilen işin ve optimize ettiğimiz çıktının net bir özeti."
                            ) %>
                        </p>
                    </div>
                </div>

                <div class="col-lg-4 mt_md--30 mt_sm--30">
                    <div class="d-flex justify-content-lg-end gap-2 flex-wrap">
                        <span class="rts-btn btn-border btn-primary" style="padding: 8px 14px; pointer-events:none;">
                            <%: T("Web + SEO","Web + SEO") %>
                        </span>
                        <span class="rts-btn btn-border btn-primary" style="padding: 8px 14px; pointer-events:none;">
                            <%: T("CRO","CRO") %>
                        </span>
                        <span class="rts-btn btn-border btn-primary" style="padding: 8px 14px; pointer-events:none;">
                            <%: T("Tracking","Takip") %>
                        </span>
                    </div>
                </div>
            </div>

            <div class="row g-5 mt--30">

                <!-- Project 1 -->
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single-blog-style-one in-cyber-security br-8" style="height:100%;">
                        <div class="thumbnail-blog br-10">
                            <img src="<%: ResolveUrl("~/assets/images/project/33.webp") %>" alt="Project - SEO Foundation Build">
                        </div>
                        <div class="inner-content-blog">
                            <span><%: T("SEO + Web","SEO + Web") %></span>
                            <h5 class="title"><%: T("SEO Foundation Build for a Local Service Brand","Yerel bir hizmet markası için SEO temel kurulumu") %></h5>
                            <p class="disc" style="margin-top: 10px;">
                                <%: T(
                                    "Clean information architecture, technical SEO fixes, and conversion-focused service pages built to scale.",
                                    "Temiz bilgi mimarisi, teknik SEO düzeltmeleri ve ölçeklenebilir dönüşüm odaklı hizmet sayfaları."
                                ) %>
                            </p>
                            <div class="d-flex flex-wrap gap-2 mt--20">
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;">IA</span>
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;"><%: T("On-page","On-page") %></span>
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;"><%: T("Speed","Hız") %></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Project 2 -->
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single-blog-style-one in-cyber-security br-8" style="height:100%;">
                        <div class="thumbnail-blog br-10">
                            <img src="<%: ResolveUrl("~/assets/images/project/34.webp") %>" alt="Project - Lead Gen Landing Pages">
                        </div>
                        <div class="inner-content-blog">
                            <span>CRO</span>
                            <h5 class="title"><%: T("Lead-Gen Landing Pages & Funnel Cleanup","Lead odaklı landing page’ler ve funnel düzeni") %></h5>
                            <p class="disc" style="margin-top: 10px;">
                                <%: T(
                                    "Page redesigns, stronger messaging hierarchy, and forms that increase qualified inquiries—without extra ad spend.",
                                    "Sayfa yeniden tasarımı, daha güçlü mesaj hiyerarşisi ve ekstra reklam harcaması olmadan nitelikli başvuruyu artıran formlar."
                                ) %>
                            </p>
                            <div class="d-flex flex-wrap gap-2 mt--20">
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;"><%: T("Landing","Landing") %></span>
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;">UX</span>
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;"><%: T("Forms","Formlar") %></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Project 3 -->
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single-blog-style-one in-cyber-security br-8" style="height:100%;">
                        <div class="thumbnail-blog br-10">
                            <img src="<%: ResolveUrl("~/assets/images/project/35.webp") %>" alt="Project - Tracking & Analytics">
                        </div>
                        <div class="inner-content-blog">
                            <span><%: T("Tracking","Takip") %></span>
                            <h5 class="title"><%: T("GA4 + Event Tracking + Attribution Setup","GA4 + Event takibi + atıf kurulumu") %></h5>
                            <p class="disc" style="margin-top: 10px;">
                                <%: T(
                                    "Structured events, funnels, and reporting to understand what drives leads—and where to scale confidently.",
                                    "Lead getiren kaynakları görmek ve güvenle ölçeklemek için event yapısı, funnel’lar ve raporlama."
                                ) %>
                            </p>
                            <div class="d-flex flex-wrap gap-2 mt--20">
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;">GA4</span>
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;"><%: T("Events","Event’ler") %></span>
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;"><%: T("Funnels","Funnel’lar") %></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Project 4 (image fallback: 22 -> 33) -->
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single-blog-style-one in-cyber-security br-8" style="height:100%;">
                        <div class="thumbnail-blog br-10">
                            <img src="<%: ResolveUrl("~/assets/images/project/22.webp") %>" alt="Project - Content System"
                                 onerror="this.onerror=null;this.src='<%= ResolveUrl("~/assets/images/project/33.webp") %>';">
                        </div>
                        <div class="inner-content-blog">
                            <span><%: T("Content","İçerik") %></span>
                            <h5 class="title"><%: T("Scalable Content System for Long-Term Rankings","Uzun vadeli sıralamalar için ölçeklenebilir içerik sistemi") %></h5>
                            <p class="disc" style="margin-top: 10px;">
                                <%: T(
                                    "Topic clusters, internal linking logic, and templates designed to publish fast and rank consistently.",
                                    "Topic cluster yapısı, internal link mantığı ve hızlı yayın için şablonlar."
                                ) %>
                            </p>
                            <div class="d-flex flex-wrap gap-2 mt--20">
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;"><%: T("Clusters","Cluster’lar") %></span>
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;"><%: T("Internal Links","İç Linkler") %></span>
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;"><%: T("Templates","Şablonlar") %></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Project 5 (image fallback: 23 -> 34) -->
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single-blog-style-one in-cyber-security br-8" style="height:100%;">
                        <div class="thumbnail-blog br-10">
                            <img src="<%: ResolveUrl("~/assets/images/project/23.webp") %>" alt="Project - Automation"
                                 onerror="this.onerror=null;this.src='<%= ResolveUrl("~/assets/images/project/34.webp") %>';">
                        </div>
                        <div class="inner-content-blog">
                            <span><%: T("Automation","Otomasyon") %></span>
                            <h5 class="title"><%: T("Lead Routing + Email Sequences Automation","Lead yönlendirme + e-posta sekans otomasyonu") %></h5>
                            <p class="disc" style="margin-top: 10px;">
                                <%: T(
                                    "Simple automations that reduce response time, qualify leads, and keep follow-ups consistent.",
                                    "Yanıt süresini azaltan, lead’i niteliklendiren ve takipleri standardize eden otomasyonlar."
                                ) %>
                            </p>
                            <div class="d-flex flex-wrap gap-2 mt--20">
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;">CRM</span>
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;">Email</span>
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;"><%: T("Workflows","İş Akışları") %></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Project 6 (image fallback: 24 -> 35) -->
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single-blog-style-one in-cyber-security br-8" style="height:100%;">
                        <div class="thumbnail-blog br-10">
                            <img src="<%: ResolveUrl("~/assets/images/project/24.webp") %>" alt="Project - Performance"
                                 onerror="this.onerror=null;this.src='<%= ResolveUrl("~/assets/images/project/35.webp") %>';">
                        </div>
                        <div class="inner-content-blog">
                            <span><%: T("Performance","Performans") %></span>
                            <h5 class="title"><%: T("Performance Optimization for Core Web Vitals","Core Web Vitals için performans optimizasyonu") %></h5>
                            <p class="disc" style="margin-top: 10px;">
                                <%: T(
                                    "Asset cleanup, lazy-loading strategy, and render optimizations to improve UX and search performance.",
                                    "Asset temizliği, lazy-load stratejisi ve render optimizasyonları ile UX ve arama performansı iyileştirmeleri."
                                ) %>
                            </p>
                            <div class="d-flex flex-wrap gap-2 mt--20">
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;">CWV</span>
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;"><%: T("Images","Görseller") %></span>
                                <span class="rts-btn btn-border btn-primary" style="padding:6px 10px; pointer-events:none;">JS</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
    <!-- projects grid end -->


    <!-- CTA -->
    <div class="rts-call-to-action-area rts-section-gapBottom demo-app-development">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="call-to-action-wrapper-three">
                        <h3 class="title rts-text-anime-style-1">
                            <%: T("Want a growth system like this?","Böyle bir büyüme sistemi ister misiniz?") %>
                        </h3>
                        <p class="disc" style="max-width: 760px; margin-left:auto; margin-right:auto;">
                            <%: T(
                                "Tell us your goals and your current setup. We’ll propose a clear roadmap: what to fix, what to build, and how we’ll measure results.",
                                "Hedeflerinizi ve mevcut yapınızı anlatın. Net bir yol haritası çıkaralım: neyi düzelteceğiz, neyi inşa edeceğiz ve sonuçları nasıl ölçeceğiz."
                            ) %>
                        </p>
                        <a href="<%: ((primeonx_global.SiteMaster)Master).L("contact") %>" class="rts-btn btn-primary with-arrow btn-white">
                            <%: T("Get Started","Başlayalım") %> <i class="fa-regular fa-arrow-up up-right"></i>
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

</asp:Content>