<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="EventManagementSystem.Web_Pages.Web_Pages.Client.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home | Eventra</title>
</head>
<body>
    <form id="HomePageForm" runat="server">
        <div class="header">
            <div class="LogoSection">
                <asp:Image ID="logo" runat="server" Height="50px" ImageUrl="~/Web_Files/Images/logo.png" />Eventra
            </div>
            <div class="NavigationMenu">
                <asp:HyperLink ID="DashboardLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/Dashboard.aspx">Home</asp:HyperLink>
                <asp:HyperLink ID="EventListingLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/EventListing.aspx">Listed Events</asp:HyperLink>
                <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/LoginPage.aspx">Sign In</asp:HyperLink>
                <asp:HyperLink ID="RegistrationLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Registration.aspx">Register</asp:HyperLink>
                <asp:HyperLink ID="ContactUsLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/ContactPage.aspx">Contact Us</asp:HyperLink>
            </div>
        </div>
        <div class="Hero">
            <div class="EventBanner">
                <asp:Image ID="imgBanner" runat="server" Height="500px" ImageUrl="~/Web_Files/Images/banner.png" Width="962px" />
            </div>
            <div class="EventLable">
                <asp:Label ID="lblHero" runat="server" Text="&quot;Discover. Regsiter. Attend&quot;"></asp:Label>
            </div>
            <div class="EventSearch">
                <asp:Button ID="btnBrowseEvent" runat="server" Text="Browse Event" PostBackUrl="~/Web_Files/Web_Pages/Client/EventListing.aspx" />
            </div>
        </div>
        <div class="EventSection">
            <asp:GridView ID="gdvFeatureEvent" runat="server" AutoGenerateColumns="False" CssClass="event-grid">
    <Columns>
        <asp:BoundField DataField="Title" HeaderText="Event Title" />
        <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd MMM yyyy}" />
        <asp:BoundField DataField="Location" HeaderText="Location" />
        <asp:HyperLinkField DataNavigateUrlFields="EventID" 
                            DataNavigateUrlFormatString="~/Web_Files/Web_Pages/Client/EventDetails.aspx?EventID={0}" 
                            Text="View Details" HeaderText="Details" />
    </Columns>
</asp:GridView>
        </div>
        <div class="SearchSection">
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:DropDownList ID="ddlSearch" runat="server" AutoPostBack="True">
            </asp:DropDownList>
            <asp:Button ID="btnSearch" runat="server" Text="Find" OnClick="btnSearch_Click" />
            <asp:GridView ID="gdbSearch" runat="server">
            </asp:GridView>
        </div>
        <div class="AboutSection">
            <asp:Label ID="lblAbout" runat="server" Text="“eventra is a centralized portal for managing college events. Users can register, track, and participate in events with ease.”"></asp:Label>
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
