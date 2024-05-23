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

public partial class SSHR_DashboardSSHR : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllInOne GetEmployeeDetails(string EmpNo, string Month, string Year)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //pa.Add("@oper");
        //pv.Add(0);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@Month");
        pv.Add(Month);

        pa.Add("@Year");
        pv.Add(Year);

        AllInOne oMain = new AllInOne();

        List<TopBoxes> oTopBox = new List<TopBoxes>();
        List<DatValue> oG1 = new List<DatValue>();
        List<DatValue> oG2 = new List<DatValue>();
        List<RectangleGraph> oRecG = new List<RectangleGraph>();
        List<RightSection> oRightSec = new List<RightSection>();
        List<TypeHOurGraph> oDownG1 = new List<TypeHOurGraph>();
        List<TypeHOurGraph> oDownG2 = new List<TypeHOurGraph>();
        List<LeaveHistoryTable> oLeaveHis = new List<LeaveHistoryTable>();




        DBH.CreateDataset_SSHR(ds, "sshr_EmployeeDashboard", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            //table[0]
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oTopBox.Add(new TopBoxes()
                {
                    PENDINGREQUEST = dt.Rows[i]["PENDINGREQUEST"].ToString(),
                    APPROVEDREQ = dt.Rows[i]["APPROVEDREQ"].ToString(),
                    REJECTEDREQ = dt.Rows[i]["REJECTEDREQ"].ToString(),
                    LateMin = dt.Rows[i]["LateMin"].ToString(),
                    EarlyExitMin = dt.Rows[i]["EarlyExitMin"].ToString()

                });
            }

            //table[1]
            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oG1.Add(new DatValue()
                {
                    TYPE = ds.Tables[1].Rows[i]["TYPE"].ToString(),
                    Day = ds.Tables[1].Rows[i]["Day"].ToString(),
                    Value = ds.Tables[1].Rows[i]["VALUE"].ToString()
                });
            }

            //table[2]
            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
            {
                oG2.Add(new DatValue()
                {
                    TYPE = ds.Tables[2].Rows[i]["TYPE"].ToString(),
                    Day = ds.Tables[2].Rows[i]["Day"].ToString(),
                    Value = ds.Tables[2].Rows[i]["VALUE"].ToString()
                });
            }

            //table[3]
            for (int i = 0; i < ds.Tables[3].Rows.Count; i++)
            {
                oRecG.Add(new RectangleGraph()
                {
                    OneTo5 = ds.Tables[3].Rows[i]["1 to 5"].ToString(),
                    SixTo10 = ds.Tables[3].Rows[i]["6_to_10"].ToString(),
                    ElevenTo15 = ds.Tables[3].Rows[i]["11_to_15"].ToString(),
                    SixteenTo20 = ds.Tables[3].Rows[i]["16_to_20"].ToString(),
                    TwentyOneTo25 = ds.Tables[3].Rows[i]["21_to_25"].ToString()
                });
            }

            //table[4]
            for (int i = 0; i < ds.Tables[4].Rows.Count; i++)
            {
                oRightSec.Add(new RightSection()
                {
                    PENDINGREQUEST = ds.Tables[4].Rows[i]["PENDINGREQUEST"].ToString(),
                    TOTALREQ = ds.Tables[4].Rows[i]["TOTALREQ"].ToString(),
                    TYPE = ds.Tables[4].Rows[i]["TYPE"].ToString(),
                    perc = ds.Tables[4].Rows[i]["perc"].ToString(),
                });
            }
            //table[5]
            for (int i = 0; i < ds.Tables[5].Rows.Count; i++)
            {
                oDownG1.Add(new TypeHOurGraph()
                {
                    Type = ds.Tables[5].Rows[i]["Type"].ToString(),
                    Hours = ds.Tables[5].Rows[i]["Hours"].ToString()
                    
                });
            }
            //table[6]
            
            for (int i = 0; i < ds.Tables[6].Rows.Count; i++)
            {
                oDownG2.Add(new TypeHOurGraph()
                {
                    Type = ds.Tables[6].Rows[i]["Type"].ToString(),
                    Hours = ds.Tables[6].Rows[i]["Hours"].ToString()

                });
            }

            for (int i = 0; i < ds.Tables[7].Rows.Count; i++)
            {
                oLeaveHis.Add(new LeaveHistoryTable()
                {
                    //LeaveType = ds.Tables[7].Rows[i]["Leave_Type"].ToString(),
                    FromDate = ds.Tables[7].Rows[i]["From_Date"].ToString(),
                    ReturnToWork = ds.Tables[7].Rows[i]["Returned_To_Work"].ToString(),
                    LeaveReqDays = ds.Tables[7].Rows[i]["Leave_Req_Days"].ToString()

                });
            }


        }





        oMain.listTopBoxes = oTopBox;
        oMain.listGraph1 = oG1;
        oMain.listGraph2 = oG2;
        oMain.listRectGraph = oRecG;
        oMain.listRightSec = oRightSec;
        oMain.listTypeHOurGraph1 = oDownG1;
        oMain.listTypeHOurGraph2= oDownG2;
        oMain.listLeaveHis= oLeaveHis;



        return oMain;

    }
}

public class TopBoxes
{
    public string PENDINGREQUEST { get; set; }
    public string APPROVEDREQ { get; set; }
    public string REJECTEDREQ { get; set; }
    public string LateMin { get; set; }
    public string EarlyExitMin { get; set; }
}

public class DatValue
{
    public string TYPE { get; set; }
    public string Day { get; set; }
    public string Value { get; set; }
}

public class RectangleGraph
{
    public string OneTo5 { get; set; }
    public string SixTo10 { get; set; }
    public string ElevenTo15 { get; set; }
    public string SixteenTo20 { get; set; }
    public string TwentyOneTo25 { get; set; }
}

public class RightSection
{
    public string TYPE { get; set; }
    public string PENDINGREQUEST { get; set; }
    public string TOTALREQ { get; set; }
    public string perc {  get; set; }
}

public class TypeHOurGraph
{
    public string Type { get; set; }
    public string Hours { get; set; }
}

public class LeaveHistoryTable
{
    public string LeaveType { get; set; }
    public string FromDate { get; set; }
    public string ReturnToWork { get; set; }
    public string LeaveReqDays { get; set; }
}

public class AllInOne
{

    public List<TopBoxes> listTopBoxes { get; set; }
    public List<DatValue> listGraph1 { get; set; }
    public List<DatValue> listGraph2 { get; set; }
    public List<RectangleGraph> listRectGraph { get; set; }
    public List<RightSection> listRightSec { get; set; }
    public List<TypeHOurGraph> listTypeHOurGraph1 { get; set; }
    public List<TypeHOurGraph> listTypeHOurGraph2 { get; set; }
    public List<LeaveHistoryTable> listLeaveHis { get; set; }

}