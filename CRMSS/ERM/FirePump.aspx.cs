//using Microsoft.Office.Interop.Excel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ERM_FirePump : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Tabledetails> getAllRequests(string UserId, string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<Tabledetails> drpval = new List<Tabledetails>();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new Tabledetails()
                {
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    EstimationID = dt.Rows[i]["EstimationID"].ToString(),
                    Estimator = dt.Rows[i]["Estimator"].ToString(),
                    ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                    RefNo = dt.Rows[i]["RefNo"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    RevNo = dt.Rows[i]["RevNo"].ToString(),
                    ContABBR = dt.Rows[i]["ContABBR"].ToString(),
                    Year = dt.Rows[i]["Year"].ToString(),
                    OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
                    ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString(),

                });
            }
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AllDetails> GetAllestimationdetails(string UserId, string EstID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@RefId");
        pv.Add(EstID);

        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<AllDetails> drpval = new List<AllDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new AllDetails()
                {

                    EstimationID = dt.Rows[i]["EstimationID"].ToString(),
                    Estimator = dt.Rows[i]["Estimator"].ToString(),
                    ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                    RefNo = dt.Rows[i]["RefNo"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    RevNo = dt.Rows[i]["RevNo"].ToString(),
                    ContABBR = dt.Rows[i]["ContABBR"].ToString(),
                    Year = dt.Rows[i]["Year"].ToString(),
                    OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
                    ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString(),
                    Location = dt.Rows[i]["Location"].ToString(),
                    Client = dt.Rows[i]["Client"].ToString(),
                    Consultant = dt.Rows[i]["Consultant"].ToString(),
                    MainContractor = dt.Rows[i]["MainContractor"].ToString(),
                    URL = dt.Rows[i]["URL"].ToString(),
                    MEPContractor = dt.Rows[i]["MEPContractor"].ToString(),
                    ContactID = dt.Rows[i]["ContactID"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    Scope = dt.Rows[i]["Scope"].ToString(),
                    QuotationType = dt.Rows[i]["QuotationType"].ToString(),
              
                    WinPerc = dt.Rows[i]["WinPerc"].ToString(),
                    Budget = dt.Rows[i]["Budget"].ToString(),
                    ContactName = dt.Rows[i]["ContactName"].ToString(),
                    salesmanid = dt.Rows[i]["salesmanid"].ToString(),
                    OrderStatus = dt.Rows[i]["OrderStatus"].ToString(),
                    MarketingID = dt.Rows[i]["MarketingID"].ToString(),
                    EstimationOrg = dt.Rows[i]["EstimationOrg"].ToString(),
                    Salesman = dt.Rows[i]["Salesman"].ToString(),
                    Marketing = dt.Rows[i]["Marketing"].ToString(),
                    PumpSpecification = dt.Rows[i]["PumpSpecification"].ToString(),
                    ListOfMakes = dt.Rows[i]["ListOfMakes"].ToString(),
                    PumpShedule = dt.Rows[i]["PumpShedule"].ToString(),
                    PumpApproval = dt.Rows[i]["PumpApproval"].ToString(),
                });
            }
        }
        
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDetails> getItemDetails(string UserId, string ReqID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ReqID");
        pv.Add(ReqID);

        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<ItemDetails> drpval = new List<ItemDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new ItemDetails()
                {

                    SlNO = dt.Rows[i]["SlNO"].ToString(),
                    ItemID = dt.Rows[i]["ItemID"].ToString(),
                    Area = dt.Rows[i]["Area"].ToString(),
                    Description = dt.Rows[i]["Description"].ToString(),
                    QTY = dt.Rows[i]["QTY"].ToString(),
                    TypeOfPump = dt.Rows[i]["TypeOfPump"].ToString(),

                });
            }
        }

       
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setPumpDet(string UserId, string ItemID, string PumpName, string Value, string QTY, string MoreInfo, string Comments)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemID");
        pv.Add(ItemID);

        pa.Add("@Name");
        pv.Add(PumpName);

        pa.Add("@value");
        pv.Add(Value);

        pa.Add("@QTY");
        pv.Add(QTY);

        pa.Add("@MoreInfo");
        pv.Add(MoreInfo);

        pa.Add("@Comments");
        pv.Add(Comments);

        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<PumpDetails> getPumpDetails(string UserId, string ItemID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemID");
        pv.Add(ItemID);

        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<PumpDetails> drpval = new List<PumpDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new PumpDetails()
                {

                    PumpName = dt.Rows[i]["PumpName"].ToString(),
                    capasity = dt.Rows[i]["capasity"].ToString(),
                    Bars = dt.Rows[i]["Bars"].ToString(),
                    QTY = dt.Rows[i]["QTY"].ToString(),



                });
            }
        
        }
       
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<PumpDetails> getPumpInformation(string UserId, string ItemID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemID");
        pv.Add(ItemID);

        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<PumpDetails> drpval = new List<PumpDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new PumpDetails()
                {

                    Name = dt.Rows[i]["Name"].ToString(),
                    Value = dt.Rows[i]["Value"].ToString(),
                    PumpQTY = dt.Rows[i]["PumpQTY"].ToString(),
                    MoreInformation = dt.Rows[i]["MoreInformation"].ToString(),
                    Comments = dt.Rows[i]["Comments"].ToString(),
                    



                });
            }
        }
        
        
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpListDDL> GetAllestimator()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(11);

        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    User_Id = dt.Rows[i]["User_Id"].ToString(),
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    EmpName = dt.Rows[i]["UEmployeeName"].ToString(),

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setAssignTo(string UserId, string AssignedTo, string ReqID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(12);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@AssignedTo");
        pv.Add(AssignedTo);

        pa.Add("@ReqID");
        pv.Add(ReqID);


        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string setComplete(string UserId, string ReqID, string TechNotes)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(13);

        pa.Add("@userId");
        pv.Add(UserId);


        pa.Add("@ReqID");
        pv.Add(ReqID);

        pa.Add("@TechNotes");
        pv.Add(TechNotes);


        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean ReleasePumpEstimation(string UserId, string ReqID)
    {

        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(21);

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@ReqID");
            pv.Add(ReqID);

            DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);


            return true;
        }
        catch (Exception s){ return false; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetTechnicalNote(string UserId, string ReqID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(22);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ReqID");
        pv.Add(ReqID);

        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }





    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Attachment> AttachmentDet(string UserId, string ReqID)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(16);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ReqID");
        pv.Add(Convert.ToInt64(ReqID));



        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<Attachment> listProjDet = new List<Attachment>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Attachment ind = new Attachment();

            ind.ID = dt.Rows[i]["ID"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.Comments = dt.Rows[i]["Comments"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EMSProduct> GetAllEMSProductsByReqId(string UserId, string ReqId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<EMSProduct> oListPro = new List<EMSProduct>();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@EMSRequestID");
        pv.Add(ReqId);

        DBH.CreateDatasetERM_Data(ds, "sp_EMS_AdditionalItemsFP", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListPro.Add(new EMSProduct()
                {
                    ID = dt.Rows[i]["ID"].ToString(),
                    ReqId = dt.Rows[i]["EMSRequestID"].ToString(),
                    EMSProd = dt.Rows[i]["EMSProduct"].ToString(),
                    Desc = dt.Rows[i]["Description"].ToString(),
                    Price = dt.Rows[i]["Price"].ToString(),
                    Optional = dt.Rows[i]["Isoptional"].ToString(),
                    Comment = dt.Rows[i]["Comments"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString()
                });
            }
        }
        return oListPro;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddAdditionalItemInTOC(string UserId, string Product, string Price, string IsOptional, string Desc, string AdditionalComm, string ReqId, string Name)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@UserID");
        pv.Add(UserId);

        pa.Add("@EMSRequestID");
        pv.Add(ReqId);

        pa.Add("@EMSProduct");
        pv.Add(Product);

        pa.Add("@Description");
        pv.Add(Desc);

        pa.Add("@Price");
        pv.Add(Price);

        pa.Add("@IsOptional");
        pv.Add(IsOptional);

        pa.Add("@Comments");
        pv.Add(AdditionalComm);

        pa.Add("@FirePumpName");
        pv.Add(Name);


        DBH.CreateDatasetERM_Data(ds, "sp_EMS_AdditionalItemsFP", true, pa, pv);

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteAddiItem(string AddItemId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@ID");
        pv.Add(AddItemId);

        DBH.CreateDatasetERM_Data(ds, "sp_EMS_AdditionalItemsFP", true, pa, pv);

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> setEmailInformation(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("23");

        pa.Add("@userId");
        pv.Add(UserID);


        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();


        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new DropDownValues()
                {
                    ddlValue = dt.Rows[i]["EmpNo"].ToString(),
                    ddlText = dt.Rows[i]["EmpName"].ToString()
                });
            }
        }

        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddGeneralComments(string UserID, string RefId, string Comment, string IsNotified, string MailTo, string CCMail)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("33");

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@RefId");
        pv.Add(RefId);

        pa.Add("@Comments");
        pv.Add(Comment);

        pa.Add("@IsNotified");
        pv.Add(IsNotified);

        pa.Add("@EMSProdStr");
        pv.Add("FIRE PUMP");


        if (IsNotified == "True")
        {
            pa.Add("@MailTo");
            pv.Add(MailTo);

            pa.Add("@CCMAil");
            pv.Add(CCMail);
        }


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CommentDet> GetComments(string RefId)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(24);

        pa.Add("@RefId");
        pv.Add(Convert.ToInt64(RefId));


        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<CommentDet> appList = new List<CommentDet>();


        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                appList.Add(new CommentDet()
                {
                    SlNo = dt.Rows[i]["SlNo"].ToString(),
                    Comments = dt.Rows[i]["Comments"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Products = dt.Rows[i]["Products"].ToString(),
                });
            }
        }


        return appList;

    }

    public class CommentDet
    {
        public string SlNo { get; set; }
        public string Comments { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string Products { get; set; }

    }
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }
    public class EMSProduct
    {

        public string ID { get; set; }
        public string ReqId { get; set; }
        public string EMSProd { get; set; }
        public string Desc { get; set; }
        public string Price { get; set; }
        public string Optional { get; set; }
        public string Comment { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
    }


    public class EmpListDDL
    {
        public string User_Id { get; set; }
        public string EmpNo { get; set; }
        public string EmpName { get; set; }


    }

    public class Attachment
    {

        public string ID { get; set; }
        public string FileName { get; set; }
        public string Comments { get; set; }
        public string URL { get; set; }

    }
    public class Tabledetails
    {

        public string ReqID { get; set; }
        public string EstimationID { get; set; }
        public string Estimator { get; set; }
        public string ProjectName { get; set; }
        public string RefNo { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string RevNo { get; set; }
        public string ContABBR { get; set; }
        public string Year { get; set; }
        public string OPTNumber { get; set; }
        public string ProjectNumber { get; set; }
        public string Status { get; set; }


    }

    public class AllDetails
    {

        public string ReqID { get; set; }
        public string EstimationID { get; set; }
        public string Estimator { get; set; }
        public string ProjectName { get; set; }
        public string RefNo { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string RevNo { get; set; }
        public string ContABBR { get; set; }
        public string Year { get; set; }
        public string OPTNumber { get; set; }
        public string ProjectNumber { get; set; }
        public string Status { get; set; }
        public string Location { get; set; }
        public string Client { get; set; }
        public string Consultant { get; set; }
        public string MainContractor { get; set; }
        public string URL { get; set; }
        public string MEPContractor { get; set; }
        public string ContactID { get; set; }
        public string Stage { get; set; }
        public string Scope { get; set; }
        public string QuotationType { get; set; }
        public string WinPerc { get; set; }
        public string Budget { get; set; }

        public string ContactName { get; set; }
        public string Salesman { get; set; }
        public string Marketing { get; set; }
        public string PlotNumber { get; set; }
        public string salesmanid { get; set; }
        public string EstimationOrg { get; set; }
        public string MarketingID { get; set; }
        public string OrderStatus { get; set; }
        public string PumpSpecification { get; set; }
        public string ListOfMakes { get; set; }
        public string PumpShedule { get; set; }
        public string PumpApproval { get; set; }

        


    }

    public class ItemDetails
    {

        public string SlNO { get; set; }
        public string ItemID { get; set; }
        public string Area { get; set; }
        public string Description { get; set; }
        public string QTY { get; set; }
        public string TypeOfPump { get; set; }

    }

    public class PumpDetails
    {

        public string PumpName { get; set; }
        public string capasity { get; set; }
        public string Bars { get; set; }
        public string QTY { get; set; }

        public string Name { get; set; }
        public string Value { get; set; }
        public string PumpQTY { get; set; }
        public string MoreInformation { get; set; }
        public string Comments { get; set; }

    }
}