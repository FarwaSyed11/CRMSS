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

public partial class SSHR_Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetAllRoles()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");



        DBH.CreateDataset_SSHR(ds, "sp_AdminRequests", true, pa, pv);

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
    public static List<UserDetails> GetTableBasicDetails(string User, string RoleID,string GenSearch)
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

        pa.Add("@RoleID");
        pv.Add(RoleID);

        pa.Add("@GeneralSearch");
        pv.Add(GenSearch);


        DBH.CreateDataset_SSHR(ds, "sp_AdminRequests", true, pa, pv);

        List<UserDetails> listProjDet = new List<UserDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UserDetails ind = new UserDetails();
            ind.User_Id = dt.Rows[i]["User_Id"].ToString();
            ind.EmpNo = dt.Rows[i]["EmpNo"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.StatusClass = dt.Rows[i]["StatusClass"].ToString();
            ind.Email_Id = dt.Rows[i]["Email_Id"].ToString();
            ind.Password = dt.Rows[i]["Password"].ToString();
           
            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setPassword(string UserID,string Password)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@Password");
        pv.Add(Password);


        DBH.CreateDataset_SSHR(ds, "sp_AdminRequests", true, pa, pv);

    }


    public class DropDownValues
    {

        public string ddlValue { get; set; }
        public string ddlText { get; set; }

    }
    public class UserDetails
    {
        public string User_Id { get; set; }
        public string EmpNo { get; set; }
        public string Name { get; set; }
        public string Status { get; set; }
        public string StatusClass { get; set; }
        public string Email_Id { get; set; }

        public string Password { get; set; }
    }


}