<%@ WebHandler Language="C#" Class="LOIReport" %>

using System;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

public class LOIReport : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        HttpResponse r = context.Response;
        String Company = context.Request.QueryString["Company"];
        Int64 SalesmanId = Int64.Parse(context.Request.QueryString["SalesmanId"]);
        Int64 ManagerId = Int64.Parse(context.Request.QueryString["ManagerId"]);


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add("1");


        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(ManagerId);

        pa.Add("@SalesmanId");
        pv.Add(SalesmanId);


        DBH.CreateDatasetCRMEBSDATA(ds, "SP_SalesmanLOIValue", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
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
            r.Clear();
            r.Buffer = true;
            r.AddHeader("content-disposition", "attachment;filename=LOI REPORT SUMMARY.xls");
            //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
            r.Charset = "";
            r.ContentType = "application/vnd.ms-excel";
            string style = @"<style> .textmode { } </style>";
            r.Write(style);

            r.Output.Write(sb.ToString());

            r.Flush();
            r.End();
        }

    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}