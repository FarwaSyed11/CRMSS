<%@ WebHandler Language="C#" Class="pdfViewer" %>

using System;
using System.Web;
using System.Data;
using System.Collections;
public class pdfViewer : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {

        byte[] bytes;
        string fileName, contentType;

        Int64 ID = Int64.Parse(context.Request.QueryString["Id"]);


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@ConsultantId");
        pv.Add(ID);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ConsultantVLAudit", true, pa, pv);

      

      
        fileName = (ds.Tables[0].Rows[0]["filepath"]).ToString();
       // fileName = "//zylab/Navas/ConsultantVLAttachments/100000000281112_abdulnavas.pdf";


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
            context.Response.AppendHeader("Content-Disposition", "attachment; filename=abc.pdf");
        }
        context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        context.Response.ContentType = "application/pdf";
        context.Response.WriteFile(fileName);
        context.Response.Flush();
        context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}