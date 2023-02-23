<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="san-dau-gia.aspx.cs" Inherits="gianhang_Default" %>

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
    <main id="main" class="main-gian-hang div-san-dau-gia">
        <div class="page-title">
            <div class="container">
                <h1><%=seo.Name %></h1>
            </div>
        </div>
        <div id="filter" class="filter-danh-sach">
            <div class="container">
                <div class="pull-left">
                    <div class="form-inline">
                        <div class="form-group">
                            
                            <asp:TextBox ID="txtKeyword" CssClass="txtKeyword form-control" runat="server" placeholder="Theo tên / theo mã / theo tỷ giá"></asp:TextBox>
                            <asp:DropDownList ID="ddlDanhMuc" CssClass="ddlDanhMuc form-control" runat="server"></asp:DropDownList>
                            <button type="button" class="btnSearch btn btn-warning"><i class="fa fa-search" aria-hidden="true"></i>&nbsp; Tìm kiếm</button>
                        </div>
                    </div>
                </div>
                <div class="pull-right">
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="for-title"><strong>Sắp xếp</strong></label>&nbsp;
                               
                            <asp:DropDownList ID="ddlSort" CssClass="ddlSort form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="list">
            <div class="container">
                <div class="shop-list">
                    <div class="row">
                        <asp:Repeater ID="rptProduct" OnItemDataBound="rptProduct_ItemDataBound" runat="server">
                            <ItemTemplate>
                                <asp:HiddenField ID="hdfId" Value='<%#Eval("Id") %>' runat="server" />
                                <%--box-item--%>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="box-shop">
                                        <a title="<%#Eval("ProductName") %>" href="/san-dau-gia/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol() %>-<%#Eval("Id") %>.html">
                                            <div class="box-img" style="background-image: url('/<%#Eval("Image") %>');">
                                                <a href="/san-dau-gia/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol() %>-<%#Eval("Id") %>.html">
                                                    <img title="<%#Eval("ProductName") %>" alt="<%#Eval("ProductName") %>" src="/<%#Eval("Image") %>" /></a>
                                            </div>
                                            <div class="box-name">
                                                <h3 class="custom-dau-gia">
                                                    <a title="<%#Eval("ProductName") %>" href="/san-dau-gia/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol() %>-<%#Eval("Id") %>.html"><%#Eval("ProductName") %></a>
                                                </h3>
                                                <h4 class="code code-cus-dau-gia">Mã:&nbsp;<%#Eval("Code") %></h4>
                                                <%--<span class="exchange-rate">1π = <%#Eval("ExchangeRate") %>$</span>--%>
                                            </div>
                                            <%--<div class="box-summary">
                                                <p><%#Eval("Summary") %></p>
                                            </div>--%>
                                            <div class="jumbotron countdown show" data-date='<%#Eval("AuctionEnd","{0:yyyy/MM/dd HH:mm:ss}") %>'>
                                                <div class="running">
                                                    <timer>
      <span class="days"></span><span class="hours"></span><span class="minutes"></span><span
              class="seconds"></span>
      </timer>
                                                    <div class="break"></div>
                                                    <div class="labels">
                                                        <span>Ngày</span><span>Giờ</span><span>Phút</span><span>Giây</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="box-footer">
                                                <div class="price">
                                                    <span class="gia-thue">Giá khởi điểm: <strong><%#Eval("PriceAuction","{0:#,##0}") %>π</strong></span>
                                                </div>
                                                <div class="clear-both"></div>
                                                <div class="summary-info-dau-gia">
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
                                                <div class="button">
                                                    <a class="btn-thue view-more-page" href="/auction/popup/pophistoryauction.aspx?Id=<%#Eval("Id") %>" data-id="<%#Eval("Id") %>"><i class="fa fa-history" aria-hidden="true"></i>&nbsp; Lịch sử đấu giá</a>
                                                    <asp:Literal ID="ltrDatGiaThau" runat="server"></asp:Literal>
                                                </div>
                                                <div class="clear-both"></div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <%--box-item--%>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="shop-pagging">

                        <div class="pull-left">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </div>
                        <div class="pull-right">
                            <label for="for-title">Hiển thị:</label>&nbsp;
                            <asp:DropDownList ID="ddlPageSize" CssClass="ddlPageSize form-control" runat="server"></asp:DropDownList>&nbsp;&nbsp;&nbsp;
                        </div>
                        <div class="clear-both"></div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <asp:HiddenField ID="hdfMainPageId" Value="4" ClientIDMode="Static" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
    <asp:HiddenField ID="urlRequest" ClientIDMode="Static" runat="server" />
    <script src="/pi-layout/assets/countdown/multi-countdown.js"></script>
    <script src="/pi-layout/assets/js/san-dau-gia.js"></script>
</asp:Content>

