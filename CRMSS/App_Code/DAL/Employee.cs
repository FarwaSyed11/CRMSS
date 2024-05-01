using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net.NetworkInformation;

/// <summary>
/// Summary description for Employee
/// </summary>
public class Employee
{
    /// <summary>
    /// Initializes a new instance of the <see cref="Employee"/> class.
    /// </summary>
    public Employee()
    {        
    }

    /// <summary>
    /// Adds the employee picture.
    /// </summary>
    /// <param name="EmployeeId">The employee identifier.</param>
    /// <param name="Picture">The picture.</param>
    /// <param name="UserId">The user identifier.</param>
    /// <returns>System.Int32.</returns>
    public int AddEmployeePicture(int EmployeeId, byte[] Picture, int UserId)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@Employee_ID", EmployeeId);
        param[1] = new SqlParameter("@Picture", Picture);
        param[2] = new SqlParameter("@User_ID", UserId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "SP_AddEmployeePicture");
        if (ds != null)
            return 1;
        else
            return 0;
    }

    /// <summary>
    /// Deletes the employee picture.
    /// </summary>
    /// <param name="EmployeeId">The employee identifier.</param>
    /// <returns>System.Int32.</returns>
    public int DeleteEmployeePicture(int EmployeeId)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Employee_ID", EmployeeId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "SP_DeleteEmployeePicture");
        if (ds != null)
            return 1;
        else
            return 0;
    }

    /// <summary>
    /// Adds the employee card.
    /// </summary>
    /// <param name="EmployeeId">The employee identifier.</param>
    /// <param name="CardNumber">The card number.</param>
    /// <param name="Comment">The comment.</param>
    /// <param name="UserId">The user identifier.</param>
    /// <returns>System.Int32.</returns>
    public int AddEmployeeCard(int EmployeeId, string CardNumber, string Comment, int UserId)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@Employee_ID", EmployeeId);
        param[1] = new SqlParameter("@CardNumber", CardNumber);
        param[2] = new SqlParameter("@Comment", Comment);
        param[3] = new SqlParameter("@User_ID", UserId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "SP_AddEmployeeCard");
        if (ds != null)
            return 1;
        else
            return 0;
    }

    /// <summary>
    /// Deletes the employee card.
    /// </summary>
    /// <param name="EmployeeId">The employee identifier.</param>
    /// <returns>System.Int32.</returns>
    public int DeleteEmployeeCard(int EmployeeId)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Employee_ID", EmployeeId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "SP_DeleteEmployeeCard");
        if (ds != null)
            return 1;
        else
            return 0;
    }

    /// <summary>
    /// Adds the employee face.
    /// </summary>
    /// <param name="EmployeeId">The employee identifier.</param>
    /// <param name="CardNumber">The card number.</param>
    /// <param name="Comment">The comment.</param>
    /// <param name="UserId">The user identifier.</param>
    /// <returns>System.Int32.</returns>
    public int AddEmployeeFace(int EmployeeId, string n1, int UserId)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@Employee_ID", EmployeeId);
        param[1] = new SqlParameter("@N1", n1);
        param[2] = new SqlParameter("@User_ID", UserId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "SP_AddEmployeeFace");
        if (ds != null)
            return 1;
        else
            return 0;
    }

    /// <summary>
    /// Deletes the employee face.
    /// </summary>
    /// <param name="EmployeeId">The employee identifier.</param>
    /// <returns>System.Int32.</returns>
    public int DeleteEmployeeFace(int EmployeeId)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Employee_ID", EmployeeId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "SP_DeleteEmployeeFace");
        if (ds != null)
            return 1;
        else
            return 0;
    }

    /// <summary>
    /// Deletes the employee mobile card.
    /// </summary>
    /// <param name="EmployeeId">The employee identifier.</param>
    /// <returns>System.Int32.</returns>
    public int DeleteEmployeeMobileCard(int EmployeeId)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Employee_ID", EmployeeId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "SP_DeleteEmployeeMobileCard");
        if (ds != null)
            return 1;
        else
            return 0;
    }

    /// <summary>
    /// Searches the employee.
    /// </summary>
    /// <param name="branchId">The branch identifier.</param>
    /// <param name="departmentId">The department identifier.</param>
    /// <returns>DataTable.</returns>
    public DataTable SearchEmployee(int branchId, int departmentId)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Branch_ID", branchId);
        param[1] = new SqlParameter("@Department_ID", departmentId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "SP_EmployeeSearch");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }

    public DataTable FillEmployee(long EmpId)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@EmpId", EmpId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Sp_EmployeeProfile");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }

    public DataTable ValidateRole(int EmployeeId, int DeptId, int CompanyId, int SiteId, int RoleId, string Oper)
    { 
        SqlParameter[] param = new SqlParameter[6];

        param[0] = new SqlParameter("@EmpId", EmployeeId);
        param[1] = new SqlParameter("@DeptId", DeptId);        
        param[2] = new SqlParameter("@CompanyId", CompanyId);
        param[3] = new SqlParameter("@SiteId", SiteId);        
        param[4] = new SqlParameter("@RoleId", RoleId);                
        param[5] = new SqlParameter("@Oper", Oper);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Sp_CheckRoles");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
}



