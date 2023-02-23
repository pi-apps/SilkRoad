<%@ Page Language="C#" AutoEventWireup="true" CodeFile="loadChat.aspx.cs" Inherits="gianhang_loadChat" %>
<asp:Repeater ID="rptNoiDungChat" runat="server">
        <ItemTemplate>
            <div class="<%#Eval("MessageCss") %>">
                <div class="title"><%#Eval("FullName") %> <span>(<%#Eval("CreatedAt","{0:dd/MM/yyyy HH:mm:ss}") %>)</span></div>
                <div class="message"><%#Eval("Message") %></div>
            </div>
            <div class="clear-both"></div>
        </ItemTemplate>
    </asp:Repeater>