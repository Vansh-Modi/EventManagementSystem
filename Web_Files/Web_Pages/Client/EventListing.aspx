<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventListing.aspx.cs" Inherits="EventManagementSystem.Web_Pages.Web_Pages.Client.EventListing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Events | Eventra</title>
</head>
<body>
    <form id="EventListingForm" runat="server">
        <div class="header">
            <div class="LogoSection">
                <asp:Image ID="logo" runat="server" Height="50px" ImageUrl="~/Web_Files/Images/logo.png" />Eventra
            </div>
            <div class="NavigationMenu">
                <asp:HyperLink ID="DashboardLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/Dashboard.aspx">Home</asp:HyperLink>
                <asp:HyperLink ID="EventsLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/EventDetail.aspx">Events</asp:HyperLink>
                <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/LoginPage.aspx">Sign In</asp:HyperLink>
                <asp:HyperLink ID="RegistrationLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Registration.aspx">Register</asp:HyperLink>
                <asp:HyperLink ID="ContactUsLink" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Client/ContactPage.aspx">Contact Us</asp:HyperLink>
            </div>
        </div>
        <div class="EventSearchList">
            <div>
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox></div>
            <div>
                <asp:DropDownList ID="ddlSearch" runat="server" AutoPostBack="True">
                </asp:DropDownList>
                <asp:Button ID="btnSearch" runat="server" Text="Find" OnClick="btnSearch_Click" />
            </div>
            <asp:Repeater ID="rptEvents" runat="server">
                <ItemTemplate>
                    <div class="event-card">
                        <h3><%# Eval("Title") %></h3>
                        <p><strong>Location:</strong> <%# Eval("Location") %></p>
                        <p><strong>Category:</strong> <%# Eval("CategoryName") %></p>
                        <p><%# Eval("Description").ToString().Length > 100 ? Eval("Description").ToString().Substring(0, 100) + "..." : Eval("Description") %></p>
                        <a href='<%# "~/Web_Files/Web_Pages/Client/EventDetail.aspx?EventID=" + Eval("EventID") %>' class="details-btn">View Details</a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
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
