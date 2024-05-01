using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Calendar_CalendarMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

        }
            Session["ApplicationId"] = 1;
        hfServerMapPth.Value = System.IO.Path.Combine(Server.MapPath(UploadFolderPath)).ToString();
        Common.SaveAppUserActivityHistory(Session["ApplicationId"].ToString(), "/Calendar/CalendarMaster.aspx", "Salesman Activity Area.", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);
    }
    protected string UploadFolderPath = "../Images/CRMActivity/";

    protected string UploadFolderPathPopup = "../Masters/assets/images/img_avatar.png";
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //eConnectService service = new eConnectService();
        //service.UploadForActivity();

        if (FUUploadNewAttach.HasFiles)
        {
            foreach (HttpPostedFile uploadedFile in FUUploadNewAttach.PostedFiles)
            {
                //uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath(UploadFolderPath), uploadedFile.FileName));
                uploadedFile.SaveAs(System.IO.Path.Combine("\\\\zylab\\Econnect\\CRM_Saleman_Activity\\", (hfAttachId.Value + " - " + uploadedFile.FileName)));
                

                //string rr = UploadFolderPath + uploadedFile.FileName;
                string rr = "\\\\zylab\\Econnect\\CRM_Saleman_Activity\\" + hfAttachId.Value+" - " + uploadedFile.FileName;

                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add("99");

                pa.Add("@AttachUrl");
                pv.Add(rr);

                pa.Add("@Id");
                pv.Add(hfAttachId.Value);

                pa.Add("@FileName");
                pv.Add(hfAttachId.Value + " - " + uploadedFile.FileName);

                pa.Add("@AttachComment");
                pv.Add(txtAttachComm.InnerText);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);
            }
            FUUploadNewAttach.DataBind();
            txtAttachComm.InnerText = "";
        }

        //string filename = Path.GetFileName(FUUploadNewAttach.PostedFile.FileName);
        //string contentType = FUUploadNewAttach.PostedFile.ContentType;
        //string FileName = FUUploadNewAttach.PostedFile.FileName;

        //string fileExt = System.IO.Path.GetExtension(FUUploadNewAttach.FileName).ToLower();
        //if (fileExt == ".pdf" || fileExt == ".jpg" || fileExt == ".png")
        //{

        //    string pathAndFile = UploadFolderPath;
        //    pathAndFile += FUUploadNewAttach.FileName.ToLower();
        //    ViewState["FileName"] = pathAndFile;

        //    FUUploadNewAttach.SaveAs(Server.MapPath(pathAndFile));


        //    DBHandler DBH = new DBHandler();
        //    DataSet ds = new DataSet();
        //    DataTable dt = new DataTable();
        //    ArrayList pa = new ArrayList();
        //    ArrayList pv = new ArrayList();

        //    pa.Add("@oper");
        //    pv.Add("99");

        //    pa.Add("@AttachUrl");
        //    pv.Add(pathAndFile);

        //    pa.Add("@Id");
        //    pv.Add(hfAttachId.Value);

        //    DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string InserUpdatetActivity(
        int Id,
        string Type, 
        string Subject,
        string FromDate,
        string FromTime,
        string ToDate,
        string ToTime,
        string Remarks,
        string Status,
        string MOM,
        string UpdatedBy,
        string AccountId,
        string OptId,
        string ProjId,
        int CustRelPerc,
        string CustomerStatus,
        string CustomerAss,
        string ActivityOn
        )
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("22");

        pa.Add("@Id");
        pv.Add(Id);

        pa.Add("@Type");
        pv.Add(Type);

        pa.Add("@Subject");
        pv.Add(Subject);

        pa.Add("@FromDate");
        pv.Add(FromDate);

        pa.Add("@FromTime");
        pv.Add(FromTime);

        pa.Add("@ToDate");
        pv.Add(ToDate);

        pa.Add("@ToTime");
        pv.Add(ToTime);

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@MinutesOfMeeting");
        pv.Add(MOM);        

        if (Type == "Customer Visit")
        {
            pa.Add("@SelOptMulti");
            pv.Add(OptId);

            pa.Add("@OpportunityId");
            pv.Add(0);

            pa.Add("@SelProjMulti");
            pv.Add(ProjId);

            pa.Add("@ProjectId");
            pv.Add(0);
        }
        else
        {
            pa.Add("@OpportunityId");
            pv.Add(OptId);

            pa.Add("@ProjectId");
            pv.Add(Convert.ToInt64(ProjId));
        }

      

        pa.Add("@UpdatedBy");
        pv.Add(Convert.ToInt64(UpdatedBy));

        pa.Add("@AccountId");
        pv.Add(Convert.ToInt64(AccountId));

        pa.Add("@RelationPerc");
        pv.Add(CustRelPerc);

        pa.Add("@CustomerStatus");
        pv.Add(CustomerStatus);

        pa.Add("@CustomerAssessment");
        pv.Add(CustomerAss);

        pa.Add("@ActivityOn");
        pv.Add(ActivityOn);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

        return ds.Tables[0].Rows[0]["ID"].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void InserActivitiesInBulk(List<Activity> data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@listActs");

                using (var table = new DataTable())
                {
                    table.Columns.Add("Id", typeof(Int64));
                    table.Columns.Add("Type", typeof(string));
                    table.Columns.Add("Subject", typeof(string));
                    table.Columns.Add("ActivityOn", typeof(string));
                    table.Columns.Add("FromDate", typeof(string));
                    table.Columns.Add("FromTime", typeof(string));
                    table.Columns.Add("ToTime", typeof(string));
                    table.Columns.Add("Remarks", typeof(string));
                    table.Columns.Add("Status", typeof(string));
                    table.Columns.Add("MOM", typeof(string));
                    table.Columns.Add("optId", typeof(string));
                    table.Columns.Add("ProjId", typeof(Int64));
                    table.Columns.Add("AccountId", typeof(Int64));
                    table.Columns.Add("UpdatedBy", typeof(Int64));
                    table.Columns.Add("RelationPerc", typeof(Int64));
                    table.Columns.Add("CustomerStatus", typeof(string));
                    table.Columns.Add("CustomerAss", typeof(string));
                    table.Columns.Add("OptNoMulti", typeof(string));
                    table.Columns.Add("ProjIdMulti", typeof(string));
                    

                    for (int i = 0; i < data.Count(); i++)
                    {
                        table.Rows.Add(
                            Convert.ToUInt64(data[i].Id),
                            data[i].Type.ToString(),
                            data[i].Subject.ToString(),
                             data[i].ActivityOn.ToString(),
                            data[i].FromDate.ToString(),
                            data[i].FromTime.ToString(),
                            data[i].ToTime.ToString(),
                            data[i].Remarks.ToString(),
                            data[i].Status.ToString(),
                            data[i].MOM.ToString(),
                            data[i].optId.ToString(),
                            Convert.ToInt64(data[i].ProjId),
                            Convert.ToInt64(data[i].AccountId),
                            Convert.ToInt64(data[i].UpdatedBy),                         
                            Convert.ToInt64(data[i].RelationPerc) ,                        
                            data[i].CustomerStatus.ToString(),                         
                            data[i].CustomerAss.ToString(),                        
                            data[i].OptNoMulti.ToString(),                        
                            data[i].ProjIdMulti.ToString()                       
                                          
                            );
                    }
                  
                    DBH.CreateDatasetCRMEBSDATA_ForBulkInsert(ds, "[sp_Bulk_AddCRMActivities]", "dbo.AddActivitiesList", table, true, pa, pv);
                }


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ResponseMsg Insertparticipants(string ParticipantsEmpNos, int ActId, string Status, string CreatedBy, string ActivityDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(997);

        pa.Add("@Id");
        pv.Add(ActId);

        pa.Add ("@ParticipantEmpNos");
        pv.Add(ParticipantsEmpNos);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

        pa.Add("@ActDate");
        pv.Add(ActivityDate);
        //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
        //{
        //    Console.WriteLine(j);
        //}

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);
        return new ResponseMsg() { msg = ds.Tables[0].Rows[0]["msg"].ToString(), status = ds.Tables[0].Rows[0]["status"].ToString() };
        
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteParticipant(string PartiId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(78);

        pa.Add("@Id");
        pv.Add(PartiId);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Participants> GetParticipantsById(int ActId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(998);

        pa.Add("@Id");
        pv.Add(ActId);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

        List<Participants> oTPDList = new List<Participants>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {

            oTPDList.Add(new Participants()
            {
                Id = dt.Rows[i]["ID"].ToString(),
                ParticipantEmpNo = dt.Rows[i]["EmpNo"].ToString(),
                ParticipantEmpName = dt.Rows[i]["EmpName"].ToString(),
                ActId = dt.Rows[i]["ActivityId"].ToString(),
                ActSubject = dt.Rows[i]["ActivityName"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
                Availability = dt.Rows[i]["Availability"].ToString(),
                CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                IsInvited = dt.Rows[i]["IsInvited"].ToString(),

            });
        }
        return oTPDList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Participants> GetAllInvitationRequest(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(999);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

        List<Participants> oTPDList = new List<Participants>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {

            oTPDList.Add(new Participants()
            {
                Id = dt.Rows[i]["PartiReqId"].ToString(),
                CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                RequesterName = dt.Rows[i]["CreatedByName"].ToString(),
                ActId = dt.Rows[i]["ActId"].ToString(),

                Type = dt.Rows[i]["Type"].ToString(),
                ActSubject = dt.Rows[i]["Subject"].ToString(),
                Availability = dt.Rows[i]["Availability"].ToString(),
                
                FromDate = dt.Rows[i]["FromDate"].ToString(),
                FromTime = dt.Rows[i]["FromTime"].ToString(),
                ToTime = dt.Rows[i]["ToTime"].ToString(),
                InvitedBy = dt.Rows[i]["InvitedBy"].ToString(),
                AccountName = dt.Rows[i]["AccountName"].ToString(),
                ProjectName = dt.Rows[i]["ProjectName"].ToString()
            });
        }
        return oTPDList;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdatePartiReq(string EmpNo, string Availability, string ActId, string InviId, string ReasonForNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(77);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@PartiAvail");
        pv.Add(Availability);

        pa.Add("@Id");
        pv.Add(Convert.ToInt64(ActId));

        pa.Add("@InviId");
        pv.Add(Convert.ToInt64(InviId));

        pa.Add("@ReasonForNo");
        pv.Add(ReasonForNo);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Activity> GetAllAttachment(int ActId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(991);

        pa.Add("@Id");
        pv.Add(ActId);


        //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
        //{
        //    Console.WriteLine(j);
        //}

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

        List<Activity> oTPDList = new List<Activity>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {          

            oTPDList.Add(new Activity()
            {
                Id = dt.Rows[i]["ID"].ToString(),
                FileName = dt.Rows[i]["FileName"].ToString(),
                AttachURL = dt.Rows[i]["URL"].ToString() ,
                Remarks = dt.Rows[i]["AttachComment"].ToString()
            });
        }
        return oTPDList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Activity> GetAllActivity(string UpdatedBy)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

       
        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@UpdatedBy");
        pv.Add(Convert.ToInt64(UpdatedBy));
        

        //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
        //{
        //    Console.WriteLine(j);
        //}

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

        List<Activity> oTPDList = new List<Activity>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            //List<string> eStatuses = new List<string>();
            //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
            //{
            //    eStatuses.Add(j.Trim());
            //}

            var str = dt.Rows[i]["AttachURL"].ToString();
            var arr = str.Split('/');
            string fileName = arr[arr.Length - 1];

            oTPDList.Add(new Activity()
            {
                Id = dt.Rows[i]["ID"].ToString(),
                Type = dt.Rows[i]["Type"].ToString(),
                Subject = dt.Rows[i]["Subject"].ToString(),
                FromDate = dt.Rows[i]["FromDate"].ToString(),
                FromTime = dt.Rows[i]["FromTime"].ToString(),
                ToDate = dt.Rows[i]["ToDate"].ToString(),
                ToTime = dt.Rows[i]["ToTime"].ToString(),
                Remarks = dt.Rows[i]["Remarks"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
                MOM = dt.Rows[i]["MinutesOfMeeting"].ToString(),
                optId = dt.Rows[i]["OpportunityId"].ToString(),
                ProjId = dt.Rows[i]["ProjectId"].ToString(),
                AccountId = dt.Rows[i]["AccountId"].ToString(),
                AttachURL = dt.Rows[i]["AttachURL"].ToString(),
                AccountName = dt.Rows[i]["AccountName"].ToString(),
                FileName = fileName,
                CustomerStatus = dt.Rows[i]["CustomerStatus"].ToString(),
                CustomerAss = dt.Rows[i]["CustomerAssessment"].ToString(),
                RelationPerc = dt.Rows[i]["RelationPerc"].ToString(),
                OptNoMulti = dt.Rows[i]["OPTNoMulti"].ToString(),
                ProjIdMulti = dt.Rows[i]["ProjIdMulti"].ToString(),
                ActivityOn = dt.Rows[i]["ActivityOn"].ToString()
            });
        }
        return oTPDList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetAllAccDDl(string UpdatedBy, string Type, int SelActId, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add("5");

        pa.Add("@UpdatedBy");
        pv.Add(UpdatedBy);

        pa.Add("@Type");
        pv.Add(Type);

        pa.Add("@Id");
        pv.Add(SelActId);
        //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
        //{
        //    Console.WriteLine(j);
        //}

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));
        if (RolesList.Split(',').Contains("8095") || RolesList.Split(',').Contains("8094"))
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivityExport", true, pa, pv);
        }
        else
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);
        }

        List<DDL> oTPDList = new List<DDL>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            //List<string> eStatuses = new List<string>();
            //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
            //{
            //    eStatuses.Add(j.Trim());
            //}


            oTPDList.Add(new DDL()
            {
                Name = dt.Rows[i]["AccountName"].ToString(),
                Value = dt.Rows[i]["AccountID"].ToString(),

            });
        }
        return oTPDList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateVL(string CRMId, string VLStatus, string Quarter, string Year, string MarkComm, string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@CRMID");
        pv.Add(Convert.ToInt64(CRMId));
        
        pa.Add("@VLStatus");
        pv.Add(VLStatus);

        pa.Add("@MarketingComments");
        pv.Add(MarkComm);

        pa.Add("@CommitmentQuoter");
        pv.Add(Quarter);

        pa.Add("@CommitmentYear");
        pv.Add(Convert.ToInt32(Year));

        pa.Add("@userId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountSpecification", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<VendorList> GetVLHistory(string CRMId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@CRMID");
        pv.Add(Convert.ToInt64(CRMId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountSpecification", true, pa, pv);

        List<VendorList> oVL = new List<VendorList>();

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                oVL.Add(
                new VendorList()
                {
                    UpdatedBy = ds.Tables[0].Rows[i]["UpdatedBy"].ToString(),
                    AuditDate = ds.Tables[0].Rows[i]["AuditDate"].ToString(),
                    AuditStatus = ds.Tables[0].Rows[i]["AuditStatus"].ToString(),
                    AuditBy = ds.Tables[0].Rows[i]["AuditBy"].ToString(),
                    CRMId = ds.Tables[0].Rows[i]["CRMId"].ToString(),
                    MarketingComments = ds.Tables[0].Rows[i]["MarketingComments"].ToString(),
                    ProductName = ds.Tables[0].Rows[i]["ProductName"].ToString(),
                    UpdatedDate = ds.Tables[0].Rows[i]["UpdateDate"].ToString(),
                    VLStatus = ds.Tables[0].Rows[i]["VLStatus"].ToString()
                });
            }

        }
        return oVL;

        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<VendorList> GetVLUpdated(int UserId, string consulId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@ConsultantId");
        pv.Add(Convert.ToInt64(consulId));

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@AuditStatus");
        pv.Add("-1");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountSpecification", true, pa, pv);
        List<VendorList> oVL = new List<VendorList>();

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                oVL.Add(
                new VendorList()
                {
                    AccountName = ds.Tables[0].Rows[i]["AccountName"].ToString(),
                    CommitmentQuoter = ds.Tables[0].Rows[i]["CommitmentQuoter"].ToString(),
                    CommitmentYear = ds.Tables[0].Rows[i]["CommitmentYear"].ToString(),
                    CRMAccountId = ds.Tables[0].Rows[i]["CRMAccountId"].ToString(),
                    CRMId = ds.Tables[0].Rows[i]["CRMId"].ToString(),
                    MarketingComments = ds.Tables[0].Rows[i]["MarketingComments"].ToString(),
                    OwnerId = ds.Tables[0].Rows[i]["OwnerId"].ToString(),
                    OwnerName = ds.Tables[0].Rows[i]["OwnerName"].ToString(),
                    ProductId = ds.Tables[0].Rows[i]["ProductId"].ToString(),
                    ProductName = ds.Tables[0].Rows[i]["ProductName"].ToString(),
                    RecordName = ds.Tables[0].Rows[i]["RecordName"].ToString(),
                    UpdatedDate = ds.Tables[0].Rows[i]["UpdatedDate"].ToString(),
                    VLStatus = ds.Tables[0].Rows[i]["VLStatus"].ToString()
                });
            }
            
        }
        return oVL;
        //string a = userId;
    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetTaggedPersonByOptNo(string OptNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(79);

        pa.Add("@OpportunityId");
        pv.Add(OptNo);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

        List<DDL> oTPDList = new List<DDL>();
        dt = ds.Tables[0];
        
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            oTPDList.Add(new DDL()
            {
                Name = dt.Rows[i]["Employee"].ToString(),
                Value = dt.Rows[i]["EmployeeID"].ToString(),

            });
        }
        return oTPDList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpListDDL> GetAllEmployees()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(80);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    EmpNo = dt.Rows[i]["originalempid"].ToString(),
                    EmpName = dt.Rows[i]["firstname"].ToString(),
                    Company = dt.Rows[i]["companyname"].ToString(),
                    DeptId = dt.Rows[i]["deptid"].ToString(),
                    DeptName = dt.Rows[i]["deptname"].ToString(),
                    DivisionName = dt.Rows[i]["DivisionName"].ToString(),
                    Email = dt.Rows[i]["Email_Id"].ToString(),
                    EmailSend = dt.Rows[i]["EmailSend"].ToString()
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetTaggedPersonByAccNoForBlist(string AccId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@CRMAccountId");
        pv.Add(Convert.ToInt64(AccId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccountAssessment", true, pa, pv);

        List<DDL> oTPDList = new List<DDL>();
        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            oTPDList.Add(new DDL()
            {
                Name = dt.Rows[i]["Employee"].ToString(),
                Value = dt.Rows[i]["EmployeeID"].ToString(),

            });
        }
        return oTPDList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OppRelated> GetAllOppRelated(string AccId, int UserId, string ActType,string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@AccountId");
        pv.Add(AccId);

        pa.Add("@UserID");
        pv.Add(UserId);

        pa.Add("@Type");
        pv.Add(ActType);
        //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
        //{
        //    Console.WriteLine(j);
        //}

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        if (RolesList.Split(',').Contains("8095") || RolesList.Split(',').Contains("8094"))
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivityExport", true, pa, pv);
        }
        else
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);
        }

        List<OppRelated> oTPDList = new List<OppRelated>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            //List<string> eStatuses = new List<string>();
            //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
            //{
            //    eStatuses.Add(j.Trim());
            //}


            oTPDList.Add(new OppRelated()
            {
                OptNo = dt.Rows[i]["OpportunityNumber"].ToString(),
                OptId = dt.Rows[i]["OpportunityID"].ToString(),
                Customer = dt.Rows[i]["MEPContractor"].ToString(),
                OpenValue = dt.Rows[i]["OPENVALUE"].ToString(),
                UpdateAging = dt.Rows[i]["UpdateAging"].ToString(),
                Remarks = dt.Rows[i]["Remarks"].ToString(),
                Overview = dt.Rows[i]["Overview"].ToString(),
                WinPerc = dt.Rows[i]["WinPerc"].ToString(),

                OptName = dt.Rows[i]["Name"].ToString(),
                SalesManager = dt.Rows[i]["SMUserID"].ToString(),
                Salesman = dt.Rows[i]["SalesmanUserid"].ToString(),
                Marketing = dt.Rows[i]["MarketingUserID"].ToString(),
                StatusCode = dt.Rows[i]["StatusCode"].ToString()

                //CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                //Salesman = dt.Rows[i]["Salesman"].ToString(),
                //Customer = dt.Rows[i]["Customer"].ToString(),

            });
        }
        return oTPDList;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<PRJRelated> GetAllPRJRelated(string AccId,string selSalesmanId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add("44");

        pa.Add("@AccountId");
        pv.Add(AccId);

        pa.Add("@UpdatedBy");
        pv.Add(selSalesmanId);


        //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
        //{
        //    Console.WriteLine(j);
        //}

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

        List<PRJRelated> oTPDList = new List<PRJRelated>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            //List<string> eStatuses = new List<string>();
            //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
            //{
            //    eStatuses.Add(j.Trim());
            //}


            oTPDList.Add(new PRJRelated()
            {
                ProjectId = dt.Rows[i]["ProjectId"].ToString(),
                ProjectNo = dt.Rows[i]["ProjectNo"].ToString(),
                ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                ProjectStatus = dt.Rows[i]["ProjectStatus"].ToString(),
                CreationDate = dt.Rows[i]["FormatedValue"].ToString(),
                Consultant = dt.Rows[i]["Consultant"].ToString(),
                OwnerId = dt.Rows[i]["OwnerId"].ToString(),
                Owner = dt.Rows[i]["Owner"].ToString(),
                Stage = dt.Rows[i]["Stage"].ToString(),
                UpdateAging = dt.Rows[i]["UpdateAging"].ToString(),
                Overview = dt.Rows[i]["Overview"].ToString(),
                Remarks = dt.Rows[i]["Remarks"].ToString(),

            });
        }
        return oTPDList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OppRelated> GetOptHistory(string OptNo, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<OppRelated> oTPDList = new List<OppRelated>();


        if (RolesList.Split(',').Contains("8095") || RolesList.Split(',').Contains("8094"))
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

            dt = ds.Tables[0];
        }
        else
        {
            pa.Add("@oper");
            pv.Add("5");

            pa.Add("@OptNumber");
            pv.Add(OptNo);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportOPTUpdates", true, pa, pv);

            dt = ds.Tables[1];
        }
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oTPDList.Add(new OppRelated()
            {
                Remarks = dt.Rows[i]["Remarks"].ToString(),
                Overview = dt.Rows[i]["Overview"].ToString(),
                WinPerc = dt.Rows[i]["WinPerc"].ToString(),

                UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                UpdatedBy = dt.Rows[i]["UpdatedBY"].ToString()              

            });
        }
        return oTPDList;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OptOtherDetails> GetOptOtherUpdates(string OptNo, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<OptOtherDetails> oListOtherDet = new List<OptOtherDetails>();

        if (RolesList.Split(',').Contains("8095") || RolesList.Split(',').Contains("8094"))
        {
            pa.Add("@oper");
            pv.Add("6");

            pa.Add("@OptNumber");
            pv.Add(OptNo);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportOPTUpdates", true, pa, pv);
        }
        else
        {

            pa.Add("@oper");
            pv.Add("2");

            pa.Add("@OptNumber");
            pv.Add(OptNo);

        

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_OthersUpdatePopup", true, pa, pv);
        }
        dt = ds.Tables[0];
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oListOtherDet.Add(new OptOtherDetails()
            {
                Optno = dt.Rows[i]["OpportunityNumber"].ToString(),
                MTOverview = dt.Rows[i]["MTOverview"].ToString(),
                MTRemarks = dt.Rows[i]["MTRemarks"].ToString(),
                MTUpdatedDate = dt.Rows[i]["MTUpdateDate"].ToString(),
                MTWinPerc = dt.Rows[i]["MTWinPerc"].ToString(),
                SalesmanOverview = dt.Rows[i]["SalesmanOverview"].ToString(),                
                SalesmanRemarks= dt.Rows[i]["SalesmanRemarks"].ToString(),
                SalesmanUpdatedDate = dt.Rows[i]["SalesmanUpdateDate"].ToString(),
                SalesmanWinPerc = dt.Rows[i]["SalesmanWinPerc"].ToString(),
                SMOverview = dt.Rows[i]["SMOverview"].ToString(),
                SMRemarks = dt.Rows[i]["SMRemarks"].ToString(),
                SMUpdatedDate = dt.Rows[i]["SMUpdatedDate"].ToString(),
                SMWinPerc = dt.Rows[i]["SMWinPerc"].ToString()
            });
        }
        

        return oListOtherDet;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SalesForecast> GetSalesForecast(string OptNo, int UserId,string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@OptNumber");
        pv.Add(OptNo);

        //pa.Add("@UserID");
        //pv.Add(UserId);

        List<SalesForecast> oListOtherDet = new List<SalesForecast>();
        if (RolesList.Split(',').Contains("8095") || RolesList.Split(',').Contains("8094"))
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportForecast", true, pa, pv);
        }
        else
        { 
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastNew", true, pa, pv);
        }
        dt = ds.Tables[0];
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oListOtherDet.Add(new SalesForecast() 
            {
                OptId = dt.Rows[i]["OptId"].ToString(),
                ForecastedMonth = dt.Rows[i]["ForecastedMonth"].ToString(),
                OptNo = dt.Rows[i]["OptNumber"].ToString(),
                ForecastedAmount = dt.Rows[i]["ForecastedAmount"].ToString(),
                Remarks = dt.Rows[i]["Remakrs"].ToString(),
                UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                OPTForecastId = dt.Rows[i]["OPTForecastID"].ToString(),
                Products = dt.Rows[i]["Products"].ToString()    
            });
        }


        return oListOtherDet;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SalesForecast> GetSalesForecastRevenue(string SaleForecastId, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@ForecastedId");
        pv.Add(SaleForecastId);

        //pa.Add("@UserID");
        //pv.Add(UserId);

        List<SalesForecast> oListOtherDet = new List<SalesForecast>();
        if (RolesList.Split(',').Contains("8095") || RolesList.Split(',').Contains("8094"))
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportForecast", true, pa, pv);
        }
        else
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastNew", true, pa, pv);
        }
        dt = ds.Tables[0];
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oListOtherDet.Add(new SalesForecast()
            {
                OptId = dt.Rows[i]["OptID"].ToString(),
                OPTForecastId = dt.Rows[i]["OPTForecastID"].ToString(),
                OptNo = dt.Rows[i]["OptNumber"].ToString(),
                Remarks = dt.Rows[i]["Remakrs"].ToString(),
                ForecastedMonth = dt.Rows[i]["ForecastedMonth"].ToString(),                
                ForecastedAmount = dt.Rows[i]["ForecastedAmount"].ToString(),
                cbCheck = dt.Rows[i]["chk"].ToString(),
                ProductROWID = dt.Rows[i]["ProductRowID"].ToString(),
                RevenueROWID = dt.Rows[i]["RevenueROWID"].ToString(),
                ProductType = dt.Rows[i]["ProductType"].ToString(),
                RevenueStatus = dt.Rows[i]["RevenueStatus"].ToString(),
                SubStage = dt.Rows[i]["SubStage"].ToString()
            });
        }


        return oListOtherDet;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SendEmailInvitationToAttendees(string ActId, string ParticipantsEmpNos, string CreatedBy)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@ActId");
        pv.Add(ActId);

        pa.Add("@invitedPeople");
        pv.Add(ParticipantsEmpNos);

        pa.Add("@SalesmanEmpno");
        pv.Add(CreatedBy);       

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ActivityMeetingInvitationMail", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateSalesForcastRevenue(string SaleForecastId, string sForcastRevProductIds, string OptNo, string OptId, string Remarks, int Month, int Year, string ForecastedAmount, int UserId, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(0);

        if (!string.IsNullOrEmpty(SaleForecastId))
        {
            pa.Add("@ForecastedId");
            pv.Add(SaleForecastId);
        }        

        pa.Add ("@revRowids");
        pv.Add(sForcastRevProductIds);

        pa.Add("@OptNumber");
        pv.Add(OptNo);

        if (!string.IsNullOrEmpty(OptId))
        {
            pa.Add("@OptId");
            pv.Add(OptId);
        }        

        pa.Add("@Month");
        pv.Add(Month);

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@ForecastAmount");
        pv.Add(Convert.ToInt64(ForecastedAmount));

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@UpdateBy");
        pv.Add(UserId);

        //pa.Add("@UserID");
        //pv.Add(UserId);
        if (RolesList.Split(',').Contains("8095") || RolesList.Split(',').Contains("8094"))
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportForecast", true, pa, pv);
        }
        else
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastNew", true, pa, pv);
        }
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SalesForecast> GetRemainingForecastRevenueProduct(string OptNo, string RolesList)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("13");

        pa.Add("@OptNumber");
        pv.Add(OptNo);

        if (RolesList.Split(',').Contains("8095") || RolesList.Split(',').Contains("8094"))
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportForecast", true, pa, pv);
        }
        else
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);
        }

        List<SalesForecast> oListOtherDet = new List<SalesForecast>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                oListOtherDet.Add(new SalesForecast()
                {
                    OptId = dt.Rows[i]["OpportunityID"].ToString(),
                    //OPTForecastId = dt.Rows[i]["OPTForecastID"].ToString(),
                    OptNo = dt.Rows[i]["OpportunityNumber"].ToString(),
                    //Remarks = dt.Rows[i]["Remakrs"].ToString(),
                    //ForecastedMonth = dt.Rows[i]["ForecastedMonth"].ToString(),
                    //ForecastedAmount = dt.Rows[i]["ForecastedAmount"].ToString(),
                    ForecastedAmount = dt.Rows[i]["RevenueAmount"].ToString(),
                    cbCheck = dt.Rows[i]["chk"].ToString(),
                    ProductROWID = dt.Rows[i]["ProductRowID"].ToString(),
                    RevenueROWID = dt.Rows[i]["RevenueROWID"].ToString(),
                    ProductType = dt.Rows[i]["ProductType"].ToString(),
                    RevenueStatus = dt.Rows[i]["RevenueStatus"].ToString(),
                    SubStage = dt.Rows[i]["SubStage"].ToString()
                });
            }
        }
       

        return oListOtherDet;
    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OptOtherDetails> GetRevenueById(string OptNo, int UserId, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        List<OptOtherDetails> oListOtherDet = new List<OptOtherDetails>();

        if (RolesList.Split(',').Contains("8095") || RolesList.Split(',').Contains("8094"))
        {
            pa.Add("@oper");
            pv.Add(7);

            pa.Add("@OptNumber");
            pv.Add(OptNo);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportOPTUpdates", true, pa, pv);
        }
        else
        {

            pa.Add("@oper");
            pv.Add(993);

            pa.Add("@OptNo");
            pv.Add(OptNo);

            pa.Add("@UserID");
            pv.Add(UserId);
            
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);
        }
        dt = ds.Tables[0];
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oListOtherDet.Add(new OptOtherDetails()
            {
                Optno = dt.Rows[i]["OpportunityNumber"].ToString(),
                OptId = dt.Rows[i]["OpportunityID"].ToString(),
                RevenueROWID = dt.Rows[i]["RevenueROWID"].ToString(),
                ProductType = dt.Rows[i]["ProductType"].ToString(),
                SubStage = dt.Rows[i]["SubStage"].ToString(),
                SalesmanRemarks = dt.Rows[i]["SalesmanRemarks"].ToString(),
                RevenueStatus = dt.Rows[i]["RevenueStatus"].ToString(),
                Scope = dt.Rows[i]["SCOPE"].ToString(),
                VendorList = dt.Rows[i]["VendorList"].ToString(),
                FormatValue = dt.Rows[i]["FORMATVALUE"].ToString(),
                SMOverview = dt.Rows[i]["Overview"].ToString(),
                SMRemarks = dt.Rows[i]["Remarks"].ToString(),
                SMWinPerc = dt.Rows[i]["WinPerc"].ToString(),
                UpdateAging = dt.Rows[i]["UpdateAging"].ToString(),
                WaitingDate = dt.Rows[i]["WaitingDate"].ToString()
            });
        }


        return oListOtherDet;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateOpportunity(string LoggedInUserRole, string OptNo, string Remarks, string Overview, string WinPerc,string UserId, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        if (RolesList.Split(',').Contains("8095") || RolesList.Split(',').Contains("8094"))
        {



            pa.Add("@oper");
            pv.Add("4");
            pa.Add("@OptNumber");
            pv.Add(OptNo);

            pa.Add("@Overview");
            pv.Add(Overview);

            pa.Add("@Remarks");
            pv.Add(Remarks);

            pa.Add("@WinPerc");
            pv.Add(WinPerc);

            pa.Add("@UserId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivityExport", true, pa, pv);
        }
        else
        {
            if (LoggedInUserRole == "salesman")
            {
                pa.Add("@oper");
                pv.Add("90");
            }
            else if (LoggedInUserRole == "salesmanager")
            {
                pa.Add("@oper");
                pv.Add("91");
            }
            else if (LoggedInUserRole == "marketing")
            {
                pa.Add("@oper");
                pv.Add("92");
            }
            else if (LoggedInUserRole == "client")
            {
                pa.Add("@oper");
                pv.Add("93");
            }

            pa.Add("@OptNumber");
            pv.Add(OptNo);

            pa.Add("@Overview");
            pv.Add(Overview);

            pa.Add("@Remarks");
            pv.Add(Remarks);

            pa.Add("@WinPerc");
            pv.Add(WinPerc);

            pa.Add("@UpdatedBy");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);
        }

          

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateUnderRiskOppReason(string OptNo, string ActionOwner, string DueDate, string ActionRequired, string UserId, string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        pa.Add("@oper");
        pv.Add(3);


        pa.Add("@OptNumber");
        pv.Add(OptNo);

        pa.Add("@ActionOwner");
        pv.Add(ActionOwner);

        pa.Add("@ActionRemarks");
        pv.Add(ActionRequired);

        pa.Add("@ActionDueDate");
        pv.Add(DueDate);

        pa.Add("@UpdatedBy");
        pv.Add(UserId);

        pa.Add("@ActionOwnerEmpno");
        pv.Add(EmpNo);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UnderRiskActionPlan", true, pa, pv);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateUnderRiskRevReason(string OptNo,string SelRevId, string ActionOwner, string DueDate, string ActionRequired, string UserId, string EmpNo,string Product)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        pa.Add("@oper");
        pv.Add(1);
        
        pa.Add("@OPTNumber");
        pv.Add(OptNo);

        pa.Add("@Product");
        pv.Add(Product);

        pa.Add("@RevRowId");
        pv.Add(SelRevId);

        pa.Add("@ActionOwner");
        pv.Add(ActionOwner);

        pa.Add("@ActionRemarks");
        pv.Add(ActionRequired);

        pa.Add("@ActionDueDate");
        pv.Add(DueDate);

        pa.Add("@UpdatedBy");
        pv.Add(UserId);

        pa.Add("@ActionOwnerEmpNo");
        pv.Add(EmpNo);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UnderRiskActionPlanRev", true, pa, pv);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateBlistReason(string AccID,string CustStatus, string ActionOwner, string DueDate, string ActionRequired, string UserId,string ActId, string CustAss,string CustPerc)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        pa.Add("@oper");
        pv.Add(23);


        pa.Add("@CRMAccountId");
        pv.Add(Convert.ToInt64(AccID));

        pa.Add("@CustomerStatus");
        pv.Add(CustStatus);

        pa.Add("@ActionOwner");
        pv.Add(ActionOwner);

        pa.Add("@ActionRemarks");
        pv.Add(ActionRequired);

        pa.Add("@ActionDueDate");
        pv.Add(DueDate);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@Actid");
        pv.Add(Convert.ToInt64(ActId));

        pa.Add("@CustomerAssessment");
        pv.Add(CustAss);

        pa.Add("@RelPerc");
        pv.Add(CustPerc);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccountAssessment", true, pa, pv);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static DDL GetBlistReson(string ActId, string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@Actid");
        pv.Add(Convert.ToInt64(ActId));

        pa.Add("@userId");
        pv.Add(UserId);

        DDL obj = new DDL();       

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccountAssessment", true, pa, pv);

        obj.Value = ds.Tables[0].Rows[0]["value"].ToString();
        return obj;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateRevenue(string LoggedInUserRole, string RevRowId, string Remarks, string Overview, string WinPerc, string UserId, string SubStage, string WaitingDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        
        pa.Add("@oper");
        pv.Add(994);

        pa.Add("@UserRole");
        pv.Add(LoggedInUserRole);

        pa.Add("@RevRowId");
        pv.Add(Convert.ToInt64(RevRowId));

        pa.Add("@Overview");
        pv.Add(Overview);

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@WinPerc");
        pv.Add(WinPerc);

        pa.Add("@UpdatedBy");
        pv.Add(UserId);

        pa.Add("@Substage");
        pv.Add(SubStage);

        //pa.Add("@SubstageDate");
        //pv.Add(SubStageDate);

        pa.Add("@WaitingDate");
        pv.Add(WaitingDate);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateLostReason(string UserId, string OptNo, string RevRowId, string LostReason, string LostDate, string Comp, string CompPrice, string SalesmanNotes)
    {
        
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

      

        if (RevRowId == "")
        {
            pa.Add("@oper");
            pv.Add(11);

            pa.Add("@OptNumber");
            pv.Add(OptNo);
        }
        else
        {
            pa.Add("@oper");
            pv.Add(12);

            pa.Add("@RevRowId");
            pv.Add(Convert.ToInt64(RevRowId));
        }

        pa.Add("@LostReason");
        pv.Add(LostReason);

        pa.Add("@LostDate");
        pv.Add(LostDate);

        pa.Add("@Competitor");
        pv.Add(Comp);

        pa.Add("@CompetitorPrice");
        pv.Add(CompPrice);

        pa.Add("@SalesmanNotes");
        pv.Add(SalesmanNotes);

        pa.Add("@userId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddRelatedProject(string projId, int UserId, string Overview, string Remarks, string Stage)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(995);

        pa.Add("@ProjectId");
        pv.Add(projId);

        pa.Add("@Overview");
        pv.Add(Overview);

        pa.Add("@remarks");
        pv.Add(Remarks);

        pa.Add("@CurrentStage");
        pv.Add(Stage);

        pa.Add("@UserID");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteActivity(string ActId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add("9");

        pa.Add("@Id");
        pv.Add(ActId);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteAttachment(string AttachId, string serverPath, string FileName)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

       
        //string Path = "D:\\CRMSS-Repo\\CRMSS\\Images\\CRMActivity\\jobnhand.png"; //+ FileName;
        string Path = serverPath; //+ FileName;

        FileInfo file = new FileInfo(Path);
        if (file.Exists)
        {
            file.Delete();
        }

        pa.Add("@oper");
        pv.Add("992");

        pa.Add("@Id");
        pv.Add(AttachId);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetAllAttendees()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(996);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

        List<DDL> drpval = new List<DDL>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DDL()
            {
                Name = dt.Rows[i]["Name"].ToString(),
                Value = dt.Rows[i]["EmpNo"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetCompanyDDL(string UserID, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");

        pa.Add("@UpdatedBy");
        pv.Add(UserID);

        if (RolesList.Split(',').Contains("8095") || RolesList.Split(',').Contains("8094"))
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivityExport", true, pa, pv);
        }
        else
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);
        }
        

        List<DDL> drpval = new List<DDL>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DDL()
            {
                Name = dt.Rows[i]["Company"].ToString(),
                Value = dt.Rows[i]["Company"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> Getmanager(string UserID, string Company, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@UpdatedBy");
        pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        if (RolesList.Split(',').Contains("8095") || RolesList.Split(',').Contains("8094"))
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivityExport", true, pa, pv);
        }
        else
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);
        }

        List<DDL> drpval = new List<DDL>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DDL()
            {
                Name = dt.Rows[i]["ManageName"].ToString(),
                Value = dt.Rows[i]["ManagerId"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetMember(string UserID, string Company, string Manager, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@UpdatedBy");
        pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(Manager);

        if (RolesList.Split(',').Contains("8095") || RolesList.Split(',').Contains("8094"))
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivityExport", true, pa, pv);
        }
        else
        {
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);
        }

        List<DDL> drpval = new List<DDL>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DDL()
            {
                Name = dt.Rows[i]["SalesmanName"].ToString(),
                Value = dt.Rows[i]["SalesmanID"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetLostReason()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@DropdownName");
        pv.Add("ddlCRMLostReason");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

        List<DDL> drpval = new List<DDL>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DDL()
            {
                Name = dt.Rows[i]["DataTextValue"].ToString(),
                Value = dt.Rows[i]["DataValueMember"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetCompetitorList(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("10");

        pa.Add("@userId");
        pv.Add(UserID);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

        List<DDL> drpval = new List<DDL>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DDL()
            {
                Name = dt.Rows[i]["Competitor"].ToString(),
                Value = dt.Rows[i]["Competitor"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }




}





// classes

public class EmpListDDL
{
    public string EmpNo { get; set; }
    public string EmpName { get; set; }
    public string Company { get; set; }
    public string DeptId { get; set; }
    public string DeptName { get; set; }
    public string DivisionName { get; set; }
    public string Email { get; set; }
    public string EmailSend { get; set; }
}


public class DDL
{
    public string Name { get; set; }
    public string Value { get; set; }
}
public class Activity {
    public string Id { get; set; }
    public string Type { get; set; }
    public string Subject { get; set; }
    public string FromDate { get; set; }
    public string FromTime{ get; set; }
    public string ToDate { get; set; }
    public string ToTime { get; set; }
    public string Remarks { get; set; }
    public string Status { get; set; }
    public string MOM { get; set; }
    public string optId { get; set; }
    public string ProjId { get; set; }
    public string AccountId { get; set; }
    public string AccountName { get; set; }

    public string AttachURL { get; set; }
    public string FileName { get; set; }

    public string UpdatedBy { get; set; }

    public string RelationPerc { get; set; }
    public string CustomerStatus { get; set; }
    public string CustomerAss { get; set; }

    public string OptNoMulti { get; set; }
    public string ProjIdMulti { get; set; }
    public string ActivityOn { get; set; }
}

public class VendorList{
    public string CRMAccountId { get; set; }
    public string AccountName { get; set; }
    public string ProductName { get; set; }
    public string ProductId { get; set; }
    public string OwnerId { get; set; }
    public string OwnerName { get; set; }
    public string VLStatus { get; set; }
    public string RecordName { get; set; }
    public string MarketingComments { get; set; }
    public string UpdatedDate { get; set; }
    public string CRMId { get; set; }
    public string CommitmentQuoter { get; set; }
    public string CommitmentYear { get; set; }

    public string UpdatedBy { get; set; }
    public string AuditDate { get; set; }
    public string AuditBy { get; set; }
    public string AuditStatus { get; set; }
    

}

public class Participants {
    public string Id { get; set; }
    public string ActId { get; set; }
    public string ActSubject { get; set; }
    public string ParticipantEmpNo { get; set; }
    public string ParticipantEmpName { get; set; }
    public string Status { get; set; }
    public string Availability { get; set; }
    public string CreatedBy { get; set; }
    public string CreatedDate { get; set; }

    public string RequesterName { get; set; }
    public string Type { get; set; }
    public string FromDate { get; set; }
    public string FromTime { get; set; }
    public string ToTime { get; set; }
    public string IsInvited { get; set; }

    public string InvitedBy { get; set; }
    public string AccountName { get; set; }
    public string ProjectName { get; set; }
}

public class OppRelated {
    public string OptId { get; set; }
    public string OptNo { get; set; }
    public string Customer { get; set; }
    public string OpenValue { get; set; }
    public string UpdateAging { get; set; }
    public string Overview { get; set; }
    public string Remarks { get; set; }
    public string WinPerc { get; set; }

    public string OptName { get; set; }    
    public string Salesman { get; set; }
    public string Consultant { get; set; }
    public string CreatedDate { get; set; }
    public string Marketing { get; set; }

    public string SalesManager { get; set; }
    public string UpdatedDate { get; set; }
    public string UpdatedBy { get; set; }
    public string StatusCode { get; set; }
}
public class PRJRelated
{
    public string ProjectId { get; set; }
    public string ProjectNo { get; set; }
    public string ProjectName { get; set; }
    public string ProjectStatus { get; set; }
    public string CreationDate { get; set; }
    public string Marketing { get; set; }
    public string Consultant { get; set; }

    public string OwnerId { get; set; }
    public string Owner { get; set; }
    public string Stage { get; set; }
    public string FormatedValue { get; set; }
    public string UpdateAging { get; set; }
    public string Overview { get; set; }
    public string Remarks { get; set; }

}
public class OptOtherDetails
{
    public string Optno { get; set; }
    public string OptId { get; set; }
    public string SMOverview { get; set; }
    public string SMRemarks { get; set; }
    public string SMWinPerc { get; set; }
    public string SMUpdatedDate { get; set; }
    public string MTOverview { get; set; }
    public string MTRemarks { get; set; }
    public string MTWinPerc { get; set; }
    public string MTUpdatedDate { get; set; }
    public string SalesmanOverview { get; set; }
    public string SalesmanRemarks { get; set; }
    public string SalesmanWinPerc { get; set; }
    public string SalesmanUpdatedDate { get; set; }

    public string UpdateAging { get; set; }
    public string WaitingDate { get; set; }
    public string RevenueROWID { get; set; }
    public string SubStage { get; set; }
    public string ProductType { get; set; }
    public string RevenueStatus { get; set; }
    public string Scope { get; set; }
    public string VendorList { get; set; }
    public string FormatValue { get; set; }

}
public class SalesForecast {
    public string OptId { get; set; }
    public string ForecastedMonth { get; set; }
    public string OptNo { get; set; }
    public string ForecastedAmount { get; set; }
    public string Remarks { get; set; }
    public string UpdatedDate { get; set; }
    public string OPTForecastId { get; set; }
    public string Products { get; set; }

    public string cbCheck { get; set; }
    public string ProductROWID { get; set; }
    public string RevenueROWID { get; set; }
    public string ProductType { get; set; }
    public string RevenueStatus { get; set; }
    public string SubStage { get; set; }
    public string RevenueAmount { get; set; }
}
public class ResponseMsg
{
    public string msg { get; set; }
    public string status { get; set; }
}