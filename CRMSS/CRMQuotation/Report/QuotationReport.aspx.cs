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

public partial class CRMQuotation_Report_QuotationReport : System.Web.UI.Page
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
        pv.Add("10");

        pa.Add("@QtnHeaderId");
        pv.Add(Convert.ToInt64(20137));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


        rptDoc.Load(Server.MapPath("../CRMSS/Report/GeneralQuotation.rpt"));

        rptDoc.SetDataSource(ds.Tables[0]);



        rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

        DataSet ds1 = new DataSet();
        ArrayList pa1 = new ArrayList();
        ArrayList pv1 = new ArrayList();

        pa1.Add("@Oper");
        pv1.Add("1");

        pa1.Add("@QtnHeaderId");
        pv1.Add(Convert.ToInt64(20137));

        DBH.CreateDatasetCRMEBSDATA(ds1, "sp_CRMSSQuotationReport", true, pa1, pv1);


        rptDoc.Subreports[1].SetDataSource(ds1.Tables[0]);



        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


        CrystalReportViewer1.ReportSource = rptDoc;

        CrystalReportViewer1.PageDrillUp();




        Session["myReportDocument"] = rptDoc;
        CrystalReportViewer1.HasExportButton = true;
        CrystalReportViewer1.HasPrintButton = false;

        CrystalReportViewer1.DataBind();
        CrystalReportViewer1.RefreshReport();

    }
}