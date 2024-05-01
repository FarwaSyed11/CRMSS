using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RevenueUpdate_NotApplicableReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                 Session["ApplicationId"] = 1;
                hfdSummaryRowCount.Value = "50";
                btnLoadMore.Visible = false;
                GetALlCompany();
                GetManager();
                GetSalesman();
                GetSubStage();


            }
        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
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

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);

        ddlManager.DataSource = ds.Tables[0];
        ddlManager.DataValueField = "ManagerofEmployee";
        ddlManager.DataTextField = "ManagerofEmployee";
        ddlManager.DataBind();
        ddlManager.Items.Insert(0, new ListItem("ALL", "-1"));
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


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);

        ddlCompany.DataSource = ds.Tables[0];
        ddlCompany.DataValueField = "Company";
        ddlCompany.DataTextField = "Company";
        ddlCompany.DataBind();

        if (ds.Tables[0].Rows.Count > 1)
            ddlCompany.Items.Insert(0, new ListItem("ALL", "-1"));

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


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);

        ddlSalesman.DataSource = ds.Tables[0];
        ddlSalesman.DataValueField = "Name";
        ddlSalesman.DataTextField = "Name";
        ddlSalesman.DataBind();

        ddlSalesman.Items.Insert(0, new ListItem("ALL", "-1"));

    }

    public void GetSubStage()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");
        ddlSubStage.SelectedValue = "Not Applicable";
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);




        ddlSubStage.DataSource = ds.Tables[0];
        ddlSubStage.DataValueField = "SubStage";
        ddlSubStage.DataTextField = "SubStage";
        ddlSubStage.DataBind();
        ddlSubStage.Items.Insert(0, new ListItem("ALL", "-1"));
    }
    protected void gdvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetManager();
        GetSalesman();
    }
    protected void ddlManager_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetSalesman();
    }
   
    private void WriteGridData(DataTable dt)
    {


        StringBuilder sb = new StringBuilder();
        int flag = 1;






        sb.Append("<table border = '1'>");

        for (int i = 0; i < dt.Columns.Count; i++)
        {

            sb.Append("<th align='center'  style = 'background-color:  #A9CCE3;'>");

            sb.Append(dt.Columns[i].ColumnName);
            sb.Append("</th>");

        }
        sb.Append("</tr>");



        foreach (DataRow row in dt.Rows)
        {


            sb.Append("<tr>");

            for (int i = 0; i < dt.Columns.Count; i++)
            {


                if (i == 2 || i == 4 || i == 3 || i == 6 || i == 7)
                    sb.Append("<td align='left' >");
                else
                    sb.Append("<td align='center' >");

                sb.Append(row[i].ToString());

                sb.Append("</td>");


            }
            sb.Append("</tr>");
        }
        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=NotApplicable Data.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);
        Response.Output.Write(sb.ToString());
        Response.Flush();
        Response.End();

    }


	protected void lnksearch_Click(object sender, EventArgs e)
	{
        try
        {
            showDetails();
        }
        catch (Exception s) { }
    }
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



            pa.Add("@OptNumber");
            pv.Add(txtoptNumber.Text.Trim());

            pa.Add("@UserId");
            pv.Add(UserId);
            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue);

            pa.Add("@Manager");
            pv.Add(ddlManager.SelectedValue);

            pa.Add("@Salesman");
            pv.Add(ddlSalesman.SelectedValue);

            pa.Add("@SubStage");
            pv.Add(ddlSubStage.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_NotApplicableReport", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {

                WriteGridData(ds.Tables[0]);
            }
            else
            {
                Response.Write("<script>alert('There is no Records Availbe');</script>");
            }
        }
        catch (Exception s)
        { }
    }

    public void DetailView()
    {
        try
        {

            hfdSummaryRowCount.Value = "50";
            int RoleID = Convert.ToInt32(Session["Role_ID"]);
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();



            pa.Add("@OptNumber");
            pv.Add(txtoptNumber.Text.Trim());

            pa.Add("@UserId");
            pv.Add(UserId);
            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue);

            pa.Add("@Manager");
            pv.Add(ddlManager.SelectedValue);

            pa.Add("@Salesman");
            pv.Add(ddlSalesman.SelectedValue);

            pa.Add("@SubStage");
            pv.Add(ddlSubStage.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_NotApplicableReport", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                ViewState["LOAD"] = ds.Tables[0];
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "RECORDS: " + dt.Rows.Count + " OF " + ds.Tables[0].Rows.Count;
                gdvOpt.DataSource = dt;
                gdvOpt.DataBind();
                btnLoadMore.Visible = true;
            }
            else
            {
                ViewState["Load"] = null;
                lblRowCount.Text = "RECORDS 0 OF 0";
                gdvOpt.DataSource = null;
                gdvOpt.DataBind();
                btnLoadMore.Visible = false;
            }
            if (Convert.ToInt32(hfdSummaryRowCount.Value)>= ds.Tables[0].Rows.Count)
            {
                btnLoadMore.Visible = false;
            }
            else
            {
                btnLoadMore.Visible = true;
            }
        }
        catch (Exception s)
        { }
    }


    protected void lnkSearch2_Click(object sender, EventArgs e)
    {
       
            DetailView();
           
       
    }

    protected void btnLoadMore_Click(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();
        if (ViewState["LOAD"]!=null)
        {
            DataTable dt = (DataTable)ViewState["LOAD"];
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "RECORDS: " + dt.Rows.Count + " OF " + ((DataTable)ViewState["LOAD"]).Rows.Count;
            gdvOpt.DataSource = dt;
            gdvOpt.DataBind();
            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["LOAD"]).Rows.Count)
            {
                btnLoadMore.Visible = false;
            }
            else
            {
                btnLoadMore.Visible = true;
            }
        }
    }
}
