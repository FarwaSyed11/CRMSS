using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_frmDropDownValues : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                gdvDropDownListValues.DataBind();
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }

        }
    }
    protected void ddlDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        gdvDropDownListValues.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
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

                pa.Add("@DropdownName");
                pv.Add(ddlDropDownList.SelectedValue);

                pa.Add("@DataTextValue");
                pv.Add(txtValue.Text);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_QtnDropDownListValues", true, pa, pv);

                gdvDropDownListValues.DataBind();
                txtValue.Text = "";
            
            }
            catch (Exception s)
            { }
        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
}