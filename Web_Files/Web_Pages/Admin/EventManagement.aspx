<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventManagement.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Admin.EventManagement" %>

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
        <asp:Button ID="btnLogOut" runat="server" Text="Log Out" PostBackUrl="~/Web_Files/Web_Pages/Admin/AdminLoginPage.aspx" />
    </div>
</div>
        <h2>Manage Events</h2>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
        <table>
            <tr>
                <td>Title:</td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" /></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" Columns="40" /></td>
            </tr>
            <tr>
                <td>Date:</td>
                <td>
                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" /></td>
            </tr>
            <tr>
                <td>Time:</td>
                <td>
                    <asp:TextBox ID="txtTime" runat="server" TextMode="Time"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Location:</td>
                <td>
                    <asp:TextBox ID="txtLocation" runat="server" /></td>
            </tr>
            <tr>
                <td>Capacity</td>
                <td>
                    <asp:TextBox ID="txtCapacity" runat="server" TextMode="Number" /></td>
            </tr>
            <tr>
                <td>Category:</td>
                <td>
                    <asp:DropDownList ID="ddlCategory" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnAddEvent" runat="server" Text="Add Event" OnClick="btnAddEvent_Click" />
                    <asp:Button ID="btnUpdateEvent" runat="server" Text="Update Event" OnClick="btnUpdateEvent_Click" Visible="False" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
                </td>
            </tr>
        </table>
        <asp:GridView ID="gvEvents" runat="server" AutoGenerateColumns="False" DataKeyNames="EventID"
            OnRowEditing="gvEvents_RowEditing" OnRowDeleting="gvEvents_RowDeleting" >
            <Columns>
                <asp:BoundField DataField="EventID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Time" HeaderText="Time" />
                <asp:BoundField DataField="Location" HeaderText="Location" />
                <asp:BoundField DataField="Capacity" HeaderText="Capacity" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category" />
               <asp:TemplateField>
    <ItemTemplate>
        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" />
        &nbsp;|&nbsp;
        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this event?');" />
    </ItemTemplate>
</asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div class="FooterSection">
    <asp:Label ID="lblAdminCopyright" runat="server" Text="© 2025 Eventra Admin Panel. All rights reserved." />
    <asp:HyperLink ID="hlAdminTerms" runat="server" NavigateUrl="~/Web_Files/Web_Pages/HTML_Pages/TnC.html" Target="_search">Terms</asp:HyperLink>
    <asp:HyperLink ID="hlAdminPrivacy" runat="server" NavigateUrl="~/Web_Files/Web_Pages/HTML_Pages/Privacy.html" Target="_search">Privacy</asp:HyperLink>
    <asp:HyperLink ID="hlAdminContact" runat="server" NavigateUrl="~/Web_Files/Web_Pages/Admin/AdminContactPage.aspx">Contact Support</asp:HyperLink>
</div>
    </form>
</body>
</html>
