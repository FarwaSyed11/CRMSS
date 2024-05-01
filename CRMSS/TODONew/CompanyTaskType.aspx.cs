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

public partial class TODONew_CompanyTaskType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 17;
        Common.SaveAppUserActivityHistory("17", "/TODONew/CompanyTaskType.aspx", "Comapnt Task Type", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);
    }
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }
    public class tableData
    {
        public string ID { get; set; }
        public string DeptID { get; set; }
        public string Department { get; set; }
        public string TypeName { get; set; }
        public string TimeDuration { get; set; }
        public string Description { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string status { get; set; }


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetDeptList(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@userID");
        pv.Add(UserID);

        DBH.CreateDatasetForTODONew(ds, "Sp_CustomerRepAndTaskType", true, pa, pv);

        List<DropDownValues> DeptList = new List<DropDownValues>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DeptList.Add(new DropDownValues()
                {
                    ddlValue = dt.Rows[i]["DeptID"].ToString(),
                    ddlText = dt.Rows[i]["DeptName"].ToString(),
                    
                });
            }
        }

        return DeptList;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GetTaskType(string DeptID, string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@userID");
        pv.Add(UserID);

        pa.Add("@DeptID");
        pv.Add(DeptID);

        DBH.CreateDatasetForTODONew(ds, "Sp_CustomerRepAndTaskType", true, pa, pv);

        List<tableData> TaskType = new List<tableData>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                TaskType.Add(new tableData()
                {
                    ID = dt.Rows[i]["ID"].ToString(),
                    DeptID = dt.Rows[i]["DeptID"].ToString(),
                    Department = dt.Rows[i]["Department"].ToString(),
                    TypeName = dt.Rows[i]["TypeName"].ToString(),
                    TimeDuration = dt.Rows[i]["TimeDuratin"].ToString(),
                    Description = dt.Rows[i]["Description"].ToString(),
                    status = dt.Rows[i]["status"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),

                });
            }
        }

        return TaskType;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean SaveType(string DeptID, string Department, string TypeName, string TimeDuratin, string Description, string CreatedBy)
    {
        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(2);

            pa.Add("@DeptID");
            pv.Add(DeptID);

            pa.Add("@Department");
            pv.Add(Department);

            pa.Add("@TypeName");
            pv.Add(TypeName);

            pa.Add("@TimeDuratin");
            pv.Add(TimeDuratin);

            pa.Add("@Description");
            pv.Add(Description);

            pa.Add("@userID");
            pv.Add(CreatedBy);


            DBH.CreateDatasetForTODONew(ds, "Sp_CustomerRepAndTaskType", true, pa, pv);
            return true;
        }
        catch (Exception ex) {
            return false;
        }

        
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean DeleteType(string TypeID, string UserID)
    {
        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(4);

            pa.Add("@TypeID");
            pv.Add(TypeID);


            pa.Add("@userID");
            pv.Add(UserID);



            DBH.CreateDatasetForTODONew(ds, "Sp_CustomerRepAndTaskType", true, pa, pv);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpListDDL> GetAllEmployees(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        DBH.CreateDatasetForTODONew(ds, "Sp_CustomerRepAndTaskType", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                  
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetWFDetails(string TypeId, string UserType,string Role,string User,string Description,string OrderNumb,string Status,string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@userID");
        pv.Add(UserId);

        pa.Add("@TypeID");
        pv.Add(TypeId);

        pa.Add("@UserType");
        pv.Add(UserType);

        pa.Add("@WFUserRole");
        pv.Add(Role);

        pa.Add("@WFEmpNo");
        pv.Add(User);

        pa.Add("@WFDescription");
        pv.Add(Description);

        pa.Add("@OrderNumber");
        pv.Add(OrderNumb);

        pa.Add("@Status");
        pv.Add(Status);

       

      

       DBH.CreateDatasetForTODONew(ds, "Sp_CustomerRepAndTaskType", true, pa, pv);




    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WFTable> GetWFDetails(string TypeId, string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@userID");
        pv.Add(UserID);

        pa.Add("@TypeID");
        pv.Add(TypeId);

        DBH.CreateDatasetForTODONew(ds, "Sp_CustomerRepAndTaskType", true, pa, pv);

        List<WFTable> TaskType = new List<WFTable>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                TaskType.Add(new WFTable()
                {
                    ID = dt.Rows[i]["ID"].ToString(),
                    WFUserType = dt.Rows[i]["WFUserType"].ToString(),
                    WFUserRole = dt.Rows[i]["WFUserRole"].ToString(),
                    WFEmpNo = dt.Rows[i]["WFEmpNo"].ToString(),
                    Description = dt.Rows[i]["Description"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    OrderNumber = dt.Rows[i]["OrderNumber"].ToString(),
                    BadgeStatus = dt.Rows[i]["BadgeStatus"].ToString(),
                    RowBg = dt.Rows[i]["RowBg"].ToString(),


                });
            }
        }

        return TaskType;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateWFDetails(string WFId,string Description, string OrderNumb, string Status, string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@userID");
        pv.Add(UserId);

        pa.Add("@WFId");
        pv.Add(WFId);

        pa.Add("@WFDescription");
        pv.Add(Description);

        pa.Add("@OrderNumber");
        pv.Add(OrderNumb);

        pa.Add("@Status");
        pv.Add(Status);





        DBH.CreateDatasetForTODONew(ds, "Sp_CustomerRepAndTaskType", true, pa, pv);




    }

    public class EmpListDDL
    {
        public string EmpNo { get; set; }
        public string Name { get; set; }
      
    }
    public class WFTable
    {
        public string ID { get; set; }
        public string WFUserType { get; set; }
        public string WFUserRole { get; set; }
        public string WFEmpNo { get; set; }
        public string Description { get; set; }
        public string Status { get; set; }
        public string OrderNumber { get; set; }
        public string BadgeStatus { get; set; }
        public string RowBg { get; set; }
        


    }
}