using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public class CDummyCompile
{
    private string connection;
    public CDummyCompile()
    {
        connection = null;
        this.connection = ConfigurationManager.ConnectionStrings["UnisCon"].ToString();
    }
    public bool isDateExists(string date, Int32 Contract, Int32 Site)
    {
        try
        {
            int result = 0;
            SqlConnection con = new SqlConnection(this.connection);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "EXEC CheckOracledate '" + date + "'," + Contract + "," + Site;
            result = Convert.ToInt32(cmd.ExecuteScalar());
            if (result > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        catch (Exception e)
        {
            return false;
        }
    }
    public void pushlogDepartment(string vDate, string vNewDate, int Contract_ID, int Site_ID)
    {
        SqlConnection cn = new SqlConnection(this.connection);
        cn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        cmd.CommandText = "CompileByContract";
        cmd.CommandType = CommandType.StoredProcedure;

        SqlParameter p = default(SqlParameter);
        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@vDate", SqlDbType.VarChar, 8));
        p.Value = vDate;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@nDate", SqlDbType.VarChar, 8));
        p.Value = vNewDate;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Site_ID", SqlDbType.Int));
        p.Value = Site_ID;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Contract_ID", SqlDbType.Int));
        p.Value = Contract_ID;

        cmd.CommandTimeout = 0;
        cmd.ExecuteNonQuery();

        cn.Close();
        cmd = null;
        cn = null;
    }
    public DataTable fillData(string vsql)
    {
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(vsql, this.connection);
            DataTable dt = new DataTable();
            da.Fill(dt);
            da = null;
            return dt;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public string save(string vsql)
    {

        try
        {
            SqlConnection con = new SqlConnection(this.connection);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = vsql;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return "";
        }
        catch (Exception e)
        {
            return e.Message.ToString();
        }
    }
    public Int32 IfRemarkExist(int Eid, string Edate)
    {
        DataTable result = null;
        try
        {
            using (SqlConnection con = new SqlConnection(this.connection))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "select ID from Tb_EmpRemarks where EmpID = @EmpID and EDate=@Edate";
                    cmd.Parameters.Add(new SqlParameter("@EmpID", Eid));
                    cmd.Parameters.Add(new SqlParameter("@Edate", Edate));

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        result = new DataTable();
                        da.Fill(result);
                    }

                    if (result.Rows.Count == 1)
                    {
                        return Convert.ToInt32(result.Rows[0]["ID"]);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            return 0;
        }

        //user id not found, lets treat him as a guest        
        return 0;
    }
    public void pushlogAttendanceFinalize(string vdate, string vnewdate, int varhour)
    {
        SqlConnection cn = new SqlConnection(this.connection);
        cn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        SqlParameter p = default(SqlParameter);


        cmd.CommandText = "cfinalizemodified";
        cmd.CommandType = CommandType.StoredProcedure;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@vdate", SqlDbType.VarChar, 8));
        p.Value = vdate;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ndate", SqlDbType.VarChar, 8));
        p.Value = vnewdate;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@var", SqlDbType.Int));
        p.Value = varhour;

        cmd.CommandTimeout = 0;
        cmd.ExecuteNonQuery();

        cn.Close();
        cmd = null;
        cn = null;
    }
    public bool isFinalized(string date)
    {
        try
        {
            int lid = 0;
            SqlConnection con = new SqlConnection(this.connection);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from tb_operation_status where is_process ='F' and e_date='" + date + "'";

            SqlDataReader reader = default(SqlDataReader);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                lid = lid + 1;
            }
            reader.Close();
            if ((lid <= 0))
            {
                con.Close();
                cmd.Dispose();
                return false;
            }
            con.Close();
            cmd.Dispose();
            return true;


        }
        catch (Exception e)
        {
            return false;
        }
    }
    public string GetRemarksByIDdate(string vsql)
    {

        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(vsql, this.connection);
            da.Fill(dt);
            da = null;
            string Remarks = string.Empty;
            if (dt.Rows.Count > 0)
            {
                Remarks = Convert.ToString(dt.Rows[0][0]);
                dt.Dispose();
                return Remarks;
            }
            else
            {
                dt.Dispose();
                return "";
            }

        }
        catch (Exception e)
        {
            return e.Message.ToString();
        }
    }
    public string getEmailByID(int EmpID)
    {
        SqlConnection con = null;
        SqlDataAdapter dataAdapter = null;
        DataSet ds = null;
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            string Query = "Select StaffMail from vw_mailmaster_staff where UnisMachineCode=" + EmpID;
            dataAdapter = new SqlDataAdapter(Query, con);
            dataAdapter.SelectCommand.CommandType = CommandType.Text;
            dataAdapter.SelectCommand.ExecuteNonQuery();
            ds = new DataSet();
            dataAdapter.Fill(ds);
            if (ds != null && ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    return Convert.ToString(ds.Tables[0].Rows[0][0]);
                }
            }
            return "";
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (con.State.Equals("Open"))
                con.Close();
            con.Dispose();
            dataAdapter.Dispose();
            ds.Dispose();
        }
        return null;
    }
    public DataTable getCompiledAttendance(string vdate, Int32 contract, Int32 Site)
    {
        string vQuery = "";
        vQuery = "Exec getCompiledAttendance " + vdate + "," + contract + "," + Site;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(vQuery, this.connection);
        da.Fill(dt);
        da = null;
        return dt;
    }
    public DataTable getMultipleEmployee1(string vDate, Int32 Contract_ID, Int32 Site_ID, string EmpId)
    {
        try
        {
            string vQuery = "";
            vQuery = "Exec GetErrorEntry " + Contract_ID + "," + Site_ID + ",'" + vDate + "'," + EmpId;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(vQuery, this.connection);
            da.Fill(dt);
            da = null;
            return dt;
        }
        catch (Exception Ex)
        {
            return null;
        }
    }
    public DataTable getpairingDetail(string vDate, string vEID)
    {
        string vQuery = null;
        vQuery = "Exec GetPairedAttendance '" + vDate + "'," + vEID;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(vQuery, this.connection);
        da.Fill(dt);
        da = null;
        return dt;
    }
    public bool DeletePunch(string vdate, string etime, string eid, string ename)
    {
        try
        {
            SqlConnection cn = new SqlConnection(this.connection);
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "update tenter set upload='D' where C_date= '" + vdate + "' and L_Uid='" + eid + "' and C_time='" + etime + "'";
            cmd.ExecuteNonQuery();

            cmd.CommandText = "update error_entry_department set manual_correction='C' where e_id='" + eid + "' and e_date='" + vdate + "'";
            cmd.ExecuteNonQuery();

            cn.Close();
            cn = null;
            cmd = null;
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
    public bool addPunch(string vdate, string etime, int eid, string ename, int mode, int TerminalId)
    {
        try
        {
            SqlConnection cn = new SqlConnection(this.connection);
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            string sql = "";

            sql = "insert into tenter(C_date,C_time,L_Tid,L_Uid,C_name,upload,L_mode)values(" + "'" + vdate + "','" + etime + "'," + TerminalId + ",'" + Convert.ToString(eid) + "','" + ename + "','M'," + mode + ")";
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();

            cmd.CommandText = "update error_entry_department set manual_correction='C' where e_id='" + eid + "' and e_date='" + vdate + "'";
            cmd.ExecuteNonQuery();

            cn.Close();
            cn = null;
            cmd = null;
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }

    }
    public DataTable getNextEntry(string vDate, string vEMPID)
    {
        string vQuery = "";
        //vQuery = "SELECT e_idno as EMPID,e_name as Name,e_time as Time,upload as Status FROM tenter WHERE e_date='" & vDate & "' and e_idno='" & vEMPID & "'  order by e_time"
        vQuery = "SELECT L_Uid as EMPID, C_name as Name,C_time as Time, upload as Status,L_Tid as Terminal, L_mode as Mode from tenter WHERE C_date='" + vDate + "' and L_Uid='" + vEMPID + "'  order by C_time";

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(vQuery, this.connection);
        da.Fill(dt);
        da = null;
        return dt;
    }
    public DataTable getMultiple(string vDate, int vFID, string vEID)
    {
        string vQuery = null;
        vQuery = "Exec BindDayAttendance '" + vDate + "'," + vEID;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(vQuery, this.connection);
        da.Fill(dt);
        da = null;
        return dt;
    }
    public DataTable getMultipleEmployee(string vDate, string vFID)
    {
        string vQuery = "";
        vQuery = "SELECT distinct(e_id) as EMPID,e_name as Name,cnt as [Count] FROM qr_inout_error_department WHERE e_date='" + vDate + "' and dept_id='" + vFID + "' and cnt>=1 order by e_id";
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(vQuery, this.connection);
        da.Fill(dt);
        da = null;
        return dt;
    }
    public DataTable getcompiledAttendenceByDept(string deptname = "", string vdate = "")
    {
        string vQuery = "";
        string sel = null;
        string Total = null;
        sel = "UNASSIGNED";
        Total = "All";
        if ((deptname == "UNASSIGNED"))
        {
            vQuery = "Select L_ID as EMPID,e_name as Name,isnull(Department,'UNASSIGNED') as Department,substring([in],1,2)+':'+SUBSTRING([in],3,2)+':'+SUBSTRING([in],5,6) as TimeIn,substring(e_date,7,2)+'/'+substring(e_date,5,2)+'/'+substring(e_date,1,4) as InDate,substring([out],1,2)+':'+SUBSTRING([out],3,2)+':'+SUBSTRING([out],5,6) as TimeOut,workedhrs as [Worked(Hrs)],workedmts as [Worked(min)] from vAttendanceCompiled where e_date='" + vdate + "' and Department is null order by EMPID ";
        }
        else if ((deptname == "ALL"))
        {
            vQuery = "Select L_ID as EMPID,e_name as Name,isnull(Department,'UNASSIGNED') as Department,substring([in],1,2)+':'+SUBSTRING([in],3,2)+':'+SUBSTRING([in],5,6) as TimeIn,substring(e_date,7,2)+'/'+substring(e_date,5,2)+'/'+substring(e_date,1,4) as InDate,substring([out],1,2)+':'+SUBSTRING([out],3,2)+':'+SUBSTRING([out],5,6) as TimeOut,substring(outdate,7,2)+'/'+substring(outdate,5,2)+'/'+substring(outdate,1,4) as OutDate,workedhrs as [Worked(Hrs)],workedmts as [Worked(min)] from vAttendanceCompiled where e_date='" + vdate + "' order by Department,EMPID ";
        }
        else
        {
            vQuery = "Select L_ID as EMPID,e_name as Name,isnull(Department,'UNASSIGNED') as Department,substring([in],1,2)+':'+SUBSTRING([in],3,2)+':'+SUBSTRING([in],5,6) as TimeIn,substring(e_date,7,2)+'/'+substring(e_date,5,2)+'/'+substring(e_date,1,4) as InDate,substring([out],1,2)+':'+SUBSTRING([out],3,2)+':'+SUBSTRING([out],5,6) as TimeOut,substring(outdate,7,2)+'/'+substring(outdate,5,2)+'/'+substring(outdate,1,4) as OutDate,workedhrs as [Worked(Hrs)],workedmts as [Worked(min)] from vAttendanceCompiled where e_date='" + vdate + "' and Department='" + deptname + "' order by EMPID ";
        }
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(vQuery, this.connection);
        da.Fill(dt);
        da = null;
        return dt;

    }
    public DataTable getProcessedAttendance(string vdate)
    {
        string vQuery = "";
        vQuery = "Select e_id as EMPID,e_name as Name,deptid as Department,substring([in],1,2)+':'+SUBSTRING([in],3,2)+':'+SUBSTRING([in],5,6) as TimeIn,substring(e_date,7,2)+'/'+substring(e_date,5,2)+'/'+substring(e_date,1,4) as InDate,substring([out],1,2)+':'+SUBSTRING([out],3,2)+':'+SUBSTRING([out],5,6) as TimeOut,substring(outdate,7,2)+'/'+substring(outdate,5,2)+'/'+substring(outdate,1,4) as OutDate,workedhrs as [Worked(Hrs)],workedmts as [Worked(min)],tte as TransferedToERP,ttd as TransferDate,ttuid as TransferedBy from attendance_finalize_department_MHS where e_date='" + vdate + "' order by Department,EMPID";
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(vQuery, this.connection);
        da.Fill(dt);
        da = null;
        return dt;
    }
    public DataTable GetTerminals()
    {
        try
        {
            string vQuery = "";
            vQuery = "select L_ID,C_Name from tTerminal";
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(vQuery, this.connection);
            da.Fill(dt);
            da = null;
            return dt;
        }
        catch (Exception Ex)
        {
            return null;
        }
    }

    public string GetLastCompiled()
    {
        try
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            string result = "";
            try
            {
                con = new SqlConnection(this.connection);
                con.Open();
                cmd = new SqlCommand("GetlastCompiled", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                result = Convert.ToString(cmd.ExecuteScalar());
                return result;
            }
            catch (SqlException e)
            {
                System.Console.Write(e.Message);
            }
            finally
            {
                cmd.Dispose();
                if (con.State.Equals("Open"))
                    con.Close();
                con.Dispose();
            }
            return result;

        }
        catch (Exception Ex)
        {
            return "";
        }
    }
    public string GetLastOracle(Int32 contract, Int32 Site)
    {
        try
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlParameter p = default(SqlParameter);
            string result = "";
            try
            {
                con = new SqlConnection(this.connection);
                con.Open();
                cmd = new SqlCommand("GetLastOracleDate", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Contract_ID", SqlDbType.Int));
                p.Value = contract;

                p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Site_ID", SqlDbType.Int));
                p.Value = Site;


                result = Convert.ToString(cmd.ExecuteScalar());
                return result;
            }
            catch (SqlException e)
            {
                System.Console.Write(e.Message);
            }
            finally
            {
                cmd.Dispose();
                if (con.State.Equals("Open"))
                    con.Close();
                con.Dispose();
            }
            return result;

        }
        catch (Exception Ex)
        {
            return "";
        }
    }
    /* Added on 08-Jun-2016 */
    public DataTable CheckCompiledAttendanceStatus(string vdateFrom, string vdateTo)
    {
        string vQuery = "";
        vQuery = "Exec SP_CheckCompileStatus " + vdateFrom + "," + vdateTo;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(vQuery, this.connection);
        da.Fill(dt);
        da = null;
        return dt;
    }
    public void pushlogDepartmentDateRange(string vDateFrom, string vDateTo, string vNewDate, int Contract_ID, int Site_ID)
    {
        SqlConnection cn = new SqlConnection(this.connection);
        cn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        cmd.CommandText = "CompileByContract_DateRange";
        cmd.CommandType = CommandType.StoredProcedure;

        SqlParameter p = default(SqlParameter);
        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@vDateFrom", SqlDbType.VarChar, 8));
        p.Value = vDateFrom;
        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@vDateTo", SqlDbType.VarChar, 8));
        p.Value = vDateTo;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@nDate", SqlDbType.VarChar, 8));
        p.Value = vNewDate;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Site_ID", SqlDbType.Int));
        p.Value = Site_ID;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Contract_ID", SqlDbType.Int));
        p.Value = Contract_ID;

        cmd.CommandTimeout = 0;
        cmd.ExecuteNonQuery();

        cn.Close();
        cmd = null;
        cn = null;
    }
    public DataTable getCompiledAttendance_DateRange(string vDateFrom, string vDateTo, Int32 contract, Int32 Site)
    {
        string vQuery = "";
        vQuery = "Exec getCompiledAttendance_DateRange " + vDateFrom + "," + vDateTo + "," + contract + "," + Site;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(vQuery, this.connection);
        da.Fill(dt);
        da = null;
        return dt;
    }

    public void InsertManualEntry_Daterange(int EmpID, string vDateFrom, string vDateTo, string Remarks, string UserName,
        string Name, string FromTime, string ToTime)
    {
        SqlConnection cn = new SqlConnection(this.connection);
        cn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        cmd.CommandText = "SP_INSERT_ManualEntry_Daterange";
        cmd.CommandType = CommandType.StoredProcedure;

        SqlParameter p = default(SqlParameter);
        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@EmpID", SqlDbType.VarChar, 8));
        p.Value = EmpID;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FromDate", SqlDbType.VarChar, 8));
        p.Value = vDateFrom;
        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Todate", SqlDbType.VarChar, 8));
        p.Value = vDateTo;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Remarks", SqlDbType.VarChar, 400));
        p.Value = Remarks;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@UserName", SqlDbType.VarChar, 400));
        p.Value = UserName;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@EmpName", SqlDbType.VarChar, 400));
        p.Value = Name;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FromTime", SqlDbType.VarChar, 8));
        p.Value = FromTime;

        p = cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ToTime", SqlDbType.VarChar, 8));
        p.Value = ToTime;


        cmd.CommandTimeout = 0;
        cmd.ExecuteNonQuery();

        cn.Close();
        cmd = null;
        cn = null;
    }



}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             