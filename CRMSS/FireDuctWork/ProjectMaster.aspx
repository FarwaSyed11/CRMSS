<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="ProjectMaster.aspx.cs" Inherits="FireDuctWork_ProjectMaster" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="CSS/frdmaster.css" rel="stylesheet" />

    <style>
        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link:not(.active) {
            background-color: #b4b9bf;
        }

        .project-list-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .project-list-table td {
            color: #333333 !important;
        }

        .iconClassExcel {
            margin-left: 8px;
            background: #933737;
        }

            .iconClassExcel:hover {
                background: #a54141;
            }

        #DataTables_Table_0_paginate .current {
            color: white !important;
            background: #d33a3a !important;
        }

        /*for tab 2*/

        .siteVisitReq-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .siteVisitReq-table td {
            color: #333333 !important;
        }

        .iconClassExcel {
            margin-left: 8px;
            background: #933737;
        }

            .iconClassExcel:hover {
                background: #a54141;
            }

        #DataTables_Table_0_paginate .current {
            color: white !important;
            background: #d33a3a !important;
        }

        .btn-outline-create {
            color: #ffffff;
            border-color: #8592a3;
            background: #a92828;
        }

        .col-form-label {
            padding-top: calc(0.4375rem + 1px);
            padding-bottom: calc(0.4375rem + 1px);
            margin-bottom: 0;
            font-size: inherit;
            font-weight: 800;
            line-height: 1.53;
            color: #566a7f;
        }

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div style="padding-left: 2%; padding-top: 1%;">

            <div class="pull-left">
                <h4 style="text-shadow: 1px 6px 13px; color: #a92828;">FRD Project Details </h4>
            </div>
            <div class="pull-right" style="padding-right: 10%; padding-bottom: 10px">



                <button type="button" data-bs-toggle="modal" data-bs-target="#FRDaddProject" class="btn btn-outline-create" onclick="getUniqueFRDId()">
                    <span class="tf-icons bx bx-plus"></span>&nbsp; Add Project
                </button>
            </div>

        </div>

        <div>
            <hr style="width: 100%; text-align: left; margin-left: 0">
        </div>




        <div class="card-body" style="margin-top: -2%;">

            <div class="nav-align-top">

                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-home" aria-controls="navs-top-home" aria-selected="true">PROJECTS</button>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-profile" aria-controls="navs-top-profile" aria-selected="false">INSTALLATION REQUESTED</button>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-sitevist-requested" aria-controls="navs-sitevist-requested" aria-selected="false">SITE VISIT REQUESTED</button>
                    </li>
                </ul>

                <div class="tab-content">

                    <div class="tab-pane fade show active" id="navs-top-home" role="tabpanel">

                        <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped project-list-table">

                                <thead>
                                    <tr>
                                        <th style="display:none">Id</th>
                                        <th> Project.No</th>                                      
                                        <th>customer Name</th>
                                        <th style="width:20%">Project </th>
                                        <th>Location</th>
                                        <th>Created By</th>
                                       <th>Delivery Date</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>

                                <tbody class="tbody-employees">
                                </tbody>
                            </table>

                            <%-- Modal for FRD Priject status --%>
                        </div>

                    </div>

                    <div class="tab-pane fade" id="navs-top-profile" role="tabpanel">
                        <table class="table table-bordered table-striped frdInstald-table" style="width: 100%">

                            <thead>
                                <tr>
                                    <th>Sl.No</th>
                                    <th>Date</th>
                                    <th>Customer Number</th>
                                    <th>customer Name</th>
                                    <th>Project </th>
                                    <th>Location</th>
                                    <th>Consultant</th>
                                    <th>Main Contractor</th>
                                    <th>MEP Contractor</th>
                                    <th>Delivery Date</th>

                                    <th style="width: 10%;">Action</th>
                                </tr>
                            </thead>

                            <tbody class="tbody-installationReq">
                            </tbody>
                        </table>

                    </div>


                    <div class="tab-pane fade" id="navs-sitevist-requested" role="tabpanel">
                        <table class="table table-bordered table-striped siteVisitReq-table" style="width: 100%">

                            <thead>
                                <tr>
                                    <th>Sl.No</th>
                                    <th>Date</th>
                                    <th>Customer Number</th>
                                    <th>customer Name</th>
                                    <th>Project </th>
                                    <th>Location</th>
                                    <th>Consultant</th>
                                    <th>Main Contractor</th>
                                    <th>MEP Contractor</th>
                                    <th>Delivery Date</th>

                                    <th style="width: 10%;">Action</th>
                                </tr>
                            </thead>

                            <tbody class="tbody-sitevisitReq">
                            </tbody>
                        </table>

                    </div>




                </div>

            </div>


        </div>



    </div>


    <%-- Modal for FRD Project --%>

    <div class="modal fade" id="FRDaddProject" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel3">Add Project</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label" for="basic-default-name">Sl.No</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="txtSLNo" disabled />
                            <%--<asp:TextBox runat="server" class="form-control" ID="projectSlNo" />--%>
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="html5-date-input" class="col-md-3 col-form-label">Date</label>
                        <div class="col-md-9">
                            <input class="form-control" type="date" value="2023-06-16" id="projectdate" />

                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="html5-number-input" class="col-md-3 col-form-label">Customer Number</label>
                        <div class="col-md-9">
                            <input class="form-control" type="number" value="" id="customernumber" />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="html5-number-input" class="col-md-3 col-form-label">Customer Name</label>
                        <div class="col-md-9">
                            <input class="form-control" type="Text" value="" id="customername" />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label" for="basic-default-name">Project Name</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="projectname" />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label" for="basic-default-name">Location</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="projectlocation" />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label" for="basic-default-name">Consultant</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="projectconsultant" />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label" for="basic-default-name">Main Contractor</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="projectmaincontractor" />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label" for="basic-default-name">MEP Contractor</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="projectMEPcontractor" />
                        </div>
                    </div>

                    <div class="mb-3 row" hidden>
                        <label for="html5-date-input" class="col-md-3 col-form-label">Delivery Date</label>
                        <div class="col-md-9">
                            <input class="form-control" type="date" value="2021-06-18" id="deliverydate" />
                        </div>
                    </div>


                    <div class="modal-footer">
                        <button type="button" id="BtnProjectAdd" class="btn btn-primary" runat="server"  onclick="addProject()">Add</button>
                        <%--<asp:Button runat="server" ID="btnAddProject"  class="btn btn-success"  Text="ADD" data-Submit="modal"></asp:Button>--%>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <%-- Datatable for Project Details --%>


    <div class="modal fade" id="FRDaddProjectstatus" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalProjectStatus">Project Status</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">



                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Stages</th>
                                    <th>Status</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><i class="fab fa-angular fa-lg text-danger me-3"></i><strong>Installation Instruction Requested By QC?</strong></td>

                                    <td><span class="badge frd-status-success me-1">Completed</span></td>
                                </tr>

                                <tr>
                                    <td><i class="fab fa-react fa-lg text-info me-3"></i><strong>Installation Instruction Sent To  Customer By Estimation Team?</strong></td>

                                    <td><span class="badge frd-status-success me-1">Completed</span></td>

                                </tr>

                                <tr>
                                    <td><i class="fab fa-vuejs fa-lg text-success me-3"></i><strong>FRD Instruction Inspection REQ.Raised By QC?</strong></td>

                                    <td><span class="badge frd-status-success me-1">Completed</span></td>

                                </tr>

                                <tr>
                                    <td><i class="fab fa-bootstrap fa-lg text-primary me-3"></i><strong>Visit REQ Accepted By Estimation Team/Share Contact Details?</strong></td>

                                    <td><span class="badge frd-status-pending me-1">Pending</span></td>

                                </tr>

                                <tr>
                                    <td><i class="fab fa-bootstrap fa-lg text-primary me-3"></i><strong>Request To Release The COC?</strong></td>

                                    <td><span class="badge frd-status-pending me-1">Pending</span></td>

                                </tr>
                            </tbody>
                        </table>
                    </div>





                    <div class="modal-footer">
                        <%--<button type="button" id="Button1" class="btn btn-primary" runat="server"  data-bs-dismiss="modal"  onclick="addProject()">Add</button>--%>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <%-- ENd --%>

    <%-- Modal for project details --%>
    <div class="modal fade" id="ModalProjectDetails" data-bs-backdrop="static" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 80%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title" id="lblprojDetailModal">Project Details Details</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div style="margin-top: -13px; position: absolute; width: 96%;">
                       <%-- <div style="text-align: right;">
                            <i class="bx bxs-chevron-up contract-det-drilldown" onclick="hideShowProjDetails()"></i>
                        </div>--%>
                    </div>


                    <div id="ContractDetailsRowDiv" style="background: #c4616136; padding: 17px; border-radius: 12px; border: 1px solid #c4616136; box-shadow: 4px 4px 13px -7px #1d1b1b36;">

                        <div class="row">

                            <div style="width: 20%; display:none">
                                <label for="html5-number-input" class="col-form-label label-custom">Id</label>
                                <div class="">

                                    <input class="form-control" type="text" id="textfrdId" readonly />
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Project Number </label>
                                <div class="">
                                    <input class="form-control" type="text" id="textfrdprjnumber" readonly />

                                </div>
                            </div>

                            <div style="width: 30%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Project Name</label>
                                <div class="">

                                    <input class="form-control" type="text" id="textprojectname" readonly />
                                </div>
                            </div>

                            <div style="width: 30%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Customer Name </label>
                                <div class="">

                                    <input class="form-control" type="text" id="textcustomewrname" readonly />
                                </div>
                            </div>

                             <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Location </label>
                                <div class="">

                                    <input class="form-control" type="text" id="textlocation" readonly />
                                </div>
                            </div>
                           



                        </div>


                        <div class="row">


                             <div style="width: 30%">
                                <label for="html5-number-input" class="col-form-label label-custom">Consultant </label>
                                <div class="">

                                    <input class="form-control" type="text" id="textconsultant" readonly />
                                </div>
                            </div>

                            <div style="width: 30%;">
                                <label for="html5-number-input" class="col-form-label label-custom"> Main Contractor</label>
                                <div class="">
                                    <input class="form-control" type="text" id="textmaincontractor" readonly />

                                </div>
                            </div>


                            <div style="width: 30%;">
                                <label for="html5-number-input" class="col-form-label label-custom">MEP Contractor</label>
                                <div class="">
                                    <input class="form-control" type="text" id="textmepcontractor" readonly />

                                </div>
                            </div>

                           

                           

                          
                        <div class="row">

                             <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Status </label>
                                <div class="">
                                    <input class="form-control" type="text" id="textstatus" readonly />

                                </div>
                            </div>

                             <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Created Date </label>
                                <div class="">

                                    <input class="form-control" type="text" id="textcreateddate" readonly />
                                </div>
                            </div>
                           
                         <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Customer Number</label>
                                <div class="">

                                    <input class="form-control" type="text" id="textcustomernumber" readonly />
                                </div>
                            </div>
                             <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Delivery Date </label>
                                <div class="">
                                    <input class="form-control" type="text" id="textdeliverydate" readonly />

                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Created By </label>
                                <div class="">
                                    <input class="form-control" type="text" id="textCreatedby" readonly />

                                </div>
                            </div>

                        </div>
                           
                        </div>

                    </div>


                    <%--Grid--%>


                    
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

    <%-- For Toaster --%>
    <script src="Scripts/project-master.js?v1.10"></script>
    <script src="Flatpickr/js/flatpickr.js"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />




</asp:Content>

