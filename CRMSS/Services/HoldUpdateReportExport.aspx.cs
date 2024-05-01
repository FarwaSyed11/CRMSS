using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Services_HoldUpdateReportExport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Company = Convert.ToString(Request.QueryString["Company"]);
        Int64 Manager = Int64.Parse(Request.QueryString["Manager"]);
        Int64 marketing = Int64.Parse(Request.QueryString["marketing"]);
        int oper = int.Parse(Request.QueryString["oper"]);

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(oper);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@Manager");
        pv.Add(Manager);

        pa.Add("@MarketingId");
        pv.Add(marketing);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTHOLDUpdateReport", true, pa, pv);
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (oper == 0)
                ExportSummary(ds.Tables[0]);
            else
                ExportDetails(ds.Tables[0]);
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
        Response.AddHeader("content-disposition", "attachment;filename=HOLD update Summary Report.xls");
        //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);

        Response.Output.Write(sb.ToString());


        Response.End();


    }

    private void ExportDetails(DataTable dt)
    {

        StringBuilder sb = new StringBuilder();
        int flag = 1;

        sb.Append("<table border = '1'>");

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            if (i < 12)
                sb.Append("<th align='center'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:150px'>");
            else
                sb.Append("<th align='center'  style = 'background-color:  #10309C;height:50px;color: #ffffff;width:150px'>");

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

                if (i == 11)
                {
                    if (row[i].ToString().ToUpper() == "NEVER UPDATED")
                        sb.Append("<td align='center' style='background-color:red;'>");
                    else if (row[i].ToString().ToUpper() == "UPDATED")
                        sb.Append("<td align='center' style='background-color:green;'>");
                    else if (row[i].ToString().ToUpper() == "NOT UPDATED")
                        sb.Append("<td align='center' style='background-color:yellow;'>");
                    else
                        sb.Append("<td align='center' style='background-color: #023020;color:white'>");

                }
                else if (i > 11)
                {
                    if (row[i].ToString().ToUpper() == "APPROVED")
                        sb.Append("<td align='center' style='background-color:#15AC08;'>");
                    else if (row[i].ToString().ToUpper() == "NOT APPROVED")
                        sb.Append("<td align='center' style='background-color:#AC0808;'>");
                    else if (row[i].ToString().ToUpper() == "SPECS")
                        sb.Append("<td align='center' style='background-color:#4B89E8;'>");
                    else
                        sb.Append("<td align='center' style='background-color: #E3EAEB;'>");
                }
                else
                    sb.Append("<td align='center' style='background-color: #E3EAEB;'>");



                if (row[i].ToString() == "-1" && i == 8)
                    sb.Append("");
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
        Response.AddHeader("content-disposition", "attachment;filename=HOLD Update Detailed Report With VL.xls");
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