<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title><%=seo.SeoTitle %></title>
    <link href="/fav.png" rel="icon" />
    <link href="/fav.png" rel="apple-touch-icon" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <link href="/pi-layout/assets/vendor/aos/aos.css" rel="stylesheet" />
    <link href="/pi-layout/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/pi-layout/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="/pi-layout/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="/pi-layout/assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="/pi-layout/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="/pi-layout/assets/css/style.css" rel="stylesheet" />
    <link href="/pi-layout/assets/css/intro.css" rel="stylesheet" />
    <link href="/pi-layout/assets/css/intromobile.css" rel="stylesheet" />
    <meta name="description" content="<%=seo.SeoDescription %>" />
    <meta name="keywords" content="<%=seo.SeoKeyword %>" />
    <meta property="og:rich_attachment" content="true" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="<%=urlDomainShare %>" />
    <meta property="og:title" content="<%=seo.SocialTitle %>" />
    <meta property="og:description" content="<%=seo.SocialDescription %>" />
    <meta property="og:image:url" content="<%=urlDomainShare %>/<%=seo.SocialImage %>" />
    <meta property="og:image" content="<%=urlDomainShare %>/<%=seo.SocialImage %>" />
    <meta property="og:image:alt" content="<%=seo.SeoTitle %>" />
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:title" content="<%=seo.SocialTitle %>" />
    <meta name="twitter:description" content="<%=seo.SocialDescription %>" />
    <meta name="twitter:image" content="<%=urlDomainShare %>/<%=seo.SocialImage %>" />

    <script src="https://sdk.minepi.com/pi-sdk.js"></script>
    <script> Pi.init({ version: "2.0", sandbox: true }) </script>
</head>

<body style="background-image: url(/<%=seo.Banner %>);" class="body-intro">
    <form id="form1" runat="server">
        <div id="outPopUp">
            <div class="groupbutton">
                <asp:Repeater ID="rptHomeIntroLink" runat="server">
                    <ItemTemplate>
                        <a title="<%#Eval("Name") %>" href="<%#Eval("Link") %>" class="button-intro <%# Container.ItemIndex==0?"":"button-intro-mo" %>"><%#Eval("Name") %></a>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </form>
</body>
</html>
