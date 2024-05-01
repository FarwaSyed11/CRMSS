using Newtonsoft.Json;
using Org.BouncyCastle.Asn1.X509;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Net.Sockets;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class CRMReports_ForecasttOPTJOHUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                BindCompany();
                BindManager();
                BindSalesman();
            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }


    }
    protected void ddlSalesManager_SelectedIndexChanged(object sender, EventArgs e)
    {


    }
    protected void ddlSalesman_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
        protected void lbtExport_Click(object sender, EventArgs e)
        {
            try
            {
                //int UserId = Convert.ToInt32(Session["UserId"]);
                //DBHandler DBH = new DBHandler();
                //DataSet ds = new DataSet();
                //DataTable dt = new DataTable();
                //ArrayList pa = new ArrayList();
                //ArrayList pv = new ArrayList();

                //pa.Add("@Company");
                //pv.Add(ddlOrganization.SelectedValue);


                //pa.Add("@Manager");
                //pv.Add(ddlSalesManager.SelectedValue);



                //DBH.CreateDatasetCRMEBSDATA(ds, "JOHDetailReportNewDynamicWithForecastOPT", true, pa, pv);
                //if (ds.Tables[0].Rows.Count > 0)
                //    ExportSummary(ds);


            }
            catch (Exception s)
            { }
        }
        protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
        {


        }
        //private void ExportSummary(DataSet ds)
        //{

        //    StringBuilder sb = new StringBuilder();
        //    int flag = 1;

        //    DataTable dt = ds.Tables[0];
        //    DataTable dt1 = ds.Tables[1];

        //    sb.Append("<table border = '1'>");
        //    sb.Append("<tr>");
        //    sb.Append("<th colspan=10 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
        //    sb.Append("</th>");
        //    sb.Append("<th colspan=9 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
        //    sb.Append(dt1.Rows[0][0].ToString());
        //    sb.Append("</th>");
        //    sb.Append("</tr>");
        //    sb.Append("<tr>");
        //    for (int i = 0; i < dt.Columns.Count; i++)
        //    {
        //        if (i < 10)
        //            sb.Append("<th align='center'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:90px;font-size:10'>");
        //        else
        //            sb.Append("<th align='center'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:60px;font-size:10'>");
        //        sb.Append(dt.Columns[i].ColumnName);
        //        sb.Append("</th>");

        //    }
        //    sb.Append("</tr>");
        //    int rowindex = 0;
        //    foreach (DataRow row in dt.Rows)
        //    {


        //        sb.Append("<tr>");

        //        for (int i = 0; i < dt.Columns.Count; i++)
        //        {

        //            if (i == 4)
        //                sb.Append("<td align='right' style='background-color: #32A84C;font-size:12;font-weight:bold;color:white'>");
        //            else if (i == 5)
        //                sb.Append("<td align='right' style='background-color: #93E660;font-size:12;font-weight:bold;color:black'>");
        //            else if (i == 6)
        //                sb.Append("<td align='right' style='background-color: #AD1C1E;font-size:12;font-weight:bold;color:white'>");
        //            else if (i == 7)
        //                sb.Append("<td align='right' style='background-color: #F22C2C;font-size:12;font-weight:bold;color:white'>");
        //            else if (i == 8)
        //                sb.Append("<td align='right' style='background-color: #9C1616;font-size:12;font-weight:bold;color:white'>");
        //            else if (i == 9)
        //                sb.Append("<td align='right' style='background-color: #969696;font-size:12;font-weight:bold;color:white'>");
        //            else if (i == 10)
        //                sb.Append("<td align='center' style='background-color: #32A84C;font-size:12;font-weight:bold;color:white'>");
        //            else if (i == 11)
        //                sb.Append("<td align='center' style='background-color: #93E660;font-size:12;font-weight:bold;color:black'>");
        //            else if (i == 12)
        //                sb.Append("<td align='center' style='background-color: #AD1C1E;font-size:12;font-weight:bold;color:white'>");
        //            else if (i == 13)
        //                sb.Append("<td align='center' style='background-color: #F22C2C;font-size:12;font-weight:bold;color:white'>");
        //            else if (i == 14)
        //                sb.Append("<td align='center' style='background-color: #348BAD;font-size:12;font-weight:bold;color:white'>");
        //            else if (i == 15)
        //                sb.Append("<td align='center' style='background-color: #BDBD13;font-size:12;font-weight:bold;color:white'>");
        //            else if (i == 16)
        //                sb.Append("<td align='center' style='background-color: #093770;font-size:12;font-weight:bold;color:white'>");
        //            else if (i == 17)
        //                sb.Append("<td align='center' style='background-color: #969696;font-size:12;font-weight:bold;color:white'>");
        //            else if (i == 18)
        //                sb.Append("<td align='center' style='background-color: #F22C2C;font-size:12;font-weight:bold;color:white'>");

        //            else
        //                sb.Append("<td align='center' style='background-color: #E3EAEB;font-size:10'>");

        //            //if (row[i].ToString() == "0.00" || row[i].ToString() == "0")
        //            //    sb.Append("--");
        //            //else
        //            sb.Append(row[i].ToString());

        //            sb.Append("</td>");


        //        }
        //        rowindex++;
        //        sb.Append("</tr>");
        //    }
        //    sb.Append("</table>");
        //    Response.Clear();
        //    Response.Buffer = true;
        //    Response.AddHeader("content-disposition", "attachment;filename=JOH Summary.xls");
        //    //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
        //    Response.Charset = "";
        //    Response.ContentType = "application/vnd.ms-excel";
        //    string style = @"<style> .textmode { } </style>";
        //    Response.Write(style);

        //    Response.Output.Write(sb.ToString());

        //    Response.Flush();
        //    Response.End();

        //}
        protected void lblDetail_Click(object sender, EventArgs e)
        {
            //int UserId = Convert.ToInt32(Session["UserId"]);
            //DBHandler DBH = new DBHandler();
            //DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            //ArrayList pa = new ArrayList();
            //ArrayList pv = new ArrayList();


            //pa.Add("@Company");
            //pv.Add(ddlOrganization.SelectedValue);

            //DBH.CreateDatasetCRMEBSDATA(ds, "JOHDetailReportNew", true, pa, pv);
            //if (ds.Tables[0].Rows.Count > 0)
            //    ExportDetails(ds.Tables[0]);
        }
        private void ExportDetails(DataTable dt)
        {

            StringBuilder sb = new StringBuilder();
            int flag = 1;

            sb.Append("<table border = '1'>");
            sb.Append("<tr>");
            sb.Append("<th colspan=35 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
            sb.Append("</th>");
            sb.Append("<th colspan=16 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
            sb.Append("FIRE FIGHTING");
            sb.Append("</th>");
            sb.Append("<th colspan=16 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
            sb.Append("FIRE ALARM");
            sb.Append("</th>");
            sb.Append("<th colspan=16 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
            sb.Append("EMERGENCY EXIT");
            sb.Append("</th>");
            sb.Append("<th colspan=16 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
            sb.Append("FIRE PUMP");
            sb.Append("</th>");
            sb.Append("<th colspan=16 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
            sb.Append("BMS");
            sb.Append("</th>");
            sb.Append("<th colspan=16 align='center'  style = 'background-color:  #ffffff;height:30px;color: black;'>");
            sb.Append("SMS");
            sb.Append("</th>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            for (int i = 1; i < dt.Columns.Count; i++)
            {
                if (i != 36 && i != 37 && i != 60 && i != 61 && i != 84 && i != 85 && i != 108 && i != 109 && i != 132 && i != 133 && i != 156 && i != 157 && (i < 51 || i > 58) && (i < 75 || i > 82) && (i < 99 || i > 106) && (i < 123 || i > 130) && (i < 147 || i > 154) && (i < 171 || i > 178))
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
                    else if (i < 42)//rev starting
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #32B89F;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName);
                        sb.Append("</th>");
                    }
                    else if (i < 47)
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #80CED9;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName);
                        sb.Append("</th>");
                    }
                    else if (i < 51)
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #579ED9;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName);
                        sb.Append("</th>");
                    }
                    else if (i < 55)
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #3A67B0;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName);
                        sb.Append("</th>");
                    }
                    else if (i < 59)
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #B87932;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName);
                        sb.Append("</th>");
                    }
                    else if (i == 59)
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #31C44A;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName);
                        sb.Append("</th>");
                    }

                    else if (i < 66 || (i > 85 && i < 90) || (i > 109 && i < 114) || (i > 133 && i < 138) || (i > 157 && i < 162))//rev starting
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #32B89F;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName.Remove(dt.Columns[i].ColumnName.Length - 1, 1));
                        sb.Append("</th>");
                    }
                    else if (i < 71 || (i > 89 && i < 95) || (i > 113 && i < 119) || (i > 137 && i < 143) || (i > 161 && i < 167))
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #80CED9;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName.Remove(dt.Columns[i].ColumnName.Length - 1, 1));
                        sb.Append("</th>");
                    }
                    else if (i < 75 || (i > 94 && i < 99) || (i > 118 && i < 123) || (i > 142 && i < 147) || (i > 166 && i < 171))
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #579ED9;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName.Remove(dt.Columns[i].ColumnName.Length - 1, 1));
                        sb.Append("</th>");
                    }
                    else if (i < 79 || (i > 98 && i < 103) || (i > 122 && i < 127) || (i > 146 && i < 151) || (i > 170 && i < 175))
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #3A67B0;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName.Remove(dt.Columns[i].ColumnName.Length - 1, 1));
                        sb.Append("</th>");
                    }
                    else if (i < 83 || (i > 102 && i < 107) || (i > 126 && i < 131) || (i > 150 && i < 155) || (i > 174 && i < 179))
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #B87932;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName.Remove(dt.Columns[i].ColumnName.Length - 1, 1));
                        sb.Append("</th>");
                    }
                    else if (i == 83 || i == 107 || i == 131 || i == 155 || i == 179)
                    {
                        sb.Append("<th align='center'  style = 'background-color:  #31C44A;height:50px;color: #ffffff;width:60px;font-size:10'>");
                        sb.Append(dt.Columns[i].ColumnName.Remove(dt.Columns[i].ColumnName.Length - 1, 1));
                        sb.Append("</th>");
                    }




                    else
                        sb.Append("<th align='center'  style = 'background-color:  #74767A;height:50px;color: #ffffff;width:60px;font-size:10'>");


                }

            }
            sb.Append("</tr>");
            int rowindex = 0;
            foreach (DataRow row in dt.Rows)
            {


                sb.Append("<tr>");

                for (int i = 1; i < dt.Columns.Count; i++)
                {
                    if (i != 36 && i != 37 && i != 60 && i != 61 && i != 84 && i != 85 && i != 108 && i != 109 && i != 132 && i != 133 && i != 156 && i != 157 && (i < 51 || i > 58) && (i < 75 || i > 82) && (i < 99 || i > 106) && (i < 123 || i > 130) && (i < 147 || i > 154) && (i < 171 || i > 178))
                    {
                        if (i == 16)
                            sb.Append("<td align='right' style='background-color: #125E1F;font-size:12;font-weight:bold;color:white'>");
                        else if (i == 17)
                            sb.Append("<td align='right' style='background-color: #47734F;font-size:12;font-weight:bold;color:black'>");
                        else if (i == 18)
                            sb.Append("<td align='right' style='background-color: #D91414;font-size:12;font-weight:bold;color:white'>");
                        else if (i == 19)
                            sb.Append("<td align='right' style='background-color: #919191;font-size:12;font-weight:bold;color:white'>");

                        else if ((i > 37 && i < 60 && row[38].ToString().ToUpper() == "NO_SALE") || (i > 61 && i < 84 && row[62].ToString().ToUpper() == "NO_SALE") || (i > 85 && i < 108 && row[86].ToString().ToUpper() == "NO_SALE") || (i > 109 && i < 132 && row[110].ToString().ToUpper() == "NO_SALE") || (i > 133 && i < 156 && row[134].ToString().ToUpper() == "NO_SALE") || (i > 157 && i < 181 && row[158].ToString().ToUpper() == "NO_SALE"))
                            sb.Append("<td align='center' style='background-color: #CED10D;font-size:10;font-weight:bold;color:white'>");
                        else if ((i > 37 && i < 60 && row[38].ToString().ToUpper() == "WON") || (i > 61 && i < 84 && row[62].ToString().ToUpper() == "WON") || (i > 85 && i < 108 && row[86].ToString().ToUpper() == "WON") || (i > 109 && i < 132 && row[110].ToString().ToUpper() == "WON") || (i > 133 && i < 156 && row[134].ToString().ToUpper() == "WON") || (i > 157 && i < 181 && row[158].ToString().ToUpper() == "WON"))
                            sb.Append("<td align='center' style='background-color: #17B312;font-size:10;font-weight:bold;color:white'>");
                        else if ((i > 37 && i < 60 && row[38].ToString().ToUpper() == "LOST") || (i > 61 && i < 84 && row[62].ToString().ToUpper() == "LOST") || (i > 85 && i < 108 && row[86].ToString().ToUpper() == "LOST") || (i > 109 && i < 132 && row[110].ToString().ToUpper() == "LOST") || (i > 133 && i < 156 && row[134].ToString().ToUpper() == "LOST") || (i > 157 && i < 181 && row[158].ToString().ToUpper() == "LOST"))
                            sb.Append("<td align='center' style='background-color: #CF0808;font-size:10;font-weight:bold;color:white'>");

                        else if ((i > 37 && i < 60 && row[38].ToString().ToUpper() == "OPEN") || (i > 61 && i < 84 && row[62].ToString().ToUpper() == "OPEN") || (i > 85 && i < 108 && row[86].ToString().ToUpper() == "OPEN") || (i > 109 && i < 132 && row[110].ToString().ToUpper() == "OPEN") || (i > 133 && i < 156 && row[134].ToString().ToUpper() == "OPEN") || (i > 157 && i < 181 && row[158].ToString().ToUpper() == "OPEN"))
                        {
                            if ((i == 39 && (row[39].ToString().ToUpper() == "CONTRACT" || row[39].ToString().ToUpper() == "LOI" || row[39].ToString().ToUpper() == "LPO"))
                                || (i == 63 && (row[63].ToString().ToUpper() == "CONTRACT" || row[63].ToString().ToUpper() == "LOI" || row[63].ToString().ToUpper() == "LPO"))
                                || (i == 87 && (row[87].ToString().ToUpper() == "CONTRACT" || row[87].ToString().ToUpper() == "LOI" || row[87].ToString().ToUpper() == "LPO"))
                                || (i == 111 && (row[111].ToString().ToUpper() == "CONTRACT" || row[111].ToString().ToUpper() == "LOI" || row[111].ToString().ToUpper() == "LPO"))
                                || (i == 135 && (row[135].ToString().ToUpper() == "CONTRACT" || row[135].ToString().ToUpper() == "LOI" || row[135].ToString().ToUpper() == "LPO"))
                                || (i == 159 && (row[159].ToString().ToUpper() == "CONTRACT" || row[159].ToString().ToUpper() == "LOI" || row[159].ToString().ToUpper() == "LPO"))
                                )
                                sb.Append("<td align='center' style='background-color: #17B312;font-size:12;font-weight:bold;color:white'>");
                            else if ((i == 39 && row[39].ToString().ToUpper() == "ESTIMATION") || (i == 63 && row[63].ToString().ToUpper() == "ESTIMATION") || (i == 87 && row[87].ToString().ToUpper() == "ESTIMATION") || (i == 111 && row[111].ToString().ToUpper() == "ESTIMATION") || (i == 135 && row[135].ToString().ToUpper() == "ESTIMATION") || (i == 159 && row[159].ToString().ToUpper() == "ESTIMATION"))
                                sb.Append("<td align='center' style='background-color: #CF7208;font-size:10;font-weight:bold;color:white'>");
                            else if ((i == 39 && row[39].ToString().ToUpper() == "PENDING LOST") || (i == 63 && row[63].ToString().ToUpper() == "PENDING LOST") || (i == 87 && row[87].ToString().ToUpper() == "PENDING LOST") || (i == 111 && row[111].ToString().ToUpper() == "PENDING LOST") || (i == 135 && row[135].ToString().ToUpper() == "PENDING LOST") || (i == 159 && row[159].ToString().ToUpper() == "PENDING LOST"))
                                sb.Append("<td align='center' style='background-color: #CF0808;font-size:10;font-weight:bold;color:white'>");
                            else if ((i == 39 && row[39].ToString().ToUpper() == "OTHERS") || (i == 63 && row[63].ToString().ToUpper() == "OTHERS") || (i == 87 && row[87].ToString().ToUpper() == "OTHERS") || (i == 111 && row[111].ToString().ToUpper() == "OTHERS") || (i == 135 && row[135].ToString().ToUpper() == "OTHERS") || (i == 159 && row[159].ToString().ToUpper() == "OTHERS"))
                                sb.Append("<td align='center' style='background-color: #0837CF;font-size:12;font-weight:bold;color:white'>");
                            else if ((i == 39 && row[39].ToString().ToUpper() == "NOT QUOTED") || (i == 63 && row[63].ToString().ToUpper() == "NOT QUOTED") || (i == 87 && row[87].ToString().ToUpper() == "NOT QUOTED") || (i == 111 && row[111].ToString().ToUpper() == "NOT QUOTED") || (i == 135 && row[135].ToString().ToUpper() == "NOT QUOTED") || (i == 159 && row[159].ToString().ToUpper() == "NOT QUOTED"))
                                sb.Append("<td align='center' style='background-color: #FF4242;font-size:10;font-weight:bold;color:white'>");
                            else if ((i == 39 && row[39].ToString().ToUpper() == "WITH OTHERS") || (i == 63 && row[63].ToString().ToUpper() == "WITH OTHERS") || (i == 87 && row[87].ToString().ToUpper() == "WITH OTHERS") || (i == 111 && row[111].ToString().ToUpper() == "WITH OTHERS") || (i == 135 && row[135].ToString().ToUpper() == "WITH OTHERS") || (i == 159 && row[159].ToString().ToUpper() == "WITH OTHERS"))
                                sb.Append("<td align='center' style='background-color: #424CFF;font-size:10;font-weight:bold;color:white'>");
                            else if ((i == 39 && row[39].ToString().ToUpper() == "NOT APPLICABLE") || (i == 63 && row[63].ToString().ToUpper() == "NOT APPLICABLE") || (i == 87 && row[87].ToString().ToUpper() == "NOT APPLICABLE") || (i == 111 && row[111].ToString().ToUpper() == "NOT APPLICABLE") || (i == 135 && row[135].ToString().ToUpper() == "NOT APPLICABLE") || (i == 159 && row[159].ToString().ToUpper() == "NOT APPLICABLE"))
                                sb.Append("<td align='center' style='background-color: #F9FF42;font-size:10;font-weight:bold;color:white'>");
                            else
                                sb.Append("<td align='center' style='background-color:white ;font-size:10;font-weight:bold;color:black'>");
                        }
                        else
                            sb.Append("<td align='center'>");

                        //if (row[i].ToString() == "0.00" || row[i].ToString() == "0")
                        //    sb.Append("--");
                        //else
                        sb.Append(row[i].ToString());

                        sb.Append("</td>");

                    }
                }
                rowindex++;
                sb.Append("</tr>");
            }
            sb.Append("</table>");
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=JOH Summary.xls");
            //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);

            Response.Output.Write(sb.ToString());

            Response.Flush();
            Response.End();

        }


        protected void lbDetailNew_Click(object sender, EventArgs e)
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();



        pa.Add("@Company");
        pv.Add(ddlOrganization.SelectedValue);

        pa.Add("@manager");
        pv.Add(ddlSalesManager.SelectedValue);

        pa.Add("@salesman");
        pv.Add(ddlSalesman.SelectedValue);

        DBH.CreateDatasetCRMEBSDATA(ds, "JOHDetailReportNewDynamicWithForecastOPT", true, pa, pv);
            if (ds.Tables[0].Rows.Count > 0)
                ExportDetailsNew(ds);
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
                    if ((i > 44  && row[45].ToString().ToUpper() == "NO_SALE"))
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
            Response.AddHeader("content-disposition", "attachment;filename=Forecast JOH Update Details.xls");
            //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);

            Response.Output.Write(sb.ToString());

            Response.Flush();
            Response.End();

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



            DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

            ddlSalesManager.DataSource = ds.Tables[0];
            ddlSalesManager.DataTextField = "Name";
            ddlSalesManager.DataValueField = "EmployeeRowID";
            ddlSalesManager.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlSalesManager.Items.Insert(0, new ListItem("ALL", "-1"));

        }
        catch (Exception s)
        { }
    }

    protected void ddlSalesman_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    public void BindSalesman()
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
            pv.Add(ddlSalesManager.SelectedValue);



            DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

            ddlSalesman.DataSource = ds.Tables[0];
            ddlSalesman.DataTextField = "Name";
            ddlSalesman.DataValueField = "EmployeeRowID";
            ddlSalesman.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlSalesman.Items.Insert(0, new ListItem("ALL", "-1"));

        }
        catch (Exception s)
        { }
    }

	protected void ddlOrganization_SelectedIndexChanged1(object sender, EventArgs e)
	{
        BindManager();
        BindSalesman();
	}

	protected void ddlSalesManager_SelectedIndexChanged1(object sender, EventArgs e)
	{
        BindSalesman();
	}
}

   