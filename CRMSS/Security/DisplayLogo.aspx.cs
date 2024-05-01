using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DPGModel;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using System.Configuration;
public partial class Security_DisplayLogo : System.Web.UI.Page
{
    DBHandler dba = new DBHandler();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ContractId"] != null)
        {
            int contractId = int.Parse(Request.QueryString["ContractId"]);
            //string strQuery = "select Name, ContentType, Data from tblFiles where id=@id";
            //SqlCommand cmd = new SqlCommand(strQuery);
            //cmd.Parameters.Add("@id", SqlDbType.Int).Value
            //= Convert.ToInt32(Request.QueryString["ImageID"]);
            //DataTable dt = GetData(cmd);
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            pa = new ArrayList();
            pv = new ArrayList();
            pa.Add("@contractID");
            pv.Add(contractId);
            pa.Add("@Domain");
            pv.Add(null);
            pa.Add("@logo");
            pv.Add(null);
            pa.Add("@Opr");
            pv.Add(6);

            dba.CreateDataTable(dt, "sp_getLDAP", true, pa, pv);
            if (dt != null && dt.Rows.Count > 0 && dt.Rows[0]["Data"] != DBNull.Value)
            {
                Byte[] bytes = (Byte[])dt.Rows[0]["Data"];
                Response.Buffer = true;
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = dt.Rows[0]["ContentType"].ToString();
                Response.AddHeader("content-disposition", "attachment;filename="
                + dt.Rows[0]["Name"].ToString());

                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.End();
            }
            else
            {
                Response.Write("No Image Found");
                Response.Flush();
                Response.End();
            }
        }
    }
}