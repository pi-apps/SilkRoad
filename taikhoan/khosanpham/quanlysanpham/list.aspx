<%@ Page Title="" Language="C#" MasterPageFile="~/taikhoan/PiglobalPriateUserMasterPage.master" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="Siteadmin_cauhinh_banner_DanhSachBanner" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Danh sách sản phẩm
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/taikhoan/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/taikhoan">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Kho sản phẩm</a></li>
            <li class="breadcrumb-item active">Danh sách sản phẩm</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="57" />
    <script src="jspopup.js"></script>
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
        <div class="title">Danh sách sản phẩm</div>
        <div class="thanhtacvu">
            <asp:Button ID="btnAddNew" Visible="false" OnClick="btnAddNew_Click" runat="server" Text="Thêm mới sản phẩm" CssClass="btn btn-sm btn-success" />
        </div>
        <%--idpage--%>
        <div class="gridview">
            <dx:ASPxGridView ID="ASPxGVDS" OnDataBinding="ASPxGVDS_DataBinding" KeyFieldName="Id" EnableRowsCache="false" Width="100%" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="Aqua" PreviewEncodeHtml="False" OnCustomUnboundColumnData="ASPxGVDS_CustomUnboundColumnData" OnHtmlDataCellPrepared="ASPxGVDS_HtmlDataCellPrepared">
                <Settings ShowGroupPanel="false" ShowHeaderFilterButton="true" ShowFooter="false" />
                <SettingsCommandButton>
                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                </SettingsCommandButton>
                <SettingsSearchPanel Visible="True" />
                <SettingsPager PageSize="30">
                    <PageSizeItemSettings Visible="true" Items="20, 30, 50, 100, 200,500,700,1000,2000" />
                </SettingsPager>
                <Columns>
                    <%--<dx:GridViewCommandColumn ShowSelectCheckbox="True" ShowClearFilterButton="true" SelectAllCheckboxMode="Page"></dx:GridViewCommandColumn>--%>
                    <dx:GridViewDataTextColumn FieldName="STT" Caption="STT" ReadOnly="True" UnboundType="String" ShowInCustomizationForm="True"  Width="40px">
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center" ForeColor="#999999"></CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ShopName" Caption="Cửa hàng">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Code" Caption="SKU">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductName" Caption="Tên SP">
                        <DataItemTemplate>
                            <span><%#Eval("ProductName") %></span>
                            <div class="grid-menu" style="display:none;">
                                <ul>
                                    <li><a href="javascript:;" onclick="openPopupEditCategory(<%#Eval("Id") %>)"><i class="fa fa-align-left"></i>&nbsp; Danh mục (<%#Eval("CountDM") %>)</a></li>
                                    <li><a href="javascript:;" onclick="openPopupEditTag(<%#Eval("Id") %>)"><i class="fa fa-tags"></i>&nbsp; Từ khóa (<%#Eval("CountTag") %>)</a></li>
                                    <li><a href="javascript:;" onclick="openPopupEditProdutRelated(<%#Eval("Id") %>)"><i class="fa fa-product-hunt"></i>&nbsp; Mua kèm (<%#Eval("CountLQ") %>)</a></li>
                                    <li><a href="javascript:;" onclick="openPopupEditProdutSameType(<%#Eval("Id") %>)"><i class="fa fa-handshake-o"></i>&nbsp; Cùng loại (<%#Eval("CountSame") %>)</a></li>
                                    
                                </ul>
                            </div>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Image" Caption="Hình">
                        <DataItemTemplate>
                            <img src="/<%#Eval("Image") %>" style="width: 100px;" />
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
                    <dx:GridViewDataTextColumn FieldName="ViewCount" Caption="Lượt xem">
                        <DataItemTemplate>
                            <%#Eval("ViewCount","{0:#,##0}") %>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataImageColumn FieldName="IsStatus" Caption="TT" UnboundType="String">
                        <DataItemTemplate>
                            <div style="display:block;">
                                <asp:ImageButton ID="imgTT" OnClick="imgTT_Click" runat="server" CommandArgument='<%# Eval("Id")%>' ImageUrl="/taikhoan/images/visible.gif" ToolTip="Đèn sáng Tin đang hiển thị - Đèn mờ Tin đã ẩn" /> (<%#Eval("NumOr") %>)
                            </div>
<%--                            <div style="display:block;">
                                <input id="txtttuutien" class="txtttuutien" data-id="<%#Eval("Id") %>" value="<%#Eval("NumOr") %>" style="width:40px;text-align:center;" type="number" />
                            </div>--%>
                        </DataItemTemplate>
                    </dx:GridViewDataImageColumn>
                    <%--<dx:GridViewDataImageColumn FieldName="IsPromotion" Caption="KM" UnboundType="String">
                        <DataItemTemplate>
                            <div style="float: left">
                                <asp:ImageButton ID="imgPromotion" OnClick="imgPromotion_Click" runat="server" CommandArgument='<%# Eval("Id")%>' ImageUrl="/prodraftadmin/images/visible.gif" ToolTip="Đèn sáng Tin đang hiển thị - Đèn mờ Tin đã ẩn" />
                            </div>
                        </DataItemTemplate>
                    </dx:GridViewDataImageColumn>--%>
                    <dx:GridViewDataTextColumn Caption="#" CellStyle-HorizontalAlign="Center" Width="100px">
                        <DataItemTemplate>
                            <a href="javascript:void(0);" onclick="openPoupVideo(<%#Eval("Id") %>);" style="color: #1d7ebf;display:none;" title="Video">
                                <img alt="icon" src="/taikhoan/images/youtube.png" style="border: none" /></a>
                            <a href="javascript:void(0);" onclick="openPoupImage(<%#Eval("Id") %>);" style="color: #1d7ebf" title="Hình ảnh">
                                <img alt="icon" src="/taikhoan/images/picture.png" style="border: none" /></a>
                            <a href="new.aspx?id=<%# Eval("Id")%>" style="color: #1d7ebf" title="Chỉnh sửa">
                                <img alt="icon" src="/taikhoan/images/edit.png" style="border: none" /></a>
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
    <script>
        $(document).on("change", ".txtttuutien", function () {
            value = $(this).val();
            id = $(this).attr("data-id");
            $.ajax({
                url: '/taikhoan/khosanpham/quanlysanpham/ajax/updateNumOr.aspx',
                data: { id: id, numOr: value },
                success: function () {

                }
            });
        });
    </script>
</asp:Content>
