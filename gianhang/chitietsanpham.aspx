<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="chitietsanpham.aspx.cs" Inherits="gianhang_chitietsanpham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    <%=product.SeoTitle %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cssContentPlaceHolder" runat="Server">
    <link href="/pi-layout/assets/vendor/owl-carousel/owl.theme.css" rel="stylesheet" />
    <link href="/pi-layout/assets/vendor/owl-carousel/owl.carousel.css" rel="stylesheet" />
    <link href="/pi-layout/assets/css/StarRating.min.css" rel="stylesheet" />
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
                <span>Hệ thống đang khớp lệnh. Xin vui lòng đợi</span>
            </div>
        </div>
    </div>
    <div class="div-breadcrumb">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="/danh-sach-gian-hang.html">Gian hàng</a></li>
                    <li class="breadcrumb-item"><a href="/gian-hang/<%=shopRental.Name.RemoveSymbol() %>-<%=shopRental.Id %>.html"><%=shopRental.Name %></a></li>
                    <li class="breadcrumb-item active"><%=product.ProductName %></li>
                </ol>
            </nav>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <main id="main" class="main-gian-hang">
        <section class="shop-single section-padding pt-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="shop-detail-left">
                            <div class="shop-detail-slider">
                                <div class="favourite-icon">
                                    <%if (product.PricePercent > 0)
                                        { %>
                                    <a class="fav-btn" title="" data-placement="bottom" data-toggle="tooltip" href="javascript:void(0);" data-original-title="<%=product.PricePercent %>% OFF"><i class="fa fa-tag" aria-hidden="true"></i></a>
                                    <%} %>
                                </div>
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
                            <div class="danh-gia">
                                <div id="rating">
                                    <div style="float: left" data-id="<%=product.Id %>" class="rateit" data-rateit-value="<%=ScoreProduct %>" data-rateit-resetable="false">

                                        <div class="rateit-selected" style="height: 16px; width: <%=(int)ScoreProduct/5 %>px; display: block;"></div>

                                    </div>
                                </div>
                            </div>

                            <%if (product.PricePercent > 0)
                                { %>
                            <span class="badge badge-danger badge-off"><%=product.PricePercent %>% OFF</span>
                            <%} %>
                            <h2><%=product.ProductName %></h2>
                            <h6><strong><i class="fa fa-bars" aria-hidden="true"></i>&nbsp;Danh mục</strong>: <a href="/gian-hang/san-pham-gian-hang/<%=product.pro_Category.Name.RemoveSymbol() %>-<%=product.pro_Category.Id %>-<%=shopRental.Id %>.html" title="<%=product.pro_Category.Name %>"><%=product.pro_Category.Name %></a></h6>
                            <h6><strong><i class="fa fa-barcode" aria-hidden="true"></i>&nbsp;SKU </strong>: <%=product.Code %></h6>
                            <h6><strong><i class="fa fa-bullseye" aria-hidden="true"></i>&nbsp;Gian hàng </strong>: <a href="/gian-hang/<%=shopRental.Name.RemoveSymbol() %>-<%=shopRental.Id %>.html" title="<%=shopRental.Name %>"><%=shopRental.Name %></a></h6>
                            <%=strPrice %>
                            <%=UrlBuy %> <span class="phi-giao-dich">(Phí giao dịch: <%=sys_Config.PurchaseFee %>π)</span>
                            <div class="short-description">
                                <h5>Thông tin cơ bản
                                <p class="float-right"><span class="badge badge-success"><%=product.pro_StatusProduct.Name %></span></p>
                                </h5>
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
        <div id="comment">
            <div class="container">
                <asp:Panel ID="Panel2" runat="server" Visible="false">
                    <div class="card padding-card reviews-card mb-4" style="border: none;">
                    <div class="card-body">
                        <asp:Repeater ID="rptBinhLuan" runat="server">
                            <ItemTemplate>
                                <div class="media mb-4">
                                    <img alt="<%#Eval("FullName") %>" src="/<%#Eval("Avatar") %>" class="d-flex mr-3 rounded"
                                        title="<%#Eval("FullName") %>">
                                    <div class="media-body">
                                        <h5 class="mt-0"><%#Eval("FullName") %> <small><%#Eval("CreatedAt","{0:dd.MM.yyyy}") %></small>
                                        </h5>
                                        <p><%#Eval("Comment") %></p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </div>
                </asp:Panel>
                <asp:Panel ID="Panel1" runat="server">
                    <div class="box-comment">
                        <div class="card blog" style="border: none;">
                            <div class="card-body">
                                <h5 class="card-title">Bình luận sản phẩm</h5>
                                <div>
                                    <div class="control-group form-group">
                                        <div class="controls">
                                            <label>Nội dung <span class="text-danger">*</span></label>
                                            <asp:TextBox ID="txtComment" TextMode="MultiLine" Rows="5" CssClass="form-control" runat="server" ValidationGroup="blsanpham"></asp:TextBox>
                                            <asp:RequiredFieldValidator CssClass="erro-bl" Display="Dynamic" ControlToValidate="txtComment"
                                                ID="RequiredFieldValidator1" runat="server"
                                                ErrorMessage="Vui lòng nhập bình luận" ValidationGroup="blsanpham"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <br />
                                    <asp:Button ID="btnSendBL" CssClass="btn btn-success" OnClick="btnSendBL_Click" runat="server" Text="Gửi bình luận" ValidationGroup="blsanpham" />
                                    <%if (Session["binhluansp"] != null)
                                        { %>
                                    <p />
                                    <div class='alert alert-success' role='alert'>
                                        Chúc mừng, bạn đã gửi bình luận thành công.<br />
                                        Hệ thống cần phê duyệt bình trước khi nó được hiển thị.
                                    </div>
                                    <%}
                                        else
                                        { %>

                                    <%} %>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div id="product-run" class="product-section">
            <div class="container">
                <div class="product-container">
                    <div class="product-h1">Sản phẩm cùng loại</div>
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
        <div id="product-new-run" class="product-section">
            <div class="container">
                <div class="product-container">
                    <div class="product-h1">Gợi ý dành cho bạn</div>
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
    </main>
    <asp:HiddenField ID="hdfMainPageId" Value="3" ClientIDMode="Static" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
    <script src="/pi-layout/assets/vendor/owl-carousel/owl.carousel.js"></script>
    <script src="/pi-layout/assets/vendor/bootstrap-4.0.0-dist/js/bootstrap.bundle.min.js"></script>
    <script src="/pi-layout/assets/js/product-detail.js"></script>
    <asp:HiddenField ID="hdfUrl" ClientIDMode="Static" runat="server" />
    <script>
        
    </script>
</asp:Content>

