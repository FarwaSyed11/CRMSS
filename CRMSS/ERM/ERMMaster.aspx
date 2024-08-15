<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="ERMMaster.aspx.cs" Inherits="ERM_ERMMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <!-- Flatpicker Datepicker JS/CSS file-->
    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <style type="text/css">
       
    .centerforall {
        text-align: -webkit-center;
        text-align: -moz-center;
    }
        /*.nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #bf242c !important;
            border-bottom: 4px solid #bf242c !important;
        }


        .nav-tabs .nav-item .nav-link:not(.active) {
            background-color: white;
        }

        .nav-tabs .nav-item .nav-link:focus {
            color: #000000;
            border-bottom: 4px solid black;
        }

        .nav-tabs .nav-item .nav-link:not(.active) {
            background-color: white;
        }

        .nav-tabs .nav-item .nav-link:focus {
            color: #000000;
            border-bottom: 4px solid black;
        }*/

        .kpi-user-list-table th {
            background-color: #a92828;
            color: white !important;
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

        .overFlowNavKpi {
            overflow-y: auto;
            height: 565px;
        }

        .accordion li {
            font-size: small;
        }

        .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
            background-color: #e14b4b;
            border-color: #e14b4b;
            box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%);
        }
        /*Custom Menu Anwar*/
        .container {
            border-radius: 3px;
            padding: 5px;
            width: 60%;
            margin: 0 auto;
        }

        h2 {
            font-weight: normal;
            font-size: 25px;
        }

            h2:hover {
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
        .modal {
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1050;
    display: none;
    width: 100%;
    height: 100%;
    overflow-x: hidden;
    overflow-y: auto !important;
    outline: 0;
}

        #DataTables_Table_0_paginate .current {
            color: white !important;
            background: #a92828 !important;
        }

        .table td {
            color: #333333 !important;
        }

        .custom-loader {
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

        .loader-bg-blur {
            height: 100%;
            z-index: 9999999;
            position: fixed;
            background: #c3d3ce6b;
            width: 100%;
        }

        .hidden {
            display: none !important;
        }

        .iconClassExcel {
            margin-left: 8px;
            background: #933737;
        }

        .iconClassPdf {
            background: #933737;
        }

        .iconClassExcel:hover {
            background: #a54141;
        }

        .iconClassPdf:hover {
            background: #a54141;
        }

        .tablepopup th {
            background-color: #a92828;
            color: white !important;
            text-align: center;
        }

        .tablepopup td {
            text-align: center;
        }

        .tablepopup {
            width: 100%;
        }

        .modal-xl {
            max-width: 1400px !important;
        }

        .OPP-PTOverview-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .ERMRequest-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .ERMRequest-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }


        .Product-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Product-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .EngProduct-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .EngProduct-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .Attachment-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Attachment-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .Approval-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Approval-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }


        .table-Customer-Details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .table-Customer-Details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .table-Consultant-Details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .table-Consultant-Details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }


        .table-Opportunity-Details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .table-Opportunity-Details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }



        .Contact-item-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Contact-item-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        table.dataTable tbody tr:hover {
            cursor: pointer;
        }

        .btn-primary:hover {
            color: #fff;
            background-color: #bb1414;
            border-color: #bb1414;
            transform: translateY(-1px);
        }

        .btn-primary {
            color: #fff;
            background-color: #e12508;
            border-color: #e12508;
        }

            .btn-check:focus + .btn-primary, .btn-primary:focus {
                color: #ffffff;
                background-color: #76dd4b;
                border-color: #7bdd59;
                transform: translateY(-1px);
            }

            .btn-primary:hover {
                color: #ffffff;
                background-color: #76dd4b;
                border-color: #7bdd59;
                transform: translateY(-1px);
            }

        .Radio-info th {
            border: none !important;
            width: 10% !important;
            font-size: 100%;
            text-decoration: underline;
        }

        .Radio-info td {
            border: none !important;
        }


               input[type="radio"] {
	appearance: none;
	-webkit-appearance: none;
	width: 20px;
	height: 20px;
	border: 1px solid #ff8318;
	border-radius: 50%;
	margin-right: 10px;
	background-color: transparent;
	position: relative;
	top: 6px;
}

      input[type="radio"]:checked::before {
	content: "";
	display: block;
	width: 12px;
	height: 12px;
	background-color: #ca8489;
	border-radius: 50%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	animation: appear 0.8s;
}

        .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
            background-color: #ff7835 !important;
            border-color: #ff7835 !important;
            box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%) !important;
        }

        .form-control[readonly] {
            background-color: #fbfdff;
        }

        .form-control:focus, .form-select:focus {
            border-color: #b90707 !important;
        }

        .form-check-input[type=checkbox] {
            border-radius: 0.25em;
            background-color: #ededed;
        }

        .form-check-input[disabled] ~ .form-check-label, .form-check-input:disabled ~ .form-check-label {
            opacity: 1.5;
        }

       /* .tbody-ERMRequest .ibtn-Request-Details:hover {
            content: url("images/output-onlinegiftools.gif");
        }*/

        .tbody-Attachment-list .ibtn-Download-Details:hover {
            content: url("images/gif-download.gif");
        }

        .submit-button:hover {
            content: url("images/gif-submit-progress.gif");
        }

        .select2-container--default .select2-selection--single {
            padding-top: 1% !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div class="card-body">
            <div>
                <h3 class="mb-3" style="">Estimation Management</h3>
            </div>

            <div class="card-body" style="margin-top: -1%;">

                <div class="tblfilter" runat="server" id="tbltopsearch">
                    <div class="row">
                        <div class="col-6 d-flex">
                            <div class="input-group me-4">
                                <label class="input-group-text" for="">
                                    <asp:Label ID="Label8" Text="Type" runat="server" /></label>
                                <select id="ddlType" class="form-select color-dropdown" disabled>
                                    <option value="ESTIMATION">Estimation</option>
                                    <option value="ENGINEERING">Engineering</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <label class="input-group-text" for="">
                                    <asp:Label ID="Label1" Text="Status" runat="server" />
                                </label>
                                <select id="ddlRequestStatus" class="form-select color-dropdown"></select>
                            </div>
                        </div>
                        <div class="col-6">
                            <a href="#" id="btnNewAddReq" class="btn btn-primary" style="float: right;"><i class="fa fa-plus me-2" aria-hidden="true"></i>Add New</a>
                        </div>
                    </div>
                </div>


                <div class="ajax-loader loader-bg-blur">
                    <div class="custom-loader ">
                        <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
                        <h4>Loading Data...</h4>
                    </div>
                </div>
                <div class="" style="margin-top: 1%;">
                    <table class="table ERMRequest-list-table">

                        <thead>
                            <tr>

                                <th style="display: none">ID</th>
                                <th style="display: none">Role ID</th>
                                <th>EST. Ref</th>
                                <th>Revision</th>
                                <th>Contr ABBR</th>
                                <th>year</th>
                                <th>Opportunity Number</th>
                                <th>Project Number</th>
                                <th>Name</th>
                                <th>Created By</th>
                                <th>Created Date</th>
                                <th>View</th>
                            </tr>

                        </thead>
                        <tbody class="tbody-ERMRequest">
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>

    <div class="modal fade" id="ModalCustomerDetails" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title" id="lblprojDetailModal">Customer Details</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="font-size: 0.85rem;">

                    <div class="New-Add" style="">
                        <p class="float-left">Note: Select existing Customer from the below list or Add new </p>
                        <a href="#" id="btnAddCustomer" class="btn btn-primary" style="float: right;"><i class="fa fa-plus me-2" aria-hidden="true"></i>Add New</a>
                    </div>
                    <%--Grid--%>
                    <div class="mt-5">

                        <div class="nav-align-top">
                            <ul class="nav nav-tabs" id="mstone-task-modal-ul" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Customer" aria-controls="navs-top-Customer" aria-selected="true">Customer</button>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <%--1st--%>
                                <div class="tab-pane fade show active" id="navs-top-Customer" role="tabpanel" style="margin-top: -1%;">

                                    <%--            <div>
                                       <a href="#" class="btn btn-primary pull-right btn-add-tenant-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Tenant</a>
                                   </div>--%>

                                    <div class="table-responsive" style="margin-top: 1%; width: 100%;">

                                        <table class="table table-Customer-Details table-hover " style="width: 100%;">

                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th style="display: none;">CRMAccountId</th>
                                                    <th>Account Name</th>
                                                    <th style="display: none;">OwnerId</th>
                                                    <th>Owner</th>
                                                    <th>Company</th>
                                                    <%--  <th>Substage </th>
                                                   <th>Value </th>--%>
                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Customer-details" style="text-align: center;">
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

    <div class="modal fade" id="ModalOpportuniryDetails" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title" id="lbloPPModal">Opportunity Details</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="font-size: 0.85rem;">
                    <div class="New-Add" style="">
                        <p class="float-left">Note: Select existing Opportunity from the below list or Add new </p>
                        <a href="#" id="btnAddOpp" class="btn btn-primary" style="float: right;"><i class="fa fa-plus me-2" aria-hidden="true"></i>Add New</a>
                    </div>

                    <%--Grid--%>
                    <div class="mt-5" style="">
                        <div class="nav-align-top">
                            <ul class="nav nav-tabs" id="mstone-Opp-modal-ul" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Customer" aria-controls="navs-top-Customer" aria-selected="true">Opportunity</button>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <%--1st--%>
                                <div class="tab-pane fade show active" id="navs-top-Det" role="tabpanel" style="margin-top: -1%;">
                                    <%--            <div>
                                       <a href="#" class="btn btn-primary pull-right btn-add-tenant-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Tenant</a>
                                   </div>--%>
                                    <div class="table-responsive" style="margin-top: 1%; width: 100%">
                                        <table class="table table-hover table-Opportunity-Details" style="width: 100%">
                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th style="display: none;">OpportunitId</th>
                                                    <th>Opportunity Numbere</th>
                                                    <th>Name</th>
                                                    <th>Owner</th>
                                                    <th>MEP Contractor</th>
                                                    <th>MEP Consultant</th>
                                                    <th>Sales Stage</th>
                                                    <th>Status</th>
                                                    <th>Company</th>
                                                    <th style="display: none;">MarktingID</th>
                                                    <th>Marketing</th>
                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Opportunity-details" style="text-align: center;">
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

    <div class="modal fade" id="EstimationDetailModal" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document" style="max-width: 85%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h4 class="modal-title" id="EstimationDet">Estimation Details</h4>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="font-size: 0.85rem">

                    <div id="Estimation-details-rectangle-div p-3" style="">

                        <div class="row">
                            <div style="width: 14%;">
                                <label for="html5-number-input" class="  label-custom">Est Ref. </label>
                                <div class="">
                                    <input type="text" id="txtEstRef" value="" class="form-control" disabled />
                                </div>
                            </div>

                            <div style="width: 14%;">
                                <label for="html5-number-input" class="  label-custom">Revision </label>
                                <div class="">
                                    <input type="text" id="txtRevision" value="" class="form-control" disabled />
                                </div>
                            </div>

                            <div style="width: 14%;">
                                <label for="html5-number-input" class="  label-custom">Contr ABBR </label>
                                <div class="">
                                    <input type="text" id="txtContrAbbr" value="" class="form-control" style="" />
                                </div>
                            </div>

                            <div style="width: 14%;">
                                <label for="html5-number-input" class="  label-custom">Year</label>
                                <div class="">
                                    <input type="text" id="txtEstYear" value="" class="form-control" disabled />
                                </div>
                            </div>

                            <div style="width: 14%;">
                                <label for="html5-number-input" class="  label-custom">OPP Ref</label>
                                <div class="">
                                    <input type="text" id="txtOppRef" value="" class="form-control" />
                                </div>
                            </div>

                            <div style="width: 14%;">
                                <label for="html5-number-input" class="  label-custom">Proj Ref</label>
                                <div class="">
                                    <input type="text" id="txtProjRef" value="" class="form-control" disabled />
                                </div>
                            </div>
                            <div style="width: 14%;">
                                <label for="html5-number-input" class="  label-custom">Plot Number</label>
                                <div class="">
                                    <input type="text" id="txtPlotNumber" value="" class="form-control" />
                                </div>
                            </div>

                          
                        </div>

                        <div class="row mt-4" style="">
                            <h5 class="prpmdl-hed" id="lbladditemsa" style="">Details</h5>
                        </div>

                        <div class="row mt-1" style="">
                            <div style="width: 25%;">
                                <label for="html5-number-input" class="  label-custom">Project Name </label>
                                <div class="">
                                    <input type="text" id="txtPrjName" value="" class="form-control" style="" />
                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="  label-custom">Location </label>
                                <div class="">
                                    <input type="text" id="txtPrjLocation" value="" class="form-control" style="" />
                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="  label-custom">Client </label>
                                <div class="">
                                    <input type="text" id="txtPrjClient" value="" class="form-control" style="" />
                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="  label-custom">Consultant</label>
                                <div class="">
                                    <input type="text" id="txtPrjConsultant" value="" class="form-control" style="" />
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="  label-custom">Main Contractor </label>
                                <div class="">
                                    <input type="text" id="txtPrjMainContr" value="" class="form-control" style="" />
                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="  label-custom">MEP Contractor </label>
                                <div class="">
                                    <input type="text" id="txtPrjMEPContr" value="" class="form-control" style="" />
                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="  label-custom">Contact Person With Phone </label>
                                <div class="">
                                    <input type="text" id="txtPrjContactPerson" value="" class="form-control" style="" placeholder="-----Click to select Customer-----" />
                                </div>
                            </div>
                            <div style="width: 4%; display: none;" class="div-New">
                                <label for="html5-number-input" class="  label-custom"></label>
                                <div class="">
                                    <img src="images/gif-user.gif" title="Add New" class="fa-icon-hover" style="cursor: pointer; width: 36px; padding-top: 11px;" />
                                </div>
                            </div>


                            <div style="width: 10.5%;" class="div-win">
                                <label for="html5-number-input" class="  label-custom">Winning % </label>
                                <div class="">
                                    <input type="number" id="txtPrjWinningPerc" value="0" class="form-control" style="" min="0" />
                                </div>
                            </div>

                            <div style="width: 10.5%;" class="div-budge">
                                <label for="html5-number-input" class="  label-custom">Budget </label>
                                <div class="">
                                    <input type="number" id="txtPrjBudget" value="0" class="form-control" style="" min="0" />
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="  label-custom">URL </label>
                                <div class="">
                                    <input type="text" id="txtPrjURL" value="" class="form-control" style="" />
                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="  label-custom">Estimation Team Org </label>
                                <div class="">
                                    <select id="ddlEstimationTeamOrg" class="form-select color-dropdown"></select>
                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="  label-custom">Salesman</label>
                                <div class="">
                                    <input type="text" id="txtSalesman" value="" class="form-control" style="" disabled />
                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="  label-custom">Marketing</label>
                                <div class="">
                                    <input type="text" id="txtMarketing" value="" class="form-control" style="" disabled />
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-4 px-3">
                                <b>Stage :
                                </b>
                                <input type="radio" id="rdStgTender" name="Stage" value="TENDER" style="margin-left: 5%">TENDER 
                             <input type="radio" id="rdStgJOH" name="Stage" value="J.O.H" style="margin-left: 5%">JOH
                            </div>
                            <div class="col-md-4">
                                <b>Scope :
                                </b>
                                <input type="radio" id="rdSp" name="Supply" value="SUPPLY" style="margin-left: 5%">SUPPLY
                             <input type="radio" id="rdSpInstall" name="Supply" value="SUPPLY AND INSTALLATION" style="margin-left: 5%">SUPPLY & INSTALLATION
                            </div>
                            <div class="col-md-4">
                                <b>Quotation :
                                </b>
                                <input type="radio" id="rdQtSmart" name="Quotation" value="SMART QTNG" style="margin-left: 5%">SMART QTNG
                     
                             <input type="radio" id="rdQtAndSp" name="Quotation" value="AS PER DRAWING AND SPECIFICATION" style="margin-left: 5%">AS PER DRAWING & SPECIFICATION
                         
                           <%-- <a href="#" id="btnSubmitOptDet" class="btn btn-primary" style="float:right;">Submit</a>--%>
                            </div>
                        </div>
                        <%-- Estimation Co-ordinator --%>

                        <div class="row" style="padding-top: 1%;">
                            <div style="width: 25%;" class="Estimation-TeamLeader">
                                <label for="html5-number-input" class="  label-custom">Team Leader </label>
                                <div class="">
                                    <select id="ddlTeamLeader" class="form-select color-dropdown"></select>
                                </div>
                            </div>

                            <div class="col-3 Assign-Attachment">
                                <label for="html5-number-input" class="  label-custom">Attachment</label>
                                <div class="input-group mb-3 insert-Attachment">
                                    <%--<label for="html5-number-input" class="  label-custom" style="float: left;padding-right: 10px;padding-top: 2px;">Attachment</label>--%>

                                    <input class="form-control" type="file" id="fu-upload-ERMReq" title="Attachment" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getERMFileName()" />
                                    <label class="input-group-text ml-3" for="fu-upload-ERMReq" style="cursor: pointer; border-color: #ff00007d;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24" title="File Upload">
                                            <g fill="none" stroke="#ec1a25" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                                <path d="M4 22h14a2 2 0 0 0 2-2V7l-5-5H6a2 2 0 0 0-2 2v4" />
                                                <path d="M14 2v4a2 2 0 0 0 2 2h4M3 15h6m-3-3v6" />
                                            </g>
                                        </svg>
                                        <%--<img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; margin-top: -15px;" />--%>
                                    </label>
                                    <input class="form-control" type="text" id="lblERMFile" value="" style="background: #80808000; color: #8b8b8b !important; border-color: #ff00007d;" readonly="" />
                                </div>
                            </div>
                            <div class="row justify-content-center">
                                <div class="d-flex rounded  col-1 p-3 m-2 text-center">
                                    
                                    <img src="images/icons8-submi-progress.png" id="btnSubmitOptDet" title="Submit" class="fa-icon-hover submit-button" style="cursor: pointer; width: 50px;" />
                                </div>
                            </div>

                            <div style="width: 100%;">
                                  <div style="float:right">
                              <button type="button" class="btn btn-success btnMoreReq me-3" style="float: right; margin-left: 5px;"><i class="bx bxs-check-circle"></i>Ask More Info</button>
                          </div>
                                                          <div style="float:right">
                            <button type="button" class="btn btn-success btnAssign me-3" style="float: right; margin-left: 5px;"><i class="bx bxs-check-circle"></i>Assign</button>
                        </div>
                              
                                                         <div style="float:right">
                                                            <select id="ddlEstimationHead" value="" class="form-control" style="float: right; margin-left: 5px;min-width:200px"></select>

                                                        </div>
                                
                                  

                                <div>
                                    <button type="button" class="btn btn-success btnSubmitRequest me-3" style="float: right; margin-left: 5px;"><i class="bx bxs-save"></i>Submit</button>
                                </div>
                                <div>
                                    <button type="button" class="btn btn-success btnApprove me-3" style="float: right; margin-left: 5px;"><i class="bx bxs-check-circle"></i>Approve</button>
                                </div>
                                <div>
                                    <button type="button" class="btn btn-danger btnReject me-3" style="float: right;"><i class="bx bxs-x-circle"></i>Reject</button>
                                </div>

                                <div>
                                    <button type="button" class="btn btn-danger btnCompleted me-3" style="float: right;"><i class="bx bxs-x-circle"></i>Completed</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--Grid--%>


                    <div style="margin-top: 1.5%;" class="Estim-taable-data">
                        <nav id="nav-tab">
                            <ul class="nav nav-pills" id="Estimation-Det-modal-ul" role="tablist">

                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Product" aria-controls="navs-top-Product" aria-selected="true">Product</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Attachment" aria-controls="navs-top-Attachment" aria-selected="false">Attachment</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Approval" aria-controls="navs-top-Approval" aria-selected="false">Approval Status</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Comments" aria-controls="navs-top-Comments" aria-selected="false">Comments</button>
                                </li>
                            </ul>
                            <div class="tab-content">

                                <%--  <div class="tab-pane fade show active" id="navs-top-Dashboard" role="tabpanel" style="margin-top: -1%;">--%>

                                <%--<div> 
                             <a href="#" class="btn btn-primary pull-right btn-add-mstone-grid"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Milestone</a>
                                         </div>
                                </div>

                                  <%--2nd--%>
                                <div class="tab-pane fade show active" id="navs-top-Product" role="tabpanel">
                                    <div>
                                        <a href="#" id="btnNewAddProduct" class="btn btn-primary pull-right"><i class="fa fa-plus me-2" aria-hidden="true"></i>Add New</a>
                                    </div>
                                    <div style="padding-top: 2%">

                                        <table class="table Product-list-table" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead>
                                                <tr style="text-align: center;">
                                                    <td class="hidden">ReqID</td>
                                                    <th>Product</th>
                                                    <th>Remarks</th>
                                                    <th>Estimation Team</th>
                                                    <td class="hidden">EH</td>
                                                    <th>Estimator</th>
                                                    <td class="hidden">ES</td>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Product-list" style="text-align: center;">
                                            </tbody>
                                        </table>

                                    </div>
                                </div>

                                <%--3rd--%>


                                <div class="tab-pane fade" id="navs-top-Attachment" role="tabpanel">

                                    <div>
                                        <a href="#" id="btnNewAttacment" class="btn btn-primary pull-right"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;New Attachment</a>
                                    </div>
                                    <div style="padding-top: 3%;">


                                        <table class="table Attachment-list-table" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th style="display: none;">Id</th>
                                                    <th>Filename</th>
                                                    <th>Comments</th>
                                                    <th style="display: none;">Comments</th>
                                                    <th>Action</th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Attachment-list" style="text-align: center;">
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="navs-top-Approval" role="tabpanel">


                                    <div>


                                        <table class="table Approval-list-table" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead>
                                                <tr style="text-align: center;">

                                                    <th>Role</th>
                                                    <th>User</th>
                                                    <th>Status</th>
                                                    <th>Comments</th>
                                                    <th>Date</th>


                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Approval-list" style="text-align: center;">
                                            </tbody>
                                        </table>
                                    </div>

                                </div>


                                <div class="tab-pane fade" id="navs-top-Comments" role="tabpanel">
                                    <div>
                                        <a href="#" id="btnAddNewComments" class="btn btn-primary pull-right"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;New Comments</a>
                                    </div>

                                    <div style="padding-top: 3%;">


                                        <table class="table Comments-list-table" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead>
                                                <tr style="text-align: center;">

                                                    <th>SlNo.</th>
                                                    <th>Commment</th>
                                                    <th>UpdatedBy</th>
                                                    <th>Updated Date</th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Comments-list" style="text-align: center;">
                                            </tbody>
                                        </table>
                                    </div>

                                </div>



                            </div>
                        </nav>
                    </div>




                    </div>


                </div>
                <%--  <div class="modal-footer">
                 <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                 <button type="button" class="btn btn-primary">Save changes</button>
               </div>--%>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalProductAdd" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title" id="Modalproduct">PRODUCT LIST</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close" style="margin-right: -15%;"></button>
                    <span style="margin-right: 0px;">
                        <button type="button" class="btn btn-success btnSaveProduct"><i class="bx bxs-save"></i>Save</button>

                    </span>
                </div>
                <div class="modal-body" style="zoom: 95%">



                    <div style="margin-top: -1%;">
                        <div style="background: #e14f0c17; padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">
                            <%-- <div class="row">
                                 <div style="width: 40%;">
                                     <div>
                                         <h5 class="prpmdl-hed" style="text-decoration: underline;">PRODUCT</h5>
                                     </div>
                                 </div>
                                 <div style="width: 60%;">

                                     <div>
                                         <h5 class="prpmdl-hed" style="text-decoration: underline;">REMARKS</h5>
                                     </div>
                                 </div>
                             </div>--%>
                            <div id="Estimation_Company_Products">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalNewCustomer" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalCustomerAdd">Add New Csutomer</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="font-size: 0.85rem;">
                    <div style="">
                        <div style="">

                            <div>
                                <h6 class="prpmdl-hed" style="">Enter Customer Details:</h6>
                            </div>

                            <div class="row" style="margin-top: 1%;">

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="  label-custom">Name </label>
                                    <div class="">
                                        <input type="text" id="txtCustName" value="" class="form-control" style="" />
                                    </div>
                                </div>

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="  label-custom">Primary Category </label>
                                    <div class="">
                                        <select id="dlCustPRCategory" value="" class="form-control" style="">
                                        </select>
                                    </div>
                                </div>

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="  label-custom">Sub Category </label>
                                    <div class="">
                                        <select id="dlCustSubCategory" value="" class="form-control" style="">
                                        </select>
                                    </div>
                                </div>

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="  label-custom">Phone </label>
                                    <div class="">
                                        <input type="text" id="txtCustNumber" value="" class="form-control" style="" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="margin-top: 1%;">

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="  label-custom">Email </label>
                                    <div class="">
                                        <input type="text" id="txtCustEmail" value="" class="form-control" style="" />
                                    </div>
                                </div>

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="  label-custom">URL </label>
                                    <div class="">
                                        <input type="text" id="txtCustURL" value="" class="form-control" style="" />
                                    </div>
                                </div>

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="  label-custom">Country </label>
                                    <div class="">
                                        <select id="dlCustCountry" value="" class="form-control" style="">
                                        </select>
                                    </div>
                                </div>

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="  label-custom">City </label>
                                    <div class="">
                                        <select id="dlCustCity" value="" class="form-control" style="">
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="margin-top: 1%;">

                                <div class="col-4" style="padding-top: 2px;">
                                    <label for="html5-number-input" class="  label-custom">Owner <span style="color: red;">*</span></label>
                                    <div>
                                        <%--<input type="text" id="txtActionOwner" class="form-control"/>--%>
                                        <select id="txtActionOwner" class="form-control"></select>

                                    </div>
                                </div>
                            </div>

                            <div class="row" style="margin-top: 1%;">

                                <%--<div style="width: 50%;">
                                     <label for="html5-number-input" class="  label-custom">Address </label>
                                     <div class="">

                                        
                                         <textarea type="text" id="txtCustAddress" value="" style="width: 100%; background: #ffffff; border: 0px; color: #697a8d; border: none;border-bottom: solid;border-color: #ffaf87;overflow-y: scroll;resize: none;" rows="2"  />
                                     </div>
                                 </div>--%>
                                <div class="col mb-3 discriptionDiv">
                                    <label for="nameBasic" class="">Address </label>
                                    <textarea id="txtCustAddress" rows="3" class="form-control" style="overflow-y: scroll;" placeholder="Enter your Address"></textarea>
                                </div>

                                <%-- <div style="width: 50%;">
                                     <label for="html5-number-input" class="  label-custom">Remarks </label>
                                     <div class="">
                                         <textarea type="text" id="txtCustRemarks" value="" style="width: 100%; background: #ffffff; border: 0px; color: #697a8d; border: none;border-bottom: solid;border-color: #ffaf87; overflow-y: scroll;resize: none;" rows="2"/>
                                     </div>
                                 </div>--%>
                                <div class="col mb-3 discriptionDiv">
                                    <label for="nameBasic" class="">Remarks </label>
                                    <textarea id="txtCustRemarks" rows="3" class="form-control" style="overflow-y: scroll;" placeholder="Enter the Remarks"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <a href="#" id="btnSaveCustomerDet" class="btn btn-primary pull-right" style="width: 10%;">Save</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalReqAttachment" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="max-width: 25%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalAddAttacment">ATTACHMENT</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">



                    <div style="margin-top: -1%;">
                        <div style="background: #1d1b1b36; padding: 17px; border-radius: 12px; border: 1px solid #1d1b1b36; box-shadow: 0px 0px 13px -7px #1d1b1b36;">

                            <div class="row">

                                <div>
                                    <h5 class="prpmdl-hed" style="">Attachment</h5>
                                </div>

                            </div>

                            <div class="row">

                                <div>

                                    <div class="col mb-3 discriptionDiv">
                                        <label for="nameBasic" class="  label-custom">Comments </label>
                                        <textarea id="txtAttachmentComment" rows="3" class="form-control" style="border-bottom: solid; border-color: #b9b9b9; overflow-y: scroll;" placeholder="Enter the Commments"></textarea>
                                    </div>
                                </div>

                            </div>

                            <div class="row" style="margin-top: 1%;">

                                <%--     <div>
                                     <label for="html5-number-input" class="  label-custom">Type </label>
                                     <div class="">

                                        
                                           <select id="dlAttachmentType" value="" style="width: 100%; background: #ffffff; border: 0px; color: #697a8d; border: none;border-bottom: solid;border-color: #ffc1a3;height:28px;" >
                                            </select>
                                     </div>
                                 </div>--%>
                            </div>
                            <div class="row" style="margin-top: 2%;">

                                <div class="col-12 pull-left upload-Attatchment" style="display: block">
                                    <div class="input-group mb-3" style="position: relative; top: 10px;">
                                        <input class="form-control" type="file" id="colFileUpload" accept=".pdf,.png,.jpeg" multiple>
                                        <label class="input-group-text File-Upload-Multi" for="colFileUpload"><i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i></label>

                                        <div style="margin-left: 9px;">

                                            <a href="#" id="btnUpload1" class=" btn btn-primary">Add Attachment </a>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="mpActionComments" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Please enter The action remarks</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <input class="form-control" type="text" value="" id="txtActionComments" />
                    <input type="hidden" id="hfdAction" />

                </div>
                <div class="modal-footer">
                    <div style="margin-right: 41%;">
                        <button id="btnSaveAction" type="button" class="btn btn-primary" data-bs-dismiss="modal">Update</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalConsultant" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title">Consultant Details</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">




                    <div style="margin-top: 3%;">

                        <div class="nav-align-top">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Consultant" aria-controls="navs-top-Consultant" aria-selected="true">Consultant</button>
                                </li>


                            </ul>
                            <div class="tab-content">
                                <%--1st--%>
                                <div class="tab-pane fade show active" id="navs-top-Consultant" role="tabpanel" style="margin-top: -1%;">

                                    <%--            <div>
                                   <a href="#" class="btn btn-primary pull-right btn-add-tenant-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Tenant</a>
                               </div>--%>

                                    <div class="table-responsive" style="margin-top: 1%; width: 100%;">

                                        <table class="table table-Consultant-Details" style="width: 100%;">

                                            <thead>
                                                <tr style="text-align: center;">


                                                    <th style="display: none;">CRMAccountId</th>
                                                    <th>Account Name</th>
                                                    <th style="display: none;">OwnerId</th>
                                                    <th>Owner</th>
                                                    <th>Company</th>
                                                    <%--  <th>Substage </th>
                                               <th>Value </th>--%>
                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Consultant-details" style="text-align: center;">
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

   

    <div class="modal fade" id="ModalContact" tabindex="-2" aria-hidden="true" style="background-color: #13131466" data-bs-backdrop="static">
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

                    <a href="#" id="btnNewContact" class="btn btn-primary pull-right" style="float: right">New Contact</a>

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

    <div class="modal fade" id="ModalNewContactMaster" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="max-width: 60%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalNewContact">NEW CONTACT</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">



                    <div style="margin-top: -1%;">
                        <div style="background: #1d1b1b36; padding: 17px; border-radius: 12px; border: 1px solid #1d1b1b36; box-shadow: 0px 0px 13px -7px #1d1b1b36;">

                            <div>
                                <h5 class="prpmdl-hed" style="">CONTACT</h5>
                            </div>

                            <div class="row" style="margin-top: 1%;">

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="  label-custom">Contact Name </label>
                                    <div class="">


                                        <input type="text" id="txtContactName" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;" />
                                    </div>

                                    <%--<div class="wrap">
                                         <label for="txtContactName">Contact Name</label>
                                         <input id="txtContactName" type="text" class="cool" />
                                     </div>--%>
                                </div>

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="  label-custom">Job Title </label>
                                    <div class="">


                                        <input type="text" id="txtJobTitle" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;" />
                                    </div>
                                </div>


                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="  label-custom">Gender </label>
                                    <div class="">


                                        <select id="ddlGender" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                            <option value="MALE">Male</option>
                                            <option value="FEMALE">FeMale</option>
                                        </select>
                                    </div>
                                </div>



                            </div>


                            <div class="row" style="margin-top: 1%;">

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="  label-custom">Phone Number </label>
                                    <div class="">


                                        <input type="text" id="txtPhoneNumber" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                    </div>
                                </div>

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="  label-custom">Email </label>
                                    <div class="">


                                        <input type="text" id="txtEmail" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;" />
                                    </div>
                                </div>

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="  label-custom">Country </label>
                                    <div class="">


                                        <select id="ddlCountry" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="margin-top: 1%;">




                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="  label-custom">City </label>
                                    <div class="">


                                        <select id="ddlCity" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                        </select>
                                    </div>
                                </div>

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="  label-custom">Nationality </label>
                                    <div class="">


                                        <input type="text" id="txtNationality" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;" />
                                    </div>
                                </div>


                            </div>


                            <div class="row" style="padding-top: 1%;">
                                <div class="col-12">
                                    <a href="#" id="btnAddContact" class="btn btn-primary pull-right" style="width: 10%;">Add</a>
                                </div>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="modalNewComments" style="background: rgb(177 171 171 / 36%); zoom: 80%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="width: 22%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Comments</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding-top: 1px;">
                        <div>

                            <div>
                                <textarea class="form-control" id="txtComments" rows="5" placeholder="Enter Your Comments"></textarea>

                            </div>
                        </div>
                    </div>

                    <div class="row" style="padding-top: 3%;">
                        <div class="col-5">
                            <div class="row">
                                <div style="width: 13%">
                                    <div class="checkbox-wrapper-26" style="float: left;">
                                        <input type="checkbox" id="cbRaisedMail" onclick="MailInfo()" />
                                        <label for="cbRaisedMail"><span class="tick_mark"></span></label>
                                    </div>
                                </div>
                                <div style="width: 70%">
                                    <label style="font-size: 17px;">Raised Mail</label>
                                </div>

                            </div>

                        </div>

                    </div>

                    <div class="row mail-to-drp" style="padding-top: 1%;">
                        <div>
                            <div class="col-6">
                                <label for="html5-number-input" class="  label-custom">Mail To </label>
                                <div class="">
                                    <select id="ddlEmailTo" style="z-index: 99 !important;" class="form-select color-dropdown" multiple>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mail-cc-drp" style="padding-top: 3%;">
                        <div>
                            <div class="col-6">
                                <label for="html5-number-input" class="  label-custom">CC Mail </label>
                                <div class="">
                                    <select id="ddlCCEmail" style="z-index: 99 !important;" class="form-select color-dropdown" multiple>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="padding-top: 4%;">
                        <div class="centerforall">
                            <button id="btnSubmitComments" type="button" class="btn-danger" style="background-color: #EC1A25; font-size: 17px; width: 70%;">Add</button>
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
        var myrole = '';
        var overAllPerfo = 0;
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';
        });

    </script>

    <!-- Bootstrap JS/CSS file-->
    <link href="bootstrap-5.2.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>

    <!-- Toaster JS/CSS file-->
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>



    <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>

    <!-- Page JS/CSS file -->
    <script src="Scripts/ERMMaster.js?v=5"></script>
   <%-- <link href="css/quotation.css" rel="stylesheet" />--%>
    <link href="Css/EMSStyle.css" rel="stylesheet" />

    <!-- Select/Multiselect Dropdown JS/CSS file -->
  <%--  <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>--%>
    <script src="script/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />

      <script src="Assets/Js/multiple-select.js"></script>
      <link href="../sitesurvey/Assets/Css/multiple-select.css" rel="stylesheet" />


</asp:Content>

