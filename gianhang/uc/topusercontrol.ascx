<%@ Control Language="C#" AutoEventWireup="true" CodeFile="topUserControl.ascx.cs" Inherits="gianhang_UC_topUserControl" %>
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
<div class="page-title">
    <div class="container">
        <div class="detail-header">
            <h3>
                <img title="Vị trí" alt="Vị trí" src="/pi-layout/assets/location.png" />&nbsp;<%=seo.Name %></h3>
            <h4 class="code">Mã:&nbsp;<%=seo.Code %></h4>
            <span class="exchange-rate">1π = <%=seo.ExchangeRate %>$</span>
        </div>
    </div>
</div>
<div id="banner" class="banner-shop">
    <div class="container">
        <div class="box-banner">
            <div class="img">
                <a href="<%=store_ShopBanner.Link %>" title="<%=store_ShopBanner.Name %>">
                    <img src="/<%=store_ShopBanner.Image %>" alt="<%=store_ShopBanner.Name %>" /></a>
            </div>
            <div class="bottom">
                <div class="pull-left">
                    <nav id="navbar1" class="navbar navbar1">
                        <ul id="menu-main-menu-1">
                            <li><a id="menu-gian-hang-1" href="/gian-hang/<%=seo.Name.RemoveSymbol() %>-<%=seo.Id %>.html">Trang chủ</a></li>
                            <li><a id="menu-gian-hang-2" href="/gian-hang/gioi-thieu/<%=seo.Name.RemoveSymbol() %>-<%=seo.Id %>.html">Giới thiệu</a></li>
                            <li class="dropdown mmenu-1"><a id="menu-gian-hang-3" href="javascript:void(0);"><span>Sản phẩm</span> <i class="bi bi-chevron-down"></i></a>
                                <ul class="sub-menu-gian-hang">
                                    <asp:Repeater ID="rptCateProDM" runat="server">
                                        <ItemTemplate>
                                            <li><a href="<%#urlDomainShare %>/gian-hang/san-pham-gian-hang/<%#Eval("Name").ToString().RemoveSymbol()%>-<%#Eval("Id") %>-<%#Eval("shopRentalId") %>.html" title="<%#Eval("Name")%>"><img src="/<%#Eval("Icon") %>" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>" />&nbsp;<%#Eval("Name")%></a></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </li>
                            <li style="display:none;"><a id="menu-gian-hang-4" href="/gian-hang/hoat-dong/thu-vien-hinh-<%=seo.Id %>.html">Hoạt động</a></li>
                            <li><a id="menu-gian-hang-5" href="/gian-hang/san-pham/khuyen-mai-<%=seo.Id %>.html">Khuyến mãi</a></li>
                        </ul>
                        <i id="sub-menu-gian-hang-mobile" class="bi bi-list sub-menu-gian-hang-mobile mobile-nav-toggle"></i>
                    </nav>
                    <%--<ul id="menu-gian-hang">
                        <li><a id="menu-gian-hang-1" href="/gian-hang/<%=seo.Name.RemoveSymbol() %>-<%=seo.Id %>.html">Trang chủ</a></li>
                        <li><a id="menu-gian-hang-2" href="/gian-hang/gioi-thieu/<%=seo.Name.RemoveSymbol() %>-<%=seo.Id %>.html">Giới thiệu</a></li>
                        <li><a id="menu-gian-hang-3" href="/gian-hang/san-pham/danh-sach-san-pham-<%=seo.Id %>.html">Sản phẩm</a></li>
                        <li><a id="menu-gian-hang-4" href="/gian-hang/hoat-dong/thu-vien-hinh-<%=seo.Id %>.html">Hoạt động</a></li>
                        <li><a id="menu-gian-hang-5" href="/gian-hang/san-pham/khuyen-mai-<%=seo.Id %>.html">Khuyến mãi</a></li>
                    </ul>--%>
                </div>
                <div class="pull-right">
                    <ul>
                        <li><a href="javascript:void(0);"><span class="shop-status-detail <%=seo.store_ShopStatus.StatusCss %>"><%=seo.store_ShopStatus.Name %></span></a></li>
                        <li><a href="tel:<%=seo.Hotline %>" title="<%=seo.Hotline %>"><i class="fa fa-mobile" aria-hidden="true"></i></a></li>
                        <li><a href="<%=seo.FacebookMess %>" target="_blank"><i class="fa fa-comments" aria-hidden="true"></i></a></li>
                        <li><a href="<%=seo.Facebook %>"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                        <li><a href="<%=seo.Facebook %>"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                        <li><a href="<%=seo.LinkGoogleMap %>"><i class="fa fa-map" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<asp:HiddenField ID="hdfMenuGianhang" ClientIDMode="Static" runat="server" />
