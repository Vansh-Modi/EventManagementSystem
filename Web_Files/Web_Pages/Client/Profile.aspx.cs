using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagementSystem.Web_Pages.Web_Pages.Client
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection conn;
        string strCon;

        protected void fnConnection()
        {
            strCon = ConfigurationManager.ConnectionStrings["EventString"].ConnectionString;
            conn = new SqlConnection(strCon);
            conn.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnection();
            if (Session["UserID"] == null)
            {
                Response.Redirect("./LoginPage.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    fnPrintLblDetails();
                }
            }
        }

        protected void btnFeedback_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContactPage.aspx");

        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Response.Redirect("./HomePage.aspx");
        }

        protected void fnPrintLblDetails()
        {
            string userId = Session["UserID"].ToString();
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();
            string query = "SELECT * FROM tblUsers WHERE UserID = @userId";
            SqlCommand cmd = new SqlCommand(query,conn);
            cmd.Parameters.AddWithValue("@userId", userId);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                lblDisplayName.Text = reader["Name"].ToString();
                lblDisplayEmail.Text = reader["Email"].ToString();
                lblDisplayNumber.Text = reader["PhoneNumber"].ToString();
                lblUserName.Text = reader["Name"].ToString();
            }
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            lblDisplayName.Visible = false;
            lblDisplayEmail.Visible = false;
            lblDisplayNumber.Visible = false;
            lblEmailTxt.Visible = false;
            lblNameTxt.Visible = false;
            lblNumberTxt.Visible = false;

            txtEditName.Visible = true;
            txtEditEmail.Visible = true;
            txtEditPhone.Visible = true;

            btnEditProfile.Visible = false;
            btnSaveProfile.Visible = true;
            btnCancelEdit.Visible = true;
            btnResetEdit.Visible = true;

            txtEditName.Text = lblDisplayName.Text;
            txtEditEmail.Text = lblDisplayEmail.Text;
            txtEditPhone.Text = lblDisplayNumber.Text;
        }
        
        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            string UID = Session["UserID"].ToString();
            string Name = txtEditName.Text.Trim();
            string Email = txtEditEmail.Text.Trim();
            string Phone = txtEditPhone.Text.Trim();

            if (Name == lblDisplayName.Text && Email == lblDisplayEmail.Text && Phone == lblDisplayNumber.Text)
            {
                lblValidator.Text = "Make Changes to Update Profile.";
                return;
            }
            else if (Name == "" || Email == "" || Phone == "")
            {
                lblValidator.Text = "All Fields are Required.";
            }
            else
            {
                lblValidator.Text = "Profile Updated !";
                string query = "UPDATE tblUsers SET Name = @name, Email = @email, " +
                    "PhoneNumber = @phone WHERE UserID = @uid";

                SqlConnection conn = new SqlConnection(strCon);
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@name", Name);
                cmd.Parameters.AddWithValue("@email", Email);
                cmd.Parameters.AddWithValue("@phone", Phone);
                cmd.Parameters.AddWithValue("@uid", UID);
                int rows = cmd.ExecuteNonQuery();
                if (rows > 0)
                {
                    lblDisplayName.Text = Name;
                    lblDisplayEmail.Text = Email;
                    lblDisplayNumber.Text = Phone;
                }

                btnCancelEdit_Click(sender, e);
            }
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            lblDisplayName.Visible = true;
            lblDisplayEmail.Visible = true;
            lblDisplayNumber.Visible = true;
            lblEmailTxt.Visible = true;
            lblNameTxt.Visible = true;
            lblNumberTxt.Visible = true;

            txtEditName.Visible = false;
            txtEditEmail.Visible = false;
            txtEditPhone.Visible = false;

            btnChangePassword.Visible = true;
            btnEditProfile.Visible = true;

            btnSavePassword.Visible = false;
            btnSaveProfile.Visible = false;
            btnCancelEdit.Visible = false;
            btnResetEdit.Visible = false;

            txtOldPassword.Visible = false;
            txtNewPassword.Visible = false;
            txtConfirmPass.Visible = false;

            lblOldPassword.Visible = false;
            lblNewPassword.Visible = false;
            lblConfirmPass.Visible = false;

            lblValidator.Text = "";
        }

        protected void btnResetEdit_Click(object sender, EventArgs e)
        {
            txtEditName.Text = "";
            txtEditEmail.Text = "";
            txtEditPhone.Text = "";
            txtNewPassword.Text = "";
            txtConfirmPass.Text = "";
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();
            string query = "SELECT * FROM tblUsers WHERE UserID = @userId";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@userId", Session["UserID"].ToString());
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read()){
                txtOldPassword.Text = reader["Password"].ToString();
            }

            txtOldPassword.Visible = true;
            txtNewPassword.Visible = true;
            txtConfirmPass.Visible = true;
            lblOldPassword.Visible = true;
            lblNewPassword.Visible = true;
            lblConfirmPass.Visible = true;

            btnChangePassword.Visible = false;
            btnSavePassword.Visible = true;
            btnCancelEdit.Visible = true;
            btnResetEdit.Visible = true;
        }

        protected void btnSavePassword_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection( strCon);
            conn.Open();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPass.Text.Trim();

            if (newPassword == "")
            {
                lblValidator.Text = "Password Cannot Be Empty";
            }
            else if (newPassword != confirmPassword)
            {
                lblValidator.Text = "Password Missmatch !";
                return;
            }
            else if (txtOldPassword.Text == newPassword)
            {
                lblValidator.Text = "Cannot enter same Password !";
                return;
            }
            else
            {
                string query = "UPDATE tblUsers SET Password = @newPass WHERE UserID = @userId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@newPass", newPassword);
                cmd.Parameters.AddWithValue("@userId", Session["UserID"].ToString());
                cmd.ExecuteNonQuery();
                lblValidator.Text = "Password Updated !";
                btnChangePassword.Visible = true;
                btnSavePassword.Visible = false;
                btnCancelEdit.Visible = false;
                btnResetEdit.Visible = false;

                txtOldPassword.Visible = false;
                txtNewPassword.Visible = false;
                txtConfirmPass.Visible = false;

                lblOldPassword.Visible = false;
                lblNewPassword.Visible = false;
                lblConfirmPass.Visible = false;
                lblValidator.Text = "";
            }
            btnResetEdit_Click(sender, e);
        }
    }
}