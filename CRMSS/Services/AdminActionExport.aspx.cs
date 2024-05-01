using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Services_AdminActionExport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Company = Convert.ToString(Request.QueryString["Company"]);
        Int64 Manager = Int64.Parse(Request.QueryString["Manager"]);
        Int64 Salesman = Int64.Parse(Request.QueryString["Salesman"]);
        int oper = int.Parse(Request.QueryString["oper"]);


        if(oper==0)
        {
            string Overview = Convert.ToString(Request.QueryString["Overview"]);
            string Action = Convert.ToString(Request.QueryString["Action"]);
            JOHAdminAction(Company, Manager, Salesman, Overview, Action);
        }

        else if (oper == 1)
        {
            string subStage = Convert.ToString(Request.QueryString["subStage"]);
            string Action = Convert.ToString(Request.QueryString["Action"]);
            string Overview = Convert.ToString(Request.QueryString["Overview"]);
            string Product = Convert.ToString(Request.QueryString["Product"]);
            RevenueAdminAction(Company, Manager, Salesman, subStage, Overview, Action, Product);
        }
        else if (oper == 2)
        {
            string Action = Convert.ToString(Request.QueryString["Action"]);
            string OverView = Convert.ToString(Request.QueryString["OverView"]);
            JOHTenderAdminAction(Company, Manager, Salesman, OverView, Action);
            
        }
        else if (oper == 3)
        {
            string Action = Convert.ToString(Request.QueryString["Action"]);
            string OverView = Convert.ToString(Request.QueryString["OverView"]);
            JOHHoldAdminAction(Company, Manager, Salesman, OverView, Action);
        }

    }
    public void JOHAdminAction(string Company, Int64 Manager, Int64 Salesman,string Overview,string Action)
    {
      

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@ManagerId");
        pv.Add(Manager);

        pa.Add("@SalemanId");
        pv.Add(Salesman);

        pa.Add("@Overview");
        pv.Add(Overview);

        pa.Add("@Action");
        pv.Add(Action);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AdminAction", true, pa, pv);
        if (ds.Tables[0].Rows.Count > 0)
        {

            ExportSummary(ds.Tables[0]);
        }
    }

    public void JOHTenderAdminAction(string Company, Int64 Manager, Int64 Salesman,string OverView,string Action)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@ManagerId");
        pv.Add(Manager);

        pa.Add("@SalemanId");
        pv.Add(Salesman);

        pa.Add("@Overview");
        pv.Add(OverView);

        pa.Add("@ProjectStage");
        pv.Add("TENDER");

        pa.Add("@Action");
        pv.Add(Action);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AdminAction", true, pa, pv);
        if (ds.Tables[0].Rows.Count > 0)
        {

            ExportSummary(ds.Tables[0]);
        }
    }
    public void JOHHoldAdminAction(string Company, Int64 Manager, Int64 Salesman,string OverView,string Action)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@ManagerId");
        pv.Add(Manager);

        pa.Add("@SalemanId");
        pv.Add(Salesman);

        pa.Add("@Overview");
        pv.Add(OverView);

        pa.Add("@ProjectStage");
        pv.Add("HOLD");

        pa.Add("@Action");
        pv.Add(Action);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AdminAction", true, pa, pv);
        if (ds.Tables[0].Rows.Count > 0)
        {

            ExportSummary(ds.Tables[0]);
        }
    }

    public void RevenueAdminAction(string Company, Int64 Manager, Int64 Salesman, string subStage,string Overview,string Action,string Product)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@ManagerId");
        pv.Add(Manager);

        pa.Add("@SalemanId");
        pv.Add(Salesman);

        pa.Add("@subStage");
        pv.Add(subStage);

        pa.Add("@Overview");
        pv.Add(Overview);

        pa.Add("@Action");
        pv.Add(Action);

        pa.Add("@Product");
        pv.Add(Product);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_RevenueAdminAction", true, pa, pv);
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