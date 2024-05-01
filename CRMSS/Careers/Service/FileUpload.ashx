<%@ WebHandler Language="C#" Class="FileUpload" %>

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

public class FileUpload : IHttpHandler {

    public void ProcessRequest (HttpContext context) {

        
            string pathAndFile = "";

            string ApplicantName = HttpContext.Current.Request.QueryString["ApplicantName"];
            string Qualification = HttpContext.Current.Request["Qualification"];
            string Gender = HttpContext.Current.Request["Gender"];
            string Subject = HttpContext.Current.Request["Subject"];
            string University = HttpContext.Current.Request["University"];
            string YearOfGraduation = HttpContext.Current.Request["YearOfGraduation"];
            string YearOFExp = HttpContext.Current.Request["YearOFExp"];
            string Emirates = HttpContext.Current.Request["Emirates"];
            string Availability = HttpContext.Current.Request["Availability"];
            string CanWorkFactory = HttpContext.Current.Request["CanWorkFactory"];
            string DrivingLicense = HttpContext.Current.Request["DrivingLicense"];
            string ContactNumber = HttpContext.Current.Request["ContactNumber"];
            string Email = HttpContext.Current.Request["Email"];

          
          
            foreach (string s in context.Request.Files)
            {
                HttpPostedFile file = context.Request.Files[s];
                string fileName = file.FileName;
                string fileExtension = file.ContentType;

                if (!string.IsNullOrEmpty(fileName))
                {
                    //fileExtension = Path.GetExtension(fileName);
                    //file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/FacilityManage"), fileName +"-"+ rowBrkId));

                    pathAndFile = "\\\\zylab\\Econnect\\Recruitment\\";
                    pathAndFile += ApplicantName + "_" + fileName.ToLower();
                    file.SaveAs(pathAndFile);
                

                    DBHandler DBH = new DBHandler();
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();

                    pa.Add("@ApplicantName");
                    pv.Add(ApplicantName);

                    pa.Add("@Gender");
                    pv.Add(Gender);

                    pa.Add("@Qualification");
                    pv.Add(Qualification);

                    pa.Add("@Subject");
                    pv.Add(Subject);

                    pa.Add("@University");
                    pv.Add(University);

                    pa.Add("@YearOfGraduation");
                    pv.Add(YearOfGraduation);

                    pa.Add("@YearOFExp");
                    pv.Add(YearOFExp);

                    pa.Add("@Emirates");
                    pv.Add(Emirates);

                    pa.Add("@Availability");
                    pv.Add(Availability);

                    pa.Add("@CanWorkFactory");
                    pv.Add(Convert.ToBoolean(CanWorkFactory.ToLower()));

                    pa.Add("@DrivingLicense");
                      pv.Add(Convert.ToBoolean(DrivingLicense.ToUpper()));

                    pa.Add("@ContactNumber");
                    pv.Add(ContactNumber);

                    pa.Add("@Email");
                    pv.Add(Email);

                    pa.Add("@CvLink");
                    pv.Add(pathAndFile);

                    pa.Add("@ContentType");
                    pv.Add(file.ContentType);

                    DBH.CreateDataset_SSHR(ds, "Sp_JobseekersDataUpload", true, pa, pv);

                }
            }

             



    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}