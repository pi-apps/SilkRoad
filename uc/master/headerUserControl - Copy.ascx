<%@ Control Language="C#" AutoEventWireup="true" CodeFile="headerUserControl - Copy.ascx.cs" Inherits="UC_master_headerUserControl" %>
<header id="header" class="header">
    <%--d-flex--%>
    <div class="container-fluid container-xl align-items-center justify-content-between">
        <div class="header-logo">
            <a href="<%=urlDomain %>" class="logo d-flex align-items-center">
                <img src="/logo.png" alt="<%=AltImage %>">
            </a>
        </div>
        <nav id="navbar" class="navbar">
            <ul id="menu-main-menu">
                <li class="menu-home-header-1 menu-size-1 menu-level-1"><a href="<%=urlDomain %>/home.aspx">
                    <%--<img src="/pi-layout/icon/home.png" />--%>
                    <i class="fa fa-home" aria-hidden="true"></i>
                </a></li>
                <li class="menu-home-header-2 menu-size-2 menu-level-1"><a href="/about-us.html">About us</a></li>
                <li class="menu-home-header-3 menu-size-3 menu-level-1"><a href="/247-support.html">24/7 Support</a></li>
                <li class="menu-size-4 menu-google menu-level-1">
                    <div id='google_translate_element'></div>
                </li>
                <%if (Session["PiglobalUser"] == null)
                    { %>
                <li class="menu-home-header-account menu-level-1">
                    <a href="javascript:;" class="login_pi">Sign In</a></li>
                    <%--<a href="/member/dang-ky.aspx">Sign up</a></li>--%>
                <%}
                    else
                    {
                        var customer1 = Session["PiglobalUser"] as Database.store_Customer;
                        var cus = dbConnect.store_Customers.Single(n => n.Id == customer1.Id);
                %>
                <li class="menu-level-1 dropdown">
                    <a href="javascript:void(0);"><span>
                        <img src="/<%=cus.Avatar %>" width="40" height="40" class="rounded-circle" /></span>
                        &nbsp;Tài khoản<%--<%=cus.FullName %>--%>&nbsp;<i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="/danh-sach-gian-hang.html"><i class="fa fa-money" aria-hidden="true"></i>&nbsp;Số dư: <%=cus.AmountBalance %> π</a></li>
                        <li><a href="/taikhoan/cuahang/danhsachdangthue/list.aspx"><i class="fa fa-bandcamp" aria-hidden="true"></i>&nbsp;Gian hàng</a></li>
                        <li><a href="/taikhoan"><i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;Tài khoản</a></li>
                        <asp:LinkButton ID="LinkButton2" CssClass="dropdown-item" runat="server" OnClick="lnkLogOut_Click"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;Đăng xuất</asp:LinkButton>
                    </ul>
                </li>
                <%} %>
                <li class="menu-cart-header menu-level-1">
                    <a href="/checkout/cart.html">
                        <img src="/pi-layout/icon/cart.png" />
                        <%--<br />
                        <span>My cart</span>--%>
                    </a>
                    <a href="https://wallet.pi">
                        <img src="/pi-layout/icon/wallet.png" />
                        <%--<br />
                        <span>wallet.pi</span>--%>
                    </a>
                </li>
            </ul>
            <ul class="menu-new-2">
                <li>
                    <a href="javascript:;" title="Shopping Mall">Shopping Mall</a>
                    <ul class="menu-new-3">
                        <li><a href="/shopping-mall/create-my-new-booth.html" title="Create my new booth">Create my new booth</a></li>
                        <li><a href="/san-giao-dich.html" title="Booths for rent/sale">Booths for rent/sale</a></li>
                        <li><a href="/danh-sach-gian-hang.html" title="Shops">Shops</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript:;" title="Project">Project</a>
                    <ul class="menu-new-3">
                        <li><a href="/project/smart-city-3d.html" title="Smart City 3D">Smart City 3D</a></li>
                        <li><a href="/project/swap-pi.html" title="Swap Pi">Swap Pi</a></li>
                        <li><a href="/project/lucky-pi.html" title="Lucky Pi">Lucky Pi</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript:;" title="3D Solution">3D Solution</a>
                    <ul class="menu-new-3">
                        <li><a href="/3dsolution/purchase-3d-model.html" title="Purchase 3D Model">Purchase 3D Model</a></li>
                        <li><a href="/3dsolution/purchase-nft.html" title="Purchase NFT">Purchase NFT</a></li>
                        <li><a href="/3dsolution/view-3d-world.html" title="View 3D World">View 3D World</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript:;" title="Utilities">Utilities</a>
                    <ul class="menu-new-3">
                        <li><a href="/san-dau-gia.html" title="Auction Floor">Auction Floor</a></li>
                        <li><a href="/utilities/post-my-ads.html" title="Post My Ads">Post My Ads</a></li>
                        <li><a href="/cafeteria.html" title="Cafeteria">Cafeteria</a></li>

                    </ul>
                </li>
                <li>
                    <a href="/leader-board.html" title="Leaderboard">Leaderboard</a>
                </li>
                <li>
                    <a href="/map.html" title="Map">Map</a>
                </li>
            </ul>
            <ul class="menu-mobile-website">
                <li class="menu-mobile-website-level1"><a href="/home.aspx">Home page</a></li>
                <li class="menu-mobile-website-level1"><a href="/about-us.html">About us</a></li>
                <li class="menu-mobile-website-level1"><a href="javascript:;">Shopping Mall</a><i class="fa fa-plus" aria-hidden="true"></i>
                    <ul class="menu-mobile-website-level2">
                        <li><a href="/shopping-mall/create-my-new-booth.html">Create my new booth</a></li>
                        <li><a href="/san-giao-dich.html">Booths for rent/sale</a></li>
                        <li><a href="/danh-sach-gian-hang.html">Shops</a></li>
                    </ul>
                </li>
                <li class="menu-mobile-website-level1"><a href="javascript:;">Project</a><i class="fa fa-plus" aria-hidden="true"></i>
                    <ul class="menu-mobile-website-level2">
                        <li><a href="/project/smart-city-3d.html">Smart City 3D</a></li>
                        <li><a href="/project/swap-pi.html">Swap Pi</a></li>
                        <li><a href="/project/lucky-pi.html">Lucky Pi</a></li>
                    </ul>
                </li>
                <li class="menu-mobile-website-level1"><a href="javascript:;">3D Solution</a><i class="fa fa-plus" aria-hidden="true"></i>
                    <ul class="menu-mobile-website-level2">
                        <li><a href="/3dsolution/purchase-3d-model.html">Purchase 3D Model</a></li>
                        <li><a href="/3dsolution/purchase-nft.html">Purchase NFT</a></li>
                        <li><a href="/3dsolution/view-3d-world.html">View 3D World</a></li>
                    </ul>
                </li>
                <li class="menu-mobile-website-level1"><a href="javascript:;">Utilities</a><i class="fa fa-plus" aria-hidden="true"></i>
                    <ul class="menu-mobile-website-level2">
                        <li><a href="/san-dau-gia.html">Auction Floor</a></li>
                        <li><a href="/utilities/post-my-ads.html">Post My Ads</a></li>
                        <li><a href="/cafeteria.html">Cafeteria</a></li>
                    </ul>
                </li>
                <li class="menu-mobile-website-level1"><a href="/checkout/cart.html">My Cart</a><a href="https://wallet.pi">Wallet.pi</a></li>

                <%if (Session["PiglobalUser"] == null)
                    { %>
                <li class="menu-mobile-website-level1">
                    <%--<a href="/member/dang-nhap.aspx">Sign In</a>--%>
                    <a href="javascript:;" class="login_pi">Sign In</a>
                    <%--<a href="/member/dang-ky.aspx">Sign up</a>--%>
                </li>
                <%}
                    else
                    {
                        var customer1 = Session["PiglobalUser"] as Database.store_Customer;
                        var cus = dbConnect.store_Customers.Single(n => n.Id == customer1.Id);
                %>
                <li class="menu-mobile-website-level1 dropdown">
                    <a href="javascript:void(0);"><span>
                        <img src="/<%=cus.Avatar %>" width="40" height="40" class="rounded-circle" /></span>
                        &nbsp;Tài khoản<%--<%=cus.FullName %>--%>&nbsp;<i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="/danh-sach-gian-hang.html"><i class="fa fa-money" aria-hidden="true"></i>&nbsp;Số dư: <%=cus.AmountBalance %> π</a></li>
                        <li><a href="/taikhoan/cuahang/danhsachdangthue/list.aspx"><i class="fa fa-bandcamp" aria-hidden="true"></i>&nbsp;Gian hàng</a></li>
                        <li><a href="/taikhoan"><i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;Tài khoản</a></li>
                        <asp:LinkButton ID="LinkButton1" CssClass="dropdown-item" runat="server" OnClick="lnkLogOut_Click"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;Đăng xuất</asp:LinkButton>
                    </ul>
                </li>
                <%} %>

                <li class="menu-mobile-website-level1"><a href="/247-support.html">24/7 Support</a></li>
                <li class="menu-mobile-website-level1 menu-google-mobile"><div id='google_translate_element_mobile'></div></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
    </div>
</header>
<div class="clear-both"></div>
