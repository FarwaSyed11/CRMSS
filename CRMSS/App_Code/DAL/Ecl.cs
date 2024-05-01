using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Configuration;
using System.Data;

/// <summary>
/// Summary description for Ecl
/// </summary>
public class Ecl
{

    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SecurityCon"].ToString());
    public Ecl()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string DeleteWeek(int Id, int Flag)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[DeleteWeek]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", Id);
            cmd.Parameters.AddWithValue("@Flag", Flag);

            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public string updateSubject(string Subject, int Id, int DepartmentId)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdateSubject]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Subject", Subject);
            cmd.Parameters.AddWithValue("@Id", Id);
            cmd.Parameters.AddWithValue("@DepartmentId", DepartmentId);

            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public string UpdateObjectMaster(int code, string objNme, int objCatId, int OPId, string EDate, int objId)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdateObjectMaster]", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            if (EDate == "")
            {
                int flag = 1;
                cmd.Parameters.AddWithValue("@Flag", flag);
                cmd.Parameters.AddWithValue("@eDate", EDate);
            }
            else
            {
                int flag = 2;
                cmd.Parameters.AddWithValue("@Flag", flag);
                cmd.Parameters.AddWithValue("@eDate", EDate);
            }
            cmd.Parameters.AddWithValue("@objId", objId);
            cmd.Parameters.AddWithValue("@code", code);
            cmd.Parameters.AddWithValue("@objName", objNme);
            cmd.Parameters.AddWithValue("@objCatId", objCatId);
            cmd.Parameters.AddWithValue("@opId", OPId);
            //  cmd.Parameters.AddWithValue("@eDate", EDate);




            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public string UpdateModuleNew(int Id, int RCode, string RNme, string RDate)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdateModule]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", Id);
            cmd.Parameters.AddWithValue("@Code", RCode);
            cmd.Parameters.AddWithValue("@Name", RNme);
            // cmd.Parameters.AddWithValue("@Date", RDate);
            if (RDate == "")
            {
                int flag = 1;
                cmd.Parameters.AddWithValue("@Flag", flag);
                cmd.Parameters.AddWithValue("@Date", RDate);
            }
            else
            {
                int flag = 2;
                cmd.Parameters.AddWithValue("@Flag", flag);
                cmd.Parameters.AddWithValue("@Date", RDate);
            }



            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public string UpdateRole(int Id, string RDesc, string RNme, string CDate)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdateRole]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", Id);
            cmd.Parameters.AddWithValue("@RDesc", RDesc);
            cmd.Parameters.AddWithValue("@Name", RNme);
            cmd.Parameters.AddWithValue("@CDate", CDate);
            //if (CDate == "")
            //{
            //    int flag = 1;
            //    cmd.Parameters.AddWithValue("@Flag", flag);
            //    cmd.Parameters.AddWithValue("@Date", CDate);
            //}
            //else
            //{
            //    int flag = 2;
            //    cmd.Parameters.AddWithValue("@Flag", flag);
            //    cmd.Parameters.AddWithValue("@Date", CDate);
            //}

            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public string InsertUpdateAccess(int UId, int RId, string FId)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertAccess]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@UId", UId);
            cmd.Parameters.AddWithValue("@FrmId", FId);
            cmd.Parameters.AddWithValue("@RId", RId);

            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public string UpdateModDet(int Id, int ModId, int FormId)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdateModDetails]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ModDetId", Id);
            cmd.Parameters.AddWithValue("@ModId", ModId);
            cmd.Parameters.AddWithValue("@FormId", FormId);

            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public string UpdateUser(int UserId, int RId, string UName, string Phone, string Email,
        Boolean Status, Int32 Dept_ID, Int32 Emp_ID, Int32 contID, Int32 siteId, string deptid,
        string sitelist, string empList, string iContractlist, string isitelist, string ideptlist)
    {
        try
        {
            string result;
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdateUser]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", UserId);
            cmd.Parameters.AddWithValue("@RId", RId);
            cmd.Parameters.AddWithValue("@UName", UName);
            cmd.Parameters.AddWithValue("@Phone", Phone);
            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@Status", Status);
            cmd.Parameters.AddWithValue("@Dept_ID", Dept_ID);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Contract_Id", contID);
            cmd.Parameters.AddWithValue("@Site_Id", siteId);
            cmd.Parameters.AddWithValue("@DeptId", deptid);
            cmd.Parameters.AddWithValue("@sitelist", sitelist);
            cmd.Parameters.AddWithValue("@Emplist", empList);
            cmd.Parameters.AddWithValue("@iContractlist", iContractlist);
            cmd.Parameters.AddWithValue("@isitelist", isitelist);
            cmd.Parameters.AddWithValue("@ideptlist", ideptlist);
            using (conn)
                result = (string)cmd.ExecuteScalar();
            conn.Close();
            return result;
        }
        catch (Exception ex)
        {
            return "Error";
        }
    }

    public string updateType(int Id, string TypeName)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdateType]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TypeId", Id);
            cmd.Parameters.AddWithValue("@TypeName", TypeName);

            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public string updateDept(int Id, string DeptName)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdateDept]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DEPARTMENT_ID", Id);
            cmd.Parameters.AddWithValue("@DEPARTMENT_NAME", DeptName);

            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public string UpdateForm(int Id, string FName, string FDesc)
    {
        try
        {
            conn.Open();
            SqlCommand com = new SqlCommand("UpdateForm", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Id", Id);
            com.Parameters.AddWithValue("@FName", FName);
            com.Parameters.AddWithValue("@FDesc", FDesc);

            using (conn)
                com.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch (Exception ex)
        {
            return "Error";
        }
    }

    public string InsertWeek(string WeekName, DateTime StartDate, DateTime EndDate)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertWeek]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@WeekName", WeekName);
            cmd.Parameters.AddWithValue("@StartDate", StartDate);
            cmd.Parameters.AddWithValue("@EndDate", EndDate);

            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public DataTable GetSubjectName(string SubjName, int Flag)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Flag", Flag);
        param[1] = new SqlParameter("@Name", SubjName);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[IsValidData]");
        return ds.Tables[0];

    }
    public DataTable GetObjectName(string ObjectName, int Flag)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Flag", Flag);
        param[1] = new SqlParameter("@Obj_Name", ObjectName);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[IsDetail]");
        return ds.Tables[0];

    }

    public string InsertSubject(string SubjectName, int DepartmentId)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertSubject]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Subject", SubjectName);
            cmd.Parameters.AddWithValue("@DepartmentId", DepartmentId);

            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }

    public string InsertDocuments(int Id, string SubjectName, int Week, string Topic, string Doctype, string CreatedDate, string Time, string PreFileName, string UploadedAs, string AssignmentSubmissionDate, string PostFileName, string AssnFilename, string RefFileName, string FileName)
    {
        try
        {

            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertDocuments]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Class", Id);
            cmd.Parameters.AddWithValue("@SubjectName", SubjectName);
            cmd.Parameters.AddWithValue("@Week", Week);
            cmd.Parameters.AddWithValue("@Topic", Topic);
            cmd.Parameters.AddWithValue("@Doctype", Doctype);
            cmd.Parameters.AddWithValue("@CreatedDate", CreatedDate);
            cmd.Parameters.AddWithValue("@Time", Time);
            cmd.Parameters.AddWithValue("@PreFileName", PreFileName);
            cmd.Parameters.AddWithValue("@UploadedAs", UploadedAs);
            cmd.Parameters.AddWithValue("@AssignmentSubmissionDate", AssignmentSubmissionDate);
            cmd.Parameters.AddWithValue("@PostFileName", PostFileName);
            cmd.Parameters.AddWithValue("@AssnFileName", AssnFilename);
            cmd.Parameters.AddWithValue("@RefFileName", RefFileName);
            cmd.Parameters.AddWithValue("@FileName", FileName);
            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public string InsertRole(string RDesc, string RName, string CDate, Int32 Org)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertRole]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RDesc", RDesc);
            cmd.Parameters.AddWithValue("@RoleName", RName);
            cmd.Parameters.AddWithValue("@CDate", CDate);
            cmd.Parameters.AddWithValue("@Org_ID", Org);


            //if (CDate == "")
            //{
            //    int flag = 1;
            //    cmd.Parameters.AddWithValue("@Flag", flag);
            //    cmd.Parameters.AddWithValue("@CDate", CDate);
            //}
            //else
            //{
            //    int flag = 2;
            //    cmd.Parameters.AddWithValue("@Flag", flag);
            //    cmd.Parameters.AddWithValue("@CDate", CDate);
            //}
            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public string InsertModule(int MCode, string MName, string EDate)
    {
        try
        {
            conn.Open();
            SqlCommand com = new SqlCommand("[InsertModule]", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@MCode", MCode);
            com.Parameters.AddWithValue("@MName", MName);

            //com.Parameters.AddWithValue("@EndDate", EDate);
            if (EDate == "")
            {
                int flag = 1;
                com.Parameters.AddWithValue("@Flag", flag);
                com.Parameters.AddWithValue("@EndDate", EDate);
            }
            else
            {
                int flag = 2;
                com.Parameters.AddWithValue("@Flag", flag);
                com.Parameters.AddWithValue("@EndDate", EDate);
            }

            using (conn)
                com.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }

    public string InsertObject(int objCode, string objName, int objCatId, int objParId, string endDate)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertObject]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Obj_Code", objCode);
            cmd.Parameters.AddWithValue("@Obj_Name", objName);
            cmd.Parameters.AddWithValue("@Obj_Cat_Id", objCatId);
            cmd.Parameters.AddWithValue("@Obj_Parent_Id", objParId);

            if (endDate == "")
            {
                int flag = 1;
                cmd.Parameters.AddWithValue("@Flag", flag);
                cmd.Parameters.AddWithValue("@End_Date", endDate);
            }
            else
            {
                int flag = 2;
                cmd.Parameters.AddWithValue("@Flag", flag);
                cmd.Parameters.AddWithValue("@End_Date", endDate);
            }

            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public string InsertAccessMaster(int UId, int ModId, int RoleId, int FrmId)
    {
        conn.Open();
        SqlCommand com = new SqlCommand("[InsertAccess]", conn);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@UId", UId);
        com.Parameters.AddWithValue("@ModId", ModId);
        com.Parameters.AddWithValue("@RoleId", RoleId);
        com.Parameters.AddWithValue("@FrmId", FrmId);



        using (conn)
            com.ExecuteNonQuery();
        conn.Close();
        return "Result";

    }
    public string InsertModDetails(int ModId, int FormId)
    {
        try
        {
            conn.Open();
            SqlCommand com = new SqlCommand("InsertModDetails", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@ModId", ModId);
            com.Parameters.AddWithValue("@FormId", FormId);

            using (conn)
                com.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch (Exception ex)
        {
            return "Error";
        }
    }
    public string InsertFormDetails(string FName, string FDesc)
    {
        try
        {
            conn.Open();
            SqlCommand com = new SqlCommand("InsertForm", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@FName", FName);
            com.Parameters.AddWithValue("@FDesc", FDesc);

            using (conn)
                com.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch (Exception ex)
        {
            return "Error";
        }
    }

    public string InsertUser(string UName, string pass, int Role, string Phone, string Email,
        Boolean Status, Int32 Org_Id, Int32 DeptID, Int32 EmpId, Int32 contID, Int32 siteId,
        string DeptIDs, string SiteIDs, string empIDs, string iContractlist, string isitelist, string ideptlist)
    {
        try
        {
            string result;
            conn.Open();
            SqlCommand com = new SqlCommand("InsertUser", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@UName", UName);
            com.Parameters.AddWithValue("@RID", Role);
            com.Parameters.AddWithValue("@Pass", pass);
            com.Parameters.AddWithValue("@Phone", Phone);
            com.Parameters.AddWithValue("@Email", Email);
            com.Parameters.AddWithValue("@Status", Status);
            com.Parameters.AddWithValue("@Org_ID", Org_Id);
            com.Parameters.AddWithValue("@Dept_Id", DeptID);
            com.Parameters.AddWithValue("@Emp_Id", EmpId);
            com.Parameters.AddWithValue("@Contract_Id", contID);
            com.Parameters.AddWithValue("@Site_Id", siteId);
            com.Parameters.AddWithValue("@DeptId", DeptIDs);
            com.Parameters.AddWithValue("@SiteIdList", SiteIDs);
            com.Parameters.AddWithValue("@empIDs", empIDs);
            com.Parameters.AddWithValue("@iContractlist", iContractlist);
            com.Parameters.AddWithValue("@isitelist", isitelist);
            com.Parameters.AddWithValue("@ideptlist", ideptlist);
            using (conn)
                result = (string)com.ExecuteScalar();
            conn.Close();
            return result;
        }
        catch (Exception ex)
        {
            return "Error";
        }
    }
    public string UpdatePassword(int UserId, string OldPassword, string NewPassword)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdatePassword]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", UserId);
            cmd.Parameters.AddWithValue("@OldPassword", OldPassword);
            cmd.Parameters.AddWithValue("@NewPassword", NewPassword);
            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch (Exception ex)
        {
            return "Error";
        }
    }
    public DataTable ProcObject(int Id)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Id", Id);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[ProcObject]");
        return ds.Tables[0];

    }


    public DataTable GetStartDate(string Week)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Week", Week);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[GetStartDate]");
        return ds.Tables[0];

    }
    public DataTable GetUploadedDocsStud(int Flag, int Class, string Subject, int Week, string Type)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@Class", Class);
        param[1] = new SqlParameter("@Subject", Subject);
        param[2] = new SqlParameter("@Week", Week);
        param[3] = new SqlParameter("@Flag", Flag);
        param[4] = new SqlParameter("@Type", Type);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[GetUploadedDocsStud]");
        return ds.Tables[0];

    }
    public string InsertType(string TypeName)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertDocType]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TypeName", TypeName);

            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public DataTable GetDeptame(string DeptName, int Flag)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Flag", Flag);
        param[1] = new SqlParameter("@Name", DeptName);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[IsValidData]");
        return ds.Tables[0];

    }
    public DataTable GetObjCatId(int ObjCatId, int Flag)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Flag", Flag);
        param[1] = new SqlParameter("@OCId", ObjCatId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[IsValidData]");
        return ds.Tables[0];

    }

    public string InsertDept(string DeptName)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertDept]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DEPARTMENT_NAME", DeptName);

            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public string InsertTeacher(string EMPNO, string Name, int SubjectId, int? DepartmentId, int? DesignationId)
    {
        try
        {

            if (DepartmentId == 0)
            {
                DepartmentId = null;
            }
            if (DesignationId == 0)
            {
                DesignationId = null;
            }
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertTeacher]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EMPNO", EMPNO);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
            cmd.Parameters.AddWithValue("@DepartmentId", DepartmentId);
            cmd.Parameters.AddWithValue("@DesignationId", DesignationId);

            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }
    }
    public DataTable GetDepartmentTeacher(string DeptName, int Flag)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Flag", Flag);
        param[1] = new SqlParameter("@Name", DeptName);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[IsValidData]");
        return ds.Tables[0];

    }
    public DataTable GetEMPNOfromTeacher(string EMPNO, int Flag)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Name", EMPNO);
        param[1] = new SqlParameter("@Flag", Flag);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[IsValidData]");
        return ds.Tables[0];

    }
    public string UpdateTeacher(string EMPNO, string Name, int SubjectId, int? DepartmentId, int? DesignationId)
    {
        try
        {

            if (DepartmentId == 0)
            {
                DepartmentId = null;
            }
            if (DesignationId == 0)
            {
                DesignationId = null;
            }
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdateTeacher]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EMPNO", EMPNO);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
            cmd.Parameters.AddWithValue("@DepartmentId", DepartmentId);
            cmd.Parameters.AddWithValue("@DesignationId", DesignationId);

            using (conn)
                cmd.ExecuteNonQuery();
            conn.Close();
            return "Result";
        }
        catch
        {
            return "Error";
        }

    }
    public DataTable SetGridbyDepartment(int Flag, int DepartmentId)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Flag", Flag);
        param[1] = new SqlParameter("@DepartmentId", DepartmentId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[SetGridbyDepartment]");
        return ds.Tables[0];
    }
    public DataTable SetDropdownList(int Flag)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Flag", Flag);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[ProcSetDropdownECLNew]");
        return ds.Tables[0];
    }
    public DataTable BindGrid(int Flag)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Flag", Flag);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[IsDetail]");
        return ds.Tables[0];
    }

    public DataTable BindGridById(int Flag, int Id)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Flag", Flag);
        param[1] = new SqlParameter("@Id", Id);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[ProcSetGridByIdECL]");
        return ds.Tables[0];
    }
    public DataTable BindFormsByModule(int Id)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Id", Id);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[BindFormsByModule]");
        return ds.Tables[0];
    }
    public DataTable BindGridByIdNew(int Flag, int Id)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Flag", Flag);
        param[1] = new SqlParameter("@Id", Id);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[SetGridById]");
        return ds.Tables[0];
    }


    public DataTable BindObjects()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getResult("[GetObjects]");
        return ds.Tables[0];
    }
    public DataTable BindRole(Int32 Org_Id)
    {
        DataAccessLayer da = new DataAccessLayer();
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@ORG_ID", Org_Id);
        DataSet ds = da.getDataByParamSecurity(param, "[GetRole]");
        return ds.Tables[0];
    }

    public DataTable BindModInAccess()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getResult("[BindModInAccess]");
        return ds.Tables[0];
    }
    public DataTable BindDept(int id, string operation, int headid, string email)
    {
        DataAccessLayer da = new DataAccessLayer();
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@HEAD_ID", headid);
        param[1] = new SqlParameter("@HEAD_EMAIL", email);
        param[2] = new SqlParameter("@Operation", operation);
        param[3] = new SqlParameter("@ID", id);
        DataSet ds = da.getDataByParamUnis(param, "[sp_Department]");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public DataTable BindDLModule()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getResult("[BindDLModule]");
        return ds.Tables[0];
    }
    public DataTable BindForms()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getResult("[GetForm]");
        return ds.Tables[0];
    }
    public DataTable BindModule()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getResult("[GetModule]");
        return ds.Tables[0];
    }
    public DataTable BindAccess(int Id)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@RId", Id);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[SetGridNew]");
        return ds.Tables[0];

    }
    public DataTable BindMenu(int Id, string language)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@User_ID", Id);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[GetFormsByUser]");
        return ds.Tables[0];
    }
    public DataTable BindMenuBytheUser(int Id, int ApplicationId)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@User_ID", Id);
        param[1] = new SqlParameter("@ApplicationId", ApplicationId);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[sp_BindMenuBytheUser]");
        return ds.Tables[0];
    }
    public DataTable BindMenubyAppId(int Id, int AppId, string language)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@User_ID", Id);
        param[1] = new SqlParameter("@AppID", AppId);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[GetFormsByUser]");
        return ds.Tables[0];
    }
    public DataTable BindApplication(int Id, string language)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@User_ID", Id);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[GetApplicationByUser]");
        return ds.Tables[0];
    }
    public DataTable BindUserData(int Id)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@User_ID", Id);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[GetUserDetails]");
        return ds.Tables[0];
    }
    public DataTable BindUserDataForKPI(string empNum)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Empno", empNum);
        param[1] = new SqlParameter("@oper", 4);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[GetUserDetails]");
        return ds.Tables[0];
    }
    public DataTable ValidateUser(String UserName, String Password)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@User_Name", UserName);
        param[1] = new SqlParameter("@Password", Password);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[ValidateUser]");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0];
        }
        else
        {
            return null;
        }
    }



    public DataTable BindFormAccess()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getResult("[GridFormsAccess]");
        return ds.Tables[0];
    }
    public DataTable BindGridModDet()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getResult("[SetGridModDet]");
        return ds.Tables[0];
    }
    public DataTable BindGridUser(Int32 Org_ID, Int32 UserId)
    {
        DataAccessLayer da = new DataAccessLayer();
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Org_ID", Org_ID);
        param[1] = new SqlParameter("@UserId", UserId);
        DataSet ds = da.getDataByParamSecurity(param, "[SetGridUser]");
        return ds.Tables[0];
    }

    public DataTable BindDeptGrid(Int32 EmpID)
    {
        DataAccessLayer da = new DataAccessLayer();
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@EmpID", EmpID);
        DataSet ds = da.getDataByParamSecurity(param, "[Sp_ListDept]");
        return ds.Tables[0];
    }

    public DataTable ValidateUserActiveDirectory(String UserName)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@User_Name", UserName);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[ValidateUserActiveDirectory]");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0];
        }
        else
        {
            return null;
        }
    }

    public DataTable GetEmpbyDeparment(int empId)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@EmpId", empId);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "sp_FillEmpDept");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0];
        }
        else
        {
            return null;
        }
    }
    public DataTable GetEmpbyDeparment(string uname)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@EmpId", uname);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "sp_FillEmpDept");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0];
        }
        else
        {
            return null;
        }
    }

    public DataTable GetAllRolesOfCurrentUserExceptTODO(Int32 userid)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@userId", userid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[sp_GetUserAllRoles]");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0];
        }
        else
        {
            return null;
        }
    }

}