<%@ WebHandler Language="C#" Class="FileUploadEMSReq" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
public class FileUploadEMSReq : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        try
        {

            string fUploadFor = HttpContext.Current.Request.QueryString["fufor"];

            if (fUploadFor == "todotaskchat")
            {
                string a = "asa";
                //UploadTaskFiles(context);
            }
            else if (fUploadFor == "estimation")
            {
                UploadEstimatorFiles(context);
            }
            else if (fUploadFor == "firepumpfromtoc")
            {
                UploadFPumpFiles(context);
            }

        }
        catch (Exception ac)
        {

        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    public string claculateFileSize(float bytes)
    {
        string finalSize = "";
        if (bytes >= 1073741824) { finalSize = Math.Round(bytes / 1073741824, 2) + " GB"; }
        else if (bytes >= 1048576) { finalSize = Math.Round(bytes / 1048576, 2) + " MB"; }
        else if (bytes >= 1024) { finalSize = Math.Round(bytes / 1024, 2) + " KB"; }
        else if (bytes > 1) { finalSize = bytes + " bytes"; }
        else if (bytes == 1) { finalSize = bytes + " byte"; }
        else { finalSize = "0 bytes"; }
        return finalSize;
    }



    //Survey
    public void UploadEstimatorFiles(HttpContext context)
    {
        string UserId = HttpContext.Current.Request.QueryString["userid"];
        string Comment = HttpContext.Current.Request.QueryString["comment"];
        string ReqId = HttpContext.Current.Request.QueryString["reqid"];
        string ProdType = HttpContext.Current.Request.QueryString["prodtype"];
        string ProdStr = HttpContext.Current.Request.QueryString["prodstr"];
        //string CrDate = HttpContext.Current.Request.QueryString["crdate"];

        string pathAndFile = "";
        string fileName = "";

        foreach (string s in context.Request.Files)
        {
            HttpPostedFile file = context.Request.Files[s];
            fileName = UserId + " - " + file.FileName;
            string fileExtension = file.ContentType;

            if (!string.IsNullOrEmpty(fileName))
            {
                pathAndFile = "\\\\zylab\\Econnect\\EMS_Docs\\";
                pathAndFile += UserId + " - " + file.FileName;
                file.SaveAs(pathAndFile);
            }

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(0);

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@Comment");
            pv.Add(Comment);

            pa.Add("@ReqId");
            pv.Add(ReqId);

            pa.Add("@ProdType");
            pv.Add(ProdType);

            pa.Add("@ProdStr");
            pv.Add(ProdStr);

            pa.Add("@URL");
            pv.Add(pathAndFile);

            pa.Add("@FileName");
            pv.Add(fileName);

            pa.Add("@AttachType");
            pv.Add(fileExtension);


            if (!string.IsNullOrEmpty(Comment) || !string.IsNullOrEmpty(fileName))
            {
                DBH.CreateDatasetERM_Data(ds, "sp_EstiAttach", true, pa, pv);
            }
        }

    }

    //FirePump
    public void UploadFPumpFiles(HttpContext context)
    {
        string UserId = HttpContext.Current.Request.QueryString["userid"];
        string Comment = HttpContext.Current.Request.QueryString["comment"];
        string ReqId = HttpContext.Current.Request.QueryString["reqid"];
        //string CrDate = HttpContext.Current.Request.QueryString["crdate"];

        string pathAndFile = "";
        string fileName = "";

        foreach (string s in context.Request.Files)
        {
            HttpPostedFile file = context.Request.Files[s];
            fileName = UserId + " - " + file.FileName;
            string fileExtension = file.ContentType;

            if (!string.IsNullOrEmpty(fileName))
            {
                pathAndFile = "\\\\zylab\\Econnect\\EMS_Docs\\FirePump\\";
                pathAndFile += UserId + " - " + file.FileName;
                file.SaveAs(pathAndFile);
            }

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(19);

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@AttComment");
            pv.Add(Comment);

            pa.Add("@ReqId");
            pv.Add(ReqId);

            pa.Add("@URL");
            pv.Add(pathAndFile);

            pa.Add("@FileName");
            pv.Add(fileName);

            pa.Add("@ContentType");
            pv.Add(fileExtension);


            if (!string.IsNullOrEmpty(Comment) || !string.IsNullOrEmpty(fileName))
            {
                DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);
            }
        }

    }
}