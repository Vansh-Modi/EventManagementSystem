using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static EventManagementSystem.Web_Files.Web_Pages.Admin.Feedback;

namespace EventManagementSystem.Web_Files.Web_Pages.Admin
{
    public partial class Reports : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon;
        protected void fnConnection()
        {
            strcon = System.Configuration.ConfigurationManager.ConnectionStrings["EventString"].ConnectionString;
            conn = new SqlConnection(strcon);
            conn.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnection();
            if (!IsPostBack)
            {
                if (Session["adminID"] == null)
                {
                    Response.Redirect("AdminLoginPage.aspx");
                    return;
                }
            }
        }
        protected void rblReportFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(rblReportFilter.SelectedValue == "Event")
            {
                EventFilter.Visible = true;
                UserFilter.Visible = false;
                FeedbackFilter.Visible = false;
                RegistrationFilter.Visible = false;
                BindEventCategories();
            }
            else if (rblReportFilter.SelectedValue == "User")
            {
                EventFilter.Visible = false;
                UserFilter.Visible = true;
                FeedbackFilter.Visible = false;
                RegistrationFilter.Visible = false;
            }
            else if(rblReportFilter.SelectedValue == "Registered Events")
            {
                RegistrationFilter.Visible = true;
                EventFilter.Visible = false;
                UserFilter.Visible = false;
                FeedbackFilter.Visible = false;
                BindRegisterdEvent();
            }
            else if (rblReportFilter.SelectedValue == "Feedback")
            {
                EventFilter.Visible = false;
                UserFilter.Visible = false;
                FeedbackFilter.Visible = true;
                RegistrationFilter.Visible = false;
            }
        }
        protected void BindRegisterdEvent()
        {
            fnConnection();
            SqlCommand cmd = new SqlCommand("SELECT CategoryID, CategoryName FROM tblCategory", conn);
            ddlRegEventCategory.DataSource = cmd.ExecuteReader();
            ddlRegEventCategory.DataTextField = "CategoryName";
            ddlRegEventCategory.DataValueField = "CategoryID";
            ddlRegEventCategory.DataBind();
            ddlRegEventCategory.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--All Categories--", "0"));
            conn.Close();
        }
        protected void ddlEventCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string query;
            SqlCommand cmd;
            if (ddlEventCategory.SelectedValue == "0")
            {
                query = @"SELECT DISTINCT Location FROM tblEvent";
                cmd = new SqlCommand(query, conn);
            }
            else
            {
                query = @"SELECT DISTINCT Location FROM tblEvent WHERE CategoryID = @CategoryID";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("CategoryID", ddlEventCategory.SelectedValue);
            }
            SqlDataReader reader = cmd.ExecuteReader();
            ddlEventLocation.DataSource = reader;
            ddlEventLocation.DataTextField = "Location";
            ddlEventLocation.DataValueField = "Location";
            ddlEventLocation.DataBind();
            ddlEventCategory.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Category--", "0"));
        }
        protected void BindEventCategories()
        {
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT CategoryID , CategoryName FROM tblCategory", conn);
            ddlEventCategory.DataSource = cmd.ExecuteReader();
            ddlEventCategory.DataTextField = "CategoryName";
            ddlEventCategory.DataValueField = "CategoryID";
            ddlEventCategory.DataBind();
            ddlEventCategory.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Category--", "0"));
        }
        protected void ddlEventLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        protected void btnGenerateEventReport_Click(object sender, EventArgs e)
        {
            fnConnection();

            string category = ddlEventCategory.SelectedValue;
            string location = ddlEventLocation.SelectedValue;
            DateTime? startDate = null;
            DateTime? endDate = null;

            if (!string.IsNullOrEmpty(txtStartDateEvent.Text))
                startDate = DateTime.Parse(txtStartDateEvent.Text);

            if (!string.IsNullOrEmpty(txtEndDateEvent.Text))
                endDate = DateTime.Parse(txtEndDateEvent.Text);

            string query = @"SELECT e.EventID, e.Title, e.Description, e.Location, e.Date, e.Capacity,
                            c.CategoryName, a.Username AS AdminName,
                            (SELECT COUNT(*) FROM tblRegistrations r WHERE r.EventID = e.EventID) AS Registrations
                     FROM tblEvent e
                     JOIN tblCategory c ON e.CategoryID = c.CategoryID
                     JOIN tblAdmin a ON e.CreatedBy = a.AdminID
                     WHERE 1 = 1";

            if (category != "0")
                query += " AND e.CategoryID = @CategoryID";

            if (location != "0")
                query += " AND e.Location = @Location";

            if (startDate.HasValue)
                query += " AND e.Date >= @StartDate";

            if (endDate.HasValue)
                query += " AND e.Date <= @EndDate";

            SqlCommand cmd = new SqlCommand(query, conn);

            if (category != "0")
                cmd.Parameters.AddWithValue("@CategoryID", category);

            if (location != "0")
                cmd.Parameters.AddWithValue("@Location", location);

            if (startDate.HasValue)
                cmd.Parameters.AddWithValue("@StartDate", startDate.Value);

            if (endDate.HasValue)
                cmd.Parameters.AddWithValue("@EndDate", endDate.Value);

            SqlDataReader reader = cmd.ExecuteReader();
            List<EventReportItem> eventList = new List<EventReportItem>();

            while (reader.Read())
            {
                eventList.Add(new EventReportItem
                {
                    EventID = Convert.ToInt32(reader["EventID"]),
                    Title = reader["Title"].ToString(),
                    Description = reader["Description"].ToString(),
                    Location = reader["Location"].ToString(),
                    Date = Convert.ToDateTime(reader["Date"]),
                    Capacity = Convert.ToInt32(reader["Capacity"]),
                    CategoryName = reader["CategoryName"].ToString(),
                    AdminName = reader["AdminName"].ToString(),
                    Registrations = Convert.ToInt32(reader["Registrations"])
                });
            }

            reader.Close();
            conn.Close();

            gvGeneratedReport.DataSource = eventList;
            gvGeneratedReport.DataBind();
            lblSummary.Text = $"Total Events: {eventList.Count}";
            btnExportExcel.Enabled = eventList.Count > 0;
            btnExportPDF.Enabled = eventList.Count > 0;
        }
        protected void btnGenerateRegisteredEventsReport_Click(object sender, EventArgs e)
        {
            fnConnection();

            string category = ddlRegEventCategory.SelectedValue;
            DateTime? startDate = null;
            DateTime? endDate = null;

            if (!string.IsNullOrEmpty(txtRegStartDate.Text))
                startDate = DateTime.Parse(txtRegStartDate.Text);

            if (!string.IsNullOrEmpty(txtRegEndDate.Text))
                endDate = DateTime.Parse(txtRegEndDate.Text);

            string query = @"SELECT r.RegistrationID, u.Name AS UserName, u.Email, 
                            e.Title AS EventName, e.Location, e.Date AS EventDate, 
                            c.CategoryName
                     FROM tblRegistrations r
                     JOIN tblUsers u ON r.UserID = u.UserID
                     JOIN tblEvent e ON r.EventID = e.EventID
                     JOIN tblCategory c ON e.CategoryID = c.CategoryID
                     WHERE 1 = 1";

            if (category != "0")
                query += " AND e.CategoryID = @CategoryID";

            if (startDate.HasValue)
                query += " AND r.RegistrationDate >= @StartDate";

            if (endDate.HasValue)
                query += " AND r.RegistrationDate <= @EndDate";

            SqlCommand cmd = new SqlCommand(query, conn);

            if (category != "0")
                cmd.Parameters.AddWithValue("@CategoryID", category);

            if (startDate.HasValue)
                cmd.Parameters.AddWithValue("@StartDate", startDate.Value);

            if (endDate.HasValue)
                cmd.Parameters.AddWithValue("@EndDate", endDate.Value);

            SqlDataReader reader = cmd.ExecuteReader();
            List<RegisteredEventItem> regList = new List<RegisteredEventItem>();

            while (reader.Read())
            {
                regList.Add(new RegisteredEventItem
                {
                    RegistrationID = Convert.ToInt32(reader["RegistrationID"]),
                    UserName = reader["UserName"].ToString(),
                    Email = reader["Email"].ToString(),
                    EventName = reader["EventName"].ToString(),
                    Location = reader["Location"].ToString(),
                    EventDate = Convert.ToDateTime(reader["EventDate"]),
                    CategoryName = reader["CategoryName"].ToString()
                });
            }

            reader.Close();
            conn.Close();

            gvGeneratedReport.DataSource = regList;
            gvGeneratedReport.DataBind();
            lblSummary.Text = $"Total Registrations: {regList.Count}";
            btnExportExcel.Enabled = regList.Count > 0;
            btnExportPDF.Enabled = regList.Count > 0;

        }
        protected void btnGenerateUserReport_Click(object sender, EventArgs e)
        {
            fnConnection();

            string role = ddlUserRole.SelectedValue;
            string query = "SELECT * FROM tblUsers";
            
            if (role != "All")
                query += " WHERE Role = @Role";

            SqlCommand cmd = new SqlCommand(query, conn);

            if (role != "All")
                cmd.Parameters.AddWithValue("@Role", role);

            SqlDataReader reader = cmd.ExecuteReader();
            List<UserReportItem> userList = new List<UserReportItem>();

            while (reader.Read())
            {
                userList.Add(new UserReportItem
                {
                    UserID = Convert.ToInt32(reader["UserID"]),
                    Name = reader["Name"].ToString(),
                    Email = reader["Email"].ToString(),
                    Role = reader["Role"].ToString()
                });
            }

            reader.Close();
            conn.Close();

            gvGeneratedReport.DataSource = userList;
            gvGeneratedReport.DataBind();
            lblSummary.Text = $"Total Users: {userList.Count}";
            btnExportExcel.Enabled = userList.Count > 0;
            btnExportPDF.Enabled = userList.Count > 0;

        }
        protected void btnGenerateFeedbackReport_Click(object sender, EventArgs e)
        {
            fnConnection();

            string status = ddlReportStatus.SelectedValue;
            DateTime? startDate = null;
            if (!string.IsNullOrEmpty(txtStartDateFeedback.Text))
            {
                startDate = DateTime.Parse(txtStartDateFeedback.Text);
            }
            DateTime? endDate = null;
            if (!string.IsNullOrEmpty(txtEndDateFeedback.Text))
            {
                endDate = DateTime.Parse(txtEndDateFeedback.Text);
            }

            string query = @"SELECT f.FeedbackID, u.Name AS UserName, f.Comments AS Comments, f.Status, f.SubmittedAt
                    FROM tblFeedback f
                    JOIN tblUsers u ON f.UserID = u.UserID
                    WHERE 1=1";

            if (!string.IsNullOrEmpty(status) && status != "All")
            {
                query += " AND f.Status = @Status";
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

            gvGeneratedReport.DataSource = feedbackList;
            gvGeneratedReport.DataBind();

            lblSummary.Text = $"Total Feedbacks: {feedbackList.Count}";
            btnExportExcel.Enabled = feedbackList.Count > 0;
            btnExportPDF.Enabled = feedbackList.Count > 0;

        }
        public class EventReportItem
        {
            public int EventID { get; set; }
            public string Title { get; set; }
            public string Description { get; set; }
            public string Location { get; set; }
            public DateTime Date { get; set; }
            public int Capacity { get; set; }
            public string CategoryName { get; set; }
            public string AdminName { get; set; }
            public int Registrations { get; set; }
        }
        public class UserReportItem
        {
            public int UserID { get; set; }
            public string Name { get; set; }
            public string Email { get; set; }
            public string Role { get; set; }
        }
        public class RegisteredEventItem
        {
            public int RegistrationID { get; set; }
            public string UserName { get; set; }
            public string Email { get; set; }
            public string EventName { get; set; }
            public string Location { get; set; }
            public DateTime EventDate { get; set; }
            public string CategoryName { get; set; }
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Report.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            gvGeneratedReport.AllowPaging = false; 
            gvGeneratedReport.RenderControl(hw);

            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Report.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            gvGeneratedReport.AllowPaging = false;
            gvGeneratedReport.RenderControl(hw);

            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            htmlparser.Parse(sr);
            pdfDoc.Close();

            Response.Write(pdfDoc);
            Response.End();
        }     
        protected void ddlRegEventCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
         
        }

        
    }
}