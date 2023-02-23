<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="sellersanpham.aspx.cs" Inherits="gianhang_chitietsanpham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    <%=seo.SeoTitle %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cssContentPlaceHolder" runat="Server">
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
                <span>Hệ thống đang xử lý. Xin vui lòng đợi</span>
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
    <div class="div-dathang">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-8 col-xs-12">
                    <div class="div-content-trans">
                        <h1>
                            <a href="/san-dau-gia/san-pham/<%=product.ProductName.RemoveSymbol() %>-<%=product.Id %>.html" title="<%=product.ProductName %>" target="_blank">
                                <%=product.ProductName %>
                            </a>
                        </h1>
                        <div class="trans-time-code">
                            <div class="code">Mã lệnh: <span class="code-text"><%=order.Code %></span><span class="copy" data-clipboard-text="<%=order.Code %>"><i class="fa fa-clone" aria-hidden="true"></i></span></div>
                            <div class="time">Thời gian tạo: <span><%=order.CreatedAt.Value.ToString("dd/MM/yyyy HH:mm:ss") %></span></div>
                            <div class="time">Mã sản phẩm: <span><%=product.Code %></span></div>
                            <div class="time">Giá khởi điểm: <span><%=product.PriceAuction.Value.ToString("0.##") %>π</span></div>
                        </div>
                        <div class="trans-money">
                            <div class="div-price">
                                <span class="text">Giá đặt</span>
                                <span class="number color1"><%=order.PriceAuction.Value.ToString("0.##") %>π</span>
                            </div>
                            <div class="div-price div-price-auction">
                                <span class="text">Ngày đặt</span>
                                <span class="number color2"><%=order.pro_Product.pro_HistoryProductAuctions.Single(n=>n.IsWin==true).CreatedAt.Value.ToString("dd/MM/yyyy HH:mm:ss") %></span>
                            </div>
                            <div class="div-price">
                                <span class="text">Cần thanh toán</span>
                                <span class="number color3"><%=order.TotalAmount.Value.ToString("0.##") %>π</span>
                            </div>
                        </div>
                        <h2>Thông tin thanh toán</h2>
                        <div class="trans-info-payment">
                            <ul>
                                <li><span class="title">Nội dung thanh toán</span>
                                    <span class="content"><%=order.Code %></span>
                                    <span class="copy" data-clipboard-text="<%=order.Code %>"><i class="fa fa-clone" aria-hidden="true"></i></span>
                                </li>
                                <li><span class="title">Mã nhà bán hàng</span>
                                    <span class="content"><%=seller.Code %></span>
                                    <span class="copy" data-clipboard-text="<%=order.Code %>"><i class="fa fa-clone" aria-hidden="true"></i></span>
                                </li>
                                <li><span class="title">Tên nhà bán hàng</span>
                                    <span class="content"><%=seller.FullName %></span>
                                    <span class="copy" data-clipboard-text="<%=order.Code %>"><i class="fa fa-clone" aria-hidden="true"></i></span>
                                </li>
                                <li><span class="title">Điện thoại</span>
                                    <span class="content"><%=seller.Phone %></span>
                                    <span class="copy" data-clipboard-text="<%=seller.Phone %>"><i class="fa fa-clone" aria-hidden="true"></i></span>
                                </li>
                                <li><span class="title">Ví Pi</span>
                                    <span class="content"><%=seller.PiWallet %></span>
                                    <span class="copy" data-clipboard-text="<%=seller.PiWallet %>"><i class="fa fa-clone" aria-hidden="true"></i></span>
                                </li>
                            </ul>
                        </div>
                        <h2>Sau khi đã chuyển hàng nhấp vào nút "Đã chuyển, thông báo cho người mua".</h2>
                        <div class="trans-button">
                            <asp:Panel ID="Panel1" Visible="false" runat="server">
                                <a href="javascript:void(0);" id="xac-nhan-nhan-tien" class="btn btn-warning">Xác nhận, đã chuyển hàng</a><p></p>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" Visible="false" runat="server">
                                <div class="alert alert-info" role="alert">
                                    <asp:Literal ID="ltrNguoiMua" runat="server"></asp:Literal>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel3" Visible="false" runat="server">
                                <div class="alert alert-success" role="alert">
                                    Giao dịch thành công
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel4" Visible="false" runat="server">
                                <div class="alert alert-danger" role="alert">
                                    Giao dịch đã hủy
                                </div>
                            </asp:Panel>
                        </div>
                        <div class="clear-both"></div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="clear-both"></div>
                    <div class="div-khungchat">
                        <div class="div-khungchat-header">
                            <div>
                                <img src="/<%=buyer.Avatar %>" alt="<%=buyer.FullName %>" />
                            </div>
                            <span class="seller-name"><%=buyer.FullName %></span>
                            <span class="shop-name"><%=buyer.Code %></span>
                        </div>
                        <div class="div-khungchat-body">
                            <asp:Repeater ID="rptNoiDungChat" runat="server">
                                <ItemTemplate>
                                    <div class="<%#Eval("MessageCss") %>">
                                        <div class="title"><%#Eval("FullName") %> <span>(<%#Eval("CreatedAt","{0:dd/MM/yyyy HH:mm:ss}") %>)</span></div>
                                        <div class="message"><%#Eval("Message") %></div>
                                    </div>
                                    <div class="clear-both"></div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="div-khungchat-footer">
                            <asp:TextBox ID="textChat" TextMode="MultiLine" Rows="2" runat="server"></asp:TextBox>
                            <span class="file"><i class="fa fa-paperclip" aria-hidden="true"></i>
                                <asp:FileUpload ID="fulAttachment" runat="server" />
                            </span>
                            <span class="send" data-user="<%=Account.Id %>" data-cate="seller"><i class="fa fa-paper-plane" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdfMainPageId" Value="4" ClientIDMode="Static" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
    <asp:HiddenField ID="hdfCodeOrder" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="hdfUrl" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="hdfShop" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="hdfPurchaseFee" ClientIDMode="Static" runat="server" />
    <script src="/pi-layout/assets/vendor/bootstrap-4.0.0-dist/js/bootstrap.bundle.min.js"></script>

    <script src="/pi-layout/assets/js/clipboard.js-master/dist/clipboard.js"></script>
    <script src="/pi-layout/assets/js/auction-mua-hang.js"></script>

</asp:Content>

