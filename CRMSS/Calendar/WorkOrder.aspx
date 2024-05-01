<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="WorkOrder.aspx.cs" Inherits="FacilityManagementNew_WorkOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        
        .Allrequest-list-table th {
            background-color: #d54832 !important;
            color: white !important;
        }

        .Allrequest-list-table td {
            color: #333333 !important;

        }

        .table-WorkOreder-List th
        {
            background-color: #d54832 !important;
            color: white !important;
        }

        .table-WorkOreder-List td{
            color: #333333 !important;
        }

        .table-WOproblem-List th{
             background-color: #d54832 !important;
            color: white !important;
        }

        .table-WOproblem-List td{
            color: #333333 !important;
        }

        .WODailySummary-table th{
            background-color: #d54832 !important;
            color: white !important;
        }

        .WODailySummary-table td{
            color: #333333 !important;
        }

        .table-WOAttachements-List th{
             background-color: #d54832 !important;
            color: white !important;
        }
         .table-WOAttachements-List td{
            color: #333333 !important;
        }

        .table-WOmaterialRequest th
        {
            background-color: #d54832 !important;
            color: white !important;
        }

        .table-WOmaterialRequest td{
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
    </style>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div class="card-body" style="margin-top: -1%; min-height: 85vh;">
            <%--<h2 style="padding:3px"></h2>--%>


            <h4 style="color: #a92828; margin-top: 13px">Work Order Details  </h4>
            <%--Child Tab--%>
            <div class="nav-align-top row">
                <ul class="nav nav-tabs" id="propery-tabs-ul"  role="tablist">
                    <li class="nav-item">
                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab"  data-bs-target="#navs-top-my-project">New Request</button>
                    </li>
                    <%-- <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-pendingUnits">Pending Request</button>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-involved-project">Completed </button>
                    </li>--%>

                </ul>
                <div class="tab-content">

                    <div class="tab-pane fade show active" id="navs-top-my-project">

                        <div>
                            <a href="#" class="btn btn-primary pull-right btn-addNew-Workorder" data-bs-toggle="modal" data-bs-target="#ModalAddItems"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; New Request</a>
                        </div>

                        <div class="" style="margin-top: 0%;">
                            <table class="table Allrequest-list-table" style="width: 100%;">
                                <%--<caption class="ms-4">List of Projects</caption>--%>
                                <thead>
                                    <tr>
                                        <th>Request Id</th>
                                        <th>Property Name</th>
                                        <th>Priority</th>
                                        <th>Category</th>
                                        <th>Requested By</th>
                                        <th>Due Date</th>

                                        <th>Action</th>

                                    </tr>
                                </thead>
                                <tbody class="tbody-allRequest-list">
                                </tbody>
                            </table>
                        </div>

                    </div>



                    <%-- TAble here based on tab2 --%>
                </div>
            </div>



            <div class="ajax-loader custom-loader hidden">
                <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
                <h4>Please wait...</h4>
            </div>


        </div>
    </div>

    <%-- Modal For Create New Request --%>

    <div class="modal fade" id="ModalCreateWorkOrderRequest" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<h5 class="modal-title" id="lbladditems">Create New Property</h5>--%>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                       <%-- <div class="row">
                            <h6 class="prpmdl-hed" id="lbladditemsa">Contract Details</h6>

                        </div>--%>

                        <div class="row">

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Request No.<span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="txtRequestnumber" class="form-control"   />
                                 
                                </div>
                            </div>
                           

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Property<span style="color: red;">*</span></label>
                                <div>
                                    <select id="ddlPropertyAdd" class="form-select color-dropdown">
                                    </select>
                                </div>
                            </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Block <span style="color: red;">*</span></label>
                                <div>
                                    <div>
                                        <select id="ddlBlock" class="form-select color-dropdown">
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Floor <span style="color: red;">*</span></label>
                                <div>
                                    <div>
                                        <select id="ddlfloor" class="form-select color-dropdown">
                                        </select>
                                    </div>
                                </div>
                            </div>

                            

                        </div>


                         <div class="row">

                             <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Unit <span style="color: red;">*</span></label>
                                <div>
                                    <div>
                                        <select id="ddlUnit" class="form-select color-dropdown">
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Priority<span style="color: red;">*</span></label>
                                 <div>
                                     <div>
                                    <select id="ddlPriority" class="form-select color-dropdown">
                                        <option> ---Select---</option>
                                        <option value="High">High</option>
                                        <option value="Medium">Medium</option>
                                        <option value="Low">Low</option>
                                    </select>
                                </div>

                                </div>
                            </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Category</label>
                                <div>
                                   <div>
                                        <select id="ddlCategory" class="form-select color-dropdown">
                                        </select>
                                    </div>

                                </div>
                            </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">RequestMode</label>
                                <div>
                                  <div>
                                    <select id="ddlRequestmode" class="form-select color-dropdown">
                                        <option> ---Select---</option>
                                        <option value="Direct request">Direct request </option>
                                        <option value="New Project Request">New Project Request </option>
                                        <option value="Request with Inspection">Request with Inspection</option>
                                        </select>

                                </div>
                                </div>
                            </div>

                            

                        </div>


                         <div class="row">

                             <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Request For</label>
                                <div>
                                   <div>
                                        <select id="ddlpropertytype" class="form-select color-dropdown">
                                        </select>
                                    </div>

                                </div>
                            </div>

                              <div class="col-3">
                                 <label for="html5-number-input" class="col-form-label label-custom">AccountType</label>
                                 <div>
                                     <div>
                                         <select id="ddlAccounttype" class="form-select color-dropdown">
                                        <option> ---Select---</option>
                                        <option value="Company Account">Company Account</option>
                                        <option value="Tenant Account">Tenant Account</option>
                                       
                                    </select>

                                     </div>
                                 </div>
                             </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Due Date</label>
                                 <div>
                                     <input class="form-control" type="date" value="" id="textrequestduedate" />

                                </div>
                            </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Description<span style="color: red;">*</span></label>
                                <div>
                                   
                                    <textarea class="form-control" id="txtDescription" rows="2" ></textarea>

                                </div>
                            </div>

                        </div>



                    <div class="modal-footer" id="add-contract" >
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal"  onclick="addRequest()">Create</button>
                    </div>


                    <%--</div>--%>
                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

    <%-- Modal For Request Details --%>

    <div class="modal fade" id="ModalRequestDetails" data-bs-backdrop="static" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title" id="lblprojDetailModal">Request Details</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div style="margin-top: -13px; position: absolute; width: 96%;">
                        <div style="text-align: right;">
                            <i class="bx bxs-chevron-up contract-det-drilldown" onclick="hideShowProjDetails()"></i>
                        </div>
                    </div>


                    <div id="ContractDetailsRowDiv" style="background: #1d1b1b36; padding: 17px; border-radius: 12px; border: 1px solid #1d1b1b36; box-shadow: 4px 4px 13px -7px #1d1b1b36;">

                        <div class="row">

                            <div style="width: 20%">
                                <label for="html5-number-input" class="col-form-label label-custom">RequestID</label>
                                <div class="">

                                    <input class="form-control" type="text" id="textrequestId1" readonly />
                                </div>
                            </div>

                            <div style="width: 20%; display: none">
                                <label for="html5-number-input" class="col-form-label label-custom">PropertyID </label>
                                <div class="">
                                    <input class="form-control" type="text" id="textpropertyId1" readonly />


                                </div>
                            </div>
                            <div style="width: 10%; display: none">
                                <label for="html5-number-input" class="col-form-label label-custom">BlockID</label>
                                <div class="">

                                    <input class="form-control" type="text" id="textblockId1" readonly />
                                </div>
                            </div>

                            <div style="width: 20%; display: none">
                                <label for="html5-number-input" class="col-form-label label-custom">FloorID </label>
                                <div class="">

                                    <input class="form-control" type="text" id="textfloorId1" readonly />
                                </div>
                            </div>

                            <div style="width: 20%; display: none">
                                <label for="html5-number-input" class="col-form-label label-custom">UnitID</label>
                                <div class="">

                                    <input class="form-control" type="text" id="textunitId1" readonly />
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Property Name </label>
                                <div class="">

                                    <input class="form-control" type="text" id="textpropertyname1" readonly />
                                </div>
                            </div>
                            <div style="width: 20%">
                                <label for="html5-number-input" class="col-form-label label-custom">Block Name </label>
                                <div class="">

                                    <input class="form-control" type="text" id="textblockname1" readonly />
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Floor Name</label>
                                <div class="">
                                    <input class="form-control" type="text" id="textfloorname1" readonly />

                                </div>
                            </div>


                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Unit Name</label>
                                <div class="">
                                    <input class="form-control" type="text" id="textunitname1" readonly />

                                </div>
                            </div>



                        </div>


                        <div class="row">

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Priority </label>
                                <div class="">
                                    <input class="form-control" type="text" id="textpriority1" readonly />

                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Category </label>
                                <div class="">

                                    <input class="form-control" type="text" id="textcategory1" readonly />
                                </div>
                            </div>
                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">RequestFor </label>
                                <div class="">
                                    <input class="form-control" type="text" id="textrwquestfor" readonly />

                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">AccountType </label>
                                <div class="">
                                    <input class="form-control" type="text" id="textaccounttype1" readonly />

                                </div>
                            </div>


                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">DueDate </label>
                                <div class="">
                                    <input class="form-control" type="text" id="textduedate1" readonly />

                                </div>
                            </div>


                        </div>

                        <div class="row">


                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">RequestMode</label>
                                <div class="">
                                    <input class="form-control" type="text" id="textRequestMode1" readonly />
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Requested By</label>
                                <div class="">
                                    <input class="form-control" type="text" id="textrequestedby1" readonly />

                                </div>
                            </div>



                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Description</label>
                                <div class="">
                                    <input class="form-control" type="text" id="textdescription1" readonly />

                                </div>
                            </div>

                             <div style="width: 10%;" class="btnWorkorderstatusSubmit">
                                <br />
                                <div class="">                                    
                                   <button type="button" style="display:none" class="btn btn-approved btnsubmit-allcompteted"   onclick="WOstatusSubmit()">Submit</button>
                                </div>
                            </div>

                              <div style="width: 10%;" class="btnitemApproved">
                                <br />
                                <div class="">                                    
                                   <button type="button" class="btn btn-approved btn-WoCompletionApproved"   onclick="WOCompletionApproved()">Approve</button>
                                </div>
                            </div>

                            <div style="width: 10%;" class="btnCloserequest">
                                <br />
                                <div class="">                                    
                                   <button type="button" class="btn btn-approved  WOCloserequest"   onclick="UpdateCloseRequest()">Close Request</button>
                                </div>
                            </div>

                        </div>

                    </div>


                    <%--Grid--%>


                    <div style="margin-top: 1.5%;">


                        <div>
                            <a href="#" class="btn btn-primary pull-right btn-add-workorder-grid"><i class="fa fa-plus" aria-hidden="false"></i>&nbsp; Add Work Order</a>
                        </div>

                        <div class="table-responsive" style="margin-top: 1%; width: 100%;">

                            <table class="table table-WorkOreder-List" style="width: 100%;">

                                <thead>
                                    <tr style="text-align: center;">
                                        <th>WorkOrderID</th>
                                        <th style="display: none">RequestID</th>
                                        <th>Assigned To</th>
                                        <th>Cost Allocation</th>
                                        <th>DueDate </th>
                                        <th>Status </th>
                                        <th>Description </th>

                                        <th>Action</th>


                                    </tr>
                                </thead>
                                <tbody class="tbody-WorkOrder-details" style="text-align: center;">
                                </tbody>
                            </table>

                        </div>

                    </div>
                </div>

            </div>


        </div>

    </div>
          <%-- </div>
      </div>--%>

    <%-- End --%>

    <%-- modal for Create Work Order --%>

    <div class="modal fade" id="ModalCreateWorkOrder" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<h5 class="modal-title" id="lbladditems">Create New Property</h5>--%>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                       <%-- <div class="row">
                            <h6 class="prpmdl-hed" id="lbladditemsa">Contract Details</h6>

                        </div>--%>

                        <div class="row">

                           <%-- <div class="col-3" style="display:block">
                                <label for="html5-number-input" class="col-form-label label-custom">Request No.<span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="txtRequestnumber2" class="form-control"   />
                                 
                                </div>
                            </div>--%>
                           

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Work Order No<span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="textworkordernumber" class="form-control"   />
                                    
                                </div>
                            </div>

                            

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Assigned To <span style="color: red;">*</span></label>
                                <div>
                                    <div>
                                        <select id="ddlAssignedto" class="form-select color-dropdown">
                                        <option> ---Select---</option>
                                        <option value="Thansi Al Kasim">Thansi Al Kasim </option>
                                        <option value="Abdullah">Abdullah </option>
                                        <option value="Abdul Navas">Abdul Navas </option>
                                         <option value="Anwar Ahmad">Anwar Ahmad </option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                             <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Cost Allocation <span style="color: red;">*</span></label>
                                <div>
                                     <input type="text" id="textCostallocation" class="form-control" />
                                </div>
                            </div>
                             <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Efforts Allocation (Hrs) </label>
                                <div>
                                   <div>
                                         <input type="text" id="texteffortallocation" class="form-control"   />
                                    </div>

                                </div>
                            </div>
                                <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Vendor Details <span style="color: red;">*</span></label>
                                <div>
                                    <div>
                                         <select id="ddlVendordetails" class="form-select color-dropdown">
                                        <option> ---Select---</option>
                                        <option value="Vendor">Yes</option>
                                        <option value="Not Vendor">No</option>
                                        
                                        </select>
                                    </div>
                                </div>
                            </div>

                           

                        </div>


                         <div class="row">

                         <div class="col-3">
                                 <label for="html5-number-input" class="col-form-label label-custom">Description<span style="color: red;">*</span></label>
                                 <div>

                                     <textarea class="form-control" id="txtWODescription" rows="1"></textarea>

                                 </div>
                             </div>

                             

                             <div class="col-3 thirdpartydesc" style="display:none">
                                <label for="html5-number-input" class="col-form-label label-custom">Third Party Description </label>
                                <div>
                                   <div>
                                        <textarea class="form-control " id="thirdpartydescr" rows="1"></textarea>
                                    </div>

                                </div>
                            </div>
                           

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Time Frame Allocation</label>
                                <div>
                                  <div>
                                   
                                        <input class="form-control" type="date" value="" id="ddttimefameallocation" />
                                </div>
                                </div>
                            </div>

                            

                               <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">DueDate</label>
                                <div>
                                   <div>
                                       <input class="form-control" type="date" value="" id="ddtduedateworkorder" />
                                    </div>

                                </div>
                            </div>

                             

                            

                        </div>


                         



                    <div class="modal-footer" id="add-contract1" >
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal"  onclick="addWorkOrder()">Create</button>
                    </div>


                    <%--</div>--%>
                </div>
            </div>
        </div>
    </div>

    <%-- End --%>
    <%-- modal Tasks and problems inside workorder --%>

    
    <div class="modal fade" id="ModalWororderDetails" data-bs-backdrop="static" aria-hidden="true">
           <div class="modal-dialog modal-xl" role="document">
             <div class="modal-content"<%-- style="background: antiquewhite;"--%>>
               <div class="modal-header">
                 <h5 class="modal-title" id="lblwororderdetals">Work Order Details</h5>
                 <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
              

    <div style="margin-top:1.5%;">

             <div class="nav-align-top">
                 <ul class="nav nav-tabs" id="workorder-details-modal-ul" role="tablist">
                     

                     <li class="nav-item">
                         <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-problems" aria-controls="navs-top-problems" aria-selected="false">Problems</button>
                     </li>
                     

                       <li class="nav-item">
                         <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-DailyWorkSummary" aria-controls="navs-top-DailyWorkSummary" aria-selected="false"> Daily Work Summary</button>
                     </li>

                        <li class="nav-item">
                         <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Attachement" aria-controls="navs-top-Attachement" aria-selected="false"> Remark & Attachments </button>
                     </li>
                       <li class="nav-item">
                         <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-MaterialRequest" aria-controls="navs-top-MaterialRequest" aria-selected="false"> Material Request </button>
                     </li>
                    
                 </ul>
              <div class="tab-content">
                  <%--1st--%>
                <div class="tab-pane fade show active" id="navs-top-problems" role="tabpanel">

                   
                    <div>
                        <a href="#" class="btn btn-primary pull-right btn-add-WOproblems"><i class="fa fa-plus" aria-hidden="false"></i>&nbsp; Add Problems</a>
                    </div>
              
                                <div class="table-responsive active" id="" style="margin-top: 1%;width:100%;">
                                        
                                         <table class="table table-WOproblem-List" style="width: 100%;">
                                          
                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th>WorkOrderID</th>  
                                                   <th>Problem</th>                                                    
                                                   <th>Description </th>
                                                                             
                                              </tr>
                                           </thead>
                                           <tbody class="tbody-WOproblem-details" style="text-align:center;">

                                           </tbody>
                                         </table>
                               
                               </div>
                </div>

                  <%--2nd--%>
                <div class="tab-pane" id="navs-top-DailyWorkSummary" role="tabpanel" style="margin-top: -2%;">

                     <div>
                        <a href="#" class="btn btn-primary pull-right btn-add-dailyworksummary"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Man Hours</a>
                    </div>
               
                         
                                <div class="table-responsive" style="margin-top: 0%;width:100%;">
                                         <table class="table WODailySummary-table" style="width: 100%;">
                                          
                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th>WorkOrder</th>  
                                                   <th>Task</th>  
                                                   <th>Date</th>                                                 
                                                   <th>EmployeeName</th>
                                                   <th>Man Hourse</th>
                                                   
                                                  
                                                                              
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-WODailySummary-List" style="text-align:center;">

                                           </tbody>
                                         </table>
                               </div>
                </div>

                  <%-- 3rd --%>

                  <div class="tab-pane" id="navs-top-Attachement" role="tabpanel" style="margin-top: -2%;">

                   <br />

                     <div class="row">

                         <div class="col-3">
                               <label for="html5-number-input" class="col-form-label label-custom">Upload Your Attachement </label>
                               
                           </div>
                         <div class="col-3">
                              
                                 <div class="input-group" style="width:75%" id="btn-documetuploaded">        
                                         <label style="margin-right: 10px;display:none;" class="lbl-fufile-count"></label>
                                         <input class="form-control" type="file" id="fu-docment-attach" accept=".doc,.docx,.pdf,.png,.jpeg" style="display:none;" multiple="">
                                         <label class="input-group-text ml-3" for="fu-docment-attach"><i class="fa fa-upload " title="Upload File" style="color: #2196F3; cursor: pointer; font-size: large;"></i></label>

                                        <a href="#" id="btnsaveDocuments" class="btn btn-upload" style="margin-left: 4px;border-radius: 10px;" onclick=uploadDocumentAttach()>Upload </a>
                                                       
                                         <input type="text" id="lblFilesName" value="" style= "background: #80808000; border:; color: #697a8d; border: none; margin-left:10px;" readonly="">

                           
                                    </div>
                             </div>

                         
                      </div>

                      <div class="table-responsive active" style="margin-top: 1%; width: 100%;">

                          <table class="table table-WOAttachements-List" style="width: 100%;">

                              <thead>
                                  <tr style="text-align: center;">
                                      <th>WorkOrderID</th>
                                      <th>ImageURL</th>
                                      <th>FileName </th>
                                      <th>CreatedDate </th>

                                  </tr>
                              </thead>
                              <tbody class="tbody-WOAttachements-details" style="text-align: center;">
                              </tbody>
                          </table>

                      </div>


                  </div>

                  <%-- 4th --%>

                   <div class="tab-pane fade " id="navs-top-MaterialRequest" role="tabpanel">

                   
                    <div>
                        <a href="#" class="btn btn-primary pull-right btn-add-WoMeterialRequest"><i class="fa fa-plus" aria-hidden="false"></i>&nbsp; Material Request</a>
                    </div>
              
                                <div class="table-responsive active" id="" style="margin-top: 1%;width:100%;">
                                        
                                         <table class="table table-WOmaterialRequest" style="width: 100%;">
                                          
                                           <thead>
                                               <tr style="text-align: center;">
                                                   <th style="display:none">MRequestID</th>  
                                                   <th style="display:none">WorkOrderID</th>                                                    
                                                   <th>Request ID </th>
                                                   <th>Property Name</th>  
                                                                                                    
                                                   <th>Item Category </th>
                                                   <th>Item Code</th>  
                                                   <th>Item Name</th>    
                                                   <th>Action</th>     
                                                 
                                                                             
                                              </tr>
                                           </thead>
                                           <tbody class="tbody-WOmaterialRequest" style="text-align:center;">

                                           </tbody>
                                         </table>
                               
                               </div>
                </div>`
              </div>
            </div>

    </div>
                   

               </div>
             
             </div>
           </div>
      </div>

    <%-- End --%>

    <%-- Modal For Add problems --%>

    <div class="modal fade" id="ModalAddproblems" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="lbladdbfloor">Add Work order Problems</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body proj-popup">




                        

                        <div class="row">                           
                             <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Problem <span style="color: red;">*</span></label>
                                <div class="">
                                    <input type="text" id="textwoProblem" class="form-control"  />

                                </div>
                            </div>
                        </div>


                        <div class="row">
                             <div>
                                <label class="col-form-label label-custom" for="basic-default-name">Description <span style="color: red;">*</span></label>
                                <div>
                                    <textarea class="form-control" id="textwoProblemdescription" rows="4"></textarea>
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" runat="server" data-bs-dismiss="modal" onclick="addWOproblems()">Create</button>
                    </div>
                </div>
            </div>
        </div>

    <%-- End --%>
    <%-- Modal for Daily Work Summary --%>

    <div class="modal fade" id="ModalAddDailyWorkSummary" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="lbldailyworksummary">Add Daily Work Summary</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body proj-popup">


                        <div class="row">
                             <div class="col-6">
                                <label class="col-form-label label-custom" for="basic-default-name">Work Description <span style="color: red;">*</span></label>
                                <div>
                                    <textarea class="form-control" id="textWorkdescription" rows="1"></textarea>
                                </div>
                            </div>

                            <div class="col-6">
                                <label class="col-form-label label-custom" for="basic-default-name">Date<span style="color: red;">*</span></label>

                                <div>
                                     <input class="form-control" type="date" value="" id="dateofsummary">

                                </div>

                            </div>

                        </div>

                        <div class="row">
                            <div class="col-6">
                                <label class="col-form-label label-custom" for="basic-default-name">Employee<span style="color: red;">*</span></label>

                                <div>
                                    <select id="ddlDailyworkEmpName" class="form-select color-dropdown">
                                        <option>---Select---</option>
                                        <option value="JUNAID SHAHZAD | NA2628">JUNAID SHAHZAD | NA2628</option>
                                        <option value="ABDULLAH AL NOMAN | NA2135">ABDULLAH AL NOMAN | NA2135</option>
                                    </select>

                                </div>

                            </div>

                             <div class="col-2">
                                <label class="col-form-label label-custom" for="basic-default-name">Man Hours<span style="color: red;">*</span></label>

                                <div>
                                     <input type="text" id="textmanhourse" class="form-control" />

                                </div>

                            </div>

                             <div class="col-2"> 
                                 <label class="col-form-label label-custom" for="basic-default-name"><span style="color: red;"></span></label>
                                <div>
                                     <button type="button" class="btn btn-primary" runat="server"  onclick="addWODailySummary()">Save</button>
                                </div>

                            </div>

                          
                             
                         </div>

                    </div>

                  <%--  <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" runat="server" data-bs-dismiss="modal" onclick="addWOproblems()">Create</button>
                    </div>--%>
                </div>
            </div>
        </div>

    <%-- End --%>
    <%-- Modal for create Work Order MaterialRequest --%>

    <div class="modal fade" id="ModalCreateWOMaterialRequest" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<h5 class="modal-title" id="lbladditems">Create New Property</h5>--%>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                        <div class="row">
                            <h6 class="prpmdl-hed" id="lbladditemsa">Maerial Request</h6>

                        </div>

                        <div class="row">


                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">MRequest No.<span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="textMaterialreqno" class="form-control"   />
                                    
                                </div>
                            </div>

                           

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Property Name <span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="textMRpropertyname" class="form-control"   />
                                    
                                </div>
                            </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Block Name<span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="textMRblockName" class="form-control"   />
                                    
                                </div>
                            </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Floor Name<span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="textMRfloorName" class="form-control"   />
                                    
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Unit Name<span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="textMRUnitName" class="form-control"   />
                                    
                                </div>
                            </div>

                             <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom"> Employee Name <span style="color: red;">*</span></label>
                               
                                    <div>
                                        <input type="text" id="textemployeenameMR" class="form-control"   />
                                    </div>
                                
                            </div>

                            <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom"> Category <span style="color: red;">*</span></label>
                               
                                    <div>
                                        <select id="ddlMRCategory" class="form-select color-dropdown">
                                        </select>
                                    </div>
                                
                            </div>

                             <div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Item Name </label>

                                 <div>
                                     <select id="ddlItemName" class="form-select color-dropdown">
                                     </select>
                                 </div>

                            </div>

                            </div>
                    <div class="row">

                        
                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Item Qty <span style="color: red;">*</span></label>
                            <div>
                                <div>
                                    <input type="text" id="textitemquty" class="form-control" />

                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">

                    </div>

                    <div class="modal-footer" id="add-contract11" >
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal"  onclick="addMaterialRequest()">Create</button>
                    </div>


                    <%--</div>--%>
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

    <script src="js/workorder.js"></script>


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



