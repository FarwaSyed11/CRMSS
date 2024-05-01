﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ScrapSystem_ScrapSupervisor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableDetails> GetAllSupRequests(string UserId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(18);

        pa.Add("@userId");
        pv.Add(UserId);


        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

        List<TableDetails> listProjDet = new List<TableDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TableDetails ind = new TableDetails();
            ind.ID = dt.Rows[i]["ID"].ToString();
            ind.RequestNumber = dt.Rows[i]["RequestNumber"].ToString();
            ind.SectionName = dt.Rows[i]["SectionName"].ToString();
            ind.SupervisorName = dt.Rows[i]["SupervisorName"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableDetails> GetApprovedReq(string UserId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(20);

        pa.Add("@userId");
        pv.Add(UserId);


        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

        List<TableDetails> listProjDet = new List<TableDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TableDetails ind = new TableDetails();
            ind.ID = dt.Rows[i]["ID"].ToString();
            ind.RequestNumber = dt.Rows[i]["RequestNumber"].ToString();
            ind.SectionName = dt.Rows[i]["SectionName"].ToString();
            ind.SupervisorName = dt.Rows[i]["SupervisorName"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.SupervisorUpdateDate = dt.Rows[i]["SupervisorUpdateDate"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<BasicDetails> GetBasicDetails(string UserId, string RequestId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@RequestID");
        pv.Add(Convert.ToInt64(RequestId));


        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

        List<BasicDetails> listProjDet = new List<BasicDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            BasicDetails ind = new BasicDetails();
            ind.RequestNumber = dt.Rows[i]["RequestNumber"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.SupervisorName = dt.Rows[i]["SupervisorName"].ToString();
            ind.SectionName = dt.Rows[i]["SectionName"].ToString();




            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDet> GetSupRequestedItems(string UserId, string RequestId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@RequestID");
        pv.Add(Convert.ToInt64(RequestId));
        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

        List<ItemDet> listProjDet = new List<ItemDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDet ind = new ItemDet();
            ind.ItemId = dt.Rows[i]["ItemId"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemDescription = dt.Rows[i]["ItemDescription"].ToString();
            ind.Quantity = dt.Rows[i]["Quantity"].ToString();
            ind.Reason = dt.Rows[i]["Reason"].ToString();
            ind.Comments = dt.Rows[i]["Comments"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();




            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDet> GetItemGallery(string UserId, string ItemId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(10);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemId");
        pv.Add(Convert.ToInt64(ItemId));


        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

        List<ItemDet> listProjDet = new List<ItemDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDet ind = new ItemDet();
            ind.ID = dt.Rows[i]["ID"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();




            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDet> GetApprovedRequests(string UserId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(16);

        pa.Add("@userId");
        pv.Add(UserId);



        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

        List<ItemDet> listProjDet = new List<ItemDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDet ind = new ItemDet();
            ind.ItemId = dt.Rows[i]["ItemId"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemDescription = dt.Rows[i]["ItemDescription"].ToString();
            ind.Reason = dt.Rows[i]["Reason"].ToString();
            ind.Comments = dt.Rows[i]["Comments"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();
            ind.UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString();
            ind.Quantity = dt.Rows[i]["Quantity"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDet> GetQCrejectedReq(string UserId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(16);

        pa.Add("@userId");
        pv.Add(UserId);



        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

        List<ItemDet> listProjDet = new List<ItemDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDet ind = new ItemDet();
            ind.ItemId = dt.Rows[i]["ItemId"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemDescription = dt.Rows[i]["ItemDescription"].ToString();
            ind.Reason = dt.Rows[i]["Reason"].ToString();
            ind.Comments = dt.Rows[i]["Comments"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();
            ind.UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString();
            ind.Quantity = dt.Rows[i]["Quantity"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setApproveReq(string UserId, string ReqId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(19);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@RequestID");
        pv.Add(Convert.ToInt64(ReqId));




        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);


    }


    public class ItemDet
    {
        public string ItemId { get; set; }
        public string ItemCode { get; set; }
        public string ItemDescription { get; set; }
        public string Quantity { get; set; }
        public string Reason { get; set; }
        public string Comments { get; set; }
        public string FileName { get; set; }
        public string URL { get; set; }

        public string ID { get; set; }
        public string UpdatedDate { get; set; }


    }

    public class BasicDetails
    {
        public string RequestNumber { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string SupervisorName { get; set; }
        public string SectionName { get; set; }


    }

    public class TableDetails
    {
        public string ID { get; set; }
        public string RequestNumber { get; set; }
        public string SectionName { get; set; }
        public string SupervisorName { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedDate { get; set; }
        public string SupervisorUpdateDate { get; set; }


    }


}