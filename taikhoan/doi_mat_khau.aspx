<%@ Page Language="C#" AutoEventWireup="true" CodeFile="doi_mat_khau.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Đổi mật khẩu - Kolag Farm</title>

    <!-- Favicon  -->
    <link rel="shortcut icon" href="/favicon.ico">
    <!-- Google Fonts -->
    <link href="admin_template/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="admin_template/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="admin_template/css/font-awesome.css" rel="stylesheet">
    <link href="admin_template/css/style.css" rel="stylesheet" type="text/css">
    <link href="admin_template/css/pages/signin.css" rel="stylesheet" type="text/css">
    <script src="admin_template/js/jquery-3.4.1.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar navbar-fixed-top">

            <div class="navbar-inner" style="background: #007744;">

                <div class="container">

                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>

                    <a class="brand" href="#">Kolag Farm
                    </a>

                    <div class="nav-collapse">
                        <ul class="nav pull-right">

                            <%--<li class="">
                                <a href="#" class="">Đăng ký tài khoản mới?
                                </a>

                            </li>--%>

                            <li class="">
                                <a href="<%=urlReturn %>" class="">
                                    <i class="icon-chevron-left"></i>
                                    Quay về hệ thống
                                </a>

                            </li>
                        </ul>

                    </div>
                    <!--/.nav-collapse -->

                </div>
                <!-- /container -->

            </div>
            <!-- /navbar-inner -->

        </div>
        <!-- /navbar -->



        <div class="account-container">

            <div class="content clearfix">

                <div>
                    <p style="text-align: center;">
                        <img src="/prodraftadmin/logo.png" style="width:90%;" />
                    </p>
                    <%--<h1>Cập nhật mật khẩu</h1>--%>

                    <div class="login-fields">

                        <p>
                            <label for="txtPassword">Mật khẩu cũ <span class="required">* </span></label>
                            <asp:TextBox TextMode="Password" autocomplete="true" ID="txtOldPass" ValidationGroup="myaccount" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtOldPass" runat="server" ErrorMessage="Vui lòng nhập mật khẩu cũ" ValidationGroup="myaccount"></asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <label for="txtPassword">Mật khẩu <span class="required">* </span></label>
                            <asp:TextBox TextMode="Password" autocomplete="true" ID="txtPassword" ValidationGroup="myaccount" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator4" Display="Dynamic" ControlToValidate="txtPassword" runat="server" ErrorMessage="Vui lòng nhập mật khẩu ít nhất 6 ký tự" ValidationGroup="myaccount"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator CssClass="help-block with-errors error-form" Display="Dynamic" ID="rev1" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="Mật khẩu có ít nhất 6 ký tự và tối đa 16 ký tự" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,16}$" ValidationGroup="myaccount" />
                        </p>

                        <p>
                            <label for="txtRePassword">Mật khẩu nhắc lại <span class="required">* </span></label>
                            <asp:TextBox TextMode="Password" autocomplete="true" ID="txtRePassword" ValidationGroup="myaccount" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator5" Display="Dynamic" ControlToValidate="txtRePassword" runat="server" ErrorMessage="Vui lòng nhập xác nhận mật khẩu ít nhất 6 ký tự" ValidationGroup="myaccount"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator CssClass="help-block with-errors error-form" ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="txtRePassword"
                                ErrorMessage="Xác nhận mật khẩu có ít nhất 6 ký tự và tối đa 16 ký tự" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,16}$" ValidationGroup="myaccount" />
                            <asp:CompareValidator ID="CompareValidator1" runat="server"
                                ControlToCompare="txtPassword" Display="Dynamic" ControlToValidate="txtRePassword" ErrorMessage="Xác nhận mật khẩu không trùng khớp" ValidationGroup="myaccount">
                            </asp:CompareValidator>
                        </p>
                        <!-- /password -->

                    </div>
                    <!-- /login-fields -->

                    <div class="login-actions">
                        <asp:Button ID="btnSave" CssClass="button btn btn-danger btn-large" ValidationGroup="myaccount" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" />
                    </div>
                    <!-- .actions -->



                </div>

            </div>
            <!-- /content -->

        </div>
        <!-- /account-container -->


        <!-- /login-extra -->


        <script src="admin_template/js/jquery-1.7.2.min.js"></script>
        <script src="admin_template/js/bootstrap.js"></script>

        <script src="admin_template/js/signin.js"></script>
    </form>
</body>
</html>
