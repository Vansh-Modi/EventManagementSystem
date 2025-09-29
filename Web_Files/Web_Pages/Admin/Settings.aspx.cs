using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagementSystem.Web_Files.Web_Pages.Admin
{
    public partial class Settings : System.Web.UI.Page
    {
        string strcon;
        SqlConnection conn;

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
                if(Session["AdminID"] == null)
                {
                    Response.Redirect("AdminLoginPage.aspx");
                    return;
                }
                LoadBranding();
                LoadAdminProfile();
            }
        }

        private void LoadBranding()
        {
            fnConnection();
            SqlCommand cmd = new SqlCommand("SELECT SiteTitle, FooterText, LogoPath FROM tblSettings WHERE SettingID = 1", conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                txtSiteTitle.Text = reader["SiteTitle"].ToString();
                txtFooterText.Text = reader["FooterText"].ToString();
                imgLogoPreview.ImageUrl = reader["LogoPath"].ToString();
            }
            reader.Close();
            conn.Close();
        }

        protected void btnSaveBranding_Click(object sender, EventArgs e)
        {
            fnConnection();
            SqlCommand cmd = new SqlCommand("UPDATE tblSettings SET SiteTitle = @Title, FooterText = @Footer WHERE SettingID = 1", conn);
            cmd.Parameters.AddWithValue("@Title", txtSiteTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@Footer", txtFooterText.Text.Trim());
            cmd.ExecuteNonQuery();
            conn.Close();
            lblSettingsStatus.Text = "Branding updated successfully.";
        }

        protected void btnUploadLogo_Click(object sender, EventArgs e)
        {
            if (fuLogo.HasFile)
            {
                string fileName = Path.GetFileName(fuLogo.FileName);
                string savePath = "/Web_Files/Images/" + fileName;
                fuLogo.SaveAs(Server.MapPath(savePath));

                fnConnection();
                SqlCommand cmd = new SqlCommand("UPDATE tblSettings SET LogoPath = @Path WHERE SettingID = 1", conn);
                cmd.Parameters.AddWithValue("@Path", savePath);
                cmd.ExecuteNonQuery();
                conn.Close();

                imgLogoPreview.ImageUrl = savePath;
                lblSettingsStatus.Text = "Logo updated successfully.";
            }
        }

        private void LoadAdminProfile()
        {
            fnConnection();
            SqlCommand cmd = new SqlCommand("SELECT Username, Email FROM tblAdmin WHERE AdminID = @AdminID", conn);
            cmd.Parameters.AddWithValue("@AdminID", Session["AdminID"]);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                txtAdminName.Text = reader["Username"].ToString();
                txtAdminEmail.Text = reader["Email"].ToString();
            }
            reader.Close();
            conn.Close();
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            fnConnection();
            SqlCommand cmd = new SqlCommand("UPDATE tblAdmin SET Username = @Username, Email = @Email, Password = @Password WHERE AdminID = @AdminID", conn);
            cmd.Parameters.AddWithValue("@Username", txtAdminName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtAdminEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtNewPassword.Text.Trim());
            cmd.Parameters.AddWithValue("@AdminID", Session["AdminID"]);
            cmd.ExecuteNonQuery();
            conn.Close();
            lblSettingsStatus.Text = "Profile updated successfully.";
        }
    }
}