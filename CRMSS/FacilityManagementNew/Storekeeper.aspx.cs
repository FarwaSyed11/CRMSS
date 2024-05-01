using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Documents;
using ZXing;


public partial class FacilityManagementNew_Storekeeper : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<MaterialRequest> GetAllWOMaterialRequest()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(24);

       


        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<MaterialRequest> listProjDet = new List<MaterialRequest>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            MaterialRequest ind = new MaterialRequest();
            ind.MRequestID = dt.Rows[i]["MRequestID"].ToString();
            ind.WorkOrderID = dt.Rows[i]["WorkOrderID"].ToString();
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            ind.ItemCategory = dt.Rows[i]["ItemCategory"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemName = dt.Rows[i]["ItemName"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Requestdetailsview ItemRequestDetails(string MRequestID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(25);

        pa.Add("@MRequestID");
        pv.Add((MRequestID));



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        dt = ds.Tables[0];

        Requestdetailsview ind = new Requestdetailsview();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.MRequestID = dt.Rows[i]["MRequestID"].ToString();
            ind.WorkOrderID = dt.Rows[i]["WorkOrderID"].ToString();
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();


            ind.FloorName = dt.Rows[i]["FloorName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();
            ind.UnitName = dt.Rows[i]["UnitName"].ToString();
            ind.AssignedBy = dt.Rows[i]["AssignedBy"].ToString();


            ind.ItemCategory = dt.Rows[i]["ItemCategory"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemName = dt.Rows[i]["ItemName"].ToString();
            ind.ItemQty = dt.Rows[i]["ItemQty"].ToString();


            ind.CurrentStock = dt.Rows[i]["CurrentStock"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.ItemLocation = dt.Rows[i]["ItemLocation"].ToString();



        }


        return ind;


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdatItemDeliveredStatus(string MRequestID, string Status, string CurrentStock,string ReqestedQty,string ItemCode)
    {
        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(26);

        pa.Add("@MRequestID");
        pv.Add(MRequestID);

        pa.Add("@Status");
        pv.Add(Status);


        pa.Add("@CurrentStock");
        pv.Add(CurrentStock);


        pa.Add("@ReqestedQty");
        pv.Add(ReqestedQty);

        pa.Add("@ItemCode");
        pv.Add(ItemCode);



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        return;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<MaterialRequest> CompletedWOMaterialRequest()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(27);




        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<MaterialRequest> listProjDet = new List<MaterialRequest>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            MaterialRequest ind = new MaterialRequest();
            ind.MRequestID = dt.Rows[i]["MRequestID"].ToString();
            ind.WorkOrderID = dt.Rows[i]["WorkOrderID"].ToString();
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            ind.ItemCategory = dt.Rows[i]["ItemCategory"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemName = dt.Rows[i]["ItemName"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void Updatelocation(string WorkOrderID, string MRequestID, string ItemlocationUpdatedBy,string Location,string Status)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(28);


        pa.Add("@WorkOrderID");
        pv.Add(WorkOrderID);

        pa.Add("@MRequestID");
        pv.Add(MRequestID);

        pa.Add("@ItemlocationUpdatedBy");
        pv.Add(ItemlocationUpdatedBy);

        pa.Add("@Location");
        pv.Add(Location);

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateItemApprovel(string WorkOrderID, string MRequestID, string ApprovedBy, string Status)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(28);


        pa.Add("@WorkOrderID");
        pv.Add(WorkOrderID);

        pa.Add("@MRequestID");
        pv.Add(MRequestID);

        pa.Add("@ApprovedBy");
        pv.Add(ApprovedBy);

        pa.Add("@Status");
        pv.Add(Status);



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

    }


}

public class Requestdetailsview
{
    public string RequestID { get; set; }
    
    public string PropertyName { get; set; }
    public string BlockName { get; set; }
    public string FloorName { get; set; }

    public string UnitName { get; set; }
    

    public string MRequestID { get; set; }
    public string WorkOrderID { get; set; }

    public string AssignedBy { get; set; }
    public string ItemCategory { get; set; }
    public string ItemCode { get; set; }

    public string ItemName { get; set; }

    public string ItemQty { get; set; }

    public string CurrentStock { get; set; }

    public string Status { get; set; }

    public string CreatedDate { get; set; }

    public string ItemLocation { get; set; }


}

public class MaterialRequest
{
    public string MRequestID { get; set; }
    public string WorkOrderID { get; set; }
    public string RequestID { get; set; }
    public string PropertyName { get; set; }

    public string ItemCategory { get; set; }
    public string ItemCode { get; set; }
    public string ItemName { get; set; }
    public string Status { get; set; }

}