<%@ Page Title="" Language="C#" MasterPageFile="~/taikhoan/PiglobalPriateUserMasterPage.master" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="Siteadmin_cauhinh_banner_DanhSachBanner" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Danh sách đơn hàng
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/taikhoan/script/Common.js" type="text/javascript"></script>
    <style>
        .container, .container {
            width: 98% !important;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/taikhoan">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Giao dịch</a></li>
            <li class="breadcrumb-item active">Danh sách đơn hàng</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="84" />
    <script src="popup.js"></script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <dx:ASPxPopupControl PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter"
        HeaderText="Chi tiết giao dịch" Modal="true"
        Theme="Moderno" ID="PoupGiaoDich" SettingsLoadingPanel-ShowImage="true" ShowRefreshButton="true" ShowMaximizeButton="true" ShowShadow="true" ShowPinButton="true"
        ClientInstanceName="PoupGiaoDich" Width="700px" Height="600px"
        runat="server" AllowDragging="true" ScrollBars="None" AllowResize="true" CloseAction="CloseButton">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server"></dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <div class="noidung">
        <div class="title">Danh sách đơn hàng</div>
        <div class="thanhtacvu"></div>
        <%--idpage--%>
        <div class="gridview">
            <dx:ASPxGridView ID="ASPxGVDS" ClientInstanceName="ASPxGridViewF5" KeyFieldName="Id" EnableViewState="false" Width="100%" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="Aqua" PreviewEncodeHtml="False" OnCustomUnboundColumnData="ASPxGVDS_CustomUnboundColumnData" OnHtmlDataCellPrepared="ASPxGVDS_HtmlDataCellPrepared">
                <Settings ShowGroupPanel="false" ShowHeaderFilterButton="true" ShowFooter="false" />
                <SettingsCommandButton>
                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                </SettingsCommandButton>
                <SettingsSearchPanel Visible="True" />
                <SettingsPager PageSize="30">
                    <PageSizeItemSettings Visible="true" Items="20, 30, 50, 100, 200" />
                </SettingsPager>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="STT" Caption="STT" ReadOnly="True" UnboundType="String" ShowInCustomizationForm="True" VisibleIndex="0" Width="40px">
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center" ForeColor="#999999"></CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Code" Caption="Mã giao dịch">
                        <DataItemTemplate>
                            <%--<%#Eval("IsAuction") %>--%>
                            <a style="<%#bool.Parse(Eval("IsAuction").ToString())==false?"":"display:none;" %>" target="_blank" href="/transaction/buy-product/<%#Eval("Code") %>-<%#Eval("store_ShopRentalId") %>.html"><%#Eval("Code") %></a>
                            <a style="<%#bool.Parse(Eval("IsAuction").ToString())==true?"":"display:none;" %>" target="_blank" href="/auction/buyer-product/<%#Eval("Code") %>.html"><%#Eval("Code") %></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewBandColumn Caption="Sản phẩm" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="ProductName" Caption="Tên sản phẩm">
                                <DataItemTemplate>
                                    <a style="<%#bool.Parse(Eval("IsAuction").ToString())==false?"":"display:none;" %>" href="/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol() %>-<%#Eval("pro_ProductId") %>.html" target="_blank" title="<%#Eval("ProductName") %>"><%#Eval("ProductName") %></a>
                                    <a style="<%#bool.Parse(Eval("IsAuction").ToString())==true?"":"display:none;" %>" href="/san-dau-gia/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol() %>-<%#Eval("pro_ProductId") %>.html" target="_blank" title="<%#Eval("ProductName") %>"><%#Eval("ProductName") %></a>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Image" Caption="Hình">
                                <DataItemTemplate>
                                    <img src="/<%#Eval("Image") %>" style="width: 50px;" />
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PriceSell" Caption="Giá bán">
                                <DataItemTemplate>
                                    <%#Eval("PriceSell","{0:#,##0}") %>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ExchangeRate" Caption="Tỷ giá">
                                <DataItemTemplate>
                                    <%#Eval("ExchangeRate","{0:#,##0}") %>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="TotalAmount" Caption="Số tiền">
                                <DataItemTemplate>
                                    <%#Eval("TotalAmount","{0:#,##0}") %>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:GridViewBandColumn>
                    <dx:GridViewDataTextColumn FieldName="CreatedAt" Caption="Ngày GD">
                        <DataItemTemplate>
                            <%#Eval("CreatedAt","{0:dd.MM.yyyy HH:mm:ss}") %>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewBandColumn Caption="Người bán xác nhận" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="SellerConfirmDate" Caption="Ngày">
                                <DataItemTemplate>
                                    <%#Eval("SellerConfirmDate","{0:dd.MM.yyyy HH:mm:ss}") %>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="IsSellerConfirm" Caption="Trạng thái">
                                <DataItemTemplate>
                                    <%#Eval("IsSellerConfirm","{0:dd.MM.yyyy HH:mm:ss}") %>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:GridViewBandColumn>
                    <dx:GridViewDataTextColumn UnboundType="String" FieldName="TransactionStaus" Caption="Trạng thái">
                    </dx:GridViewDataTextColumn>
                    <%--<dx:GridViewDataTextColumn Caption="#" CellStyle-HorizontalAlign="Center" Width="100px">
                        <DataItemTemplate>
                            <asp:ImageButton CssClass="config-delete-grid" OnClick="btnDelete_Click" ID="btnDelete" ToolTip="Delete" runat="server" ImageUrl="/taikhoan/images/delete.png" OnClientClick="return confirmDelete();" CommandArgument='<%# Eval("Id")%>' />
                        </DataItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center"></CellStyle>
                    </dx:GridViewDataTextColumn>--%>
                </Columns>
                <Styles>
                    <AlternatingRow Enabled="true" />
                    <Cell Paddings-PaddingTop="10px" Paddings-PaddingBottom="10px"></Cell>
                </Styles>
                <SettingsEditing Mode="EditForm" />
                <SettingsPopup>
                    <HeaderFilter Height="280px" Width="250px" />
                </SettingsPopup>
            </dx:ASPxGridView>
        </div>
    </div>
</asp:Content>
