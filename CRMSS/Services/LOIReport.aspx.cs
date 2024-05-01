using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Services_LOIReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String Company = Convert.ToString(Request.QueryString["Company"]);
        Int64 SalesmanId = Int64.Parse(Request.QueryString["SalesmanId"]);
        Int64 ManagerId = Int64.Parse(Request.QueryString["ManagerId"]);
        Int32 Oper = int.Parse(Request.QueryString["oper"]);

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(Oper);


        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(ManagerId);

        pa.Add("@SalesmanId");
        pv.Add(SalesmanId);


        DBH.CreateDatasetCRMEBSDATA(ds, "SP_SalesmanLOIValue", true, pa, pv);
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (Oper == 1)
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
        Response.AddHeader("content-disposition", "attachment;filename=LOI REPORT.xls");
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
        DataTable dt1 = ds.Tables[1];
        StringBuilder sb = new StringBuilder();
        int flag = 1;


        sb.Append("<table border = '1'>");
        sb.Append("<tr>");
        sb.Append("<th colspan=38 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
        sb.Append("</th>");
        foreach (DataRow dr in dt1.Rows)
        {
            sb.Append("<th colspan=15 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
            sb.Append(dr[0].ToString());
            sb.Append("</th>");
        }
        sb.Append("</tr>");
        sb.Append("<tr>");

        for (int i = 1; i < 39; i++)
        {
            if (i < 20)
            {
                sb.Append("<th align='center'  style = 'background-color:  #093770;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 24)
            {
                sb.Append("<th align='center'  style = 'background-color:  #74767A;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 28)
            {
                sb.Append("<th align='center'  style = 'background-color:  #579ED9;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 32)
            {
                sb.Append("<th align='center'  style = 'background-color:  #3A67B0;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 36)
            {
                sb.Append("<th align='center'  style = 'background-color:  #B87932;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 39)
            {
                sb.Append("<th align='center'  style = 'background-color:#A3A300;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
        }

        for (int products = 0; products < dt1.Rows.Count; products++)
        {
            for (int i = 43; i < dt.Rows.Count; i++)
            {
                if (i < 48)//rev starting
                {
                    sb.Append("<th align='center'  style = 'background-color:  #32B89F;height:50px;color: #ffffff;width:60px;font-size:10'>");
                    sb.Append(dt.Columns[i].ColumnName);
                    sb.Append("</th>");
                }
                else if (i < 53)
                {
                    sb.Append("<th align='center'  style = 'background-color:  #80CED9;height:50px;color: #ffffff;width:60px;font-size:10'>");
                    sb.Append(dt.Columns[i].ColumnName);
                    sb.Append("</th>");
                }
                else if (i < 57)
                {
                    sb.Append("<th align='center'  style = 'background-color:  #579ED9;height:50px;color: #ffffff;width:60px;font-size:10'>");
                    sb.Append(dt.Columns[i].ColumnName);
                    sb.Append("</th>");
                }
                else if (i == 57)
                {
                    sb.Append("<th align='center'  style = 'background-color:  #31C44A;height:50px;color: #ffffff;width:60px;font-size:10'>");
                    sb.Append(dt.Columns[i].ColumnName);
                    sb.Append("</th>");
                }
            }
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

                for (int i = 1; i < 39; i++)
                {
                    if (i == 16)
                        sb.Append("<td align='right' style='background-color: #125E1F;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 17)
                        sb.Append("<td align='right' style='background-color: #47734F;font-size:12;font-weight:bold;color:black'>");
                    else if (i == 18)
                        sb.Append("<td align='right' style='background-color: #D91414;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 19)
                        sb.Append("<td align='right' style='background-color: #919191;font-size:12;font-weight:bold;color:white'>");
                    else
                        sb.Append("<td align='center'>");

                    sb.Append(row[i].ToString());
                    sb.Append("</td>");
                }
            }


            for (int i = 43; i < dt.Columns.Count; i++)
            {
                if ((i > 42 && row[43].ToString().ToUpper() == "NO_SALE"))
                    sb.Append("<td align='center' style='background-color: #CED10D;font-size:10;font-weight:bold;color:white'>");
                else if (i > 42 && row[43].ToString().ToUpper() == "WON")
                    sb.Append("<td align='center' style='background-color: #17B312;font-size:10;font-weight:bold;color:white'>");
                else if (i > 42 && row[43].ToString().ToUpper() == "LOST")
                    sb.Append("<td align='center' style='background-color: #CF0808;font-size:10;font-weight:bold;color:white'>");

                else if (i > 42 && row[43].ToString().ToUpper() == "OPEN")
                {
                    if (i == 44 && (row[44].ToString().ToUpper() == "CONTRACT" || row[44].ToString().ToUpper() == "LOI" || row[44].ToString().ToUpper() == "LPO"))
                        sb.Append("<td align='center' style='background-color: #17B312;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 44 && (row[44].ToString().ToUpper() == "ESTIMATION"))
                        sb.Append("<td align='center' style='background-color: #CF7208;font-size:10;font-weight:bold;color:white'>");
                    else if (i == 44 && (row[44].ToString().ToUpper() == "PENDING LOST"))
                        sb.Append("<td align='center' style='background-color: #CF0808;font-size:10;font-weight:bold;color:white'>");
                    else if (i == 44 && (row[44].ToString().ToUpper() == "OTHERS"))
                        sb.Append("<td align='center' style='background-color: #0837CF;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 44 && (row[44].ToString().ToUpper() == "NOT QUOTED"))
                        sb.Append("<td align='center' style='background-color: #FF4242;font-size:10;font-weight:bold;color:white'>");
                    else if (i == 44 && (row[44].ToString().ToUpper() == "WITH OTHERS"))
                        sb.Append("<td align='center' style='background-color: #424CFF;font-size:10;font-weight:bold;color:white'>");
                    else if (i == 44 && (row[44].ToString().ToUpper() == "NOT APPLICABLE"))
                        sb.Append("<td align='center' style='background-color: #F9FF42;font-size:10;font-weight:bold;color:white'>");
                    else
                        sb.Append("<td align='center' style='background-color:white ;font-size:10;font-weight:bold;color:black'>");
                }
                else
                    sb.Append("<td align='center'>");

                sb.Append(row[i].ToString());
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
        Response.AddHeader("content-disposition", "attachment;filename=LOI DETAIL REPORT.xls");
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