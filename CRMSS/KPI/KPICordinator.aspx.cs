using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class KPI_KPICordinator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 9;
        Common.SaveAppUserActivityHistory(Session["ApplicationId"].ToString(), "/KPI/KPICordinator.aspx", "Same as ManagerKPI Page but View Only Rights.", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetTransactionsKpiYearly(string EmpNo, string OrgName, string DeptId, string Year,string LmanEmpNo)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        KpiTransaction oKT = new KpiTransaction();

        List<KpiMatricsTransaction> oMTList = new List<KpiMatricsTransaction>();

        pa.Add("@oper");
        pv.Add("66");        

        pa.Add("@Company");
        pv.Add(OrgName);

        pa.Add("@DeptId");
        pv.Add(DeptId);

        pa.Add("@empnum");
        pv.Add(EmpNo);

        pa.Add("@LmanEmpNo");
        pv.Add(LmanEmpNo);
      
        pa.Add("@Year");
        pv.Add(Convert.ToInt32(Year));
      

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiCordinator", true, pa, pv);

        //if (ds.Tables.Count > 0)
        if (ds.Tables[0].Rows.Count > 0)
        {
            dt.Columns.Add("EmpNo", typeof(string));
            dt.Columns.Add("Month", typeof(string));
            dt.Columns.Add("Year", typeof(string));
            //dt.Columns.Add("KpiEndDate", typeof(string));
            dt.Columns.Add("RequesterStatus", typeof(string));
            dt.Columns.Add("ReviewerStatus", typeof(string));
            dt.Columns.Add("KpiStartDate", typeof(string));           

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dt.Rows.Add(
                ds.Tables[0].Rows[i]["EmpNo"],
                ds.Tables[0].Rows[i]["Month"],
                ds.Tables[0].Rows[i]["Year"],
                //ds.Tables[0].Rows[i]["KpiEndDate"],
                ds.Tables[0].Rows[i]["RequesterStatus"],
                ds.Tables[0].Rows[i]["ReviewerStatus"],
                ds.Tables[0].Rows[i]["KpiStartDate"]                
                );
            }


            //dt.Rows.Add(ds.Tables[1].Rows[1]["SavedKpis"]);
            var res = DataTableToJSONWithStringBuilder(dt);
            return res;
        }

        return "";

        //return oKT;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OrganizationDDL> GetOrganizations(string EmpNo)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<OrganizationDDL> orgList = new List<OrganizationDDL>();


        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@empnum");
        pv.Add(EmpNo);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiCordinator", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                orgList.Add(new OrganizationDDL()
                {
                    OrgName = ds.Tables[0].Rows[i]["companyname"].ToString(),
                    Value = ds.Tables[0].Rows[i]["value"].ToString()
                });


            }
        }

        return orgList;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DepartmentDDL> GetDapartments(string orgName, string EmpNo)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<DepartmentDDL> deptList = new List<DepartmentDDL>();


        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@Company");
        pv.Add(orgName);

        pa.Add("@empnum");
        pv.Add(EmpNo);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiCordinator", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                deptList.Add(new DepartmentDDL()
                {
                    DeptId = ds.Tables[0].Rows[i]["DeptID"].ToString(),
                    DeptName = ds.Tables[0].Rows[i]["DeptName"].ToString()
                });

            }
        }

        return deptList;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDLEmpList> GetEmployees(string orgName, int deptId, string EmpNo)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<DDLEmpList> empList = new List<DDLEmpList>();


        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@Company");
        pv.Add(orgName);

        pa.Add("@DeptId");
        pv.Add(deptId);

        pa.Add("@empnum");
        pv.Add(EmpNo);

        DataTable dt = new DataTable();
        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiCordinator", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            dt = ds.Tables[0];
            //Distinct by Linq
            //     dt = ds.Tables[0].AsEnumerable()
            //.GroupBy(r => new { EmpNo = r["EmpNo"], EmpName = r["FName"] })
            //.Select(g => g.OrderBy(r => r["FName"]).First())
            //.CopyToDataTable();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                empList.Add(new DDLEmpList()
                {
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    EmpName = dt.Rows[i]["EmpName"].ToString()
                });
            }
        }

        return empList;

    }

    public static string DataTableToJSONWithStringBuilder(DataTable table)
    {
        var JSONString = new StringBuilder();
        if (table.Rows.Count > 0)
        {
            JSONString.Append("[");
            for (int i = 0; i < table.Rows.Count; i++)
            {
                JSONString.Append("{");
                for (int j = 0; j < table.Columns.Count; j++)
                {
                    if (j < table.Columns.Count - 1)
                    {
                        JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                    }
                    else if (j == table.Columns.Count - 1)
                    {
                        JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                    }
                }
                if (i == table.Rows.Count - 1)
                {
                    JSONString.Append("}");
                }
                else
                {
                    JSONString.Append("},");
                }
            }
            JSONString.Append("]");
        }
        return JSONString.ToString();
    }
    //classes

    public class DDLEmpList {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
    }

    public class KpiTransaction
    {
        public string KpiTransId { get; set; }

        public string EmpNum { get; set; }

        public string KpiId { get; set; }
        public string Indicator { get; set; }
        public string IndicatorType { get; set; }
        public string Weight { get; set; }
        public string IndicatorTarget { get; set; }

        public string ScuccessPercen { get; set; }
        public string Point { get; set; }
        public string EmpComment { get; set; }
        public string EmpOrRequesterStatus { get; set; }

        public string LineManagerName { get; set; }
        public string LineMangerComment { get; set; }
        public string LMorReviewerStatus { get; set; }
        public string EmpReviewCommentForManager { get; set; }
        public string EmpRatingForManager { get; set; }

        public int SelMonth { get; set; }
        public int ActualYear { get; set; }
        public List<KpiMatricsTransaction> MatricsTransactionList { get; set; }

        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string UpdatedBy { get; set; }

        public int IsManangerOwner { get; set; }
        //private string _name;
        //private int _id;
        //public string name
        //{
        //    get { return _name; }
        //    set { _name = value; }
        //}
        //public int id
        //{
        //    get { return _id; }
        //    set { _id = value; }
        //}
    }
    public class KpiMatricsTransaction
    {
        public string KpiTransactionId { get; set; }
        public string KpiMasterId { get; set; }
        public string MatricsName { get; set; }
        public string MatricsId { get; set; }
        public string MatricsTextboxId { get; set; }
        public string MatricsValueByEmp { get; set; }
        public string IsTarget { get; set; }
        public string IsAchievement { get; set; }
    }
    public class OrganizationDDL
    {
        public string OrgName { get; set; }
        public string Value { get; set; }
    }

    public class DepartmentDDL
    {
        public string DeptId { get; set; }
        public string DeptName { get; set; }
    }
}