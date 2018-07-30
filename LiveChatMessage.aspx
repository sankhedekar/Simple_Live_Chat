<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LiveChatMessage.aspx.cs" Inherits="LiveChatMessage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <title>Live Chat Message</title>
    <meta http-equiv="refresh" content="2">
    </head>

    <body>
        <form id="frmBody" runat="server">
            <asp:TextBox ID="txtChat" runat="server" Height="500px" ReadOnly="True" TextMode="MultiLine" Width="100%" />
        </form>
    </body>
</html>