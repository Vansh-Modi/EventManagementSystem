<%@ Page Title="Dashboard | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Admin.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
</asp:Content>
