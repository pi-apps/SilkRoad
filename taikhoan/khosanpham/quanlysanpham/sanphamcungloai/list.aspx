<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="prodraftadmin_congty_nhanvien_EmployeeInfo" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sản phẩm mua kèm</title>
    <script src="/prodraftadmin/admin_template/js/jquery-1.7.2.min.js"></script>
    <link href="/prodraftadmin/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet" />
    <style>
        @import url('https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese');

        body {
            padding: 10px;
            font-family: Roboto;
            margin: 0;
        }

        .emp_status_1 {
            color: #fff;
            padding: 3px 5px;
            border-radius: 3px;
            font-size: 12px;
            background-image: linear-gradient(to top, #0ba360 0%, #3cba92 100%);
        }

        .emp_status_0 {
            color: #333333;
            padding: 3px 5px;
            border-radius: 3px;
            font-size: 12px;
            background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
        }

        .td-width-title {
            width: 150px;
        }

        legend {
            background-image: linear-gradient(to left, #BDBBBE 0%, #9D9EA3 100%), radial-gradient(88% 271%, rgba(255, 255, 255, 0.25) 0%, rgba(254, 254, 254, 0.25) 1%, rgba(0, 0, 0, 0.25) 100%), radial-gradient(50% 100%, rgba(255, 255, 255, 0.30) 0%, rgba(0, 0, 0, 0.30) 100%);
            background-blend-mode: normal, lighten, soft-light;
            color: #fff;
            padding: 4px 0px 4px 10px;
            margin-bottom: 0;
            border: none;
            font-size: 17px;
        }

        .message {
            color: #fff;
            padding: 3px 5px;
            border-radius: 3px;
            font-size: 12px;
            background-image: linear-gradient(to top, #0ba360 0%, #3cba92 100%);
        }

        .cap-phep label {
            font-weight: normal;
        }
    </style>
    <script>
        function confirmDelete() {
            if (confirm('Bạn có chắc muốn xóa dữ liệu này không?')) return true;
            return false;
        }
    </script>
    <script type="text/javascript">
                function CloseGridLookup() {
                    GridLookupTags.ConfirmCurrentSelection();
                    GridLookupTags.HideDropDown();
                    GridLookupTags.Focus();
                }
            </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset>
                <legend>Thêm sản phẩm mua kèm</legend>
                <div>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td class="td-width-title"><b>Chọn sản phẩm: </b></td>
                                <td>
                                    <dx:ASPxGridLookup ID="ASPxGridTags" Theme="Office2010Black" ViewStateMode="Enabled" EnableViewState="false" Width="97%" runat="server" KeyFieldName="Id" ClientInstanceName="GridLookupTags" SelectionMode="Multiple" TextFormatString="{1}" AutoGenerateColumns="False">
                                        <GridViewProperties>
                                            <Templates>
                                                <StatusBar>
                                                    <table class="OptionsTable" style="float: right; width: 500px;">
                                                        <tr>
                                                            <td>
                                                                <dx:ASPxButton ID="Close" runat="server" AutoPostBack="false" Text="Đóng" ClientSideEvents-Click="CloseGridLookup" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </StatusBar>
                                            </Templates>
                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" />
                                            <Settings ShowFilterRow="True" ShowStatusBar="Visible" />
                                            <SettingsPager PageSize="10"></SettingsPager>
                                        </GridViewProperties>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="false" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="1" />
                                            <dx:GridViewDataTextColumn FieldName="Code" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Image" VisibleIndex="4">
                                                <DataItemTemplate>
                                                    <img src="/<%#Eval("Image") %>" style="width:50px;" />
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:ASPxGridLookup>
                                </td>
                            </tr>
                             <tr>
                                <td class="td-width-title">Thứ tự</td>
                                <td>
                                    <asp:HiddenField ID="hdfId" runat="server" />
                                    <asp:TextBox ID="txtNumOr" TextMode="Number" Width="100px" Text="1" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-width-title"></td>
                                <td>
                                    <asp:Button ID="btnSave" OnClick="btnSave_Click" CssClass="btn btn-sm btn-danger" runat="server" Text="Lưu thông tin" />
                                    <span>
                                        <asp:Label Visible="false" ID="lblMessage" CssClass="message" runat="server" Text=""></asp:Label></span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </fieldset>
            <fieldset>
                <legend>Danh sách sản phẩm cùng loại</legend>
                <div>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>SKU</th>
                                <th>Tên SP</th>
                                <th>Hình</th>
                                <th>#</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptDanhMuc" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("NumOr") %></td>
                                        <td><%#Eval("Code") %></td>
                                        <td><%#Eval("ProductName") %></td>
                                        <td>
                                            <img src="/<%#Eval("Image") %>" style="width:50px;" />
                                        </td>
                                        <td>
                                            <asp:ImageButton CssClass="config-delete-grid" OnClick="ImgEdit_Click" ID="ImgEdit" ToolTip="Edit" runat="server" ImageUrl="/prodraftadmin/images/edit.png" CommandArgument='<%# Eval("Id")%>' />
                                            <asp:ImageButton CssClass="config-delete-grid" OnClick="btnDelete_Click" ID="btnDelete" ToolTip="Delete" runat="server" ImageUrl="/prodraftadmin/images/delete.png" OnClientClick="return confirmDelete();" CommandArgument='<%# Eval("Id")%>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>
                </div>
            </fieldset>
        </div>
    </form>
</body>
</html>
