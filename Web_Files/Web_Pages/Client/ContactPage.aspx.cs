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
    public partial class ContactPage : System.Web.UI.Page
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

                }
            }
        }
        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Response.Redirect("./HomePage.aspx");
        }

        protected void btnSubmitFeedback_Click(object sender, EventArgs e)
        {
            string message = txtMessage.Text.Trim();

            if (string.IsNullOrEmpty(message))
            {
                lblFeedbackMessage.Text = "Please enter your feedback.";
                return;
            }
            int userId = Convert.ToInt32(Session["UserID"]);

            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();
            string query = @"INSERT INTO tblFeedback (UserID, Comments, SubmittedAt)
                        VALUES (@UserID, @Comments, @SubmittedAt)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@UserID", userId);
            cmd.Parameters.AddWithValue("@Comments", message);
            cmd.Parameters.AddWithValue("@SubmittedAt", DateTime.Now);
            cmd.ExecuteNonQuery();
            lblFeedbackMessage.Text = "Thank you for your feedback!";
            txtMessage.Text = "";
        }
    }
}