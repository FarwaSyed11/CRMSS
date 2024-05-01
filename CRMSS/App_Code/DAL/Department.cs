using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net.NetworkInformation;

/// <summary>
/// Summary description for Department
/// </summary>
public class Department
{
    /// <summary>
    /// Initializes a new instance of the <see cref="Department"/> class.
    /// </summary>
    public Department()
    {        
    }
    
    /// <summary>
    /// Searches the departments.
    /// </summary>
    /// <param name="Code">The code.</param>
    /// <param name="Name">The name.</param>
    /// <returns>DataTable.</returns>
    public DataTable SearchDepartments(string Code, string Name)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Code", Code);
        param[1] = new SqlParameter("@Name", Name);        
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "SP_SearchDepartment");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }

    /// <summary>
    /// Gets the department details by identifier.
    /// </summary>
    /// <param name="DepartmentId">The department identifier.</param>
    /// <returns>DataTable.</returns>
    public DataTable GetDepartmentDetailsById(long DepartmentId)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Department_ID", DepartmentId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "GetDepartmentDetailsById");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }

    /// <summary>
    /// Saves the department.
    /// </summary>
    /// <param name="DepartmentId">The department identifier.</param>
    /// <param name="Code">The code.</param>
    /// <param name="Name">The name.</param>
    /// <param name="UserId">The user identifier.</param>
    /// <returns>System.Int32.</returns>
    public int SaveDepartment(long DepartmentId, string Code, string Name, long UserId)
    {
        DataTable dt = new DataTable();
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@Department_ID", DepartmentId);
        param[1] = new SqlParameter("@Code", Code);
        param[2] = new SqlParameter("@Name", Name);
        param[3] = new SqlParameter("@User_ID", UserId);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "SP_SaveDepartment");        
    }

    /// <summary>
    /// Deletes the department.
    /// </summary>
    /// <param name="DepartmentId">The department identifier.</param>    
    /// <param name="UserId">The user identifier.</param>
    /// <returns>System.Int32.</returns>
    public int DeleteDepartment(long DepartmentId, long UserId)
    {
        DataTable dt = new DataTable();
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Department_ID", DepartmentId);
        param[1] = new SqlParameter("@User_ID", UserId);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "SP_DeleteDepartment");
    }

    public int SaveSubDepartment(long SubDepartmentId, string Code, string Name, long UserId)
    {
        DataTable dt = new DataTable();
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@SubDepartment_ID", SubDepartmentId);
        param[1] = new SqlParameter("@Code", Code);
        param[2] = new SqlParameter("@Name", Name);
        param[3] = new SqlParameter("@User_ID", UserId);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "SP_SaveSubDepartment");
    }
}



