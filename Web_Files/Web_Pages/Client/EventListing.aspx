<%@ Page Title="Event Listing | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/SessionMaster.Master" AutoEventWireup="true" CodeBehind="EventListing.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Client.EventListing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link rel="stylesheet" type="text/css" href="../Master_Page/index.css" />
<link rel="stylesheet" type="text/css" href="../../Styles/Client/eventListing.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="EventSearchList">
    <div>
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox></div>
    <div>
        <asp:DropDownList ID="ddlSearch" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Button ID="btnSearch" runat="server" Text="Find" OnClick="btnSearch_Click" />
    </div>
    <asp:Repeater ID="rptEvents" runat="server">
        <ItemTemplate>
            <div class="event-card">
                <h3><%# Eval("Title") %></h3>
                <p><strong>Location:</strong> <%# Eval("Location") %></p>
                <p><strong>Category:</strong> <%# Eval("CategoryName") %></p>
                <p><%# Eval("Description").ToString().Length > 100 ? Eval("Description").ToString().Substring(0, 100) + "..." : Eval("Description") %></p>
                <asp:HyperLink ID="hlDetails" runat="server"
                    NavigateUrl='<%# "~/Web_Files/Web_Pages/Client/EventDetail.aspx?EventID=" + Eval("EventID") %>'
                    CssClass="details-btn"
                    Text="View Details" />
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
        
</asp:Content>
