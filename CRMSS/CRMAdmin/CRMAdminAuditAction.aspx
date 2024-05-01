<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="CRMAdminAuditAction.aspx.cs" Inherits="CRMAdmin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

        <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

       <style type="text/css">
    
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    
        }*/

      .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
    color: #ffffff;
    background-color: #cb1d02;
    border-color: #fff;
   
}
 .nav-tabs .nav-item .nav-link.active
 {
     color: #ffffff;
    background-color: #cb1d02;
    border-color: #fff;
 }
 .nav-tabs .nav-item .nav-link:hover
 {
      color: #ffffff;
    background-color: #cb1d02;
    border-color: #fff;
 }
  .nav-tabs .nav-item .nav-link:not(.active) {
        color: black;
        background-color: #b4b9bf;
          
}

     .kpi-user-list-table th{
            text-align: center;
            color: white !important;
            background-color: #d54832;
    }
      .kpi-user-list-table td{
        border-bottom: 1px solid #96a2ab45  !important;
    }
      .kpi-user-History-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .kpi-user-History-table td {
             color: #333333 !important;
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
            text-align: center;
            color: white !important;
            background-color: #d54832;
    }
  .tablepopup td{
       
        border-bottom: 1px solid #96a2ab45  !important;
    }
   .tablepopup {
       
        width:100%;
    }
          .modal-xl {
               max-width: 1400px !important;
           }
 .hidden{
     display:none;
 }

 .btn-primary:hover {
    color: #fff;
    background-color: #bb1414;
    border-color: #bb1414;
    transform: translateY(-1px);
}


.label-custom {
    color: #d4432c !important;
    font-weight: 200 !important;
    text-transform: capitalize;
    /* padding-top: 3px; */
}


/*For New Form */
.form-control {
    display: block;
    width: 100%;
    padding: 0.4375rem 0.875rem;
    font-size: 12px;
    font-weight: 200;
    line-height: 0.25;
    color: #697a8d;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #d9dee3;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border-radius: 0.375rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.form-select {
    display: block;
    width: 100%;
    padding: 0.4375rem 1.875rem 0.4375rem 0.875rem;
    -moz-padding-start: calc(0.875rem - 3px);
    font-size: 0.7375rem;
    font-weight: 150;
    line-height: 15px;
    color: #697a8d;
    background-color: #fff;
    background-image: url(data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%2867, 89, 113, 0.6%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e);
    background-repeat: no-repeat;
    background-position: right 0.875rem center;
    background-size: 17px 12px;
    border: 1px solid #d9dee3;
    border-radius: 0.375rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
}

textarea.form-control {
    min-height: calc(1.53em + 0.875rem + 2px);
    padding-top: 14px;
    padding-bottom: 14px;
}

.modal-content {
    position: relative;
    display: flex;
    flex-direction: column;
    width: 100%;
    pointer-events: auto;
    background-color: #ffffffed;
    background-clip: padding-box;
    border: 0px solid rgba(67, 89, 113, 0.2);
    border-radius: 0.5rem;
    outline: 0;
}

.modal-header {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: start;
    -ms-flex-align: start;
    align-items: flex-start;
    -webkit-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding: 1rem;
    border-bottom: 0px solid #364150; 
    border-top-left-radius: 0.3rem;
    border-top-right-radius: 0.3rem;
}

.btn-close-down {
    color: #fff;
    background-color: #7a7878;
    border-color: #7a7878;
}


element.style {
    padding-top: 5px;
}
.select2-container--default .select2-selection--single .select2-selection__rendered {
padding-top:5px !important;
}

.tbody-OPPDetails .History:hover{

    content:url("images/gif-book-line.gif");
}

.tbody-OPPDetails .viewmore:hover{

    content:url("images/gif-add-line.gif");
}



