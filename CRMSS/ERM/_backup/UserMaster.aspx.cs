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

public partial class ERM_UserMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableData> GetUserMasterDet(string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@userId");
        pv.Add(UserId);

        DBH.CreateDatasetERM_Data(ds, "sp_UserMaster", true, pa, pv);

        List<TableData> drpval = new List<TableData>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new TableData()
            {
                Company = dt.Rows[i]["Company"].ToString(),
                EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                EmpName = dt.Rows[i]["EmpName"].ToString(),
                ManagerEmpno = dt.Rows[i]["ManagerEmpno"].ToString(),
                ManagerName = dt.Rows[i]["ManagerName"].ToString(),
                Team = dt.Rows[i]["Team"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
                UserID = dt.Rows[i]["UserID"].ToString(),



            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProductDet> GetUserProducts(string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@userId");
        pv.Add(UserId);

        DBH.CreateDatasetERM_Data(ds, "sp_UserMaster", true, pa, pv);

        List<ProductDet> drpval = new List<ProductDet>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new ProductDet()
            {
                SlNo = dt.Rows[i]["SlNo"].ToString(),
                Product = dt.Rows[i]["Product"].ToString(),
                ProductID = dt.Rows[i]["ProductID"].ToString(),


            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<DropDownValues> GetProductDDL()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("1");


        DBH.CreateDatasetERM_Data(ds, "sp_UserMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Product"].ToString(),
                ddlText = dt.Rows[i]["Product"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddNewProduct(string UserID, string Product)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("3");

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@AllProducts");
        pv.Add(Product);
      
      
        DBH.CreateDatasetERM_Data(ds, "sp_UserMaster", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteProduct(string UserID, string ProductID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("4");

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ID");
        pv.Add(ProductID);


        DBH.CreateDatasetERM_Data(ds, "sp_UserMaster", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpListDDL> GetAllManager()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        DBH.CreateDatasetERM_Data(ds, "sp_UserMaster", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    User_Id = dt.Rows[i]["User_Id"].ToString(),
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    EmpName = dt.Rows[i]["EmpName"].ToString(),

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setNewManager(string UserID, string NewManager,string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("6");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@ManagerUserId");
        pv.Add(NewManager);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);


        DBH.CreateDatasetERM_Data(ds, "sp_UserMaster", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<DropDownValues> GetEMSRole()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("7");


        DBH.CreateDatasetERM_Data(ds, "sp_UserMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Role_Id"].ToString(),
                ddlText = dt.Rows[i]["Role_Name"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UserDetails> GetNewUserList(string RoleId, string GeneralSearch)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@RoleId");
        pv.Add(RoleId);

        pa.Add("@GenSearch");
        pv.Add(GeneralSearch);


        DBH.CreateDatasetERM_Data(ds, "sp_UserMaster", true, pa, pv);

        List<UserDetails> listProjDet = new List<UserDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UserDetails ind = new UserDetails();
            ind.User_Id = dt.Rows[i]["User_Id"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.Email_Id = dt.Rows[i]["Email_Id"].ToString();
            ind.EmpNo = dt.Rows[i]["EmpNo"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string setNewUserToEMS(string UserID, string NewUserId, string RoleId,string EmpNo,string EmpName)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("9");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@NewUserId");
        pv.Add(NewUserId);

        pa.Add("@RoleId");
        pv.Add(RoleId);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@EmpName");
        pv.Add(EmpName);


        DBH.CreateDatasetERM_Data(ds, "sp_UserMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<DropDownValues> GetAllCompany()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("10");


        DBH.CreateDatasetERM_Data(ds, "sp_UserMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Company"].ToString(),
                ddlText = dt.Rows[i]["Company"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setNewUserDetails(string UserID, string NewManager, string Company, string Product,string EMSUSerId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("11");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@ManagerUserId");
        pv.Add(NewManager);

        pa.Add("@Company");
        pv.Add(Company);

        if(Product!="")
        { 
        pa.Add("@AllProducts");
        pv.Add(Product);
        }

        pa.Add("@ID");
        pv.Add(EMSUSerId);

        DBH.CreateDatasetERM_Data(ds, "sp_UserMaster", true, pa, pv);


    }

    public class EmpListDDL
    {
        public string User_Id { get; set; }
        public string EmpNo { get; set; }
        public string EmpName { get; set; }


    }

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }

    public class TableData
    {
        public string Company { get; set; }
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string ManagerEmpno { get; set; }
        public string ManagerName { get; set; }

        public string Team { get; set; }
        public string Status { get; set; }
        public string UserID { get; set; }
    }

    public class ProductDet
    {
        public string SlNo { get; set; }
        public string Product { get; set; }

        public string ProductID { get; set; }

    }

    public class UserDetails
    {
        public string User_Id { get; set; }
        public string EmpNo { get; set; }
        public string UEmployeeName { get; set; }
        public string Status { get; set; }
        public string Email_Id { get; set; }
        public string Company { get; set; }
        public string UserImageLink { get; set; }

        public string POSITION { get; set; }
        public string NATIONALITY { get; set; }
        public string DateOfJoin { get; set; }
        public string MOBILE_PHONE { get; set; }
        public string WORK_PHONE { get; set; }
        public string DepartmentHead { get; set; }
        public string SEX { get; set; }

        public string Name { get; set; }




    }
}