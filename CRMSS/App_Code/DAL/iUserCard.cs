using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for iUserCard
/// </summary>
public class iUserCard
{
	public iUserCard()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int C_CardNum;

    public int c_CardNum
    {
        get { return C_CardNum; }
        set { C_CardNum = value; }
    }
    private int L_UID;

    public int l_UID
    {
        get { return L_UID; }
        set { L_UID = value; }
    }
    private int L_DataCheck;

    public int l_DataCheck
    {
        get { return L_DataCheck; }
        set { L_DataCheck = value; }
    }
}