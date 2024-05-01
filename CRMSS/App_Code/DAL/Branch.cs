using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net.NetworkInformation;

/// <summary>
/// Summary description for Branch
/// </summary>
public class Branch
{
    /// <summary>
    /// Initializes a new instance of the <see cref="Branch"/> class.
    /// </summary>
    public Branch()
    {        
    }
    
    /// <summary>
    /// Searches the branch.
    /// </summary>
    /// <param name="Code">The code.</param>
    /// <param name="Name">The name.</param>
    /// <returns>DataTable.</returns>
    public DataTable SearchBranch(string Code, string Name)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Code", Code);
        param[1] = new SqlParameter("@Name", Name);        
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "SP_SearchBranch");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }

    /// <summary>
    /// Gets the branch details by identifier.
    /// </summary>
    /// <param name="BranchId">The branch identifier.</param>
    /// <returns>DataTable.</returns>
    public DataTable GetBranchDetailsById(long BranchId)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Branch_ID", BranchId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "GetBranchDetailsById");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }

    /// <summary>
    /// Saves the branch.
    /// </summary>
    /// <param name="BranchId">The branch identifier.</param>
    /// <param name="Code">The code.</param>
    /// <param name="Name">The name.</param>
    /// <param name="UserId">The user identifier.</param>
    /// <returns>System.Int32.</returns>
    public int SaveBranch(long BranchId, string Code, string Name, long UserId)
    {
        DataTable dt = new DataTable();
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@Branch_ID", BranchId);
        param[1] = new SqlParameter("@Code", Code);
        param[2] = new SqlParameter("@Name", Name);
        param[3] = new SqlParameter("@User_ID", UserId);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "SP_SaveBranch");        
    }

    /// <summary>
    /// Deletes the branch.
    /// </summary>
    /// <param name="BranchId">The branch identifier.</param>    
    /// <param name="UserId">The user identifier.</param>
    /// <returns>System.Int32.</returns>
    public int DeleteBranch(long BranchId, long UserId)
    {
        DataTable dt = new DataTable();
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Branch_ID", BranchId);
        param[1] = new SqlParameter("@User_ID", UserId);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "SP_DeleteBranch");
    }
}



