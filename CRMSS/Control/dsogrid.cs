using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for dsogrid
/// </summary>
/// nama
namespace DSOGridView
{
    public class dsogrid : System.Web.UI.WebControls.GridView
    {
        public dsogrid()
        {

        }
        protected override void OnPreRender(EventArgs e)
        {

            base.OnPreRender(e);
            GridLines = System.Web.UI.WebControls.GridLines.None;
            AutoGenerateColumns = false;
            CellPadding = 0;
            CellSpacing = 0;
            AllowPaging = false;
            ShowHeaderWhenEmpty = true;
            EnableViewState = true;

        }
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            Page.PreRenderComplete += Page_PreRender;
        }
        private void Page_PreRender(object sender, EventArgs e)
        {
            if (Rows.Count > 0)
            {
                UseAccessibleHeader = true;
                HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}