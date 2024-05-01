using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

public partial class FireDuctWork_InspectionDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RequestedToInspection> GetInspectionProjects()

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(5);


        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

        List<RequestedToInspection> listProjDet = new List<RequestedToInspection>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            RequestedToInspection ind = new RequestedToInspection();
            ind.Mid = dt.Rows[i]["Id"].ToString();
            ind.SLNo = dt.Rows[i]["SLNo"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.CustomerNumber = dt.Rows[i]["CustomerNumber"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Consultant = dt.Rows[i]["Consultant"].ToString();
            ind.MainContractor = dt.Rows[i]["MainContractor"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.DeliveryDate = dt.Rows[i]["DeliveryDate"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void InsertUpdateChecklist(List<ChecklistDynamicControls> data)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        //pa.Add("@Oper");
        //pv.Add(5);

        //pa.Add("@list");
        //pv.Add(data[0].Radio);


        List<ChecklistDynamicControls> olistRB = new List<ChecklistDynamicControls>();
        List<KeyValuePair> olistTxtComm = new List<KeyValuePair>();
        List<KeyValuePair> olistTxtActionReq = new List<KeyValuePair>();
        List<KeyValuePair> olistchecklistNames = new List<KeyValuePair>();

        for (int i = 0; i < data[0].Textbox.Count(); i++)
        {
            if (data[0].Textbox[i].Id.Contains("txtChecklistComm"))
            {
                olistTxtComm.Add(new KeyValuePair()
                {
                    Id = data[0].Textbox[i].Id,
                    Value = data[0].Textbox[i].Value.ToString()
                });
            }
            else if (data[0].Textbox[i].Id.Contains("txtChecklistActionReq")) {
                olistTxtActionReq.Add(new KeyValuePair()
                {
                    Id = data[0].Textbox[i].Id,
                    Value = data[0].Textbox[i].Value.ToString()
                });
              
            }
            else
            {

            }
        }

        for (int i = 0; i < data[0].checklistNames.Count(); i++)
        {
            olistchecklistNames.Add(new KeyValuePair()
            {
                Id = data[0].checklistNames[i].Id,
                Value = data[0].checklistNames[i].Value.ToString()
            });
        }


        using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["FRDCon"].ToString()))
        {
            con.Open();

            using (SqlCommand cmd = new SqlCommand("exec [AddCheckListResponses] @listPara", con))
            {
                using (var table = new DataTable())
                {
                    table.Columns.Add("CheckListResponseId", typeof(Int32));
                    table.Columns.Add("InspectionId", typeof(Int32));
                    table.Columns.Add("ProjectNumber", typeof(string));
                    table.Columns.Add("InspectionNumber", typeof(string));
                    table.Columns.Add("StatusId", typeof(string));
                    table.Columns.Add("Status", typeof(string));
                    table.Columns.Add("CommentId", typeof(string));
                    table.Columns.Add("Comment", typeof(string));
                    table.Columns.Add("ActionRequredId", typeof(string));
                    table.Columns.Add("ActionRequred", typeof(string));
                    table.Columns.Add("CheckListName", typeof(string));
                  

                    for (int i = 0; i < data[0].Radio.Count(); i++)
                    {

                        table.Rows.Add(
                            Convert.ToInt32(olistchecklistNames[i].Id),
                            Convert.ToInt32(data[0].InspecId),
                            data[0].ProjNumber.ToString(),
                            data[0].InspectNumber,
                            data[0].Radio[i].Id.ToString(),
                            data[0].Radio[i].Value.ToString(),
                            olistTxtComm[i].Id.ToString(),
                            olistTxtComm[i].Value.ToString(),
                            olistTxtActionReq[i].Id.ToString(),
                            olistTxtActionReq[i].Value.ToString(),
                            olistchecklistNames[i].Value.ToString()
                            );
                  
                    }



                    //var pList1 = new SqlParameter[](
                    //    new SqlParameter("@InspecId", SqlDbType.Int),
                    //    new SqlParameter("@listPara", SqlDbType.Structured)
                    //    );

                    var pList = new SqlParameter("@listPara", SqlDbType.Structured);
                    pList.TypeName = "dbo.ControlsList";
                    pList.Value = table;

                    cmd.Parameters.Add(pList);
                    //cmd.Parameters.Add(new SqlParameter("@listPara", SqlDbType.Structured));
                    cmd.ExecuteReader();

                    //using (var dr = cmd.ExecuteReader())
                    //{
                    //    while (dr.Read())
                    //        //Console.WriteLine(dr["Item"].ToString());
                    //    Console.WriteLine(dr["Id"].ToString());
                    //    Console.WriteLine(dr["InspectionId"].ToString());
                    //    Console.WriteLine(dr["ProjectNumber"].ToString());
                    //    Console.WriteLine(dr["StatusId"].ToString());
                    //    Console.WriteLine(dr["Status"].ToString());
                    //    Console.WriteLine(dr["CommentId"].ToString());
                    //    Console.WriteLine(dr["Comment"].ToString());
                    //    Console.WriteLine(dr["ActionRequredId"].ToString());
                    //    Console.WriteLine(dr["ActionRequred"].ToString());
                    //}
                }
            }
        }





        // dt = ds.Tables[0];






    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CheckLisDetails> GetCheckLists()

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(6);


        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

        List<CheckLisDetails> Checklist = new List<CheckLisDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CheckLisDetails ind = new CheckLisDetails();
            //ind.Mid = dt.Rows[i]["Id"].ToString();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.CheckList = dt.Rows[i]["CheckList"].ToString();


            Checklist.Add(ind);
        }


        return Checklist;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CheckLisDetailsResponse> GetInspectResponse(string InspectId)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@Id");
        pv.Add(InspectId);


        DBH.CreateDatasetFRD(ds, "sp_FRDInspectionDetails", true, pa, pv);

        List<CheckLisDetailsResponse> Checklist = new List<CheckLisDetailsResponse>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CheckLisDetailsResponse ind = new CheckLisDetailsResponse();
            //ind.Mid = dt.Rows[i]["Id"].ToString();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.CheckList = dt.Rows[i]["CheckListName"].ToString();
            ind.Comm = dt.Rows[i]["Comment"].ToString();
            ind.CommId = dt.Rows[i]["CommentId"].ToString();
            ind.ActionReq = dt.Rows[i]["ActionRequred"].ToString();
            ind.ActionReqId = dt.Rows[i]["ActionRequredId"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.StatusId = dt.Rows[i]["StatusId"].ToString();


            Checklist.Add(ind);
        }


        return Checklist;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static RequestedToInspection getPrjInspectionDetails(int selId)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(0);


        pa.Add("@Id");
        pv.Add(selId);



        DBH.CreateDatasetFRD(ds, "sp_FRDInspectionDetails", true, pa, pv);



        dt = ds.Tables[0];

        RequestedToInspection ind = new RequestedToInspection();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.Mid = dt.Rows[i]["Id"].ToString();
            ind.SLNo = dt.Rows[i]["SLNo"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.CustomerNumber = dt.Rows[i]["CustomerNumber"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Consultant = dt.Rows[i]["Consultant"].ToString();
            ind.MainContractor = dt.Rows[i]["MainContractor"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.DeliveryDate = dt.Rows[i]["DeliveryDate"].ToString();


        }


        return ind;


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string AddInspectionBasicDetails(string ProjectNumber, string ProjectName, string Location, string CustomerName,
        string MainContractor, string MEPContractor, string OrderNumber, string DrawingNumber, string InspectionDate,
        string InstallationCompletion, string FRDModelNumber, string InspectionNumber,string InspectionLocation,string Status, string UpdatedBy)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@ProjectNumber");
        pv.Add(ProjectNumber);

        pa.Add("@ProjectName");
        pv.Add(ProjectName);


        pa.Add("@Location");
        pv.Add(Location);

        pa.Add("@CustomerName");
        pv.Add(CustomerName);

        pa.Add("@MainContractor");
        pv.Add(MainContractor);

        pa.Add("@MEPContractor");
        pv.Add(MEPContractor);

        pa.Add("@OrderNumber");
        pv.Add(OrderNumber);

        pa.Add("@DrawingNumber");
        pv.Add(DrawingNumber);

        pa.Add("@InspectionDate");
        pv.Add(InspectionDate);


        pa.Add("@InstallationCompletion");
        pv.Add(InstallationCompletion);

        pa.Add("@FRDModelNumber");
        pv.Add(FRDModelNumber);

        pa.Add("@InspectionNumber");
        pv.Add(InspectionNumber);

        pa.Add("@InspectionLocation");
        pv.Add(InspectionLocation);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@UpdatedBy");
        pv.Add(UpdatedBy);


        DBH.CreateDatasetFRD(ds, "sp_FRDInspectionDetails", true, pa, pv);

        return ds.Tables[0].Rows[0]["InsertedID"].ToString();

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectInspection> GetAllInspectionsOfProject(string ProjNo)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@ProjectNumber");
        pv.Add(ProjNo);

        DBH.CreateDatasetFRD(ds, "sp_FRDInspectionDetails", true, pa, pv);

        List<ProjectInspection> Checklist = new List<ProjectInspection>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            
            ProjectInspection ind = new ProjectInspection();
            //ind.Mid = dt.Rows[i]["Id"].ToString();
            ind.InspectId = dt.Rows[i]["Id"].ToString();
            ind.ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.InspectionNumber = dt.Rows[i]["InspectionNumber"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.MainContractor = dt.Rows[i]["MainContractor"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.OrderNumber = dt.Rows[i]["OrderNumber"].ToString();
            ind.DrawingNumber = dt.Rows[i]["DrawingNumber"].ToString();
            ind.InstallationCompletion = dt.Rows[i]["InstallationCompletion"].ToString();
            ind.Observation = dt.Rows[i]["Observation"].ToString();
            ind.InspectionDate = dt.Rows[i]["InspectionDate"].ToString();
            ind.UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString();


            Checklist.Add(ind);
        }


        return Checklist;

    }





    //classes

    public class RequestedToInspection
    {
        public string Mid { get; set; }
        public string SLNo { get; set; }
        public string CreatedDate { get; set; }
        public string CustomerNumber { get; set; }
        public string CustomerName { get; set; }
        public string ProjectName { get; set; }
        public string Location { get; set; }
        public string Consultant { get; set; }
        public string MainContractor { get; set; }
        public string MEPContractor { get; set; }
        public string DeliveryDate { get; set; }
    }

    public class CheckLisDetails
    {
        public string Id { get; set; }
        public string CheckList { get; set; }
    }

    public class CheckLisDetailsResponse
    {
        public string Id { get; set; }
        public string CheckList { get; set; }
        public string StatusId { get; set; }
        public string Status { get; set; }
        public string CommId { get; set; }
        public string Comm { get; set; }
        public string ActionReqId { get; set; }
        public string ActionReq { get; set; }
        
    }

    public class ChecklistDynamicControls
    {
        public string InspecId { get; set; }
        public string ProjNumber { get; set; }
        public string InspectNumber { get; set; }
        public string InspectorSign { get; set; }
        public string CustomerSign { get; set; }

        public List<KeyValuePair> Radio { get; set; }
        public List<KeyValuePair> Textbox { get; set; }
        public List<KeyValuePair> checklistNames { get; set; }

    }

    public class ProjectInspection {
        public string InspectId { get; set; }
        public string ProjectNumber { get; set; }

        public string ProjectName { get; set; }
        public string Location { get; set; }
        public string CustomerName { get; set; }
        public string InspectionNumber { get; set; }
        public string MainContractor { get; set; }
        public string MEPContractor { get; set; }
        public string OrderNumber { get; set; }
        public string DrawingNumber { get; set; }
        public string InstallationCompletion { get; set; }
        public string Observation { get; set; }
        public string InspectionDate { get; set; }
        public string UpdatedDate { get; set; }
    }

    public class KeyValuePair
    {
        public string Id { get; set; }
        public string Value { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddInspectionDet(string Observation, string InspName, string ClientName, string InspDes,
       string ClientDes, string InspMob, string ClientMob, string ProjNumber, string InspId)
       
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@observation");
        pv.Add(Observation);

        pa.Add("@inspName");
        pv.Add(InspName);


        pa.Add("@clientname");
        pv.Add(ClientName);

        pa.Add("@inspDes");
        pv.Add(InspDes);

        pa.Add("@clientDes");
        pv.Add(ClientDes);

        pa.Add("@inspMob");
        pv.Add(InspMob);

        pa.Add("@clientMob");
        pv.Add(ClientMob);

        pa.Add("@ProjectNumber");
        pv.Add(ProjNumber);

        pa.Add("@Id");
        pv.Add(InspId);

        DBH.CreateDatasetFRD(ds, "sp_FRDInspectionDetails", true, pa, pv);          

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void ConvertBase64ToImg(string imgStr, string EmpNo, string ProjNo, string InspectReqId, string SignFrom)
    {
        // Convert base 64 string to byte[]
        byte[] imageBytes = Convert.FromBase64String(imgStr.Split(',')[1]);
       
        // Convert byte[] to Image
        //Image image = new Image();
        //string imageName = "";
        //using (var ms = new MemoryStream(imageBytes, 0, imageBytes.Length))
        //{
        //    Image image = Image.FromStream(ms, true);
            //return image;

            //String path = HttpContext.Current.Server.MapPath("\\\\zylab\\Econnect\\KPI\\"); //Path
            //String path = "\\\\zylab\\Econnect\\Fire_Duct\\Signature"; //Path

            //Check if directory exist
            //if (!System.IO.Directory.Exists(path))
            //{
            //    System.IO.Directory.CreateDirectory(path); //Create directory if it doesn't exist
            //}

            //imageName = SignFrom + "_" + EmpNo + "_" + ProjNo + "_" + InspectReqId + "_" + "sign" + ".png";

            ////set the image path
            //string imgPath = Path.Combine(path, imageName);

           // image.Save(imgPath, System.Drawing.Imaging.ImageFormat.Jpeg);




            DBHandler DBH = new DBHandler();

            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add(5);

            pa.Add("@ProjectNumber");
            pv.Add(ProjNo);

            pa.Add("@Id");
            pv.Add(InspectReqId);

            pa.Add("@SignFor");
            pv.Add(SignFrom);

            pa.Add("@SignatureUrl");
            pv.Add(imageBytes);

            DBH.CreateDatasetFRD(ds, "sp_FRDInspectionDetails", true, pa, pv);
        

    }



}