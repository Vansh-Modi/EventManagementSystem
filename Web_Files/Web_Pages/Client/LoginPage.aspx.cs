using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace EventManagementSystem.Web_Pages.Web_Pages.Client
{
    public partial class LoginPage : System.Web.UI.Page
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

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strCon);
            string query = "SELECT UserID, Name FROM tblUsers WHERE Name = @user AND Password = @pass";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@user", txtUserName.Text.Trim());
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
                            Session["UserID"] = dr["UserID"].ToString();
                            Session["Name"] = dr["Name"].ToString();
                        }
                        Response.Redirect("~/Web_Files/Web_Pages/Client/Dashboard.aspx");
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