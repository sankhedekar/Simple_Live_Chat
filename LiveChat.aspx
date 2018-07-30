<%--***************************************************************************************
Program Name    : LiveChat.aspx
Created By      : Sanket Khedekar
Created On      : 06/06/2016
Called From     : Menu
Purpose         : LiveChat
***************************************************************************************--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LiveChat.aspx.cs" Inherits="LiveChat" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head" runat="server">
        <title> Live Chat </title>
        <%--<meta http-equiv="refresh" content="2" />--%>
    </head>
    <body>
        <form id="frmLiveChat" runat="server">
            <asp:ScriptManager ID="ScriptManager" runat="server" />
            <!-- Head Text -->
            <div class="form-txt" style="text-align:center;" >
                <h2><asp:Label ID="lblLiveChat" runat="server" Text="Apna Automation Live Chat" /></h2>
                <br />
                <br />
            </div>
            <asp:Panel ID="pUsers" runat="server">
                <!-- Email ID -->
                <div class="form-txt">
                    <b><asp:Label ID="lblEmailID" runat="server" Text="Email ID*" /></b>
                    <br />
                    <asp:TextBox ID="txtEmailID" runat="server" Placeholder="Email ID" MaxLength="100" />
                    <br />
                    <asp:RequiredFieldValidator ID="rfvEmailID" runat="server" ErrorMessage="Please Enter Email ID" ValidationGroup="vgSubmit"
                            ControlToValidate="txtEmailID" ForeColor="Red" />
                    <br />
                    <asp:RegularExpressionValidator ID="revEmailID" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="vgSubmit"
                            ControlToValidate="txtEmailID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    <br />
			    </div>
                <!-- UserName -->
                <div class="form-txt">
                    <b><asp:Label ID="lblUserNameText" runat="server" Text="UserName*" /></b>
                    <br />
                    <asp:TextBox ID="txtUserName" runat="server" Placeholder="UserName" MaxLength="100" />
                    <br />
                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="Please Enter User Name" ValidationGroup="vgSubmit"
                            ControlToValidate="txtUserName" ForeColor="Red" />
                    <br />
			    </div>
                <!-- Submit Button -->
                <div class="col-12 center">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" onclick="btnSubmit_Click" ValidationGroup="vgSubmit" />
                </div>
            </asp:Panel>
            <asp:Panel ID="pChat" runat="server">
                <!-- Label Message -->
                <div class="form-txt" style="text-align:center;" >
                    <b><asp:label ID="lblUserName" runat="server" Font-Bold="true" Font-Size="Large" /></b>
                </div>
                <br />
                <!-- TextBox -->
                <div class="form-txt">
                    <b><asp:Label ID="lblChat" runat="server" Text="Enter over Here" /></b>
                    <br />
                    <asp:TextBox ID="txtChat" runat="server" TextMode="MultiLine" Width="100%" />
			    </div>
                <br />
                <!-- Send Button -->
                <div class="col-12 center">
                <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" />
                </div>
                <br />
                <!-- iFrame ChatMessage -->
                <div class="form-txt">
                    <%--<iframe src="LiveChatMessage.aspx" Width="100%" />--%>
                    <asp:UpdatePanel ID="upChatMessage" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtChatMessage" runat="server" Height="100px" ReadOnly="True"
                                    TextMode="MultiLine" Width="100%" BorderStyle="Solid" />
                            <asp:Timer ID="Timer" runat="server" OnTick="GetMessage" Interval="100" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </asp:Panel>
        </form>
    </body>
</html>