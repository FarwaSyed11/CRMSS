using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

public partial class FacilityManagement_TenantContracts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 10;
    }


    //PAYMENT
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ContractList GetAllContracts(string ContractStatus, string PropName, string PropType)
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

        pa.Add("@ContractStatus");
        pv.Add(ContractStatus);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMTenantContract", true, pa, pv);

        List<FMContract> oFMConList = new List<FMContract>();
        List<ContractPaymentSchedule> oCSPList = new List<ContractPaymentSchedule>();

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oFMConList.Add(new FMContract()
            {
                ContractId = ds.Tables[0].Rows[i]["CONTRACT_ID"].ToString(),
                ContractNo = ds.Tables[0].Rows[i]["CONTRACT_NO"].ToString(),
                ContractDesc = ds.Tables[0].Rows[i]["CONTRACT_DESCRIPTION"].ToString(),
                ContractFrDate = ds.Tables[0].Rows[i]["CONTRACT_FROM_DATE"].ToString(),
                ContractToDate = ds.Tables[0].Rows[i]["CONTRACT_TO_DATE"].ToString(),
                ContractValue = ds.Tables[0].Rows[i]["CONTRACT_VALUE"].ToString(),
                SecurityDeposit = ds.Tables[0].Rows[i]["SECURITY_DEPOSIT_AMOUNT"].ToString(),
                ContractStatus = ds.Tables[0].Rows[i]["CONTRACT_STATUS"].ToString(),
                PropId = ds.Tables[0].Rows[i]["CAMP_ID"].ToString(),
                PropName = ds.Tables[0].Rows[i]["CAMP_DESCRIPTION"].ToString(),
                PropType = ds.Tables[0].Rows[i]["PROPERTY_TYPE"].ToString(),
                PropBlock = ds.Tables[0].Rows[i]["BLOCK_DESCRIPTION"].ToString(),
                PropFloor = ds.Tables[0].Rows[i]["FLOOR_DESCRIPTION"].ToString(),
                PropRoom = ds.Tables[0].Rows[i]["ROOM_DESCRIPTION"].ToString()               

            });
        }


        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
        {
            oCSPList.Add(new ContractPaymentSchedule()
            {
                PayContractId = ds.Tables[1].Rows[i]["PAYMENT_CONTRACT_ID"].ToString(),
                ContractId = ds.Tables[1].Rows[i]["CONTRACT_ID"].ToString(),
                PaymentDate = ds.Tables[1].Rows[i]["PAYMENT_DATE"].ToString(),
                ChequeNo = ds.Tables[1].Rows[i]["CHEQUE_NO"].ToString(),
                ChequeAmount = ds.Tables[1].Rows[i]["CHEQUE_AMOUNT"].ToString(),
                PaymentStatus = ds.Tables[1].Rows[i]["PAYMENT_STATUS"].ToString(),
                ModeOfPayment = ds.Tables[1].Rows[i]["ModeOfPayment"].ToString()

            });
        }

        return new ContractList() {
            ContractPayScheduleList = oCSPList,
            ContractsList = oFMConList
        };
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


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMProperty", true, pa, pv);


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void RenewContract(int ContractId, string RenewAmount, string FromDate, string ToDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@paycontractid");
        pv.Add(ContractId);

        pa.Add("@RenewAmount");
        pv.Add(RenewAmount);        
        
        pa.Add("@RenewFrDate");
        pv.Add(FromDate);

        pa.Add("@RenewToDate");
        pv.Add(ToDate);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMTenantContract", true, pa, pv);
        
    }




    //classes





    public class FMContract
    {
        public string ContractId { get; set; }
        public string ContractNo { get; set; }
        public string ContractDesc { get; set; }
        public string ContractFrDate { get; set; }
        public string ContractToDate { get; set; }
        public string ContractValue { get; set; }
        public string SecurityDeposit { get; set; }
        public string ContractStatus { get; set; }        

        public string PropId { get; set; }
        public string PropName { get; set; }
        public string PropType { get; set; }
        public string PropBlock { get; set; }
        public string PropFloor { get; set; }
        public string PropRoom { get; set; }

    }

    public class ContractPaymentSchedule
    {
        public string PayContractId { get; set; }
        public string ContractId { get; set; }
        public string PaymentDate { get; set; }
        public string ChequeNo { get; set; }
        public string ChequeAmount { get; set; }
        public string PaymentStatus { get; set; }
        public string ModeOfPayment { get; set; }
    }

    public class ContractList
    {
        public List<FMContract> ContractsList { get; set; }
        public List<ContractPaymentSchedule> ContractPayScheduleList { get; set; }
    }


    public class ResponseMsg
    {
        public string msg { get; set; }
        public string msgType { get; set; }
    }

}