<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="Opportunity.aspx.cs" Inherits="Export_Opportunity" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
      <title>E-Connect/</title>
   
 <%--   <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
	<!-- Datatable plugin JS library file -->	
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>
   
     <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>--%>

    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />

    <script src="../Export/Scripts/ExpOpportunity.js"></script>

    <%--<script src="../js/jquery-1.11.2.min.js"></script>--%>
    <%--<script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>--%>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    	
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
    <script language="javascript" type="text/javascript">
        function Focus(objname, waterMarkText) {
            obj = document.getElementById(objname);
            if (obj.value == waterMarkText) {
                obj.value = "";
                obj.className = "NormalTextBox form-control";
            }
        }
        function Blur(objname, waterMarkText) {
            obj = document.getElementById(objname);
            if (obj.value == "") {
                obj.value = waterMarkText;
                obj.className = "WaterMarkedTextBox form-control";
            }
            else {
                obj.className = "NormalTextBox form-control";
            }

        }


    </script>

       <style>
        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link.active {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link:hover {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link:not(.active) {
            color: black;
            background-color: #b4b9bf;
        }

        .breadcrumb-custom {
            /*centering*/
            text-align: center;
            font-family: 'Merriweather Sans', arial, verdana;
            display: inline-block;
            overflow: hidden;
            border-radius: 5px;
            /*Lets add the numbers for each link using CSS counters. flag is the name of the counter. to be defined using counter-reset in the parent element of the links*/
            counter-reset: flag;
        }

            .breadcrumb-custom a {
                text-decoration: none;
                outline: none;
                display: block;
                float: left;
                font-size: 18px;
                line-height: 36px;
                color: white;
                /*need more margin on the left of links to accomodate the numbers*/
                padding: 0 10px 0 60px;
                background: #666;
                background: linear-gradient(#666, #333);
                position: relative;
            }


                /*since the first link does not have a triangle before it we can reduce the left padding to make it look consistent with other links*/
                .breadcrumb-custom a:first-child {
                    padding-left: 12px;
                    border-radius: 5px 0 0 5px; /*to match with the parent's radius*/
                    width: 235px;
                }

                    .breadcrumb-custom a:first-child:before {
                        left: 14px;
                    }

                .breadcrumb-custom a:last-child {
                    border-radius: 0 5px 5px 0; /*this was to prevent glitches on hover*/
                    padding-right: 20px;
                }

                /*hover/active styles*/
                .breadcrumb-custom a.active, .breadcrumb-custom a:hover {
                    background: #333;
                    background: linear-gradient(#333, #000);
                    color: white !important;
                }

                    .breadcrumb-custom a.active:after, .breadcrumb-custom a:hover:after {
                        background: #333;
                        background: linear-gradient(135deg, #333,#000);
                    }

                /*adding the arrows for the breadcrumbs using rotated pseudo elements*/

                /*we dont need an arrow after the last link*/
                .breadcrumb-custom a:last-child:after {
                    content: none;
                }

        .flat a, .flat a:after {
            background: white;
            color: white;
            transition: all 0.5s;
            width: 235px;
            padding-left: 0%;
        }



            .flat a:hover, .flat a.active, .flat a:hover:after, .flat a.active:after {
                background: #a92828;
                /* color: white; */
            }

        .OPP-PTOverview-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-PTOverview-table td {
            color: #333333 !important;
        }

        .OPP-SUpdate-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-SUpdate-table td {
            color: #333333 !important;
        }

        .OPP-SMUpdate-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-SMUpdate-table td {
            color: #333333 !important;
        }

        .OPP-MUpdate-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-MUpdate-table td {
            color: #333333 !important;
        }

        .OPP-MoreInfo-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-MoreInfo-table td {
            color: #333333 !important;
        }

        .OPP-AdminHistory-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-AdminHistory-table td {
            color: #333333 !important;
        }

        .OPP-SubRevenue-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-SubRevenue-table td {
            color: #333333 !important;
        }


         .OPP-RevenueRequestLost-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-RevenueRequestLost-table td {
            color: #333333 !important;
        }



        .OPP-Quotation-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-MajorInfo-table td {
            color: #333333 !important;
        }

        .Contact-item-list-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .Contact-item-list-table td {
            color: #333333 !important;
        }

        .OPP-MajorInfo-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-AdminRemarks-table td {
            color: #333333 !important;
        }

        .OPP-AdminRemarks-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-Quotation-table td {
            color: #333333 !important;
        }

        .iconClassExcel {
            margin-left: 8px;
            background: #933737;
        }

            .iconClassExcel:hover {
                MATERIAL RETURN REQUEST DETAIL background: #a54141;
            }

        .newContact {
            background-color: #a92828;
            color: white;
        }

            .newContact:hover {
                background: #d51a1a;
                color: white;
            }


        .btn-Style {
            color: #fff;
            background-color: #d14f42;
            border-color: #ffffff;
            box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
        }

            .btn-Style.active, .btn-Style:hover {
                color: #fff;
                background-color: green;
                border-color: #ffffff;
                box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
            }
        /*  @media (min-width: 2500px) and (max-width: 4000px)*/
        .row {
            height: 0% !important;
        }

        .btnVerify {
            color: white;
            background-color: #62dd15;
            width: 133px;
            border-block-color: white;
        }

        .bt-closeReq {
            background-color: #626161 !important;
            color: white !important;
            /* background-color: white; */
            border-color: white !important;
           border: ridge !important;
        }
        .btn-SubmitReq{
            background-color: #e31500 !important;
            border-color: white !important;
            border: ridge !important;
        }



     /*   .con-tooltip {

  position: relative;
  background: #F2D1C9;
  
  border-radius: 9px;
  padding: 0 20px;
  margin: 10px;
  
  display: inline-block;
  
  transition: all 0.3s ease-in-out;
  cursor: default;

}*/

/*tooltip */
/*.tooltip {
  visibility: hidden;
  z-index: 1;
  opacity: .40;
  
  width: 100%;
  padding: 0px 20px;

  background: #333;
  color: #E086D3;
  
  position: absolute;
  top:-140%;
  left: -25%;
  

  border-radius: 9px;
  font: 16px;

  transform: translateY(9px);
  transition: all 0.3s ease-in-out;
  
  box-shadow: 0 0 3px rgba(56, 54, 54, 0.86);
}*/


/* tooltip  after*/
/*.tooltip::after {
  content: " ";
  width: 0;
  height: 0;
  
  border-style: solid;
  border-width: 12px 12.5px 0 12.5px;
  border-color: #333 transparent transparent transparent;

  position: absolute;
  left: 40%;

}

.con-tooltip:hover .tooltip{
  visibility: visible;
  transform: translateY(-10px);
  opacity: 1;
    transition: .3s linear;
  animation: odsoky 1s ease-in-out infinite  alternate;

}
@keyframes odsoky {
  0%{
    transform: translateY(6px); 
  }

  100%{
    transform: translateY(1px); 
  }

}*/


/*hover ToolTip*/
/*.left:hover {transform: translateX(-6px); }
.top:hover {transform: translateY(-6px);  }
.bottom:hover {transform: translateY(6px);}
.right:hover {transform: translateX(6px); }
*/


/*left*/

/*.left .tooltip{ top:-20%; left:-170%; }

.left .tooltip::after{
  top:40%;
  left:90%;
  transform: rotate(-90deg);
}
*/



/*bottom*/

/*.bottom .tooltip { top:115%; left:-20%; }

.bottom .tooltip::after{
  top:-17%;
  left:40%;
  transform: rotate(180deg);
}
*/


/*right

.right .tooltip { top:-20%; left:115%; }

.right .tooltip::after{
  top:40%;
  left:-12%;
  transform: rotate(90deg);
}
*/
/*h3 {
    background: #333;
    color: #E086D3;
    padding: 10px 20px;
    border-radius: 56px;
    width: 8em;
    margin: 20% auto 1% auto;
  
}*/



    </style>
    <script>

     
      function onCalendarShown() {

          var cal = $find("Calendar1");

          //Setting the default mode to month

          cal._switchMode("months", true);

          //Iterate every month Item and attach click event to it

          if (cal._monthsBody) {

              for (var i = 0; i < cal._monthsBody.rows.length; i++) {

                  var row = cal._monthsBody.rows[i];

                  for (var j = 0; j < row.cells.length; j++) {

                      Sys.UI.DomEvent.addHandler(row.cells[j].firstChild, "click", call);

                  }

              }

          }

      }

      function call(eventElement) {

          var target = eventElement.target;

          switch (target.mode) {

              case "month":

                  var cal = $find("Calendar1");

                  cal._visibleDate = target.date;

                  cal.set_selectedDate(target.date);

                  cal._blur.post(true);

                  cal.raiseDateSelectionChanged();

                  break;

          }

      }


  </script>
    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>

            <script type="text/javascript">
                var xPos, yPos;
                var prm = Sys.WebForms.PageRequestManager.getInstance();

                prm.add_beginRequest(BeginRequest);
                prm.add_endRequest(EndRequest);

                function BeginRequest(sender, args) {


                    var contentPanel = $get("<%=dvupdate.ClientID %>");

                    if (Object.is(contentPanel, null)) {
                    }
                    else {
                        xPos = contentPanel.scrollLeft;
                        yPos = contentPanel.scrollTop;
                    }


                }
                function EndRequest(sender, args) {

                    //Same thing here, you need to set the Panel's scroll:
                    var contentPanel = $get("<%=dvupdate.ClientID %>");

                    if (Object.is(contentPanel, null)) {
                    }
                    else {
                        contentPanel.scrollLeft = xPos;
                        contentPanel.scrollTop = yPos;
                    }


                }

            </script>


            <div class="GridviewDiv" id="pnlSummaryView" runat="server">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                    <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <h3>
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="OPPORTUNITY"></asp:Label>
                                <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />

                            </h3>


                        </div>
                    </asp:Panel>
                    <div class="card-block">
                        <div class="row">
                            <div class="pull-right" style="padding-top: 5px;">
                                <label class="form-label">
                                    <asp:Label ID="Label26" runat="server" Text="General Search"></asp:Label>
                                </label>
                            </div>
                            <div class="pull-right" style="padding-top: 5px;">
                                <asp:TextBox ID="txtGeneralSearch" runat="server" ForeColor="Black" CssClass="form-control textBox1"></asp:TextBox>
                            </div>

                            <div class="pull-right" style="padding-top: 5px;">
                                <asp:LinkButton ID="lbkGeneralSearch" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbkGeneralSearch_Click"><i class="fa fa-search" aria-hidden="true" title="Search"></i></asp:LinkButton>
                                <asp:LinkButton ID="lbkAdvanceButton" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbkAdvanceButton_Click"
                                    runat="server"><i class="fa fa-filter" aria-hidden="true" title="Advanced Filter"></i></asp:LinkButton>

                                <asp:LinkButton ID="lbkAddNew" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbkAddNew_Click"
                                    runat="server" Visible="true"><i class="fa fa-plus" aria-hidden="true" title="Add New Opportunity"></i></asp:LinkButton>
                            </div>

                            &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                   <label class="form-label">
                                       <asp:Label ID="lblRowCount" runat="server" Text="" ForeColor="Red"></asp:Label>

                                   </label>
                               </div>
                        </div>
                        <div class="row" style="padding-left: 8px; padding-top: 10px;">
                            <div class="col-1" style="width: 20%; border-style: groove;" id="dvdAdvancedSearch" runat="server" visible="false">
                                <asp:Panel runat="server" ID="pnlNumberClose" Style="padding-top: 5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            PROJECT # 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:TextBox ID="txtNumber" CssClass="form-control textBox1" runat="server" ForeColor="Black"></asp:TextBox>
                                        </div>
                                        <div style="width: 5%">
                                            <asp:Button ID="btnNumberPnlClose" runat="server" CssClass="btn btn-close" Style="padding: 10px 0px;" OnClick="btnNumberPnlClose_Click"></asp:Button>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlcompanydrp" Style="padding-top: 5px" Visible="false">
                                    <div class="row">

                                        <div style="width: 30%">
                                            Company 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlOrganization" CssClass="form-control textBox1" runat="server" ForeColor="Black" OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                            <asp:Button ID="btnCloseCompanyFilt" runat="server" CssClass="btn btn-close" Style="padding: 10px 0px;" OnClick="btnCloseCompanyFilt_Click"></asp:Button>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlManager" Style="padding-top: 5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            Marketing 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlManager" CssClass="form-control textBox1" runat="server" ForeColor="Black" Style="max-width: 100%"></asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                            <asp:Button ID="btnManagerClose" runat="server" CssClass="btn btn-close" Style="padding: 10px 0px;" OnClick="btnManagerClose_Click"></asp:Button>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <asp:Panel runat="server" ID="pnlStatus" Style="padding-top: 5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            Status  
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlStatus" CssClass="form-control textBox1" runat="server" ForeColor="Black">
                                                <asp:ListItem Text="OPEN" Value="OPEN" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="WON" Value="WON"></asp:ListItem>
                                                <asp:ListItem Text="LOST" Value="LOST"></asp:ListItem>
 <asp:ListItem Text="NO SALE" Value="NO SALE"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                            <asp:Button ID="btnStatusClose" runat="server" CssClass="btn btn-close" Style="padding: 10px 0px;" OnClick="btnStatusClose_Click"></asp:Button>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlSalesStage" Style="padding-top: 5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            Sales Satge  
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlSalesStageSearch" CssClass="form-control textBox1" runat="server" ForeColor="Black">
                                                <asp:ListItem Text="J.O.H" Value="J.O.H" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="TENDER" Value="TENDER"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                            <asp:Button ID="btnSalesstageClose" runat="server" CssClass="btn btn-close" Style="padding: 10px 0px;" OnClick="btnSalesstageClose_Click"></asp:Button>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="Panel4" Style="padding-top: 5px">
                                    <div class="row">

                                        <div style="width: 100%">
                                            <div class="pull-left">
                                                <asp:DropDownList ID="ddlNewField" CssClass="form-control textBox1" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlNewField_SelectedIndexChanged" Style="align-items: center">

                                                    <asp:ListItem Text="ADD FIELD" Value="ADD" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="OPT Number" Value="OPT"></asp:ListItem>
                                                    <asp:ListItem Text="Company" Value="Company"></asp:ListItem>
                                                    <asp:ListItem Text="Owner" Value="Owner"></asp:ListItem>
                                                    <asp:ListItem Text="Status" Value="Status"></asp:ListItem>
                                                    <asp:ListItem Text="SalesStage" Value="SalesStage"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="pull-left" style="padding-left: 10%">
                                                <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-info" OnClick="btnSearch_Click" />
                                            </div>
                                            <div class="pull-left" style="padding-left: 1%">
                                                <asp:Button runat="server" ID="btnExport" Text="Export" CssClass="btn btn-gray" OnClick="btnExport_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>









                                <div class="pull-right">
                                    <label class="form-label">
                                        <asp:Label ID="lblSummaryErrormsg" runat="server" Text="" ForeColor="Red"></asp:Label>

                                    </label>
                                </div>


                            </div>

                            <div style="width: 80%;" id="dvdResult" runat="server">

                                <div id="dvupdate" runat="server" style="overflow-y: auto; height: calc(100vh - 225px); overflow-x: hidden">
                                    <asp:GridView ID="gdvSummaryDetails" runat="server" AutoGenerateColumns="False"
                                        OnRowCommand="gdvSummaryDetails_RowCommand"
                                        CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                                        class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <HeaderStyle CssClass="GridHeader-blue" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="OPT Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="PRJNumber">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOPTNumber" Text='<%#(Eval("OPTNumber").ToString()) %>'
                                                        runat="server" />
                                                    <asp:HiddenField ID="hfdOPTNumber" Value='<%#(Eval("OPTNumber").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" />

                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Name" ItemStyle-Width="15%" Visible="True" SortExpression="Name" HeaderStyle-HorizontalAlign="Left">

                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" Text='<%#(Eval("Name").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Owner" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Owner">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOwner" Text='<%#(Eval("Owner").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Assistant Owner" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="AssistantOwner">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAssistantOwner" Text='<%#(Eval("AssistantOwner").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Stage" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="Stage">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStage" Text='<%#(Eval("Stage").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" Text='<%#(Eval("Status").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>

                                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Created Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="CreatedDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCreatedDate" Text='<%#(Eval("CreatedDate").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>

                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View">
                                                <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                                <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lblView" runat="server" Text='' CommandName="View" CssClass="btn rounded-pill btn-icon btn-round"
                                                        CommandArgument='<%#Eval("OPTNumber")%>' Style="text-align: center"><i class="fa fa-eye" title="View"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>



                                        </Columns>

                                        <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                        <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                        <EditRowStyle BackColor="#7C6F57" />
                                        <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                        <SortedDescendingHeaderStyle BackColor="#15524A" />


                                    </asp:GridView>

                                    <div class="row">
                                        <asp:Button runat="server" ID="btnLoadMoreSummary" OnClick="btnLoadMoreSummary_Click" Width="100%" Text="Load More"></asp:Button>
                                    </div>
                                </div>


                            </div>
                        </div>



                    </div>


                </div>


            </div>


            <cc1:ModalPopupExtender ID="mpSearch" runat="server" PopupControlID="pnlSearchDetails" TargetControlID="txtSearchDeatils"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior1" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlSearchDetails" AccessKey="s" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

                <div style="border-radius: 50px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 70%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 15%; top: 64.5px; border: solid; border-color: silver; padding-bottom: 20px">
                    <div class="row" style="height: 55px">

                        <div class="pull-left" style="border-radius: 50px !important; padding-left: 20px;">
                            <img src="../masters/images/ec.png" style="height: 30px;" />
                            <img src="../masters/images/ec1.png" style="height: 50px;" />

                        </div>
                        <div>
                        </div>
                    </div>

                    <div class="modal-header panl14" style="font-family: system-ui;">

                        <div class="pull-left">

                            <h4>
                                <asp:Label ID="Label34" class="subpnlhdg" runat="server" Text="Search"></asp:Label>
                            </h4>

                        </div>


                        <div class="pull-right">
                            <%--    <button type="button" class="btn btn-close"  aria-label="Close" runat="server" id="btnCloseSearchMP"/>--%>
                            <asp:Button ID="btnCloseSearchMPNew" OnClick="btnCloseSearchMPNew_Click" runat="server" class="btn btn-close" />

                            <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>

                    <table class="table table-condensed" style="padding-top: 10px;">

                        <tr>
                            <td style="padding: 3px 5px; width: 10%; padding-top: 10px" class="label-alignment no-border">
                                <asp:Label ID="Label35" runat="server" Text="Search By Name"></asp:Label>

                            </td>
                            <td style="padding: 3px 5px; width: 90%; padding-top: 10px" class="no-border">
                                <div class="pull-left">
                                    <asp:TextBox ID="txtSearchDeatils" CssClass="textBox1 form-control " runat="server" />
                                </div>
                                <div class="pull-left" style="padding-left: 5px">
                                    <asp:LinkButton ID="lbSearchDetails" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSearchDetails_Click"><i class="fa fa-search" aria-hidden="true" title="Search"></i></asp:LinkButton>
                                </div>
                            </td>

                        </tr>


                    </table>


                    <asp:HiddenField ID="hfdOper" runat="server" />
                    <div style="padding-top: 10px;">
                        <asp:GridView ID="gdvSearchDetails" runat="server" AutoGenerateColumns="false" Width="100%"
                            CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found" OnRowCommand="gdvSearchDetails_RowCommand"
                            class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="5%" Visible="false">

                                    <ItemTemplate>
                                        <asp:HiddenField ID="hfdRefID" runat="server" Value='<%#Eval("RefId")%>' />
                                        <asp:LinkButton ID="lblUpdate" runat="server" Text="" CommandArgument='<%#Eval("RefId")%>'
                                            CommandName="Select" Style="text-align: center"><i class="fa fa-bookmark" aria-hidden="true" title="Search"></i> </asp:LinkButton>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="40%" ItemStyle-HorizontalAlign="Center">

                                    <ItemTemplate>

                                        <asp:LinkButton ID="lblName" runat="server" Text='<%#Eval("Name")%>' Style="text-align: center" CommandArgument='<%#Eval("RefId")%>'
                                            CommandName="Select"></asp:LinkButton>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="40%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOwner" runat="server" Text='<%#Eval("Owner")%>' Style="text-align: center"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompany" runat="server" Text='<%#Eval("Company")%>' Style="text-align: center"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>

                            <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                            <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                            <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                        </asp:GridView>
                    </div>

                </div>

            </asp:Panel>







  <cc1:ModalPopupExtender ID="mpAddNewOPT" runat="server" PopupControlID="pnlAddNewOPT" TargetControlID="btnCloseAddNewOPT"
                Enabled="true" CancelControlID="btnCloseAddNewOPT" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior3" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlAddNewOPT" AccessKey="s" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

                <div style="border-radius: 50px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 50%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 25%; top: 64.5px; border: solid; border-color: silver; padding-bottom: 20px">
                    <div class="row" style="height: 55px">

                        <div class="pull-left" style="border-radius: 50px !important; padding-left: 20px;">
                            <img src="../masters/images/ec.png" style="height: 30px;" />
                            <img src="../masters/images/ec1.png" style="height: 50px;" />

                        </div>
                        <div>
                        </div>
                    </div>

                    <div class="modal-header panl14" style="font-family: system-ui;">

                        <div class="pull-left">

                            <h4>
                                <asp:Label ID="Label3" class="subpnlhdg" runat="server" Text="Add New BOQ Opportunity"></asp:Label>
                            </h4>

                        </div>


                        <div class="pull-right">
                            <button type="button" class="btn btn-close" aria-label="Close" runat="server" id="btnCloseAddNewOPT" />


                            <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>

                    <table class="table table-condensed" style="margin-top: 20px;">
                        <tr>
                            <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                <asp:Label ID="Label25" runat="server" Text="Name"></asp:Label>
                                <asp:HiddenField ID="hfdNewOPT" runat="server"></asp:HiddenField>
                            </td>
                            <td style="padding: 3px 5px; width: 8%" class="no-border">
                                <asp:TextBox ID="txtName" CssClass="textBox1 form-control " runat="server" />
                            </td>

                            <td style="padding: 3px 5px; width: 4%" class="label-alignment no-border"></td>

                            <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                <asp:Label ID="Label9" runat="server" Text="Owner"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px; width: 8%" class="no-border">
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <asp:LinkButton ID="lbSearchManager" runat="server" Text="" OnClick="lbSearchManager_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
                                    <asp:TextBox ID="txtManagerName" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                    <asp:HiddenField ID="hfdManagerId" runat="server" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 3px 5px; width: 10%" class="label-alignment no-border">
                                <asp:Label ID="Label19" runat="server" Text="Customer"></asp:Label>

                            </td>
                            <td style="padding: 3px 5px; width: 37%" class="no-border">
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <asp:LinkButton ID="lblCustomerNewOPT" runat="server" Text="" OnClick="lblCustomerNewOPT_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
                                    <asp:TextBox ID="txtCustomerNewOPT" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                    <asp:HiddenField ID="hfdCustomerNewOPT" runat="server" />
                                </div>
                            </td>
                            <td style="padding: 3px 5px; width: 4%" class="label-alignment no-border"></td>
                            <td style="padding: 3px 5px; width: 10%" class="label-alignment no-border">
                                <asp:Label ID="Label21" runat="server" Text="Assistant Owner"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px; width: 37%" class="no-border">
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <asp:LinkButton ID="lblAssistantOwnerNewOPT" runat="server" Text="" OnClick="lblAssistantOwnerNewOPT_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
                                    <asp:TextBox ID="txtAssistantOwnerNewOPT" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                    <asp:HiddenField ID="hfdAssistantOwnerIDNewOPT" runat="server" />
                                </div>
                            </td>

                        </tr>
                        <tr>
                            <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                <asp:Label ID="Label44" runat="server" Text="Country"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px; width: 8%" class="no-border">
                                <asp:DropDownList ID="ddlCountryNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
                            </td>
                        </tr>




                    </table>

                    <div style="padding-top: 20px;">
                        <asp:LinkButton ID="lblSaveNewOPT" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lblSaveNewOPT_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
                    </div>

                </div>

            </asp:Panel>



            <asp:Panel ID="pnlDetailView" runat="server" Visible="false">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                    <asp:Panel ID="Panel3" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <div class="pull-left">
                                <h3>
                                    <asp:Label ID="Label8" ForeColor="White" Font-Bold="true" runat="server" Text="Project Master"></asp:Label>

                                </h3>
                            </div>
                            <div class="pull-right">

                                <asp:LinkButton ID="btnAdminHistory" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnAdminHistory_Click"><i class="fa fa-address-book" title="Admin Remarks"></i></asp:LinkButton>

                                <asp:LinkButton ID="btnMore" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnMore_Click"><i class="fa fa-ellipsis-h" aria-hidden="true" title="More Info"></i></asp:LinkButton>
                                <%--<asp:Button ID="btnStartConv" runat="server" Text="Start Converstation" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnStartConv_Click" />--%>
                                <asp:LinkButton ID="btnStartConv" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnStartConv_Click"><i class="fa fa-comments" aria-hidden="true" title="Start Conversation"></i></asp:LinkButton>

                                <%--<asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn rounded-pill me-2 btn-primary" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnBack_Click" />--%>
                                <asp:LinkButton ID="btnBack" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnBack_Click"><i class="fa fa-arrow-circle-left" aria-hidden="true" title="Go Back"></i></asp:LinkButton>
                            </div>


                        </div>
                    </asp:Panel>
                    <div class="card-block">
                        <asp:Panel ID="Panel2" runat="server" CssClass="pnlsubheading">

                            <div class="pull-left">
                                <h5>
                                    <asp:Label ID="Label2" class="panel-heading" Style="color: white;" runat="server" Text="Opportunity Details"></asp:Label></h5>
                            </div>
                            <div class="pull-right" style="margin-top: -9px; margin-right: 10px;">
                                <asp:LinkButton ID="lbUpdateOPT" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbUpdateOPT_Click"><i class="fa fa-save" aria-hidden="true" title="Update Opportunity Details"></i></asp:LinkButton>
                            </div>

                        </asp:Panel>




                        <table class="table table-condensed" style="width: 100%">
                            <tr>
                                <td style="padding: 3px 5px; width: 5%;" class="label-alignment no-border">
                                    <asp:Label ID="Label23" runat="server" Text="Inquiry Type"></asp:Label>

                                </td>
                                <td style="padding: 3px 5px; width: 8%;" class="no-border">
                                    <asp:DropDownList ID="ddlInquiryType" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlInquiryType_SelectedIndexChanged" AutoPostBack="true">

                                        <asp:ListItem Text="BOQ" Value="BOQ" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="PROJECT" Value="PROJECT"></asp:ListItem>
                                        <asp:ListItem Text="DIRECT ORDER" Value="DIRECT ORDER"></asp:ListItem>
                                        <asp:ListItem Text="VEHICLE" Value="VEHICLE"></asp:ListItem>

                                    </asp:DropDownList>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <asp:Panel runat="server" ID="pnlProjectDetails">
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label24" runat="server" Text="Project"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%;" class="no-border" colspan="4">
                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <asp:LinkButton ID="lbSearchProject" runat="server" Text="" OnClick="lbSearchProject_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton>

                                            </span>
                                            <a href="#" runat="server" id="linkProject">
                                                <asp:Label ID="lblProjectName" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false" Style="min-height: 39px; min-width: 234px"></asp:Label>
                                            </a>
                                            <asp:HiddenField ID="hfdProjectId" runat="server" />
                                        </div>

                                    </td>
                                </asp:Panel>
                            </tr>
                            <tr>



                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">

                                    <asp:Label ID="Label15" runat="server" Text="Project Number"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">

                                    <asp:TextBox ID="txtOPTNumberEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                </td>

                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label20" runat="server" Text="Name"></asp:Label>
                                    <asp:HiddenField ID="hfdOPTID" runat="server" />
                                </td>

                                <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:TextBox ID="txtNameEdit" runat="server" CssClass="textBox1 form-control " Enabled="true" Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label7" runat="server" Text="Customer"></asp:Label>

                                </td>
                                <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <asp:LinkButton ID="lbCustomerEditSearch" runat="server" Text="" OnClick="lbCustomerEditSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
                                        <asp:TextBox ID="txtCustomerNameEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                        <asp:HiddenField ID="hfdCustomerIdEdit" runat="server" />
                                    </div>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label1" runat="server" Text="Manager"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 10%" class="no-border">


                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <asp:LinkButton ID="lbSearchManagerEdit" runat="server" Text="" OnClick="lbSearchManagerEdit_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
                                        <asp:TextBox ID="txtManagerNameEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                        <asp:HiddenField ID="hfdManagerIdIDEdit" runat="server" />
                                    </div>
                                </td>



                            </tr>
                            <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label5" runat="server" Text="Assistant Owner"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 10%" class="no-border">


                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <asp:LinkButton ID="lbAssistantOwnerEditSearch" runat="server" Text="" OnClick="lbAssistantOwnerEditSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
                                        <asp:TextBox ID="txtAssistantOwnerEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                        <asp:HiddenField ID="hfdAssistantOwnerIdEdit" runat="server" />
                                    </div>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label42" runat="server" Text="Country"></asp:Label>
                                </td>

                                <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:DropDownList ID="ddlCountryEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" AutoPostBack="true"></asp:DropDownList>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label4" runat="server" Text="Stage"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:DropDownList ID="ddlStageEdit" CssClass="form-control textBox1" runat="server" ForeColor="Black">
                                        <asp:ListItem Text="J.O.H" Value="J.O.H" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="TENDER" Value="TENDER"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label6" runat="server" Text="Status"></asp:Label>

                                </td>

                                <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:DropDownList ID="ddlStatusEdit" CssClass="form-control textBox1" runat="server" ForeColor="Black">
                                        <asp:ListItem Text="OPEN" Value="OPEN" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="WON" Value="WON"></asp:ListItem>
                                        <asp:ListItem Text="LOST" Value="LOST"></asp:ListItem>
<asp:ListItem Text="NO SALE" Value="NO SALE"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>






                        </table>

                     

                        <tr>
                            <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                <asp:Label ID="Label10" runat="server" Text="Country"></asp:Label>
                                <asp:HiddenField ID="hfdRelated" Value="1" runat="server" />
                                <asp:HiddenField ID="hfdOptNo" Value="" runat="server" />
                                <asp:HiddenField ID="hfdDivideValue" Value="4" runat="server" />
                            </td>



                            <%-- new code run for revenue here 18.01.2024 --%>

                            <asp:Panel ID="Panel5" runat="server" CssClass="pnlsubheading">
                                <div class="pull-left" style="margin-top: -8px;">
                                    <div class="breadcrumb-custom flat">
                                        <a id="aRevenue" runat="server">
                                            <asp:Button ID="btnRevenue" runat="server" Text="Revenue" Width="224px" BackColor="Transparent" BorderStyle="None" OnClick="btnRevenue_Click" />
                                        </a>
                                        <a id="aQuotation" runat="server">
                                            <asp:Button ID="btnQuotation" runat="server" Text="Quotation" Width="235px" BackColor="Transparent" BorderStyle="None" OnClick="btnQuotation_Click" />
                                        </a>
                                        <a id="aSalesOrder" runat="server">
                                            <asp:Button ID="btnSalesOrder" runat="server" Text="Sales Order" Width="235px" BackColor="Transparent" BorderStyle="None" OnClick="btnSalesOrder_Click" />
                                        </a>
                                    </div>
                                </div>
                                <div class="pull-right" style="margin-top: -9px; margin-right: 10px;">
                                    <asp:LinkButton ID="lbAddrevLine" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbAddrevLine_Click"><i class="fa fa-plus" aria-hidden="true" title="Add An Item"></i></asp:LinkButton>
                                    &nbsp&nbsp;
       <asp:LinkButton ID="lbRevenueLostHistory" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbRevenueLostHistory_Click"><i class="fa fa-history" aria-hidden="true" title="Revenue RequestedLost"></i></asp:LinkButton>



                                </div>
                                <asp:HiddenField ID="hfdRevRemarks" runat="server" />
                                <asp:HiddenField ID="hfdRevStatus" runat="server" />
                                <asp:HiddenField ID="hfdRevSubstage" runat="server" />
                                <asp:HiddenField ID="hfdRevVale" runat="server" />
                                <asp:HiddenField ID="hfdSoNo" runat="server" />
                                <asp:HiddenField ID="hfdSoDate" runat="server" />
                                <asp:HiddenField ID="hfdQNo" runat="server" />
                                <asp:HiddenField ID="hfdQDate" runat="server" />

                            </asp:Panel>

						</br>
						</br>
                            <%-- REvenue details --%>
                            <div id="Div1" runat="server" style="overflow-x: auto">
                                <asp:GridView ID="gdvRevUpdate" runat="server" AutoGenerateColumns="False"
                                    AllowSorting="True" EmptyDataText="No Data Found" AllowPaging="false"
                                    OnRowCommand="gdvRevUpdate_RowCommand" OnRowDataBound="gdvRevUpdate_RowDataBound"
                                    OnRowEditing="gdvRevUpdate_RowEditing" OnRowUpdating="gdvRevUpdate_RowUpdating"
                                    class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                    <Columns>

                                        <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="15%" Visible="True">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProductType" Text='<%#(Eval("Product").ToString()) %>' runat="server" />
                                                <asp:HiddenField ID="hfdRevenueRowId" Value='<%#(Eval("RevId").ToString()) %>' runat="server" />
                                                <asp:HiddenField ID="hfdOpportunityNumber" Value='<%#(Eval("OPTNumber").ToString()) %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Revenue Status" ItemStyle-Width="10%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRevenueStatus" Text='<%#(Eval("Status").ToString()) %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Revenue Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlRevenueStatus" runat="server">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlSubStage" runat="server">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubStage" Text='<%#(Eval("SubStage").ToString()) %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sub Stage Date" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubStageDate" Text='<%#(Eval("SubStageDate").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Admin Remaks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtRemarks" runat="server" Text='<%#(Eval("AdminRemarks").ToString()) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quotation Number" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtQuotationNumber" runat="server" Text='<%#(Eval("QuotationNumber").ToString()) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quotation Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtQuotationDate" runat="server" Text='<%#(Eval("QuotationDate").ToString()) %>' />
                                                <ajax:CalendarExtender ID="calS3" runat="server" Format="yyyy-MM-dd" TargetControlID="txtQuotationDate"
                                                    CssClass="MyCalendar">
                                                </ajax:CalendarExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="SO Number" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtSONumber" runat="server" Text='<%#(Eval("SONumber").ToString()) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="SO Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtSODate" runat="server" Text='<%#(Eval("SoDate").ToString()) %>' />
                                                <ajax:CalendarExtender ID="calS4" runat="server" Format="yyyy-MM-dd" TargetControlID="txtSODate"
                                                    CssClass="MyCalendar">
                                                </ajax:CalendarExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="VALUE" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="lblValue" Text='<%#(Eval("VALUE").ToString()) %>' runat="server" Style="text-align: center" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Currency" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCurrency" Text='<%#(Eval("Currency").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Update" Visible="true">

                                            <ItemStyle Font-Size="Small" HorizontalAlign="Center" Width="4%" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lblUpdate" runat="server" Text='' CssClass="btn rounded-pill btn-icon btn-round"
                                                    CommandName="Update" Style="text-align: center"><i class="fa fa-floppy-o" title="Save"></i></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="History">
                                            <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                            <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lblHistory" runat="server" Text='' CssClass="btn rounded-pill btn-icon btn-round"
                                                    CommandArgument='<%#Eval("RevId")%>' CommandName="History" Style="text-align: center"><i class="fa fa-history" title="History"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%--   <asp:TemplateField HeaderText="Others">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnothers" runat="server" Style="text-align: center" CommandName="Others" CssClass="btn rounded-pill btn-icon btn-round"
                                                CommandArgument='<%#(Eval("RevId").ToString())%>'><i class="fa fa-info-circle" title="Others"></i></asp:LinkButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    </Columns>

                                    <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                    <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                    <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                </asp:GridView>

                                <%-- extra code added om 18.01.2024 for quotation --%>

                                <asp:GridView ID="gdvQuotationUpdate" runat="server" AutoGenerateColumns="False" Width="100%"
                                    CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found" OnRowCommand="gdvQuotationUpdate_RowCommand"
                                    class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                    <Columns>



                                        <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col10">
             
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="" ItemStyle-Width="15%" Visible="True" SortExpression="QtnHeaderId">
                                            <ItemTemplate>
                                                <asp:Label ID="lb1" Text='<%#(Eval("QtnHeaderId").ToString()) %>'
                                                    runat="server" />
                                                <asp:HiddenField Value="QtnHeaderId" runat="server" />

                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="QtnNumber">
                                            <ItemTemplate>
                                                <asp:Label ID="lb2" Text='<%#(Eval("QtnNumber").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="QtnDate">
                                            <ItemTemplate>
                                                <asp:Label ID="lb3" Text='<%#(Eval("QtnDate").ToString()) %>' runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="ProjectLocation">
                                            <ItemTemplate>
                                                <asp:Label ID="lb4" Text='<%#(Eval("ProjectLocation").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>

                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="QtnType">
                                            <ItemTemplate>
                                                <asp:Label ID="lb5" Text='<%#(Eval("QtnType").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                         </Columns>

                                           
                                    <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                    <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                    <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                </asp:GridView>

                                    <%-- extra code added om 19.01.2024 for salesorder --%>
                                
                               <asp:GridView ID="gdvSOUpdate" runat="server" AutoGenerateColumns="False" Width="100%"
                               CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found" OnRowCommand="gdvSOUpdate_RowCommand"
                               class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                               <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                               <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                               <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                 <Columns>



            <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col10">
             
            </asp:TemplateField>

            <asp:TemplateField HeaderText="" ItemStyle-Width="15%" Visible="True" SortExpression="OracleSOID">
                <ItemTemplate>
                    <asp:Label ID="lb1" Text='<%#(Eval("OracleSOID").ToString()) %>'
                        runat="server" />
                    <asp:HiddenField Value="OracleSOID" runat="server" />

                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="5%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="OrderNumber">
                <ItemTemplate>
                    <asp:Label ID="lb2" Text='<%#(Eval("OrderNumber").ToString()) %>'
                        runat="server" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="5%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="HeaderRemarks">
                <ItemTemplate>
                    <asp:Label ID="lb3" Text='<%#(Eval("HeaderRemarks").ToString()) %>' runat="server" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="5%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="BookedDate">
                <ItemTemplate>
                    <asp:Label ID="lb4" Text='<%#(Eval("BookedDate").ToString()) %>'
                        runat="server" />
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" Width="10%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="SOValue">
                <ItemTemplate>
                    <asp:Label ID="lb5" Text='<%#(Eval("SOValue").ToString()) %>'
                        runat="server" />
                </ItemTemplate>
                </asp:TemplateField>
             </Columns>

               
        <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
        <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
        <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

    </asp:GridView>


                            </div>
                    </div>
                </div>

                <div id="Div2" runat="server" style="overflow-y: auto; height: calc(100vh - 250px); overflow-x: hidden">
                    <asp:GridView ID="gdvRelatedDetails" runat="server" AutoGenerateColumns="False"
                        CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                        class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                        <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                        <Columns>



                            <asp:TemplateField HeaderText="" ItemStyle-Width="15%" Visible="True" SortExpression="col1">
                                <ItemTemplate>
                                    <asp:Label ID="lbl1" Text='<%#(Eval("col1").ToString()) %>'
                                        runat="server" />

                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col2">
                                <ItemTemplate>
                                    <asp:Label ID="lbl2" Text='<%#(Eval("col2").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="col3">
                                <ItemTemplate>
                                    <asp:Label ID="lbl3" Text='<%#(Eval("col3").ToString()) %>' runat="server" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col4">
                                <ItemTemplate>
                                    <asp:Label ID="lbl4" Text='<%#(Eval("col4").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="col5">
                                <ItemTemplate>
                                    <asp:Label ID="lbl5" Text='<%#(Eval("col5").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="col6">
                                <ItemTemplate>
                                    <asp:Label ID="lbl6" Text='<%#(Eval("col6").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="col7">
                                <ItemTemplate>
                                    <asp:Label ID="lbl7" Text='<%#(Eval("col7").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="col8">
                                <ItemTemplate>
                                    <asp:Label ID="lbl8" Text='<%#(Eval("col8").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="col9">
                                <ItemTemplate>
                                    <asp:Label ID="lbl9" Text='<%#(Eval("col9").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="col9">
                                <ItemTemplate>
                                    <asp:Label ID="lbl10" Text='<%#(Eval("col10").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>




                        </Columns>

                        <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                        <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                        <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                    </asp:GridView>
                </div>
            </asp:Panel>

           

            
            <cc1:ModalPopupExtender ID="mpMediaInfo" runat="server" PopupControlID="pnlMediaInfo" TargetControlID="btnMediInfoClose"
                Enabled="true" CancelControlID="btnMediInfoClose" DropShadow="true" BehaviorID="MPE23" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlMediaInfo" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

                <div style="border-radius: 50px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 80%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 10%; top: 64.5px; border: solid; border-color: silver; padding-bottom: 20px">
                    <div class="row" style="height: 55px">

                        <div class="pull-left" style="border-radius: 50px !important; padding-left: 20px;">
                            <img src="../masters/images/ec.png" style="height: 30px;" />
                            <img src="../masters/images/ec1.png" style="height: 50px;" />

                        </div>
                        <div>
                        </div>
                    </div>

                    <div class="modal-header panl14" style="font-family: system-ui;">

                        <div class="pull-left">

                            <h4>
                                <asp:Label ID="lblMediaInfoHeader" class="subpnlhdg" runat="server" Text="Media information"></asp:Label>
                                <asp:HiddenField ID="hfdMediaRefID" runat="server"></asp:HiddenField>
                            </h4>

                        </div>


                        <div class="pull-right">
                            <button type="button" class="btn btn-close" aria-label="Close" runat="server" id="btnMediInfoClose" />
                            <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>
                    <div class="popupmaxheight">
                        <table class="table table-condensed" style="width: 100%">

                            <tr>

                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label73" runat="server" Text="Medi Name"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtMediaNameP" CssClass="textBox1 form-control " runat="server" />
                                </td>

                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label74" runat="server" Text="Media Reference"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtMediaRefP" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label75" runat="server" Text="Media URL"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtMediaURLP" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label76" runat="server" Text="More Info"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtMediaMoreInfoP" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:LinkButton ID="btnSaveMediaInfo" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnSaveMediaInfo_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
                                </td>
                            </tr>




                        </table>
                        <div id="Div3" runat="server" style="overflow-y: auto; height: calc(100vh - 500px); overflow-x: hidden">
                            <asp:GridView ID="gdvMediInfo" runat="server" AutoGenerateColumns="False"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Media Name" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="MediaName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMediaName" Text='<%#(Eval("MediaName").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdMediaInfoID" Value='<%#(Eval("ID").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Media Reference" ItemStyle-Width="15%" Visible="True" SortExpression="MediaReference">
                                        <HeaderStyle CssClass="gridheadercenter" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblMediaReference" Text='<%#(Eval("MediaReference").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Media URL" ItemStyle-Width="12%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMediaURL" Text='<%#(Eval("MediaURL").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="More Information" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMoreInfo" Text='<%#(Eval("MoreInfo").ToString()) %>' runat="server" />
                                        </ItemTemplate>


                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Created By" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreatedBy" Text='<%#(Eval("CreatedBy").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Created Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreatedDate" Text='<%#(Eval("CreatedDate").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                </Columns>

                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                            </asp:GridView>


                        </div>

                        <div style="padding-top: 20px;">
                        </div>
                    </div>

                </div>

            </asp:Panel>


            <cc1:ModalPopupExtender ID="mpAdminRemarks" runat="server" PopupControlID="pnlAdminRemarks" TargetControlID="btnCloseAdminRemarks"
                Enabled="true" CancelControlID="btnCloseAdminRemarks" DropShadow="true" BehaviorID="MPE25" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <div class="modal fade" id="mpOPPShowhistory" tabindex="-1" role="dialog" aria-labelledby="exampleModellabel">
     <div class="modal-dialog" role="document">
         <div class="modal-content" style="width: 314%; right: 107%;">
             <div class="modal-header">
                 <h3 class="modal-title" id="h5">History</h3>
                 <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                 </button>
             </div>
             <div class="card-body" style="margin-top: -2%;">
                 <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                     <ul class="nav nav-tabs" role="tablist">

                         <li class="nav-item">
                             <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPMoreInfo" aria-controls="tab-OPPMoreInfo" aria-selected="false">More Information</button>
                         </li>
                         <li class="nav-item">
                             <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPSalesAssistantUpdate" aria-controls="tab-OPPSalesAssistantUpdate" aria-selected="false">Sales Assistant Update</button>
                         </li>
                         <li class="nav-item">
                             <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPSalesmanUpdate" aria-controls="tab-OPPSalesmanUpdate" aria-selected="false">Salesman Update</button>
                         </li>
                         <li class="nav-item">
                             <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPAdminHistory" aria-controls="tab-OPPAdminHistory" aria-selected="false">History</button>
                         </li>
                         <li class="nav-item">
                             <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPAdminRemarks" aria-controls="tab-OPPAdminRemarks" aria-selected="false">Admin History</button>
                         </li>
                         <li class="nav-item">
                             <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-RequestLostDetails" aria-controls="tab-RequestLostDetails" aria-selected="false">Request Lost Details</button>
                         </li>

                     </ul>


                     <div class="tab-content">
                         <div class="tab-pane fade" id="tab-OPPSalesAssistantUpdate" role="tabpanel">

                             <div class="" style="margin-top: 1%;">

                                 <table class="table table-bordered table-striped OPP-SUpdate-table">



                                     <thead>
                                         <tr>
                                             <%--  <th>Id</th>--%>
                                             <th>OverView</th>
                                             <th>Remarks</th>
                                             <th>Win Perc.</th>
                                             <th>UpdatedBy</th>
                                             <th>Updated Date</th>
                                             <%--  <th>Status</th>--%>
                                         </tr>
                                     </thead>


                                     <tbody class="tbody-OPPSupdate">
                                     </tbody>
                                 </table>
                             </div>
                         </div>


                         <div class="tab-pane fade" id="tab-OPPSalesmanUpdate" role="tabpanel">

                             <div class="" style="margin-top: 1%;">

                                 <table class="table table-bordered table-striped OPP-SMUpdate-table">


                                     <thead>
                                         <tr>
                                             <%--  <th>Id</th>--%>
                                             <th>OverView</th>
                                             <th>Remarks</th>
                                             <th>Win Perc.</th>
                                             <th>UpdatedBy</th>
                                             <th>Updated Date</th>
                                             <%--<th>Status</th>--%>
                                         </tr>
                                     </thead>


                                     <tbody class="tbody-OPPSManUpdates">
                                     </tbody>
                                 </table>
                             </div>
                         </div>



                         <div class="tab-pane fade" id="tab-OPPAdminHistory" role="tabpanel">

                             <div class="" style="margin-top: 1%;">

                                 <table class="table table-bordered table-striped OPP-AdminHistory-table">


                                     <thead>
                                         <tr>
                                             <%--<th>Id</th>--%>
                                             <th>Name</th>
                                             <th>Salesman</th>
                                             <th>Sales Stage</th>
                                             <%-- <th>Status</th> --%>
                                             <th>Updated By</th>
                                             <th>Updated Date</th>
                                             <%--<th>Status</th>--%>
                                         </tr>
                                     </thead>


                                     <tbody class="tbody-OPPAdminHistory">
                                     </tbody>
                                 </table>
                             </div>
                         </div>


                         <div class="tab-pane fade show active" id="tab-OPPMoreInfo" role="tabpanel">

                             <div class="" style="margin-top: 1%;">

                                 <table class="table table-bordered table-striped OPP-MoreInfo-table">


                                     <thead>
                                         <tr>
                                             <%--<th>Id</th>--%>
                                             <th>Created By</th>
                                             <th>Created Date</th>
                                             <th>Sales Stage</th>
                                             <th>Last Updated By</th>
                                             <th>Last Updated Date</th>
                                             <%--<th>Status</th>--%>
                                         </tr>
                                     </thead>


                                     <tbody class="tbody-OPPmoreinfo">
                                     </tbody>
                                 </table>
                             </div>
                         </div>



                         <div class="tab-pane fade" id="tab-OPPAdminRemarks" role="tabpanel">

                             <div class="" style="margin-top: 1%;">
                                 <%--  <a href="#" id="btnAddAdminRemarks" style="float:right;"><i class="fa fa-plus" aria-hidden="true" style="font-size: 50px;color:green" title="Add Information"></i></a>--%>


                                 <table class="table table-bordered table-striped OPP-AdminRemarks-table">


                                     <thead>
                                         <tr>
                                             <%--<th>Id</th>--%>
                                             <th style="display: none;">RefNo</th>
                                             <th>Remarks</th>
                                             <th>Update By</th>
                                             <th>Updated Date</th>
                                             <th style="display: none;">URL</th>
                                             <th>Attatchment</th>
                                             <%--<th>Status</th>--%>
                                         </tr>
                                     </thead>


                                     <tbody class="tbody-OPPadminRemarks">
                                     </tbody>
                                 </table>
                             </div>
                         </div>

                         <div class="tab-pane fade" id="tab-RequestLostDetails" role="tabpanel">
                             <div class="" style="margin-top: 1%;">

                                 <table class="table table-bordered table-striped OPP-Quotation-table">


                                     <thead>
                                         <tr>
                                             <th>Owner Type</th>
                                             <th>Updated By</th>
                                             <th>Lost Reason</th>
                                             <th>Lost Date</th>
                                             <th>Competitor</th>
                                             <th>Competitor Price</th>
                                             <th>Updated Date</th>
                                             <th>Remarks</th>

                                         </tr>
                                     </thead>

                                     <tbody class="tbody-RequestLostDetails">
                                     </tbody>
                                 </table>
                             </div>
                         </div>


                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>    
            <asp:Panel ID="pnlAdminRemarks" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

                <div style="border-radius: 50px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 60%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 20%; top: 64.5px; border: solid; border-color: silver; padding-bottom: 20px">
                    <div class="row" style="height: 55px">

                        <div class="pull-left" style="border-radius: 50px !important; padding-left: 20px;">
                            <img src="../masters/images/ec.png" style="height: 30px;" />
                            <img src="../masters/images/ec1.png" style="height: 50px;" />

                        </div>
                        <div>
                        </div>
                    </div>

                    <div class="modal-header panl14" style="font-family: system-ui;">

                        <div class="pull-left">

                            <h4>
                                <asp:Label ID="Label77" class="subpnlhdg" runat="server" Text="Admin Remarks"></asp:Label>

                            </h4>

                        </div>


                        <div class="pull-right">
                            <button type="button" class="btn btn-close" aria-label="Close" runat="server" id="btnCloseAdminRemarks" />
                            <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>
                    <div class="popupmaxheight">
                        <table class="table table-condensed" style="width: 100%">

                            <tr>

                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label78" runat="server" Text="Admin Remarks"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtAdminRemarks" CssClass="textBox1 form-control" runat="server" />
                                </td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:LinkButton ID="btnSaveAdminRemakrs" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnSaveAdminRemakrs_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
                                </td>

                            </tr>




                        </table>


                        <div id="Div4" runat="server" style="overflow-y: auto; height: calc(100vh - 500px); overflow-x: hidden">
                            <asp:GridView ID="gdvAdminRemarksHistory" runat="server" AutoGenerateColumns="False"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Admin Remarks" ItemStyle-Width="25%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAdminHistory" Text='<%#(Eval("AdminHistory").ToString()) %>'
                                                runat="server" />

                                        </ItemTemplate>

                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Update Date" ItemStyle-Width="12%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                                        <ItemTemplate>
                                            <asp:Label ID="lblUpdateDate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="12%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUpdatedBy" Text='<%#(Eval("UpdatedBy").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                    </asp:TemplateField>



                                </Columns>

                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                            </asp:GridView>


                        </div>

                        <div style="padding-top: 20px;">
                        </div>

                    </div>

                </div>

            </asp:Panel>

    



            <div class="modal fade" id="ConfirmActivityPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973; padding-bottom: 15%;">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <div class="modal-body" style="text-align: center;">
                            <div><i class="bx bx bx-check-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b; color: #0dcb0d;"></i></div>
                            <div>
                                <h3>Are you sure?</h3>
                            </div>
                            Do You Really Want To Verify All The Details Regarding of This Opportunity
                        </div>
                        <div class="modal-footer">
                            <div style="margin-right: 165px;">
                                <asp:LinkButton ID="btnNo" runat="server" class="btn btn-secondary" data-bs-dismiss="modal">NO</asp:LinkButton>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="mpShowhistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 300%; right: 100%;">
                        <div class="modal-header">
                            <h3 class="modal-title" id="H1">History</h3>
                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                            </button>
                        </div>
                        <div class="modal-body">


                            <asp:GridView ID="gdvHistory" runat="server" AutoGenerateColumns="False"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductType" Text='<%#(Eval("ProductType").ToString()) %>'
                                                runat="server" />

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Rvenue Status" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRevenueStatus" Text='<%#(Eval("RevenueStatus").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSubStage" Text='<%#(Eval("SubStage").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub Stage Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSubStageDate" Text='<%#(Eval("SubStageDate").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CRM Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCRMRemarks" Text='<%#(Eval("CRMRemarks").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quotation No" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQuotationNo" Text='<%#(Eval("QuotationNo").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quotation Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQuotationDate" Text='<%#(Eval("QuotationDate").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Revenue Amount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFORMATVALUE" Text='<%#(Eval("FORMATVALUE").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Updated BY" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLastUpdatedBy" Text='<%#(Eval("LastUpdatedBy").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLastUpdateDate" Text='<%#(Eval("LastUpdateDate").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>

                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                            </asp:GridView>

                        </div>

                    </div>
                </div>
            </div>

 

            <div class="modal fade" id="mpOthersUpdates" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 300%; right: 100%;">
                        <div class="modal-header">
                            <h3 class="modal-title" id="H2">Others Updates</h3>
                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                            </button>
                        </div>
                        <div class="modal-body">

                            <asp:GridView ID="gdvfinalpriceUpdate" runat="server" EmptyDataText="No Other Updates Found.." AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Salesman Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSOverview" Text='<%#(Eval("SalesmanOverview").ToString()) %>'
                                                runat="server" />

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSRemarks" Text='<%#(Eval("SalesmanRemarks").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Salesman Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSWinPerc" Text='<%#(Eval("SalesmanWinPerc").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Salesman Update Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSUpdatedDate" Text='<%#(Eval("SalesmanUpdateDate").ToString()) %>'
                                                runat="server" />

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sales Manager Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanagerUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSMOverview" Text='<%#(Eval("SMOverview").ToString()) %>'
                                                runat="server" />

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sales Manager Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanagerUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSMRemarks" Text='<%#(Eval("SMRemarks").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sales Manager Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanagerUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSMWinPerc" Text='<%#(Eval("SMWinPerc").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sales Manager Update Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanagerUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSMUpdatedDate" Text='<%#(Eval("SMUpdatedDate").ToString()) %>'
                                                runat="server" />

                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Marketing  Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="marketingUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblMTOverview" Text='<%#(Eval("MTOverview").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Marketing Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="marketingUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblMTRemarks" Text='<%#(Eval("MTRemarks").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Marketing Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="marketingUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblMTWinPerc" Text='<%#(Eval("MTWinPerc").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Marketing Update Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="marketingUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblMTUpdateDate" Text='<%#(Eval("MTUpdateDate").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                </Columns>

                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                                <SelectedRowStyle CssClass="GridRowOver" />
                                <EditRowStyle />
                                <AlternatingRowStyle CssClass="GridAltItem" />
                                <PagerSettings Mode="NextPreviousFirstLast" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                            </asp:GridView>




                        </div>

                    </div>
                </div>
            </div>  


            
       
        </ContentTemplate>



        <Triggers>
            <asp:PostBackTrigger ControlID="btnExport" />
        </Triggers>

    </asp:UpdatePanel>

    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>

            <asp:Panel ID="pnlBackGround1" runat="server" CssClass="popup-div-background" Style="z-index: 1000001">
                <div class="CenterPB" style="height: 40px; width: 60px;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Icons/loader.gif" Height="35px"
                        Width="35px" />
                    Loading ...
                </div>
            </asp:Panel>


        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
