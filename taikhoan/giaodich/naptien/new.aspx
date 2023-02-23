<%@ Page Title="" Language="C#" MasterPageFile="~/taikhoan/PiglobalPriateUserMasterPage.master" AutoEventWireup="true" CodeFile="new.aspx.cs" Inherits="Siteadmin_cauhinh_banner_new" %>

<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Thêm mới giao dịch
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/prodraftadmin/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/taikhoan">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Giao dịch</a></li>
            <li class="breadcrumb-item"><a href="list.aspx">Danh sách lịch sử nạp tiền</a></li>
            <li class="breadcrumb-item active">Thêm mới giao dịch</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="84" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <div class="noidung">
        <div class="title">Thêm mới giao dịch</div>
        <div class="thanhtacvu"><asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" ValidationGroup="validateForm" />&nbsp<a href="list.aspx" class="btn btn-sm btn-danger"><i class="fa fa-undo" aria-hidden="true"></i>&nbsp;Quay về</a></div>
        <div class="div-crud">
            <table class="table-crud">
                <tr>
                    <td class="name1">
                        <label for="txtName">Ví Pi (hệ thống)</label>
                    </td>
                    <td class="txt1">
                        <b>Ví 1: </b><%=sys_Config.PiWallet1 %>
                        <br />
                        <b>Ví 2: </b><%=sys_Config.PiWallet2 %>
                        <br />
                        <b>Ví 3: </b><%=sys_Config.PiWallet3 %>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Số tiền nạp</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtAmount" CssClass="price-input-format form-control" runat="server"></asp:TextBox>
                        <asp:HiddenField ID="txtId" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Nội dung</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtNote" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="form-field-8">File chứng từ</label>
                    </td>
                    <td class="txt1">
                        <asp:FileUpload ID="fulAttachedFile" runat="server" ClientIDMode="Static" />
                    </td>
                </tr>
                <tr>
                    <td class="name1">Xác nhận thanh toán</td>
                    <td class="txt1">
                        <asp:CheckBox ID="rdoIsUserConfirm" runat="server" Text="&nbsp; [Chọn để xác nhận bạn đã chuyển khoản]" />
                    </td>
                </tr>
                <tr>
                    <td class="name1">
                        <label for="txtName">Ngày thanh toán</label>
                    </td>
                    <td class="txt1">
                        <asp:TextBox ID="txtUserConfirmDate" CssClass="datepicker form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="name1"></td>
                    <td class="txt1"><asp:Button ID="Button1" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" ValidationGroup="validateForm" />&nbsp<a href="list.aspx" class="btn btn-sm btn-danger"><i class="fa fa-undo" aria-hidden="true"></i>&nbsp;Quay về</a></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
