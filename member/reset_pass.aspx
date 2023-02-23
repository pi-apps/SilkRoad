<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="reset_pass.aspx.cs" Inherits="member_Default" %>

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
    <div class="access_page">
        <div class="container">
            <div class="page_header">
                <h1 class="page_title"><%=seo.Name %></h1>
            </div>
            <div class="page_content register_page clearfix">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6 col-sm-offset-3 col-md-offset-3">
                <div class="form_wrapper">
                    <p class="mgb-20 font-16">Nhập mật khẩu mới vào ô bên dưới để hoàn tất</p>
                    <div class="form-inner register-form">
                        <div class="form-group">
                            <label for="password" class="control-label">Mật khẩu mới</label>
                            <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server" placeholder="Mật khẩu ít nhất 6 ký tự" ValidationGroup="signupvalidation"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator4" Display="Dynamic" ControlToValidate="txtPassword" runat="server" ErrorMessage="Vui lòng nhập mật khẩu ít nhất 6 ký tự" ValidationGroup="signupvalidation"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator CssClass="help-block with-errors error-form" ID="rev1" runat="server" ControlToValidate="txtPassword"
                                    ErrorMessage="Mật khẩu có ít nhất 6 ký tự và tối đa 16 ký tự" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,16}$" ValidationGroup="signupvalidation" />
                        </div>
                        <div class="form-group">
                            <label for="cpassword" class="control-label">Xác nhận lại mật khẩu mới</label>
                            <asp:TextBox ID="txtRePassword" TextMode="Password" runat="server" CssClass="form-control" ValidationGroup="signupvalidation"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator5" Display="Dynamic" ControlToValidate="txtRePassword" runat="server" ErrorMessage="Vui lòng nhập xác nhận mật khẩu ít nhất 6 ký tự" ValidationGroup="signupvalidation"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator CssClass="help-block with-errors error-form" ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="txtRePassword"
                                    ErrorMessage="Xác nhận mật khẩu có ít nhất 6 ký tự và tối đa 16 ký tự" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,16}$" ValidationGroup="signupvalidation" />
                                <asp:CompareValidator ID="CompareValidator1" runat="server"
                                    ControlToCompare="txtPassword" Display="Dynamic" ControlToValidate="txtRePassword" ErrorMessage="Xác nhận mật khẩu không trùng khớp" ValidationGroup="signupvalidation">
                                </asp:CompareValidator>
                        </div>
                        <div class="btn_wrapper">
                            <asp:Button ID="btnSavePassNew" runat="server" OnClick="btnSavePassNew_Click" CssClass="btn btn-success btn-block" Text="Khôi phục" ValidationGroup="signupvalidation" />
                            <asp:Label ID="lblErrorEmail" CssClass="help-block with-errors error-form" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
</asp:Content>

