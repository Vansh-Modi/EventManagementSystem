<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EventManagementSystem.Web_Pages.Web_Pages.Client.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" type="image/png" href="~/Web_Files/Images/logoBG.png" />
    <title>Dashboard | Eventra</title>
</head>
<body>
    <form id="dashboardForm" runat="server">
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
        <div class="welcomeSection">
            <h2>Welcome, 
                <asp:Label ID="lblUserName" runat="server"></asp:Label>
            </h2>
        </div>
        <div class="RegistrationSection">
            <h3>Registered Events</h3>

            <p>
                <asp:Repeater ID="rptMyEvents" runat="server">
                    <ItemTemplate>
                        <div class="eventCard">
                            <h4><%# Eval("Title") %></h4>
                            <p>
                                <strong>Date:</strong> <%# Eval("Date", "{0:dd MMM yyyy}") %>
                            </p>
                            <p>
                                <strong>Location:</strong> <%# Eval("Location") %>
                            </p>
                            <asp:Button ID="btnCancel" runat="server" CommandArgument='<%# Eval("EventID") %>' OnCommand="btnCancel_Command" OnClientClick="return confirm('Are you sure you want to cancel this registration?');" Text="Cancel Registration" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </p>
        </div>
        <div class="dashboard-notifications">
            <h3>Your Dashboard Summary</h3>
            <p><strong>Total Events Registered:</strong>
                <asp:Label ID="lblTotalRegistered" runat="server" /></p>
            <p><strong>Upcoming Events:</strong>
                <asp:Label ID="lblUpcomingCount" runat="server" /></p>
            <p><strong>Status:</strong>
                <asp:Label ID="lblStatusMessage" runat="server"></asp:Label>
            </p>
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
