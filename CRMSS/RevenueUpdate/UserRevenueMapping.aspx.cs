using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RevenueUpdate_UserRevenueMapping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GetUsers();
            CRMSsalesmanDetails();
        }
    }
    public void GetUsers()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMUserSalesmanAllocation", true, pa, pv);

        ddlPTUsers.DataSource = ds.Tables[0];
        ddlPTUsers.DataValueField = "UserId";
        ddlPTUsers.DataTextField = "EmpNo";
        ddlPTUsers.DataBind();



    }
    protected void CRMSsalesmanDetails()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSUserCRMSSalesmanMapping", true, pa, pv);
        ddlSalesman.DataSource = ds.Tables[0];
        ddlSalesman.DataValueField = "Id";
        ddlSalesman.DataTextField = "Name";
        ddlSalesman.DataBind();

    }
    protected void btnSaveData_Click(object sender, EventArgs e)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(1);

            pa.Add("@SalesmanId");
            pv.Add(ddlSalesman.SelectedValue);

            pa.Add("@SalesmanName");
            pv.Add(ddlSalesman.SelectedItem.Text.Trim());

            pa.Add("@UserId");
            pv.Add(ddlPTUsers.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMUserSalesmanAllocation", true, pa, pv);
            gdvAllocatedSalesman.DataBind();
            CRMSsalesmanDetails();


        }
        catch (Exception)
        { }
    }
    protected void btnAddRole_Click(object sender, EventArgs e)
    {
        MpSalesman.Show();
    }

    protected void ddlPTUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        gdvAllocatedSalesman.DataBind();
    }
}