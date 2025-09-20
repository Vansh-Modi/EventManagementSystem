using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace EventManagementSystem.Web_Pages.Web_Pages.Admin
{
    public partial class AdminLoginPage : System.Web.UI.Page
    {
        SqlConnection conn;
        String strCon;

        protected void fnConnection()
        {
            strCon = ConfigurationManager.ConnectionStrings["EventString"].ConnectionString;
            conn = new SqlConnection(strCon);
            conn.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnection();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strCon);
            string query = "SELECT AdminID, Username FROM tblAdmin WHERE Username = @user AND Password = @pass";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@user", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@pass", txtPassword.Text.Trim());

            try
            {
                con.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Session["AdminID"] = dr["AdminID"].ToString();
                            Session["Username"] = dr["Username"].ToString();
                        }
                        Response.Redirect("~/Web_Files/Web_Pages/Admin/AdminDashboard.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Login Failed! Invalid Username or Password');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }
    }
}