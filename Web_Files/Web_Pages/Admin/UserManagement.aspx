<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="EventManagementSystem.Web_Pages.Web_Pages.Admin.UserManagement" %>

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
                <h2>Manage Users</h2>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
        <table>
            <tr>
                <td>Name:</td>
                <td><asp:TextBox ID="txtName" runat="server" TextMode="SingleLine" /></td></td>
                </tr>
            <tr>
                <td>Email: </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" /></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Rows="3" Columns="40" /></td>
            </tr>
            <tr>
                <td>Phone Number:</td>
                <td>
                    <asp:TextBox ID="txtNumber" runat="server" TextMode="Phone" /></td>
            </tr>
            <tr>
                <td>Role:</td>
                <td>
                    <asp:DropDownList ID="ddlRole" runat="server" AutoPostBack="True" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnAddEvent" runat="server" Text="Add Event" OnClick="btnAddEvent_Click" />
                    <asp:Button ID="btnUpdateEvent" runat="server" Text="Update Event" OnClick="btnUpdateEvent_Click" Visible="False" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
                </td>
            </tr>
        </table>
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID"
            OnRowEditing="gvUsers_RowEditing" OnRowDeleting="gvUsers_RowDeleting" >
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Password" HeaderText="Password" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                <asp:BoundField DataField="Role" HeaderText="Role" />
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
