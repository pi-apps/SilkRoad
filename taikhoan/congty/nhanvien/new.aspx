<%@ Page Title="" Language="C#" MasterPageFile="~/prodraftadmin/PiglobalAdminMasterPage.master" AutoEventWireup="true" CodeFile="new.aspx.cs" Inherits="Siteadmin_cauhinh_banner_new" %>

<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Thêm mới/sửa nhân viên
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/prodraftadmin/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/prodraftadmin">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Thông tin công ty</a></li>
            <li class="breadcrumb-item"><a href="/prodraftadmin/congty/nhanvien/list.aspx">Danh sách nhân viên</a></li>
            <li class="breadcrumb-item active">Thêm mới/sửa nhân viên</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="60" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <div class="noidung">
        <div class="title">Thêm mới/sửa nhân viên</div>
        <div class="thanhtacvu"><a href="list.aspx" class="btn btn-sm btn-danger"><i class="fa fa-undo" aria-hidden="true"></i>&nbsp;Quay về</a></div>
        <div class="div-crud">
            <table class="table-crud">
                <tr>
                    <td class="name1">
                        <label for="txtName">Văn phòng</label>
                    </td>
                    <td class="txt1">
                        <asp:DropDownList ID="ddlCompany" CssClass="form-control" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Phòng ban</label>
                    </td>
                    <td class="txt1">
                        <asp:DropDownList ID="ddlDepartment" CssClass="form-control" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Vị trí</label>
                    </td>
                    <td class="txt1">
                        <asp:DropDownList ID="ddlPosition" CssClass="form-control" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Mã nhân viên</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtCode" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Họ & tên</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:HiddenField ID="txtId" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Email</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Ngày sinh</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtBirthday" CssClass="datepicker form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="name1">Giới tính</td>
                    <td class="txt1">
                        <asp:CheckBox ID="chkGender" Checked="true" runat="server" Text="&nbsp; [Chọn là nam, không chọn là nữ]" />
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Ngày vào làm</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtworkingDate" CssClass="datepicker form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Địa chỉ</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Điện thoại công ty</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtCompanyTel" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Điện thoại nhà</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtHomePhone" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Di động</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="form-field-8">Avatar</label>
                    </td>
                    <td class="txt1">
                        <asp:FileUpload ID="fulImage" runat="server" ClientIDMode="Static" />
                        <p>
                            <asp:Image ID="imgImage" Width="100px" ClientIDMode="Static" ImageUrl="~/upload/no-logo.png" runat="server" />
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
                        <asp:CheckBox ID="rdoStatus" Checked="true" runat="server" Text="&nbsp; [Chọn để sử dụng]" />
                    </td>
                </tr>
                <tr>
                    <td class="name1"></td>
                    <td class="txt1 bt1">
                        <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" ValidationGroup="validateForm" />
                        <a href="/prodraftadmin/congty/nhanvien/list.aspx" class="btn btn-danger">Hủy</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-top: 10px">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="False" ValidationGroup="validateForm" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
