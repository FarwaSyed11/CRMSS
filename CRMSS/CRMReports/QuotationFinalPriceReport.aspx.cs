using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection;
using System.Text;

public partial class CRMReports_QuotationFinalPriceReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                GetALlCompany();
                GetManager();
                GetSalesman();
             

            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
    public void LoadEMployee()
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@USERID");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ActionTask", true, pa, pv);

        OwnerName.DataSource = ds.Tables[0];
        OwnerName.DataTextField = "Employee";
        OwnerName.DataValueField = "Employee_Number";
        OwnerName.DataBind();
        OwnerName.Multiple = true;
    }
    public void GetALlCompany()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@UserId");
        pv.Add(UserId);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LocalSalesFinalpriceReport", true, pa, pv);

        ddlCompany.DataSource = ds.Tables[0];
        ddlCompany.DataValueField = "Company";
        ddlCompany.DataTextField = "Company";
        ddlCompany.DataBind();

        if (ds.Tables[0].Rows.Count > 1)
            ddlCompany.Items.Insert(0, new ListItem("ALL", "-1"));

    }

    public void GetManager()
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@Company");
        pv.Add(ddlCompany.SelectedValue);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LocalSalesFinalpriceReport", true, pa, pv);

        ddlManager.DataSource = ds.Tables[0];
        ddlManager.DataValueField = "ManagerofEmployee";
        ddlManager.DataTextField = "ManagerofEmployee";
        ddlManager.DataBind();
        ddlManager.Items.Insert(0, new ListItem("ALL", "-1"));

    }

    public void GetSalesman()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@Company");
        pv.Add(ddlCompany.SelectedValue);

        pa.Add("@manager");
        pv.Add(ddlManager.SelectedValue);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LocalSalesFinalpriceReport", true, pa, pv);

        ddlSalesman.DataSource = ds.Tables[0];
        ddlSalesman.DataValueField = "Name";
        ddlSalesman.DataTextField = "Name";
        ddlSalesman.DataBind();

        ddlSalesman.Items.Insert(0, new ListItem("ALL", "-1"));

    }


    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetManager();
    }

    protected void ddlManager_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetSalesman();
    }


    protected void BtnClear_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {

            int RoleID = Convert.ToInt32(Session["Role_ID"]);
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("3");

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue);

            pa.Add("@Manager");
            pv.Add(ddlManager.SelectedValue);

            pa.Add("@Salesman");
            pv.Add(ddlSalesman.SelectedValue);

            pa.Add("@Overview");
            pv.Add(ddlOverview.SelectedValue);

            pa.Add("@OptNumber");
            pv.Add(txtoptNumber.Text.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_LocalSalesFinalpriceReport", true, pa, pv);

            gdvQtnFinalPriceReport.DataSource = ds.Tables[0];
            gdvQtnFinalPriceReport.DataBind();


        }
        catch (Exception s)
        { }
    }

    protected void gdvQtnFinalPriceReport_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Action")
        {

            LoadEMployee();
            hfdOpportunity.Value = e.CommandArgument.ToString();

            MDlocalsalesTaskAction.Show();
            ActionTaskGridView();
            Clearfld();
        }

        if (e.CommandName == "ViewMore")
        {

            string OpportunityNumber = e.CommandArgument.ToString();

            MdMoreViewMdMoreView.Show();


            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("4");

            pa.Add("@OptNumber");
            pv.Add(OpportunityNumber);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_LocalSalesFinalpriceReport", true, pa, pv);

            GdvViewMore.DataSource = ds.Tables[0];
            GdvViewMore.DataBind();

        }

    }



    //protected void gdvQtnFinalPriceReport_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    gdvQtnFinalPriceReport.PageIndex = e.NewPageIndex;
    //    showDetails();
    //}

    public void showDetails()
    {
        try
        {

            int RoleID = Convert.ToInt32(Session["Role_ID"]);
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("3");

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue);

            pa.Add("@Manager");
            pv.Add(ddlManager.SelectedValue);

            pa.Add("@Salesman");
            pv.Add(ddlSalesman.SelectedValue);

            pa.Add("@Overview");
            pv.Add(ddlOverview.SelectedValue);

            pa.Add("@OptNumber");
            pv.Add(txtoptNumber.Text.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_LocalSalesFinalpriceReport", true, pa, pv);

            gdvQtnFinalPriceReport.DataSource = ds.Tables[0];
            gdvQtnFinalPriceReport.DataBind();


        }
        catch (Exception s)
        { }
    }

    protected void BtnAddTask_Click(object sender, EventArgs e)
    {
        MDlocalsalesTaskAction.Show();
        Clearfld();
        ActionTaskGridView();
    }

    protected void BtnSubmitTask_Click(object sender, EventArgs e)
    {
        try
        {

            lblError.Text = "";
            if (txtowntxtdisc.Text == "")
            {

                lblError.Text = "Please Enter The Task";
                MDlocalsalesTaskAction.Show();
                return;

            }

            else if (txtDueDate.Text == "")
            {

                lblError.Text = "Please Enter The Duedate";
                MDlocalsalesTaskAction.Show();
                return;

            }
            //ActionTaskGridView();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

            pa.Add("@Oper");
            pv.Add(1);

            pa.Add("@OwnerName");
            pv.Add(OwnerName.Value);

            pa.Add("@Description");
            pv.Add(txtowntxtdisc.Text.Trim());

            pa.Add("@Priority");
            pv.Add(ddlTaskPriority.SelectedValue);


            pa.Add("@DueDate");
            pv.Add(txtDueDate.Text.ToString());

            pa.Add("@Remarks");
            pv.Add(txtRemarks.Text.Trim());


            pa.Add("@AssignedBy");
            pv.Add(UserId);

            pa.Add("@Type");
            pv.Add("Opportunity");

            pa.Add("@Path");
            pv.Add("../CRMReports/QuotationFinalPriceReport.aspx");

            pa.Add("@ReferenceNo");
            pv.Add(hfdOpportunity.Value);

            pa.Add("@Status");
            pv.Add("PENDING");

            DBHandler DBH = new DBHandler();
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ActionTask", true, pa, pv);

            MDlocalsalesTaskAction.Show();
            Clearfld();
            ActionTaskGridView();
        }

        catch (Exception s)
        { }
    }

    public void Clearfld()
    {


        txtowntxtdisc.Text = "";
        ddlTaskPriority.SelectedValue = "";
        txtDueDate.Text = "";
        txtRemarks.Text = "";
        OwnerName.Value = "";




    }

    public void ActionTaskGridView()
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@Path");
        pv.Add("../CRMReports/QuotationFinalPriceReport.aspx");

        pa.Add("@ReferenceNo");
        pv.Add(hfdOpportunity.Value);


        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ActionTask", true, pa, pv);


        GdvActionTask.DataSource = ds.Tables[0];
        GdvActionTask.DataBind();
    }

    private void WriteGridData(DataTable dt)
    {


        StringBuilder sb = new StringBuilder();
        int flag = 1;

      


        sb.Append("<table border = '1'>");

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            if(i<9)
                sb.Append("<th align='center'  style = 'background-color:  #341b5f;color:white'>");
            else if(i<12)
                sb.Append("<th align='center'  style = 'background-color:  #888787;color:white'>");
            else if (i < 16)
                sb.Append("<th align='center'  style = 'background-color:  #369;color:white'>");
            else if (i < 20)
                sb.Append("<th align='center'  style = 'background-color:  #99cccc;color:white'>");
            else
                sb.Append("<th align='center'  style = 'background-color:  #69c;color:white'>");

            sb.Append(dt.Columns[i].ColumnName);
            sb.Append("</th>");

        }
        sb.Append("</tr>");



        foreach (DataRow row in dt.Rows)
        {


            sb.Append("<tr>");

            for (int i = 0; i < dt.Columns.Count; i++)
            {


              
                    sb.Append("<td align='center' >");

                sb.Append(row[i].ToString());

                sb.Append("</td>");


            }
            sb.Append("</tr>");
        }
        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Final Price Report .xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);
        Response.Output.Write(sb.ToString());
        Response.Flush();
        Response.End();

    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        int RoleID = Convert.ToInt32(Session["Role_ID"]);
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@Company");
        pv.Add(ddlCompany.SelectedValue);

        pa.Add("@Manager");
        pv.Add(ddlManager.SelectedValue);

        pa.Add("@Salesman");
        pv.Add(ddlSalesman.SelectedValue);

        pa.Add("@Overview");
        pv.Add(ddlOverview.SelectedValue);

        pa.Add("@OptNumber");
        pv.Add(txtoptNumber.Text.Trim());

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LocalSalesFinalpriceReport", true, pa, pv);

        if(ds.Tables[0].Rows.Count>0)
            WriteGridData(ds.Tables[0]);

    }
}