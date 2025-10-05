using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagementSystem.Web_Files.Web_Pages.Client
{
    public partial class EventListing : System.Web.UI.Page
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
            int User = Convert.ToInt16(Session["UserID"]);
            fnConnection();
            if (!IsPostBack)
            {
                fnBindDDLSearch();
                fnBindEvents("", "--Select Category--");
            }
        }

        protected void fnBindDDLSearch()
        {
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT CategoryName FROM tblCategory", conn);
            ddlSearch.DataSource = cmd.ExecuteReader();
            ddlSearch.DataTextField = "CategoryName";
            ddlSearch.DataBind();
            ddlSearch.Items.Insert(0, new ListItem("--Select Category--", "0"));
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText = txtSearch.Text.Trim();
            string selectedCategory = ddlSearch.SelectedItem.Text;
            fnBindEvents(searchText, selectedCategory);
            txtSearch.Text = "";
            ddlSearch.ClearSelection();
        }

        private void fnBindEvents(string searchText, string selectedCategory)
        {
            SqlConnection conn = new SqlConnection(strCon);
            string query = @"
            SELECT E.EventID, E.Title, E.Description, E.Location, C.CategoryName
            FROM tblEvent E
            JOIN tblCategory C ON E.CategoryID = C.CategoryID
            WHERE (@SearchText = '' OR E.Title LIKE '%' + @SearchText + '%')
                AND (@SelectedCategory = '--Select Category--' OR C.CategoryName = @SelectedCategory)";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@SearchText", searchText);
            cmd.Parameters.AddWithValue("@SelectedCategory", selectedCategory);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            rptEvents.DataSource = dt;
            rptEvents.DataBind();
        }
        protected void btnFeedback_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContactPage.aspx");
        }
    }
}