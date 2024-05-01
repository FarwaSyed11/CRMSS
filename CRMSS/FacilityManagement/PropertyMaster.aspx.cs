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
using ZXing;
//using static FacilityManagementNew_PropertyMaster;


public partial class FacilityManagementNew_PropertyMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetPropertyTypeDDL()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");



        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["ddlValue"].ToString(),
                ddlText = dt.Rows[i]["ddlValue"].ToString()
            });
        }

        return drpval;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetAllPropertyDDL()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");



        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

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

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetAllBlockDDL(int PropId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");

        pa.Add("@PropertyID");
        pv.Add(PropId);



        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

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

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static propertyDetails CreatePrppertyDetails(string Code, string Name, string Location, string Address, string PlotNumber, string Type, string CreatedBy, string NoOfUnit, string NoOfFloor, string NoOfRoom, string Ownership,

       string LastUpdatedBy, string Status, string LandlordsName, string LandlordsEmail, string LandlordsPhone, string PlotArea, string PremiseNo,string NoOfParking)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@Code");
        pv.Add(Code);

        pa.Add("@Name");
        pv.Add(Name);


        pa.Add("@Location");
        pv.Add(Location);

        pa.Add("@Address");
        pv.Add(Address);

        pa.Add("@PlotNumber");
        pv.Add(PlotNumber);



        pa.Add("@Type");
        pv.Add(Type);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

        pa.Add("@NoOfUnit");
        pv.Add(Convert.ToInt64(NoOfUnit));

        pa.Add("@NoOfFloor");
        pv.Add(Convert.ToInt64(NoOfFloor));



        pa.Add("@NoOfRoom");
        pv.Add(Convert.ToInt64(NoOfRoom));


        pa.Add("@Ownership");
        pv.Add(Ownership);

        pa.Add("@LastUpdatedBy");
        pv.Add(LastUpdatedBy);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@LandlordsName");
        pv.Add(LandlordsName);

        pa.Add("@LandlordsEmail");
        pv.Add(LandlordsEmail);

        pa.Add("@LandlordsPhone");
        pv.Add(LandlordsPhone);

        pa.Add("@PlotArea");
        pv.Add(PlotArea);

        pa.Add("@PremiseNo");
        pv.Add(PremiseNo);


        pa.Add("@NoOfParking");
        pv.Add(NoOfParking);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        propertyDetails oPD = new propertyDetails();
        oPD.PropId = ds.Tables[0].Rows[0]["PropId"].ToString();
        return oPD;

    }

  

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreateBlockDetails(string PropertyID, string PropertyName, string BlockCode, string BlockName, string Location, string Description, string CreatedBy, string LastUpdatedBy)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@PropertyID");
        pv.Add(PropertyID);

        pa.Add("@PropertyName");
        pv.Add(PropertyName);


        pa.Add("@BlockCode");
        pv.Add(BlockCode);

        pa.Add("@BlockName");
        pv.Add(BlockName);


        pa.Add("@Location");
        pv.Add(Location);



        pa.Add("@Description");
        pv.Add(Description);


        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);



        pa.Add("@LastUpdatedBy");
        pv.Add(LastUpdatedBy);




       DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        return;

    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Allpropertyddl GetProperyBasicDetails(string PropertyID, string PropertyName)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(3);


        pa.Add("@PropertyID");
        pv.Add(Convert.ToInt64(PropertyID));

        pa.Add("@Name");
        pv.Add(PropertyName);



        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);



        dt = ds.Tables[0];

        Allpropertyddl ind = new Allpropertyddl();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.Pid = dt.Rows[i]["PropertyID"].ToString();
            ind.Code = dt.Rows[i]["Code"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Address = dt.Rows[i]["Address"].ToString();
            ind.PlotNumber = dt.Rows[i]["PlotNumber"].ToString();

        }


        return ind;


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllBlockddl GetBlockBasicDetails(string BlockID)

    
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(6);


        pa.Add("@BlockID");

        pv.Add(BlockID);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);



        dt = ds.Tables[0];

        AllBlockddl ind = new AllBlockddl();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.BlockID = dt.Rows[i]["BlockID"].ToString();
            ind.BlockCode = dt.Rows[i]["BlockCode"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();



        }


        return ind;


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreateFloorDetails(string PropertyID, string PropertyName, string BlockID, string BlockName, string FloorCode, string FloorName, string Description, string CreatedBy, string LastUpdatedBy)
    {
        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(7);

        pa.Add("@PropertyID");
        pv.Add(PropertyID);

        pa.Add("@PropertyName");
        pv.Add(PropertyName);


        pa.Add("@BlockID");
        pv.Add(BlockID);


        pa.Add("@BlockName");
        pv.Add(BlockName);

        pa.Add("@FloorCode");
        pv.Add(FloorCode);

        pa.Add("@FloorName");
        pv.Add(FloorName);


        pa.Add("@Description");
        pv.Add(Description);


        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);



        pa.Add("@LastUpdatedBy");
        pv.Add(LastUpdatedBy);




        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetAllFloorDDL(int BlockID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@BlockID");
        pv.Add(BlockID);



        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

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

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static allFloorddl GetFloorBasicDetails(string FloorID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(9);


        pa.Add("@FloorID");
        pv.Add(FloorID);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);



        dt = ds.Tables[0];

        allFloorddl ind = new allFloorddl();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.FloorID = dt.Rows[i]["FloorID"].ToString();
            ind.FloorCode = dt.Rows[i]["FloorCode"].ToString();
            ind.FloorName = dt.Rows[i]["FloorName"].ToString();
            ind.Description = dt.Rows[i]["Description"].ToString();


        }


        return ind;
    }





    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreateUnitDetails(string RoomCode, string RoomName, string PropertyID, string PropertyCode, string PropertyName, string FloorID,
       string FloorName,string BlockID,string BlockName, string Description, string CreatedBy,
       string LastUpdatedBy,string UnitCategory,string ElectricityAccount,string ChillerAccount,string PropertyUsage, string BuildUpAreaSqFt,string BalconyAreaSqFt,string TotalAreaSqFt,string NoOfParking)
    {


        DBHandler DBH = new DBHandler();


        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(10);

        pa.Add("@RoomCode");
        pv.Add(RoomCode);

        pa.Add("@RoomName");
        pv.Add(RoomName);


        pa.Add("@PropertyID");
        pv.Add(PropertyID);
        

        pa.Add("@PropertyCode");
        pv.Add(PropertyCode);

        pa.Add("@PropertyName");
        pv.Add(PropertyName);

        pa.Add("@FloorID");
        pv.Add(FloorID);


        pa.Add("@FloorName");
        pv.Add(FloorName);


        pa.Add("@BlockID");
        pv.Add(BlockID);
        

        pa.Add("@BlockName");
        pv.Add(BlockName);

        pa.Add("@Description");
        pv.Add(Description);


        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

        pa.Add("@LastUpdatedBy");
        pv.Add(LastUpdatedBy);
           
        pa.Add("@UnitCategory");
        pv.Add(UnitCategory);

        pa.Add("@ElectricityAccount");
        pv.Add(ElectricityAccount);

        pa.Add("@ChillerAccount");
        pv.Add(ChillerAccount);

        pa.Add("@PropertyUsage");
        pv.Add(PropertyUsage);


        pa.Add("@BuildUpAreaSqFt");
        pv.Add(Convert.ToInt64(BuildUpAreaSqFt));

        pa.Add("@BalconyAreaSqFt");
        pv.Add(Convert.ToInt64(BalconyAreaSqFt));

        pa.Add("@TotalAreaSqFt");
        pv.Add(Convert.ToInt64(TotalAreaSqFt));

        pa.Add("@NoOfParking");
        pv.Add(NoOfParking);    


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        return;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UnitDetails> GetAllUnitsDetails()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(11);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<UnitDetails> listProjDet = new List<UnitDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UnitDetails ind = new UnitDetails();
            ind.RoomID = dt.Rows[i]["RoomID"].ToString();
            ind.RoomCode = dt.Rows[i]["RoomCode"].ToString();
            ind.RoomName = dt.Rows[i]["RoomName"].ToString();
            ind.FloorName = dt.Rows[i]["FloorName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();
            
            ind.BuildUpAreaSqFt = dt.Rows[i]["BuildUpAreaSqFt"].ToString();
            ind.BalconyAreaSqFt = dt.Rows[i]["BalconyAreaSqFt"].ToString();
            ind.TotalAreaSqFt = dt.Rows[i]["TotalAreaSqFt"].ToString();
           

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Workorder> GetWOrequestUnserUnit(string RoomID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(25);

        pa.Add("@RoomID");
        pv.Add(RoomID);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<Workorder> listProjDet = new List<Workorder>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Workorder ind = new Workorder();

          
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            ind.Priority = dt.Rows[i]["Priority"].ToString();
            ind.Category = dt.Rows[i]["Category"].ToString();
            ind.RequestedBy = dt.Rows[i]["RequestedBy"].ToString();
            ind.DueDate = dt.Rows[i]["DueDate"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UnitDetails> GetRejectedUnitDetails()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(24);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<UnitDetails> listProjDet = new List<UnitDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UnitDetails ind = new UnitDetails();
            ind.RoomID = dt.Rows[i]["RoomID"].ToString();
            ind.RoomCode = dt.Rows[i]["RoomCode"].ToString();
            ind.RoomName = dt.Rows[i]["RoomName"].ToString();
            ind.FloorName = dt.Rows[i]["FloorName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();

            ind.BuildUpAreaSqFt = dt.Rows[i]["BuildUpAreaSqFt"].ToString();
            ind.BalconyAreaSqFt = dt.Rows[i]["BalconyAreaSqFt"].ToString();
            ind.TotalAreaSqFt = dt.Rows[i]["TotalAreaSqFt"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<propertyDetails> GetAllPropertiesDetails()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(12);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<propertyDetails> listProjDet = new List<propertyDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            propertyDetails ind = new propertyDetails();
            ind.Code = dt.Rows[i]["Code"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Ownership = dt.Rows[i]["Ownership"].ToString();
            ind.PlotNumber = dt.Rows[i]["PlotNumber"].ToString();
            ind.NoOfUnit = dt.Rows[i]["NoOfUnit"].ToString();
            ind.NoOfFloor = dt.Rows[i]["NoOfFloor"].ToString();
           
            //ind.NoOfRoom = dt.Rows[i]["NoOfRoom"].ToString();
            //ind.MinRent = dt.Rows[i]["MinRent"].ToString();
            //ind.maxRent = dt.Rows[i]["maxRent"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static UnitdetailsView Getunitdetatlsmdl(string RoomID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(13);


        pa.Add("@RoomID");
        pv.Add(Convert.ToInt64(RoomID));

        



        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);



        dt = ds.Tables[0];


        UnitdetailsView ind = new UnitdetailsView();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.RoomCode = dt.Rows[i]["RoomCode"].ToString();
            ind.RoomName = dt.Rows[i]["RoomName"].ToString();
            ind.FloorName = dt.Rows[i]["FloorName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();
            ind.PropertyCode = dt.Rows[i]["PropertyCode"].ToString();
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();


            ind.NoOfFloor = dt.Rows[i]["NoOfFloor"].ToString();
            ind.NoOfRoom = dt.Rows[i]["NoOfRoom"].ToString();
            ind.Ownership = dt.Rows[i]["Ownership"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Address = dt.Rows[i]["Address"].ToString();


            ind.UnitCategory = dt.Rows[i]["UnitCategory"].ToString();
            ind.ElectricityAccount = dt.Rows[i]["ElectricityAccount"].ToString();
            ind.ChillerAccount = dt.Rows[i]["ChillerAccount"].ToString();
            ind.PropertyUsage = dt.Rows[i]["PropertyUsage"].ToString();


            ind.BuildUpAreaSqFt = dt.Rows[i]["BuildUpAreaSqFt"].ToString();
            ind.BalconyAreaSqFt = dt.Rows[i]["BalconyAreaSqFt"].ToString();
            ind.TotalAreaSqFt = dt.Rows[i]["TotalAreaSqFt"].ToString();
            ind.NoOfParking = dt.Rows[i]["NoOfParking"].ToString();
            ind.PremiseNo = dt.Rows[i]["PremiseNo"].ToString();
            ind.LandlordsName = dt.Rows[i]["LandlordsName"].ToString();
            ind.LandlordsPhone = dt.Rows[i]["LandlordsPhone"].ToString();
            ind.LandlordsEmail = dt.Rows[i]["LandlordsEmail"].ToString();

        }


        return ind;


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<contractdetails> GetContarctDetails(string RoomID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(14);

        pa.Add("@RoomID");
        pv.Add(Convert.ToInt64(RoomID));


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<contractdetails> listProjDet = new List<contractdetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            contractdetails ind = new contractdetails();
            ind.ContractID = dt.Rows[i]["ContractID"].ToString();
            ind.ContractNo = dt.Rows[i]["ContractNo"].ToString();
            ind.ChillerAccountNumber = dt.Rows[i]["ChillerAccountNumber"].ToString();
            ind.ContractValue = dt.Rows[i]["ContractValue"].ToString();
            ind.SecurityDeposit = dt.Rows[i]["SecurityDeposit"].ToString();
            ind.ModeOfPayment = dt.Rows[i]["ModeOfPayment"].ToString();

            ind.BeneficiearyBank = dt.Rows[i]["BeneficiearyBank"].ToString();
            ind.StartDate = dt.Rows[i]["StartDate"].ToString();
            ind.EndDate = dt.Rows[i]["EndDate"].ToString();
            ind.NoOfMonths = dt.Rows[i]["NoOfMonths"].ToString();
            ind.Description = dt.Rows[i]["Description"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();





            listProjDet.Add(ind);
        }


        return listProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UnitDetails> GetPendingUnits(string UserID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(15);

        pa.Add("@UserID");
        pv.Add(UserID);

       


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<UnitDetails> listProjDet = new List<UnitDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UnitDetails ind = new UnitDetails();
            ind.RoomID = dt.Rows[i]["RoomID"].ToString();
            ind.RoomCode = dt.Rows[i]["RoomCode"].ToString();
            ind.RoomName = dt.Rows[i]["RoomName"].ToString();
            ind.FloorName = dt.Rows[i]["FloorName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();
           
            ind.BuildUpAreaSqFt = dt.Rows[i]["BuildUpAreaSqFt"].ToString();
            ind.BalconyAreaSqFt = dt.Rows[i]["BalconyAreaSqFt"].ToString();
            ind.TotalAreaSqFt = dt.Rows[i]["TotalAreaSqFt"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static UnitdetailsView GetRequestedUnitDtlsMdl(string RoomID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(13);


        pa.Add("@RoomID");
        pv.Add(Convert.ToInt64(RoomID));





        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);



        dt = ds.Tables[0];


        UnitdetailsView ind = new UnitdetailsView();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.RoomCode = dt.Rows[i]["RoomCode"].ToString();
            ind.RoomName = dt.Rows[i]["RoomName"].ToString();
            ind.FloorName = dt.Rows[i]["FloorName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();
            ind.PropertyCode = dt.Rows[i]["PropertyCode"].ToString();
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();


            ind.NoOfFloor = dt.Rows[i]["NoOfFloor"].ToString();
            ind.NoOfRoom = dt.Rows[i]["NoOfRoom"].ToString();
            ind.Ownership = dt.Rows[i]["Ownership"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Address = dt.Rows[i]["Address"].ToString();


            ind.UnitCategory = dt.Rows[i]["UnitCategory"].ToString();
            ind.ElectricityAccount = dt.Rows[i]["ElectricityAccount"].ToString();
            ind.ChillerAccount = dt.Rows[i]["ChillerAccount"].ToString();
            ind.PropertyUsage = dt.Rows[i]["PropertyUsage"].ToString();


            ind.BuildUpAreaSqFt = dt.Rows[i]["BuildUpAreaSqFt"].ToString();
            ind.BalconyAreaSqFt = dt.Rows[i]["BalconyAreaSqFt"].ToString();
            ind.TotalAreaSqFt = dt.Rows[i]["TotalAreaSqFt"].ToString();
            ind.NoOfParking = dt.Rows[i]["NoOfParking"].ToString();
            ind.PremiseNo = dt.Rows[i]["PremiseNo"].ToString();
            ind.LandlordsName = dt.Rows[i]["LandlordsName"].ToString();
            ind.LandlordsPhone = dt.Rows[i]["LandlordsPhone"].ToString();
            ind.LandlordsEmail = dt.Rows[i]["LandlordsEmail"].ToString();


        }


        return ind;


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<actionRequest> GetloadUnitReqAction(string RoomID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(16);

        pa.Add("@RoomID");
        pv.Add(RoomID);



        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<actionRequest> listProjDet = new List<actionRequest>();

        dt = ds.Tables[0];


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


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static actionRequest GetUnitRequestButtonAcess(string RoomId,string UserID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(17);

        pa.Add("@UserID");
        pv.Add(Convert.ToInt64(UserID));

        pa.Add("@RoomId");
        pv.Add(Convert.ToInt64(RoomId));




        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        actionRequest ProjDet = new actionRequest();

        dt = ds.Tables[0];
        if(dt.Rows.Count>0)
            ProjDet.Role_Name = dt.Rows[0]["Access"].ToString().Trim();
        else
            ProjDet.Role_Name = "COMPLETED";

        return ProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateStatusVerified(string UserID, string RoomID,string Status)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(18);


        pa.Add("@UserID");
        pv.Add(Convert.ToInt64(UserID));

        pa.Add("@RoomId");
        pv.Add(Convert.ToInt64(RoomID));

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdatRejectReason(string UserID, string RoomID, string Comments, string Status)
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

        pa.Add("@UserID");
        pv.Add(Convert.ToInt64(UserID));

        pa.Add("@RoomID");
        pv.Add(Convert.ToInt64(RoomID));

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@Comments");
        pv.Add(Comments);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<propertyDetails> GetUniquePropertyCode()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(20);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<propertyDetails> listProjDet = new List<propertyDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            propertyDetails ind = new propertyDetails();
            ind.Code = dt.Rows[i]["Code"].ToString();
            listProjDet.Add(ind);
        }

        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<propertyDetails> GetUniqueBlockCode()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(21);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<propertyDetails> listProjDet = new List<propertyDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            propertyDetails ind = new propertyDetails();
            ind.BlockCode = dt.Rows[i]["BlockCode"].ToString();
            listProjDet.Add(ind);
        }

        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<propertyDetails> GetUniqueFloorCode()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(22);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<propertyDetails> listProjDet = new List<propertyDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            propertyDetails ind = new propertyDetails();
            ind.FloorCode = dt.Rows[i]["FloorCode"].ToString();
            listProjDet.Add(ind);
        }

        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<propertyDetails> GetUniqueUnitCode()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(23);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<propertyDetails> listProjDet = new List<propertyDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            propertyDetails ind = new propertyDetails();
            ind.RoomCode = dt.Rows[i]["RoomCode"].ToString();
            listProjDet.Add(ind);
        }

        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Workorder> GetAllWOuderUnits(string RequestID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(26);

        pa.Add("@RequestID");
        pv.Add(RequestID);
       


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<Workorder> listProjDet = new List<Workorder>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Workorder ind = new Workorder();
            ind.WorkOrderID = dt.Rows[i]["WorkOrderID"].ToString();
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            ind.AssignedTo = dt.Rows[i]["AssignedTo"].ToString();
            ind.CostAllocation = dt.Rows[i]["CostAllocation"].ToString();
            ind.DueDate = dt.Rows[i]["DueDate"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.Description = dt.Rows[i]["Description"].ToString();

            //ind.MoveInStage1Approvel = dt.Rows[i]["MoveInStage1Approvel"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WOproblems> GetAllWOproblemList(string RequestID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(27);

        pa.Add("@RequestID");
        pv.Add(RequestID);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<WOproblems> listProjDet = new List<WOproblems>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            WOproblems ind = new WOproblems();
            ind.WorkOrderID = dt.Rows[i]["WorkOrderID"].ToString();

            ind.Description = dt.Rows[i]["Description"].ToString();

            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Dailysummary> GetDailySummaryWOSummary(string RequestID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(28);

        pa.Add("@RequestID");
        pv.Add(RequestID);


        DBH.CreateDatasetFM_Data(ds, "sp_FMPropertysMaster", true, pa, pv);

        List<Dailysummary> listProjDet = new List<Dailysummary>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Dailysummary ind = new Dailysummary();
            ind.WorkOrderID = dt.Rows[i]["WorkOrderID"].ToString();
            ind.WorkDescription = dt.Rows[i]["WorkDescription"].ToString();
            ind.Date = dt.Rows[i]["Date"].ToString();
            ind.EmployeeName = dt.Rows[i]["EmployeeName"].ToString();
            ind.ManHourse = dt.Rows[i]["ManHourse"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    public class Dailysummary
    {
        public string WorkOrderID {  get; set; }    
        public string WorkDescription { get; set; }
        public string Date { get; set; }
        public string EmployeeName { get; set; }
        public string ManHourse { get; set; }

    }

    public class WOproblems
    {
        public string WorkOrderID { get; set; }

        public string Description { get; set; }
        public string CreatedDate { get; set; }

    }


    public class actionRequest
    {
        public string Role_Name { get; set; }
        public string UAliasName { get; set; }
        public string UpdatedDate { get; set; }
        public string Comments { get; set; }

        public string Status { get; set; }

    }
    public class contractdetails
    {
        public string ContractID { get; set; }
        public string ContractNo { get; set; }
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
       
    }

    public class UnitdetailsView
    {


        public string NoOfUnit { get; set; }
        public string NoOfFloor { get; set; }
        public string NoOfRoom { get; set; }
        public string Ownership { get; set; }

        public string UnitCategory { get; set; }
        public string ElectricityAccount { get; set; }
        public string ChillerAccount { get; set; }
        public string PropertyUsage { get; set; }

        public string PlotNumber { get; set; }

        
        public string RoomCode { get; set; }
        public string RoomName { get; set; }
        public string PropertyCode { get; set; }
        public string PropertyName { get; set; }

        public string BlockName { get; set; }

        public string FloorName { get; set; }
        public string Location { get; set; }
         public string Address { get; set; }
       
        public string BuildUpAreaSqFt { get; set; }
        public string BalconyAreaSqFt { get; set; }
       
        public string TotalAreaSqFt { get; set; }
        public string NoOfParking { get; set; }
        public string PremiseNo { get; set; }
        public string LandlordsName { get; set; }
        public string LandlordsPhone { get; set; }
        public string LandlordsEmail { get; set; }

        public string Type { get; set; }
    }

    public class propertyDetails
    {       
         public string PropId { get; set; }      

        public string Code { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }        
        public string Ownership { get; set; }
        public string PlotNumber { get; set; }

        public string NoOfUnit { get; set; }

        public string NoOfFloor { get; set; }
      
        public int NoOfRoom { get; set; }

         public string BlockCode { get; set; }

        public string FloorCode { get; set; }

        public string RoomCode { get; set; }



    }

    public class UnitDetails
    {
        public string RoomID { get; set; }
        public string RoomCode { get; set; }
        public string RoomName { get; set; }
        public string FloorName { get; set; }
        public string BlockName { get; set; }
        public string Capacity { get; set; }
        //public string MinRent { get; set; }
        //public string MaxRent { get; set; }
        public string BuildUpAreaSqFt { get; set; }
        public string BalconyAreaSqFt { get; set; }
        public string TotalAreaSqFt { get; set; }
        


    }
    public class allFloorddl
    {
        public string FloorID { get; set; }

        public string FloorCode { get; set; }
        public string Description { get; set; }

        public string FloorName { get; set; }
    }
    public class AllBlockddl
    {
        public string BlockID { get; set; }

        public string BlockCode { get; set; }

        public string BlockName { get; set; }

        public string Location { get; set; }
    }

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }



    public class Workorder
    {
        public string Id { get; set; }
        public string RequestID { get; set; }
        public string PropertyName { get; set; }
        public string RequestedBy { get; set; }
        public string Category { get; set; }
        public string Priority { get; set; }

        public string RequestFor { get; set; }
        public string Description { get; set; }
        public string DueDate { get; set; }

        public string WorkOrderID { get; set; }
        public string AssignedTo { get; set; }
        public string CostAllocation { get; set; }

        public string Status { get; set; }
    }

    public class Allpropertyddl
    {
        public string Pid { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public string Address { get; set; }

        public string PlotNumber { get; set; }

    }

}