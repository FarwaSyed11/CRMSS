using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TESTReport_TestOPTReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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


        pa.Add("@Oper");
        pv.Add("0");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TestOPTRev", true, pa, pv);


        rptDoc.Load(Server.MapPath("~/Report/CrystalReport.rpt"));

        rptDoc.SetDataSource(ds.Tables[0]);




        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


        CrystalReportViewer1.ReportSource = rptDoc;

        CrystalReportViewer1.PageDrillUp();



        CrystalReportViewer1.HasExportButton = true;
        CrystalReportViewer1.HasPrintButton = false;

        CrystalReportViewer1.DataBind();
        CrystalReportViewer1.RefreshReport();

    }
}