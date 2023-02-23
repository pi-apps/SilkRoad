<%@ Page Title="" Language="C#" MasterPageFile="~/prodraftadmin/PiglobalAdminMasterPage.master" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="Siteadmin_cauhinh_banner_DanhSachBanner" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Danh sách nhân viên
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/prodraftadmin/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/prodraftadmin">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Thông tin công ty</a></li>
            <li class="breadcrumb-item active">Danh sách nhân viên</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="60" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <script src="nv.js"></script>
    <dx:ASPxPopupControl PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter"
        HeaderText="Thông tin nhân viên" ShowRefreshButton="true" ShowMaximizeButton="true" ShowShadow="true" ShowPinButton="true" Modal="true"
        Theme="Moderno" ID="ASPxPopupControl6" ClientInstanceName="popupThongTinNhanVien" Width="600px" Height="600px"
        runat="server" AllowDragging="true" ScrollBars="None" AllowResize="true" CloseAction="CloseButton">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl7" runat="server"></dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter"
        HeaderText="Thông tin tài khoản nhân viên" ShowRefreshButton="true" ShowMaximizeButton="true" ShowShadow="true" ShowPinButton="true" Modal="true"
        Theme="Moderno" ID="ASPxPopupControl1" ClientInstanceName="popupTaiKhoanNhanVien" Width="600px" Height="600px"
        runat="server" AllowDragging="true" ScrollBars="None" AllowResize="true" CloseAction="CloseButton">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server"></dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <div class="noidung">
        <div class="title">Danh sách nhân viên</div>
        <div class="thanhtacvu"><a href="new.aspx?add=new" class="btn btn-sm btn-success"><i class="fa fa-plus" aria-hidden="true"></i>Thêm mới</a></div>
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
                    <dx:GridViewDataTextColumn GroupIndex="0" FieldName="ChiNhanh" Caption="Chi nhánh">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Avatar" Caption="Avatar">
                        <DataItemTemplate>
                            <img src="/<%#Eval("Avatar") %>" style="width:70px;" />
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Code" Caption="Mã NV">
                        <DataItemTemplate>
                            <span class="emp_code"><a href="javascript:;" onclick="DisplayInfoEmployee('<%#Eval("Id") %>')"><%#Eval("Code") %></a></span>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FirstName" Caption="Họ & tên">
                        <DataItemTemplate>
                            <span class="emp_name"><%#Eval("FirstName") %></span>
                            <p class="emp-margin-5">
                                <span class="emp_department"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;<%#Eval("PhongBan") %></span>
                                <span class="emp_position"><i class="fa fa-address-card" aria-hidden="true"></i>&nbsp;<%#Eval("ViTri") %></span>
                                <span class="emp_account"><a href="javascript:;" onclick="DisplayInfoAccount('<%#Eval("Id") %>')"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Tài khoản</a></span>
                            </p>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <%--<dx:GridViewDataTextColumn FieldName="Gender" Caption="Giới tính">
                        <DataItemTemplate>
                            <span class="emp_gender"><%#bool.Parse(Eval("Gender")+"")?"Nam":"Nữ" %></span>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>--%>
                    <dx:GridViewDataTextColumn FieldName="Mobile" Caption="Điện thoại">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Email" Caption="Email">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataImageColumn FieldName="Active" Caption="TT" UnboundType="String">
                        <DataItemTemplate>
                            <span class="<%#bool.Parse(Eval("Active")+"")?"emp_status_1":"emp_status_0" %>"><%# bool.Parse(Eval("Active")+"")?"Đang sử dụng":"Đã khóa" %></span>
                        </DataItemTemplate>
                    </dx:GridViewDataImageColumn>
                    <dx:GridViewDataTextColumn Caption="#" CellStyle-HorizontalAlign="Center" Width="100px">
                        <DataItemTemplate>
                            <a href="new.aspx?id=<%# Eval("Id")%>" style="color: #1d7ebf" title="Chỉnh sửa">
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
