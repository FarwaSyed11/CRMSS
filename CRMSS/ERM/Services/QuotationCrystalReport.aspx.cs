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

public partial class ERM_Services_QuotationCrystalReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Int64 qtnHeaderID;
        int oper = 1;

        oper = Convert.ToInt32(Request.QueryString["oper"].ToString());
        qtnHeaderID = Convert.ToInt64(Request.QueryString["id"].ToString());
        if (oper == 0)
            LoadGeneralQTN(qtnHeaderID);
        else
            Download(qtnHeaderID);
    }

    public void LoadGeneralQTN(Int64 qtnHeaderID)
    {
        try
        {
            // btnPrint.Visible = true;
            CrystalReportViewer1.ReportSource = null;
            CrystalReportViewer1.RefreshReport();
            ReportDocument rptDoc = new ReportDocument();

            //rptDoc.Close();
            GC.Collect();
            //rptDoc.Dispose();
            //GC.Collect();

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add("0");

            pa.Add("@QuotationID");
            pv.Add(Convert.ToInt64(qtnHeaderID));

            DBH.CreateDatasetERM_Data(ds, "sp_QuoattionReport", true, pa, pv);


            rptDoc.Load(Server.MapPath("~/ERM/Report/Quotation.rpt"));

            rptDoc.SetDataSource(ds.Tables[0]);

            rptDoc.Subreports["LineDataNew.rpt"].SetDataSource(ds.Tables[0]);
            rptDoc.Subreports["Moreinformation.rpt"].SetDataSource(ds.Tables[0]);


            CrystalReportViewer1.ReportSource = rptDoc;

            CrystalReportViewer1.PageDrillUp();




            Session["myReportDocument"] = rptDoc;
            CrystalReportViewer1.HasExportButton = true;
            CrystalReportViewer1.HasPrintButton = false;

            CrystalReportViewer1.DataBind();
            CrystalReportViewer1.RefreshReport();


        }
        catch (Exception s)
        { }
    }

    public void Download(Int64 qtnHeaderID)
    {
        CrystalReportViewer1.ReportSource = null;
        CrystalReportViewer1.RefreshReport();
        ReportDocument rptDoc = new ReportDocument();

        //rptDoc.Close();
        GC.Collect();
        //rptDoc.Dispose();
        //GC.Collect();

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("0");

        pa.Add("@QuotationID");
        pv.Add(Convert.ToInt64(qtnHeaderID));

        DBH.CreateDatasetERM_Data(ds, "sp_QuoattionReport", true, pa, pv);


        rptDoc.Load(Server.MapPath("~/ERM/Report/Quotation.rpt"));

        rptDoc.SetDataSource(ds.Tables[0]);

        rptDoc.Subreports["LineDataNew.rpt"].SetDataSource(ds.Tables[0]);



        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;

        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "Quotation - " + ds.Tables[0].Rows[0]["QuotationNo"].ToString());



    }
}