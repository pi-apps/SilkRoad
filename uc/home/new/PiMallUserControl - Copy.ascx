<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PiMallUserControl - Copy.ascx.cs" Inherits="UC_home_PartnerUserControl" %>
<!-- ======= Clients Section ======= -->
<section id="home-1">
    <div class="home-1-caption">
        <img src="/pi.gif" />
    </div>
    <div class="container">

        <div class="home-1-title">
            <div class="home-1-tag">
                <a href="/danh-sach-gian-hang.html">Shop</a>
                <a href="/san-giao-dich.html">Booths for rent/sale</a>
                <a href="/san-dau-gia.html">Auction Floor</a>
                <a href="/dang-tin.html">Post My Ads</a>
                <a href="/cafeteria.html">Cafeteria</a>
            </div>
        </div>

        <div id="filter" class="filter-danh-sach">
            <div class="pull-left">
                <div class="form-inline">
                    <div class="form-group">

                        <asp:TextBox ID="txtKeyword" CssClass="txtKeyword form-control" runat="server" placeholder="Theo tên / theo mã / theo tỷ giá"></asp:TextBox>
                        <asp:DropDownList ID="ddlDanhMuc" CssClass="ddlDanhMuc form-control" runat="server"></asp:DropDownList>
                        <asp:DropDownList ID="ddlVungMien" CssClass="ddlVungMien form-control" runat="server"></asp:DropDownList>

                        <button type="button" class="btnSearch btn btn-warning"><i class="fa fa-search" aria-hidden="true"></i>&nbsp; Tìm kiếm</button>
                        <%--<asp:Button ID="btnSearch" OnClick="btnSearch_Click" CssClass="btnSearch btn btn-warning" runat="server" Text="Tìm kiếm" />--%>
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
    <div class="home-1-title-pimall-owner home-1-title-cus">
        <div class="container">
            <h3>Pi Mall - Owner</h3>
        </div>
    </div>
    <div class="container">
        <div class="pi-mall-box product-moi-len-ke">
            <div class="product-box-cus owl-carousel-product owl-carousel owl-theme">
                <asp:Repeater ID="rptGianHang" OnItemDataBound="rptGianHang_ItemDataBound" runat="server">
                    <ItemTemplate>
                        <div class="item">
                            <div class="product-item">
                                <div class="product">
                                    <div class="rate-div" style="display:none;"><span class="exchange-rate">1π = <%#Eval("ExchangeRate") %>$</span></div>
                                    <a title="<%#Eval("Name") %>" href="/gian-hang/<%#Eval("Name").ToString().RemoveSymbol() %>-<%#Eval("Id") %>.html">
                                        <div class="product-header" style="background-image: url('/<%#Eval("Banner") %>');">
                                            <img class="img-fluid" src="/<%#Eval("Banner") %>" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>">
                                        </div>
                                    </a>
                                    <a title="<%#Eval("Name") %>" href="/gian-hang/<%#Eval("Name").ToString().RemoveSymbol() %>-<%#Eval("Id") %>.html">
                                        <div class="card-official-stores-shop-img" style="background-image: url('/<%#Eval("Image") %>');">
                                            <img src="/<%#Eval("Image") %>" alt="<%#Eval("Name") %>">
                                        </div>
                                    </a>
                                    <div class="card-official-stores-h1"><%#Eval("Name") %></div>
                                    <p class="card-official-stores-p">
                                       Accept: <span class="exchange-rate">1π = <%#Eval("ExchangeRate") %>$</span>
                                    </p>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="product-box-cus-line-2 product-box-cus owl-carousel-product owl-carousel owl-theme">
                <asp:Repeater ID="rptGianhang2" OnItemDataBound="rptGianhang2_ItemDataBound" runat="server">
                    <ItemTemplate>
                        <div class="item">
                            <div class="product-item">
                                <div class="product">
                                    <div class="rate-div" style="display:none;"><span class="exchange-rate">1π = <%#Eval("ExchangeRate") %>$</span></div>
                                    <a title="<%#Eval("Name") %>" href="/gian-hang/<%#Eval("Name").ToString().RemoveSymbol() %>-<%#Eval("Id") %>.html">
                                        <div class="product-header" style="background-image: url('/<%#Eval("Banner") %>');">
                                            <img class="img-fluid" src="/<%#Eval("Banner") %>" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>">
                                        </div>
                                    </a>
                                    <a title="<%#Eval("Name") %>" href="/gian-hang/<%#Eval("Name").ToString().RemoveSymbol() %>-<%#Eval("Id") %>.html">
                                        <div class="card-official-stores-shop-img" style="background-image: url('/<%#Eval("Image") %>');">
                                            <img src="/<%#Eval("Image") %>" alt="<%#Eval("Name") %>">
                                        </div>
                                    </a>
                                    <div class="card-official-stores-h1"><%#Eval("Name") %></div>
                                    <p class="card-official-stores-p">
                                       Accept: <span class="exchange-rate">1π = <%#Eval("ExchangeRate") %>$</span>
                                    </p>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <div class="home-1-title-cus">
        <div class="container">
            <h3>Sản phẩm đồng thuận Pi giá cao</h3>
        </div>
    </div>
    <div class="sp-dong-thuan container">
        <div class="product-box-cus product-box row no-gutters padding-mobile">
            <asp:Repeater ID="rptSanPhamDongThuan" OnItemDataBound="rptSanPhamDongThuan_ItemDataBound" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 col-xl-2 col-xs-12 moreBox" style="display: none;">

                        <div class="product-item">
                            <div class="product">
                                <asp:HiddenField ID="hdfId" Value='<%#Eval("Id") %>' runat="server" />
                                <a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>">
                                    <div class="product-header" style="background-image: url('<%#urlDomainShare%>/<%#Eval("Image") %>')">
                                        <img class="img-fluid" src="<%#urlDomainShare%>/<%#Eval("Image") %>" alt="<%#Eval("ProductName") %>" title="<%#Eval("ProductName") %>">
                                    </div>
                                </a>
                                <div class="product-body">
                                    <a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>"></a>
                                    <h5><a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>"></a><a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>"><%#Eval("ProductName") %></a></h5>
                                </div>
                                <div class="product-footer add-to-cart-button">
                                    <%--<p class="offer-price mb-0">
                                39π <i class="fa fa-tag" aria-hidden="true"></i>
                                <br>
                                <span class="regular-price">43π</span>
                            </p>--%>
                                    <asp:Literal ID="ltrPrice" runat="server"></asp:Literal>
                                </div>
                                <div class="ranking-vm">
                                    <div class="pull-left box-ranking">
                                        <%--<div class="rateit-range" tabindex="0" role="slider" aria-label="rating" aria-owns="rateit-reset-2" aria-valuemin="0" aria-valuemax="5" aria-valuenow="5" aria-readonly="false" style="width: 80px; height: 16px;">
                                    <div class="rateit-selected" style="height: 16px; width: 80px;"></div>
                                    <div class="rateit-hover" style="height: 16px"></div>
                                </div>--%>
                                        <asp:Literal ID="ltrBuyProduct" runat="server"></asp:Literal>
                                        <%--<span class="text">(589)</span>--%>
                                    </div>
                                    <div class="pull-right"><span>
                                        <asp:Literal ID="ltrNoiBan" runat="server"></asp:Literal></span></div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="div-load-more" id="loadmore2">
            <a href="#">Tải thêm</a>
        </div>
    </div>
    <div class="home-1-title-cus">
        <div class="container">
            <h3>Sản phẩm vừa mới lên kệ</h3>
        </div>
    </div>
    <div class="container">
        <div class="product-moi-len-ke">
            <div class="product-box-cus owl-carousel-product owl-carousel owl-theme">
                <asp:Repeater ID="rptMoiLenKe01" OnItemDataBound="rptMoiLenKe01_ItemDataBound" runat="server">
                    <ItemTemplate>


                        <div class="item">
                            <div class="product-item">
                                <asp:HiddenField ID="hdfId" Value='<%#Eval("Id") %>' runat="server" />
                                <div class="product">
                                    <a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>">
                                        <div class="product-header" style="background-image: url('<%#urlDomainShare%>/<%#Eval("Image") %>')">
                                            <img class="img-fluid" src="<%#urlDomainShare%>/<%#Eval("Image") %>" alt="<%#Eval("ProductName") %>" title="<%#Eval("ProductName") %>">
                                        </div>
                                    </a>
                                    <div class="product-body">
                                        <a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>"></a>
                                        <h5><a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>"></a><a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>"><%#Eval("ProductName") %></a></h5>
                                    </div>
                                    <div class="product-footer add-to-cart-button">
                                        <asp:Literal ID="ltrPrice" runat="server"></asp:Literal>
                                    </div>
                                    <div class="ranking-vm">
                                        <div class="pull-left box-ranking">
                                            <%--<div class="rateit-range" tabindex="0" role="slider" aria-label="rating" aria-owns="rateit-reset-2" aria-valuemin="0" aria-valuemax="5" aria-valuenow="5" aria-readonly="false" style="width: 80px; height: 16px;">
                                        <div class="rateit-selected" style="height: 16px; width: 80px;"></div>
                                        <div class="rateit-hover" style="height: 16px"></div>
                                    </div>--%>
                                            <asp:Literal ID="ltrBuyProduct" runat="server"></asp:Literal>
                                            <%--<span class="text">(589)</span>--%>
                                        </div>
                                        <div class="pull-right"><span>
                                            <asp:Literal ID="ltrNoiBan" runat="server"></asp:Literal></span></div>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </ItemTemplate>
                </asp:Repeater>



            </div>

            <div class="product-box-cus owl-carousel-product owl-carousel owl-theme">

                <asp:Repeater ID="rptMoiLenKe02" OnItemDataBound="rptMoiLenKe02_ItemDataBound" runat="server">
                    <ItemTemplate>


                        <div class="item">
                            <div class="product-item">
                                <asp:HiddenField ID="hdfId" Value='<%#Eval("Id") %>' runat="server" />
                                <div class="product">
                                    <a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>">
                                        <div class="product-header" style="background-image: url('<%#urlDomainShare%>/<%#Eval("Image") %>')">
                                            <img class="img-fluid" src="<%#urlDomainShare%>/<%#Eval("Image") %>" alt="<%#Eval("ProductName") %>" title="<%#Eval("ProductName") %>">
                                        </div>
                                    </a>
                                    <div class="product-body">
                                        <a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>"></a>
                                        <h5><a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>"></a><a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>"><%#Eval("ProductName") %></a></h5>
                                    </div>
                                    <div class="product-footer add-to-cart-button">
                                        <asp:Literal ID="ltrPrice" runat="server"></asp:Literal>
                                    </div>
                                    <div class="ranking-vm">
                                        <div class="pull-left box-ranking">
                                            <%--<div class="rateit-range" tabindex="0" role="slider" aria-label="rating" aria-owns="rateit-reset-2" aria-valuemin="0" aria-valuemax="5" aria-valuenow="5" aria-readonly="false" style="width: 80px; height: 16px;">
                                        <div class="rateit-selected" style="height: 16px; width: 80px;"></div>
                                        <div class="rateit-hover" style="height: 16px"></div>
                                    </div>--%>
                                            <asp:Literal ID="ltrBuyProduct" runat="server"></asp:Literal>
                                            <%--<span class="text">(589)</span>--%>
                                        </div>
                                        <div class="pull-right"><span>
                                            <asp:Literal ID="ltrNoiBan" runat="server"></asp:Literal></span></div>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </ItemTemplate>
                </asp:Repeater>








            </div>
        </div>
    </div>
    <div class="home-1-title-cus">
        <div class="container">
            <h3>Just for you</h3>
        </div>
    </div>
    <div class="sp-danh-cho-ban container">
        <div class="product-box-cus product-box row no-gutters padding-mobile">
            <asp:Repeater ID="rptProductJustForYou" OnItemDataBound="rptProductJustForYou_ItemDataBound" runat="server">
                <ItemTemplate><%--col-md-2 col-sm-6 col-xs-12--%>
                    <div class="col-md-4 col-xl-2 col-xs-12 moreBox" style="display: none;">

                        <div class="product-item">
                            <div class="product">
                                <asp:HiddenField ID="hdfId" Value='<%#Eval("Id") %>' runat="server" />
                                <a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>">
                                    <div class="product-header" style="background-image: url('<%#urlDomainShare%>/<%#Eval("Image") %>')">
                                        <img class="img-fluid" src="<%#urlDomainShare%>/<%#Eval("Image") %>" alt="<%#Eval("ProductName") %>" title="<%#Eval("ProductName") %>">
                                    </div>
                                </a>
                                <div class="product-body">
                                    <a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>"></a>
                                    <h5><a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>"></a><a href="<%#urlDomainShare %>/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>"><%#Eval("ProductName") %></a></h5>
                                </div>
                                <div class="product-footer add-to-cart-button">
                                    <%--<p class="offer-price mb-0">
                                39π <i class="fa fa-tag" aria-hidden="true"></i>
                                <br>
                                <span class="regular-price">43π</span>
                            </p>--%>
                                    <asp:Literal ID="ltrPrice" runat="server"></asp:Literal>
                                </div>
                                <div class="ranking-vm">
                                    <div class="pull-left box-ranking">
                                        <%--<div class="rateit-range" tabindex="0" role="slider" aria-label="rating" aria-owns="rateit-reset-2" aria-valuemin="0" aria-valuemax="5" aria-valuenow="5" aria-readonly="false" style="width: 80px; height: 16px;">
                                    <div class="rateit-selected" style="height: 16px; width: 80px;"></div>
                                    <div class="rateit-hover" style="height: 16px"></div>
                                </div>--%>
                                        <asp:Literal ID="ltrBuyProduct" runat="server"></asp:Literal>
                                        <%--<span class="text">(589)</span>--%>
                                    </div>
                                    <div class="pull-right"><span>
                                        <asp:Literal ID="ltrNoiBan" runat="server"></asp:Literal></span></div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="div-load-more" id="loadmore3">
            <a href="#">Tải thêm</a>
        </div>
    </div>
</section>
<%--<section id="clients" class="clients" style="display: normal;">
    <div class="container" data-aos="fade-up">

        <header class="section-header">
            <h2>Our Clients</h2>
            <p>Temporibus omnis officia</p>
        </header>

        <div class="clients-slider swiper">
            <div class="swiper-wrapper align-items-center">
                <asp:Repeater ID="rptPartner" runat="server">
                    <ItemTemplate>
                        <div class="swiper-slide">
                            <a href="<%#Eval("Link") %>" title="<%#Eval("Name") %>">
                                <img src="/<%#Eval("Logo") %>" class="img-fluid" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>">
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
</section>--%>
<!-- End Clients Section -->
