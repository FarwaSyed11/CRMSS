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
        int oper=1;
        int type=1;
        Int64 qtnHeaderID;

        if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["oper"])))
        {
            oper = Convert.ToInt32(Request.QueryString["oper"].ToString());
           
        }
        if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["value"])))
        {
            type = Convert.ToInt32(Request.QueryString["value"].ToString());

        }
        
            qtnHeaderID = Convert.ToInt32(Request.QueryString["id"].ToString());


            if (oper == 1)
            {
                if (type == 1)
                    LoadGeneralQTN(qtnHeaderID);
                else if (type == 2)
                    LoadQTNWithAvailability(qtnHeaderID);
                else if (type == 3)
                    LoadQTNWithoutModel(qtnHeaderID);
                else if (type == 4)
                    LoadSummaryReportNew(qtnHeaderID);
                else if (type == 5)
                    LoadDetailedReport(qtnHeaderID);
            }
            else
            {
                
                    if (type == 1)
                        DownloadGeneralQuotation(qtnHeaderID);
                    else if (type == 2)
                        DownloadQTNWithAvailability(qtnHeaderID);
                    else if (type == 3)
                        DownloadQTNWithoutModel(qtnHeaderID);
                    else if (type == 4)
                        DownloadQTNSummaryNew(qtnHeaderID);
                    else if (type == 5)
                        DownloadDetailedReport(qtnHeaderID);
               
            }
        

       

    }
    public void LoadGeneralQTN(Int64 qtnHeaderID)
    {
        try
        {
            // btnPrint.Visible = true;
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
            pv.Add(Convert.ToInt64(qtnHeaderID));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


            rptDoc.Load(Server.MapPath("~/Report/GeneralQuotation.rpt"));

            rptDoc.SetDataSource(ds.Tables[0]);



            rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

            DataSet ds1 = new DataSet();
            ArrayList pa1 = new ArrayList();
            ArrayList pv1 = new ArrayList();

            pa1.Add("@Oper");
            pv1.Add("1");

            pa1.Add("@QtnHeaderId");
            pv1.Add(Convert.ToInt64(qtnHeaderID));

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
        catch (Exception s)
        { }
    }
    public void LoadQTNWithAvailability(Int64 qtnHeaderID)
    {
        try
        {
            // btnPrint.Visible = true;
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
            pv.Add(Convert.ToInt64(qtnHeaderID));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


            rptDoc.Load(Server.MapPath("~/Report/QTNWithAvailability.rpt"));

            rptDoc.SetDataSource(ds.Tables[0]);



            rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

            DataSet ds1 = new DataSet();
            ArrayList pa1 = new ArrayList();
            ArrayList pv1 = new ArrayList();

            pa1.Add("@Oper");
            pv1.Add("1");

            pa1.Add("@QtnHeaderId");
            pv1.Add(Convert.ToInt64(qtnHeaderID));

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
        catch (Exception s)
        { }
    }
    public void LoadQTNWithoutModel(Int64 qtnHeaderID)
    {
        try
        {
            // btnPrint.Visible = true;
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
            pv.Add(Convert.ToInt64(qtnHeaderID));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


            rptDoc.Load(Server.MapPath("~/Report/QTNWithoutModel.rpt"));

            rptDoc.SetDataSource(ds.Tables[0]);



            rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

            DataSet ds1 = new DataSet();
            ArrayList pa1 = new ArrayList();
            ArrayList pv1 = new ArrayList();

            pa1.Add("@Oper");
            pv1.Add("1");

            pa1.Add("@QtnHeaderId");
            pv1.Add(Convert.ToInt64(qtnHeaderID));

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
        catch (Exception s)
        { }
    }
    public void LoadSummaryReportNew(Int64 qtnHeaderID)
    {
        try
        {
            // btnPrint.Visible = true;
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
            pv.Add("8");

            pa.Add("@QtnHeaderId");
            pv.Add(Convert.ToInt64(qtnHeaderID));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);

            rptDoc.Load(Server.MapPath("~/Report/QTNSummaryNew.rpt"));

            rptDoc.SetDataSource(ds.Tables[0]);



            rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

            DataSet ds1 = new DataSet();
            ArrayList pa1 = new ArrayList();
            ArrayList pv1 = new ArrayList();

            pa1.Add("@Oper");
            pv1.Add("1");

            pa1.Add("@QtnHeaderId");
            pv1.Add(Convert.ToInt64(qtnHeaderID));

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
        catch (Exception s)
        { }
    }
    public void LoadProjectQuotation(Int64 qtnHeaderID)
    {
        try
        {
            // btnPrint.Visible = true;
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
            pv.Add("8");

            pa.Add("@QtnHeaderId");
            pv.Add(Convert.ToInt64(qtnHeaderID));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


            rptDoc.Load(Server.MapPath("~/Report/CRMSSQtnSummary.rpt"));
            rptDoc.SetDataSource(ds.Tables[0]);
            rptDoc.Subreports[0].SetDataSource(ds.Tables[0]);
            rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


            CrystalReportViewer1.ReportSource = rptDoc;

            CrystalReportViewer1.PageDrillUp();




            Session["myReportDocument"] = rptDoc;
            CrystalReportViewer1.HasExportButton = false;
            CrystalReportViewer1.HasPrintButton = false;

            CrystalReportViewer1.DataBind();
            CrystalReportViewer1.RefreshReport();



        }
        catch (Exception s)
        { }
    }
    public void LoadDetailedReport(Int64 qtnHeaderID)
    {
        try
        {
            // btnPrint.Visible = true;
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
            pv.Add("9");

            pa.Add("@QtnHeaderId");
            pv.Add(Convert.ToInt64(qtnHeaderID));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


            rptDoc.Load(Server.MapPath("~/Report/CRMSSQTNBillOfMaterials.rpt"));
            rptDoc.SetDataSource(ds.Tables[0]);
            //rptDoc.Subreports[0].SetDataSource(ds.Tables[0]);
            rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


            CrystalReportViewer1.ReportSource = rptDoc;

            CrystalReportViewer1.PageDrillUp();




            Session["myReportDocument"] = rptDoc;
            CrystalReportViewer1.HasExportButton = false;
            CrystalReportViewer1.HasPrintButton = false;

            CrystalReportViewer1.DataBind();
            CrystalReportViewer1.RefreshReport();



        }
        catch (Exception s)
        { }
    }


    public void DownloadGeneralQuotation(Int64 qtnHeaderID)
    {
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
        pv.Add(Convert.ToInt64(qtnHeaderID));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


        rptDoc.Load(Server.MapPath("~/Report/GeneralQuotation.rpt"));

        rptDoc.SetDataSource(ds.Tables[0]);



        rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

        DataSet ds1 = new DataSet();
        ArrayList pa1 = new ArrayList();
        ArrayList pv1 = new ArrayList();

        pa1.Add("@Oper");
        pv1.Add("1");

        pa1.Add("@QtnHeaderId");
        pv1.Add(Convert.ToInt64(qtnHeaderID));

        DBH.CreateDatasetCRMEBSDATA(ds1, "sp_CRMSSQuotationReport", true, pa1, pv1);


        rptDoc.Subreports[1].SetDataSource(ds1.Tables[0]);

        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;

        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "General Quotation - " + ds.Tables[0].Rows[0]["QtnNumber"].ToString());



    }
    public void DownloadQTNSummaryNew(Int64 qtnHeaderID)
    {
        ReportDocument rptDoc = new ReportDocument();

        GC.Collect();

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("8");

        pa.Add("@QtnHeaderId");
        pv.Add(Convert.ToInt64(qtnHeaderID));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);

        rptDoc.Load(Server.MapPath("~/Report/QTNSummaryNew.rpt"));

        rptDoc.SetDataSource(ds.Tables[0]);

        rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

        DataSet ds1 = new DataSet();
        ArrayList pa1 = new ArrayList();
        ArrayList pv1 = new ArrayList();

        pa1.Add("@Oper");
        pv1.Add("1");

        pa1.Add("@QtnHeaderId");
        pv1.Add(Convert.ToInt64(qtnHeaderID));

        DBH.CreateDatasetCRMEBSDATA(ds1, "sp_CRMSSQuotationReport", true, pa1, pv1);


        rptDoc.Subreports[1].SetDataSource(ds1.Tables[0]);

        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;



        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "Cover Page - " + ds.Tables[0].Rows[0]["QtnNumber"].ToString());




    }
    public void DownloadSummaryReport(Int64 qtnHeaderID)
    {
        ReportDocument rptDoc = new ReportDocument();

        GC.Collect();

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("8");

        pa.Add("@QtnHeaderId");
        pv.Add(Convert.ToInt64(qtnHeaderID));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


        rptDoc.Load(Server.MapPath("~/Report/CRMSSQtnSummary.rpt"));
        rptDoc.SetDataSource(ds.Tables[0]);
        rptDoc.Subreports[0].SetDataSource(ds.Tables[0]);
        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "Project Summary - " + ds.Tables[0].Rows[0]["QtnNumber"].ToString());


    }
    public void DownloadDetailedReport(Int64 qtnHeaderID)
    {
        ReportDocument rptDoc = new ReportDocument();

        GC.Collect();

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("9");

        pa.Add("@QtnHeaderId");
        pv.Add(Convert.ToInt64(qtnHeaderID));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


        rptDoc.Load(Server.MapPath("~/Report/CRMSSQTNBillOfMaterials.rpt"));
        rptDoc.SetDataSource(ds.Tables[0]);
        //rptDoc.Subreports[0].SetDataSource(ds.Tables[0]);
        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "Detail Quotation -" + ds.Tables[0].Rows[0]["QtnNumber"].ToString());


    }
    public void DownloadQTNWithoutModel(Int64 qtnHeaderID)
    {
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
        pv.Add(Convert.ToInt64(qtnHeaderID));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


        rptDoc.Load(Server.MapPath("~/Report/QTNWithoutModel.rpt"));

        rptDoc.SetDataSource(ds.Tables[0]);



        rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

        DataSet ds1 = new DataSet();
        ArrayList pa1 = new ArrayList();
        ArrayList pv1 = new ArrayList();

        pa1.Add("@Oper");
        pv1.Add("1");

        pa1.Add("@QtnHeaderId");
        pv1.Add(Convert.ToInt64(qtnHeaderID));

        DBH.CreateDatasetCRMEBSDATA(ds1, "sp_CRMSSQuotationReport", true, pa1, pv1);


        rptDoc.Subreports[1].SetDataSource(ds1.Tables[0]);

        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;

        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "General Quotation - " + ds.Tables[0].Rows[0]["QtnNumber"].ToString());


    }
    public void DownloadQTNWithAvailability(Int64 qtnHeaderID)
    {
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
        pv.Add(Convert.ToInt64(qtnHeaderID));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


        rptDoc.Load(Server.MapPath("~/Report/QTNWithAvailability.rpt"));

        rptDoc.SetDataSource(ds.Tables[0]);



        rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

        DataSet ds1 = new DataSet();
        ArrayList pa1 = new ArrayList();
        ArrayList pv1 = new ArrayList();

        pa1.Add("@Oper");
        pv1.Add("1");

        pa1.Add("@QtnHeaderId");
        pv1.Add(Convert.ToInt64(qtnHeaderID));

        DBH.CreateDatasetCRMEBSDATA(ds1, "sp_CRMSSQuotationReport", true, pa1, pv1);


        rptDoc.Subreports[1].SetDataSource(ds1.Tables[0]);

        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;

        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "General Quotation - " + ds.Tables[0].Rows[0]["QtnNumber"].ToString());


    }
}