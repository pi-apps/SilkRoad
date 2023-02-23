<%@ Page Title="" Language="C#" MasterPageFile="~/prodraftadmin/DongAAdminMasterPage.master" AutoEventWireup="true" CodeFile="new.aspx.cs" Inherits="Siteadmin_cauhinh_banner_new" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Thêm/sửa giá & kho
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/prodraftadmin/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/prodraftadmin">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Kho sản phẩm</a></li>
            <li class="breadcrumb-item"><a href="/prodraftadmin/khosanpham/quanlysanpham/list.aspx">Danh sách sản phẩm</a></li>
            <li class="breadcrumb-item"><a href="/prodraftadmin/khosanpham/quanlysanpham/khovagia/list.aspx?parent=<%=pro_Product.Id %>">Kho & giá sản phẩm '<%=pro_Product.Code %>'</a></li>
            <li class="breadcrumb-item active">Thêm/sửa giá & kho</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="57" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <div class="noidung">
        <div class="title">Thêm/sửa giá & kho</div>
        <div class="thanhtacvu">
            <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" ValidationGroup="validateForm" />&nbsp;<a href="/prodraftadmin/khosanpham/quanlysanpham/khovagia/list.aspx?parent=<%=pro_Product.Id %>" class="btn btn-sm btn-danger"><i class="fa fa-undo" aria-hidden="true"></i>&nbsp;Quay về</a>
        </div>
        <div class="div-crud">
            <script src="/prodraftadmin/tab/videodanhmuc/js.js"></script>
            <script src="price.js"></script>
            <script type="text/javascript">
                function CloseGridLookup() {
                    GridLookupTags.ConfirmCurrentSelection();
                    GridLookupTags.HideDropDown();
                    GridLookupTags.Focus();
                }
            </script>
            <link href="/prodraftadmin/tab/css.css" rel="stylesheet" />
            <style>
                fieldset.attribute legend {
                    color: #fff;
                    margin-bottom: 0;
                    font-size: 14px;
                    font-weight: bold;
                    padding: 0px 0px 0px 6px;
                    cursor: pointer;
                }

                .attribute-detail {
                    background: #f0f0f0;
                    width: 100.5%;
                    border: 1px solid #fcfcfc;
                    border-top: none;
                }

                .table-radio label {
                    display: inline-block;
                    margin-left: 5px;
                    color: #333;
                }

                .attribute-detail-none {
                    display: none;
                }
                fieldset.attribute legend:hover{
                    background: #B8860B;
                }
                .legend-attribute-active {
                    background: #B8860B;
                }
                .legend-attribute-noactive {
                    background: #8B8B83;
                }
            </style>
            <div id="tabs">
                <ul class="tabs">
                    <li><a href="#tabs-1">Thông tin chung</a></li>
                    <li><a href="#tabs-2">Giá sản phẩm</a></li>
                    <li><a href="#tabs-3">Chi nhánh & số lượng</a></li>
                    <li><a href="#tabs-4">Thuộc tính</a></li>
                    <li><a href="#tabs-5">Thanh toán online</a></li>
                    <li><a href="#tabs-6">SEO & MXH</a></li>
                </ul>
                <div id="tabs-1">
                    <div class="tab-content">
                        <table class="table-crud">
                            <%--<tr>
                                <td class="name1">
                                    <label for="txtName">Thuộc tính</label>
                                </td>
                                <td class="txt1">
                                    <dx:ASPxGridLookup ID="ASPxGridTags" Theme="Office2010Black" ViewStateMode="Enabled" EnableViewState="false" Width="100%" runat="server" KeyFieldName="Id" ClientInstanceName="GridLookupTags" SelectionMode="Multiple" TextFormatString="{3}" AutoGenerateColumns="False">
                                        <GridViewProperties>
                                            <Templates>
                                                <StatusBar>
                                                    <table class="OptionsTable" style="float: right; width: 600px;">
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
                                            <SettingsPager PageSize="20"></SettingsPager>
                                        </GridViewProperties>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="false" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn GroupIndex="0" FieldName="ParentName" Caption="Thuộc tính" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="2" />
                                            <dx:GridViewDataTextColumn FieldName="Code" Caption="Mã" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Name" Caption="Tên" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:ASPxGridLookup>

                                </td>
                            </tr>--%>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Mã sản phẩm <a target="_blank" href="/page/huong-dan-nhan-dang-ma-32.html"><i class="fa fa-question" aria-hidden="true"></i></a></label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtCode" ClientIDMode="Static" Enabled="true" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:HiddenField ID="hdfCodeParent" ClientIDMode="Static" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Ghi chú nhận dạng</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtCodeNote" Enabled="true" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Mã nhập hàng</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtImportCode" ClientIDMode="Static" Enabled="true" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Mã đối ứng (kế toán)</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtAccountantCode" Enabled="true" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Tên sản phẩm</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:HiddenField ID="txtId" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="form-field-8">Hình đại diện</label>
                                </td>
                                <td class="txt1">
                                    <asp:FileUpload ID="fulImage" runat="server" ClientIDMode="Static" />
                                    <p>
                                        <asp:Image ID="imgImage" Width="100px" ClientIDMode="Static" ImageUrl="~/upload/no-logo.png" runat="server" />
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="form-field-8">Hình lớn</label>
                                </td>
                                <td class="txt1">
                                    <asp:FileUpload ID="fulImageLarge" runat="server" ClientIDMode="Static" />
                                    <p>
                                        <asp:Image ID="imgImageLarge" Width="100px" ClientIDMode="Static" ImageUrl="~/upload/no-logo.png" runat="server" />
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">Sắp xếp<br />
                                    <span class="colorGray">Hiển thị theo thứ tự tăng dần</span></td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtNumOr" CssClass="form-control" TextMode="Number" runat="server" Width="280px" Text="0"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">Trạng thái</td>
                                <td class="txt1">
                                    <asp:CheckBox ID="rdoStatus" Checked="true" runat="server" Text="&nbsp; [Chọn để hiển thị]" />
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">Hiển thị</td>
                                <td class="txt1">
                                    <asp:CheckBox ID="rdoIsMain" Checked="false" runat="server" Text="&nbsp; [Chọn để làm sản phẩm chính]" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="tabs-2">
                    <div class="tab-content">
                        <table class="table-crud">
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Giá gốc</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtPrice" Text="0" CssClass="txtPrice price-input-format form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Khuyến mãi</label>
                                </td>
                                <td class="txt1">Tiền KM:
                                    <asp:TextBox ID="txtPricePromotion" Text="0" CssClass="txtPricePromotion price-input-format form-control" Width="200px" runat="server"></asp:TextBox>
                                    %KM:
                                    <asp:TextBox ID="txtPricePercent" Text="0" CssClass="txtPricePercent price-input-format form-control" Width="200px" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Giá bán</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtPriceSell" Text="0" CssClass="txtPriceSell price-input-format form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Giá bán online</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtPricesellOnline" Text="0" CssClass="txtPricesellOnline price-input-format form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="tabs-3">
                    <div class="tab-content">
                        <table class="table-crud table table-bordered">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Chi nhánh</th>
                                    <th>Số lượng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptShowRoom" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Container.ItemIndex + 1 %></td>
                                            <td>
                                                <b><%#Eval("Name") %></b>
                                                <span class="address-kho"><%#Eval("Address") %></span>
                                            </td>
                                            <td>
                                                <asp:HiddenField ID="hdfId" Value='<%#Eval("Id") %>' runat="server" />
                                                <asp:TextBox ID="txtShowRoomQuantity" CssClass="form-control" Width="50px" TextMode="Number" Text="20" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="tabs-4">
                    <div class="tab-content tab-content-radio">
                        <div>
                            <asp:Repeater ID="rptAttribute" runat="server" OnItemDataBound="rptAttribute_ItemDataBound">
                                <ItemTemplate>
                                    <fieldset class="attribute">
                                        <legend class="legend-attribute <%# Container.ItemIndex==0?"legend-attribute-active":"legend-attribute-noactive" %>" data-id="<%#Eval("Id") %>">
                                            <%#Eval("Name") %> (Chỉ được chọn 1)<asp:HiddenField ID="hdfId" runat="server" Value='<%#Eval("Id") %>' />
                                        </legend>

                                        <div id="attribute-detail-<%#Eval("Id") %>" class="attribute-detail <%# Container.ItemIndex!=0?"attribute-detail-none":"attribute-detail-show" %>">
                                            <asp:CheckBoxList ID="rdoAttributeDetail" runat="server" RepeatColumns="5" CssClass="table-radio"></asp:CheckBoxList>
                                        </div>
                                    </fieldset>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
                <div id="tabs-5">
                    <div class="tab-content">
                        <table class="table-crud">
                            <tr>
                                <td class="name1">Thanh toán</td>
                                <td class="txt1">
                                    <asp:CheckBox ID="rdoIsPaymentOnline" Checked="true" runat="server" Text="&nbsp; [Chọn để cho phép thanh toán online]" />
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Tiền đặt cọc</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtDepositPayment" Text="0" CssClass="txtDepositPayment price-input-format form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="tabs-6">
                    <div class="tab-content">
                        <table class="table-crud">
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Tiêu đề trang</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtSeoTitle" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Từ khóa</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtSeoKeyword" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Mô tả trang</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox TextMode="MultiLine" ID="txtSeoDescription" Rows="5" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Tiêu đề MXH</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtSocialTitle" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Mô tả MXH</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox TextMode="MultiLine" Rows="5" ID="txtSocialDescription" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="form-field-8">Hình MXH</label>
                                </td>
                                <td class="txt1 file-choose">
                                    <asp:FileUpload ID="fulSocialImage" runat="server" ClientIDMode="Static" />
                                    <p>
                                        <asp:Image ID="imgSocialImage" Width="100px" ClientIDMode="Static" ImageUrl="~/upload/no-logo.png" runat="server" />
                                    </p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
