<%@ WebHandler Language="C#" Class="FileUploadHandler" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

public class FileUploadHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        try
        {

            string fUploadFor = HttpContext.Current.Request.QueryString["fufor"];

            if (fUploadFor == "mykpi")
            {
                #region
                //start
                string KpiTransId = HttpContext.Current.Request.QueryString["kpitransid"];
                string CreatedBy = HttpContext.Current.Request.QueryString["createdby"];
                string CreatedDate = HttpContext.Current.Request.QueryString["createddate"];

                string pathAndFile = "";


                //commented this becasu for now due to security it will not allowing us to create any directory into crmss folder
                //string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/Collection");
                //string[] files;
                //int numFiles;
                //files = System.IO.Directory.GetFiles(dirFullPath);  //for reading all files from server path
                //numFiles = files.Length;
                //numFiles = numFiles + 1;
                //string str_image = "";

                foreach (string s in context.Request.Files)
                {
                    HttpPostedFile file = context.Request.Files[s];
                    string fileName = KpiTransId + " - " + file.FileName;
                    string fileExtension = file.ContentType;

                    if (!string.IsNullOrEmpty(fileName))
                    {
                        //fileExtension = Path.GetExtension(fileName);
                        //file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/KPI/KpiResponse"), fileName));

                        pathAndFile = "\\\\zylab\\Econnect\\KPI\\";
                        pathAndFile += KpiTransId + " - " + file.FileName;
                        file.SaveAs(pathAndFile);
                    }
                }

                using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["CRMEConnectDataCon"].ToString()))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("exec [sp_Bulk_AddKpiTransDocs] @listPara", con))
                    {
                        using (var table = new DataTable())
                        {
                            table.Columns.Add("KpiTransId", typeof(Int64));
                            table.Columns.Add("CreatedDate", typeof(string));
                            table.Columns.Add("CreatedBy", typeof(string));

                            table.Columns.Add("FileName", typeof(string));
                            table.Columns.Add("ImageURL", typeof(string));

                            //table.Columns.Add("Item2", typeof(string));

                            foreach (string s in context.Request.Files)
                            {
                                HttpPostedFile file = context.Request.Files[s];
                                string fileName = KpiTransId + " - " + file.FileName;
                                string fileExtension = file.ContentType;

                                table.Rows.Add(
                               Convert.ToInt64(KpiTransId),
                               CreatedDate,
                               CreatedBy,
                               fileName,
                               //pathAndFile
                               "\\\\zylab\\Econnect\\KPI\\" + fileName
                               );
                            }

                            var pList = new SqlParameter("@listPara", SqlDbType.Structured);
                            pList.TypeName = "dbo.KpiResponseDocsList";
                            pList.Value = table;

                            cmd.Parameters.Add(pList);
                            //cmd.Parameters.Add(new SqlParameter("@listPara", SqlDbType.Structured));
                            cmd.ExecuteReader();

                        }
                    }
                }
                #endregion
            }
            else if (fUploadFor == "todotaskchat")
            {
                UploadTaskFiles(context);
            }
            else if (fUploadFor == "survey")
            {
                UploadSurveyFiles(context);
            }
            else if (fUploadFor == "projbudget")
            {
                UploadProjBudgetFiles(context);
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
    public string claculateFileSize(float bytes) {
        string finalSize = "";
        if (bytes >= 1073741824) { finalSize = Math.Round(bytes / 1073741824, 2) + " GB"; }
        else if (bytes >= 1048576) { finalSize = Math.Round(bytes / 1048576, 2)  + " MB"; }
        else if (bytes >= 1024) { finalSize = Math.Round(bytes / 1024, 2) + " KB"; }
        else if (bytes > 1) { finalSize = bytes + " bytes"; }
        else if (bytes == 1) { finalSize = bytes + " byte"; }
        else { finalSize = "0 bytes"; }
        return finalSize;
    }


    public void UploadTaskFiles(HttpContext context) {
        string TaskId = HttpContext.Current.Request.QueryString["taskid"];
        string CreatedBy = HttpContext.Current.Request.QueryString["crby"];
        string CreatedDate = HttpContext.Current.Request.QueryString["crdate"];

        string pathAndFile = "";


        //commented this becasu for now due to security it will not allowing us to create any directory into crmss folder
        //string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/Collection");
        //string[] files;
        //int numFiles;
        //files = System.IO.Directory.GetFiles(dirFullPath);  //for reading all files from server path
        //numFiles = files.Length;
        //numFiles = numFiles + 1;
        //string str_image = "";

        foreach (string s in context.Request.Files)
        {
            HttpPostedFile file = context.Request.Files[s];
            string fileName = TaskId + " ; " + file.FileName;
            string fileExtension = file.ContentType;
            claculateFileSize(file.ContentLength);
            if (!string.IsNullOrEmpty(fileName))
            {
                //fileExtension = Path.GetExtension(fileName);
                //file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/TODONew/Task"), fileName));


                pathAndFile = "\\\\zylab\\Econnect\\Project_Mgmt\\";
                pathAndFile += TaskId + " ; " + file.FileName;
                file.SaveAs(pathAndFile);
            }
        }

        using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["TODOV2"].ToString()))
        {
            con.Open();

            using (SqlCommand cmd = new SqlCommand("exec [sp_Bulk_TaskChatFiles] @listPara", con))
            {
                using (var table = new DataTable())
                {
                    table.Columns.Add("TaskId", typeof(Int64));
                    table.Columns.Add("CreatedDate", typeof(string));
                    table.Columns.Add("CreatedBy", typeof(string));

                    table.Columns.Add("FileName", typeof(string));
                    table.Columns.Add("ImageURL", typeof(string));
                    table.Columns.Add("FileSize", typeof(string));
                    table.Columns.Add("Comment", typeof(string));

                    //table.Columns.Add("Item2", typeof(string));

                    foreach (string s in context.Request.Files)
                    {
                        HttpPostedFile file = context.Request.Files[s];
                        string fileName = TaskId + " ; " + file.FileName;
                        string fileExtension = file.ContentType;

                        table.Rows.Add(
                       Convert.ToInt64(TaskId),
                       CreatedDate,
                       CreatedBy,
                       fileName,
                       //pathAndFile
                       "\\\\zylab\\Econnect\\Project_Mgmt\\" + fileName,
                       claculateFileSize(file.ContentLength)
                       );
                    }

                    var pList = new SqlParameter("@listPara", SqlDbType.Structured);
                    pList.TypeName = "dbo.TaskChatFileList";
                    pList.Value = table;

                    cmd.Parameters.Add(pList);
                    //cmd.Parameters.Add(new SqlParameter("@listPara", SqlDbType.Structured));
                    cmd.ExecuteReader();

                }
            }
        }
    }


    //Survey
    public void UploadSurveyFiles(HttpContext context) {
        string EmpNo = HttpContext.Current.Request.QueryString["empno"];
        string Comment = HttpContext.Current.Request.QueryString["comment"];
        string SurveyId = HttpContext.Current.Request.QueryString["surveyid"];
        string CrDate = HttpContext.Current.Request.QueryString["crdate"];

        string pathAndFile = "";


        //commented this becasu for now due to security it will not allowing us to create any directory into crmss folder
        //string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/Survey");
        //string[] files;
        //int numFiles;
        //files = System.IO.Directory.GetFiles(dirFullPath);  //for reading all files from server path
        //numFiles = files.Length;
        //numFiles = numFiles + 1;
        //string str_image = "";

        string fileName = "";
        foreach (string s in context.Request.Files)
        {
            HttpPostedFile file = context.Request.Files[s];
            fileName = EmpNo + " ; " + file.FileName;
            string fileExtension = file.ContentType;
            claculateFileSize(file.ContentLength);
            if (!string.IsNullOrEmpty(fileName))
            {
                fileExtension = Path.GetExtension(fileName);
                file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/Survey"), fileName));


                pathAndFile = "../Images/Survey/" + fileName;
                //pathAndFile += TaskId + ";" + fileName.ToLower();
                //file.SaveAs(pathAndFile);
            }
        }

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@Comment");
        pv.Add(Comment);

        pa.Add("@SurveyId");
        pv.Add(SurveyId);

        pa.Add("@URL");
        pv.Add( pathAndFile);

        pa.Add("@FileName");
        pv.Add(fileName);


        if (!string.IsNullOrEmpty(Comment) || !string.IsNullOrEmpty(fileName))
        {
            DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_Survey", true, pa, pv);
        }


    }


    //Project Budget
    public void UploadProjBudgetFiles(HttpContext context)
    {
        string BudgetId = HttpContext.Current.Request.QueryString["budgetid"];
        string CreatedBy = HttpContext.Current.Request.QueryString["crby"];
        string CreatedDate = HttpContext.Current.Request.QueryString["crdate"];

        string pathAndFile = "";

        foreach (string s in context.Request.Files)
        {
            HttpPostedFile file = context.Request.Files[s];
            string fileName = BudgetId + " ; " + file.FileName;
            string fileExtension = file.ContentType;
            claculateFileSize(file.ContentLength);
            if (!string.IsNullOrEmpty(fileName))
            {
                //fileExtension = Path.GetExtension(fileName);
                //file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/TODONew/Task"), fileName));


                pathAndFile = "\\\\zylab\\Econnect\\Project_Mgmt\\Project\\";
                pathAndFile += BudgetId + "__" + file.FileName;
                file.SaveAs(pathAndFile);
            }
        }

        using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["TODOV2"].ToString()))
        {
            con.Open();

            using (SqlCommand cmd = new SqlCommand("exec [sp_BulkProjBudgetAttach] @listPara", con))
            {
                using (var table = new DataTable())
                {
                    table.Columns.Add("BudgetId", typeof(Int64));
                    table.Columns.Add("FileName", typeof(string));
                    table.Columns.Add("FileType", typeof(string));

                    table.Columns.Add("URL", typeof(string));
                    table.Columns.Add("CreatedDate", typeof(string));
                    table.Columns.Add("CreatedBy", typeof(string));

                    //table.Columns.Add("Item2", typeof(string));

                    foreach (string s in context.Request.Files)
                    {
                        HttpPostedFile file = context.Request.Files[s];
                        string fileName = BudgetId + "__" + file.FileName;
                        string fileExtension = file.ContentType;

                        table.Rows.Add(
                       Convert.ToInt64(BudgetId),
                       fileName,
                       file.ContentType,
                       "\\\\zylab\\Econnect\\Project_Mgmt\\Project\\" + fileName,
                       CreatedDate,
                       CreatedBy
                       );
                    }

                    var pList = new SqlParameter("@listPara", SqlDbType.Structured);
                    pList.TypeName = "dbo.ProjBudgetFiles";
                    pList.Value = table;

                    cmd.Parameters.Add(pList);
                    //cmd.Parameters.Add(new SqlParameter("@listPara", SqlDbType.Structured));
                    cmd.ExecuteReader();

                }
            }
        }
    }
    
    
    
}