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
using System.Windows.Documents;
using System.Windows.Input;
using ZXing;

public partial class Services_QuotedSystemReportExport : System.Web.UI.Page
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
            else if (oper == 0)
            {
                ExportSummaryasView(ds);
            }
            else
            {
                ExportDetailsNew(ds);
            }
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
        foreach (DataRow dr in dt1.Rows)
        {
            sb.Append("<th colspan=9 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
            sb.Append(dr[0].ToString());
            sb.Append("</th>");
        }
      
        sb.Append("</tr>");
        sb.Append("<tr>");
        for (int i = 0; i < 10; i++)
        {
            sb.Append("<th align='center'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:60px;font-size:10'>");
            sb.Append(dt.Columns[i].ColumnName);
            sb.Append("</th>");

        }
        for (int i = 0; i < dt1.Rows.Count; i++)
        {
            for (int j = 12; j < dt.Columns.Count; j++)
            {
                sb.Append("<th align='center'  style = 'background-color:  #808080;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[j].ColumnName);
                sb.Append("</th>");
            }
               

        }

        sb.Append("</tr>");



        int rowindex = 0;
        string salesmanOLd = "";
        string salesmanNew = "";
        foreach (DataRow row in dt.Rows)
        {
            salesmanNew = row["Salesman"].ToString();
            if (salesmanOLd != salesmanNew || rowindex == 0)
            {
                salesmanOLd = salesmanNew;

                sb.Append("<tr>");

                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    if (i != 10 && i != 11)
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
                        else if (i == 12)
                            sb.Append("<td align='center' style='background-color: #32A84C;font-size:12;font-weight:bold;color:white'>");
                        else if (i == 13)
                            sb.Append("<td align='center' style='background-color: #93E660;font-size:12;font-weight:bold;color:black'>");
                        else if (i == 14)
                            sb.Append("<td align='center' style='background-color: #AD1C1E;font-size:12;font-weight:bold;color:white'>");
                        else if (i == 15)
                            sb.Append("<td align='center' style='background-color: #F22C2C;font-size:12;font-weight:bold;color:white'>");
                        else if (i == 16)
                            sb.Append("<td align='center' style='background-color: #348BAD;font-size:12;font-weight:bold;color:white'>");
                        else if (i == 17)
                            sb.Append("<td align='center' style='background-color: #BDBD13;font-size:12;font-weight:bold;color:white'>");
                        else if (i == 18)
                            sb.Append("<td align='center' style='background-color: #093770;font-size:12;font-weight:bold;color:white'>");
                        else if (i == 19)
                            sb.Append("<td align='center' style='background-color: #969696;font-size:12;font-weight:bold;color:white'>");
                        else if (i == 20)
                            sb.Append("<td align='center' style='background-color: #F22C2C;font-size:12;font-weight:bold;color:white'>");
                        else
                            sb.Append("<td align='center'>");

                        sb.Append(row[i].ToString());
                        sb.Append("</td>");
                    }
                }



            }
            else
            {
                for (int i = 12; i < dt.Columns.Count; i++)
                {
                    if (i == 12)
                        sb.Append("<td align='center' style='background-color: #32A84C;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 13)
                        sb.Append("<td align='center' style='background-color: #93E660;font-size:12;font-weight:bold;color:black'>");
                    else if (i == 14)
                        sb.Append("<td align='center' style='background-color: #AD1C1E;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 15)
                        sb.Append("<td align='center' style='background-color: #F22C2C;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 16)
                        sb.Append("<td align='center' style='background-color: #348BAD;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 17)
                        sb.Append("<td align='center' style='background-color: #BDBD13;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 18)
                        sb.Append("<td align='center' style='background-color: #093770;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 19)
                        sb.Append("<td align='center' style='background-color: #969696;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 20)
                        sb.Append("<td align='center' style='background-color: #F22C2C;font-size:12;font-weight:bold;color:white'>");
                    else
                        sb.Append("<td align='center'>");

                    sb.Append(row[i].ToString());
                    sb.Append("</td>");
                }
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
        sb.Append("<th colspan=39 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
        sb.Append("</th>");
        sb.Append("<th colspan=3 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
        sb.Append("Salesman Action Plan");
        sb.Append("</th>");
        sb.Append("<th colspan=3 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
        sb.Append("Manager Action Plan");
        sb.Append("</th>");
        sb.Append("<th colspan=3 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
        sb.Append("Marketing Action Plan");
        sb.Append("</th>");
        sb.Append("<th colspan=3 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
        sb.Append("Forecast Details");
        sb.Append("</th>");
        foreach (DataRow dr in dt1.Rows)
        {
            sb.Append("<th colspan=22 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
            sb.Append(dr[0].ToString());
            sb.Append("</th>");
        }
       
        sb.Append("</tr>");
        sb.Append("<tr>");

        for (int i = 1; i < 52; i++)
        {
            if (i < 25)
            {
                sb.Append("<th align='center'  style = 'background-color:  #093770;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 28)
            {
                sb.Append("<th align='center'  style = 'background-color:  #74767A;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 32)
            {
                sb.Append("<th align='center'  style = 'background-color:  #579ED9;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 36)
            {
                sb.Append("<th align='center'  style = 'background-color:  #3A67B0;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 40)
            {
                sb.Append("<th align='center'  style = 'background-color:  #B87932;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
            else if (i < 52)
            {
                sb.Append("<th align='center'  style = 'background-color:#A3A300;height:50px;color: #ffffff;width:60px;font-size:10'>");
                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }
        }

        for (int products = 0; products < dt1.Rows.Count; products++)
        {
            for (int i = 56; i < dt.Rows.Count; i++)
            {
                if (i < 61)//rev starting
                {
                    sb.Append("<th align='center'  style = 'background-color:  #32B89F;height:50px;color: #ffffff;width:60px;font-size:10'>");
                    sb.Append(dt.Columns[i].ColumnName);
                    sb.Append("</th>");
                }
                else if (i < 66)
                {
                    sb.Append("<th align='center'  style = 'background-color:  #80CED9;height:50px;color: #ffffff;width:60px;font-size:10'>");
                    sb.Append(dt.Columns[i].ColumnName);
                    sb.Append("</th>");
                }
                else if (i < 70)
                {
                    sb.Append("<th align='center'  style = 'background-color:  #579ED9;height:50px;color: #ffffff;width:60px;font-size:10'>");
                    sb.Append(dt.Columns[i].ColumnName);
                    sb.Append("</th>");
                }
                else if (i == 70)
                {
                    sb.Append("<th align='center'  style = 'background-color:  #31C44A;height:50px;color: #ffffff;width:60px;font-size:10'>");
                    sb.Append(dt.Columns[i].ColumnName);
                    sb.Append("</th>");
                }
                else if (i == 71)
                {
                    sb.Append("<th align='center'  style = 'background-color:  #31C44A;height:50px;color: #ffffff;width:60px;font-size:10'>");
                    sb.Append(dt.Columns[i].ColumnName);
                    sb.Append("</th>");
                }
                else if (i < 75)
                {
                    sb.Append("<th align='center'  style = 'background-color:  #364c88;height:50px;color: #ffffff;width:60px;font-size:10'>");
                    sb.Append(dt.Columns[i].ColumnName);
                    sb.Append("</th>");
                }
                else if (i < 78)
                {
                    sb.Append("<th align='center'  style = 'background-color:  #367588;height:50px;color: #ffffff;width:60px;font-size:10'>");
                    sb.Append(dt.Columns[i].ColumnName);
                    sb.Append("</th>");
                }
            }
        }


        sb.Append("</tr>");
        int rowindex = 0;
        string optnumberold = "";
        string optNumberNew = "";
        string OPTID = "";
        foreach (DataRow row in dt.Rows)
        {
            optNumberNew = row["OPT #"].ToString();
            OPTID = row["OpportunityID"].ToString();
            if (optnumberold != optNumberNew || rowindex == 0)
            {
                optnumberold = optNumberNew;

                sb.Append("<tr>");

                for (int i = 1; i < 52; i++)
                {
                    if (i == 12)
                    {

                       


                            int RelationPerc = 0;
                        if (row[i].ToString() == "")
                        {
                            RelationPerc = 0;
                        }
                        else
                        {
                            RelationPerc=Convert.ToInt32(row[i].ToString());
                        }
                        if (RelationPerc >= 80)
                        {
                            sb.Append("<td align='right' style='background-color: #125E1F;font-size:12;font-weight:bold;color:white'>");
                        }
                        else
                        {
                            sb.Append("<td align='right' style='background-color: #D91414;font-size:12;font-weight:bold;color:white'>");
                        }
                    }
                    else if (i == 15)
                    {
                        int RelationPerc = 0;
                        if (row[i].ToString() == "")
                        {
                            RelationPerc = 0;
                        }
                        else
                        {
                            RelationPerc = Convert.ToInt32(row[i].ToString());
                        }
                        if (RelationPerc >= 80)
                        {
                            sb.Append("<td align='right' style='background-color: #125E1F;font-size:12;font-weight:bold;color:white'>");
                        }
                        else
                        {
                            sb.Append("<td align='right' style='background-color: #D91414;font-size:12;font-weight:bold;color:white'>");
                        }
                    }

                    else if (i == 20)
                        sb.Append("<td align='right' style='background-color: #125E1F;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 21)
                        sb.Append("<td align='right' style='background-color: #47734F;font-size:12;font-weight:bold;color:black'>");
                    else if (i == 22)
                        sb.Append("<td align='right' style='background-color: #D91414;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 23)
                        sb.Append("<td align='right' style='background-color: #919191;font-size:12;font-weight:bold;color:white'>");
                    else  if (i == 29)
                        {


                        string expression = "OpportunityID= '" + OPTID.ToString() + "'";
                 

                        DataTable dtOptList = dt.Select(expression).CopyToDataTable();
                        bool colred = false;
                        int PtWinperc = 0;
                        int salesmanWinPerc = 0;
                        //foreach (DataRow rowOptList in dtOptList.Rows)
                        //{
                        //    if ((rowOptList[63].ToString() == ""  && row[56].ToString() == "OPEN") || row[29].ToString() == "" || row[33].ToString() == "" || row[37].ToString() == "" || ((row[68].ToString() == "") && (row[54].ToString().ToUpper()!= "FIRE FIGHTING" || row[54].ToString().ToUpper() != "FIRE PUMP") && row[56].ToString() == "OPEN") )
                        //    {
                        //        colred = true;
                        //    }

                        //    else
                        //    {

                        //        if (Convert.ToInt32(rowOptList[63].ToString()) >= 80 && Convert.ToInt32(rowOptList[29].ToString()) >= 80 && Convert.ToInt32(rowOptList[33].ToString()) >= 80 && Convert.ToInt32(rowOptList[37].ToString()) >= 80 && row[56].ToString() == "OPEN")
                        //        {
                        //            if (rowOptList[68].ToString() != "" && (row[54].ToString() != "Fire Fighting" || row[54].ToString() != "Fire Pump"))
                        //            {
                        //                try
                        //                {
                        //                    if (Convert.ToInt32(rowOptList[68].ToString()) >= 80 && row[56].ToString() == "OPEN")
                        //                    {
                        //                        colred = false;
                        //                    }
                        //                    else if (row[56].ToString() != "OPEN")
                        //                    {
                        //                        colred = false;
                        //                    }
                        //                    else
                        //                    {
                        //                        colred = true;
                        //                    }
                        //                }
                        //                catch (Exception s)
                        //                {
                        //                }
                        //            }
                        //            else
                        //            {
                        //                colred = false;
                        //            }

                        //        }
                        //        else if (row[56].ToString() != "OPEN")
                        //        {
                        //            colred = false;
                        //        }
                        //        else
                        //        {
                        //            colred = true;
                        //        }
                        //    }
                        //}

                        //if (colred)
                        //{
                        //    sb.Append("<td align='right' style='background-color: #D91414;font-size:12;font-weight:bold;color:white'>");

                        //}
                        //else
                        //{
                        //    sb.Append("<td align='right' style='background-color: #125E1F;font-size:12;font-weight:bold;color:white'>");
                        //}


                        foreach (DataRow rowOptList in dtOptList.Rows)
                        {
                            if ((Convert.ToInt32(rowOptList[68].ToString()) >= 80 || rowOptList[56].ToString() != "OPEN") && Convert.ToInt32(rowOptList[29].ToString()) >= 80 && Convert.ToInt32(rowOptList[33].ToString()) >= 80 && Convert.ToInt32(rowOptList[37].ToString()) >= 80  && ((Convert.ToInt32(rowOptList[63].ToString()) >= 80 || rowOptList[54].ToString() == "Fire Fighting" || rowOptList[54].ToString() == "Fire Pump" )&& rowOptList[56].ToString() != "OPEN"))
                            {
                                colred = false;
                            }

                            else
                            {
                                colred = true;
                            }
                        }

                        if (colred)
                        {
                            sb.Append("<td align='right' style='background-color: #D91414;font-size:12;font-weight:bold;color:white'>");

                        }
                        else
                        {
                            sb.Append("<td align='right' style='background-color: #125E1F;font-size:12;font-weight:bold;color:white'>");
                        }




                        //int RelationPerc = 0;
                        //    if (row[i].ToString() == "")
                        //    {
                        //        RelationPerc = 0;
                        //    }
                        //    else
                        //    {
                        //        RelationPerc = Convert.ToInt32(row[i].ToString());
                        //    }
                        //    if (RelationPerc >= 80)
                        //    {
                        //        sb.Append("<td align='right' style='background-color: #125E1F;font-size:12;font-weight:bold;color:white'>");
                        //    }
                        //    else
                        //    {
                        //        sb.Append("<td align='right' style='background-color: #D91414;font-size:12;font-weight:bold;color:white'>");
                        //    }
                    }
                    else if (i == 33)
                    {
                        int RelationPerc = 0;
                        if (row[i].ToString() == "")
                        {
                            RelationPerc = 0;
                        }
                        else
                        {
                            RelationPerc = Convert.ToInt32(row[i].ToString());
                        }
                        if (RelationPerc >= 80)
                        {
                            sb.Append("<td align='right' style='background-color: #125E1F;font-size:12;font-weight:bold;color:white'>");
                        }
                        else
                        {
                            sb.Append("<td align='right' style='background-color: #D91414;font-size:12;font-weight:bold;color:white'>");
                        }
                    }
                    else if (i == 37)
                    {
                        int RelationPerc = 0;
                        if (row[i].ToString() == "")
                        {
                            RelationPerc = 0;
                        }
                        else
                        {
                            RelationPerc = Convert.ToInt32(row[i].ToString());
                        }
                        if (RelationPerc >= 80)
                        {
                            sb.Append("<td align='right' style='background-color: #125E1F;font-size:12;font-weight:bold;color:white'>");
                        }
                        else
                        {
                            sb.Append("<td align='right' style='background-color: #D91414;font-size:12;font-weight:bold;color:white'>");
                        }
                    }
                    else 
                     sb.Append("<td align='center'>");

                    sb.Append(row[i].ToString());
                    sb.Append("</td>");
                }
            }


            for (int i = 56; i < dt.Columns.Count; i++)
            {
                if ((i > 55 && row[56].ToString().ToUpper() == "NO_SALE"))
                    sb.Append("<td align='center' style='background-color: #CED10D;font-size:10;font-weight:bold;color:white'>");
                else if (i > 55 && row[56].ToString().ToUpper() == "WON")
                    sb.Append("<td align='center' style='background-color: #17B312;font-size:10;font-weight:bold;color:white'>");
                else if (i > 55 && row[56].ToString().ToUpper() == "LOST")
                    sb.Append("<td align='center' style='background-color: #CF0808;font-size:10;font-weight:bold;color:white'>");

                else if (i > 55 && row[56].ToString().ToUpper() == "OPEN")
                {
                    if (i == 57 && (row[57].ToString().ToUpper() == "CONTRACT" || row[57].ToString().ToUpper() == "LOI" || row[57].ToString().ToUpper() == "LPO"))
                        sb.Append("<td align='center' style='background-color: #17B312;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 57 && (row[57].ToString().ToUpper() == "ESTIMATION"))
                        sb.Append("<td align='center' style='background-color: #CF7208;font-size:10;font-weight:bold;color:white'>");
                    else if (i == 57 && (row[57].ToString().ToUpper() == "PENDING LOST"))
                        sb.Append("<td align='center' style='background-color: #CF0808;font-size:10;font-weight:bold;color:white'>");
                    else if (i == 57 && (row[57].ToString().ToUpper() == "OTHERS"))
                        sb.Append("<td align='center' style='background-color: #0837CF;font-size:12;font-weight:bold;color:white'>");
                    else if (i == 57 && (row[57].ToString().ToUpper() == "NOT QUOTED"))
                        sb.Append("<td align='center' style='background-color: #FF4242;font-size:10;font-weight:bold;color:white'>");
                    else if (i == 57 && (row[57].ToString().ToUpper() == "WITH OTHERS"))
                        sb.Append("<td align='center' style='background-color: #424CFF;font-size:10;font-weight:bold;color:white'>");
                    else if (i == 57 && (row[57].ToString().ToUpper() == "NOT APPLICABLE"))
                        sb.Append("<td align='center' style='background-color: #F9FF42;font-size:10;font-weight:bold;color:white'>");
                    else if (i == 63)
                    {
                        int RelationPerc = 0;
                        if (row[i].ToString() == "")
                        {
                            RelationPerc = 0;
                        }
                        else
                        {
                            RelationPerc = Convert.ToInt32(row[i].ToString());
                        }
                        if (RelationPerc >= 80)
                        {
                            sb.Append("<td align='right' style='background-color: #125E1F;font-size:12;font-weight:bold;color:white'>");
                        }
                        else
                        {
                            sb.Append("<td align='right' style='background-color: #D91414;font-size:12;font-weight:bold;color:white'>");
                        }
                    }
                    else if (i == 68)
                    {
                        int RelationPerc = 0;
                        if (row[i].ToString() == "")
                        {
                            RelationPerc = 0;
                        }
                        else
                        {
                            RelationPerc = Convert.ToInt32(row[i].ToString());
                        }
                        if (row[i].ToString() == "" && (row[54].ToString()== "Fire Fighting" || row[54].ToString()== "Fire Pump"))
                        {
                            sb.Append("<td align='center'>");
                        }
                        if (RelationPerc >= 80)
                        {
                            sb.Append("<td align='right' style='background-color: #125E1F;font-size:12;font-weight:bold;color:white'>");
                        }
                        else
                        {
                            sb.Append("<td align='right' style='background-color: #D91414;font-size:12;font-weight:bold;color:white'>");
                        }
                    }
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


    private void ExportSummaryasView(DataSet ds)
    {
        DataTable dt = ds.Tables[0];
        DataTable dt1 = ds.Tables[1];
        StringBuilder sb = new StringBuilder();
        int flag = 1;
        int colspan;
        colspan = 10 + dt1.Rows.Count;
        var colwidth = (100 / colspan);

        sb.Append("<table border = '1'>");
        sb.Append("<tr>");
        sb.Append("<th colspan = " + colspan.ToString() + " style ='background-color: #a92828;color: white !important;height:70px;text-align:center;font-style:oblique;vertical-align:middle;font-size: xx-large;'> Quoted System Report</th>");
        sb.Append("</tr>");

        sb.Append("<tr>");

        sb.Append("<th style ='background-color: #a92828;color: white !important;width:" + colwidth.ToString() + "%;text-align:center;font-style:oblique;vertical-align:middle'> OPT #</th>");
        sb.Append("<th style ='background-color: #a92828;color: white !important;width:" + colwidth.ToString() + "%;text-align:center;font-style:oblique;vertical-align:middle'>TYPE</th>");
        sb.Append("<th style ='background-color: #a92828;color: white !important;width:" + colwidth.ToString() + "%;text-align:center;font-style:oblique;vertical-align:middle'> OPT NAME</th>");
        sb.Append("<th style ='background-color: #a92828;color: white !important;width:" + colwidth.ToString() + "%;text-align:center;font-style:oblique;vertical-align:middle'>CONTRACTOR</th>");
        sb.Append("<th style ='background-color: #a92828;color: white !important;width:" + colwidth.ToString() + "%;text-align:center;font-style:oblique;vertical-align:middle'>CONTRACTOR REL PEC</th>");
        sb.Append("<th style ='background-color: #a92828;color: white !important;width:" + colwidth.ToString() + "%;text-align:center;font-style:oblique;vertical-align:middle'>SALESMAN</th>");
        sb.Append("<th style ='background-color: #a92828;color: white !important;width:" + colwidth.ToString() + "%;text-align:center;font-style:oblique;vertical-align:middle'>CONSULTANT</th>");
        sb.Append("<th style ='background-color: #a92828;color: white !important;width:" + colwidth.ToString() + "%;text-align:center;font-style:oblique;vertical-align:middle'>CONSULTANT REL PEC</th>");
        sb.Append("<th style ='background-color: #a92828;color: white !important;width:" + colwidth.ToString() + "%;text-align:center;font-style:oblique;vertical-align:middle'>MARKETING</th>");
        sb.Append("<th style ='background-color: #a92828;color: white !important;width:" + colwidth.ToString() + "%;text-align:center;font-style:oblique;vertical-align:middle'>VALUE</th>");

        for (int i = 0; i < dt1.Rows.Count; i++)
        {

            sb.Append("<th style ='height:50px;background-color: #a92828;color: white !important;width:" + colwidth.ToString() + "%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle' >" + dt1.Rows[i]["Product"].ToString() + "</th>");

        }
        sb.Append("</tr>");
        //$('.tableheader').html(htmheader);

        for (int i = 0; i < dt.Rows.Count; i++)
        {

            sb.Append("<tr>");

            sb.Append("<td style = 'vertical -align:middle;text-align:center'>" + dt.Rows[i]["OPT #"].ToString() + "</td>");



            sb.Append("<td style = 'vertical -align:middle;text-align:center' >" + dt.Rows[i]["Project Type"] + "</td>");

            sb.Append("<td style = 'text -align:left'>" + dt.Rows[i]["OPT NAME"] + "</td>");

            sb.Append("<td style = 'text -align:left' >" + dt.Rows[i]["CONTRACTOR"] + "</td>");
            sb.Append("<td style = 'font-weight: bold;text-align:center' >" + dt.Rows[i]["CONTRACTOR RELATION PERC"] + "</td>");
            sb.Append("<td style = 'text -align:left' >" + dt.Rows[i]["SALESMAN"] + "</td>");
            sb.Append("<td style = 'text -align:left' >" + dt.Rows[i]["CONSULTANT"] + "</td>");
            sb.Append("<td style = 'font-weight: bold;text-align:center' >" + dt.Rows[i]["CONSULTAN RELATION PERC"] + "</td>");
            sb.Append("<td style = 'text -align:left' >" + dt.Rows[i]["MARKETING"] + "</td>");
            sb.Append("<td style = 'width:150px;font-weight: bold;text-align:right' >" + dt.Rows[i]["Value"] + "</td>");


            List<string> Substagelist = new List<string>();
            for (int j = 10; j < dt.Columns.Count; j++)
            {
                Substagelist.Add(ds.Tables[0].Rows[i][j].ToString());
            }


            for (int j = 0; j < Substagelist.Count; j++)
            {

                string substage = Substagelist[j];
                string[] myArray = substage.Split('-');
                string celcolor = "";
                if ((myArray[2]).ToUpper() == "WON")
                {
                    celcolor = "#1EAA17;--bs-table-accent-bg:#1EAA17";
                }
                else if ((myArray[2]).ToUpper() == "LOST")
                {

                    celcolor = "#F14632;--bs-table-accent-bg:#F14632";
                }
                else if ((myArray[2]).ToUpper() == "NO_SALE")
                {

                    celcolor = "#FFC300;--bs-table-accent-bg:#FFC300";
                }


                string VlColor = "";
                if (myArray[4].ToUpper() == "NOT APPROVED")
                {
                    VlColor = "#F14632; --bs - table - accent - bg: #F14632";

                }
                else if (myArray[4].ToUpper() == "APPROVED")
                {
                    VlColor = "#1EAA17; --bs - table - accent - bg:#1EAA17";
                }


                sb.Append("<td style = 'background -color:" + celcolor + ";vertical-align:middle;text-align:left;font-weight: bold;'>");

                sb.Append(myArray[2]);

                sb.Append(" - " + myArray[0]);

                sb.Append(" - " + myArray[4]);

                sb.Append(" - " + myArray[1]);

               

               

                sb.Append("</td>");

            }
            sb.Append("</tr>");
        }

        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Detailed Quoted System Summary Report.xls");
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