<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="ContractMaster.aspx.cs" Inherits="FacilityManagementNew_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        .Contract-list-table th {
            text-align: center;
        }

        .proj-popup .row {
            margin-top: 5px;
        }
        .termination-table th
        {
           /* color: white !important;
            background-color: #d54832*/;
        }

         .termination-table td {
            color: #333333 !important;

        }

         .termination-doclist th{
             color: white !important;
            background-color: #d54832;

         }

         .termination-doclist td {
            color: #333333 !important;
          }

         .Finalestimation-doclist th
         {
            color: white !important;
            background-color: #d54832;
         }


        .Finalestimation-doclist td {
            color: #333333 !important;
        }

        .tenentDetails-table th {
            color: white !important;
            background-color: #d54832;
        }


        .tenentDetails-table td {
            color: #333333 !important;
        }

        .table-paymentDetails th {
            color: white !important;
            background-color: #d54832;
        }


        .table-paymentDetails td {
            color: #333333 !important;
        }



          .sdRefund-doclist-table th
          {
            color: white !important;
            background-color: #d54832;
          }

          .sdRefund-doclist-table td {
            color: #333333 !important;
          }

         .Finalmoveout-doclist th{
            color: white !important;
            background-color: #d54832;
         }

         .Finalmoveout-doclist td {
            color: #333333 !important;
          }

         .paymentdetails-table th
         {
            color: white !important;
            background-color: #d54832;
         }

         .paymentdetails-table td {
            color: #333333 !important;
          }


         .IniMoveout-Stage1doc-doclist th
         {
             color: white !important;
            background-color: #d54832;
         }

         .Initatemoveout-Stage1-table td {
            color: #333333 !important;
        }

         
         .MycontractRequest-table th
         {
             color: white !important;
            background-color: #d54832;
         }

         .MycontractRequest-table td {
            color: #333333 !important;
        }



         .initate-moveout-doclist th
         {
            color: white !important;
            background-color: #d54832;
         }

        .initate-moveout-doclist td {
            color: #333333 !important;
        }


        .Contract-list-table th {
            color: white !important;
            background-color: #d54832;
        }
        
        .table-pendingContract-Action th
        {
            background-color: #d54832 !important;
            color: white !important;
        }
        
         .table-pendingContract-Action td {
            color: #333333 !important;

        }
         .movein-finalapproved-table th
         {
             background-color: #d54832 !important;
            color: white !important;
         }
      .renewal-stage1-doclist th
      {
          background-color: #d54832 !important;
            color: white !important;
      }
        .renewal-stage1-doclist td {
            color: #333333 !important;

        }
     

         .moveIn-final-approvel-table th
        {
            background-color: #d54832 !important;
            color: white !important;
        }
        
         .moveIn-final-approvel-table td {
            color: #333333 !important;

        }
         .document-upload-details th
        {
            background-color: #d54832 !important;
            color: white !important;
        }
        
         .document-upload-details td {
            color: #333333 !important;

        }

         .table-Tenant-Details th
        {
            background-color: #d54832 !important;
            color: white !important;
        }
        
         .table-Tenant-Details td {
            color: #333333 !important;

        }
     
       
        
        .Inactive-contracts-table th {
            background-color: #d54832 !important;
            color: white !important;
        }

        .Inactive-contracts-table td {
            color: #333333 !important;

        }



        .Pending-Contract-table th {
            background-color: #d54832 !important;
            color: white !important;
        }

        .Pending-Contract-table td {
            color: #333333 !important;

        }

        .iconClassExcel {
            margin-left: 8px;
            /*background:#933737;*/
            color: #d54832;
            background-color: #ffffff;
            border: #f9bfa8 1px solid;
            box-shadow: 0 0.125rem 0.25rem 0 rgba(133, 146, 163, 0.4);
        }

            .iconClassExcel:hover {
                background: #a54141;
            }

            .iconClassExcel:hover {
                /*background:#a54141;*/
                background: #d54832;
            }

        #DataTables_Table_0_paginate .current {
            color: white !important;
            background: #d54832  !important;
        }

        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: white !important;
            background: #FFF;
            border-color: orangered;
        }

       /* .modal.show .modal-dialog {
            transform: translateY(0) scale(1)!important;
            background-color: #ffff!important;
        }*/

        .file--upload > label {
            color: hsl(210deg 52.77% 39.92%);
            border-color: hsl(212deg 14% 54%);
        }

        .hide
        {
            display:none;
        }
  

        .btn-renewal {
            color: #fff;
            background-color: #2196F3;
            border-color: #03A9F4;
            box-shadow: 0 0.125rem 0.25rem 0 rgb(33 150 243 / 0%);
        }

        .btn:hover {
            color: #ffffff;
        }

        .btn-contractrew {
            color: #fff;
            background-color: #2196F3;
            border-color: #2196F3;
        }
        .nav-tabs .nav-item .nav-link:not(.active) {
            background-color: #28292b45 !important;
        }
        /*end*/
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div class="card-body" style="margin-top: -1%; min-height: 85vh;">
            <%--<h2 style="padding:3px"></h2>--%>


            <h4 style="color: #a92828; margin-top: 13px">Contract Details  </h4>
            <%--Child Tab--%>
            <div class="nav-align-top row">
              
                
                <div>
                    <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                        <tr>

                          <%--  <td class="no-border  label-alignment" style="width: 3%">
                                <asp:Label ID="Label8" Text="Property" runat="server" Font-Size="Medium" Font-Bold="true" />
                            </td>
                            <td class="no-border" style="width: 12%">
                                <select id="ddlProperty" class="form-select color-dropdown">
                                </select>
                            </td>


                            <td class="no-border label-alignment" style="width: 1%"></td>
                            <td class="no-border  label-alignment" style="width: 5%">
                                <asp:Label ID="Label11" Text="Block" runat="server" Font-Size="Medium" Font-Bold="true" />
                            </td>
                            <td class="no-border" style="width: 12%">
                                <select class="form-select placement-dropdown" id="ddlBlock"></select>
                            </td>

                            <td class="no-border label-alignment" style="width: 1%"></td>
                            <td class="no-border  label-alignment" style="width: 3%">
                                <asp:Label ID="Label10" Text="Unit" runat="server" Font-Size="Medium" Font-Bold="true" />
                            </td>
                            <td class="no-border" style="width: 12%">
                                <select class="form-select placement-dropdown" id="ddlUnit"></select>
                            </td>--%>


                            <td class="no-border label-alignment" style="width: 1%"></td>
                            <td class="no-border  label-alignment" style="width: 5%">
                                <a href="#" class="btn btn-primary pull-right btn-add-contracts" id="id_btncontractAdd" data-bs-toggle="modal" data-bs-target="#ModalAddItems"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Contracts</a>
                            </td>
                        </tr>
                    </table>
                 </div>
            </div>
               
               <div class="nav-align-top row">

                    <ul class="nav nav-tabs" id="contract-tabs-ul"  role="tablist">

                        <li class="nav-item tab-PendContract">
                            <button type="button" id="tabpendingContra" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-pending-Contracts" aria-controls="navs-top-pending-Contracts" aria-selected="false">Pending</button>
                        </li>

                           <li class="nav-item">
                            <button type="button" id="tabmyrequest" class="nav-link hidden" role="tab" data-bs-toggle="tab" data-bs-target="#tab-MyContractRequest" aria-controls="tab-MyContractRequest" aria-selected="false">My Request</button>
                        </li>

                        <li class="nav-item">
                            <button type="button" id="listallcontract" class="nav-link hidden" role="tab" data-bs-toggle="tab"  data-bs-target="#navs-top-Contracts" aria-controls="navs-top-Contracts" aria-selected="false">Active</button>
                        </li>
                         

                        <li class="nav-item">
                            <button type="button" id="inactiveContract" class="nav-link hidden" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-inactive-Contracts" aria-controls="navs-top-inactive-Contracts" aria-selected="false">In active</button>
                        </li>

                      

