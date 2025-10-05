<%@ Page Title="Dashboard | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/SessionMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Client.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Master_Page/index.css" />
    <link rel="stylesheet" type="text/css" href="../../Styles/Client/dashboard.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
</asp:Content>
