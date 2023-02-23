<%@ Page Title="" Language="C#" MasterPageFile="~/prodraftadmin/DongAAdminMasterPage.master" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="Siteadmin_cauhinh_banner_DanhSachBanner" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Đánh giá sản phẩm '<%=pro_Product.Code %>'
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/prodraftadmin/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/prodraftadmin">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Kho sản phẩm</a></li>
            <li class="breadcrumb-item"><a href="/prodraftadmin/khosanpham/quanlysanpham/list.aspx">Danh sách sản phẩm</a></li>
            <li class="breadcrumb-item active">Đánh giá sản phẩm '<%=pro_Product.Code %>'</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="57" />
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
    <div class="noidung">
        <div class="title">Đánh giá sản phẩm '<%=pro_Product.Code %>'</div>
        <div class="thanhtacvu"><a href="new.aspx?add=new&parent=<%=Request["parent"] %>" class="btn btn-sm btn-success"><i class="fa fa-plus" aria-hidden="true"></i>Thêm mới</a></div>
        <%--idpage--%>
        <div class="gridview">
            <dx:ASPxGridView ID="ASPxGVDS" EnableRowsCache="false" EnableViewState="false" Width="100%" runat="server"
                AutoGenerateColumns="False" EnableTheming="True" Theme="Office2010Black" PreviewEncodeHtml="False"
                OnCustomUnboundColumnData="ASPxGVDS_CustomUnboundColumnData" OnHtmlDataCellPrepared="ASPxGVDS_HtmlDataCellPrepared">
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
                    <dx:GridViewDataTextColumn FieldName="ScoreRate" Caption="Điểm">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FullName" Caption="Họ & tên">
                        <DataItemTemplate>
                            <span><%#Eval("FullName") %></span>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Comment" Caption="Nội dung">
                        <DataItemTemplate>
                            <span><%#Eval("Comment") %></span>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CreatedAt" Caption="Ngày gửi">
                        <DataItemTemplate>
                            <span><%#Eval("CreatedAt","{0:dd.MM.yyyy HH:mm:ss}") %></span>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataImageColumn FieldName="IsStatus" Caption="TT" UnboundType="String">
                        <DataItemTemplate>
                            <div style="float: left">
                                <asp:ImageButton ID="imgTT" OnClick="imgTT_Click" runat="server" CommandArgument='<%# Eval("Id")%>' ImageUrl="/prodraftadmin/images/visible.gif" ToolTip="Đèn sáng Tin đang hiển thị - Đèn mờ Tin đã ẩn" />
                            </div>
                        </DataItemTemplate>
                    </dx:GridViewDataImageColumn>
                    <dx:GridViewDataTextColumn Caption="#" CellStyle-HorizontalAlign="Center" Width="100px">
                        <DataItemTemplate>
                            <a href="new.aspx?id=<%# Eval("Id")%>&parent=<%# Request["parent"] %>" style="color: #1d7ebf" title="Chỉnh sửa">
                                <img alt="icon" src="/prodraftadmin/images/edit.png" style="border: none" /></a>
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
                <SettingsEditing Mode="EditForm" />
                <SettingsPopup>
                    <HeaderFilter Height="280px" Width="250px" />
                </SettingsPopup>
            </dx:ASPxGridView>
        </div>
    </div>
</asp:Content>
