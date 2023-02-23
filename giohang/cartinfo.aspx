<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="cartinfo.aspx.cs" Inherits="page_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    <%=seo.SeoTitle %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cssContentPlaceHolder" runat="Server">
    <link href="/pi-layout/assets/css/checkout.css" rel="stylesheet" />
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
    <asp:HiddenField ID="hdfMainPageId" Value="1" ClientIDMode="Static" runat="server" />
    <div class="div-page-main">
        <div class="container">
            <div class="page-content">
                <div class="main-checkout">
                    <div class="cart-wrap" id="cart">

                        <div class="box-orderresult" data-phone="0798536635" data-login="true">

                            <div class="info">
                                <div class="group-info-order">
                                    <p class="msg message-thanks">
                                        <i class="icon-ordersuccess"></i>
                                        ĐẶT HÀNG THÀNH CÔNG
                       
                                    </p>
                                    <div class="listinfo">
                                        <ul class="shipping">
                                            <li>Mã đơn hàng: <b><%=groupOrder.Code %></b></li>
                                            <li>Người nhận: <%=groupOrder.order_Orders.First().FullName %>,
                                           
                                                <b><%=groupOrder.order_Orders.First().Phone %>
                                            </b>
                                            <%--</li>

                                            <li>xxxx, Phường Đa Kao, Quận 1, Hồ Chí Minh
                                </li>
                                            <li>Dự kiến giao từ: <b>13/02/2023 - 15/02/2023</b>
                                            </li>--%>
                                        </ul>
                                    </div>
                                    
                                    <div class="totalCart">
                                        Số tiền thanh toán:
                                   
                                        <b><%=groupOrder.TotalAmount.Value.ToString("#,##0") %> π</b>
                                    </div>
                                    <div id="bodyContentPlaceHolder_Panel2">

                                        <div class="group-info-payment">
                                            <div class="message-info-payment">
                                                <div class="pay-cash ">
                                                    <div>
                                                        <i class="icon-cash"></i>
                                                    </div>
                                                    <div>
                                                        <b>Thanh toán:
                                            </b>qua ví điện tử PI
                                       
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="btn-home">
                                    <a href="/">Về trang chủ</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
    <asp:HiddenField ID="hdfProductIdPayment" ClientIDMode="Static" runat="server" />
    <script src="/pi-layout/assets/js/crud-cart.js"></script>
</asp:Content>
