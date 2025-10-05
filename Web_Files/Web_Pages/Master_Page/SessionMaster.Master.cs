using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagementSystem.Web_Files.Web_Pages.Master_Page
{
    public partial class SessionMaster : System.Web.UI.MasterPage
    {
        SqlConnection conn;
        string strcon;
        private void fnConnection()
        {
            strcon = System.Configuration.ConfigurationManager.ConnectionStrings["EventString"].ConnectionString;
            conn = new SqlConnection(strcon);
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fnConnection();
                SqlCommand cmd = new SqlCommand("SELECT SiteTitle, FooterText, LogoPath FROM tblSettings WHERE SettingID = 1", conn);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblFooterText.Text = reader["FooterText"].ToString();
                    imgLogo.ImageUrl = reader["LogoPath"].ToString();
                }
                reader.Close();
                conn.Close();
            }
        }

        protected void imgLogoutBtn_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
        }
    }
}