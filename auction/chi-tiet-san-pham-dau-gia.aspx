<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="chi-tiet-san-pham-dau-gia.aspx.cs" Inherits="gianhang_chitietsanpham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    <%=product.SeoTitle %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cssContentPlaceHolder" runat="Server">
    <link href="/pi-layout/assets/vendor/owl-carousel/owl.theme.css" rel="stylesheet" />
    <link href="/pi-layout/assets/vendor/owl-carousel/owl.carousel.css" rel="stylesheet" />
    <link href="/pi-layout/assets/css/detail-product.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="seoContentPlaceHolder" runat="Server">
    <meta name="description" content="<%=product.SeoDescription %>" />
    <meta name="keywords" content="<%=product.SeoKeyword %>" />
    <meta property="og:rich_attachment" content="true" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="<%=urlDomainShare %><%=Request.RawUrl %>" />
    <meta property="og:title" content="<%=product.SocialTitle %>" />
    <meta property="og:description" content="<%=product.SocialDescription %>" />
    <meta property="og:image:url" content="<%=urlDomainShare %>/<%=product.SocialImage %>" />
    <meta property="og:image" content="<%=urlDomainShare %>/<%=product.SocialImage %>" />
    <meta property="og:image:alt" content="<%=product.SeoTitle %>" />
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:title" content="<%=product.SocialTitle %>" />
    <meta name="twitter:description" content="<%=product.SocialDescription %>" />
    <meta name="twitter:image" content="<%=urlDomainShare %>/<%=product.SocialImage %>" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bannerContentPlaceHolder" runat="Server">
    <div class="overlay" id="overlay-mua-hang">
        <div class="overlay__inner">
            <div class="overlay__content">
                <span class="spinner"></span>
                <br />
                <br />
                <span>Hệ thống đang xử lý. Xin vui lòng đợi</span>
            </div>
        </div>
    </div>
    <div class="div-breadcrumb">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="/san-dau-gia.html">Sàn đấu giá</a></li>
                    <li class="breadcrumb-item active"><%=product.ProductName %></li>
                </ol>
            </nav>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <main id="main" class="main-gian-hang main-div-detail-auction">
        <section class="shop-single section-padding pt-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="shop-detail-left">
                            <div class="shop-detail-slider">
                                <div id="sync1" class="owl-carousel">
                                    <asp:Repeater ID="rptImages1" runat="server">
                                        <ItemTemplate>
                                            <div class="item">
                                                <img title="<%#Eval("ProductName") %>" alt="<%#Eval("ProductName") %>" src="/<%#Eval("Image") %>" class="img-fluid img-center">
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <div id="sync2" class="owl-carousel">
                                    <asp:Repeater ID="rptImages2" runat="server">
                                        <ItemTemplate>
                                            <div class="item">
                                                <img title="<%#Eval("ProductName") %>" alt="<%#Eval("ProductName") %>" src="/<%#Eval("Image") %>" class="img-fluid img-center">
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="shop-detail-right">
                            <h2 class="h2-title-detail-auction"><%=product.ProductName %></h2>
                            <h6><strong><i class="fa fa-bars" aria-hidden="true"></i>&nbsp;Danh mục</strong>: <a href="#" title="<%=product.pro_Category.Name %>"><%=product.pro_Category.Name %></a></h6>
                            <h6><strong><i class="fa fa-barcode" aria-hidden="true"></i>&nbsp;SKU </strong>: <%=product.Code %></h6>
                            <div class="price price-auction">
                                <span class="gia-thue">Giá khởi điểm: <strong><%=product.PriceAuction.Value.ToString("#,##0") %>π</strong></span>
                            </div>
                            <div class="clear-both"></div>
                            <div class="summary-info-dau-gia summary-info-dau-gia-detail">
                                <div class="div-price column1">
                                    <span class="text">Giá đặt</span>
                                    <span class="number color1">
                                        <asp:Literal ID="ltrGiaDat" runat="server"></asp:Literal></span>
                                </div>
                                <div class="div-price column2">
                                    <span class="text">Người đặt</span>
                                    <span class="number color2">
                                        <asp:Literal ID="ltrNguoiDat" runat="server"></asp:Literal></span>
                                </div>
                                <div class="div-price column3">
                                    <span class="text">Thời gian</span>
                                    <span class="number color3">
                                        <asp:Literal ID="ltrThoiGian" runat="server"></asp:Literal></span>
                                </div>
                            </div>
                            <div class="clear-both"></div>
                            <div class="button button-detail-auction">
                                <a class="btn-thue view-more-page" href="/auction/popup/pophistoryauction.aspx?Id=<%=product.Id %>" data-id="<%=product.Id %>"><i class="fa fa-history" aria-hidden="true"></i>&nbsp; Lịch sử đấu giá</a>
                                <asp:Literal ID="ltrDatGiaThau" runat="server"></asp:Literal>
                            </div>
                            <div class="clear-both"></div>
                            <div class="short-description short-description-auction">
                                <%=product.Summary %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="single-detail-cus product-items-slider section-padding bg-white border-top">
            <div class="container">
                <div class="card-contanier-cus card card-body">
                    <div class="accordion" id="accordionExample">
                        <div class="card-detail-cus card mb-0">
                            <div class="card-header" id="headingOne">
                                <h6 class="mb-0">
                                    <a class="product-detail-h6" href="javascript:void(0);" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <i class="icofont icofont-question-square"></i>Thông tin sản phẩm
                                    </a>
                                </h6>
                            </div>
                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body card-body-cus-detail">
                                    <%=product.Description %>
                                </div>
                            </div>
                        </div>
                        <div class="card-detail-cus card">
                            <div class="card-header" id="headingThree">
                                <h6 class="mb-0">
                                    <a class="product-detail-h6" href="javascript:void(0);" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                                        <i class="icofont icofont-question-square"></i>Ghi chú
                                    </a>
                                </h6>
                            </div>
                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                <div class="card-body card-body-cus-detail">
                                    <%=product.CachBaiTri %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <asp:HiddenField ID="hdfMainPageId" Value="4" ClientIDMode="Static" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
    <script src="/pi-layout/assets/vendor/owl-carousel/owl.carousel.js"></script>
    <script src="/pi-layout/assets/vendor/bootstrap-4.0.0-dist/js/bootstrap.bundle.min.js"></script>
    <script src="/pi-layout/assets/js/product-detail.js"></script>
    <script src="/pi-layout/assets/countdown/multi-countdown.js"></script>
    <script src="/pi-layout/assets/js/san-dau-gia.js"></script>
</asp:Content>

