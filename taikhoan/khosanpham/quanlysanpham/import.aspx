<%@ Page Language="C#" AutoEventWireup="true" CodeFile="import.aspx.cs" Inherits="prodraftadmin_khosanpham_quanlysanpham_import" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                <legend>Chọn file và nhấn tải lên</legend>
                <div>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td class="td-width-title"><b>Chọn file: </b></td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="td-width-title"></td>
                                <td>
                                    <asp:Button ID="btnSave" OnClick="btnSave_Click" CssClass="btn btn-sm btn-danger" runat="server" Text="Tải lên" />
                                    <span>
                                        <asp:Label Visible="false" ID="lblMessage" CssClass="message" runat="server" Text=""></asp:Label></span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </fieldset>
        </div>
    </form>
</body>
</html>
