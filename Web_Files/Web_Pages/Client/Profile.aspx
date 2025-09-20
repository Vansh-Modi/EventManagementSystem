<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="EventManagementSystem.Web_Pages.Web_Pages.Client.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" type="image/png" href="~/Web_Files/Images/logoBG.png" />
    <title>Profile | Eventra</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div class="LogoSection">
                <asp:HyperLink ID="hlLogo" class="Logo" runat="server" ImageUrl="~/Web_Files/Images/logo.png" NavigateUrl="~/Web_Files/Web_Pages/Client/Dashboard.aspx">Eventra</asp:HyperLink>
            </div>
            <div class="NavigationMenu">
                <asp:HyperLink ID="DashboardLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/Dashboard.aspx">Home</asp:HyperLink>
                <asp:HyperLink ID="EventListLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/EventListing.aspx">Listed Events</asp:HyperLink>
                <asp:HyperLink ID="EventsLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/EventDetail.aspx">Events</asp:HyperLink>
                <asp:HyperLink ID="hlProfile" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/Profile.aspx">Profile</asp:HyperLink>
                <asp:HyperLink ID="ContactUsLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/ContactPage.aspx">Contact Us</asp:HyperLink>
            </div>
            <div class="LogOutBtn">
                <asp:Button ID="btnLogOut" runat="server" Text="Log Out" OnClick="btnLogOut_Click" />
            </div>
        </div>
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

            </div>
            <div class="Profile-Upadate">
                <p><asp:Label ID="lblValidator" runat="server" Text=""></asp:Label></p>
                <p><asp:Label ID="lblEditName" runat="server" Text="Name : " Visible="False"></asp:Label>                   
                    <asp:TextBox ID="txtEditName" runat="server" Visible="False" />
                </p>
                <p><asp:Label ID="lblEditEmail" runat="server" Text="Email : " Visible="False"></asp:Label> 
                    <asp:TextBox ID="txtEditEmail" runat="server" Visible="False" TextMode="Email" /></p>
                <p><asp:Label ID="lblEditNumber" runat="server" Text="Phone Number : " Visible="False"></asp:Label> 
                    <asp:TextBox ID="txtEditPhone" runat="server" Visible="False" TextMode="Number" /></p>

                <asp:Button ID="btnSaveProfile" runat="server" Text="Save" Visible="False" OnClick="btnSaveProfile_Click" />
                <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" Visible="False" OnClick="btnCancelEdit_Click" />
                <asp:Button ID="btnResetEdit" runat="server" Text="Reset" Visible="False" OnClick="btnResetEdit_Click" />
            </div>
        </div>
        <div class="FooterSection">
            <asp:Label ID="lblCopyright" runat="server" Text="Copyright 2025"></asp:Label>
            <asp:HyperLink ID="hlTerms" runat="server" NavigateUrl="~/Web_Files/Web_Pages/HTML_Pages/TnC.html" Target="_search">Terms</asp:HyperLink>
            <asp:HyperLink ID="hlPrivacy" runat="server" NavigateUrl="~/Web_Files/Web_Pages/HTML_Pages/Privacy.html" Target="_search">Privacy</asp:HyperLink>
            <asp:Button ID="btnFeedback" runat="server" PostBackUrl="~/Web_Files/Web_Pages/Client/ContactPage.aspx" Text="Feedback/Contact Us" OnClick="btnFeedback_Click" />
        </div>
    </form>
</body>
</html>
