using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

//namespace TimeAndAttendanceaspx
//{
    public class CGlobal
    {
        static string vDataSource;
        static string vUserId;
        static string vPassword;
        static string vServer;
        static string vImagePath;
        static string vBarcode;
        public static void getInfo()
        {
            System.Xml.XmlDocument oXML = new System.Xml.XmlDocument();
           // oXML.Load(Application.StartupPath + "\\info.xml");
            System.Xml.XmlNode oNode = oXML.SelectSingleNode("//Server");
            vServer = oNode.InnerText.ToString();
            oNode = oXML.SelectSingleNode("//datasource");
            vDataSource = oNode.InnerText.ToString();
            oNode = oXML.SelectSingleNode("//userid");
            vUserId = oNode.InnerText.ToString();
            oNode = oXML.SelectSingleNode("//password");
            vPassword = oNode.InnerText.ToString();
        }

        public static string getConnectionSql()
        {
            //Return "server=" & vServer & ";database=" & vDataSource & ";User ID=" & vUserId & ";Password=" & vPassword

            //Return "server=192.168.168.201;database=UNISSKY;User ID=sa;Password="
            //return "server=AEDXBSDB002;database=Employee;User ID=unisuser;Password=unisamho";
            //return "server=ALASAS-LAP;database=UnisSky20130122;User ID=unisuser;Password=unisamho;connect timeout=0";
            //return "server=ADY-TASERVER\\TASERVER;database=Employee;User ID=sa;Password=welcome1990";
            return ConfigurationManager.ConnectionStrings["DuCon"].ToString();

        }
        public static string getSecConnectionSql()
        {
            //Return "server=" & vServer & ";database=" & vDataSource & ";User ID=" & vUserId & ";Password=" & vPassword

            //Return "server=192.168.168.201;database=UNISSKY;User ID=sa;Password="
            //return "server=AEDXBSDB002;database=Employee;User ID=unisuser;Password=unisamho";
            //return "server=ALASAS-LAP;database=UnisSky20130122;User ID=unisuser;Password=unisamho;connect timeout=0";
            //return "server=ADY-TASERVER\\TASERVER;database=Employee;User ID=sa;Password=welcome1990";
            return ConfigurationManager.ConnectionStrings["SecurityCon"].ToString();

        }
        //public static string getNewConnectionSql()
        //{
        //    //Return "server=" & vServer & ";database=" & vDataSource & ";User ID=" & vUserId & ";Password=" & vPassword

        //    //Return "server=192.168.168.201;database=UNISSKY;User ID=sa;Password="
        //    return "server=ALASAS\ALASASTECH;database=SkylineERP;User ID=sa;Password=";
        //    //return "server=ALASAS-LAP;database=UnisSky20130122;User ID=unisuser;Password=unisamho;connect timeout=0";

        //}
        public static string getConnectionString()
        {

            return ConfigurationManager.ConnectionStrings["UNISCon"].ConnectionString;
        }
    }
//}

