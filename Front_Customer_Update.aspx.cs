using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class staff_car_changestatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                btnSave.Visible = false;
                btnDelete.Visible = false;
                btnResearch.Visible = false;
                Calendar1.Visible = false;
                lbacceptcar.Visible = false;
                lblastname.Visible = false;
                lbname.Visible = false;
                lbstatus.Visible = false;
                lbtel.Visible = false;
                tbxCaraccept.Visible = false;
                ddlstatus.Visible = false;
                tbxLastname.Visible = false;
                tbxName.Visible = false;
                tbxtel.Visible = false;
                btncalendar.Visible = false;
            }
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
            }
        }
        catch
        {
            Response.Redirect("Error.aspx");
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
        conn.Open();
        SqlCommand com = new SqlCommand("SELECT * FROM Customer WHERE CarID=N'"+ tbxCarid.Text +"'", conn);
        SqlDataReader dr = com.ExecuteReader();
        dr.Read();
        try
        {
            if(btnSave.Visible == false)
            {
                RequiredFieldValidator1.Visible = true;
                RequiredFieldValidator3.Visible = true;
                RequiredFieldValidator4.Visible = true;
                RequiredFieldValidator5.Visible = true;
                RequiredFieldValidator6.Visible = true;
                tbxCarid.ReadOnly = true;
                btnSearch.Visible = false;
                btnSave.Visible = true;
                btnDelete.Visible = true;
                btnResearch.Visible = true;
                Calendar1.Visible = false;
                lbacceptcar.Visible = true;
                lblastname.Visible = true;
                lbname.Visible = true;
                lbstatus.Visible = true;
                lbtel.Visible = true;
                tbxCaraccept.Visible = true;
                ddlstatus.Visible = true;
                tbxLastname.Visible = true;
                tbxName.Visible = true;
                tbxtel.Visible = true;
                btncalendar.Visible = true;
            }
            else{}
            tbxName.Text = dr.GetString(1);
            tbxLastname.Text = dr.GetString(2);
            tbxtel.Text = dr.GetString(3);
            tbxCarid.Text = dr.GetString(4);
            ddlstatus.SelectedValue = dr.GetString(5);
            tbxCaraccept.Text = dr.GetString(6);
        }
        catch
        {
            Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('ไม่พบข้อมูล');</SCRIPT>");
            if (btnSave.Visible == true)
            {
                RequiredFieldValidator1.Visible = false;
                RequiredFieldValidator3.Visible = false;
                RequiredFieldValidator4.Visible = false;
                RequiredFieldValidator5.Visible = false;
                RequiredFieldValidator6.Visible = false;
                tbxCarid.ReadOnly = false;
                btnSearch.Visible = true;
                btnResearch.Visible = false;
                btnSave.Visible = false;
                btnDelete.Visible = false;
                Calendar1.Visible = false;
                lbacceptcar.Visible = false;
                lblastname.Visible = false;
                lbname.Visible = false;
                lbstatus.Visible = false;
                lbtel.Visible = false;
                tbxCaraccept.Visible = false;
                ddlstatus.Visible = false;
                tbxLastname.Visible = false;
                tbxName.Visible = false;
                tbxtel.Visible = false;
                btncalendar.Visible = false;
            }
            else { }
            tbxName.Text = "";
            tbxLastname.Text = "";
            tbxCaraccept.Text = "";
            tbxtel.Text = "";
            tbxCarid.Text = "";
            tbxCaraccept.Text = "";
            ddlstatus.Items.FindByValue("0");
        }
        //4. ปิดการเชื่อมต่อ
        conn.Close();
    }

    protected void btnCustomer_Click(object sender, EventArgs e)
    {
        Response.Redirect("Front_Customer_Add.aspx");
    }

    protected void btnCustomerUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("Front_Customer_Update.aspx");
    }

    protected void btnSignout_Click(object sender, EventArgs e)
    {
        try
        {
            HttpCookie ckFront = Request.Cookies["Login_Front"];
            ckFront.Expires = DateTime.Now;
            Response.Cookies.Add(ckFront);
            Response.Redirect("HomePage.aspx");
        }
        catch
        {
            Response.Redirect("HomePage.aspx");
        }
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        tbxCaraccept.Text = Calendar1.SelectedDate.ToLongDateString();
        Calendar1.Visible = false;
    }

    protected void btncalendar_Click(object sender, EventArgs e)
    {
        if (Calendar1.Visible == false)
        {
            Calendar1.Visible = true;
        }
        else
        {
            Calendar1.Visible = false;
        }
    }

    protected void tbxCaraccept_TextChanged(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
            conn.Open();
            SqlCommand com = new SqlCommand("UPDATE Customer SET Name=N'"+ tbxName.Text +"',Lastname=N'"+ tbxLastname.Text +"',Tel=N'"+ tbxtel.Text +"',CarID=N'"+ tbxCarid.Text +"',Status=N'"+ ddlstatus.SelectedValue +"',DateAccept=N'"+ tbxCaraccept.Text +"' WHERE CarID=N'"+ tbxCarid.Text +"' ", conn);
            int row = com.ExecuteNonQuery();
            conn.Close();
            Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('บันทึกข้อมูลสำเร็จ');</SCRIPT>");
            if (btnSave.Visible == true)
            {
                tbxCarid.ReadOnly = false;
                btnSearch.Visible = true;
                btnResearch.Visible = false;
                btnSave.Visible = false;
                btnDelete.Visible = false;
                Calendar1.Visible = false;
                lbacceptcar.Visible = false;
                lblastname.Visible = false;
                lbname.Visible = false;
                lbstatus.Visible = false;
                lbtel.Visible = false;
                tbxCaraccept.Visible = false;
                ddlstatus.Visible = false;
                tbxLastname.Visible = false;
                tbxName.Visible = false;
                tbxtel.Visible = false;
                btncalendar.Visible = false;
            }
            else { }
            tbxName.Text = "";
            tbxLastname.Text = "";
            tbxCaraccept.Text = "";
            tbxtel.Text = "";
            tbxCarid.Text = "";
            tbxCaraccept.Text = "";
            ddlstatus.Items.FindByValue("0");
        }
        catch
        {
            Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('เกิดข้อผิดพลาดไม่สามารถเชื่อมต่อฐานข้อมูลได้');</SCRIPT>");
            if (btnSave.Visible == true)
            {
                RequiredFieldValidator1.Visible = false;
                RequiredFieldValidator3.Visible = false;
                RequiredFieldValidator4.Visible = false;
                RequiredFieldValidator5.Visible = false;
                RequiredFieldValidator6.Visible = false;
                tbxCarid.ReadOnly = true;
                btnSearch.Visible = true;
                btnResearch.Visible = false;
                btnSave.Visible = false;
                btnDelete.Visible = false;
                Calendar1.Visible = false;
                lbacceptcar.Visible = false;
                lblastname.Visible = false;
                lbname.Visible = false;
                lbstatus.Visible = false;
                lbtel.Visible = false;
                tbxCaraccept.Visible = false;
                ddlstatus.Visible = false;
                tbxLastname.Visible = false;
                tbxName.Visible = false;
                tbxtel.Visible = false;
                btncalendar.Visible = false;
            }
            else { }
            tbxName.Text = "";
            tbxLastname.Text = "";
            tbxCaraccept.Text = "";
            tbxtel.Text = "";
            tbxCarid.Text = "";
            tbxCaraccept.Text = "";
            ddlstatus.Items.FindByValue("0");
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
            conn.Open();
            SqlCommand com = new SqlCommand("DELETE FROM Customer WHERE CarID=N'" + tbxCarid.Text + "'", conn);
            int row = com.ExecuteNonQuery();
            conn.Close();
            Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('ลบข้อมูลสำเร็จ');</SCRIPT>");
            if (btnSave.Visible == true)
            {
                RequiredFieldValidator1.Visible = false;
                RequiredFieldValidator3.Visible = false;
                RequiredFieldValidator4.Visible = false;
                RequiredFieldValidator5.Visible = false;
                RequiredFieldValidator6.Visible = false;
                tbxCarid.ReadOnly = false;
                btnSearch.Visible = true;
                btnResearch.Visible = false;
                btnSave.Visible = false;
                btnDelete.Visible = false;
                Calendar1.Visible = false;
                lbacceptcar.Visible = false;
                lblastname.Visible = false;
                lbname.Visible = false;
                lbstatus.Visible = false;
                lbtel.Visible = false;
                tbxCaraccept.Visible = false;
                ddlstatus.Visible = false;
                tbxLastname.Visible = false;
                tbxName.Visible = false;
                tbxtel.Visible = false;
                btncalendar.Visible = false;
            }
            else { }
            tbxName.Text = "";
            tbxLastname.Text = "";
            tbxCaraccept.Text = "";
            tbxtel.Text = "";
            tbxCarid.Text = "";
            tbxCaraccept.Text = "";
            ddlstatus.Items.FindByValue("0");
        }
        catch
        {
            Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('เกิดข้อผิดพลาดไม่สามารถเชื่อมต่อฐานข้อมูลได้');</SCRIPT>");
            if (btnSave.Visible == true)
            {
                RequiredFieldValidator1.Visible = false;
                RequiredFieldValidator3.Visible = false;
                RequiredFieldValidator4.Visible = false;
                RequiredFieldValidator5.Visible = false;
                RequiredFieldValidator6.Visible = false;
                tbxCarid.ReadOnly = true;
                btnSearch.Visible = true;
                btnResearch.Visible = false;
                btnSave.Visible = false;
                btnDelete.Visible = false;
                Calendar1.Visible = false;
                lbacceptcar.Visible = false;
                lblastname.Visible = false;
                lbname.Visible = false;
                lbstatus.Visible = false;
                lbtel.Visible = false;
                tbxCaraccept.Visible = false;
                ddlstatus.Visible = false;
                tbxLastname.Visible = false;
                tbxName.Visible = false;
                tbxtel.Visible = false;
                btncalendar.Visible = false;
            }
            else { }
            tbxName.Text = "";
            tbxLastname.Text = "";
            tbxCaraccept.Text = "";
            tbxtel.Text = "";
            tbxCarid.Text = "";
            tbxCaraccept.Text = "";
            ddlstatus.Items.FindByValue("0");
        }
    }

    protected void btnResearch_Click(object sender, EventArgs e)
    {
        try
        {
            if (btnSave.Visible == true)
            {
                RequiredFieldValidator1.Visible = false;
                RequiredFieldValidator3.Visible = false;
                RequiredFieldValidator4.Visible = false;
                RequiredFieldValidator5.Visible = false;
                RequiredFieldValidator6.Visible = false;
                tbxCarid.ReadOnly = false;
                btnSearch.Visible = true;
                btnResearch.Visible = false;
                btnSave.Visible = false;
                btnDelete.Visible = false;
                Calendar1.Visible = false;
                lbacceptcar.Visible = false;
                lblastname.Visible = false;
                lbname.Visible = false;
                lbstatus.Visible = false;
                lbtel.Visible = false;
                tbxCaraccept.Visible = false;
                ddlstatus.Visible = false;
                tbxLastname.Visible = false;
                tbxName.Visible = false;
                tbxtel.Visible = false;
                btncalendar.Visible = false;
            }
            else { }
            tbxName.Text = "";
            tbxLastname.Text = "";
            tbxCaraccept.Text = "";
            tbxtel.Text = "";
            tbxCarid.Text = "";
            tbxCaraccept.Text = "";
            ddlstatus.Items.FindByValue("0");
        }
        catch
        {
        }
    }
}