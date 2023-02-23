<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="sanphamall.aspx.cs" Inherits="gianhang_Default" %>

<%@ Register Src="~/gianhang/UC/topUserControl.ascx" TagPrefix="uc1" TagName="topUserControl" %>
<%@ Register Src="~/gianhang/left/slidebarLeftUserControl.ascx" TagPrefix="uc1" TagName="slidebarLeftUserControl" %>



<asp:Content ID="Content1" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    <%=seo.SeoTitle %> - <%=shopRental.Name %>
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

        <section class="shop-list section-padding">
            <div class="container">
                <div class="row">
                    <uc1:slidebarLeftUserControl runat="server" ID="slidebarLeftUserControl1" />
                    <div class="col-md-9 san-pham-gian-hang">
                        <div class="shop-head">
                            <div class="btn-group float-right mt-2">
                                <asp:DropDownList ID="ddlSort" CssClass="form-control ddlSort filter-popularity popularity-filter-box" runat="server"></asp:DropDownList>
                                <asp:DropDownList Width="70px" ID="ddlPageSize" CssClass="form-control ddlPageSize page-item-box" runat="server"></asp:DropDownList>
                            </div>
                            <h5 class="mb-3"><%=seo.Name %></h5>
                        </div>
                        <div class="row no-gutters padding-mobile">
                            <asp:Repeater ID="rptProduct" OnItemDataBound="rptProduct_ItemDataBound" runat="server">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdfId" Value='<%#Eval("Id") %>' runat="server" />
                                    <%--<asp:Literal ID="ltrJsonLDT" runat="server"></asp:Literal>--%>
                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                        <div class="custom-box-product product">
                                            <a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>">
                                                <div class="product-header">
                                                    <asp:Literal ID="ltrBadge" runat="server"></asp:Literal>
                                                    <img class="img-fluid" src="<%#urlDomainShare%>/<%#Eval("Image") %>" alt="<%#Eval("ProductName") %>" title="<%#Eval("ProductName") %>">
                                                </div>
                                                <div class="product-body">
                                                    <h5><a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>"><%#Eval("ProductName") %></a></h5>
                                                </div>
                                                <div class="product-footer add-to-cart-button">
                                                    <asp:Literal ID="ltrBuyProduct" runat="server"></asp:Literal>
                                                    <asp:Literal ID="ltrPrice" runat="server"></asp:Literal>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="shop-pagging">
                            <div class="pull-right">
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            </div>
                            <div class="clear-both"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <asp:HiddenField ID="hdfMainPageId" Value="3" ClientIDMode="Static" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
    <asp:HiddenField ID="urlRequest" ClientIDMode="Static" runat="server" />
    <script src="/pi-layout/assets/js/san-pham-gian-hang.js"></script>
    <script src="/pi-layout/assets/js/dathang.js"></script>
</asp:Content>

