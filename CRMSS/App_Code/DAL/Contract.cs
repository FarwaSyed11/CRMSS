using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net.NetworkInformation;

/// <summary>
/// Summary description for Contract
/// </summary>
public class Contract
{
    public Contract()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int SaveContract(string Code, string Name, long UserId)
    {
        try
        {
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@Code", Code);
            param[1] = new SqlParameter("@Name", Name);
            param[2] = new SqlParameter("@User_ID", UserId);
            DataAccessLayer da = new DataAccessLayer();
            DataSet ds = da.getDataByParam(param, "SP_SaveContract");
            if (ds.Tables[0].Rows[0][0].ToString() == "Exists")
                return 1;
            else if (ds.Tables[0].Rows[0][0].ToString() == "Not Exists")
                return 2;
            return 0;
        }
        catch(  Exception ex)
        {
            return 0;
        }
    }
}