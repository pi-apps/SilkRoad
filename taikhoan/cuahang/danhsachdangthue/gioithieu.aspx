<%@ Page Title="" Language="C#" MasterPageFile="~/taikhoan/PiglobalPriateUserMasterPage.master" AutoEventWireup="true" CodeFile="gioithieu.aspx.cs" Inherits="Siteadmin_cauhinh_banner_new" %>

<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Chỉnh sửa thông tin giới thiệu
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/taikhoan/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/taikhoan">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Cửa hàng</a></li>
            <li class="breadcrumb-item"><a href="list.aspx">Danh sách cửa hàng đang thuê</a></li>
            <li class="breadcrumb-item active">Chỉnh sửa thông tin giới thiệu</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="133" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <div class="noidung">
        <div class="title">Chỉnh sửa thông tin giới thiệu</div>
        <div class="thanhtacvu">
            <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" ValidationGroup="validateForm" />&nbsp;<a href="list.aspx" class="btn btn-sm btn-danger"><i class="fa fa-undo" aria-hidden="true"></i>&nbsp;Quay về</a>
        </div>
        <div class="div-crud">
            <table class="table-crud">
                <tr>
                    <td class="name1">
                        <label for="txtName">Mã cửa hàng</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtCode" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Tên cửa hàng</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtName" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:HiddenField ID="txtId" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Tiêu đề</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="form-field-8">Hình đại diện</label>
                    </td>
                    <td class="txt1">
                        <asp:FileUpload ID="fulImage" runat="server" ClientIDMode="Static" />
                        <p>
                            <asp:Image ID="imgImage" Width="100px" ClientIDMode="Static" ImageUrl="~/user_upload/no-logo.png" runat="server" />
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="form-field-8">Mô tả</label>
                    </td>
                    <td class="txt1">
                        <textarea class="form-control" textmode="MultiLine" rows="3" runat="server" id="txtSummary"></textarea>
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
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button1" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" ValidationGroup="validateForm" />&nbsp;<a href="list.aspx" class="btn btn-sm btn-danger"><i class="fa fa-undo" aria-hidden="true"></i>&nbsp;Quay về</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
