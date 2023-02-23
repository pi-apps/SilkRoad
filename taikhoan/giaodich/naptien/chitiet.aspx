<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" ViewStateMode="Enabled" CodeFile="chitiet.aspx.cs" Inherits="prodraftadmin_congty_nhanvien_EmployeeInfo" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chi tiết giao dịch</title>
    <link href="/Content/bootstrap.css" rel="stylesheet" />
    <link href="/Content/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" />
    <script src="/Scripts/jquery-3.1.1.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Bai+Jamjuree:ital,wght@0,200;0,300;0,400;0,500;0,700;1,200;1,300;1,400;1,500;1,600;1,700&display=swap');

        body {
            font-family: 'Bai Jamjuree', sans-serif;
        }

        body {
            background: none;
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

        .form-control {
            width: 95%;
        }

        .xacnhanthanhtoan {
        }

            .xacnhanthanhtoan label {
                display: inline-block;
            }

        .naptien-choxacnhanuser {
            color: #fff;
            background: #6c757d;
            border-radius: 6px;
            padding: 2px 7px 3px 7px;
        }

        .naptien-daxacnhanuser {
            color: #fff;
            background: #0ba360;
            border-radius: 6px;
            padding: 2px 7px 3px 7px;
        }

        .naptien-choxacnhanadmin {
            color: #fff;
            background: #6c757d;
            border-radius: 6px;
            padding: 2px 7px 3px 7px;
        }

        .naptien-daxacnhanadmin {
            color: #fff;
            background: #0ba360;
            border-radius: 6px;
            padding: 2px 7px 3px 7px;
        }

        .naptien-dahuy {
            color: #fff;
            background: #fe0100;
            border-radius: 6px;
            padding: 2px 7px 3px 7px;
        }

        .naptien-giaodichthanhcong {
            color: #fff;
            background: #0ba360;
            border-radius: 6px;
            padding: 2px 7px 3px 7px;
        }
    </style>

    <script>
        function refreshParent() {
            window.parent.ASPxGridViewF5.Refresh();
            location.reload();
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
                            <label for="txtName">Mã giao dịch</label></td>
                        <td>
                            <%=store_CustomerTransaction.Code %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtName">Số tiền</label></td>
                        <td>
                            <%=store_CustomerTransaction.Amount %>
                        </td>
                    </tr>

                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                            <tr>
                                <td>
                                    <label for="txtName">Ghi chú</label></td>
                                <td>
                                    <%=store_CustomerTransaction.Note %>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label for="txtName">File chứng từ</label></td>
                                <td>
                                    <a target="_blank" href="/<%=store_CustomerTransaction.AttachedFile %>">Xem file</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="txtName">Xác nhận (user)</label></td>
                                <td><%=TrangThaiXacNhanUser %></td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="txtName">Ngày xác nhận (user)</label></td>
                                <td><%=store_CustomerTransaction.UserConfirmDate!=null?store_CustomerTransaction.UserConfirmDate.Value.ToString("dd/MM/yyyy HH:mm:ss"):"" %></td>
                            </tr>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <tr>
                                <td>
                                    <label for="txtName">Ghi chú</label></td>
                                <td>
                                    <asp:TextBox ID="txtNote" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label for="txtName">File chứng từ</label></td>
                                <td>
                                    <asp:FileUpload ID="fulAttachedFile" runat="server" />
                                    <br />
                                    <a target="_blank" href="/<%=store_CustomerTransaction.AttachedFile %>">Xem file</a>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">Xác nhận (user)</td>
                                <td class="txt1">
                                    <asp:CheckBox CssClass="xacnhanthanhtoan" ID="rdoIsUserConfirm" runat="server" Text="&nbsp; [Chọn để xác nhận bạn đã chuyển khoản]" />
                                </td>
                            </tr>
                        </asp:View>
                    </asp:MultiView>
                    <tr>
                        <td>
                            <label for="txtName">Xác nhận (hệ thống)</label></td>
                        <td><%=TrangThaiXacNhanAdmin %></td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtName">Ngày xác nhận (hệ thống)</label></td>
                        <td><%=store_CustomerTransaction.AdminConfirmDate!=null?store_CustomerTransaction.AdminConfirmDate.Value.ToString("dd/MM/yyyy HH:mm:ss"):"" %></td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtName">Ghi chú (hệ thống)</label></td>
                        <td>
                            <%=store_CustomerTransaction.NoteAdmin %>
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
