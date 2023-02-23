<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>
<%@ Register Src="~/UC/home/PartnerUserControl.ascx" TagPrefix="uc1" TagName="PartnerUserControl" %>
<%@ Register Src="~/UC/home/TeamUserControl.ascx" TagPrefix="uc1" TagName="TeamUserControl" %>
<%@ Register Src="~/UC/home/FaqUserControl.ascx" TagPrefix="uc1" TagName="FaqUserControl" %>
<%@ Register Src="~/UC/home/ServiceUserControl.ascx" TagPrefix="uc1" TagName="ServiceUserControl" %>
<%@ Register Src="~/UC/home/CountUserControl.ascx" TagPrefix="uc1" TagName="CountUserControl" %>
<%@ Register Src="~/UC/home/AboutUserControl.ascx" TagPrefix="uc1" TagName="AboutUserControl" %>
<%@ Register Src="~/UC/home/ValuesUserControl.ascx" TagPrefix="uc1" TagName="ValuesUserControl" %>
<%@ Register Src="~/UC/home/BannerUserControl.ascx" TagPrefix="uc1" TagName="BannerUserControl" %>
<%@ Register Src="~/UC/home/new/PiMallUserControl.ascx" TagPrefix="uc1" TagName="PiMallUserControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    <%=seo.SeoTitle %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cssContentPlaceHolder" runat="Server">
    <style>
        #myVideo {
            min-width: 100%;
            height: 100%;
            /* transform: translateX(-50%) translateY(-50%); */
            /*z-index: -10;*/
        }
    </style>
    <link href="/pi-layout/assets/vendor/OwlCarousel2-2.3.4/dist/assets/owl.carousel.css" rel="stylesheet" />
    <link href="/pi-layout/assets/vendor/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.css" rel="stylesheet" />
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
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <main id="main">
        <uc1:BannerUserControl runat="server" ID="BannerUserControl" />
        <uc1:PiMallUserControl runat="server" ID="PiMallUserControl" />
        <%--<uc1:AboutUserControl runat="server" ID="AboutUserControl" />
        <uc1:ValuesUserControl runat="server" ID="ValuesUserControl" />
        <uc1:CountUserControl runat="server" ID="CountUserControl" />
        <uc1:ServiceUserControl runat="server" ID="ServiceUserControl" />
        <uc1:FaqUserControl runat="server" ID="FaqUserControl" />
        <uc1:TeamUserControl runat="server" ID="TeamUserControl" />
        <uc1:PartnerUserControl runat="server" ID="PartnerUserControl" />--%>
        <uc1:PartnerUserControl runat="server" ID="PartnerUserControl" />
    </main>
    <asp:HiddenField ID="hdfMainPageId" Value="1" ClientIDMode="Static" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
    <asp:HiddenField ID="urlRequest" ClientIDMode="Static" runat="server" />
    <script src="/pi-layout/assets/vendor/OwlCarousel2-2.3.4/dist/owl.carousel.js"></script>
    <script src="/pi-layout/assets/js/home.js"></script>
    <script src="/pi-layout/assets/js/giang-hang.js"></script>
</asp:Content>

