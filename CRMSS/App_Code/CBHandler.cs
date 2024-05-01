using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

/// <summary>
/// Summary description for CBHandler
/// </summary>
public class CBHandler
{
    public CBHandler()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    DBHandler DBH = new DBHandler();

    public void Populate(DropDownList DD, String Strsql, String DFText = "", bool Isstoredprocdure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {
            DD.Items.Clear();
            DataTable _DT = new DataTable();
            DBH.CreateDataTable(_DT, Strsql, Isstoredprocdure, pa, pv);
            ListItem list1 = new ListItem();
            list1.Text = DFText;
            list1.Value = "0";
            if (_DT.Rows.Count > 0)
            {
                DD.DataTextField = _DT.Columns[0].ColumnName;
                DD.DataValueField = _DT.Columns[1].ColumnName;
                DD.DataSource = _DT;
                DD.DataBind();
            }
            if (DFText != "") DD.Items.Insert(0, list1);
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }


    public void Populate(CheckBoxList DD, String Strsql, String DFText = "", bool Isstoredprocdure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {
            DataTable _DT = new DataTable();
            DBH.CreateDataTable(_DT, Strsql, Isstoredprocdure, pa, pv);
            ListItem list1 = new ListItem();
            list1.Text = DFText;
            list1.Value = "0";

            DD.DataTextField = _DT.Columns[0].ColumnName;
            DD.DataValueField = _DT.Columns[1].ColumnName;
            DD.DataSource = _DT;
            DD.DataBind();

        }
        catch (Exception ex)
        {
            throw ex;
            // MsgBox(ex.Message)
        }
    }

    public Object ItemValue(DropDownList Drp)
    {
        try
        {
            Object DrpValue = -2;
            if (!(Convert.IsDBNull(Drp.SelectedValue)))
            {
                if (Convert.ToInt32(Drp.SelectedValue) > 0)
                    DrpValue = Drp.SelectedValue;
                else if (Convert.ToInt32(Drp.SelectedValue) == 0)
                    DrpValue = 0;
                else if (Convert.ToInt32(Drp.SelectedValue) < 0)
                    DrpValue = -2;

            }
            return DrpValue;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void SetValue(DropDownList Drp, Object Value, String InactiveText = "<Inactive Entry>")
    {
        //If Drp.Items.Count < 0 Then Exit Sub
        try
        {
            if (Drp.Items.FindByValue(Value.ToString()) == null)
            {
                //If IsDBNull((Drp.SelectedValue = Value)) Then
                ListItem lsitem = new ListItem();
                lsitem.Value = Value.ToString();
                lsitem.Text = InactiveText;
                Drp.Items.Insert(0, lsitem);
                Drp.SelectedValue = Value.ToString();
            }
            else
                Drp.SelectedValue = Value.ToString();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    public void Populate(ListBox DD, String Strsql, String DFText = "", bool Isstoredprocdure = false, ArrayList pa = null, ArrayList pv = null)
    {
        try
        {
            DataTable _DT = new DataTable();
            DBH.CreateDataTable(_DT, Strsql, Isstoredprocdure, pa, pv);
            ListItem list1 = new ListItem();
            list1.Text = DFText;
            list1.Value = "0";

            DD.DataTextField = _DT.Columns[0].ColumnName;
            DD.DataValueField = _DT.Columns[1].ColumnName;
            DD.DataSource = _DT;
            DD.DataBind();
            //If DFText <> "" Then DD.Items.Insert(0, list1)

            //DD.Items.Add(list1)
        }
        catch (Exception ex)
        {
            throw ex;
            // MsgBox(ex.Message)
        }
    }


}