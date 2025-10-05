<%@ Page Title="Dashboard | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Admin.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Master_Page/index.css" />
    <link rel="stylesheet" type="text/css" href="../../Styles/Admin/adminDashboard.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="DashboardSummary">
        <h2>System Overview</h2>
        <p>Total Events Created:
            <asp:Label ID="lblTotalEvents" class="dashboard-labels" runat="server" /></p>
        <p>Total Registrations:
            <asp:Label ID="lblTotalRegistrations" class="dashboard-labels" runat="server" /></p>
        <p>Total Feedback Received:
            <asp:Label ID="lblTotalFeedback" class="dashboard-labels" runat="server" /></p>
        <p>Total Active Users:
            <asp:Label ID="lblTotalUsers" class="dashboard-labels" runat="server" /></p>
    </div>
</asp:Content>
