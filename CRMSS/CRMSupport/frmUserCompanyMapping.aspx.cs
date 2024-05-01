using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_frmUserCompanyMapping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                GetALlCompany();
                GetUsers();
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@UserId");
        pv.Add(Convert.ToInt32(ddlUSer.SelectedValue));

        pa.Add("@Company");
        pv.Add(ddlCompany.SelectedValue);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCompanyAllocation", true, pa, pv);

        gdvCompanyAllocation.DataBind();
    }
    public void GetALlCompany()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCompanyAllocation", true, pa, pv);

        ddlCompany.DataSource = ds.Tables[0];
        ddlCompany.DataValueField = "Company";
        ddlCompany.DataTextField = "Company";
        ddlCompany.DataBind();



    }
    public void GetUsers()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCompanyAllocation", true, pa, pv);

        ddlUSer.DataSource = ds.Tables[0];
        ddlUSer.DataValueField = "UserId";
        ddlUSer.DataTextField = "EmpNo";
        ddlUSer.DataBind();



    }

    protected void ddlUSer_SelectedIndexChanged(object sender, EventArgs e)
    {
        gdvCompanyAllocation.DataBind(); ;
    }
}