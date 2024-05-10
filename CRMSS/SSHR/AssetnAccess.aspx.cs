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

public partial class SSHR_AssetnAccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GetDataforTable(string UserID, string RequestType, string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@TypeId");
        pv.Add(RequestType);


        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

        List<tableData> AdminAction = new List<tableData>();
        dt = ds.Tables[0];


        if (Status == "1")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {
                    ID = dt.Rows[i]["ID"].ToString(),
                    TypeId = dt.Rows[i]["TypeId"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                    TypeName = dt.Rows[i]["TypeName"].ToString(),
                    RefNo = dt.Rows[i]["RefNo"].ToString(),

                    Description = dt.Rows[i]["Description"].ToString(),

                    AssBy = dt.Rows[i]["AssBy"].ToString(),

                    AssignedOn = dt.Rows[i]["AssignedOn"].ToString(),
                    AssignedTo = dt.Rows[i]["AssignedTo"].ToString(),

                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),

                });
            }
        }


        if (Status == "0")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {
                    ID = dt.Rows[i]["ID"].ToString(),
                    TypeId = dt.Rows[i]["TypeId"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                    TypeName = dt.Rows[i]["TypeName"].ToString(),
                    RefNo = dt.Rows[i]["RefNo"].ToString(),

                    Description = dt.Rows[i]["Description"].ToString(),

                    AssBy = dt.Rows[i]["AssBy"].ToString(),

                    AssignedOn = dt.Rows[i]["AssignedOn"].ToString(),
                    AssignedTo = dt.Rows[i]["AssignedTo"].ToString(),

                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    TransTo = dt.Rows[i]["TransTo"].ToString(),

                });
            }
        }


        return AdminAction;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GetDataforTableForClearance(string UserID, string RequestType, string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(16);

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@TypeId");
        pv.Add(RequestType);


        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

        List<tableData> AdminAction = new List<tableData>();
        dt = ds.Tables[0];


        if (Status == "1")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {
                    ID = dt.Rows[i]["ID"].ToString(),
                    TypeId = dt.Rows[i]["TypeId"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                    TypeName = dt.Rows[i]["TypeName"].ToString(),
                    RefNo = dt.Rows[i]["RefNo"].ToString(),

                    Description = dt.Rows[i]["Description"].ToString(),

                    AssBy = dt.Rows[i]["AssBy"].ToString(),

                    AssignedOn = dt.Rows[i]["AssignedOn"].ToString(),
                    AssignedTo = dt.Rows[i]["AssignedTo"].ToString(),

                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),

                });
            }
        }


        if (Status == "0")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {
                    ID = dt.Rows[i]["ID"].ToString(),
                    TypeId = dt.Rows[i]["TypeId"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                    TypeName = dt.Rows[i]["TypeName"].ToString(),
                    RefNo = dt.Rows[i]["RefNo"].ToString(),

                    Description = dt.Rows[i]["Description"].ToString(),

                    AssBy = dt.Rows[i]["AssBy"].ToString(),

                    AssignedOn = dt.Rows[i]["AssignedOn"].ToString(),
                    AssignedTo = dt.Rows[i]["AssignedTo"].ToString(),

                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    TransTo = dt.Rows[i]["TransTo"].ToString(),

                });
            }
        }


        return AdminAction;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetRefNo(string TypeId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(12);

        pa.Add("@TypeId");
        pv.Add(TypeId);


        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpDet> GetEmployeeDet(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);


        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

        List<EmpDet> oLeaveType = new List<EmpDet>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oLeaveType.Add(new EmpDet()
                {
                    EmpName = dt.Rows[i]["EmpName"].ToString(),
                    Email_Id = dt.Rows[i]["Email_Id"].ToString()
                });
            }
        }

        return oLeaveType;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string setAccessAndAssets(string UserId,string TypeId,string Type,string RefNo,string Name,string EmpNo,string EmpName,string Remarks,string Description,string AssetID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(19);

        pa.Add("@TypeId");
        pv.Add(TypeId);

        pa.Add("@TypeName");
        pv.Add(Type);

        pa.Add("@RefNo");
        pv.Add(RefNo);

        pa.Add("@Name");
        pv.Add(Name);

        pa.Add("@AssignedTo");
        pv.Add(EmpName);

        pa.Add("@Description");
        pv.Add(Description);

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@userId");
        pv.Add(UserId);

        if (TypeId == "0")
        {
            pa.Add("@AssetID");
            pv.Add(AssetID);
        }



        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void TransferAccessAndAssets(string UserId, string ReqID, string RefNo, string TransferToEmpNo, string TransferToName)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@ID");
        pv.Add(ReqID);

        pa.Add("@TransferredTo");
        pv.Add(TransferToEmpNo);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@RefNo");
        pv.Add(RefNo);

        pa.Add("@EmpName");
        pv.Add(TransferToName);



        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeActivate(string UserId, string ReqID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@ID");
        pv.Add(ReqID);

       
        pa.Add("@userId");
        pv.Add(UserId);

       
        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AssetDet> GetAllAssetName(string UserId)
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

        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

        List<AssetDet> oLeaveType = new List<AssetDet>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oLeaveType.Add(new AssetDet()
                {
                    AssetID = dt.Rows[i]["AssetID"].ToString(),
                    SlNo = dt.Rows[i]["SlNo"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                    Description = dt.Rows[i]["Description"].ToString(),
                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    MoreInformation = dt.Rows[i]["MoreInformation"].ToString(),
                    Department = dt.Rows[i]["Department"].ToString(),
                });
            }
        }

        return oLeaveType;
        //string a = userId;
    }
    public class tableData
    {
        public string ID { get; set; }
        public string TypeId { get; set; }
        public string TypeName { get; set; }
        public string RefNo { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string AssBy { get; set; }
        public string AssignedOn { get; set; }

        public string AssignedTo { get; set; }
        public string Remarks { get; set; }
        public string TransTo { get; set; }
        public string Status { get; set; }
        public string EmpNo { get; set; }
    }

    public class EmpDet
    {
        public string EmpName { get; set; }
        public string Email_Id { get; set; }
       
    }
    public class AssetDet
    {
        public string AssetID { get; set; }
        public string SlNo { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Remarks { get; set; }
        public string MoreInformation { get; set; }
        public string Department { get; set; }


    }
}