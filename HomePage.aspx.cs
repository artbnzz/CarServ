using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSignin_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
        conn.Open();

        SqlCommand com = new SqlCommand("SELECT * FROM Account WHERE Username=N'" + tbxUsername.Text + "' AND Password=N'" + tbxPassword.Text + "'", conn);
        SqlDataReader dr = com.ExecuteReader();

        dr.Read();
        try
        {
            switch (dr.GetString(3))
            {
                case "พนักงานต้อนรับ":
                    HttpCookie ckFront = new HttpCookie("Login_Front");
                    ckFront.Values["Username"] = dr.GetString(1);
                    ckFront.Expires = DateTime.Now.AddMinutes(30);
                    Response.Cookies.Add(ckFront);
                    break;
                case "พนักงานซ่อม":
                    HttpCookie ckStaff = new HttpCookie("Login_Staff");
                    ckStaff.Values["Username"] = dr.GetString(1);
                    ckStaff.Expires = DateTime.Now.AddMinutes(30);
                    Response.Cookies.Add(ckStaff);
                    break;
                case "ผู้จัดการ":
                    HttpCookie ckManager = new HttpCookie("Login_Manager");
                    ckManager.Values["Username"] = dr.GetString(1);
                    ckManager.Expires = DateTime.Now.AddMinutes(30);
                    Response.Cookies.Add(ckManager);
                    break;
            }
            switch (dr.GetString(3))
            {
                case "พนักงานต้อนรับ":
                    Response.Redirect("Front.aspx");
                    break;
                case "พนักงานซ่อม":
                    Response.Redirect("Staff.aspx");
                    break;
                case "ผู้จัดการ":
                    Response.Redirect("Manager.aspx");
                    break;
            }
        }
        catch
        {
            Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('Username หรือ Password ไม่ถูกต้อง');</SCRIPT>");
            tbxCarID.Text = "";
            tbxUsername.Text = "";
            tbxPassword.Text = "";
        }
            conn.Close();
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
            conn.Open();
            SqlCommand com = new SqlCommand("SELECT * FROM Customer WHERE CarID=N'" + tbxCarID.Text + "'", conn);
            SqlDataReader dr = com.ExecuteReader();
            dr.Read();
            HttpCookie ckSearch = new HttpCookie("Search");
            ckSearch.Values["ID"] = dr.GetValue(0).ToString();
            ckSearch.Expires = DateTime.Now.AddMinutes(30);
            Response.Cookies.Add(ckSearch);
            Response.Redirect("Customer.aspx");
        }
        catch
        {
            Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('ไม่พบข้อมูลที่ค้นหา');</SCRIPT>");
            tbxCarID.Text = "";
            tbxUsername.Text = "";
            tbxPassword.Text = "";
        }
    }
}