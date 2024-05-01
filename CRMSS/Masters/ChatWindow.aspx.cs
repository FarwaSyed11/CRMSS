using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Masters_ChatWindow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            hdnUserId.Value = UserId.ToString();

            if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Type"])))
            {
                string TypeId = Request.QueryString["Type"].ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "getcurrentuserid", "getcurrentuserid();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "LoadChatList", "LoadChatList(" + TypeId + ");", true);
            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ChatList> LoadChatList(string oper, string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(oper);


        pa.Add("@UserID");
        pv.Add(Convert.ToInt32(UserID));

        //pa.Add("@Company");
        //pv.Add(compId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_Chat", true, pa, pv);

        List<ChatList> CL = new List<ChatList>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ChatList chat = new ChatList();
            chat.refId = dt.Rows[i]["refId"].ToString();
            chat.ChatName = dt.Rows[i]["ChatName"].ToString();
            chat.chatDesc = dt.Rows[i]["chatDesc"].ToString();
            chat.ChatType = dt.Rows[i]["Type"].ToString();

            CL.Add(chat);
        }
        return CL;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ChatList> LoadChatHeading(string refid, string Type, string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@refid");
        pv.Add(refid);


        pa.Add("@UserID");
        pv.Add(Convert.ToInt32(UserID));

        pa.Add("@Type");
        pv.Add(Type);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_Chat", true, pa, pv);

        List<ChatList> CL = new List<ChatList>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ChatList chat = new ChatList();
            chat.refId = dt.Rows[i]["refId"].ToString();
            chat.ChatName = dt.Rows[i]["ChatName"].ToString();
            chat.chatDesc = dt.Rows[i]["chatDesc"].ToString();
            chat.ChatType = dt.Rows[i]["Type"].ToString();

            CL.Add(chat);
        }
        return CL;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Messages> LoadMessages(string refid, string Type, string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@refid");
        pv.Add(refid);


        pa.Add("@UserID");
        pv.Add(Convert.ToInt32(UserID));

        pa.Add("@Type");
        pv.Add(Type);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_Chat", true, pa, pv);

        List<Messages> ML = new List<Messages>();
        dt = ds.Tables[0];
     
      

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Messages M = new Messages();
            M.ChatId = dt.Rows[i]["ChatId"].ToString();
            M.SenderId = dt.Rows[i]["SenderId"].ToString();
            M.ReceiverId = dt.Rows[i]["ReceiverId"].ToString();
            M.Message = dt.Rows[i]["Messages"].ToString();
            M.Date = dt.Rows[i]["Date"].ToString();
            M.Mtime = dt.Rows[i]["Mtime"].ToString();
            M.Sendername = dt.Rows[i]["Sendername"].ToString();

            ML.Add(M);
        }
        return ML;
    }
    public class ChatList
    {
        public string refId { get; set; }
        public string ChatName { get; set; }
        public string chatDesc { get; set; }
        public string ChatType { get; set; }
    }
   
    public class Messages
    {
        public string ChatId { get; set; }
        public string SenderId { get; set; }
        public string ReceiverId { get; set; }
        public string Message { get; set; }
        public string Date { get; set; }
        public string Mtime { get; set; }
        public string Sendername { get; set; }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Messages> SendChat(string Sendid, string Type, string RecieverId, string msg)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@SenderId");
        pv.Add(Convert.ToInt64(Sendid));


        pa.Add("@RecieverId");
        pv.Add(Convert.ToInt64(RecieverId));

        pa.Add("@Type");
        pv.Add(Type);

        pa.Add("@messages");
        pv.Add(msg);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_Chat", true, pa, pv);

        List<Messages> ML = new List<Messages>();
        dt = ds.Tables[0];
        


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Messages M = new Messages();
            M.ChatId = dt.Rows[i]["ChatId"].ToString();
            M.SenderId = dt.Rows[i]["SenderId"].ToString();
            M.ReceiverId = dt.Rows[i]["ReceiverId"].ToString();
            M.Message = dt.Rows[i]["Messages"].ToString();
            M.Date = dt.Rows[i]["Date"].ToString();
            M.Mtime = dt.Rows[i]["Mtime"].ToString();
            M.Sendername = dt.Rows[i]["Sendername"].ToString();

            ML.Add(M);
        }
        return ML;
    }
  
}