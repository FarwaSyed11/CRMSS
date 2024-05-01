using System;
using System.Data;
using System.Configuration;
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

public class ModuleAccess
{
	public ModuleAccess()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable GetModuleDetails(int Flag, int Id)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Flag", Flag);
        param[1] = new SqlParameter("@Id", Id);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamSecurity(param, "[GetModuleDetails]");
        return ds.Tables[0];
    }

    public DataTable GetAllocatedShiftDetails(int contractId, int siteId, int deptId, int employeeId, int opr)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@contractId", contractId);
        param[1] = new SqlParameter("@siteId", siteId);
        param[2] = new SqlParameter("@deptId", deptId);
        param[3] = new SqlParameter("@employeeId", employeeId);
        param[4] = new SqlParameter("@opr", opr);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.Execute(param, "[GetShiftDetails]");
        return ds.Tables[0];
    }

    public DataTable GetunAllocatedShiftDetails(int contractId, int siteId, int deptId, int employeeId,int opr)
    {
        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@contractId", contractId);
        param[1] = new SqlParameter("@siteId", siteId);
        param[2] = new SqlParameter("@deptId", deptId);
        param[3] = new SqlParameter("@employeeId", employeeId);
        param[4] = new SqlParameter("@opr", opr);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.Execute(param, "[GetunAllocatedShiftDetails]");
        return ds.Tables[0];
    }
    //public bool AssignShift(int contractId, int siteId, int deptId,int employeeId, int shiftId, string startDate)
    public DataTable AssignShift(int contractId, int siteId, int deptId, int employeeId, string shiftId, string DayOff, string startDate)
    {
        DataTable dt = new DataTable();
        try
        {

            SqlParameter[] param = new SqlParameter[7];
            //SqlParameter[] param = new SqlParameter[6];
            param[0] = new SqlParameter("@contractId", contractId);
            param[1] = new SqlParameter("@siteId", siteId);
            param[2] = new SqlParameter("@deptId", deptId);
            param[3] = new SqlParameter("@employeeId", employeeId);
            param[4] = new SqlParameter("@shiftId", shiftId);
            param[5] = new SqlParameter("@DayOff", DayOff);
            param[6] = new SqlParameter("@startDate", startDate);
            DataAccessLayer da = new DataAccessLayer();
            DataSet ds = da.Execute(param, "[Sp_AssignShift]");
            dt = ds.Tables[0];
            return dt;
        }
        catch (Exception ex)
        {

        }
        return dt;
    }

    //public bool RemoveShift(string mapId)
    public bool RemoveShift(int mapId, string endDate)
    {
        try
        {
            //SqlParameter[] param = new SqlParameter[1];
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@mapId", mapId);
            param[1] = new SqlParameter("@endDate", endDate);
            DataAccessLayer da = new DataAccessLayer();
            DataSet ds = da.Execute(param, "[Sp_RemoveShift]");
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }

    }
    public DataTable GetShortLeaveMaster()
    {
        DataTable dt = new DataTable();
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.executeSP("Sp_getShortLeaveMaster");
        dt = ds.Tables[0];
        return dt;
    }
    public bool addShortLeaveEntry(int LeaveType, string PastDay, string CurrentDay, string Future, string Punch, string SameDate, string Hour)
    {
        try
        {
            SqlParameter[] param = new SqlParameter[7];
            param[0] = new SqlParameter("@LeaveTypeId", LeaveType);
            param[1] = new SqlParameter("@PastDay", PastDay);
            param[2] = new SqlParameter("@CurrentDay", CurrentDay);
            param[3] = new SqlParameter("@Future", Future);
            param[4] = new SqlParameter("@Punch", Punch);
            param[5] = new SqlParameter("@SameDate", SameDate);
            param[6] = new SqlParameter("@Hour", Hour);
            DataAccessLayer da = new DataAccessLayer();
            DataSet ds = da.Execute(param, "[Sp_addShortLeaveMaster]");
            if (ds.Tables.Count > 0)
                return true;
            else
                return false;
        }
        catch (Exception ex)
        {
            return false;
        }

    }

    public void RemoveShortleaveEntry(int shortLeaveId)
    {
        try
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@shortLeaveId", shortLeaveId);
            DataAccessLayer da = new DataAccessLayer();
            DataSet ds = da.Execute(param, "[Sp_RemoveShortLeaveMaster]");

        }
        catch (Exception ex)
        {

        }

    }
    public DataSet getShortLeaveEntry(int id)
    {

        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Id", id);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.Execute(param, "[Sp_getShortLeaveEntry]");
        return ds;
    }
    //public bool RemoveShift(int contractId, int siteId, int deptId, string shiftId, string endDate)
    //{
    //    try
    //    {
    //        SqlParameter[] param = new SqlParameter[5];
    //        param[0] = new SqlParameter("@contractId", contractId);
    //        param[1] = new SqlParameter("@siteId", siteId);
    //        param[2] = new SqlParameter("@deptId", deptId);
    //        param[3] = new SqlParameter("@shiftId", shiftId);
    //        param[4] = new SqlParameter("@endDate", endDate);
    //        DataAccessLayer da = new DataAccessLayer();
    //        DataSet ds = da.Execute(param, "[Sp_RemoveShift]");
    //        return true;
    //    }
    //    catch (Exception ex)
    //    {
    //        return false;
    //    }

    //}
    public void sendMail(string mailId, int approverId, int Priority, string ApproverEmpId, int leaveId, string basePath)
    {

        SqlParameter[] param = new SqlParameter[6];
        param[0] = new SqlParameter("@mailId", mailId);
        param[1] = new SqlParameter("@approverId", approverId);
        param[2] = new SqlParameter("@Priority", Priority);
        param[3] = new SqlParameter("@ApproverEmpId", ApproverEmpId);
        param[4] = new SqlParameter("@LeaveId", leaveId);
        param[5] = new SqlParameter("@basePath", basePath);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.Execute(param, "[Sp_sendMail]");

    }

    public DataTable getShift(string date, int contract_Id, int SiteID, int DeptId)
    {

        //SqlParameter[] param = new SqlParameter[6];
        //param[0] = new SqlParameter("@mailId", mailId);
        //param[1] = new SqlParameter("@approverId", approverId);
        //param[2] = new SqlParameter("@Priority", Priority);
        //param[3] = new SqlParameter("@ApproverEmpId", ApproverEmpId);
        //param[4] = new SqlParameter("@LeaveId", leaveId);
        //param[5] = new SqlParameter("@basePath", basePath);
        DataTable dt;
        DataAccessLayer da = new DataAccessLayer();
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@Date", date);
        param[1] = new SqlParameter("@ContractId", contract_Id);
        param[2] = new SqlParameter("@siteId", SiteID);
        param[3] = new SqlParameter("@DeptId", DeptId);
        DataSet ds = da.Execute(param, "sp_shiftviewDynamic1");
        dt = ds.Tables[0];
        return dt;

    }

    public DataTable getMonthlyReport(int empid, int company, int site, int department, int fromMonth, int toMonth, int yearstart,int yearend)
    {

        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@empid", empid);
        param[1] = new SqlParameter("@company", company);
        param[2] = new SqlParameter("@site", site);
        param[3] = new SqlParameter("@department", department);
        param[4] = new SqlParameter("@fromMonth", fromMonth);
        param[5] = new SqlParameter("@toMonth", toMonth);
        param[6] = new SqlParameter("@year_start", yearstart);
        param[7] = new SqlParameter("@year_end", yearend);
        DataTable dt;
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.Execute(param, "SP_getMontlyReport");
        if (ds.Tables.Count > 0)
            dt = ds.Tables[0];
        else
            dt = null;
        return dt;

    }
    public DataTable get_OverTimeReport(string FromMonth, string ToMonth, int EmpId, int Compile_id, int OTime, string Remarks, int Opr)
    {
        DataTable dt;
        dt = new DataTable();
        dt = null;
        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@FromMonth", FromMonth);
        param[1] = new SqlParameter("@ToMonth", ToMonth);
        param[2] = new SqlParameter("@EmpId", EmpId);
        param[3] = new SqlParameter("@Compile_id", Compile_id);
        param[4] = new SqlParameter("@OverTime", OTime);
        param[5] = new SqlParameter("@Remarks", Remarks);
        param[6] = new SqlParameter("@Opr", Opr);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.Execute(param, "sp_getOverTime");
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
                dt = ds.Tables[0];
            else
                dt = null;
        }
        return dt;

    }
    public DataTable get_OverTimeMaster(int company, int site, int department, int OThh, int OTmm, int Opr, int OT_id, string fromMonth)
    {
        DataTable dt;
        dt = new DataTable();
        dt = null;
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@company", company);
        param[1] = new SqlParameter("@site", site);
        param[2] = new SqlParameter("@department", department);
        param[3] = new SqlParameter("@OThh", OThh);
        param[4] = new SqlParameter("@OTmm", OTmm);
        param[5] = new SqlParameter("@Opr", Opr);
        param[6] = new SqlParameter("@OT_id", OT_id);
        param[7] = new SqlParameter("@fromMonth", fromMonth);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.Execute(param, "sp_getOverTimeMaster");
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
                dt = ds.Tables[0];
            else
                dt = null;
        }
        return dt;

    }
    public DataTable addContractSite(int contractid, int siteid, int opr)
    {
        DataTable dt;
        dt = new DataTable();
        dt = null;
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@contractid", contractid);
        param[1] = new SqlParameter("@siteid", siteid);
        param[2] = new SqlParameter("@opr", opr);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.Execute(param, "sp_addContractSite");
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
                dt = ds.Tables[0];
            else
                dt = null;
        }
        return dt;

    }
    public DataTable UpdateWorkLoadmaster(int WID, int companyId, int siteId, int deptId, int Payroll_Month, int Payroll_Year, int DailyHr, int WeelyHr, int MonthlyHr, string remarks, int opr)
    {
        DataTable dt = new DataTable();
        SqlParameter[] param = new SqlParameter[11];
        param[0] = new SqlParameter("@WID", WID);
        param[1] = new SqlParameter("@PAYROLL_MONTH", Payroll_Month);
        param[2] = new SqlParameter("@PAYROLL_YEAR", Payroll_Year);
        param[3] = new SqlParameter("@DAILY_HOURS", DailyHr);
        param[4] = new SqlParameter("@WEEKLY_HOURS", WeelyHr);
        param[5] = new SqlParameter("@MONTHLY_HOURS", MonthlyHr);
        param[6] = new SqlParameter("@REMARKS", remarks);
        param[7] = new SqlParameter("@opr", opr);
        param[8] = new SqlParameter("@ContractId", companyId);
        param[9] = new SqlParameter("@SiteId", siteId);
        param[10] = new SqlParameter("@DeptId", deptId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.Execute(param, "sp_UpdateTBL_WORKLOAD");
        if (ds != null)
            dt = ds.Tables[0];
        else
            dt = null;
        return dt;

    }
    public DataTable InsertWorkLoadmaster(int companyId, int siteId, int deptId, int Payroll_Month, int Payroll_Year, int DailyHr, int WeelyHr, int MonthlyHr, string REMARKS)
    {
        SqlParameter[] param = new SqlParameter[9];
        param[0] = new SqlParameter("@PAYROLL_MONTH", Payroll_Month);
        param[1] = new SqlParameter("@PAYROLL_YEAR", Payroll_Year);
        param[2] = new SqlParameter("@DAILY_HOURS", DailyHr);
        param[3] = new SqlParameter("@WEEKLY_HOURS", WeelyHr);
        param[4] = new SqlParameter("@MONTHLY_HOURS", MonthlyHr);
        param[5] = new SqlParameter("@REMARKS", REMARKS);
        param[6] = new SqlParameter("@ContractId", companyId);
        param[7] = new SqlParameter("@SiteId", siteId);
        param[8] = new SqlParameter("@DeptId", deptId);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.Execute(param, "sp_insertintoTBL_WORKLOAD");
        DataTable dt = new DataTable();
        if (ds != null)
            dt = ds.Tables[0];
        else
            dt = null;
        return dt;
    }
    public DataTable SearchLoadWorkRecord(int contractid)
    {

        DataAccessLayer da = new DataAccessLayer();
        DataTable dt = new DataTable();
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@contractid", contractid);
        DataSet ds = da.Execute(param, "GetWork_LoadData");
        if (ds != null)
            dt = ds.Tables[0];
        else
            dt = null;
        return dt;
    }
    public DataTable deleteSite(int siteId)
    {
        DataAccessLayer da = new DataAccessLayer();
        DataTable dt = new DataTable();
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@siteId", siteId);
        DataSet ds = da.Execute(param, "Sp_DeleteSite");
        if (ds != null)
            dt = ds.Tables[0];
        else
            dt = null;
        return dt;
    }
    public DataTable SwapShift(int emp, int emp1, string from, string to, string emps, int opr)
    {
        DataAccessLayer da = new DataAccessLayer();
        DataTable dt = new DataTable();
        SqlParameter[] param = new SqlParameter[6];
        param[0] = new SqlParameter("@emp", emp);
        param[1] = new SqlParameter("@emp1", emp1);
        param[2] = new SqlParameter("@from", from);
        param[3] = new SqlParameter("@to", to);
        param[4] = new SqlParameter("@emps", emps);
        param[5] = new SqlParameter("@opr", opr);
        DataSet ds = da.Execute(param, "SP_Shift_opr");
        if (ds != null)
            dt = ds.Tables[0];
        else
            dt = null;
        return dt;
    }
    public void send_Leave_Mail(string mailId, int approverId, int Priority, string ApproverEmpId, int leaveId, string basePath)
    {

        SqlParameter[] param = new SqlParameter[6];
        param[0] = new SqlParameter("@mailId", mailId);
        param[1] = new SqlParameter("@approverId", approverId);
        param[2] = new SqlParameter("@Priority", Priority);
        param[3] = new SqlParameter("@ApproverEmpId", ApproverEmpId);
        param[4] = new SqlParameter("@LeaveId", leaveId);
        param[5] = new SqlParameter("@basePath", basePath);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.Execute(param, "[Sp_send_Leave_Mail]");

    }
    public void send_OverTime_Mail(string mailId, int approverId, int Priority, string ApproverEmpId, int leaveId, string basePath)
    {

        SqlParameter[] param = new SqlParameter[6];
        param[0] = new SqlParameter("@mailId", mailId);
        param[1] = new SqlParameter("@approverId", approverId);
        param[2] = new SqlParameter("@Priority", Priority);
        param[3] = new SqlParameter("@ApproverEmpId", ApproverEmpId);
        param[4] = new SqlParameter("@LeaveId", leaveId);
        param[5] = new SqlParameter("@basePath", basePath);

        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.Execute(param, "[Sp_send_OverTime_Mail]");

    }

}