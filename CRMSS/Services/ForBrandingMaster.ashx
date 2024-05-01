<%@ WebHandler Language="C#" Class="ForBrandingMaster" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

public class ForBrandingMaster : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        string pathAndFile = "";

        string Description = HttpContext.Current.Request.QueryString["Description"];
        string UserId = HttpContext.Current.Request.QueryString["UserId"];
        string IsEnable = HttpContext.Current.Request.QueryString["IsEnable"];


        //string ActId = HttpContext.Current.Request.QueryString["ActId"];

        //commented this becasu for now due to security it will not allowing us to create any directory into crmss folder
        //string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/ERM");
        //string[] files;
        //int numFiles;
        //files = System.IO.Directory.GetFiles(dirFullPath);  //for reading all files from server path
        //numFiles = files.Length;
        //numFiles = numFiles + 1;
        //string str_image = "";

        foreach (string s in context.Request.Files)
        {
            HttpPostedFile file = context.Request.Files[s];
            string fileName = file.FileName;
            string fileExtension = file.ContentType;

            if (!string.IsNullOrEmpty(fileName))
            {
                fileExtension = Path.GetExtension(fileName);
                file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/BrandingMaster"), fileName));

                //pathAndFile = "\\\\ZYLAB\\Econnect\\FM_New\\General\\";
                //pathAndFile += "BrandingMaster_" + fileName;
                //file.SaveAs(pathAndFile);


                pa.Add("@oper");
                pv.Add(22);

                pa.Add("@userId");
                pv.Add(UserId);


                pa.Add("@Description");
                pv.Add(Description);

                pa.Add("@IsEnable");
                pv.Add(IsEnable);



                pa.Add("@URL");
                pv.Add("../Images/BrandingMaster/"+fileName);

                pa.Add("@Filename");
                pv.Add(fileName);


                DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

            }
        }




    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}