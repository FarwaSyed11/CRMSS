<%@ WebHandler Language="C#" Class="FMContractDocument" %>


using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
public class FMContractDocument : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        try
        {
            string pathAndFile = "";

            string contractid = HttpContext.Current.Request.QueryString["contractid"];
            string crdate = HttpContext.Current.Request.QueryString["crdate"];
            string crby = HttpContext.Current.Request.QueryString["crby"];
            string unitid = HttpContext.Current.Request.QueryString["unitid"];
            string docchlistid = HttpContext.Current.Request.QueryString["docchlistid"];

            string NACheckbox = HttpContext.Current.Request.QueryString["nacheckbox"];
            string Status = "Applicable";
            if (NACheckbox == "true")
            {
                Status = "NotApplicable";
            }



            //commented this becasu for now due to security it will not allowing us to create any directory into crmss folder
            string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/FMDocuments");
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
                    //file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/Collection"), fileName));

                    pathAndFile = "\\\\ZYLAB\\Econnect\\FM_New\\General\\";
                    pathAndFile += "con_" + fileName;
                    file.SaveAs(pathAndFile);
                }
            }

            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["FM_DataCon"].ToString()))
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec [sp_ContractDdocumentUploaded] @listPara", con))
                {
                    using (var table = new DataTable())
                    {
                        table.Columns.Add("ContractID", typeof(Int64));
                        table.Columns.Add("CreatedDate", typeof(string));
                        table.Columns.Add("CreatedBy", typeof(string));
                        table.Columns.Add("UnitID", typeof(Int64));

                        table.Columns.Add("ImageURL", typeof(string));
                        table.Columns.Add("FileName", typeof(string));
                        table.Columns.Add("Stage", typeof(string));
                        table.Columns.Add("DocChListID", typeof(Int64));
                        table.Columns.Add("Status", typeof(string));

                        //table.Columns.Add("Item2", typeof(string));
                        if (context.Request.Files.Count == 0 && Status == "NotApplicable")
                        {
                            table.Rows.Add(
                     contractid,
                     crdate,
                     crby,
                     unitid,
                     pathAndFile,
                     "N/A",
                     "PreApproval" ,
                     docchlistid,
                     Status
                     );
                        }
                        else
                        {
                            foreach (string s in context.Request.Files)
                            {
                                HttpPostedFile file = context.Request.Files[s];
                                string fileName = "con_"+ file.FileName;
                                string fileExtension = file.ContentType;

                                table.Rows.Add(
                               contractid,
                               crdate,
                               crby,
                               unitid,
                               pathAndFile,
                               fileName,
                               "PreApproval" ,
                               docchlistid,
                               Status
                               );
                            }
                        }





                        var pList = new SqlParameter("@listPara", SqlDbType.Structured);
                        pList.TypeName = "dbo.FMContractFileUploadList";
                        pList.Value = table;

                        cmd.Parameters.Add(pList);
                        //cmd.Parameters.Add(new SqlParameter("@listPara", SqlDbType.Structured));
                        cmd.ExecuteReader();

                    }
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