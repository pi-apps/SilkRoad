<%@ Page Language="C#" AutoEventWireup="true" CodeFile="video.aspx.cs" Inherits="prodraftadmin_congty_nhanvien_EmployeeInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thư viện video</title>
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
    </style>

    <script>
        function confirmDelete() {
            if (confirm('Bạn có chắc muốn xóa dữ liệu này không?')) return true;
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server">
                <div class="title">Thao tác</div>
                <div class="content-form">
                    <table class="table table-striped">
                        <tr>
                            <td>
                                <label for="txtName">Youtube</label></td>
                            <td>
                                <asp:TextBox ID="txtLinkYoutube" runat="server" Width="90%" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                <asp:HiddenField ID="hdfId" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtName">Thứ tự</label></td>
                            <td>
                                <asp:TextBox ID="txtNumOr" runat="server" Width="90%" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" CssClass="btn btn-primary" ValidationGroup="validationPopupThuVienHinh" />
                                <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-default" runat="server" Text="Hủy" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">
                <div class="title">Danh sách video</div>
                <div class="content-form">
                    <div class="div-btn-add"><asp:Button ID="btnAdd" OnClick="btnAdd_Click" CssClass="btn btn-success" runat="server" Text="+ Thêm" />
                    </div>
                    <table class="table table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th>STT</th>
                                <th>Youtube</th>
                                <th>Thứ tự</th>
                                <th>#</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptImages" runat="server" OnItemDataBound="rptImages_ItemDataBound">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Container.ItemIndex + 1 %></td>
                                        <td><%#Eval("YoutubeLink") %></td>
                                        <td><%#Eval("NumOr") %></td>
                                        <td>
                                            <asp:ImageButton CssClass="config-delete-grid" OnClick="btnEdit_Click" ID="btnEdit" ToolTip="Edit" runat="server" ImageUrl="/prodraftadmin/images/edit.png" CommandArgument='<%# Eval("Id")%>' />
                                            <asp:ImageButton CssClass="config-delete-grid" OnClick="btnDelete_Click" ID="btnDelete" ToolTip="Delete" runat="server" ImageUrl="/prodraftadmin/images/delete.png" OnClientClick="return confirmDelete();" CommandArgument='<%# Eval("Id")%>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>

                    </table>
                </div>
            </asp:Panel>

        </div>
    </form>
</body>
</html>
