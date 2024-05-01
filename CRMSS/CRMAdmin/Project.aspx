<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="Project.aspx.cs" Inherits="CRMAdmin_Project" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
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
     <script src="../CRMAdmin/Script/project.js?v=1.2"></script>
    <%--<script src="../CRMAdmin/Script/opt.js"></script>--%>
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
 .nav-tabs .nav-item .nav-link.active
 {
     color: #ffffff;
    background-color: #a92828;
    border-color: #fff;
 }
 .nav-tabs .nav-item .nav-link:hover
 {
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


        .PRJ-Marketing-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

       .PRJ-Marketing-table td {
             color: #333333 !important;
    }

        .PRJ-History-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

       .PRJ-History-table td {
             color: #333333 !important;
    }

       .PRJ-AdminHistory-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

       .PRJ-AdminHistory-table td {
             color: #333333 !important;
    }

       
       .PRJ-MajorInfo-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

       .PRJ-MajorInfo-table td {
             color: #333333 !important;
    }

        .PRJ-MediaInfo-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

       .PRJ-MediaInfo-table td {
             color: #333333 !important;
    }

         .PRJ-MoreInfo-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

       .PRJ-MoreInfo-table td {
             color: #333333 !important;
    }

        .Contact-item-list-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .Contact-item-list-table td {
             color: #333333 !important;
         }

          .iconClassExcel {
             margin-left: 8px;
             background: #933737;
         }

             .iconClassExcel:hover {MATERIAL RETURN REQUEST DETAIL
                 background: #a54141;
             }

              .newContact{
                 background-color: #a92828;
                 color: white;
             }
              .newContact:hover {
                 background: #d51a1a;
                  color: white;
             }


    .btn-Style{
     color: #fff;
    background-color: #d14f42;
    border-color: #ffffff;
    box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
}
    .btn-Style.active, .btn-Style:hover{
    color: #fff;
    background-color: green;
    border-color: #ffffff;
    box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
    }
       /*  @media (min-width: 2500px) and (max-width: 4000px)*/
     .row {
               height: 0% !important;
          }

            .btnVerify{
          color:white;
          background-color:#62dd15;
          width:133px;
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

        .Opp-Select-Change-table th{
    color:white !important;
    background-color:#d54832;
}

    </style>
   
  <script>

      $(document).ready(function () {
          
         

      });

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

                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (evt, args) {
                    //$('.ddlcc').on('change', function () {

                    //    let s = "test";
                    //    Country = $('#ddlc option:selected').val();
                    //    cityDDL();

                    //});
                    $('#btnAddContactInfo').on('click', function () {
                        AddContact();
                        hidebg();


                    });

                    $('.tbody-Contact').on('click', 'tr', function () {
                        ContactId = this.children[0].textContent;
                        SetProjectContact();
                        $('#ContentPlaceHolder1_btnContact').trigger('click');
                    });
                    $('#btnNewContact').on('click', function () {
                        $('#ModalContact').modal('hide');
                        setDet();
                        $('#mpContact').modal('show');
                    });

                    $('#btnSubmitReq').on('click', function () {
                        SubmitRequest();

                    });

                });

            </script>


            <div class="GridviewDiv" id="pnlSummaryView" runat="server">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                    <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <h3>
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="PROJECT"></asp:Label>
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
                                      <asp:LinkButton ID="lbkGeneralSearch" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbkGeneralSearch_Click"
                                                ><i class="fa fa-search" aria-hidden="true" title="Search"></i></asp:LinkButton>   
                       <asp:LinkButton ID="lbkAdvanceButton"  Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbkAdvanceButton_Click"    
                                             runat="server"   ><i class="fa fa-filter" aria-hidden="true" title="Advanced Filter"></i></asp:LinkButton>   
                                    
                                   <asp:LinkButton ID="lbkAddNewPROJECT"  Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbkAddNewPROJECT_Click" 
                                             runat="server" Visible="false"><i class="fa fa-plus" aria-hidden="true" title="Add New Opportunity"></i></asp:LinkButton>   
                                        </div>

                              &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                   <label class="form-label">
                                       <asp:Label ID="lblRowCount" runat="server" Text="" ForeColor="Red"></asp:Label>

                                   </label>
                               </div>
                         </div>
                        <div class="row" style="padding-left: 8px;padding-top: 10px;">
                            <div class="col-1" style="width: 20%;border-style: groove;" id="dvdAdvancedSearch" runat="server" visible="false">
                                <asp:Panel runat="server" ID="pnlPRJClose" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                              PROJECT # 
                                        </div>
                                        <div style="width: 60%">
                                             <asp:TextBox ID="txtPrjSearch" CssClass="form-control textBox1" runat="server" ForeColor="Black" ></asp:TextBox>
                                        </div>
                                          <div style="width: 5%">
                                               <asp:Button ID="btnPrjPnlClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnPrjPnlClose_Click">
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlcompanydrp" style="padding-top:5px" Visible="false">
                                    <div class="row">

                                        <div style="width: 30%">
                                            Company 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlOrganization" CssClass="form-control textBox1" runat="server" ForeColor="Black" OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        </div>
                                          <div style="width: 5%">
                                               <asp:Button ID="btnCloseCompanyFilt" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnCloseCompanyFilt_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlMarketing" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            Marketing 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlMarketing"  CssClass="form-control textBox1" runat="server" ForeColor="Black"  style="max-width:100%"></asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnMarketingSearchClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnMarketingSearchClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlConsultant" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                              Consultant 
                                        </div>
                                        <div style="width: 60%">
                                             <asp:TextBox ID="txtConsulatntSearch"  CssClass="form-control textBox1" runat="server" ForeColor="Black" ></asp:TextBox>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnConsultantClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnConsultantClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>

                                <asp:Panel runat="server" ID="pnlPlot" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                              Plot # 
                                        </div>
                                        <div style="width: 60%">
                                             <asp:TextBox ID="txtPlot" CssClass="form-control textBox1" runat="server" ForeColor="Black" ></asp:TextBox>
                                        </div>
                                          <div style="width: 5%">
                                               <asp:Button ID="btnPlotClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnPlotClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                                    <asp:Panel runat="server" ID="pnlStatus" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                               Status  
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlStatus" CssClass="form-control textBox1" runat="server" ForeColor="Black" >


                                                </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnStatusClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnStatusClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                                   <asp:Panel runat="server" ID="pnlSalesStage" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                               Sales Satge  
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlSalesStageSearch" CssClass="form-control textBox1" runat="server" ForeColor="Black" >

                                                </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnSalesstageClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnSalesstageClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>

                                 <asp:Panel runat="server" ID="pnlVerify" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                                 Verification Status
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlVerify" CssClass="form-control textBox1" runat="server" ForeColor="Black" >
                                                <asp:ListItem Value="-1">All</asp:ListItem>
                                                <asp:ListItem Value="1">Verified</asp:ListItem>
                                                <asp:ListItem Value="0">Not Verified</asp:ListItem>
                                                </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnVerifyClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnVerifyClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                                               <asp:Panel runat="server" ID="pnlClientSearch" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                              Client 
                                        </div>
                                        <div style="width: 60%">
                                             <asp:TextBox ID="txtClientSearch" CssClass="form-control textBox1" runat="server" ForeColor="Black" ></asp:TextBox>
                                        </div>
                                          <div style="width: 5%">
                                               <asp:Button ID="btnClientSearchClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnClientSearchClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                 
                                    <asp:Panel runat="server" ID="Panel4" style="padding-top:5px">
                                    <div class="row">
                                        
                                        <div style="width: 100%">
                                            <div class="pull-left">
                                            <asp:DropDownList ID="ddlNewField" CssClass="form-control textBox1" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlNewField_SelectedIndexChanged" style="align-items:center" >
                                           
                                                 <asp:ListItem Text="ADD FIELD" Value="ADD"  Selected="True"></asp:ListItem>    
                                                 <asp:ListItem Text="Project Number" Value="Project"></asp:ListItem>
                                                <asp:ListItem Text="Company" Value="Company" ></asp:ListItem>
                                                 <asp:ListItem Text="Marketing" Value="Marketing"></asp:ListItem>
                                                 <asp:ListItem Text="Consultant" Value="Consultant"></asp:ListItem>
                                                  <asp:ListItem Text="Plot" Value="Plot"></asp:ListItem>
                                                  <asp:ListItem Text="Status" Value="Status"></asp:ListItem>
                                                    <asp:ListItem Text="SalesStage" Value="SalesStage"></asp:ListItem>
                                                  <asp:ListItem Text="Verify" Value="Verify"></asp:ListItem>
                                                  <asp:ListItem Text="Client" Value="Client"></asp:ListItem>
                                              


                                                </asp:DropDownList>
                                                </div>
                                            <div class="pull-left" style="padding-left:10%">
                                            <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-info" OnClick="btnSearch_Click"/>
                                              </div>
                                              <div class="pull-left" style="padding-left:1%">
                                            <asp:Button runat="server" ID="btnExport" Text="Export" CssClass="btn btn-gray" OnClick="btnExport_Click"/>
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
                            <asp:GridView ID="gdvProjectSummaryDetails" runat="server" AutoGenerateColumns="False"
                                OnSorting="gdvProjectSummaryDetails_Sorting"
                                OnRowCommand="gdvProjectSummaryDetails_RowCommand"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                 <HeaderStyle CssClass="GridHeader-blue" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Project Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="ProjectNo">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProjectNumberr" Text='<%#(Eval("ProjectNo").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdProjectNumber" Value='<%#(Eval("ProjectNo").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name" ItemStyle-Width="15%" Visible="True" SortExpression="ProjectName" HeaderStyle-HorizontalAlign="Left">
                                     
                                        <ItemTemplate>
                                            <asp:Label ID="lblPRJName" Text='<%#(Eval("ProjectName").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MEP Consultant" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="MEPConsultant">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMEPConsultant" Text='<%#(Eval("MEPConsultant").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Marketing" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="Marketing">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMarketing" Text='<%#(Eval("Marketing").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Main Contractor" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="MainContractorName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMainContractor" Text='<%#(Eval("MainContractorName").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                
                                    <asp:TemplateField HeaderText="Sales Stage Name" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="SalesStage">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSalesStageName" Text='<%#(Eval("SalesStage").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="ProjectStatus">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatusCode" Text='<%#(Eval("ProjectStatus").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                               

                                    <asp:TemplateField HeaderText="View">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblView" runat="server" Text='' CommandName="View" CssClass="btn rounded-pill btn-icon btn-round"
                                                CommandArgument='<%#Eval("ProjectNo")%>' Style="text-align: center"><i class="fa fa-eye" title="View"></i></asp:LinkButton>
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


        




               <cc1:ModalPopupExtender ID="mpAddNewProject" runat="server" PopupControlID="pnlAddNewPRJ" TargetControlID="btnCloseAddPRJ"
                Enabled="true" CancelControlID="btnCloseAddPRJ" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior21" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlAddNewPRJ" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

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
                                <asp:Label ID="Label5" class="subpnlhdg" runat="server" Text="NEW PROJECT"></asp:Label>
                                 <asp:HiddenField ID="hfdNEWPRJNUMBER" runat="server" ></asp:HiddenField>
                            </h4>

                        </div>


                        <div class="pull-right">
                             <button type="button" class="btn btn-close"  aria-label="Close" runat="server" id="btnCloseAddPRJ"/>
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>
					<div class="popupmaxheight">
						<table class="table table-condensed" style="width: 100%;">

							

							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label25" runat="server" Text="Name"></asp:Label>
                                    <asp:HiddenField ID="hfdPRJhistory" runat="server" />
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:TextBox ID="txtPRJName" CssClass="textBox1 form-control " runat="server" />
								</td>
							
								

							</tr>

							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label27" runat="server" Text="Consultant"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lblConsultantSearchNP" runat="server" Text="" OnClick="lblConsultantSearchNP_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtConsultantNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdConsultantIDNP" runat="server" />
									</div>
								</td>

							

							</tr>
							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label9" runat="server" Text="Marketing"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbSearchMarketingNP" runat="server" Text="" OnClick="lbSearchMarketingNP_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtMarketingNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdMarketingIDNO" runat="server" />
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
											<asp:LinkButton ID="lblSearchMainContractorNP" runat="server" Text="" OnClick="lblSearchMainContractorNP_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtMainContrcatorNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdMainContractIDNP" runat="server" />
									</div>
								</td>
							</tr>
							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label11" runat="server" Text="Main Contract owner"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbSearchMainContractOwnerNP" runat="server" Text="" OnClick="lbSearchMainContractOwnerNP_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtMainContractOwnerNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdMainContractOwnerIDNP" runat="server" />
									</div>
								</td>
							</tr>
							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label12" runat="server" Text="Developer Client"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbSearchDeveloperClientNP" runat="server" Text="" OnClick="lbSearchDeveloperClientNP_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtDeveloperClientNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdDeveloperClientIDNP" runat="server" />
									</div>
								</td>
							</tr>
							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label14" runat="server" Text="Developer Owner"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbSearchDeveloperOwnerNP" runat="server" Text="" OnClick="lbSearchDeveloperOwnerNP_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtDeveloperOwnerNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdDeveloperOwnerIDNP" runat="server" />
									</div>
								</td>
							</tr>
					
						
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
									<asp:Label ID="Label28" runat="server" Text="Sales Stage Name"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:DropDownList ID="txtSalesStageNP" runat="server"  Enabled="true" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
								</td>
							</tr>
                                <tr>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label29" runat="server" Text="Status"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:TextBox ID="txtStatusNP" runat="server" Text="OPEN" Enabled="false" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
								</td>
                                </tr>
                               <tr>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label44" runat="server" Text="Country"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCountryNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlCountryNP_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        <asp:HiddenField ID="hfdCountry" runat="server" />
                                        <asp:HiddenField ID="hfdCity" runat="server" />
									</td>
                                    </tr>
                                     <tr>

								 
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label45" runat="server" Text="City"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCityNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
							
						</table>

						

						<div style="padding-top: 20px;">
							<asp:LinkButton ID="lbSaveNewProject" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSaveNewProject_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
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


                  <cc1:ModalPopupExtender ID="mpAddNewOPT" runat="server" PopupControlID="pnlAddNewOPT" TargetControlID="btnCloseAddNewOPT"
                Enabled="true" CancelControlID="btnCloseAddNewOPT" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior3" RepositionMode="RepositionOnWindowResizeAndScroll" 
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlAddNewOPT"  AccessKey="s" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

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
                                <asp:Label ID="Label3" class="subpnlhdg" runat="server" Text="Add New Opportunity"></asp:Label>
                            </h4>

                        </div>


                        <div class="pull-right">
                             <button type="button" class="btn btn-close"    aria-label="Close" runat="server" id="btnCloseAddNewOPT"/>
                          
                        
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>
                  
                    <table class="table table-condensed" style="margin-top: 20px;">

           			<tr>
								<td style="padding: 3px 5px; width: 10%" class="label-alignment no-border">
									<asp:Label ID="Label19" runat="server" Text="Customer"></asp:Label>
                                         <asp:HiddenField ID="hfdNewOPT" runat="server" ></asp:HiddenField>
                                    <asp:HiddenField ID="hfdProjectId" runat="server" />
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
									<asp:Label ID="Label21" runat="server" Text="Owner"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 37%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lblSalesmanNewOPT" runat="server" Text="" OnClick="lblSalesmanNewOPT_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtSalesmanNewOPT" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdSalesmanNewOPT" runat="server" />
									</div>
								</td>

							</tr>
                        <tr>
                             <td style="padding: 3px 5px;"  class="label-alignment no-border">
									<asp:Label ID="Label36" runat="server" Text="Products"></asp:Label>
								</td>
								<td rowspan="5" style="padding: 3px 5px; ; vertical-align: baseline;" class="label-alignment no-border">
									<asp:CheckBoxList runat="server" ID="chkProduct" CssClass="form-control chkboxlistlabel"></asp:CheckBoxList>
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
                            <div class="pull-left" >
                            <h3>
                                <asp:Label ID="Label8" ForeColor="White" Font-Bold="true" runat="server" Text="Project"></asp:Label>
                                
                            </h3>
                                </div>
                             <div class="pull-right" >

                                <%--  <asp:LinkButton ID="btnAdminHistory" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnAdminHistory_Click"
                                             ><i class="fa fa-address-book" title="Admin Remarks"></i></asp:LinkButton>--%>

                                 <%-- <asp:LinkButton ID="btnMediaInfo" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnMediaInfo_Click"
                                             ><i class="fa fa-newspaper-o" title="Media Information"></i></asp:LinkButton>--%>


                                  <%-- <asp:LinkButton ID="btnMajorInfo" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnMajorInfo_Click">
                                       <i class="fa  fa-info-circle" title="Major Information"></i></asp:LinkButton>--%>
                                  <asp:LinkButton ID="lbUpdatePRJ" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbUpdatePRJ_Click"
                                                ><i class="fa fa-save" aria-hidden="true" title="Update Project Details"></i></asp:LinkButton>   

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
                                         <asp:Label ID="Label2" class="panel-heading" Style="color: white;" runat="server" Text="Project Details"></asp:Label></h5>
                                 </div>
                                 <div class="pull-right" style="margin-top: -9px;margin-right: 10px;">
                                     
                                 </div>
                               
                             </asp:Panel>
                         

                       
						
							 <table class="table table-condensed" style="width: 100%;background-color:#e7e7e7;">

								 <tr>
									
                                     
									
										 <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">

											 <asp:Label ID="Label15" runat="server" Text="Project Number"></asp:Label>
										 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">

										 <asp:TextBox ID="txtProjectNumberEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
										
										 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label20" runat="server" Text="Name"></asp:Label>
                                         	 <asp:HiddenField ID="hfdPRJID" runat="server" />
									 </td>

									 <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtPRJNameEdit" runat="server" CssClass="textBox1 form-control " Enabled="true" Font-Bold="True"></asp:TextBox>
									 </td>
									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

										 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
											 <asp:Label ID="Label6" runat="server" Text="MEP Consultant"></asp:Label>
										 </td>
										 <td style="padding: 3px 5px; width: 8%" class="no-border">
											
                                              
                                              <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lbSearchMEPConsultantEdit" runat="server" Text="" OnClick="lbSearchMEPConsultantEdit_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
											<%--	 <asp:TextBox ID="txtMEPConsultantEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>--%>
                                                     <a href="#" runat="server" id="mepConsultant"> <asp:Label ID="txtMEPConsultantEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false" style="min-height:38px;max-width:250px;min-width:200px"></asp:Label></a>
                                             <asp:HiddenField ID="hfdMEPConsultantIdEdit" runat="server" />
											 </div>
										 </td>
                                          <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
										 <td style="padding: 3px 5px;" class="label-alignment no-border">
											 <asp:Label ID="Label1" runat="server" Text="Marketing"></asp:Label>
										 </td>
										 <td style="padding: 3px 5px;" class="no-border">
											
                                                
                                              <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lbSearchMarketingEdit" runat="server" Text="" OnClick="lbSearchMarketingEdit_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
                                            <asp:TextBox ID="txtMarketingEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                            <asp:HiddenField ID="hfdMarketingIDEdit" runat="server" />
											 </div>
										 </td>
								
									 
                                     </tr>
                                 <tr>
									 
				
								
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label16" runat="server" Text="Developer Client"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
                                          <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lblDeveloperClientEditSearch" runat="server" Text="" OnClick="lblDeveloperClientEditSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
												 <asp:TextBox ID="txtDeveloperClientEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                               <asp:HiddenField ID="hfdDeveloperClientIDEdit" runat="server" />

                                               <span class="input-group-text">
													 <asp:LinkButton ID="lbDeveloperClientClear" runat="server" Text="" OnClick="lbDeveloperClientClear_Click"><i class="tf-icons bx bx-refresh"></i></asp:LinkButton>

                                               </span>
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
                                       
									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                  <td style="padding: 3px 5px;" class="label-alignment no-border">
										 <asp:Label ID="Label7" runat="server" Text="Main Contractor"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px;" class="no-border">
                                             <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lbMainContractorEditSearch" runat="server" Text="" OnClick="lbMainContractorEditSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
												 <asp:TextBox ID="txtMainContractorEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                               <asp:HiddenField ID="hfdMainContractorIDEdit" runat="server" />
                                                  <span class="input-group-text">
													 <asp:LinkButton ID="lbMaincontractorClear" runat="server" Text="" OnClick="lbMaincontractorClear_Click"><i class="tf-icons bx bx-refresh"></i></asp:LinkButton>

                                               </span>
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
								 </tr>
								
								<tr>

									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label38" runat="server" Text="Scale"></asp:Label>
                                        <asp:HiddenField ID="hfdRelatedProj" Value="1" runat="server" />
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
							
							
								</tr>
                                
								 <tr>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label42" runat="server" Text="Country"></asp:Label>
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
                                        <asp:HiddenField ID="hfdOldStatus" runat="server" />
									</td>
                                     	 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px;" class="label-alignment no-border">
										 <asp:Label ID="Label22" runat="server" Text="Sales Stage"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px;" class="no-border">
										 <asp:DropDownList ID="ddlSalesStageEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="true"></asp:DropDownList>
                                         <asp:HiddenField ID="hfdOldSalesStage" runat="server" />
									 </td>
									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label4" runat="server" Text="Status"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
										 <asp:DropDownList ID="ddlStatusEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="true"></asp:DropDownList>
									 </td>

								 </tr>
                                  <tr>
                                     <td style="padding: 3px 5px; width: 5%;display:none" class="label-alignment no-border" >
										<asp:Label ID="Label23" runat="server" Text="Currency"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%;display:none" class="no-border">
										<asp:DropDownList ID="ddlCurrencyEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" ></asp:DropDownList>
									</td>
                                       <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border" >
										<asp:Label ID="Label24" runat="server" Text="Master Project"></asp:Label>
									    </td>
									    <td style="padding: 3px 5px; width: 8%;" class="no-border" colspan="4">
										 <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lbSearchMasterProject" runat="server" Text="" OnClick="lbSearchMasterProject_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
												<a href="#" runat="server" id="linkMasterProject"> <asp:Label ID="lblMasterProjectName" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:Label>
                                             </a>  <asp:HiddenField ID="hfdMasterProjectId" runat="server" />
											 </div>
									</td>
                                      <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                          <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border" >
										<asp:Label ID="Label37" runat="server" Text="Plot #"></asp:Label>
									    </td>
									    <td style="padding: 3px 5px; width: 8%;" class="no-border" >
										<asp:TextBox ID="txtPlotEdit" CssClass="textBox1 form-control " runat="server" />
									</td>

                                       <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                          <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border" >
										
									    </td>
									    <td style="padding: 3px 5px; width: 8%;" class="no-border" >
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
                                          <a id="aOpp" runat="server">
                                             <asp:Button ID="btnOpportunity" runat="server" Text="Opportunity" Width="224px" BackColor="Transparent" BorderStyle="None" OnClick="btnOpportunity_Click" />
                                         </a>
                                         <a id="aContact" runat="server">
                                             <asp:Button ID="btnContact" runat="server" Text="Contact" Width="235px" BackColor="Transparent" BorderStyle="None" OnClick="btnContact_Click"/>
                                         </a>
                                      <a id="aVenderL" runat="server">
                                             <asp:Button ID="btnVenderL" runat="server" Text="Vendor List" Width="235px" BackColor="Transparent" BorderStyle="None" OnClick="btnVenderL_Click"/>
                                         </a>
                                           <a id="aRAccount" runat="server">
                                             <asp:Button ID="btnRAccount" runat="server" Text="Related Account" Width="235px" BackColor="Transparent" BorderStyle="None" OnClick="btnRAccount_Click"/>
                                         </a>

                                        </div>
                                 </div>
                                <div class="pull-right" style="margin-top: -9px;margin-right: 10px;">
                                      <asp:LinkButton ID="lbAddOPT" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbAddOPT_Click"
                                                ><i class="fa fa-plus" aria-hidden="true" title="Add An Item"></i></asp:LinkButton>   

                                     <asp:LinkButton ID="lbContact" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbContact_Click"
                                                ><i class="fa fa-plus" aria-hidden="true" title="Add An Item"></i></asp:LinkButton>   
                                 </div>
                                
                                
                             </asp:Panel>


                            <%-- OPT details --%>
                         <div id="Div1" runat="server" style="overflow-x: auto">
                                 <asp:GridView ID="gdvOPtDetails" runat="server" AutoGenerateColumns="False"
                                     AllowSorting="True" EmptyDataText="No Data Found" AllowPaging="false" 
                                  OnRowCommand="gdvOPtDetails_RowCommand"   
                                     class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                     <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                     <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                     <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                     <Columns>
                    
                                           <asp:TemplateField HeaderText="Opportunity Number" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                     <asp:LinkButton ID="lblOPTNumber" Text='<%#(Eval("OpportunityNumber").ToString()) %>' CommandName="view" CommandArgument='<%#(Eval("Link").ToString()) %>'
                                                     runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Opportunity Name" ItemStyle-Width="15%" Visible="True">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblOPTName" Text='<%#(Eval("OpportunityName").ToString()) %>'
                                                     runat="server" />
                                                 <asp:HiddenField ID="hfdOpportunityId" Value='<%#(Eval("OpportunityID").ToString()) %>' runat="server" />
                                            
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                   
                                             <asp:TemplateField HeaderText="Customer" ItemStyle-Width="15%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblContractor" Text='<%#(Eval("Customer").ToString()) %>' runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Salesman" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblSalesman" Text='<%#(Eval("Salesman").ToString()) %>' runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Sales Stage" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                   <asp:Label ID="lblSalesStage" Text='<%#(Eval("SalesStageName").ToString()) %>' runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                    <asp:Label ID="lblStatus" Text='<%#(Eval("StatusCode").ToString()) %>' runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Company" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                    <asp:Label ID="lblCompany" Text='<%#(Eval("Company").ToString()) %>' runat="server" />
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


                              <%-- Related Project details --%>
                              <asp:GridView ID="gdvProjectRelated" runat="server" AutoGenerateColumns="False" Width="100%"
                                 CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found" OnRowCommand="gdvProjectRelated_RowCommand"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                  


                                     <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col10">
                                        <ItemTemplate>
                                           
                                                 <asp:LinkButton ID="lblAccountId" Text='<%#(Eval("col10").ToString()) %>' CommandName="view" CommandArgument='<%#(Eval("Link").ToString()) %>'
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



                                    <%-- <asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbView" runat="server" CommandName="View" CommandArgument='<%#(Eval("col1").ToString())%>' CssClass="btn rounded-pill btn-icon btn-round">
                                                <i class="fa fa-eye" title="View"></i>
                                               
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>

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
                             <asp:LinkButton type="button" class="btn btn-close" runat="server" id="btnMajorInfoClose" OnClick="btnMajorInfoClose_Click"/>
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
                                        <asp:HiddenField ID="hfdMajorFileId" runat="server" />
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
            

           <cc1:ModalPopupExtender ID="mpMediaInfo" runat="server" PopupControlID="pnlMediaInfo" TargetControlID="txtMediaNameP"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior23" RepositionMode="RepositionOnWindowResizeAndScroll"
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
                                 <asp:HiddenField ID="hfdMediaRefID" runat="server" ></asp:HiddenField>
                            </h4>

                        </div>


                        <div class="pull-right">
                             <asp:LinkButton type="button" class="btn btn-close" runat="server" id="btnMediInfoClose" OnClick="btnMediInfoClose_Click"/>
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
                                    <div>
                                        <asp:FileUpload ID="FileMedia" runat="server" />
                                        <asp:HiddenField ID="hfdMediaFileId" runat="server" />

                                    </div>
                                 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                  <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                      <asp:LinkButton ID="btnSaveMediaInfo" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnSaveMediaInfo_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
                                      </td>
                            </tr>
                              <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label46" runat="server" Text="Attatcment Comment"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtMediaComment" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
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
                                    <asp:TemplateField HeaderText="Media URL" ItemStyle-Width="12%" Visible="true" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblMediaURL" Text='<%#(Eval("MediaURL").ToString()) %>' 
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
                                            <asp:Label ID="lblCreatedBy" Text='<%#(Eval("CreatedBy").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Created Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" >
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


             <cc1:ModalPopupExtender ID="mpAdminRemarks" runat="server" PopupControlID="pnlAdminRemarks" TargetControlID="txtAdminRemarks"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior25" RepositionMode="RepositionOnWindowResizeAndScroll"
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
                          <asp:LinkButton type="button" class="btn btn-close" runat="server" id="btnCloseAdminRemarks" OnClick="btnCloseAdminRemarks_Click"/>
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
                                    <div>
                                        <asp:FileUpload ID="FileUpload" runat="server" />
                                        <asp:HiddenField ID="hfdRemarksFile" runat="server" />
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

                                    <asp:TemplateField HeaderText="Admin Remarks" ItemStyle-Width="25%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblAdminHistory" Text='<%#(Eval("AdminHistory").ToString()) %>'
                                                runat="server" />
                                        
                                        </ItemTemplate>

                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Update Date" ItemStyle-Width="12%" Visible="True" ItemStyle-HorizontalAlign="Center"  HeaderStyle-HorizontalAlign="Center"> 
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="lblUpdateDate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                      
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="12%" Visible="true" ItemStyle-HorizontalAlign="Center"  HeaderStyle-HorizontalAlign="Center">
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

           <%-- -----------Project History---------------- --%>


            <div class="modal fade" id="mpProjecthistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 315%; right: 108%;">
                        <div class="modal-header">
                            <h3 class="modal-title" id="h5">History</h3>
                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                            </button>
                        </div>
                        <div class="card-body" style="margin-top: -2%;">
                            <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-MoreInfo" aria-controls="tab-MoreInfo" aria-selected="false">More Information</button>
                                    </li>

                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-PRJMarketing" aria-controls="tab-PRJMarketing" aria-selected="false">Marketing Update</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-PRJHistory" aria-controls="tab-PRJHistory" aria-selected="false">History</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-PRJRemarks" aria-controls="tab-PRJRemarks" aria-selected="false">Admin History</button>
                                    </li>

                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-PRJMajorInfo" aria-controls="tab-PRJMajorInfo" aria-selected="false">Major Information</button>
                                    </li>

                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-PRJMediaInfo" aria-controls="tab-PRJMediaInfo" aria-selected="false">Media Information</button>
                                    </li>

                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Attatchment" aria-controls="tab-Attatchment" aria-selected="false">Attachment</button>
                                    </li>

                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Requests" aria-controls="tab-Requests" aria-selected="false">Status Requests</button>
                                    </li>


                                </ul>

                                <div class="tab-content">


                                    <div class="tab-pane fade show active" id="tab-MoreInfo" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped PRJ-MoreInfo-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th>Created By</th>
                                                        <th>Created Date</th>
                                                        <th>LastUpdatedBy</th>
                                                        <th>LastUpdated Date </th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-moreInfo">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>




                                    <div class="tab-pane fade" id="tab-PRJMarketing" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped PRJ-Marketing-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th>OverView</th>
                                                        <th>Remarks</th>
                                                        <th>UpdatedBy</th>
                                                        <th>Updated Date</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-PRJmarketing">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>


                                    <div class="tab-pane fade" id="tab-PRJHistory" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped PRJ-History-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th>Project Name</th>
                                                        <th>MEP consultant</th>
                                                        <th>Marketing</th>
                                                        <th>Developer Client</th>
                                                        <th>MainContractor Name</th>
                                                        <th>Scale</th>
                                                        <th>Construction Type</th>
                                                        <th>Type</th>
                                                        <th>SubType</th>
                                                        <th>Stage</th>
                                                        <th>Status</th>
                                                        <th>LastUpdatedBy</th>
                                                        <th>LastUpdatedDate</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-PRJhistory">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>


                                    <div class="tab-pane fade" id="tab-Requests" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped PRJ-MoreInfo-table">


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


                                    <div class="tab-pane fade" id="tab-PRJRemarks" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <asp:LinkButton ID="lbRemarks" runat="server" Style="text-align: center; float: right; margin-top: -3%;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbRemarks_Click"><i class="fa fa-plus" title="Major Info"></i></asp:LinkButton>

                                            <table class="table table-bordered table-striped PRJ-AdminHistory-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th>Remarks</th>
                                                        <th>UpdatedBy</th>
                                                        <th>Updated Date</th>
                                                        <th style="display: none;">URL</th>
                                                        <th>Attatchments</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-PRJadminhistory">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>


                                    <div class="tab-pane fade" id="tab-PRJMajorInfo" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <asp:LinkButton ID="lbMajorInfo" runat="server" Style="text-align: center; float: right; margin-top: -3%;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbMajorInfo_Click"><i class="fa fa-plus" title="Major Info"></i></asp:LinkButton>

                                            <table class="table table-bordered table-striped PRJ-MajorInfo-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th style="display: none;">Ref.No</th>
                                                        <th>Type</th>
                                                        <th>Source Of Info</th>
                                                        <th>Source Name</th>
                                                        <th>More Info</th>
                                                        <th>CreatedBy</th>
                                                        <th>Created Date</th>
                                                        <th style="display: none;">URL</th>
                                                        <th>Attatchment</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-PRmajorInfo">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>


                                    <div class="tab-pane fade" id="tab-PRJMediaInfo" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <asp:LinkButton ID="lbMedia" runat="server" Style="text-align: center; float: right; margin-top: -3%;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbMedia_Click"><i class="fa fa-plus" title="Major Info"></i></asp:LinkButton>

                                            <table class="table table-bordered table-striped PRJ-MediaInfo-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th style="display: none;">Ref.No</th>
                                                        <th>Instance Name</th>
                                                        <th>Media Name</th>
                                                        <th>Media Reference</th>
                                                        <th>More Info</th>
                                                        <th>CreatedBy</th>
                                                        <th>Created Date</th>
                                                        <th style="display: none;">URL</th>
                                                        <th>Attatchments</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-PRmediaInfo">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>


                                    <div class="tab-pane fade" id="tab-Attatchment" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped PRJ-MediaInfo-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th style="display: none;">Ref.No</th>
                                                        <th>Instance Name</th>
                                                        <th>Comments</th>
                                                        <th style="display: none">URL</th>
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
                                <asp:Label ID="Label47" class="subpnlhdg" runat="server" Text="Please Select Opportunities to Update 'OPEN'"></asp:Label>
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
							<asp:LinkButton ID="lbSaveRelatedOPTtoOpen" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSaveRelatedOPTtoOpen_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
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


                                                        <asp:TemplateField HeaderText="Name" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblName" Text='<%#(Eval("ProjectName").ToString()) %>'
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
                      Do You Really Want To Verify All The Details Regarding of This Project
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

                             <div style="padding-top:5px;text-align:center;" class="div-CancellReq">
                                      <asp:Label runat="server" Font-Size="X-Large" ForeColor="Red" Font-Bold="true">Please Enter Your Remark And Click Submit To send a Request For Cancel</asp:Label>
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


      <div class="modal fade" id="ModalOppChange" tabindex="-2" aria-hidden="true" style="background-color: #13131466">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalitemChange">MATERIAL RETURN REQUEST ITEM DETAILS</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">

                     <table class="table table-bordered table-striped Opp-Select-Change-table" style="width:100%;">


                    <thead>
                        <tr><th>Opt.No</th>
                            <th>Name</th>
                            <th>Owner</th>
                            <th>Status</th>
                            <th>Salesstage</th>
                            <th>Company</th>
                            <%-- <th style="display:none">Item Description</th>--%>
                           
                            <th>Action</th>
                           
                        </tr>
                    </thead>


                    <tbody class="tbody-Opplist">
                    </tbody>
                </table>


                    <div class="modal-footer">
                        <%--<button type="button" id="Button2" class="btn btn-primary" runat="server" data-bs-dismiss="modal">Add</button>--%>
                        <input type="button" id="btnChange" class="btn btn-primary" runat="server" value="Change" />

                    </div>
                </div>
            </div>
        </div>

    </div>


     <div class="modal fade" id="ConfirmHoldStage" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;padding-bottom:15%;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bx bx-check-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;color:#0dcb0d;"></i></div>
                    <div>
                        <h3>Are you sure?</h3>
                    </div>
                      Do You Really Want To Update Salesstage to HOLD
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-secondary" data-bs-dismiss="modal">NO</asp:LinkButton>
                        <asp:LinkButton ID="btnStageHold" runat="server" class="btn btn-primary btn-delete-act" OnClick="btnStageHold_Click">YES</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>



        </ContentTemplate>
      
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExport" />
             <asp:PostBackTrigger ControlID="btnSaveAdminRemakrs" />
             <asp:PostBackTrigger ControlID="lbSaveMajorInfo" />
            <asp:PostBackTrigger ControlID="btnSaveMediaInfo" />
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
