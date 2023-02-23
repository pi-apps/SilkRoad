<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Đăng nhập hệ thống - piglobal.net</title>

    <!-- Favicon  -->
    <link rel="shortcut icon" type=image/png href=/favicon.png />
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

            <div class="navbar-inner" style="background:#820909;">

                <div class="container">

                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>

                    <a class="brand" href="#">Đăng nhập hệ thống
                    </a>

                    <div class="nav-collapse">
                        <ul class="nav pull-right">

                            <%--<li class="">
                                <a href="#" class="">Đăng ký tài khoản mới?
                                </a>

                            </li>--%>

                            <li class="">
                                <a href="/" class="">
                                    <i class="icon-chevron-left"></i>
                                    Quay về trang chủ
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
                    <p style="text-align: center;margin-bottom:30px;">
                        <span>
                            <img src="/prodraftadmin/logo.png" style="width:200px;" />
                        </span>
                    </p>

                    <div class="login-fields">
                        

                        <div class="field">
                            <label for="username">Tên đăng nhập</label>
                            <asp:TextBox ID="username" runat="server" CssClass="login" ValidationGroup="myaccount"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator1" Display="Dynamic" 
                                ControlToValidate="username" runat="server" ErrorMessage="Vui lòng nhập tên đăng nhập" ValidationGroup="myaccount"></asp:RequiredFieldValidator>
                        </div>
                        <!-- /field -->

                        <div class="field">
                            <label for="password">Mật khẩu:</label>
                            <asp:TextBox TextMode="Password" autocomplete="false" ID="password" ValidationGroup="myaccount" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator2" Display="Dynamic" ControlToValidate="password" runat="server" ErrorMessage="Vui lòng nhập mật khẩu" ValidationGroup="myaccount"></asp:RequiredFieldValidator>
                        </div>
                        <!-- /password -->

                    </div>
                    <!-- /login-fields -->

                    <div class="login-actions">

                        <span class="login-checkbox">
                            <input id="Field" runat="server" checked="checked" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
                            <label class="choice" for="Field">Nhớ thông tin đăng nhập</label>
                        </span>
                        <asp:Button ID="btnLogin" CssClass="button btn btn-success btn-large" OnClick="btnLogin_Click" ValidationGroup="myaccount" runat="server" Text="Đăng nhập" />
                    </div>
                    <!-- .actions -->



                </div>

            </div>
            <!-- /content -->

        </div>
        <!-- /account-container -->



        <div class="login-extra">
            <a href="/taikhoan/forgotpass.aspx">Quên mật khẩu</a>
            <div class="pull-right">
                <a href="/taikhoan/register.aspx">Đăng ký tài khoản</a>
            </div>
        </div>
        <!-- /login-extra -->


        <script src="admin_template/js/jquery-1.7.2.min.js"></script>
        <script src="admin_template/js/bootstrap.js"></script>

        <script src="admin_template/js/signin.js"></script>
    </form>
</body>
</html>
