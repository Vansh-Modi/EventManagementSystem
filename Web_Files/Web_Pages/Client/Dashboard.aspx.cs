using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagementSystem.Web_Pages.Web_Pages.Client
{
    public partial class Dashboard : System.Web.UI.Page
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
            if(Session["UserID"] == null)
            {
                Response.Redirect("./LoginPage.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    lblUserName.Text = Session["Name"].ToString();
                    fnBindNotification(sender, e);
                    fnBindRegisteredEvents();
                }
            }
        }

        private void fnBindRegisteredEvents()
        {
            string userId = Session["UserID"].ToString();
            string query = @"
            SELECT E.EventID, E.Title, E.Date, E.Location
            FROM tblRegistrations R
            JOIN tblEvent E ON R.EventID = E.EventID
            WHERE R.UserID = @UserID";

            SqlConnection conn = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@UserID", userId);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rptMyEvents.DataSource = dt;
            rptMyEvents.DataBind();
        }

        protected void fnBindNotification(object sender, EventArgs e)
        {
            string userId = Session["UserID"].ToString();
            int totalRegistered = 0;
            int upcomingCount = 0;

            string query = @"
                SELECT E.Date
                FROM tblRegistrations R
                JOIN tblEvent E ON R.EventID = E.EventID
                WHERE R.UserID = @UserID";

            SqlConnection conn = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@UserID", userId);
            conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                totalRegistered++;
                DateTime eventDate = Convert.ToDateTime(reader["Date"]);
                if (eventDate >= DateTime.Today)
                {
                    upcomingCount++;
                }
            }

            lblTotalRegistered.Text = totalRegistered.ToString();
            lblUpcomingCount.Text = upcomingCount.ToString();

            if (totalRegistered == 0)
                lblStatusMessage.Text = "You haven’t registered for any events yet.";
            else if (upcomingCount == 0)
                lblStatusMessage.Text = "No upcoming events. Stay tuned!";
            else
                lblStatusMessage.Text = "You’re all set! See you at your next event.";
        }

        protected void btnCancel_Command(object sender, CommandEventArgs e)
        {
            string eventId = e.CommandArgument.ToString();
            string userId = Session["UserID"].ToString();

            string query = "DELETE FROM tblRegistrations WHERE " +
                "UserID = @UserID AND EventID = @EventID";

            SqlConnection conn = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@UserID", userId);
            cmd.Parameters.AddWithValue("@EventID", eventId);
            conn.Open();
            int rows = cmd.ExecuteNonQuery();
            if (rows == 0)
            {
                lblStatusMessage.Text = "You haven’t registered for any events yet.";
            }
            lblStatusMessage.Text = rows > 0 ? "Registration cancelled successfully." : 
                "Cancellation failed.";
            fnBindRegisteredEvents();
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
    }
}