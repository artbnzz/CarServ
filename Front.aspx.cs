using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Front : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            HttpCookie ckFront = Request.Cookies["Login_Front"];
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
            conn.Open();
            SqlCommand com = new SqlCommand("SELECT * FROM Account WHERE Username=N'" + ckFront.Values["Username"] + "'", conn);
            SqlDataReader dr = com.ExecuteReader();
            dr.Read();
            if (ckFront == null)
            {
                Response.Redirect("Error.aspx");
            }
            else
            {
                lbUsername.Text = dr.GetString(1);
                lbJob.Text = dr.GetString(3);
                lbTimetoWork.Text = dr.GetString(4);
                lbName.Text = dr.GetString(5);
                lbLastname.Text = dr.GetString(6);
                lbTel.Text = dr.GetString(7);
                lbemail.Text = dr.GetString(8);
            }
        }
        catch
        {
            Response.Redirect("Error.aspx");
        }
    }

    protected void btnSignout_Click(object sender, EventArgs e)
    {
        try
        {
            HttpCookie ckFront = Request.Cookies["Login_Front"];
            ckFront.Expires = DateTime.Now;
            Response.Cookies.Add(ckFront);
            Response.Redirect("Homepage.aspx");
        }
        catch
        {

        }
    }

    protected void btnCustomerUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("Front_Customer_Update.aspx");
    }

    protected void btnCustomer_Click(object sender, EventArgs e)
    {
        Response.Redirect("Front_Customer_Add.aspx");
    }
}