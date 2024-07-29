using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;
using Microsoft.CSharp;
using System.Text;
using System.Data.OleDb;
using System.Data.Common;
using System.Threading.Tasks;
/// <summary>
/// Summary description for DBHandler
/// </summary>
public class DBHandler
{
    private string _constr;
    SqlDataAdapter adaptor;

    public string FirstName { get; set; }
    public string ConnectionString { get { _constr = ConfigurationManager.ConnectionStrings["DuCon"].ConnectionString; return _constr; } set { _constr = value; } }
    public string unisConnectionString { get { _constr = ConfigurationManager.ConnectionStrings["UNISCon"].ConnectionString; return _constr; } set { _constr = value; } }

    public bool testsqlconnection()
    {
        bool  retval = false;
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = this.ConnectionString;
            con.Open();
            retval = true;
            con.Close();
        }
        catch
        {
            retval = false;
        }
        return retval;
    }

    public void CreateDataTableUNIS(DataTable DT, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {
            DT.Rows.Clear();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = this.unisConnectionString;
            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(DT);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    public SqlDataReader CreateReader(string Strsql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {
            SqlConnection con = new SqlConnection();

            con.ConnectionString = this.ConnectionString;
            con.Open();
            SqlDataReader Rd;
            SqlCommand cmd = new SqlCommand(Strsql, con);
            if (IsStoredProcedure == true)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    cmd.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            Rd = cmd.ExecuteReader();
            Rd.Read();
            
            if (Rd.HasRows)
            {
                return Rd;
            }
            else { return null;
            con.Close();
            }
            
            
        }
        catch (Exception ex)
        {
            return null;
            throw ex;

        }
       
    }


    public object GetResult(string Strsql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            object Result;
            con.ConnectionString = this.ConnectionString;
            con.Open();
            SqlDataReader Rd;
            SqlCommand cmd = new SqlCommand(Strsql, con);
            if (IsStoredProcedure == true)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    cmd.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            
            Rd = cmd.ExecuteReader();
            Rd.Read();
            if (Rd.HasRows)
            {
                Result = Rd[0];
            }
            else { Result = ""; }
            con.Close();
            return Result;
        }
        catch (Exception ex) {
            throw ex;
            return null;
        }
    }



    public void CreateDataTable(DataTable DT, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {
            DT.Rows.Clear();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = this.ConnectionString;
            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql ,con);
            adaptor.SelectCommand.CommandTimeout = 3000;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                   // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(DT);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void CreateDatasetUnis(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UNISCon"].ToString();
            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    void ExecuteSP(string Strsql, bool Isstoredprocdure = true, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            SqlCommand com = new SqlCommand();
            con.ConnectionString = this.ConnectionString;
            con.Open();
            com.Connection = con;
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = Strsql;
            for (int count = 0; count < pa.Count; count++)
            {
                com.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
            }
            com.ExecuteScalar();
            con.Close();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    public string getxml(ref DataTable table, string RootName)
    {
        StringBuilder XMLString = new StringBuilder();
        if (string.IsNullOrEmpty(RootName)) {
            table.TableName = "DataTable";
        }
        else
        {
            table.TableName = RootName;
        }
        XMLString.AppendFormat("<{0}>", table.TableName);
        DataColumnCollection tablecolumns = table.Columns;
        foreach (DataRow row in table.Rows) 
        {
            XMLString.AppendFormat("<RowData>");
            foreach (DataColumn column in table.Columns)
            {
                XMLString.AppendFormat("<{1}><{0}><{1}>", row[column].ToString(), column.ColumnName);
            }
            XMLString.AppendFormat("</RowData>");
        }
        XMLString.AppendFormat("</{0}>", table.TableName);
        return XMLString.ToString();
    }


    public string addroot(string xml, string myroot = "myroot") {
        xml = "<" + myroot + ">" + xml + "</" + myroot + ">";
        return xml;
    }

    public void CreateDataTable_TPS(DataTable DT, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {
            DT.Rows.Clear();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DuCon"].ToString(); 
            con.Open();
           
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);

            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(DT);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void CreateDataset(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {
         
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SecurityCon"].ToString();
           
            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void CreateDatasetInventory(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DbInventory"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void CreateDatasetCRMEBSDATA(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {
                        
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CRMEBSDATACon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    } 
    
    public void CreateDataset_AuditManagement(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {
                        
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DBAudit"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    public void CreateDataset_SSHR(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SSHR_CONNECTION"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void CreateDatasetCRMEBSDATA_ForSurvey(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SurveyCon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void CreateDataset_For_Safety_Data(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Safety_DataCon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    public void CreateDatasetCRMEBSDATA_ForBulkInsert(DataSet ds, string StrSql, string TypeName, DataTable dt, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        string qry = "exec " + StrSql + " " + pa[0].ToString();
        try
        {
            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["CRMEBSDATACon"].ToString()))
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    var pList = new SqlParameter(pa[0].ToString(), SqlDbType.Structured);
                    pList.TypeName = TypeName;
                    pList.Value = dt;

                    cmd.Parameters.Add(pList);
                    cmd.ExecuteReader();

                }
            }
        }

        catch (Exception)
        {

            throw;
        }


    }

    public void CreateDataset_ForBulkInsert(DataSet ds, string StrSql, string TypeName, DataTable dt, string isForDB, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        string DbString = Common.getDBConString(isForDB);

        string qry = "exec " + StrSql + " " + pa[0].ToString();
        try
        {
            using (var con = new SqlConnection(DbString))
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    var pList = new SqlParameter(pa[0].ToString(), SqlDbType.Structured);
                    pList.TypeName = TypeName;
                    pList.Value = dt;

                    cmd.Parameters.Add(pList);
                    cmd.ExecuteReader();

                }
            }
        }

        catch (Exception)
        {

            throw;
        }

    }


    public void CreateDatasetCRMEBSDATA_NewServer1(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DBKPINewChanges"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }

            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void CreateDatasetCRMEBSDATA_NewServer(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CRMEConnectDataCon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    public int CreateDatasetCRMEBSDATA_NewServer_ForCreate(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {
            int confirm = 0;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CRMEConnectDataCon"].ToString();

            con.Open();
            SqlCommand cmd = new SqlCommand(StrSql, con);
      
            if (IsStoredProcedure == true)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    cmd.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }

          


            int k = cmd.ExecuteNonQuery();
            if (k != 0)
            {
                confirm = 1;
                
            }
            con.Close();
            return confirm;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }






    //public async Task<int> CreateDatasetCRMEBSDATATest(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    //{
    //    try
    //    {

    //        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CRMEBSDATACon"].ToString()))
    //        {
    //            using (SqlCommand command = new SqlCommand("SELECT *  FROM[CRMEBSDATA].[dbo].[tb_CRMOPTMaster] c  inner join tb_RevenueMaster r on r.OpportunityID = c.OpportunityID SELECT *  FROM[CRMEBSDATA].[dbo].[tb_CRMOPTMaster] c  inner join tb_RevenueMaster r on r.OpportunityID = c.OpportunityID", conn))
    //            {
    //                await conn.OpenAsync();
    //                await command.ExecuteNonQueryAsync();

    //                //int result = A.Method(conn, command).Result;

    //                SqlDataReader reader = command.ExecuteReader();
    //                while (await reader.ReadAsync())
    //                    Console.WriteLine(reader[0]);
    //            } 

                 
    //        }
            
    //            return 1;
    //        }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}

    public static void checkForAsync(IAsyncResult result)
    {
        var abc = result;

    }

    public void CreateDatasetEmployee(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["EmployeeCon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void CreateDatasetSDME(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SDMECon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public  void CreateDataTable(DataTable Dtb, string FilePath, string Extension, string isHDR)
    {
        string conStr = "";
        switch (Extension)
        {
            case ".xls": //Excel 97-03
                conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                break;
            case ".xlsx": //Excel 07
                conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
                break;
        }
        conStr = String.Format(conStr, FilePath, isHDR);
        OleDbConnection connExcel = new OleDbConnection(conStr);
        OleDbCommand cmdExcel = new OleDbCommand();
        OleDbDataAdapter oda = new OleDbDataAdapter();
        cmdExcel.Connection = connExcel;
        //Get the name of First Sheet
        connExcel.Open();
        DataTable dtExcelSchema;
        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
        connExcel.Close();
        //Read Data from First Sheet
        connExcel.Open();
        cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";
        oda.SelectCommand = cmdExcel;
        oda.Fill(Dtb);
        connExcel.Close();
    }


    public void CreateDatasetFRD(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["FRDCon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    public void CreateDatasetSiteSurvey_Data(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SiteSurvey_DataCon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    public void CreateDatasetERM_Data(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["EMS"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }


    public void CreateDatasetSuggestion(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SuggestionCon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    public void CreateDatasetPASSIVEFIRE(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["PASSIVEFIRECon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }


    public void CreateDatasetRMA(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["RMACon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }


    public void CreateDatasetForTODONew(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["TODOV2"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void CreateDatasetForDBKamira(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["KamiraCon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void CreateDatasetSecurityDB(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SecurityDBCon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    public void CreateDatasetFM_Data(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["FM_DataCon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    public void CreateDatasetBranding_DB(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["BrandingCon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }


    public void CreateDatasetPurchase(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Purchase"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void CreateDatasetSCAPCon(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SCAPCon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    public void CreateDatasetRecruitment(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DBRecruitment"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    public void CreateDatasetHSE_Data(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["HSECon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    public void CreateDataset_ProjectTeams(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["PrjAnalysis"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }



    public void CreateDatasetEMS(DataSet ds, string StrSql, bool IsStoredProcedure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["EMS"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(StrSql, con);
            adaptor.SelectCommand.CommandTimeout = 0;
            if (IsStoredProcedure == true)
            {
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                for (int count = 0; count < pa.Count; count++)
                {
                    // pa[count] = pv[count];
                    adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
                }
            }
            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

}

