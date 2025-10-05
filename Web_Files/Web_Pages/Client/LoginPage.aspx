<%@ Page Title="Sign In | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/SessionMaster.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Client.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="../Master_Page/index.css" />
<link rel="stylesheet" type="text/css" href="../../Styles/Client/loginPage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
    <h2>Sign-in</h2>
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
</asp:Content>
