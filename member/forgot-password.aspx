<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="forgot-password.aspx.cs" Inherits="member_Default" %>

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
                    <div class="col-xs-12 col-sm-7 col-md-7 col-sm-offset-3 col-md-offset-3">
                        <div class="form_wrapper">
                            <p class="mgb-20 font-16">Vui lòng nhập email liên kết với tài khoản của bạn để nhận mã đặt lại mật khẩu</p>
                            <div class="form-inner register-form ">
                                <div class="form-group">
                                    <label for="email" class="control-label">Địa chỉ Email của bạn</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ValidationGroup="signupvalidation"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator1" Display="Dynamic"
                                        ControlToValidate="txtEmail" runat="server" ErrorMessage="Vui lòng nhập email" ValidationGroup="signupvalidation"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator CssClass="help-block with-errors error-form" Display="Dynamic" ID="RegularExpressionValidator2"
                                        runat="server" ErrorMessage="Vui lòng nhập email đúng định dạng" ValidationGroup="signupvalidation" ControlToValidate="txtEmail"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="btn_wrapper">
                                    <asp:Button ID="btnKhoiPhuc" OnClick="btnKhoiPhuc_Click" runat="server" CssClass="btn btn-danger btn-block" Text="Gửi liên kết khôi phục" ValidationGroup="signupvalidation" />
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
    <%if (Session["quenmatkhau"] != null)
        { %>
    <script type="text/javascript">
        $(function () {
            var what = new jPopup({
                title: "<h2>Thông báo piglobal.net</h2>",
                content: "<p>Liên kết khôi phục mật khẩu đã được gửi qua email.<br>Vui lòng kiểm tra email của bạn để hoàn tất quá trình.<br>Nếu bạn không tìm thấy nó tại (hộp thư đến). Vui lòng kiểm tra thêm trong thư rác.<br><br><div style='text-align:center;'><a href='/' class='btn btn-sm btn-danger'>Về trang chủ</a></div></p>",
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
    <%Session["quenmatkhau"] = null;
        } %>
</asp:Content>

