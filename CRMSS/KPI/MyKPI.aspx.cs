using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;


public partial class KPI_MyKPI : System.Web.UI.Page
{
    protected string UploadFolderPath = "../Images/KPI/KpiResponse/";
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 9;
        hfServerMapPth.Value = System.IO.Path.Combine(Server.MapPath(UploadFolderPath)).ToString();
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string InsertKpiTransaction(KpiTransaction data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //dt.Columns.Add("MatricsId");
        //dt.Columns.Add("MatricsTextboxId");
        //foreach (var item in data.MatricsTransactionList)
        //{
        //    dt.Rows.Add(item.MatricsId, item.MatricsTextboxId);
        //}

        if (data.Point.ToUpper().Trim() == "NAN" || data.Point.ToUpper().Trim() == "INFINITY" || data.Point.ToUpper() == "")
        {
            data.Point = "0";
        }
        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@empnum");
        pv.Add(data.EmpNum);

        pa.Add("@Kpiid");
        pv.Add(Convert.ToInt32(data.KpiId));

        pa.Add("@indicator");
        pv.Add(data.Indicator);
        pa.Add("@indicatortarget");
        pv.Add(data.IndicatorTarget);
        pa.Add("@indicatortype");
        pv.Add(data.IndicatorType);
        pa.Add("@Point");
        pv.Add(data.Point);
        pa.Add("@SuccessPerc");
        pv.Add(data.ScuccessPercen);
        pa.Add("@weightage");
        pv.Add(Convert.ToInt32(data.Weight));
        pa.Add("@Comment");
        pv.Add(data.EmpComment);
        pa.Add("@Status");
        pv.Add(Common.KpiTransStatusEnum.DRAFT.ToString());

        pa.Add("@SelMonth");
        pv.Add(data.SelMonth);

        pa.Add("@Year");
        pv.Add(data.ActualYear);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);
        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);
        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

        //pa.Add("'@udt'");
        //pv.Add(dt);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);
        string KpiTransactionId = ds.Tables[0].Rows[0]["KpiTransId"].ToString();
       

        foreach (var item in data.MatricsTransactionList)
        {
            pa.Clear();
            pv.Clear();

            pa.Add("@oper");
            pv.Add("1");
            pa.Add("@kpiTransactionId");
            pv.Add(Convert.ToInt32(KpiTransactionId));
            pa.Add("@MatricId");
            pv.Add(item.MatricsId);
            pa.Add("@MatricsTxtId");
            pv.Add(item.MatricsTextboxId);
            pa.Add("@MatricsValByEmp");
            pv.Add(item.MatricsValueByEmp =="" ? "0" : item.MatricsValueByEmp);

            pa.Add("@SelMonth");
            pv.Add(data.SelMonth);
            pa.Add("@Year");
            pv.Add(data.ActualYear);

            pa.Add("@CreatedDate");
            pv.Add(data.CreatedDate);
            pa.Add("@CreatedBy");
            pv.Add(data.CreatedBy);

            pa.Add("@UpdatedDate");
            pv.Add(data.UpdatedDate);
            pa.Add("@UpdatedBy");
            pv.Add(data.UpdatedBy);


            DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);
        }



        return KpiTransactionId;
        // return 1;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SubmitMyKpi(KpiTransaction data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add("5");
      

        pa.Add("@empnum");
        pv.Add(data.EmpNum);


        pa.Add("@SelMonth");
        pv.Add(Convert.ToInt32(data.SelMonth));

        pa.Add("@Year");
        pv.Add(data.ActualYear);

        pa.Add("@Status");
        pv.Add(Common.KpiTransStatusEnum.SUBMITTED.ToString());

        if (Convert.ToInt32(data.IsManangerOwner) > 0)
        {
            pa.Add("@ManagerStatus");
            pv.Add(Common.KpiTransStatusEnum.APPROVED.ToString());

            pa.Add("@UpdatedBy");
            pv.Add(Common.KpiTransStatusEnum.APPROVED_BY_SYSTEM.ToString());
            // IsManangerOwner
        }
        else
        {
            pa.Add("@ManagerStatus");
            pv.Add(Common.KpiTransStatusEnum.PENDING.ToString());
        }
    
        pa.Add("@EmpReviewCommentForManager");
        pv.Add(data.EmpReviewCommentForManager);

        pa.Add("@ManagerRatingByEmp");
        pv.Add(Convert.ToInt32(data.EmpRatingForManager));
      

        //pa.Add("'@udt'");
        //pv.Add(dt);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static KpiTransaction GetKpiTransaction(string Kpiid, int SelectedMonth,int Year)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        KpiTransaction oKT = new KpiTransaction();

        List<KpiMatricsTransaction> oMTList = new List<KpiMatricsTransaction>();

        pa.Add("@oper");
        pv.Add("22");

        pa.Add("@Kpiid");
        pv.Add(Convert.ToInt32(Kpiid));

        //pa.Add("@Status");
        //pv.Add(Common.KpiTransStatusEnum.DRAFT.ToString());

        pa.Add("@SelMonth");
        pv.Add(SelectedMonth);

        pa.Add("@Year");
        pv.Add(Year);
        //pa.Add("'@udt'");
        //pv.Add(dt);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);

        if (ds.Tables[0].Rows.Count != 0 && ds.Tables[1].Rows.Count != 0)
        {
            dt = ds.Tables[0];

            oKT.KpiTransId = dt.Rows[0]["KpiTransactionId"].ToString();
            oKT.Weight = dt.Rows[0]["Weightage"].ToString();
            oKT.ScuccessPercen = dt.Rows[0]["SuccessPercentage"].ToString();
            oKT.Point = dt.Rows[0]["Point"].ToString();
            oKT.EmpComment = dt.Rows[0]["RequesterComment"].ToString();


            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oMTList.Add(new KpiMatricsTransaction()
                {
                    MatricsTextboxId = ds.Tables[1].Rows[i]["MatricsTextboxId"].ToString(),
                    MatricsValueByEmp = ds.Tables[1].Rows[i]["MatricsValue"].ToString()
                });
            }

            oKT.MatricsTransactionList = oMTList;
        }
       
        return oKT;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetSavedKpisCount(string EmpNum, int SelectedMonth, string SelectedDate, int Year)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        KpiTransaction oKT = new KpiTransaction();

        List<KpiMatricsTransaction> oMTList = new List<KpiMatricsTransaction>();

        pa.Add("@oper");
        pv.Add("33");

        pa.Add("@empnum");
        pv.Add(EmpNum);

        pa.Add("@SelMonth");
        pv.Add(SelectedMonth);

        pa.Add("@SelDate");
        pv.Add(SelectedDate);

        pa.Add("@Year");
        pv.Add(Year);
        //pa.Add("@Status");
        //pv.Add(KpiTransStatusEnum.Draft);

        //pa.Add("'@udt'");
        //pv.Add(dt);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt.Columns.Add("AssignedKpis", typeof(string));
            dt.Columns.Add("SavedKpis", typeof(string));

            dt.Rows.Add(ds.Tables[0].Rows[0]["AssignedKpis"], ds.Tables[1].Rows[0]["SavedKpis"]);
            //dt.Rows.Add(ds.Tables[1].Rows[1]["SavedKpis"]);
        }

        var res = DataTableToJSONWithStringBuilder(dt);
        return res;

        //return oKT;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static KPI GetMatricsAccToUserKPI(string empnum, string selMonth, string selDate, string reviewerStatus, int year)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("44");

        pa.Add("@empnum");
        pv.Add(empnum);


        pa.Add("@SelMonth");
        pv.Add(Convert.ToInt32(selMonth));

        pa.Add("@Year");
        pv.Add(year);

        pa.Add("@SelDate");
        pv.Add(selDate);

        pa.Add("@ManagerStatus");
        pv.Add(reviewerStatus);
        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);

        List<Indicators> indList = new List<Indicators>();
        List<Matrics> matList = new List<Matrics>();
        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            indList.Add(
                new Indicators()
                {
                    EmpNumber = dt.Rows[i]["EmpNumber"].ToString(),
                    Indicator = dt.Rows[i]["Indicator"].ToString(),
                    IndicatorType = dt.Rows[i]["IndicatorType"].ToString(),
                    KpiMasterId = dt.Rows[i]["KpiMasterId"].ToString(),
                    TargetDescription = dt.Rows[i]["TargetDescription"].ToString(),
                    Weightage = dt.Rows[i]["Weightage"].ToString(),
                    KpiStartDate = dt.Rows[i]["KpiStartDate"].ToString(),
                    KpiEndDate = dt.Rows[i]["KpiEndDate"].ToString(),
                    CompReduceValue = dt.Rows[i]["ComplaintReduceValue"].ToString(),
                    IsLineManagerOwner = dt.Rows[i]["IsLineManOwner"].ToString(),


                });
        }

        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
        {
            matList.Add(
                new Matrics()
                {
                    KpimasterIdFk = ds.Tables[1].Rows[i]["KpiMasterId"].ToString(),
                    KpiMatricsId = ds.Tables[1].Rows[i]["KpiMatricsId"].ToString(),
                    Matric = ds.Tables[1].Rows[i]["Matrics"].ToString(),
                    MatricsMonth = ds.Tables[1].Rows[i]["MatricsMonth"].ToString(),
                    TargetByAdmin = ds.Tables[1].Rows[i]["TargetByAdmin"].ToString(),
                    Istarget = Convert.ToBoolean(String.IsNullOrEmpty(ds.Tables[1].Rows[i]["IsTarget"].ToString()) ? false : Convert.ToBoolean(ds.Tables[1].Rows[i]["IsTarget"])),
                    IsAchievement = Convert.ToBoolean(String.IsNullOrEmpty(ds.Tables[1].Rows[i]["IsAchievement"].ToString()) ? false : Convert.ToBoolean(ds.Tables[1].Rows[i]["IsAchievement"]))
                });
        }




        KPI objKPI = new KPI();
        objKPI.KPIList = indList;
        objKPI.MatricsList = matList;

        return objKPI;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetTransactionsKpiYearly(string EmpNum, string Year)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        KpiTransaction oKT = new KpiTransaction();

        List<KpiMatricsTransaction> oMTList = new List<KpiMatricsTransaction>();

        pa.Add("@oper");
        pv.Add("66");

        pa.Add("@empnum");
        pv.Add(EmpNum);

        pa.Add("@Year");
        pv.Add(Convert.ToInt32(Year));
        //pa.Add("@Status");
        //pv.Add(KpiTransStatusEnum.Draft);

        //pa.Add("'@udt'");
        //pv.Add(dt);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);

        //if (ds.Tables.Count > 0)
        if (ds.Tables[0].Rows.Count > 0)
        {
            dt.Columns.Add("Month", typeof(string));
            dt.Columns.Add("Year", typeof(string));
            //dt.Columns.Add("KpiEndDate", typeof(string));
            dt.Columns.Add("RequesterStatus", typeof(string));
            dt.Columns.Add("ReviewerStatus", typeof(string));
            dt.Columns.Add("KpiStartDate", typeof(string));
            dt.Columns.Add("KpiTrans", typeof(string));

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dt.Rows.Add(
                ds.Tables[0].Rows[i]["Month"],
                ds.Tables[0].Rows[i]["Year"],
                //ds.Tables[0].Rows[i]["KpiEndDate"],
                ds.Tables[0].Rows[i]["RequesterStatus"],
                ds.Tables[0].Rows[i]["ReviewerStatus"],
                ds.Tables[0].Rows[i]["KpiStartDate"],
                ds.Tables[0].Rows[i]["KpiTrans"]
                );
            }
            
    
            //dt.Rows.Add(ds.Tables[1].Rows[1]["SavedKpis"]);
            var res = DataTableToJSONWithStringBuilder(dt);
            return res;
        }

        return "";

        //return oKT;

    }


    //for check if previous minth of Decemberis filled and approved so start with next year january
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetTransactionsKpiPrecviousYear(string EmpNum, string Year)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        KpiTransaction oKT = new KpiTransaction();

        List<KpiMatricsTransaction> oMTList = new List<KpiMatricsTransaction>();

        pa.Add("@oper");
        pv.Add("6");

        pa.Add("@empnum");
        pv.Add(EmpNum);

        pa.Add("@Year");
        pv.Add(Convert.ToInt32(Year));
        //pa.Add("@Status");
        //pv.Add(KpiTransStatusEnum.Draft);

        //pa.Add("'@udt'");
        //pv.Add(dt);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);

        //if (ds.Tables.Count > 0)
        if (ds.Tables[0].Rows.Count > 0)
        {
            dt.Columns.Add("Month", typeof(string));
            dt.Columns.Add("Year", typeof(string));
            //dt.Columns.Add("KpiEndDate", typeof(string));
            dt.Columns.Add("RequesterStatus", typeof(string));
            dt.Columns.Add("ReviewerStatus", typeof(string));

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dt.Rows.Add(
                ds.Tables[0].Rows[i]["Month"],
                ds.Tables[0].Rows[i]["Year"],
                //ds.Tables[0].Rows[i]["KpiEndDate"],
                ds.Tables[0].Rows[i]["RequesterStatus"],
                ds.Tables[0].Rows[i]["ReviewerStatus"]
                );
            }


            //dt.Rows.Add(ds.Tables[1].Rows[1]["SavedKpis"]);
            var res = DataTableToJSONWithStringBuilder(dt);
            return res;
        }

        return "";

        //return oKT;

    }


    //Getting total KPI points for label
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetTotalPointsKpi(string EmpNum, int Year, int Month)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        KpiTransaction oKT = new KpiTransaction();

        List<KpiMatricsTransaction> oMTList = new List<KpiMatricsTransaction>();

        pa.Add("@oper");
        pv.Add("67");

        pa.Add("@empnum");
        pv.Add(EmpNum);

        pa.Add("@SelMonth");
        pv.Add(Month);

        pa.Add("@Year");
        pv.Add(Year);
        //pa.Add("@Status");
        //pv.Add(KpiTransStatusEnum.Draft);

        //pa.Add("'@udt'");
        //pv.Add(dt);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);

        //if (ds.Tables.Count > 0)
        if (ds.Tables[0].Rows.Count > 0)
        {
            dt.Columns.Add("TotalPoint", typeof(string));

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dt.Rows.Add(
                ds.Tables[0].Rows[i]["TotalPoint"]
                );
            }


            //dt.Rows.Add(ds.Tables[1].Rows[1]["SavedKpis"]);
            var res = DataTableToJSONWithStringBuilder(dt);
            return res;
        }

        return "";

        //return oKT;

    } 
    
    //Getting Attachments for kpi transactions
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<KpiAttachment> GetAttachmentsForKpiTrans(int KpiTransId)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        KpiTransaction oKT = new KpiTransaction();

        List<KpiAttachment> oListKA = new List<KpiAttachment>();

        pa.Add("@oper");
        pv.Add(68);

        pa.Add("@kpiTransactionId");
        pv.Add(KpiTransId);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);

        //if (ds.Tables.Count > 0)
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                oListKA.Add(new KpiAttachment()
                {
                    KpiAttachId = ds.Tables[0].Rows[i]["KpiAttachId"].ToString(),
                    KpiTransId = ds.Tables[0].Rows[i]["KpiTransId"].ToString(),
                    KpiId = ds.Tables[0].Rows[i]["KpiId"].ToString(),
                    FileName = ds.Tables[0].Rows[i]["FileName"].ToString(),
                    URL = ds.Tables[0].Rows[i]["URL"].ToString(),
                    CreatedBy = ds.Tables[0].Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = ds.Tables[0].Rows[i]["CreatedDate"].ToString()
                });
            }            
        }

        return oListKA;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteAttachment(int AttachId, string serverPath, string FileName)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        
        //string Path = serverPath + FileName; //+ FileName;
        string Path = serverPath; //+ FileName;

        FileInfo file = new FileInfo(Path);
        if (file.Exists)
        {
            file.Delete();
        }

        pa.Add("@oper");
        pv.Add(69);

        pa.Add("@AttachId");
        pv.Add(AttachId);


        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DownloadAttach(string serverPath)
    {
        var uri = new Uri(serverPath); // Here I get the error
        var fName = Path.GetFullPath(uri.LocalPath);
        var fileInfo = new FileInfo(fName);

        var response = HttpContext.Current.Response;

        response.Clear();
        response.ClearContent();
        response.ClearHeaders();

        response.Buffer = true;
        response.AppendHeader("Content-Disposition", "attachment; filename=" + fileInfo.Name);
        // response.AddHeader("Content-Description", "attachment;filename=" + fileInfo.FullName);
        response.WriteFile(uri.LocalPath);

        response.End();

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void ConvertBase64ToImg(string imgStr)
    {
        // Convert base 64 string to byte[]
        byte[] imageBytes = Convert.FromBase64String(imgStr.Split(',')[1]);
        // Convert byte[] to Image
        //Image image = new Image();
        using (var ms = new MemoryStream(imageBytes, 0, imageBytes.Length))
        {
             Image image = Image.FromStream(ms, true);
            //return image;

            //String path = HttpContext.Current.Server.MapPath("\\\\zylab\\Econnect\\KPI\\"); //Path
            String path = "\\\\zylab\\Econnect\\Fire_Duct\\Signature"; //Path

            //Check if directory exist
            if (!System.IO.Directory.Exists(path))
            {
                System.IO.Directory.CreateDirectory(path); //Create directory if it doesn't exist
            }

            string imageName = "ImageName" + ".png";

            //set the image path
            string imgPath = Path.Combine(path, imageName);

            image.Save(imgPath, System.Drawing.Imaging.ImageFormat.Jpeg);
        }
        
    }

    //This function is not using currenlty. Its for example if you use the same thing in mvc or API
    //In Base64 string You have all bytes of image. You don't need create Image object. All what you need is decode from Base64 and save this bytes as file.
    public bool SaveImage(string ImgStr, string ImgName)
    {
        String path = HttpContext.Current.Server.MapPath("~/ImageStorage"); //Path

        //Check if directory exist
        if (!System.IO.Directory.Exists(path))
        {
            System.IO.Directory.CreateDirectory(path); //Create directory if it doesn't exist
        }

        string imageName = ImgName + ".jpg";

        //set the image path
        string imgPath = Path.Combine(path, imageName);

        byte[] imageBytes = Convert.FromBase64String(ImgStr);

        File.WriteAllBytes(imgPath, imageBytes);

        return true;
    }

    //----------------------------------------------------------------------------------------------------

    public static string DataTableToJSONWithStringBuilder(DataTable table)
    {
        var JSONString = new StringBuilder();
        if (table.Rows.Count > 0)
        {
            JSONString.Append("[");
            for (int i = 0; i < table.Rows.Count; i++)
            {
                JSONString.Append("{");
                for (int j = 0; j < table.Columns.Count; j++)
                {
                    if (j < table.Columns.Count - 1)
                    {
                        JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                    }
                    else if (j == table.Columns.Count - 1)
                    {
                        JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                    }
                }
                if (i == table.Rows.Count - 1)
                {
                    JSONString.Append("}");
                }
                else
                {
                    JSONString.Append("},");
                }
            }
            JSONString.Append("]");
        }
        return JSONString.ToString();
    }

    public class KpiTransaction
    {
        public string KpiTransId { get; set; }

        public string EmpNum { get; set; }

        public string KpiId { get; set; }
        public string Indicator { get; set; }
        public string IndicatorType { get; set; }
        public string Weight { get; set; }
        public string IndicatorTarget { get; set; }

        public string ScuccessPercen { get; set; }
        public string Point { get; set; }
        public string EmpComment { get; set; }
        public string EmpOrRequesterStatus { get; set; }

        public string LineManagerName { get; set; }
        public string LineMangerComment { get; set; }
        public string LMorReviewerStatus { get; set; }
        public string EmpReviewCommentForManager { get; set; }
        public string EmpRatingForManager { get; set; }

        public int SelMonth { get; set; }
        public int ActualYear { get; set; }
        public List<KpiMatricsTransaction> MatricsTransactionList { get; set; }

        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string UpdatedBy { get; set; }

        public int IsManangerOwner { get; set; }
        //private string _name;
        //private int _id;
        //public string name
        //{
        //    get { return _name; }
        //    set { _name = value; }
        //}
        //public int id
        //{
        //    get { return _id; }
        //    set { _id = value; }
        //}
    }

    public class KpiMatricsTransaction
    {
        public string KpiTransactionId { get; set; }
        public string KpiMasterId { get; set; }
        public string MatricsName { get; set; }
        public string MatricsId { get; set; }
        public string MatricsTextboxId { get; set; }
        public string MatricsValueByEmp { get; set; }
        public string IsTarget { get; set; }
        public string IsAchievement { get; set; }
    }
    public class Indicators
    {
        public string KpiMasterId { get; set; }
        public string Indicator { get; set; }
        public string TargetDescription { get; set; }
        public string IndicatorType { get; set; }
        public string Weightage { get; set; }

        //public string CreatedBy { get; set; }
        //public string EmpName { get; set; }
        public string EmpNumber { get; set; }
        //public string DeptName { get; set; }
        public string KpiStartDate { get; set; }
        public string KpiEndDate { get; set; }
        public string CompReduceValue { get; set; }

        public string IsLineManagerOwner { get; set; }
    }

    public class KPI
    {
        public List<Indicators> KPIList { get; set; }
        public List<Matrics> MatricsList { get; set; }
    }
    public class Matrics
    {
        public string KpiMatricsId { get; set; }
        public string KpimasterIdFk { get; set; }
        public string Matric { get; set; }
        //public string MatricsAssignedTarget { get; set; }
        //public string MatricsAchievedTarget { get; set; }
        public bool Istarget { get; set; }
        public bool IsAchievement { get; set; }
        public string MatricsMonth { get; set; }
        public string TargetByAdmin { get; set; }
    }

    public class KpiAttachment {
        public string KpiAttachId { get; set; }
        public string KpiTransId { get; set; }
        public string KpiId { get; set; }
        public string FileName { get; set; }
        public string URL { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
    }


    
}

