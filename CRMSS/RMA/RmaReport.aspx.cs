using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class RMA_RmaReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Int64 RMAid;
        int oper = 1;
        RMAid = Convert.ToInt32(Request.QueryString["id"].ToString());
       

        if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["oper"])))
        {
            oper = Convert.ToInt32(Request.QueryString["oper"].ToString());

        }
        if (oper == 1)
        {
            GetReportPDF(RMAid);
        }
        else
        {
            DownloadReport(RMAid);
        }
    }
    public void GetReportPDF(Int64 RMAid)
    {
        try
        {
            CrystalReportViewer1.ReportSource = null;
            CrystalReportViewer1.RefreshReport();
            ReportDocument rptDoc = new ReportDocument();

            GC.Collect();

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



            pa.Add("@Oper");
            pv.Add(61);

            pa.Add("@Id");
            pv.Add(RMAid);


            DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

            rptDoc.Load(Server.MapPath("~/Report/RmaReport.rpt"));
            rptDoc.SetDataSource(ds.Tables[0]);

            CrystalReportViewer1.ReportSource = rptDoc;

            CrystalReportViewer1.PageDrillUp();




            Session["myReportDocument"] = rptDoc;
            CrystalReportViewer1.HasExportButton = true;
            CrystalReportViewer1.HasPrintButton = false;

            CrystalReportViewer1.DataBind();
            CrystalReportViewer1.RefreshReport();
        }
        catch(Exception s) { }
    }

    public void DownloadReport(Int64 RMAid)
    {
        try
        {
            CrystalReportViewer1.ReportSource = null;
            CrystalReportViewer1.RefreshReport();
            ReportDocument rptDoc = new ReportDocument();

            GC.Collect();

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



            pa.Add("@Oper");
            pv.Add(61);

            pa.Add("@Id");
            pv.Add(RMAid);


            DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

            rptDoc.Load(Server.MapPath("~/Report/RmaReport.rpt"));
            rptDoc.SetDataSource(ds.Tables[0]);

            rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "Request Report - " + ds.Tables[0].Rows[0]["Id"].ToString());
        }
        catch (Exception s) { }
    }
}
    