<%--                         <li class="nav-item">
                            <button type="button" id="rejectedContra" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ContractRejected">Rejected</button>
                        </li>--%>
                        

                   </ul>
                     <div class="tab-content">

                         <div class="tab-pane fade show active tab-PendContract" id="navs-top-Contracts">
                             <div class="" style="margin-top: 1%;">
                                 <table class="table Contract-list-table" id="tblcontractlist" style="width: 100%;">

                                     <thead>
                                         <tr>
                                              <th>Contract No</th>
                                             <th style="display: none">PropertyID</th>
                                             <th style="display: none">BlockID</th>
                                             <th style="display: none">RoomID</th>
                                             <th style="display: none">ContractID</th>
                                             <th>PropertyName</th>
                                             <th style="display:none">BlockName</th>
                                             <th>RoomName</th>
                                             <th>Status</th>
                                             <th>No.Of Months</th>
                                             <th>StartDate</th>
                                             <th>EndDate</th>
                                             <th>Action</th>



                                         </tr>
                                     </thead>
                                     <tbody class="tbody-Contract-list">
                                     </tbody>
                                 </table>
                             </div>
                         </div>

                         <div class="tab-pane fade" id="navs-top-pending-Contracts">

                             <div class="" style="margin-top: 0%;">
                                 <table class="table Pending-Contract-table" id="tblpendingcontract" style="width: 100%;">

                                     <thead>
                                         <tr>

                                              <th>Contract No</th>
                                             <th style="display: none">PropertyID</th>
                                            
                                             <th style="display: none">BlockID</th>
                                             <th style="display: none">RoomID</th>
                                              <th style="display: none">ContractID</th>
                                            
                                             <th>PropertyName</th>
                                             <th style="display:none">BlockName</th>
                                              
                                             <th>RoomName</th>
                                             <th>Status</th>
                                             <th>No.Of Months</th>
                                             <th>StartDate</th>
                                             <th>EndDate</th>
                                             <th>Action</th>


                                         </tr>
                                     </thead>
                                     <tbody class="tbody-pending-contract">
                                     </tbody>
                                 </table>
                             </div>

                         </div>


                          <div class="tab-pane fade" id="navs-top-inactive-Contracts">
                             <div class="" style="margin-top: 1%;">
                                 <table class="table Inactive-contracts-table" id="tblinactiveContra" style="width: 100%;">

                                     <thead>
                                         <tr>
                                             <th style="display: none">PropertyID</th>
                                             <th style="display: none">BlockID</th>
                                             <th style="display: none">RoomID</th>
                                             <th style="display: none">ContractID</th>
                                             <th>PropertyName</th>
                                             <th>BlockName</th>
                                             <th>RoomName</th>
                                             <th>PropertyUsage</th>
                                             <th>ContractValue</th>
                                             <th>SecurityDeposit</th>
                                             <th>ModeOfPayment</th>
                                             <th>StartDate</th>
                                             <th>EndDate</th>
                                             <th>Action</th>



                                         </tr>
                                     </thead>
                                     <tbody class="tbody-Contract-inactivelist">
                                     </tbody>
                                 </table>
                             </div>
                         </div>

                          <div class="tab-pane fade" id="tab-MyContractRequest">
                             <div class="" style="margin-top: 1%;">
                                 <table class="table MycontractRequest-table" style="width: 100%;">

                                     <thead>
                                         <tr>
                                             <th>Contract No</th>
                                             <th style="display: none">PropertyID</th>
                                             <th style="display: none">BlockID</th>
                                             <th style="display: none">RoomID</th>
                                             <th style="display: none">ContractID</th>
                                             <th>PropertyName</th>
                                             <th style="display:none">BlockName</th>
                                             <th>RoomName</th>
                                             <th>Status</th>
                                             <th>No.Of Months</th>
                                             <th>StartDate</th>
                                             <th>EndDate</th>
                                             <th>Action</th>

                                         </tr>
                                     </thead>
                                     <tbody class="tbody-myContractRequest">
                                     </tbody>
                                 </table>
                             </div>
                         </div>


                     </div>
                </div>

         </div>

            <div class="ajax-loader custom-loader hidden">
                <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
                <h4>Please wait...</h4>
            </div>


    
    </div>

    <%-- Modal for Add Contracts --%>

    <div class="modal fade" id="ModalAddContracts" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<h5 class="modal-title" id="lbladditems">Create New Property</h5>--%>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">




                    <%--<div id="divproperty" style="background: #00000017; padding: 30px; border-radius: 12px; border: 2px solid #d3d3d3; box-shadow: 4px 4px 13px -7px #545454;">--%>

                        <div class="row">
                            <h6 class="prpmdl-hed" id="lbladditemsa">Contract Details</h6>

                        </div>

                        <div class="row">


                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Contract Number <span style="color: red;"></span></label>
                                <div>
                                    <input type="text" id="txtContractNo" class="form-control" />

                                </div>
                            </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Property<span style="color: red;"></span></label>
                                <div>
                                    <select id="ddlPropertyAdd" class="form-select color-dropdown">
                                    </select>
                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Block <span style="color: red;"></span></label>
                                <div>
                                    <div>
                                        <select id="ddlBlockAdd" class="form-select color-dropdown">
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Floor <span style="color: red;"></span></label>
                                <div>
                                    <div>
                                        <select id="ddlfloor" class="form-select color-dropdown">
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Unit <span style="color: red;"></span></label>
                                <div>
                                    <div>
                                        <select id="ddlUnitAdd" class="form-select color-dropdown">
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>


                         <div class="row">


                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Property Usage<span style="color: red;">*</span></label>
                                 <div>
                                    <input type="text" id="txtPropertyUsage" class="form-control" disabled />

                                </div>
                            </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">OwnerShip</label>
                                <div>
                                    <input type="text" id="txtOwnerShip" class="form-control" disabled />

                                </div>
                            </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Location</label>
                                <div>
                                  <div>
                                    <input type="text" id="txtLocation" class="form-control" disabled />

                                </div>
                                </div>
                            </div>

                             <div class="col-3">
                                 <label for="html5-number-input" class="col-form-label label-custom">Land Lord Name</label>
                                 <div>
                                     <div>
                                         <input type="text" id="txtLandLordName" class="form-control" disabled />

                                     </div>
                                 </div>
                             </div>

                        </div>


                         <div class="row">


                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Email</label>
                                 <div>
                                    <input type="text" id="txtEmail" class="form-control"  disabled />

                                </div>
                            </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Phone</label>
                                <div>
                                    <input type="text" id="txtPhone" class="form-control" disabled />

                                </div>
                            </div>

                             <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Property Type</label>
                                 <div>
                                    <input type="text" id="txtPropertyType" class="form-control" disabled />

                                </div>
                            </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">No.Of.Rooms</label>
                                <div>
                                    <input type="text" id="txtNoOfRooms" class="form-control" disabled />

                                </div>
                            </div>

                              

                        </div>


                         <div class="row">

                             <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Premise No<span style="color: red;">*</span></label>
                                   <div>
                                    <input type="text" id="txtPremiseNo" class="form-control" disabled />

                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Contract Value <span style="color: red;">*</span></label>
                                <div>
                                  <div>
                                    <input type="text" id="txtContractValue" class="form-control" />

                                </div>
                                </div>
                            </div>

                             <div class="col-2">
                                 <label for="html5-number-input" class="col-form-label label-custom">Security Deposit Amount <span style="color: red;">*</span></label>
                                 <div>
                                     <div>
                                         <input type="text" id="txtSecurityDepAmount" class="form-control" />

                                     </div>
                                 </div>
                             </div>

                             <div class="col-3">
                                 <label for="html5-number-input" class="col-form-label label-custom">Mode Of Payment <span style="color: red;">*</span></label>
                                 <div>
                                     <div>
                                         <input type="text" id="txtmodeofpayment" class="form-control" disabled />

                                     </div>
                                 </div>
                             </div>

                             
                              <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">No Of Payments<span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="txtgetnumberofpayments" class="form-control" disabled />

                                </div>
                            </div>

                             

                        </div>



                         <div class="row">

                               <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Description<span style="color: red;">*</span></label>
                                <div>
                                   
                                    <textarea class="form-control" id="txtDescription" rows="2" ></textarea>

                                </div>
                            </div>

                                 <div class="col-3">
                                 <label for="html5-number-input" class="col-form-label label-custom">Status <span style="color: red;">*</span></label>
                                 <div>
                                     <div>
                                         <select id="ddlActive" class="form-select color-dropdown">
                                            
                                                <option value="Active">Active</option>
                                                <option value="Inactive">Inactive</option>
                                         </select>

                                     </div>
                                 </div>
                             </div>
                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Contract Period From <span style="color: red;">*</span></label>
                                <div>
                                  <div>
                                    
                                      <input class="form-control" type="date" value="" id="txtContractPeriodFrom" />
                                     
                                </div>
                                </div>
                            </div>

                             <div class="col-2">
                                 <label for="html5-number-input" class="col-form-label label-custom">Contract Period To <span style="color: red;">*</span></label>
                                 <div>
                                     <div>
                                        
                                          <input class="form-control" type="date" value="" id="txtContractPeriodTo" />


                                     </div>
                                 </div>
                             </div>

                             
                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">No.Of.Months<span style="color: red;">*</span></label>
                                  <div>
                                    <input type="text" id="txtNoOfMonths" class="form-control" />

                                </div>
                            </div>

                        </div>

                    <div class="modal-footer" id="save-contractdetails" >
                        <%--<button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>--%>
                        <button type="button" id="btnsavecontract" class="btn btn-primary"  onclick="saveContract()">Save</button>
                    </div>


                    <%-- teanent and payment tabs --%>

                    <div style="margin-top: 1.5%;" class="divtenanttab hidden " id="Contracttenantdetails">
                        <div class="nav-align-top">

                            <ul class="nav nav-tabs" id="contract-Tenantdetails-ul" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-tenant" aria-controls="navs-top-tanant" aria-selected="true">Tenant List</button>
                                </li>

                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-paymentdtls" aria-controls="navs-top-paymentdtls" aria-selected="false">Payment Details</button>
                                </li>

                            </ul>
                            <div class="tab-content">

                                <div class="tab-pane fade show active" id="navs-top-tenant" role="tabpanel" style="margin-top: -2%;">

                                    <div>
                                        <a href="#" class="btn btn-primary pull-right btn-add-tenant-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Tenant</a>
                                    </div>

                                    <div class="table-responsive" style="margin-top: 1%; width: 100%;">

                                        <table class="table table-Tenant-Details" style="width: 100%;">

                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th style="display: none">TenantID</th>
                                                    <th style="display: none">ContractID</th>
                                                    <th style="display: none">UnitID</th>
                                                    <th>TenantType</th>
                                                    <th>EMP No./Passport No</th>
                                                    <th>Name </th>
                                                    <th>Email </th>
                                                    <th>Contact No </th>
                                                    <th style="display: none">Phone Number </th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-tenant-details" style="text-align: center;">
                                            </tbody>
                                        </table>

                                    </div>
                                </div>

                                <%-- 2nd --%>

                                <div class="tab-pane fade" id="navs-top-paymentdtls" role="tabpanel">

                                    <div>
                                        <a href="#" class="btn btn-primary pull-right btn-add-paymentdetls"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Payment Details</a>
                                    </div>


                                    <div class="table-responsive" style="margin-top: 0%; width: 100%;">
                                        <table class="table paymentdetails-table" style="width: 100%;">

                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th style="display: none">PaymentDetailsID</th>
                                                    <th style="display: none">ContractID</th>
                                                    <th style="display: none">UnitID</th>
                                                    <th> Mode Of Payment</th>
                                                    <th>Payee Name</th>
                                                    <th>Bank Name</th>
                                                    <th>Cash Amount </th>
                                                    <th>Payment Date </th>
                                                    <th>Cheque No </th>
                                                   
                                                    <th>Payment Status </th>


                                                </tr>
                                            </thead>
                                            <tbody class="tbody-payment-Details" style="text-align: center;">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <%-- end --%>


                    <div class="modal-footer" id="add-contract" >
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal"  onclick="addContract()">Submit Contract</button>
                    </div>

                     <div class="modal-footer hidden" id="renewal-contract" >
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="RenewalContract()">Renew</button>
                    </div>

                    <%--</div>--%>
                </div>
            </div>
        </div>
    </div>
    
    <%-- End --%>


    <%-- Modal Contract full details documents uplaoading etc --%>

    <div class="modal fade" id="ModalContractDetails" data-bs-backdrop="static" aria-hidden="true">
           <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
             <div class="modal-content"<%-- style="background: antiquewhite;"--%>>
               <div class="modal-header">
                 <h5 class="modal-title" id="lblprojDetailModal">Contract Details</h5>
                 <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
              
                   <div style=" margin-top: -13px; position: absolute; width: 96%;"> 
                       <div style=" text-align: right;">
                           <i class="bx bxs-chevron-up contract-det-drilldown" onclick="hideShowProjDetails()"></i>
                       </div>
                   </div>


                   <div id="ContractDetailsRowDiv" style="background: #1d1b1b36; padding: 17px; border-radius: 12px; border: 1px solid #1d1b1b36; box-shadow: 4px 4px 13px -7px #1d1b1b36;">

                       <div class="row">

                           <div style="width: 10%;display:none">
                               <label for="html5-number-input" class="col-form-label label-custom">Contract ID </label>
                               <div class="">

                                   <input class="form-control" type="text" id="textcontractid"  readonly />
                               </div>
                           </div>

                           <div style="width: 20%;display:none">
                               <label for="html5-number-input" class="col-form-label label-custom">PropertyID </label>
                               <div class="">
                                   <input class="form-control" type="text" id="txtpropertyidmdl"  readonly />


                               </div>
                           </div>
                           <div style="width: 10%;display:none">
                               <label for="html5-number-input" class="col-form-label label-custom">UnitID</label>
                               <div class="">

                                   <input class="form-control" type="text" id="textunitidmdl"  readonly />
                               </div>
                           </div>

                           <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Property Name </label>
                               <div class="">

                                   <input class="form-control" type="text" id="textpropertynamemdl"  readonly />
                               </div>
                           </div>

                           <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Block Name</label>
                               <div class="">

                                   <input class="form-control" type="text" id="textblocknamemdl"  readonly />
                               </div>
                           </div>

                           <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Unit Name </label>
                               <div class="">

                                   <input class="form-control" type="text" id="textunitnamemdl"  readonly />
                               </div>
                           </div>
                           <div style="width:20%">
                               <label for="html5-number-input" class="col-form-label label-custom">PropertyUsage </label>
                               <div class="">

                                   <input class="form-control" type="text" id="textpropertyusagemdl" readonly />
                               </div>
                           </div>

                            <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Contract Value </label>
                               <div class="">
                                   <input class="form-control" type="text" id="textcontractvalmdl" readonly />

                               </div>
                           </div>

                           <%--<div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Number of Payments</label>
                               <div class="">
                                   <input class="form-control" type="text" id="textnumberofpaymentsmdl" readonly />

                               </div>
                           </div>--%>

                           


                       </div>


                       <div class="row">

                          

                           <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Security Deposit </label>
                               <div class="">

                                   <input class="form-control"  type="text" id="textsecdepositmdl"  readonly />
                               </div>
                           </div>

                           <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Mode Of Payment </label>
                               <div class="">
                                   <input class="form-control" type="text" id="textmodeofpaymentsdiv"  readonly />

                               </div>
                           </div>

                             <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Contract Start Date </label>
                               <div class="">
                                   <input class="form-control" type="text" id="textstartdatemdl"  readonly />

                               </div>
                           </div>

                           <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Contract End Date</label>
                               <div class="">
                                   <input class="form-control" type="text" id="textcontraenddatemld" readonly />
                               </div>
                           </div>

                             <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">No Of Months</label>
                               <div class="">
                                   <input class="form-control" type="text" id="textnoOfmnthmdl" readonly />

                               </div>
                           </div>



                           <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Description</label>
                               <div class="">
                                   <input class="form-control" type="text" id="textdescmdl" readonly />

                               </div>
                           </div>
                         <%--  <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Mode Of Payment </label>
                               <div class="">
                                   <input class="form-control" type="text" id="textmodeofpayment"  readonly />

                               </div>
                           </div>--%>

                           <%--<div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Beneficieary Bank </label>
                               <div class="">
                                   <input class="form-control" type="text" id="textbenefrybankmdl"  readonly />

                               </div>
                           </div>--%>

                            <div style="width: 20%;">
                               <label for="html5-number-input" id="lblcontractstatus" class="col-form-label label-custom">Status</label>
                               <div class="">

                                   <input class="form-control"  type="text" id="textstatus" readonly />

                                   <input class="form-control" type="text" id="textRevenewamount" readonly  style="display:none"/>
                                   <input class="form-control" type="text" id="textcreatedBy" readonly style="display:none" />


                               </div>
                           </div>
                         

                           


                       </div>

                       <div class="row">


                           

                         

                          

                           <div style="width: 40%;" id="contractflowbttns">
                               <%--<label for="html5-number-input" class="col-form-label label-custom">Status</label>--%>
                               <div style="display:flex;padding-top:30px">
                                   <div style="padding-left:10px">
                                        <button type="button" id="btn-contract-renewal" class="btn btn-success btncontract-RenewStage1" onclick="ContractRenewal()">Renewal</button>
                                    </div>

                                   <div style="padding-left:10px">
                                   <button type="button" id="btn-Renewal-amount" class="btn btn-renewal btn-contractRenewalAmount" onclick="ContractRenewalAmount()">Renewal Details</button>
                                    </div>


                                   <div style="padding-left:10px">
                                   <button type="button" id="btn-contract-termination" class="btn btn-danger btncontract-termination hidden" onclick="ContractTermination()">Termination</button>
                                    </div>
                                    <button type="button" id="btn-initate-moveout" class="btn btn-danger classinitate-moveout" style="margin-right:10px">Initate MoveOut</button>

                                     <button type="button" id="btn-cancel-termination" class="btn btn-success cancel-termination">Cancel Termination</button>

                                     <button type="button" id="btn-finalmoveout-docs" class="btn btn-danger classfinalmoveoutdocs hidden" >Final MoveOut </button>

                                    <button type="button" id="btn-finalmoveOutEstimation" class="btn btn-danger classfinalmoveoutEstimation hidden" >Final MoveOut estimation </button>

                                    <button type="button" id="btn-securitydepositRefund" class="btn btn-danger clsSecuritydepositRefund hidden" >Security Deposit Refund </button>

                                    

                                  <a href="#" class="btn btn-contractrew pull-right btn-addrenewal-contracts hidden" data-bs-toggle="modal" id="btn-addRenewal-contract" style="margin-left: 10px" data-bs-target="#ModalAddItems" ><i class="fa fa-plus" aria-hidden="false"></i>&nbsp; Add Renewed Contracts</a>

                                    <%--<a href="#" class="btn btn-primary pull-right btn-add-contracts" data-bs-toggle="modal" data-bs-target="#ModalAddItems" style="display:none;"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Contracts</a>--%>

                                  
                                      <%-- <button type="button" id="RenewalStage1Approvel1" class="btn btn-success btnRenewalstage1Approvel hidden" style="margin-right: 14px" onclick="RenewalStage1Approvel('APPROVED')">Approved</button>
                                       <button type="button" id="RenewalStage1Verify" class="btn btn-info btnRenewalstage1Verify hidden" style="margin-right: 14px" onclick="RenewalStage1Approvel('APPROVED')">Verified</button>
                                       <button type="button" id="RenewalStage1Rejected" class="btn btn-danger btnRenewalStageReject hidden" onclick="RenewalStage1Rejected('REJECTED')">Rejected</button>--%>

                                   <%--<button type="button" id="TerminationApprovel1" class="btn btn-success btnTerminationApprovel hidden" style="margin-right: 14px" onclick="TerminationApprovel('APPROVED')">Approved</button>
                                   <button type="button" id="TerminationVerify" class="btn btn-info btnTerminationVerify hidden" style="margin-right: 14px" onclick="TerminationApprovel('APPROVED')">Verified</button>
                                   <button type="button" id="TerminationRejected" class="btn btn-danger btnTerminationRejected hidden" onclick="TerminationRejected('REJECTED')">Rejected</button>--%>

