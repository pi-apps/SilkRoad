<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="dang-nhap.aspx.cs" Inherits="member_Default" %>

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
                <h1 class="page_title">Chào mừng bạn quay lại</h1>
            </div>
            <div class="page_content register_page clearfix">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form_wrapper">
                            <%--<p class="mgb-20 font-16">Bạn có thể email hoặc số điện thoại để đăng nhập vào hệ thống</p>--%>
                            <div class="form-inner register-form">
                                <div class="form-group">
                                    <label for="email" class="control-label">Email</label>
                                    <asp:textbox id="txtEmail" runat="server" cssclass="form-control" validationgroup="signupvalidation"></asp:textbox>
                                    <asp:requiredfieldvalidator cssclass="help-block with-errors error-form" id="RequiredFieldValidator1" display="Dynamic"
                                        controltovalidate="txtEmail" runat="server" errormessage="Vui lòng nhập email" validationgroup="signupvalidation"></asp:requiredfieldvalidator>
                                    <asp:regularexpressionvalidator cssclass="help-block with-errors error-form" display="Dynamic" id="RegularExpressionValidator2"
                                        runat="server" errormessage="Vui lòng nhập email đúng định dạng" validationgroup="signupvalidation" controltovalidate="txtEmail"
                                        validationexpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:regularexpressionvalidator>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="control-label">Mật khẩu</label>
                                    <asp:textbox id="txtPassword" textmode="Password" cssclass="form-control" runat="server" validationgroup="signupvalidation"></asp:textbox>
                                    <asp:requiredfieldvalidator cssclass="help-block with-errors error-form" id="RequiredFieldValidator2" display="Dynamic" controltovalidate="txtPassword" runat="server"
                                        errormessage="Vui lòng nhập mật khẩu" validationgroup="signupvalidation"></asp:requiredfieldvalidator>
                                </div>
                                <div class="btn_wrapper">
                                    <asp:button id="btnLogin" cssclass="btn btn-success btn-block" onclick="btnLogin_Click" runat="server" text="Đăng nhập" validationgroup="signupvalidation" />
                                    <asp:validationsummary id="ValidationSummary1" runat="server" validationgroup="signupvalidation" showsummary="false" />
                                    <asp:label id="lblError" runat="server" text="" cssclass="help-block with-errors error-form"></asp:label>
                                </div>
                                <div class="mgt-20">
                                    <a href="/member/forgot-password.aspx" title="Bạn quên mật khẩu">Bạn quên mật khẩu?</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end left -->
                    <div class="col-xs-12 col-sm-1 col-md-1 hidden-xs">
                        <div class="middle">
                            <div class="text-center"><span>Hoặc</span></div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-5 col-md-5">
                        <div class="right">
                            <p class="font-16 mgb-20"><%--Đăng nhập bằng Facebook hoặc Google--%></p>
                            <div class="social-connect-container">
                                <div class="sc-buttons">
                                    <a href="javascript:void(0);" class="sc-facebook">
                                        <i class="fa fa-facebook" aria-hidden="true"></i>
                                        <span>Đăng nhập bằng Facebook</span>
                                    </a>
                                    <a href="javascript:void(0);" class="sc-google">
                                        <i class="fa fa-google-plus" aria-hidden="true"></i>
                                        <span>Đăng nhập bằng Google+</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end right -->
                </div>
                <hr>
                <div class="text-center mgt-25">
                    <p class="font-16">Bạn chưa có tài khoản? <a href="/member/dang-ky.aspx"><b>Đăng ký ngay</b></a></p>
                </div>
            </div>


        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
    <%if (Session["forgot-password-success"] != null)
        { %>
    <script type="text/javascript">
        $(function () {
            var what = new jPopup({
                title: "<h2>Thông báo piglobal.net</h2>",
                content: "<p>Cảm ơn bạn đã tham gia piglobal.net<br>Mật khẩu mới của bạn đã được tạo. Hãy ghi nhớ cẩn thận nhé</p>",
                draggable: true,
                resizeable: true,
                overlay: true,
                closeButton: true
            });
            var draggable = true;
            var overlay = false;
            what.open();
        });
</script>
    <%Session["forgot-password-success"] = null;
        } %>
</asp:Content>

