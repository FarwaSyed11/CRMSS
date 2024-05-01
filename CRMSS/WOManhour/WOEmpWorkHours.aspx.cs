using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WOManhour_WOEmpWorkHours : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                LoadDdl();
                txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                FillEmpNo();
                BindTodaysAttendance();
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }

        }
    }
    public void FillEmpNo()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(8);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);

            ddlEmpNo.DataSource = ds.Tables[0];
            ddlEmpNo.DataTextField = "EmpNo";
            ddlEmpNo.DataValueField = "EmpNo";
            ddlEmpNo.DataBind();
            ddlEmpNo.Items.Insert(0, new ListItem("--SELECT--", "-1"));


        }
        catch (Exception s)
        { }
    }
    public void FillEmpName()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(9);

            pa.Add("@Empno");
            pv.Add(ddlEmpNo.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
                txtEmpName.Text = ds.Tables[0].Rows[0]["EmpName"].ToString();
            else
                txtEmpName.Text = "";


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






        dt1 = new DataTable();
        dt1 = BindMM();

        ddlSStartMM.DataSource = dt1;
        ddlSStartMM.DataTextField = "MM";
        ddlSStartMM.DataValueField = "MM";
        ddlSStartMM.DataBind();







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
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        LoadRealeasedWO();
        mpReleasedWO.Show();


    }
    protected void gdvRleasedWO_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvRleasedWO.PageIndex = e.NewPageIndex;
        LoadRealeasedWO();
        mpReleasedWO.Show();
    }

    protected void txtItemSearch_TextChanged(object sender, EventArgs e)
    {
        LoadRealeasedWO();
        mpReleasedWO.Show();
    }
    public void LoadRealeasedWO()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@ItemCode");
        pv.Add(txtItemSearch.Text);



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);

        gdvRleasedWO.DataSource = ds.Tables[0];
        gdvRleasedWO.DataBind();
    }


    protected void gdvRleasedWO_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            FillWO(e.CommandArgument.ToString());
        }
        catch (Exception s)
        { }
    }
    public void FillWO(string WID)
    {
        DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(5);

            pa.Add("@WID");
            pv.Add(Convert.ToInt64(WID));



            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);


            if (ds.Tables[0].Rows.Count > 0)
            {
                txtWONumber.Text = ds.Tables[0].Rows[0]["WONumber"].ToString();
                txtWODescription.Text = ds.Tables[0].Rows[0]["WODescription"].ToString();
                txtItemCode.Text = ds.Tables[0].Rows[0]["Itemcode"].ToString();
                txtItemDescription.Text = ds.Tables[0].Rows[0]["ItemDescription"].ToString();
                txtQuantity.Text = ds.Tables[0].Rows[0]["QUANTITY"].ToString();
                hfdWID.Value = ds.Tables[0].Rows[0]["WID"].ToString();
                txtCompleatedQuantity.Text = ds.Tables[0].Rows[0]["CompleatedQty"].ToString();
            }
            else
            {
                txtWONumber.Text = "";
                txtWODescription.Text = "";
                txtItemCode.Text = "";
                txtItemDescription.Text = "";
                txtQuantity.Text = "";
                hfdWID.Value = "";
            }

            FillActivity();
    }
    public void FillActivity()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(6);

            pa.Add("@Itemcode");
            pv.Add(txtItemCode.Text);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);

            ddlActivity.DataSource = ds.Tables[0];
            ddlActivity.DataTextField = "ActivityName";
            ddlActivity.DataValueField = "ActivityId";
            ddlActivity.DataBind();

            ddlActivity.Items.Insert(0, new ListItem("--All--", "-1"));

            if (ds.Tables[0].Rows.Count > 0)
                getActivityDescription();
            else
                txtActivityDescription.Text = "";
        }
        catch (Exception s)
        { }
    }
    public void getActivityDescription()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(7);

        pa.Add("@ActivityId");
        pv.Add(Convert.ToInt64(ddlActivity.SelectedValue));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {

            txtActivityDescription.Text = ds.Tables[0].Rows[0][0].ToString();
            ddlSStartHH.SelectedValue = ds.Tables[0].Rows[0]["StartHH"].ToString();
            ddlSStartMM.SelectedValue = ds.Tables[0].Rows[0]["StartMM"].ToString();
        }
        else
        {
            txtActivityDescription.Text = "";
        }
    }
    protected void ddlActivity_SelectedIndexChanged(object sender, EventArgs e)
    {
        getActivityDescription();
    }
    protected void ddlEmpNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillEmpName();
        CheckExistingAttendance();
        
    }
    public void CheckExistingAttendance()
    {
        try
        {

            string FromDate = "";


            System.DateTime Fromnt = default(System.DateTime);

            string[] Startdate = new string[3];
            string[] Enddate = new string[3];

            if (txtDate.Text.Trim() != "")
            {
                Startdate = txtDate.Text.Trim().Split('/');
            }
            Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));


            FromDate = Fromnt.ToString("yyyyMMdd");

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(12);

            pa.Add("@Date");
            pv.Add(FromDate);

            pa.Add("@EmpNo");
            pv.Add(ddlEmpNo.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                FillWO(ds.Tables[0].Rows[0]["WID"].ToString());
                ddlActivity.SelectedValue = ds.Tables[0].Rows[0]["ActivityId"].ToString();
                ddlActivity.Enabled = false;
                getActivityDescription();
                rbtType.SelectedValue = "2";
                rbtType.Enabled = false;
                ddlSStartHH.SelectedValue = ds.Tables[0].Rows[0]["ENDHH"].ToString();
                ddlSStartMM.SelectedValue = ds.Tables[0].Rows[0]["ENDMM"].ToString();


            }
            else
            {

                ddlActivity.Enabled = true;
                rbtType.SelectedValue = "1";
                rbtType.Enabled = false;
                getActivityDescription();

            }
        }
        catch (Exception s)
        { }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearWoDetails();
    }
    public void ClearWoDetails()
    {
        hfdWID.Value = "";
        txtWONumber.Text = "";
        txtWODescription.Text = "";
        txtItemCode.Text = "";
        txtItemDescription.Text = "";
        txtQuantity.Text = "";
        txtCompleatedQuantity.Text = "0";
        FillActivity();

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            lblErrorMessage.Text = "";
            string FromDate = "";
          

            System.DateTime Fromnt = default(System.DateTime);
        
            string[] Startdate = new string[3];
            string[] Enddate = new string[3];

            if (txtDate.Text.Trim() != "")
            {
                Startdate = txtDate.Text.Trim().Split('/');
            }
            Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));


            FromDate = Fromnt.ToString("yyyyMMdd");


            if (hfdWID.Value == "")
            {
                lblErrorMessage.Text = "Please Select a Work Order";
                btnsearch.Focus();
                return;
            }
            else if (ddlActivity.SelectedValue == "-1")
            {
                lblErrorMessage.Text = "Please Select An Activity";
                ddlActivity.Focus();
                return;
            }
            else if (ddlEmpNo.SelectedValue == "-1")
            {
                lblErrorMessage.Text = "Please Select An Employee";
                ddlEmpNo.Focus();
                return;
            }
            else if (ddlSStartHH.SelectedValue == "00")
            {
                lblErrorMessage.Text = "Please Select Proper time";
                ddlSStartHH.Focus();
                return;
            }
            else
            {

                int UserId = Convert.ToInt32(Session["UserId"]);

                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@Oper");
                pv.Add(11);

                pa.Add("@ActivityId");
                pv.Add(Convert.ToInt64(ddlActivity.SelectedValue));

                pa.Add("@WID");
                pv.Add(Convert.ToInt64(hfdWID.Value));

                pa.Add("@EmpNo");
                pv.Add(ddlEmpNo.SelectedValue);

                pa.Add("@EmpName");
                pv.Add(txtEmpName.Text.Trim());

                pa.Add("@Date");
                pv.Add(FromDate);

                pa.Add("@Time");
                pv.Add(ddlSStartHH.SelectedValue.ToString()+ddlSStartMM.SelectedValue.ToString());

                pa.Add("@Updatedby");
                pv.Add(UserId);

                pa.Add("@type");
                pv.Add(Convert.ToInt32(rbtType.SelectedValue));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);
                if (ds.Tables.Count > 0)
                {
                    lblErrorMessage.Text = ds.Tables[0].Rows[0][0].ToString();
                }
                else
                {
                    BindTodaysAttendance();
                    FillEmpNo();
                    txtEmpName.Text = "";
                    rbtType.Enabled = true;
                }
            }


          
        }
        catch (Exception s)
        { }
    }

    protected void gdvManhourList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void gdvManhourList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(16);

            pa.Add("@WoActId");
            pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);

            BindTodaysAttendance();
        }
    }
    public void BindTodaysAttendance()
    {
        try
        {
            string FromDate = "";


            System.DateTime Fromnt = default(System.DateTime);

            string[] Startdate = new string[3];
            string[] Enddate = new string[3];

            if (txtDate.Text.Trim() != "")
            {
                Startdate = txtDate.Text.Trim().Split('/');
            }
            Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));


            FromDate = Fromnt.ToString("yyyyMMdd");


            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(10);


            pa.Add("@Date");
            pv.Add(FromDate);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);

            gdvManhourList.DataSource = ds.Tables[0];
            gdvManhourList.DataBind();

               
        }
        catch (Exception s)
        { }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            lblErrorMessage.Text = "";
            if (txtCompleatedQuantity.Text == "")
            {
                lblErrorMessage.Text = "Please Enter the Quantity";
                txtCompleatedQuantity.Focus();
                return;
            }
            else if (hfdWID.Value == "")
            {
                lblErrorMessage.Text = "Please Select the WO";
                btnsearch.Focus();
                return;
            }

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(13);

            pa.Add("@CQty");
            pv.Add(Convert.ToInt32(txtCompleatedQuantity.Text));

            pa.Add("@WID");
            pv.Add(Convert.ToInt64(hfdWID.Value));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderItemActivity", true, pa, pv);

        }
        catch (Exception s)
        { }
    }
    protected void txtDate_TextChanged(object sender, EventArgs e)
    {
        BindTodaysAttendance();
    }
}