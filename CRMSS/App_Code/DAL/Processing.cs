using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net.NetworkInformation;

/// <summary>
/// Summary description for Processing
/// </summary>
public class Processing
{
    public Processing()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string getConnectionString()
    {
        DataAccessLayer da = new DataAccessLayer();
        return da.getConnectionString();
    }
    public DataTable CheckEmp_ID(string Emp_Number, Int32 Org_ID)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Emp_Number", Emp_Number);
        param[1] = new SqlParameter("@Org_ID", Org_ID);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[CheckEmp_ID]");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public Int32 InsertUpdateEmergencyRel(Int32 Emp_ID, string Emp_Number, string Emp_Name, string e_date, Int32 Contract_ID, Int32 Site_ID, Int32 CreatedBy)
    {
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@Emp_ID", Emp_ID);
        param[1] = new SqlParameter("@Emp_Number", Emp_Number);
        param[2] = new SqlParameter("@Emp_Name", Emp_Name);
        param[3] = new SqlParameter("@e_date", e_date);
        param[4] = new SqlParameter("@macaddress", GetMacAddress());
        param[5] = new SqlParameter("@Contract_ID", Contract_ID);
        param[6] = new SqlParameter("@Site_ID", Site_ID);
        param[7] = new SqlParameter("@CreatedBy", CreatedBy);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "InsertEmergencyRel");
    }
    public Int32 InsertUpdateManualCategory(string Emp_Number, string e_date, Int32 Contract_ID, Int32 Site_ID, Int32 CreatedBy, Int32 CategoryID)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@Category_ID", CategoryID);
        param[1] = new SqlParameter("@Emp_Num", Emp_Number);
        param[2] = new SqlParameter("@Edate", e_date);
        param[3] = new SqlParameter("@macaddress", GetMacAddress());
        param[4] = new SqlParameter("@Contract_ID", Contract_ID);
        param[5] = new SqlParameter("@Site_ID", Site_ID);
        param[6] = new SqlParameter("@CreatedBy", CreatedBy);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "InsertManualCategory");
    }
    public Int32 updateroster(int id,char SHIFT)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@id",id);
        param[1] = new SqlParameter("@shift",SHIFT);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "sp_updateemproster");
    }

    public Int32 UpdateMonthlyAttendanceOffline(string Emp_Number, string e_date, Int32 Contract_ID, Int32 Site_ID)
    {
        SqlParameter[] param = new SqlParameter[4];

        param[0] = new SqlParameter("@EmpNo", Emp_Number);
        param[1] = new SqlParameter("@vdate", e_date);

        param[2] = new SqlParameter("@Contract_ID", Contract_ID);
        param[3] = new SqlParameter("@Site_ID", Site_ID);

        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "UpdateMonthlyAttendanceOffline");
    }
    public Int32 UpdateeOfflineCategory(string Emp_Number, string category, Int32 Contract_ID, Int32 Site_ID)
    {
        SqlParameter[] param = new SqlParameter[4];

        param[0] = new SqlParameter("@EmpNo", Emp_Number);
        param[1] = new SqlParameter("@Category", category);

        param[2] = new SqlParameter("@Contract_ID", Contract_ID);
        param[3] = new SqlParameter("@Site_ID", Site_ID);

        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "UpdateOfflineCategory");
    }
    public Int32 InsertResources(string Emp_ID, int Category_ID, int Contract_ID, int Site_ID, string Res_Type, string Shift, string DayOff, DateTime RosterStart, DateTime RosterEnd, Int32 UserID)
    {
        SqlParameter[] param = new SqlParameter[10];
        param[0] = new SqlParameter("@Emp_ID", Emp_ID);
        param[1] = new SqlParameter("@Category_ID", Category_ID);
        param[2] = new SqlParameter("@Contract_ID", Contract_ID);
        param[3] = new SqlParameter("@Site_ID", Site_ID);
        param[4] = new SqlParameter("@Res_Type", Res_Type);
        param[5] = new SqlParameter("@Shift", Shift);
        param[6] = new SqlParameter("@OffDay", DayOff);
        param[7] = new SqlParameter("@Start", RosterStart);
        param[8] = new SqlParameter("@End", RosterEnd);
        param[9] = new SqlParameter("@User_ID", UserID);

        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "InsertResources");
    }
    public bool InsertBulk(string tablename, DataTable dt)
    {
        DataAccessLayer da = new DataAccessLayer();
        return da.insertBulk(tablename, dt);
    }
    public DataTable VerifyResources()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("[VerifyResources]");
        return ds.Tables[0];
    }
    public void Excecuteprocedure(string procedure)
    {
        DataAccessLayer da = new DataAccessLayer();
        da.ExecuteProcedure(procedure);
    }
    public string GetLastCompiled()
    {
        SqlParameter[] param = new SqlParameter[0];
        param[0] = new SqlParameter("@LastCompiled", SqlDbType.VarChar, 8);
        DataAccessLayer da = new DataAccessLayer();
        string str = da.getValueByParam(param, "[ProcGetStudent]", "LastCompiled");
        return str;
    }
    public DataTable GetAbsentylist(string vDate, string Edate, Int32 Contract, Int32 Site)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@vDate", vDate);
        param[1] = new SqlParameter("@vEdate", Edate);
        param[2] = new SqlParameter("@Contract_ID", Contract);
        param[3] = new SqlParameter("@Site_ID", Site);
        DataAccessLayer da = new DataAccessLayer();

        DataSet ds = da.getDataByParamUnis(param, "[PushLeavesToOracle]");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public DataTable GetPayRollAttendance(Int32 Contract_ID, Int32 Site_ID, String Month)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@Site_ID", Site_ID);
        param[2] = new SqlParameter("@Month", Month);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "GetPayRollAttendance");
        return ds.Tables[0];
    }
    public Guid CreateRosterRow(Int32 Contract_ID, Int32 Site_ID, DateTime start, DateTime end, string shift, Int32 userid, string Emp_Id)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@Site_ID", Site_ID);
        param[2] = new SqlParameter("@start", start);
        param[3] = new SqlParameter("@end", end);
        param[4] = new SqlParameter("@shift", shift);
        param[5] = new SqlParameter("@User_ID", userid);
        param[6] = new SqlParameter("@Emp_ID", Emp_Id);
        DataAccessLayer da = new DataAccessLayer();
        return da.GetIdentity(param, "CreateRosterRow1");
    }
    public string CheckRegister(string Emp_ID, Int32 contract_Id, Int32 Site_Id, string User_Id, string Operation, string vEDate)
    {
        SqlParameter[] param = new SqlParameter[6];
        param[0] = new SqlParameter("@Emp_ID", Emp_ID);
        param[1] = new SqlParameter("@Contract_ID", contract_Id);
        param[2] = new SqlParameter("@Site_ID", Site_Id);
        param[3] = new SqlParameter("@User_Id", User_Id);
        param[4] = new SqlParameter("@vEDate", vEDate);
        param[5] = new SqlParameter("@Operation", Operation);
        DataAccessLayer da = new DataAccessLayer();
        return da.GetResult(param, "CheckRegister");
    }

    public Int32 UpdateRowRoster(string ID, string Shift, DateTime RosterStart, DateTime RosterEnd)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@ID", ID);
        param[1] = new SqlParameter("@Shift", Shift);
        param[2] = new SqlParameter("@Rosterstart", RosterStart);
        param[3] = new SqlParameter("@Rosterend", RosterEnd);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "UpdateRowRoster");
    }
    public Int32 CreateRosterPreview(string IDs, DateTime RosterStart, DateTime RosterEnd, Int32 Contract_ID, Int32 Site_ID)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@EmpIds", IDs);
        param[1] = new SqlParameter("@RosterStart", RosterStart);
        param[2] = new SqlParameter("@RosterEnd", RosterEnd);
        param[3] = new SqlParameter("@Contract_ID", Contract_ID);
        param[4] = new SqlParameter("@Site_ID", Site_ID);

        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "CreateRosterPreview");
    }

    public string GetMacAddress()
    {
        try
        {
            foreach (NetworkInterface nic in NetworkInterface.GetAllNetworkInterfaces())
            {
                if (nic.NetworkInterfaceType == NetworkInterfaceType.Ethernet &&
                    nic.OperationalStatus == OperationalStatus.Up)
                {
                    return Convert.ToString(nic.GetPhysicalAddress());
                }
            }
            return "";
        }
        catch (Exception Ex)
        {
            return "";
        }
    }
    public Int32 InsertUpdateOrg(Int32 ID, string Org_name, Int32 Org_ID, Int32 CreatedBy, string Operation, string Org_Code, string LogoImage, string Address, string Email)
    {
        SqlParameter[] param = new SqlParameter[10];
        param[0] = new SqlParameter("@ID", ID);
        param[1] = new SqlParameter("@Org_Name", Org_name);
        param[2] = new SqlParameter("@Org_ID", Org_ID);
        param[3] = new SqlParameter("@CreatedBy", CreatedBy);
        param[4] = new SqlParameter("@MacAddress", GetMacAddress());
        param[5] = new SqlParameter("@Operation", Operation);
        param[6] = new SqlParameter("@Org_Code", Org_Code);
        param[7] = new SqlParameter("@LogoImage", LogoImage);
        param[8] = new SqlParameter("@Address", Address);
        param[9] = new SqlParameter("@EmailId", Email);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "sp_Organization");
    }
    public Int32 InsertUpdateCompSetUp(Int32 ID, string FromDate, string Todate, decimal Hours, Int32 CreatedBy, string Operation)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@ID", ID);
        param[1] = new SqlParameter("@Fromdate", FromDate);
        param[2] = new SqlParameter("@ToDate", Todate);
        param[3] = new SqlParameter("@Hours", Hours);
        param[4] = new SqlParameter("@MacAddress", GetMacAddress());
        param[5] = new SqlParameter("@Operation", Operation);
        param[6] = new SqlParameter("@CreatedBy", CreatedBy);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "InsertUpdateCompileSetup");
    }
    public Int32 InsertHolidaySetUp(Int32 ID, string FromDate, string Todate, string Code, string Description, Int32 CreatedBy, string Operation, String FType,Int32 Deptcode,Int32 Empcode,String Flag,Int32 Contract,Int32 site,string fromtime,string totime,string ExceptPrj)
    {
        SqlParameter[] param = new SqlParameter[17];
        param[0] = new SqlParameter("@ID", ID);
        param[1] = new SqlParameter("@Fromdate", FromDate);
        param[2] = new SqlParameter("@ToDate", Todate);
        param[3] = new SqlParameter("@Code", Code);
        param[4] = new SqlParameter("@MacAddress", GetMacAddress());
        param[5] = new SqlParameter("@Operation", Operation);
        param[6] = new SqlParameter("@CreatedBy", CreatedBy);
        param[7] = new SqlParameter("@description", Description);
        param[8] = new SqlParameter("@Type", FType);
        param[9] = new SqlParameter("@DeptCode", Deptcode);
        param[10] = new SqlParameter("@EmpCode", Empcode);
        param[11] = new SqlParameter("@Flag", Flag);
        param[12] = new SqlParameter("@Contract", Contract);
        param[13] = new SqlParameter("@Site", site);
        param[14] = new SqlParameter("@fromtime", fromtime);
        param[15] = new SqlParameter("@totime", totime);
        param[16] = new SqlParameter("@ExceptPrj", ExceptPrj);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "InsertUpdateHolidaySetup");
    }
    public DataTable BindCompSetUp(Int32 ID, string FromDate, string Todate, decimal Hours, Int32 CreatedBy, string Operation)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@ID", ID);
        param[1] = new SqlParameter("@Fromdate", FromDate);
        param[2] = new SqlParameter("@ToDate", Todate);
        param[3] = new SqlParameter("@Hours", Hours);
        param[4] = new SqlParameter("@MacAddress", GetMacAddress());
        param[5] = new SqlParameter("@Operation", Operation);
        param[6] = new SqlParameter("@CreatedBy", CreatedBy);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "InsertUpdateCompileSetup");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public DataTable BindHolidaySetUp(Int32 ID, string FromDate, string Todate, string Code, string Description, Int32 CreatedBy, string Operation, String FType, Int32 Deptcode, Int32 Empcode, String Flag)
    {
        SqlParameter[] param = new SqlParameter[12];
        param[0] = new SqlParameter("@ID", ID);
        param[1] = new SqlParameter("@Fromdate", FromDate);
        param[2] = new SqlParameter("@ToDate", Todate);
        param[3] = new SqlParameter("@Code", Code);
        param[4] = new SqlParameter("@MacAddress", GetMacAddress());
        param[5] = new SqlParameter("@Operation", Operation);
        param[6] = new SqlParameter("@CreatedBy", CreatedBy);
        param[7] = new SqlParameter("@description", Description);
        param[8] = new SqlParameter("@Type", FType);
        param[9] = new SqlParameter("@DeptCode", Deptcode);
        param[10] = new SqlParameter("@EmpCode", Empcode);
        param[11] = new SqlParameter("@Flag", Flag);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "InsertUpdateHolidaySetup");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public DataTable BindOrganization(Int32 ID, string Org_name, Int32 Org_ID, Int32 CreatedBy, string Operation, string Org_Code, string LogoImage, string Address, string Email)
    {
        SqlParameter[] param = new SqlParameter[10];
        param[0] = new SqlParameter("@ID", ID);
        param[1] = new SqlParameter("@Org_Name", Org_name);
        param[2] = new SqlParameter("@Org_ID", Org_ID);
        param[3] = new SqlParameter("@CreatedBy", CreatedBy);
        param[4] = new SqlParameter("@MacAddress", GetMacAddress());
        param[5] = new SqlParameter("@Operation", Operation);
        param[6] = new SqlParameter("@Org_Code", Org_Code);
        param[7] = new SqlParameter("@LogoImage", LogoImage);
        param[8] = new SqlParameter("@Address", Address);
        param[9] = new SqlParameter("@EmailId", Email);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_Organization");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public Int32 InsertUpdateCustomer(Int32 Cust_Id, string Cust_Code, string Cust_Name, bool Status, Int32 Org_ID, bool? Cust_Type, string Cust_Street, Int32? ParentCust_Id, string Cust_Email, string Cust_POBox, string Cust_Website, string Cust_Area, string Cust_Fax, Int32 Cust_CityID, Int32 Cust_CountryID, string Cust_Tel, Int32 CreatedBy, string Operation)
    {
        SqlParameter[] param = new SqlParameter[19];
        param[0] = new SqlParameter("@Cust_Id", Cust_Id);
        param[1] = new SqlParameter("@Cust_Code", Cust_Code);
        param[2] = new SqlParameter("@Cust_Name", Cust_Name);
        param[3] = new SqlParameter("@Cust_Type", Cust_Type);
        param[4] = new SqlParameter("@Cust_Street", Cust_Street);
        param[5] = new SqlParameter("@Cust_Area", Cust_Area);
        param[6] = new SqlParameter("@Cust_CityID", Cust_CityID);
        param[7] = new SqlParameter("@Cust_CountryID", Cust_CountryID);
        param[8] = new SqlParameter("@Cust_Tel", Cust_Tel);
        param[9] = new SqlParameter("@Cust_Fax", Cust_Fax);
        param[10] = new SqlParameter("@Cust_Email", Cust_Email);
        param[11] = new SqlParameter("@Cust_Website", Cust_Website);
        param[12] = new SqlParameter("@Cust_POBox", Cust_POBox);
        param[13] = new SqlParameter("@ParentCust_Id", ParentCust_Id);
        param[14] = new SqlParameter("@Status", Status);
        param[15] = new SqlParameter("@Org_ID", Org_ID);
        param[16] = new SqlParameter("@CreatedBy", CreatedBy);
        param[17] = new SqlParameter("@MacAddress", GetMacAddress());
        param[18] = new SqlParameter("@Operation", Operation);
        DataAccessLayer da = new DataAccessLayer();
        return da.GetIntIdentity(param, "sp_Customer");
    }
    public DataTable BindCustomer(Int32 Cust_Id, string Cust_Code, string Cust_Name, bool Status, Int32 Org_ID, bool Cust_Type, string Cust_Street, Int32 ParentCust_Id, string Cust_Email, string Cust_POBox, string Cust_Website, string Cust_Area, string Cust_Fax, Int32 Cust_CityID, Int32 Cust_CountryID, string Cust_Tel, Int32 CreatedBy, string Operation)
    {
        SqlParameter[] param = new SqlParameter[19];
        param[0] = new SqlParameter("@Cust_Id", Cust_Id);
        param[1] = new SqlParameter("@Cust_Code", Cust_Code);
        param[2] = new SqlParameter("@Cust_Name", Cust_Name);
        param[3] = new SqlParameter("@Cust_Type", Cust_Type);
        param[4] = new SqlParameter("@Cust_Street", Cust_Street);
        param[5] = new SqlParameter("@Cust_Area", Cust_Area);
        param[6] = new SqlParameter("@Cust_CityID", Cust_CityID);
        param[7] = new SqlParameter("@Cust_CountryID", Cust_CountryID);
        param[8] = new SqlParameter("@Cust_Tel", Cust_Tel);
        param[9] = new SqlParameter("@Cust_Fax", Cust_Fax);
        param[10] = new SqlParameter("@Cust_Email", Cust_Email);
        param[11] = new SqlParameter("@Cust_Website", Cust_Website);
        param[12] = new SqlParameter("@Cust_POBox", Cust_POBox);
        param[13] = new SqlParameter("@ParentCust_Id", ParentCust_Id);
        param[14] = new SqlParameter("@Status", Status);
        param[15] = new SqlParameter("@Org_ID", Org_ID);
        param[16] = new SqlParameter("@CreatedBy", CreatedBy);
        param[17] = new SqlParameter("@MacAddress", GetMacAddress());
        param[18] = new SqlParameter("@Operation", Operation);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_Customer");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public Int32 DeleteRowRoster(string ID, DateTime RosterStart, DateTime RosterEnd)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@ID", ID);
        param[1] = new SqlParameter("@Rosterstart", RosterStart);
        param[2] = new SqlParameter("@Rosterend", RosterEnd);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "DeleteRowRoster");
    }
    public DataTable ConfirmToOracle(string vDate, Int32 Contract_ID, Int32 Site_ID, Int32 CreatedBy)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@vDate", vDate);
        param[1] = new SqlParameter("@Contract_ID", Contract_ID);
        param[2] = new SqlParameter("@Site_ID", Site_ID);
        param[3] = new SqlParameter("@CreatedBy", CreatedBy);
        param[4] = new SqlParameter("@macaddress", GetMacAddress());
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[ConfirmToOracle]");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public DataTable BindOracleGridByDate(string vDate, Int32 Contract_ID, Int32 Site_ID)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@Date", vDate);
        param[1] = new SqlParameter("@Contract_ID", Contract_ID);
        param[2] = new SqlParameter("@Site_ID", Site_ID);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[BindOracleGridByDate]");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }

    public DataTable SetEmployee()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("[ProcGetEmployee]");
        return ds.Tables[0];
    }

    public DataTable GetAbsenceDetail(int contract_id, int site_id)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Contract_Id", contract_id);
        param[1] = new SqlParameter("@Site_Id", site_id);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "GetAbsence");
        return ds.Tables[0];
    }

    public DataTable GetAbsenceDetailById(int EmpId, string Date)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@EmpID", EmpId);
        param[1] = new SqlParameter("@Checkdate", Date);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[GetAbsenceByID]");
        return ds.Tables[0];
    }
    public Int32 ShiftEmployees(Int32 PersonID, Int32 ContractID, Int32 OldSiteID, Int32 NewSiteID, string EndDate)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@Contract_ID", ContractID);
        param[1] = new SqlParameter("@NewSiteID", NewSiteID);
        param[2] = new SqlParameter("@OldSiteID", OldSiteID);
        param[3] = new SqlParameter("@PersonID", PersonID);
        param[4] = new SqlParameter("@EndDate", EndDate);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "ShiftEmployees");

    }
    public DataTable GetContracts(Int32 OrgID)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@OrgID", @OrgID);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "GetContracts");
        return ds.Tables[0];
    }
    public DataTable GetSites(Int32 ContractID)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@ContractID", ContractID);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "GetSites");
        return ds.Tables[0];
    }
    public DataTable GetRosterBySite(Int32 Contract_Id, Int32 site_id, string start, string end, Int32 DeptId)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@Contract_Id", Contract_Id);
        param[1] = new SqlParameter("@Site_Id", site_id);
        param[2] = new SqlParameter("@start", start);
        param[3] = new SqlParameter("@end", end);
        param[4] = new SqlParameter("@Dept", DeptId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[GetRosterBySite]");
        return ds.Tables[0];
    }
    public DataTable GetMonthlyRosterOffline(Int32 Contract_ID, Int32 Site_ID, String Month)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@Site_ID", Site_ID);
        param[2] = new SqlParameter("@Month", Month);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamTimeout(param, "GetRosterOffline");
        return ds.Tables[0];
    }

    public Int32 UpdatePrevRosterBySite(Int32 PrevID, Int32 NewID, DateTime start)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@PrevRosterID", PrevID);
        param[1] = new SqlParameter("@NewRosterID", NewID);
        param[2] = new SqlParameter("@StartDate", start);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "UpdatePreviousRoster");
    }
    public DataTable BindReleivers(Int32 Contract_Id, Int32 site_id, char Gender)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@ContactID", Contract_Id);
        param[1] = new SqlParameter("@siteID", site_id);
        param[2] = new SqlParameter("@Gender", Gender);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[BindReleivers]");
        return ds.Tables[0];
    }
    public DataTable BindFixedResources(char Gender, string Variable, string Filter, Int32 Org_ID)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@Gender", Gender);
        param[1] = new SqlParameter("@Variable", Variable);
        param[2] = new SqlParameter("@FilterValue", Filter);
        param[3] = new SqlParameter("@ORG_ID", Org_ID);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[BindFixedResources]");
        return ds.Tables[0];
    }
    public Int32 InsertFile(Int32 Contract_ID, string ContentType, byte[] fileData, string Name, Int32 docType)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@ContentType", ContentType);
        param[2] = new SqlParameter("@File_Name", Name);
        param[3] = new SqlParameter("@Data", fileData);
        param[4] = new SqlParameter("@DocType", docType);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "InsertContractFiles");
    }

    public Int32 SyncTables(int User_ID, DateTime date, string Time)
    {
        try
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@User_ID", User_ID);
            param[1] = new SqlParameter("@Date", date);
            param[2] = new SqlParameter("@Time", Time);
            DataAccessLayer da = new DataAccessLayer();
            return da.InsertValues(param, "CheckSyncStatus");
        }
        catch
        {
            return 0;
        }
    }
    public Int32 UpdateFile(Int32 Contract_ID, string ContentType, byte[] fileData, string Name, Int32 docType)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@ContentType", ContentType);
        param[2] = new SqlParameter("@File_Name", Name);
        param[3] = new SqlParameter("@Data", fileData);
        param[4] = new SqlParameter("@DocType", docType);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "UpdateContractFiles");
    }
    public Int32 ReviseFiles(Int32 newContract, Int32 PrevContract)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@PrevContract", PrevContract);
        param[1] = new SqlParameter("@newContract", newContract);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "ReviseFiles");
    }

    public DataTable GetContractFilesByID(Int32 Contract_ID)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "GetFilesByID");
        return ds.Tables[0];
    }
    public DataTable GetContractsByStatus(Int32? status, string fromdate, string todate, int? cust_id, int? site_id)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@Contractstatus", status);
        if (!string.IsNullOrEmpty(fromdate))
            param[1] = new SqlParameter("@FromDate", fromdate);
        else
            param[1] = new SqlParameter("@FromDate", DBNull.Value);
        if (!string.IsNullOrEmpty(todate))
            param[2] = new SqlParameter("@ToDate", todate);
        else
            param[2] = new SqlParameter("@ToDate", DBNull.Value);
        if (!string.IsNullOrEmpty(Convert.ToString(cust_id)))
            param[3] = new SqlParameter("@CustomerID", cust_id);
        else
            param[3] = new SqlParameter("@CustomerID", DBNull.Value);
        if (!string.IsNullOrEmpty(Convert.ToString(site_id)))
            param[4] = new SqlParameter("@SiteID", site_id);
        else
            param[4] = new SqlParameter("@SiteID", DBNull.Value);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "AllContracts");
        return ds.Tables[0];
    }
    public DataTable GetFileByID(Int32 FileID)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@FileID", FileID);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "GetFileByFileID");
        return ds.Tables[0];
    }
    public DataTable GetDeptCordall(int contract, int site, int deptid, int cordid)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@Contract_ID", contract);
        param[1] = new SqlParameter("@Site_ID", site);
        param[2] = new SqlParameter("@Dept_ID", deptid);
        param[3] = new SqlParameter("@cordID ", cordid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_departmentallview");
        return ds.Tables[0];
    }
    public DataTable GetMonthlyRoster(Int32 Contract_ID, Int32 Site_ID, String Month,Int32 DeptId)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@Site_ID", Site_ID);
        param[2] = new SqlParameter("@Month", Month);
        param[3] = new SqlParameter("@DeptId", DeptId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamTimeout(param, "GetRosterWithoutcomplie");
        return ds.Tables[0];
    }
    public DataTable GetMonthlyAttendance(Int32 Contract_ID, Int32 Site_ID, String Month)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@Site_ID", Site_ID);
        param[2] = new SqlParameter("@Month", Month);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamTimeout(param, "GetMonthlyAttendanceSummary");
        return ds.Tables[0];
    }
    public DataTable GetMonthlyAttendances(Int32 Contract_ID, Int32 Site_ID, String Month,int dept,int cord)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@Site_ID", Site_ID);
        param[2] = new SqlParameter("@Month", Month);
        param[3] = new SqlParameter("@dept", dept);
        param[4] = new SqlParameter("@cord",cord);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_monthlyattendance");
        return ds.Tables[0];
    }
    public DataTable GetMonthlyAttendanceHours(int Contract,int Site,string Month)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@contactid",Contract);
        param[1] = new SqlParameter("@Siteid",Site);
        param[2] = new SqlParameter("@month",Month);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamTimeouts(param, "sp_getmonthlyattendancehours");
        return ds.Tables[0];
    }
    public DataTable GetConsolidatedAttendance(Int32 Contract_ID, Int32 Site_ID, String Month,int dept)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@Site_ID", Site_ID);
        param[2] = new SqlParameter("@Month", Month);
        param[3] = new SqlParameter("@dept", dept);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_monthlyattendance");
        return ds.Tables[0];
    }
    public DataTable GetConsolidatedOffline(Int32 Contract_ID, Int32 Site_ID, String Month)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@Site_ID", Site_ID);
        param[2] = new SqlParameter("@Month", Month);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamTimeout(param, "GetMonthlyOffline");
        return ds.Tables[0];
    }
    public DataTable BindResourcesGrid(Int32 Contract_ID, Int32 Site_ID)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@Site_ID", Site_ID);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "BindResorceForAllocation");
        return ds.Tables[0];
    }
    public DataTable BindResourcesByCat(Int32 Contract_ID, Int32 Site_ID)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@Site_ID", Site_ID);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "BindResourcesByCat");
        return ds.Tables[0];
    }
    public DataTable BindAllocatedRescCat(Int32 Contract_ID, Int32 Site_ID, string Gender, string Variable, string Filter,Int32 DeptId)
    {
        SqlParameter[] param = new SqlParameter[6];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@Site_ID", Site_ID);
        param[2] = new SqlParameter("@Gender", Gender);
        param[3] = new SqlParameter("@Variable", Variable);
        param[4] = new SqlParameter("@FilterValue", Filter);
        param[5] = new SqlParameter("@DeptId", DeptId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "AllocatedResWithcat");
        return ds.Tables[0];
    }
    public DataTable GetAssignedCatRes(Int32 Contract_ID, Int32 Site_ID, Int32 DeptID)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@Site_ID", Site_ID);
        param[2] = new SqlParameter("@DeptId", DeptID);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "GetAssignedCatRes");
        return ds.Tables[0];
    }


    public DataTable GetAbsentReport(DateTime vdate, DateTime edate, Int32 dept, string Weekend)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@vEdate", edate);
        param[2] = new SqlParameter("@deptno", dept);
        param[3] = new SqlParameter("@Weekend", Weekend);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_Absenties");
        return ds.Tables[0];
    }
    public DataTable GetErrorReport(string Edate, Int32 Site_ID, Int32 Contract_ID, Int32 Dept_ID, int Cordid)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@Edate", Edate);
        param[1] = new SqlParameter("@Site_ID", Site_ID);
        param[2] = new SqlParameter("@Contract_ID", Contract_ID);
        param[3] = new SqlParameter("@Dept_ID", Dept_ID);
        param[4] = new SqlParameter("@CordID",Cordid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "Sp_ErrorReport");
        return ds.Tables[0];
    }
    public DataTable GetDailyInOutReport(string vdate, string edate, int ConId, int SiteId, int dept_id, int cord, int empid)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@eDate", edate);
        param[2] = new SqlParameter("@Contract_ID", ConId);
        param[3] = new SqlParameter("@Site_ID", SiteId);
        param[4] = new SqlParameter("@Dept_ID", dept_id);
        param[5] = new SqlParameter("@cordID", cord);
        param[6] = new SqlParameter("@EmpId", empid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_compiledreport");
        return ds.Tables[0];
    }
    public DataTable GetLateReport(string vdate, int ConId, int SiteId, string vNdate)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@Contract_ID", ConId);
        param[2] = new SqlParameter("@Site_ID", SiteId);
        param[3] = new SqlParameter("@vEdate", vNdate);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_LateReport");
        return ds.Tables[0];
    }
    public DataTable GetLateAttendance(string vdate, int ConId, int SiteId, string vNdate, int dept, int cord, int empid)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@Contract_ID", ConId);
        param[2] = new SqlParameter("@Site_ID", SiteId);
        param[3] = new SqlParameter("@vEdate", vNdate);
        param[4] = new SqlParameter("@deptid", dept);
        param[5] = new SqlParameter("@cord", cord);
        param[6] = new SqlParameter("@EmpId", empid);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_soa_newlateattendance");
        return ds.Tables[0];
    }
    public DataTable GetLateAttendances(string vdate, int ConId, int SiteId, string vNdate, int dept, int cord, int empid)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@Contract_ID", ConId);
        param[2] = new SqlParameter("@Site_ID", SiteId);
        param[3] = new SqlParameter("@vEdate", vNdate);
        param[4] = new SqlParameter("@deptid", dept);
        param[5] = new SqlParameter("@cord", cord);
        param[6] = new SqlParameter("@EmpId", empid);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_soa_newlateattendances");
        return ds.Tables[0];
    }
    public DataTable Getleavests(DateTime vdate, DateTime vNdate, int ConId, int SiteId, string desc, int dept, int cord, int EmpId)
    {
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@vEdate", vNdate);
        param[2] = new SqlParameter("@Contract_ID", ConId);
        param[3] = new SqlParameter("@Site_ID", SiteId);
        param[4] = new SqlParameter("@leavetype", desc);
        param[5] = new SqlParameter("@dept", dept);
        param[6] = new SqlParameter("@cord", cord);
        param[7] = new SqlParameter("@EmpId", EmpId);



        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_leavestatus");
        return ds.Tables[0];
    }

    public DataTable GetLateearly(string vdate, int ConId, int SiteId, string vNdate,int dept,int cord)
    {
        SqlParameter[] param = new SqlParameter[6];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@Contract_ID", ConId);
        param[2] = new SqlParameter("@Site_ID", SiteId);
        param[3] = new SqlParameter("@vEdate", vNdate);
        param[4] = new SqlParameter("@dept", dept);
        param[5] = new SqlParameter("@cord", cord);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_dsoa_earlyleave");
        return ds.Tables[0];
    }

    public DataTable GetAbsentReport(DateTime vdate, DateTime edate, int CId, int SId, string Weekend, string procedure,Int32 Dept_Id,int cord,int empid)
    {
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@vEdate", edate);
        param[2] = new SqlParameter("@Contract_ID", CId);
        param[3] = new SqlParameter("@Site_ID", SId);
        param[4] = new SqlParameter("@Weekend", Weekend);
        param[5] = new SqlParameter("@Dep_ID", Dept_Id);
        param[6] = new SqlParameter("@CordID", cord);
        param[7] = new SqlParameter("@empid", empid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, procedure);
        return ds.Tables[0];
    }
    public DataTable GetOracleReport(string vdate, string ndate)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@nDate", ndate);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_OracleReport");
        return ds.Tables[0];
    }
    public DataTable GetDayOffReport(string vdate, string edate, int CId, int SId, string Weekend, string procedure)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@vEdate", edate);
        param[2] = new SqlParameter("@Contract_ID", CId);
        param[3] = new SqlParameter("@Site_ID", SId);
        param[4] = new SqlParameter("@Weekend", Weekend);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, procedure);
        return ds.Tables[0];
    }
    public DataTable GetManualReport(string vdate, string Edate, Int32 Site_ID, Int32 Contract_ID,Int32 Dept_ID,Int32 cordid)
    {
        SqlParameter[] param = new SqlParameter[6];
        param[0] = new SqlParameter("@fromDate", vdate);
        param[1] = new SqlParameter("@ToDate", Edate);
        param[2] = new SqlParameter("@Contract_ID", Contract_ID);
        param[3] = new SqlParameter("@Site_ID", Site_ID);
        param[4] = new SqlParameter("@Dept_ID", Dept_ID);
        param[5] = new SqlParameter("@CordID", cordid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_ManualEntries");
        return ds.Tables[0];
    }
    public DataTable GetForcedReport(string Vdate, string Edate, Int32 Site_ID, Int32 Contract_ID, Int32 Dept_ID, int cord_id)
    {
        SqlParameter[] param = new SqlParameter[6];
        param[0] = new SqlParameter("@vDate", Vdate);
        param[1] = new SqlParameter("@Edate", Edate);
        param[2] = new SqlParameter("@Site_ID", Site_ID);
        param[3] = new SqlParameter("@Contract_ID", Contract_ID);
        param[4] = new SqlParameter("@Dept_ID", Dept_ID);
        param[5] = new SqlParameter("@CordID",cord_id);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_ForcedAbsentees");
        return ds.Tables[0];
    }
    public DataTable GetHourlyReport(string vdate, string Edate, Int32 Site_ID, Int32 Contract_ID, Int32 Dept_ID,int corid)
    {
        SqlParameter[] param = new SqlParameter[6];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@Edate", Edate);
        param[2] = new SqlParameter("@Site_ID", Site_ID);
        param[3] = new SqlParameter("@Contract_ID", Contract_ID);
        param[4] = new SqlParameter("@Dept_ID", Dept_ID);
        param[5] = new SqlParameter("@Cordid", corid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_AbsentHours");
        return ds.Tables[0];
    }
    public DataTable Overtime(string vdate, string vNdate, int ConId, int SiteId, int dept, int cord,int EmpId,string OtType)
    {
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@fromdate", vdate);
        param[1] = new SqlParameter("@todate ", vNdate);
        param[2] = new SqlParameter("@contract ", ConId);
        param[3] = new SqlParameter("@site", SiteId);
        param[4] = new SqlParameter("@dept    ", dept);
        param[5] = new SqlParameter("@cord", cord);
        param[6] = new SqlParameter("@EmpId", EmpId);
        param[7] = new SqlParameter("@OTType", OtType);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_overtime");
        return ds.Tables[0];
    }
    public DataTable OvertimePayment(string vdate, string vNdate, int ConId, int SiteId, int dept, int cord, int EmpId, string OtType)
    {
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@fromdate", vdate);
        param[1] = new SqlParameter("@todate ", vNdate);
        param[2] = new SqlParameter("@contract ", ConId);
        param[3] = new SqlParameter("@site", SiteId);
        param[4] = new SqlParameter("@dept    ", dept);
        param[5] = new SqlParameter("@cord", cord);
        param[6] = new SqlParameter("@EmpId", EmpId);
        param[7] = new SqlParameter("@OTType", OtType);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Sp_ExtraPayment");
        return ds.Tables[0];
    }
    public DataTable sixhourcal(string vdate, string Edate, Int32 Contract_ID, Int32 Site_ID, Int32 Dept_ID, int corid)
    {
        SqlParameter[] param = new SqlParameter[6];
        param[0] = new SqlParameter("@fromdate",vdate );
        param[1] = new SqlParameter("@todate", Edate);
        param[2] = new SqlParameter("@contractid",Contract_ID );
        param[3] = new SqlParameter("@siteid", Site_ID);
        param[4] = new SqlParameter("@Deptid", Dept_ID);
        param[5] = new SqlParameter("@CordID", corid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_sixhourscalc");
        return ds.Tables[0];
    }
    public DataTable GetPresentReport(string vdate, string edate, int ContId, int SiteId, int frmtime, int totime, string days,Int32 Dept_ID,Int32 cord)
    {
        SqlParameter[] param = new SqlParameter[9];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@vEdate", edate);
        param[2] = new SqlParameter("@Contract_ID", ContId);
        param[3] = new SqlParameter("@Site_ID", SiteId);
        param[4] = new SqlParameter("@FromTime", frmtime);
        param[5] = new SqlParameter("@ToTime", totime);
        param[6] = new SqlParameter("@Days", days);
        param[7] = new SqlParameter("@Dept_Id", Dept_ID);
        param[8] = new SqlParameter("@CordID ", cord);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_DailyPresent");
        return ds.Tables[0];
    }
    public Int32 Insertleavemasters(string Emp_Number, string empname, string leavetype, DateTime datestrt, DateTime dateend,string fromtime,string totime)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@empnumber", Emp_Number);
        param[1] = new SqlParameter("@empname", empname);
        param[2] = new SqlParameter("@leavetype", leavetype);
        param[3] = new SqlParameter("@datestrt", datestrt);
        param[4] = new SqlParameter("@dateend", dateend);
        param[5] = new SqlParameter("@fromtime", fromtime);
        param[6] = new SqlParameter("@totime", totime);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "sp_saveleavedetails");
    }
    public DataTable viewabsentdetails()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("sp_viewabsentdetails ");
        return ds.Tables[0];
    }
    public DataTable GetDraftPresentReport(string vdate, int ContId, int SiteId, string frmtime, string totime)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@Contract_ID", ContId);
        param[2] = new SqlParameter("@Site_ID", SiteId);
        param[3] = new SqlParameter("@FromTime", frmtime);
        param[4] = new SqlParameter("@ToTime", totime);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_DraftPresentReport");
        return ds.Tables[0];
    }
    public DataTable GetDailyPresents(string vdate, int contract, int site, int orgid,int cordid)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@date", vdate);
        param[1] = new SqlParameter("@contractid", contract);
        param[2] = new SqlParameter("@siteid", site);
        param[3] = new SqlParameter("@orgid", orgid);
        param[4] = new SqlParameter("@cordid", cordid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_dailypresents");
        return ds.Tables[0];
    }
    public DataTable GetDail(int contract, int site,string date)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@contract", contract);
        param[1] = new SqlParameter("@siteid ", site);
        param[2] = new SqlParameter("@date  ", date);
       
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_setextratimeview");
        return ds.Tables[0];
    }
    public DataTable GetDisplaypresents(string Fdate, string todate, int contract, int site, int deptid, int cordid, int empid)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@frmdate", Fdate);
        param[1] = new SqlParameter("@Todate", todate);
        param[2] = new SqlParameter("@contractid", contract);
        param[3] = new SqlParameter("@siteid", site);
        param[4] = new SqlParameter("@dept", deptid);
        param[5] = new SqlParameter("@cordid", cordid);
        param[6] = new SqlParameter("@EmpId", empid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Usp_displayempconsolidated");
        return ds.Tables[0];
    }
    public DataTable GetPayrollReport(string Fdate, string todate, int contract, int site, int deptid, int cordid, int empid)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@frmdate", Fdate);
        param[1] = new SqlParameter("@Todate", todate);
        param[2] = new SqlParameter("@contractid", contract);
        param[3] = new SqlParameter("@siteid", site);
        param[4] = new SqlParameter("@dept", deptid);
        param[5] = new SqlParameter("@cordid", cordid);
        param[6] = new SqlParameter("@EmpId", empid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Usp_PayrollReport");
        return ds.Tables[0];
    }
    public DataTable GetDisplaypresentsexemp(string Fdate, string todate, int contract, int site, int deptid, int cordid, int empid)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@frmdate", Fdate);
        param[1] = new SqlParameter("@Todate", todate);
        param[2] = new SqlParameter("@contractid", contract);
        param[3] = new SqlParameter("@siteid", site);
        param[4] = new SqlParameter("@dept", deptid);
        param[5] = new SqlParameter("@cordid", cordid);
        param[6] = new SqlParameter("@EmpId", empid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Usp_displayempconsolidatedExEmp");
        return ds.Tables[0];
    }
    public DataTable GetDailyAbsents(int contract, int site, string vdate, int orgid,int cordid)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@contract", contract);
        param[1] = new SqlParameter("@site", site);
        param[2] = new SqlParameter("@date", vdate);
        param[3] = new SqlParameter("@orgid", orgid);
        param[4] = new SqlParameter("@cordid",cordid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_dailyabsents");
        return ds.Tables[0];
    }

    public DataTable GetContractDetails(Int32 Contract_ID, Int32 Org_ID)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Contract_ID", Contract_ID);
        param[1] = new SqlParameter("@Org_ID", Org_ID);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "GetContractsDetails");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public DataTable SearchContracts(string ContractCode, string Desc, string Type, string Customer, string CreationDate, string StartDate, string EndDate, string Site_Name, Int32 Res, Int32 RevNo, string RefNo, string Renewal_Date, Int32 Org_Id, string Status, string UserId)
    {
        SqlParameter[] param = new SqlParameter[15];
        //SqlParameter[] param = new SqlParameter[14];
        param[0] = new SqlParameter("@ContractCode", ContractCode);
        param[1] = new SqlParameter("@Desc", Desc);
        param[2] = new SqlParameter("@Type", Type);
        param[3] = new SqlParameter("@Customer", Customer);
        param[4] = new SqlParameter("@CreationDate", CreationDate);
        param[5] = new SqlParameter("@StartDate", StartDate);
        param[6] = new SqlParameter("@EndDate", EndDate);
        param[7] = new SqlParameter("@Site_Name", Site_Name);
        param[8] = new SqlParameter("@Res", Res);
        param[9] = new SqlParameter("@RevNo", RevNo);
        param[10] = new SqlParameter("@RefNo", RefNo);
        param[11] = new SqlParameter("@Renewal_Date", Renewal_Date);
        param[12] = new SqlParameter("@Org_ID", Org_Id);
        param[13] = new SqlParameter("@Status", Status);
        param[14] = new SqlParameter("@UserId", UserId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "SearchContract");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public DataTable GetCategory()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("GetCategory");
        return ds.Tables[0];
    }
    public DataTable GetApprovedContracts(Int32 OrgID)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@OrgID", @OrgID);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "GetApprovedContracts");
        return ds.Tables[0];
    }
    public DataTable GetAbsentReportOffline(DateTime vdate, DateTime edate, int CId, int SId, string procedure)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@vEdate", edate);
        param[2] = new SqlParameter("@Contract_ID", CId);
        param[3] = new SqlParameter("@Site_ID", SId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, procedure);
        return ds.Tables[0];
    }
    public DataTable GetLateReportOffline(string vdate, int ConId, int SiteId, string vNdate)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@Contract_ID", ConId);
        param[2] = new SqlParameter("@Site_ID", SiteId);
        param[3] = new SqlParameter("@vEdate", vNdate);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "GetLateAttendanceOffline");
        return ds.Tables[0];
    }
    public DataTable GetorganizationView()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("[sp_soa_organization]");
        return ds.Tables[0];
    }
    public DataTable viewleavetype()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("sp_viewabsentdet");
        return ds.Tables[0];
    }
    public DataTable viewemployeename(string empname)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@employeenumber",empname);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param,"[sp_viewempdata]");
        return ds.Tables[0];
    }
    public DataTable Emailview()
    {
        
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("[sp_maillviews]");
        return ds.Tables[0];
    }
    public DataTable SOABINDEPTDATA()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("[sp_Binddeptdata]");
        return ds.Tables[0];
    }
    public DataTable SetGridViewByValue(int Flag, string Value, int deptid)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@Flag", Flag);
        param[1] = new SqlParameter("@value", Value);
        param[2] = new SqlParameter("@dept", deptid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_empdetails");
        return ds.Tables[0];
    }
    public DataTable VerifyDept()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("[sp_verifydept]");
        return ds.Tables[0];
    }
    public DataTable GetCordinatorview()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("sp_viewsupervisor");
        return ds.Tables[0];
    }
    public DataTable Getdisplaydept()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("sp_displaydept");
        return ds.Tables[0];
    }
    public DataTable Searchbyemail(int dept, string name)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@dept", dept);
        param[1] = new SqlParameter("@name", name);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_searchbyemail");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public DataTable Searchbyname(int dept, string name)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@dep", dept);
        param[1] = new SqlParameter("@name", name);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[sp_searchbyphone]");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public DataTable Searchbydesign(int dept, string name)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@dep", dept);
        param[1] = new SqlParameter("@name", name);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[sp_searchbydesignation]");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public DataTable Searchbydept(int dept, string name)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@dep", dept);
        param[1] = new SqlParameter("@name", name);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[sp_searchbydept]");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public Int32 InsertCoordiantor(string DeptID, int cordinator, string email, string mobno, string username, string password,bool rosterallwed)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@dept", DeptID);
        param[1] = new SqlParameter("@cord", cordinator);
        param[2] = new SqlParameter("@email", email);
        param[3] = new SqlParameter("@mobno", mobno);
        param[4] = new SqlParameter("@username", username);
        param[5] = new SqlParameter("@password", password);
        param[6] = new SqlParameter("@roster", rosterallwed);

        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "[sp_SOA_cordinator]");
    }
    public Int32 InsertData(int DeptID, int empid, string username, string password)
    
