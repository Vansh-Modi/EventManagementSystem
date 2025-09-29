<%@ Page Title="Feedback | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Admin.Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="icon" type="image/png" href="/Web_Files/Images/logoBG.png" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="HeaderSection">
        <h1>User Feedback</h1>
        <p>"View and manage feedback submitted by clients"</p>
    </div>

    <div class="FilterPannel">
        <h2>Filter Feedbacks:- </h2>
        Filter by Status:<br />
        <asp:DropDownList ID="ddlFilterFeedback" runat="server">
            <asp:ListItem>---Select---</asp:ListItem>
            <asp:ListItem>All</asp:ListItem>
            <asp:ListItem>Reviewed</asp:ListItem>
            <asp:ListItem>New</asp:ListItem>
        </asp:DropDownList><br /><br />

        Filter by Date Range:<br />
        From :
        <asp:TextBox ID="txtStartDate" runat="server" TextMode="date"></asp:TextBox>
        To :
        <asp:TextBox ID="txtEndDate" runat="server" TextMode="date"></asp:TextBox><br /><br />

        Search by Keyword:<br />
        <asp:TextBox ID="txtSearchKeyword" runat="server"></asp:TextBox><br /><br />

        <asp:Button ID="btnApplyFilters" runat="server" Text="Apply Filters" OnClick="btnApplyFilters_Click" /><br />
    </div>

    <div class="FeedbackCard">
        <asp:GridView ID="gvFeedback" runat="server" AutoGenerateColumns="False" EmptyDataText="No feedback available." CssClass="FeedbackGrid">
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="Name" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="Comments" HeaderText="Message" />
                <asp:BoundField DataField="SubmittedAt" HeaderText="Submitted At" DataFormatString="{0:g}" />
            </Columns>
        </asp:GridView>
    </div>

    <div class="UpdateStatus">
        <asp:Button ID="btnUpdateStatus" runat="server" OnClick="btnUpdateStatus_Click" Text="Mark Filtered as Reviewed" />
    </div>

    <div class="FooterSection">
        <h3>
            <asp:Label ID="lblFeedbackCount" runat="server"></asp:Label>
        </h3>
    </div>
</asp:Content>