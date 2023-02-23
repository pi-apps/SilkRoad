<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sendmailhtml.aspx.cs" Inherits="sendmailhtml" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:Button ID="btnSend" OnClick="btnSend_Click" runat="server" Text="Gửi email" />
            <asp:Button ID="btnSendText" OnClick="btnSendText_Click" runat="server" Text="Gửi email not html" />
        </div>
    </form>
</body>
</html>
