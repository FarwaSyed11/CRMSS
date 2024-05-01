using DayPilot.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Services_CRMReportLoad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string Company = Convert.ToString(Request.QueryString["Company"]);
        string Manager = Convert.ToString(Request.QueryString["Manager"]);
        string Salesman = Convert.ToString(Request.QueryString["Salesman"]);
        string oper = Convert.ToString(Request.QueryString["oper"]);
        string Section = Convert.ToString(Request.QueryString["Section"]);
        string User = Convert.ToString(Request.QueryString["User"]);
        string SaleStage = Convert.ToString(Request.QueryString["SaleStage"]);
        string Status = Convert.ToString(Request.QueryString["Status"]);
        string Verify = Convert.ToString(Request.QueryString["Verify"]);
        string General = Convert.ToString(Request.QueryString["General"]);
        string Country = Convert.ToString(Request.QueryString["Country"]);
        string PrimaryCat = Convert.ToString(Request.QueryString["PrimaryCat"]);
        string Type = Convert.ToString(Request.QueryString["Type"]);
        string FromDate = Convert.ToString(Request.QueryString["FromDate"]);
        string ToDate = Convert.ToString(Request.QueryString["ToDate"]);
        string MediaInfo = Convert.ToString(Request.QueryString["MediaInfo"]);



        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@ManagerId");
        pv.Add(Manager);

        pa.Add("@SalesmanId");
        pv.Add(Salesman);

        pa.Add("@SalesStageName");
        pv.Add(SaleStage);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@General");
        pv.Add(General);

        pa.Add("@VerifySearch");
        pv.Add(Verify);

        pa.Add("@UserId");
        pv.Add(User);

        pa.Add("@Section");
        pv.Add(Section);

        pa.Add("@Category");
        pv.Add(PrimaryCat);

        pa.Add("@Type");
        pv.Add(Type);

        pa.Add("@Country");
        pv.Add(Country);

        pa.Add("@FromDate");
        pv.Add(Convert.ToDateTime(FromDate));

        pa.Add("@ToDate");
        pv.Add(Convert.ToDateTime(ToDate));

        pa.Add("@Media");
        pv.Add(MediaInfo);







        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMCustomReport", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {

            ExportSummary(ds.Tables[0]);

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
        Response.AddHeader("content-disposition", "attachment;filename=AdminAction.xls");
        //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);

        Response.Output.Write(sb.ToString());


        Response.End();


    }
}