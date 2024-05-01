<%@ WebHandler Language="C#" Class="SSHRFileUploadHandler" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

public class SSHRFileUploadHandler : IHttpHandler {
    
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        try
        {

            string fUploadFor = HttpContext.Current.Request.QueryString["fufor"];

            if (fUploadFor == "onbehalfattach")
            {
                #region
                //start
                string ApplicationId = HttpContext.Current.Request.QueryString["ApplicationId"];
              

                string pathAndFile = "";


                //commented this becasu for now due to security it will not allowing us to create any directory into crmss folder
                string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/Collection");
                string[] files;
                int numFiles;
                files = System.IO.Directory.GetFiles(dirFullPath);  //for reading all files from server path
                numFiles = files.Length;
                numFiles = numFiles + 1;
                string str_image = "";

                foreach (string s in context.Request.Files)
                {
                    HttpPostedFile file = context.Request.Files[s];
                    string fileName = ApplicationId + " - " + file.FileName;
                    string fileExtension = file.ContentType;

                    if (!string.IsNullOrEmpty(fileName))
                    {
                        //fileExtension = Path.GetExtension(fileName);
                        //file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/KPI/KpiResponse"), fileName));

                        pathAndFile = "\\\\zylab\\Econnect\\SSHR\\Leave";
                        pathAndFile += ApplicationId + " - " + file.FileName;
                        file.SaveAs(pathAndFile);
                    }
                }

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@Id");
        pv.Add(ApplicationId);

        pa.Add("@OnBehalfURL");
        pv.Add(pathAndFile);

    
            DBH.CreateDataset_SSHR(ds, "sp_LeaveApplicationControls", true, pa, pv);
       
                

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
   
    public void UploadSurveyFiles(HttpContext context) {
        string ApplicationId = HttpContext.Current.Request.QueryString["ApplicationId"];
    

        string pathAndFile = "";


        //commented this becasu for now due to security it will not allowing us to create any directory into crmss folder
        string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/Survey");
        string[] files;
        int numFiles;
        files = System.IO.Directory.GetFiles(dirFullPath);  //for reading all files from server path
        numFiles = files.Length;
        numFiles = numFiles + 1;
        string str_image = "";

        string fileName = "";
        foreach (string s in context.Request.Files)
        {
            HttpPostedFile file = context.Request.Files[s];
            fileName = ApplicationId + " ; " + file.FileName;
            string fileExtension = file.ContentType;
            
            if (!string.IsNullOrEmpty(fileName))
            {
                fileExtension = Path.GetExtension(fileName);
                file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/Survey"), fileName));


                pathAndFile = "\\\\zylab\\Econnect\\SSHR\\Leave";
                pathAndFile += ApplicationId + " - " + file.FileName;
                file.SaveAs(pathAndFile);
            }
        }

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@Id");
        pv.Add(ApplicationId);

        pa.Add("@RequestURL");
        pv.Add(pathAndFile);

     

     
       DBH.CreateDataset_SSHR(ds, "sp_LeaveApplicationControls", true, pa, pv);
     

    }

}