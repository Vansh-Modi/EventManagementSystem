using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagementSystem.Web_Files.Web_Pages.Admin
{
    public partial class ManageCategories : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon;

        protected void fnConnection()
        {
            strcon = System.Configuration.ConfigurationManager.ConnectionStrings["EventString"].ConnectionString;
            conn = new SqlConnection(strcon);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["role"] == null || Session["role"].ToString() != "admin")
                {
                    Response.Redirect("../Home.aspx");
                    return;
                }
                LoadCategories();
            }
        }

        protected void LoadCategories()
        {
            fnConnection();
            SqlCommand cmd = new SqlCommand("SELECT CategoryID, CategoryName FROM tblCategory", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvCategories.DataSource = dt;
            gvCategories.DataBind();
            conn.Close();
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtNewCategory.Text))
            {
                fnConnection();
                SqlCommand cmd = new SqlCommand("INSERT INTO tblCategory (CategoryName) VALUES (@Name)", conn);
                cmd.Parameters.AddWithValue("@Name", txtNewCategory.Text.Trim());
                cmd.ExecuteNonQuery();
                conn.Close();
                txtNewCategory.Text = "";
                LoadCategories();
            }
        }
        protected void gvCategories_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategories.EditIndex = e.NewEditIndex;
            LoadCategories();
        }

        protected void gvCategories_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvCategories.DataKeys[e.RowIndex].Value);
            string name = ((TextBox)gvCategories.Rows[e.RowIndex].Cells[1].Controls[0]).Text;

            fnConnection();
            SqlCommand cmd = new SqlCommand("UPDATE tblCategory SET CategoryName = @Name WHERE CategoryID = @ID", conn);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@ID", id);
            cmd.ExecuteNonQuery();
            conn.Close();

            gvCategories.EditIndex = -1;
            LoadCategories();
        }

        protected void gvCategories_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategories.EditIndex = -1;
            LoadCategories();
        }
        protected void gvCategories_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvCategories.DataKeys[e.RowIndex].Value);

            fnConnection();
            SqlCommand cmd = new SqlCommand("DELETE FROM tblCategory WHERE CategoryID = @ID", conn);
            cmd.Parameters.AddWithValue("@ID", id);
            cmd.ExecuteNonQuery();
            conn.Close();

            LoadCategories();
        }
    }
}