<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Admin.UserManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Master_Page/index.css" />
    <link rel="stylesheet" type="text/css" href="../../Styles/Admin/userManagement.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="MainContainer">
                        <h2>Manage Users</h2>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
        <table>
            <tr>
                <td>Name:</td>
                <td><asp:TextBox ID="txtName" runat="server" TextMode="SingleLine" /></td>
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
        <div class="gvUser">
        <asp:GridView ID="gvUsers" CssClass="gvUser" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID"
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
            </div>
    </div>
</asp:Content>
