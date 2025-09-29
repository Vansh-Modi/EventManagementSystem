using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagementSystem.Web_Files.Web_Pages.Admin
{
    public partial class UserManagement : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon;
        static int selectedUserId;

        protected void fnConnection()
        {
            strcon = ConfigurationManager.ConnectionStrings["EventString"].ConnectionString;
            conn = new SqlConnection(strcon);
            conn.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnection();
            if (!IsPostBack)
            {
                if (Session["AdminID"] == null)
                {
                    Response.Redirect("AdminLoginPage.aspx");
                }
                else
                {
                    BindRoleDropdown();
                    BindUsers();
                }
            }
        }

        private void BindRoleDropdown()
        {
            ddlRole.Items.Clear();
            ddlRole.Items.Add("Admin");
            ddlRole.Items.Add("Client");
            ddlRole.Items.Insert(0, new ListItem("---Select Role---"));
        }

        private void BindUsers()
        {
            SqlConnection conn = new SqlConnection(strcon);
            string query = "SELECT UserID, Name, Email, Password, PhoneNumber, Role FROM tblUsers";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvUsers.DataSource = dt;
            gvUsers.DataBind();

        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            if (ddlRole.SelectedIndex == 0)
            {
                lblMessage.Text = "Please select a category.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            SqlConnection conn = new SqlConnection(strcon);
            string query = @"INSERT INTO tblUsers VALUES (@Name, @Email, @Password, @PhoneNumber, @Role)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@PhoneNumber", txtNumber.Text);
            cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);
            conn.Open();
            cmd.ExecuteNonQuery();
            lblMessage.Text = "Event added successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            BindUsers();
            btnReset_Click(sender, e);
        }

        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            selectedUserId = Convert.ToInt32(gvUsers.DataKeys[e.NewEditIndex].Value);
            SqlConnection conn = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblUsers WHERE UserID = @UserID", conn);
            cmd.Parameters.AddWithValue("@UserID", selectedUserId);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                txtName.Text = reader["Name"].ToString();
                txtEmail.Text = reader["Email"].ToString();
                txtPassword.Text = reader["Password"].ToString();
                txtNumber.Text = reader["PhoneNumber"].ToString();
                ddlRole.SelectedValue = reader["Role"].ToString();
                btnAddEvent.Visible = false;
                btnUpdateEvent.Visible = true;
            }
        }

        protected void btnUpdateEvent_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(strcon);
            string query = @"UPDATE tblUsers SET Name=@Name, Email=@Email, Password=@Password, 
                        PhoneNumber=@PhoneNumber, Role=@Role WHERE UserID=@UserID";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@PhoneNumber", txtNumber.Text);
            cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);
            cmd.Parameters.AddWithValue("@UserID", selectedUserId);
            conn.Open();
            cmd.ExecuteNonQuery();
            lblMessage.Text = "User updated successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            BindUsers();
            btnReset_Click(sender, e);
            btnAddEvent.Visible = true;
            btnUpdateEvent.Visible = false;
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int eventId = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);
            SqlConnection conn = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("DELETE FROM tblUsers WHERE UserID = @UserID", conn);
            cmd.Parameters.AddWithValue("@UserID", eventId);
            conn.Open();
            cmd.ExecuteNonQuery();
            lblMessage.Text = "Event deleted successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            BindUsers();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtNumber.Text = "";
            ddlRole.SelectedIndex = 0;
            lblMessage.Text = "";
            btnAddEvent.Visible = true;
            btnUpdateEvent.Visible = false;
        }
    }
}