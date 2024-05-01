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

public partial class CRMAdmin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 1;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID, string Request,string Oper)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(Oper);

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@Request");
        pv.Add(Request);

       


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OPTAdminRequests", true, pa, pv);

        List<tableData> AdminAction = new List<tableData>();
        dt = ds.Tables[0];


        if (Oper == "0")
        { 
        for (int i = 0; i < dt.Rows.Count; i++)
        {


            AdminAction.Add(new tableData()
            {
                ID = dt.Rows[i]["ID"].ToString(),
                OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
                Name = dt.Rows[i]["Name"].ToString(),
                Owner = dt.Rows[i]["Owner"].ToString(),
                CurrentStatus = dt.Rows[i]["CurrentStatus"].ToString(),

                CurrentSalesStage = dt.Rows[i]["CurrentSalesStage"].ToString(),

                Substage = dt.Rows[i]["Substage"].ToString(),

                Status = dt.Rows[i]["Status"].ToString(),
                Company = dt.Rows[i]["Company"].ToString(),

                CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                ReqRemarks = dt.Rows[i]["ReqRemarks"].ToString(),

                UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                ActionRemarks = dt.Rows[i]["ActionRemarks"].ToString(),

                OPTCreateDate = dt.Rows[i]["OPTCreateDate"].ToString(),

            });
        }
        }

       else if (Oper == "4")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {
                    ID = dt.Rows[i]["ID"].ToString(),
                    ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                    Owner = dt.Rows[i]["Owner"].ToString(),
                    CurrentStatus = dt.Rows[i]["CurrentStatus"].ToString(),

                    CurrentSalesStage = dt.Rows[i]["CurrentSalesStage"].ToString(),

                    Substage = dt.Rows[i]["Substage"].ToString(),

                    Status = dt.Rows[i]["Status"].ToString(),
                    Company = dt.Rows[i]["Company"].ToString(),

                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    ReqRemarks = dt.Rows[i]["ReqRemarks"].ToString(),

                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    ActionRemarks = dt.Rows[i]["ActionRemarks"].ToString(),
                    PRJCreateDate = dt.Rows[i]["PRJCreateDate"].ToString(),

                });
            }
        }



        else if (Oper == "8")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {
                    ID = dt.Rows[i]["ID"].ToString(),
                    OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
                    ReqStatus = dt.Rows[i]["ReqStatus"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),

                    ReasonForReject = dt.Rows[i]["ReasonForReject"].ToString(),

                    Name = dt.Rows[i]["Name"].ToString(),

                    Owner = dt.Rows[i]["Owner"].ToString(),

                    CurrentStatus = dt.Rows[i]["CurrentStatus"].ToString(),
                    ActionRemarks = dt.Rows[i]["ActionRemarks"].ToString(),

                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Company = dt.Rows[i]["Company"].ToString(),
                  

                });
            }
        }


        else if (Oper == "12")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {
                    ID = dt.Rows[i]["ID"].ToString(),
                    CRMAccountId = dt.Rows[i]["CRMAccountId"].ToString(),
                    CurrentStatus = dt.Rows[i]["CurrentStatus"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    ReqStatus = dt.Rows[i]["ReqStatus"].ToString(),

                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),

                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),

                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),

                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Reason = dt.Rows[i]["Reason"].ToString(),
                    Owner = dt.Rows[i]["Owner"].ToString(),

                    AdminAction = dt.Rows[i]["AdminAction"].ToString(),
                    OwnerId = dt.Rows[i]["OwnerId"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),



                });
            }
        }

        return AdminAction;
        //string a = userId;
    }


    public class tableData
    {
        public string OPTNumber { get; set; }
        public string ID { get; set; }
        public string ProjectNumber { get; set; }
        public string Name { get; set; }
        public string Owner { get; set; }
        public string CurrentStatus { get; set; }
        public string CurrentSalesStage { get; set; }
        public string Substage { get; set; }

        public string Status { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string ReqRemarks { get; set; }
        public string Company { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string ActionRemarks { get; set; }
        public string AdminAction { get; set; }

       
        public string ReqStatus { get; set; }
        public string ReasonForReject { get; set; }

        public string CRMAccountId { get; set; }

        public string Reason { get; set; }

        public string OPTCreateDate { get; set; }

        public string PRJCreateDate { get; set; }
        public string OwnerId { get; set; }
        public string OwnerName { get; set; }






    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void RejectRequest(string UserId, string RefNumb, string Remarks,string Oper,string ID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(Oper);

        pa.Add("@userId");
        pv.Add(UserId);


        pa.Add("@ActionRemarks");
        pv.Add(Remarks);

        pa.Add("@refNumb");
        pv.Add(RefNumb);

        pa.Add("@ID");
        pv.Add(Convert.ToInt64(ID));


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OPTAdminRequests", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void ApproveReq(string UserId, string RefNumb, string Remarks,string SalesStage,string Status,string Oper,string ID,string OwnerId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(Oper);

        pa.Add("@userId");
        pv.Add(UserId);


        pa.Add("@ActionRemarks");
        pv.Add(Remarks);

        pa.Add("@SalesStage");
        pv.Add(SalesStage);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@refNumb");
        pv.Add(RefNumb);

        if(Oper== "13" && OwnerId!=" ")
        {
            pa.Add("@OwnerId");
            pv.Add(Convert.ToInt64(OwnerId));
        }

        pa.Add("@ID");
        pv.Add(Convert.ToInt64(ID));


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OPTAdminRequests", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GetOptHistoryDetails(string OptNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@optNo");
        pv.Add(OptNo);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OPTAdminRequests", true, pa, pv);

        List<tableData> Details = new List<tableData>();
        dt = ds.Tables[0];
        if (ds.Tables[0].Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Details.Add(new tableData()
                {
                    OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
                   

                    Substage = dt.Rows[i]["Substage"].ToString(),

                    Status = dt.Rows[i]["Status"].ToString(),
                   

                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    ReqRemarks = dt.Rows[i]["ReqRemarks"].ToString(),

                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    AdminAction = dt.Rows[i]["AdminAction"].ToString(),
                    ActionRemarks = dt.Rows[i]["ActionRemarks"].ToString(),
                    


                });
            }






        }

        return Details;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GetPrjHistoryDetails(string PrjNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@refNumb");
        pv.Add(PrjNo);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OPTAdminRequests", true, pa, pv);

        List<tableData> Details = new List<tableData>();
        dt = ds.Tables[0];
        if (ds.Tables[0].Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Details.Add(new tableData()
                {
                    ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString(),


                    Substage = dt.Rows[i]["Substage"].ToString(),

                    Status = dt.Rows[i]["Status"].ToString(),


                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    ReqRemarks = dt.Rows[i]["ReqRemarks"].ToString(),

                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    AdminAction = dt.Rows[i]["AdminAction"].ToString(),
                    ActionRemarks = dt.Rows[i]["ActionRemarks"].ToString(),



                });
            }






        }

        return Details;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GetRLHistoryDetails(string OptNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("11");

        pa.Add("@refNumb");
        pv.Add(OptNo);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OPTAdminRequests", true, pa, pv);

        List<tableData> Details = new List<tableData>();
        dt = ds.Tables[0];
        if (ds.Tables[0].Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Details.Add(new tableData()
                {
                    OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
                    ReqStatus = dt.Rows[i]["ReqStatus"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    ReasonForReject = dt.Rows[i]["ReasonForReject"].ToString(),

                    ActionRemarks = dt.Rows[i]["ActionRemarks"].ToString(),

                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                 



                });
            }






        }

        return Details;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GetAccHistoryDetails(string CRMAccountId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("15");

        pa.Add("@refNumb");
        pv.Add(CRMAccountId);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OPTAdminRequests", true, pa, pv);

        List<tableData> Details = new List<tableData>();
        dt = ds.Tables[0];
        if (ds.Tables[0].Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Details.Add(new tableData()
                {
                    CRMAccountId = dt.Rows[i]["CRMAccountId"].ToString(),
                    ReqStatus = dt.Rows[i]["ReqStatus"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    Reason = dt.Rows[i]["Reason"].ToString(),

                    AdminAction = dt.Rows[i]["AdminAction"].ToString(),

                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),




                });
            }


        }

        return Details;
    }

}