{
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@DeptID", DeptID);
        param[1] = new SqlParameter("@employeenumber", empid);
        param[2] = new SqlParameter("@username", username);
        param[3] = new SqlParameter("@password", password);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "sp_SOA_dept");



    }
    public DataTable GetEmployeesFinal()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("sp_viewEmployeesassigned");
        return ds.Tables[0];
    }
    public Int32 DeleteFinalEmployees(string empcode)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@empcode", empcode);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "sp_DeleteFinal");
    }
    public DataTable viewDepartmenthead(int orgid)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Organisationid", orgid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_viewDeptHeadforaddcordinators");
        return ds.Tables[0];
    }
    public DataTable viewcORDINATOR(Int32 deptid)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@deptid", deptid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_SOA_viewCordinator");
        return ds.Tables[0];
    }
    public Int32 InsertEmployeesFinal(string employeecode, string assignedcode, string depthead)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@empid", employeecode);
        param[1] = new SqlParameter("@ascord", assignedcode);
        param[2] = new SqlParameter("@deptid", depthead);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "[sp_insertemployeeList]");
    }
    public Int32 InsertEmployeeMaildet(string empno,int deptid, string subject,string reason)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@empno",empno);
        param[1] = new SqlParameter("@deptid",deptid);
        param[2] = new SqlParameter("@subject", subject);
        param[3] = new SqlParameter("@reason", reason);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "[sp_Maillogs]");
    }
    public DataTable viewEmployeesassignedforcord(int deptid)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@dept", deptid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_viewemployeeslistforcordinatorassignmnt");
        return ds.Tables[0];
    }
    public DataTable GetemployeesFinal(int deptid)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@deprtmentid", deptid);


        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_viewEmployeesassigned");
        return ds.Tables[0];
    }
    public DataTable GetEmailDatails(int deptid)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@deptid", deptid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_displaydataforEmail");
        return ds.Tables[0];
    }
    public DataTable BindEmployeeWorkHourDetails(string emdate, int deptid, int cordid,int roleid,int empId,string vdate,string OtType)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@employeedate", emdate);
        param[1] = new SqlParameter("@deptid", deptid);
        param[2] = new SqlParameter("@cordid", cordid);
        param[3] = new SqlParameter("@RoleId", roleid);
        param[4] = new SqlParameter("@EmpId", empId);
        param[5] = new SqlParameter("@ToDate", vdate);
        param[6] = new SqlParameter("@Type", OtType);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[sp_SetEmployeeExtraTimes]");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public Int32 UpdateExtraTime(int ID, string empno, bool chkc, string Ctime, string CMM, string CRem, bool chkd, string Dtime, string DMM, string DRem, bool hr, string hrtime, string hrMM, string hrRem, int RoleId,int cusr,int dusr,int hrusr)
    {
        SqlParameter[] param = new SqlParameter[18];
        param[0] = new SqlParameter("@id", ID);
        param[1] = new SqlParameter("@employeeno", empno);
        param[2] = new SqlParameter("@chkc", chkc);
        param[3] = new SqlParameter("@Ctime", Ctime);
        param[4] = new SqlParameter("@CMM", CMM);
        param[5] = new SqlParameter("@CRem", CRem);
        param[6] = new SqlParameter("@chkd", chkd);
        param[7] = new SqlParameter("@Dtime", Dtime);
        param[8] = new SqlParameter("@DMM", DMM);
        param[9] = new SqlParameter("@DRem", DRem);
        param[10] = new SqlParameter("@chkhr", hr);
        param[11] = new SqlParameter("@hrtime", hrtime);
        param[12] = new SqlParameter("@hrMM", hrMM);
        param[13] = new SqlParameter("@hrRem", hrRem);
        param[14] = new SqlParameter("@RoleId", RoleId);
        param[15] = new SqlParameter("@cUsrId", cusr);
        param[16] = new SqlParameter("@DUsrId", dusr);
        param[17] = new SqlParameter("@HrUsrId", hrusr);

        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "updateextratime");
    }

    public DataTable GetDisplayLeaveType()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("sp_displayleave");
        return ds.Tables[0];
    }
    public DataTable GetDept(int deptid)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@deptid", deptid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_dept");
        return ds.Tables[0];

        
    }
    public Int32 UpdateDeleteDept(int ID)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@employeeid", ID);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "sp_deletedept");
    }
    public Int32 UpdateDeleteCoordinator(int hrcontrolid)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@hrcontrolid", hrcontrolid);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "sp_cordinatordeletion");
    }

    public DataTable ShortLeaveEmp(string vdate, string Edate, Int32 Contract_ID, Int32 Site_ID, Int32 Dept_ID, Int32 corid, Int32 EmpId, string Flag)
    {
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@fromdate", vdate);
        param[1] = new SqlParameter("@todate", Edate);
        param[2] = new SqlParameter("@contractid", Contract_ID);
        param[3] = new SqlParameter("@siteid", Site_ID);
        param[4] = new SqlParameter("@Deptid", Dept_ID);
        param[5] = new SqlParameter("@CordID", corid);
        param[6] = new SqlParameter("@EmpID", EmpId);
        param[7] = new SqlParameter("@Flag", Flag);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Usp_individualEmpsl");
        return ds.Tables[0];
    }

    public DataTable getdataoff(string fromdate, string todate, Int32 Contract_ID, Int32 Site_ID, Int32 Dept_ID, int corid)
    {
        SqlParameter[] param = new SqlParameter[6];
        param[0] = new SqlParameter("@fromdate", fromdate);
        param[1] = new SqlParameter("@todate", todate);
        param[2] = new SqlParameter("@contractid", Contract_ID);
        param[3] = new SqlParameter("@siteid", Site_ID);
        param[4] = new SqlParameter("@Deptid", Dept_ID);
        param[5] = new SqlParameter("@CordID", corid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[sp_dayoff]");
        return ds.Tables[0];
    }

    public Int32 InsertEmpComOff(string ID, string date, string workdate)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@employeeno", ID);
        param[1] = new SqlParameter("@Date", date);
        param[2] = new SqlParameter("@Workdt", workdate);

        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "Usp_InsertEmpComOff");
    }
    public Int32 Insertleavemaster(string code, string paid, string leavetype, string frmdate, string todate, string fromtime, string totime, int toth, int totm)
    {
        SqlParameter[] param = new SqlParameter[9];
        param[0] = new SqlParameter("@code", code);
        param[1] = new SqlParameter("@paid", paid);
        param[2] = new SqlParameter("@lvtype", leavetype);
        param[3] = new SqlParameter("@frmdte", frmdate);
        param[4] = new SqlParameter("@todate", todate);
        param[5] = new SqlParameter("@frmtine", fromtime);
        param[6] = new SqlParameter("@totime", totime);
        param[7] = new SqlParameter("@toth", toth);
        param[8] = new SqlParameter("@totmin", totm);

        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "sp_insertleavemaster");
    }
    public DataTable getleavemaster()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("sp_leavetypeview");
        return ds.Tables[0];
    }
    public Int32 Updateleavemaster(int ID)
    {
        SqlParameter[] param = new SqlParameter[1];

        param[0] = new SqlParameter("@id", ID);


        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "sp_deleteleave");
    }
    public Int32 UpdateManualleavemaster(int ID, string fromdate, string todate)
    {
        SqlParameter[] param = new SqlParameter[3];

        param[0] = new SqlParameter("@empnumber", ID);
        param[1] = new SqlParameter("@FromDate", fromdate);
        param[2] = new SqlParameter("@ToDate", todate);


        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "sp_deletemanualleaveadds");
    }

    public DataTable GetEarlyAndLate(string vdate, string edate, int ConId, int SiteId, int dept_id, int cord, int empid)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@fromdate", vdate);
        param[1] = new SqlParameter("@toDate", edate);
        param[2] = new SqlParameter("@contractid", ConId);
        param[3] = new SqlParameter("@SiteID", SiteId);
        param[4] = new SqlParameter("@DeptID", dept_id);
        param[5] = new SqlParameter("@cordID", cord);
        param[6] = new SqlParameter("@EmpId", empid);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Usp_EarlyAndLate");
        return ds.Tables[0];
    }
    public DataTable getrosterview(string vdate, string vedate, int contrct, int site, int dept, int cord, int emp)
    {
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@vDate", vdate);
        param[1] = new SqlParameter("@eDate", vedate);
        param[2] = new SqlParameter("@Contract_ID", contrct);
        param[3] = new SqlParameter("@Site_ID", site);
        param[4] = new SqlParameter("@Dept_ID", dept);
        param[5] = new SqlParameter("@cordID", cord);
        param[6] = new SqlParameter("@empid", emp);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_viewrosterfullview");
        return ds.Tables[0];
    }
    public DataTable getrosterviews()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("sp_dso_viewrosterview");
        return ds.Tables[0];
    }

    public DataTable GetDeptRole(int deptid, int EmpId, int SiteId, int contractId)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@deptid", deptid);
        param[1] = new SqlParameter("@EmpId", EmpId);
        param[2] = new SqlParameter("@SiteId", SiteId);
        param[3] = new SqlParameter("@contractId", SiteId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_dept");
        return ds.Tables[0];


    }

    public DataTable GetEmpDet(int deptid, int EmpId,int RoleId)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@deptid", deptid);
        param[1] = new SqlParameter("@EmpId", EmpId);
        param[2] = new SqlParameter("@RoleId", RoleId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "usp_FillEmp");
        return ds.Tables[0];


    }

    public DataTable GetList(int Flag, int EmpId)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Flag", Flag);
        param[1] = new SqlParameter("@EmpId", EmpId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "sp_FillList");
        return ds.Tables[0];


    }


    public DataTable GetIndividualEarlyAndLate(string vdate, string edate, int ConId, int SiteId, int dept_id, int cord, int empid,string Flag)
    {
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@fromdate", vdate);
        param[1] = new SqlParameter("@toDate", edate);
        param[2] = new SqlParameter("@contractid", ConId);
        param[3] = new SqlParameter("@SiteID", SiteId);
        param[4] = new SqlParameter("@DeptID", dept_id);
        param[5] = new SqlParameter("@cordID", cord);
        param[6] = new SqlParameter("@EmpId", empid);
        param[7] = new SqlParameter("@Flag", Flag);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Usp_SingleEarlyLate");
        return ds.Tables[0];
    }

    public DataTable CheckPreviousDate(string ID, string name)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@ID", ID);
        param[1] = new SqlParameter("@name", name);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Sp_CheckPreviousDate");
        return ds.Tables[0];
    }


    public DataTable PayDeduction(string vdate, string Edate, Int32 Contract_ID, Int32 Site_ID, Int32 Dept_ID, Int32 corid, Int32 EmpId, string Flag)
    {
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@fromdate", vdate);
        param[1] = new SqlParameter("@todate", Edate);
        param[2] = new SqlParameter("@contractid", Contract_ID);
        param[3] = new SqlParameter("@siteid", Site_ID);
        param[4] = new SqlParameter("@Deptid", Dept_ID);
        param[5] = new SqlParameter("@CordID", corid);
        param[6] = new SqlParameter("@EmpID", EmpId);
        param[7] = new SqlParameter("@Flag", Flag);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Usp_ShortLeave");
        return ds.Tables[0];
    }

    public DataTable HourDeduction(string vdate, string Edate, Int32 Contract_ID, Int32 Site_ID, Int32 Dept_ID, Int32 corid, Int32 EmpId, string Flag)
    {
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@fromdate", vdate);
        param[1] = new SqlParameter("@todate", Edate);
        param[2] = new SqlParameter("@contractid", Contract_ID);
        param[3] = new SqlParameter("@siteid", Site_ID);
        param[4] = new SqlParameter("@Deptid", Dept_ID);
        param[5] = new SqlParameter("@CordID", corid);
        param[6] = new SqlParameter("@EmpID", EmpId);
        param[7] = new SqlParameter("@Flag", Flag);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Usp_HourAndFullPayDeduction");
        return ds.Tables[0];
    }

    public Int32 GetShiftCount(Int32 contract, Int32 site, String Start, String End)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@Contract_Id", contract);
        param[1] = new SqlParameter("@Site_Id", site);
        param[2] = new SqlParameter("@Start", Start);
        param[3] = new SqlParameter("@End", End);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_ShiftCnt");
        return Convert.ToInt32(ds.Tables[0].Rows[0]["Cnt"]);
    
    }

    public DataTable DisplaydynamicShif(Int32 Contract, Int32 Site, String Flag)
    {
    
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@ContractId", Contract);
        param[1] = new SqlParameter("@SiteId", Site);
        param[2] = new SqlParameter("@Flag", Flag);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Sp_DynamicShift");
        return ds.Tables[0];

    }
    public DataTable GetTimeSheet(string Fdate, string todate, int contract, int site, int deptid, int cordid, int empid, int log)
    {
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@fromdate", Fdate);
        param[1] = new SqlParameter("@Todate", todate);
        param[2] = new SqlParameter("@contractid", contract);
        param[3] = new SqlParameter("@siteid", site);
        param[4] = new SqlParameter("@Deptid", deptid);
        param[5] = new SqlParameter("@cordid", cordid);
        param[6] = new SqlParameter("@EmpId", empid);
        param[7] = new SqlParameter("@logid", log);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "PQA_TimeSheet");
        return ds.Tables[0];
    }
    public Int32 InsertNextApproval(Int32 ApplicationId, Int32 StatusId, string Remarks, Int32 CreatedBy, Int32 Type_Id)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@ApplicationId", ApplicationId);
        param[1] = new SqlParameter("@StatusId", StatusId);
        param[2] = new SqlParameter("@Remarks", Remarks);
        param[3] = new SqlParameter("@CreatedBy", CreatedBy);
        param[4] = new SqlParameter("@Type_Id", Type_Id);
        DataAccessLayer da = new DataAccessLayer();
        Int32 id = da.GetIntIdentity(param, "InsertNextApproval");
        return id;

    }
    public DataTable GetInboxList(Int32 ForwardedTo, string Operation)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@ForwardedTo", ForwardedTo);
        param[1] = new SqlParameter("@Operation", Operation);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[GetInboxList]");
        if (ds != null && ds.Tables.Count > 0)
            return ds.Tables[0];
        else
            return null;
    }

    public DataTable sp_GetApproval(Int32 ID, Int32 ApprovalRights, Int32 priority, Int32 CreatedBy, string Operation, Int32 Type_Id)
    {
        SqlParameter[] param = new SqlParameter[6];
        param[0] = new SqlParameter("@ID", ID);
        param[1] = new SqlParameter("@Approval_id", ApprovalRights);
        param[2] = new SqlParameter("@priority", priority);
        param[3] = new SqlParameter("@CreatedBy", CreatedBy);
        param[4] = new SqlParameter("@Type_Id", Type_Id);
        param[5] = new SqlParameter("@Operation", Operation);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[sp_tblApproval]");
        return ds.Tables[0];
    }

    public DataTable sp_tblApprovalRole(string Operation)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Operation", Operation);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[sp_tblApprovalRole]");
        return ds.Tables[0];
    }
    public bool sp_InsertUpdateApproval(Int32 ID, Int32 ApprovalRights, Int32 priority, Int32 CreatedBy, string Operation, Int32 Type_Id)
    {
        SqlParameter[] param = new SqlParameter[6];
        param[0] = new SqlParameter("@ID", ID);
        param[1] = new SqlParameter("@Approval_id", ApprovalRights);
        param[2] = new SqlParameter("@priority", priority);
        param[3] = new SqlParameter("@CreatedBy", CreatedBy);
        param[4] = new SqlParameter("@Type_Id", Type_Id);
        param[5] = new SqlParameter("@Operation", Operation);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[sp_tblApproval]");
        return true;
    }

    public DataTable GetEmpLeaveDetails(string empId, string Oper, int DEPTID, int FID, int LeaveType_Id, int MaxDays,int userId,int PrevDays)
    {
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@EmpNo", empId);
        param[1] = new SqlParameter("@Oper", Oper);
        param[2] = new SqlParameter("@DEPTID", DEPTID);
        param[3] = new SqlParameter("@FID", FID);
        param[4] = new SqlParameter("@LeaveType_Id", LeaveType_Id);
        param[5] = new SqlParameter("@MaxDays", MaxDays);
        param[6] = new SqlParameter("@userId", userId);
        param[7] = new SqlParameter("@PrevDays", PrevDays);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Sp_EmpLeaveDetails");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public Int32 Insertoutsource(string firstname, string lastnme, string designation, string dob, string gender, string national, string strt, DateTime end, string
        Division, string EMPID, int ExEmployee, string designationid)
    {
        SqlParameter[] param = new SqlParameter[12];
        param[0] = new SqlParameter("@firstnme", firstname);
        param[1] = new SqlParameter("@lastname", lastnme);
        param[2] = new SqlParameter("@designation", designation);
        param[3] = new SqlParameter("@dob", dob);
        param[4] = new SqlParameter("@gender", gender);
        param[5] = new SqlParameter("@DeptId", national);
        //param[6] = new SqlParameter("@div", div);
        param[6] = new SqlParameter("@strt", strt);
        param[7] = new SqlParameter("@end", end);
        param[8] = new SqlParameter("@DeptName", Division);
        param[9] = new SqlParameter("@EMPID", EMPID);
        param[10] = new SqlParameter("@IsExEmployee", ExEmployee);
        param[11] = new SqlParameter("@designationid", designationid);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "sp_outsource");
    }
    public DataTable ViewDivisionview()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("Divisionview");
        return ds.Tables[0];
    }



    public DataTable viewoutsource(int isoutsource)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@isoutsource", isoutsource);
        DataAccessLayer da = new DataAccessLayer();
        //DataSet ds = da.getDataByParam("[sp_outsourceview]");
        //return ds.Tables[0];
        DataSet ds = da.getDataByParam(param, "sp_outsourceview");
        return ds.Tables[0];
    }

    public DataTable viewoutsrcedepartment()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("[sp_outsourcedepartment]");
        return ds.Tables[0];
    }
    public DataTable viewoutsrcedesignation()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("[sp_outsourcedesignation]");
        return ds.Tables[0];
    }

    public DataTable viewoutsourceview(decimal personid)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@personid", personid);
        DataAccessLayer da = new DataAccessLayer();

        DataSet ds = da.getDataByParam(param, "[sp_outsourcedisplay]");
        return ds.Tables[0];
    }

    public Int32 InsertUpdateScheduler(Int32 ID, Int32 Contract_ID, Int32 Site_ID, Int32 SchedulerID, string Timing,
      string CCMailRoleId, string WeekDays, string @MailType, Int32 Days, Int32 CreatedBy, string Operation, string MailText, string EmpAll,
      string ExcMailRoleId, string Mail1, string Mail2, string Mail3)
    {
        SqlParameter[] param = new SqlParameter[17];
        param[0] = new SqlParameter("@ID", ID);
        param[1] = new SqlParameter("@Contract_ID", Contract_ID);
        param[2] = new SqlParameter("@Site_ID", Site_ID);
        param[3] = new SqlParameter("@SchedulerID", SchedulerID);
        param[4] = new SqlParameter("@Timing", Timing);
        param[5] = new SqlParameter("@WeekDays", WeekDays);
        param[6] = new SqlParameter("@CCMailRoleId", CCMailRoleId);
        param[7] = new SqlParameter("@@MailType", @MailType);
        param[8] = new SqlParameter("@Days", Days);
        param[9] = new SqlParameter("@CreatedBy", CreatedBy);
        param[10] = new SqlParameter("@Operation", Operation);
        param[11] = new SqlParameter("@Text_Remarks", MailText);
        param[12] = new SqlParameter("@EmpAll", EmpAll);
        param[13] = new SqlParameter("@ExcludeMailRoleId", ExcMailRoleId);
        param[14] = new SqlParameter("@Mail1", Mail1);
        param[15] = new SqlParameter("@Mail2", Mail2);
        param[16] = new SqlParameter("@Mail3", Mail3);

        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "[sp_Sceduler]");
    }
    
    public DataTable BindSchedulerMaster(Int32 Flag,Int32 id,Int32 contId,Int32 SiteId,Int32 Prio)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@flag", Flag);
        param[1] = new SqlParameter("@id", id);
        param[2] = new SqlParameter("@contId", contId);
        param[3] = new SqlParameter("@SiteId", SiteId);
        param[4] = new SqlParameter("@Prio", Prio);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[Sp_PopulateDropDownList]");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }

    public DataTable DisplayShift(Int32 Id, String Flag)
    {

        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Id", Id);
        param[1] = new SqlParameter("@Flag", Flag);
       
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "Sp_DisplayShift");
        return ds.Tables[0];

    }

    public DataTable FillFilterControls(int deptid, int EmpId, int SiteId, int contractId, string Operation, int UserId, int RoleId, int CordId)
    {
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@deptid", deptid);
        param[1] = new SqlParameter("@EmpId", EmpId);
        param[2] = new SqlParameter("@SiteId", SiteId);
        param[3] = new SqlParameter("@contractId", contractId);
        param[4] = new SqlParameter("@Oper", Operation);
        param[5] = new SqlParameter("@UserId", UserId);
        param[6] = new SqlParameter("@RoleId", RoleId);
        param[7] = new SqlParameter("@CordId", CordId);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_FillFilterControls");
        return ds.Tables[0];


    }
    public DataTable FillFilterControls(int deptid, int EmpId, int SiteId, int contractId, string Operation, int UserId, int RoleId, int CordId,string PM)
    {
        SqlParameter[] param = new SqlParameter[9];
        param[0] = new SqlParameter("@deptid", deptid);
        param[1] = new SqlParameter("@EmpId", EmpId);
        param[2] = new SqlParameter("@SiteId", SiteId);
        param[3] = new SqlParameter("@contractId", contractId);
        param[4] = new SqlParameter("@Oper", Operation);
        param[5] = new SqlParameter("@UserId", UserId);
        param[6] = new SqlParameter("@RoleId", RoleId);
        param[7] = new SqlParameter("@CordId", CordId);
        param[8] = new SqlParameter("@ProjectManagerNo", PM);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_FillFilterControls");
        return ds.Tables[0];


    }


    public DataTable save_SchedulerDetails(int ScheduleType, int Flexibility, string name, string sp,
       string salutation, int fname, int lname, int mname, int fullname,
       string text, string Encodetext, string userid, string opr, int map_id)
    {
        DataTable dt = new DataTable();
        SqlParameter[] param = new SqlParameter[14];
        param[0] = new SqlParameter("@ScheduleType", ScheduleType);
        param[1] = new SqlParameter("@Flexibility", Flexibility);
        param[2] = new SqlParameter("@name", name);
        param[3] = new SqlParameter("@sp", sp);
        param[4] = new SqlParameter("@salutation", salutation);
        param[5] = new SqlParameter("@fname", fname);
        param[6] = new SqlParameter("@lname", lname);
        param[7] = new SqlParameter("@mname", mname);
        param[8] = new SqlParameter("@fullname", fullname);
        param[9] = new SqlParameter("@text", text);
        param[10] = new SqlParameter("@Encodetext", Encodetext);
        param[11] = new SqlParameter("@userid", userid);
        param[12] = new SqlParameter("@opr", opr);
        param[13] = new SqlParameter("@map_id", map_id);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_SchedulerDetail");
        if (ds != null)
            dt = ds.Tables[0];
        else
            dt = null;
        return dt;
    }



    public DataTable MonthlyControl(string month, int EmpId, int SiteId, int compId, int deptid, string Procedure)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@Month", month);
        param[1] = new SqlParameter("@CompanyId", compId);
        param[2] = new SqlParameter("@deptid", deptid);
        param[3] = new SqlParameter("@EmpId", EmpId);
        param[4] = new SqlParameter("@SiteId", SiteId);


        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, Procedure);
        return ds.Tables[0];

    }
    public DataTable GetEmpCount(int contractID,String Operation,int SiteID)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@contractID", contractID);
        param[1] = new SqlParameter("@Operation", Operation);
        param[2] = new SqlParameter("@SiteID", SiteID);
        
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "SP_GetEmployeeAllocationDetails");
        return ds.Tables[0];
    }
    public DataTable GetRosterByShift(Int32 Contract_Id, Int32 site_id, Int32 DeptId, string start, string end, Int32 ShiftId, string EmpId, string Malefemale, Int32 RepeatDays, string oper)
    {
        SqlParameter[] param = new SqlParameter[10];
        param[0] = new SqlParameter("@Contract_Id", Contract_Id);
        param[1] = new SqlParameter("@Site_Id", site_id);
        param[2] = new SqlParameter("@DeptId", DeptId);
        param[3] = new SqlParameter("@start", start);
        param[4] = new SqlParameter("@end", end);
        param[5] = new SqlParameter("@ShiftId", ShiftId);
        param[6] = new SqlParameter("@EmpId", EmpId);
        param[7] = new SqlParameter("@Malefemale", Malefemale);
        param[8] = new SqlParameter("@RepeatDays", RepeatDays);
        param[9] = new SqlParameter("@oper", oper);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "GetRosterByShift");
        return ds.Tables[0];
    }
    //Added on 09-06-2016
    public Int32 InsertUpdateEmergencyRel_DateRange(Int32 Emp_ID, string Emp_Number, string Emp_Name, Int32 Contract_ID, Int32 Site_ID, Int32 CreatedBy,
         string Fromdate, string Todate)
    {
        SqlParameter[] param = new SqlParameter[9];
        param[0] = new SqlParameter("@Emp_ID", Emp_ID);
        param[1] = new SqlParameter("@Emp_Number", Emp_Number);
        param[2] = new SqlParameter("@Emp_Name", Emp_Name);
        param[3] = new SqlParameter("@macaddress", GetMacAddress());
        param[4] = new SqlParameter("@Contract_ID", Contract_ID);
        param[5] = new SqlParameter("@Site_ID", Site_ID);
        param[6] = new SqlParameter("@CreatedBy", CreatedBy);
        param[7] = new SqlParameter("@vdateFrom", Fromdate);
        param[8] = new SqlParameter("@vdateTo", Todate);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "InsertEmergencyRel_DateRange");
    }
    public Int32 InsertUpdateManualCategory_dateRange(string Emp_Number, Int32 Contract_ID, Int32 Site_ID, Int32 CreatedBy,
        Int32 CategoryID, string Fromdate, string Todate)
    {
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@Category_ID", CategoryID);
        param[1] = new SqlParameter("@Emp_Num", Emp_Number);
        param[2] = new SqlParameter("@macaddress", GetMacAddress());
        param[3] = new SqlParameter("@Contract_ID", Contract_ID);
        param[4] = new SqlParameter("@Site_ID", Site_ID);
        param[5] = new SqlParameter("@CreatedBy", CreatedBy);
        param[6] = new SqlParameter("@vdateFrom", Fromdate);
        param[7] = new SqlParameter("@vdateTo", Todate);
        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "InsertManualCategory");
    }
    public Int32 UpdateMonthlyAttendanceOffline_Daterange(string Emp_Number, Int32 Contract_ID, Int32 Site_ID, string Fromdate, string Todate)
    {
        SqlParameter[] param = new SqlParameter[5];

        param[0] = new SqlParameter("@EmpNo", Emp_Number);
        param[1] = new SqlParameter("@Contract_ID", Contract_ID);
        param[2] = new SqlParameter("@Site_ID", Site_ID);
        param[3] = new SqlParameter("@vdateFrom", Fromdate);
        param[4] = new SqlParameter("@vdateTo", Todate);

        DataAccessLayer da = new DataAccessLayer();
        return da.InsertValues(param, "UpdateMonthlyAttendanceOffline_DateRange");
    }

    public DataTable SetGridViewByValueEmpStatus(int Flag, string Value, int deptid, int site, int company)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@Flag", Flag);
        param[1] = new SqlParameter("@value", Value);
        param[2] = new SqlParameter("@dept", deptid);
        param[3] = new SqlParameter("@Site", site);
        param[4] = new SqlParameter("@Company", company);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "sp_empdetails1");
        return ds.Tables[0];
    }
    
 public DataTable BindEmployee(Int32 EmpId, string Oper, Int32 UserId)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@EmpId", EmpId);
        param[1] = new SqlParameter("@Oper", Oper);
        param[2] = new SqlParameter("@UserId", UserId); 
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "BindEmployee");
        return ds.Tables[0];
    }

 public DataTable MonthlyHours(int contract, int site, int deptid, int empid, string country, string month, int desgid, int cordid, string active, string year)
 {

     SqlParameter[] param = new SqlParameter[10];
     param[0] = new SqlParameter("@year", year);
     param[1] = new SqlParameter("@contractid", contract);
     param[2] = new SqlParameter("@siteid", site);
     param[3] = new SqlParameter("@dept", deptid);
     param[4] = new SqlParameter("@EmpId", empid);
     param[5] = new SqlParameter("@Country", country);
     param[6] = new SqlParameter("@month", month);
     param[7] = new SqlParameter("@DesgID", desgid);
     param[8] = new SqlParameter("@CordID", cordid);
     param[9] = new SqlParameter("@Active", active);

     DataAccessLayer da = new DataAccessLayer();
     DataSet ds = da.getDataByParam(param, "SP_MONTHLYWORKINGHOURSREPORT");
     return ds.Tables[0];
 }

 public DataTable Getlogo(int CompanyId)
 {
     SqlParameter[] param = new SqlParameter[1];
     param[0] = new SqlParameter("@ContractID", CompanyId);

     DataAccessLayer da = new DataAccessLayer();
     DataSet ds = da.getDataByParamUnis(param, "Sp_getlogo");
     return ds.Tables[0];
 }
 public DataTable MonthlyReport(string Fdate, string todate, int contract, int site, int deptid, int cordid, int empid, string procedure)
 {
     SqlParameter[] param = new SqlParameter[7];
     param[0] = new SqlParameter("@frmdate", Fdate);
     param[1] = new SqlParameter("@Todate", todate);
     param[2] = new SqlParameter("@contractid", contract);
     param[3] = new SqlParameter("@siteid", site);
     param[4] = new SqlParameter("@dept", deptid);
     param[5] = new SqlParameter("@cordid", cordid);
     param[6] = new SqlParameter("@EmpId", empid);
     DataAccessLayer da = new DataAccessLayer();
     DataSet ds = da.getDataByParam(param, procedure);
     return ds.Tables[0];
 }
 

 public DataTable GetDisplaypresentsVMS(string Fdate, string todate, int contract, int site, int deptid, int cordid, int empid)
 {
     SqlParameter[] param = new SqlParameter[7];
     param[0] = new SqlParameter("@frmdate", Fdate);
     param[1] = new SqlParameter("@Todate", todate);
     param[2] = new SqlParameter("@contractid", contract);
     param[3] = new SqlParameter("@siteid", site);
     param[4] = new SqlParameter("@dept", deptid);
     param[5] = new SqlParameter("@cordid", cordid);
     param[6] = new SqlParameter("@EmpId", empid);
     DataAccessLayer da = new DataAccessLayer();
     DataSet ds = da.getDataByParam(param, "Usp_displayempconsolidated_VMS");
     return ds.Tables[0];
 }

 public DataTable GetVMSReport(string Fdate, string todate, int contract, int site, int deptid, int cordid, int empid)
 {
     SqlParameter[] param = new SqlParameter[7];
     param[0] = new SqlParameter("@frmdate", Fdate);
     param[1] = new SqlParameter("@Todate", todate);
     param[2] = new SqlParameter("@contractid", contract);
     param[3] = new SqlParameter("@siteid", site);
     param[4] = new SqlParameter("@dept", deptid);
     param[5] = new SqlParameter("@cordid", cordid);
     param[6] = new SqlParameter("@EmpId", empid);
     DataAccessLayer da = new DataAccessLayer();
     DataSet ds = da.getDataByParamUnis(param, "Usp_Visitor_INOUTreport");
     return ds.Tables[0];
 }
 public DataTable getMissedentry(string Fdate, string todate, int contract, int site, int deptid, int cordid, int empid)
 {
     SqlParameter[] param = new SqlParameter[7];
     param[0] = new SqlParameter("@frmdate", Fdate);
     param[1] = new SqlParameter("@Todate", todate);
     param[2] = new SqlParameter("@contractid", contract);
     param[3] = new SqlParameter("@siteid", site);
     param[4] = new SqlParameter("@dept", deptid);
     param[5] = new SqlParameter("@cordid", cordid);
     param[6] = new SqlParameter("@EmpId", empid);
     DataAccessLayer da = new DataAccessLayer();
     DataSet ds = da.getDataByParam(param, "Sp_MissedEntryReport");
     return ds.Tables[0];
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

 public DataTable GetParameter(int CompanyId, int siteId, int deptId, int empId, string fromDate, string toDate, string fromMonth, string toMonth)
 {
     SqlParameter[] param = new SqlParameter[8];
     param[0] = new SqlParameter("@ContractID", CompanyId);
     param[1] = new SqlParameter("@siteID", siteId);
     param[2] = new SqlParameter("@deptID", deptId);
     param[3] = new SqlParameter("@employeeID", empId);
     param[4] = new SqlParameter("@Fromdate", fromDate);
     param[5] = new SqlParameter("@Todate", toDate);
     param[6] = new SqlParameter("@FromMonth", fromMonth);
     param[7] = new SqlParameter("@ToMonth", toMonth);
     DataAccessLayer da = new DataAccessLayer();
     DataSet ds = da.getDataByParam(param, "Sp_getParameters");
     return ds.Tables[0];
 }
 public DataTable SearchContractSite(string Name)
 {
     SqlParameter[] param = new SqlParameter[1];
     param[0] = new SqlParameter("@Name", Name);
     DataAccessLayer da = new DataAccessLayer();
     DataSet ds = da.getDataByParam(param, "SP_SearchContractSite");
     if (ds != null)
         return ds.Tables[0];
     else
         return null;
 }
}



