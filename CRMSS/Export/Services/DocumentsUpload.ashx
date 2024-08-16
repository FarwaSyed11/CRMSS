<%@ WebHandler Language="C#" Class="DocumentsUpload" %>

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

public class DocumentsUpload : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        string pathAndFile = "";

        string ReqID = HttpContext.Current.Request.QueryString["ReqID"];
        string FileName = HttpContext.Current.Request.QueryString["FileName"];
        string Remarks = HttpContext.Current.Request["Remarks"];
        string CreatedBy = HttpContext.Current.Request["CreatedBy"];


        foreach (string s in context.Request.Files)
        {
            HttpPostedFile file = context.Request.Files[s];
            string fileName = file.FileName.Replace("#","").Replace("&","");
          

            if (!string.IsNullOrEmpty(fileName))
            {
                //fileExtension = Path.GetExtension(fileName);
                //file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/FacilityManage"), fileName +"-"+ rowBrkId));

                pathAndFile = "\\\\zylab\\Econnect\\FireTruckQuotation\\";
                pathAndFile += ReqID.ToString() + "_" + fileName.ToLower();
                file.SaveAs(pathAndFile);

                try
                {

                    DBHandler DBH = new DBHandler();
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();

                    pa.Add("@Oper");
                    pv.Add(20);

                    pa.Add("@ReqID");
                    pv.Add(ReqID);

                    pa.Add("@FileName");
                    pv.Add(FileName);

                    pa.Add("@ContentType");
                    pv.Add(file.ContentType);

                    pa.Add("@URL");
                    pv.Add(pathAndFile);

                    pa.Add("@FileRemarks");
                    pv.Add(Remarks);

                    pa.Add("@USerID");
                    pv.Add(CreatedBy);

                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);
                }
                catch (Exception a)
                { 
                    
                    }

            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}