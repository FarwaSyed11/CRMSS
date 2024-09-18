<%@ WebHandler Language="C#" Class="ERMFileUploader" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

public class ERMFileUploader : IHttpHandler {

    string ReqID = HttpContext.Current.Request.QueryString["ReqID"];
    string User = HttpContext.Current.Request.QueryString["UserId"];
    string Comments = HttpContext.Current.Request.QueryString["Comments"];
    string ProdType = HttpContext.Current.Request.QueryString["prodtype"];

    public void ProcessRequest(HttpContext context)
    {

        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        string fileNameURL = "";
        string pathAndFile = "";
        string ContentType = "";

        //commented this becasu for now due to security it will not allowing us to create any directory into crmss folder
        //string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/Collection");
        //string[] files;
        //int numFiles;
        //files = System.IO.Directory.GetFiles(dirFullPath);  //for reading all files from server path
        //numFiles = files.Length;
        //numFiles = numFiles + 1;
        string str_image = "";

        foreach (string s in context.Request.Files)
        {
            HttpPostedFile file = context.Request.Files[s];
            string fileName = ReqID + " - " + file.FileName;
            string fileExtension = file.ContentType;

            if (!string.IsNullOrEmpty(fileName))
            {

                //fileExtension = Path.GetExtension(fileName);
                //file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/KPI/KpiResponse"), fileName));
                ContentType = file.ContentType;
                pathAndFile = "\\\\zylab\\Econnect\\EMS_Docs\\SupportingDocuments\\";
                fileNameURL=ReqID + " - " + file.FileName;
                pathAndFile += ReqID + " - " + file.FileName;
                file.SaveAs(pathAndFile);
            }
        }


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(30);

        pa.Add("@URL");
        pv.Add(pathAndFile);

        pa.Add("@FileName");
        pv.Add(fileNameURL);

        pa.Add("@RefId");
        pv.Add(ReqID);

        pa.Add("@AttComments");
        pv.Add(Comments);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@AttachmentType");
        pv.Add(ContentType);
            
        pa.Add("@Product");
        pv.Add(ProdType);


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}