<%@ Page Title="Categories | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageCategories.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Admin.ManageCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlCategoryManagement" runat="server" CssClass="settings-section">
    <h3>Manage Event Categories</h3>

    <p>Add New Category:<br />
        <asp:TextBox ID="txtNewCategory" runat="server" />
        <asp:Button ID="btnAddCategory" runat="server" Text="Add" OnClick="btnAddCategory_Click" />
    </p>

    <asp:GridView ID="gvCategories" runat="server" AutoGenerateColumns="False" DataKeyNames="CategoryID" OnRowEditing="gvCategories_RowEditing" OnRowUpdating="gvCategories_RowUpdating" OnRowCancelingEdit="gvCategories_RowCancelingEdit" OnRowDeleting="gvCategories_RowDeleting">
        <Columns>
            <asp:BoundField DataField="CategoryID" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Panel>
</asp:Content>
