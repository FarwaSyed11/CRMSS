<%@ WebHandler Language="C#" Class="ForFileUpload" %>

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

public class ForFileUpload : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        try
        {
            
            string Id = HttpContext.Current.Request.QueryString["Id"];
            string Comm = HttpContext.Current.Request["comment"];

            string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/CRMActivity");
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
                    fileExtension = Path.GetExtension(fileName);
                    file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/CRMActivity"),fileName));

                    DBHandler DBH = new DBHandler();
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();

                    pa.Add("@oper");
                    pv.Add("99");

                    pa.Add("@AttachUrl");
                    pv.Add("../Images/CRMActivity/" + fileName);

                    pa.Add("@Id");
                    pv.Add(Id);

                    pa.Add("@FileName");
                    pv.Add(fileName);

                    pa.Add("@AttachComment");
                    pv.Add(Comm);

                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);
                }
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

}