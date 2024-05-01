using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

public partial class FacilityManagement_WorkFlowDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 10;
       
    }


    //PAYMENT
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WorkOrder> GetAllWorkOrders(string PropName, string PropType)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@PropName");
        pv.Add(PropName);

        pa.Add("@PropType");
        pv.Add(PropType);


        DBH.CreateDatasetCRMEBSDATA(ds, "SP_FMWorkOrder", true, pa, pv);

        List<WorkOrder> oWOList = new List<WorkOrder>();


        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oWOList.Add(new WorkOrder()
            {
                B_WO_ID = ds.Tables[0].Rows[i]["B_WO_ID"].ToString(),
                WOName = ds.Tables[0].Rows[i]["WOName"].ToString(),
                WOCrDate = ds.Tables[0].Rows[i]["WOCrDate"].ToString(),
                WODueDate = ds.Tables[0].Rows[i]["WODueDate"].ToString(),
                BWOId = ds.Tables[0].Rows[i]["BRWOId"].ToString(),

                PropName = ds.Tables[0].Rows[i]["PropName"].ToString(),
                PropType = ds.Tables[0].Rows[i]["PropType"].ToString(),
                PropBlock = ds.Tables[0].Rows[i]["BlockDesc"].ToString(),
                PropFloor = ds.Tables[0].Rows[i]["FloorDesc"].ToString(),
                PropRoom = ds.Tables[0].Rows[i]["RoomDesc"].ToString()

            });
        }

        return oWOList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WORoorCause> GetWORootCause(int WO_BRKDWN_ID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@WOBrkDwnId");
        pv.Add(WO_BRKDWN_ID);


        DBH.CreateDatasetCRMEBSDATA(ds, "SP_FMWorkOrder", true, pa, pv);

        List<WORoorCause> oWOList = new List<WORoorCause>();


        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oWOList.Add(new WORoorCause()
            {

                RootCauseId = ds.Tables[0].Rows[i]["RootCauseId"].ToString(),
                RCName = ds.Tables[0].Rows[i]["RCDesc"].ToString(),
                FileName = ds.Tables[0].Rows[i]["FileName"].ToString(),
                Cost = ds.Tables[0].Rows[i]["COST"].ToString(),
                Date = ds.Tables[0].Rows[i]["CrDate"].ToString(),
                FilePath = ds.Tables[0].Rows[i]["FilePath"].ToString(),

            });
        }

        return oWOList;
        //string a = userId;
    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateCost(int RootCauseId, string CostAmount)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@RootCauseId");
        pv.Add(RootCauseId);

        pa.Add("@COST1");
        pv.Add(CostAmount);


        DBH.CreateDatasetCRMEBSDATA(ds, "SP_FMWorkOrder", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteAttach(int RootCauseId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@RootCauseId");
        pv.Add(RootCauseId);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_FMWorkOrder", true, pa, pv);


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string RenewContract()
    {

        // Checking no of files injected in Request object  
        if (Request.Files.Count > 0)
        {

            HttpFileCollection Files = HttpContext.Current.Request.Files;
            string path = HttpContext.Current.Server.MapPath("~/App_Data/");

            for (int i = 0; i < Files.Count; i++)
            {
                HttpPostedFile File = Files[i];


                string fileName = File.FileName + Guid.NewGuid().ToString();
                string extension = Path.GetExtension(File.FileName);


                File.SaveAs(Path.Combine(path, String.Concat(fileName, extension)));

            }

            return "";
        }
        else
        {
            return "No files selected.";
        }




        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMTenantContract", true, pa, pv);

    }


//classes

    public class WorkOrder
    {
        public string B_WO_ID { get; set; }
        public string WOName { get; set; }
        public string WOCrDate { get; set; }
        public string WODueDate { get; set; }
        public string BWOId { get; set; }

        public string PropId { get; set; }
        public string PropName { get; set; }
        public string PropType { get; set; }
        public string PropBlock { get; set; }
        public string PropFloor { get; set; }
        public string PropRoom { get; set; }

    }

    public class WORoorCause
    {
        public string RootCauseId { get; set; }
        public string RCName { get; set; }
        public string FileName { get; set; }
        public string Cost { get; set; }
        public string Date { get; set; }
        public string FilePath { get; set; }
    }
    public class ContractPaymentSchedule
    {
        public string PayContractId { get; set; }
        public string ContractId { get; set; }
        public string PaymentDate { get; set; }
        public string ChequeNo { get; set; }
        public string ChequeAmount { get; set; }
        public string PaymentStatus { get; set; }
    }


    public class ResponseMsg
    {
        public string msg { get; set; }
        public string msgType { get; set; }
    }


    //protected void btnUpload_Click(object sender, EventArgs e)
    //{
        
    //        string stxtCost = txtCost.Text;
    //        string stxtRCause = txtRootCause.Text;
    //        string sDate = hfDate.Value;
    //        string sWOBId = hfSelecWOBId.Value;

    //    if (!String.IsNullOrWhiteSpace(stxtCost) && !String.IsNullOrWhiteSpace(stxtRCause) && !String.IsNullOrWhiteSpace(sWOBId))
    //    {
    //        string filename = Path.GetFileName(FUUploadNewAttach.PostedFile.FileName);
    //        string contentType = FUUploadNewAttach.PostedFile.ContentType;
    //        string FileName = FUUploadNewAttach.PostedFile.FileName;

    //        string fileExt = System.IO.Path.GetExtension(FUUploadNewAttach.FileName).ToLower();
    //        if (fileExt == ".pdf" || fileExt == ".jpg" || fileExt == ".png")
    //        {
    //            string pathAndFile = "\\\\zylab\\FacilityManagement\\";
    //            pathAndFile += sWOBId + "_" + FUUploadNewAttach.FileName.ToLower();
    //            ViewState["FileName"] = pathAndFile;
               


    //            FUUploadNewAttach.SaveAs(pathAndFile);


    //            DBHandler DBH = new DBHandler();
    //            DataSet ds = new DataSet();
    //            DataTable dt = new DataTable();
    //            ArrayList pa = new ArrayList();
    //            ArrayList pv = new ArrayList();

    //            pa.Add("@oper");
    //            pv.Add("4");

    //            pa.Add("@RootCause");
    //            pv.Add(stxtRCause);

    //            pa.Add("@FileName");
    //            pv.Add(filename);

    //            pa.Add("@FilePath");
    //            pv.Add(pathAndFile);

    //            pa.Add("@WOBrkDwnId");
    //            pv.Add(Convert.ToInt32(sWOBId));

    //            pa.Add("@COST");
    //            pv.Add(Convert.ToInt64(stxtCost));

    //            DBH.CreateDatasetCRMEBSDATA(ds, "SP_FMWorkOrder", true, pa, pv);
    //        }
    //    }
    //    txtCost.Text = "";
    //    txtRootCause.Text = "";
    //    hfDate.Value = "";
    //    hfSelecWOBId.Value = "";

    //}
       
    


}