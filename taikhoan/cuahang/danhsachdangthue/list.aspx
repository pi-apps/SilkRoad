<%@ Page Title="" Language="C#" MasterPageFile="~/taikhoan/PiglobalPriateUserMasterPage.master" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="Siteadmin_cauhinh_banner_DanhSachBanner" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Danh sách cửa hàng đang thuê
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <style>
        .container, .container {
    width: 98% !important;
}
    </style>
    <script src="/taikhoan/script/Common.js" type="text/javascript"></script>
    <script src="popup.js"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/taikhoan">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Cửa hàng</a></li>
            <li class="breadcrumb-item active">Danh sách cửa hàng đang thuê</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="133" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <dx:ASPxPopupControl PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter"
        HeaderText="Thư viện hình ảnh" Modal="true"
        Theme="Moderno" ID="PoupImage" SettingsLoadingPanel-ShowImage="true" ShowRefreshButton="true" ShowMaximizeButton="true" ShowShadow="true" ShowPinButton="true"
        ClientInstanceName="PoupImage" Width="700px" Height="600px"
        runat="server" AllowDragging="true" ScrollBars="None" AllowResize="true" CloseAction="CloseButton">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server"></dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter"
        HeaderText="Thư viện video" Modal="true"
        Theme="Moderno" ID="PoupVideo" SettingsLoadingPanel-ShowImage="true" ShowRefreshButton="true" ShowMaximizeButton="true" ShowShadow="true" ShowPinButton="true"
        ClientInstanceName="PoupVideo" Width="700px" Height="600px"
        runat="server" AllowDragging="true" ScrollBars="None" AllowResize="true" CloseAction="CloseButton">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl5" runat="server"></dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter"
        HeaderText="Thông tin gian hàng" Modal="true"
        Theme="Moderno" ID="ASPxPopupControl1" SettingsLoadingPanel-ShowImage="true" ShowRefreshButton="true" ShowMaximizeButton="true" ShowShadow="true" ShowPinButton="true"
        ClientInstanceName="PoupVideo" Width="700px" Height="600px"
        runat="server" AllowDragging="true" ScrollBars="None" AllowResize="true" CloseAction="CloseButton">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server"></dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <div class="noidung">
        <div class="title">Danh sách cửa hàng đang thuê</div>
        <div class="thanhtacvu">
            <%--<a href="new.aspx?add=new" class="btn btn-sm btn-success"><i class="fa fa-plus" aria-hidden="true"></i>Thêm mới</a>--%>
        </div>
        <%--idpage--%>
        <div class="gridview">
            <dx:ASPxGridView ClientInstanceName="ASPxGridViewF5" KeyFieldName="Id" ID="ASPxGVDS" EnableViewState="false" Width="100%" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="Aqua" PreviewEncodeHtml="False" OnCustomUnboundColumnData="ASPxGVDS_CustomUnboundColumnData" OnHtmlDataCellPrepared="ASPxGVDS_HtmlDataCellPrepared">
                <Settings ShowGroupPanel="false" ShowHeaderFilterButton="true" ShowFooter="false" />
                <SettingsCommandButton>
                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                </SettingsCommandButton>
                <ClientSideEvents EndCallback="OnEndCallback" BeginCallback="OnBeginCallback"/> 
                <SettingsDetail ShowDetailButtons="true" ShowDetailRow="true" />
                <SettingsSearchPanel Visible="True" />
                <SettingsPager PageSize="30">
                    <PageSizeItemSettings Visible="true" Items="20, 30, 50, 100, 200" />
                </SettingsPager>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="STT" Caption="STT" ReadOnly="True" UnboundType="String" ShowInCustomizationForm="True" VisibleIndex="0" Width="40px">
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center" ForeColor="#999999"></CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Code" Caption="Mã CH">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Name" Caption="Tên cửa hàng">
                        <DataItemTemplate>
                            <strong><%#Eval("Name") %></strong>
                            <div class="grid-menu">
                                <ul>
                                    <li><a href="javascript:void(0);" onclick="openPoupVideo(<%#Eval("Id") %>);"><i class="fa fa-play"></i>&nbsp; Video</a></li>
                                    <li><a href="gioithieu.aspx?id=<%# Eval("Id")%>"><i class="fa fa-product-hunt"></i>&nbsp; Giới thiệu</a></li>
                                    <li><a href="javascript:void(0);" onclick="openPoupImage(<%#Eval("Id") %>);"><i class="fa fa-picture-o"></i>&nbsp; Hoạt động</a></li>
                                    <li><a href="javascript:void(0);" onclick="openPoupContact(<%#Eval("Id") %>);"><i class="fa fa-mobile"></i>&nbsp; Thông tin</a></li>
                                </ul>
                            </div>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Banner" Caption="Hình">
                        <DataItemTemplate>
                            <img src="/<%#Eval("Banner") %>" style="width: 50px;" />
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ExchangeRate" Caption="Tỷ giá">
                        <DataItemTemplate>
                            <%#Eval("ExchangeRate","{0:0.##}") %>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RegionName" Caption="Vị trí">
                        <DataItemTemplate>
                            <%#Eval("RegionName") %>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewBandColumn Caption="Thời gian" HeaderStyle-BackColor="#660066" HeaderStyle-Font-Bold="true" HeaderStyle-HorizontalAlign="Center">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="DateBegin" Caption="Bắt đầu">
                                <DataItemTemplate>
                                    <%#Eval("DateBegin","{0:dd/MM/yyyy}") %>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="DateEnd" Caption="Kết thúc" CellStyle-HorizontalAlign="Center">
                                <DataItemTemplate>
                                    <div class="jumbotron countdown show" data-date='<%#Eval("DateEnd","{0:yyyy/MM/dd HH:mm:ss}") %>'>
                                                <div class="running">
                                                    <timer>
      <span class="days"></span><span class="hours"></span><span class="minutes"></span><span
              class="seconds"></span>
      </timer>
                                                    <div class="break"></div>
                                                    <div class="labels">
                                                        <span>Ngày</span><span>Giờ</span><span>Phút</span><span>Giây</span>
                                                    </div>
                                                </div>
                                            </div>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:GridViewBandColumn>
                    <dx:GridViewDataTextColumn FieldName="ViewCount" Caption="Lượt xem">
                        <DataItemTemplate>
                            <%#Eval("ViewCount","{0:#,##0}") %>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RankingCount" Caption="Đánh giá">
                        <DataItemTemplate>
                            <%#Eval("RankingCount","{0:#,##0}") %>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataImageColumn FieldName="IsStatus" Caption="TT" UnboundType="String">
                        <DataItemTemplate>
                            <div style="display:block;">
                                <asp:ImageButton ID="imgTT" OnClick="imgTT_Click" runat="server" CommandArgument='<%# Eval("Id")%>' ImageUrl="/taikhoan/images/visible.gif" ToolTip="Đèn sáng Tin đang hiển thị - Đèn mờ Tin đã ẩn" />
                            </div>
                        </DataItemTemplate>
                    </dx:GridViewDataImageColumn>
                    <dx:GridViewDataTextColumn Caption="#" CellStyle-HorizontalAlign="Center" Width="100px">
                        <DataItemTemplate>
                            <a href="new.aspx?id=<%# Eval("Id")%>" style="color: #1d7ebf" title="Chỉnh sửa">
                                <img alt="icon" src="/taikhoan/images/edit.png" style="border: none" /></a>
                        </DataItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center"></CellStyle>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Templates>
                    <DetailRow>
                        <div style="padding: 3px 3px 2px 3px">
                            <dx:ASPxGridView OnBeforePerformDataSelect="gridHistory_BeforePerformDataSelect"
                                ID="gridHistory" EnableViewState="false" Width="100%" runat="server"
                                AutoGenerateColumns="False"
                                EnableTheming="True" Theme="Office2010Silver" PreviewEncodeHtml="False"
                                OnCustomUnboundColumnData="gridHistory_CustomUnboundColumnData"
                                OnHtmlDataCellPrepared="gridHistory_HtmlDataCellPrepared">
                                <Settings ShowFilterRow="false" ShowGroupButtons="false" ShowGroupPanel="false"
                                    ShowHeaderFilterButton="false" ShowFooter="false" />
                                <SettingsExport>
                                    <PageHeader VerticalAlignment="Center" Font-Bold="true">
                                    </PageHeader>
                                </SettingsExport>
                                <SettingsCommandButton>
                                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                </SettingsCommandButton>
                                <SettingsSearchPanel Visible="false" />
                                <SettingsPager PageSize="30">
                                    <PageSizeItemSettings Visible="true" Items="20, 30, 50, 100, 200" />
                                </SettingsPager>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="STT" Caption="STT" ReadOnly="True" UnboundType="String" ShowInCustomizationForm="True" VisibleIndex="0" Width="40px">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Center" ForeColor="#999999"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="OrderCode" Caption="Mã thanh toán">
                                        <DataItemTemplate>
                                            <a href="javascript:;" onclick="openPopupUpdatePayment(<%#Eval("Id") %>);"><%#Eval("OrderCode") %></a>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Chi phí" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#990000">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Price" Caption="Giá thuê">
                                                <DataItemTemplate>
                                                    <%#Eval("Price","{0:#,##0}") %>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="ExchangeRate" Caption="Tỷ giá">
                                                <DataItemTemplate>
                                                    <%#Eval("ExchangeRate","{0:#,##0}") %>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="MonthAmount" Caption="Số tháng">
                                                <DataItemTemplate>
                                                    <%#Eval("MonthAmount","{0:#,##0}") %>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Amount" Caption="Tổng tiền">
                                                <DataItemTemplate>
                                                    <%#Eval("Amount","{0:#,##0}") %>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Thanh toán" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#006600">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="DepositDateline" Caption="Hạn thanh toán">
                                                <DataItemTemplate>
                                                    <%#Eval("DepositDateline","{0:dd/MM/yyyy HH:mm:ss}") %>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="LoaiTT" Caption="Loại TT" UnboundType="String"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="TTT" Caption="Trạng thái" UnboundType="String"></dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewDataTextColumn FieldName="PaymentDate" Caption="Ngày TT">
                                        <DataItemTemplate>
                                            <%#Eval("PaymentDate","{0:dd/MM/yyyy HH:mm:ss}") %>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
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
                    </DetailRow>
                </Templates>
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
    <script src="/taikhoan/admin_template/countdown/multi-countdown.js"></script>
    <script src="/taikhoan/admin_template/js/BeginCallback.js"></script>
</asp:Content>
