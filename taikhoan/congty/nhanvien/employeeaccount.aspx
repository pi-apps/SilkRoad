<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeAccount.aspx.cs" Inherits="prodraftadmin_congty_nhanvien_EmployeeInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thông tin tài khoản</title>
    <link href="/prodraftadmin/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet" />
    <style>
        @import url('https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese');

        body {
            padding: 10px;
            font-family: Roboto;
            margin: 0;
        }

        .emp_status_1 {
            color: #fff;
            padding: 3px 5px;
            border-radius: 3px;
            font-size: 12px;
            background-image: linear-gradient(to top, #0ba360 0%, #3cba92 100%);
        }

        .emp_status_0 {
            color: #333333;
            padding: 3px 5px;
            border-radius: 3px;
            font-size: 12px;
            background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
        }

        .td-width-title {
            width: 150px;
        }

        legend {
            background-image: linear-gradient(to left, #BDBBBE 0%, #9D9EA3 100%), radial-gradient(88% 271%, rgba(255, 255, 255, 0.25) 0%, rgba(254, 254, 254, 0.25) 1%, rgba(0, 0, 0, 0.25) 100%), radial-gradient(50% 100%, rgba(255, 255, 255, 0.30) 0%, rgba(0, 0, 0, 0.30) 100%);
            background-blend-mode: normal, lighten, soft-light;
            color: #fff;
            padding: 4px 0px 4px 10px;
            margin-bottom: 0;
            border: none;
            font-size: 17px;
        }

        .message {
            color: #fff;
            padding: 3px 5px;
            border-radius: 3px;
            font-size: 12px;
            background-image: linear-gradient(to top, #0ba360 0%, #3cba92 100%);
        }

        .cap-phep label {
            font-weight: normal;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset>
                <legend>Tài khoản nhân viên</legend>
                <div>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td class="td-width-title"><b>Quyền truy cập: </b></td>
                                <td>
                                    <asp:DropDownList ID="ddlRole" CssClass="form-control" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-width-title"><b>Tên đăng nhập: </b></td>
                                <td>
                                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-width-title"><b>Mật khẩu: </b></td>
                                <td>
                                    <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-width-title"><b>Cấp phép </b></td>
                                <td>
                                    <asp:CheckBox ID="chkActive" CssClass="cap-phep" Text="Chọn để cho phép đăng nhập" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="td-width-title"></td>
                                <td>
                                    <asp:Button ID="btnSave" OnClick="btnSave_Click" CssClass="btn btn-sm btn-danger" runat="server" Text="Lưu thông tin" />
                                    <span>
                                        <asp:Label Visible="false" ID="lblMessage" CssClass="message" runat="server" Text=""></asp:Label></span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </fieldset>
            <fieldset>
                <legend>Phòng ban</legend>
                <div>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td class="td-width-title"><b>Chi nhánh: </b></td>
                                <td><%=emp.company_EmployeeDetails[0].company_CompanyInfo.Name %></td>
                            </tr>
                            <tr>
                                <td class="td-width-title"><b>Phòng ban: </b></td>
                                <td><%=emp.company_EmployeeDetails[0].company_Department.Name %></td>
                            </tr>
                            <tr>
                                <td class="td-width-title"><b>Vị trí: </b></td>
                                <td><%=emp.company_EmployeeDetails[0].company_Position.Name %></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </fieldset>
            <fieldset>
                <legend>Thông tin cá nhân</legend>
                <div>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td class="td-width-title"><b>Họ & tên: </b></td>
                                <td><%=emp.FirstName %></td>
                            </tr>
                            <tr>
                                <td class="td-width-title"><b>Địa chỉ: </b></td>
                                <td><%=emp.Address %></td>
                            </tr>
                            <tr>
                                <td class="td-width-title"><b>Email: </b></td>
                                <td><%=emp.Email %></td>
                            </tr>
                            <tr>
                                <td class="td-width-title"><b>Ngày sinh nhật: </b></td>
                                <td><%=emp.Birthday==null?"":emp.Birthday.Value.ToString("dd/MM/yyyy") %></td>
                            </tr>
                            <tr>
                                <td class="td-width-title"><b>Giới tính: </b></td>
                                <td><%=emp.Gender==null?"":(emp.Gender.Value?"Nam":"Nữ") %></td>
                            </tr>
                            <tr>
                                <td class="td-width-title"><b>Ngày vào làm: </b></td>
                                <td><%=emp.workingDate==null?"":emp.workingDate.Value.ToString("dd/MM/yyyy") %></td>
                            </tr>
                            <tr>
                                <td class="td-width-title"><b>Số điện thoại nhà: </b></td>
                                <td><%=emp.HomePhone %></td>
                            </tr>
                            <tr>
                                <td class="td-width-title"><b>Số di động: </b></td>
                                <td><%=emp.Mobile %></td>
                            </tr>
                            <tr>
                                <td class="td-width-title"><b>Số công ty: </b></td>
                                <td><%=emp.CompanyTel %></td>
                            </tr>
                            <tr>
                                <td class="td-width-title"><b>Tình trạng: </b></td>
                                <td><span class="<%=emp.Active==true?"emp_status_1":"emp_status_0" %>"><%=emp.Active==true?"Đang sử dụng":"Đã khóa" %></span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </fieldset>
        </div>
    </form>
</body>
</html>
