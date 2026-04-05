<%@ Page Title="Blog" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="blog.aspx.cs" Inherits="primeonx_global.blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Breadcrumb -->
    <div class="rts-service-details-breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-area">
                        <ul>
                            <li>
                                <a href="<%= ResolveUrl(((primeonx_global.SiteMaster)Master != null) ? ((primeonx_global.SiteMaster)Master).L("") : "/") %>">
                                    <%: T("Home","Anasayfa") %>
                                </a>
                            </li>
                            <li><i class="fa fa-chevron-right"></i></li>
                            <li>
                                <a href="<%= ResolveUrl(((primeonx_global.SiteMaster)Master != null) ? ((primeonx_global.SiteMaster)Master).L("blog") : "/blog") %>" class="active">
                                    Blog
                                </a>
                            </li>
                        </ul>

                        <h1 class="title rts-text-anime-style-1">Blog</h1>

                        <p class="disc" style="max-width: 560px; margin: auto; margin-top: 25px;">
                            <%: T("Insights, guides, and technical playbooks from Primeonx.",
                                  "Primeonx'tan içgörüler, rehberler ve teknik playbook'lar.") %>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Blog List -->
    <div class="rts-blog-list-area rts-section-gapBottom">
        <div class="container">
            <div class="row">

                <!-- LEFT -->
                <div class="col-xl-8">

                    <asp:PlaceHolder ID="phActiveFilters" runat="server" Visible="false">
                        <div class="mb--20" style="opacity:.9;">
                            <span style="margin-right:10px;">
                                <asp:Literal ID="litActiveFiltersLabel" runat="server" />
                            </span>
                            <asp:Literal ID="litActiveFilters" runat="server" />
                        </div>
                    </asp:PlaceHolder>

                    <div class="rts-blog-list-wrapper">

                        <asp:Repeater ID="rptPosts" runat="server">
                            <ItemTemplate>
                                <div class="single-blog-style-one">
                                    <a href='<%# Eval("Url") %>' class="thumbnail-blog">
                                        <img src='<%# ResolveUrl(Convert.ToString(Eval("FeaturedImageUrl"))) %>'
                                             alt='<%# HttpUtility.HtmlAttributeEncode(Convert.ToString(Eval("Title"))) %>' loading="lazy" />
                                    </a>
                                    <div class="inner-content-blog">
                                        <span><%# Eval("PrimaryCategoryName") %></span>

                                        <a href='<%# Eval("Url") %>'>
                                            <h5 class="title"><%# Eval("Title") %></h5>
                                        </a>

                                        <p class="disc" style="margin-top:10px;"><%# Eval("Excerpt") %></p>

                                        <div style="margin-top:12px; font-size:14px; opacity:.85;">
                                            <span><i class="fa-light fa-user"></i> <%# Eval("AuthorName") %></span>
                                            <span style="margin:0 8px;">•</span>
                                            <span><i class="fa-light fa-clock"></i> <%# Eval("PublishedAtText") %></span>
                                        </div>

                                        <a href='<%# Eval("Url") %>' class="btn-line" style="margin-top:14px;">
                                            <span><%: T("Learn More","Devamını Oku") %></span>
                                            <i class="fa-solid fa-chevron-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:PlaceHolder ID="phEmpty" runat="server" Visible="false">
                            <div class="p-4" style="border:1px solid rgba(255,255,255,.08); border-radius:12px;">
                                <h5 style="margin-bottom:8px;"><%: T("No posts found","Yazı bulunamadı") %></h5>
                                <p style="margin:0; opacity:.85;">
                                    <%: T("Try a different keyword or clear your filters.",
                                          "Farklı bir kelime deneyin veya filtreleri temizleyin.") %>
                                </p>
                            </div>
                        </asp:PlaceHolder>

                    </div>

                    <!-- Pagination -->
                    <div class="mt--40">
                        <asp:PlaceHolder ID="phPagination" runat="server" Visible="false">
                            <div style="display:flex; gap:10px; align-items:center; flex-wrap:wrap;">
                                <asp:HyperLink ID="lnkPrev" runat="server" CssClass="btn btn-primary" Text="← Prev" />
                                <asp:Literal ID="litPageInfo" runat="server" />
                                <asp:HyperLink ID="lnkNext" runat="server" CssClass="btn btn-primary" Text="Next →" />
                            </div>
                        </asp:PlaceHolder>
                    </div>

                </div>

                <!-- RIGHT SIDEBAR -->
                <div class="col-xl-4 col-md-12 col-sm-12 col-12 pl--50 pl_md--10 pl_sm--10 mt_md--50 mt_sm--50">

                    <!-- Search -->
                    <div class="rts-single-wized search">
                        <div class="wized-header">
                            <h5 class="title"><%: T("Search","Ara") %></h5>
                        </div>
                        <div class="wized-body">
                            <div class="rts-search-wrapper">
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="Search" />
                                <asp:LinkButton ID="btnSearch" runat="server" OnClick="btnSearch_Click"
                                    CssClass="rts-btn btn-primary" Style="padding:10px 14px; border-radius:10px;">
                                    <i class="fal fa-search"></i>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <!-- Categories -->
                    <div class="rts-single-wized Categories">
                        <div class="wized-header">
                            <h5 class="title"><%: T("Categories","Kategoriler") %></h5>
                        </div>
                        <div class="wized-body">
                            <asp:Repeater ID="rptCategories" runat="server">
                                <ItemTemplate>
                                    <ul class="single-categories">
                                        <li>
                                            <a href='<%# Eval("Url") %>'>
                                                <%# Eval("Name") %> (<%# Eval("PostCount") %>)
                                                <i class="far fa-long-arrow-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <!-- Recent Posts -->
                    <div class="rts-single-wized Recent-post">
                        <div class="wized-header">
                            <h5 class="title"><%: T("Recent Posts","Son Yazılar") %></h5>
                        </div>
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

                    <!-- Popular Tags -->
                    <div class="rts-single-wized">
                        <div class="wized-header">
                            <h5 class="title"><%: T("Popular Tags","Popüler Etiketler") %></h5>
                        </div>
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
                <!-- /SIDEBAR -->

            </div>
        </div>
    </div>

</asp:Content>