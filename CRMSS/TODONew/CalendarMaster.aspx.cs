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

public partial class Collection_CalendarMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

        }
            Session["ApplicationId"] = 17;
        hfServerMapPth.Value = System.IO.Path.Combine(Server.MapPath(UploadFolderPath)).ToString();

    }
    protected string UploadFolderPath = "../Images/Collection/";

    protected string UploadFolderPathPopup = "../Masters/assets/images/img_avatar.png";
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //eConnectService service = new eConnectService();
        //service.UploadForActivity();

        if (FUUploadNewAttach.HasFiles)
        {
            foreach (HttpPostedFile uploadedFile in FUUploadNewAttach.PostedFiles)
            {
                uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath(UploadFolderPath), uploadedFile.FileName));
                //listofuploadedfiles.Text += String.Format("{0}<br />", uploadedFile.FileName);

                string rr = UploadFolderPath + uploadedFile.FileName;

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
                pv.Add(uploadedFile.FileName);

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
   string NextFollowUpDate,
   string ParentActId,
   string MeetingCategory,
   int ProjectId,
   string ProjectName
   )
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@ProjActivityId");
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

        pa.Add("@NextFollowUpDate");
        pv.Add(NextFollowUpDate);

        pa.Add("@ParentActivityId");
        pv.Add(Convert.ToInt64(ParentActId));

        pa.Add("@ProjId");
        pv.Add(ProjectId);

        pa.Add("@ProjName");
        pv.Add(ProjectName);

        pa.Add("@MeetingCategory");
        pv.Add(MeetingCategory);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);

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
    public static ResponseMsg Insertparticipants(string ParticipantsEmpNos, int ActId, string Status, string CreatedBy, string ActivityDate, int IsProjMember)
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

        pa.Add("@IsProjMember");
        pv.Add(IsProjMember);
        //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
        //{
        //    Console.WriteLine(j);
        //}

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);
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


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);

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


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);

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
                IsProjMember = dt.Rows[i]["IsProjMember"].ToString()

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


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);

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
                ProjectName = dt.Rows[i]["ProjectName"].ToString()
            });
        }
        return oTPDList;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdatePartiReq(string EmpNo, string Availability, int ActId, string InviId, string ReasonForNo,string CreatedDate)
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
        pv.Add(ActId);

        pa.Add("@InviId");
        pv.Add(Convert.ToInt64(InviId));

        pa.Add("@ReasonForNo");
        pv.Add(ReasonForNo);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);

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
                AttachURL = dt.Rows[i]["URL"].ToString() ,
                Remarks = dt.Rows[i]["AttachComment"].ToString()
            });
        }
        return oTPDList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Activity1> GetAllActivity(string UpdatedBy)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

       
        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@UpdatedByEmp");
        pv.Add(UpdatedBy);
        

        //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
        //{
        //    Console.WriteLine(j);
        //}

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);

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
                Id = dt.Rows[i]["ProjActivityId"].ToString(),
                Type = dt.Rows[i]["Type"].ToString(),
                Subject = dt.Rows[i]["Subject"].ToString(),
                FromDate = dt.Rows[i]["FromDate"].ToString(),
                FromTime = dt.Rows[i]["FromTime"].ToString(),
                ToTime = dt.Rows[i]["ToTime"].ToString(),
                GeneralRemarks = dt.Rows[i]["GeneralRemarks"].ToString(),
                ActivityStatus = dt.Rows[i]["ActivityStatus"].ToString(),
                ProjId = dt.Rows[i]["ProjectId"].ToString(),
                ProjName = dt.Rows[i]["ProjectName"].ToString(),
                MeetingCategory = dt.Rows[i]["MeetingCategory"].ToString(),                 
                MOM = dt.Rows[i]["MOM"].ToString(),
                IsInvited = dt.Rows[i]["IsInvited"].ToString()
            });
        }
        return oTPDList;
        //string a = userId;
    }


    //TODO Projects
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjListObject> GetAllProjects(string EmpNo, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);

        List<ProjListObject> oProjList = new List<ProjListObject>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oProjList.Add(new ProjListObject()
                {
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjectId"]),
                    ProjName = dt.Rows[i]["ProjectName"].ToString(),
                    ProjDesc = dt.Rows[i]["ProjectDesc"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    DueDate = dt.Rows[i]["DueDate"].ToString(),
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString(),
                    Attr4 = dt.Rows[i]["Attr4"].ToString(),
                    Attr5 = dt.Rows[i]["Attr5"].ToString(),
                });
            }
        }

        return oProjList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<MStoneListObject> GetAllMilstones(string EmpNo, int ProjectId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);

        pa.Add("@ProjId");
        pv.Add(ProjectId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);

        List<MStoneListObject> oMStoneList = new List<MStoneListObject>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oMStoneList.Add(new MStoneListObject()
                {
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjectId"]),
                    ProjName = dt.Rows[i]["ProjectName"].ToString(),
                    MStoneId = Convert.ToInt32(dt.Rows[i]["MilestoneId"]),
                    MStoneName = dt.Rows[i]["MileSname"].ToString(),
                    MStoneDesc = dt.Rows[i]["MileSdesc"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    DueDate = dt.Rows[i]["DueDate"].ToString(),
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString()
                });
            }
        }

        return oMStoneList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TaskListObject> GetAllTasks(string EmpNo, int ProjectId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);

        pa.Add("@ProjId");
        pv.Add(ProjectId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);

        List<TaskListObject> oMStoneList = new List<TaskListObject>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oMStoneList.Add(new TaskListObject()
                {
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjectId"]),
                    MStoneId = Convert.ToInt32(dt.Rows[i]["MilestoneId"]),
                    TaskId = Convert.ToInt32(dt.Rows[i]["TaskId"]),
                    TaskName = dt.Rows[i]["TaskName"].ToString(),
                    TaskDesc = dt.Rows[i]["TaskDesc"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    DueDate = dt.Rows[i]["DueDate"].ToString(),
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString()
                });
            }
        }

        return oMStoneList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ListProjMStoneTask GetProjMStoneTasks( int ProjectId, string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@ProjId");
        pv.Add(ProjectId);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);

        ListProjMStoneTask oProjMstnTask = new ListProjMStoneTask();

        List<ProjListObject> oProjList = new List<ProjListObject>();
        List<MStoneListObject> oMStoneList = new List<MStoneListObject>();
        List<TaskListObject> oTaskList = new List<TaskListObject>();      

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            //For Projects
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    oProjList.Add(new ProjListObject()
                    {
                        ProjId = Convert.ToInt32(dt.Rows[i]["ProjectId"]),
                        ProjName = dt.Rows[i]["ProjectName"].ToString(),
                        ProjDesc = dt.Rows[i]["ProjectDesc"].ToString(),
                        Priority = dt.Rows[i]["Priority"].ToString(),
                        Status = dt.Rows[i]["Status"].ToString(),
                        StartDate = dt.Rows[i]["StartDate"].ToString(),
                        EndDate = dt.Rows[i]["EndDate"].ToString(),
                        DueDate = dt.Rows[i]["DueDate"].ToString(),
                        OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                        OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                        IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                        CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                        CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                        UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                        UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                        Attr1 = dt.Rows[i]["Attr1"].ToString(),
                        Attr2 = dt.Rows[i]["Attr2"].ToString(),
                        Attr3 = dt.Rows[i]["Attr3"].ToString(),
                        Attr4 = dt.Rows[i]["Attr4"].ToString(),
                        Attr5 = dt.Rows[i]["Attr5"].ToString(),
                    });
                }            

            //for milstone
            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oMStoneList.Add(new MStoneListObject()
                {
                    ProjId = Convert.ToInt32(ds.Tables[1].Rows[i]["ProjectId"]),
                    ProjName = ds.Tables[1].Rows[i]["ProjectName"].ToString(),
                    MStoneId = Convert.ToInt32(ds.Tables[1].Rows[i]["MilestoneId"]),
                    MStoneName = ds.Tables[1].Rows[i]["MileSname"].ToString(),
                    MStoneDesc = ds.Tables[1].Rows[i]["MileSdesc"].ToString(),
                    Priority = ds.Tables[1].Rows[i]["Priority"].ToString(),
                    Status = ds.Tables[1].Rows[i]["Status"].ToString(),
                    StartDate = ds.Tables[1].Rows[i]["StartDate"].ToString(),
                    EndDate = ds.Tables[1].Rows[i]["EndDate"].ToString(),
                    DueDate = ds.Tables[1].Rows[i]["DueDate"].ToString(),
                    OwnerEmpNo = ds.Tables[1].Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = ds.Tables[1].Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(ds.Tables[1].Rows[i]["IsActive"]),
                    CreatedBy = ds.Tables[1].Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = ds.Tables[1].Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = ds.Tables[1].Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = ds.Tables[1].Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = ds.Tables[1].Rows[i]["Attr1"].ToString(),
                    Attr2 = ds.Tables[1].Rows[i]["Attr2"].ToString(),
                    Attr3 = ds.Tables[1].Rows[i]["Attr3"].ToString()
                });
            }

            //for Task
            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
            {
                oTaskList.Add(new TaskListObject()
                {
                    ProjId = Convert.ToInt32(ds.Tables[2].Rows[i]["ProjectId"]),
                    MStoneId = Convert.ToInt32(ds.Tables[2].Rows[i]["MilestoneId"]),
                    TaskId = Convert.ToInt32(ds.Tables[2].Rows[i]["TaskId"]),
                    TaskName = ds.Tables[2].Rows[i]["TaskName"].ToString(),
                    TaskDesc = ds.Tables[2].Rows[i]["TaskDesc"].ToString(),
                    Priority = ds.Tables[2].Rows[i]["Priority"].ToString(),
                    Status = ds.Tables[2].Rows[i]["Status"].ToString(),
                    StartDate = ds.Tables[2].Rows[i]["StartDate"].ToString(),
                    EndDate = ds.Tables[2].Rows[i]["EndDate"].ToString(),
                    DueDate = ds.Tables[2].Rows[i]["DueDate"].ToString(),
                    OwnerEmpNo = ds.Tables[2].Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = ds.Tables[2].Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(ds.Tables[2].Rows[i]["IsActive"]),
                    CreatedBy = ds.Tables[2].Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = ds.Tables[2].Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = ds.Tables[2].Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = ds.Tables[2].Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = ds.Tables[2].Rows[i]["Attr1"].ToString(),
                    Attr2 = ds.Tables[2].Rows[i]["Attr2"].ToString(),
                    Attr3 = ds.Tables[2].Rows[i]["Attr3"].ToString()
                });
            }

        }

        return new ListProjMStoneTask() {
            oProjList = oProjList,
            oMstoneList =oMStoneList,
            oTaskList =oTaskList
        };
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

        pa.Add ("@revRowids");
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
    public static void UpdateOpportunity(string LoggedInUserRole, string OptNo, string Remarks, string Overview, string WinPerc,string UserId)
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
        else if(LoggedInUserRole == "salesmanager")
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
        pv.Add(8);

        pa.Add("@UserId");
        pv.Add(UserID);
              
       DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);

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
    public static List<DDL> GetHOD(int UserID, string Company, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@Company");
        pv.Add(Company);


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);


        List<DDL> drpval = new List<DDL>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DDL()
            {
                Name = dt.Rows[i]["UEmployeeName"].ToString(),
                Value = dt.Rows[i]["EmpNo"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetManager(int UserID,string HOD, string Company, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(10);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@Company");
        pv.Add(Company);

        //pa.Add("@HOD");
        //pv.Add(HOD);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);
        

        List<DDL> drpval = new List<DDL>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DDL()
            {
                Name = dt.Rows[i]["UEmployeeName"].ToString(),
                Value = dt.Rows[i]["EmpNo"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetEmployees(int UserID, string Company, string HOD, string Manager, string RolesList)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(11);

        pa.Add("@UserId");
        pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@HODEmpNo");
        pv.Add(HOD);

        pa.Add("@ManagerEmpNo");
        pv.Add(Manager);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);


        List<DDL> drpval = new List<DDL>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DDL()
            {
                Name = dt.Rows[i]["UEmployeeName"].ToString(),
                Value = dt.Rows[i]["EmpNo"].ToString()
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
        pv.Add(10);

        pa.Add("@UserId");
        pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(manager);

       

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_ProjActivity", true, pa, pv);
        

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

//new 
public class Activity1
{
    public string Id { get; set; }
    public string Type { get; set; }
    public string Subject { get; set; }
    public string FromDate { get; set; }
    public string FromTime { get; set; }
    public string ToDate { get; set; }
    public string ToTime { get; set; }
    public string GeneralRemarks { get; set; }
    public string ActivityStatus { get; set; }
    public string UpdatedBy { get; set; }

    public string ProjId { get; set; }
    public string ProjName { get; set; }
    public string MeetingCategory { get; set; }
    public string MOM { get; set; }

    public string IsInvited { get; set; }

}

public class ListProjMStoneTask
{
    public List<ProjListObject> oProjList { get; set; }
    public List<MStoneListObject> oMstoneList { get; set; }
    public List<TaskListObject> oTaskList { get; set; }
}

public class ProjListObject
{
    public int ProjId { get; set; }
    public string ProjName { get; set; }
    public string ProjDesc { get; set; }

    public string Priority { get; set; }
    public string Status { get; set; }
    public string StartDate { get; set; }
    public string EndDate { get; set; }
    public string DueDate { get; set; }
    public string OwnerName { get; set; }
    public string OwnerEmpNo { get; set; }
    public int IsActive { get; set; }
    public string CreatedBy { get; set; }
    public string CreatedDate { get; set; }
    public string UpdatedBy { get; set; }
    public string UpdatedDate { get; set; }

    public string Attr1 { get; set; }
    public string Attr2 { get; set; }
    public string Attr3 { get; set; }
    public string Attr4 { get; set; }
    public string Attr5 { get; set; }
}

public class MStoneListObject
{
    public int ProjId { get; set; }
    public string ProjName { get; set; }

    public int MStoneId { get; set; }
    public string MStoneName { get; set; }
    public string MStoneDesc { get; set; }

    public string Priority { get; set; }
    public string Status { get; set; }
    public string StartDate { get; set; }
    public string EndDate { get; set; }
    public string DueDate { get; set; }
    public string OwnerName { get; set; }
    public string OwnerEmpNo { get; set; }
    public int IsActive { get; set; }
    public string CreatedBy { get; set; }
    public string CreatedDate { get; set; }
    public string UpdatedBy { get; set; }
    public string UpdatedDate { get; set; }

    public string Attr1 { get; set; }
    public string Attr2 { get; set; }
    public string Attr3 { get; set; }
    public string Attr4 { get; set; }
    public string Attr5 { get; set; }
}

public class TaskListObject
{
    public int ProjId { get; set; }
    public int MStoneId { get; set; }
    public int TaskId { get; set; }

    public string TaskName { get; set; }
    public string TaskDesc { get; set; }

    public string Priority { get; set; }
    public string Status { get; set; }
    public string StartDate { get; set; }
    public string EndDate { get; set; }
    public string DueDate { get; set; }
    public string OwnerName { get; set; }
    public string OwnerEmpNo { get; set; }
    public int IsActive { get; set; }
    public string CreatedBy { get; set; }
    public string CreatedDate { get; set; }
    public string UpdatedBy { get; set; }
    public string UpdatedDate { get; set; }

    public string Attr1 { get; set; }
    public string Attr2 { get; set; }
    public string Attr3 { get; set; }

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
    public string IsProjMember { get; set; }

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