<%--                                   <button type="button" id="btn-moveoutStage1Apoprovel" class="btn btn-success classmoveoutstage1Approvel hidden" style="margin-right: 14px" onclick="MovepotApprovelstage1('APPROVED')">Approved</button>
                                   <button type="button" id="btn-moveoutStage1Verify" class="btn btn-info classmoveoutstage1Verify hidden " style="margin-right: 14px" onclick="MovepotApprovelstage1('APPROVED')">Verified</button>
                                    <button type="button" id="btn-moveoutStg1Rej" class="btn btn-danger classmoveoueRej hidden" onclick="Moveoutst1Rej('REJECTED')">Rejected</button>--%>
                                   
                                  <%-- 
                                   <button type="button" id="btnMoveoutfinalApprovel" class="btn btn-success moveoutFinalApprovel hidden" style="margin-right: 14px" onclick="FinalmoveoutApprovel('APPROVED')">Approved</button>
                                   <button type="button" id="btnMoveoutFinalverify" class="btn btn-info moveoutFinalVerify  hidden" style="margin-right: 14px" onclick="FinalmoveoutApprovel('APPROVED')">Verified</button>
                                   <button type="button" id="btnMoveoutFinalrej" class="btn btn-danger moveoutFinalRejection hidden" onclick="FinalmoveoutRejected('REJECTED')">Rejected</button>--%>


                                  <%-- <button type="button" id="btnfinalEstimationApprovel" class="btn btn-success finalestimationApprovel hidden" style="margin-right: 14px" onclick="MOFinalEstimationApprovel('APPROVED')">Approved</button>
                                   <button type="button" id="btnFinalestimationVerify" class="btn btn-info finalestimationVerify  hidden" style="margin-right: 14px" onclick="MOFinalEstimationApprovel('APPROVED')">Verified</button>
                                   <button type="button" id="btnFinalestimationRejected" class="btn btn-danger finalestimationrejected hidden" onclick="RejectedFinalEstimation('REJECTED')">Rejected</button>--%>
                                   
                                 <%--  <button type="button" id="btnSEdepositRefundApprovel" class="btn btn-success securityDepoditRefundApprovel hidden" style="margin-right: 14px" onclick="SecurityDepositRefundApprovel('APPROVED')">Approved</button>
                                   <button type="button" id="btnSEdepositRefundVerify" class="btn btn-info securityDepositRefundVerify  hidden" style="margin-right: 14px" onclick="SecurityDepositRefundApprovel('APPROVED')">Verified</button>
                                   <button type="button" id="btnSEdepositRefundRejected" class="btn btn-danger securityDepositRefundRejected hidden" onclick="SecurityDepositRefuRejected('REJECTED')">Rejected</button>--%>



                               </div>
                           </div>

                       </div>

                        <div class="row" style="display:none">


                            <div style="width:20%;">
                                 <input class="form-control" type="text" id="textContractApprovel" readonly />
                            </div>

                           <div style="width: 20%;">
                                <input class="form-control" type="text" id="textmoveinstageapprovel" readonly />
                           </div>
                            <div style="width: 20%;">
                                <input class="form-control" type="text" id="textMovingStage2Appeovel" readonly />
                           </div>

                             <div style="width: 20%;">
                                <input class="form-control" type="text" id="textrenewalstage1approvel" readonly />
                           </div>

                            <div style="width: 20%;">
                                <input class="form-control" type="text" id="textterminationapprovel" readonly />
                           </div>
                            

                           

                       </div>

                   </div>
                   

                   <%--Grid--%>


    <div style="margin-top:1.5%;" class="divDocumenttabs" id="Contractdoctabs">

             <div class="nav-align-top">
                 <ul class="nav nav-tabs" id="contract-details-modal-ul" role="tablist">
                     <li class="nav-item">
                         <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-tenant1" aria-controls="navs-top-tanant1" aria-selected="true">Tenant List</button>
                     </li>

                     <li class="nav-item">
                         <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-paymentdtls1" aria-controls="navs-top-paymentdtls1" aria-selected="false">Payment Details</button>
                     </li>

                     <li class="nav-item">
                         <button id="btnContractDet" type="button" class="nav-link active " role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-contractDocs" aria-controls="navs-top-contractDocs" aria-selected="false">Contract Documents</button>
                     </li>

                     <li class="nav-item">
                         <button type="button" id="tabmoveinfinal" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-movein-final" aria-controls="navs-movein-final" aria-selected="false">MoveIn Final Approval</button>
                     </li>

                      <li class="nav-item">
                         <button type="button" id="Renewalstage1mail" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-renewal-stage1" aria-controls="navs-renewal-stage1" aria-selected="false">Renewal Confirmation</button>
                     </li>

                     <li class="nav-item">
                         <button type="button" id="TerminationConfirmMail" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-TerminationConfirmMail" aria-controls="navs-TerminationConfirmMail" aria-selected="false">Termination Confirmation</button>
                     </li>
                      <li class="nav-item">
                         <button type="button" id="tblInitialmoveout" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-InitialMoveout" aria-controls="navs-InitialMoveout" aria-selected="false">Initial MoveOut</button>
                     </li>

                      <li class="nav-item">
                         <button type="button" id="tblfinalmoveout" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-Finalmoveout" aria-controls="navs-Finalmoveout" aria-selected="false">Final MoveOut</button>
                     </li>
                      <li class="nav-item">
                         <button type="button" id="tblMaintenanceEstimation" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-MaintenanceEstimation" aria-controls="navs-MaintenanceEstimation" aria-selected="false">Maintenance Estimation</button>
                     </li>
                      <li class="nav-item">
                         <button type="button" id="tblSecurityDepositRefund" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-SecurityDepositRefund" aria-controls="navs-SecurityDepositRefund" aria-selected="false">Security Deposit Refund</button>
                     </li>
                    

                 </ul>
              <div class="tab-content">
                  <%--1st--%>
                <div class="tab-pane fade" id="navs-top-tenant1" role="tabpanel" style="margin-top: -2%;">

                   <%-- <div>
                        <a href="#" class="btn btn-primary pull-right btn-add-tenant-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Tenant</a>
                    </div>--%>
              
                                <div class="table-responsive" style="margin-top: 1%;width:100%;">
                                        
                                         <table class="table table-Tenant-Details" style="width: 100%;">
                                          
                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th style="display:none" >TenantID</th>  
                                                   <th style="display:none">ContractID</th>  
                                                   <th style="display:none">UnitID</th>  
                                                   <th>TenantType</th>
                                                   <th>EMP No./Passport No</th>
                                                   <th>Name </th>
                                                   <th>Email </th>
                                                    <th>Contact No </th>
                                                   <th style="display:none">Phone Number </th>
                                                                              
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-tenant-details" style="text-align:center;">

                                           </tbody>
                                         </table>
                               
                               </div>
                </div>

                  <%--2nd--%>
                <div class="tab-pane fade" id="navs-top-paymentdtls1" role="tabpanel" >

                     <%--<div>
                        <a href="#" class="btn btn-primary pull-right btn-add-paymentdetls"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Payment Details</a>
                    </div>
               --%>
                         
                                <div class="table-responsive" style="margin-top: 0%;width:100%;">
                                         <table class="table paymentdetails-table" style="width: 100%;">
                                          
                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th style="display:none" >PaymentDetailsID</th>  
                                                   <th style="display:none">ContractID</th>  
                                                   <th style="display:none">UnitID</th>                                                 
                                                   <th>Payee Name</th>
                                                   <th>Bank Name</th>
                                                   <th>Cash Amount </th>
                                                   <th>Payment Date </th>
                                                   <th>Cheque No </th>
                                                   <th>Cheque Amount </th>
                                                   <th>Payment Status </th>
                                                  
                                                                              
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-payment-Details" style="text-align:center;">

                                           </tbody>
                                         </table>
                               </div>
                </div>

                  <%--3rd--%>
                <div class="tab-pane fade show active" id="navs-top-contractDocs" role="tabpanel">

                     <div style="float:right">
                        <a href="#" class="btn btn-primary pull-right btn-add-documents"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Documents</a>
                          <button type="button" class="btn btn-primary btn-submit-dcocument active"  runat="server" data-bs-dismiss="modal" onclick="Stage1ApprovelStatusUpdate()">Submit Documents</button>

                    </div>
                             
                               <div class="table-responsive" style="margin-top: 0%;width:100%;">
                                         <table class="table document-upload-details" style="width: 100%;">
                                           
                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th style="display:none">DocumentID</th>
                                                   <th style="display:none">ContractID</th>
                                                   <th style="display:none">UnitID</th>
                                                   <th style="display:none">Sl.No</th>
                                                   <th>Document Name</th>
                                                   <th style="display:none">ImageURL </th>
                                                   <th>FileName </th>
                                                   <th>Stage </th>
                                                   <th>Status </th>
                                                   <th>Action</th>
                                                   
                                               </tr>
                                           </thead>
                                           <tbody class="tbody-documetlist" style="text-align:center;">

                                           </tbody>
                                         </table>
                               </div>
                    <div style="display:inline-flex;float:right">
                      <button type="button" id="btnDocReqApproved" class="btn btn-success btn-doc-approved" style="margin-right:14px" onclick="ContractDocPreApprovel('APPROVED')">Approved</button>
                      <button type="button" id="btnDocReqVerified" class="btn btn-info btn-doc-verified" style="margin-right:14px" onclick="ContractDocPreApprovel('APPROVED')">Verified</button>
                      <button type="button" id="btnDocReqRejected" class="btn btn-danger btn-doc-rejected" onclick="UpdatRejectReason('REJECTED')">Rejected</button>

                  </div>

                </div>

                  
                  <%-- 4th --%>

                  <div class="tab-pane fade" id="navs-movein-final" role="tabpanel">
                      <div style="float: right">
                          <a href="#" class="btn btn-primary pull-right btn-add-moveinFinalDoc"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Final Documents</a>
                          <button type="button" class="btn btn-primary btn-submit-finalDoc" runat="server" data-bs-dismiss="modal" onclick="Stage2ApprovelStatusUpdate()">Submit Documents</button>

                      </div>
                             
                                <div class="" style="padding-top: 2%;">
                                         <table class="table movein-finalapproved-table" style="width: 100%;">
                                           
                                               <thead>
                                                   <tr style="text-align: center;">
                                                   <th style="display:none">DocumentID</th>
                                                   <th style="display:none">ContractID</th>
                                                   <th style="display:none">UnitID</th>
                                                   <th>Sl.No</th>
                                                   <th>Document Name</th>
                                                   <th style="display:none">ImageURL </th>
                                                   <th>FileName </th>
                                                   <th style="display:none">Stage </th>
                                                   <th>Status </th>
                                                   <th>Action</th>
                                                   
                                               </tr>
                                               </thead>
                                           <tbody class="tbody-movein-finaldoc" style="text-align:center;">

                                           </tbody>
                                         </table>
                               </div>

                     <%-- <div class="hidden docImageDiv">
                          <div><a href="" id="aDOcFile" style="float: right;"><i class="fa fa-download docDownloadIcon" title="Download File" style="color: #d33a3a; cursor: pointer; font-size: xx-large;"></i></a></div>
                          <div style="overflow-y: auto; max-height: 500px; text-align: center;">
                              <img id="docImagePreview" src="" class="img-responsive" style="width: auto; height: auto;">
                          </div>
                      </div>--%>

                      <div style="display: inline-flex; float: right">
                          <button type="button" id="MovinFinaleReqApproved" class="btn btn-success btnMovinFinaleReqApproved" style="margin-right: 14px" onclick="MoveinfinalApprovel('APPROVED')">Approved</button>
                          <button type="button" id="MovinFinalReqVerified" class="btn btn-info btnMovinFinalReqVerified" style="margin-right: 14px" onclick="MoveinfinalApprovel('APPROVED')">Verified</button>
                          <button type="button" id="MoveinfinalReqRejected" class="btn btn-danger btnMoveinfinalReqRejected" onclick="MoveinFinalRejectReason('REJECTED')">Rejected</button>

                      </div>

                </div>


                 <%-- 5th --%>


                  <div class="tab-pane fade show" id="navs-renewal-stage1" role="tabpanel">

                      <div class="table-responsive" style="margin-top: 0%; width: 100%;">
                          <table class="table renewal-stage1-doclist" style="width: 100%;">

                              <thead>
                                  <tr style="text-align: center;">
                                      <th style="display: none">DocumentID</th>
                                      <th style="display: none">ContractID</th>
                                      <th style="display: none">UnitID</th>
                                      <th style="display: none">Sl.No</th>
                                      <th>Document Name</th>
                                      <th style="display: none">ImageURL </th>
                                      <th>FileName </th>
                                      <th>Stage </th>
                                      <th>Status </th>
                                      <th>Action</th>

                                  </tr>
                              </thead>
                              <tbody class="tbody-renewal-stage1" style="text-align: center;">
                              </tbody>
                          </table>

                      </div>

                      <div style="display: inline-flex; float: right">
                          <button type="button" id="RenewalStage1Approvel1" class="btn btn-success btnRenewalstage1Approvel hidden" style="margin-right: 14px" onclick="RenewalStage1Approvel('APPROVED')">Approved</button>
                          <button type="button" id="RenewalStage1Verify" class="btn btn-info btnRenewalstage1Verify hidden" style="margin-right: 14px" onclick="RenewalStage1Approvel('APPROVED')">Verified</button>
                          <button type="button" id="RenewalStage1Rejected" class="btn btn-danger btnRenewalStageReject hidden" onclick="RenewalStage1Rejected('REJECTED')">Rejected</button>
                      </div>
                  </div>


                  <%-- end --%>

                  <%-- 6th --%>


                  <div class="tab-pane fade show" id="navs-TerminationConfirmMail" role="tabpanel">

                      <div class="table-responsive" style="margin-top: 0%; width: 100%;">

                          <table class="table termination-doclist" style="width: 100%;">

                              <thead>
                                  <tr style="text-align: center;">
                                      <th style="display: none">DocumentID</th>
                                      <th style="display: none">ContractID</th>
                                      <th style="display: none">UnitID</th>
                                      <th style="display: none">Sl.No</th>
                                      <th>Document Name</th>
                                      <th style="display: none">ImageURL </th>
                                      <th>FileName </th>
                                      <th>Stage </th>
                                      <th>Status </th>
                                      <th>Action</th>

                                  </tr>
                              </thead>
                              <tbody class="tbody-termination" style="text-align: center;">
                              </tbody>
                          </table>

                      </div>

                      <div style="display: inline-flex; float: right">
                          <button type="button" id="TerminationApprovel1" class="btn btn-success btnTerminationApprovel hidden" style="margin-right: 14px" onclick="TerminationApprovel('APPROVED')">Approved</button>
                          <button type="button" id="TerminationVerify" class="btn btn-info btnTerminationVerify hidden" style="margin-right: 14px" onclick="TerminationApprovel('APPROVED')">Verified</button>
                          <button type="button" id="TerminationRejected" class="btn btn-danger btnTerminationRejected hidden" onclick="TerminationRejected('REJECTED')">Rejected</button>
                      </div>

                  </div>

                  <%-- 7th --%>

                  <div class="tab-pane fade show" id="navs-InitialMoveout" role="tabpanel">

                      <div class="table-responsive" style="margin-top: 0%; width: 100%;">

                          <table class="table IniMoveout-Stage1doc-doclist" style="width: 100%;">

                              <thead>
                                  <tr style="text-align: center;">
                                      <th style="display: none">DocumentID</th>
                                      <th style="display: none">ContractID</th>
                                      <th style="display: none">UnitID</th>
                                      <th style="display: none">Sl.No</th>
                                      <th>Document Name</th>
                                      <th style="display: none">ImageURL </th>
                                      <th>FileName </th>
                                      <th>Stage </th>
                                      <th>Status </th>
                                      <th>Action</th>

                                  </tr>
                              </thead>
                              <tbody class="tbody-IniMoveout-Stage1doc" style="text-align: center;">
                              </tbody>
                          </table>

                      </div>

                      <div style="display: inline-flex; float: right">

                          <button type="button" id="btn-moveoutStage1Apoprovel" class="btn btn-success classmoveoutstage1Approvel hidden" style="margin-right: 14px" onclick="MovepotApprovelstage1('APPROVED')">Approved</button>
                          <button type="button" id="btn-moveoutStage1Verify" class="btn btn-info classmoveoutstage1Verify hidden " style="margin-right: 14px" onclick="MovepotApprovelstage1('APPROVED')">Verified</button>
                          <button type="button" id="btn-moveoutStg1Rej" class="btn btn-danger classmoveoueRej hidden" onclick="Moveoutst1Rej('REJECTED')">Rejected</button>
                      </div>


                  </div>


                  <%-- 8th --%>

                  <div class="tab-pane fade show" id="navs-Finalmoveout" role="tabpanel">

                      <div class="table-responsive" style="margin-top: 0%; width: 100%;">

                          <table class="table Finalmoveout-doclist" style="width: 100%;">

                              <thead>
                                  <tr style="text-align: center;">
                                      <th style="display: none">DocumentID</th>
                                      <th style="display: none">ContractID</th>
                                      <th style="display: none">UnitID</th>
                                      <th style="display: none">Sl.No</th>
                                      <th>Document Name</th>
                                      <th style="display: none">ImageURL </th>
                                      <th>FileName </th>
                                      <th>Stage </th>
                                      <th>Status </th>
                                      <th>Action</th>

                                  </tr>
                              </thead>
                              <tbody class="tbody-finalmoneoutDoc" style="text-align: center;">
                              </tbody>
                          </table>

                      </div>

                      <div style="display: inline-flex; float: right">

                          <button type="button" id="btnMoveoutfinalApprovel" class="btn btn-success moveoutFinalApprovel hidden" style="margin-right: 14px" onclick="FinalmoveoutApprovel('APPROVED')">Approved</button>
                          <button type="button" id="btnMoveoutFinalverify" class="btn btn-info moveoutFinalVerify  hidden" style="margin-right: 14px" onclick="FinalmoveoutApprovel('APPROVED')">Verified</button>
                          <button type="button" id="btnMoveoutFinalrej" class="btn btn-danger moveoutFinalRejection hidden" onclick="FinalmoveoutRejected('REJECTED')">Rejected</button>
                      </div>

                  </div>

                  
                  <%-- 9th --%>

                  <div class="tab-pane fade show" id="navs-MaintenanceEstimation" role="tabpanel">

                      <div class="table-responsive" style="margin-top: 0%; width: 100%;">

                          <table class="table Finalestimation-doclist" style="width: 100%;">

                              <thead>
                                  <tr style="text-align: center;">
                                      <th style="display: none">DocumentID</th>
                                      <th style="display: none">ContractID</th>
                                      <th style="display: none">UnitID</th>
                                      <th style="display: none">Sl.No</th>
                                      <th>Document Name</th>
                                      <th style="display: none">ImageURL </th>
                                      <th>FileName </th>
                                      <th>Stage </th>
                                      <th>Status </th>
                                      <th>Action</th>

                                  </tr>
                              </thead>
                              <tbody class="tbody-finalestimation-doclist" style="text-align: center;">
                              </tbody>
                          </table>

                      </div>

                      <div style="display: inline-flex; float: right">
                          <button type="button" id="btnfinalEstimationApprovel" class="btn btn-success finalestimationApprovel hidden" style="margin-right: 14px" onclick="MOFinalEstimationApprovel('APPROVED')">Approved</button>
                          <button type="button" id="btnFinalestimationVerify" class="btn btn-info finalestimationVerify  hidden" style="margin-right: 14px" onclick="MOFinalEstimationApprovel('APPROVED')">Verified</button>
                          <button type="button" id="btnFinalestimationRejected" class="btn btn-danger finalestimationrejected hidden" onclick="RejectedFinalEstimation('REJECTED')">Rejected</button>
                      </div>

                  </div>

                   <%-- 10th --%>


                  <div class="tab-pane fade show" id="navs-SecurityDepositRefund" role="tabpanel">

                      <div class="table-responsive" style="margin-top: 0%; width: 100%;">

                          <table class="table sdRefund-doclist-table" style="width: 100%;">

                              <thead>
                                  <tr style="text-align: center;">
                                      <th style="display: none">DocumentID</th>
                                      <th style="display: none">ContractID</th>
                                      <th style="display: none">UnitID</th>
                                      <th style="display: none">Sl.No</th>
                                      <th>Document Name</th>
                                      <th style="display: none">ImageURL </th>
                                      <th>FileName </th>
                                      <th>Stage </th>
                                      <th>Status </th>
                                      <th>Action</th>

                                  </tr>
                              </thead>
                              <tbody class="tbody-sdRefund-doclist" style="text-align: center;">
                              </tbody>
                          </table>

                      </div>

                      <div style="display: inline-flex; float: right">
                          <button type="button" id="btnSEdepositRefundApprovel" class="btn btn-success securityDepoditRefundApprovel hidden" style="margin-right: 14px" onclick="SecurityDepositRefundApprovel('APPROVED')">Approved</button>
                          <button type="button" id="btnSEdepositRefundVerify" class="btn btn-info securityDepositRefundVerify  hidden" style="margin-right: 14px" onclick="SecurityDepositRefundApprovel('APPROVED')">Verified</button>
                          <button type="button" id="btnSEdepositRefundRejected" class="btn btn-danger securityDepositRefundRejected hidden" onclick="SecurityDepositRefuRejected('REJECTED')">Rejected</button>

                      </div>

                  </div>

              </div>
            </div>

    </div>
                   

               </div>
             
             </div>
           </div>
      </div>

    <%-- End --%>

    <%-- Modal for Pending Contract Details --%>

    <div class="modal fade" id="ModalPendingContractDetails" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
           <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
             <div class="modal-content"<%-- style="background: antiquewhite;"--%>>
               <div class="modal-header">
                 <h5 class="modal-title" id="lblpendingContradetails">Pending Contract Details</h5>
                 <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
              
                   <div style=" margin-top: -13px; position: absolute; width: 96%;"> 
                       <div style=" text-align: right;">
                           <i class="bx bxs-chevron-up proj-det-drilldown" onclick="hideShowProjDetails()"></i>
                       </div>
                   </div>


                   <div id="ContractDetailsRow1Div" style="background: #1d1b1b36; padding: 17px; border-radius: 12px; border: 1px solid #1d1b1b36; box-shadow: 4px 4px 13px -7px #1d1b1b36;">

                       <div class="row">

                           <div style="width: 10%;display:none">
                               <label for="html5-number-input" class="col-form-label label-custom">Contract ID </label>
                               <div class="">

                                   <input class="form-control" type="text" id="textcontractid1"  readonly />
                               </div>
                           </div>

                           <div style="width: 20%;display:none">
                               <label for="html5-number-input" class="col-form-label label-custom">PropertyID </label>
                               <div class="">
                                   <input class="form-control" type="text" id="txtpropertyidmdl1"  readonly />


                               </div>
                           </div>
                           <div style="width: 10%;display:none">
                               <label for="html5-number-input" class="col-form-label label-custom">UnitID</label>
                               <div class="">

                                   <input class="form-control" type="text" id="textunitidmdl1"  readonly />
                               </div>
                           </div>

                           <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Property Name </label>
                               <div class="">

                                   <input class="form-control" type="text" id="textpropertynamemdl1"  readonly />
                               </div>
                           </div>

                           <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Block Name</label>
                               <div class="">

                                   <input class="form-control" type="text" id="textblocknamemdl1"  readonly />
                               </div>
                           </div>

                           <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Unit Name </label>
                               <div class="">

                                   <input class="form-control" type="text" id="textunitnamemd1l"  readonly />
                               </div>
                           </div>
                           <div style="width:20%">
                               <label for="html5-number-input" class="col-form-label label-custom">PropertyUsage </label>
                               <div class="">

                                   <input class="form-control" type="text" id="textpropertyusagemdl1" readonly />
                               </div>
                           </div>

                          <%-- <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">ChillerAccountNumber</label>
                               <div class="">
                                   <input class="form-control" type="text" id="textchilleraccNomdl1" readonly />

                               </div>
                           </div>--%>

                             <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Contract Value </label>
                               <div class="">
                                   <input class="form-control" type="text" id="textcontractvalmdl1" readonly />

                               </div>
                           </div>


                       </div>


                       <div class="row">

                         

                           <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Security Deposit </label>
                               <div class="">

                                   <input class="form-control"  type="text" id="textsecdepositmdl1"  readonly />
                               </div>
                           </div>
                           <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Mode Of Payment </label>
                               <div class="">
                                   <input class="form-control" type="text" id="textmodeofpayment1"  readonly />

                               </div>
                           </div>

                       <%--    <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Beneficieary Bank </label>
                               <div class="">
                                   <input class="form-control" type="text" id="textbenefrybankmdl1"  readonly />

                               </div>
                           </div>--%>


                           <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Contract Start Date </label>
                               <div class="">
                                   <input class="form-control" type="text" id="textstartdatemdl1"  readonly />

                               </div>
                           </div>

                              <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Contract End Date</label>
                               <div class="">
                                   <input class="form-control" type="text" id="textcontraenddatemld1"  readonly />                                 
                               </div>
                           </div>

                           <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">No Of Months</label>
                               <div class="">
                                   <input class="form-control" type="text" id="textnoOfmnthmdl1"  readonly />    
                                   
                               </div>
                           </div>


                       </div>

                       <div class="row">

                           
                        

                           

                            <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Description</label>
                               <div class="">
                                   <input class="form-control" type="text" id="textdescmdl1"  readonly />
                                   
                               </div>
                           </div>

                            <div style="width: 20%;">
                               <label for="html5-number-input" class="col-form-label label-custom">Status</label>
                               <div class="">

                                    <input class="form-control" type="text" id="textstatus1"  readonly />
                                   
                               </div>
                           </div>

                       </div>

                       <div style="margin-left:75%;margin-top:10px">
                               <button type="button" id="btnunitReqApproved" class="btn btn-success btn-approved hidden "  onclick="pendingStatusUpdate('APPROVED')">Approved</button>
                               <button type="button" id="btnUnitReqVerified" class="btn btn-info btn-verified hidden "  onclick="pendingStatusUpdate('APPROVED')">Verified</button>
                               <button type="button" id="btnunitReqRejected" class="btn btn-danger btn-rejected"  onclick="pendingStatusUpdate('REJECTED')">Rejected</button>
                                
                           </div>

                   </div>
                   

                   <%--Grid--%>


                   <div style="margin-top: 1.5%;">

                       <div class="nav-align-top">
                           <ul class="nav nav-tabs" id="pendingContract-ul" role="tablist">
                               <li class="nav-item">
                                   <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-tanant" aria-controls="navs-top-tanant" aria-selected="true">Approvel Dtails</button>
                               </li>
                               <li class="nav-item">
                                   <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-tenant-details" aria-controls="navs-tenant-details" aria-selected="false">Tenant Details</button>
                               </li>
                               <li class="nav-item">
                                   <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-tenetPaymentDetails" aria-controls="navs-tenetPaymentDetails" aria-selected="false">Payment Details</button>
                               </li>
                           </ul>
                           <div class="tab-content">
                               <%--1st--%>
                               <div class="tab-pane fade show active" id="navs-top-pendingContra" role="tabpanel" style="margin-top: -2%;">

                                   <div class="table-responsive" style="margin-top: 1%; width: 100%;">
                                       <table class="table table-pendingContract-Action" style="width: 100%;">

                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th>Role Name</th>
                                                   <th>Action Taken By</th>
                                                   <th>Action Taken On</th>
                                                   <th>Comments</th>
                                                   <th>Status </th>

                                               </tr>
                                           </thead>
                                           <tbody class="tbody-pendingContra-Action" style="text-align: center;">
                                           </tbody>
                                       </table>
                                   </div>
                               </div>

                               <%--2nd--%>
                               <div class="tab-pane fade" id="navs-tenant-details" role="tabpanel">


                                   <div class="table-responsive" style="margin-top: 1%; width: 100%;">

                                       <table class="table tenentDetails-table" style="width: 100%;">

                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th style="display: none">TenantID</th>
                                                   <th style="display: none">ContractID</th>
                                                   <th style="display: none">UnitID</th>
                                                   <th>TenantType</th>
                                                   <th>EMP No./Passport No</th>
                                                   <th>Name </th>
                                                   <th>Email </th>
                                                   <th>Contact No </th>
                                                   <th style="display: none">Phone Number </th>

                                               </tr>
                                           </thead>
                                           <tbody class="tbody-tenantDetails" style="text-align: center;">
                                           </tbody>
                                       </table>

                                   </div>
                               </div>

                               <%--3rd--%>
                               <div class="tab-pane fade" id="navs-tenetPaymentDetails" role="tabpanel">

                                   <div class="table-responsive" style="margin-top: 0%; width: 100%;">
                                       <table class="table table-paymentDetails" style="width: 100%;">

                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th style="display: none">PaymentDetailsID</th>
                                                   <th style="display: none">ContractID</th>
                                                   <th style="display: none">UnitID</th>
                                                   <th>Payee Name</th>
                                                   <th>Bank Name</th>
                                                   <th>Cash Amount </th>
                                                   <th>Payment Date </th>
                                                   <th>Cheque No </th>
                                                   <th>Cheque Amount </th>
                                                   <th>Payment Status </th>


                                               </tr>
                                           </thead>
                                           <tbody class="tbody-paymentDetails" style="text-align: center;">
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
      </div>

    <%-- End --%>

    <%-- Rejected Reason --%>

    <div class="modal fade" id="Modalrejectreason" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <%--<h5 class="modal-title" id="lbladdbfloor">Add New Floor</h5>--%>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body proj-popup">

                        <div class="row">
                             <div>
                                <label class="col-form-label label-custom" for="basic-default-name">Enter The Reason For Rejection <span style="color: red;">*</span></label>
                                <div>
                                    <textarea class="form-control" id="textreasonforrejection" rows="4" ></textarea>
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="modal-footer">
                        <%--<button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>--%>
                        <button type="button" class="btn btn-primary" runat="server" data-bs-dismiss="modal" onclick="RejectReason()">Suibmit</button>
                        
                </div>
            </div>
        </div>
        </div>

    <%-- End --%>

    <%-- Modal Tenant add modal --%>

    <div class="modal fade" id="ModalAddtenant" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title" id="lblAddTenant">Add Tenant Details</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">



                    <div class="row">

                        <div class="col-4">
                            <label for="html5-number-input" class="col-form-label label-custom">Type<span style="color: red;">*</span> </label>
                            <div class="">


                                <select id="textenanttype" class="form-select color-dropdown">
                                    <option>---Select---</option>
                                    <option value="Internal" selected>Internal</option>
                                    <option value="External">External</option>

                                </select>

                            </div>
                        </div>

                        <div class="col-4">
                            <label for="html5-number-input" class="col-form-label label-custom">Employee No/Passport No<span style="color: red;">*</span> </label>
                            <div class="">
                                <input class="form-control" type="text" id="textemporpassNo"  />

                            </div>
                        </div>

                         <div class="col-4">
                            <label for="html5-number-input" class="col-form-label label-custom">Contact Number <span style="color: red;">*</span></label>
                            <div class="">

                                <input class="form-control" type="text" id="texttenantphnumber"  />
                            </div>
                        </div>
                    </div>
                   

                    <div class="row">

                       
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Name<span style="color: red;">*</span> </label>
                            <div class="">
                                <input class="form-control" type="text" id="texttenantname"  />

                            </div>
                        </div>

                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">E-mail<span style="color: red;">*</span> </label>
                            <div class="">

                                <input class="form-control" type="text" id="texttenantemaiul"  />
                            </div>
                        </div>
                    </div>

                   

                </div>
                 <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btnAddTenant"  runat="server" data-bs-dismiss="modal" onclick="addTenant()">Create</button>
                    </div>

            </div>
        </div>
    </div>


    <%-- End --%>

    <%-- modal Payment Details --%>

    <div class="modal fade" id="ModalAddContractPaymentDetails" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" >
            <div class="modal-content" >
                <div class="modal-header">
                    <h5 class="modal-title" id="lblAddpayment"> Contract Payment Details</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">


                     <div class="row">
                         <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Mode Of Payment<span style="color: red;">*</span></label>
                                <div>
                                    <select id="ddlModeOfPayment" class="form-select color-dropdown">

                                        <option value="Cash" selected>Cash</option>
                                        <option value="Bank Transfer">Bank Transfer</option>
                                        <option value="Cheques">Cheques</option>


                                    </select>

                                </div>
                            </div>

                         <div class="col-3" id="divpayeename">
                            <label for="html5-number-input" class="col-form-label label-custom">Payee Name<span style="color: red;">*</span> </label>
                            <div class="">

                                <input class="form-control" type="text" id="textpayeename"  />
                            </div>
                        </div>

                        <div class="col-3" id="divbankname">
                            <label for="html5-number-input" class="col-form-label label-custom">Bank Name<span style="color: red;">*</span> </label>
                            <div class="">
                                <input class="form-control" type="text" id="textbankname"   />

                            </div>
                        </div>

                         
                         <div class="col-3" id="divamount">
                            <label for="html5-number-input" class="col-form-label label-custom">Amount<span style="color: red;">*</span> </label>
                            <div class="">

                                <input class="form-control" type="text" id="textamount"  />
                            </div>
                        </div>

                    </div>
                   

                    <div class="row">

                       
                        <div class="col-3" id="divpaymentdate">
                            <label for="html5-number-input" class="col-form-label label-custom">Payment Date<span style="color: red;">*</span> </label>
                            <div class="">
                                
                                <input class="form-control" type="date" value="" id="textpaymentdate" />

                            </div>
                        </div>

                       

                         <div class="col-3" id="divcheqnumber">
                            <label for="html5-number-input" class="col-form-label label-custom">Cheque Number<span style="color: red;">*</span> </label>
                            <div class="">

                                <input class="form-control" type="text" id="textchequenumber"  />
                            </div>
                        </div>

                         <div class="col-3" id="divpaymentstatus">
                            <label for="html5-number-input" class="col-form-label label-custom">Payment Status<span style="color: red;">*</span> </label>
                            <div class="">

                                
                                 <select id="ddlpaymentstatus" class="form-select color-dropdown">
                                    
                                    <option id="valcleared" value="Cleared" >Cleared</option>
                                    <option id="valpendingdue" value="Pending Due">Pending Due</option>
                                    <option id="pendingNodue" value="Pending No Due">Pending No Due</option>

                                </select>
                            </div>
                        </div>
                    </div>

                </div>

                  <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btnAddpaymentdtls"  runat="server" data-bs-dismiss="modal" onclick="addPaymentDetails()">Create</button>
                    </div>


            </div>
        </div>
    </div>

    <%-- End --%>

    <%-- Modal for contract  Document  --%>

    <div class="modal fade" id="ModalAddContractDocument" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" >
            <div class="modal-content" >
                <div class="modal-header">
                    <h5 class="modal-title" id="lblaaddcontractdocuments"> Contract Document Upload</h5>
                    <button type="button" class="btn-close btn-close-proj-modal modalrefresh" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    
                               <div class="table-responsive" style="margin-top: 0%;width:100%;">
                                         <table class="table document-list-table" style="width: 100%;zoom:90%">
                                           
                                           <thead>
                                               <tr style="text-align: left;">
                                                   <th>Sl.No</th>
                                                   <th>Name</th>
                                                  
                                                   <th>Upload Document </th>

                                               </tr>
                                           </thead>
                                           <tbody class="tbody-documents-list" style="text-align:left;">

                                           </tbody>
                                         </table>
                               </div>


                </div>

                

            </div>
        </div>
    </div>

    <%-- End --%>

     <%-- Document  Modal Rejected Reason --%>

    <div class="modal fade" id="ModaDocjectreason" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <%--<h5 class="modal-title" id="lbladdbfloor">Add New Floor</h5>--%>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body proj-popup">

                        <div class="row">
                             <div>
                                <label class="col-form-label label-custom" for="basic-default-name">Enter The Reason For Rejection <span style="color: red;">*</span></label>
                                <div>
                                    <textarea class="form-control" id="textdocrjection" rows="4" ></textarea>
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="modal-footer">
                        <%--<button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>--%>
                        <button type="button" class="btn btn-primary" runat="server" data-bs-dismiss="modal" onclick="DocumentRejectReason()">Submit</button>
                        
                </div>
            </div>
        </div>
        </div>

    <%-- End --%>

    <%-- Modal for Final movein documents --%>

    <div class="modal fade" id="ModalAddMoveInFinalContract" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lblMoveinfinalcontract">Move In Final Document Upload</h5>
                    <button type="button" class="btn-close btn-close-proj-modal submitmoveinstage2doc" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">


                    <div class="table-responsive" style="margin-top: 0%; width: 100%;">
                        <table class="table movein-finaldoc-table" style="width: 100%; zoom: 90%">

                            <thead>
                                <tr style="text-align: left;">
                                    <th>Sl.No</th>
                                    <th>Name</th>

                                    <th>Upload Document </th>

                                </tr>
                            </thead>
                            <tbody class="tbody-Docmovein-final" style="text-align: left;">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- End --%>


    <%-- Delete Document Modal --%>

    <div class="modal fade" id="delAttachModal"  tabindex="-1" aria-labelledby="delAttachModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #b14c4c;"></i></div>
                    <div>
                        <h3>Are you sure?</h3>
                    </div>
                    Do you really want to delete this Attachment?
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 38%;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                        <button type="button" class="btn btn-primary btn-delstage1-attach-yes">Yes</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

    <%-- Modal for Renueal Contract  Email docupload--%>

        <div class="modal fade" id="ModaluploadRenewalConfrmMail" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lblRenewalconfirmMail">Renewal Email Confirmation </h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">


                    <div class="table-responsive" style="margin-top: 0%; width: 100%;">
                        <table class="table renewal-stage1doc-table" style="width: 100%; zoom: 90%">

                            <thead>
                                <tr style="text-align: left;">
                                    <th style="display:none">Sl.No</th>
                                    <th>Name</th>

                                    <th>Upload Document </th>

                                </tr>
                            </thead>
                            <tbody class="tbody-Doc-renewal-stage1" style="text-align: left;">
                            </tbody>
                        </table>
                    </div>


                       <div class="table-responsive" style="margin-top: 0%;width:100%;">
                                         <table class="table renewal-stage1-doclist" style="width: 100%;">
                                           
                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th style="display:none">DocumentID</th>
                                                   <th style="display:none">ContractID</th>
                                                   <th style="display:none">UnitID</th>
                                                   <th style="display:none">Sl.No</th>
                                                   <th>Document Name</th>
                                                   <th style="display:none">ImageURL </th>
                                                   <th>FileName </th>
                                                   <th>Stage </th>
                                                   <th>Status </th>
                                                   <th>Action</th>
                                                   
                                               </tr>
                                           </thead>
                                           <tbody class="tbody-renewal-stage1" style="text-align:center;">

                                           </tbody>
                                         </table>

                            
                        </div>

                     <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" id="addClass" data-bs-dismiss="modal" class="btn btn-primary btn-submit-RenueStage1" onclick="RenewalStage1docSubmit()">Submit Documents</button>
                        
                      
                    </div>

                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

    <%-- Modal for Termination --%>

    <div class="modal fade" id="ModaluploadTerminationConfrmMail" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lblterminationconfirmMail">Termination Email Confirmation </h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">


                    <div class="table-responsive" style="margin-top: 0%; width: 100%;">
                        <table class="table termination-table" style="width: 100%; zoom: 90%">

                            <thead>
                                <tr style="text-align: left;">
                                    <th style="display:none">Sl.No</th>
                                    <th>Name</th>

                                    <th>Upload Document </th>

                                </tr>
                            </thead>
                            <tbody class="tbody-Doc-termination" style="text-align: left;">
                            </tbody>
                        </table>
                    </div>


                       <div class="table-responsive" style="margin-top: 0%;width:100%;">
                                         <table class="table termination-doclist" style="width: 100%;">
                                           
                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th style="display:none">DocumentID</th>
                                                   <th style="display:none">ContractID</th>
                                                   <th style="display:none">UnitID</th>
                                                   <th style="display:none">Sl.No</th>
                                                   <th>Document Name</th>
                                                   <th style="display:none">ImageURL </th>
                                                   <th>FileName </th>
                                                   <th>Stage </th>
                                                   <th>Status </th>
                                                   <th>Action</th>
                                                   
                                               </tr>
                                           </thead>
                                           <tbody class="tbody-termination" style="text-align:center;">

                                           </tbody>
                                         </table>

                            
                        </div>

                     <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                     <%--  <button type="button" id="btn-Renewalstage1-submit1" data-bs-dismiss="modal" class="btn btn-primary btn-submit-RenueStage1" onclick="RenewalStage1docSubmit1()">Submit Documents</button>--%>
                         <button type="button" id="btn-Submit-termidocs" class="btn btn-primary btnsubmit-termination" data-bs-dismiss="modal" onclick="SubmitTerminationDoc()">Submit Termination </button>
                      
                    </div>

                </div>
            </div>
        </div>
    </div>


    <%-- End --%>

    <%-- modal for initate Moveout --%>

    <div class="modal fade" id="ModaldocuploadInitatMoveout" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalForInitatemoveout">Initate MoveOut Pree Approvel</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">


                    <div class="table-responsive" style="margin-top: 0%; width: 100%;">
                        <table class="table Initatemoveout-Stage1-table" style="width: 100%; zoom: 90%">

                            <thead>
                                <tr style="text-align: left;">
                                    <th style="display:none">Sl.No</th>
                                    <th>Name</th>

                                    <th>Upload Document </th>

                                </tr>
                            </thead>
                            <tbody class="tbody-Doc-initate-moveout1" style="text-align: left;">
                            </tbody>
                        </table>
                    </div>


                       <div class="table-responsive" style="margin-top: 0%;width:100%;">
                                         <table class="table IniMoveout-Stage1doc-doclist" style="width: 100%;">
                                           
                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th style="display:none">DocumentID</th>
                                                   <th style="display:none">ContractID</th>
                                                   <th style="display:none">UnitID</th>
                                                   <th style="display:none">Sl.No</th>
                                                   <th>Document Name</th>
                                                   <th style="display:none">ImageURL </th>
                                                   <th>FileName </th>
                                                   <th>Stage </th>
                                                   <th>Status </th>
                                                   <th>Action</th>
                                                   
                                               </tr>
                                           </thead>
                                           <tbody class="tbody-IniMoveout-Stage1doc" style="text-align:center;">

                                           </tbody>
                                         </table>

                            
                        </div>

                     <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                     <%--  <button type="button" id="btn-Renewalstage1-submit1" data-bs-dismiss="modal" class="btn btn-primary btn-submit-RenueStage1" onclick="RenewalStage1docSubmit1()">Submit Documents</button>--%>
                         <button type="button" id="btn-Submit-initate-moveout" data-bs-dismiss="modal" class="btn btn-primary btnsubmit-initatemoveout" onclick="SubmitInitateMoveout()">Submit Documents </button>
                      
                    </div>

                </div>
            </div>
        </div>
    </div>

    <%-- End --%>


    <%-- modal Final moveout --%>

    <div class="modal fade" id="ModaldocuploadFinalMoveout" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalForfinalmoveout">Final MoveOut  Approvel</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">


                    <div class="table-responsive" style="margin-top: 0%; width: 100%;">
                        <table class="table Finalmoveout-table" style="width: 100%; zoom: 90%">

                            <thead>
                                <tr style="text-align: left;">
                                    <th style="display:none">Sl.No</th>
                                    <th>Name</th>

                                    <th>Upload Document </th>

                                </tr>
                            </thead>
                            <tbody class="tbody-FinalMoveout" style="text-align: left;">
                            </tbody>
                        </table>
                    </div>


                       <div class="table-responsive" style="margin-top: 0%;width:100%;">
                                         <table class="table Finalmoveout-doclist" style="width: 100%;">
                                           
                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th style="display:none">DocumentID</th>
                                                   <th style="display:none">ContractID</th>
                                                   <th style="display:none">UnitID</th>
                                                   <th style="display:none">Sl.No</th>
                                                   <th>Document Name</th>
                                                   <th style="display:none">ImageURL </th>
                                                   <th>FileName </th>
                                                   <th>Stage </th>
                                                   <th>Status </th>
                                                   <th>Action</th>
                                                   
                                               </tr>
                                           </thead>
                                           <tbody class="tbody-finalmoneoutDoc" style="text-align:center;">

                                           </tbody>
                                         </table>

                            
                        </div>

                     <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                     <%--  <button type="button" id="btn-Renewalstage1-submit1" data-bs-dismiss="modal" class="btn btn-primary btn-submit-RenueStage1" onclick="RenewalStage1docSubmit1()">Submit Documents</button>--%>
                         <button type="button" id="btn-Submit-final-moveout" class="btn btn-primary btnsubmit-initatemoveout" data-bs-dismiss="modal" onclick="SubmitfinalMoveout()">Submit Documents </button>
                      
                    </div>

                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

    <%-- Modal for Final moveout estimation --%>
      

    <div class="modal fade" id="ModaldocuploadFinalEstimation" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalForfinalEstimation">Final Maintenance Estimation  Approvel</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">


                    <div class="table-responsive" style="margin-top: 0%; width: 100%;">
                        <table class="table Finalestimation-table" style="width: 100%; zoom: 90%">

                            <thead>
                                <tr style="text-align: left;">
                                    <th style="display:none">Sl.No</th>
                                    <th>Name</th>

                                    <th>Upload Document </th>

                                </tr>
                            </thead>
                            <tbody class="tbody-Finalestimation" style="text-align: left;">
                            </tbody>
                        </table>
                    </div>


                       <div class="table-responsive" style="margin-top: 0%;width:100%;">
                                         <table class="table Finalestimation-doclist" style="width: 100%;">
                                           
                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th style="display:none">DocumentID</th>
                                                   <th style="display:none">ContractID</th>
                                                   <th style="display:none">UnitID</th>
                                                   <th style="display:none">Sl.No</th>
                                                   <th>Document Name</th>
                                                   <th style="display:none">ImageURL </th>
                                                   <th>FileName </th>
                                                   <th>Stage </th>
                                                   <th>Status </th>
                                                   <th>Action</th>
                                                   
                                               </tr>
                                           </thead>
                                           <tbody class="tbody-finalestimation-doclist" style="text-align:center;">

                                           </tbody>
                                         </table>

                            
                        </div>

                     <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                     <%--  <button type="button" id="btn-Renewalstage1-submit1" data-bs-dismiss="modal" class="btn btn-primary btn-submit-RenueStage1" onclick="RenewalStage1docSubmit1()">Submit Documents</button>--%>
                         <button type="button" id="btn-Submit-final-Estimation" class="btn btn-primary btnsubmit-finalestimation" data-bs-dismiss="modal" onclick="SubmitfinalEstimation()">Submit Documents </button>
                      
                    </div>

                </div>
            </div>
        </div>
    </div>

    <%-- end --%>

    <%-- Security deposit Refund --%>

    <div class="modal fade" id="ModalSecurityDepositRefund" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Modalsecuritydeporefund">Security Deposit Refund  Approvel</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">


                    <div class="table-responsive" style="margin-top: 0%; width: 100%;">
                        <table class="table securityDeposit-refund-table" style="width: 100%; zoom: 90%">

                            <thead>
                                <tr style="text-align: left;">
                                    <th style="display:none">Sl.No</th>
                                    <th>Name</th>

                                    <th>Upload Document </th>

                                </tr>
                            </thead>
                            <tbody class="tbody-sdRefundDoc" style="text-align: left;">
                            </tbody>
                        </table>
                    </div>


                       <div class="table-responsive" style="margin-top: 0%;width:100%;">
                                         <table class="table sdRefund-doclist-table" style="width: 100%;">
                                           
                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th style="display:none">DocumentID</th>
                                                   <th style="display:none">ContractID</th>
                                                   <th style="display:none">UnitID</th>
                                                   <th style="display:none">Sl.No</th>
                                                   <th>Document Name</th>
                                                   <th style="display:none">ImageURL </th>
                                                   <th>FileName </th>
                                                   <th>Stage </th>
                                                   <th>Status </th>
                                                   <th>Action</th>
                                                   
                                               </tr>
                                           </thead>
                                           <tbody class="tbody-sdRefund-doclist" style="text-align:center;">

                                           </tbody>
                                         </table>

                            
                        </div>

                     <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                     <%--  <button type="button" id="btn-Renewalstage1-submit1" data-bs-dismiss="modal" class="btn btn-primary btn-submit-RenueStage1" onclick="RenewalStage1docSubmit1()">Submit Documents</button>--%>
                         <button type="button" id="btn-sdRefundSubmit" class="btn btn-primary " data-bs-dismiss="modal" onclick="SubmitSDrefund()">Submit Documents </button>
                      
                    </div>

                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

    <%-- Modalfor RenewalAmount View --%>

    


    <div class="modal fade" id="ModalRenewaldetails" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="lbladdbfloor">Renewal Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body proj-popup">




                        <div class="row">                           
                             <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Renewal Amount <span style="color: red;">*</span></label>
                                <div class="">
                                    <input type="text" id="textrenewakamount" class="form-control"  />

                                </div>
                            </div>
                        </div>

                        <div class="row">                           
                             <div>
                                <label for="html5-number-input" class="col-form-label label-custom"> Start date <span style="color: red;">*</span></label>
                                <div class="">
                                    <input type="date" id="textcontractrenewalstatrt" class="form-control"  />

                                </div>
                            </div>
                        </div>

                        <div class="row">                           
                             <div>
                                <label for="html5-number-input" class="col-form-label label-custom"> Start date <span style="color: red;">*</span></label>
                                <div class="">
                                    <input type="date" id="textcontractrewalend" class="form-control"  />

                                </div>
                            </div>
                        </div>


                       


                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" runat="server" data-bs-dismiss="modal" onclick="UpdateRenewalDetails()">Create</button>
                    </div>
                </div>
            </div>
        </div>

    <%-- End --%>



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
            EmpName = '<%=Session["EmpName"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';
        });

   </script>



   
    <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../Template/Datatable/js/jquery.dataTables.min.js"></script>

    <link href="css/propertymaster.css" rel="stylesheet" />

    <script src="js/ContractMaster.js?v=1.7"></script>
  

    <script src="../Template/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../Template/Datatable/js/jszip.min.js"></script>
    <script src="../Template/Datatable/js/pdfmake.min.js"></script>
    <script src="../Template/Datatable/js/vfs_fonts.js"></script>
    <script src="../Template/Datatable/js/buttons.html5.min.js"></script>
    <script src="../Template/Datatable/js/buttons.print.min.js"></script>

    <script src="../Template/Flatpickr/js/flatpickr.js"></script>
    <link href="../Template/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


</asp:Content>

    

