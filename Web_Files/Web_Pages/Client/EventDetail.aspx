<%@ Page Title="Event Details | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/SessionMaster.Master" AutoEventWireup="true" CodeBehind="EventDetail.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Client.EventDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="../Master_Page/index.css" />
<link rel="stylesheet" type="text/css" href="../../Styles/Client/eventDetails.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
</asp:Content>
