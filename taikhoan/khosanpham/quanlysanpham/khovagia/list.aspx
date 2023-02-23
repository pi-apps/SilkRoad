<%@ Page Title="" Language="C#" MasterPageFile="~/prodraftadmin/DongAAdminMasterPage.master" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="Siteadmin_cauhinh_banner_DanhSachBanner" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Kho & giá sản phẩm '<%=pro_Product.Code %>'
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/prodraftadmin/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/prodraftadmin">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Kho sản phẩm</a></li>
            <li class="breadcrumb-item"><a href="/prodraftadmin/khosanpham/quanlysanpham/list.aspx">Danh sách sản phẩm</a></li>
            <li class="breadcrumb-item active">Kho & giá sản phẩm '<%=pro_Product.Code %>'</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="57" />
    <script src="popup.js"></script>
    <style>
        #btnClear{display:none;}
    </style>
    <script type="text/javascript">
        function grid_SelectionChanged(s, e) {
            s.GetSelectedFieldValues("Id", GetSelectedFieldValuesCallback);
        }
        function GetSelectedFieldValuesCallback(selectedValues) {
            if (grid.GetSelectedRowCount() > 0) {
                $("#btnClear").show();
            }
            else {
                $("#btnClear").hide();
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <dx:ASPxPopupControl PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter"
        HeaderText="Thông tin số lượng" Modal="true"
        Theme="Moderno" ID="PoupQuantity" SettingsLoadingPanel-ShowImage="true" ShowRefreshButton="true" ShowMaximizeButton="true" ShowShadow="true" ShowPinButton="true"
        ClientInstanceName="PoupQuantity" Width="700px" Height="600px"
        runat="server" AllowDragging="true" ScrollBars="None" AllowResize="true" CloseAction="CloseButton">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl7" runat="server"></dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter"
        HeaderText="Thư viện hình ảnh" Modal="true"
        Theme="Moderno" ID="PoupImage" SettingsLoadingPanel-ShowImage="true" ShowRefreshButton="true" ShowMaximizeButton="true" ShowShadow="true" ShowPinButton="true"
        ClientInstanceName="PoupImage" Width="700px" Height="600px"
        runat="server" AllowDragging="true" ScrollBars="None" AllowResize="true" CloseAction="CloseButton">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server"></dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter"
        HeaderText="Thư viện video" Modal="true"
        Theme="Moderno" ID="PoupVideo" SettingsLoadingPanel-ShowImage="true" ShowRefreshButton="true" ShowMaximizeButton="true" ShowShadow="true" ShowPinButton="true"
        ClientInstanceName="PoupVideo" Width="700px" Height="600px"
        runat="server" AllowDragging="true" ScrollBars="None" AllowResize="true" CloseAction="CloseButton">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server"></dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <div class="noidung">
        <div class="title">Kho & giá sản phẩm '<%=pro_Product.Code %>'</div>
        <div class="thanhtacvu">
            <asp:Button ID="btnClear" OnClientClick="return confirmDelete();" ClientIDMode="Static" OnClick="btnClear_Click" CssClass="btn btn-danger" runat="server" Text="Xóa" />
            <a href="new.aspx?add=new&parent=<%=Request["parent"] %>" class="btn btn-sm btn-success"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Thêm mới</a>
        </div>
        <%--idpage--%>
        <div class="gridview">
            <dx:ASPxGridView ID="ASPxGVDS" ClientInstanceName="grid" KeyFieldName="Id" Width="100%" runat="server"
                AutoGenerateColumns="False" EnableTheming="True" Theme="Office2010Black" PreviewEncodeHtml="False"
                OnCustomUnboundColumnData="ASPxGVDS_CustomUnboundColumnData" OnHtmlDataCellPrepared="ASPxGVDS_HtmlDataCellPrepared">
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
                    <dx:GridViewCommandColumn ShowSelectCheckbox="True" ShowClearFilterButton="true" SelectAllCheckboxMode="Page"></dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="STT" Caption="STT" Settings-ShowInFilterControl="False"
                        Settings-AllowAutoFilter="False" Settings-ShowFilterRowMenu="False"
                        ReadOnly="True" UnboundType="String" Width="40px" Settings-AllowSort="False" Settings-AllowHeaderFilter="False">
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center" ForeColor="#999999"></CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Code" Caption="Mã SP">
                        <DataItemTemplate>
                            <span><a href="/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>" target="_blank"><%#Eval("Code") %></a></span>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductName" Caption="Tên SP">
                        <DataItemTemplate>
                            <span><a href="/<%#Eval("ProductName").ToString().RemoveSymbol().ToLower() %>-<%#Eval("Id") %>.html" title="<%#Eval("ProductName") %>" target="_blank"><%#Eval("ProductName") %></a></span>
                            <div>
                                <asp:Label CssClass="attribute_css" ID="lblAttribute" runat="server" Text=""></asp:Label>
                            </div>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Image" Caption="Hình" CellStyle-HorizontalAlign="Center">
                        <DataItemTemplate>
                            <a href="javascript:void(0);" onclick="openPoupImage(<%#Eval("Id") %>);">
                                <img src="/<%#Eval("Image") %>" style="width: 100px;" /></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Image" Caption="V" CellStyle-HorizontalAlign="Center">
                        <DataItemTemplate>
                            <a href="javascript:void(0);" onclick="openPoupVideo(<%#Eval("Id") %>);">
                                <i class="fa fa-youtube-square" aria-hidden="true"></i></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Quanity" Caption="SL">
                        <DataItemTemplate>
                            <a href="javascript:void(0);" onclick="openPoupQuantity(<%#Eval("Id") %>);"><%#Eval("Quanity","{0:#,##0}") %></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Price" Caption="Giá gốc">
                        <DataItemTemplate>
                            <span><%#Eval("Price","{0:#,##0}") %></span>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PriceSell" Caption="Giá bán">
                        <DataItemTemplate>
                            <span><%#Eval("PriceSell","{0:#,##0}") %></span>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PricesellOnline" Caption="Giá online">
                        <DataItemTemplate>
                            <span><%#Eval("PricesellOnline","{0:#,##0}") %></span>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataImageColumn FieldName="IsStatus" Caption="TT" UnboundType="String">
                        <DataItemTemplate>
                            <div style="float: left">
                                <asp:ImageButton ID="imgTT" OnClick="imgTT_Click" runat="server" CommandArgument='<%# Eval("Id")%>' ImageUrl="/prodraftadmin/images/visible.gif" ToolTip="Đèn sáng Tin đang hiển thị - Đèn mờ Tin đã ẩn" />
                            </div>
                        </DataItemTemplate>
                    </dx:GridViewDataImageColumn>
                    <dx:GridViewDataImageColumn FieldName="IsMain" Caption="Main" UnboundType="String">
                        <DataItemTemplate>
                            <div style="float: left">
                                <asp:ImageButton ID="imgMain" OnClick="imgMain_Click" runat="server" CommandArgument='<%# Eval("Id")%>' ImageUrl="/prodraftadmin/images/visible.gif" ToolTip="Đèn sáng Tin đang hiển thị - Đèn mờ Tin đã ẩn" />
                            </div>
                        </DataItemTemplate>
                    </dx:GridViewDataImageColumn>
                    <dx:GridViewDataImageColumn FieldName="IsPaymentOnline" Caption="Online" UnboundType="String">
                        <DataItemTemplate>
                            <div style="float: left">
                                <asp:ImageButton ID="imgPaymentOnline" OnClick="imgPaymentOnline_Click1" runat="server" CommandArgument='<%# Eval("Id")%>' ImageUrl="/prodraftadmin/images/visible.gif" ToolTip="Đèn sáng Tin đang hiển thị - Đèn mờ Tin đã ẩn" />
                            </div>
                        </DataItemTemplate>
                    </dx:GridViewDataImageColumn>
                    <dx:GridViewDataTextColumn Caption="#" CellStyle-HorizontalAlign="Center" Width="100px">
                        <DataItemTemplate>
                            <a href="new.aspx?id=<%# Eval("Id")%>&parent=<%# Request["parent"] %>" style="color: #1d7ebf" title="Chỉnh sửa">
                                <img alt="icon" src="/prodraftadmin/images/edit.png" style="border: none" /></a>
                            <asp:ImageButton CssClass="config-delete-grid" OnClick="btnDelete_Click" ID="btnDelete" ToolTip="Delete" runat="server" ImageUrl="/prodraftadmin/images/delete.png" OnClientClick="return confirmDelete();" CommandArgument='<%# Eval("Id")%>' />
                            <asp:ImageButton CssClass="config-delete-grid" OnClick="btnCopy_Click" ID="btnCopy" ToolTip="Sao chép" runat="server" ImageUrl="/prodraftadmin/images/copy.png" OnClientClick="return confirmCopy();" CommandArgument='<%# Eval("Id")%>' />
                        </DataItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center"></CellStyle>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Styles>
                    <AlternatingRow Enabled="true" />
                    <Cell Paddings-PaddingTop="10px" Paddings-PaddingBottom="10px"></Cell>
                </Styles>
                <ClientSideEvents SelectionChanged="grid_SelectionChanged" />
                <SettingsEditing Mode="EditForm" />
                <SettingsPopup>
                    <HeaderFilter Height="280px" Width="250px" />
                </SettingsPopup>
            </dx:ASPxGridView>
        </div>
    </div>
</asp:Content>
