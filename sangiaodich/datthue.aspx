<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="datthue.aspx.cs" Inherits="gianhang_chitietsanpham" %>

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
                    <li class="breadcrumb-item"><a href="/san-giao-dich.html" title="Bất động sản">Bất động sản</a></li>
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
                <div class="container-dat-thue-gian-hang col-md-8 col-sm-8 col-xs-12">
                    <div class="div-content-trans">
                        <h1>
                            <a href="/san-giao-dich.html" title="Bất động sản" target="_blank">
                                <%=store_Shop.Name %>
                            </a>
                        </h1>
                        <div class="trans-time-code">
                            <div class="code">Mã cửa hàng: <span class="code-text"><%=store_Shop.Code %></span><span class="copy" data-clipboard-text="<%=store_Shop.Code %>"><i class="fa fa-clone" aria-hidden="true"></i></span></div>
                            <div class="time">Tên cửa hàng: <span><%=store_Shop.Name %></span></div>
                            <div class="time">Vị trí cửa hàng: <span><%=store_Shop.NumOr %></span></div>
                            <div class="time">Số tháng thuê: <span><%=sys_Config.ShopRentalCycle %></span></div>
                        </div>
                        <div class="trans-money trans-money-aution">
                            <div class="div-price">
                                <span class="text">Giá thuê</span>
                                <span class="number color1"><%=store_Shop.Price.Value.ToString("0.##") %>π</span>
                            </div>
                            <div class="div-price div-price-auction">
                                <span class="text">Đặt cọc</span>
                                <span class="number color2"><%=(store_Shop.Price*2).Value.ToString("0.##") %>π</span>
                            </div>
                            <div class="div-price">
                                <span class="text">Cần thanh toán</span>
                                <span class="number color3"><%=(store_Shop.Price*2+store_Shop.Price).Value.ToString("0.##") %>π</span>
                            </div>
                        </div>
                        <h2>Chi tiết thanh toán</h2>
                        <div class="trans-info-payment chi-tiet-thanh-toan-dat-hang-thue-cua-hang">
                            <table role="table" class="table table-striped">
                                <thead role="rowgroup">
                                    <tr role="row">
                                        <th role="columnheader">STT</th>
                                        <th role="columnheader">Hình thức</th>
                                        <th role="columnheader">Ngày thanh toán</th>
                                        <th role="columnheader">Số tiền</th>
                                    </tr>
                                </thead>
                                <tbody role="rowgroup">
                                    <asp:Repeater ID="rptThongTinThanhToan" runat="server">
                                        <ItemTemplate>
                                            <tr role="row">
                                                <td role="cell" data-title="STT"><%#Eval("STT") %></td>
                                                <td role="cell" data-title="Hình thức"><%#Eval("HinhThuc") %></td>
                                                <td role="cell" data-title="Ngày thanh toán"><%#Eval("NgayThanhToan") %></td>
                                                <td role="cell" data-title="Số tiền"><%#Eval("SoTien") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                        <h2>Sau khi nhận được hàng, nhấp vào nút "Đã nhận, thông báo cho người bán".</h2>
                        <div class="trans-button">
                            <a href="javascript:void(0);" id="xac-nhan-dat" class="btn btn-warning">Đã nhận hàng, thông báo cho người bán</a><p></p>
                        </div>
                        <div class="clear-both"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdfMainPageId" Value="2" ClientIDMode="Static" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
    <asp:HiddenField ID="hdfUrl" ClientIDMode="Static" runat="server" />
    <script src="/pi-layout/assets/vendor/bootstrap-4.0.0-dist/js/bootstrap.bundle.min.js"></script>
    <script src="/pi-layout/assets/js/clipboard.js-master/dist/clipboard.js"></script>
    <script src="/pi-layout/assets/js/san-giao-dich-dat-thue.js"></script>
</asp:Content>

