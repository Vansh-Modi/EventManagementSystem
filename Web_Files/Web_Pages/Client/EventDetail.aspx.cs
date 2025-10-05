using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagementSystem.Web_Files.Web_Pages.Client
{
    public partial class EventDetail : System.Web.UI.Page
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
                return;
            }
            if (!IsPostBack)
            {
                fnPrintLabelDetails();
            }
        }

        protected void fnPrintLabelDetails()
        {
            string eventId = Request.QueryString["EventID"];
            if (string.IsNullOrEmpty(eventId))
            {
                lblStatus.Text = "Invalid Event ID.";
                btnRegister.Visible = false;
                return;
            }

            string query = @"
            SELECT E.Title, E.Description, E.Date, E.Time, 
            E.Location, E.Capacity, C.CategoryName
            FROM tblEvent E
            JOIN tblCategory C ON E.CategoryID = C.CategoryID
            WHERE E.EventID = @EventID";

            SqlConnection conn = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@EventID", eventId);
            conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                lblTitle.Text = reader["Title"].ToString();
                lblDescription.Text = reader["Description"].ToString();
                lblDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd MMM yyyy");
                lblTime.Text = reader["Time"].ToString();
                lblLocation.Text = reader["Location"].ToString();
                lblCapacity.Text = reader["Capacity"].ToString();
                lblCategory.Text = reader["CategoryName"].ToString();
            }
            else
            {
                lblStatus.Text = "Event not found.";
                btnRegister.Visible = false;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                lblStatus.Text = "Please log in to register.";
                return;
            }

            string userId = Session["UserID"].ToString();
            string eventId = Request.QueryString["EventID"];

            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            string checkQuery = "SELECT COUNT(*) FROM tblRegistrations " +
                            "WHERE UserID = @UserID AND EventID = @EventID";
            SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
            checkCmd.Parameters.AddWithValue("@UserID", userId);
            checkCmd.Parameters.AddWithValue("@EventID", eventId);

            int count = (int)checkCmd.ExecuteScalar();
            if (count > 0)
            {
                lblStatus.Text = "You are already registered for this event.";
                return;
            }

            string insertQuery = "INSERT INTO tblRegistrations (UserID, EventID, ResisterdAt,Status) " +
                                 "VALUES (@UserID, @EventID, @Date, @Status)";
            SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
            insertCmd.Parameters.AddWithValue("@UserID", userId);
            insertCmd.Parameters.AddWithValue("@EventID", eventId);
            insertCmd.Parameters.AddWithValue("@Date", DateTime.Now);
            insertCmd.Parameters.AddWithValue("@Status", "Confirmed");
            int rows = insertCmd.ExecuteNonQuery();
            lblStatus.Text = rows > 0 ? "Registration successful!" :
                "Registration failed. Try again.";

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