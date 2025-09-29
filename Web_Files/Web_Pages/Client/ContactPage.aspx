<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="EventManagementSystem.Web_Pages.Web_Pages.Client.ContactPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" type="image/png" href="~/Web_Files/Images/logoBG.png" />
    <title>Contact Us | Eventra</title>
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
        <div class="ContactSection">
            <h2>Contact Us</h2>
            <p>Email: support@eventra.com</p>
            <p>Phone Number: +91 987 654 3210</p>
            <p>Address: A/123 XYZ Complex, Nr. <br />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         EFG Building, MNO road, <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Surat, Gujarat - 395XXX</p>
        </div>
        <div class="FeedbackSection">
            <h2>Send Us Your Feedback</h2>
            <asp:Label ID="lblFeedbackMessage" runat="server" ForeColor="Red"></asp:Label>
            <table>
                <tr>
                    <td><asp:Label ID="lblMessage" runat="server" Text="Message:"></asp:Label></td>
                    <td><asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" Columns="30"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:right;">
                        <asp:Button ID="btnSubmitFeedback" runat="server" Text="Submit Feedback" OnClick="btnSubmitFeedback_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="FooterSection">
            <asp:Label ID="lblCopyright" runat="server" Text="Copyright 2025"></asp:Label>
            <asp:HyperLink ID="hlTerms" runat="server" NavigateUrl="~/Web_Files/Web_Pages/HTML_Pages/TnC.html" Target="_search">Terms</asp:HyperLink>
            <asp:HyperLink ID="hlPrivacy" runat="server" NavigateUrl="~/Web_Files/Web_Pages/HTML_Pages/Privacy.html" Target="_search">Privacy</asp:HyperLink>
        </div>
    </form>
</body>
</html>
