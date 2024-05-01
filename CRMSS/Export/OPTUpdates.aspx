<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="OPTUpdates.aspx.cs" Inherits="Export_OPTUpdates" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
     <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

       <style type="text/css">
    
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
     .kpi-user-list-table th{
        background-color: #a92828;
        color:white !important;
    }
           .overClass {
                overflow-y: auto;
                height: 54%;
           }
           
           ::-webkit-scrollbar {
            width: 4px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #888;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #555;
            }
            .overFlowNavKpi{
                 overflow-y: auto;
                height: 565px;
            }
            .accordion li{
                font-size: small;
            }

            .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
    background-color: #e14b4b;
    border-color: #e14b4b;
    box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%);
}
                /*Custom Menu Anwar*/
            .container{
    border-radius:3px;
    padding:5px;
    width: 60%;
    margin: 0 auto;
}

h2{
    font-weight: normal;
    font-size: 25px;
}
h2:hover{
    cursor: pointer;
}

.modal-dialog-centered {
    min-height: calc(100% - 22.5rem);
}

.modal-header {
    /*display: -webkit-box;
    display: -ms-flexbox;*/
    display: flex;
    -webkit-box-align: start;
    -ms-flex-align: start;
    /*align-items: flex-start;*/
    -webkit-box-pack: justify;
    /*-ms-flex-pack: justify;*/
    justify-content: space-between;
    padding: 1rem;
    border-bottom: 1px solid #98a2af !important;
    border-top-left-radius: 0.3rem;
    border-top-right-radius: 0.3rem;
}

.btn-primary:hover {
    color: #fff;
    background-color: #bb1414;
    border-color: #bb1414;
    transform: translateY(-1px);
}
/*#DataTables_Table_0_paginate a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}*/

#DataTables_Table_0_paginate .current {
    color: white !important;
    background: #a92828 !important;
}
  .table td{
        
        color:#333333 !important;
    }
.custom-loader{
        text-align: center;
    top: 40%;
    left: 44%;
    position: fixed;
    z-index: 99999999;
    box-shadow: 2px 2px 17px #e14b4b;
    border-radius: 20px;
    background: white;
    width: 10%;
    padding: 10px;
}
.hidden{
    display:none !important;
}
.iconClassExcel{
    margin-left:8px;
    background:#933737;
}
.iconClassPdf{
    
    background:#933737;
}

