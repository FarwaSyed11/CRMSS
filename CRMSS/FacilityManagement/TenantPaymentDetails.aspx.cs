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

public partial class FacilityManagement_TenantPaymentDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 10;
    }




    //PAYMENT
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ContractPaymentDetails> GetTenantPaymentDetailsList(string PaymentStatus, string PropName, string PropType)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@PropName");
        pv.Add(PropName);

        pa.Add("@PropType");
        pv.Add(PropType);

        pa.Add("@PaymentStatus");
        pv.Add(PaymentStatus);

        foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
        {
            Console.WriteLine(j);
        }

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMTenantPaymentDetails", true, pa, pv);




        List<ContractPaymentDetails> oTPDList = new List<ContractPaymentDetails>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            List<string> eStatuses = new List<string>();
            foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
            {
                eStatuses.Add(j.Trim());
            }


            oTPDList.Add(new ContractPaymentDetails()
            {
                PayContractId = dt.Rows[i]["PayContractId"].ToString(),
                ContractNo = dt.Rows[i]["ContractNo"].ToString(),
                ContractDesc = dt.Rows[i]["ContractDesc"].ToString(),
                PropName = dt.Rows[i]["PropName"].ToString(),
                PropType = dt.Rows[i]["PropType"].ToString(),
                BlockDesc = dt.Rows[i]["BlockDesc"].ToString(),
                FloorDesc = dt.Rows[i]["FloorDesc"].ToString(),
                RoomDesc = dt.Rows[i]["RoomDesc"].ToString(),
                PayDate = dt.Rows[i]["PayDate"].ToString(),
                ContractFromDate = dt.Rows[i]["ContractFromDate"].ToString(),
                ContractToDate = dt.Rows[i]["ContractToDate"].ToString(),
                PayStatus = dt.Rows[i]["PayStatus"].ToString(),
                PaymentStatusesEnum = eStatuses,
                ChequeNo = dt.Rows[i]["ChequeNo"].ToString(),
                ModeOfPayment = dt.Rows[i]["ModeOfPayment"].ToString(),


            });
        }
        return oTPDList;
        //string a = userId;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdatePaymentStatus(int PayContractId, string PayStatus)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@paycontractid");
        pv.Add(PayContractId);

        pa.Add("@paystatus");
        pv.Add(PayStatus);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMTenantPaymentDetails", true, pa, pv);


    }



    //classes

    public class ContractPaymentDetails
    {
        public string PayContractId { get; set; }
        public string ContractNo { get; set; }
        public string ContractDesc { get; set; }
        public string PayStatus { get; set; }
        public string PropName { get; set; }
        public string PropType { get; set; }
        public string BlockDesc { get; set; }
        public string FloorDesc { get; set; }
        public string RoomDesc { get; set; }
        public string ContractFromDate { get; set; }
        public string ContractToDate { get; set; }
        public string PayDate { get; set; }
        public string ChequeNo { get; set; }
        public string ModeOfPayment { get; set; }
        public List<string> PaymentStatusesEnum { get; set; }

    }
    public class ResponseMsg
    {
        public string msg { get; set; }
        public string msgType { get; set; }
    }
}