</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <div class="ajax-loader loader-bg-blur hidden">
          <div class="custom-loader ">
              <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
              <h4>Loading Data...</h4>
          </div>
      </div>


     <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%; padding-top: 1%;"><h4 style="text-shadow: 1px -1px 8px; color: #a92828;">OPPORTUNITY AUDIT ACTION</h4></div> 

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
                              <select class="form-select placement-dropdown" id="ddlMember"> </select>
                          </td>

                            <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label2" Text="Overview" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlOverview"> </select>
                          </td>

                          <%-- <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label1" Text="Admin Action" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlAdminAction">
                                  <option value="-1"> --- All --- </option>
                                  <option value="PENDING">PENDING</option>
                                  <option value="WAITING CONFIRMATION">WAITING CONFIRMATION</option>
                                  <option value="NEED MORE TIME">NEED MORE TIME</option>
                                   <option value="SITE VISIT">SITE VISIT</option>
                                  <option value="MEDIA FEEDBACK">MEDIA FEEDBACK</option>
                                  <option value="COMPLETED">COMPLETED</option>
                              </select>
                              
                          </td>--%>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                        
                   
                          <td class="no-border" style="width: 5%">

                              <input type="button" id="btnSearch" value="Search" class="btn btn-danger d-block" style="font-size:small" /> 
                          </td>

                          <td class="no-border" style="width: 5%">

                              <input type="button" id="btnExport" value="Export" class="btn btn-danger d-block" style="font-size:small" /> 
                          </td>
                      </tr>
                  </table>


         <div class="Opp-Details" style="margin-top: 1%;display:none;">
             <table class="table table-bordered table-striped kpi-user-list-table" style="width:100%;">

                 <thead>
                     <tr style="text-align: center">
                         <%--<th>Company</th>--%>
                         <th style="display:none;">OPT Id#</th>
                         <th style="width:8%;">OPT #</th>
                         <th style="width:10%;">Name</th>
                         <%-- <th>Plot #</th> --%>
                         <th style="width:8%;">MEP Contractor</th>
                         <th style="width:8%;">Salesman</th>
                         <th style="width:8%;">Marketing</th>
                         <th style="width:6%;">Verification Satus</th>
                         <th style="width:6%;">Opportunity Age</th>
                         <th style="width:6%;">Sales Stage Age</th>
                         <th style="width:6%;">Salesman Update Age</th>
                         <th style="width:6%;">Update by Status</th>
                         <th style="width:6%;">Salesman Update Status</th>
                         <th style="width:6%;">Value Range</th>
                         <th style="width:6%;">Marketing Update Age</th>
                         <th style="width:6%;">Audit Aging</th>
                         <th style="width: 6%">Actions</th>


                     </tr>
                 </thead>
                 <tbody class="tbody-OPPDetails">
                 </tbody>
             </table>
         </div>


      </div>
    </div>
 </div>


    <%-- Modal For Property Creation --%>

        <div class="modal fade" id="ModalActionDetails" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="lbladdproperty" style="text-shadow: 1px -1px 8px; color: #a92828;">ACTION DETAILS</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body proj-popup">
                        <div style="background: #1d1b1b36; padding: 30px; border-radius: 7px; border: 1px solid #1d1b1b36; box-shadow: 4px 4px 13px -7px #1d1b1b36;">


                        <div class="row">
                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">Opportunity Number</label>
                                <div class="">
                                    <input type="text" id="txtOptNo" class="form-control" style="color:black;height:40px;font-size: inherit;border-bottom: outset;" disabled>
                                </div>
                            </div>

                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">AuditBy</label>
                                <div class="">
                                    <input type="text" id="txtAuditBy" class="form-control" style="color:black;height:40px;font-size: inherit;border-bottom: outset;" disabled/>

                                </div>
                            </div>

                             <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">Audit Date</label>
                                <div class="">
                                    <input type="text" id="txtAuditDate" class="form-control" style="color:black;height:40px;font-size: inherit;border-bottom: outset;" disabled/>

                                </div>
                            </div>

                        </div>



                        <div class="row">
                           

                            <div class="col-6">
                                <label class="col-form-label label-custom" for="basic-default-name">Audit Finding <span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="txtAuditFinding" class="form-control" style="color:black;height:40px;font-size: inherit;border-bottom: outset;"  />
                                </div>

                            </div>

                            <div class="col-6">
                                <label class="col-form-label label-custom" for="basic-default-name">Action Required <span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="txtActionRequired" class="form-control" style="color:black;height:40px;font-size: inherit;border-bottom: outset;"  />
                                </div>
                            </div>

                            
                        </div>



                        <div class="row">

                             <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Severity<span style="color: red;">*</span></label>
                                <div>
                                       <div>
                                            <select id="ddlSevirity" class="form-select color-dropdown" style="color:black !important;height:40px !important;font-size: inherit !important;border-bottom: outset;">   
                                                
                                                
                                            </select>
                                        </div>
                                </div>


                            </div>

                             <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">DeadLine <span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="txtDeadLine" placeholder="Select Date" style="background: white;color:black;height:40px;font-size: inherit;border-bottom: outset;" class="form-control flatpickr-input active" readonly="readonly" >
                                    
                                </div>
                            </div>
                           

                            <div class="col-4" style="padding-top: 2px;">
                                <label for="html5-number-input" class="col-form-label label-custom">Action Owner <span style="color: red;">*</span></label>
                                <div>
                                    <%--<input type="text" id="txtActionOwner" class="form-control"/>--%>
                                    <select id="txtActionOwner" style="color:black;height:40px;font-size:inherit;border-bottom: outset;"></select>

                                </div>
                            </div>

                             <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">Final Status<span style="color: red;">*</span></label>
                                <div>
                                       <div>
                                            <select id="ddlFinalStatus" class="form-select color-dropdown" style="color:black !important;height:40px !important;font-size: inherit !important;border-bottom: outset;">   
                                                <option value="WON">WON</option>
                                                <option value="LOST">LOST</option>
                                                <option value="NO_SALE">NOSALE</option>
                                                <option value="AT_RISK">AT RISK</option>
                                                <option value="HOLD">HOLD</option>
                                                <option value="TO_SHIFTED">TO BE SHIFTED</option>
                                                <option value="UNKNOWN">UNKNOWN</option>
                                                <option value="NOT_CLEARED">NOT CLEARED</option>
                                                
                                            </select>
                                        </div>
                                </div>


                            </div>

                           

                          
                        </div>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <%--<button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>--%>
                        <button type="button" class="btn btn-primary btnAddProj" onclick="SubmitDetails()">Save</button>
                    </div>
                </div>
            </div>
        </div>

    <%-- End --%>



     <div class="modal fade" id="mpMoreData" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">More Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="" style="margin-top: 1%;">



                        <div class="nav-align-top">
                            <ul class="nav nav-tabs" role="tablist">


                                 <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-History" aria-controls="navs-top-History" aria-selected="false">History</button>
                                </li>

                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-SUpdates" aria-controls="navs-top-SUpdates" aria-selected="true">Salesman Updates</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-SMUpdates" aria-controls="navs-top-SMUpdates" aria-selected="true">Sales Manager Updates</button>
                                </li>
                                 <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-MUpdate" aria-controls="navs-top-MUpdate" aria-selected="true">Marketing Updates</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-RevInfo" aria-controls="navs-top-RevInfo" aria-selected="false">Revenue Details</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-MoreInfo" aria-controls="navs-top-MoreInfo" aria-selected="false">More information</button>
                                </li>

                                 <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-SalesOrder" aria-controls="navs-top-SalesOrder" aria-selected="false">Sales Order</button>
                                </li>
                            </ul>
                            <div class="tab-content">



                                 <div class="tab-pane fade show active" id="navs-top-History" role="tabpanel">

                                    <table class="table table-bordered table-striped  nowrap tablepopup">

                                        <thead>
                                            <tr>
                                               


                                                <th>Opportunity Number</th>
                                                <th>Severity</th>
                                                <th>UpdatedBy</th>
                                                <th>Updated Date</th>
                                                <th>Audit Finding</th>
                                                <th>Action Required</th>
                                                <th>Action Owner Emp.No</th>
                                                <th>Action Owner Nmae</th>
                                                <th>Action Owner DeadLine</th>
                                   
                                              
                                            </tr>
                                        </thead>
                                        <tbody class="tbody-History">
                                        </tbody>
                                    </table>


                                </div>



                                <div class="tab-pane fade" id="navs-top-SUpdates" role="tabpanel">

                                    <table class="table table-bordered table-striped  nowrap tablepopup">

                                        <thead>
                                            <tr>
                                                <th class="hidden">optNo</th>


                                                <th>Overview</th>
                                                <th>Remarks</th>
                                                <th>WinPerc</th>
                                                <th>UpdatedBy</th>

                                                <th>UpdatedDate</th>
                                              
                                            </tr>
                                        </thead>
                                        <tbody class="tbody-Supdate">
                                        </tbody>
                                    </table>


                                </div>
                                <div class="tab-pane fade show" id="navs-top-SMUpdates" role="tabpanel">

                                    <table class="table table-bordered table-striped  nowrap tablepopup">

                                        <thead>
                                            <tr>
                                                <th class="hidden">optNo</th>


                                                <th>Overview</th>
                                                <th>Remarks</th>
                                                <th>WinPerc</th>
                                                <th>UpdatedBy</th>

                                                <th>UpdatedDate</th>
                                              
                                            </tr>
                                        </thead>
                                        <tbody class="tbody-SMUpdates">
                                        </tbody>
                                    </table>


                                </div>
                                <div class="tab-pane fade show" id="navs-top-MUpdate" role="tabpanel">

                                    <table class="table table-bordered table-striped  nowrap tablepopup">

                                        <thead>
                                            <tr>
                                                <th class="hidden">optNo</th>


                                                <th>Overview</th>
                                                <th>Remarks</th>
                                                <th>WinPerc</th>
                                                <th>UpdatedBy</th>

                                                <th>UpdatedDate</th>
                                              
                                            </tr>
                                        </thead>
                                        <tbody class="tbody-MKTUpdates">
                                        </tbody>
                                    </table>


                                </div>
                                <div class="tab-pane fade" id="navs-top-RevInfo" role="tabpanel">
                                    <table class="table table-bordered table-striped  nowrap tablepopup">

                                        <thead>
                                            <tr>

                                                <th>Product Type</th>
                                                <th>Substage</th>
                                                <th>Substage Date</th>


                                                <th>Revenue Status</th>
                                                <th>Revenue Amount</th>
                                                <th>Overview</th>
                                                <th>Salesman Remarks</th>
                                                <th>Win perc</th>
                                                <th>Update Date</th>



                                            </tr>
                                        </thead>
                                        <tbody class="tbody-revenue">
                                        </tbody>
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="navs-top-MoreInfo" role="tabpanel">
                                    <table class="table table-bordered table-striped  tablepopup">

                                        <thead>
                                            <tr>

                                                <th>Company</th>
                                                <th>Project Number</th>
                                                 <th>Created Date</th>
                                                 <th>CreatedBy</th>
                                                 <th>LastUpdatedBy</th>
                                                 <th>LastUpdated Date</th>
                                                 <th>ActualClose Date</th>
                                                <th>Plot #</th>
                                                <th>Client Name</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody class="tbody-moreinfo">
                                        </tbody>
                                    </table>
                                </div>


                                   <div class="tab-pane fade" id="navs-top-SalesOrder" role="tabpanel">
                                    <table class="table table-bordered table-striped  tablepopup">

                                        <thead>
                                            <tr>

                                                <th style="display:none;">Oracle SOID</th>
                                                <th>Order Number</th>
                                                 <th>Org.Name</th>
                                                 <th>Order Date</th>
                                                 <th>Order Status</th>
                                                 <th>Value</th>
                                                 <th>Header Remarks</th>
                                                <th>Header LastUpdate</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody class="tbody-SalesOrder">
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
    <script src="Script/CRMAdminAuditAction.js?v=1.4"></script>
     <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>
     <script src="../KPI/Flatpickr/js/flatpickr.js"></script>

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


</asp:Content>

