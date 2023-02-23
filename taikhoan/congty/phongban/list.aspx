<%@ Page Title="" Language="C#" MasterPageFile="~/prodraftadmin/PiglobalAdminMasterPage.master" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="Siteadmin_cauhinh_banner_DanhSachBanner" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Danh sách phòng ban
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/prodraftadmin/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/prodraftadmin">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Thông tin công ty</a></li>
            <li class="breadcrumb-item active">Danh sách phòng ban</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="60" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <div class="noidung">
        <div class="title">Danh sách phòng ban</div>
        <div class="thanhtacvu"><a href="new.aspx?add=new" class="btn btn-sm btn-success"><i class="fa fa-plus" aria-hidden="true"></i> Thêm mới</a></div>
        <%--idpage--%>
        <div class="gridview">
            <dx:ASPxGridView ID="ASPxGVDS" EnableViewState="false" Width="100%" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="Aqua" PreviewEncodeHtml="False" OnCustomUnboundColumnData="ASPxGVDS_CustomUnboundColumnData" OnHtmlDataCellPrepared="ASPxGVDS_HtmlDataCellPrepared">
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
                    <dx:GridViewDataTextColumn FieldName="Name" Caption="Tên phòng">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataImageColumn FieldName="Active" Caption="TT" Width="100px" UnboundType="String">
                        <DataItemTemplate>
                            <div style="float: left">
                                <asp:ImageButton ID="imgTT" OnClick="imgTT_Click" runat="server" CommandArgument='<%# Eval("Id")%>' ImageUrl="/prodraftadmin/images/visible.gif" ToolTip="Đèn sáng Tin đang hiển thị - Đèn mờ Tin đã ẩn" />
                            </div>
                            <div style="float: left">
                                <dx:ASPxTextBox ID="txtttuutien" runat="server" Text='<%#Eval("SortOrder") %>' Width="30px" Enabled="false"></dx:ASPxTextBox>
                            </div>
                        </DataItemTemplate>
                    </dx:GridViewDataImageColumn>
                     <dx:GridViewDataTextColumn Caption="#" CellStyle-HorizontalAlign="Center" Width="100px">
                        <DataItemTemplate>
                            <a href="new.aspx?id=<%# Eval("Id")%>" style="color: #1d7ebf" title="Chỉnh sửa"><img alt="icon" src="/prodraftadmin/images/edit.png" style="border: none" /></a>
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
