<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="CRMReportLoad.aspx.cs" Inherits="CRMAdmin_CRMReportLoad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <%--<link rel="stylesheet" href="plugins/fullcalendar/main.css">--%>

    <%--<link rel="stylesheet" href="../dist/css/adminlte.min.css">--%>
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
  .loader-bg-blur{
              height: 100%;
    z-index: 9999999;
    position: fixed;
    background: #c3d3ce6b;
    width: 100%;
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

 .label-custom
 {
    color: #d4432c !important;
    font-weight: 700 !important;
    text-transform: capitalize;
    font-size: 100%;
 }

  .nav-tabs .nav-item .nav-link:hover, .nav-tabs .nav-item .nav-link:focus {
            color: #ffffff;
            background: #e14b4b;
        }

        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #ffffff;
            background: #e14b4b;
            border-color: #fff;
        }


  .Elem {
  position: relative;
}

.Elem label {
  position: absolute;
  font-size: 10px;
  color: blue;
  left: 4px;
  top: 2px;
}

.Elem input {
  padding-left: 2px;
  padding-top: 15px;
  border-radius: 0;
}

.Elem input:focus {
  border-radius: 0;
  border-color: blue;
}
.hidden{
    display:none;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <div class="ajax-loader loader-bg-blur hidden">
          <div class="custom-loader">
              <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
              <h4>Loading Data...</h4>
          </div>
      </div>

          <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%; padding-top: 1%;"><h4 style="text-shadow: 1px -1px 8px; color: #a92828;">CRM REPORT</h4></div> 

  <div class="card-body" style="margin-top: -2%;">

     <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

                          <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label8" Text="Section" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select id="ddlSection" class="form-select color-dropdown">
                                  <option value="OPPORTUNITY">Opportunity</option>
                                   <option value="ACCOUNT">Account</option>
                                  <option value="MASTERACCOUNT">Master Account</option>
                                  <option value="PROJECT">Project</option>
                                  <option value="MASTERPROJECT">Master Project</option>
                              </select>
                          </td>
                            <td class="no-border">
                                <button type="button" class="btn btn-danger d-block btn-More"><i class="fa fa-sharp fa-light fa-filter fa-beat-fade" style="font-size:x-large;" title="More"></i></button>
                                
                              </td>
                          </tr>
                          
                  </table>
      </div>
  



     <div class="" style="margin-top: 1%;">
       <table class="table table-bordered table-striped kpi-user-list-table" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead class="thead-Report-list kpi-user-list-table-th">
                                                
                                            </thead>
                                            <tbody class="tbody-Report-list bx-" style="text-align: center;">
                                            </tbody>
                                        </table>

</div>
          
      </div>

 </div>

     

     <div class="modal fade" id="EventModal" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div style="padding-left: 2%; padding-top: 1%;"><h3 style="text-shadow: 1px -1px 8px; color: #a92828;">FILTRATION</h3></div> 
                    <div class="pull-right">                  
                        <span class="btnRefresh" style="float:right;"> 
                                                <i class="fa fa-refresh icon-largehover icon-btn-revenue" title="Refresh" style="color:#d33a3a; cursor:pointer;font-size: xx-large;padding-left: 562px;padding-top: 8px;"></i>   
                            </span>
                        
                        </div>

                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body" style="min-height: 400px;">

                     <div style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;background-color: #ffffff;padding-left: 13px;padding-right: 8px;width: 102%;margin-left: -7px;margin-top: -13px;">
                           
                                <%--1--%>
                               
                                <div class="Basic-Det">
                                    <div class="row">
                                    <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">Company</label>
                                        <div class="">
                                             <select id="ddlCompany" class="form-select color-dropdown">
                                             </select>
                                        </div>
                                    </div>


                                     <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">Manager</label>
                                        <div class="">
                                             <select id="ddlManager" class="form-select color-dropdown">
                                             </select>
                                        </div>
                                    </div>

                                      <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">Salesman</label>
                                        <div class="">
                                             <select id="ddlSalesman" class="form-select color-dropdown">
                                             </select>
                                        </div>
                                    </div>

                                        </div>
                                </div>

                                <div class="row">

                                    <div class="col-6">

                                        <label for="html5-time-input" class=" col-form-label label-custom">From Date</label>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="text" id="dateFromDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
                                            </div>
                                           
                                        </div>

                                    </div>

                                     <div class="col-6">

                                        <label for="html5-time-input" class=" col-form-label label-custom">To Date</label>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="text" id="DateTodate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
                                            </div>
                                          
                                        </div>

                                    </div>


                                </div>
                    <div class="OPP-Det">                       
                        <div class="row">
                                 
                                     <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">Status</label>
                                        <div class="">
                                             <select id="ddlStatusOpp" class="form-select color-dropdown">
                                             </select>
                                        </div>
                                    </div>

                                      <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">SalesStage</label>
                                        <div class="">
                                             <select id="ddlSalesStageOpp" class="form-select color-dropdown">
                                             </select>
                                        </div>
                                    </div>

                                      <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">Verification Status</label>
                                        <div class="">
                                             <select id="ddlVerifyOpp" class="form-select color-dropdown">
                                                 <option value="-1"> -- All -- </option>
                                                  <option value="1"> -- Verified -- </option>
                                                  <option value="0"> -- Not Verified -- </option>
                                             </select>
                                        </div>
                                    </div>
                                </div>
     

                        </div>
                    <div class="ACC-Det">
                     <div class="row">
                                 
                                     <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">Primary Category</label>
                                        <div class="">
                                             <select id="ddlPrimaryCategoryAcc" class="form-select color-dropdown">
                                             </select>
                                        </div>
                                    </div>

                                      <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">Country</label>
                                        <div class="">
                                             <select id="ddlCountryAcc" class="form-select color-dropdown">
                                             </select>
                                        </div>
                                    </div>

                                      <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">Verification Status</label>
                                        <div class="">
                                             <select id="ddlVerifyAcc" class="form-select color-dropdown">
                                                 <option value="-1"> -- All -- </option>
                                                  <option value="1"> -- Verified -- </option>
                                                  <option value="0"> -- Not Verified -- </option>
                                             </select>
                                        </div>
                                    </div>
                                    </div> 

                        </div>

                  <div class="MACC-Det">
                     <div class="row">
                                      <div class="col-12">
                                        <label class="col-form-label label-custom" for="basic-default-name">Verification Status</label>
                                        <div class="">
                                             <select id="ddlVerifyMAcc" class="form-select color-dropdown">
                                                 <option value="-1"> -- All -- </option>
                                                  <option value="1"> -- Verified -- </option>
                                                  <option value="0"> -- Not Verified -- </option>
                                             </select>
                                        </div>
                                    </div>
                                    </div> 

                        </div>

                  <div class="MPRJ-Det">
                     <div class="row">
                                 
                                    <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">Country</label>
                                        <div class="">
                                             <select id="ddlCountryMPRJ" class="form-select color-dropdown">
                                             </select>
                                        </div>
                                    </div>

                                      <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">Type</label>
                                        <div class="">
                                             <select id="ddlTypeMPRJ" class="form-select color-dropdown">
                                                   <option value="-1"> -- All -- </option>
                                                  <option value="LEAD"> -- Lead -- </option>
                                                  <option value="MASTER PROJECT"> -- Master Project -- </option>
                                             </select>
                                        </div>
                                    </div>

                                      <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">Verification Status</label>
                                        <div class="">
                                             <select id="ddlVerifyMPRJ" class="form-select color-dropdown">
                                                 <option value="-1"> -- All -- </option>
                                                  <option value="1"> -- Verified- - </option>
                                                  <option value="0"> -- Not Verified -- </option>
                                             </select>
                                        </div>
                                    </div>
                                </div>

                        </div>

                          <div class="PRJ-Det">
                     <div class="row">
                                 
                                    <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">Status</label>
                                        <div class="">
                                             <select id="ddlStatusPRJ" class="form-select color-dropdown">
                                             </select>
                                        </div>
                                    </div>

                                      <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">SalesStage</label>
                                        <div class="">
                                             <select id="ddlSalesStagePRJ" class="form-select color-dropdown">
                                             </select>
                                        </div>
                                    </div>

                                      <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">Verification Status</label>
                                        <div class="">
                                             <select id="ddlVerifyPRJ" class="form-select color-dropdown">
                                                 <option value="-1"> -- All -- </option>
                                                  <option value="1"> -- Verified -- </option>
                                                  <option value="0"> -- Not Verified -- </option>
                                             </select>
                                        </div>
                                    </div>
                                </div>

                        </div>

                          <div class="row Media-Info">
                                 
                                     <div class="col-12">
                                        <label class="col-form-label label-custom" for="basic-default-name">Media Information</label>
                                        <div class="">
                                        
                                            <div class="col-12">    
                                            <select id="ddlMedia" class="form-select color-dropdown">
                                                <option value="-1"> -- All -- </option>
                                                  <option value="0"> -- With Media -- </option>
                                                  <option value="1"> -- Without Media -- </option>
                                             </select>
                                    
                                      
                                                </div>
                                          
                                            
                                            
                                       </div>
                                    </div>

                                    </div>

                          <div class="row">
                                 
                                     <div class="col-12">
                                        <label class="col-form-label label-custom" for="basic-default-name">General Search</label>
                                        <div class="row">
                                        
                                            <div class="col-12 Elem">    
                                             <input type="text" id="txtGeneralSearch" placeholder="Search Element" class="form-control">
                                    
                                            <label ID="lblNotValuable" for="txtGeneralSearch" Text=""><i class="fa fa-circle" style="color:red;margin-left: 736px;margin-top: 15px;font-size: small;"></i></label>
                                                <label ID="lblValuable" for="txtGeneralSearch" Text=""><i class="fa fa-circle" style="color:#09e109;margin-left: 736px;margin-top: 15px;font-size: small;"></i></label>
                                                </div>
                                          
                                            
                                            
                                       </div>
                                    </div>

                                    </div>
                                 
                  

                 <div class="modal-footer" style="padding-top:3%;">

                                    <button type="button" id="BtnExport" class="btn btn-danger d-block">Export</button>
                                    <button type="button" id="BtnSearchDet" class="btn btn-danger d-block">Search</button>

                                     
                                    
                                </div>
                      </div>
                </div>

        </div>
            </div>

    </div>





      <script type="text/javascript">
                var currUserId = '';   
                var EmpNo = '';
                var myrole = '';
                var overAllPerfo=0;
                $(document).ready(function () {
                    currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;               
                    EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';

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

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
    <%--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.13.1/datatables.min.css"/>--%>
    
 <%--     
    <script src="Datatable/js/jquery.dataTables.min.js"></script>--%>
   


	<!-- Datatable plugin JS library file -->	
    <script src="Script/CRMReportLoad.js?v=0.9"></script>
     <link href="dist/select2.css" rel="stylesheet" />
    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <%--<link rel="stylesheet" href="https://phpcoder.tech/multiselect/css/jquery.multiselect.css">--%>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
</asp:Content>

