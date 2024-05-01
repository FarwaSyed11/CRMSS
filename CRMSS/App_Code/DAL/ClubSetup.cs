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
using System.Configuration;
using System.Data;
/// <summary>
/// Summary description for ClubSetup
/// </summary>
public class ClubSetup
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SecurityCon"].ToString());
	public ClubSetup()
	{
	}
    public string InsertAdmin(string Year, string Club, int NoOfBoys, int NoOfGirls)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertAdmin]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@Club", Club);
            cmd.Parameters.AddWithValue("@NoOfBoys", NoOfBoys);
            cmd.Parameters.AddWithValue("@NoOfGirls", NoOfGirls);

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
    public string updateAdmin(int Id, string Year, string Club, int NoOfBoys, int NoOfGirls)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdateAdmin]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", Id);
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@Club", Club);
            cmd.Parameters.AddWithValue("@NoOfBoys", NoOfBoys);
            cmd.Parameters.AddWithValue("@NoOfGirls", NoOfGirls);

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
    public string DeleteAdmin(int Id,int Flag)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[DeleteTable]", conn);
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
 public string DeleteAdminNew(int Id, int Flag)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[DeleteTableNew]", conn);
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

    public string InsertDesignation(string Year, string Club, string Designation, string EmployeeName, string Email)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertClubDesegnition]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@Club", Club);
            cmd.Parameters.AddWithValue("@Designation", Designation);
            cmd.Parameters.AddWithValue("@EmployeeName", EmployeeName);
            cmd.Parameters.AddWithValue("@Email", Email);
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
    public string updateClubDesegnition(int Id, string Year, string Club, string Designation, string EmployeeName, string Email)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdateClubDesegnition]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", Id);
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@Club", Club);
            cmd.Parameters.AddWithValue("@Designation", Designation);
            cmd.Parameters.AddWithValue("@EmployeeName", EmployeeName);
            cmd.Parameters.AddWithValue("@Email", Email);
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
    public string UpdateClassAllocationToClub(int Id, string Year, string Club, string Class)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdateClassAllocationToClub]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", Id);
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@Club", Club);
            cmd.Parameters.AddWithValue("@Class", Class);

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
    public string InsertGroupForClub(string Year, string Club, string GroupName)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertGroupForClub]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@Club", Club);
            cmd.Parameters.AddWithValue("@GroupName", GroupName);
            
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
    public string updateGroupForClub(int Id, string Year, string Club, string GroupName)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdateGroupForClub]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", Id);
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@Club", Club);
            cmd.Parameters.AddWithValue("@GroupName", GroupName);

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
    public string InsertClubIncharge(string Club, string Year, string Designation, string EmployeeName, string Email)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertClubIncharge]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@Club", Club);
            cmd.Parameters.AddWithValue("@Designation", Designation);
            cmd.Parameters.AddWithValue("@EmployeeName", EmployeeName);
            cmd.Parameters.AddWithValue("@Email", Email);

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
    public string UpdateClubIncharge(int Id, string Year, string Club, string Designation, string EmployeeName, string Email)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[UpdateClubIncharge]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", Id);
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@Club", Club);
            cmd.Parameters.AddWithValue("@Designation", Designation);
            cmd.Parameters.AddWithValue("@EmployeeName", EmployeeName);
            cmd.Parameters.AddWithValue("@Email", Email);

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
    public string InsertLetterForClubSelection(string editer)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertLetterForClubSelection]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@editer", editer);
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
    public string InsertLetterToMemberOfAllClub(string Date ,string Letter)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertLetterToMemberOfAllClub]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Date", Date);
            cmd.Parameters.AddWithValue("@Letter", Letter);

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
    public string InsertClassAllocationToClub(string Club, string Year, string Class)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertClassAllocationToClub]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@Club", Club);
            cmd.Parameters.AddWithValue("@Class", Class);
         
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
    public string InsertPrincipalEmailID(string Year, string EmailID)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertPrincipalEmailID]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@EmailID", EmailID);
          
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
    public string InsertGroup(string Year, string GroupName)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("[InsertGroup]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@GroupName", GroupName);

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
    public string InsertClubStudentForm(string Year, string SNo, string Name, string ClassSection, string Gender)
    {
        try
        {
            conn.Open();
             SqlCommand cmd = new SqlCommand("[InsertClubStudentForm]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@SNo", SNo);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@ClassSection", ClassSection);
            cmd.Parameters.AddWithValue("@Gender", Gender);
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
    public string InsertClubDetails(string StudentId, string Gender, string Name, string Class, string Section, string Club)
    {
        SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["conDPS"].ToString());
        try
        {
            conn1.Open();
            SqlCommand cmd = new SqlCommand("[InsertClubDetails]", conn1);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StudentId", StudentId);
            cmd.Parameters.AddWithValue("@Gender", Gender);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@Class", Class);
            cmd.Parameters.AddWithValue("@Section", Section);
            cmd.Parameters.AddWithValue("@Club", Club);
            using (conn1)
                cmd.ExecuteNonQuery();
            conn1.Close();
            conn1.Dispose();
            return "Result";
        }
        catch
        {
            conn1.Close();
            conn1.Dispose();
            return "Error";
        }
    }
    public DataTable CountByClub(string Club, string Gender)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Club", Club);
        param[1] = new SqlParameter("@Gender", Gender);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[ProcCountByClub]");
        return ds.Tables[0];
    }
    public DataSet GetClubNotAllocatedList()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("[GetClubNotAllocatedList]");
        return ds;
    }
    public DataSet GetClubAllocatedList()
    {
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam("[GetClubAllocatedList]");
        return ds;
    }
}