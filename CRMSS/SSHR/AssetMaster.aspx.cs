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

public partial class SSHR_AssetMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GetDataforTable(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@userId");
        pv.Add(UserID);

       
        DBH.CreateDataset_SSHR(ds, "Sp_AssetMaster", true, pa, pv);

        List<tableData> AdminAction = new List<tableData>();
        dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {

                AdminAction.Add(new tableData()
                {
                    AssetID = dt.Rows[i]["AssetID"].ToString(),
                    SlNo = dt.Rows[i]["SlNo"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                    Description = dt.Rows[i]["Description"].ToString(),
                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    MoreInformation = dt.Rows[i]["MoreInformation"].ToString(),
                    Department = dt.Rows[i]["Department"].ToString(),

                });
            }
        

        return AdminAction;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string setAssets(string UserId, string Name, string Department, string Desription, string Remarks, string MoreInfo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@Name");
        pv.Add(Name);

        pa.Add("@Department");
        pv.Add(Department);

        pa.Add("@Description");
        pv.Add(Desription);

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@MoreInfo");
        pv.Add(MoreInfo);

        pa.Add("@userId");
        pv.Add(UserId);



        DBH.CreateDataset_SSHR(ds, "Sp_AssetMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();
    }

    public class tableData
    {
        public string AssetID { get; set; }
        public string SlNo { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Remarks { get; set; }
        public string MoreInformation { get; set; }
        public string Department { get; set; }
        
    }

}