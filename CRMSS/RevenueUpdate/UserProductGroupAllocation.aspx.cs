using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_UserProductGroupAllocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                GetALlProductGroup();
                GetQuotationUsers();
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
        pv.Add("6");

        pa.Add("@UserId");
        pv.Add(Convert.ToInt32(ddlUSer.SelectedValue));

        pa.Add("@ProducType");
        pv.Add(ddlProductGroup.SelectedValue);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationEntry", true, pa, pv);

        gdvProductGroupAllocation.DataBind();


        
    }
    public void GetQuotationUsers()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationEntry", true, pa, pv);

        ddlUSer.DataSource = ds.Tables[0];
        ddlUSer.DataValueField = "UserId";
        ddlUSer.DataTextField = "EmpNo";
        ddlUSer.DataBind();



    }

    public void GetALlProductGroup()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationEntry", true, pa, pv);

        ddlProductGroup.DataSource = ds.Tables[0];
        ddlProductGroup.DataValueField = "ProductType";
        ddlProductGroup.DataTextField = "ProductType";
        ddlProductGroup.DataBind();



    }

    protected void ddlUSer_SelectedIndexChanged(object sender, EventArgs e)
    {
        gdvProductGroupAllocation.DataBind();
    }
    protected void gdvProductGroupAllocation_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("10");
        pa.Add("@Id");
        pv.Add(Convert.ToInt32(e.CommandArgument.ToString()));


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationEntry", true, pa, pv);

        gdvProductGroupAllocation.DataBind();
    }
}