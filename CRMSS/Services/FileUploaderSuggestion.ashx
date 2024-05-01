<%@ WebHandler Language="C#" Class="FileUploaderSuggestion" %>

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

public class FileUploaderSuggestion : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";


        try
        {

            string userId = HttpContext.Current.Request.QueryString["userid"];
            string empName = HttpContext.Current.Request["empname"];
            string empNo = HttpContext.Current.Request["empno"];
            string suggType = HttpContext.Current.Request["suggtype"];
            string projName = HttpContext.Current.Request["projname"];
            string appName = HttpContext.Current.Request["appname"];
            string desc = HttpContext.Current.Request["desc"];

            string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/Suggestion");
            string[] files;
            int numFiles;
            files = System.IO.Directory.GetFiles(dirFullPath);  //for reading all files from server path
            numFiles = files.Length;
            numFiles = numFiles + 1;
            string str_image = "";

            if (context.Request.Files.Count > 0)
            {
                foreach (string s in context.Request.Files)
                {
                    HttpPostedFile file = context.Request.Files[s];
                    string fileName = file.FileName;
                    string fileExtension = file.ContentType;

                    if (!string.IsNullOrEmpty(fileName))
                    {
                        fileExtension = Path.GetExtension(fileName);
                        file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/Suggestion"),fileName));

                        DBHandler DBH = new DBHandler();
                        DataSet ds = new DataSet();
                        DataTable dt = new DataTable();
                        ArrayList pa = new ArrayList();
                        ArrayList pv = new ArrayList();

                        pa.Add("@oper");
                        pv.Add(0);

                        pa.Add("@AttachUrl");
                        pv.Add("../Images/Suggestion/" + fileName);

                        pa.Add("@FileName");
                        pv.Add(fileName);

                        pa.Add("@UserId");
                        pv.Add(Convert.ToInt32(userId));

                        pa.Add("@EmpName");
                        pv.Add(empName);

                        pa.Add("@EmpNo");
                        pv.Add(empNo);

                        pa.Add("@TypeOfSuggestion");
                        pv.Add(suggType);

                        pa.Add("@ProjectName");
                        pv.Add(projName);

                        pa.Add("@ApplicationName");
                        pv.Add(appName);

                        pa.Add("@Descrption");
                        pv.Add(desc);



                        DBH.CreateDatasetSuggestion(ds, "sp_SuggestionMaster", true, pa, pv);

                    }
                }
            }
            else
            {
                        DBHandler DBH = new DBHandler();
                        DataSet ds = new DataSet();
                        DataTable dt = new DataTable();
                        ArrayList pa = new ArrayList();
                        ArrayList pv = new ArrayList();

                        pa.Add("@oper");
                        pv.Add(0);

                        pa.Add("@AttachUrl");
                        pv.Add("");

                        pa.Add("@FileName");
                        pv.Add("");

                        pa.Add("@UserId");
                        pv.Add(Convert.ToInt32(userId));

                        pa.Add("@EmpName");
                        pv.Add(empName);

                        pa.Add("@EmpNo");
                        pv.Add(empNo);

                        pa.Add("@TypeOfSuggestion");
                        pv.Add(suggType);

                        pa.Add("@ProjectName");
                        pv.Add(projName);

                        pa.Add("@ApplicationName");
                        pv.Add(appName);

                        pa.Add("@Descrption");
                        pv.Add(desc);



                        DBH.CreateDatasetSuggestion(ds, "sp_SuggestionMaster", true, pa, pv);
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