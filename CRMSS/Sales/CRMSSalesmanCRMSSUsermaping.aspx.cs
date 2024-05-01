using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Text;

public partial class Sales_CRMSSalesmanCRMSSUsermaping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (!Page.IsPostBack)
        {
            CRMSUserDetails();
            CRMSsalesmanDetails();
            gdvList.DataBind();
        }
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
        ddlCRMSSUserList.DataSource = ds.Tables[0];
        ddlCRMSSUserList.DataValueField = "Id";
        ddlCRMSSUserList.DataTextField = "Name";
        ddlCRMSSUserList.DataBind();

    }

    protected void CRMSUserDetails()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

       

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSUserCRMSSalesmanMapping", true, pa, pv);
        ddlCRMSsalesnamList.DataSource = ds.Tables[0];
        ddlCRMSsalesnamList.DataValueField = "User_Id";
        ddlCRMSsalesnamList.DataTextField = "Name";
        ddlCRMSsalesnamList.DataBind();
    }

    protected void BtnAddDetails_Click(object sender, EventArgs e)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


            pa.Add("@Oper");
            pv.Add(2);



            pa.Add("@CRMSSUserId");
            pv.Add(ddlCRMSsalesnamList.SelectedValue);

            pa.Add("@CRMSalesmanId");
            pv.Add(ddlCRMSSUserList.SelectedValue);

          

            pa.Add("@UpdatedBy");
            pv.Add(UserId);

            pa.Add("@Status");
            pv.Add("Active");

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSUserCRMSSalesmanMapping", true, pa, pv);

            gdvList.DataBind();

        }
        catch (Exception s)
        { }
    }

    protected void gdvList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


            pa.Add("@Oper");
            pv.Add(4);

            pa.Add("@Id");
            pv.Add(Convert.ToInt32(e.CommandArgument.ToString()));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSUserCRMSSalesmanMapping", true, pa, pv);

            gdvList.DataBind();
        }
        catch (Exception s)
        { }
    }
}