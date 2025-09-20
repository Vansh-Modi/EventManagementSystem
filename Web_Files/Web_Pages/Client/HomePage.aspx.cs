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
    public partial class HomePage : System.Web.UI.Page
    {
        SqlConnection conn;
        String strCon;

        protected void fnConnection()
        {
            strCon = ConfigurationManager.ConnectionStrings["EventString"].ConnectionString;
            conn = new SqlConnection(strCon);
            conn.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnection();
            if (!IsPostBack)
            {
                fnBindDDLSearch();
                fnBindFeaturedEvents();
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

        protected void fnBindFeaturedEvents()
        {
            SqlConnection conn = new SqlConnection(strCon);
            string query = @"
            SELECT TOP 5 EventID, Title, Date, Location
            FROM tblEvent
            WHERE Date >= GETDATE()
            ORDER BY Date ASC";

            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            gdvFeatureEvent.DataSource = dt;
            gdvFeatureEvent.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText = txtSearch.Text.Trim();
            string selectedCategory = ddlSearch.SelectedItem.Text;

            using (SqlConnection conn = new SqlConnection(strCon))
            {
                string query = @"
                SELECT E.EventID, E.Title, E.Description, E.Date, C.CategoryName
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

                gdbSearch.DataSource = dt;
                gdbSearch.DataBind();
            }

            txtSearch.Text = "";
            ddlSearch.ClearSelection();
        }
    }
}