<%@ Page Title="" Language="C#" MasterPageFile="~/PiglobalMasterPage.master" AutoEventWireup="true" CodeFile="dang-ky.aspx.cs" Inherits="member_Default" %>

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
                <h1 class="page_title">Bạn đang tạo tài khoản trên piglobal.net</h1>
            </div>
            <div class="page_content register_page clearfix">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form_wrapper">
                            <%--<p class="mgb-20 font-16">Hãy nhập email thường xuyên sử dụng của bạn, để đăng ký và kích hoạt tài khoản nhanh chóng</p>--%>
                            <div class="form-inner register-form ">
                                <div class="form-group">
                                    <label for="email" class="control-label">Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ValidationGroup="signupvalidation"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator1" Display="Dynamic"
                                        ControlToValidate="txtEmail" runat="server" ErrorMessage="Vui lòng nhập email" ValidationGroup="signupvalidation"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator CssClass="help-block with-errors error-form" Display="Dynamic" ID="RegularExpressionValidator2"
                                        runat="server" ErrorMessage="Vui lòng nhập email đúng định dạng" ValidationGroup="signupvalidation" ControlToValidate="txtEmail"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    <%--<asp:CustomValidator Display="Dynamic" OnServerValidate="CustomValidator1_ServerValidate" ID="CustomValidator1" ControlToValidate="txtEmail" runat="server" ErrorMessage="Email đăng ký đã tồn tại 111" ValidationGroup="signupvalidation"></asp:CustomValidator>--%>
                                    <asp:Label ID="lblErrorEmail" CssClass="help-block with-errors error-form" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="control-label">Họ và tên</label>
                                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" ValidationGroup="signupvalidation"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator2" Display="Dynamic"
                                        ControlToValidate="txtFullName" runat="server" ErrorMessage="Vui lòng nhập họ và tên" ValidationGroup="signupvalidation"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="phone" class="control-label">Số điện thoại</label>
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" ValidationGroup="signupvalidation"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator3" Display="Dynamic"
                                        ControlToValidate="txtPhone" runat="server" ErrorMessage="Vui lòng nhập số điện thoại bạn hay sử dụng" ValidationGroup="signupvalidation"></asp:RequiredFieldValidator>
                                    <asp:Label ID="lblErrorPhone" CssClass="help-block with-errors error-form" runat="server" Text=""></asp:Label>
                                    <%--<asp:CustomValidator Display="Dynamic" OnServerValidate="CustomValidator2_ServerValidate" ID="CustomValidator2" ControlToValidate="txtPhone" runat="server" ErrorMessage="Số điện thoại đăng ký đã tồn tại" ValidationGroup="signupvalidation"></asp:CustomValidator>--%>
                                </div>
                                <%--<div class="form-group">
                                    <label for="phone" class="control-label">Ví PI</label>
                                    <asp:TextBox ID="txtPiWallet" runat="server" CssClass="form-control" ValidationGroup="signupvalidation"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator6" Display="Dynamic"
                                        ControlToValidate="txtPiWallet" runat="server" ErrorMessage="Vui lòng nhập ví PI" ValidationGroup="signupvalidation"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator Display="Dynamic" OnServerValidate="CustomValidator3_ServerValidate" ID="CustomValidator3" ControlToValidate="txtPiWallet" runat="server" ErrorMessage="Ví Pi đã tồn tại trong hệ thống" ValidationGroup="signupvalidation"></asp:CustomValidator>
                                </div>--%>
                                <div class="row div-dk-mat-khau">
                                    <div class="form-group col-sm-6">
                                        <label for="password" class="control-label">Mật khẩu</label>
                                        <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server" placeholder="Mật khẩu ít nhất 6 ký tự" ValidationGroup="signupvalidation"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator4" Display="Dynamic" ControlToValidate="txtPassword" runat="server" ErrorMessage="Vui lòng nhập mật khẩu ít nhất 6 ký tự" ValidationGroup="signupvalidation"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator CssClass="help-block with-errors error-form" ID="rev1" runat="server" ControlToValidate="txtPassword"
                                            ErrorMessage="Mật khẩu có ít nhất 6 ký tự và tối đa 16 ký tự" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,16}$" ValidationGroup="signupvalidation" />
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="cpassword" class="control-label">Nhập lại mật khẩu</label>
                                        <asp:TextBox ID="txtRePassword" TextMode="Password" runat="server" CssClass="form-control" ValidationGroup="signupvalidation"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator5" Display="Dynamic" ControlToValidate="txtRePassword" runat="server" ErrorMessage="Vui lòng nhập xác nhận mật khẩu ít nhất 6 ký tự" ValidationGroup="signupvalidation"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator CssClass="help-block with-errors error-form" ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="txtRePassword"
                                            ErrorMessage="Xác nhận mật khẩu có ít nhất 6 ký tự và tối đa 16 ký tự" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,16}$" ValidationGroup="signupvalidation" />
                                        <asp:CompareValidator ID="CompareValidator1" runat="server"
                                            ControlToCompare="txtPassword" Display="Dynamic" ControlToValidate="txtRePassword" ErrorMessage="Xác nhận mật khẩu không trùng khớp" ValidationGroup="signupvalidation">
                                        </asp:CompareValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="control-label">Người giới thiệu</label>
                                    <asp:TextBox ID="txtPresenterCode" runat="server" CssClass="form-control" ValidationGroup="signupvalidation"></asp:TextBox>
                                </div>
                                <div class="btn_wrapper">
                                    <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" CssClass="btn btn-success btn-block" Text="Đăng ký tài khoản" ValidationGroup="signupvalidation" />
                                </div>
                                <p class=" mgt-20">Bấm vào nút đăng ký tức là bạn đã đồng ý với <a target="_blank" href="/help/huong-dan-su-dung.html"><b>quy định sử dụng</b></a> của chúng tôi</p>
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
                            <p class="font-16 mgb-20"><%--Piglobal.net đề xuất bạn đăng ký tài khoản mới bằng Facebook hoặc Google--%></p>
                            <div class="social-connect-container">
                                <div class="sc-buttons">
                                    <a href="#" class="sc-facebook">
                                        <i class="fa fa-facebook" aria-hidden="true"></i>
                                        <span>Đăng ký bằng Facebook</span>
                                    </a>
                                    <a href="#" class="sc-google">
                                        <i class="fa fa-google-plus" aria-hidden="true"></i>
                                        <span>Đăng ký bằng Google+</span>
                                    </a>
                                </div>
                            </div>
                            <p class="font-16">Bạn đã có tài khoản? <a href="/member/dang-nhap.aspx"><b>Đăng nhập ngay</b></a></p>
                        </div>
                    </div>
                    <!-- end right -->
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsContentPlaceHolder" runat="Server">
    <%if (Session["signup"] != null)
        { %>
    <script type="text/javascript">
        $(function () {
            var what = new jPopup({
                title: "<h2>Thông báo piglobal.net</h2>",
                content: "<p>Cảm ơn bạn đã tham gia piglobal.net<br>Vui lòng kiểm tra email của bạn để hoàn tất đăng ký.<br>Nếu bạn không tìm thấy nó tại (hộp thư đến). Vui lòng kiểm tra thêm trong thư rác.<br><br><div style='text-align:center;'><a href='/' class='btn btn-sm btn-danger'>Về trang chủ</a></div></p>",
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
    <%Session["signup"] = null;
        } %>
</asp:Content>

