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
    public partial class LoginPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["EventString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM tblUsers WHERE Name = @user AND Password = @pass";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@user", txtUserName.Text);
                cmd.Parameters.AddWithValue("@pass", txtPassword.Text);

                try
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Session["UserID"] = dr["UserID"].ToString();
                            Session["Name"] = dr["Name"].ToString();

                        }
                        Response.Redirect("~/Web Files/Web Pages/Client/Dashboard.aspx");
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