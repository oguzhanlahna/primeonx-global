<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="blog-detail.aspx.cs" Inherits="primeonx_global.blog_detail" %>

<asp:Content ID="HeadBlock" ContentPlaceHolderID="HeadContent" runat="server">
    <asp:Literal ID="litJsonLd" runat="server" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="rts-service-details-breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-area">
                        <ul>
                            <li>
                                <a href="<%= ResolveUrl(((primeonx_global.SiteMaster)Master != null) ? ((primeonx_global.SiteMaster)Master).L("") : "/") %>">
                                    <%: T("Home","Ana Sayfa") %>
                                </a>
                            </li>
                            <li><i class="fa fa-chevron-right"></i></li>
                            <li>
                                <a href="<%= ResolveUrl(((primeonx_global.SiteMaster)Master != null) ? ((primeonx_global.SiteMaster)Master).L("blog") : "/blog") %>">
                                    <%: T("Blog","Blog") %>
                                </a>
                            </li>
                            <li><i class="fa fa-chevron-right"></i></li>
                            <li><a href="#" class="active"><asp:Literal ID="litBreadcrumbTitle" runat="server" /></a></li>
                        </ul>

                        <h1 class="title rts-text-anime-style-1">
                            <asp:Literal ID="litTitleH1" runat="server" />
                        </h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="rts-blog-list-area rts-section-gapBottom">
        <div class="container">
            <div class="row">

                <div class="col-xl-8">

                    <asp:PlaceHolder ID="phNotFound" runat="server" Visible="false">
                        <div class="p-4" style="border:1px solid rgba(255,255,255,.08); border-radius:12px;">
                            <h3 style="margin-bottom:10px;"><%: T("Post not found","Yazı bulunamadı") %></h3>
                            <p style="opacity:.85; margin:0;"><%: T("The article doesn’t exist or is not published.","Bu yazı yok veya yayında değil.") %></p>
                            <div style="margin-top:16px;">
                                <a href="<%= ResolveUrl(((primeonx_global.SiteMaster)Master != null) ? ((primeonx_global.SiteMaster)Master).L("blog") : "/blog") %>" class="btn btn-primary">
                                    <%: T("Back to Blog","Blog’a Dön") %>
                                </a>
                            </div>
                        </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder ID="phContent" runat="server" Visible="true">
                        <div class="rts-blog-detials-area-start">

                            <div class="thumbnail-top">
                                <asp:Image ID="imgFeatured" runat="server" AlternateText="blog-image" />
                            </div>

                            <div class="inner-content-blog-details">
                                <div class="top-area">
                                    <span><asp:Literal ID="litAuthor" runat="server" /></span>
                                    <span> • <asp:Literal ID="litDate" runat="server" /></span>
                                </div>

                                <h2 class="title"><asp:Literal ID="litTitle" runat="server" /></h2>

                                <div class="disc">
                                    <asp:Literal ID="litContentHtml" runat="server" />
                                </div>

                                <div style="margin-top:24px;">
                                    <div style="margin-bottom:8px; font-weight:600;"><%: T("Categories","Kategoriler") %></div>
                                    <asp:Repeater ID="rptPostCategories" runat="server">
                                        <ItemTemplate>
                                            <a href='<%# Eval("Url") %>' style="margin-right:10px;"><%# Eval("Name") %></a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>

                                <div style="margin-top:16px;">
                                    <div style="margin-bottom:8px; font-weight:600;"><%: T("Tags","Etiketler") %></div>
                                    <div class="tags-wrapper">
                                        <asp:Repeater ID="rptPostTags" runat="server">
                                            <ItemTemplate>
                                                <a href='<%# Eval("Url") %>'><%# Eval("Name") %></a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </asp:PlaceHolder>

                </div>

                <div class="col-xl-4 col-md-12 col-sm-12 col-12 pl--50 pl_sm--10 pl_md--10 pt_md--50 pt_sm--50">

                    <div class="rts-single-wized search">
                        <div class="wized-header"><h5 class="title"><%: T("Search","Ara") %></h5></div>
                        <div class="wized-body">
                            <div class="rts-search-wrapper">
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="Search" />
                                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" Style="display:none;" />
                                <button type="button" onclick="document.getElementById('<%= btnSearch.ClientID %>').click();">
                                    <i class="fal fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="rts-single-wized Categories">
                        <div class="wized-header"><h5 class="title"><%: T("Categories","Kategoriler") %></h5></div>
                        <div class="wized-body">
                            <asp:Repeater ID="rptCategories" runat="server">
                                <ItemTemplate>
                                    <ul class="single-categories">
                                        <li>
                                            <a href='<%# Eval("Url") %>'>
                                                <%# Eval("Name") %> (<%# Eval("PostCount") %>) <i class="far fa-long-arrow-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <div class="rts-single-wized Recent-post">
                        <div class="wized-header"><h5 class="title"><%: T("Recent Posts","Son Yazılar") %></h5></div>
                        <div class="wized-body">
                            <asp:Repeater ID="rptRecent" runat="server">
                                <ItemTemplate>
                                    <div class="recent-post-single">
                                        <div class="thumbnail">
                                            <a href='<%# Eval("Url") %>'>
                                                <img src='<%# ResolveUrl(Convert.ToString(Eval("FeaturedImageUrl"))) %>'
                                                     alt='<%# HttpUtility.HtmlAttributeEncode(Convert.ToString(Eval("Title"))) %>' loading="lazy" />
                                            </a>
                                        </div>
                                        <div class="content-area">
                                            <div class="user">
                                                <i class="fal fa-clock"></i>
                                                <span><%# Eval("PublishedAtText") %></span>
                                            </div>
                                            <a class="post-title" href='<%# Eval("Url") %>'>
                                                <h6 class="title"><%# Eval("Title") %></h6>
                                            </a>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <div class="rts-single-wized">
                        <div class="wized-header"><h5 class="title"><%: T("Popular Tags","Popüler Etiketler") %></h5></div>
                        <div class="wized-body">
                            <div class="tags-wrapper">
                                <asp:Repeater ID="rptTags" runat="server">
                                    <ItemTemplate>
                                        <a href='<%# Eval("Url") %>'><%# Eval("Name") %></a>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</asp:Content>