using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Visitor
/// </summary>
public class Visitor
{
	public Visitor()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private int L_UID = 0;

    public int l_UID
    {
        get { return L_UID; }
        set { L_UID = value; }
    }
    private string C_Office = "";

    public string c_Office
    {
        get { return C_Office; }
        set { C_Office = value; }
    }
    private string C_Post = "";

    public string c_Post
    {
        get { return C_Post; }
        set { C_Post = value; }
    }
    private string C_Target = "";

    public string c_Target
    {
        get { return C_Target; }
        set { C_Target = value; }
    }
    private string C_Goal = "";

    public string c_Goal
    {
        get { return C_Goal; }
        set { C_Goal = value; }
    }
    private string C_Company = "";

    public string c_Company
    {
        get { return C_Company; }
        set { C_Company = value; }
    }
    private string C_Info = "";

    public string c_Info
    {
        get { return C_Info; }
        set { C_Info = value; }
    }
    private string C_Phone = "";

    public string c_Phone
    {
        get { return C_Phone; }
        set { C_Phone = value; }
    }
    private string C_Email = "";

    public string c_Email
    {
        get { return C_Email; }
        set { C_Email = value; }
    }
    private string C_Address = "";

    public string c_Address
    {
        get { return C_Address; }
        set { C_Address = value; }
    }
    private string C_Remark = "";

    public string c_Remark
    {
        get { return C_Remark; }
        set { C_Remark = value; }
    }

    private string C_SocialNo = "";

    public string c_SocialNo
    {
        get { return C_SocialNo; }
        set { C_SocialNo = value; }
    }
    private string C_regDate = "";

    public string c_regDate
    {
        get { return C_regDate; }
        set { C_regDate = value; }
    }
    private string C_DeallocateDate = "";
    public string c_DeallocateDate
    {
        get { return C_DeallocateDate; }
        set { C_DeallocateDate = value; }
    }
    private string C_location = "";
    public string c_location
    {
        get { return C_location; }
        set { C_location = value; }
    }
    private string C_VisitorType = "";
    public string c_VisitorType
    {
        get { return C_VisitorType; }
        set { C_VisitorType = value; }
    }
    private string C_VisitingCompany = "";
    public string c_VisitingCompany
    {
        get { return C_VisitingCompany; }
        set { C_VisitingCompany = value; }
    }
    private string C_VisitingBranch = "";
    public string c_VisitingBranch
    {
        get { return C_VisitingBranch; }
        set { C_VisitingBranch = value; }
    }
    private string C_VisitingDept = "";
    public string c_VisitingDept
    {
        get { return C_VisitingDept; }
        set { C_VisitingDept = value; }
    }
    private string C_Host = "";
    public string c_Host
    {
        get { return C_Host; }
        set { C_Host = value; }
    }
    private string C_purposeOfvisit = "";
    public string c_purposeOfvisit
    {
        get { return C_purposeOfvisit; }
        set { C_purposeOfvisit = value; }
    }
    private string C_AccessGroup = "";
    public string c_AccessGroup
    {
        get { return C_AccessGroup; }
        set { C_AccessGroup = value; }
    }
    private string C_CardNo = "";
    public string c_CardNo
    {
        get { return C_CardNo; }
        set { C_CardNo = value; }
    }
    private string C_Name= "";
    public string c_Name
    {
        get { return C_Name; }
        set { C_Name = value; }
    }

    private Byte[] C_UserPic=null;
    public Byte[] c_UserPic
    {
        get { return C_UserPic; }
        set { C_UserPic = value; }
    }

    private string FromDate;
    public string fromDate
    {
        get { return FromDate; }
        set { FromDate = value; }
    }

    private string ToDate;
    public string toDate
    {
        get { return ToDate; }
        set { ToDate = value; }
    }
}