<%@ WebHandler Language="C#" Class="LOIDocuments" %>
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public class LOIDocuments : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
       

            try
        {
            
            string userId = HttpContext.Current.Request.QueryString["userid"];
            string RequestNumber = HttpContext.Current.Request["RequestNumber"];
            string FileName = HttpContext.Current.Request["FileName"];
            string Description = HttpContext.Current.Request["Description"];
          

           // string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/LOIDocuments");
            //string[] files;
            //int numFiles;
            //files = System.IO.Directory.GetFiles(dirFullPath);  //for reading all files from server path
            //numFiles = files.Length;
            //numFiles = numFiles + 1;
            //string str_image = "";

            string pathAndFile = "";
                
            foreach (string s in context.Request.Files)
            {
                HttpPostedFile file = context.Request.Files[s];
                string fileName = file.FileName;
                string fileExtension = file.ContentType;

                if (!string.IsNullOrEmpty(fileName))
                {
                    //fileExtension = Path.GetExtension(fileName);
                    //file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/LOIDocuments"),fileName));

                    pathAndFile = "\\\\zylab\\Econnect\\LOIDocs\\";
                    pathAndFile += file.FileName;
                    file.SaveAs(pathAndFile);

                    DBHandler DBH = new DBHandler();
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();

                    pa.Add("@oper");
                    pv.Add(12);

                    pa.Add("@URL");
                    pv.Add("\\\\zylab\\Econnect\\LOIDocs\\" + fileName);

                    pa.Add("@FileName");
                    pv.Add(FileName);

                    pa.Add("@userid");
                    pv.Add(Convert.ToInt32(userId));

                    pa.Add("@RequestNumber");
                    pv.Add(RequestNumber);

                    pa.Add("@Description");
                    pv.Add(Description);

        
                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);

                }
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