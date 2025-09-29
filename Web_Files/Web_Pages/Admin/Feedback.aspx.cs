using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace EventManagementSystem.Web_Files.Web_Pages.Admin
{
    public partial class Feedback : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["EventString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["AdminID"] == null)
                {
                    Response.Redirect("AdminLoginPage.aspx");
                }
                else
                {
                    BindFeedback("All", "", null, null);
                }
            }
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            string status = ddlFilterFeedback.SelectedValue;
            string keyword = txtSearchKeyword.Text.Trim();

            DateTime? startDate = null;
            DateTime? endDate = null;

            if (!string.IsNullOrEmpty(txtStartDate.Text) && !string.IsNullOrEmpty(txtEndDate.Text))
            {
                DateTime start, end;
                bool isStartValid = DateTime.TryParse(txtStartDate.Text, out start);
                bool isEndValid = DateTime.TryParse(txtEndDate.Text, out end);

                if (isStartValid && isEndValid && start <= end)
                {
                    startDate = start;
                    endDate = end;
                }
                else
                {
                    lblFeedbackCount.Text = "Please enter a valid date range.";
                    return;
                }
            }

            BindFeedback(status, keyword, startDate, endDate);
        }

        protected void BindFeedback(string status, string keyword, DateTime? startDate, DateTime? endDate)
        {
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();

            string query = @"SELECT f.FeedbackID, u.Name AS UserName, f.Comments AS Comments, f.Status, f.SubmittedAt
                             FROM tblFeedback f
                             JOIN tblUsers u ON f.UserID = u.UserID
                             WHERE 1=1";

            if (!string.IsNullOrEmpty(status) && status != "All")
            {
                query += " AND f.Status = @Status";
            }

            if (!string.IsNullOrEmpty(keyword))
            {
                query += " AND (f.Comments LIKE @Keyword OR u.Name LIKE @Keyword)";
            }

            if (startDate.HasValue)
            {
                query += " AND f.SubmittedAt >= @StartDate";
            }

            if (endDate.HasValue)
            {
                query += " AND f.SubmittedAt <= @EndDate";
            }

            SqlCommand cmd = new SqlCommand(query, conn);

            if (!string.IsNullOrEmpty(status) && status != "All")
            {
                cmd.Parameters.AddWithValue("@Status", status);
            }

            if (!string.IsNullOrEmpty(keyword))
            {
                cmd.Parameters.AddWithValue("@Keyword", "%" + keyword + "%");
            }

            if (startDate.HasValue)
            {
                cmd.Parameters.AddWithValue("@StartDate", startDate.Value);
            }

            if (endDate.HasValue)
            {
                cmd.Parameters.AddWithValue("@EndDate", endDate.Value);
            }

            SqlDataReader reader = cmd.ExecuteReader();
            List<FeedbackItem> feedbackList = new List<FeedbackItem>();
            List<int> filteredIds = new List<int>();

            while (reader.Read())
            {
                int id = Convert.ToInt32(reader["FeedbackID"]);
                filteredIds.Add(id);

                feedbackList.Add(new FeedbackItem
                {
                    FeedbackID = id,
                    UserName = reader["UserName"].ToString(),
                    Comments = reader["Comments"].ToString(),
                    Status = reader["Status"].ToString(),
                    SubmittedAt = Convert.ToDateTime(reader["SubmittedAt"])
                });
            }

            reader.Close();
            conn.Close();

            gvFeedback.DataSource = feedbackList;
            gvFeedback.DataBind();
            lblFeedbackCount.Text = $"Total Feedbacks: {feedbackList.Count}";

            Session["FilteredFeedbackIDs"] = filteredIds;
        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            List<int> filteredIds = Session["FilteredFeedbackIDs"] as List<int>;
            if (filteredIds == null || filteredIds.Count == 0)
            {
                lblFeedbackCount.Text = "No feedback selected for update.";
                return;
            }

            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();

            foreach (int id in filteredIds)
            {
                string query = "UPDATE tblFeedback SET Status = 'Reviewed' WHERE FeedbackID = @FeedbackID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FeedbackID", id);
                cmd.ExecuteNonQuery();
            }

            conn.Close();
            lblFeedbackCount.Text = $"{filteredIds.Count} feedback(s) marked as Reviewed.";
            BindFeedback("All", "", null, null);
        }

        public class FeedbackItem
        {
            public int FeedbackID { get; set; }
            public string UserName { get; set; }
            public string Comments { get; set; }
            public string Status { get; set; }
            public DateTime SubmittedAt { get; set; }
        }
    }
}