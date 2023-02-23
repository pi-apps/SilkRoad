<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" ViewStateMode="Enabled" CodeFile="lienlac.aspx.cs" Inherits="prodraftadmin_congty_nhanvien_EmployeeInfo" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thông tin liên hệ</title>
    <link href="/Content/bootstrap.css" rel="stylesheet" />
    <link href="/Content/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet" />
    <script src="/Scripts/jquery-3.1.1.js"></script>
    <style>
        body {
            background: none;
            font-family: 'Roboto', sans-serif;
        }

        .title {
            font-weight: bold;
            font-size: 14px;
            text-transform: uppercase;
            color: brown;
            border: none;
            padding: 4px 8px;
            border-bottom: 1px solid;
        }

        thead.thead-dark {
            background: brown;
            color: #fff;
            text-align: center;
        }

            thead.thead-dark th {
                color: #fff;
                text-align: center;
            }

        .content-form {
            margin-top: 10px;
        }

        .div-btn-add {
            text-align: right;
            margin-top: 10px;
            margin-bottom: 10px;
            padding-right: 30px;
        }
        .form-control{
            width:95%;
        }
    </style>

    <script>
        function refreshParent() {
            window.parent.ASPxGridViewF5.Refresh();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <div class="content-form">
                    <table class="table table-striped">
                        <tr>
                            <td>
                                <label for="txtName">Tên gian hàng</label></td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static" CssClass="form-control" ValidationGroup="validationPopupThuVienHinh"></asp:TextBox>
                                <asp:HiddenField ID="hdfId" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtName">Hotline</label></td>
                            <td>
                                <asp:TextBox ID="txtHotline" runat="server" ClientIDMode="Static" CssClass="form-control" ValidationGroup="validationPopupThuVienHinh"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtName">Tin nhắn facebook</label></td>
                            <td>
                                <asp:TextBox ID="txtFacebookMess" runat="server" ClientIDMode="Static" CssClass="form-control" ValidationGroup="validationPopupThuVienHinh"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtName">Facebook</label></td>
                            <td>
                                <asp:TextBox ID="txtFacebook" runat="server" ClientIDMode="Static" CssClass="form-control" ValidationGroup="validationPopupThuVienHinh"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtName">Link google map</label></td>
                            <td>
                                <asp:TextBox ID="txtLinkGoogleMap" runat="server" ClientIDMode="Static" CssClass="form-control" ValidationGroup="validationPopupThuVienHinh"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtName">Telegram</label></td>
                            <td>
                                <asp:TextBox ID="txtTelegram" runat="server" ClientIDMode="Static" CssClass="form-control" ValidationGroup="validationPopupThuVienHinh"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtName">Tỉnh/thành phố</label></td>
                            <td>
                                <asp:DropDownList ID="ddlTinh" OnSelectedIndexChanged="ddlTinh_SelectedIndexChanged" AutoPostBack="true" Width="99%" runat="server" ClientIDMode="Static" CssClass="form-control" ValidationGroup="validationPopupThuVienHinh"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtName">Quận/huyện</label></td>
                            <td>
                                <asp:DropDownList ID="ddlQuanHuyen" OnSelectedIndexChanged="ddlQuanHuyen_SelectedIndexChanged" AutoPostBack="true" Width="99%" runat="server" ClientIDMode="Static" CssClass="form-control" ValidationGroup="validationPopupThuVienHinh"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtName">Phường/xã</label></td>
                            <td>
                                <asp:DropDownList ID="ddlPhuongXa" Width="99%" runat="server" ClientIDMode="Static" CssClass="form-control" ValidationGroup="validationPopupThuVienHinh"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtName">Địa chỉ</label></td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server" ClientIDMode="Static" CssClass="form-control" ValidationGroup="validationPopupThuVienHinh"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtName">Tọa độ</label></td>
                            <td>
                                <asp:TextBox Width="120px" ID="txtLat" Placeholder="Kinh độ" runat="server" ClientIDMode="Static" CssClass="form-control" ValidationGroup="validationPopupThuVienHinh"></asp:TextBox>
                                <asp:TextBox Width="120px" ID="txtLong" Placeholder="Vĩ độ" runat="server" ClientIDMode="Static" CssClass="form-control" ValidationGroup="validationPopupThuVienHinh"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtName">Nhúng bản đồ</label></td>
                            <td>
                                <asp:TextBox ID="txtGoogleMap" TextMode="MultiLine" Rows="6" runat="server" ClientIDMode="Static" CssClass="form-control" ValidationGroup="validationPopupThuVienHinh"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" CssClass="btn btn-primary" ValidationGroup="validationPopupThuVienHinh" />
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="validationPopupThuVienHinh" />
                            </td>
                        </tr>
                    </table>
                </div>
        </div>
    </form>
</body>
</html>
