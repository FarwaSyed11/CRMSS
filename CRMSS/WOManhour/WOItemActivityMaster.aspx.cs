using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WOManhour_WOItemActivityMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                LoadDdl();
                LoadActivies();
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }

        }
    }
    public void LoadActivies()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(14);

          


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);

            txtActivityName.DataSource = ds.Tables[0];
            txtActivityName.DataTextField = "ActivityName";
            txtActivityName.DataValueField = "Id";
            txtActivityName.DataBind();
            GetActivityDescription();
        }
        catch (Exception s)
        { }
    }
    public void GetActivityDescription()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(15);

            pa.Add("@WoActId");
            pv.Add(Convert.ToInt64(txtActivityName.SelectedValue));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);

            txtActivityDescription.Text = ds.Tables[0].Rows[0]["ActivityDescription"].ToString();

        }
        catch (Exception s)
        { }
    }
    protected void txtItemCode_TextChanged(object sender, EventArgs e)
    {
        try
        {
            lblerrorMessage.Text = "";
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(0);



            pa.Add("@Itemcode");
            pv.Add(txtItemCode.Text.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtItemDescription.Text = ds.Tables[0].Rows[0]["ItemDescription"].ToString();
            
            }
            else
                lblerrorMessage.Text = "Please Enter the Correct Item Code";

            gdvActivityDetails.DataBind();
        }
        catch (Exception s)
        { }
    }
    public void LoadDdl()
    {
        DataTable dt1 = BindHour();
        ddlSStartHH.DataSource = dt1;
        ddlSStartHH.DataTextField = "Hr";
        ddlSStartHH.DataValueField = "Hr";
        ddlSStartHH.DataBind();

        ddlSEndHH.DataSource = dt1;
        ddlSEndHH.DataTextField = "Hr";
        ddlSEndHH.DataValueField = "Hr";
        ddlSEndHH.DataBind();




        dt1 = new DataTable();
        dt1 = BindMM();

        ddlSStartMM.DataSource = dt1;
        ddlSStartMM.DataTextField = "MM";
        ddlSStartMM.DataValueField = "MM";
        ddlSStartMM.DataBind();

        ddlSEndMM.DataSource = dt1;
        ddlSEndMM.DataTextField = "MM";
        ddlSEndMM.DataValueField = "MM";
        ddlSEndMM.DataBind();


        


    }
    public DataTable BindHour()
    {
        DataTable dt = new DataTable();
        dt.Clear();
        dt.Columns.Add("Hr");


        for (int k = 0; k <= 23; k++)
        {
            DataRow dr = dt.NewRow();
            dr["Hr"] = k.ToString("00");
            dt.Rows.Add(dr);
        }
        return dt;

    }
    public DataTable BindMM()
    {
        DataTable dt = new DataTable();
        dt.Clear();
        dt.Columns.Add("MM");


        for (int k = 0; k <= 59; k++)
        {
            DataRow dr = dt.NewRow();
            dr["MM"] = k.ToString("00");
            dt.Rows.Add(dr);
        }

        return dt;
    }
    protected void ddlSStartHH_SelectedIndexChanged(object sender, EventArgs e)
    {
        calTotalHours();
    }
    protected void ddlSStartMM_SelectedIndexChanged(object sender, EventArgs e)
    {
        calTotalHours();
    }
    protected void ddlSEndHH_SelectedIndexChanged(object sender, EventArgs e)
    {
        calTotalHours();
    }
    protected void ddlSEndMM_SelectedIndexChanged(object sender, EventArgs e)
    {
        calTotalHours();
    }
    public void calTotalHours()
    {
        try
        {



            if (Convert.ToInt32(ddlSStartHH.SelectedValue) > Convert.ToInt32(ddlSEndHH.SelectedValue))
            {
                DateTime a = new DateTime(2022, 01, 01, Convert.ToInt32(ddlSStartHH.SelectedValue), Convert.ToInt32(ddlSStartMM.SelectedValue), 00);
                DateTime b = new DateTime(2022, 01, 01, Convert.ToInt32(ddlSEndHH.SelectedValue), Convert.ToInt32(ddlSEndMM.SelectedValue), 00);
                //txtFlexi.Text = Convert.ToString(Convert.ToInt32((b.Subtract(a).TotalMinutes) / 60)).PadLeft(2, '0') + ':' + Convert.ToString((b.Subtract(a).TotalMinutes) % 60).PadRight(2, '0');
                txtTotal.Text = Convert.ToString(b.Subtract(a).Hours.ToString("00") + ":" + b.Subtract(a).Minutes.ToString("00"));


            }
            else
            {
                DateTime a = new DateTime(2022, 01, 01, Convert.ToInt32(ddlSStartHH.SelectedValue), Convert.ToInt32(ddlSStartMM.SelectedValue), 00);
                DateTime b = new DateTime(2022, 01, 01, Convert.ToInt32(ddlSEndHH.SelectedValue), Convert.ToInt32(ddlSEndMM.SelectedValue), 00);
                //txtFlexi.Text = Convert.ToString(Convert.ToInt32((b.Subtract(a).TotalMinutes) / 60)).PadLeft(2, '0') + ':' + Convert.ToString((b.Subtract(a).TotalMinutes) % 60).PadRight(2, '0');
                txtTotal.Text = Convert.ToString(b.Subtract(a).Hours.ToString("00") + ":" + b.Subtract(a).Minutes.ToString("00"));

            }


        }
        catch
        {
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            lblerrorMessage.Text = "";
            if (txtActivityName.Text == "")
            {
                lblerrorMessage.Text = "Please Enter the Activity Name";
                txtActivityName.Focus();
                return;
            }
            else  if (txtItemDescription.Text == "")
                {
                    lblerrorMessage.Text = "Please Enter the Proper Item Code";
                    txtItemCode.Focus();
                    return;
                }
           
        
             int UserId = Convert.ToInt32(Session["UserId"]);

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(2);



            pa.Add("@Itemcode");
            pv.Add(txtItemCode.Text.Trim());

            pa.Add("@ActivityName");
            pv.Add(txtActivityName.SelectedItem.Text.Trim());

            pa.Add("@ActivityDescription");
            pv.Add(txtActivityDescription.Text.Trim());

            pa.Add("@StarTime");
            pv.Add(ddlSStartHH.SelectedValue.Trim()+":"+ddlSStartMM.SelectedValue);

            pa.Add("@Endtime");
            pv.Add(ddlSEndHH.SelectedValue+":"+ddlSEndMM.SelectedValue);

            pa.Add("@totalHours");
            pv.Add(txtTotal.Text.Trim());

            pa.Add("@CreatedBy");
            pv.Add(UserId);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);

            gdvActivityDetails.DataBind();

            txtActivityName.Text = "";
            txtActivityDescription.Text = "";
            ddlSEndHH.SelectedValue = "00";
            ddlSEndMM.SelectedValue = "00";
            ddlSStartHH.SelectedValue = "00";
            ddlSStartMM.SelectedValue = "00";
            calTotalHours();

        }
        catch (Exception s)
        { }
    }
    protected void gdvActivityDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            int UserId = Convert.ToInt32(Session["UserId"]);
            lblerrorMessage.Text = "";
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(3);

            pa.Add("@ActivityId");
            pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

            pa.Add("@CreatedBy");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);

            gdvActivityDetails.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void txtActivityName_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetActivityDescription();
    }
    protected void btnAddActivity_Click(object sender, EventArgs e)
    {
        MpDropdownvalues.Show();
    }
    protected void btnSaveDropDownValues_Click(object sender, EventArgs e)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@ActivityName");
        pv.Add(txtDropDownvalues.Text.Trim());


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_WOActivities", true, pa, pv);

        LoadActivies();
        txtActivityName.SelectedItem.Text = txtDropDownvalues.Text.Trim();

        txtDropDownvalues.Text = "";
        
    }
}