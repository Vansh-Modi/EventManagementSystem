<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="EventManagementSystem.Web_Pages.Web_Pages.Client.LoginPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log in | Eventra</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Eventra Login</h2>
            <asp:ValidationSummary ID="vsLogin" runat="server" CssClass="error-message" />

            <label for="txtUserName">Username:</label>
            <asp:TextBox ID="txtUserName" runat="server" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtUserName" ErrorMessage="Enter Username" CssClass="error-message" />

            <label for="txtPassword">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password" CssClass="error-message" />

            <asp:Button ID="btnSignIn" runat="server" Text="Sign In" CssClass="btn" OnClick="btnSignIn_Click" />

            <div class="register-link">
                Don't have an account?
                <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Registration.aspx">Register</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>