using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Services_EconnectQuotationExportToExcel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string QtnId = Request.QueryString["QtnId"].ToString();
        Int32 Oper = int.Parse(Request.QueryString["oper"]);

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("0");

        pa.Add("@QtnHeaderNo");
        pv.Add(QtnId);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotationReport", true, pa, pv);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ExportDetails(ds.Tables[0]);
        }
    }
    private void ExportDetails(DataTable dt)
    {

        StringBuilder sb = new StringBuilder();
        int flag = 1;

        //sb.Append("<table border = '1'>");

        //for (int i = 0; i < dt.Columns.Count; i++)
        //{

        //    sb.Append("<th align='center'  style = 'background-color:  #A9CCE3;'>");

        //    sb.Append(dt.Columns[i].ColumnName);
        //    sb.Append("</th>");

        //}
        //sb.Append("</tr>");
        //foreach (DataRow row in dt.Rows)
        //{


        //    sb.Append("<tr>");

        //    for (int i = 0; i < dt.Columns.Count; i++)
        //    {


        //        sb.Append("<td align='center' >");
        //        if (row[i].ToString() == "0.00" || row[i].ToString() == "0")
        //            sb.Append("--");
        //        else
        //            sb.Append(row[i].ToString());

        //        sb.Append("</td>");


        //    }
        //    sb.Append("</tr>");
        //}
        //sb.Append("</table>");

        sb.Append("<table border = '1' style='border:solid 1px;width:100px; word-wrap:break-word;'>");
        sb.Append("<tr>");
        sb.Append("<td align='center' colspan=8 style='background-color: #bf2e1a !important;font-size:30px;font-family:Calibri;color:white'>");
        sb.Append("QUOTATION");

        sb.Append("</td>");

        sb.Append("</tr>");
        sb.Append("<tr>");
        sb.Append("<td align='left' style='font-size:18px;font-family:Calibri'>");
        sb.Append("Ref. Number :");
        sb.Append("<td align='left' colspan=4 style='font-size:18px;font-family:Calibri'>");
        sb.Append(dt.Rows[0][2].ToString());
        sb.Append("</td>");

        sb.Append("<td align='left'style='font-size:18px;font-family:Calibri'>");
        sb.Append("Date :");
        sb.Append("</td>");
        sb.Append("<td align='left' colspan=2 style='font-size:18px;font-family:Calibri'>");
        sb.Append(dt.Rows[0][4].ToString());
        sb.Append("</td>");
        sb.Append("</tr>");


        sb.Append("<tr>");
        sb.Append("<td align='left' style='font-size:18px;font-family:Calibri'>");
        sb.Append("Company :");
        sb.Append("<td align='left' colspan=4 style='font-size:18px;font-family:Calibri'>");
        sb.Append(dt.Rows[0][6].ToString());
        sb.Append("</td>");

        sb.Append("<td align='left'style='font-size:18px;font-family:Calibri'>");
        sb.Append("Project Location");
        sb.Append("</td>");
        sb.Append("<td align='left' colspan=2 style='font-size:18px;font-family:Calibri'>");
        sb.Append(dt.Rows[0][7].ToString());
        sb.Append("</td>");
        sb.Append("</tr>");


        sb.Append("<tr>");
        sb.Append("<td align='left' style='font-size:18px;font-family:Calibri'>");
        sb.Append("Contact :");
        sb.Append("<td align='left' colspan=4 style='font-size:18px;font-family:Calibri'>");
        sb.Append(dt.Rows[0][12].ToString());
        sb.Append("</td>");

        sb.Append("<td align='left'style='font-size:18px;font-family:Calibri'>");
        sb.Append("Opportunity");
        sb.Append("</td>");
        sb.Append("<td align='left' colspan=2 style='font-size:18px;font-family:Calibri'>");
        sb.Append(dt.Rows[0][5].ToString());
        sb.Append("</td>");
        sb.Append("</tr>");



        sb.Append("<tr>");
        sb.Append("<td align='left' style='font-size:18px;font-family:Calibri'>");
        sb.Append("Address :");
        sb.Append("<td align='left' colspan=7 style='font-size:18px;font-family:Calibri'>");
        sb.Append(dt.Rows[0][39].ToString());
        sb.Append("</td>");
        sb.Append("</tr>");

        sb.Append("<tr>");
        sb.Append("<td align='left' style='font-size:18px;font-family:Calibri'>");
        sb.Append("Tel :");
        sb.Append("<td align='left' colspan=7 style='font-size:18px;font-family:Calibri'>");
        sb.Append(dt.Rows[0][41].ToString());
        sb.Append("</td>");
        sb.Append("</tr>");


        sb.Append("<tr>");
        sb.Append("<td align='left' style='font-size:18px;font-family:Calibri'>");
        sb.Append("Email :");
        sb.Append("<td align='left' colspan=7 style='font-size:18px;font-family:Calibri'>");
        sb.Append(dt.Rows[0][40].ToString());
        sb.Append("</td>");
        sb.Append("</tr>");

        sb.Append("<tr>");
        sb.Append("<td align='left' style='font-size:18px;font-family:Calibri'>");
        sb.Append("Project Name :");
        sb.Append("<td align='left' colspan=7 style='font-size:18px;font-family:Calibri'>");
        sb.Append(dt.Rows[0][6].ToString());
        sb.Append("</td>");

        sb.Append("</tr>");
        sb.Append("</table>");

        sb.Append("<table border = '1' style='border:solid 1px;width:100px; word-wrap:break-word;'>");
        sb.Append("<tr style='background-color: #bf2e1a !important;color:white'>");
        sb.Append("<th align='center' style='font-size:18px;font-family:Calibri;'>");
        sb.Append("SLNO");
        sb.Append("</th>");
        sb.Append("<th align='center' style='font-size:18px;font-family:Calibri;'>");
        sb.Append("Item Code");
        sb.Append("</th>");
        sb.Append("<th align='center' style='font-size:18px;font-family:Calibri'>");
        sb.Append("DESCRIPTION");
        sb.Append("</th>");

        sb.Append("<th align='center' style='font-size:18px;font-family:Calibri'>");
        sb.Append("MODEL");
        sb.Append("</th>");

        sb.Append("<th align='center' style='font-size:18px;font-family:Calibri'>");
        sb.Append("QTY");
        sb.Append("</th>");

        sb.Append("<th align='center' style='font-size:18px;font-family:Calibri'>");
        sb.Append("UNIT");
        sb.Append("</th>");

        sb.Append("<th align='center' style='font-size:18px;font-family:Calibri'>");
        sb.Append("UNIT RATE");
        sb.Append("</th>");

        sb.Append("<th align='center' style='font-size:18px;font-family:Calibri'>");
        sb.Append("TOTAL AMOUNT");
        sb.Append("</th>");
        sb.Append("</tr>");


        foreach (DataRow row in dt.Rows)
        {


            sb.Append("<tr style=color:black>");

            for (int i = 0; i < dt.Columns.Count; i++)
            {
                if (i == 29 || i == 23 || i == 24 || i == 25 || i == 30 || i == 26 || i == 27 || i == 28)
                {

                    sb.Append("<td align='center' >");
                    if (row[i].ToString() == "0.00" || row[i].ToString() == "0")
                        sb.Append("");
                    else
                        sb.Append(row[i].ToString());

                    sb.Append("</td>");

                }


            }
            sb.Append("</tr>");
        }


        sb.Append("</table>");

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Quotation.xls");
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