<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

public class Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        string pathAndFile = "";

        string EventId = HttpContext.Current.Request.QueryString["EventId"];
        string UserId = HttpContext.Current.Request.QueryString["UserId"];
        string Type = HttpContext.Current.Request.QueryString["Type"];
        string Name = HttpContext.Current.Request.QueryString["Name"];
        string Location = HttpContext.Current.Request.QueryString["Location"];
        string Address = HttpContext.Current.Request.QueryString["Address"];
        string Remarks = HttpContext.Current.Request.QueryString["Remarks"];

        //string ActId = HttpContext.Current.Request.QueryString["ActId"];

        //commented this becasu for now due to security it will not allowing us to create any directory into crmss folder
        string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/ERM");
        string[] files;
        int numFiles;
        files = System.IO.Directory.GetFiles(dirFullPath);  //for reading all files from server path
        numFiles = files.Length;
        numFiles = numFiles + 1;
        string str_image = "";

        foreach (string s in context.Request.Files)
        {
            HttpPostedFile file = context.Request.Files[s];
            string fileName = file.FileName;
            string fileExtension = file.ContentType;

            if (!string.IsNullOrEmpty(fileName))
            {
                //fileExtension = Path.GetExtension(fileName);
                //file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/ERM"), fileName));

                pathAndFile = "\\\\ZYLAB\\Econnect\\FM_New\\General\\";
                pathAndFile += "event_" + fileName;
                file.SaveAs(pathAndFile);


        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@Id");
        pv.Add(EventId);

        pa.Add("@Type");
        pv.Add(Type);

        pa.Add("@Name");
        pv.Add(Name);

        pa.Add("@Location");
        pv.Add(Location);

        pa.Add("@Address");
        pv.Add(Address);

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@URL");
        pv.Add(pathAndFile);

        pa.Add("@FileName");
        pv.Add("event_" + fileName);


        DBH.CreateDatasetBranding_DB(ds, "sp_Branding_Event", true, pa, pv);

            }
        }

       



    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}