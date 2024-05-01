﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text;


public partial class CRMReports_MarketingJOHUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                BindCompany();
                BindManager();
                Bindmarketing();
            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
    protected void lbtExport_Click(object sender, EventArgs e)
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Company");
            pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@userid");
            pv.Add(UserId);

            pa.Add("@ManagerId");
            pv.Add(ddlManager.SelectedValue);

            pa.Add("@MarketingId");
            pv.Add(Convert.ToInt64(ddlMarketing.SelectedValue));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MarketingJOHUpdateSummaryReport", true, pa, pv);
            if (ds.Tables[0].Rows.Count > 0)
                ExportDetails(ds.Tables[0]);


        }
        catch (Exception s)
        { }
    }
    protected void ddlMarketing_SelectedIndexChanged(object sender, EventArgs e)
    {
        gdvJOHUpdateReport.DataBind();
    }
    protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindManager();
        Bindmarketing();
    }
    private void ExportDetails(DataTable dt)
    {

        StringBuilder sb = new StringBuilder();
        int flag = 1;

        sb.Append("<table border = '1'>");

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            if (i == 0)
                sb.Append("<th align='center'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:300px'>");
            else
                sb.Append("<th align='center'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:150px'>");

            sb.Append(dt.Columns[i].ColumnName);
            sb.Append("</th>");

        }
        sb.Append("</tr>");
        int rowindex = 0;
        foreach (DataRow row in dt.Rows)
        {


            sb.Append("<tr>");

            for (int i = 0; i < dt.Columns.Count; i++)
            {

                if (rowindex % 2 == 0)
                    sb.Append("<td align='center' style='background-color: #ffffff;'>");
                else
                    sb.Append("<td align='center' style='background-color: #E3EAEB;'>");

                if (row[i].ToString() == "0.00" || row[i].ToString() == "0")
                    sb.Append("--");
                else
                    sb.Append(row[i].ToString());

                sb.Append("</td>");


            }
            rowindex++;
            sb.Append("</tr>");
        }
        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Marketing JOH Update Summary.xls");
        //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);

        Response.Output.Write(sb.ToString());

        Response.Flush();
        Response.End();

    }

    protected void ddlManager_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bindmarketing();
    }
    public void BindCompany()
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("0");

            pa.Add("@userid");
            pv.Add(UserId);


            DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

            ddlOrganization.DataSource = ds.Tables[0];
            ddlOrganization.DataTextField = "company";
            ddlOrganization.DataValueField = "company";
            ddlOrganization.DataBind();

        }
        catch (Exception s)
        { }
    }
    public void BindManager()
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("1");

            pa.Add("@userid");
            pv.Add(UserId);

            pa.Add("@Company");
            pv.Add(ddlOrganization.SelectedValue);


            pa.Add("@Type");
            pv.Add("MARKETING");



            DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

            ddlManager.DataSource = ds.Tables[0];
            ddlManager.DataTextField = "Name";
            ddlManager.DataValueField = "EmployeeRowID";
            ddlManager.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlManager.Items.Insert(0, new ListItem("ALL", "-1"));

        }
        catch (Exception s)
        { }
    }
    public void Bindmarketing()
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("2");

            pa.Add("@userid");
            pv.Add(UserId);

            pa.Add("@Company");
            pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@manager");
            pv.Add(ddlManager.SelectedValue);

            pa.Add("@Type");
            pv.Add("MARKETING");



            DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

            ddlMarketing.DataSource = ds.Tables[0];
            ddlMarketing.DataTextField = "Name";
            ddlMarketing.DataValueField = "EmployeeRowID";
            ddlMarketing.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlMarketing.Items.Insert(0, new ListItem("ALL", "-1"));

        }
        catch (Exception s)
        { }
    }

}