using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace EventManagementSystem.Web_Files.Web_Pages.Admin
{
    public partial class EventManagement : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon;
        static int selectedEventId;

        protected void fnConnection()
        {
            strcon = ConfigurationManager.ConnectionStrings["EventString"].ConnectionString;
            conn = new SqlConnection(strcon);
            conn.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnection();
            if (!IsPostBack)
            {
                if (Session["AdminID"] == null)
                {
                    Response.Redirect("AdminLoginPage.aspx");
                }
                else
                {
                    BindCategoryDropdown();
                    BindEvents();
                }
            }
        }

        private void BindCategoryDropdown()
        {
            SqlConnection conn = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("SELECT CategoryID, CategoryName FROM tblCategory", conn);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            ddlCategory.DataSource = reader;
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryID";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("---Select Category---", "0"));
        }

        private void BindEvents()
        {
            SqlConnection conn = new SqlConnection(strcon);
            string query = @"SELECT e.EventID, e.Title, e.Description, e.Date, e.Time, e.Location, e.Capacity, c.CategoryName, e.CreatedBy
                            FROM tblEvent e
                            JOIN tblCategory c ON e.CategoryID = c.CategoryID";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvEvents.DataSource = dt;
            gvEvents.DataBind();
            
        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedIndex == 0)
            {
                lblMessage.Text = "Please select a category.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            SqlConnection conn = new SqlConnection(strcon);
            string query = @"INSERT INTO tblEvent (Title, Description, Date, Time, Location, Capacity, CategoryID, CreatedBy)
                            VALUES (@Title, @Desc, @Date, @Time, @Loc, @Cap, @Cat, @CreatedBy)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@Desc", txtDescription.Text.Trim());
            cmd.Parameters.AddWithValue("@Date", txtDate.Text);
            cmd.Parameters.AddWithValue("@Time", txtTime.Text);
            cmd.Parameters.AddWithValue("@Loc", txtLocation.Text.Trim());
            cmd.Parameters.AddWithValue("@Cap", txtCapacity.Text.Trim());
            cmd.Parameters.AddWithValue("@Cat", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@CreatedBy", Session["AdminID"].ToString());
            conn.Open();
            cmd.ExecuteNonQuery();
            lblMessage.Text = "Event added successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            BindEvents();
            btnReset_Click(sender, e);
        }

        protected void gvEvents_RowEditing(object sender, GridViewEditEventArgs e)
        {
            selectedEventId = Convert.ToInt32(gvEvents.DataKeys[e.NewEditIndex].Value);
            SqlConnection conn = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblEvent WHERE EventID = @EventID", conn);
            cmd.Parameters.AddWithValue("@EventID", selectedEventId);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                txtTitle.Text = reader["Title"].ToString();
                txtDescription.Text = reader["Description"].ToString();
                txtDate.Text = Convert.ToDateTime(reader["Date"]).ToString("yyyy-MM-dd");
                txtTime.Text = reader["Time"].ToString();
                txtLocation.Text = reader["Location"].ToString();
                txtCapacity.Text = reader["Capacity"].ToString();
                ddlCategory.SelectedValue = reader["CategoryID"].ToString();
                btnAddEvent.Visible = false;
                btnUpdateEvent.Visible = true;
            }
        }

        protected void btnUpdateEvent_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(strcon);
            string query = @"UPDATE tblEvent SET Title=@Title, Description=@Desc, Date=@Date, 
                            Time=@Time, Location=@Loc, Capacity = @Cap, CategoryID=@Cat
                            WHERE EventID=@EventID";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@Desc", txtDescription.Text.Trim());
            cmd.Parameters.AddWithValue("@Date", txtDate.Text);
            cmd.Parameters.AddWithValue("@Time", txtTime.Text);
            cmd.Parameters.AddWithValue("@Loc", txtLocation.Text.Trim());
            cmd.Parameters.AddWithValue("@Cap", txtCapacity.Text.Trim());
            cmd.Parameters.AddWithValue("@Cat", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@EventID", selectedEventId);
            conn.Open();
            cmd.ExecuteNonQuery();
            lblMessage.Text = "Event updated successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            BindEvents();
            btnReset_Click(sender, e);
            btnAddEvent.Visible = true;
            btnUpdateEvent.Visible = false;
        }

        protected void gvEvents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int eventId = Convert.ToInt32(gvEvents.DataKeys[e.RowIndex].Value);
            SqlConnection conn = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("DELETE FROM tblEvent WHERE EventID = @EventID", conn);
            cmd.Parameters.AddWithValue("@EventID", eventId);
            conn.Open();
            cmd.ExecuteNonQuery();
            lblMessage.Text = "Event deleted successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            BindEvents();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtTitle.Text = "";
            txtDescription.Text = "";
            txtDate.Text = "";
            txtLocation.Text = "";
            ddlCategory.SelectedIndex = 0;
            lblMessage.Text = "";
            btnAddEvent.Visible = true;
            btnUpdateEvent.Visible = false;
            txtTime.Text = "";
            txtCapacity.Text = "";
        }
    }
}