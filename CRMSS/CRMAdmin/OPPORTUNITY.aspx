<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="OPPORTUNITY.aspx.cs" Inherits="CRMAdmin_OPPORTUNITY"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    
        <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
   
   
    <script src="../CRMAdmin/Script/opt.js?v=1.9"></script>
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
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

      <script type="text/javascript">

<!--
    function Check_Click1(objRef) {
        //Get the Row based on checkbox
        var row = objRef.parentNode.parentNode;

        //Get the reference of GridView
        var GridView = row.parentNode;

        //Get all input elements in Gridview
        var inputList = GridView.getElementsByTagName("input");

        for (var i = 0; i < inputList.length; i++) {
            //The First element is the Header Checkbox
            var headerCheckBox = inputList[0];

            //Based on all or none checkboxes
            //are checked check/uncheck Header Checkbox
            var checked = true;
            if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                if (!inputList[i].checked) {
                    checked = false;
                    break;
                }
            }
        }
        headerCheckBox.checked = checked;

    }
    function checkAll1(objRef, cellIndex) {

        var GridView = objRef.parentNode.parentNode.parentNode;
        var inputList = GridView.getElementsByTagName("input");

        for (var i = 0; i < inputList.length; i++) {
            if ((inputList[i].parentNode.cellIndex) == cellIndex) {
                var row = inputList[i].parentNode.parentNode;
                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                    if (objRef.checked) {
                        inputList[i].checked = true;
                    }
                    else {

                        inputList[i].checked = false;
                    }
                }
            }
        }
    }

    function checkAll2(objRef, cellIndex) {

        var GridView = objRef.parentNode.parentNode.parentNode;
        var inputList = GridView.getElementsByTagName("input");

        for (var i = 0; i < inputList.length; i++) {
            if ((inputList[i].parentNode.cellIndex) == cellIndex) {
                var row = inputList[i].parentNode.parentNode;
                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                    if (objRef.checked) {
                        inputList[i].checked = true;
                    }
                    else {

                        inputList[i].checked = false;
                    }
                }
            }
        }
    }


      </script>
    <title>Opportunity</title>
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


                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (evt, args) {
                    $('.ddlcc').on('change', function () {

                        let s = "test";
                        Country = $('#ddlc option:selected').val();
                        cityDDL();

                    });
                    $('#btnAddContactInfo').on('click', function () {
                        AddContact();
                        hidebg();
                       

                    });

                    $('.tbody-Contact').on('click', 'tr', function () {
                        contId = this.children[0].textContent;
                        SetOptContact();
                        $('#ContentPlaceHolder1_btnContact').trigger('click');
                    });
                    $('#btnNewContact').on('click', function () {
                        $('#ModalContact').modal('hide');
                        setDet();
                        $('#mpContact').modal('show');
                    
                    })

                    $('#ddlSubStatus').on('change', function () {
                        Status = $('#ddlSubStatus option:selected').val().trim();
                      
                    });

                    $('#ddlSubSalesStage').on('change', function () {
                        SalesStage = $('#ddlSubSalesStage option:selected').val().trim();
               
                    });

                    $('#btnAddSubRev').on('click', function () {
                        AddSubRevenue();
                       

                    });

                    $('.tbody-SubRevenue').on('click', '.EditDet', function () {

                        SubRevId = this.parentNode.parentNode.parentNode.children[0].textContent;
                        Amount = this.parentNode.parentNode.parentNode.children[2].textContent;
                        Status = this.parentNode.parentNode.parentNode.children[3].textContent;
                        SalesStage = this.parentNode.parentNode.parentNode.children[4].textContent;
                        SubREvRemarks = this.parentNode.parentNode.parentNode.children[5].textContent;
                      
                        $('#txtAmount').val(Amount);
                        $('#ddlSubSalesStage').val(SalesStage);
                        $('#ddlSubStatus').val(Status);
                        $('#txtSubRemarks').val(SubREvRemarks);


                    });

                    $('#btnAddNewRev').on('click', function () {

                        ClearBasicDet();    

                    });

                    $('#btnSubmitReq').on('click', function () {
                        SubmitRequest();

                    });

                    //$(".con-tooltip").addClass(function () {
                    //    return $(this).attr("ToolTip");
                    //});
                 

                    //$("#ContentPlaceHolder1_txtMarketingEdit").title({
                    //    classes: {
                    //        "ui-tooltip": ".con-tooltip"
                    //    }
                    //});

             


                });




            </script>
      

            <div class="GridviewDiv" id="pnlSummaryView" runat="server">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                    <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <h3>
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="OPPORTUNITY"></asp:Label>
                                <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
                                <asp:HiddenField ID="hfdOptId" runat="server" />
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

                                <asp:LinkButton ID="lbkAddNewOpp" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbkAddNewOpp_Click"
                                    runat="server"><i class="fa fa-plus" aria-hidden="true" title="Add New Opportunity"></i></asp:LinkButton>
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
                                <asp:Panel runat="server" ID="pnlOptClose" Style="padding-top: 5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            OPT # 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:TextBox ID="txtOptNumber" CssClass="form-control textBox1" runat="server" ForeColor="Black"></asp:TextBox>
                                        </div>
                                        <div style="width: 5%">
                                            <asp:Button ID="btnOptPnlClose" runat="server" CssClass="btn btn-close" Style="padding: 10px 0px;" OnClick="btnOptPnlClose_Click"></asp:Button>
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
                                <asp:Panel runat="server" ID="pnlSalesman" Style="padding-top: 5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            Salesman 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlSalesmanSearch" CssClass="form-control textBox1" runat="server" ForeColor="Black" Style="max-width: 100%"></asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                            <asp:Button ID="btnSalesmanSearchClose" runat="server" CssClass="btn btn-close" Style="padding: 10px 0px;" OnClick="btnSalesmanSearchClose_Click"></asp:Button>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlContractor" Style="padding-top: 5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            Contractor 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:TextBox ID="txtContractor" CssClass="form-control textBox1" runat="server" ForeColor="Black"></asp:TextBox>
                                        </div>
                                        <div style="width: 5%">
                                            <asp:Button ID="btnContractClose" runat="server" CssClass="btn btn-close" Style="padding: 10px 0px;" OnClick="btnContractClose_Click"></asp:Button>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlConsultant" Style="padding-top: 5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            Consultant 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:TextBox ID="txtConsultant" CssClass="form-control textBox1" runat="server" ForeColor="Black"></asp:TextBox>
                                        </div>
                                        <div style="width: 5%">
                                            <asp:Button ID="btnConsultantClose" runat="server" CssClass="btn btn-close" Style="padding: 10px 0px;" OnClick="btnConsultantClose_Click"></asp:Button>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlPlot" Style="padding-top: 5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            Plot # 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:TextBox ID="txtPlot" CssClass="form-control textBox1" runat="server" ForeColor="Black"></asp:TextBox>
                                        </div>
                                        <div style="width: 5%">
                                            <asp:Button ID="btnPlotClose" runat="server" CssClass="btn btn-close" Style="padding: 10px 0px;" OnClick="btnPlotClose_Click"></asp:Button>
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
                                            </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                            <asp:Button ID="btnStatusClose" runat="server" CssClass="btn btn-close" Style="padding: 10px 0px;" OnClick="btnStatusClose_Click"></asp:Button>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlSubStage" Style="padding-top: 5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            SalesSatge  
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlSalesStageSearch" CssClass="form-control textBox1" runat="server" ForeColor="Black">
                                            </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                            <asp:Button ID="btnSubstageClose" runat="server" CssClass="btn btn-close" Style="padding: 10px 0px;" OnClick="btnSubstageClose_Click"></asp:Button>
                                        </div>
                                    </div>
                                </asp:Panel>

                                  <asp:Panel runat="server" ID="PnlVerify" Style="padding-top: 5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            Verification Status  
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlVeriy" CssClass="form-control textBox1" runat="server" ForeColor="Black">
                                                <asp:ListItem Text="All" Value="-1"></asp:ListItem>
                                                <asp:ListItem Text="Verified" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Not Verified" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                            <asp:Button ID="btnVerification" runat="server" CssClass="btn btn-close" Style="padding: 10px 0px;"></asp:Button>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <asp:Panel runat="server" ID="Panel4" Style="padding-top: 5px">
                                    <div class="row">

                                        <div style="width: 100%">
                                            <div class="pull-left">
                                                <asp:DropDownList ID="ddlNewField" CssClass="form-control textBox1" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlNewField_SelectedIndexChanged" Style="align-items: center">

                                                    <asp:ListItem Text="ADD FIELD" Value="ADD" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Opportunity" Value="Opportunity"></asp:ListItem>
                                                    <asp:ListItem Text="Company" Value="Company"></asp:ListItem>
                                                    <asp:ListItem Text="Salesman" Value="Salesman"></asp:ListItem>
                                                    <asp:ListItem Text="Contractor" Value="Contractor"></asp:ListItem>
                                                    <asp:ListItem Text="Consultant" Value="Consultant"></asp:ListItem>
                                                    <asp:ListItem Text="Plot" Value="Plot"></asp:ListItem>
                                                    <asp:ListItem Text="Status" Value="Status"></asp:ListItem>

                                                    <asp:ListItem Text="SalesStage" Value="SubStage"></asp:ListItem>
                                                    <asp:ListItem Text="Verify" Value="Verify"></asp:ListItem>



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
                                    <asp:GridView ID="gdvSummaryUpdates" runat="server" AutoGenerateColumns="False"
                                        OnSorting="gdvSummaryUpdates_Sorting"
                                        OnRowCommand="gdvSummaryUpdates_RowCommand"
                                        CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                                        class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Opportunity Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOptNumber" Text='<%#(Eval("OpportunityNumber").ToString()) %>'
                                                        runat="server" />
                                                    <asp:HiddenField ID="hfdOptNumber" Value='<%#(Eval("OpportunityNumber").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" />

                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Name" ItemStyle-Width="15%" Visible="True" SortExpression="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOptName" Text='<%#(Eval("Name").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MEP Contractor" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="MEPContractor">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMEPContractor" Text='<%#(Eval("MEPContractor").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Salesman" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="Owner">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSalesman" Text='<%#(Eval("Owner").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Consultant" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="MEPConsultant">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblConsultant" Text='<%#(Eval("MEPConsultant").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>

                                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Open Value" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="OPENVALUESORT">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOPENVALUE" Text='<%#(Eval("OPENVALUE").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>

                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sales Stage Name" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="SalesStageName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSalesStageName" Text='<%#(Eval("SalesStageName").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>

                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="StatusCode">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatusCode" Text='<%#(Eval("StatusCode").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>

                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="View">
                                                <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                                <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lblView" runat="server" Text='' CommandName="View" CssClass="btn rounded-pill btn-icon btn-round"
                                                        CommandArgument='<%#Eval("OpportunityNumber")%>' Style="text-align: center"><i class="fa fa-eye" title="View"></i></asp:LinkButton>
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

                                    <div class="row">
                                        <asp:Button runat="server" ID="btnLoadMoreSummary" OnClick="btnLoadMoreSummary_Click" Width="100%" Text="Load More"></asp:Button>
                                    </div>
                                </div>
                                <div id="WarningPopup" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form>

                                                <div class="modal-body">
                                                    <h4 class="modal-title" style="color: red; font-size: large; text-align-last: center;">
                                                        <asp:Label ID="lblPopupWarning" runat="server" Text="Overview Should be Under Risk if Win percentage is below 70 "></asp:Label>
                                                    </h4>

                                                </div>
                                                <div class="modal-footer" style="padding-left: 45%;">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="OK">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <%-- Others details popup --%>
                            </div>
                        </div>


                        <%-- End others popup --%>
                    </div>


                </div>


            </div>
                <div class="modal fade" id="mpOthersUpdates" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content" style="width: 300%;right: 100%;">
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
                <div class="modal fade" id="mpShowhistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="width: 300%;right: 100%;">
                                    <div class="modal-header">
                                        <h3 class="modal-title" id="H1">History</h3>
                                        <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                            
                                        </button>
                                    </div>
                                     <div class="card-body" style="margin-top: -2%;">
            <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <button type="button" id="btnPTOverview" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-PTOverview" aria-controls="tab-PTOverview" aria-selected="true">Product Team OverView</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Quotation" aria-controls="tab-Quotation" aria-selected="true">Quotation</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SalesmanUpdate" aria-controls="tab-SalesmanUpdate" aria-selected="false">Salesman Update</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SalesmanagerUpdate" aria-controls="tab-SalesmanagerUpdate" aria-selected="false">Salesmanager Update</button>
                    </li>
                      <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-MarketingUpdate" aria-controls="tab-MarketingUpdate" aria-selected="false">Marketing Update</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-AdminHistory" aria-controls="tab-AdminHistory" aria-selected="false">Admin History</button>
                    </li>

                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-MoreInfo" aria-controls="tab-MoreInfo" aria-selected="false">More Information</button>
                    </li>

                     
                    

                  </ul> 

                <div class="tab-content">

                    <div class="tab-pane fade show active" id="tab-PTOverview" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-PTOverview-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                        <th>Confirmation</th>
                                        <th>OverView</th>
                                        <th>Remarks</th>
                                        <th>Win Perc.</th>
                                        <th>UpdatedBy</th>
                                        <th>Updated Date</th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-PTOverView">
                                </tbody>
                            </table>
                        </div>
                    </div>



                <div class="tab-pane fade" id="tab-Quotation" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-Quotation-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                       <th>Product Type</th>
                                        <th>Quotation.No</th>
                                        <th>Quotation Date</th>
                                        <th>Revenue Amount</th>
                                        <th>UpdatedBy</th>
                                        <th>UpdatedDate</th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-Quotation">
                                </tbody>
                            </table>
                        </div>
                    </div>




                     <div class="tab-pane fade" id="tab-SalesmanUpdate" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-SUpdate-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                       <th>OverView</th>
                                        <th>Remarks</th>
                                        <th>Win Perc.</th>
                                        <th>UpdatedBy</th>
                                        <th>Updated Date</th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-Supdate">
                                </tbody>
                            </table>
                        </div>
                    </div>


                    <div class="tab-pane fade" id="tab-SalesmanagerUpdate" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-SMUpdate-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                       <th>OverView</th>
                                        <th>Remarks</th>
                                        <th>Win Perc.</th>
                                        <th>UpdatedBy</th>
                                        <th>Updated Date</th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-SMUpdates">
                                </tbody>
                            </table>
                        </div>
                    </div>



                     <div class="tab-pane fade" id="tab-MarketingUpdate" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-MUpdate-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                        <th>OverView</th>
                                        <th>Remarks</th>
                                        <th>Win Perc.</th>
                                        <th>UpdatedBy</th>
                                        <th>Updated Date</th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-MKTUpdates">
                                </tbody>
                            </table>
                        </div>
                    </div>



                     <div class="tab-pane fade" id="tab-AdminHistory" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-AdminHistory-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                        <th>Product Type</th>
                                        <th>Status</th>
                                        <th>SubStage</th>
                                        <th>Remarks</th>
                                        <th>Quotation.No</th>
                                        <th>Quotation Date</th>
                                        <th>SO.No</th>
                                        <th>SO Date</th>
                                        <th>Amount</th>
                                        <th>UpdatedBy</th>
                                        <th>UpdatedDate</th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-AdminHistory">
                                </tbody>
                            </table>
                        </div>
                    </div>

                    
                     <div class="tab-pane fade" id="tab-MoreInfo" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-MoreInfo-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                        <th>Company</th>
                                        <th>Product Type</th>
                                        <th>Status</th>
                                        <th>Creation Date</th>
                                        <th>Remarks</th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-moreinfo">
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


            <div class="modal fade" id="mpOPPShowhistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                    <%-- <li class="nav-item">
                        <button type="button" id="btnPTOverview" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-PTOverview" aria-controls="tab-PTOverview" aria-selected="true">Product Team OverView</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Quotation" aria-controls="tab-Quotation" aria-selected="true">Quotation</button>
                    </li>--%>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPMoreInfo" aria-controls="tab-OPPMoreInfo" aria-selected="false">More Information</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPSalesmanUpdate" aria-controls="tab-OPPSalesmanUpdate" aria-selected="false">Salesman Update</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPSalesmanagerUpdate" aria-controls="tab-OPPSalesmanagerUpdate" aria-selected="false">Salesmanager Update</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPMarketingUpdate" aria-controls="tab-OPPMarketingUpdate" aria-selected="false">Marketing Update</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPAdminHistory" aria-controls="tab-OPPAdminHistory" aria-selected="false">History</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPMajorInfo" aria-controls="tab-OPPMajorInfo" aria-selected="false">Major Information</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPAdminRemarks" aria-controls="tab-OPPAdminRemarks" aria-selected="false">Admin History</button>
                                    </li>
                                     <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Attatchment" aria-controls="tab-Attatchment" aria-selected="false">Attachment</button>
                                    </li>

                                     <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Requests" aria-controls="tab-Requests" aria-selected="false">Status Requests</button>
                                    </li>





                                </ul>

                                <div class="tab-content">

                                    <%-- <div class="tab-pane fade show active" id="tab-PTOverview" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-PTOverview-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                    <%--<th>OverView</th>
                                        <th>Remarks</th>
                                        <th>Win Perc.</th>
                                        <th>UpdatedBy</th>
                                        <th>Updated Date</th>--%>
                                    <%--<th>Status</th>--%>


                                    <%-- </tr>
                                </thead>


                                <tbody class="tbody-PTOverView">
                                </tbody>
                            </table>
                        </div>
                    </div>--%>



                <div class="tab-pane fade" id="tab-Requests" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-Quotation-table">


                                <thead>
                                    <tr>
                                        <th>Sales Stage </th>
                                        <th>Status</th>
                                        <th>Request Status</th>
                                        <th>CreatedBy</th>
                                        <th>Created Date</th>
                                        <th>UpdatedBy</th>
                                        <th>Updated Date</th>
                                        <th>Request Remarks</th>
                                        <th>Action Remarks</th>
                                    

                                     </tr>
                                </thead>


                                <tbody class="tbody-Request">
                                </tbody>
                            </table>
                        </div>
                    </div>




                                    <div class="tab-pane fade" id="tab-OPPSalesmanUpdate" role="tabpanel">

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


                                    <div class="tab-pane fade" id="tab-OPPSalesmanagerUpdate" role="tabpanel">

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


                                                <tbody class="tbody-OPPSMUpdates">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>



                                    <div class="tab-pane fade" id="tab-OPPMarketingUpdate" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped OPP-MUpdate-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th>OverView</th>
                                                        <th>Remarks</th>
                                                        <th>Win Perc.</th>
                                                        <th>UpdatedBy</th>
                                                        <th>Updated Date</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-OPPMKTUpdates">
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
                                                        <th>Developer Client</th>
                                                        <th>Developer Owner</th>
                                                        <th>Main Contractor</th>
                                                        <th>MEP Contractor</th>
                                                        <th>MEP Consultant</th>
                                                        <th>Salesman</th>
                                                        <th>SalesStage</th>
                                                        <th>Status</th>
                                                        <th>UpdatedBy</th>
                                                        <th>UpdatedDate</th>
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
                                                        <th style="display:none;">Company</th>
                                                        <th>CreatedBy</th>
                                                        <th>Creation Date</th>
                                                        <th>SalesStage</th>
                                                        <th style="display:none;">Project.No</th>
                                                        <th style="display:none;">Plot</th>
                                                        <th>Stage Date</th>
                                                        <th>Status Date</th>
                                                        <th>Last UpdatedBy</th>
                                                        <th>Last Updated Date</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-OPPmoreinfo">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>



                                    <div class="tab-pane fade" id="tab-OPPMajorInfo" role="tabpanel">

                                        <div style="margin-top: 1%;">
                                            <%--<a href="#" id="btnbtn" style="float:right;"><i class="fa fa-plus" aria-hidden="true" style="font-size: 50px;color:green" title="Add Information"></i></a>--%>

                                            <asp:LinkButton ID="btnAddMjInfo" runat="server" Style="text-align: center; float: right; margin-top: -3%;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnAddMjInfo_Click"><i class="fa fa-plus" title="Major Info"></i></asp:LinkButton>

                                        </div>
                                        <div class="" style="margin-top: 1%;">
                                            <table class="table table-bordered table-striped OPP-MajorInfo-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                         <th style="display:none;">RefNo</th>
                                                        <th>Type</th>
                                                        <th>Source of Info</th>
                                                        <th>Source Name</th>
                                                        <th>More Information</th>
                                                        <th>CreatedBy</th>
                                                        <th>Created Date</th>
                                                        <th style="display:none;">URL</th>
                                                        <th>Attatchment</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-OPPmajorInfo">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>




                                    <div class="tab-pane fade" id="tab-OPPAdminRemarks" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">
                                            <%--  <a href="#" id="btnAddAdminRemarks" style="float:right;"><i class="fa fa-plus" aria-hidden="true" style="font-size: 50px;color:green" title="Add Information"></i></a>--%>

                                            <asp:LinkButton ID="btnAddAdminRemarks" runat="server" Style="text-align: center; float: right; margin-top: -3%;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnAddAdminRemarks_Click"><i class="fa fa-plus" aria-hidden="true" title="Major Info"></i></asp:LinkButton>

                                            <table class="table table-bordered table-striped OPP-AdminRemarks-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th style="display:none;">RefNo</th>
                                                        <th>Remarks</th>
                                                        <th>UpdateBy</th>
                                                        <th>Updated Date</th>
                                                         <th style="display:none;">URL</th>
                                                        <th>Attatchment</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-OPPadminRemarks">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>


                                      <div class="tab-pane fade" id="tab-Attatchment" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped OPP-AdminHistory-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th style="display:none;">Ref.No</th>
                                                        <th>Instance Name</th>
                                                        <th>Comments</th>
                                                        <th style="display:none">URL</th>
                                                        <th>Download</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-Attatchment">
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
            


             <div class="modal fade" id="mpContact" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" oncancel="btnCloseContact" aria-hidden="true">
           <div class="modal-dialog" role="document">
               <div class="modal-content" style="width: 140%;right: 12%;">
                    <div class="modal-header">
                              <h3 class="modal-title" id="h6">Contact</h3>
                                   <button type="button" id="btnCloseContact" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                   </button>

                       

                     </div>
                <div class="card-body" style="margin-top: 0%;">
           

                    <table class="table table-condensed" style="width: 100%">
                            <tr> 
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label48" runat="server" Text="Name"></asp:Label>
                                    <asp:HiddenField ID="hfdMajorFileId" runat="server" />
                                    <asp:HiddenField ID="hfdRemarksFileId" runat="server" />
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <input type="text" id="txtCname" class="textBox1 form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label49" runat="server" Text="Job Title"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <input type="text" id="tctJobTitle" class="textBox1 form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label50" runat="server" Text="Gender"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <select class="form-select placement-dropdown" id="dlGender" >
                                    <option value="-1" selected>-- Select --</option>
                                    <option value="0">Male</option>
                                    <option value="1">Female</option>
                                   </select>
                                </td>
                            </tr>
                         <tr>
                                 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label55" runat="server" Text="Phone-Number"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <input type="text" id="txtPhoneNumber" class="textBox1 form-control" />
                                </td>
                            </tr>
                            <tr>
                                 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label51" runat="server" Text="E-mail"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <input type="text" id="txtEmail" class="textBox1 form-control" />
                                </td>
                            </tr>
                            <tr>
                                 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label52" runat="server" Text="Country"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                      <input type="text" id="txtCountry" class="textBox1 form-control" disabled />
                                </td>
                            </tr>
                            <tr>
                                 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label53" runat="server" Text="City"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <input type="text" id="txtCity" class="textBox1 form-control" disabled />
                                </td>
                            </tr>
                        <tr>
                            <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label54" runat="server" Text="Nationality"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <input type="text" id="txtNationality" class="textBox1 form-control" />
                                </td>
                        </tr>

                        </table>
                    <div class="modal-footer" style="margin-top:3%;">
                      <%-- <asp:LinkButton ID="lbAddContactInfo" runat="server" CssClass="btn rounded-pill btn-icon btn-round" Text="Add" OnClick="lbAddContactInfo_Click"></asp:LinkButton>--%>
                        <button type="button" id="btnAddContactInfo" class="btn btn-Style">Add</button>
                    </div>


             </div>
           </div>
        </div>
     </div>





                                    


        




               <cc1:ModalPopupExtender ID="mpAddNewOpportunit" runat="server" PopupControlID="pnlAddNewOPT" TargetControlID="btnCloseAddOPT"
                Enabled="true" CancelControlID="btnCloseAddOPT" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior31" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlAddNewOPT" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

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
                                <asp:Label ID="Label5" class="subpnlhdg" runat="server" Text="NEW OPPORTUNITY "></asp:Label>
                                 <asp:HiddenField ID="hfdNEWOPTNUMBER" runat="server" ></asp:HiddenField>
                            </h4>

                        </div>


                        <div class="pull-right">
                             <button type="button" class="btn btn-close"  aria-label="Close" runat="server" id="btnCloseAddOPT"/>
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>
					<div class="popupmaxheight">
						<table class="table table-condensed" style="width: 100%">

							<tr>
								<td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
									<asp:Label ID="Label23" runat="server" Text="Inquiry Type"></asp:Label>
                                    <asp:HiddenField ID="hfdOppHistory" runat="server" />

								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:DropDownList ID="ddlInquiryType" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlInquiryType_SelectedIndexChanged" AutoPostBack="true">

										<asp:ListItem Text="BOQ" Value="BOQ" Selected="True"></asp:ListItem>
										<asp:ListItem Text="Project Without Consultant" Value="Project Without Consultant"></asp:ListItem>
                                        <asp:ListItem Text="Budgetary" Value="Budgetary"></asp:ListItem>
                                        

									</asp:DropDownList>

								</td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label25" runat="server" Text="Name"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:TextBox ID="txtOptNameNO" CssClass="textBox1 form-control " runat="server" />
								</td>
								
							</tr>

							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label27" runat="server" Text="Customer"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lblCustomerSearchNO" runat="server" Text="" OnClick="lblCustomerSearchNO_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtCustomerNO" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdCustomerIDNo" runat="server" />
									</div>
								</td>
								<td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                	<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label9" runat="server" Text="Owner"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbSearchOwnerNO" runat="server" Text="" OnClick="lbSearchOwnerNO_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtOwnerNO" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdOwnerIDNO" runat="server" />
									</div>
								</td>

							</tr>

							
							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label10" runat="server" Text="Main Contract"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lblSearchMainContractorNO" runat="server" Text="" OnClick="lblSearchMainContractorNO_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtMainContrcatorNO" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdMainContractIDNO" runat="server" />
									</div>
								</td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label29" runat="server" Text="Status"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:TextBox ID="txtStatusCodeNO" runat="server" Text="OPEN" Enabled="false" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
								</td>



                               
							</tr>
							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label11" runat="server" Text="Main Contract owner"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbSearchMainContractOwnerNO" runat="server" Text="" OnClick="lbSearchMainContractOwnerNO_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtMainContractOwnerNO" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdMainContractOwnerIDNO" runat="server" />
									</div>
								</td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label28" runat="server" Text="Sales Stage Name"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:TextBox ID="txtSalesStageNO" runat="server" Text="J.O.H" Enabled="false" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
								</td>
							</tr>
							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label12" runat="server" Text="Developer Client"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbSearchDeveloperClientNO" runat="server" Text="" OnClick="lbSearchDeveloperClientNO_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtDeveloperClientNO" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdDeveloperClientIDNO" runat="server" />
									</div>
								</td>
                                  <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label36" runat="server" Text="Products"></asp:Label>
								</td>
								<td rowspan="5" style="padding: 3px 5px; width: 5%; vertical-align: baseline;" class="label-alignment no-border">
									<asp:CheckBoxList runat="server" ID="chkProduct" CssClass="form-control chkboxlistlabel"></asp:CheckBoxList>
								</td>
							</tr>
							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label14" runat="server" Text="Developer Owner"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbSearchDeveloperOwnerNO" runat="server" Text="" OnClick="lbSearchDeveloperOwnerNO_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtDeveloperOwnerNO" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdDeveloperOwnerIDNO" runat="server" />
									</div>
								</td>
							</tr>
							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label24" runat="server" Text="Client"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:TextBox ID="txtClientNo" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
								</td>
							</tr>
							<asp:Panel ID="pnloptprojectwithnoconsultant" runat="server" Visible="false">
								<tr>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label30" runat="server" Text="Scale"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCRMScale" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label31" runat="server" Text="Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlType" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label33" runat="server" Text="Sub Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlSubType" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label32" runat="server" Text="Construction Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCRMConstruction" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
								</tr>
                                 <tr>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label44" runat="server" Text="Country"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCountryNO" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlCountryNO_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
									</td>
                                    </tr>
                                     <tr>

								 
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label45" runat="server" Text="City"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCityNO" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
                                     </tr>
							</asp:Panel>
						</table>

						

						<div style="padding-top: 20px;">
							<asp:LinkButton ID="lbSaveNewOpportunity" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSaveNewOpportunity_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
						</div>
					</div>

                </div>

            </asp:Panel>

            

          <cc1:ModalPopupExtender ID="mpSearch" runat="server" PopupControlID="pnlSearchDetails" TargetControlID="txtSearchDeatils"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior1" RepositionMode="RepositionOnWindowResizeAndScroll" 
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlSearchDetails"  AccessKey="s" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

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
                            <asp:Button ID="btnCloseSearchMPNew" OnClick="btnCloseSearchMPNew_Click" runat="server"   class="btn btn-close"/>
                        
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>
                  
                    <table class="table table-condensed" style="padding-top: 10px;">

                        <tr>
                            <td style="padding: 3px 5px; width: 10%;padding-top:10px" class="label-alignment no-border">
                                <asp:Label ID="Label35" runat="server" Text="Search By Name"></asp:Label>
                     
                            </td>
                            <td style="padding: 3px 5px; width: 90%;padding-top:10px" class="no-border">
                                <div class="pull-left">
                                 <asp:TextBox ID="txtSearchDeatils"  CssClass="textBox1 form-control " runat="server" />
                                    </div>
                                <div class="pull-left" style="padding-left:5px">
                                 <asp:LinkButton ID="lbSearchDetails" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSearchDetails_Click" 
                                                ><i class="fa fa-search" aria-hidden="true" title="Search"></i></asp:LinkButton>   
                                    </div>
                            </td>
                       
                        </tr>
           
               
                    </table>

                
                     <asp:HiddenField ID="hfdOper" runat="server"  />
                    <div style="padding-top: 10px;">
                             <asp:GridView ID="gdvSearchDetails" runat="server" AutoGenerateColumns="false" Width="100%"
                        CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"  OnRowCommand="gdvSearchDetails_RowCommand"
                        class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                        <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="5%" Visible="false">
                              
                                <ItemTemplate>
                                     <asp:HiddenField ID="hfdRefID" runat="server" Value='<%#Eval("RefId")%>' />
                                  <asp:LinkButton ID="lblUpdate" runat="server" Text=""  CommandArgument='<%#Eval("RefId")%>'
                                                CommandName="Select" Style="text-align: center"><i class="fa fa-bookmark" aria-hidden="true" title="Search"></i> </asp:LinkButton>
                                 
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField ItemStyle-Width="40%" ItemStyle-HorizontalAlign="Center">
                              
                                <ItemTemplate>
                                   
                                  <asp:LinkButton ID="lblName" runat="server" Text='<%#Eval("Name")%>'  Style="text-align: center"   CommandArgument='<%#Eval("RefId")%>'
                                                CommandName="Select"></asp:LinkButton>
                                 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="40%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                  <asp:Label ID="lblOwner" runat="server" Text='<%#Eval("Owner")%>'  Style="text-align: center"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                  <asp:Label ID="lblCompany" runat="server" Text='<%#Eval("Company")%>'  Style="text-align: center"></asp:Label>
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




                   <asp:Panel ID="pnlDetailView" runat="server" Visible="false">
             
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                           <asp:Panel ID="Panel3" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <div class="pull-left" >
                            <h3>
                                <asp:Label ID="Label8" ForeColor="White" Font-Bold="true" runat="server" Text="Opportunity Master"></asp:Label>
                                
                            </h3>
                                </div>
                             <div class="pull-right" >

                                  <asp:LinkButton ID="lbUpdateOPT" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbUpdateOPT_Click"
                                                ><i class="fa fa-save" aria-hidden="true" title="Update Opportunity Details"></i></asp:LinkButton>    

                              <asp:LinkButton ID="btnMore" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnMore_Click"
                                                ><i class="fa fa-ellipsis-h" aria-hidden="true" title="More Info"></i></asp:LinkButton>
                                 <%--<asp:Button ID="btnStartConv" runat="server" Text="Start Converstation" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnStartConv_Click" />--%>
                                 <asp:LinkButton ID="btnStartConv" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnStartConv_Click"
                                                ><i class="fa fa-comments" aria-hidden="true" title="Start Conversation"></i></asp:LinkButton>
                                 
                                <%--<asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn rounded-pill me-2 btn-primary" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnBack_Click" />--%>
                               <asp:LinkButton ID="btnBack" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnBack_Click"
                                                ><i class="fa fa-arrow-circle-left" aria-hidden="true" title="Go Back"></i></asp:LinkButton>   
                             </div>


                        </div>
                    </asp:Panel>
                         <div class="card-block">
                            <asp:Panel ID="Panel2" runat="server" CssClass="pnlsubheading">
                               
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label2" class="panel-heading" Style="color: white;" runat="server" Text="Opportunity Details"></asp:Label></h5>
                                 </div>
                               <%--  <div class="pull-right" style="margin-top: -9px;margin-right: 10px;">
                                      <asp:LinkButton ID="lbUpdateOPT" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbUpdateOPT_Click"
                                                ><i class="fa fa-save" aria-hidden="true" title="Update Opportunity Details"></i></asp:LinkButton>   

                                      <asp:LinkButton ID="btnAdminHistory" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnAdminHistory_Click"
                                             ><i class="fa fa-address-book" title="Admin Remarks"></i></asp:LinkButton>

                         


                                   <asp:LinkButton ID="btnMajorInfo" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnMajorInfo_Click">
                                       <i class="fa  fa-info-circle" title="Major Information"></i></asp:LinkButton>

                                 </div>--%>
                               
                             </asp:Panel>
                         

                       
							 <table class="table table-condensed" style="width: 100%">
							 <table class="table table-condensed" style="width: 100%;background-color:#e7e7e7;">

								 <tr>
									 <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
										 <asp:Label ID="Label37" runat="server" Text="Inquiry Type"></asp:Label>

									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
										 <asp:DropDownList ID="ddlInquiryTypeEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlInquiryTypeEdit_SelectedIndexChanged" AutoPostBack="true">

											 <asp:ListItem Text="BOQ" Value="BOQ" Selected="True"></asp:ListItem>
											 <asp:ListItem Text="Project Without Consultant" Value="Project Without Consultant"></asp:ListItem>
                                              <asp:ListItem Text="Project" Value="Project"></asp:ListItem>
                                               <asp:ListItem Text="Budgetary" Value="Budgetary"></asp:ListItem>

										 </asp:DropDownList>

									 </td>
                                      <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <asp:Panel runat="server" ID="pnlMoreProject">
										 <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">

											 <asp:Label ID="Label15" runat="server" Text="Project Number"></asp:Label>
										 </td>
										 <td style="padding: 3px 5px; width: 8%" class="no-border">
											 <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lblProjectNoEditSearch" runat="server" Text="" OnClick="lblProjectNoEditSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
												 <a href="#" runat="server" id="linkProject" target="_blank"> <asp:Label ID="txtProjectNumberEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false" style="min-height:38px;min-width:200px"></asp:Label></a>

											 </div>

										 </td>
										
										 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


										 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
											 <asp:Label ID="Label6" runat="server" Text="MEP Consultant"></asp:Label>
										 </td>
										 <td style="padding: 3px 5px; width: 8%" class="no-border">
											 <asp:TextBox ID="txtMEPConsultantEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                              <asp:HiddenField ID="hfdMEPConsultantIdEdit" runat="server" />
										 </td>
                                          <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
										 <td style="padding: 3px 5px;" class="label-alignment no-border">
											 <asp:Label ID="Label1" runat="server" Text="Marketing"></asp:Label>
										 </td>
										 <td style="padding: 3px 5px;" class="no-border">
                             
											 <asp:TextBox ID="txtMarketingEdit" runat="server" CssClass="textBox1 form-control" Font-Bold="True" TabIndex="2" ToolTip="123" Enabled="false"></asp:TextBox></a>
                                              <asp:HiddenField ID="hfdMarketingIDEdit" runat="server" />

										 </td>
									 </asp:Panel>
									 
                                     </tr>
                                 <tr>
									 
				
									 <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
										 <asp:Label ID="Label19" runat="server" Text="Opportunity Number"></asp:Label>
								
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">

										 <asp:TextBox ID="txtOptNo" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label20" runat="server" Text="Name"></asp:Label>
                                         <asp:HiddenField ID="hfdCountry" runat="server" />
                                         <asp:HiddenField ID="hfdCity" runat="server" />
									 </td>

									 <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtName" runat="server" CssClass="textBox1 form-control " Enabled="false" Font-Bold="True"></asp:TextBox>
									 </td>
									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label16" runat="server" Text="Developer Client"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
                                          <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lblDeveloperClientEditSearch" runat="server" Text="" OnClick="lblDeveloperClientEditSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
												 <asp:TextBox ID="txtDeveloperClientEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                               <asp:HiddenField ID="hfdDeveloperClientIDEdit" runat="server" />
											 </div>
										
									 </td>
                                      <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                      <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
										 <asp:Label ID="Label17" runat="server" Text="Developer Owner"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
                                           <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lblDeveloperClientOwnerEditSearch" runat="server" Text="" OnClick="lblDeveloperClientOwnerEditSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
												 <asp:TextBox ID="txtDeveloperClientOwnerEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                               <asp:HiddenField ID="hfdDeveloperClientOwnerIDEdit" runat="server" />
											 </div>
										
									 </td>
								 </tr>
								 <tr>
									
								

									 <td style="padding: 3px 5px;" class="label-alignment no-border">
										 <asp:Label ID="Label7" runat="server" Text="Main Contractor"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px;" class="no-border">
                                             <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lbMainContractorEditSearch" runat="server" Text="" OnClick="lbMainContractorEditSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
												<a hre="" id="aMainContract" runat="server" target="_blank"> <asp:TextBox ID="txtMainContractorEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox></a>
                                               <asp:HiddenField ID="hfdMainContractorIDEdit" runat="server" />
											 </div>
										
									 </td>

									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label18" runat="server" Text="Main Contractor Owner"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
									 <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lbMainContractorOwnerSearchEdit" runat="server" Text="" OnClick="lbMainContractorOwnerSearchEdit_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
												 <asp:TextBox ID="txtMainContractorOwnerEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                               <asp:HiddenField ID="hfdMainContractorOwnerIDEdit" runat="server" />
											 </div>
									 </td>
                                     
									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                      <td style="padding: 3px 5px;" class="label-alignment no-border">
										 <asp:Label ID="Label3" runat="server" Text="MEP Contractor"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px;" class="no-border">
                                          <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lbMEPContractorEditSeach" runat="server" Text="" OnClick="lbMEPContractorEditSeach_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										
                                               <a href="" runat="server" id="mepContractor" target="_blank"> <asp:Label ID="txtMEPContractorEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false" style="min-height:38px;max-width:250px;min-width:200px;"></asp:Label></a>
                                               <asp:HiddenField ID="hfdMEPContractorIDEdit" runat="server" />
											 </div>
										 

									 </td>
                                     	 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

										 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label21" runat="server" Text="Salesman"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
                                            <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lbSalesmanEditSearch" runat="server" Text="" OnClick="lbSalesmanEditSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										           <asp:TextBox ID="txtSalesmanEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                               <asp:HiddenField ID="hfdSalesmanIDEdit" runat="server" />
											 </div>
										
									 </td>
								 </tr>
								<tr>
									<asp:Panel runat="server" ID="pnlMoreAboutProjectEdit">
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label38" runat="server" Text="Scale"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCRMScaleEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label41" runat="server" Text="Construction Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCRMConstructionTypeEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
							    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label39" runat="server" Text="Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlProjectTypeEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlProjectTypeEdit_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
									</td>
								 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label40" runat="server" Text="Sub Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlProjectSubTypeEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
							
									</asp:Panel>
								</tr>
                                
                                 <tr>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label42" runat="server" Text="Country"></asp:Label>
                                         <asp:HiddenField ID="hfdRelated" Value="1" runat="server" />
                                         <asp:HiddenField ID="hfdOptNo" Value="" runat="server" />
                                         <asp:HiddenField ID="hfdDivideValue" Value="4" runat="server" />
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                         <asp:DropDownList ID="ddlCountryEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlCountryEdit_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                     </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label43" runat="server" Text="City"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                         <asp:DropDownList ID="ddlCityEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
                                     </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px;" class="label-alignment no-border">
                                         <asp:Label ID="Label22" runat="server" Text="Sales Stage"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px;" class="no-border">
                                         <asp:DropDownList ID="ddlSalesStageEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:DropDownList>
                                         <asp:HiddenField ID="hfdOldSalesStage" runat="server" />
                                     </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label4" runat="server" Text="Status"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                         <asp:DropDownList ID="ddlStatusEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:DropDownList>
                                         <asp:HiddenField ID="hfdStatusCode" runat="server" />                                     </td>
                                     </tr>

                                 <tr>

                                      <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                       
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                      
                                     </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                      
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                      
                                     </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     
                                     </td>
                                     <td style="padding: 3px 5px;" class="no-border">
                                        
                                     </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                     
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border" colspan="2">
                                         <asp:LinkButton ID="lblVerifyView" runat="server" Text="" Font-Bold="true" Font-Size="Medium" OnClick="lblVerifyView_Click"></asp:LinkButton>
                                         <asp:LinkButton ID="lblSetVerify" CssClass="btn btnVerify" runat="server" Text="VERIFY" Font-Bold="true" OnClick="lblSetVerify_Click"></asp:LinkButton>
                                     </td>

                                 </tr>
								 <tr>
									 <td style="padding: 3px 5px;" class="label-alignment no-border" colspan="9">
										  <asp:Label ID="lblUpdateError" runat="server" Text="" ForeColor="Red"></asp:Label>
									 </td>
								 </tr>
							 </table>

        

                           <asp:Panel ID="Panel10" runat="server" CssClass="pnlsubheading">
                                 <div class="pull-left" style="margin-top: -8px;">
                                      <div class="breadcrumb-custom flat" >
                                          <a id="aRevenue" runat="server">
                                             <asp:Button ID="btnRevenue" runat="server" Text="Revenue" Width="224px" BackColor="Transparent" BorderStyle="None" OnClick="btnRevenue_Click"  />
                                         </a>
                                         <a id="aQuotation" runat="server">
                                             <asp:Button ID="btnQuotation" runat="server" Text="Quotation" Width="235px" BackColor="Transparent" BorderStyle="None" OnClick="btnQuotation_Click" />
                                         </a>
                                      <a id="aSalesOrder" runat="server">
                                             <asp:Button ID="btnSalesOrder" runat="server" Text="Sales Order" Width="235px" BackColor="Transparent" BorderStyle="None" OnClick="btnSalesOrder_Click" />
                                         </a>

                                           <a id="aContact" runat="server">
                                             <asp:Button ID="btnContact" runat="server" Text="Contact" Width="235px" BackColor="Transparent" BorderStyle="None" OnClick="btnContact_Click" />
                                         </a>

                                           <a id="aRAccount" runat="server">
                                             <asp:Button ID="btnRAccount" runat="server" Text="Related Account" Width="235px" BackColor="Transparent" BorderStyle="None" OnClick="btnRAccount_Click" />
                                         </a>
                                        </div>
                                 </div>
                                <div class="pull-right" style="margin-top: -9px;margin-right: 10px;">
                                      <asp:LinkButton ID="lbAddrevLine" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbAddrevLine_Click"
                                                ><i class="fa fa-plus" aria-hidden="true" title="Add An Item"></i></asp:LinkButton>   
                                    &nbsp&nbsp;
                                      <asp:LinkButton ID="lbRevenueLostHistory" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbRevenueLostHistory_Click"
                                                ><i class="fa fa-history" aria-hidden="true" title="Revenue RequestedLost"></i></asp:LinkButton>   


                                    <asp:LinkButton ID="lbAddContact" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbAddContact_Click"
                                                ><i class="fa fa-plus" aria-hidden="true" title="Add Contact"></i></asp:LinkButton> 
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


                            <%-- REvenue details --%>
                              <div id="Div1" runat="server" style="overflow-y: auto; max-height: calc(100vh - 480px);overflow-x:hidden">
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
                                                 <asp:Label ID="lblProductType" Text='<%#(Eval("ProductType").ToString()) %>'
                                                     runat="server" />
                                                 <asp:HiddenField ID="hfdRevenueRowId" Value='<%#(Eval("RevenueRowId").ToString()) %>' runat="server" />
                                                 <asp:HiddenField ID="hfdOpportunityNumber" Value='<%#(Eval("OpportunityNumber").ToString()) %>' runat="server" />
                                                 
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Scope" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                     <asp:Label ID="lblScope" Text='<%#(Eval("Scope").ToString()) %>'
                                                     runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Vendor List" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblVL" Text='<%#(Eval("VendorList").ToString()) %>' runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Revenue Status" ItemStyle-Width="10%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblRevenueStatus" Text='<%#(Eval("RevenueStatus").ToString()) %>' runat="server" />
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
                                                  <asp:Label ID="lblSubStage" Text='<%#(Eval("SubStage").ToString()) %>'
                                                     runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                     
                                         <asp:TemplateField HeaderText="Admin Remaks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:TextBox ID="txtRemarks" runat="server"  Text='<%#(Eval("CRMRemarks").ToString()) %>'/>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quotation Number" ItemStyle-Width="6%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:TextBox ID="txtQuotationNumber" runat="server"  Text='<%#(Eval("QuotationNo").ToString()) %>' Width="90%"/>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Quotation Date" ItemStyle-Width="6%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:TextBox ID="txtQuotationDate" runat="server" Text='<%#(Eval("QuotationDate").ToString()) %>' Width="90%" />
												<ajax:CalendarExtender ID="calS3" runat="server" Format="yyyy-MM-dd" TargetControlID="txtQuotationDate" 
													CssClass="MyCalendar">
												</ajax:CalendarExtender>
											</ItemTemplate>
										</asp:TemplateField>
                                         <asp:TemplateField HeaderText="SO No" ItemStyle-Width="6%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                             	<asp:TextBox ID="txtSONumber" runat="server"  Text='<%#(Eval("SalesOrderNo").ToString()) %>' Width="90%"/>
                                                  
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="SO Date" ItemStyle-Width="6%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                	<asp:TextBox ID="txtSODate" runat="server" Text='<%#(Eval("SalesOrderDate").ToString()) %>' Width="90%" />
                                                    
                                                 	<ajax:CalendarExtender ID="calS4" runat="server" Format="yyyy-MM-dd" TargetControlID="txtSODate" 
													CssClass="MyCalendar"></ajax:CalendarExtender>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                          <asp:TemplateField HeaderText="VALUE" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:TextBox ID="lblValue" Text='<%#(Eval("FORMATVALUE").ToString()) %>' runat="server" style="text-align:center"/>
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
                                                     CommandArgument='<%#Eval("RevenueRowId")%>' CommandName="History" Style="text-align: center"><i class="fa fa-history" title="History"></i></asp:LinkButton>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                      
                                    <asp:TemplateField HeaderText="Others">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnothers" runat="server" Style="text-align: center" CommandName="Others" CssClass="btn rounded-pill btn-icon btn-round"
                                                CommandArgument='<%#(Eval("RevenueRowId").ToString())%>'><i class="fa fa-info-circle" title="Others"></i></asp:LinkButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                          <asp:TemplateField HeaderText="Others">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnSubRevenue" runat="server" Style="text-align: center" CommandName="SubRevenue" CssClass="btn rounded-pill btn-icon btn-round"
                                                CommandArgument='<%#(Eval("RevenueRowId").ToString()+","+Eval("ProductType").ToString())%>'><i class="fa fa-eye" title="SubRevenue"></i></asp:LinkButton>

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



                                  <asp:GridView ID="gdvOptRelated" runat="server" AutoGenerateColumns="False" Width="100%"
                                 CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found" OnRowCommand="gdvOptRelated_RowCommand"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                  

                                     <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col10">
                                        <ItemTemplate>
                                           
                                                 <asp:LinkButton ID="lblAccountId" Text='<%#(Eval("col11").ToString()) %>' CommandName="Track" CommandArgument='<%#(Eval("Link").ToString()) %>'
                                                     runat="server" />
                                         
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="" ItemStyle-Width="15%" Visible="True" SortExpression="col1">
                                        <ItemTemplate>
                                            <asp:Label ID="lb1" Text='<%#(Eval("col1").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField Value="col1" runat="server" />
                                           
                                        </ItemTemplate>
                                       <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col2">
                                        <ItemTemplate>
                                            <asp:Label ID="lb2" Text='<%#(Eval("col2").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="col3">
                                        <ItemTemplate>
                                            <asp:Label ID="lb3" Text='<%#(Eval("col3").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                       <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col4">
                                        <ItemTemplate>
                                            <asp:Label ID="lb4" Text='<%#(Eval("col4").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="col5">
                                        <ItemTemplate>
                                            <asp:Label ID="lb5" Text='<%#(Eval("col5").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="col6">
                                        <ItemTemplate>
                                            <asp:Label ID="lb6" Text='<%#(Eval("col6").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="col7">
                                        <ItemTemplate>
                                            <asp:Label ID="lb7" Text='<%#(Eval("col7").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="col8">
                                        <ItemTemplate>
                                            <asp:Label ID="lb8" Text='<%#(Eval("col8").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="col9">
                                        <ItemTemplate>
                                            <asp:Label ID="lb9" Text='<%#(Eval("col9").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbView" runat="server" CommandName="View" CommandArgument='<%#(Eval("col1").ToString())%>' CssClass="btn rounded-pill btn-icon btn-round">
                                                <i class="fa fa-eye" title="View"></i>
                                               
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbdelete" runat="server" CommandName="del" CommandArgument='<%#(Eval("col1").ToString())%>' CssClass="btn rounded-pill btn-icon btn-round">
                                                <i class="fa fa-trash" title="View"></i>
                                               
                                            </asp:LinkButton>
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
                
             
            </asp:Panel>  

            <cc1:ModalPopupExtender ID="ModalRelatedDetails" runat="server" PopupControlID="pnlDetailsOfRelatedData" TargetControlID="btnCloseDetails" CancelControlID="btnCloseDetails"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior40" RepositionMode="RepositionOnWindowResizeAndScroll" 
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlDetailsOfRelatedData"  AccessKey="s" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

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
                                <asp:Label ID="Label46" class="subpnlhdg" runat="server" Text="Details"></asp:Label>
                            </h4>

                        </div>


                        <div class="pull-right">
                         <%--    <button type="button" class="btn btn-close"  aria-label="Close" runat="server" id="btnCloseSearchMP"/>--%>
                            <asp:Button ID="btnCloseDetails"  runat="server"   class="btn btn-close" aria-label="Close"/>
                        
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>
                  
                   

                
                  
                              <div id="Div3" runat="server" style="overflow-y: auto; height: calc(100vh - 250px); overflow-x: hidden">
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

                </div>

            </asp:Panel>




                <cc1:ModalPopupExtender ID="mpRelatedOPT" runat="server" PopupControlID="pnlRelatedOPT" TargetControlID="btnCloseRelatedOPT" CancelControlID="btnCloseRelatedOPT"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior5" RepositionMode="RepositionOnWindowResizeAndScroll" 
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlRelatedOPT" AccessKey="s" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

                <div style="border-radius: 50px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 70%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 15%; top: 64.5px; border: solid; border-color: silver; padding-bottom: 20px;height: " >
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
                                <asp:Label ID="Label47" class="subpnlhdg" runat="server" Text="Please Select Opportunities to Update 'NO Sale'"></asp:Label>
                            </h4>

                        </div>


                        <div class="pull-right">
                            <%--    <button type="button" class="btn btn-close"  aria-label="Close" runat="server" id="btnCloseSearchMP"/>--%>
                            <asp:Button ID="btnCloseRelatedOPT" OnClick="btnCloseRelatedOPT_Click" runat="server" class="btn btn-close" />

                            <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>

                  

                    <div  style="overflow-y: auto; height: calc(100vh - 400px); overflow-x: hidden;padding-top: 10px;" >
                        <asp:GridView ID="gdvRlatedOPT" runat="server" AutoGenerateColumns="false" Width="100%"
                            CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                            class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderStyle Font-Size="XX-Small" Width="10%" />
                                        <ItemStyle Font-Size="XX-Small" />
                                        <HeaderTemplate>

                                            <asp:CheckBox ID="chkAll" runat="server" onclick="checkAll1(this,0);" Checked="true"/>
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                            <asp:HiddenField ID="hfdOpportunityNumber" runat="server" Value='<%#Eval("OpportunityNumber")%>' />
                                            <asp:CheckBox ID="chkSelectIn" onclick="Check_Click1(this)" Checked="true"
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderText="Name">

                                    <ItemTemplate>

                                        <asp:LinkButton ID="lblName" runat="server" Text='<%#Eval("Name")%>' Style="text-align: center"
                                            CommandName="Select"></asp:LinkButton>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderText="Owner">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOwner" runat="server" Text='<%#Eval("Owner")%>' Style="text-align: center"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderText="Contractor">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMEPContractor" runat="server" Text='<%#Eval("MEPContractor")%>' Style="text-align: center"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderText="Sales Stage Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSalesStageName" runat="server" Text='<%#Eval("SalesStageName")%>' Style="text-align: center"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatusCode" runat="server" Text='<%#Eval("StatusCode")%>' Style="text-align: center"></asp:Label>
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
							<asp:LinkButton ID="lbSaveOptAndRelatedOPT" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSaveOptAndRelatedOPT_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
						</div>

                </div>

            </asp:Panel>

                  <cc1:ModalPopupExtender ID="mpAdminRemarks" runat="server" PopupControlID="pnlAdminRemarks" TargetControlID="txtAdminRemarks"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior32" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

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
                            <asp:LinkButton type="button" class="btn btn-close" OnClick="btnCloseAdminRemarks_Click" runat="server" id="btnCloseAdminRemarks" />
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

                                 <td style="padding: 3px 5px; width: 15%" class="no-border">
                                     <div>
                                         <asp:FileUpload ID="FileUploadRemarks" runat="server" />
                                     </div>
                                </td>

                                 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label57" runat="server" Text="Attatcment Comment"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtRemarksComment" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
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

            
                    <cc1:ModalPopupExtender ID="mpMajorInfo" runat="server" PopupControlID="pnlMajorInfo" TargetControlID="ddlMajorInfoType"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior24" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlMajorInfo" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

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
                                <asp:Label ID="Label68" class="subpnlhdg" runat="server" Text="Major information"></asp:Label>
                                 <asp:HiddenField ID="hfdMajorInfoRefID" runat="server" ></asp:HiddenField>
                            </h4>

                        </div>


                        <div class="pull-right">
                           <asp:LinkButton ID="btnMajorInform" runat="server" CssClass="btn btn-close" OnClick="btnMajorInform_Click"></asp:LinkButton>
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                      </div>

                  </div>
					<div class="popupmaxheight">
						<table class="table table-condensed" style="width: 100%">

                            <tr>
                                   <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label69" runat="server" Text="Info Type"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:DropDownList ID="ddlMajorInfoType" CssClass="textBox1 form-control " runat="server" >
                                         <asp:ListItem  Text="-" Value="-" ></asp:ListItem>
                                        <asp:ListItem  Text="New Project" Value="New Project" ></asp:ListItem>
                                          <asp:ListItem  Text="New Customer" Value="New Customer" ></asp:ListItem>
                                          <asp:ListItem  Text="MEP Awarded" Value="MEP Awarded" ></asp:ListItem>
                                          <asp:ListItem  Text="Re-Tender" Value="Re-Tender" ></asp:ListItem>
                                          <asp:ListItem  Text="Resumed" Value="Resumed" ></asp:ListItem>
                                          <asp:ListItem  Text="Hold" Value="Hold" ></asp:ListItem>
                                          <asp:ListItem  Text="Cancelled" Value="Cancelled" ></asp:ListItem>
                                         <asp:ListItem  Text="Lost" Value="Lost" ></asp:ListItem>
                                         <asp:ListItem  Text="Consultant Change" Value="Consultant Change" ></asp:ListItem>
                                         <asp:ListItem  Text="Main Contractor Awarded" Value="Main Contractor Awarded" ></asp:ListItem>
                                        </asp:DropDownList>
                                </td>

                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label70" runat="server" Text="Source of Info"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                       <asp:DropDownList ID="ddlPSourceOfInfo" runat="server" CssClass="textBox1 form-control " Font-Bold="True" >
                                         <asp:ListItem  Text="-" Value="-" ></asp:ListItem>
                                        <asp:ListItem  Text="Media" Value="Media" ></asp:ListItem>
                                          <asp:ListItem  Text="Sales" Value="Sales" ></asp:ListItem>
                                          <asp:ListItem  Text="Marketing" Value="Marketing" ></asp:ListItem>
                                          <asp:ListItem  Text="Survey" Value="Survey" ></asp:ListItem>
                                          <asp:ListItem  Text="Other" Value="Other" ></asp:ListItem>
                                    </asp:DropDownList>
                                </td>

                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label71" runat="server" Text="Source Name"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtSourceName" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                </td>
                              
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label72" runat="server" Text="More Info"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtmajorMoreInfo" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                </td>

                                 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                <div>
                                    <asp:FileUpload ID="FuFile" runat="server" />
                                </div>
                                    </td>

                                 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                  <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                      <asp:LinkButton ID="lbSaveMajorInfo" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSaveMajorInfo_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
                                      </td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label56" runat="server" Text="Attatcment Comment"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtMajInfComment" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                </td>
                            </tr>
                          
                          
                      
							
						</table>
                          <div id="Div2" runat="server" style="overflow-y: auto; height: calc(100vh - 500px); overflow-x: hidden">
                            <asp:GridView ID="gdvMajorInfo" runat="server" AutoGenerateColumns="False"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found" 
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                    <asp:TemplateField HeaderText="InfoType" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="MediaName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInfoType" Text='<%#(Eval("InfoType").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdMediaInfoID" Value='<%#(Eval("ID").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SourceOfInfo" ItemStyle-Width="15%" Visible="True" >
                                        <HeaderStyle CssClass="gridheadercenter" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSourceOfInfo" Text='<%#(Eval("SourceOfInfo").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                      
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SourceName" ItemStyle-Width="12%" Visible="true" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblSourceName" Text='<%#(Eval("SourceName").ToString()) %>' 
                                                runat="server" />
                                        </ItemTemplate>
                                      
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="More Information" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblMoreInfo" Text='<%#(Eval("MoreInfo").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                      
                                        
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Created By" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreatedBy" Text='<%#(Eval("CreatedBY").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Created Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreatedDate" Text='<%#(Eval("CreationDate").ToString()) %>' 
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


       <div class="modal fade" id="ModalContact" tabindex="-2" aria-hidden="true" style="background-color: #13131466"  data-bs-backdrop="static">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalcontact">CONTACT DETAILS</h5>
                   <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>

               
                <div class="modal-body">

                    <a href="#" id="btnNewContact" class="btn newContact" style="float:right">New Contact</a>

                    <table class="table table-bordered table-striped Contact-item-list-table" style="width: 100%;">


                        <thead>

                            <tr>
                                <th style="display: none">Contact Id</th>
                                <th>Contact Name</th>
                                <th>Email</th>
                                <th>Phone Number</th>




                            </tr>
                        </thead>


                        <tbody class="tbody-Contact">
                        </tbody>
                    </table>


                    <div class="modal-footer">
                        <%--<button type="button" id="Button2" class="btn btn-primary" runat="server" data-bs-dismiss="modal">Add</button>--%>
                      <%--<input type="button" id="btnSOOrgAdd" class="btn btn-primary" runat="server" value="Add" />--%>

                    </div>
                </div>
            </div>
        </div>

    </div>

            
              <div class="modal fade" id="mpForVerifyDataView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content" style="width: 250%;right: 400px;">
                                            <div class="modal-header">
                                                <h3 class="modal-title">VERIFICATION DETAILS</h3>
                                                <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                   
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <asp:GridView ID="gdvVerifiedView" runat="server" EmptyDataText="No Other Updates Found.." AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                                    class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4">
                                                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                                    <Columns>


                                                        <asp:TemplateField HeaderText="Account Name" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAccountName" Text='<%#(Eval("Name").ToString()) %>'
                                                                    runat="server" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblVerifyStatus" runat="server" Text='<%#(Eval("VerifiedStatus").ToString()) %>' Font-Bold="true" Font-Size="Medium" CssClass='<%#(Eval("VerifiedIcon").ToString()) %>'></asp:Label>
                                                                  

                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="VerifiedBy" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblVerifiedBy" Text='<%#(Eval("Verifiedby").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Verified Date" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblVerifiedDate" Text='<%#(Eval("VerifiedDate").ToString()) %>'
                                                                    runat="server" />
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


             
    <div class="modal fade" id="ConfirmActivityPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;padding-bottom:15%;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bx bx-check-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;color:#0dcb0d;"></i></div>
                    <div>
                        <h3>Are you sure?</h3>
                    </div>
                      Do You Really Want To Verify All The Details Regarding of This Opportunity
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <asp:LinkButton ID="btnNo" runat="server" class="btn btn-secondary" data-bs-dismiss="modal">NO</asp:LinkButton>
                        <asp:LinkButton ID="btnYes" runat="server" class="btn btn-primary btn-delete-act" OnClick="btnYes_Click">YES</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>




            <div class="modal fade" id="mpShowSubRevenue" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 300%; right: 100%;background-color: #edededed;">
                        <div class="modal-header">
                            <h3 class="modal-title" id="H4">SUB REVENUE DETAILS</h3>
                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                            </button>
                        </div>
                        <div class="card-body" style="margin-top: 0%;">
                            <div id="divAddSubRev" style="background: #14131347; padding: 30px; border-radius: 12px; border: 2px solid #d3d3d3; box-shadow: 4px 4px 13px -7px #545454;">
                                <h5 class="modal-title" style="font-family: ui-serif; text-decoration: underline; color:black;">ADD SUBREVENUE</h5>
                                <div style="padding-top:8px;">
                                    <table class="table table-condensed">

                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label58" runat="server" Text="Product Name" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 8%" class="no-border">
                                            <input type="text" id="txtProductName" class="form-control" disabled />
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label59" runat="server" Text="Amount" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 8%" class="no-border">
                                            <input type="text" id="txtAmount" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                        </td>

                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label60" runat="server" Text="Status" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 8%" class="no-border">
                                            <select id="ddlSubStatus" class="form-select color-dropdown">
                                            </select>
                                        </td>

                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label61" runat="server" Text="Sales Stage Name" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 8%" class="no-border">
                                            <select id="ddlSubSalesStage" class="form-select color-dropdown">
                                        </td>

                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label65" runat="server" Text="Remarks" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 8%" class="no-border">
                                            <textarea id="txtSubRemarks"  class="form-control"></textarea> 
                                        </td>

                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <span id="btnAddSubRev" class="btnUpdate">
                                                <i class="fa fa-save icon-largehover icon-btn-revenue" title="Refresh" style="color: #d33a3a; cursor: pointer; font-size: xx-large;"></i>
                                            </span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             <span id="btnAddNewRev" class="btnUpdate">
                                                <i class="fa fa-refresh icon-largehover icon-btn-revenue" title="Refresh" style="color: #d33a3a; cursor: pointer; font-size: xx-large;"></i>
                                            </span>
                                        </td>
                                    </table>
                                </div>
                            </div>

                            <div class="" style="margin-top: 2%;">

                                <table class="table table-bordered table-striped OPP-SubRevenue-table" style="width:100%;">


                                    <thead>
                                        <tr>
                                            <%--<th>Id</th>--%>
                                            <th style="display: none;">RevenueRowId</th>
                                            <th>Product</th>
                                            <th>Amount</th>
                                            <th>Status</th>
                                            <th>SalesStage</th>
                                             <th>Remarks</th>
                                            <th>CreatedBy</th>
                                            <th>Created Date</th>
                                            <th>Action</th>
                                            <%--<th>Status</th>--%>
                                        </tr>
                                    </thead>


                                    <tbody class="tbody-SubRevenue">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>







             <div class="modal fade" id="mpShowRevenueLost" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 300%; right: 100%;background-color: #edededed;">
                        <div class="modal-header">
                            <h3 class="modal-title" id="H4">REVENUE REQUEST LOST DETAILS</h3>
                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                            </button>
                        </div>
                        <div class="card-body" style="margin-top: 0%;">


                            <div class="" style="margin-top: 2%;">

                                <table class="table table-bordered table-striped OPP-RevenueRequestLost-table" style="width:100%;">


                                    <thead>
                                        <tr>
                                            <%--<th>Id</th>--%>
                                            <th>RevenueRowId</th>
                                            <th>Product</th>
                                            <th>SubStage</th>
                                            <th>Lost Reason</th>
                                            <th>Competitor</th>
                                            <th>Competitor Price</th>
                                            <th>Salesman Note</th>
                                            <th>UpdatedBy</th>
                                            <th>Updated Date</th>
                                            <%--<th>Status</th>--%>
                                        </tr>
                                    </thead>
                                        

                                    <tbody class="tbody-RevenueRequestLost">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            







             <div class="modal fade" id="mpShowRequestStatus" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content" style="width: 300%; right: 100%;background-color: #e9e9e9eb;">
                        <div class="modal-header">
                            <h3 class="modal-title" id="H6" style="text-shadow: 1px -1px 8px; color: #747474;">REQUEST FOR STATUS UPDATE</h3>
                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                            </button>
                        </div>
                        <div class="card-body" style="margin-top: 0%;">

                          <%--   <div><i class="bx bx bx-check-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;color:#0dcb0d;"></i></div>--%>
                                  <div style="padding-top:5px;text-align:center;" class="div-CloseReq">
                                      <asp:Label runat="server" Font-Size="X-Large" ForeColor="Red" Font-Bold="true">Please Enter Your Remark And Click Submit To send a Request For Close</asp:Label>
                                      </div>
                                    <div style="padding-top:5px;text-align:center;" class="div-OpenReq">
                                      <asp:Label runat="server" Font-Size="X-Large" ForeColor="Red" Font-Bold="true">Please Enter Your Remark And Click Submit To send a Request For Open</asp:Label>
                                      </div>
                              
                                <div style="padding-top:30px;">
                                    <table class="table table-condensed">
                                        <tr>
                                            <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                                <asp:Label ID="Label62" runat="server" Text="SalesStage" ForeColor="Black"></asp:Label>
                                            </td>
                                            <td style="padding: 3px 5px; width: 8%" class="no-border">
                                                <input type="text" id="txtSalesStageReq" class="form-control" disabled />
                                            </td>
                                            <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                            <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                                <asp:Label ID="Label63" runat="server" Text="Status" ForeColor="Black"></asp:Label>
                                            </td>
                                            <td style="padding: 3px 5px; width: 8%" class="no-border">
                                                <input type="text" id="txtStatusReq" class="form-control" disabled />
                                            </td>

                                            <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                            <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                                <asp:Label ID="Label64" runat="server" Text="Remarks" ForeColor="Black"></asp:Label>
                                            </td>
                                            <td style="padding: 3px 5px; width: 8%" class="no-border">
                                                <textarea type="text" id="txtRemarksReq" class="form-control" style="background-color:#f1f1f1"></textarea>
                                            </td>
                                        </tr>


                                    </table>
                                </div>
                           
                             <div style="padding-top:12px;float:right">
                            <button type="button" ID="btnCloseReq" class="btn btn-primary bt-closeReq" data-bs-dismiss="modal" style="background-color: #626161 !important;">Close</button>
                            <button type="button" ID="btnSubmitReq" class="btn btn-primary btn-SubmitReq">SUBMIT</button>
                    </div>
                         
                        </div>
                    </div>
                </div>
            </div>


        </ContentTemplate>
      
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExport" />
             <asp:PostBackTrigger ControlID="lbSaveMajorInfo" />
             <asp:PostBackTrigger ControlID="btnSaveAdminRemakrs" />
        </Triggers>
        
    </asp:UpdatePanel>
    
          <script type="text/javascript">
              var currUserId = '';
              var EmpNo = '';
              var EmpName = '';
              var myrole = '';
              var overAllPerfo = 0;
              $(document).ready(function () {
                  currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
                    EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';
                    EmpName ='<%=Session["EmpName"]%>'
                });

          </script>


    <script src="../Template/Datatable/js/jquery.dataTables.min.js"></script>
    <script src="../Template/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../Template/Datatable/js/jszip.min.js"></script>
    <script src="../Template/Datatable/js/pdfmake.min.js"></script>
    <script src="../Template/Datatable/js/buttons.print.min.js"></script>
    <script src="../Template/Datatable/js/vfs_fonts.js"></script>
    <script src="../Template/Datatable/js/buttons.html5.min.js"></script>


       <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />


    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    
    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>

            <asp:Panel ID="pnlBackGround1" runat="server" CssClass="popup-div-background" style="z-index:1000001" >
                <div class="CenterPB" style="height: 40px; width: 60px;" >
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Icons/loader.gif" Height="35px"
                        Width="35px" />
                    Loading ...
                </div>
            </asp:Panel>


        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
