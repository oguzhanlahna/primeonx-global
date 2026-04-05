<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="service-details.aspx.cs" Inherits="primeonx_global.service_details" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <asp:Literal ID="litHreflang" runat="server" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- breadcrumb -->
    <div class="rts-service-details-breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-area">
                        <ul>
                            <li><a href="<%: ((primeonx_global.SiteMaster)Master).L("") %>"><%: T("Home","Ana Sayfa") %></a></li>
                            <li><i class="fa fa-chevron-right"></i></li>
                            <li><a href="<%: GetRouteUrl("ServicesList", null) %>"><%: T("Services","Hizmetler") %></a></li>
                            <li><i class="fa fa-chevron-right"></i></li>
                            <li><a href="#" class="active"><asp:Literal ID="litBreadcrumbTitle" runat="server" /></a></li>
                        </ul>
                        <h1 class="title rts-text-anime-style-1">
                            <asp:Literal ID="litH1Title" runat="server" />
                        </h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- cover / video -->
    <div class="rts-service-details-video-area rts-section-gapBottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="service-details-video-wrapper">
                        <div class="service-details-video-image">
                            <img id="imgCover" runat="server" alt="service">
                        </div>

                        <asp:PlaceHolder ID="phVideo" runat="server" Visible="false">
                            <div class="vedio-icone">
                                <a id="lnkVideo" runat="server" class="video-play-button play-video popup-video" href="#">
                                    <span></span>
                                </a>
                                <div class="video-overlay">
                                    <a href="#section1" class="video-overlay-close">×</a>
                                </div>
                            </div>
                        </asp:PlaceHolder>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- work process -->
    <div class="rts-work-process-area rts-section-gapBottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 pr--70 pr_md--10 pr_sm--10">
                    <div class="work-process-content">
                        <div class="title-left-wrapper">
                            <span class="pre"><asp:Literal ID="litWorkPreTitle" runat="server" /></span>
                            <h2 class="title rts-text-anime-style-1"><asp:Literal ID="litWorkTitle" runat="server" /></h2>
                            <p class="disc mt--15"><asp:Literal ID="litWorkDescription" runat="server" /></p>
                        </div>
                        <div class="thumbnail-plunning-service-detials mt--60">
                            <img id="imgWork" runat="server" alt="process">
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 mt_md--50 mt_sm--50">
                    <div class="working-process-list-wrapper">

                        <!-- Step 1 -->
                        <asp:PlaceHolder ID="phStep1" runat="server" Visible="false">
                            <div class="single-working-process-area">
                                <h5 class="title"><asp:Literal ID="litStep1Title" runat="server" /></h5>
                                <p class="disc"><asp:Literal ID="litStep1Desc" runat="server" /></p>
                                <div class="tag-area-wrapper">
                                    <asp:Repeater ID="rptStep1Tags" runat="server">
                                        <ItemTemplate><span class="tag-area"><%# Container.DataItem %></span></ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </asp:PlaceHolder>

                        <!-- Step 2 -->
                        <asp:PlaceHolder ID="phStep2" runat="server" Visible="false">
                            <div class="single-working-process-area">
                                <h5 class="title"><asp:Literal ID="litStep2Title" runat="server" /></h5>
                                <p class="disc"><asp:Literal ID="litStep2Desc" runat="server" /></p>
                                <div class="tag-area-wrapper">
                                    <asp:Repeater ID="rptStep2Tags" runat="server">
                                        <ItemTemplate><span class="tag-area"><%# Container.DataItem %></span></ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </asp:PlaceHolder>

                        <!-- Step 3 -->
                        <asp:PlaceHolder ID="phStep3" runat="server" Visible="false">
                            <div class="single-working-process-area">
                                <h5 class="title"><asp:Literal ID="litStep3Title" runat="server" /></h5>
                                <p class="disc"><asp:Literal ID="litStep3Desc" runat="server" /></p>
                                <div class="tag-area-wrapper">
                                    <asp:Repeater ID="rptStep3Tags" runat="server">
                                        <ItemTemplate><span class="tag-area"><%# Container.DataItem %></span></ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </asp:PlaceHolder>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- FAQ -->
    <div class="rts-faq-area-inner rts-section-gap">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="faq-content-one">
                        <div class="title-left-wrapper">
                            <h2 class="title rts-text-anime-style-1"><asp:Literal ID="litFaqTitle" runat="server" /></h2>
                        </div>
                        <div class="faq-sccordion-area-wrapper">
                            <p class="disc"><asp:Literal ID="litFaqIntro" runat="server" /></p>

                            <div class="accordon-pricing-wrapper-three">
                                <div class="accordion" id="pricingAccordion">

                                    <asp:PlaceHolder ID="phFaq1" runat="server" Visible="false">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingOne">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                    <asp:Literal ID="litFaqQ1" runat="server" />
                                                </button>
                                            </h2>
                                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#pricingAccordion">
                                                <div class="accordion-body"><asp:Literal ID="litFaqA1" runat="server" /></div>
                                            </div>
                                        </div>
                                    </asp:PlaceHolder>

                                    <asp:PlaceHolder ID="phFaq2" runat="server" Visible="false">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwo">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                    <asp:Literal ID="litFaqQ2" runat="server" />
                                                </button>
                                            </h2>
                                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#pricingAccordion">
                                                <div class="accordion-body"><asp:Literal ID="litFaqA2" runat="server" /></div>
                                            </div>
                                        </div>
                                    </asp:PlaceHolder>

                                    <asp:PlaceHolder ID="phFaq3" runat="server" Visible="false">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingThree">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                    <asp:Literal ID="litFaqQ3" runat="server" />
                                                </button>
                                            </h2>
                                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#pricingAccordion">
                                                <div class="accordion-body"><asp:Literal ID="litFaqA3" runat="server" /></div>
                                            </div>
                                        </div>
                                    </asp:PlaceHolder>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-lg-6 mt_md--50 mt_sm--50">
                    <div class="thumbnail-faq">
                        <img id="imgFaq" runat="server" alt="faq">
                    </div>
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
                        <h3 class="title rts-text-anime-style-1"><asp:Literal ID="litCtaTitle" runat="server" /></h3>
                        <p class="disc"><asp:Literal ID="litCtaText" runat="server" /></p>
                        <a id="lnkCta" runat="server" class="rts-btn btn-primary with-arrow btn-white" href="#">
                            <asp:Literal ID="litCtaBtnText" runat="server" /> <i class="fa-regular fa-arrow-up up-right"></i>
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