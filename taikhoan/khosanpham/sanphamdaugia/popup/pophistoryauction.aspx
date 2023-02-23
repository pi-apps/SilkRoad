<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pophistoryauction.aspx.cs" Inherits="exam_popup_luotthitrongngay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/Content/jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <script src="datatables.js"></script>
    <link href="style.css" rel="stylesheet" />
    <script>
        function refreshParent() {
            window.parent.ASPxGVDS.Refresh();
            //location.reload();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container1">
            <h3>
                <div class="alert alert-warning" role="alert" style="padding: 10px 10px; font-size: 20px;">
                    Danh sách đấu giá
                </div>
            </h3>
            <table id="example" class="table table-striped table-bordered success" style="width: 100%">
                <thead>
                    <tr>
                        <th style="width: 50px;">STT</th>
                        <th>Người đặt</th>
                        <th>Giá đặt</th>
                        <th>Ngày đặt</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Container.ItemIndex +1%></td>
                                <td><%#Eval("Code") %></td>
                                <td><%#Eval("PriceAuction","{0:0.##}π") %></td>
                                <td><%#Eval("CreatedAt","{0:dd/MM/yyyy HH:mm:ss}") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
        <asp:Literal ID="ltrThongBao" runat="server"></asp:Literal>
        <div style="text-align: center;">
            <asp:Button ID="btnXuLyDauGia" OnClientClick="return ConfirmAuction();" Visible="false" CssClass="btn btn-success" OnClick="btnXuLyDauGia_Click" runat="server" Text="Xử lý đấu giá" />
        </div>
        <script>
            function ConfirmAuction() {
                if (confirm('Bạn có chắc muốn xử lý phiên đấu giá này không?')) return true;
                return false;
            }
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
    </form>
</body>
</html>
