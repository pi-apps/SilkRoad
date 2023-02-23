<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="chitiet.aspx.cs" Inherits="page_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContentPlaceHolder" Runat="Server"><%=seo.SeoTitle %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cssContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="seoContentPlaceHolder" Runat="Server">
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
<asp:Content ID="Content4" ContentPlaceHolderID="bannerContentPlaceHolder" Runat="Server">
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
<asp:Content ID="Content5" ContentPlaceHolderID="bodyContentPlaceHolder" Runat="Server">
    <asp:HiddenField ID="hdfMainPageId" Value="1" ClientIDMode="Static" runat="server" />
    <div class="div-page-main">
        <div class="container">
            <h1 class="div-page-main-title"><%=seo.Name %></h1>
            <div class="page-content">
                <%=seo.Description %>
            </div>
        </div>
    </div>
     <!-- ======= Services Section ======= -->
<section id="services" class="services">

    <div class="container" data-aos="fade-up">

        <header class="section-header">
            <h2>Services</h2>
            <p>Kết nối doanh nghiệp – nhà cung cấp với người tiêu dùng theo tiêu chuẩn của hệ thống Pi Network</p>
        </header>

        <div class="row gy-4">
            <asp:Repeater ID="rptService" runat="server">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                        <div id="box-service-<%#Eval("Id") %>" class="service-box" style="border-bottom: 3px solid <%#Eval("ColorCode") %>;">
                            <img class="img-box-service" src="/<%#Eval("Image") %>" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>" />
                            <h3><%#Eval("Name") %></h3>
                            <p><%#Eval("Summary") %></p>
                            <a style="color: <%#Eval("ColorCode") %>;" title="<%#Eval("Name") %>" href="/dich-vu/<%#Eval("Name").ToString().RemoveSymbol() %>-<%#Eval("Id") %>.html" class="read-more"><span>Xem thêm</span> <i class="bi bi-arrow-right"></i></a>
                        </div>
                    </div>
                    <style>
                        #box-service-<%#Eval("Id") %>:hover {
                            background: <%#Eval("ColorCode") %>;
                        }
                        #box-service-<%#Eval("Id") %>:hover a{
                            color:#fff !important;
                        }
                    </style>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>

</section>
<!-- End Services Section -->
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" Runat="Server">
</asp:Content>

