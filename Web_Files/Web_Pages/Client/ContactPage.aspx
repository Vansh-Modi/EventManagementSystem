<%@ Page Title="Contact Us and Feedback | Eventra" Language="C#" MasterPageFile="~/Web_Files/Web_Pages/Master_Page/SessionMaster.Master" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Client.ContactPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <link rel="stylesheet" type="text/css" href="../Master_Page/index.css" />
    <link rel="stylesheet" type="text/css" href="../../Styles/Client/contactPage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContactSection">
    <h2>Contact Us</h2>
    <p><span>Email:</span> support@eventra.com</p>
    <p><span>Phone Number:</span> +91 987 654 3210</p>
    <p><span>Address:</span> A/123 XYZ Complex, Nr. <br />
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 EFG Building, MNO road, <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Surat, Gujarat - 395XXX</p>
</div>
<div class="FeedbackSection">
    <h2>Send Us Your Feedback</h2>
    <asp:Label ID="lblFeedbackMessage" runat="server" ForeColor="Red"></asp:Label>
    <table>
        <tr>
            <td><asp:Label ID="lblMessage" runat="server" Text="Message:"></asp:Label></td>
            <td><asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" Columns="30"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:right;">
                <asp:Button ID="btnSubmitFeedback" runat="server" Text="Submit Feedback" OnClick="btnSubmitFeedback_Click" />
            </td>
        </tr>
    </table>
</div>
</asp:Content>
