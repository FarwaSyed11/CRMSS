using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

public partial class FacilityManagement_Property : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 10;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<FMProperties> GetAllPropertiesDistinct()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMProperty", true, pa, pv);

        List<FMProperties> oTPDList = new List<FMProperties>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            oTPDList.Add(new FMProperties()
            {
                PropName = dt.Rows[i]["PropName"].ToString()               
            });
        }
        return oTPDList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<FMProperties> GetAllPropertiesTypeDistinct()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMProperty", true, pa, pv);

        List<FMProperties> oTPDList = new List<FMProperties>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            oTPDList.Add(new FMProperties()
            {
                PropType = dt.Rows[i]["PropType"].ToString()
            });
        }
        return oTPDList;
        //string a = userId;
    }




    //PAYMENT
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<FMProperties> GetAllProperties(string PropStatus, string PropName, string PropType)
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

        pa.Add("@PropStatus");
        pv.Add(PropStatus);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMProperty", true, pa, pv);

        List<FMProperties> oTPDList = new List<FMProperties>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            oTPDList.Add(new FMProperties()
            {
                PropId = dt.Rows[i]["PropId"].ToString(),             
                PropName = dt.Rows[i]["PropName"].ToString(),
                PropType = dt.Rows[i]["PropType"].ToString(),
                PropBlock = dt.Rows[i]["PropBlock"].ToString(),
                PropPlot = dt.Rows[i]["PropPlot"].ToString(),
                PropFloor = dt.Rows[i]["PropFloor"].ToString(),
                PropRoom = dt.Rows[i]["PropRoom"].ToString(),
                PropRoomType = dt.Rows[i]["PropRoomType"].ToString(),
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


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMProperty", true, pa, pv);


    }






    //classes


    public class FMProperties
    {
        public string PropId { get; set; }
        public string PropName { get; set; }
        public string PropType { get; set; }
        public string PropBlock { get; set; }
        public string PropPlot { get; set; }
        public string PropFloor { get; set; }
        public string PropRoom { get; set; }
        public string PropRoomType { get; set; }
        //public string PropCode { get; set; }

    }
    public class ResponseMsg
    {
        public string msg { get; set; }
        public string msgType { get; set; }
    }

}