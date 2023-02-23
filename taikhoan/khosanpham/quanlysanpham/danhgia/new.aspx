<%@ Page Title="" Language="C#" MasterPageFile="~/prodraftadmin/DongAAdminMasterPage.master" AutoEventWireup="true" CodeFile="new.aspx.cs" Inherits="Siteadmin_cauhinh_banner_new" %>

<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Thông tin đánh giá
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/prodraftadmin/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/prodraftadmin">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Kho sản phẩm</a></li>
            <li class="breadcrumb-item"><a href="/prodraftadmin/khosanpham/quanlysanpham/list.aspx">Danh sách sản phẩm</a></li>
            <li class="breadcrumb-item"><a href="/prodraftadmin/khosanpham/quanlysanpham/danhgia/list.aspx?parent=<%=pro_Product.Id %>">Đánh giá sản phẩm '<%=pro_Product.Code %>'</a></li>
            <li class="breadcrumb-item active">Thông tin đánh giá</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="57" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <div class="noidung">
        <div class="title">Thông tin đánh giá</div>
        <div class="thanhtacvu">
            <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" ValidationGroup="validateForm" />&nbsp;<a href="/prodraftadmin/khosanpham/quanlysanpham/danhgia/list.aspx?parent=<%=pro_Product.Id %>" class="btn btn-sm btn-danger"><i class="fa fa-undo" aria-hidden="true"></i>&nbsp;Quay về</a>
        </div>
        <div class="div-crud">
            <table class="table-crud">
                <tr>
                    <td class="name1">
                        <label for="txtName">Điểm số</label>
                    </td>
                    <td class="txt1">
                        <asp:DropDownList ID="ddlScore" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Họ & tên</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
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
                        <label for="txtName">Điện thoại</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="form-field-8">Nội dung</label>
                    </td>
                    <td class="txt1">
                        <textarea class="form-control" textmode="MultiLine" rows="3" runat="server" id="txtSummary"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="form-field-8">Trả lời</label>
                    </td>
                    <td class="txt1">
                        <textarea class="form-control description" runat="server" id="txtDescription"></textarea>
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
</asp:Content>
