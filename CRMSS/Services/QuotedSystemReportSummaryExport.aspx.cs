using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Metadata.Edm;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Services_QuotedSystemReportSummaryExport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
            string Company = Convert.ToString(Request.QueryString["Company"]);
            Int64 SalesmanId = Int64.Parse(Request.QueryString["Salesman"]);
            Int64 ManagerId = Int64.Parse(Request.QueryString["Manager"]);
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

            pa.Add("@ManagerId");
            pv.Add(ManagerId);

            pa.Add("@SalesmanId");
            pv.Add(SalesmanId);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotedSystemReport", true, pa, pv);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (oper == 1)
                    ExportSummary(ds);
                else
                    ExportDetailsNew(ds);
            }
        }
        private void ExportSummary(DataSet ds)
        {

            StringBuilder sb = new StringBuilder();
            int flag = 1;

            DataTable dt = ds.Tables[0];
            DataTable dt1 = ds.Tables[1];

            sb.Append("<table border = '1'>");
            sb.Append("<tr>");
            sb.Append("<th colspan=10 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
            sb.Append("</th>");
            sb.Append("<th colspan=9 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
            sb.Append(dt1.Rows[0][0].ToString());
            sb.Append("</th>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            for (int i = 0; i < dt.Columns.Count; i++)
            {
                if (i < 10)
                    sb.Append("<th align='center'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:90px;font-size:10'>");
                else
                    sb.Append("<th align='center'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:60px;font-size:10'>");
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

                    if (i == 4)
                        sb.Append("<td align='right' style='background-color: #32A84C;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 5)
                        sb.Append("<td align='right' style='background-color: #93E660;font-size:12;font-weight:bold;color:black'>");
                    else if (i == 6)
                        sb.Append("<td align='right' style='background-color: #AD1C1E;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 7)
                        sb.Append("<td align='right' style='background-color: #F22C2C;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 8)
                        sb.Append("<td align='right' style='background-color: #9C1616;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 9)
                        sb.Append("<td align='right' style='background-color: #969696;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 10)
                        sb.Append("<td align='center' style='background-color: #32A84C;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 11)
                        sb.Append("<td align='center' style='background-color: #93E660;font-size:12;font-weight:bold;color:black'>");
                    else if (i == 12)
                        sb.Append("<td align='center' style='background-color: #AD1C1E;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 13)
                        sb.Append("<td align='center' style='background-color: #F22C2C;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 14)
                        sb.Append("<td align='center' style='background-color: #348BAD;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 15)
                        sb.Append("<td align='center' style='background-color: #BDBD13;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 16)
                        sb.Append("<td align='center' style='background-color: #093770;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 17)
                        sb.Append("<td align='center' style='background-color: #969696;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 18)
                        sb.Append("<td align='center' style='background-color: #F22C2C;font-size:12;font-weight:bold;color:white'>");

                    else
                        sb.Append("<td align='center' style='background-color: #E3EAEB;font-size:10'>");

                    //if (row[i].ToString() == "0.00" || row[i].ToString() == "0")
                    //    sb.Append("--");
                    //else
                    sb.Append(row[i].ToString());

                    sb.Append("</td>");


                }
                rowindex++;
                sb.Append("</tr>");
            }
            sb.Append("</table>");
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Quoted System Summary Report.xls");
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
            sb.Append("<tr>");
            sb.Append("<th colspan=40 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
            sb.Append("</th>");
            foreach (DataRow dr in dt1.Rows)
            {
                sb.Append("<th colspan=15 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
                sb.Append(dr[0].ToString());
                sb.Append("</th>");
            }
            sb.Append("</tr>");
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
                for (int i = 45; i < dt.Rows.Count; i++)
                {
                    if (i < 50)//rev starting
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #32B89F;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName);
                        sb.Append("</th>");
                    }
                    else if (i < 55)
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #80CED9;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName);
                        sb.Append("</th>");
                    }
                    else if (i < 59)
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #579ED9;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName);
                        sb.Append("</th>");
                    }
                    else if (i == 59)
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

                    for (int i = 1; i < 41; i++)
                    {
                        if (i == 18)
                            sb.Append("<td align='right' style='background-color: #125E1F;font-size:12;font-weight:bold;color:white'>");
                        else if (i == 19)
                            sb.Append("<td align='right' style='background-color: #47734F;font-size:12;font-weight:bold;color:black'>");
                        else if (i == 20)
                            sb.Append("<td align='right' style='background-color: #D91414;font-size:12;font-weight:bold;color:white'>");
                        else if (i == 21)
                            sb.Append("<td align='right' style='background-color: #919191;font-size:12;font-weight:bold;color:white'>");
                        else
                            sb.Append("<td align='center'>");

                        sb.Append(row[i].ToString());
                        sb.Append("</td>");
                    }
                }


                for (int i = 45; i < dt.Columns.Count; i++)
                {
                    if ((i > 44 && row[45].ToString().ToUpper() == "NO_SALE"))
                        sb.Append("<td align='center' style='background-color: #CED10D;font-size:10;font-weight:bold;color:white'>");
                    else if (i > 44 && row[45].ToString().ToUpper() == "WON")
                        sb.Append("<td align='center' style='background-color: #17B312;font-size:10;font-weight:bold;color:white'>");
                    else if (i > 44 && row[45].ToString().ToUpper() == "LOST")
                        sb.Append("<td align='center' style='background-color: #CF0808;font-size:10;font-weight:bold;color:white'>");

                    else if (i > 44 && row[45].ToString().ToUpper() == "OPEN")
                    {
                        if (i == 46 && (row[46].ToString().ToUpper() == "CONTRACT" || row[46].ToString().ToUpper() == "LOI" || row[46].ToString().ToUpper() == "LPO"))
                            sb.Append("<td align='center' style='background-color: #17B312;font-size:12;font-weight:bold;color:white'>");
                        else if (i == 46 && (row[46].ToString().ToUpper() == "ESTIMATION"))
                            sb.Append("<td align='center' style='background-color: #CF7208;font-size:10;font-weight:bold;color:white'>");
                        else if (i == 46 && (row[46].ToString().ToUpper() == "PENDING LOST"))
                            sb.Append("<td align='center' style='background-color: #CF0808;font-size:10;font-weight:bold;color:white'>");
                        else if (i == 46 && (row[46].ToString().ToUpper() == "OTHERS"))
                            sb.Append("<td align='center' style='background-color: #0837CF;font-size:12;font-weight:bold;color:white'>");
                        else if (i == 46 && (row[46].ToString().ToUpper() == "NOT QUOTED"))
                            sb.Append("<td align='center' style='background-color: #FF4242;font-size:10;font-weight:bold;color:white'>");
                        else if (i == 46 && (row[46].ToString().ToUpper() == "WITH OTHERS"))
                            sb.Append("<td align='center' style='background-color: #424CFF;font-size:10;font-weight:bold;color:white'>");
                        else if (i == 46 && (row[46].ToString().ToUpper() == "NOT APPLICABLE"))
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
            Response.AddHeader("content-disposition", "attachment;filename=Detailed Quoted System Report.xls");
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