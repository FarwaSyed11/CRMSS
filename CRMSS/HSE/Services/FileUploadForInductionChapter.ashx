<%@ WebHandler Language="C#" Class="FileUploadForInductionChapter" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

public class FileUploadForInductionChapter : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        try
        {
            string IID = HttpContext.Current.Request.QueryString["IID"];
            string SIChapter = HttpContext.Current.Request.QueryString["SIChapter"];
            string CreatedBy = HttpContext.Current.Request.QueryString["CreatedBy"];
            string SIID = HttpContext.Current.Request.QueryString["SIID"];
            string Value = HttpContext.Current.Request.QueryString["Value"];

            string profileName = "";


            string pathAndFile = "";


            //commented this becasu for now due to security it will not allowing us to create any directory into crmss folder
            string dirFullPath = HttpContext.Current.Server.MapPath("~/HSE/HSEChapters");
            string[] files;
            int numFiles;
            files = System.IO.Directory.GetFiles(dirFullPath);  //for reading all files from server path
            numFiles = files.Length;
            numFiles = numFiles + 1;
            string str_image = "";

            foreach (string s in context.Request.Files)
            {
                HttpPostedFile file = context.Request.Files[s];
                string fileName = IID + " - " + file.FileName;
                string fileExtension = file.ContentType;

                if (!string.IsNullOrEmpty(fileName))
                {
                    fileExtension = Path.GetExtension(fileName);
                    file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/HSE/HSEChapters"), fileName));
                    profileName = fileName;
                    //pathAndFile = "\\\\zylab\\Econnect\\Scrap\\";
                    //pathAndFile += ItemId + " - " + file.FileName;
                    //file.SaveAs(pathAndFile);
                }
            }


            if(Value=="Create")
            { 
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(6);

            pa.Add("@IID");
            pv.Add(IID);

            pa.Add("@SIChapter");
            pv.Add(SIChapter);

            pa.Add("@SIChapterPDFLink");
            pv.Add("../HSE/HSEChapters/" + profileName);


            pa.Add("@CreatedBy");
            pv.Add(CreatedBy);



            DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionAdmin", true, pa, pv);
          }

              if(Value=="Update")
                          { 
                          DBHandler DBH = new DBHandler();
                          DataSet ds = new DataSet();
                          DataTable dt = new DataTable();
                          ArrayList pa = new ArrayList();
                          ArrayList pv = new ArrayList();

                          pa.Add("@oper");
                          pv.Add(9);

                       
                          pa.Add("@SIID");
                          pv.Add(SIID);

                          pa.Add("@SIChapter");
                          pv.Add(SIChapter);

                          pa.Add("@SIChapterPDFLink");
                          pv.Add("../HSE/HSEChapters/" + profileName);


                          pa.Add("@CreatedBy");
                          pv.Add(CreatedBy);



                          DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionAdmin", true, pa, pv);
                        }

        }
        catch (Exception ac)
        {

        }


    }



    public bool IsReusable {
        get {
            return false;
        }
    }

}