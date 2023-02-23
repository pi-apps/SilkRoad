<%@ Page Title="" Language="C#" MasterPageFile="~/taikhoan/PiglobalPriateUserMasterPage.master" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="Siteadmin_cauhinh_banner_DanhSachBanner" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Danh sách sản phẩm đấu giá
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/taikhoan/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/taikhoan">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Kho sản phẩm</a></li>
            <li class="breadcrumb-item active">Danh sách sản phẩm đấu giá</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="57" />
    <script src="jspopup.js"></script>
    <style>
        .container, .container {
            width: 98% !important;
        }
    </style>
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
    <div class="noidung">
        <div class="title">Danh sách sản phẩm đấu giá</div>
        <div class="thanhtacvu">
            <asp:Button ID="btnAddNew" Visible="false" OnClick="btnAddNew_Click" runat="server" Text="Thêm mới sản phẩm" CssClass="btn btn-sm btn-success" />
        </div>
        <%--idpage--%>
        <div class="gridview">
            <dx:ASPxGridView ID="ASPxGVDS" ClientInstanceName="ASPxGVDS" OnDataBinding="ASPxGVDS_DataBinding" KeyFieldName="Id" EnableRowsCache="false" Width="100%" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="Aqua" PreviewEncodeHtml="False" OnCustomUnboundColumnData="ASPxGVDS_CustomUnboundColumnData" OnHtmlDataCellPrepared="ASPxGVDS_HtmlDataCellPrepared">
                <Settings ShowGroupPanel="false" ShowHeaderFilterButton="true" ShowFooter="false" />
                <%--<ClientSideEvents Init="this.OnInit" EndCallback="this.OnEndCallback" />--%>
                <%--<SettingsDetail ShowDetailButtons="true" ShowDetailRow="true" />--%>
                <SettingsCommandButton>
                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                </SettingsCommandButton>
                <SettingsSearchPanel Visible="True" />
                <SettingsPager PageSize="30">
                    <PageSizeItemSettings Visible="true" Items="20, 30, 50, 100, 200,500,700,1000,2000" />
                </SettingsPager>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="STT" Caption="STT" ReadOnly="True" UnboundType="String" ShowInCustomizationForm="True" Width="40px">
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center" ForeColor="#999999"></CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Code" Caption="SKU">
                        <DataItemTemplate>
                            <a class="btn-thue view-more-page" href="popup/pophistoryauction.aspx?Id=<%#Eval("Id") %>">
                                <%#Eval("Code") %>
                            </a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductName" Caption="Tên SP">
                        <DataItemTemplate>
                            <dataitemtemplate>
                                    <a href="/san-dau-gia/san-pham/<%#Eval("ProductName").ToString().RemoveSymbol() %>-<%#Eval("Id") %>.html" target="_blank" title="<%#Eval("ProductName") %>"><%#Eval("ProductName") %></a>
                                </dataitemtemplate>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Image" Caption="Hình">
                        <DataItemTemplate>
                            <img src="/<%#Eval("Image") %>" style="width: 100px;" />
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PriceAuction" Caption="Giá khởi điểm">
                        <DataItemTemplate>
                            <span><%#Eval("PriceAuction","{0:0.##}") %>π</span>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="AuctionStart" Caption="Bắt đầu">
                        <DataItemTemplate>
                            <span><%#Eval("AuctionStart","{0:dd/MM/yyyy HH:mm:ss}") %></span>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn CellStyle-HorizontalAlign="Center" FieldName="AuctionEnd" Caption="Kết thúc">
                        <DataItemTemplate>
                            <asp:MultiView ID="MultiView1" runat="server">
                                <asp:View ID="View1" runat="server">
                                    <div class="jumbotron countdown show" data-date='<%#Eval("AuctionEnd","{0:yyyy/MM/dd HH:mm:ss}") %>'>
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
                                </asp:View>
                                <asp:View ID="View2" runat="server">
                                    <span><%#Eval("AuctionEnd","{0:dd/MM/yyyy HH:mm:ss}") %></span>
                                </asp:View>
                            </asp:MultiView>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ViewCount" Caption="Lượt xem">
                        <DataItemTemplate>
                            <%#Eval("ViewCount","{0:#,##0}") %>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataImageColumn FieldName="TTT" Caption="TT" UnboundType="String"></dx:GridViewDataImageColumn>
                    <dx:GridViewDataTextColumn Caption="#" CellStyle-HorizontalAlign="Center" Width="100px">
                        <DataItemTemplate>
                            
                            <a href="javascript:void(0);" onclick="openPoupImage(<%#Eval("Id") %>);" style="color: #1d7ebf;<%#bool.Parse(Eval("IsAuctionEnd").ToString())==true?"display:none;":"" %>" title="Hình ảnh">
                                <img alt="icon" src="/taikhoan/images/picture.png" style="border: none;" /></a>
                            <a href="new.aspx?id=<%# Eval("Id")%>" style="color: #1d7ebf;<%#bool.Parse(Eval("IsAuctionEnd").ToString())==true?"display:none;":"" %>" title="Chỉnh sửa">
                                <img alt="icon" src="/taikhoan/images/edit.png" style="border: none" /></a>
                            <a href="bird.aspx?id=<%# Eval("Id")%>" style="color: #1d7ebf;<%#bool.Parse(Eval("IsAuctionEnd").ToString())==true?"display:none;":"" %>" title="Chỉnh sửa">
                                <img alt="icon" src="/taikhoan/images/bird.png" style="border: none; width: 24px;" /></a>
                        </DataItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center"></CellStyle>
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
    </div>
    <script src="/taikhoan/admin_template/countdown/multi-countdown.js"></script>
</asp:Content>
