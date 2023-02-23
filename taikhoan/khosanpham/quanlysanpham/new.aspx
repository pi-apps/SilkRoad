<%@ Page Title="" Language="C#" MasterPageFile="~/taikhoan/PiglobalPriateUserMasterPage.master" AutoEventWireup="true" CodeFile="new.aspx.cs" Inherits="Siteadmin_cauhinh_banner_new" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Thêm/sửa sản phẩm
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/taikhoan/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/taikhoan">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Kho sản phẩm</a></li>
            <li class="breadcrumb-item"><a href="list.aspx">Danh sách sản phẩm</a></li>
            <li class="breadcrumb-item active">Thêm/sửa sản phẩm</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="57" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <div class="noidung">
        <div class="title">Thêm/sửa sản phẩm</div>
        <div class="thanhtacvu">
            <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" ValidationGroup="validateForm" />&nbsp;<a href="list.aspx" class="btn btn-sm btn-danger"><i class="fa fa-undo" aria-hidden="true"></i>&nbsp;Quay về</a>
        </div>
        <div class="div-crud">
            <script src="/taikhoan/tab/videodanhmuc/js.js"></script>
            <script src="price.js"></script>
            <link href="/taikhoan/tab/css.css" rel="stylesheet" />
            <div id="tabs">
                <ul class="tabs">
                    <li><a href="#tabs-1">Thông tin chung</a></li>
                    <li><a href="#tabs-2">Thông tin sản phẩm</a></li>
                    <li><a href="#tabs-4">Giá sản phẩm</a></li>
                    <li><a href="#tabs-5">SEO & MXH</a></li>
                </ul>
                
                
                <div id="tabs-1">
                    <div class="tab-content">
                        <table class="table-crud">
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Cửa hàng</label>
                                </td>
                                <td class="txt1">
                                    <asp:DropDownList CssClass="form-control" Width="97%" ID="ddlCuahang" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Danh mục</label>
                                </td>
                                <td class="txt1">
                                    <asp:DropDownList CssClass="form-control" Width="97%" ID="ddlDanhMuc" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Nhà cung cấp</label>
                                </td>
                                <td class="txt1">
                                    <asp:DropDownList CssClass="form-control" Width="97%" ID="ddlSupplier" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Tình trạng sản phẩm</label>
                                </td>
                                <td class="txt1">
                                    <asp:DropDownList CssClass="form-control" Width="97%" ID="ddlStatusProduct" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Đơn vị tính</label>
                                </td>
                                <td class="txt1">
                                    <asp:DropDownList CssClass="form-control" Width="97%" ID="ddlDonViTinh" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="txtName">Mã sản phẩm</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ID="txtCode" CssClass="form-control" runat="server"></asp:TextBox>
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
                                    <asp:FileUpload ID="fulImage" runat="server" ClientIDMode="Static"/>
                                    <p>
                                        <asp:Image ID="imgImage" Width="100px" ClientIDMode="Static" ImageUrl="~/user_upload/no-logo.png" runat="server" />
                                    </p>
                                </td>
                            </tr>
                            <%--<tr>
                                <td class="name1">
                                    <label for="form-field-8">Hình lớn</label>
                                </td>
                                <td class="txt1">
                                    <asp:FileUpload ID="fulImageLarge" runat="server" ClientIDMode="Static" />
                                    <p>
                                        <asp:Image ID="imgImageLarge" Width="100px" ClientIDMode="Static" ImageUrl="~/upload/no-logo.png" runat="server" />
                                    </p>
                                </td>
                            </tr>--%>

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
                            <%--<tr>
                                <td class="name1">Trang chủ</td>
                                <td class="txt1">
                                    <asp:CheckBox ID="rdoIsHome" Checked="false" runat="server" Text="&nbsp; [Chọn để hiển thị trang chủ]" />
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">Trang chủ (nổi bật)</td>
                                <td class="txt1">
                                    <asp:CheckBox ID="rdoIsHomeTop" Checked="false" runat="server" Text="&nbsp; [Chọn để hiển thị hình lớn]" />
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">Danh mục (nổi bật)</td>
                                <td class="txt1">
                                    <asp:CheckBox ID="rdoIsProductTop" Checked="false" runat="server" Text="&nbsp; [Chọn để hiển thị sản phẩm nổi bật]" />
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">Hiện menu</td>
                                <td class="txt1">
                                    <asp:CheckBox ID="rdoIsMenu" Checked="false" runat="server" Text="&nbsp; [Chọn để hiển thị trên menu]" />
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">Ưu đãi</td>
                                <td class="txt1">
                                    <asp:CheckBox ID="rdoIsDeal" Checked="false" runat="server" Text="&nbsp; [Chọn để hiển thị]" />
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">Nổi bật</td>
                                <td class="txt1">
                                    <asp:CheckBox ID="rdoIsFeatured" Checked="false" runat="server" Text="&nbsp; [Chọn để hiển thị]" />
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">Bán chạy</td>
                                <td class="txt1">
                                    <asp:CheckBox ID="rdoIsBestSelling" Checked="false" runat="server" Text="&nbsp; [Chọn để hiển thị]" />
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">Hàng mới</td>
                                <td class="txt1">
                                    <asp:CheckBox ID="rdoIsNewArrivals" Checked="false" runat="server" Text="&nbsp; [Chọn để hiển thị]" />
                                </td>
                            </tr>--%>
                        </table>
                    </div>
                </div>
                <div id="tabs-2">
                    <div class="tab-content">
                        <table class="table-crud">
                            <tr>
                                <td class="name1">
                                    <label for="form-field-8">Tóm tắt</label>
                                </td>
                                <td class="txt1">
                                    <textarea class="form-control description" runat="server" id="txtSummary"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="form-field-8">Chi tiết</label>
                                </td>
                                <td class="txt1">
                                    <textarea class="form-control description" runat="server" id="txtDescription"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="name1">
                                    <label for="form-field-8">Ghi chú</label>
                                </td>
                                <td class="txt1">
                                    <textarea class="form-control description" runat="server" id="txtCachBaiTri"></textarea>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="tabs-4">
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
                            <tr style="display:none;">
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
                <div id="tabs-5">
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
                                        <asp:Image ID="imgSocialImage" Width="100px" ClientIDMode="Static" ImageUrl="~/user_upload/no-logo.png" runat="server" />
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
