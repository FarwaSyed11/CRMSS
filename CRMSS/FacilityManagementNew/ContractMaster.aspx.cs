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


public partial class FacilityManagementNew_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UnitDetails> GetAllContractDetails()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(0);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<UnitDetails> listProjDet = new List<UnitDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UnitDetails ind = new UnitDetails();
            ind.ContractNo = dt.Rows[i]["ContractNo"].ToString();
            ind.PropertyID = dt.Rows[i]["PropertyID"].ToString();
            ind.BlockID = dt.Rows[i]["BlockID"].ToString();
            ind.RoomID = dt.Rows[i]["RoomID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();
            ind.RoomName = dt.Rows[i]["RoomName"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.NoOfMonths = dt.Rows[i]["NoOfMonths"].ToString();

            ind.StartDate = dt.Rows[i]["StartDate"].ToString();
            ind.EndDate = dt.Rows[i]["EndDate"].ToString();
            //ind.MoveInStage1Approvel = dt.Rows[i]["MoveInStage1Approvel"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UnitDetails> GetMycontractRequest( string UserID )
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(69);

        pa.Add("@UserID");
        pv.Add(UserID);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<UnitDetails> listProjDet = new List<UnitDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UnitDetails ind = new UnitDetails();
            ind.ContractNo = dt.Rows[i]["ContractNo"].ToString();
            ind.PropertyID = dt.Rows[i]["PropertyID"].ToString();
            ind.BlockID = dt.Rows[i]["BlockID"].ToString();
            ind.RoomID = dt.Rows[i]["RoomID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();
            ind.RoomName = dt.Rows[i]["RoomName"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.NoOfMonths = dt.Rows[i]["NoOfMonths"].ToString();

            ind.StartDate = dt.Rows[i]["StartDate"].ToString();
            ind.EndDate = dt.Rows[i]["EndDate"].ToString();
            //ind.MoveInStage1Approvel = dt.Rows[i]["MoveInStage1Approvel"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UnitDetails> GetMoveInfinalApprovelContracts()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(27);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<UnitDetails> listProjDet = new List<UnitDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UnitDetails ind = new UnitDetails();
            ind.PropertyID = dt.Rows[i]["PropertyID"].ToString();
            ind.BlockID = dt.Rows[i]["BlockID"].ToString();
            ind.RoomID = dt.Rows[i]["RoomID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();
            ind.RoomName = dt.Rows[i]["RoomName"].ToString();

            ind.ContractValue = dt.Rows[i]["ContractValue"].ToString();
            ind.PropertyUsage = dt.Rows[i]["PropertyUsage"].ToString();
            ind.SecurityDeposit = dt.Rows[i]["SecurityDeposit"].ToString();
            ind.ModeOfPayment = dt.Rows[i]["ModeOfPayment"].ToString();
            ind.StartDate = dt.Rows[i]["StartDate"].ToString();
            ind.EndDate = dt.Rows[i]["EndDate"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UnitDetails> GetInactiveContracts()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(14);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<UnitDetails> listProjDet = new List<UnitDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UnitDetails ind = new UnitDetails();
            ind.PropertyID = dt.Rows[i]["PropertyID"].ToString();
            ind.BlockID = dt.Rows[i]["BlockID"].ToString();
            ind.RoomID = dt.Rows[i]["RoomID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();
            ind.RoomName = dt.Rows[i]["RoomName"].ToString();

            ind.ContractValue = dt.Rows[i]["ContractValue"].ToString();
            ind.PropertyUsage = dt.Rows[i]["PropertyUsage"].ToString();
            ind.SecurityDeposit = dt.Rows[i]["SecurityDeposit"].ToString();
            ind.ModeOfPayment = dt.Rows[i]["ModeOfPayment"].ToString();
            ind.StartDate = dt.Rows[i]["StartDate"].ToString();
            ind.EndDate = dt.Rows[i]["EndDate"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetPropertyDDL()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("1");



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["PropertyID"].ToString(),
                ddlText = dt.Rows[i]["Name"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetBlock(string PropertyID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("2");

        pa.Add("@PropertyID");
        pv.Add(Convert.ToInt64(PropertyID));



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["BlockID"].ToString(),
                ddlText = dt.Rows[i]["BlockName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetFloor(string PropertyID,string BlockID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("15");

        pa.Add("@PropertyID");
        pv.Add(Convert.ToInt64(PropertyID));

        pa.Add("@BlockID");
        pv.Add(Convert.ToInt64(BlockID));

        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["FloorID"].ToString(),
                ddlText = dt.Rows[i]["FloorName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetUnit(string PropertyID, string BlockID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("3");

        pa.Add("@PropertyID");
        pv.Add(Convert.ToInt64(PropertyID));

        pa.Add("@BlockId");
        pv.Add(Convert.ToInt64(BlockID));



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["RoomID"].ToString(),
                ddlText = dt.Rows[i]["RoomName"].ToString()
            });
        }

         
            return drpval;
        

        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static PropertydetailsMdl GetProperyDetailsModal(string PropertyID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(4);


        pa.Add("@PropertyID");
        pv.Add(Convert.ToInt64(PropertyID));



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);



        dt = ds.Tables[0];

        PropertydetailsMdl ind = new PropertydetailsMdl();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.Ownership = dt.Rows[i]["Ownership"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.LandlordsName = dt.Rows[i]["LandlordsName"].ToString();
            ind.LandlordsEmail = dt.Rows[i]["LandlordsEmail"].ToString();
            ind.LandlordsPhone = dt.Rows[i]["LandlordsPhone"].ToString();
            ind.Type = dt.Rows[i]["Type"].ToString();
            ind.NoOfRoom = dt.Rows[i]["NoOfRoom"].ToString();
            ind.PropertyUsage = dt.Rows[i]["PropertyUsage"].ToString();
            ind.PremiseNo = dt.Rows[i]["PremiseNo"].ToString();


        }


        return ind;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreateContractDetails(string ContractNo, string PropertyID, string BlockID, string FloorID, string UnitID, string ContractValue, string SecurityDeposit,
        string StartDate, string EndDate, int NoOfMonths, string Description, string Status, string CreatedBy)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(5);

        pa.Add("@ContractNo");
        pv.Add(ContractNo);
         
        pa.Add("@PropertyID");
        pv.Add(Convert.ToInt64(PropertyID));

        pa.Add("@BlockID");
        pv.Add(Convert.ToInt64(BlockID));

        pa.Add("@FloorID");
        pv.Add(Convert.ToInt64(FloorID));

        pa.Add("@UnitID");
        pv.Add(Convert.ToInt64(UnitID));

       

        pa.Add("@ContractValue");
        pv.Add(ContractValue);

        pa.Add("@SecurityDeposit");
        pv.Add(SecurityDeposit);

        //pa.Add("@ModeOfPayment");
        //pv.Add(ModeOfPayment);

        //pa.Add("@NoOfPayments");
        //pv.Add(NoOfPayments);

        pa.Add("@StartDate");
        pv.Add(StartDate);

        pa.Add("@EndDate");
        pv.Add(EndDate);

        pa.Add("@NoOfMonths");
        pv.Add(NoOfMonths);

        pa.Add("@Description");
        pv.Add(Description);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Contractdetailspending> SaveContractDetails(string ContractNo, string PropertyID, string BlockID, string FloorID, string UnitID, string ContractValue, string SecurityDeposit,
        string StartDate, string EndDate, int NoOfMonths, string Description, string Status, string CreatedBy)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(72);

        pa.Add("@ContractNo");
        pv.Add(ContractNo);

        pa.Add("@PropertyID");
        pv.Add(Convert.ToInt64(PropertyID));

        pa.Add("@BlockID");
        pv.Add(Convert.ToInt64(BlockID));

        pa.Add("@FloorID");
        pv.Add(Convert.ToInt64(FloorID));

        pa.Add("@UnitID");
        pv.Add(Convert.ToInt64(UnitID));



        pa.Add("@ContractValue");
        pv.Add(ContractValue);

        pa.Add("@SecurityDeposit");
        pv.Add(SecurityDeposit);

        //pa.Add("@ModeOfPayment");
        //pv.Add(ModeOfPayment);

        //pa.Add("@NoOfPayments");
        //pv.Add(NoOfPayments);

        pa.Add("@StartDate");
        pv.Add(StartDate);

        pa.Add("@EndDate");
        pv.Add(EndDate);

        pa.Add("@NoOfMonths");
        pv.Add(NoOfMonths);

        pa.Add("@Description");
        pv.Add(Description);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);


        DataSet ds1 = new DataSet();
        DataTable dt1 = new DataTable();
        List<Contractdetailspending> listProjDet = new List<Contractdetailspending>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Contractdetailspending ind = new Contractdetailspending();

            ind.ContractNo = dt.Rows[i]["ContractNo"].ToString();
            ind.PropertyID = dt.Rows[i]["PropertyID"].ToString();
            ind.BlockID = dt.Rows[i]["BlockID"].ToString();
            //ind.RoomID = dt.Rows[i]["RoomID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            //ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            //ind.BlockName = dt.Rows[i]["BlockName"].ToString();
            //ind.RoomName = dt.Rows[i]["RoomName"].ToString();
            //ind.Status = dt.Rows[i]["Status"].ToString();
            ind.NoOfMonths = dt.Rows[i]["NoOfMonths"].ToString();

            ind.StartDate = dt.Rows[i]["StartDate"].ToString();
            ind.EndDate = dt.Rows[i]["EndDate"].ToString();
            ind.EndDate = dt.Rows[i]["EndDate"].ToString();
            ind.UnitId = dt.Rows[i]["UnitID"].ToString();


            listProjDet.Add(ind);
        }
        return listProjDet;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Contractdetailsview GetContractDetails(string RoomID, string ContractID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(6);


        pa.Add("@RoomID");
        pv.Add(Convert.ToInt64(RoomID));

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        dt = ds.Tables[0];

        Contractdetailsview ind = new Contractdetailsview();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.PropertyID = dt.Rows[i]["PropertyID"].ToString();
            ind.UnitID = dt.Rows[i]["UnitID"].ToString();
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();
            ind.RoomName = dt.Rows[i]["RoomName"].ToString();

            ind.PropertyUsage = dt.Rows[i]["PropertyUsage"].ToString();

            ind.NoOfPayments = dt.Rows[i]["NoOfPayments"].ToString();
            ind.ContractValue = dt.Rows[i]["ContractValue"].ToString();
            ind.SecurityDeposit = dt.Rows[i]["SecurityDeposit"].ToString();
            ind.ModeOfPayment = dt.Rows[i]["ModeOfPayment"].ToString();

            ind.BeneficiearyBank = dt.Rows[i]["BeneficiearyBank"].ToString();
            ind.StartDate = dt.Rows[i]["StartDate"].ToString();
            ind.EndDate = dt.Rows[i]["EndDate"].ToString();
            ind.NoOfMonths = dt.Rows[i]["NoOfMonths"].ToString();


            ind.Description = dt.Rows[i]["Description"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.ApprovedStatus = dt.Rows[i]["ApprovedStatus"].ToString();
            ind.MoveInStage1Approvel = dt.Rows[i]["MoveInStage1Approvel"].ToString();
            ind.MoveInStage2Approvel = dt.Rows[i]["MoveInStage2Approvel"].ToString();
            ind.RenewalStage1Approvel = dt.Rows[i]["RenewalStage1Approvel"].ToString();
            ind.TerminationApprovel = dt.Rows[i]["TerminationApprovel"].ToString();
            ind.RenewalAmount = dt.Rows[i]["RenewalAmount"].ToString(); 
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();

        }


        return ind;


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Contractdetailspending> GetPendingContract(string UserID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add("7");

        pa.Add("@UserID");
        pv.Add(UserID);




        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<Contractdetailspending> listProjDet = new List<Contractdetailspending>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Contractdetailspending ind = new Contractdetailspending();

                ind.ContractNo = dt.Rows[i]["ContractNo"].ToString();
                ind.PropertyID = dt.Rows[i]["PropertyID"].ToString();
                ind.BlockID = dt.Rows[i]["BlockID"].ToString();
                ind.RoomID = dt.Rows[i]["RoomID"].ToString();
                ind.ContractID = dt.Rows[i]["ContractID"].ToString();
                ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
                ind.BlockName = dt.Rows[i]["BlockName"].ToString();
                ind.RoomName = dt.Rows[i]["RoomName"].ToString();
                ind.Status = dt.Rows[i]["Status"].ToString();
                ind.NoOfMonths = dt.Rows[i]["NoOfMonths"].ToString();

                ind.StartDate = dt.Rows[i]["StartDate"].ToString();
                ind.EndDate = dt.Rows[i]["EndDate"].ToString();
                ind.EndDate = dt.Rows[i]["EndDate"].ToString();


                listProjDet.Add(ind);
            }
        }   


        return listProjDet;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static  Contractdetailsview GetPendingContractDetails(string UnitID, string ContractID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(9);


        pa.Add("@UnitID");
        pv.Add(Convert.ToInt64(UnitID));

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);
        
        Contractdetailsview ind = new Contractdetailsview();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ind.ContractID = dt.Rows[i]["ContractID"].ToString();
                ind.PropertyID = dt.Rows[i]["PropertyID"].ToString();
                ind.UnitID = dt.Rows[i]["UnitID"].ToString();
                ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
                ind.BlockName = dt.Rows[i]["BlockName"].ToString();
                ind.RoomName = dt.Rows[i]["RoomName"].ToString();

                ind.PropertyUsage = dt.Rows[i]["PropertyUsage"].ToString();
                ind.ChillerAccountNumber = dt.Rows[i]["ChillerAccountNumber"].ToString();
                ind.ContractValue = dt.Rows[i]["ContractValue"].ToString();
                ind.SecurityDeposit = dt.Rows[i]["SecurityDeposit"].ToString();
                //ind.ModeOfPayment = dt.Rows[i]["ModeOfPayment"].ToString();

                ind.BeneficiearyBank = dt.Rows[i]["BeneficiearyBank"].ToString();
                ind.StartDate = dt.Rows[i]["StartDate"].ToString();
                ind.EndDate = dt.Rows[i]["EndDate"].ToString();
                ind.NoOfMonths = dt.Rows[i]["NoOfMonths"].ToString();


                ind.Description = dt.Rows[i]["Description"].ToString();
                ind.Status = dt.Rows[i]["Status"].ToString();

            }
        }       


        return ind;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<actionRequest> GetpendingContraAction(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(10);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<actionRequest> listProjDet = new List<actionRequest>();

        dt = ds.Tables[0];

        if (ds.Tables.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                actionRequest ind = new actionRequest();
                ind.Role_Name = dt.Rows[i]["Role_Name"].ToString();
                ind.UAliasName = dt.Rows[i]["Action Taken By"].ToString();
                ind.UpdatedDate = dt.Rows[i]["Action Taken ON"].ToString();
                ind.Comments = dt.Rows[i]["Comments"].ToString();
                ind.Status = dt.Rows[i]["Status"].ToString();



                listProjDet.Add(ind);
            }
        }

          


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static actionRequest GetPendingContractButtonAcess(string ContractID, string UserID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(11);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));




        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        actionRequest ProjDet = new actionRequest();

        dt = ds.Tables[0];
        if (dt.Rows.Count > 0)
            ProjDet.Role_Name = dt.Rows[0]["Access"].ToString().Trim();
        else
            ProjDet.Role_Name = "COMPLETED";

        return ProjDet;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdatePendingStatusApproved(string UserID, string ContractID, string Status)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(12);


        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdatRejectReason(string UserID, string ContractID, string Comments)
    {
        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(13);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));


        pa.Add("@Comments");
        pv.Add(Comments);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documentlist> GetTenantDocumentslist( string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(16);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));




        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documentlist> listProjDet = new List<documentlist>();

        dt = ds.Tables[0];

   
            for (int i = 0; i < dt.Rows.Count; i++)
        {
            documentlist ind = new documentlist();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();
            
            listProjDet.Add(ind);
        }


        return listProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documentlist> GetMoveInFinalDoc(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(28);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));




        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documentlist> listProjDet = new List<documentlist>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documentlist ind = new documentlist();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreateTenantDetails(string ContractID, string UnitID, string TenantType, string ENumber, string Name, string Email, string PhoneNumber, string CreatedBy,string LastUpdatedBy)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(17);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@UnitID");
       
        pv.Add(Convert.ToInt64(UnitID));


        pa.Add("@TenantType");
        pv.Add(TenantType);

        pa.Add("@ENumber");
        pv.Add(ENumber);


        pa.Add("@Name");
        pv.Add(Name);



        pa.Add("@Email");
        pv.Add(Email);


        pa.Add("@PhoneNumber");
        pv.Add(PhoneNumber);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

        pa.Add("@LastUpdatedBy");
        pv.Add(LastUpdatedBy);




        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tenantlist> GetTenantdetails(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(18);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<tenantlist> listProjDet = new List<tenantlist>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            tenantlist ind = new tenantlist();
            ind.TenantID = dt.Rows[i]["TenantID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.UnitID = dt.Rows[i]["UnitID"].ToString();
            ind.TenantType = dt.Rows[i]["TenantType"].ToString();
            ind.ENumber = dt.Rows[i]["ENumber"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();

            ind.Email = dt.Rows[i]["Email"].ToString();
            ind.PhoneNumber = dt.Rows[i]["PhoneNumber"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tenantlist> TenantDetailsApprovel(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(18);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<tenantlist> listProjDet = new List<tenantlist>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            tenantlist ind = new tenantlist();
            ind.TenantID = dt.Rows[i]["TenantID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.UnitID = dt.Rows[i]["UnitID"].ToString();
            ind.TenantType = dt.Rows[i]["TenantType"].ToString();
            ind.ENumber = dt.Rows[i]["ENumber"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();

            ind.Email = dt.Rows[i]["Email"].ToString();
            ind.PhoneNumber = dt.Rows[i]["PhoneNumber"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreatePaymentDetails(string ContractID, string UnitID,string PaymentMethod, string PayeeName, string BankName, string CashAmount, string PaymentDate, string ChequeNumber, string CreatedBy,
       string PaymentStatus, string LastUpdatedBy)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(19);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@UnitID");
        pv.Add(Convert.ToInt64(UnitID));

        pa.Add("@PaymentMethod");
        pv.Add(PaymentMethod);

        pa.Add("@PayeeName");
        pv.Add(PayeeName);

        pa.Add("@BankName");
        pv.Add(BankName);

       
         
        pa.Add("@CashAmount");
        pv.Add(CashAmount);
        

        pa.Add("@PaymentDate");
        pv.Add(PaymentDate);


        pa.Add("@ChequeNumber");
        pv.Add(ChequeNumber);

        pa.Add("@PaymentStatus");
        pv.Add(PaymentStatus);

      

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

        pa.Add("@LastUpdatedBy");
        pv.Add(LastUpdatedBy);




        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<paymentdetails> Getpaymentdetails(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(20);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<paymentdetails> listProjDet = new List<paymentdetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            paymentdetails ind = new paymentdetails();
            ind.PaymentDetailsID = dt.Rows[i]["PaymentDetailsID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.UnitID = dt.Rows[i]["UnitID"].ToString();
            ind.PaymentMethod = dt.Rows[i]["PaymentMethod"].ToString();
            ind.PayeeName = dt.Rows[i]["PayeeName"].ToString();
            ind.BankName = dt.Rows[i]["BankName"].ToString();
            ind.CashAmount = dt.Rows[i]["CashAmount"].ToString();
            ind.PaymentDate = dt.Rows[i]["PaymentDate"].ToString();
            ind.ChequeNumber = dt.Rows[i]["ChequeNumber"].ToString();
            
            ind.PaymentStatus = dt.Rows[i]["PaymentStatus"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<paymentdetails> PaymentDetailsApprovels(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(20);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<paymentdetails> listProjDet = new List<paymentdetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            paymentdetails ind = new paymentdetails();
            ind.PaymentDetailsID = dt.Rows[i]["PaymentDetailsID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.UnitID = dt.Rows[i]["UnitID"].ToString();
            ind.PaymentMethod = dt.Rows[i]["PaymentMethod"].ToString();
            ind.PayeeName = dt.Rows[i]["PayeeName"].ToString();
            ind.BankName = dt.Rows[i]["BankName"].ToString();
            ind.CashAmount = dt.Rows[i]["CashAmount"].ToString();
            ind.PaymentDate = dt.Rows[i]["PaymentDate"].ToString();
            ind.ChequeNumber = dt.Rows[i]["ChequeNumber"].ToString();
          
            ind.PaymentStatus = dt.Rows[i]["PaymentStatus"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documetdetails> GetDocumentDetails(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(22);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documetdetails> listProjDet = new List<documetdetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documetdetails ind = new documetdetails();
            ind.DocumetID = dt.Rows[i]["DocumetID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.UnitID = dt.Rows[i]["UnitID"].ToString();
            ind.DocChListID = dt.Rows[i]["DocChListID"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();
            ind.ImageURL = dt.Rows[i]["ImageURL"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.Stage = dt.Rows[i]["Stage"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            


            listProjDet.Add(ind);
        }

        return listProjDet;
       
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documetdetails> GetMoveInApprovedDoc(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(29);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));


        //pa.Add("@DocChListID");
        //pv.Add(DocChListID);

        //string DocChListID



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documetdetails> listProjDet = new List<documetdetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documetdetails ind = new documetdetails();
            ind.DocumetID = dt.Rows[i]["DocumetID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.UnitID = dt.Rows[i]["UnitID"].ToString();
            ind.DocChListID = dt.Rows[i]["DocChListID"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();
            ind.ImageURL = dt.Rows[i]["ImageURL"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.Stage = dt.Rows[i]["Stage"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UploadedDocsCount> GetDocumentCount(string ContractID,string UserID)
    {
    

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(23);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@UserID");
        pv.Add(UserID);



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<UploadedDocsCount> listProjDet = new List<UploadedDocsCount>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UploadedDocsCount ind = new UploadedDocsCount();
            ind.ContractId = dt.Rows[i]["ContractID"].ToString();
            ind.MoveinStage1Approval = dt.Rows[i]["MoveInStage1Approvel"].ToString();
            ind.DocCount = dt.Rows[i]["DocumentCount"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UploadedDocsCount> GetMoveInFinalDocCount(string ContractID, string UserID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(30);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@UserID");
        pv.Add(UserID);
        



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<UploadedDocsCount> doctcountlist = new List<UploadedDocsCount>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UploadedDocsCount ind = new UploadedDocsCount();
            ind.ContractId = dt.Rows[i]["ContractID"].ToString();
            ind.MoveinStage2Approval = dt.Rows[i]["MoveInStage2Approvel"].ToString();
            ind.DocCount = dt.Rows[i]["DocumentCount"].ToString();

            doctcountlist.Add(ind);
        }


        return doctcountlist;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void addStage1ApprovelDetails(string UserID, string ContractID, string CreatedBy)
    {
        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(24);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@CreatedBy");
        pv.Add(Convert.ToInt64(UserID));





        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void addStage2ApprovelDetails(string UserID, string ContractID)
    {
        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(31);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));







        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void updateContractDocPreApprovel(int UserID, string ContractID, string Status)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(25);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void updateMovinFinalApprovel(int UserID, string ContractID, string Status)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(32);


        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdatDocRejectReason(string UserID, string ContractID, string Comments)
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

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));


        pa.Add("@Comments");
        pv.Add(Comments);

        pa.Add("@MoveInStage1Approvel");
        pv.Add("REJECTED");


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteAttachStage1Doc(string ContractID, string DocumetID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(33);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@DocumetID");
        pv.Add(Convert.ToInt64(DocumetID));

        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);


    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documentlist> GetRenewalstage1doclist(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(34);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));




        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documentlist> listProjDet = new List<documentlist>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documentlist ind = new documentlist();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documetdetails> GetRenewalstage1Doc(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(35);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));


        //pa.Add("@DocChListID");
        //pv.Add(DocChListID);

        //string DocChListID



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documetdetails> listProjDet = new List<documetdetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documetdetails ind = new documetdetails();
            ind.DocumetID = dt.Rows[i]["DocumetID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.UnitID = dt.Rows[i]["UnitID"].ToString();
            ind.DocChListID = dt.Rows[i]["DocChListID"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();
            ind.ImageURL = dt.Rows[i]["ImageURL"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.Stage = dt.Rows[i]["Stage"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void RenewalStage1Approvel(string UserID, string ContractID)
    {
        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(36);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));





        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UploadedDocsCount> GetShowRenewalStage1Acess(string ContractID, string UserID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

             

        pa.Add("@Oper");
        pv.Add(37);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@UserID");
        pv.Add(UserID);



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<UploadedDocsCount> doctcountlist = new List<UploadedDocsCount>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UploadedDocsCount ind = new UploadedDocsCount();
            ind.ContractId = dt.Rows[i]["ContractID"].ToString();
            ind.RenewalStage1Approvel = dt.Rows[i]["RenewalStage1Approvel"].ToString();
            ind.DocCount = dt.Rows[i]["DocumentCount"].ToString();

            doctcountlist.Add(ind);
        }


        return doctcountlist;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void updateRenewalStage1Approvel(string UserID, string ContractID, string Status)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(38);


        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void RenewContractDetails(string ContractNo, string PropertyID, string BlockID, string FloorID, string UnitID, string PropertyUsage, string ContractValue, string SecurityDeposit,
        string ModeOfPayment, string StartDate, string EndDate, int NoOfMonths, string Description, string Status, string CreatedBy,string RenewedContractID,string RenewedBy,string ContractID)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(39);

        pa.Add("@ContractNo");
        pv.Add(ContractNo);

        pa.Add("@PropertyID");
        pv.Add(Convert.ToInt64(PropertyID));

        pa.Add("@BlockID");
        pv.Add(Convert.ToInt64(BlockID));

        pa.Add("@FloorID");
        pv.Add(Convert.ToInt64(FloorID));

        pa.Add("@UnitID");
        pv.Add(Convert.ToInt64(UnitID));

        pa.Add("@PropertyUsage");
        pv.Add(PropertyUsage);



        pa.Add("@ContractValue");
        pv.Add(ContractValue);

        pa.Add("@SecurityDeposit");
        pv.Add(SecurityDeposit);

        pa.Add("@ModeOfPayment");
        pv.Add(ModeOfPayment);

     

        pa.Add("@StartDate");
        pv.Add(StartDate);

        pa.Add("@EndDate");
        pv.Add(EndDate);

        pa.Add("@NoOfMonths");
        pv.Add(NoOfMonths);

        pa.Add("@Description");
        pv.Add(Description);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

       
        pa.Add("@RenewedContractID");
        pv.Add(Convert.ToInt64(RenewedContractID));


        pa.Add("@RenewedBy");
        pv.Add(RenewedBy);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));




        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documentlist> GetTerminationdoclist(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(40);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));




        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documentlist> listProjDet = new List<documentlist>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documentlist ind = new documentlist();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documetdetails> GetTerminationDocs(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(41);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documetdetails> listProjDet = new List<documetdetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documetdetails ind = new documetdetails();
            ind.DocumetID = dt.Rows[i]["DocumetID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.UnitID = dt.Rows[i]["UnitID"].ToString();
            ind.DocChListID = dt.Rows[i]["DocChListID"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();
            ind.ImageURL = dt.Rows[i]["ImageURL"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.Stage = dt.Rows[i]["Stage"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SubmitTerminationDoc(string UserID, string ContractID)
    {
        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(42);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));





        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UploadedDocsCount> GetTerminationButtonAcess(string ContractID, string UserID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(43);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@UserID");
        pv.Add(UserID);



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<UploadedDocsCount> doctcountlist = new List<UploadedDocsCount>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UploadedDocsCount ind = new UploadedDocsCount();
            ind.ContractId = dt.Rows[i]["ContractID"].ToString();
            ind.TerminationApprovel = dt.Rows[i]["TerminationApprovel"].ToString();
            ind.DocCount = dt.Rows[i]["DocumentCount"].ToString();

            doctcountlist.Add(ind);
        }


        return doctcountlist;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void updateTerminationApprovel(string UserID, string ContractID, string Status)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(44);


        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documentlist> GetInitateMoveoutStage1doc(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(45);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));




        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documentlist> listProjDet = new List<documentlist>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documentlist ind = new documentlist();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documetdetails> GetShowMovOutStage1Docs(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(46);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documetdetails> listProjDet = new List<documetdetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documetdetails ind = new documetdetails();
            ind.DocumetID = dt.Rows[i]["DocumetID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.UnitID = dt.Rows[i]["UnitID"].ToString();
            ind.DocChListID = dt.Rows[i]["DocChListID"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();
            ind.ImageURL = dt.Rows[i]["ImageURL"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.Stage = dt.Rows[i]["Stage"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UploadedDocsCount> GetMoveOutStage1ButtonAcess(string ContractID, string UserID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(47);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@UserID");
        pv.Add(UserID);
        



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<UploadedDocsCount> doctcountlist = new List<UploadedDocsCount>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UploadedDocsCount ind = new UploadedDocsCount();
            ind.ContractId = dt.Rows[i]["ContractID"].ToString();
            ind.MoveOutStage1Approvel = dt.Rows[i]["MoveOutStage1Approvel"].ToString();
            ind.DocCount = dt.Rows[i]["DocumentCount"].ToString();

            doctcountlist.Add(ind);
        }


        return doctcountlist;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SubmitInitateMoveDoc(string UserID, string ContractID)
    {
        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(48);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));





        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void updateMovepotApprovelstage1(string UserID, string ContractID, string Status)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(49);


        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documentlist> GetShowFinalMoveoutDocs(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(50);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));




        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documentlist> listProjDet = new List<documentlist>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documentlist ind = new documentlist();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documetdetails> GetFinalMoveoutDocList(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(51);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documetdetails> listProjDet = new List<documetdetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documetdetails ind = new documetdetails();
            ind.DocumetID = dt.Rows[i]["DocumetID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.UnitID = dt.Rows[i]["UnitID"].ToString();
            ind.DocChListID = dt.Rows[i]["DocChListID"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();
            ind.ImageURL = dt.Rows[i]["ImageURL"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.Stage = dt.Rows[i]["Stage"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UploadedDocsCount> GetFinalMoveoutButtonAcess(string ContractID, string UserID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(52);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@UserID");
        pv.Add(UserID);

      



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<UploadedDocsCount> doctcountlist = new List<UploadedDocsCount>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UploadedDocsCount ind = new UploadedDocsCount();
            ind.ContractId = dt.Rows[i]["ContractID"].ToString();
            ind.MoveOutfinalApprovel = dt.Rows[i]["MoveOutfinalApprovel"].ToString();
            ind.DocCount = dt.Rows[i]["DocumentCount"].ToString();

            doctcountlist.Add(ind);
        }


        return doctcountlist;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SubmitfinalMoveoutDocs(string UserID, string ContractID)
    {
        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(53);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));





        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateFinalMoveoutApprovel(string UserID, string ContractID, string Status)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(49);


        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documentlist> GetFinalEstimationDocs(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(54);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documentlist> listProjDet = new List<documentlist>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documentlist ind = new documentlist();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documetdetails> GetFinalEstimationDocList(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(55);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documetdetails> listProjDet = new List<documetdetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documetdetails ind = new documetdetails();
            ind.DocumetID = dt.Rows[i]["DocumetID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.UnitID = dt.Rows[i]["UnitID"].ToString();
            ind.DocChListID = dt.Rows[i]["DocChListID"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();
            ind.ImageURL = dt.Rows[i]["ImageURL"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.Stage = dt.Rows[i]["Stage"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UploadedDocsCount> GetFinalEstimationButtonAcess(string ContractID, string UserID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(56);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@UserID");
        pv.Add(UserID);
      


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<UploadedDocsCount> doctcountlist = new List<UploadedDocsCount>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UploadedDocsCount ind = new UploadedDocsCount();
            ind.ContractId = dt.Rows[i]["ContractID"].ToString();
            ind.MaintenanceEstimationApprovel = dt.Rows[i]["MaintenanceEstimationApprovel"].ToString();
            ind.DocCount = dt.Rows[i]["DocumentCount"].ToString();

            doctcountlist.Add(ind);
        }


        return doctcountlist;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SubmitfinalEstimation(string UserID, string ContractID)
    {
        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(57);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));





        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateMOFinalEstimationApprovel(string UserID, string ContractID, string Status)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(58);


        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documentlist> GetSecurityDepositRefund(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(59);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documentlist> listProjDet = new List<documentlist>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documentlist ind = new documentlist();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<documetdetails> GetSecurityDepositRefundDocList(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(60);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<documetdetails> listProjDet = new List<documetdetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            documetdetails ind = new documetdetails();
            ind.DocumetID = dt.Rows[i]["DocumetID"].ToString();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.UnitID = dt.Rows[i]["UnitID"].ToString();
            ind.DocChListID = dt.Rows[i]["DocChListID"].ToString();
            ind.DocumentName = dt.Rows[i]["DocumentName"].ToString();
            ind.ImageURL = dt.Rows[i]["ImageURL"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.Stage = dt.Rows[i]["Stage"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UploadedDocsCount> GetSecurityDEpositRefundButtonAcess(string ContractID, string UserID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(61);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@UserID");
        pv.Add(UserID);



        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<UploadedDocsCount> doctcountlist = new List<UploadedDocsCount>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UploadedDocsCount ind = new UploadedDocsCount();
            ind.ContractId = dt.Rows[i]["ContractID"].ToString();
            ind.SecurityDepositRefundApprovel = dt.Rows[i]["SecurityDepositRefundApprovel"].ToString();
            ind.DocCount = dt.Rows[i]["DocumentCount"].ToString();

            doctcountlist.Add(ind);
        }


        return doctcountlist;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SubmitSDrefund(string UserID, string ContractID)
    {
        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(62);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));





        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateSErefundApprovel(string UserID, string ContractID, string Status)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(63);


        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Contractdetailsview> GetUniqueContractNo()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(64);


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<Contractdetailsview> listProjDet = new List<Contractdetailsview>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Contractdetailsview ind = new Contractdetailsview();
            ind.ContractNo = dt.Rows[i]["ContractNo"].ToString();
            listProjDet.Add(ind);
        }

        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetIsTenentUnderWorkOrder(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(65);

        pa.Add("@ContractID");
       pv.Add(Convert.ToInt64(ContractID));


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);



        return ds.Tables[0].Rows[0][0].ToString();

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetIsAddTenantPaymentdetails(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(66);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));


        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);



        return ds.Tables[0].Rows[0][0].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetBtnRenewalAndTermination(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(67);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateRenewalDetails(string ContractID, string RenewalAmount, string RewContractStartDate, string RewContractEndDate)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(68);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        pa.Add("@RenewalAmount");
        pv.Add(Convert.ToInt64(RenewalAmount));

        pa.Add("@RewContractStartDate");
        pv.Add(RewContractStartDate);


        pa.Add("@RewContractEndDate");
        pv.Add(RewContractEndDate);

       
        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetBtnAcessAddRewedContract(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(70);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string BtnAcesssubmittermination(string ContractID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(71);

        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<paymentmethods> GetPaymentMethods(string ContractID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(73);


        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<paymentmethods> ind = new List<paymentmethods>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ind.Add(new paymentmethods
                {
                    PaymentMethod = dt.Rows[i]["PaymentMethod"].ToString(),
                    Count = dt.Rows[i]["PmCount"].ToString()
                });
                
            }
        }
        return ind;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<paymentmethods> GetPaymentMethodsDiv(string ContractID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(73);


        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<paymentmethods> ind = new List<paymentmethods>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ind.Add(new paymentmethods
                {
                    PaymentMethod = dt.Rows[i]["PaymentMethod"].ToString(),
                    //Count = dt.Rows[i]["PmCount"].ToString()
                });

            }
        }
        return ind;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<paymentmethods> GetPaymentMethodsActv(string ContractID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(73);


        pa.Add("@ContractID");
        pv.Add(Convert.ToInt64(ContractID));

        DBH.CreateDatasetFM_Data(ds, "sp_ContractMaster", true, pa, pv);

        List<paymentmethods> ind = new List<paymentmethods>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ind.Add(new paymentmethods
                {
                    PaymentMethod = dt.Rows[i]["PaymentMethod"].ToString(),
                    //Count = dt.Rows[i]["PmCount"].ToString()
                });

            }
        }
        return ind;

    }

    public class documetdetails
    {
        public string DocumetID;
        public string ContractID;
        public string UnitID;
        public string DocChListID;
        public string DocumentName;
        public string ImageURL;
        public string FileName;
        public string Stage;
        public string Status;

    }


    public class paymentdetails
    {
        public string PaymentDetailsID;
        public string ContractID;
        public string UnitID;
        public string PayeeName;
        public string BankName;
        public string CashAmount;
        public string PaymentDate;
        public string PaymentStatus;
        public string ChequeNumber;
        public string PaymentMethod;
    }
    public class tenantlist
    {
        public string ContractID;
        public string TenantID;
        public string UnitID;
        public string TenantType;
        public string ENumber;
        public string Email;
        public string PhoneNumber;
        public string CreatedDate;
        public string Name;

    }
    public class UploadedDocsCount {
        public string DocCount { get; set; }
        public string ContractId { get; set; }
        public string MoveinStage1Approval { get; set; }

        public string MoveinStage2Approval { get; set; }

        public string RenewalStage1Approvel {get;set;}

        public string TerminationApprovel { get; set;}

        public string MoveOutfinalApprovel { get; set;}

        public string MoveOutStage1Approvel { get; set;}

        public string MaintenanceEstimationApprovel { get; set;}

        public string SecurityDepositRefundApprovel { get; set;}

    }
    public class documentlist
    {
        public string Id { get; set; }
        public string DocumentName { get; set; }
    }
    public class actionRequest
    {
        public string Role_Name { get; set; }
        public string UAliasName { get; set; }
        public string UpdatedDate { get; set; }
        public string Comments { get; set; }

        public string Status { get; set; }

    }
    public class Contractdetailspending
    {
        public string ContractID { get; set; }
        public string PropertyID { get; set; }
        public string UnitID { get; set; }
        public string PropertyName { get; set; }
        public string BlockName { get; set; }
        public string RoomName { get; set; }
        public string PropertyUsage { get; set; }
        public string ChillerAccountNumber { get; set; }
        public string ContractValue { get; set; }
        public string SecurityDeposit { get; set; }
        public string ModeOfPayment { get; set; }
        public string BeneficiearyBank { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string NoOfMonths { get; set; }
        public string Description { get; set; }

        public string Status { get; set; }

        public string ContractNo { get; set; }
        public string BlockID { get; set; }
        public string RoomID { get; set; }
        public string UnitId { get; set; }
        

    }
    public class Contractdetailsview
    {
        public string ContractID { get; set; }
        public string ContractNo { get; set; }

        public string CreatedBy { get; set; }

        public string PropertyID { get; set; }
        public string UnitID { get; set; }
        public string PropertyName { get; set; }
        public string BlockName { get; set; }
        public string RoomName { get; set; }
        public string PropertyUsage { get; set; }
        public string ChillerAccountNumber { get; set; }
        public string ContractValue { get; set; }
        public string SecurityDeposit { get; set; }
        public string ModeOfPayment { get; set; }
        public string BeneficiearyBank { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string NoOfMonths { get; set; }
        public string Description { get; set; }

        public string Status { get; set; }
        public string MoveInStage1Approvel { get; set; }

        public string ApprovedStatus { get; set; }

        public string MoveInStage2Approvel { get; set; }

        public string RenewalStage1Approvel { get; set; }

        public string TerminationApprovel { get; set; }

        public string NoOfPayments { get; set; }

        public string RenewalAmount { get; set; }


    }


    public class paymentmethods
    {
        public string PaymentMethod { get; set; }
        public string Count { get; set; }

        public string ModeOfPayment { get; set; }    

    }
    public class PropertydetailsMdl
    {
        public string Ownership { get; set; }
        public string Location { get; set; }
        public string LandlordsName { get; set; }
        public string LandlordsEmail { get; set; }
        public string LandlordsPhone { get; set; }
        public string Type { get; set; }
        public string NoOfRoom { get; set; }

        public string PropertyUsage { get; set; }

        public string PremiseNo { get; set; }



    }

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }

    }



           

    public class UnitDetails
    {
        public string PropertyID { get; set; }
        public string BlockID { get; set; }
        public string RoomID { get; set; }

        public string RoomName { get; set; }
        public string PropertyName { get; set; }
        public string ContractNo { get; set; }
        public string BlockName { get; set; }
        public string ContractValue { get; set; }
        public string SecurityDeposit { get; set; }
        public string ModeOfPayment { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }

        public string ContractID { get; set; }
        public string PropertyUsage { get; set; }  
        
        public string MoveInStage1Approvel { get; set; }

        public string Status { get; set; }

        public string NoOfMonths { get; set; }




    }
}