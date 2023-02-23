<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="gianhang_Default" %>

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

        <div id="gioi-thieu" class="gioi-thieu-shop">
            <section id="about" class="about">
                <div class="container" data-aos="fade-up">
                    <asp:Repeater ID="rptGioiThieu" runat="server">
                        <ItemTemplate>
                            <div class="row gx-0">
                                <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
                                    <img src="/<%#Eval("Image") %>" class="img-fluid" alt="<%#Eval("Name") %>">
                                </div>
                                <div class="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up" data-aos-delay="200">
                                    <div class="content">
                                        <h3><%#Eval("Name") %></h3>
                                        <p>
                                            <%#Eval("Summary") %>
                                        </p>
                                        <div class="text-center text-lg-start">
                                            <a title="<%#Eval("Name") %>" href="/gian-hang/gioi-thieu/<%#Eval("Name").ToString().RemoveSymbol() %>-<%=seo.Id %>.html" class="btn-read-more d-inline-flex align-items-center justify-content-center align-self-center">
                                                <span>Xem thêm</span>
                                                <i class="bi bi-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>

            </section>
        </div>
        <div id="div-video" style="display:none;">
            <div class="container">
                <div class="col-md-12 no-padding">
                    <div class="col-md-12">
                        <h3 class="video-h3"><a href="javascript:;" title="<%=seo.Name %> Media"><%=seo.Name %> Media</a></h3>
                    </div>
                    <div class="row list-media-feature">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <asp:Repeater ID="rptVideo" runat="server">
                                <ItemTemplate>
                                    <div class="full-video-media content-des embed-container">
                                        <iframe width="360" height="315" src="<%#Eval("Youtube") %>?controls=0&mute=0&rel=0&loop=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-3 video-list" style="display: none;">
                            <div class="video-list-scroll">
                                <div class="thumbnail-video">
                                    <a href="https://www.youtube.com/watch?v=MmjxKubcWVQ" title="Warning: This Could CRASH BITCOIN – A Serious Update">
                                        <img src="/pi-layout/temp/MmjxKubcWVQ-HD.jpg" />
                                        <span class="icon-video"></span>
                                        <div class="title-gallery">This Could CRASH BITCOIN – A Serious Update</div>
                                    </a>
                                </div>
                                <div class="thumbnail-video">
                                    <a href="https://www.youtube.com/watch?v=Pl8OlkkwRpc" title="The Biggest Market Crash Of Our Generation Is Here">
                                        <img src="/pi-layout/temp/Pl8OlkkwRpc-HD.jpg" />
                                        <span class="icon-video"></span>
                                        <div class="title-gallery">The Biggest Market Crash Of Our Generation Is Here</div>
                                    </a>
                                </div>
                                <div class="thumbnail-video">
                                    <a href="https://www.youtube.com/watch?v=CG4Yoyef9w4" title="The FED Just Crashed The Market | Major Changes Explained*">
                                        <img src="/pi-layout/temp/CG4Yoyef9w4-HD.jpg" />
                                        <span class="icon-video"></span>
                                        <div class="title-gallery">The FED Just Crashed The Market | Major Changes Explained*</div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div id="category" class="danh-muc-shop" style="display:none;">
            <div class="container">
                <div class="category-container">
                    <div class="category-h1">Danh mục</div>
                    <div class="category-box row">
                        <asp:Repeater ID="rptCategory" runat="server">
                            <ItemTemplate>
                                <%--box-item--%>
                                <div class="col-lg-2 col-md-3 col-xs-6">
                                    <div class="category-box-item">
                                        <div class="box-item-img">
                                            <a href="/gian-hang/san-pham-gian-hang/<%#Eval("Name").ToString().RemoveSymbol() %>-<%#Eval("Id") %>-<%#Eval("store_ShopRentalId") %>.html" title="<%#Eval("Name") %>">
                                                <img src="/<%#Eval("Icon") %>" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>" />
                                            </a>
                                        </div>
                                        <div class="box-item-title">
                                            <a href="/gian-hang/san-pham-gian-hang/<%#Eval("Name").ToString().RemoveSymbol() %>-<%#Eval("Id") %>-<%#Eval("store_ShopRentalId") %>.html" title="<%#Eval("Name") %>">
                                                <h3><%#Eval("Name") %></h3>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <%--box-item--%>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
        <div id="product-new-run" class="product-section">
            <div class="container">
                <div class="product-container">
                    <div class="product-h1">Sản phẩm mới</div>
                    <div class="product-box row no-gutters padding-mobile">
                        <asp:Repeater ID="rptProductNew" OnItemDataBound="rptProductNew_ItemDataBound" runat="server">
                            <ItemTemplate>
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="product-item">
                                        <asp:HiddenField ID="hdfId" Value='<%#Eval("Id") %>' runat="server" />
                                        <asp:Literal ID="ltrJsonLDT" runat="server"></asp:Literal>
                                        <div class="product">
                                            <a href="<%#urlDomainShare %>/san-pham/<%#Eval("Name").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("Name") %>">
                                                <div class="product-header">
                                                    <asp:Literal ID="ltrBadge" runat="server"></asp:Literal>
                                                    <img class="img-fluid" src="<%#urlDomainShare%>/<%#Eval("Image") %>" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>">
                                                </div>
                                                <div class="product-body">
                                                    <h5><a href="<%#urlDomainShare %>/san-pham/<%#Eval("Name").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("Name") %>"><%#Eval("Name") %></a></h5>
                                                </div>
                                                <div class="product-footer add-to-cart-button">
                                                    <asp:Literal ID="ltrBuyProduct" runat="server"></asp:Literal>
                                                    <asp:Literal ID="ltrPrice" runat="server"></asp:Literal>
                                                </div>
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
        <div id="product-run" class="product-section">
            <div class="container">
                <div class="product-container">
                    <div class="product-h1">Sản phẩm khuyến mãi</div>
                    <div class="product-box row no-gutters padding-mobile">
                        <asp:Repeater ID="rptProductKM" OnItemDataBound="rptProductKM_ItemDataBound" runat="server">
                            <ItemTemplate>
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="product-item">
                                        <asp:HiddenField ID="hdfId" Value='<%#Eval("Id") %>' runat="server" />
                                        <asp:Literal ID="ltrJsonLDT" runat="server"></asp:Literal>
                                        <div class="product">
                                            <a href="<%#urlDomainShare %>/san-pham/<%#Eval("Name").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("Name") %>">
                                                <div class="product-header">
                                                    <asp:Literal ID="ltrBadge" runat="server"></asp:Literal>
                                                    <img class="img-fluid" src="<%#urlDomainShare%>/<%#Eval("Image") %>" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>">
                                                </div>
                                                <div class="product-body">
                                                    <h5><a href="<%#urlDomainShare %>/san-pham/<%#Eval("Name").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("Name") %>"><%#Eval("Name") %></a></h5>
                                                </div>
                                                <div class="product-footer add-to-cart-button">
                                                    <asp:Literal ID="ltrBuyProduct" runat="server"></asp:Literal>
                                                    <asp:Literal ID="ltrPrice" runat="server"></asp:Literal>
                                                </div>
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


        <div id="new-run" class="tin-tuc-hoat-dong" style="display: none;">
            <div class="container">
                <div class="new-run-container">
                    <div class="new-run-h1">Tin tức hoạt động</div>
                    <div class="new-run-box row">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="box-new-one">
                                <asp:Repeater ID="rptNewLeft" runat="server">
                                    <ItemTemplate>
                                        <div class="box-item-left">
                                            <div class="img" style="background-image: url('/<%#Eval("Image") %>');">
                                                <img src="/<%#Eval("Image") %>" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>" />
                                            </div>
                                            <div class="box-item-left-bottom">
                                                <div class="box-new-title">
                                                    <h3><a href="#"><%#Eval("Name") %></a></h3>
                                                </div>
                                                <div class="box-new-summary">
                                                    <p><%#Eval("Summary") %></p>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="box-new-three">
                                <asp:Repeater ID="rptNewRight" runat="server">
                                    <ItemTemplate>
                                        <div class="box-new-item">
                                            <div class="box-new-img">
                                                <img src="/<%#Eval("Image") %>" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>" />
                                            </div>
                                            <div class="box-right-content">
                                                <div class="box-new-title">
                                                    <h3><a href="#"><%#Eval("Name") %></a></h3>
                                                </div>
                                                <div class="box-new-summary">
                                                    <p><%#Eval("Summary") %></p>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="image-run" class="hinh-anh-hoat-dong" style="display:none;">
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
    <script src="/pi-layout/assets/js/dathang.js"></script>
</asp:Content>

