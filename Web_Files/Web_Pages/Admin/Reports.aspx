<%@ Page Title="Reports | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Admin.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Master_Page/index.css" />
    <link rel="stylesheet" type="text/css" href="../../Styles/Admin/reports.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="ReportGenerator">
        <h1>Reports</h1>
        <p>"Analyze user activity, feedback contribution and event participation"</p>
    </div>

    <div class="ReportFilter">
        <asp:RadioButtonList ID="rblReportFilter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblReportFilter_SelectedIndexChanged">
            <asp:ListItem>Event</asp:ListItem>
            <asp:ListItem>User</asp:ListItem>
            <asp:ListItem>Registered Events</asp:ListItem>
            <asp:ListItem>Feedback</asp:ListItem>
        </asp:RadioButtonList>

        <div class="DynamicFilter">
            <asp:Panel class="EventFilter" ID="EventFilter" runat="server" Visible="False">
                <h3>Event: </h3>
                <p>
                    Select Category:<br />
                    <asp:DropDownList ID="ddlEventCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlEventCategory_SelectedIndexChanged">
                    </asp:DropDownList><br />
                </p>
                <p>
                    Select Location:<br />
                    <asp:DropDownList ID="ddlEventLocation" runat="server" OnSelectedIndexChanged="ddlEventLocation_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                </p>
                <p>
                    Select Date Range:<br />
                    FROM :
                    <asp:TextBox ID="txtStartDateEvent" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    TO :
                    <asp:TextBox ID="txtEndDateEvent" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox><br />
                </p>
                <asp:Button ID="btnGenerateEventReport" runat="server" Text="Generate Report" OnClick="btnGenerateEventReport_Click" />
            </asp:Panel>
            <asp:Panel class="UserFilter" ID="UserFilter" runat="server" Visible="False">
                <h3>Users : </h3>
                <p>
                    Select Role :
                    <br />
                    <asp:DropDownList ID="ddlUserRole" runat="server" AutoPostBack="True">
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>Client</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                    </asp:DropDownList>
                </p>
                <asp:Button ID="btnGenerateUserReport" runat="server" Text="Generate Report" OnClick="btnGenerateUserReport_Click" />


            </asp:Panel>
            <asp:Panel ID="RegistrationFilter" CssClass="RegistrationFilter" runat="server" Visible="False">
                <h3>Registered Events</h3>
                <p>
                    Select Event Category:<br />
                    <asp:DropDownList ID="ddlRegEventCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRegEventCategory_SelectedIndexChanged"></asp:DropDownList>
                </p>
                <p>
                    Select Date Range:<br />
                    FROM :
       
                    <asp:TextBox ID="txtRegStartDate" runat="server" TextMode="Date"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    TO :
       
                    <asp:TextBox ID="txtRegEndDate" runat="server" TextMode="Date"></asp:TextBox>
                </p>
                <asp:Button ID="btnGenerateRegisteredEventsReport" runat="server" Text="Generate Report" OnClick="btnGenerateRegisteredEventsReport_Click" />
            </asp:Panel>
            <asp:Panel ID="FeedbackFilter" class="FeedbackFilter" runat="server" Visible="False">
                <h3>Feedback : </h3>
                <p>
                    Select Status :
                <br />
                    <asp:DropDownList ID="ddlReportStatus" runat="server" AutoPostBack="True">
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>New</asp:ListItem>
                        <asp:ListItem>Reviewed</asp:ListItem>
                    </asp:DropDownList>
                </p>
                <p>
                    Select Date Range:<br />
                    FROM :
                    <asp:TextBox ID="txtStartDateFeedback" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                     TO :
                    <asp:TextBox ID="txtEndDateFeedback" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox><br />
                </p>
                <asp:Button ID="btnGenerateFeedbackReport" runat="server" Text="Generate Report" OnClick="btnGenerateFeedbackReport_Click" />
            </asp:Panel>
        </div>
    </div>
    <div class="ReportView">
        <asp:GridView ID="gvGeneratedReport" runat="server" EmptyDataText="No data was found for the selected text">
        </asp:GridView>
        <div class="ExportReport">
            <asp:Button ID="btnExportExcel" runat="server" Text="Export to Excel" OnClick="btnExportExcel_Click" Enabled="False" />
            <asp:Button ID="btnExportPDF" runat="server" Text="Export to PDF" OnClick="btnExportPDF_Click" Enabled="False" />
        </div>
    </div>
    <div class="ReportSummary">
        <h2>Summary"</h2>
        <asp:Label ID="lblSummary" runat="server" Text="Select a to Generate and see the summary."></asp:Label>
    </div>
</asp:Content>
