<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="Storekeeper.aspx.cs" Inherits="FacilityManagementNew_Storekeeper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        
        .table-WOmaterialRequest th
        {
            background-color: #d54832 !important;
            color: white !important;
        }

        .table-WOmaterialRequest td{
            color: #333333 !important;
        }

        .table-WOmaterialReqCompleted th{
            background-color: #d54832 !important;
            color: white !important;
        }

         .table-WOmaterialReqCompleted td{
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div class="card-body" style="margin-top: -1%; min-height: 85vh;">
            <%--<h2 style="padding:3px"></h2>--%>


            <h4 style="color: #a92828; margin-top: 13px">Material Request Details  </h4>
            <%--Child Tab--%>
            <div class="nav-align-top">
                <%--<ul class="nav nav-tabs" id="propery-tabs-ul"  role="tablist">
                    <li class="nav-item">
                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab"  data-bs-target="#navs-top-newRequest" aria-controls="navs-top-newRequest" aria-selected="false">New Request</button>
                    </li>
                    
                    <li class="nav-item">
                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab"  data-bs-target="#navs-top-completed" aria-controls="navs-top-completed" aria-selected="false">Completed</button>
                    </li>
                   

                </ul>--%>

                 <ul class="nav nav-tabs" id="WORequest-List-ul" role="tablist">
                     

                     <li class="nav-item">
                         <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-NewRequest" aria-controls="navs-top-NewRequest" aria-selected="false">All Request</button>
                     </li>
                     

                       <li class="nav-item">
                         <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-completedRequest" aria-controls="navs-top-completedRequest" aria-selected="false">Completed</button>
                     </li>

                       
                    
                 </ul>
                <div class="tab-content">

                    <div class="tab-pane fade show active" id="navs-top-NewRequest">

                        <%--  <div>
                            <a href="#" class="btn btn-primary pull-right btn-addNew-Workorder" data-bs-toggle="modal" data-bs-target="#ModalAddItems"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; New Request</a>
                        </div>--%>

                        <div class="" style="margin-top: 0%;">
                            <table class="table table-WOmaterialRequest" style="width: 100%;">

                                <thead>
                                    <tr style="text-align: center;">
                                        <th>MRequestID</th>
                                        <th style="display: none">WorkOrderID</th>
                                        <th style="display: none">Request ID </th>
                                        <th>Property Name</th>

                                        <th>Item Category </th>
                                        <th>Item Code</th>
                                        <th>Item Name</th>
                                        <th>Status</th>
                                        <th>Action</th>


                                    </tr>
                                </thead>
                                <tbody class="tbody-WOmaterialRequest" style="text-align: center;">
                                </tbody>
                            </table>

                        </div>

                    </div>

                    <%-- 2nd --%>

                    <div class="tab-pane" id="navs-top-completedRequest" role="tabpanel" style="margin-top: -2%;">

                 
                      <div class="table-responsive" style="margin-top: 1%; width: 100%;">

                           <table class="table table-WOmaterialReqCompleted" style="width: 100%;">

                                <thead>
                                    <tr style="text-align: center;">
                                        <th>MRequestID</th>
                                        <th style="display: none">WorkOrderID</th>
                                        <th style="display: none">Request ID </th>
                                        <th>Property Name</th>

                                        <th>Item Category </th>
                                        <th>Item Code</th>
                                        <th>Item Name</th>
                                        <th>Status</th>
                                        


                                    </tr>
                                </thead>
                                <tbody class="tbody-WOmaterialReqCompleted" style="text-align: center;">
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

    <%-- Modal Requested Item details --%>

    <div class="modal fade" id="ModalRequestedItemDetails" data-bs-backdrop="static" aria-hidden="true">
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
                                <label for="html5-number-input" class="col-form-label label-custom">MRequestID</label>
                                <div class="">

                                    <input class="form-control" type="text" id="textmaterialreqid" readonly />
                                </div>
                            </div>

                            <div style="width: 20%; display: none">
                                <label for="html5-number-input" class="col-form-label label-custom">WorkOrderID </label>
                                <div class="">
                                    <input class="form-control" type="text" id="textworkorderReqid" readonly />

                                </div>
                            </div>
                            <div style="width: 10%; display: none">
                                <label for="html5-number-input" class="col-form-label label-custom">RequestID</label>
                                <div class="">

                                    <input class="form-control" type="text" id="textworkrequestid" readonly />
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Property Name </label>
                                <div class="">

                                    <input class="form-control" type="text" id="textwopropertyname" readonly />
                                </div>
                            </div>
                            <div style="width: 20%">
                                <label for="html5-number-input" class="col-form-label label-custom">Block Name </label>
                                <div class="">

                                    <input class="form-control" type="text" id="textwoblockname" readonly />
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Floor Name</label>
                                <div class="">
                                    <input class="form-control" type="text" id="textwofloorname" readonly />

                                </div>
                            </div>


                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Unit Name</label>
                                <div class="">
                                    <input class="form-control" type="text" id="textwounitname" readonly />

                                </div>
                            </div>

                        </div>


                        <div class="row">

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Employee Name </label>
                                <div class="">
                                    <input class="form-control" type="text" id="textassemployee" readonly />

                                </div>
                            </div>
                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Item Category </label>
                                <div class="">

                                    <input class="form-control" type="text" id="textItemCategory" readonly />
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Item Code </label>
                                <div class="">

                                    <input class="form-control" type="text" id="textitemcode" readonly />
                                </div>
                            </div>
                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Item Name </label>
                                <div class="">
                                    <input class="form-control" type="text" id="textitemname" readonly />

                                </div>
                            </div>

                            <div style="width: 10%;">
                                <label for="html5-number-input" class="col-form-label label-custom"> Item Qty </label>
                                <div class="">
                                    <input class="form-control" type="text" id="texttotelitemqty" readonly />

                                </div>
                            </div>

                            <div style="width: 10%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Current Stock </label>
                                <div class="">
                                    <input class="form-control" type="text" id="textcurrentstock" readonly />

                                </div>
                            </div>


                            


                        </div>

                        <div class="row">

                            

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Status</label>
                                <div class="">
                                    <input class="form-control" type="text" id="textstatus" readonly />
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Requested Date</label>
                                <div class="">
                                    <input class="form-control" type="text" id="textrequesteddate" readonly />

                                </div>
                            </div>

                             <div style="width: 20%;" class="divselectlocation">
                                <label for="html5-number-input" class="col-form-label label-custom">Select Location <span style="color: red;">*</span></label>
                                <div>
                                    <div>
                                        <select id="ddlstorelocation" class="form-select color-dropdown ddlstorelocation">
                                        <option> ---Select---</option>
                                        <option value="DIP Camp">DIP Camp </option>
                                        <option value="Brass Light">Brass Light </option>
                                       
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div style="width: 20%;" class="divitemlocation">
                                <label for="html5-number-input" class="col-form-label label-custom">Item Location</label>
                                <div class="">
                                    <input class="form-control" type="text" id="textLocationallocated" readonly />

                                </div>
                            </div>

                            <div style="width: 10%;" class="btnitemlocationsubmited">
                                <br />
                                <div class="">                                    
                                   <button type="button" class="btn btn-approved"   onclick="ItemlocationSubmit()">Submit</button>
                                </div>
                            </div>

                             <div style="width: 10%;" class="btnitemApproved">
                                <br />
                                <div class="">                                    
                                   <button type="button" class="btn btn-approved"   onclick="RequestItemApproved()">Approve</button>
                                </div>
                            </div>


                             <div style="width: 10%;" class="btnitemdelivered">
                                <br />
                                <div class="">                                    
                                   <button type="button" class="btn btn-approved"   onclick="ItemDelivered()">Item Delivered</button>
                                </div>
                            </div>
                            
                        </div>

                    </div>


                    <%--Grid--%>


                    <%--<div style="margin-top: 1.5%;">


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
                                        <th>Description </th>

                                        <th>Action</th>


                                    </tr>
                                </thead>
                                <tbody class="tbody-WorkOrder-details" style="text-align: center;">
                                </tbody>
                            </table>

                        </div>

                    </div>--%>
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

   
    <script src="js/storekeeper.js"></script>

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

