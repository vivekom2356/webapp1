using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace webapp1
{
    public partial class Default : System.Web.UI.Page
    {
        string cs1 = ConfigurationManager.ConnectionStrings["dbcs2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            int count = 0;
            count = (int)Session["VisitorCount"];
            VisitorCountLabel.Text = count.ToString();

            // Initialize text visibility session if it doesn't exist
            if (Session["ShowFirstText"] == null)
            {
                Session["ShowFirstText"] = true;
            }

            // Toggle visibility based on session state
            bool showFirstText = (bool)Session["ShowFirstText"];
            defaulttext1.Visible = showFirstText;
            defaulttext2.Visible = !showFirstText;

            if (!IsPostBack)
            {
                using (SqlConnection con1 = new SqlConnection(cs1))
                {
                    string query = "select defaulttext1, defaulttext2, headertext, footertext from admin";
                    SqlCommand cmd = new SqlCommand(query, con1);
                    
                    try
                    {
                        con1.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        
                        if (reader.Read())
                        {
                            defaulttext1.Text = reader["defaulttext1"].ToString();
                            defaulttext2.Text = reader["defaulttext2"].ToString();
                            header.Text = reader["headertext"].ToString();
                            footer.Text = reader["footertext"].ToString();
                        }
                        reader.Close();

                        count++; // Increment the visitor count
                        string updateQuery = "UPDATE globalvariables SET visitorcount = @count";
                        SqlCommand updateCmd = new SqlCommand(updateQuery, con1);
                        updateCmd.Parameters.AddWithValue("@count", count);
                        updateCmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error loading content: " + ex.Message + "');</script>");
                    }
                }
            }

            // Toggle the session state for next page load
            Session["ShowFirstText"] = !showFirstText;
        }

        protected void SigninButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}