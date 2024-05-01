using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

using System.Configuration;

//namespace TimeAndAttendanceaspx
//{
    public static class CGernealFunctions
    {
        
        public static DataTable fillPresentEmpTypeWise(string todate, string fromdate, string EmpType, string ToTime, string fromTime, string Weekend)
        {

            SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("sp_DailyPresentEmpTypeWise", con);
                cmd.Parameters.Add(new SqlParameter("@vDate", fromdate));
                cmd.Parameters.Add(new SqlParameter("@vEdate", todate));
                cmd.Parameters.Add(new SqlParameter("@EmpType", EmpType));
                cmd.Parameters.Add(new SqlParameter("@FromTime", Convert.ToInt32(fromTime)));
                cmd.Parameters.Add(new SqlParameter("@ToTime", Convert.ToInt32(ToTime)));
                cmd.Parameters.Add(new SqlParameter("@Weekend", Weekend));

                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }

            catch (Exception ex)
            {
                return null;
            }

        }
        //public static DataTable GetEmailById(int id)
        //{
        //    try {
        //        DataTable dt = new DataTable();
        //        string vsql = "select * from [vw_mailmaster_staff] where UnisMachineCode=" + id;
        //        SqlDataAdapter da = new SqlDataAdapter(vsql, CGlobal.getNewConnectionSql());
        //        da.Fill(dt);
        //        da = null;
        //        return dt;
        //    }
        //    catch (Exception Ex)
        //    {
        //        return null;
        //    }
        //}
        public static string GetRemarksByIDdate(string vsql)
        {

            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(vsql, CGlobal.getConnectionSql());
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
        public static DataTable fillManualReport(string todate, int deptid)
        {

            SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("sp_ManualEntries", con);
                cmd.Parameters.Add(new SqlParameter("@fromDate", todate));
                cmd.Parameters.Add(new SqlParameter("@ToDate", todate));
                cmd.Parameters.Add(new SqlParameter("@deptid", deptid));

                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }

            catch (Exception ex)
            {
                return null;
            }

        }
        public static DataTable fillData(string vsql)
        {
            try
            {
                DataAccessLayer dal = new DataAccessLayer();
                SqlDataAdapter da = new SqlDataAdapter(vsql, CGlobal.getConnectionSql());
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
        public static DataTable fillDataSec(string vsql)
        {
            try
            {
                DataAccessLayer dal = new DataAccessLayer();
                SqlDataAdapter da = new SqlDataAdapter(vsql, CGlobal.getSecConnectionSql());
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
        public static DataTable fillDataWithProcedure(string ProcedureName, string todate, string fromdate, int deptid, string days)
        {

            SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand(ProcedureName, con);
                cmd.Parameters.Add(new SqlParameter("@vDate", fromdate));
                cmd.Parameters.Add(new SqlParameter("@vEdate", todate));
                cmd.Parameters.Add(new SqlParameter("@deptno", deptid));
                cmd.Parameters.Add(new SqlParameter("@Weekend", days));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }

            catch (Exception ex)
            {
                return null;
            }

        }
        public static bool isDetailspresent(string empid)
        {
            try
            {
                int vsql = 0;
                int lid = 0;
                lid = 0;
                vsql = Convert.ToInt32(empid);
                SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
                SqlCommand cmd = new SqlCommand();
                con.Open();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "Select distinct L_UID from Tb_EmployeeMaster where L_UID=" + vsql;

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

        public static bool isCompiled(string date)
        {
            try
            {
                int lid = 0;
                SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
                SqlCommand cmd = new SqlCommand();
                con.Open();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from compilestatus	where e_date='" + date + "'";

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
        public static DataTable fillDailyPresentEmpWise(string todate, string fromdate, int EmpId, string ToTime, string fromTime, string Weekend)
        {

            SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("sp_DailyPresentEmpWise", con);
                cmd.Parameters.Add(new SqlParameter("@vDate", fromdate));
                cmd.Parameters.Add(new SqlParameter("@vEdate", todate));
                cmd.Parameters.Add(new SqlParameter("@EmpId", EmpId));
                cmd.Parameters.Add(new SqlParameter("@FromTime", Convert.ToInt32(fromTime)));
                cmd.Parameters.Add(new SqlParameter("@ToTime", Convert.ToInt32(ToTime)));
                cmd.Parameters.Add(new SqlParameter("@Weekend", Weekend));

                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }

            catch (Exception ex)
            {
                return null;
            }

        }
        public static DataTable fillEmpWise(string todate, string fromdate, int EmpNo, string Weekend)
        {

            SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("sp_compiledreportEmpWise", con);
                cmd.Parameters.Add(new SqlParameter("@vDate", fromdate));
                cmd.Parameters.Add(new SqlParameter("@vEdate", todate));
                cmd.Parameters.Add(new SqlParameter("@EmpNo", EmpNo));
                cmd.Parameters.Add(new SqlParameter("@Weekend", Weekend));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }

            catch (Exception ex)
            {
                return null;
            }

        }
        public static DataTable fillError(string todate,int deptid)
        {

            SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("Sp_ErrorReport", con);

                cmd.Parameters.Add(new SqlParameter("@Edate", todate));
                cmd.Parameters.Add(new SqlParameter("@deptid", deptid));
                
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }

            catch (Exception ex)
            {
                return null;
            }

        }
        public static DataTable fillDailyPresent(string todate, string fromdate, int deptid, string ToTime, string fromTime, string Days)
        {

            SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("sp_DailyPresent", con);
                cmd.Parameters.Add(new SqlParameter("@vDate", fromdate));
                cmd.Parameters.Add(new SqlParameter("@vEdate", todate));
                cmd.Parameters.Add(new SqlParameter("@deptno", deptid));
                cmd.Parameters.Add(new SqlParameter("@FromTime", Convert.ToInt32(fromTime)));
                cmd.Parameters.Add(new SqlParameter("@ToTime", Convert.ToInt32(ToTime)));
                cmd.Parameters.Add(new SqlParameter("@Days", Days));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }

            catch (Exception ex)
            {
                return null;
            }

        }
        public static bool isFinalized(string date)
        {
            try
            {
                int lid = 0;
                SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
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
        public static bool isShiftDetailspresent(string ShiftID)
        {
            try
            {
                int vsql = 0;
                int lid = 0;
                lid = 0;
                vsql = Convert.ToInt32(ShiftID);
                SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
                SqlCommand cmd = new SqlCommand();
                con.Open();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "Select distinct Shift_ID from tb_ShiftDetail where Shift_ID=" + vsql;

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
        public static string save(string vsql)
        {

            try
            {
                SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
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
        public static string GetScopeIdentity(string vsql)
        {

            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(vsql, CGlobal.getConnectionSql());
                da.Fill(dt);
                da = null;
                string ID = string.Empty;
                if (dt.Rows.Count > 0)
                {
                    ID = Convert.ToString(dt.Rows[0][0]);
                    dt.Dispose();
                    return ID;
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
        public static bool CheckUser(string username, string password)
        {
            DataTable result = null;
            try
            {
                using (SqlConnection con = new SqlConnection(CGlobal.getConnectionSql()))
                {
                    using (SqlCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "select password from Tb_LoginUser where username = @uname";
                        cmd.Parameters.Add(new SqlParameter("@uname", username));

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            result = new DataTable();
                            da.Fill(result);
                        }

                        if (password.Trim() == result.Rows[0]["password"].ToString().Trim())
                        {
                            //user id found and password is matched too so lets do soemthing now
                            return true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //Pokemon exception handling
            }

            //user id not found, lets treat him as a guest        
            return false;
        }

        //Get the Roles for this particular user
        public static Int32 IfRemarkExist(int Eid, string Edate)
        {
            DataTable result = null;
            try
            {
                using (SqlConnection con = new SqlConnection(CGlobal.getConnectionSql()))
                {
                    using (SqlCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "select ID from UNIS..Tb_EmpRemarks where EmpID = @EmpID and EDate=@Edate";
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

        public static string GetUserRoles(string username)
        {
            DataTable result = null;
            try
            {
                using (SqlConnection con = new SqlConnection(CGlobal.getConnectionSql()))
                {
                    using (SqlCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "select role from Tb_LoginUser where username = @uname";
                        cmd.Parameters.Add(new SqlParameter("@uname", username));

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            result = new DataTable();
                            da.Fill(result);
                        }

                        if (result.Rows.Count == 1)
                        {
                            return result.Rows[0]["role"].ToString().Trim();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //Pokemon exception handling
            }

            //user id not found, lets treat him as a guest        
            return "guest";
        }
        public static int isExisting(string vquery)
        {
            int lid = 0;
            SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = vquery;
            SqlDataReader reader = default(SqlDataReader);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                lid = int.Parse(reader[0].ToString());
                //lid = lid + 1;
            }
            reader.Close();
            if ((lid <= 0))
            {
                con.Close();
                cmd.Dispose();
                return lid;
            }
            con.Close();
            cmd.Dispose();
            return lid;
        }
        public static bool delete(string vquery)
        {
            try
            {
                SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
                SqlCommand cmd = new SqlCommand();
                con.Open();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = vquery;
                cmd.ExecuteNonQuery();
                con.Close();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
       
    public static int AssignSubDept(string vquery)
    {
        try
        {
            SqlConnection con = new SqlConnection(CGlobal.getConnectionSql());
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = vquery;
            Int32 newId = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            return newId;
        }
        catch (Exception ex)
        {
            return 0;
        }
    }

}

//}


