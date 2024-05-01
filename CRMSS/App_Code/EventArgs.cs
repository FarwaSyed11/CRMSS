using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using DPGModel;

/// <summary>
/// Summary description for EventArgs
/// </summary>
public class ContractEventArgs : EventArgs
{
    private bool isSuccess = false;
    public bool IsSuccess
    {
        get { return isSuccess; }
        set { isSuccess = value; }
    }
    public ContractEventArgs(bool success)
    {
        isSuccess = success;
    }
}
public class SavedResArgs : EventArgs
{

    private int tot_Resc = 0;
    public int TotalResources
    {
        get { return tot_Resc; }
        set { tot_Resc = value; }
    }
    public SavedResArgs(int Resc)
    {
        tot_Resc = Resc;

    }
}
public class SearchEventArgs : EventArgs
{
    private List<Tb_ContractsMaster> clist = new List<Tb_ContractsMaster>();
    public List<Tb_ContractsMaster> Clist
    {
        get { return clist; }
        set { clist = value; }
    }
    private int contract_id = 0;
    public int ContractID
    {
        get { return contract_id; }
        set { contract_id = value; }
    }
    public SearchEventArgs(int Id, List<Tb_ContractsMaster> list)
    {
        contract_id = Id;
        clist = list;
    }
}
public class ErrorEventArgs : EventArgs
{
    private string errordate = "";
    public String ErrorDate
    {
        get { return errordate; }
        set { errordate = value; }
    }
    private Int32 contract_id = 0;
    public Int32 Contract_ID
    {
        get { return contract_id; }
        set { contract_id = value; }
    }
    private Int32 site_id = 0;
    public Int32 Site_ID
    {
        get { return site_id; }
        set { site_id = value; }
    }
    public ErrorEventArgs(string date,Int32 contract,Int32 site)
    {
        errordate = date;
        contract_id = contract;
        site_id = site;
    }
}
public class SearchCustEventArgs : EventArgs
{
    private List<Tb_CustomerMaster> clist = new List<Tb_CustomerMaster>();
    public List<Tb_CustomerMaster> Clist
    {
        get { return clist; }
        set { clist = value; }
    }
    private int cust_id = 0;
    public int CustomerID
    {
        get { return cust_id; }
        set { cust_id = value; }
    }
    public SearchCustEventArgs(int Id, List<Tb_CustomerMaster> list)
    {
        cust_id = Id;
        clist = list;
    }
}
public class SearchSiteEventArgs : EventArgs
{
    private List<Tb_SiteMaster> clist = new List<Tb_SiteMaster>();
    public List<Tb_SiteMaster> Clist
    {
        get { return clist; }
        set { clist = value; }
    }
    private int Site_id = 0;
    public int SiteId
    {
        get { return Site_id; }
        set { Site_id = value; }
    }
    public SearchSiteEventArgs(int Id, List<Tb_SiteMaster> list)
    {
        Site_id = Id;
        clist = list;
    }
}
public class SearchOrgEventArgs : EventArgs
{
    private DataTable orgList = new DataTable();
    public DataTable OrgList
    {
        get { return orgList; }
        set { orgList = value; }
    }
    private int orgId = 0;
    public int OrgID
    {
        get { return orgId; }
        set { orgId = value; }
    }
    public SearchOrgEventArgs(int Id, DataTable list)
    {
        orgId = Id;
        orgList = list;
    }
}
public class PreviewEventArgs : EventArgs
{
    private List<Tb_ContractsMaster> clist = new List<Tb_ContractsMaster>();
    public List<Tb_ContractsMaster> Clist
    {
        get { return clist; }
        set { clist = value; }
    }
    private int contract_id = 0;
    public int ContractID
    {
        get { return contract_id; }
        set { contract_id = value; }
    }
    private int site_id = 0;
    public int SiteID
    {
        get { return site_id; }
        set { site_id = value; }
    }
    private string hash = "";
    public string PageHash
    {
        get { return hash; }
        set { hash = value; }
    }
    private string start = "";
    public string StartDate
    {
        get { return start; }
        set { start = value; }
    }
    private string end = "";
    public string EndDate
    {
        get { return end; }
        set { end = value; }
    }
    public PreviewEventArgs(int Id, string Hash, string startdate, string enddate, Int32 site)
    {
        contract_id = Id;
        site_id = site;
        PageHash = Hash;
        start = startdate;
        end = enddate;
    }
}

public class SearchOTEventArgs : EventArgs
{
    
    private int ot_id = 0;
    public int otId
    {
        get { return ot_id; }
        set { ot_id = value; }
    }
    public SearchOTEventArgs(int Id)
    {
        ot_id = Id;
        
    }
}