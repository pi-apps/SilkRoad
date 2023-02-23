<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="giohang.aspx.cs" Inherits="page_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    <%=seo.SeoTitle %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cssContentPlaceHolder" runat="Server">
    <link href="/pi-layout/assets/css/cart.css" rel="stylesheet" />
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
                    <li class="breadcrumb-item active"><%=seo.Name %></li>
                </ol>
            </nav>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:HiddenField ID="hdfMainPageId" Value="1" ClientIDMode="Static" runat="server" />
    <div class="div-page-main">
        <div class="container">
            <div class="page-content">
                <div class="main-cart">
                    <asp:MultiView ID="mulCart" runat="server">
                        <asp:View ID="vCartEm" runat="server">
                            <section class="section-cart cart-empty">
                                <div class="container">
                                    <div class="section-body">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="cart-main">
                                                    <div class="cart-main-body">
                                                        <div
                                                            class="container-fluid container_center_desktop empty_shopping_cart text-center js-empty_shopping_cart">
                                                            <div class="content-asset">
                                                                <p class="empty_shopping_cart-text">
                                                                    Giỏ hàng đang rỗng. Nếu bạn có tài khoản với chúng tôi, hãy đăng nhập để lấy bất kỳ mục nào đã lưu.
                                                                </p>
                                                                <a
                                                                    class="button btn-main empty_shopping_cart-btn"
                                                                    style="margin-right: 20px; margin-bottom: 20px; margin-left: 20px;"
                                                                    href="<%=urlDomain %>home.aspx"
                                                                    title="Tiếp tục mua sắm">Tiếp tục mua sắm
                                                                </a>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </asp:View>
                        <asp:View ID="vCartBag" runat="server">
                            <section id="main-cart" class="section-cart">
                                <div class="container">
                                    <div class="section-body">
                                        <div class="row">
                                            <div class="col-lg-8">
                                                <div class="cart-main">
                                                    <div class="cart-main-head">
                                                        <h3 class="cart-main-title">Giỏ hàng
                                                        </h3>
                                                    </div>
                                                    <div class="cart-main-body">
                                                        <div class="cart-continue_shopping d-none d-lg-block">
                                                            <a href="<%=urlDomain %>" title="Tiếp tục mua sắm">Tiếp tục mua sắm</a>
                                                        </div>
                                                        <div class="cart-card">
                                                            <div class="cart-card-table">
                                                                <div class="cart-card-table-head d-flex flex-row">
                                                                    <div class="cart-card-col_title js-cart-card-img cart-card-label-items">
                                                                        <%=shopping.TotalItemCount %> Sản phẩm
                                                                    </div>
                                                                    <div class="cart-card-attributes d-none d-lg-flex">
                                                                        <div class="cart-card-col_title cart-card-content">
                                                                            Thông tin
                                                                        </div>
                                                                        <div class="cart-card-footer">
                                                                            <div class="cart-card-col_title cart-card-total">
                                                                                <div class="price">
                                                                                    Giá
                                                                                </div>
                                                                            </div>
                                                                            <div class="cart-card-col_title cart-card-qty line-item-quantity">
                                                                                <div class="quantity-form">
                                                                                    Số lượng
                                                                                </div>
                                                                            </div>
                                                                            <div class="cart-card-col_title cart-card-total_price">
                                                                                Thành tiền
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="panel-info-cart">
                                                                    <asp:Repeater ID="rptShop" runat="server" OnItemDataBound="rptShop_ItemDataBound">
                                                                    <ItemTemplate>
                                                                        <div class="cart-shop-name">
                                                                            <asp:HiddenField ID="hdfShopRentalIdId" Value='<%#Eval("store_ShopRentalId") %>' runat="server" />
                                                                            <input type="checkbox" class="shop_cart_main" data-shoprentalid="<%#Eval("store_ShopRentalId") %>" id="shop_cart_<%#Eval("store_ShopRentalId") %>" name="shop_cart_<%#Eval("store_ShopRentalId") %>" value="<%#Eval("store_ShopRentalId") %>" />
                                                                            <span><a href="/gian-hang/<%#Eval("store_ShopRentalName").ToString().RemoveSymbol() %>-<%#Eval("store_ShopRentalId") %>.html" title="<%#Eval("store_ShopRentalName") %>"><%#Eval("store_ShopRentalName") %></a></span>
                                                                        </div>
                                                                        <asp:Repeater ID="rptCart"  OnItemDataBound="rptCart_ItemDataBound" runat="server">
                                                                            <ItemTemplate>
                                                                                <div class="cart-card-table-item d-flex flex-row" id="row_detail-<%#Eval("store_ShopRentalId") %>">
                                                                            <div class="js-cart-card-img cart-card-img">
                                                                                <input type="checkbox" data-shoprentalid="<%#Eval("store_ShopRentalId") %>" 
                                                                                    class="shop_product_item_cart cart-input-item" 
                                                                                    id="shop_cart_product_<%#Eval("Id") %>" data-productid="<%#Eval("pro_ProductId") %>" 
                                                                                    name="shop_cart_product_<%#Eval("Id") %>" value="<%#Eval("pro_ProductId") %>" />
                                                                                <a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("pro_ProductId") %>.html" title="<%#Eval("ProductName") %>" class="cart-card-photo">
                                                                                    <img src="/<%#Eval("Image") %>" alt="<%#Eval("ProductName") %>">
                                                                                </a>
                                                                                <asp:HiddenField ID="hdfId" Value='<%#Eval("Id") %>' runat="server" />
                                                                            </div>
                                                                            <div class="cart-card-attributes">
                                                                                <div class="cart-card-content">
                                                                                    <asp:Literal ID="ltrSubName" runat="server"></asp:Literal>
                                                                                    <div class="cart-card-title">
                                                                                        <div class="cart-card-name">
                                                                                            <a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("pro_ProductId") %>.html" title="<%#Eval("ProductName") %>" class="header_minicart-product_name"><%#Eval("ProductName") %></a>
                                                                                        </div>
                                                                                        <div class="js-product-number product-number cart-card-sku"><%#Eval("Code") %></div>
                                                                                        <div class="cart-card-remove order_recap-hide">
                                                                                            <a href="javascript:;" data-id="<%#Eval("pro_ProductId") %>" class="cd-item-remove-item cart-remove remove-product btn cart-card-remove_btn">
                                                                                                <span aria-hidden="true">
                                                                                                    <img src="/pi-layout/assets/img/ico/trash-bin.png" class="icon cart-card-remove_icon"></span>
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="cart-card-attr_section">
                                                                                        <asp:Literal ID="ltrAttribute" runat="server"></asp:Literal>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="cart-card-footer">
                                                                                    <div class="cart-card-total">
                                                                                        <div class="price">
                                                                                            <span>
                                                                                                <span class="sales ">
                                                                                                    <%#Eval("PriceSell","{0:#,##0}") %> π
                                                                                                </span>
                                                                                            </span>

                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="cart-card-qty line-item-quantity">
                                                                                        <div class="quantity-form quantity-form-cart">
                                                                                            <div class="number-input md-number-input">
                                                                                                <button data-id="<%#Eval("pro_ProductId") %>" type="button" onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
                                                                                                <input data-id="<%#Eval("pro_ProductId") %>" class="quantity quantity_product" min="1" name="quantity" data-id="<%#Eval("Id") %>" value="<%#Eval("Quantity") %>" type="number">
                                                                                                <button data-id="<%#Eval("pro_ProductId") %>" type="button" class="plus"></button>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="cart-card-total_price line-item-total-price order_recap-show">
                                                                                        <div class="pricing">
                                                                                            <div class="pricing order_recap-pricing line-item-total-price-amount" data-id="<%#Eval("pro_ProductId") %>">
                                                                                                <%#(double.Parse(Eval("Quantity").ToString())*double.Parse(Eval("Price").ToString())).ToString("#,##0") %> π
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                                </div>
                                                                <div class="cart-card-table-foot">
                                                                    <div class="content-asset">
                                                                        <a href="/ho-tro/giao-nhan/5" class="btn btn_product_part" title="Giao hàng miễn phí">
                                                                            <i class="fa fa-truck"></i>
                                                                            <span class="cart_asset_link">GIAO HÀNG MIỄN PHÍ*</span>
                                                                        </a>
                                                                        <a class="js-liveChat btn-link btn btn_product_part" href="/ho-tro/hoi-dap.html" title="Hỏi & đáp">
                                                                            <i class="fa fa-phone-volume"></i>
                                                                            <span class="cart_asset_link">CẦN GIÚP ĐỠ?</span>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="cart-aside">
                                                    <div class="cart-aside-order_summary">
                                                        <div class="cart_summary-body order_summary-body">
                                                            <h3 class="cart_summary-title order_summary-title">Địa chỉ nhận hàng</h3>
                                                            <div class="summary_subtotal">
                                                                <div class="summary_subtotal-label">
                                                                    <span class="summary_subtotal-label_text">Họ & tên <span class="span-error">(*)</span></span>
                                                                </div>
                                                            </div>
                                                            <div class="cart_shipping_method">
                                                                <div class="form-group d-flex align-items-center">
                                                                    <div class="w-100 d-flex align-items-center">
                                                                        <asp:TextBox ID="txtFullName" CssClass="info-user-order form-control" runat="server"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="summary_subtotal">
                                                                <div class="summary_subtotal-label">
                                                                    <span class="summary_subtotal-label_text">Điện thoại <span class="span-error">(*)</span></span>
                                                                </div>
                                                            </div>
                                                            <div class="cart_shipping_method">
                                                                <div class="form-group d-flex align-items-center">
                                                                    <div class="w-100 d-flex align-items-center">
                                                                        <asp:TextBox ID="txtPhone" CssClass="info-user-order form-control" runat="server"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="summary_subtotal">
                                                                <div class="summary_subtotal-label">
                                                                    <span class="summary_subtotal-label_text">Email <span class="span-error">(*)</span></span>
                                                                </div>
                                                            </div>
                                                            <div class="cart_shipping_method">
                                                                <div class="form-group d-flex align-items-center">
                                                                    <div class="w-100 d-flex align-items-center">
                                                                        <asp:TextBox ID="txtEmail" CssClass="info-user-order form-control" runat="server"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                <ContentTemplate>
                                                                    <div class="summary_subtotal">
                                                                <div class="summary_subtotal-label">
                                                                    <span class="summary_subtotal-label_text">Tỉnh/Thành phố <span class="span-error">(*)</span></span>
                                                                </div>
                                                            </div>
                                                            <div class="cart_shipping_method">
                                                                <div class="form-group d-flex align-items-center">
                                                                    <div class="w-100 d-flex align-items-center">
                                                                        <asp:DropDownList OnSelectedIndexChanged="ddlThanhPho_SelectedIndexChanged" ID="ddlThanhPho" AutoPostBack="true" runat="server" CssClass="js-cart_shipping_method-select cart_shipping_method-select custom-select form-control shippingMethods"></asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="summary_subtotal">
                                                                <div class="summary_subtotal-label">
                                                                    <span class="summary_subtotal-label_text">Quận/huyện <span class="span-error">(*)</span></span>
                                                                </div>
                                                            </div>
                                                            <div class="cart_shipping_method">
                                                                <div class="form-group d-flex align-items-center">
                                                                    <div class="w-100 d-flex align-items-center">
                                                                        <asp:DropDownList OnSelectedIndexChanged="ddlQuanHuyen_SelectedIndexChanged" AutoPostBack="true" ID="ddlQuanHuyen" runat="server" CssClass="js-cart_shipping_method-select cart_shipping_method-select custom-select form-control shippingMethods"></asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="summary_subtotal">
                                                                <div class="summary_subtotal-label">
                                                                    <span class="summary_subtotal-label_text">Phường/xã <span class="span-error">(*)</span></span>
                                                                </div>
                                                            </div>
                                                            <div class="cart_shipping_method">
                                                                <div class="form-group d-flex align-items-center">
                                                                    <div class="w-100 d-flex align-items-center">
                                                                        <asp:DropDownList ID="ddlPhuongXa" runat="server" CssClass="js-cart_shipping_method-select cart_shipping_method-select custom-select form-control shippingMethods"></asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                            <div class="summary_subtotal">
                                                                <div class="summary_subtotal-label">
                                                                    <span class="summary_subtotal-label_text">Địa chỉ <span class="span-error">(*)</span></span>
                                                                </div>
                                                            </div>
                                                            <div class="cart_shipping_method">
                                                                <div class="form-group d-flex align-items-center">
                                                                    <div class="w-100 d-flex align-items-center">
                                                                        <asp:TextBox ID="txtAddress" CssClass="info-user-order form-control" runat="server"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="cart-aside-order_summary">
                                                        <div class="cart_summary-body order_summary-body">
                                                            <h3 class="cart_summary-title order_summary-title">Tóm tắt đơn hàng
                                                            </h3>
                                                            <div class="summary_subtotal">
                                                                <div class="summary_subtotal-label">
                                                                    <span class="summary_subtotal-label_text">Tạm tính</span>
                                                                </div>
                                                                <div class="summary_subtotal-value">
                                                                    <span class="summary_subtotal-value_text sub-total">0 π</span>
                                                                    <%--<span class="summary_subtotal-value_text sub-total"><%=shopping.TotalAmount.ToString("#,##0") %> π</span>--%>
                                                                </div>
                                                            </div>
                                                            <div class="summary_subtotal">
                                                                <div class="summary_subtotal-label">
                                                                    <span class="summary_subtotal-label_text">Phí giao dịch (sàn)</span>
                                                                </div>
                                                                <div class="summary_subtotal-value">
                                                                    <span class="summary_subtotal-value_text sub-purchase-fee-total"><%=shopping.PurchaseFee.ToString("#,##0") %> π</span>
                                                                    <%--<span class="summary_subtotal-value_text sub-total"><%=shopping.TotalAmount.ToString("#,##0") %> π</span>--%>
                                                                </div>
                                                            </div>
                                                            <div class="cart_shipping_method">
                                                                <div class="form-group d-flex align-items-center">
                                                                    <div class="w-100 d-flex align-items-center">
                                                                        <asp:DropDownList ClientIDMode="Static" ID="shippingMethods" runat="server" CssClass="js-cart_shipping_method-select cart_shipping_method-select custom-select form-control shippingMethods"></asp:DropDownList>
                                                                        <asp:HiddenField ID="hdfshippingValue" ClientIDMode="Static" Value="0" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="js-progress-bar-cart"></div>

                                                            <div class="checkout-continue cart_fixed_part">
                                                                <div class="d-block">
                                                                    <div class="summary_subtotal grand_total ">
                                                                        <div class="summary_subtotal-label">
                                                                            <span class="summary_subtotal-label_text">Tổng tiền:</span>
                                                                        </div>
                                                                        <div class="summary_subtotal--value">
                                                                            <span class="summary_subtotal-value_text grand-total">0 π</span>
                                                                            <%--<span class="summary_subtotal-value_text grand-total"><%=shopping.TotalAmount.ToString("#,##0") %> π</span>--%>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <asp:Button ID="btnContinueCheckOut" CssClass="btn btn-block checkout-btn btn-success" OnClick="btnContinueCheckOut_Click" runat="server" Text="Thanh toán" />
                                                                </div>
                                                            </div>
                                                            <div class="cart_pm_wrap" style="display:none;">
                                                                <div class="content-asset">
                                                                    <div class="payment_methods_part">
                                                                        <h3 class="payment_methods_part-title">CHẤP NHẬN THANH TOÁN</h3>
                                                                        <div class="payment_methods_part-img">
                                                                            <img
                                                                                alt="Mastercard"
                                                                                class="payment_icon"
                                                                                src="/pi-layout/assets/img/ico/master-card.png"
                                                                                style="max-width: 30px;" />
                                                                            <img
                                                                                alt="VISA"
                                                                                class="payment_icon"
                                                                                src="/pi-layout/assets/img/ico/visa.png"
                                                                                style="max-width: 30px;" />
                                                                            <img
                                                                                alt="American Express"
                                                                                class="payment_icon"
                                                                                src="/pi-layout/assets/img/ico/american-express.png"
                                                                                style="max-width: 30px;" />
                                                                            <img
                                                                                alt="PayPal"
                                                                                class="payment_icon"
                                                                                src="/pi-layout/assets/img/ico/paypal.png"
                                                                                style="max-width: 30px;" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </asp:View>
                    </asp:MultiView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
    <asp:HiddenField ID="hdfProductIdPayment" ClientIDMode="Static" runat="server" />
    <script src="/pi-layout/assets/js/crud-cart.js"></script>
</asp:Content>