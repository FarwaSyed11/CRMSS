<%@ WebHandler Language="C#" Class="QuotationExcelUpload" %>

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

public class QuotationExcelUpload : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            string QuotationID = HttpContext.Current.Request.QueryString["QuotationID"];
            string QTNNumber = HttpContext.Current.Request.QueryString["QTNNumber"];
            string UserID = HttpContext.Current.Request.QueryString["UserID"];
            string dirFullPath = HttpContext.Current.Server.MapPath("~/CRMQuotation/UploadedFiles");

            foreach (string s in context.Request.Files)
            {

                HttpPostedFile file = context.Request.Files[s];
                string fileName = file.FileName;
                string fileExtension = file.ContentType;
                string FilePath = "";

                if (!string.IsNullOrEmpty(fileName))
                {
                    fileExtension = Path.GetExtension(fileName);
                    file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/CRMQuotation/UploadedFiles"), fileName));
                    FilePath = System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/CRMQuotation/UploadedFiles"), fileName);

                    DBHandler DBH = new DBHandler();

                    DataTable DtbExel = new DataTable();
                    DBH.CreateDataTable(DtbExel, FilePath, fileExtension, "Yes");
                    DtbExel.TableName = "Table1";
                    StringWriter swStringWriter = new StringWriter();
                    DtbExel.WriteXml(swStringWriter);
                    string xmlString = swStringWriter.ToString();


                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();
                    DataSet ds = new DataSet();
                    pa.Add("@XmlString");
                    pv.Add(xmlString);

                    pa.Add("@Oper");
                    pv.Add(1);

                    pa.Add("@QuotationId");
                    pv.Add(Convert.ToInt64(QuotationID));

                    pa.Add("@QtNnumber");
                    pv.Add(QTNNumber);

                    pa.Add("@UserId");
                    pv.Add(Convert.ToInt32(UserID));



                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationItemUpload", true, pa, pv);

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