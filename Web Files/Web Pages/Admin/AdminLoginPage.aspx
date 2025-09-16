<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLoginPage.aspx.cs" Inherits="EventManagementSystem.Web_Pages.Web_Pages.Admin.AdminLoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 33px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2">Eventra</td>
                </tr>
                <tr>
                    <td colspan="2">Admin Login</td>
                </tr>
                <tr>
                    <td>Name;</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2">
                        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Sign In" />
                        <br />
                        Don&#39;t have an account? <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/Web Files/Web Pages/Registration.aspx">Register Now</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
