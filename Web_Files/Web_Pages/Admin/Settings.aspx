<%@ Page Title="Settings | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Admin.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Settings</h1>
    <p>Manage platform branding and your admin profile.</p>

    <asp:Panel ID="pnlBranding" runat="server" CssClass="settings-section">
        <h3>Platform Branding</h3>
        <p>Site Title:<br />
            <asp:TextBox ID="txtSiteTitle" runat="server" />
        </p>
        <p>Footer Text:<br />
            <asp:TextBox ID="txtFooterText" runat="server" />
        </p>
        <p>Update Logo:<br />
            <asp:FileUpload ID="fuLogo" runat="server" />
            <asp:Button ID="btnUploadLogo" runat="server" Text="Upload Logo" OnClick="btnUploadLogo_Click" />
            <br />
            <asp:Image ID="imgLogoPreview" runat="server" Width="150px" />
        </p>
        <asp:Button ID="btnSaveBranding" runat="server" Text="Save Branding" OnClick="btnSaveBranding_Click" />
    </asp:Panel>

    <asp:Panel ID="pnlAdminProfile" runat="server" CssClass="settings-section">
        <h3>Admin Profile</h3>
        <p>Name:<br />
            <asp:TextBox ID="txtAdminName" runat="server" />
        </p>
        <p>Email:<br />
            <asp:TextBox ID="txtAdminEmail" runat="server" />
        </p>
        <p>New Password:<br />
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" />
        </p>
        <asp:Button ID="btnUpdateProfile" runat="server" Text="Update Profile" OnClick="btnUpdateProfile_Click" />
    </asp:Panel>

    <asp:Label ID="lblSettingsStatus" runat="server" CssClass="status-label" />
</asp:Content>