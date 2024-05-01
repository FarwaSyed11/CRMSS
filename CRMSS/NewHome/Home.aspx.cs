using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Quarantine_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (Convert.ToInt32(Session["Role_ID"].ToString())== 2043)
                {
                    Response.Redirect("~/Quarantine/EmployeeMoveOutToIsolation.aspx", false);
                }
                else if (Convert.ToInt32(Session["Role_ID"].ToString()) == 2048)
                {
                    Response.Redirect("~/Quarantine/Isolated%20Employees.aspx", false);
                }
                Getdate();
            }
            catch (Exception ex)
            {
                HttpContext.Current.ClearError();
            }
        }
    }
    public void Getdate()
    {
        string[] start = new string[3];
        DateTime vdate = new DateTime();
        
        //lbltoday.Text = System.DateTime.Today.Date.ToString("dd MMMM yyyy");
        //DBHandler DBH = new DBHandler();
        //DataSet ds = new DataSet();
        //ArrayList pa = new ArrayList();
        //ArrayList pv = new ArrayList();
        //DataTable dt = new DataTable();
        //pa = new ArrayList();
        //pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"]);


        //DBH.CreateDatasetEmployee(ds, "sp_QuarantineSummary", true, pa, pv);

        //lblCases.Text = ds.Tables[0].Rows[0][0].ToString();
        //lblRecovery.Text = ds.Tables[1].Rows[0][0].ToString();
        //lblHospitalized.Text = ds.Tables[2].Rows[0][0].ToString();
        //lblIsolated.Text = ds.Tables[3].Rows[0][0].ToString();
        //lblHome.Text = ds.Tables[4].Rows[0][0].ToString();


    }
    public void loadChart()
    {
       
    }

}