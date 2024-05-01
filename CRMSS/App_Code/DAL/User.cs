using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
	public User()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    
    private int vL_ID = 0;

    public int VL_ID
    {
        get { return vL_ID; }
        set { vL_ID = value; }
    }
    private string vC_Name = "";

    public string VC_Name
    {
        get { return vC_Name; }
        set { vC_Name = value; }
    }
    private string vC_Unique = "";

    public string VC_Unique
    {
        get { return vC_Unique; }
        set { vC_Unique = value; }
    }
    private int vL_Type = 0;

    public int VL_Type
    {
        get { return vL_Type; }
        set { vL_Type = value; }
    }
    private string vC_RegDate = "";

    public string VC_RegDate
    {
        get { return vC_RegDate; }
        set { vC_RegDate = value; }
    }
    private string vL_OptDateLimit = "";

    public string VL_OptDateLimit
    {
        get { return vL_OptDateLimit; }
        set { vL_OptDateLimit = value; }
    }
    private string vC_DateLimit = "";

    public string VC_DateLimit
    {
        get { return vC_DateLimit; }
        set { vC_DateLimit = value; }
    }
    private string vL_AccessType = "";

    public string VL_AccessType
    {
        get { return vL_AccessType; }
        set { vL_AccessType = value; }
    }
    private string vC_Password = "";

    public string VC_Password
    {
        get { return vC_Password; }
        set { vC_Password = value; }
    }
    private int vL_Identify = 0;

    public int VL_Identify
    {
        get { return vL_Identify; }
        set { vL_Identify = value; }
    }
    private string vL_VerifyLevel = "";

    public string VL_VerifyLevel
    {
        get { return vL_VerifyLevel; }
        set { vL_VerifyLevel = value; }
    }
    private string vC_AccessGroup = "";

    public string VC_AccessGroup
    {
        get { return vC_AccessGroup; }
        set { vC_AccessGroup = value; }
    }
    private string vC_PassbackStatus = "";

    public string VC_PassbackStatus
    {
        get { return vC_PassbackStatus; }
        set { vC_PassbackStatus = value; }
    }
    private string vC_UserMessage = "";

    public string VC_UserMessage
    {
        get { return vC_UserMessage; }
        set { vC_UserMessage = value; }
    }
    private string vL_Blacklist = "";

    public string VL_Blacklist
    {
        get { return vL_Blacklist; }
        set { vL_Blacklist = value; }
    }
    private string vL_IsNotice = "";

    public string VL_IsNotice
    {
        get { return vL_IsNotice; }
        set { vL_IsNotice = value; }
    }
    private string vC_Notice = "";

    public string VC_Notice
    {
        get { return vC_Notice; }
        set { vC_Notice = value; }
    }
    private string vC_PassbackTime = "";

    public string VC_PassbackTime
    {
        get { return vC_PassbackTime; }
        set { vC_PassbackTime = value; }
    }
    private string vL_ExceptPassback = "";

    public string VL_ExceptPassback
    {
        get { return vL_ExceptPassback; }
        set { vL_ExceptPassback = value; }
    }
    private string vC_RemotePW = "";

    public string VC_RemotePW
    {
        get { return vC_RemotePW; }
        set { vC_RemotePW = value; }
    }
    private string vL_WrongCount = "";

    public string VL_WrongCount
    {
        get { return vL_WrongCount; }
        set { vL_WrongCount = value; }
    }
    private string vL_LogonLocked = "";

    public string VL_LogonLocked
    {
        get { return vL_LogonLocked; }
        set { vL_LogonLocked = value; }
    }
    private string vC_LogonDateTime = "";

    public string VC_LogonDateTime
    {
        get { return vC_LogonDateTime; }
        set { vC_LogonDateTime = value; }
    }
    private string vC_UdatePassword = "";

    public string VC_UdatePassword
    {
        get { return vC_UdatePassword; }
        set { vC_UdatePassword = value; }
    }
    private string vC_MustChgPwd = "";

    public string VC_MustChgPwd
    {
        get { return vC_MustChgPwd; }
        set { vC_MustChgPwd = value; }
    }
    private string vL_VOIPUsed = "";

    public string VL_VOIPUsed
    {
        get { return vL_VOIPUsed; }
        set { vL_VOIPUsed = value; }
    }
    private string vL_DoorOpen = "";

    public string VL_DoorOpen
    {
        get { return vL_DoorOpen; }
        set { vL_DoorOpen = value; }
    }
    private string vL_AutoAnswer = "";

    public string VL_AutoAnswer
    {
        get { return vL_AutoAnswer; }
        set { vL_AutoAnswer = value; }
    }
    private string vL_EnableMeta1 = "";

    public string VL_EnableMeta1
    {
        get { return vL_EnableMeta1; }
        set { vL_EnableMeta1 = value; }
    }
    private string vL_RingCount1 = "";

    public string VL_RingCount1
    {
        get { return vL_RingCount1; }
        set { vL_RingCount1 = value; }
    }
    private string vC_LoginID1 = "";

    public string VC_LoginID1
    {
        get { return vC_LoginID1; }
        set { vC_LoginID1 = value; }
    }
    private string vC_SipAddr1 = "";

    public string VC_SipAddr1
    {
        get { return vC_SipAddr1; }
        set { vC_SipAddr1 = value; }
    }
    private string vL_EnableMeta2 = "";

    public string VL_EnableMeta2
    {
        get { return vL_EnableMeta2; }
        set { vL_EnableMeta2 = value; }
    }
    private string vL_RingCount2 = "";

    public string VL_RingCount2
    {
        get { return vL_RingCount2; }
        set { vL_RingCount2 = value; }
    }
    private string vC_LoginID2 = "";

    public string VC_LoginID2
    {
        get { return vC_LoginID2; }
        set { vC_LoginID2 = value; }
    }
    private string vC_SipAddr2 = "";

    public string VC_SipAddr2
    {
        get { return vC_SipAddr2; }
        set { vC_SipAddr2 = value; }
    }
      private string vL_DataCheck = "";

      public string L_DataCheck
      {
          get { return vL_DataCheck; }
          set { vL_DataCheck = value; }
      }
      private string vL_Partition = "";

      public string VL_Partition
      {
          get { return vL_Partition; }
          set { vL_Partition = value; }
      }
      private string vL_FacreIdentify = "";

      public string VL_FacreIdentify
      {
          get { return vL_FacreIdentify; }
          set { vL_FacreIdentify = value; }
      }
      private string vB_DuressFinger = "";

      public string VB_DuressFinger
      {
          get { return vB_DuressFinger; }
          set { vB_DuressFinger = value; }
      }
      private string vL_AuthValue = "";

      public string VL_AuthValue
      {
          get { return vL_AuthValue; }
          set { vL_AuthValue = value; }
      }
      
    

}