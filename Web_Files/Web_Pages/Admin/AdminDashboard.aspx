<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Admin.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" type="image/png" href="~/Web_Files/Images/logoBG.png" />
    <title>Admin Dashboard | Eventra</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div class="LogoSection">
                <asp:HyperLink ID="hlLogo" class="Logo" runat="server" ImageUrl="~/Web_Files/Images/logo.png" NavigateUrl="~/Web_Files/Web_Pages/Admin/AdminDashboard.aspx">Eventra</asp:HyperLink>
            </div>
            <div class="NavigationMenu">
                <asp:HyperLink ID="DashboardLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Admin/AdminDashboard.aspx">Home</asp:HyperLink>
                <asp:HyperLink ID="EventMgtLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Admin/EventManagement.aspx">Events</asp:HyperLink>
                <asp:HyperLink ID="UserMgtlike" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Admin/UserManagement.aspx">Users</asp:HyperLink>
                <asp:HyperLink ID="SettingsLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Admin/Settings.aspx">Settings</asp:HyperLink>
                <asp:HyperLink ID="FeedBackLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Admin/Feedback.aspx">Feedback</asp:HyperLink>
                <asp:HyperLink ID="ReportsLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Admin/Reports.aspx">Report</asp:HyperLink>
            </div>
            <div class="LogOutBtn">
                <asp:Button ID="btnLogOut" runat="server" Text="Log Out" PostBackUrl="~/Web_Files/Web_Pages/Admin/AdminLoginPage.aspx" OnClick="btnLogOut_Click" />
            </div>
        </div>
        <div class="DashboardSummary">
            <h2>System Overview</h2>
            <p>Total Events Created:
                <asp:Label ID="lblTotalEvents" runat="server" /></p>
            <p>Total Registrations:
                <asp:Label ID="lblTotalRegistrations" runat="server" /></p>
            <p>Total Feedback Received:
                <asp:Label ID="lblTotalFeedback" runat="server" /></p>
            <p>Total Active Users:
                <asp:Label ID="lblTotalUsers" runat="server" /></p>
        </div>
        <div class="FooterSection">
            <asp:Label ID="lblAdminCopyright" runat="server" Text="© 2025 Eventra Admin Panel. All rights reserved." />
            <asp:HyperLink ID="hlAdminTerms" runat="server" NavigateUrl="~/Web_Files/Web_Pages/HTML_Pages/TnC.html" Target="_search">Terms</asp:HyperLink>
            <asp:HyperLink ID="hlAdminPrivacy" runat="server" NavigateUrl="~/Web_Files/Web_Pages/HTML_Pages/Privacy.html" Target="_search">Privacy</asp:HyperLink>
            <asp:HyperLink ID="hlAdminContact" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Admin/AdminContactPage.aspx">Contact Support</asp:HyperLink>
        </div>
    </form>
</body>
</html>
