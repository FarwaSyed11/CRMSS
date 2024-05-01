<%@ WebHandler Language="C#" Class="SheildMeQtn" %>

using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public class SheildMeQtn : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        Int64 QTNID = int.Parse(context.Request.QueryString["Id"]);
        ReportDocument rptDoc = new ReportDocument();

        GC.Collect();

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("11");

        pa.Add("@QtnId");
        pv.Add(Convert.ToInt64(QTNID));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);


        rptDoc.Load(HttpContext.Current.Server.MapPath("ShieldMeQtn.rpt"));
        rptDoc.SetDataSource(ds.Tables[0]);
        rptDoc.Subreports[0].SetDataSource(ds.Tables[2]);
        rptDoc.Subreports[1].SetDataSource(ds.Tables[1]);
        rptDoc.Subreports[2].SetDataSource(ds.Tables[0]);
        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;

        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, context.Response, true, ds.Tables[0].Rows[0]["QtnNumber"].ToString());
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}