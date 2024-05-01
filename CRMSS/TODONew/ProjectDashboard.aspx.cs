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

public partial class TODONew_ProjectDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 17;
        //BindCompany();
        //BindManager();
        if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            hdnUserId.Value = UserId.ToString();
            hdnImagePath.Value = Session["EmpProPic"] == null ? "../Masters/assets/images/img_avatar.png" : Session["EmpProPic"].ToString();// "../Masters/assets/images/img_avatar.png";//Session["EmpProPic"].ToString();
            hdnEmpFullName.Value = Session["EmpName"].ToString();

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }


    //Purchase work starts from here
    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static DashboardBox GetStatusAndCounts(string FromDate, string ToDate, string TicketFor)
    //{

    //    DBHandler DBH = new DBHandler();
    //    DataSet ds = new DataSet();
    //    DataTable dt = new DataTable();
    //    ArrayList pa = new ArrayList();
    //    ArrayList pv = new ArrayList();

    //    pa.Add("@Oper");
    //    pv.Add(0);

    //    pa.Add("@FromDate");
    //    pv.Add(FromDate);

    //    pa.Add("@ToDate");
    //    pv.Add(ToDate);

    //    pa.Add("@TicketFor");
    //    pv.Add(TicketFor);

    //    DBH.CreateDatasetCRMEBSDATA(ds, "sp_Purchase_PR", true, pa, pv);

    //    List<CountAndValuesForBoxes> oWO = new List<CountAndValuesForBoxes>();
    //    List<CountAndValuesForBoxes> oWO1 = new List<CountAndValuesForBoxes>();
    //    List<CountAndValuesForBoxes> oWO2 = new List<CountAndValuesForBoxes>();
    //    List<CountAndValuesForBoxes> oWO3 = new List<CountAndValuesForBoxes>();

    //    dt = ds.Tables[0];

    //    for (int i = 0; i < dt.Rows.Count; i++)   //for up-right 8 boxes
    //    {
    //        oWO.Add(new CountAndValuesForBoxes()
    //        {
    //            Name = dt.Rows[i]["NAME"].ToString(),
    //            Count = dt.Rows[i]["COUNT"].ToString(),
    //            Value = dt.Rows[i]["TOTAL"].ToString()
    //        });
    //    }
    //    for (int i = 0; i < ds.Tables[1].Rows.Count; i++) //For bottom-left boxes, MOvement status boxes
    //    {
    //        oWO1.Add(new CountAndValuesForBoxes()
    //        {
    //            Name = ds.Tables[1].Rows[i]["NAME"].ToString(),
    //            Count = ds.Tables[1].Rows[i]["COUNT"].ToString(),
    //            Value = ds.Tables[1].Rows[i]["TOTAL"].ToString()
    //        });
    //    }

    //    for (int i = 0; i < ds.Tables[2].Rows.Count; i++)    // for Container statuses
    //    {
    //        oWO2.Add(new CountAndValuesForBoxes()
    //        {
    //            Name = ds.Tables[2].Rows[i]["NAME"].ToString(),
    //            Count = ds.Tables[2].Rows[i]["COUNT"].ToString()
    //        });
    //    }

    //    for (int i = 0; i < ds.Tables[3].Rows.Count; i++)   //for map, coming all contries
    //    {
    //        oWO3.Add(new CountAndValuesForBoxes()
    //        {
    //            Name = ds.Tables[3].Rows[i]["NAME"].ToString(),
    //            Count = ds.Tables[3].Rows[i]["COUNT"].ToString(),
    //            Value = ds.Tables[3].Rows[i]["TOTAL"].ToString(),
    //            Lat = ds.Tables[3].Rows[i]["Latitude"].ToString(),
    //            Lon = ds.Tables[3].Rows[i]["Longitude"].ToString()
    //        });
    //    }
    //    return new DashboardBox() { listTopRightbox = oWO, listMovementStatusesBoxes = oWO1, listContainerStatus = oWO2, listCountriesMap = oWO3 };
    //}
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static DashboardBox GetStatusAndCounts(string CreatedDate, string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);
               

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_EmpPerformDashboard", true, pa, pv);

        List<StatusNameAndCount> oWO = new List<StatusNameAndCount>();
        List<StatusNameAndCount> oWO1 = new List<StatusNameAndCount>();
        List<StatusNameAndCount> oWO2 = new List<StatusNameAndCount>();
        List<StatusNameAndCount> oWO3 = new List<StatusNameAndCount>();
        List<CountAndValuesForBoxes> oWO4 = new List<CountAndValuesForBoxes>();
        List<CountAndValuesForBoxes> oWO5 = new List<CountAndValuesForBoxes>();
        List<CountAndValuesForBoxes> oWO6 = new List<CountAndValuesForBoxes>();
        List<CountAndValuesForBoxes> oWO7 = new List<CountAndValuesForBoxes>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)   //for up-right 8 boxes
            {
                oWO.Add(new StatusNameAndCount()
                {
                    Name = dt.Rows[i]["StatusText"].ToString(),
                    Count = dt.Rows[i]["Count"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[1].Rows.Count; i++) //For Top-Right boxes, Incoterms
            {
                oWO1.Add(new StatusNameAndCount()
                {
                    Name = ds.Tables[1].Rows[i]["Text"].ToString(),
                    Count = ds.Tables[1].Rows[i]["Count"].ToString()
                });
            }

            //for (int i = 0; i < ds.Tables[2].Rows.Count; i++)    // Top 10 Vendors
            //{
            //    oWO2.Add(new StatusNameAndCount()
            //    {
            //        Name = ds.Tables[2].Rows[i]["VendorName"].ToString(),
            //        Count = ds.Tables[2].Rows[i]["Count"].ToString()
            //    });
            //}

            //for (int i = 0; i < ds.Tables[3].Rows.Count; i++)   //Get All buyers
            //{
            //    oWO3.Add(new StatusNameAndCount()
            //    {
            //        Name = ds.Tables[3].Rows[i]["BUYER_NAME"].ToString(),
            //        Count = ds.Tables[3].Rows[i]["Count"].ToString()
            //    });
            //}

            //for (int i = 0; i < ds.Tables[4].Rows.Count; i++)   //Get Count for open and Closed Value of PO
            //{
            //    oWO4.Add(new CountAndValuesForBoxes()
            //    {
            //        Name = ds.Tables[4].Rows[i]["Name"].ToString(),
            //        Count = ds.Tables[4].Rows[i]["Count"].ToString(),
            //        Value = ds.Tables[4].Rows[i]["Value"].ToString()
            //    });
            //}

            //for (int i = 0; i < ds.Tables[5].Rows.Count; i++)   //For Payment term
            //{

            //    oWO5.Add(new CountAndValuesForBoxes()
            //    {
            //        Name = ds.Tables[5].Rows[i]["Name"].ToString(),
            //        Value = ds.Tables[5].Rows[i]["Value"].ToString()
            //    });
            //}

            //for (int i = 0; i < ds.Tables[6].Rows.Count; i++)   //PO Count and Value on Item level
            //{
            //    oWO6.Add(new CountAndValuesForBoxes()
            //    {
            //        Name = ds.Tables[6].Rows[i]["Name"].ToString(),
            //        Count = ds.Tables[6].Rows[i]["Count"].ToString(),
            //        Value = ds.Tables[6].Rows[i]["Value"].ToString()
            //    });
            //}

            //for (int i = 0; i < ds.Tables[7].Rows.Count; i++)   //Top Ten Moving Items
            //{
            //    oWO7.Add(new CountAndValuesForBoxes()
            //    {
            //        Name = ds.Tables[7].Rows[i]["Name"].ToString(),
            //        Count = ds.Tables[7].Rows[i]["Count"].ToString()
            //    });
            //}
        }


        return new DashboardBox() { listStatusNCount = oWO, listIncoterms = oWO1, listTopVendors = oWO2, listBuyers = oWO3, listOpenClosedPO = oWO4, listPaymentTerm = oWO5, listPOItemLevel = oWO6, listTopRepeatItems = oWO7 };
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CountAndValuesForBoxes> GetAllBuyers(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        //pa.Add("@FromDate");
        //pv.Add(EmpNo);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_EmpPerformDashboard", true, pa, pv);

        List<CountAndValuesForBoxes> oWO = new List<CountAndValuesForBoxes>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)   //for up-right 8 boxes
            {
                oWO.Add(new CountAndValuesForBoxes()
                {
                    Name = dt.Rows[i]["EmpName"].ToString(),
                    Value = dt.Rows[i]["EmpNo"].ToString()
                });
            }

        }


        return oWO;
    }

    //end


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UserImageAndName> GetUserImage(string EmpNo)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        //pa.Add("@UserStatus");
        //pv.Add(userStatus);

        DBH.CreateDatasetPurchase(ds, "sp_Purchase_PO", true, pa, pv);

        List<UserImageAndName> UserlList = new List<UserImageAndName>();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                UserImageAndName UserDet = new UserImageAndName();
                UserDet.EmpName = dt.Rows[i]["EmpName"].ToString();
                UserDet.ImagePath = dt.Rows[i]["ImagePath"].ToString();
                UserDet.EmpID = dt.Rows[i]["EmpID"].ToString();

                UserlList.Add(UserDet);
            }
        }


        return UserlList;

    }

    //Classess
    public class StatusNameAndCount
    {
        public string Name { get; set; }
        public string Count { get; set; }
    }

    public class AgingDetails
    {
        public string Status { get; set; }
        public string PRHeaderId { get; set; }
        public string AgingDaysDiff { get; set; }
    }

    public class CountAndValuesForBoxes
    {
        public string Name { get; set; }
        public string Count { get; set; }
        public string Value { get; set; }

        public string Lat { get; set; }
        public string Lon { get; set; }
    }

    public class PaymentTerm
    {
        public string NotSpecified { get; set; }
        public string CAD { get; set; }
        public string CurrentCheque { get; set; }

        public string AdvancePay { get; set; }
        public string LC { get; set; }
        public string OpenCredit { get; set; }
    }
    public class UserImageAndName
    {
        public string EmpName { get; set; }
        public string ImagePath { get; set; }
        public string EmpID { get; set; }
    }
    public class DashboardBox
    {
        public List<StatusNameAndCount> listStatusNCount { get; set; }
        public List<StatusNameAndCount> listIncoterms { get; set; }
        public List<StatusNameAndCount> listTopVendors { get; set; }
        public List<StatusNameAndCount> listBuyers { get; set; }
        public List<CountAndValuesForBoxes> listOpenClosedPO { get; set; }
        public List<CountAndValuesForBoxes> listPaymentTerm { get; set; }
        public List<CountAndValuesForBoxes> listPOItemLevel { get; set; }
        public List<CountAndValuesForBoxes> listTopRepeatItems { get; set; }
    }
}