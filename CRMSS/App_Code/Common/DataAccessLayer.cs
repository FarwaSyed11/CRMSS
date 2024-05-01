using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public class DataAccessLayer : Object
{
    private string connection;
    private string UnisConnection;
    private string SecurityConnection;
    public DataAccessLayer()
    {
      
        SecurityConnection = null;
        SecurityConnection = ConfigurationManager.ConnectionStrings["SecurityCon"].ToString();
    }
    public DataSet executeSP(string strStoreProcedure)
    {
        SqlConnection con = null;
        SqlDataAdapter dataAdapter = null;
        DataSet ds = null;
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            dataAdapter = new SqlDataAdapter(strStoreProcedure, con);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.CommandTimeout = 300;
            //dataAdapter.SelectCommand.ExecuteNonQuery();
            ds = new DataSet();
            dataAdapter.Fill(ds);
            if (ds != null && ds.Tables.Count > 0)
                return ds;
        }
        catch (SqlException e)
        {
            System.Console.Write(e.Message);
        }
        finally
        {
            if (con.State.Equals("Open"))
                con.Close();
            con.Dispose();
        }
        return ds;
    }

    public DataSet Execute(SqlParameter[] param, string strStoreProcedure)
    {

        SqlConnection con = null;
        SqlDataAdapter dataAdapter = null;
        DataSet ds = null;
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            dataAdapter = new SqlDataAdapter(strStoreProcedure, con);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.CommandTimeout = 300;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                dataAdapter.SelectCommand.Parameters.Add(param[j]);
            //dataAdapter.SelectCommand.ExecuteNonQuery();
            ds = new DataSet();
            dataAdapter.Fill(ds);
            if (ds != null && ds.Tables.Count > 0)
                return ds;

        }
        catch (Exception ex)
        {
           
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

    public bool insertBulk(string Tablename, DataTable dt)
    {
        SqlConnection con = null;

        try
        {
            con = new SqlConnection(this.connection);
            con.Open();

            using (SqlBulkCopy bc = new SqlBulkCopy((SqlConnection)con))
            {
                bc.DestinationTableName = Tablename;
                bc.WriteToServer(dt);
                bc.Close();
            }
            con.Close();
            return true;
        }
        catch (Exception Ex)
        {
            return false;
        }
    }
    public void ExecuteProcedure(string strStoreProcedure)
    {

        SqlConnection con = null;
        SqlCommand cmd = null;
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            cmd = new SqlCommand(strStoreProcedure, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandTimeout = 120;
            cmd.ExecuteNonQuery();
        }
        catch (Exception Ex)
        {

        }
        finally
        {
            if (con.State.Equals("Open"))
                con.Close();
            con.Dispose();

        }
    }
    public bool isInsert(SqlParameter[] param, string strStoreProcedure)
    {
        SqlConnection con = null;
        SqlCommand cmd = null;
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            cmd = new SqlCommand(strStoreProcedure, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandTimeout = 120;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                cmd.Parameters.Add(param[j]);
            cmd.ExecuteNonQuery();
            return true;
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
        return false;
    }

    public DataSet getDataByParamUnis(SqlParameter[] param, string strStoreProcedure)
    {
        SqlConnection con = null;
        SqlDataAdapter dataAdapter = null;
        DataSet ds = null;
        try
        {
            con = new SqlConnection(this.UnisConnection);
            con.Open();
            dataAdapter = new SqlDataAdapter(strStoreProcedure, con);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.CommandTimeout = 60;


            int i = param.Length;
            for (int j = 0; j < i; j++)
                dataAdapter.SelectCommand.Parameters.Add(param[j]);
            //dataAdapter.SelectCommand.ExecuteNonQuery();
            ds = new DataSet();
            dataAdapter.Fill(ds);
            if (ds != null && ds.Tables.Count > 0)
                return ds;

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
    public DataSet getDataByParam(string strStoreProcedure)
    {
        SqlConnection con = null;
        SqlDataAdapter dataAdapter = null;
        DataSet ds = null;
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            dataAdapter = new SqlDataAdapter(strStoreProcedure, con);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.CommandTimeout = 300;
            //dataAdapter.SelectCommand.ExecuteNonQuery();
            ds = new DataSet();
            dataAdapter.Fill(ds);
            if (ds != null && ds.Tables.Count > 0)
                return ds;
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
    public DataSet getDataByParamTimeout(SqlParameter[] param, string strStoreProcedure)
    {
        SqlConnection con = null;
        SqlDataAdapter dataAdapter = null;
        DataSet ds = null;
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            dataAdapter = new SqlDataAdapter(strStoreProcedure, con);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.CommandTimeout = 300;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                dataAdapter.SelectCommand.Parameters.Add(param[j]);
            //dataAdapter.SelectCommand.ExecuteNonQuery();
            ds = new DataSet();
            dataAdapter.Fill(ds);
            if (ds != null && ds.Tables.Count > 0)
                return ds;

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
    public DataSet getDataByParamTimeouts(SqlParameter[] param, string strStoreProcedure)
    {
        SqlConnection con = null;
        SqlDataAdapter dataAdapter = null;
        DataSet ds = null;
        try
        {
            con = new SqlConnection(this.UnisConnection);
            con.Open();
            dataAdapter = new SqlDataAdapter(strStoreProcedure, con);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.CommandTimeout = 300;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                dataAdapter.SelectCommand.Parameters.Add(param[j]);
            //dataAdapter.SelectCommand.ExecuteNonQuery();
            ds = new DataSet();
            dataAdapter.Fill(ds);
            if (ds != null && ds.Tables.Count > 0)
                return ds;

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
    public DataSet getDataByParam(SqlParameter[] param, string strStoreProcedure)
    {
        SqlConnection con = null;
        SqlDataAdapter dataAdapter = null;
        DataSet ds = null;
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            dataAdapter = new SqlDataAdapter(strStoreProcedure, con);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.CommandTimeout = 300;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                dataAdapter.SelectCommand.Parameters.Add(param[j]);
           // dataAdapter.SelectCommand.ExecuteNonQuery();
            ds = new DataSet();
            dataAdapter.Fill(ds);
            if (ds != null && ds.Tables.Count > 0)
                return ds;

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
    public bool isDelete(SqlParameter[] param, string strStoreProcedure)
    {
        SqlConnection con = null;
        SqlCommand cmd = null;
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            cmd = new SqlCommand(strStoreProcedure, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandTimeout = 300;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                cmd.Parameters.Add(param[j]);
            cmd.ExecuteNonQuery();
            return true;
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
        return false;
    }
    public DataSet getDataByParamSecurity(SqlParameter[] param, string strStoreProcedure)
    {
        SqlConnection con = null;
        SqlDataAdapter dataAdapter = null;
        DataSet ds = null;
        try
        {
            con = new SqlConnection(this.SecurityConnection);
            con.Open();
            dataAdapter = new SqlDataAdapter(strStoreProcedure, con);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.CommandTimeout = 300;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                dataAdapter.SelectCommand.Parameters.Add(param[j]);
            //dataAdapter.SelectCommand.ExecuteNonQuery();
            ds = new DataSet();
            dataAdapter.Fill(ds);
            if (ds != null && ds.Tables.Count > 0)
                return ds;

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
    public bool isUpdate(SqlParameter[] param, string strStoreProcedure)
    {
        SqlConnection con = null;
        SqlCommand cmd = null;
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            cmd = new SqlCommand(strStoreProcedure, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandTimeout = 300;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                cmd.Parameters.Add(param[j]);
            cmd.ExecuteNonQuery();
            return true;
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
        return false;
    }
    public Guid GetIdentity(SqlParameter[] param, string strStoreProcedure)
    {
        SqlConnection con = null;
        SqlCommand cmd = null;
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            cmd = new SqlCommand(strStoreProcedure, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandTimeout = 300;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                cmd.Parameters.Add(param[j]);
            Guid result = new Guid(Convert.ToString(cmd.ExecuteScalar()));
            return result;
        }
        catch (SqlException e)
        {
            System.Console.Write(e.Message);
            return new Guid();
        }
        finally
        {
            cmd.Dispose();
            if (con.State.Equals("Open"))
                con.Close();
            con.Dispose();
        }

    }
    public string GetResult(SqlParameter[] param, string strStoreProcedure)
    {
        SqlConnection con = null;
        SqlCommand cmd = null;
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            cmd = new SqlCommand(strStoreProcedure, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandTimeout = 300;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                cmd.Parameters.Add(param[j]);
            string result = Convert.ToString(cmd.ExecuteScalar());
            return result;
        }
        catch (SqlException e)
        {
            System.Console.Write(e.Message);
            return "";
        }
        finally
        {
            cmd.Dispose();
            if (con.State.Equals("Open"))
                con.Close();
            con.Dispose();
        }

    }
    public Int32 GetIntIdentity(SqlParameter[] param, string strStoreProcedure)
    {
        SqlConnection con = null;
        SqlCommand cmd = null;
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            cmd = new SqlCommand(strStoreProcedure, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandTimeout = 300;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                cmd.Parameters.Add(param[j]);
            Int32 result = Convert.ToInt32(cmd.ExecuteScalar());
            return result;
        }
        catch (SqlException e)
        {
            System.Console.Write(e.Message);
            return -1;
        }
        finally
        {
            cmd.Dispose();
            if (con.State.Equals("Open"))
                con.Close();
            con.Dispose();
        }

    }
    public int getResultByParam(SqlParameter[] param, string strStoreProcedure, string strOutput)
    {
        SqlConnection con = null;
        SqlCommand cmd = null;
        int result = 0;
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            cmd = new SqlCommand(strStoreProcedure, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandTimeout = 300;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                cmd.Parameters.Add(param[j]);
            cmd.ExecuteScalar();
            result = Convert.ToInt32(cmd.Parameters[strOutput].Value.ToString());
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
    public string getValueByParam(SqlParameter[] param, string strStoreProcedure, string strOutput)
    {
        SqlConnection con = null;
        SqlCommand cmd = null;
        string result = "";
        try
        {
            con = new SqlConnection(this.connection);
            con.Open();
            cmd = new SqlCommand(strStoreProcedure, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandTimeout = 300;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                cmd.Parameters.Add(param[j]);
            cmd.ExecuteScalar();
            result = Convert.ToString(cmd.Parameters[strOutput].Value.ToString());
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
    public string getConnectionString()
    {
        return this.connection;
    }
    public Int32 InsertValues(SqlParameter[] param, string Procedure)
    {
        SqlConnection con = null;
        SqlCommand cmd = null;
        try
        {

            con = new SqlConnection(this.connection);
            con.Open();
            cmd = new SqlCommand(Procedure, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandTimeout = 300;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                cmd.Parameters.Add(param[j]);
            cmd.ExecuteNonQuery();
            return 1;
        }
        catch (Exception Ex)
        { return 0; }
        finally
        {
            if (con.State.Equals("Open"))
                con.Close();
            con.Dispose();
        }

    }
    public void  InsertValuez(SqlParameter[] param, string Procedure)
    {
        SqlConnection con = null;
        SqlCommand cmd = null;
        try
        {

            con = new SqlConnection(this.connection);
            con.Open();
            cmd = new SqlCommand(Procedure, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandTimeout = 300;
            int i = param.Length;
            for (int j = 0; j < i; j++)
                cmd.Parameters.Add(param[j]);
            cmd.ExecuteNonQuery();
           
        }
        catch (Exception Ex)
        { }
        finally
        {
            if (con.State.Equals("Open"))
                con.Close();
            con.Dispose();
        }

    }

   
    public DataSet getResult(string strStoreProcedure)   // method required for security module
    {
        SqlConnection con = null;
        SqlDataAdapter dataAdapter = null;
        DataSet ds = null;
        try
        {
            con = new SqlConnection(this.SecurityConnection);
            con.Open();
            dataAdapter = new SqlDataAdapter(strStoreProcedure, con);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.CommandTimeout = 300;
            //dataAdapter.SelectCommand.ExecuteNonQuery();
            ds = new DataSet();
            dataAdapter.Fill(ds);
            if (ds != null && ds.Tables.Count > 0)
                return ds;
        }
        catch (SqlException e)
        {
            System.Console.Write(e.Message);
        }
        finally
        {
            if (con.State.Equals("Open"))
                con.Close();
            con.Dispose();
        }
        return ds;
    }
}

