<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventDetail.aspx.cs" Inherits="EventManagementSystem.Web_Pages.Web_Pages.Client.EventDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Event Details | Eventra</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div class="LogoSection">
                <asp:Image ID="logo" runat="server" Height="50px" ImageUrl="~/Web_Files/Images/logo.png" />Eventra
            </div>
            <div class="NavigationMenu">
                <asp:HyperLink ID="DashboardLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/Dashboard.aspx">Home</asp:HyperLink>
                <asp:HyperLink ID="EventsLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/EventDetail.aspx">Events</asp:HyperLink>
                <asp:HyperLink ID="hlProfile" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/Profile.aspx">Profile</asp:HyperLink>
                <asp:HyperLink ID="ContactUsLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/ContactPage.aspx">Contact Us</asp:HyperLink>
            </div>
            <div class="LogOutBtn">
                <asp:Button ID="btnLogOut" runat="server" Text="Log Out" PostBackUrl="~/Web_Files/Web_Pages/Client/HomePage.aspx" />
            </div>
        </div>
        <div class="event-details-container">

            <div class="event-banner">
                <asp:Image ID="imgEventBanner" runat="server" ImageUrl="~/Web_Files/Images/banner.png" CssClass="banner-img" Height="100px" />
                <h1>
                    <asp:Label ID="lblTitle" runat="server" /></h1>
                <span class="category-badge">
                    <asp:Label ID="lblCategory" runat="server" /></span>
            </div>
            <div class="event-info">
                <p><strong>Date:</strong>
                    <asp:Label ID="lblDate" runat="server" /></p>
                <p><strong>Time:</strong>
                    <asp:Label ID="lblTime" runat="server" /></p>
                <p><strong>Location:</strong>
                    <asp:Label ID="lblLocation" runat="server" /></p>
                <p><strong>Capacity:</strong>
                    <asp:Label ID="lblCapacity" runat="server" /></p>
            </div>
            <div class="event-description">
                <h3>About the Event</h3>
                <asp:Label ID="lblDescription" runat="server" />
            </div>

            <div class="event-register">
                <asp:Button ID="btnRegister" runat="server" Text="Register Now" CssClass="register-btn" OnClick="btnRegister_Click" />
                <asp:Label ID="lblStatus" runat="server" CssClass="status-label" />
            </div>

        </div>

        <div class="FooterSection">
            <asp:Label ID="lblCopyright" runat="server" Text="Copyright 2025"></asp:Label>
            <asp:HyperLink ID="hlTerms" runat="server" NavigateUrl="~/Web_Files/Web_Pages/HTML_Pages/TnC.html" Target="_search">Terms</asp:HyperLink>
            <asp:HyperLink ID="hlPrivacy" runat="server" NavigateUrl="~/Web_Files/Web_Pages/HTML_Pages/Privacy.html" Target="_search">Privacy</asp:HyperLink>
            <asp:Button ID="btnFeedback" runat="server" PostBackUrl="~/Web_Files/Web_Pages/Client/ContactPage.aspx" Text="Feedback/Contact Us" />
        </div>
    </form>
</body>
</html>
