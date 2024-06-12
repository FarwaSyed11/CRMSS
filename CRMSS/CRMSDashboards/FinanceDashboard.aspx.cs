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

public partial class CRMSDashboards_FinanceDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetEmpImage(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);



        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);
        return ds.Tables[0].Rows[0][0].ToString();



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpDetails> GetEmpInfo(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);



        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);

        List<EmpDetails> oEmpList = new List<EmpDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpDetails()
                {

                    FULL_NAME = dt.Rows[i]["FULL_NAME"].ToString(),
                    POSITION = dt.Rows[i]["POSITION"].ToString(),

                    EMPLOYEE_NUMBER = dt.Rows[i]["EMPLOYEE_NUMBER"].ToString(),
                    TITLE = dt.Rows[i]["TITLE"].ToString(),
                    FIRST_NAME = dt.Rows[i]["FIRST_NAME"].ToString(),
                    MIDDLE_NAMES = dt.Rows[i]["MIDDLE_NAMES"].ToString(),
                    LAST_NAME = dt.Rows[i]["LAST_NAME"].ToString(),


                    EMERGENCY_PHONE = dt.Rows[i]["EMERGENCY_PHONE"].ToString(),
                    ADDRESS_LINE1 = dt.Rows[i]["ADDRESS_LINE1"].ToString(),
                    COUNTRY = dt.Rows[i]["COUNTRY"].ToString(),
                    EMAIL_ADDRESS = dt.Rows[i]["EMAIL_ADDRESS"].ToString(),
                    RELIGION = dt.Rows[i]["RELIGION"].ToString(),
                    DATE_OF_BIRTH = dt.Rows[i]["DateOfBirth"].ToString(),
                    SEX = dt.Rows[i]["SEX"].ToString(),
                    MARITAL_STATUS = dt.Rows[i]["MARITAL_STATUS"].ToString(),
                    EDUCATION = dt.Rows[i]["EDUCATION"].ToString(),
                    NATIONALITY = dt.Rows[i]["NATIONALITY"].ToString(),

                    PPNO = dt.Rows[i]["PPNO"].ToString(),
                    PPCUSTODY = dt.Rows[i]["PPCUSTODY"].ToString(),
                    PPCONTRYISSUE = dt.Rows[i]["PPCONTRYISSUE"].ToString(),
                    PPDTEXPIRY = dt.Rows[i]["PPDTEXPIRY"].ToString(),
                    PPDTISSUE = dt.Rows[i]["PPDTISSUE"].ToString(),


                    VVVISAISSUEAUTH = dt.Rows[i]["VVVISAISSUEAUTH"].ToString(),
                    VVNO = dt.Rows[i]["VVNO"].ToString(),
                    VVVISATYPE = dt.Rows[i]["VVVISATYPE"].ToString(),
                    VVVISAPOSITION = dt.Rows[i]["VVVISAPOSITION"].ToString(),
                    VVDTEXPIRY = dt.Rows[i]["ExpDate"].ToString(),
                    VVVISAISSUECO = dt.Rows[i]["VVVISAISSUECO"].ToString(),
                    VVUIDNO = dt.Rows[i]["VVUIDNO"].ToString(),

                    TKTRATETYP = dt.Rows[i]["TKTRATETYP"].ToString(),
                    FAMELIG = dt.Rows[i]["FAMELIG"].ToString(),
                    NOOFCHILD = dt.Rows[i]["NOOFCHILD"].ToString(),
                    FAMCLASS = dt.Rows[i]["FAMCLASS"].ToString(),
                    NOOFADULTS = dt.Rows[i]["NOOFADULTS"].ToString(),
                    EMPPERIOD = dt.Rows[i]["EMPPERIOD"].ToString(),

                    BASIC = dt.Rows[i]["BASIC"].ToString(),
                    MOBALW = dt.Rows[i]["MOBALW"].ToString(),
                    OTHALW = dt.Rows[i]["OTHALW"].ToString(),
                    FOODALW = dt.Rows[i]["FOODALW"].ToString(),
                    HOUSING = dt.Rows[i]["HOUSING"].ToString(),
                    CARALW = dt.Rows[i]["CARALW"].ToString(),
                    Transport = dt.Rows[i]["Transport"].ToString(),
                    TRANSALW = dt.Rows[i]["TRANSALW"].ToString(),
                    HRAA = dt.Rows[i]["HRAA"].ToString(),
                    Gross_salary = dt.Rows[i]["Gross_salary"].ToString(),
                    TransProvided = dt.Rows[i]["TransProvided"].ToString(),
                    HRAP = dt.Rows[i]["HRAP"].ToString(),


                    PAYMETHOD = dt.Rows[i]["PAYMETHOD"].ToString(),
                    BANKBRANCH = dt.Rows[i]["BANKBRANCH"].ToString(),
                    BANKNAME = dt.Rows[i]["BANKNAME"].ToString(),
                    IBANNUMBER = dt.Rows[i]["IBANNUMBER"].ToString(),
                    ACCOUNTNUMBER = dt.Rows[i]["ACCOUNTNUMBER"].ToString(),
                    MOBILE_PHONE = dt.Rows[i]["MOBILE_PHONE"].ToString(),
                    WORK_PHONE = dt.Rows[i]["WORK_PHONE"].ToString(),
                    PassWord = dt.Rows[i]["LDpassword"].ToString(),




                });
            }
        }

        return oEmpList;
        //string a = userId;
    }
    public class EmpDetails
    {

        public string FULL_NAME { get; set; }
        public string POSITION { get; set; }

        public string EMPLOYEE_NUMBER { get; set; }
        public string TITLE { get; set; }
        public string FIRST_NAME { get; set; }
        public string MIDDLE_NAMES { get; set; }
        public string LAST_NAME { get; set; }


        public string EMERGENCY_PHONE { get; set; }
        public string ADDRESS_LINE1 { get; set; }
        public string COUNTRY { get; set; }
        public string EMAIL_ADDRESS { get; set; }
        public string RELIGION { get; set; }
        public string DATE_OF_BIRTH { get; set; }
        public string SEX { get; set; }
        public string MARITAL_STATUS { get; set; }
        public string EDUCATION { get; set; }
        public string NATIONALITY { get; set; }


        public string PPNO { get; set; }
        public string PPCUSTODY { get; set; }
        public string PPCONTRYISSUE { get; set; }
        public string PPDTEXPIRY { get; set; }
        public string PPDTISSUE { get; set; }
        public string VVVISAISSUEAUTH { get; set; }
        public string VVNO { get; set; }
        public string VVVISATYPE { get; set; }
        public string VVVISAPOSITION { get; set; }
        public string VVDTEXPIRY { get; set; }
        public string VVVISAISSUECO { get; set; }
        public string VVDTISSUE { get; set; }
        public string VVUIDNO { get; set; }


        public string TKTRATETYP { get; set; }
        public string FAMELIG { get; set; }
        public string NOOFCHILD { get; set; }
        public string FAMCLASS { get; set; }
        public string NOOFADULTS { get; set; }

        public string EMPPERIOD { get; set; }

        public string BASIC { get; set; }
        public string MOBALW { get; set; }
        public string OTHALW { get; set; }
        public string FOODALW { get; set; }
        public string HOUSING { get; set; }
        public string CARALW { get; set; }
        public string TRANSALW { get; set; }
        public string HRAA { get; set; }
        public string HRAP { get; set; }
        public string Transport { get; set; }
        public string Gross_salary { get; set; }

        public string PAYMETHOD { get; set; }
        public string BANKBRANCH { get; set; }
        public string BANKNAME { get; set; }
        public string IBANNUMBER { get; set; }
        public string ACCOUNTNUMBER { get; set; }
        public string MOBILE_PHONE { get; set; }
        public string WORK_PHONE { get; set; }
        public string PassWord { get; set; }

        public string TransProvided { get; set; }



    }
}