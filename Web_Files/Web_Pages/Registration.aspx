<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="EventManagementSystem.Web_Files.Web_Pages.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register | Eventra</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <h2>Eventra Registration</h2>
            <asp:ValidationSummary ID="vsRegister" runat="server" CssClass="error-message" />

            <label for="txtName">Name:</label>
            <asp:TextBox ID="txtName" runat="server" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Enter Name" CssClass="error-message" />

            <label for="txtEmail">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Email" CssClass="error-message" />

            <label for="txtPassword">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password" CssClass="error-message" />

            <label for="txtNumber">Phone Number:</label>
            <asp:TextBox ID="txtNumber" runat="server" TextMode="Phone" />
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtNumber" ErrorMessage="Enter Phone Number" CssClass="error-message" />

            <label for="ddlRole">Role:</label>
            <asp:DropDownList ID="ddlRole" runat="server" />
            <asp:RequiredFieldValidator ID="rfvRole" runat="server" ControlToValidate="ddlRole" InitialValue="---Select Role---" ErrorMessage="Select Role" CssClass="error-message" />

            <div style="display: flex; justify-content: space-between;">
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" OnClick="btnRegister_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-reset" OnClick="btnReset_Click" CausesValidation="False" />
            </div>
        </div>
    </form>
</body>
</html>