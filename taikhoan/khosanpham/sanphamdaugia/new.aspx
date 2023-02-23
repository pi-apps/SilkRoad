<%@ Page Title="" Language="C#" MasterPageFile="~/taikhoan/PiglobalPriateUserMasterPage.master" AutoEventWireup="true" CodeFile="new.aspx.cs" Inherits="Siteadmin_cauhinh_banner_new" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Thêm/sửa sản phẩm đấu giá
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/taikhoan/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/taikhoan">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Kho sản phẩm</a></li>
            <li class="breadcrumb-item"><a href="list.aspx">Danh sách sản phẩm đấu giá</a></li>
            <li class="breadcrumb-item active">Thêm/sửa sản phẩm đấu giá</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="57" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <div class="noidung">
        <div class="title">Thêm/sửa sản phẩm đấu giá</div>
        <div class="thanhtacvu">
            <asp:Button ID="btnSave" Visible="false" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" ValidationGroup="validateForm" />&nbsp;<a href="list.aspx" class="btn btn-sm btn-danger"><i class="fa fa-undo" aria-hidden="true"></i>&nbsp;Quay về</a>
        </div>
        <div class="div-crud">
            <script src="/taikhoan/tab/videodanhmuc/js.js"></script>
            <script src="price.js"></script>
            <link href="/taikhoan/tab/css.css" rel="stylesheet" />
            <div id="tabs">
                <ul class="tabs">
                    <li><a href="#tabs-1">Thông tin chung</a></li>
                    <li><a href="#tabs-2">Thông tin sản phẩm</a></li>
                    <li><a href="#tabs-5">SEO & MXH</a></li>
                </ul>
                
                
                <div id="tabs-1">
                    <div class="tab-content">
                        <table class="table-crud">
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
                                    <label for="txtName">Mã sản phẩm</label>
                                </td>
                                <td class="txt1">
                                    <asp:TextBox ReadOnly="true" ID="txtCode" CssClass="form-control" runat="server"></asp:TextBox>
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
                            <tr>
                                <td class="name1">Trạng thái</td>
                                <td class="txt1">
                                    <asp:CheckBox ID="rdoStatus" Checked="true" runat="server" Text="&nbsp; [Chọn để hiển thị]" />
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
