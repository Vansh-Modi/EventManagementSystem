<%@ Page Title="Login | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminLoginPage.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Admin.AdminLoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Master_Page/index.css" />
<link rel="stylesheet" type="text/css" href="../../Styles/Admin/adminLoginPage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <h2 class="login-header">Admin Login</h2>
        <asp:ValidationSummary ID="vsAdminLogin" runat="server" CssClass="error-message" />

        <label class="inputText" for="txtName">Username:</label>
        <asp:TextBox ID="txtName" runat="server" />
        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Enter Username" CssClass="error-message" />

        <label class="inputText" for="txtPassword">Password:</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password" CssClass="error-message" />

        <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn" OnClick="btnLogin_Click" />

        <div class="register-link">
            Don't have an account?
            <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Registration.aspx">Register Now</asp:HyperLink>
        </div>
    </div>
</asp:Content>
