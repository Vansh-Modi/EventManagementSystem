using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagementSystem.Web_Files.Web_Pages.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon;
        private void fnConnection()
        {
            strcon = System.Configuration.ConfigurationManager.ConnectionStrings["EventString"].ConnectionString;
            conn = new SqlConnection(strcon);
            conn.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null || string.IsNullOrEmpty(Session["AdminID"].ToString()))
            {
                Response.Redirect("./AdminLoginPage.aspx");
                return;
            }
            else
            {
                fnConnection();
                if (!Page.IsPostBack)
                {
                    fnCountEvents();
                    fnCountFeedback();
                    fnCountRegistrations();
                    fnCountUsers();
                }
            }
        }

        private void fnCountUsers()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(UserID) FROM tblUsers WHERE Role='Client'", conn);
                int count = (int)cmd.ExecuteScalar();
                lblTotalUsers.Text = count.ToString();
            }
            catch (Exception ex)
            {
                lblTotalUsers.Text = "Error";
            }
        }

        private void fnCountEvents()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(EventID) FROM tblEvent", conn);
                int count = (int)cmd.ExecuteScalar();
                lblTotalEvents.Text = count.ToString();
            }
            catch (Exception ex)
            {
                lblTotalEvents.Text = "Error";
            }
        }

        private void fnCountRegistrations()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(RegistrationID) FROM tblRegistrations", conn);
                int count = (int)cmd.ExecuteScalar();
                lblTotalRegistrations.Text = count.ToString();
            }
            catch (Exception ex)
            {
                lblTotalRegistrations.Text = "Error";
            }
        }

        private void fnCountFeedback()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(ReviewID) FROM tblReview", conn);
                int count = (int)cmd.ExecuteScalar();
                lblTotalFeedback.Text = count.ToString();
            }
            catch (Exception ex)
            {
                lblTotalFeedback.Text = "Error";
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {

        }
    }
}