<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Data;
using System.Collections;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        byte[] bytes;
        string fileName, contentType;

        Int64 QTNID = int.Parse(context.Request.QueryString["Id"]);
        Int64 Oper = int.Parse(context.Request.QueryString["Oper"]);
        
        
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@Oper");
        pv.Add(Oper);

        pa.Add("@QTNID");
        pv.Add(QTNID);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MaintenanceQTNOperation", true, pa, pv);


        bytes = (byte[])(ds.Tables[0].Rows[0]["FileData"]);
        contentType = (ds.Tables[0].Rows[0]["contentType"]).ToString();
        fileName = (ds.Tables[0].Rows[0]["FileName"]).ToString();


        //context.Response.Clear();
        //context.Response.Buffer = true;
        //context.Response.Charset = "";
        //context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //context.Response.ContentType = contentType;
        //context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        //context.Response.BinaryWrite(bytes);
        //context.Response.Flush();
        //context.Response.End();

        context.Response.Buffer = true;
        context.Response.Charset = "";
        if (context.Request.QueryString["download"] == "1")
        {
            context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        }
        context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        context.Response.ContentType = "application/pdf";
        context.Response.BinaryWrite(bytes);
        context.Response.Flush();
        context.Response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}