.iconClassExcel:hover{
    
    background:#a54141;
}
.iconClassPdf:hover{
    
    background:#a54141;
}
 .tablepopup th{
        background-color: #a92828;
        color:white !important;
        text-align:center;
    }
  .tablepopup td{
       
        text-align:center;
    }
   .tablepopup {
       
        width:100%;
    }
          .modal-xl {
               max-width: 1400px !important;
           }
            .loader-bg-blur{
              height: 100%;
    z-index: 9999999;
    position: fixed;
    background: #c3d3ce6b;
    width: 100%;
        }

            .select2-container--default .select2-selection--multiple .select2-selection__choice__display {
    cursor: default;
    padding-left: 12px !important;
    padding-right: 5px;
    color:#d4432c;

}
   /*dad*/
   .select2-container--default .select2-dropdown .select2-search__field:focus, .select2-container--default .select2-search--inline .select2-search__field:focus { 
    outline: 0;
    border: 1px solid #ffffff00;
}

   .select2-container--default.select2-container--focus .select2-selection--multiple {
    border: solid #d4591fb3 1px !important;
    outline: 0;
}
      .ui-datepicker-calendar {
            display: none;
        }
      .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
    background-color: #e70404c9;
    border-color: #e70404c9;
    box-shadow: 0 2px 4px 0 rgb(255 105 105 / 40%);
}
       .sforecast-table tr:hover{
            cursor:pointer;
        }
        .active-tr{
                border-left: 3px solid #db2f2f99 !important;
            }
        .sforecast-table tr{
font-size: small;
}
               .sforecast-table th{
font-size: smaller;
}   
      .tbody-sforecast-revenue-table tr{
font-size: small;
}
   .sforecast-revenue-table th{
font-size: 67%;
}

   .tbody-sforecast-revenue-table tr td{
       padding-top: 0em;
       text-align:center;
   }
   .save-forecastiproducts:hover{
       background-color:#ff310040;
       /*color:#ff310040;*/
   }
   .table th {
    background-color: #a92828;
    color: white !important;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%; padding-top: 1%;"><h4 style="text-shadow: 1px -3px 8px; color: #a92828;">Opportunity Updates </h4></div> 

  <div class="card-body" style="margin-top: -2%;">

     <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

                          <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label8" Text="Company" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select id="ddlCompany" class="form-select color-dropdown">
                              </select>
                          </td>


                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label10" Text="Manager" runat="server" Font-Size="Medium" Font-Bold="true" />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlManager"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label11" Text="Salesman" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlSalesman"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                         <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label1" Text="Sales Assistant" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlTeamMember"> </select>
                          </td>
                   
                          <td class="no-border" style="width: 5%">

                              <input type="button" id="btnSearch" value="Search" class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>
                      </tr>
                  </table>
      </div>


       <div class="ajax-loader loader-bg-blur">
          <div class="custom-loader ">
              <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
              <h4>Generating Report...</h4>
          </div>
      </div>

    <div class="" style="margin-top: 1%;">
          <table class="table table-bordered table-striped kpi-user-list-table">
  
    <thead style="vertical-align:middle;text-align:center">
  
       
        <tr>
             <th class="hidden">OPTID</th>
             <th>Country</th>
            <th> OPT Number</th>
            <th>Name</th>
            
              <th>Owner</th>
              <th >Assistant Owner</th>
              <th>Customer Name</th>
              <th>Stage</th>
              <th>Status</th>
            <th>Value</th>
               <th style="min-width:5%">Update Aging</th>
              <th>Overview</th>
              <th>Remarks</th>
              <th>WinPerc</th>
              <th style="min-width:12%;">Actions</th>
          
        </tr>
    </thead>
    <tbody class="tbody-employees">

    </tbody>
  </table>
 
</div>




    </div>
</div>
   
    <div class="modal fade" id="mpMoreDetails" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >More Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="" style="margin-top: 1%;">



                        <div class="nav-align-top">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-AssistantUpdates" aria-controls="navs-top-AssistantUpdates" aria-selected="true">Assistant Updates</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-ManagerUpdates" aria-controls="navs-top-ManagerUpdates" aria-selected="false">Manager Updates</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-revItems" aria-controls="navs-top-revItems" aria-selected="false">Revenue Details</button>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="navs-top-AssistantUpdates" role="tabpanel">

                                    <table class="table table-bordered table-striped  nowrap tablepopup">

                                        <thead>
                                            <tr>
                                                <th class="hidden">optNo</th>


                                                <th>Overview</th>
                                                <th>Remarks</th>
                                                <th>Win %</th>
                                                <th>Updated By</th>
                                                <th>Updated Date</th>
                                             


                                            </tr>
                                        </thead>
                                        <tbody class="tbody-others-AssistantUpdates">
                                        </tbody>
                                    </table>


                                </div>
                                <div class="tab-pane fade" id="navs-top-ManagerUpdates" role="tabpanel">
                                    <table class="table table-bordered table-striped  nowrap tablepopup">

                                        <thead>
                                            <tr>

                                               <th class="hidden">optNo</th>


                                                <th>Overview</th>
                                                <th>Remarks</th>
                                                <th>Win %</th>
                                                <th>Updated By</th>
                                                <th>Updated Date</th>



                                            </tr>
                                        </thead>
                                        <tbody class="tbody-ManagerUpdates">
                                        </tbody>
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="navs-top-revItems" role="tabpanel">
                                    <table class="table table-bordered table-striped  tablepopup">

                                        <thead>
                                            <tr>

                                                <th>OPT Number</th>
                                                <th>Product</th>
                                                <th>Substage</th>
                                                <th>Substage Date</th>
                                                <th>Status</th>
                                                  <th>QTN Number</th>
                                                  <th>QTN nDate</th>
                                                  <th>SO Number</th>
                                                <th>So Date</th>
                                                <th>VALUE</th>

                                            </tr>
                                        </thead>
                                        <tbody class="tbody-revItems">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <%--  <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Update Contract</button>
      </div>--%>
            </div>
        </div>
    </div>


     <%--rEQUEST lOST modal--%>

     <div class="modal fade" id="reqLostModal" tabindex="-1" aria-hidden="true" style="background: #00000052;">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="reqLostModalLabel4">Request Lost</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="row" >

                                    <div class="col-6 ddlLostReasonDiv">
                                        <label for="html5-number-input " class="col-form-label label-custom">Lost Reason</label>
                                        <div class="">
                                            <%--//<input class="form-control" type="text" value="" id="txtAccountId" />--%>
                                            <div>
                                                <select id="ddlLostReason" class="form-select color-dropdown ddlLostReason">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                      
                                        <div class="col-6">
                                             <label for="html5-number-input " class="col-form-label label-custom">Lost Date</label>
                                                <div>
                                                    <input type="text" id="DPLostDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" >
                                                </div>
                                            </div>
                                           
                                  
                    </div>

                    <div class="row">
                         <div class="col-6 ddlCompetitorDiv">
                                        <label for="html5-number-input " class="col-form-label label-custom">Competitor</label>
                                        <div class="">
                                            <%--//<input class="form-control" type="text" value="" id="txtAccountId" />--%>
                                            <div>
                                                <select id="ddlCompetitor" class="form-select color-dropdown ddlCompetitor">
                                                </select>
                                            </div>
                                        </div>
                                    </div>


                        <div class="col-6" >                                
                                    <label for="html5-number-input " class="col-form-label label-custom">Competitor Price</label>
                                <div>
                                    <input type="text" class="form-control" id="txtCompetPrice" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57" >
                                </div>                                 
                        </div>

                    </div>

                    <div class="row">

                        <label for="html5-number-input " class="col-form-label label-custom">Salesman Notes</label>
                        <div class="col-12">
                               <textarea id="taSalesNotes" class="form-control taSalesNotes" placeholder="Type your Notes..." aria-describedby="basic-icon-default-message2"></textarea>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-12" style="padding: 5px;">
                                <span class="btnSaveLostReason btn btn-primary" style="float:right;"> <i class="fa fa-floppy-o" aria-hidden="true"></i> Save</span>
                                
                            </div>

                    </div>

                </div>
            
            </div>
        </div>
    </div>
      <%--end--%>

        <%--Sales Forecast modal--%>

    <div class="modal fade" id="sForecastModal" tabindex="-1" aria-hidden="true" style="background: #00000052;">
        <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="sForecastModalModalLabel4">Sales Forecast</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="row" >

                        <div class="col-4" style="border-right: 1px solid #00000040">
                            <div class="row" style="padding: 2px;">
                                <div class="col-4">
                                    <label>Opportunity No.</label></div>
                                <div class="col-8">
                                    <input type="text" class="form-control" id="txtForecastOptNo" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57" disabled></div>
                            </div>
                            <div class="row" style="padding: 2px;">
                                <div class="col-4">
                                    <label>Forecasted For</label></div>
                                <div class="col-8">
                                    <input type="text" id="weeklyDatePickerForecast" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
                                </div>
                            </div>
                            <div class="row" style="padding: 2px;">
                                <div class="col-4">
                                    <label>Forecast Amount</label></div>
                                <div class="col-8">
                                    <input type="text" class="form-control" id="txtForecastAmount" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57"></div>
                            </div>
                            <div class="row" style="padding: 2px;">
                                <div class="col-4">
                                    <label>Remarks</label></div>
                                <div class="col-8">
                                    <textarea class="form-control" id="taForecastRemarks" placeholder="Input Remarks…." aria-describedby="basic-icon-default-message2"></textarea></div>
                            </div>

                            <hr />
                            <div class="row"  style="margin-top: 1%; max-height: 435px; overflow-y: auto; padding: 4px;">

                                <table class="table table-bordered table-striped sforecast-revenue-table">
                                    <%--<caption class="ms-4">List of Projects</caption>--%>
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Product Type</th>
                                            <th>Revenue Status</th>
                                            <th>Sub Stage</th>
                                            <th>Value</th>
                                        </tr>
                                    </thead>
                                    <tbody class="tbody-sforecast-revenue-table">
                                    </tbody>
                                </table>

                            </div>

                            <div class="row" style="padding: 5px;">
                                <span style="color: Tomato; border: solid 1px;  text-align: center;  cursor: pointer; height: 42px; line-height: 37px;" class="save-forecastiproducts"> <i class="fa fa-floppy-o" aria-hidden="true"></i> Save</span>
                                <%--<button class="btn"></button>--%>
                            </div>

                        </div>


                        <div class="col-8" style="margin-top: 1%; max-height: 650px; overflow-y: auto;">
                            <table class="table table-bordered table-striped sforecast-table">
                                <%--<caption class="ms-4">List of Projects</caption>--%>
                                <thead>
                                    <tr>
                                        <th>Forecasted Month</th>
                                        <th>Forecasted Amount	</th>
                                        <th>Remarks </th>
                                        <th>Products  </th>
                                        <th>Update Date</th>

                                    </tr>
                                </thead>
                                <tbody class="tbody-sforecast-table">
                                </tbody>
                            </table>

                        </div>


                    </div>

                </div>
                <%--     <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>--%>
            </div>
        </div>
    </div>
    <%--end--%>


       <script type="text/javascript">
                var currUserId = '';   
                var EmpNo = '';
                var myrole = '';
           var overAllPerfo = 0;
           var CRMUserID = '';
                $(document).ready(function () {
                    currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;               
                    EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';
                    CRMUserID = '<%=Session["CRMUserID"]%>';
                });

       </script>
    	<!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />


    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>
<%--    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>   
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.print.min.js"></script>--%>

     <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
    <%--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.13.1/datatables.min.css"/>--%>

    
    <script src="../Calendar/dist/js/adminlte.min.js"></script>
    
      <link href="dist/select2.css" rel="stylesheet" />
    <script src="dist/select2.js"></script>

    <script src="../Calendar/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../Calendar/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../Calendar/dist/js/adminlte.min.js"></script>
    <script src="../Calendar/plugins/moment/moment.min.js"></script>
    <script src="../Calendar/plugins/fullcalendar/main.js"></script>

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>




        <script src="https://phpcoder.tech/multiselect/js/jquery.multiselect.js"></script>
<link rel="stylesheet" href="https://phpcoder.tech/multiselect/css/jquery.multiselect.css">
 <%--     
    <script src="Datatable/js/jquery.dataTables.min.js"></script>--%>
   


	<!-- Datatable plugin JS library file -->	
    <script src="Scripts/OPTUpdates.js?v=11"></script>

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

</asp:Content>



