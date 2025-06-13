using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webapp1
{
    public partial class login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs2"].ConnectionString;



        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            // If user is already logged in, redirect to admin page
            if (Session["user"] != null)
            {
                Response.Redirect("admin.aspx");
                return;
            }
            SqlConnection con1 = new SqlConnection(cs);
            
                string query = "select visitorcount from globalvariables";
                SqlCommand cmd = new SqlCommand(query, con1);
            
            con1.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            int count = 0;
            if (reader.Read())
            {
                count = Convert.ToInt32(reader["visitorcount"]);
                //count++; // Increment the visitor count
                         //VisitorCountLabel.Text = reader["visitorcount"].ToString();
                
                Session["VisitorCount"] = count;
                VisitorCountLabel.Text = count.ToString();
            }
            reader.Close();
           // string updateQuery = "UPDATE globalvariables SET visitorcount = @count";
            //SqlCommand updateCmd = new SqlCommand(updateQuery, con1);
            //updateCmd.Parameters.AddWithValue("@count", count);
            //updateCmd.ExecuteNonQuery();
            con1.Close();
        }

       

        //login button
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from login where username=@user and password=@pass";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@user", UserTextBox.Text);
            cmd.Parameters.AddWithValue("@pass", PassTextBox.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Session["user"] = UserTextBox.Text;
                Response.Redirect("admin.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login failed ')</script>");
            }
            con.Close();
        }
    }
}