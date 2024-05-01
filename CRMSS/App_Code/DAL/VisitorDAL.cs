using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net.NetworkInformation;

/// <summary>
/// Summary description for VisitorDAL
/// </summary>
public class VisitorDAL
{
   
	public VisitorDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataTable VisitorOpr(Visitor v,int opr)
    {
        SqlParameter[] param = new SqlParameter[28];
        param[0] = new SqlParameter("@L_UID", v.l_UID);
        param[1] = new SqlParameter("@C_Office", v.c_Office);
        param[2] = new SqlParameter("@C_Post", v.c_Post);
        param[3] = new SqlParameter("@C_Target", v.c_Target);
        param[4] = new SqlParameter("@C_Goal", v.c_Goal);
        param[5] = new SqlParameter("@C_Company", v.c_Company);
        param[6] = new SqlParameter("@C_Info", v.c_Info);
        param[7] = new SqlParameter("@C_Phone", v.c_Phone);
        param[8] = new SqlParameter("@C_Email", v.c_Email);
        param[9] = new SqlParameter("@C_Address", v.c_Address);
        param[10] = new SqlParameter("@C_Remark", v.c_Remark);
        param[11] = new SqlParameter("@opr", opr);
        param[12] = new SqlParameter("@C_SocialNo", v.c_SocialNo);
        param[13] = new SqlParameter("@C_regDate", v.c_regDate);
        param[14] = new SqlParameter("@C_DeallocateDate", v.c_DeallocateDate);
        param[15] = new SqlParameter("@C_location", v.c_location);
        param[16] = new SqlParameter("@C_VisitorType", v.c_VisitorType);
        param[17] = new SqlParameter("@C_VisitingCompany", v.c_VisitingCompany);
        param[18] = new SqlParameter("@C_VisitingBranch", v.c_VisitingBranch);
        param[19] = new SqlParameter("@C_VisitingDept", v.c_VisitingDept);
        param[20] = new SqlParameter("@C_Host", v.c_Host);
        param[21] = new SqlParameter("@C_purposeOfvisit", v.c_purposeOfvisit);
        param[22] = new SqlParameter("@C_AccessGroup", v.c_AccessGroup);
        param[23] = new SqlParameter("@C_CardNo", v.c_CardNo);
        param[24] = new SqlParameter("@C_Name", v.c_Name);
        param[25] = new SqlParameter("@C_UserPic", v.c_UserPic);
        param[26] = new SqlParameter("@FromDate", v.fromDate);
        param[27] = new SqlParameter("@ToDate", v.toDate);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "Sp_Visitor");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;

    }
    public DataTable UserOpr(User u, int opr)
    {
        SqlParameter[] param = new SqlParameter[14];
        param[0] = new SqlParameter("@L_ID", u.VL_ID);
        param[1] = new SqlParameter("@C_Name  ", u.VC_Name);
        param[2] = new SqlParameter("@L_Type", u.VL_Type);
        param[3] = new SqlParameter("@C_RegDate", u.VC_RegDate);
        param[4] = new SqlParameter("@L_OptDateLimit", u.VL_OptDateLimit);
        param[5] = new SqlParameter("@C_DateLimit", u.VC_DateLimit);
        param[6] = new SqlParameter("@L_Identify", u.VL_Identify);
        param[7] = new SqlParameter("@C_AccessGroup", u.VC_AccessGroup);
        param[8] = new SqlParameter("@C_PassbackStatus", u.VC_PassbackStatus);
        param[9] = new SqlParameter("@C_UserMessage", u.VC_UserMessage);
        param[10] = new SqlParameter("@C_PassbackTime", u.VC_PassbackTime);
        param[11] = new SqlParameter("@L_ExceptPassback", u.VL_ExceptPassback);
        param[12] = new SqlParameter("@L_AuthValue", u.VL_AuthValue);
        param[13] = new SqlParameter("@opr", opr);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "Sp_User");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public DataTable CardOpr(iUserCard c, int opr)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@C_CardNum",c.c_CardNum);
        param[1] = new SqlParameter("@L_UID  ", c.l_UID);
        param[2] = new SqlParameter("@L_DataCheck", c.l_DataCheck);
        param[3] = new SqlParameter("@opr", opr);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "Sp_iUserCard");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }
    public Int32 getMaxIdentity()
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@opr", 2);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "Sp_User");
        if (ds != null)
            return int.Parse(ds.Tables[0].Rows[0][0].ToString());
        else
            return 0;
    }

    public DataTable getAccessGroup()
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@opr", 3);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "Sp_Visitor");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }

    public DataTable getVisitorType()
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@opr", 4);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "Sp_Visitor");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }

    public DataTable getCard()
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@opr", 6);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "Sp_Visitor");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }

    public DataTable getUser()
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@opr", 5);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "Sp_Visitor");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }

    public DataTable VisitorDeleteOpr(Visitor v, int opr)
    {
        SqlParameter[] param = new SqlParameter[12];
        param[0] = new SqlParameter("@L_UID", v.l_UID);
        param[1] = new SqlParameter("@C_Office", v.c_Office);
        param[2] = new SqlParameter("@C_Post", v.c_Post);
        param[3] = new SqlParameter("@C_Target", v.c_Target);
        param[4] = new SqlParameter("@C_Goal", v.c_Goal);
        param[5] = new SqlParameter("@C_Company", v.c_Company);
        param[6] = new SqlParameter("@C_Info", v.c_Info);
        param[7] = new SqlParameter("@C_Phone", v.c_Phone);
        param[8] = new SqlParameter("@C_Email", v.c_Email);
        param[9] = new SqlParameter("@C_Address", v.c_Address);
        param[10] = new SqlParameter("@C_Remark", v.c_Remark);
        param[11] = new SqlParameter("@opr", opr);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "Sp_DeleteVisitor");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;

    }
}