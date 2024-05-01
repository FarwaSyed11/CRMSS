﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Services_MarketingJOHUpdateReportExport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String Company = Convert.ToString(Request.QueryString["Company"]);
        Int64 MarketingId = Int64.Parse(Request.QueryString["MarketingId"]);
        Int64 ManagerId = Int64.Parse(Request.QueryString["ManagerId"]);
        Int32 Oper = int.Parse(Request.QueryString["oper"]);

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(Oper);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@ManagerId");
        pv.Add(ManagerId);

        pa.Add("@MarketingId");
        pv.Add(MarketingId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MarketingJOHUpdateSummaryReport", true, pa, pv);
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (Oper == 0)
                ExportSummary(ds.Tables[0]);
            else
                ExportDetailsNew(ds);
        }

    }
    private void ExportSummary(DataTable dt)
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

    private void ExportDetailsNew(DataSet ds)
    {
        DataTable dt = ds.Tables[0];
        DataTable dt1 = ds.Tables[1];
        StringBuilder sb = new StringBuilder();
        int flag = 1;


        sb.Append("<table border = '1'>");
        //sb.Append("<tr>");
        //sb.Append("<th colspan=40 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
        //sb.Append("</th>");
        //foreach (DataRow dr in dt1.Rows)
        //{
        //    sb.Append("<th  align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
        //    sb.Append(dr[0].ToString());
        //    sb.Append("</th>");
        //}
        //sb.Append("</tr>");
        sb.Append("<tr>");

        for (int i = 1; i < 41; i++)
        {
            if (i < 22)
            {
                sb.Append("<th align='center'  style = 'background-color:  #093770;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 26)
            {
                sb.Append("<th align='center'  style = 'background-color:  #74767A;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 30)
            {
                sb.Append("<th align='center'  style = 'background-color:  #579ED9;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 34)
            {
                sb.Append("<th align='center'  style = 'background-color:  #3A67B0;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 38)
            {
                sb.Append("<th align='center'  style = 'background-color:  #B87932;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 41)
            {
                sb.Append("<th align='center'  style = 'background-color:#A3A300;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
        }

        for (int products = 0; products < dt1.Rows.Count; products++)
        {
            
              
                    sb.Append("<th align='center'  style = 'background-color:  #32B89F;height:50px;color: #ffffff;width:100px;font-size:12'>");
                    sb.Append(dt1.Rows[products][0].ToString());
                    sb.Append("</th>");
               
              
            
        }


        sb.Append("</tr>");
        int rowindex = 0;
        string optnumberold = "";
        string optNumberNew = "";
        foreach (DataRow row in dt.Rows)
        {
            optNumberNew = row["OPT #"].ToString();
            if (optnumberold != optNumberNew )
            {
                optnumberold = optNumberNew;

                sb.Append("<tr>");

                for (int i = 1; i < 44; i++)
                {
                    if (i == 18)
                        sb.Append("<td align='right' style='background-color: #125E1F;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 19)
                        sb.Append("<td align='right' style='background-color: #47734F;font-size:12;font-weight:bold;color:black'>");
                    else if (i == 20)
                        sb.Append("<td align='right' style='background-color: #D91414;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 21)
                        sb.Append("<td align='right' style='background-color: #919191;font-size:12;font-weight:bold;color:white'>");
                    else if (i < 41)
                        sb.Append("<td align='center'>");
                    else if(i==43)
                        sb.Append("<td align='center'>");

                    if (i != 41 && i != 42)
                    {
                        sb.Append(row[i].ToString());
                        sb.Append("</td>");
                    }

                }

            }
            else
            {
                sb.Append("<td align='center'>");

                sb.Append(row[43].ToString());
                sb.Append("</td>");


            }
            if (Convert.ToInt32(row["Orderlevel"].ToString()) == dt1.Rows.Count)
            {
                sb.Append("</tr>");

            }




            rowindex++;
        }
        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Marketing JOH update Detailed Report.xls");
        //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);

        Response.Output.Write(sb.ToString());

        Response.Flush();
        Response.End();

    }
}