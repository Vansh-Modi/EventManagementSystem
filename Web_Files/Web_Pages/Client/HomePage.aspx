<%@ Page Title="Home Page | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/SessionMaster.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Client.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Master_Page/index.css" />
<link rel="stylesheet" type="text/css" href="../../Styles/Client/homePage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="Hero">
            <div class="EventBanner">
                <asp:Image ID="imgBanner" runat="server" Height="500px" ImageUrl="~/Web_Files/Images/banner.png" Width="962px" />
            </div>
            <div class="EventLable">
                <asp:Label ID="lblHero" runat="server" Text="&quot;Discover. Register. Attend&quot;"></asp:Label>
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
            <asp:GridView ID="gdbSearch" CssClass="event-grid" runat="server">
            </asp:GridView>
        </div>
        <div class="AboutSection">
            <asp:Label ID="lblAbout" runat="server" Text="“Eventra is a centralized portal for managing college events. Users can register, track, and participate in events with ease.”"></asp:Label>
        </div>
</asp:Content>
