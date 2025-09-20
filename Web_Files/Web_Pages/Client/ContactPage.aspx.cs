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
            string Name = txtName.Text;
            string Email = txtEmail.Text;
            string Message = txtMessage.Text;
            if(txtName.Text == "" || txtEmail.Text == "" || txtMessage.Text == "")
            {
                lblFeedbackMessage.Text = "Please fill in all fields.";
                return;
            }
            string query = "INSERT INTO tblReview (Name, Email, Comments) " +
                "VALUES (@Name, @Email, @Message)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@Message", Message);
            cmd.ExecuteNonQuery();
            lblFeedbackMessage.Text = "Thank you for your feedback!";
            txtName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";
        }
    }
}