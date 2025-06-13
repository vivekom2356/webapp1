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
    public partial class admin : System.Web.UI.Page
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
           
        }
        
        
        //save settings button
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con1 = new SqlConnection(cs1);
            string deleteQuery = "DELETE FROM admin";
            SqlCommand cmd = new SqlCommand(deleteQuery, con1);
            string query1 = "insert into admin values(@defaulttext1, @defaulttext2, @headertext,@footertext)";
            SqlCommand cmd1 = new SqlCommand(query1, con1);
            cmd1.Parameters.AddWithValue("@defaulttext1", Text1TextBox.Text);
            cmd1.Parameters.AddWithValue("@defaulttext2", Text2TextBox.Text);
            cmd1.Parameters.AddWithValue("@headertext", HeaderTextBox.Text);
            cmd1.Parameters.AddWithValue("@footertext", FooterTextBox.Text);
            con1.Open();
            // First delete existing records
            cmd.ExecuteNonQuery();
            int result1 = cmd1.ExecuteNonQuery();

            if (result1 > 0)
            {
                Response.Write("<script>alert('Settings saved successfully');</script>");
                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Write("<script>alert('Error saving settings');</script>");
            }
            con1.Close();
        }
    }
}