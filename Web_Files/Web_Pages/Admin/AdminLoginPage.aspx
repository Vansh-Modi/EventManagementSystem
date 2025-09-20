<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLoginPage.aspx.cs" Inherits="EventManagementSystem.Web_Pages.Web_Pages.Admin.AdminLoginPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login | Eventra</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Admin Login</h2>
            <asp:ValidationSummary ID="vsAdminLogin" runat="server" CssClass="error-message" />

            <label for="txtName">Username:</label>
            <asp:TextBox ID="txtName" runat="server" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Enter Username" CssClass="error-message" />

            <label for="txtPassword">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password" CssClass="error-message" />

            <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn" OnClick="btnLogin_Click" />

            <div class="register-link">
                Don't have an account?
                <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Registration.aspx">Register Now</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>