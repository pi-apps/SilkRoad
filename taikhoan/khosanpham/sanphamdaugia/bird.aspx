<%@ Page Title="" Language="C#" MasterPageFile="~/taikhoan/PiglobalPriateUserMasterPage.master" AutoEventWireup="true" CodeFile="bird.aspx.cs" Inherits="Siteadmin_cauhinh_banner_new" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContentPlaceHolder" runat="Server">
    Chỉnh sửa thông tin đấu giá
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadCrumbContentPlaceHolder" runat="Server">
    <script src="/taikhoan/script/Common.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/taikhoan">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Kho sản phẩm</a></li>
            <li class="breadcrumb-item"><a href="list.aspx">Danh sách sản phẩm đấu giá</a></li>
            <li class="breadcrumb-item active">Chỉnh sửa thông tin đấu giá</li>
        </ol>
    </nav>
    <input type="hidden" id="hdfidpage" value="57" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContentPlaceHolder" runat="Server">
    <div class="noidung">
        <div class="title">Chỉnh sửa thông tin đấu giá</div>
        <div class="thanhtacvu">
            <asp:Button ID="btnSave" Visible="false" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" ValidationGroup="validateForm" />&nbsp;<a href="list.aspx" class="btn btn-sm btn-danger"><i class="fa fa-undo" aria-hidden="true"></i>&nbsp;Quay về</a>
        </div>
        <div class="div-crud">
            <script src="/taikhoan/tab/videodanhmuc/js.js"></script>
            <script src="price.js"></script>
            <link href="/taikhoan/tab/css.css" rel="stylesheet" />
            <div class="tab-content">
                <table class="table-crud">
                    <tr>
                        <td class="name1">
                            <label for="txtName">Giá khởi điểm</label>
                        </td>
                        <td class="txt1">
                            <asp:TextBox ID="txtPriceAuction" Text="0" CssClass="txtPrice price-input-format form-control" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="name1">
                            <label for="txtName">Bắt đầu</label>
                        </td>
                        <td class="txt1">
                            <asp:TextBox ID="txtTimeStart" CssClass="datepicker1 form-control" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="name1">
                            <label for="txtName">Kết thúc</label>
                        </td>
                        <td class="txt1">
                            <asp:TextBox ID="txtTimeEnd" CssClass="datepicker1 form-control" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
