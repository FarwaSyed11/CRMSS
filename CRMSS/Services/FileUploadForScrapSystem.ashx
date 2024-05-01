<%@ WebHandler Language="C#" Class="FileUploadForScrapSystem" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

public class FileUploadForScrapSystem : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        try
        {
            string ItemId = HttpContext.Current.Request.QueryString["ItemId"];
            string UserId = HttpContext.Current.Request.QueryString["User"];
            string Type = HttpContext.Current.Request.QueryString["Type"];
            string profileName = "";


            string pathAndFile = "";


            //commented this becasu for now due to security it will not allowing us to create any directory into crmss folder
            string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/Scrap_Items");
            string[] files;
            int numFiles;
            files = System.IO.Directory.GetFiles(dirFullPath);  //for reading all files from server path
            numFiles = files.Length;
            numFiles = numFiles + 1;
            string str_image = "";

            foreach (string s in context.Request.Files)
            {
                HttpPostedFile file = context.Request.Files[s];
                string fileName = ItemId + " - " + file.FileName;
                string fileExtension = file.ContentType;

                if (!string.IsNullOrEmpty(fileName))
                {
                    fileExtension = Path.GetExtension(fileName);

                    file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/Scrap_Items"), fileName));
                    profileName = fileName;
                    //pathAndFile = "\\\\zylab\\Econnect\\Scrap\\";
                    //pathAndFile += ItemId + " - " + file.FileName;
                    //file.SaveAs(pathAndFile);
                }
            }
            if(Type=="Gallery")
            {
                using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["SCAPCon"].ToString()))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("exec [sp_Bulk_ScrapRequestFiles] @listPara", con))
                    {
                        using (var table = new DataTable())
                        {
                            table.Columns.Add("ItemId", typeof(Int64));
                            table.Columns.Add("FileName", typeof(string));
                            table.Columns.Add("URL", typeof(string));
                            table.Columns.Add("CreatedBy", typeof(string));

                            //table.Columns.Add("Item2", typeof(string));

                            foreach (string s in context.Request.Files)
                            {
                                HttpPostedFile file = context.Request.Files[s];
                                string fileName = ItemId + " - " + file.FileName;
                                string fileExtension = file.ContentType;

                                table.Rows.Add(
                               Convert.ToInt64(ItemId),
                               fileName,
                               //pathAndFile
                               "../Images/Scrap_Items/" + fileName,
                               UserId
                               );
                            }

                            var pList = new SqlParameter("@listPara", SqlDbType.Structured);
                            pList.TypeName = "dbo.ScrapReqImages";
                            pList.Value = table;

                            cmd.Parameters.Add(pList);
                            //cmd.Parameters.Add(new SqlParameter("@listPara", SqlDbType.Structured));
                            cmd.ExecuteReader();

                        }
                    }
                }
            }

            else if(Type=="Profile")
            {
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add(9);

                pa.Add("@ItemId");
                pv.Add(ItemId);

                pa.Add("@FileName");
                pv.Add(profileName);

                pa.Add("@URL");
                pv.Add("../Images/Scrap_Items/" + profileName);


                DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

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