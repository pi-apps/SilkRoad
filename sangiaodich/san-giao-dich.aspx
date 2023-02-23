<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="san-giao-dich.aspx.cs" Inherits="gianhang_Default" %>

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
    <main id="main" class="main-gian-hang div-san-giao-dich">
        <div class="page-title">
            <div class="container">
                <h1><%=seo.Name %></h1>
            </div>
        </div>
        <div id="filter" class="filter-danh-sach">
            <div class="container">
                <div class="pull-left pull-left-mobile">
                    <div class="form-inline">
                        <div class="form-group">
                            
                            <asp:TextBox ID="txtKeyword" CssClass="txtKeyword form-control" runat="server" placeholder="Theo tên / theo mã / theo tỷ giá"></asp:TextBox>
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
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="box-shop">
                                        <a title="<%#Eval("Name") %>" href="#">
                                            <div class="box-img" style="background-image: url('/<%#Eval("Banner") %>');">
                                                <img title="<%#Eval("Name") %>" alt="<%#Eval("Name") %>" src="/<%#Eval("Banner") %>" />
                                            </div>
                                            <div class="box-name">
                                                <h3 class="custom-dau-gia">
                                                    <img title="Vị trí" alt="Vị trí" src="/pi-layout/assets/location.png" />&nbsp;<%#Eval("Name") %></h3>
                                                <h4 class="code">Mã:&nbsp;<%#Eval("Code") %></h4>
                                                <span class="exchange-rate">Vị trí: <%#Eval("NumOr") %></span>
                                            </div>
                                            <%--<div class="box-summary">
                                                <p><%#Eval("Summary") %></p>
                                            </div>--%>
                                            <div class="box-footer">
                                                <div class="price">
                                                    <asp:Literal ID="ltrGia" runat="server"></asp:Literal>
                                                    <%--<span class='gia-thue'>Giá thuê: <strong> <%#Eval("Price","{0:#,##0}") %>π</strong></span>
                                                    <span class='price-icon'><img src='/pi-layout/assets/icon-price.png' /></span>
                                                    <span class='gia-mua'>Giá mua: <strong> <%#Eval("PriceSold","{0:#,##0}") %>π</strong></span>--%>
                                                </div>
                                                <div class="clear-both"></div>
                                                <div class="button">
                                                    <asp:Literal ID="ltrbtnThue" runat="server"></asp:Literal>
                                                    <asp:Literal ID="ltrMua" runat="server"></asp:Literal>
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
    <asp:HiddenField ID="hdfMainPageId" Value="2" ClientIDMode="Static" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
    <asp:HiddenField ID="urlRequest" ClientIDMode="Static" runat="server" />
    
    <script src="/pi-layout/assets/js/san-giao-dich.js"></script>
    <script src="/pi-layout/assets/js/action-san-giao-dich.js"></script>
</asp:Content>

