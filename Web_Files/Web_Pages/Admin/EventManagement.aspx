<%@ Page Title="Event | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="EventManagement.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Admin.EventManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <%-- <form id="form1" runat="server">--%>
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
                    <asp:DropDownList ID="ddlCategory" runat="server" />
                    <asp:HyperLink ID="hlManageCategories" runat="server">Manage Categories</asp:HyperLink>
                </td>
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
        
   <%-- </form>--%>
</asp:Content>
