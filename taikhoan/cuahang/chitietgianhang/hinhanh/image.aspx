<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" ViewStateMode="Enabled" CodeFile="image.aspx.cs" Inherits="prodraftadmin_congty_nhanvien_EmployeeInfo" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thư viện hình tin</title>
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
        function refreshParent() {
            window.parent.ASPxGridViewF5.Refresh();
        }
        $(function () {
            $("#FileUpload1").change(function () {
                if (typeof (FileReader) != "undefined") {
                    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                    $($(this)[0].files).each(function (i, j) {
                        var file = $(this);
                        if (regex.test(file[0].name.toLowerCase())) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                $("#Image1").attr("src", e.target.result);
                            }
                            reader.readAsDataURL(file[0]);
                        } else {
                            //alert(file[0].name + " không phải là một tập tin hình ảnh hợp lệ.");
                            return false;
                        }
                    });
                } else {
                    alert("Trình duyệt này không hỗ trợ HTML5 FileReader.\r\n Vui lòng sử dụng trình duyệt khác, hoặc nâng cấp trình duyệt của bạn");
                }
            });
        });
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
                                <label for="txtName">Tên hình</label></td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" Width="90%" ClientIDMode="Static" CssClass="form-control" ValidationGroup="validationPopupThuVienHinh"></asp:TextBox>
                                <asp:HiddenField ID="hdfId" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                    ErrorMessage="Vui lòng nhập tên hình"
                                    ControlToValidate="txtName" ValidationGroup="validationPopupThuVienHinh"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="FileUpload1">Chọn hình</label></td>
                            <td>
                                <asp:FileUpload ID="FileUpload1" AllowMultiple="true" runat="server" ClientIDMode="Static" ValidationGroup="validationPopupThuVienHinh" />
                                <p>
                                    <asp:Image ID="Image1" ClientIDMode="Static" ImageUrl="~/upload/cho-thue-mat-bang/cho-thue-mat-bang.jpg" runat="server" Width="100px" />
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" CssClass="btn btn-primary" ValidationGroup="validationPopupThuVienHinh" />
                                <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-default" runat="server" Text="Hủy" />
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="validationPopupThuVienHinh" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">
                <div class="title">Danh sách hình ảnh</div>
                <div class="content-form">
                    <div class="div-btn-add">
                        <asp:Button ID="btnAdd" OnClick="btnAdd_Click" CssClass="btn btn-success" runat="server" Text="+ Thêm" />
                    </div>
                    <dx:ASPxGridView EnableRowsCache="true" ID="ASPxGVDS" ClientInstanceName="grid" KeyFieldName="Id" Width="100%" runat="server"
                        AutoGenerateColumns="False" EnableTheming="True" Theme="Aqua" PreviewEncodeHtml="False"
                        OnCustomUnboundColumnData="ASPxGVDS_CustomUnboundColumnData" OnBatchUpdate="ASPxGVDS_BatchUpdate">
                        <Settings ShowGroupPanel="false" ShowHeaderFilterButton="true" ShowFooter="false" />
                        <SettingsCommandButton>
                            <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                            <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                        </SettingsCommandButton>
                        <SettingsSearchPanel Visible="True" />
                        <SettingsPager PageSize="30">
                            <PageSizeItemSettings Visible="true" Items="20, 30, 50, 100, 200,300,400,500,600" />
                        </SettingsPager>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="STT" Caption="STT" Settings-ShowInFilterControl="False"
                                Settings-AllowAutoFilter="False" Settings-ShowFilterRowMenu="False"
                                ReadOnly="True" UnboundType="String" Width="40px" Settings-AllowSort="False" Settings-AllowHeaderFilter="False">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center" ForeColor="#999999"></CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Name" Caption="Tên"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Image" Caption="Hình">
                                <DataItemTemplate>
                                    <img src="/<%#Eval("Image") %>" style="width: 70px;" />
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="NumOr" Caption="Thứ tự"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn FieldName="IsStatus" Caption="TT">
                                <PropertiesCheckEdit AllowGrayed="false" AllowGrayedByClick="false" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn FieldName="IsHome" Caption="T/c">
                                <PropertiesCheckEdit AllowGrayed="false" AllowGrayedByClick="false" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataTextColumn Caption="#" CellStyle-HorizontalAlign="Center" Width="100px">
                                <DataItemTemplate>
                                    <asp:ImageButton CssClass="config-delete-grid" OnClick="btnEdit_Click" ID="btnEdit" ToolTip="Edit" runat="server" ImageUrl="/prodraftadmin/images/edit.png" CommandArgument='<%# Eval("Id")%>' />
                                    <asp:ImageButton CssClass="config-delete-grid" OnClick="btnDelete_Click" ID="btnDelete" ToolTip="Delete" runat="server" ImageUrl="/prodraftadmin/images/delete.png" OnClientClick="return confirmDelete();" CommandArgument='<%# Eval("Id")%>' />
                                </DataItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center"></CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <Styles>
                            <AlternatingRow Enabled="true" />
                            <Cell Paddings-PaddingTop="10px" Paddings-PaddingBottom="10px"></Cell>
                        </Styles>
                        <SettingsEditing Mode="Inline" />
                        <SettingsPopup>
                            <HeaderFilter Height="280px" Width="250px" />
                        </SettingsPopup>
                    </dx:ASPxGridView>
                </div>
            </asp:Panel>

        </div>
    </form>
</body>
</html>
