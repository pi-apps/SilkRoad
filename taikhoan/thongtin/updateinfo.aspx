<%@ Page Title="" Language="C#" MasterPageFile="~/taikhoan/PiglobalPriateUserMasterPage.master" AutoEventWireup="true" CodeFile="updateinfo.aspx.cs" Inherits="Siteadmin_cauhinh_banner_new" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Cập nhật thông tin cá nhân
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/taikhoan/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/taikhoan">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Thông tin cá nhân</a></li>
            <li class="breadcrumb-item active">Cập nhật thông tin cá nhân</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="60" />
    <style>
        #imgImage,#imgCMNDMT,#imgCMNDMS{
            cursor:pointer;
        }
        #fulImage,#fulCMNDMT,#fulCMNDMS{display:none;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <div class="noidung">
        <div class="title">Cập nhật thông tin cá nhân</div>
        <div class="thanhtacvu">
            <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" ValidationGroup="validateForm" />
        </div>
        <div class="div-crud">
            <script src="/taikhoan/tab/videodanhmuc/js.js"></script>
            <script src="updateinfo.js"></script>
            <link href="/taikhoan/tab/css.css" rel="stylesheet" />
            <div id="tabs">
                <ul class="tabs">
                    <li><a href="#tabs-1">Thông tin chung</a></li>
                    <li><a href="#tabs-3">CMND/CCCD</a></li>
                </ul>
                <div id="tabs-1">
                    <div class="tab-content">
                        <table class="table-crud">
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Mã khách hàng</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtCode" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:HiddenField ID="txtId" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Mã giới thiệu</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtPresenterCode" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Địa chỉ email</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtEmail" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Ví Pi Wallet</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtPiWallet" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Điện thoại</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Họ & tên</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtFullName" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Địa chỉ</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="form-field-8">Hình đại diện</label>
                                </td>
                                <td class="txt1">
                                    <asp:FileUpload ID="fulImage" runat="server" ClientIDMode="Static"/>
                                    <p>
                                        <asp:Image ID="imgImage" Width="100px" ClientIDMode="Static" ImageUrl="~/upload/no-logo.png" runat="server" />
                                    </p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="tabs-3">
                    <div class="tab-content">
                        <table class="table-crud">
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Số CMND/CCCD</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtCMNDNumber" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Nơi cấp</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtPlaceOfIssue" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Ngày cấp</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtDateOfIssue" CssClass="datepicker form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="form-field-8">Hình (mặt trước)</label>
                                </td>
                                <td class="txt1">
                                    <asp:FileUpload ID="fulCMNDMT" runat="server" ClientIDMode="Static"/>
                                    <p>
                                        <asp:Image ID="imgCMNDMT" Width="100px" ClientIDMode="Static" ImageUrl="~/upload/no-logo.png" runat="server" />
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="form-field-8">Hình (mặt sau)</label>
                                </td>
                                <td class="txt1">
                                    <asp:FileUpload ID="fulCMNDMS" runat="server" ClientIDMode="Static"/>
                                    <p>
                                        <asp:Image ID="imgCMNDMS" Width="100px" ClientIDMode="Static" ImageUrl="~/upload/no-logo.png" runat="server" />
                                    </p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
