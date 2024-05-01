using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Saaed.Control.Common
{
    public class AlGridView : GridView
    {
        protected override void OnPreRender(EventArgs e)
        {

            base.OnPreRender(e);
            GridLines = GridLines.None;
            AutoGenerateColumns = false;
            CellPadding = 0;
            CellSpacing = 0;
            AllowPaging = false;
            ShowHeaderWhenEmpty = false;
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