<%@ Page Title="Profile | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/SessionMaster.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Client.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Master_Page/index.css" />
<link rel="stylesheet" type="text/css" href="../../Styles/Client/profile.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ProfileSection">
    <div class="Profile-Introduction">
        <h1>Your Profile</h1>
        <p>Manage your personal information and account settings.</p>
        <h2>Welcome, 
        <asp:Label ID="lblUserName" runat="server"></asp:Label></h2>
    </div>
    <div class="Profile-Info">
        <p>
            <asp:Label ID="lblNameTxt" runat="server" Text="Name : " ></asp:Label>
            <asp:Label ID="lblDisplayName" runat="server"></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblEmailTxt" runat="server" Text="Email : " ></asp:Label>
            <asp:Label ID="lblDisplayEmail" runat="server"></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblNumberTxt" runat="server" Text="Phone Number : " ></asp:Label> 
            <asp:Label ID="lblDisplayNumber" runat="server"></asp:Label>
        </p>
        <asp:Button ID="btnEditProfile" runat="server" Text="Update Information" OnClick="btnEditProfile_Click" />

        <asp:Button ID="btnChangePassword" runat="server" OnClick="btnChangePassword_Click" Text="Change Password" />

    </div>
    <div class="Profile-Upadate">
        <p><asp:Label ID="lblValidator" runat="server" Text=""></asp:Label></p>
        <p><asp:Label ID="lblEditName" runat="server" Text="Name : " Visible="False"></asp:Label>                   
            <asp:TextBox ID="txtEditName" runat="server" Visible="False" />
            <asp:Label ID="lblOldPassword" runat="server" Text="Old Password : " Visible="False"></asp:Label>                   
            <asp:TextBox ID="txtOldPassword" runat="server" Visible="False" />
        </p>
        <p><asp:Label ID="lblEditEmail" runat="server" Text="Email : " Visible="False"></asp:Label> 
            <asp:TextBox ID="txtEditEmail" runat="server" Visible="False" TextMode="Email" />
            <asp:Label ID="lblNewPassword" runat="server" Text="New Password : " Visible="False"></asp:Label>                   
            <asp:TextBox ID="txtNewPassword" runat="server" Visible="False" TextMode="Password" />
        </p>
        <p><asp:Label ID="lblEditNumber" runat="server" Text="Phone Number : " Visible="False"></asp:Label> 
            <asp:TextBox ID="txtEditPhone" runat="server" Visible="False" TextMode="Number" />
            <asp:Label ID="lblConfirmPass" runat="server" Text="Confirm Password : " Visible="False"></asp:Label>                   
            <asp:TextBox ID="txtConfirmPass" runat="server" Visible="False" TextMode="Password" />
        </p>

        <asp:Button ID="btnSaveProfile" runat="server" Text="Save" Visible="False" OnClick="btnSaveProfile_Click" />
        <asp:Button ID="btnSavePassword" runat="server" OnClick="btnSavePassword_Click" Text="Save Password" Visible="False" />
        <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" Visible="False" OnClick="btnCancelEdit_Click" />
        <asp:Button ID="btnResetEdit" runat="server" Text="Reset" Visible="False" OnClick="btnResetEdit_Click" />
    </div>
</div>
</asp:Content>
