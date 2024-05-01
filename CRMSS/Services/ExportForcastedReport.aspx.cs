using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Services_ExportForcastedReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String Company = Convert.ToString(Request.QueryString["Company"]);
        Int64 SalesmanId = Int64.Parse(Request.QueryString["SalesmanId"]);
        Int64 ManagerId = Int64.Parse(Request.QueryString["ManagerId"]);
        Int32 month = int.Parse(Request.QueryString["month"]);
        Int32 quarter = int.Parse(Request.QueryString["quarter"]);
        Int32 Oper = int.Parse(Request.QueryString["oper"]);

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(Oper);


        //pa.Add("@oper");
        //pv.Add("0");

        //pa.Add("@UserId");
        //pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(ManagerId);

        pa.Add("@SalesmanId");
        pv.Add(SalesmanId);

        pa.Add("@Quarter");
        pv.Add(quarter);

        pa.Add("@Month");
        pv.Add(month);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportForecastedReport", true, pa, pv);
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (Oper == 1)
                ExportSummary(ds);
            else 
                ExportDetailsNew(ds);
           
        }

    }

    private void ExportSummary(DataSet ds)
    {
        DataTable dtmonths = ds.Tables[1];
        DataTable dt = ds.Tables[0];


        StringBuilder sb = new StringBuilder();
        int flag = 1;
        int colspan = (dtmonths.Rows.Count * 6) + 2;
        sb.Append("<table border = '1'>");
        sb.Append("<tr>");
        sb.Append("<th align='center' colspan='" + colspan + "'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:300px'>");
        sb.Append("</th>");
        sb.Append("</tr>");
        sb.Append("<tr>");
        sb.Append("<th align='center' rowspan='2'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:200px'>");
        sb.Append("MANAGER");
        sb.Append("</th>");
        sb.Append("<th align='center' rowspan='2'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:200px'>");
        sb.Append("SALESMAN");
        sb.Append("</th>");
        for (int i = 0; i < dtmonths.Rows.Count; i++)
        {
            sb.Append("<th align='center' colspan=6 style = 'background-color:  #a92828;height:50px;color: #ffffff'>");
            sb.Append(dtmonths.Rows[i][0].ToString());
            sb.Append("</th>");
        }
        sb.Append("</tr>");
        sb.Append("<tr>");
        for (int i = 0; i < dtmonths.Rows.Count; i++)
        {
            sb.Append("<th align='center'  style = 'background-color:  gray;height:50px;color: #ffffff;width:80px'>");
            sb.Append("FORECAST AMOUNT");
            sb.Append("</th>");

            sb.Append("<th align='center'  style = 'background-color:  #1EB058;height:50px;color: #ffffff;width:80px'>");
            sb.Append("WON");
            sb.Append("</th>");

            sb.Append("<th align='center'  style = 'background-color:  #65E10D;height:50px;color: #ffffff;width:80px'>");
            sb.Append("OPEN LOI");
            sb.Append("</th>");

            sb.Append("<th align='center'  style = 'background-color:  #0D71E1;height:50px;color: #ffffff;width:80px'>");
            sb.Append("OPEN");
            sb.Append("</th>");

            sb.Append("<th align='center'  style = 'background-color:  #E1410D;height:50px;color: #ffffff;width:80px'>");
            sb.Append("LOST");
            sb.Append("</th>");

            sb.Append("<th align='center'  style = 'background-color:  #C2D512;height:50px;color: #ffffff;width:80px'>");
            sb.Append("NO SALE");
            sb.Append("</th>");
        }


        int rowindex = 0;
        foreach (DataRow row in dt.Rows)
        {
            if (row["MonthN"].ToString() == dtmonths.Rows[0][0].ToString())
            {
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td align='center' style='background-color: #ffffff;'>");
                sb.Append(row["Manager"].ToString());
                sb.Append("</td>");
                sb.Append("<td align='center' style='background-color: #ffffff;'>");
                sb.Append(row["Salesman"].ToString());
                sb.Append("</td>");
            }

            for (int i = 5; i < dt.Columns.Count; i++)
            {


                sb.Append("<td align='center' style='background-color: #E3EAEB;'>");
                sb.Append(row[i].ToString());
                sb.Append("</td>");


            }
            rowindex++;

        }
        sb.Append("</tr>");
        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=FORECASTED SUMMARY REPORT.xls");
        //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);

        Response.Output.Write(sb.ToString());


        Response.End();


    }
    private void ExportDetailsNew(DataSet ds)
    {

        DataTable dt = ds.Tables[0];

        StringBuilder sb = new StringBuilder();
        int flag = 1;


        sb.Append("<table border = '1'>");
        sb.Append("<tr>");
        sb.Append("<th colspan=40 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
        sb.Append("</th>");

        sb.Append("</tr>");
        sb.Append("<tr>");

        for (int i = 1; i < 21; i++)
        {
            if (i < 13)
            {
                sb.Append("<th align='center'  style = 'background-color:  #093770;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 18)
            {
                sb.Append("<th align='center'  style = 'background-color:  #74767A;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 21)
            {
                sb.Append("<th align='center'  style = 'background-color:  #579ED9;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            //else if (i < 23)
            //{
            //    sb.Append("<th align='center'  style = 'background-color:  #3A67B0;height:50px;color: #ffffff;width:60px;font-size:10'>");
            //    sb.Append(dt.Columns[i].ColumnName);
            //    sb.Append("</th>");
            //}

        }




        sb.Append("</tr>");
        int rowindex = 0;
        string optnumberold = "";
        string optNumberNew = "";
        foreach (DataRow row in dt.Rows)
        {
            optNumberNew = row["OPT #"].ToString();
            if (optnumberold != optNumberNew || rowindex == 0)
            {
                optnumberold = optNumberNew;

                sb.Append("<tr>");

                for (int i = 1; i < 21; i++)
                {
                    if (i == 18)
                        sb.Append("<td align='right' style='background-color: #fffff;font-size:12;font-weight:bold;color:black'>");
                    else if (i == 19)
                        sb.Append("<td align='right' style='background-color: #fffff;font-size:12;font-weight:bold;color:black'>");
                    else if (i == 20)
                        sb.Append("<td align='right' style='background-color: #fffff;font-size:12;font-weight:bold;color:black'>");
                    else if (i == 21)
                        sb.Append("<td align='right' style='background-color: #919191;font-size:12;font-weight:bold;color:white'>");
                    else
                        sb.Append("<td align='center'>");

                    sb.Append(row[i].ToString());
                    sb.Append("</td>");
                }
            }






            rowindex++;
        }
        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Sales OPT Updated Detailed Report.xls");
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



