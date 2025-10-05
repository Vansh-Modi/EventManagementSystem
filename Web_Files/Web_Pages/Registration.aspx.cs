using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace EventManagementSystem.Web_Files.Web_Pages
{
    public partial class Registration : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["EventString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                fnBindDdlRole();
            }
        }

        protected void fnBindDdlRole()
        {
            ddlRole.Items.Clear();
            ddlRole.Items.Add("Admin");
            ddlRole.Items.Add("Client");
            ddlRole.Items.Insert(0, new ListItem("---Select Role---"));
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string user = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string phone = txtNumber.Text.Trim();
            string role = ddlRole.SelectedValue;

            string query = "INSERT INTO tblUsers (Name, Email, Password, PhoneNumber, Role) VALUES (@user, @email, @pass, @phone, @role)";
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@user", user);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@pass", password);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@role", role);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();

                    if (role == "Admin")
                    {
                        string adminQuery = "INSERT INTO tblAdmin (Username, Email, Password) VALUES (@name, @email, @pass)";
                        SqlCommand adminCmd = new SqlCommand(adminQuery, conn);
                        adminCmd.Parameters.AddWithValue("@name", user);
                        adminCmd.Parameters.AddWithValue("@email", email);
                        adminCmd.Parameters.AddWithValue("@pass", password);
                        adminCmd.ExecuteNonQuery();
                    }

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Registration Successful!');", true);

                    if (role == "Admin")
                        Response.Redirect("~/Web_Files/Web_Pages/Admin/AdminLoginPage.aspx");
                    else
                        Response.Redirect("~/Web_Files/Web_Pages/Client/LoginPage.aspx");
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", $"alert('Error: {ex.Message}');", true);
                }
            }

            btnReset_Click(sender, e);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtNumber.Text = "";
            ddlRole.SelectedIndex = 0;
        }
    }
}