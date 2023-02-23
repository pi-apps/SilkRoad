<%@ Page Title="" Language="C#" MasterPageFile="~/taikhoan/PiglobalPriateUserMasterPage.master" AutoEventWireup="true" CodeFile="updatepassword.aspx.cs" Inherits="Siteadmin_cauhinh_banner_new" %>

<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Đổi mật khẩu
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/taikhoan/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/taikhoan">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Thông tin cá nhân</a></li>
            <li class="breadcrumb-item active">Đổi mật khẩu</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="60" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <div class="noidung">
        <div class="title">Đổi mật khẩu</div>
        <div class="thanhtacvu"></div>
        <div class="div-crud">
            <table class="table-crud">
                <tr>
                    <td class="name1">
                        <label for="txtName">Mật khẩu cũ <span class="required">* </span></label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox TextMode="Password" autocomplete="true" ID="txtOldPass" ValidationGroup="myaccount" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtOldPass" runat="server" ErrorMessage="Vui lòng nhập mật khẩu cũ" ValidationGroup="myaccount"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Mật khẩu mới<span class="required">* </span></label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox TextMode="Password" autocomplete="true" ID="txtPassword" ValidationGroup="myaccount" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator4" Display="Dynamic" ControlToValidate="txtPassword" runat="server" ErrorMessage="Vui lòng nhập mật khẩu ít nhất 6 ký tự" ValidationGroup="myaccount"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator CssClass="help-block with-errors error-form" Display="Dynamic" ID="rev1" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="Mật khẩu có ít nhất 6 ký tự và tối đa 16 ký tự" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,16}$" ValidationGroup="myaccount" />
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Mật khẩu mới nhắc lại <span class="required">* </span></label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox TextMode="Password" autocomplete="true" ID="txtRePassword" ValidationGroup="myaccount" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="help-block with-errors error-form" ID="RequiredFieldValidator5" Display="Dynamic" ControlToValidate="txtRePassword" runat="server" ErrorMessage="Vui lòng nhập xác nhận mật khẩu ít nhất 6 ký tự" ValidationGroup="myaccount"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator CssClass="help-block with-errors error-form" ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="txtRePassword"
                                ErrorMessage="Xác nhận mật khẩu có ít nhất 6 ký tự và tối đa 16 ký tự" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,16}$" ValidationGroup="myaccount" />
                            <asp:CompareValidator ID="CompareValidator1" runat="server"
                                ControlToCompare="txtPassword" Display="Dynamic" ControlToValidate="txtRePassword" ErrorMessage="Xác nhận mật khẩu không trùng khớp" ValidationGroup="myaccount">
                            </asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="name1"></td>
                    <td class="txt1 bt1">
                        <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" ValidationGroup="myaccount" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-top: 10px">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="False" ValidationGroup="myaccount" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
