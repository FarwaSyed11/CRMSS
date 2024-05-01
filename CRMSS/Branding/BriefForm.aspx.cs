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

public partial class Branding_BriefForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 20;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetRefNumb()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");







        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }

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
        pv.Add(0);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TODO_Project", true, pa, pv);

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
    public static string SetBasicDet(string RefNo, string EventName, string Venue, string DAteFrom, string DateTo, string Length, string Width, string Height, string HallAndStandNo, string BuildUpDate, string Deadline, string ContactPerson
                                      , string EmailAddress, string Organizers, string OrgContact, string User)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@RefNo");
        pv.Add(RefNo);

        pa.Add("@EventName");
        pv.Add(EventName);

        pa.Add("@venue");
        pv.Add(Venue);

        pa.Add("@ShowFromDate");
        pv.Add(DAteFrom);

        pa.Add("@ShowToDate");
        pv.Add(DateTo);

        pa.Add("@Length");
        pv.Add(Length);

        pa.Add("@Width");
        pv.Add(Width);

        pa.Add("@Height");
        pv.Add(Height);

        pa.Add("@HallAndStandNo");
        pv.Add(HallAndStandNo);

        pa.Add("@BuildUpDate");
        pv.Add(BuildUpDate);

        pa.Add("@DeadlineDate");
        pv.Add(Deadline);

        pa.Add("@ContactPerson");
        pv.Add(ContactPerson);

        pa.Add("@EmailAddress");
        pv.Add(EmailAddress);

        pa.Add("@organizers");
        pv.Add(Organizers);

        pa.Add("@OrgContactDet");
        pv.Add(OrgContact);

        pa.Add("@userId");
        pv.Add(User);


        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<BasicDetails> GetTableBasicDetails(string UserId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@userId");
        pv.Add(UserId);




        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

        List<BasicDetails> listProjDet = new List<BasicDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            BasicDetails ind = new BasicDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.ReferenceNumb = dt.Rows[i]["ReferenceNumb"].ToString();
            ind.EventName = dt.Rows[i]["EventName"].ToString();
            ind.Venue = dt.Rows[i]["Venue"].ToString();
            ind.ShowDateFrom = dt.Rows[i]["ShowDateFrom"].ToString();
            ind.ShowDateTo = dt.Rows[i]["ShowDateTo"].ToString();
            ind.HallAndStandNumb = dt.Rows[i]["HallAndStandNumb"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.StatusClass = dt.Rows[i]["StatusClass"].ToString();
            ind.RoleID = dt.Rows[i]["RoleID"].ToString();







            listProjDet.Add(ind);
        }


        return listProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<BasicDetails> GetEventBasicDetails(string User, string EventId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@Id");
        pv.Add(EventId);




        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

        List<BasicDetails> listProjDet = new List<BasicDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            BasicDetails ind = new BasicDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.ReferenceNumb = dt.Rows[i]["ReferenceNumb"].ToString();
            ind.EventName = dt.Rows[i]["EventName"].ToString();
            ind.Venue = dt.Rows[i]["Venue"].ToString();
            ind.ShowDateFrom = dt.Rows[i]["ShowDateFrom"].ToString();
            ind.ShowDateTo = dt.Rows[i]["ShowDateTo"].ToString();
            ind.HallAndStandNumb = dt.Rows[i]["HallAndStandNumb"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();

            ind.Length = dt.Rows[i]["Length"].ToString();
            ind.Width = dt.Rows[i]["Width"].ToString();
            ind.Height = dt.Rows[i]["Height"].ToString();
            ind.BuildUpDate = dt.Rows[i]["BuildUpDate"].ToString();
            ind.DesignDeadline = dt.Rows[i]["DesignDeadline"].ToString();
            ind.ContactPerson = dt.Rows[i]["ContactPerson"].ToString();
            ind.EmailAddress = dt.Rows[i]["EmailAddress"].ToString();
            ind.Organizers = dt.Rows[i]["Organizers"].ToString();
            ind.OrganizersContactDetails = dt.Rows[i]["OrganizersContactDetails"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();







            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetStdDesignInfo(string EventId, string CarpetColor, string GlassUnderLF, string WoodenParquet, string WoodLF, string CombOfWAndG, string FPComments, string NumbOfCounters, string Storage, string BarStoolForC, string RAComments, string Vip, string TotallyClosedArea
                                      , string SemiClosedArea, string OpenArea, string CoffeTable, string BarStool, string Chairs, string Sofa, string MAComments,
                                       string NumbOfTv, string NumbOfLaptop, string VideoWall, string SpecialElement, string NumbOfWorkStation, string NumbOfTvScreen, string WSComments, string ASComments, string NumbOfPodium, string NumbOfDisplayStand, string NumbOfBouchR, string StorageRoom, string NumbOfShelves,
                                        string Modern, string HiTech, string Heritage, string Traditional, string Classic, string Corporate, string HangingStructure, string ThemeStyleComments, string AppMinimum, string AppMaximum, string LISpendOnStandCons,
                                         string Catalogue, string GiftItem, string CAFComments, string EmailSignature, string SocialMediaPost, string InvitEmailToClient, string DPComments)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@Id");
        pv.Add(EventId);

        pa.Add("@CarpetColor");
        pv.Add(CarpetColor);

        pa.Add("@GlassUnderF");
        pv.Add(GlassUnderLF);

        pa.Add("@WoodenParquet");
        pv.Add(WoodenParquet);

        pa.Add("@WoodLF");
        pv.Add(WoodLF);

        pa.Add("@CombOfWAndG");
        pv.Add(CombOfWAndG);

        pa.Add("@FPComment");
        pv.Add(FPComments);

        pa.Add("@NumberOfCounters");
        pv.Add(NumbOfCounters);

        pa.Add("@Storage");
        pv.Add(Storage);

        pa.Add("@BarStollForC");
        pv.Add(BarStoolForC);

        pa.Add("@RAComments");
        pv.Add(RAComments);

        pa.Add("@VIP");
        pv.Add(Vip);

        pa.Add("@TotallyClosedArea");
        pv.Add(TotallyClosedArea);

        pa.Add("@SemiClosedArea");
        pv.Add(SemiClosedArea);

        pa.Add("@OpenArea");
        pv.Add(OpenArea);

        pa.Add("@CoffeTable");
        pv.Add(CoffeTable);

        pa.Add("@BarStool");
        pv.Add(BarStool);

        pa.Add("@Chairs");
        pv.Add(Chairs);

        pa.Add("@Sofa");
        pv.Add(Sofa);

        pa.Add("@MAComments");
        pv.Add(MAComments);

        pa.Add("@NumberOfTv");
        pv.Add(NumbOfTv);

        pa.Add("@NumbOfLaptop");
        pv.Add(NumbOfLaptop);

        pa.Add("@VideoWall");
        pv.Add(VideoWall);

        pa.Add("@SpecialElement");
        pv.Add(SpecialElement);

        pa.Add("@NumbOfWorkStatation");
        pv.Add(NumbOfWorkStation);

        pa.Add("@NumbOfTvScreens");
        pv.Add(NumbOfTvScreen);

        pa.Add("@ASComment");
        pv.Add(ASComments);

        pa.Add("@WSComments");
        pv.Add(WSComments);

        pa.Add("@NumbOfPodium");
        pv.Add(NumbOfPodium);

        pa.Add("@NumbOfDisplayStand");
        pv.Add(NumbOfDisplayStand);

        pa.Add("@NumbOfBouchR");
        pv.Add(NumbOfBouchR);

        pa.Add("@StorageRoom");
        pv.Add(StorageRoom);

        pa.Add("@NumbOfShelves");
        pv.Add(NumbOfShelves);

        pa.Add("@Modern");
        pv.Add(Modern);

        pa.Add("@HiTech");
        pv.Add(HiTech);

        pa.Add("@Heritage");
        pv.Add(Heritage);

        pa.Add("@Traditional");
        pv.Add(Traditional);

        pa.Add("@Classic");
        pv.Add(Classic);

        pa.Add("@Corporate");
        pv.Add(Corporate);

        pa.Add("@HangingStructure");
        pv.Add(HangingStructure);

        pa.Add("@ThemeStyleComment");
        pv.Add(ThemeStyleComments);

        pa.Add("@ApproxMinimum");
        pv.Add(AppMinimum);

        pa.Add("@ApproxMaximum");
        pv.Add(AppMaximum);

        pa.Add("@LYSpentOnStandConstr");
        pv.Add(LISpendOnStandCons);

        pa.Add("@Catelogue");
        pv.Add(Catalogue);

        pa.Add("@GiftItems");
        pv.Add(GiftItem);

        pa.Add("@CAFComments");
        pv.Add(CAFComments);

        pa.Add("@EmailSignature");
        pv.Add(EmailSignature);

        pa.Add("@SocialMediaPost");
        pv.Add(SocialMediaPost);

        pa.Add("@InviteEmailToClient");
        pv.Add(InvitEmailToClient);

        pa.Add("@DPComments");
        pv.Add(DPComments);


        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);



    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EventFormDetails> GetEventSDFormDet(string EventId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(5);


        pa.Add("@Id");
        pv.Add(EventId);




        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

        List<EventFormDetails> listProjDet = new List<EventFormDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            EventFormDetails ind = new EventFormDetails();
           
            ind.CarpetColor = dt.Rows[i]["CarpetColour"].ToString();
            ind.GlassUnderLF = dt.Rows[i]["GlassUnderLitFlooring"].ToString();
            ind.WoodenParquet = dt.Rows[i]["WoodenParuet"].ToString();
            ind.WoodLF = dt.Rows[i]["WoodLaminatedFlooring"].ToString();
            ind.CombOfWAndG = dt.Rows[i]["CombOfGlassAndWood"].ToString();
            ind.FPComments = dt.Rows[i]["FlooringPreferenceComment"].ToString();
            ind.NumbOfCounters = dt.Rows[i]["NumbOfCounters"].ToString();
            ind.Storage = dt.Rows[i]["ReceptionStorage"].ToString();

            ind.BarStoolForC = dt.Rows[i]["BarStoolForCounters"].ToString();
            ind.RAComments = dt.Rows[i]["ReceptionAreaComments"].ToString();
            ind.Vip = dt.Rows[i]["Vip"].ToString();
            ind.TotallyClosedArea = dt.Rows[i]["TotallyClosedArea"].ToString();
            ind.SemiClosedArea = dt.Rows[i]["SemiClosedArea"].ToString();
            ind.OpenArea = dt.Rows[i]["OpenArea"].ToString();
            ind.CoffeTable = dt.Rows[i]["CoffeeTable"].ToString();
            ind.BarStool = dt.Rows[i]["BarStool"].ToString();
            ind.Chairs = dt.Rows[i]["Chairs"].ToString();

            ind.Sofa = dt.Rows[i]["Sofa"].ToString();
            ind.MAComments = dt.Rows[i]["MeetingAreaComments"].ToString();
            ind.NumbOfTv = dt.Rows[i]["NumbOfTvWithSize"].ToString();
            ind.NumbOfLaptop = dt.Rows[i]["NumbOfLaptop"].ToString();
            ind.VideoWall = dt.Rows[i]["VideoWall"].ToString();
            ind.SpecialElement = dt.Rows[i]["SpecialElement"].ToString();
            ind.NumbOfWorkStation = dt.Rows[i]["NumbOfWorkStation"].ToString();
            ind.NumbOfTvScreen = dt.Rows[i]["NumbOfTvScreens"].ToString();
            ind.WSComments = dt.Rows[i]["WorkStationComments"].ToString();

            ind.ASComments = dt.Rows[i]["AudioVisualComments"].ToString();
            ind.NumbOfPodium = dt.Rows[i]["NumbOfPodium"].ToString();
            ind.NumbOfDisplayStand = dt.Rows[i]["NumbOfDisplayStands"].ToString();
            ind.NumbOfBouchR = dt.Rows[i]["NumbOfBrochureRacks"].ToString();
            ind.StorageRoom = dt.Rows[i]["StorageRoom"].ToString();
            ind.NumbOfShelves = dt.Rows[i]["NumbOfShelves"].ToString();
            ind.Modern = dt.Rows[i]["Modern"].ToString();
            ind.HiTech = dt.Rows[i]["HiTech"].ToString();
            ind.Heritage = dt.Rows[i]["Heritage"].ToString();

            ind.Traditional = dt.Rows[i]["Traditional"].ToString();
            ind.Classic = dt.Rows[i]["Classic"].ToString();
            ind.Corporate = dt.Rows[i]["Corporate"].ToString();
            ind.HangingStructure = dt.Rows[i]["HangingStructure"].ToString();
            ind.ThemeStyleComments = dt.Rows[i]["ThemeStyleComments"].ToString();
            ind.AppMinimum = dt.Rows[i]["ApproxMinimum"].ToString();
            ind.AppMaximum = dt.Rows[i]["ApproxMaximum"].ToString();
            ind.LISpendOnStandCons = dt.Rows[i]["LastYearSpentOnStandConstruction"].ToString();
            ind.Catalogue = dt.Rows[i]["Catalogues"].ToString();

            ind.GiftItem = dt.Rows[i]["GiftItems"].ToString();
            ind.CAFComments = dt.Rows[i]["CateloguesComments"].ToString();
            ind.EmailSignature = dt.Rows[i]["EmailerSignature"].ToString();
            ind.SocialMediaPost = dt.Rows[i]["SocialMediaPost"].ToString();
            ind.InvitEmailToClient = dt.Rows[i]["InvitationEmailerToClients"].ToString();
            ind.DPComments = dt.Rows[i]["DigitalPresenceComments"].ToString();
          







            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetProductDetails(string User, string EventId, string ProductName, string Remarks, string RefNo)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(6);
            
        pa.Add("@Id");
        pv.Add(Convert.ToInt64(EventId));

        pa.Add("@ProductName");
        pv.Add(ProductName);

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@RefNo");
        pv.Add(RefNo);

        pa.Add("@userId");
        pv.Add(User);






        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

      

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProductDet> GetProductDetails(string User, string EventId,string RefNo)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@Id");
        pv.Add(EventId);

        pa.Add("@RefNo");
        pv.Add(RefNo);

        pa.Add("@userId");
        pv.Add(User);






        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

        List<ProductDet> listProjDet = new List<ProductDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProductDet ind = new ProductDet();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.ProductName = dt.Rows[i]["ProductName"].ToString();
            ind.Comments = dt.Rows[i]["Comments"].ToString();




            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetItemOrDescrp(string User, string EventId, string ItemOrDesc, string Width, string RefNo,string Length,string Height,string Weight,string Remarks,string ElectricalRequirement)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@Id");
        pv.Add(Convert.ToInt64(EventId));

        pa.Add("@ItemOrDesc");
        pv.Add(ItemOrDesc);

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@RefNo");
        pv.Add(RefNo);

        pa.Add("@Width");
        pv.Add(Width);

        pa.Add("@Length");
        pv.Add(Length);

        pa.Add("@Height");
        pv.Add(Height);

        pa.Add("@Weight");
        pv.Add(Weight);

        pa.Add("@electricalRequirements");
        pv.Add(ElectricalRequirement);

        pa.Add("@userId");
        pv.Add(User);







        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);



    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProductDet> GetItemDescr(string User, string EventId, string RefNo)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@Id");
        pv.Add(EventId);

        pa.Add("@RefNo");
        pv.Add(RefNo);

        pa.Add("@userId");
        pv.Add(User);






        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

        List<ProductDet> listProjDet = new List<ProductDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProductDet ind = new ProductDet();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.ItemOrDescription = dt.Rows[i]["ItemOrDescription"].ToString();
            ind.Width = dt.Rows[i]["Width"].ToString();
            ind.Length = dt.Rows[i]["Length"].ToString();
            ind.Height = dt.Rows[i]["Height"].ToString();
            ind.Weight = dt.Rows[i]["Weight"].ToString();
            ind.ElectricalRequirement = dt.Rows[i]["ElectricalRequirement"].ToString();
            ind.Remarks = dt.Rows[i]["Remarks"].ToString();
           




            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetExpectedBudget(string User, string EventId, string RefNo,string StandCost,string SpaceRental,string Electricity,string Rigging,string Internet,string AACOthers,
                                         string sponsership,string MagazineOrAd,string OnSiteBranding,string Technology,string Entertainment,string catalogues,string GiftItems,string MACOthers,
                                         string Visa,string AirFare,string Logistic,string VTEOthers,
                                         string MealAndTransp,string PantryMet,string FlowersEtc,string OEOthers)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(10);

        pa.Add("@Id");
        pv.Add(Convert.ToInt64(EventId));
       
        pa.Add("@RefNo");
        pv.Add(RefNo);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@ExpectStandCost");
        pv.Add(StandCost);

        pa.Add("@ExpectSpaceRental");
        pv.Add(SpaceRental);

        pa.Add("@ExpectElectricity");
        pv.Add(Electricity);

        pa.Add("@ExpectRigging");
        pv.Add(Rigging);

        pa.Add("@ExpectInternet");
        pv.Add(Internet);

        pa.Add("@ExpectSSCOthers");
        pv.Add(AACOthers);

        pa.Add("@ExpectSponsership");
        pv.Add(sponsership);

        pa.Add("@ExpectMagazineOrDAd");
        pv.Add(MagazineOrAd);

        pa.Add("@ExpectOnsiteBranding");
        pv.Add(OnSiteBranding);

        pa.Add("@ExpectTechnology");
        pv.Add(Technology);

        pa.Add("@ExpectEntertainment");
        pv.Add(Entertainment);

        pa.Add("@ExpectCatelogues");
        pv.Add(catalogues);

        pa.Add("@ExpectGiftItems");
        pv.Add(GiftItems);

        pa.Add("@ExpectMACOthers");
        pv.Add(MACOthers);

        pa.Add("@ExpectVisa");
        pv.Add(Visa);

        pa.Add("@ExpectAirFare");
        pv.Add(AirFare);

        pa.Add("@ExpectLogistic");
        pv.Add(Logistic);

        pa.Add("@ExpectVTEOthers");
        pv.Add(VTEOthers);

        pa.Add("@ExpectMealAndTransp");
        pv.Add(MealAndTransp);

        pa.Add("@ExpectPantryMet");
        pv.Add(PantryMet);

        pa.Add("@ExpectFlowersEtc");
        pv.Add(FlowersEtc);

        pa.Add("@ExpectOXOthers");
        pv.Add(OEOthers);

      






        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);



    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<budgetDet> GetBudgetDet(string EventId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(12);


        pa.Add("@Id");
        pv.Add(EventId);




        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

        List<budgetDet> listProjDet = new List<budgetDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            budgetDet ind = new budgetDet();

            ind.ExpectStandCost = dt.Rows[i]["ExpectStandCost"].ToString();
            ind.ExpectSpaceRental = dt.Rows[i]["ExpectSpaceRental"].ToString();
            ind.ExpectElectricity = dt.Rows[i]["ExpectElectricity"].ToString();
            ind.ExpectRigging = dt.Rows[i]["ExpectRigging"].ToString();
            ind.ExpectInternet = dt.Rows[i]["ExpectInternet"].ToString();
            ind.ExpectSpaceAndStandOthers = dt.Rows[i]["ExpectSpaceAndStandOthers"].ToString();

            ind.ExpectSponsership = dt.Rows[i]["ExpectSponsership"].ToString();
            ind.ExpectMagazineOrDirectoryAd = dt.Rows[i]["ExpectMagazineOrDirectoryAd"].ToString();
            ind.ExpectOnSiteBranding = dt.Rows[i]["ExpectOnSiteBranding"].ToString();
            ind.ExpectTechnology = dt.Rows[i]["ExpectTechnology"].ToString();
            ind.ExpectEntertainment = dt.Rows[i]["ExpectEntertainment"].ToString();
            ind.Expectcatalogues = dt.Rows[i]["Expectcatalogues"].ToString();
            ind.ExpectGiftItems = dt.Rows[i]["ExpectGiftItems"].ToString();
            ind.ExpectMarketingOrAdOthers = dt.Rows[i]["ExpectMarketingOrAdOthers"].ToString();

            ind.ExpectVisa = dt.Rows[i]["ExpectVisa"].ToString();
            ind.ExpectAirFare = dt.Rows[i]["ExpectAirFare"].ToString();
            ind.ExpectLogistic = dt.Rows[i]["ExpectLogistic"].ToString();
            ind.ExpectVisaAndTravelOthers = dt.Rows[i]["ExpectVisaAndTravelOthers"].ToString();

            ind.ExpectMealAndTrasportation = dt.Rows[i]["ExpectMealAndTrasportation"].ToString();
            ind.ExpectPentryMaterials = dt.Rows[i]["ExpectPentryMaterials"].ToString();
            ind.ExpectFlowersEtc = dt.Rows[i]["ExpectFlowersEtc"].ToString();
            ind.ExpectOperationsExpenceOthers = dt.Rows[i]["ExpectOperationsExpenceOthers"].ToString();

            ind.ActualStandCost = dt.Rows[i]["ActualStandCost"].ToString();
            ind.ActualSpaceRental = dt.Rows[i]["ActualSpaceRental"].ToString();
            ind.ActualElectricity = dt.Rows[i]["ActualElectricity"].ToString();
            ind.ActualRigging = dt.Rows[i]["ActualRigging"].ToString();
            ind.ActualInternet = dt.Rows[i]["ActualInternet"].ToString();
            ind.ActualSpaceAndStandOthers = dt.Rows[i]["ActualSpaceAndStandOthers"].ToString();

            ind.ActualSponsership = dt.Rows[i]["ActualSponsership"].ToString();
            ind.ActualMagazineOrDirectoryAd = dt.Rows[i]["ActualMagazineOrDirectoryAd"].ToString();
            ind.ActualOnSiteBranding = dt.Rows[i]["ActualOnSiteBranding"].ToString();
            ind.ActualTechnology = dt.Rows[i]["ActualTechnology"].ToString();
            ind.ActualEntertainment = dt.Rows[i]["ActualEntertainment"].ToString();
            ind.Actualcatalogues = dt.Rows[i]["Actualcatalogues"].ToString();
            ind.ActualGiftItems = dt.Rows[i]["ActualGiftItems"].ToString();
            ind.ActualMarketingOrAdOthers = dt.Rows[i]["ActualMarketingOrAdOthers"].ToString();

            ind.ActualVisa = dt.Rows[i]["ActualVisa"].ToString();
            ind.ActualAirFare = dt.Rows[i]["ActualAirFare"].ToString();
            ind.ActualLogistic = dt.Rows[i]["ActualLogistic"].ToString();
            ind.ActualVisaAndTravelOthers = dt.Rows[i]["ActualVisaAndTravelOthers"].ToString();

            ind.ActualMealAndTrasportation = dt.Rows[i]["ActualMealAndTrasportation"].ToString();
            ind.ActualPentryMaterials = dt.Rows[i]["ActualPentryMaterials"].ToString();
            ind.ActualFlowersEtc = dt.Rows[i]["ActualFlowersEtc"].ToString();
            ind.ActualOperationsExpenceOthers = dt.Rows[i]["ActualOperationsExpenceOthers"].ToString();



            ind.ExpectSpaceAndStandTotal = dt.Rows[i]["ExpectSpaceAndStandTotal"].ToString();
            ind.ExpectMarketingOrAdTotal = dt.Rows[i]["ExpectMarketingOrAdTotal"].ToString();
            ind.ExpectVisaAndTravelTotal = dt.Rows[i]["ExpectVisaAndTravelTotal"].ToString();
            ind.ExpectOperationExpenceTotal = dt.Rows[i]["ExpectOperationExpenceTotal"].ToString();

            ind.ActualSpaceAndStandTotal = dt.Rows[i]["ActualSpaceAndStandTotal"].ToString();
            ind.ActualMarketingOrAdTotal = dt.Rows[i]["ActualMarketingOrAdTotal"].ToString();
            ind.ActualVisaAndTravelTotal = dt.Rows[i]["ActualVisaAndTravelTotal"].ToString();
            ind.ActualOperationExpenceTotal = dt.Rows[i]["ActualOperationExpenceTotal"].ToString();


            ind.ExpectedGrandTotal = dt.Rows[i]["ExpectedGrandTotal"].ToString();
            ind.ActualGrandTotal = dt.Rows[i]["ActualGrandTotal"].ToString();





            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static void SetActualBudget(string User, string EventId, string RefNo, string StandCost, string SpaceRental, string Electricity, string Rigging, string Internet, string AACOthers,
                                        string sponsership, string MagazineOrAd, string OnSiteBranding, string Technology, string Entertainment, string catalogues, string GiftItems, string MACOthers,
                                        string Visa, string AirFare, string Logistic, string VTEOthers,
                                        string MealAndTransp, string PantryMet, string FlowersEtc, string OEOthers)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(11);

        pa.Add("@Id");
        pv.Add(Convert.ToInt64(EventId));

        pa.Add("@RefNo");
        pv.Add(RefNo);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@ActualStandCost");
        pv.Add(StandCost);

        pa.Add("@ActualSpaceRental");
        pv.Add(SpaceRental);

        pa.Add("@ActualElectricity");
        pv.Add(Electricity);

        pa.Add("@ActualRigging");
        pv.Add(Rigging);

        pa.Add("@ActualInternet");
        pv.Add(Internet);

        pa.Add("@ActualSSCOthers");
        pv.Add(AACOthers);

        pa.Add("@ActualSponsership");
        pv.Add(sponsership);

        pa.Add("@ActualMagazineOrDAd");
        pv.Add(MagazineOrAd);

        pa.Add("@ActualOnsiteBranding");
        pv.Add(OnSiteBranding);

        pa.Add("@ActualTechnology");
        pv.Add(Technology);

        pa.Add("@ActualEntertainment");
        pv.Add(Entertainment);

        pa.Add("@ActualCatelogues");
        pv.Add(catalogues);

        pa.Add("@ActualGiftItems");
        pv.Add(GiftItems);

        pa.Add("@ActualMACOthers");
        pv.Add(MACOthers);

        pa.Add("@ActualVisa");
        pv.Add(Visa);

        pa.Add("@ActualAirFare");
        pv.Add(AirFare);

        pa.Add("@ActualLogistic");
        pv.Add(Logistic);

        pa.Add("@ActualVTEOthers");
        pv.Add(VTEOthers);

        pa.Add("@ActualMealAndTransp");
        pv.Add(MealAndTransp);

        pa.Add("@ActualPantryMet");
        pv.Add(PantryMet);

        pa.Add("@ActualFlowersEtc");
        pv.Add(FlowersEtc);

        pa.Add("@ActualOXOthers");
        pv.Add(OEOthers);








        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetSubmitValidation(string EventId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(13);

        pa.Add("@Id");
        pv.Add(Convert.ToInt64(EventId));

       

        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);


        return ds.Tables[0].Rows[0][0].ToString();


    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string SubmitReq(string EventId,string User)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(14);

        pa.Add("@Id");
        pv.Add(Convert.ToInt64(EventId));

        pa.Add("@userId");
        pv.Add(User);


        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);


        return ds.Tables[0].Rows[0][0].ToString();


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<StatusHistory> GetStatusHistory(string EventId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(15);

        pa.Add("@Id");
        pv.Add(EventId);

       





        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

        List<StatusHistory> listProjDet = new List<StatusHistory>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            StatusHistory ind = new StatusHistory();
            ind.stage = dt.Rows[i]["stage"].ToString();
            ind.status = dt.Rows[i]["status"].ToString();
            ind.StatusClasss = dt.Rows[i]["StatusClasss"].ToString();




            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetReqAccess(string EventId, string RoleId,string User)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(16);

        pa.Add("@Id");
        pv.Add(Convert.ToInt64(EventId));

        pa.Add("@ReqRoleID");
        pv.Add(RoleId);

        pa.Add("@userId");
        pv.Add(User);


        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

        if (ds.Tables[0].Rows.Count >0)
        { 
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return null;
        }



    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetActions(string EventId, string RoleId, string User,string status)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(17);

        pa.Add("@Id");
        pv.Add(Convert.ToInt64(EventId));

        pa.Add("@ReqRoleID");
        pv.Add(RoleId);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@WorkFlowAction");
        pv.Add(status);


        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);


        


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<StatusHistory> GetApprovalStatus(string EventId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(18);

        pa.Add("@Id");
        pv.Add(EventId);







        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

        List<StatusHistory> listProjDet = new List<StatusHistory>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            StatusHistory ind = new StatusHistory();
            ind.Role = dt.Rows[i]["Role"].ToString();
            ind.User = dt.Rows[i]["User"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.UpdatedOn = dt.Rows[i]["UpdatedOn"].ToString();
            ind.Statusclass = dt.Rows[i]["Statusclass"].ToString();
          




            listProjDet.Add(ind);
        }


        return listProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddAttendees(string RefNo, string BrandMasterId, string AttendeesEmpNos)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(19);

        pa.Add("@RefNo");
        pv.Add(RefNo);

        pa.Add("@Id");
        pv.Add(BrandMasterId);

        pa.Add("@selEmpNos");
        pv.Add(AttendeesEmpNos);

        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);
        
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Attendees> GetAttendees(string BrandMasterId)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(20);

        pa.Add("@Id");
        pv.Add(BrandMasterId);

        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

        List<Attendees> listAtt = new List<Attendees>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                listAtt.Add(new Attendees
                {
                    EmpName = dt.Rows[i]["EmpName"].ToString(),
                    BrandId = dt.Rows[i]["BrandingMasterId"].ToString(),
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    Id = dt.Rows[i]["Id"].ToString(),
                    RefNo = dt.Rows[i]["ReferenceNumb"].ToString()
                });
            }
        }
        return listAtt;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Template> TemplateDet(string UserId,string EventId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(24);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@Id");
        pv.Add(EventId);




        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

        List<Template> listProjDet = new List<Template>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Template ind = new Template();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.Description = dt.Rows[i]["Description"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.Url = dt.Rows[i]["Url"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.CheckClass = dt.Rows[i]["CheckClass"].ToString();
            ind.Selected = dt.Rows[i]["Selected"].ToString();







            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateTemplateId(string TempId,string EventId)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(25);


        pa.Add("@TempId");
        pv.Add(Convert.ToInt64(TempId));

        pa.Add("@Id");
        pv.Add(Convert.ToInt64(EventId));



        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

    }


    //classes
    public class Template
    {
        public string Id { get; set; }
        public string Description { get; set; }
        public string FileName { get; set; }
        public string Url { get; set; }
        public string Status { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string CheckClass { get; set; }
        public string Selected { get; set; }





    }
    public class Attendees {
        public string Id { get; set; }
        public string BrandId { get; set; }
        public string RefNo { get; set; }
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
    }

    public class StatusHistory
    {
        public string stage { get; set; }
        public string status { get; set; }
        public string StatusClasss { get; set; }

        public string Role { get; set; }
        public string User { get; set; }
        public string Status { get; set; }
        public string UpdatedOn { get; set; }
        public string Statusclass { get; set; }
    }

    public class ProductDet
    {

        public string ProductName { get; set; }
        public string Comments { get; set; }
        public string Id { get; set; }
        public string ItemOrDescription { get; set; }
        public string Width { get; set; }
        public string Length { get; set; }
        public string Height { get; set; }
        public string Weight { get; set; }
        public string ElectricalRequirement { get; set; }
        public string Remarks { get; set; }
        //public string Venue { get; set; }

        //public string ShowDateFrom { get; set; }
    }

    public class BasicDetails
    {
        public string Id { get; set; }
        public string ReferenceNumb { get; set; }
        public string EventName { get; set; }
        public string Venue { get; set; }
        public string Status { get; set; }

        public string ShowDateFrom { get; set; }
        public string ShowDateTo { get; set; }
        public string Length { get; set; }
        public string Width { get; set; }
        public string Height { get; set; }
        public string HallAndStandNumb { get; set; }
        public string BuildUpDate { get; set; }

        public string DesignDeadline { get; set; }
        public string ContactPerson { get; set; }
        public string EmailAddress { get; set; }
        public string Organizers { get; set; }

        public string OrganizersContactDetails { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string StatusClass { get; set; }
        public string RoleID { get; set; }
        //public string Stage { get; set; }
        //public string Scope { get; set; }
        //public string QuotationType { get; set; }
        //public string WinPerc { get; set; }
        //public string Budget { get; set; }
        //public string DocumentLink { get; set; }
        //public string ContactName { get; set; }

        //public string QtnRefNumber { get; set; }
        //public string Calculation { get; set; }
        //public string OandM { get; set; }
        //public string Submittal { get; set; }
        //public string PreQualification { get; set; }
        //public string SpecialRequirements { get; set; }
        //public string City { get; set; }


    }

    public class EventFormDetails
    {
        public string EventId { set; get; }
        public string CarpetColor { set; get; }
        public string GlassUnderLF { set; get; }
        public string WoodenParquet { set; get; }
        public string WoodLF { set; get; }
        public string CombOfWAndG { set; get; }
        public string FPComments { set; get; }
        public string NumbOfCounters { set; get; }
        public string Storage { set; get; }
        public string BarStoolForC { set; get; }
        public string RAComments { set; get; }
        public string Vip { set; get; }
        public string TotallyClosedArea { set; get; }
        public string SemiClosedArea { set; get; }
        public string OpenArea { set; get; }
        public string CoffeTable { set; get; }
        public string BarStool { set; get; }
        public string Chairs { set; get; }
        public string Sofa { set; get; }
        public string MAComments { set; get; }
        public string NumbOfTv { set; get; }
        public string NumbOfLaptop { set; get; }
        public string VideoWall { set; get; }
        public string SpecialElement { set; get; }
        public string NumbOfWorkStation { set; get; }
        public string NumbOfTvScreen { set; get; }
        public string WSComments { set; get; }
        public string ASComments { set; get; }
        public string NumbOfPodium { set; get; }
        public string NumbOfDisplayStand { set; get; }
        public string NumbOfBouchR { set; get; }
        public string StorageRoom { set; get; }
        public string NumbOfShelves { set; get; }
        public string Modern { set; get; }
        public string HiTech { set; get; }
        public string Heritage { set; get; }
        public string Traditional { set; get; }
        public string Classic { set; get; }
        public string Corporate { set; get; }
        public string HangingStructure { set; get; }
        public string ThemeStyleComments { set; get; }
        public string AppMinimum { set; get; }
        public string AppMaximum { set; get; }
        public string LISpendOnStandCons { set; get; }
        public string Catalogue { set; get; }
        public string GiftItem { set; get; }
        public string CAFComments { set; get; }
        public string EmailSignature { set; get; }
        public string SocialMediaPost { set; get; }
        public string InvitEmailToClient { set; get; }
        public string DPComments { set; get; }

    }

    public class budgetDet
    {
        public string ExpectStandCost { set; get; }
        public string ExpectSpaceRental { set; get; }
        public string ExpectElectricity { set; get; }
        public string ExpectRigging { set; get; }
        public string ExpectInternet { set; get; }
        public string ExpectSpaceAndStandOthers { set; get; }
        public string ExpectSponsership { set; get; }
        public string ExpectMagazineOrDirectoryAd { set; get; }
        public string ExpectOnSiteBranding { set; get; }
        public string ExpectTechnology { set; get; }
        public string ExpectEntertainment { set; get; }
        public string Expectcatalogues { set; get; }
        public string ExpectGiftItems { set; get; }
        public string ExpectMarketingOrAdOthers { set; get; }
        public string ExpectVisa { set; get; }
        public string ExpectAirFare { set; get; }
        public string ExpectLogistic { set; get; }
        public string ExpectVisaAndTravelOthers { set; get; }
        public string ExpectMealAndTrasportation { set; get; }
        public string ExpectPentryMaterials { set; get; }
        public string ExpectFlowersEtc { set; get; }
        public string ExpectOperationsExpenceOthers { set; get; }
        public string ActualStandCost { set; get; }
        public string ActualSpaceRental { set; get; }
        public string ActualElectricity { set; get; }
        public string ActualRigging { set; get; }
        public string ActualInternet { set; get; }
        public string ActualSpaceAndStandOthers { set; get; }
        public string ActualSponsership { set; get; }
        public string ActualMagazineOrDirectoryAd { set; get; }
        public string ActualOnSiteBranding { set; get; }
        public string ActualTechnology { set; get; }
        public string ActualEntertainment { set; get; }
        public string Actualcatalogues { set; get; }
        public string ActualGiftItems { set; get; }
        public string ActualMarketingOrAdOthers { set; get; }
        public string ActualVisa { set; get; }
        public string ActualAirFare { set; get; }
        public string ActualLogistic { set; get; }
        public string ActualVisaAndTravelOthers { set; get; }
        public string ActualMealAndTrasportation { set; get; }
        public string ActualPentryMaterials { set; get; }
        public string ActualFlowersEtc { set; get; }
        public string ActualOperationsExpenceOthers { set; get; }

        public string ExpectSpaceAndStandTotal { set; get; }
        public string ExpectMarketingOrAdTotal { set; get; }
        public string ExpectVisaAndTravelTotal { set; get; }
        public string ExpectOperationExpenceTotal { set; get; }

        public string ActualSpaceAndStandTotal { set; get; }
        public string ActualMarketingOrAdTotal { set; get; }
        public string ActualVisaAndTravelTotal { set; get; }
        public string ActualOperationExpenceTotal { set; get; }

        public string ExpectedGrandTotal { set; get; }
        public string ActualGrandTotal { set; get; }

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