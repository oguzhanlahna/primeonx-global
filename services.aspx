<%@ Page Title="Services | Primeonx" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="services.aspx.cs" Inherits="primeonx_global.services" %> 

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <asp:Literal ID="litHreflang" runat="server" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- breadcrumb -->
    <div class="rts-about-breadcrumb-area" style="background-image: none;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="rts-about-breadcrumb-content">
                        <ul>
                            <li><a href="<%: ((primeonx_global.SiteMaster)Master).L("") %>"><%: T("Home","Ana Sayfa") %></a></li>
                            <li><i class="fa fa-chevron-right"></i></li>
                            <li class="active"><a href="<%: ServicesListUrl() %>"><%: T("Services","Hizmetler") %></a></li>
                        </ul>
                        <h1 class="title rts-text-anime-style-1"><%: T("What We Do Best","En İyi Yaptığımız Şey") %></h1>
                        <p class="disc mt--15" style="max-width: 640px;">
                            <%: T("Practical services that build trust: performance, clarity, and predictable delivery.",
                                  "Güven inşa eden pratik hizmetler: performans, netlik ve öngörülebilir teslimat.") %>
                        </p>
                    </div>
                </div>
                <div class="col-lg-6 pl--50 pl_md--10 pl_sm--10">
                    <div class="rts-about-breadcrumb-image">
                        <img src="<%: ResolveUrl("~/assets/images/about/05.webp") %>" alt="Primeonx Services">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- services list -->
    <div class="rts-service-area rts-section-gap bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-area-between">
                        <div class="title-left-wrapper">
                            <span class="pre"><%: T("Our Services","Hizmetlerimiz") %></span>
                            <h2 class="title rts-text-anime-style-1"><%: T("Services","Hizmetler") %></h2>
                        </div>
                        <div class="right-area">
                            <a href="<%: ((primeonx_global.SiteMaster)Master).L("contact") %>" class="btn-line">
                                <span><%: T("Talk to Us","İletişime Geç") %></span><i class="fa-solid fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12 mt--40">

                    <asp:Repeater ID="rptServices" runat="server" OnItemDataBound="rptServices_ItemDataBound">
                        <ItemTemplate>
                            <div class="single-digital-agency-wrapper-service">
                                <div class="left-area">
                                    <div class="thumbnail-image">
                                        <figure>
                                            <img src="<%# SafeImageUrl(Eval("ListImageUrl")) %>"
                                                 alt="<%# HtmlAttrEncode(Eval("Title")) %>">
                                        </figure>
                                    </div>
                                    <div class="title-area-start">
                                        <span><%# Eval("SortOrder") %></span>
                                        <a href="<%# ServiceUrl(Eval("Slug")) %>">
                                            <h5 class="title"><%# Eval("Title") %></h5>
                                        </a>
                                    </div>
                                </div>

                                <div class="right-area">
                                    <div class="details-area">
                                        <p class="disc"><%# Eval("ShortDescription") %></p>

                                        <div class="tag-wrappers">
                                            <asp:Repeater ID="rptTags" runat="server">
                                                <ItemTemplate>
                                                    <span class="single-tags"><%# Container.DataItem %></span>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>

                                    <div class="arrow-btn-area">
                                        <a href="<%# ServiceUrl(Eval("Slug")) %>" class="round-btn">
                                            <i class="fa-sharp-duotone fa-light fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </div>
    </div>

    <!-- CTA -->
    <div class="rts-call-to-action-area rts-section-gap demo-app-development">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="call-to-action-wrapper-three">
                        <h3 class="title rts-text-anime-style-1"><%: T("Book a Free Consultation","Ücretsiz Danışmanlık") %></h3>
                        <p class="disc"><%: T("Get a clear plan: scope, priorities, and what it takes to launch.",
                                             "Net bir plan alın: kapsam, öncelikler ve yayına almak için gerekenler.") %></p>
                        <a href="<%: ((primeonx_global.SiteMaster)Master).L("contact") %>" class="rts-btn btn-primary with-arrow btn-white">
                            <%: T("Request a Call","Görüşme Talep Et") %> <i class="fa-regular fa-arrow-up up-right"></i>
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