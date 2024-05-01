using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_frmEBSCRMSalesmanMapping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

               
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
    protected void gdvSalesman_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvSalesman.PageIndex = e.NewPageIndex;
        gdvSalesman.DataBind();

    }
 
  
    protected void gdvSalesman_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            string[] CommandArguments = e.CommandArgument.ToString().Split(';');

                hfdMappedId.Value = CommandArguments[0].ToString();
                txtSalesRepId.Text = CommandArguments[1].ToString();
                txtResourceId.Text = CommandArguments[2].ToString();
                txtSalesmanName.Text = CommandArguments[3].ToString();
                txtTeamName.Text = CommandArguments[4].ToString();
                txtCRMSalesmanId.Text = CommandArguments[5].ToString();
                txtCRMSalesmanName.Text = CommandArguments[6].ToString();
                mpEditDetails.Show();
            
        }
    }

   
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("2");

            pa.Add("@MappedId");
            pv.Add(Convert.ToInt64(hfdMappedId.Value));

            pa.Add("@SALESREP_ID");
            pv.Add(Convert.ToInt64(txtSalesRepId.Text.Trim()));

            pa.Add("@RESOURCE_ID");
            pv.Add(Convert.ToInt64(txtResourceId.Text.Trim()));

            pa.Add("@Sales_Name");
            pv.Add(txtSalesmanName.Text);

            pa.Add("@TeamName");
            pv.Add(txtTeamName.Text);

            pa.Add("@CRMSalesmanId");
            pv.Add(Convert.ToInt64(txtCRMSalesmanId.Text.Trim()));

            pa.Add("@CRMSalesmanName");
            pv.Add(txtCRMSalesmanName.Text);



            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMEBSalesmanMapping", true, pa, pv);

           
            gdvSalesman.DataBind();
        }
        catch (Exception s)
        { }
    }
}