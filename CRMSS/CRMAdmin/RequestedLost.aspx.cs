using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class CRMAdmin_RequestedLost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 1;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetCompanyDDL(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@userId");
        pv.Add(UserID);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AdminRequestedLost", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Company"].ToString(),
                ddlText = dt.Rows[i]["Company"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetSalesmanager(string UserID, string Company)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@Company");
        pv.Add(Company);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AdminRequestedLost", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["ManagerID"].ToString(),
                ddlText = dt.Rows[i]["ManagerName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetSalesman(string UserID, string Company, string Manager)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@Manager");
        pv.Add(Manager);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AdminRequestedLost", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["SalemanID"].ToString(),
                ddlText = dt.Rows[i]["Saleman"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID, string Company, string Manager, string salesman)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@Manager");
        pv.Add(Manager);

        pa.Add("@Salesman");
        pv.Add(salesman);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AdminRequestedLost", true, pa, pv);

        List<tableData> drpval = new List<tableData>();
        dt = ds.Tables[0];




        for (int i = 0; i < dt.Rows.Count; i++)
        {
            List<string> Competlist = new List<string>();
            for (int j = 0; j < ds.Tables[1].Rows.Count; j++)
            {
                Competlist.Add(ds.Tables[1].Rows[j]["Competitor"].ToString());
            }

            List<string> ReasonList = new List<string>();
            for (int j = 0; j < ds.Tables[2].Rows.Count; j++)
            {
                ReasonList.Add(ds.Tables[2].Rows[j]["DataValueMember"].ToString());
            }

            drpval.Add(new tableData()
            {
                Company = dt.Rows[i]["Company"].ToString(),
                ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString(),
                OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString(),
                Name = dt.Rows[i]["Name"].ToString(),
                PlotNo = dt.Rows[i]["PlotNo"].ToString(),
                DeveloperClient = dt.Rows[i]["DeveloperClient"].ToString(),
                MEPContractor = dt.Rows[i]["MEPContractor"].ToString(),
                Owner = dt.Rows[i]["Owner"].ToString(),
                MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString(),
                Marketing = dt.Rows[i]["Marketing"].ToString(),
                StatusCode = dt.Rows[i]["StatusCode"].ToString(),
                SalesmanNotes = dt.Rows[i]["SalesmanNotes"].ToString(),
                Competitor = dt.Rows[i]["Competitor"].ToString(),
                CompetitorPrice = dt.Rows[i]["CompetitorPrice"].ToString(),
                LostDate = dt.Rows[i]["LostDate"].ToString(),
                LostReason = dt.Rows[i]["LostReason"].ToString(),

                CompetitorEnum = Competlist,
                LostReasonEnum = ReasonList

            });
        }
        return drpval;
        //string a = userId;
    }

    //classes


    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }

    public class tableData
    {
        public string Company { get; set; }

        public string OpportunityNumber { get; set; }
        public string ProjectNumber { get; set; }
        public string Name { get; set; }
        public string PlotNo { get; set; }
        public string DeveloperClient { get; set; }
        public string MEPContractor { get; set; }
        public string Owner { get; set; }
        public string MEPConsultant { get; set; }
        public string Marketing { get; set; }
        public string StatusCode { get; set; }
        public string SalesmanNotes { get; set; }
        public string Competitor { get; set; }
        public string CompetitorPrice { get; set; }

        public string LostDate { get; set; }

        public string LostReason { get; set; }

        public List<string> CompetitorEnum { get; set; }

        public List<string> LostReasonEnum { get; set; }



    }
    public class ResponseMsg
    {
        public string msg { get; set; }
        public string msgType { get; set; }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetOthersUpdates(string optnumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dtrev = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@optnumber");
        pv.Add(optnumber);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AdminRequestedLost", true, pa, pv);

        List<othersUpdate> drpval = new List<othersUpdate>();
        List<revenuedetail> revenuedetail = new List<revenuedetail>();

        List<popupdata> popupdata = new List<popupdata>();

        dt = ds.Tables[0];
        dtrev = ds.Tables[1];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new othersUpdate()
            {
                OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString(),
                MarketingNotes = dt.Rows[i]["MarketingNotes"].ToString(),
                MarketingCompetitor = dt.Rows[i]["MarketingCompetitor"].ToString(),
                MarketingReason = dt.Rows[i]["MarketingReason"].ToString(),
                MarketingUpdateDate = dt.Rows[i]["MarketingUpdateDate"].ToString(),
                SMNotes = dt.Rows[i]["SMNotes"].ToString(),
                SMCompetitor = dt.Rows[i]["SMCompetitor"].ToString(),
                SMReason = dt.Rows[i]["SMReason"].ToString(),
                SMUpdatedDate = dt.Rows[i]["SMUpdatedDate"].ToString(),
                Company = dt.Rows[i]["Company"].ToString(),
                ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString(),
                PlotNo = dt.Rows[i]["PlotNo"].ToString(),
                DeveloperClient = dt.Rows[i]["DeveloperClient"].ToString(),
                StatusCode = dt.Rows[i]["StatusCode"].ToString(),

            });
        }

        for (int i = 0; i < dtrev.Rows.Count; i++)
        {
            revenuedetail.Add(new revenuedetail()
            {
                ProductType = dtrev.Rows[i]["ProductType"].ToString(),
                SubStage = dtrev.Rows[i]["SubStage"].ToString(),
                SubStageDate = dtrev.Rows[i]["SubStageDate"].ToString(),
                RevenueStatus = dtrev.Rows[i]["RevenueStatus"].ToString(),
                RevenueAmount = dtrev.Rows[i]["RevenueAmount"].ToString(),
                Overview = dtrev.Rows[i]["Overview"].ToString(),
                SalesmanRemarks = dtrev.Rows[i]["SalesmanRemarks"].ToString(),
                WinPerc = dtrev.Rows[i]["WinPerc"].ToString(),
                UpdatedDate = dtrev.Rows[i]["UpdatedDate"].ToString(),

            });
        }

        popupdata.Add(new popupdata()
        {
            othersUpdates = drpval,
            revenuedetails= revenuedetail,
        });




        return popupdata;
        //string a = userId;
    }
    public class othersUpdate
    {
        public string OpportunityNumber { get; set; }

        public string MarketingNotes { get; set; }
        public string MarketingCompetitor { get; set; }
        public string MarketingReason { get; set; }
        public string MarketingUpdateDate { get; set; }
        public string SMNotes { get; set; }
        public string SMCompetitor { get; set; }
        public string SMReason { get; set; }
        public string SMUpdatedDate { get; set; }

        public string Company { get; set; }
        public string ProjectNumber { get; set; }
        public string PlotNo { get; set; }
        public string DeveloperClient { get; set; }
        public string StatusCode { get; set; }
        



    }
    public class revenuedetail
    {
        public string ProductType { get; set; }

        public string SubStage { get; set; }
        public string SubStageDate { get; set; }
        public string RevenueStatus { get; set; }
        public string RevenueAmount { get; set; }
        public string Overview { get; set; }
        public string SalesmanRemarks { get; set; }
        public string WinPerc { get; set; }
        public string UpdatedDate { get; set; }


    }
    public class popupdata
    {
        public List<othersUpdate> othersUpdates { get; set; }
        public List<revenuedetail> revenuedetails { get; set; }

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string updatelostOPT(string userid, string optnumber, string remarks, string competitor, string reason)
    {
     


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dtrev = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");

        pa.Add("@optnumber");
        pv.Add(optnumber);

        pa.Add("@UserID");
        pv.Add(userid);

        pa.Add("@Remarks");
        pv.Add(remarks);

        pa.Add("@Reason");
        pv.Add(reason);

        pa.Add("@Competitor");
        pv.Add(competitor);

        //pa.Add("@optnumberencrypted");
        //pv.Add(_optencypted);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AdminRequestedLost", true, pa, pv);

        return "Success";



    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string SendRequetForRemove(string userid, string optnumber,string Reason)
    {



        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dtrev = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@optnumber");
        pv.Add(optnumber);

        pa.Add("@UserID");
        pv.Add(userid);

        pa.Add("@RejectReason");
        pv.Add(Reason);



        //pa.Add("@optnumberencrypted");
        //pv.Add(_optencypted);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AdminRequestedLost", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString(); 



    }

    //private static string Encrypt(string clearText)
    //{
    //    string EncryptionKey = "MAKV2SPBNI99212";
    //    byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
    //    using (Aes encryptor = Aes.Create())
    //    {
    //        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
    //        encryptor.Key = pdb.GetBytes(32);
    //        encryptor.IV = pdb.GetBytes(16);
    //        using (MemoryStream ms = new MemoryStream())
    //        {
    //            using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
    //            {
    //                cs.Write(clearBytes, 0, clearBytes.Length);
    //                cs.Close();
    //            }
    //            clearText = Convert.ToBase64String(ms.ToArray());
    //        }
    //    }
    //    return clearText;
    //}

}