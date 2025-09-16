using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagementSystem.Web_Pages.Web_Pages.Admin
{
    public partial class AdminLoginPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["EventString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM tblAdmin WHERE Username = @user AND Password = @pass";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@user", txtName.Text);
                cmd.Parameters.AddWithValue("@pass", txtPassword.Text);

                try
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Session["AdminID"] = dr["AdminID"].ToString();
                            Session["Username"] = dr["Username"].ToString();

                        }
                        Response.Redirect("~/Web Files/Web Pages/Admin/AdminDashboard.aspx");
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login Failed! Invalid Login Name or Password')</script>");
                    }
                }
                catch (SqlException sqlEx)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", $"<script>alert('SQL Error: {sqlEx.Message}')</script>");
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), $"Scripts", $"<script>alert('Error: {ex.Message}')</script>");
                }
                finally
                {
                    if (con.State == System.Data.ConnectionState.Open)
                    {
                        con.Close();
                    }
                }
            }
        }
    }
}