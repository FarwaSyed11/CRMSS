using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AuditManagement_AuditCalendar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

        }
        Session["ApplicationId"] = 25;
        //hfServerMapPth.Value = System.IO.Path.Combine(Server.MapPath(UploadFolderPath)).ToString();

    }
    protected string UploadFolderPath = "../Images/Collection/";

    protected string UploadFolderPathPopup = "../Masters/assets/images/img_avatar.png";
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //eConnectService service = new eConnectService();
        //service.UploadForActivity();

        //if (FUUploadNewAttach.HasFiles)
        //{
        //    foreach (HttpPostedFile uploadedFile in FUUploadNewAttach.PostedFiles)
        //    {
        //        uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath(UploadFolderPath), uploadedFile.FileName));
        //        //listofuploadedfiles.Text += String.Format("{0}<br />", uploadedFile.FileName);

        //        string rr = UploadFolderPath + uploadedFile.FileName;

        //        DBHandler DBH = new DBHandler();
        //        DataSet ds = new DataSet();
        //        DataTable dt = new DataTable();
        //        ArrayList pa = new ArrayList();
        //        ArrayList pv = new ArrayList();

        //        pa.Add("@oper");
        //        pv.Add("99");

        //        pa.Add("@AttachUrl");
        //        pv.Add(rr);

        //        pa.Add("@Id");
        //        pv.Add(hfAttachId.Value);

        //        pa.Add("@FileName");
        //        pv.Add(uploadedFile.FileName);

        //        pa.Add("@AttachComment");
        //        pv.Add(txtAttachComm.InnerText);

        //        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);
        //    }
        //    FUUploadNewAttach.DataBind();
        //    txtAttachComm.InnerText = "";
        //}

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

    ////AddUpdateAuditList
    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static void AddUpdateProject(ProjListObject data)
    //{

    //    DBHandler DBH = new DBHandler();
    //    DataSet ds = new DataSet();
    //    DataTable dt = new DataTable();
    //    ArrayList pa = new ArrayList();
    //    ArrayList pv = new ArrayList();

    //    pa.Add("@oper");
    //    pv.Add(1);

    //    pa.Add("@ProjId");
    //    pv.Add(data.ProjId);

    //    pa.Add("@ProjName");
    //    pv.Add(data.ProjName);

    //    pa.Add("@ProjDesc");
    //    pv.Add(data.ProjDesc);

    //    pa.Add("@Priority");
    //    pv.Add(data.Priority);

    //    pa.Add("@Status");
    //    pv.Add(data.Status);

    //    pa.Add("@StartDate");
    //    pv.Add(data.StartDate);

    //    pa.Add("@EndDate");
    //    pv.Add(data.EndDate);

    //    pa.Add("@DueDate");
    //    pv.Add(data.DueDate);

    //    pa.Add("@OwnerEmpNo");
    //    pv.Add(data.OwnerEmpNo);

    //    pa.Add("@OwnerName");
    //    pv.Add(data.OwnerName);

    //    pa.Add("@IsActive");
    //    pv.Add(data.IsActive);

    //    pa.Add("@CreatedBy");
    //    pv.Add(data.CreatedBy);

    //    pa.Add("@CreatedDate");
    //    pv.Add(data.CreatedDate);

    //    pa.Add("@UpdatedBy");
    //    pv.Add(data.UpdatedBy);

    //    pa.Add("@UpdatedDate");
    //    pv.Add(data.UpdatedDate);

    //    pa.Add("@Attr1");
    //    pv.Add(data.Attr1);

    //    pa.Add("@Attr2");
    //    pv.Add(data.Attr2);

    //    DBH.CreateDatasetForTODONew(ds, "sp_TODO_Project", true, pa, pv);


    //}


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
        pv.Add(5);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditActivity", true, pa, pv);

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
                    DivisionName = dt.Rows[i]["DivisionName"].ToString()
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateSupOrManagerRemarks(
   int Id,
  string Remarks,
  string Role,
  string AmntTobeCollected,
  string CollectedAmount,
  string EmpNo,
  int IsVerifiedBySup,
  int IsVerifiedByMan
   )
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(69);

        pa.Add("@Id");
        pv.Add(Id);

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@WhatRole");
        pv.Add(Role);

        pa.Add("@ActualAmount");
        pv.Add(Convert.ToInt64(AmntTobeCollected));

        pa.Add("@CollectedAmount");
        pv.Add(Convert.ToInt64(CollectedAmount));

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@IsVerifiedBySup");
        pv.Add(IsVerifiedBySup);

        pa.Add("@IsVerifiedByMan");
        pv.Add(IsVerifiedByMan);

        //DBH.CreateDatasetCRMEBSDATA(ds, "sp_ColActivity", true, pa, pv);

        //return ds.Tables[0].Rows[0]["ID"].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateSupOrManagerRemarksFromReportSide(
  int Id,
 string Remarks,
 string Role
  )
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(70);

        pa.Add("@Id");
        pv.Add(Id);

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@WhatRole");
        pv.Add(Role);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ColActivity", true, pa, pv);

        //return ds.Tables[0].Rows[0]["ID"].ToString();

    }
    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static string InserUpdatetActivity(
    //    int Id,
    //    string Type, 
    //    string Subject,
    //    string FromDate,
    //    string FromTime,
    //    string ToDate,
    //    string ToTime,
    //    string Remarks,
    //    string Status,
    //    string MOM,
    //    string UpdatedBy,
    //    string AccountId,
    //    string OptId,
    //    string ProjId,
    //    int CustRelPerc,
    //    string CustomerStatus,
    //    string CustomerAss
    //    )
    //{

    //    DBHandler DBH = new DBHandler();
    //    DataSet ds = new DataSet();
    //    DataTable dt = new DataTable();
    //    ArrayList pa = new ArrayList();
    //    ArrayList pv = new ArrayList();

    //    pa.Add("@oper");
    //    pv.Add("22");

    //    pa.Add("@Id");
    //    pv.Add(Id);

    //    pa.Add("@Type");
    //    pv.Add(Type);

    //    pa.Add("@Subject");
    //    pv.Add(Subject);

    //    pa.Add("@FromDate");
    //    pv.Add(FromDate);

    //    pa.Add("@FromTime");
    //    pv.Add(FromTime);

    //    pa.Add("@ToDate");
    //    pv.Add(ToDate);

    //    pa.Add("@ToTime");
    //    pv.Add(ToTime);

    //    pa.Add("@Remarks");
    //    pv.Add(Remarks);

    //    pa.Add("@Status");
    //    pv.Add(Status);

    //    pa.Add("@MinutesOfMeeting");
    //    pv.Add(MOM);        

    //    if (Type == "Customer Visit")
    //    {
    //        pa.Add("@SelOptMulti");
    //        pv.Add(OptId);

    //        pa.Add("@OpportunityId");
    //        pv.Add(0);

    //        pa.Add("@SelProjMulti");
    //        pv.Add(ProjId);

    //        pa.Add("@ProjectId");
    //        pv.Add(0);
    //    }
    //    else
    //    {
    //        pa.Add("@OpportunityId");
    //        pv.Add(OptId);

    //        pa.Add("@ProjectId");
    //        pv.Add(Convert.ToInt64(ProjId));
    //    }



    //    pa.Add("@UpdatedBy");
    //    pv.Add(Convert.ToInt64(UpdatedBy));

    //    pa.Add("@AccountId");
    //    pv.Add(Convert.ToInt64(AccountId));

    //    pa.Add("@RelationPerc");
    //    pv.Add(CustRelPerc);

    //    pa.Add("@CustomerStatus");
    //    pv.Add(CustomerStatus);

    //    pa.Add("@CustomerAssessment");
    //    pv.Add(CustomerAss);

    //    DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);

    //    return ds.Tables[0].Rows[0]["ID"].ToString();

    //}

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string InserUpdatetActivity(
   int Id,
   string Type,
   string Subject,
   string FromDate,
   string FromTime,
   string ToTime,
   string Remarks,
   string Status,
   string MOM,
   string UpdatedBy,
   string CustRelPerc,
   string CustomerStatus,
   string CustomerAss,
   string NextFollowUpDate,
   string ParentActId
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

        pa.Add("@ToTime");
        pv.Add(ToTime);

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@MinutesOfMeeting");
        pv.Add(MOM);

        pa.Add("@UpdatedByEmp");
        pv.Add(UpdatedBy);

        //pa.Add("@RelationPerc");
        //pv.Add(CustRelPerc);

        pa.Add("@ActualAmount");
        pv.Add(Convert.ToInt64(CustRelPerc));

        pa.Add("@CollectionStatus");
        pv.Add(CustomerStatus);

        pa.Add("@CollectedAmount");
        pv.Add(Convert.ToInt64(CustomerAss));

        pa.Add("@NextFollowUpDate");
        pv.Add(NextFollowUpDate);

        pa.Add("@ParentActivityId");
        pv.Add(Convert.ToInt64(ParentActId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ColActivity", true, pa, pv);

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
                    Convert.ToInt64(data[i].RelationPerc),
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

        pa.Add("@ParticipantEmpNos");
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

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ColActivity", true, pa, pv);

        List<Activity> oTPDList = new List<Activity>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {

            oTPDList.Add(new Activity()
            {
                Id = dt.Rows[i]["Id"].ToString(),
                FileName = dt.Rows[i]["FileName"].ToString(),
                AttachURL = dt.Rows[i]["URL"].ToString(),
                Remarks = dt.Rows[i]["AttachComment"].ToString()
            });
        }
        return oTPDList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Activity1> GetAllActivity()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("0");

        //pa.Add("@UpdatedByEmp");
        //pv.Add(UpdatedBy);


        //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
        //{
        //    Console.WriteLine(j);
        //}

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ColActivity", true, pa, pv);

        List<Activity1> oTPDList = new List<Activity1>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            //List<string> eStatuses = new List<string>();
            //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
            //{
            //    eStatuses.Add(j.Trim());
            //}


            oTPDList.Add(new Activity1()
            {
                Id = dt.Rows[i]["ID"].ToString(),
                Type = dt.Rows[i]["Type"].ToString(),
                Customer = dt.Rows[i]["Customer"].ToString(),
                CollectorName = dt.Rows[i]["CollectorName"].ToString(),
                FromDate = dt.Rows[i]["FromDate"].ToString(),
                FromTime = dt.Rows[i]["FromTime"].ToString(),
                ToTime = dt.Rows[i]["ToTime"].ToString(),
                GeneralRemarks = dt.Rows[i]["GeneralRemarks"].ToString(),
                ActivityStatus = dt.Rows[i]["ActivityStatus"].ToString(),
                CollectorRemarks = dt.Rows[i]["CollectorRemarks"].ToString(),
                CollectionStatus = dt.Rows[i]["CollectionStatus"].ToString(),
                CollectedAmount = dt.Rows[i]["CollectedAmount"].ToString(),
                ActualAmount = dt.Rows[i]["ActualAmount"].ToString(),

                SupervisorRemarks = dt.Rows[i]["SupervisorRemarks"].ToString(),
                ManagerRemarks = dt.Rows[i]["ManagerRemarks"].ToString(),
                IsVerifiedBySup = dt.Rows[i]["IsVerifiedBySup"].ToString(),
                IsVerifiedByMan = dt.Rows[i]["IsVerifiedByMan"].ToString()


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


        pa.Add("@Oper");
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
    public static List<OppRelated> GetAllOppRelated(string AccId, int UserId, string ActType, string RolesList)
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
    public static List<PRJRelated> GetAllPRJRelated(string AccId)
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
    public static List<OppRelated> GetOptHistory(string OptNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@OptNumber");
        pv.Add(OptNo);

        List<OppRelated> oTPDList = new List<OppRelated>();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

        dt = ds.Tables[0];

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
    public static List<OptOtherDetails> GetOptOtherUpdates(string OptNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@OptNumber");
        pv.Add(OptNo);

        List<OptOtherDetails> oListOtherDet = new List<OptOtherDetails>();

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OthersUpdatePopup", true, pa, pv);
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
                SalesmanRemarks = dt.Rows[i]["SalesmanRemarks"].ToString(),
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
    public static List<SalesForecast> GetSalesForecast(string OptNo, int UserId)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastNew", true, pa, pv);
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
    public static List<SalesForecast> GetSalesForecastRevenue(string SaleForecastId)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastNew", true, pa, pv);
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
    public static void AddUpdateSalesForcastRevenue(string SaleForecastId, string sForcastRevProductIds, string OptNo, string OptId, string Remarks, int Month, int Year, string ForecastedAmount, int UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@ForecastedId");
        pv.Add(SaleForecastId);

        pa.Add("@revRowids");
        pv.Add(sForcastRevProductIds);

        pa.Add("@OptNumber");
        pv.Add(OptNo);

        pa.Add("@OptId");
        pv.Add(Convert.ToInt64(OptId));

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
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastNew", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SalesForecast> GetRemainingForecastRevenueProduct(string OptNo)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);


        List<SalesForecast> oListOtherDet = new List<SalesForecast>();
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


        return oListOtherDet;
    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OptOtherDetails> GetRevenueById(string OptNo, int UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(993);

        pa.Add("@OptNo");
        pv.Add(OptNo);

        pa.Add("@UserID");
        pv.Add(UserId);

        List<OptOtherDetails> oListOtherDet = new List<OptOtherDetails>();

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);
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
    public static void UpdateOpportunity(string LoggedInUserRole, string OptNo, string Remarks, string Overview, string WinPerc, string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

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


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateUnderRiskOppReason(string OptNo, string ActionOwner, string DueDate, string ActionRequired, string UserId)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UnderRiskActionPlan", true, pa, pv);
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


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ColActivity", true, pa, pv);

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
        string Path = serverPath + FileName; //+ FileName;

        FileInfo file = new FileInfo(Path);
        if (file.Exists)
        {
            file.Delete();
        }

        pa.Add("@oper");
        pv.Add("992");

        pa.Add("@Id");
        pv.Add(AttachId);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ColActivity", true, pa, pv);

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
    public static List<DDL> GetCompanyDDL(int UserID, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");

        pa.Add("@UserId");
        pv.Add(UserID);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ColActivity", true, pa, pv);

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

        //for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
        //{
        //    listUM.Add(new ColUserMaster()
        //    {
        //        Id = ds.Tables[1].Rows[i]["Id"].ToString(),
        //        Company= ds.Tables[1].Rows[i]["Company"].ToString(),
        //        Name = ds.Tables[1].Rows[i]["Name"].ToString(),
        //        EmpNo = ds.Tables[1].Rows[i]["EmpNo"].ToString(),
        //        SupervisorEmpNo = ds.Tables[1].Rows[i]["SupervisorEmpNo"].ToString(),
        //        SupervisorName = ds.Tables[1].Rows[i]["SupName"].ToString(),
        //        ManagerEmpNo = ds.Tables[1].Rows[i]["ManagerEmpNo"].ToString(),
        //        ManagerName = ds.Tables[1].Rows[i]["ManagerName"].ToString(),
        //        Username = ds.Tables[1].Rows[i]["Username"].ToString(),
        //        Email = ds.Tables[1].Rows[i]["Email"].ToString(),
        //        UserAccountStatus = ds.Tables[1].Rows[i]["UserAccountStatus"].ToString(),
        //        ProfileId = ds.Tables[1].Rows[i]["ProfileResourceId"].ToString(),
        //        TeamName = ds.Tables[1].Rows[i]["TeamName"].ToString()
        //    });
        //}



        //return new ColUserMasterNddl() {
        //    listCompany= drpval,
        //    listUserMaster =listUM
        //};

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> Getmanager(int UserID, string Company, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(66);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ColActivity", true, pa, pv);


        List<DDL> drpval = new List<DDL>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DDL()
            {
                Name = dt.Rows[i]["ManageName"].ToString(),
                Value = dt.Rows[i]["ManageId"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetSupervisor(int UserID, string Company, string manager, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(67);

        pa.Add("@UserId");
        pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(manager);



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ColActivity", true, pa, pv);


        List<DDL> drpval = new List<DDL>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DDL()
            {
                Name = dt.Rows[i]["SupName"].ToString(),
                Value = dt.Rows[i]["SupEmpNo"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetCollector(int UserID, string Company, string manager, string supervisor, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(68);

        pa.Add("@UserId");
        pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(manager);

        pa.Add("@superVisorEmpno");
        pv.Add(supervisor);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ColActivity", true, pa, pv);


        List<DDL> drpval = new List<DDL>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DDL()
            {
                Name = dt.Rows[i]["ColName"].ToString(),
                Value = dt.Rows[i]["ColEmpNo"].ToString()
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


    //****************AUDIT MANAGEMENT****************

    //WEB method for create audit popup
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<auditevents> GetAllAuditEvents()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(3);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditActivity", true, pa, pv);

        List<auditevents> drpval = new List<auditevents>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new auditevents()
                {
                    AuditId = dt.Rows[i]["AuditActId"].ToString(),
                    AuditDept = dt.Rows[i]["AuditDepartment"].ToString(),
                    AuditeeOwner = dt.Rows[i]["AuditeeOwner"].ToString(),
                    AuditOwner = dt.Rows[i]["AuditOwner"].ToString(),
                    AuditeeOwnerName = dt.Rows[i]["AuditeeOwnerName"].ToString(),
                    AuditOwnerName = dt.Rows[i]["AuditOwnerName"].ToString(),
                    //AuditAreaOwner = dt.Rows[i]["AuditAreaOwner"].ToString(),
                    //ObsOwner = dt.Rows[i]["ObsOwner"].ToString(),
                    Scop = dt.Rows[i]["ScopeOfAudit"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    NoOfDays = dt.Rows[i]["NoOfDays"].ToString(),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    AuditActStartDate= dt.Rows[i]["ActualStartDate"].ToString(),
                    AuditActEndDate = dt.Rows[i]["ActualEndDate"].ToString(),
                    StatusCss = dt.Rows[i]["StatusCss"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    PriorityCss = dt.Rows[i]["PriorityCss"].ToString(),
                    ApprovalStatus = dt.Rows[i]["WrkflwStatus"].ToString()
                });
            }
        }


        return drpval;
    }


    //WEB method for insert auditevent
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool SaveAnactivity(AuditActivity data)
    {
        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add(0);

            pa.Add("@AuditId");
            pv.Add(data.AuditId);

            pa.Add("@AuditDepart");
            pv.Add(data.AuditDept);

            pa.Add("@AuditeeOwner");
            pv.Add(data.AuditeeOwner);

            pa.Add("@AuditOwner");
            pv.Add(data.AuditOwner);

            pa.Add("@IsNotifyAuditee");
            pv.Add(data.Notify);

            pa.Add("@ScopeOfAudit");
            pv.Add(data.Scop);

            pa.Add("@FromDate");
            pv.Add(data.StartDate);

            pa.Add("@ToDate");
            pv.Add(data.EndDate);

            pa.Add("@NoOfDays");
            pv.Add(data.NoOfDays);

            pa.Add("@Priority");
            pv.Add(data.Priority);

            pa.Add("@Status");
            pv.Add(data.Status);

            pa.Add("@UserID");
            pv.Add(data.USerID);

            pa.Add("@PriorityCss");
            pv.Add(data.PriorityCss);

            pa.Add("@StatusCss");
            pv.Add(data.StatusCss);

            pa.Add("@CreatedBy");
            pv.Add(data.CreatedBy);

            pa.Add("@CreatedDate");
            pv.Add(data.CreatedDate);

            pa.Add("@UpdatedBy");
            pv.Add(data.UpdatedBy);

            pa.Add("@UpdatedDate");
            pv.Add(data.UpdatedDate);

            DBH.CreateDataset_AuditManagement(ds, "sp_AuditActivity", true, pa, pv);

            return true;
        }
        catch (Exception ex)
        {

            return false;
        }


    }

    //get all auditors in dropdown
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetAllAuditors()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditActivity", true, pa, pv);

        List<DDL> drpval = new List<DDL>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DDL()
            {
                Name = dt.Rows[i]["EmpName"].ToString(),
                Value = dt.Rows[i]["EmpNo"].ToString()
            });
        }
        return drpval;

    }

    //get all auditee in dropdown
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetAllAuditee()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditActivity", true, pa, pv);

        List<DDL> drpval = new List<DDL>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DDL()
            {
                Name = dt.Rows[i]["FULL_NAME"].ToString(),
                Value = dt.Rows[i]["HOD"].ToString()
            });
        }
        return drpval;

    }

    //insert audit area
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void addUpdateAuditArea(auditarea data)
    {
      
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(0);

            pa.Add("@AuditAreaId");
            pv.Add(data.AreaID);
            
            //pa.Add("@AreaCode");
            //pv.Add(data.AreaCode);

            pa.Add("@AuditId");
            pv.Add(data.AuditId);

            pa.Add("@AreaName");
            pv.Add(data.AreaName);

            pa.Add("@AreaOwner");
            pv.Add(data.AreaOwner);

            pa.Add("@Priority");
            pv.Add(data.Priority);

            pa.Add("@Status");
            pv.Add(data.Status);

            pa.Add("@FromDate");
            pv.Add(data.StartDate);

            pa.Add("@ToDate");
            pv.Add(data.EndDate);

            pa.Add("@StatusCss");
            pv.Add(data.StatusCss);

            pa.Add("@PriorityCss");
            pv.Add(data.PriorityCss);

            pa.Add("@ObrProgress");
            pv.Add(data.ObserProg);

            pa.Add("@CreatedBy");
            pv.Add(data.CreatedBy);

            pa.Add("@CreatedDate");
            pv.Add(data.CreatedDate);

            pa.Add("@UpdatedBy");
            pv.Add(data.UpdatedBy);

            pa.Add("@UpdatedDate");
            pv.Add(data.UpdatedDate);

            DBH.CreateDataset_AuditManagement(ds, "sp_AuditArea", true, pa, pv);

       
    }

    //show audit area
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<auditarea> GetAllAuditAreas(int AuditId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@AuditId");
        pv.Add(AuditId);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditArea", true, pa, pv);

        List<auditarea> oListArea = new List<auditarea>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListArea.Add(new auditarea()
                {
                    AuditId = dt.Rows[i]["AuditId"].ToString(),
                    AreaID = dt.Rows[i]["AuditAreaId"].ToString(),
                    AreaName = dt.Rows[i]["AuditAreaName"].ToString(),
                    AreaOwner = dt.Rows[i]["AreaOwner"].ToString(),
                    AreaOwnerName = dt.Rows[i]["AreaOwnerName"].ToString(),
                    AreaCode = dt.Rows[i]["AreaCode"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    PriorityCss = dt.Rows[i]["PriorityCss"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StatusCss = dt.Rows[i]["StatusCss"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    AreaActStartDate = dt.Rows[i]["ActualStartDate"].ToString(),
                    AreaActEndDate = dt.Rows[i]["ActualEndDate"].ToString(),
                    ObserProg = dt.Rows[i]["ObservationProgress"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                  
                }); ; ;
            }
        }

        return oListArea;
        //string a = userId;
    }

    //insert observation
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void addUpdateAuditObservation(auditobservation data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@ObsID");
        pv.Add(data.ObsID);

        pa.Add("@AuditAreaId");
        pv.Add(data.AreaID);

        pa.Add("@AuditId");
        pv.Add(data.AuditId);

        pa.Add("@ObsName");
        pv.Add(data.ObsName);

        pa.Add("@ObsOwner");
        pv.Add(data.ObsOwner);

        pa.Add("@ObsDeets");
        pv.Add(data.ObsDetails);
        
        pa.Add("@ConsA");
        pv.Add(data.ConsequenceA);
        
        pa.Add("@ConsB");
        pv.Add(data.ConsequenceB);
        
        pa.Add("@TotConsAxB");
        pv.Add(data.AxB);
        
        pa.Add("@Resposibility");
        pv.Add(data.ObsRes);

        pa.Add("@Entity");
        pv.Add(data.ObsEntity);

        pa.Add("@Risk");
        pv.Add(data.ObsRisk);

        pa.Add("@Recommendation");
        pv.Add(data.ObsRecom);

        pa.Add("@ActionPlan");
        pv.Add(data.ObsActionPlan);

        pa.Add("@Remarks");
        pv.Add(data.ObsRemarks);

        pa.Add("@TargetDate");
        pv.Add(data.TargetDate);

        pa.Add("@Status");
        pv.Add(data.Status);

        pa.Add("@StatusCss");
        pv.Add(data.StatusCss);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);

        pa.Add("@UserID");
        pv.Add(data.USerID);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditObservation", true, pa, pv);


    }

    //show all the in observation
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<auditobservation> GetAllAuditObservations(int AuditId)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@AuditId");
        pv.Add(AuditId);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditObservation", true, pa, pv);

        List<auditobservation> oListObservation = new List<auditobservation>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListObservation.Add(new auditobservation()
                {
                    ObsID = dt.Rows[i]["ObsID"].ToString(),
                    AuditId = dt.Rows[i]["AuditId"].ToString(),
                    AreaID = dt.Rows[i]["AreaId"].ToString(),
                    AreaName = dt.Rows[i]["AreaName"].ToString(),
                    ObsName = dt.Rows[i]["ObsName"].ToString(),
                    ObsOwner = dt.Rows[i]["ObsOwner"].ToString(),
                    ObsOwnerName = dt.Rows[i]["ObsOwnerName"].ToString(),
                    ObsCode = dt.Rows[i]["ObsCode"].ToString(),
                    ObsDetails = dt.Rows[i]["ObsDeets"].ToString(),
                    ConsequenceA = dt.Rows[i]["ConsA"].ToString(),
                    ConsequenceB = dt.Rows[i]["ConsB"].ToString(),
                    AxB = dt.Rows[i]["TotConsAxB"].ToString(),
                    ObsRes = dt.Rows[i]["Resposibility"].ToString(),
                    ObsEntity = dt.Rows[i]["Entity"].ToString(),
                    ObsRisk = dt.Rows[i]["Risk"].ToString(),
                    ObsRiskName = dt.Rows[i]["RiskName"].ToString(),
                    ObsRecom = dt.Rows[i]["Recommendation"].ToString(),
                    ObsActionPlan = dt.Rows[i]["ActionPlan"].ToString(),
                    ObsRemarks = dt.Rows[i]["Remarks"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StatusCss = dt.Rows[i]["StatusCss"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString()
                   

                });

            }
        }

        return oListObservation;

    }
    

    //show all the team members
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<team> GetAllTeam(int AuditId)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@AuditId");
        pv.Add(AuditId);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditActivity", true, pa, pv);

        List<team> oListTeam = new List<team>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListTeam.Add(new team()
                {
                    AuditId = dt.Rows[i]["AuditId"].ToString(),
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    EmpName = dt.Rows[i]["EmpName"].ToString(),
                    RoleName = dt.Rows[i]["RoleName"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdateDate"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString()
                });
}
        }

        return oListTeam;

    }

    //insert risk
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void addUpdateAuditRisk(auditobservation data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@ObsID");
        pv.Add(data.ObsID);

        pa.Add("@AuditAreaId");
        pv.Add(data.AreaID);

        pa.Add("@AuditId");
        pv.Add(data.AuditId);

        pa.Add("@ObsName");
        pv.Add(data.ObsName);

        pa.Add("@ObsOwner");
        pv.Add(data.ObsOwner);

        pa.Add("@ObsDeets");
        pv.Add(data.ObsDetails);

        pa.Add("@ConsA");
        pv.Add(data.ConsequenceA);

        pa.Add("@ConsB");
        pv.Add(data.ConsequenceB);

        pa.Add("@TotConsAxB");
        pv.Add(data.AxB);

        pa.Add("@Resposibility");
        pv.Add(data.ObsRes);

        pa.Add("@Entity");
        pv.Add(data.ObsEntity);

        pa.Add("@Risk");
        pv.Add(data.ObsRisk);

        pa.Add("@Recommendation");
        pv.Add(data.ObsRecom);

        pa.Add("@ActionPlan");
        pv.Add(data.ObsActionPlan);

        pa.Add("@Remarks");
        pv.Add(data.ObsRemarks);

        pa.Add("@Status");
        pv.Add(data.Status);

        pa.Add("@StatusCss");
        pv.Add(data.StatusCss);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);

        pa.Add("@UserID");
        pv.Add(data.USerID);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditRiskControl", true, pa, pv);


    }

    //Delete area
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteArea(int AreaID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@AuditAreaId");
        pv.Add(AreaID);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditArea", true, pa, pv);

    }

    //Delete observation
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteObservation(int ObsID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@ObsID");
        pv.Add(ObsID);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditObservation", true, pa, pv);

    }


    //insert requirement
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddRequirement(Requirement data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@ReqID");
        pv.Add(data.ReqID);

        pa.Add("@ReqName");
        pv.Add(data.ReqName);

        pa.Add("@ReqDesc");
        pv.Add(data.ReqDesc);

        //pa.Add("@ReqRef");
        //pv.Add(data.ReqRef);

        pa.Add("@ReqStatus");
        pv.Add(data.ReqStatus);

        pa.Add("@ReqPriority");
        pv.Add(data.ReqPriority);

        pa.Add("@PriorityCss");
        pv.Add(data.PriorityCss);

        pa.Add("@ReqDate");
        pv.Add(data.ReqDate);

        pa.Add("@ReqOwner");
        pv.Add(data.ReqOwner);

        pa.Add("@AuditAreaId");
        pv.Add(data.AreaID);

        pa.Add("@AuditId");
        pv.Add(data.AuditID);

        pa.Add("@EscID");
        pv.Add(data.EscID);

        pa.Add("@StatusCss");
        pv.Add(data.StatusCss);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@UserID");
        pv.Add(data.USerID);

        pa.Add("@Comments");
        pv.Add(data.Comments);

        DBH.CreateDataset_AuditManagement(ds, "sp_Requirement", true, pa, pv);


    }

    //get all requirement
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Requirement> GetAllRequirements(int AuditID)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@AuditId");
        pv.Add(AuditID);

        DBH.CreateDataset_AuditManagement(ds, "sp_Requirement", true, pa, pv);

        List<Requirement> oListRequirement = new List<Requirement>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListRequirement.Add(new Requirement()
                {
                    ReqRef = dt.Rows[i]["ReqRef"].ToString(),
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                   // AuditID = dt.Rows[i]["AuditID"].ToString(),
                    AreaID = dt.Rows[i]["AreaId"].ToString(),
                    ReqDesc = dt.Rows[i]["ReqDesc"].ToString(),
                    ReqName = dt.Rows[i]["ReqName"].ToString(),
                    ReqStatus = dt.Rows[i]["ReqStatus"].ToString(),
                    ReqPriority = dt.Rows[i]["ReqPriority"].ToString(),
                    PriorityCss = dt.Rows[i]["PriorityCss"].ToString(),
                    ReqDate = dt.Rows[i]["ReqDate"].ToString(),
                    ReqOwner = dt.Rows[i]["ReqOwner"].ToString(),
                    EscID = dt.Rows[i]["EscID"].ToString(),
                    StatusCss = dt.Rows[i]["StatusCss"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    //USerID = dt.Rows[i]["UserID"].ToString(),
                    Comments = dt.Rows[i]["Comments"].ToString()


                });

            }
        }

        return oListRequirement;

    }

    //insert requirement
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddEscalation(Escalation data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@EscID");
        pv.Add(data.EscID);

        pa.Add("@ReqID");
        pv.Add(data.ReqID);

        pa.Add("@ReqName");
        pv.Add(data.ReqName);

        pa.Add("@ReqRef");
        pv.Add(data.ReqRef);

        pa.Add("@EscLevel");
        pv.Add(data.EscLevel);

        pa.Add("@PriorityCss");
        pv.Add(data.PriorityCss);

        pa.Add("@EscID");
        pv.Add(data.EscID);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@UserID");
        pv.Add(data.USerID);

        pa.Add("@Comments");
        pv.Add(data.Comments);

        pa.Add("@Count");
        pv.Add(data.Count);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);

        DBH.CreateDataset_AuditManagement(ds, "sp_Requirement", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setApprovalStatus(int AuditId,string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@AuditId");
        pv.Add(AuditId);

        pa.Add("@ApprovalStatus");
        pv.Add(Status);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditArea", true, pa, pv);

       
    }

    //AUDIT Management work Start

    //ALL Classes
    public class Escalation
    {
        public string EscLevel { get; set; }
        public string Count { get; set; }
        public string Comments { get; set; }
        public string ReqID { get; set; }
        public string ReqRef { get; set; }
        public string ReqName { get; set; }
        public string PriorityCss { get; set; }
        public string AuditID { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string EscID { get; set; }
        public string USerID { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }

    }
    public class Requirement
    {
        public string Comments { get; set; }
        public string ReqID { get; set; }
        public string ReqRef { get; set; }
        public string ReqName { get; set; }
        public string ReqDesc { get; set; }
        public string ReqStatus { get; set; }
        public string ReqPriority { get; set; }
        public string StatusCss { get; set; }
        public string PriorityCss { get; set; }
        public string ReqDate { get; set; }
        public string ReqOwner { get; set; }
        public string AreaID { get; set; }
        public string AuditID { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string EscID { get; set; }
        public string USerID { get; set; }
    }
    public class AuditActivity
    {
        public string AuditId { get; set; }
        public string AuditDept { get; set; }
        public string AuditeeOwner { get; set; }
        public string AuditOwner { get; set; }
        public string AuditeeOwnerName { get; set; }
        public string AuditOwnerName { get; set; }
        public string ObsOwner { get; set; }
        public string AuditAreaOwner { get; set; }
        public string Notify { get; set; }
        public string Priority { get; set; }
        public string Status { get; set; }
        public string Scop { get; set; }
        public string StartDate { get; set; }
        public string NoOfDays { get; set; }
        public string EndDate { get; set; }
        public string USerID { get; set; }
        public string StatusCss { get; set; }
        public string PriorityCss { get; set; }
        public string AuditActStartDate { get; set; }
        public string AuditActEndDate { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
    }
    public class auditevents
    {
        public string AuditId { get; set; }
        public string AuditDept { get; set; }
        public string AuditeeOwner { get; set; }
        public string AuditOwner { get; set; }
        public string AuditeeOwnerName { get; set; }
        public string AuditOwnerName { get; set; }
        public string Notify { get; set; }
        public string ObsOwner { get; set; }
        public string AuditAreaOwner { get; set; }
        public string Priority { get; set; }
        public string Status { get; set; }
        public string Scop { get; set; }
        public string StartDate { get; set; }
        public string NoOfDays { get; set; }
        public string EndDate { get; set; }
        public string USerID { get; set; }
        public string AuditActStartDate { get; set; }
        public string AuditActEndDate { get; set; }
        public string StatusCss { get; set; }
        public string PriorityCss { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string ApprovalStatus { get; set; }

    }

    public class auditarea
    {
        public string AreaID { get; set; }
        public string AuditId { get; set; }
        public string AreaCode { get; set; }
        public string AreaName { get; set; }
        public string AreaOwner { get; set; }
        public string AreaOwnerName { get; set; }
        public string Priority { get; set; }
        public string Status { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string StatusCss { get; set; }
        public string PriorityCss { get; set; }
        public string ObserProg { get; set; }
        public string USerID { get; set; }
        public string AreaActStartDate { get; set; }
        public string AreaActEndDate { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string ApprovalStatus { get; set; }
    }

    public class auditobservation
    {
        public string ObsID { get; set; }
        public string AreaID { get; set; }
        public string AreaName { get; set; }
        public string AuditId { get; set; }
        public string ObsCode { get; set; }
        public string ObsName { get; set; }
        public string ObsOwnerName { get; set; }
        public string ObsOwner { get; set; }
        public string ObsDetails { get; set; }
        public string ConsequenceA { get; set; }
        public string ConsequenceB { get; set; }
        public string AxB { get; set; }
        public string ObsRes { get; set; }
        public string ObsEntity { get; set; }
        public string ObsRisk { get; set; }
        public string ObsRiskName { get; set; }
        public string ObsRecom { get; set; }
        public string ObsActionPlan { get; set; }
        public string ObsRemarks { get; set; }
        public string TargetDate { get; set; }
        public string Status { get; set; }
        public string StatusCss { get; set; }
        public string USerID { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
    }

    public class team
    {
        public string AuditId { get; set; }
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string RoleName { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
    }

    // classes

    //new 
    public class Activity1
    {
        public string Id { get; set; }
        public string Type { get; set; }
        public string Customer { get; set; }
        public string CollectorName { get; set; }
        public string FromDate { get; set; }
        public string FromTime { get; set; }
        public string ToDate { get; set; }
        public string ToTime { get; set; }
        public string GeneralRemarks { get; set; }
        public string ActivityStatus { get; set; }
        public string CollectorRemarks { get; set; }
        public string UpdatedBy { get; set; }

        public string ActualAmount { get; set; }
        public string CollectionStatus { get; set; }
        public string CollectedAmount { get; set; }
        public string SupervisorRemarks { get; set; }
        public string ManagerRemarks { get; set; }
        public string IsVerifiedBySup { get; set; }
        public string IsVerifiedByMan { get; set; }


    }


    //old 
    public class DDL
    {
        public string Name { get; set; }
        public string Value { get; set; }
    }
    public class ColUserMaster
    {
        public string Id { get; set; }
        public string Company { get; set; }
        public string Name { get; set; }
        public string EmpNo { get; set; }
        public string SupervisorEmpNo { get; set; }
        public string SupervisorName { get; set; }
        public string ManagerEmpNo { get; set; }
        public string ManagerName { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string UserAccountStatus { get; set; }
        public string ProfileId { get; set; }
        public string TeamName { get; set; }
    }
    public class ColUserMasterNddl
    {
        public List<DDL> listCompany { get; set; }
        public List<ColUserMaster> listUserMaster { get; set; }
    }

    public class Activity
    {
        public string Id { get; set; }
        public string Type { get; set; }
        public string Subject { get; set; }
        public string FromDate { get; set; }
        public string FromTime { get; set; }
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
    }

    public class Participants
    {
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

    public class OppRelated
    {
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
    public class SalesForecast
    {
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

    public class EmpListDDL
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string Company { get; set; }
        public string DeptId { get; set; }
        public string DeptName { get; set; }
        public string DivisionName { get; set; }
    }



}

