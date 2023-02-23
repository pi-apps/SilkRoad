<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="thuvienhinh.aspx.cs" Inherits="gianhang_Default" %>

<%@ Register Src="~/gianhang/UC/topUserControl.ascx" TagPrefix="uc1" TagName="topUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    <%=seo.SeoTitle %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cssContentPlaceHolder" runat="Server">
    <link href="/pi-layout/assets/css/shop-detail.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="seoContentPlaceHolder" runat="Server">
    <meta name="description" content="<%=seo.SeoDescription %>" />
    <meta name="keywords" content="<%=seo.SeoKeyword %>" />
    <meta property="og:rich_attachment" content="true" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="<%=urlDomainShare %><%=Request.RawUrl %>" />
    <meta property="og:title" content="<%=seo.SocialTitle %>" />
    <meta property="og:description" content="<%=seo.SocialDescription %>" />
    <meta property="og:image:url" content="<%=urlDomainShare %>/<%=seo.SocialImage %>" />
    <meta property="og:image" content="<%=urlDomainShare %>/<%=seo.SocialImage %>" />
    <meta property="og:image:alt" content="<%=seo.SeoTitle %>" />
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:title" content="<%=seo.SocialTitle %>" />
    <meta name="twitter:description" content="<%=seo.SocialDescription %>" />
    <meta name="twitter:image" content="<%=urlDomainShare %>/<%=seo.SocialImage %>" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bannerContentPlaceHolder" runat="Server">
    <div class="div-breadcrumb">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0);">Gate</a></li>
                    <li class="breadcrumb-item"><a href="/danh-sach-gian-hang.html">Danh sách gian hàng</a></li>
                    <li class="breadcrumb-item active"><%=seo.Name %></li>
                </ol>
            </nav>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <main id="main" class="main-gian-hang">

        <uc1:topUserControl runat="server" ID="topUserControl" />

        <div id="image-run" class="hinh-anh-hoat-dong">
            <div class="container">
                <div class="image-run-container">
                    <div class="image-run-h1">Hình ảnh hoạt động</div>
                    <div class="image-run-box row">
                        <asp:Repeater ID="rptImage" runat="server">
                            <ItemTemplate>
                                <%--box-item--%>
                                <div class="col-lg-4 col-md-4 col-xs-6">
                                    <div class="image-run-box-item">
                                        <a href="/<%#Eval("Image") %>" title="<%#Eval("Name") %>">
                                            <img src="/<%#Eval("Image") %>" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>" />
                                        </a>
                                    </div>
                                </div>
                                <%--box-item--%>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <asp:HiddenField ID="hdfMainPageId" Value="3" ClientIDMode="Static" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
    <asp:HiddenField ID="urlRequest" ClientIDMode="Static" runat="server" />
    <link href="/pi-layout/assets/vendor/simplelightbox-master/dist/simplelightbox.css" rel="stylesheet" />
    <script src="/pi-layout/assets/vendor/simplelightbox-master/dist/simple-lightbox.js"></script>
    <script>
        $(document).ready(function () {
            var $gallery = $('#image-run  a').simpleLightbox({ docClose: false });

            $gallery.on('show.simplelightbox', function () {

            })
                .on('shown.simplelightbox', function () {

                })
                .on('close.simplelightbox', function () {

                })
                .on('closed.simplelightbox', function () {

                })
                .on('change.simplelightbox', function () {

                })
                .on('next.simplelightbox', function () {

                })
                .on('prev.simplelightbox', function () {

                })
                .on('nextImageLoaded.simplelightbox', function () {

                })
                .on('prevImageLoaded.simplelightbox', function () {

                })
                .on('changed.simplelightbox', function () {

                })
                .on('nextDone.simplelightbox', function () {

                })
                .on('prevDone.simplelightbox', function () {

                })
                .on('error.simplelightbox', function (e) {

                });
        });
    </script>
</asp:Content>

