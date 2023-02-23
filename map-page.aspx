<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="map-page.aspx.cs" Inherits="map" %>

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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWXtiWIP2p9fs0SoJxDyVybP3Gog38GxY&libraries=places&callback=initialize">
    </script>
    <main id="main" class="main-gian-hang">
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
        <div id="list" class="list-map-div">
            <div class="container">
                <div class="shop-list">
                    <div id="map" style="width: 100%; height: 600px;"></div>
                </div>
            </div>
        </div>
    </main>

    <script type="text/javascript">
        var locations = [
            <%=strLocations%>
        ];

        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 5,
            center: new google.maps.LatLng(15.1042689,102.3528307),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });
        size = 15;
        var img = new google.maps.MarkerImage('/pi-layout/assets/location.png',
            new google.maps.Size(23, 30),
            new google.maps.Point(0, 0),
            new google.maps.Point(size, size)
        );
        var infowindow = new google.maps.InfoWindow();

        var marker, i;

        for (i = 0; i < locations.length; i++) {
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                map: map, icon: img
            });

            google.maps.event.addListener(marker, 'click', (function (marker, i) {
                return function () {
                    infowindow.setContent(locations[i][0]);
                    infowindow.open(map, marker);
                }
            })(marker, i));
            bindInfoWindow(marker, map, infowindow, "<p>" + locations[i][0] + "</p>",locations[i][1]);  
        }
        function bindInfoWindow(marker, map, infowindow, html, Ltitle) {
            google.maps.event.addListener(marker, 'mouseover', function () {
                infowindow.setContent(html);
                infowindow.open(map, marker);

            });
            google.maps.event.addListener(marker, 'mouseout', function () {
                infowindow.close();

            });
        }
    </script>

    <asp:HiddenField ID="hdfMainPageId" Value="6" ClientIDMode="Static" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
    <asp:HiddenField ID="urlRequest" ClientIDMode="Static" runat="server" />
    <script src="/pi-layout/assets/js/giang-hang.js"></script>
</asp:Content>

