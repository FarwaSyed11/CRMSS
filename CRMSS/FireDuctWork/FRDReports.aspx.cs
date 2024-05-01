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
public partial class FireDuctWork_Default : System.Web.UI.Page
{
    ReportDocument rptDoc = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        int oper = 1;
        Int64 InspId = 0;
        string PrjNo = "";


        if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["oper"])))
        {
            oper = Convert.ToInt32(Request.QueryString["oper"].ToString());

        }
        PrjNo =Convert.ToString(Request.QueryString["pno"].ToString());

        InspId = Convert.ToInt64(Request.QueryString["id"].ToString());
        if(oper==1)
        {
            LoadFRDReport( InspId,PrjNo);
        }
        if (oper == 2)
        {
            DownloadFRDReport(InspId, PrjNo);
        }
        if (CrystalReportViewer1.ReportSource==null)
        {
            rptDoc.Close();
            rptDoc.Dispose();
        }

    }

    public void LoadFRDReport(Int64 InspId,string PrjNo)
    {
        try
        {
            // btnPrint.Visible = true;
            CrystalReportViewer1.ReportSource = null;
            CrystalReportViewer1.RefreshReport();
            

            GC.Collect();

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


           

            pa.Add("@projNo");
            pv.Add(PrjNo);


            pa.Add("@inspId");
            pv.Add(InspId);

            DBH.CreateDatasetFRD(ds, "sp_FRDInspectionReport", true, pa, pv);


            rptDoc.Load(Server.MapPath("~/Report/FRDuctWorkReport.rpt"));

            rptDoc.SetDataSource(ds.Tables[0]);
            rptDoc.Subreports[1].SetDataSource(ds.Tables[0]);




            DataSet ds1 = new DataSet();
            ArrayList pa1 = new ArrayList();
            ArrayList pv1 = new ArrayList();

          
            pa1.Add("@inspId");
            pv1.Add(InspId);

            pa1.Add("@projNo");
            pv1.Add(PrjNo);

            DBH.CreateDatasetFRD(ds1, "sp_FRDInspectionImgae", true, pa1, pv1);

            rptDoc.Subreports["FRDIMAGE"].SetDataSource(ds1.Tables[0]);

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


    public void DownloadFRDReport(Int64 InspId, string PrjNo)
    {
      
            ReportDocument rptDoc = new ReportDocument();


            GC.Collect();

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();




            pa.Add("@projNo");
            pv.Add(PrjNo);


            pa.Add("@inspId");
            pv.Add(InspId);

            DBH.CreateDatasetFRD(ds, "sp_FRDInspectionReport", true, pa, pv);


            rptDoc.Load(Server.MapPath("~/Report/FRDuctWorkReport.rpt"));

            rptDoc.SetDataSource(ds.Tables[0]);
            rptDoc.Subreports[1].SetDataSource(ds.Tables[0]);




            DataSet ds1 = new DataSet();
            ArrayList pa1 = new ArrayList();
            ArrayList pv1 = new ArrayList();


            pa1.Add("@inspId");
            pv1.Add(InspId);

            pa1.Add("@projNo");
            pv1.Add(PrjNo);

            DBH.CreateDatasetFRD(ds1, "sp_FRDInspectionImgae", true, pa1, pv1);

            rptDoc.Subreports["FRDIMAGE"].SetDataSource(ds1.Tables[0]);

            rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


            rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "FRD Project Report - " + ds.Tables[0].Rows[0]["SlNo"].ToString());


        }
      

    protected void Page_Unload(object sender, EventArgs e)
    {
        if (rptDoc != null)
        {
            rptDoc.Close();
            rptDoc.Dispose();
        }
    }
}