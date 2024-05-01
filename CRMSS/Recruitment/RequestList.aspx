<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="RequestList.aspx.cs" Inherits="Recruitment_System_RequestList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

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

       .nav-tabs .nav-item .nav-link.active {
            color: #ff6c00;
            background-color: #fdfdfd;
            border-color: #fff;
            BORDER-BOTTOM: SOLID;
        }

        .nav-tabs .nav-item .nav-link:hover {
            color: #ff6c00;
            background-color: #fdfdfd;
            border-color: #fff;
            BORDER-BOTTOM: SOLID;
        }

        .nav-tabs .nav-item .nav-link:not(.active) {
            color: black;
            background-color: #b4b9bf;
            color: #b12626;
            background-color: #fdfdfd;
            border-color: #fff;
            /* BORDER-BOTTOM: SOLID;*/
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
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .tablepopup td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .tablepopup {
            width: 100%;
        }

        .modal-xl {
            max-width: 1400px !important;
        }

        .hidden {
            display: none;
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
            line-height: 1.25;
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
            padding-top: 5px !important;
        }

        .tbody-OPPDetails .History:hover {
            content: url("images/gif-book-line.gif");
        }

        .tbody-OPPDetails .viewmore:hover {
            content: url("images/gif-add-line.gif");
        }

        .nav-pills .nav-link.active, .nav-pills .nav-link.active:hover, .nav-pills .nav-link.active:focus {
            background-color: #b92c2c;
            color: #fff;
            box-shadow: 0 2px 4px 0 rgb(68 0 0 / 40%);
        }

        .drp-height {
            line-height: 1.25 !important;
        }

        .select2-container--default .select2-selection--multiple .select2-selection__choice__display {
            cursor: default;
            padding-left: 12px !important;
            padding-right: 5px;
            color: #e02d0a;
        }


        .LostOPT-Responsibility-Details .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .LostOPT-Responsibility-Details th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .LostOPT-Responsibility-Details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .btn-verify
        {
            background-color: #0ecb0b !important;
            border-color: #8fcb2e !important;
        }
         .Opt-det-drilldown {
            font-weight: 800;
            color: #ffffff;
            border: 1px solid #b8adad;
            width: 3%;
            cursor: pointer;
            margin-top: 6px;
            position: inherit;
            background: #d54832e8;
            border-radius: 13px;
            text-align: center;
        }

         .InterviewInfo-Details-table th {
    text-align: center;
    color: white !important;
    border: none;
}

.InterviewInfo-Details-table td {
    border-bottom: 1px solid #96a2ab45 !important;
}

.InterviewInfo-Details-table .Head-tr {
    background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
}


fieldset {
	margin: 50px; 
	padding: 20px;
	border-radius: 20px;
	background-color: rgba(255, 255, 255, 0.1);
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	display: inline-block;
	border: none;
}

legend {
	font-size: 28px;
	font-weight: bold;
	background: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(2px);
	border-radius: 20px;
	padding: 10px 20px;
	color: white;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

input[type="radio"] {
	appearance: none;
	-webkit-appearance: none;
	width: 20px;
	height: 20px;
	border: 1px solid #abaaaa;
	border-radius: 50%;
	margin-right: 10px;
	background-color: #ededed;
	position: relative;
	top: 6px;
}

input[type="radio"]:checked::before {
	content: "";
	display: block;
	width: 14px;
	height: 14px;
	background-color: #66d779;
	border-radius: 50%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	animation: appear 0.8s;
}

@keyframes appear {
	0% {
		transform: translate(-50%, -50%) scale(0);
		background-color: #fff;
	}
	45% {
		transform: translate(-50%, -50%) scale(1.6);
		background-color: #7bff79;
	}
	50% {
		transform: translate(-50%, -50%) scale(1.7);
		background-color: #3aff37;
	}
	55% {
		transform: translate(-50%, -50%) scale(1.6);
	}
	100% {
		transform: translate(-50%, -50%) scale(1);
		background-color: #66d779;
	}
}

        .RRF-Requests-details .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .RRF-Requests-details th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .RRF-Requests-details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

         .bg-primary {
                background-color: #daeeff !important;
                color: #227cbfd9 !important;
                letter-spacing: 1px;
                box-shadow: 0px 0px 3px 0px #1d4ea9;
        }

        .bg-Approve {
            background-color: #c9f9cf !important;
            color: #02e128 !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #03d91d;
        }

        .bg-Reject {
            background-color: #ffaaaa !important;
            color: #c90000d9 !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #c93333;
        }

         .bg-Submit {
            background-color: #fff7939c !important;
            color: #9f9400 !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #c1bd49;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


  <%--  <div class="ajax-loader loader-bg-blur hidden">
        <div class="custom-loader ">
            <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
            <h4>Loading Data...</h4>
        </div>
    </div>--%>
    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div class="row" style="padding-top: 2%;">
            <div class="col-10"></div>
            <div class="col-2">
               
                <button type="button" id="btnModalCall" class="btn btn-primary btnAddTask">Add</button>
            </div>
            <div class="card-body" style="margin-top: -1%; zoom: 85%;">
                <div class="card-body" style="margin-top: -1%;">


                    <table class="table RRF-Requests-details" style="width: 100%;">


                        <thead>

                            <tr class="Head-tr">
                                <%--<th>Id</th>--%>
                                <th style="width: 8%; display: none;">RequestId</th>
                                <th>Department</th>
                                <th>Job Title</th>
                                <th>Number Of Position</th>
                                <th>Reason For Hiring</th>
                                <th>Reports To</th>
                                <th>Status</th>
                                <th>Action</th>

                            </tr>
                        </thead>


                        <tbody class="tbody-RRFRequest">
                        </tbody>
                    </table>


                </div>
            </div>


        </div>
    </div>


   
      <div class="modal fade" id="mpMoreData" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                      <h5 class="modal-title">Request Details</h5>
                    
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="Opt-All-Info">
                        <div style="margin-top: -13px; position: absolute; width: 96%;">
                            <div style="text-align: right;">
                                <i class="bx bxs-chevron-up Opt-det-drilldown" onclick="hideShowOptDetails()"></i>
                            </div>
                        </div>


                        <div id="OptDetailsRowDiv" style="background: #e8b79c3b; padding: 17px; border-radius: 12px; border: 4px solid #f9bfa86b; box-shadow: 0px 0px 13px -7px #d84d1a;">

                            <div class="row">

                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                                    <div class="">

                                        <%--<input class="form-control" type="text" id="txtDepartment" readonly />--%>
                                        <label id="lblDepartment" style="font-size: 12px;">IT</label>
                                    </div>
                                </div>

                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">No.of Position</label>
                                    <div class="">
                                       <%-- <input class="form-control" type="text" id="txtNoOfPos" readonly />--%>
                                         <label id="lblNoOfPos" style="font-size: 12px;">12</label>

                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Reports to</label>
                                    <div class="">

                                       <%-- <input class="form-control" type="text" id="txtReportsTo" readonly />--%>
                                        <label id="lblReportsTo" style="font-size: 12px;">NAVAS</label>
                                    </div>
                                </div>

                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Job Title</label>
                                    <div class="">

                                     <%--   <input class="form-control" type="text" id="txtJobTitle" readonly />--%>
                                         <label id="lblJobTitle" style="font-size: 12px;">SOFTWARE DEVELOPER</label>
                                    </div>
                                </div>

                                <div style="width:20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Location</label>
                                    <div class="">

                                        <%--<input class="form-control" type="text" id="txtLocation" readonly />--%>
                                         <label id="lblLocation" style="font-size: 12px;">JABEL ALI</label>
                                    </div>
                                </div>
                            </div>


                            <div class="row">

                                 <div style="width:20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Salary Range</label>
                                    <div class="">

                                       <%-- <input class="form-control" type="text" id="txtSalaryRange" readonly />--%>
                                         <label id="lblSalaryRange" style="font-size: 12px;">5000</label>
                                    </div>
                                </div>

                                  <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Created Date</label>
                                    <div class="">

                                        <%--<input class="form-control" type="text" id="txtCreatedDate" readonly />--%>
                                         <label id="lblCreatedDate" style="font-size: 12px;">12/08/2018</label>
                                    </div>
                                </div>

                                 <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">EmployeeId</label>
                                    <div class="">

                                       <%-- <input class="form-control" type="text" id="txtSubmittedBy" readonly />--%>
                                        <label id="lblEmpId" style="font-size: 12px;">NAVAS</label>
                                    </div>
                                </div>

                                 <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Status</label>
                                    <div class="">

                                       <%-- <input class="form-control" type="text" id="txtReqStatus" readonly />--%>
                                         <label id="lblReqStatus" style="font-size: 12px;">SUBMIT</label>
                                    </div>
                                </div>
                                 <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Remarks</label>
                                    <div class="">

                                       <%-- <input class="form-control" type="text" id="txtRemarks" readonly />--%>
                                         <label id="lblRemarks" style="font-size: 12px;">TEST</label>
                                    </div>
                                </div>

                            </div>

                           
                        </div>

                        <div class="" style="margin-top: 1%;">



                            <div class="nav-align-top">
                                <ul class="nav nav-tabs" role="tablist">

                                     <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ViewQualification" aria-controls="tab-ViewQualification" aria-selected="false">ViewQualification &nbsp;<i class="fa fa-graduation-cap"></i></button>
                                </li>

                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ViewQuestion" aria-controls="tab-ViewQuestion" aria-selected="true">Question &nbsp;<i class="fa fa-question"></i></button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ViewAttachment" aria-controls="tab-ViewAttachment" aria-selected="true">Attachment &nbsp;<i class="	fa fa-thumb-tack"></i></button>
                                </li>


                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Approval" aria-controls="tab-Approval" aria-selected="false">Approval &nbsp;<i class="fa fa-check-square-o"></i></button>
                                    </li>

                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-AllCandidates" aria-controls="tab-AllCandidates" aria-selected="true">All Candidated &nbsp;<i class="fa fa-user-circle"></i></button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Shortlisted" aria-controls="tab-Shortlisted" aria-selected="true">Shortlisted &nbsp;<i class="fa fa-sort"></i></button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ForInterview" aria-controls="tab-ForInterview" aria-selected="true">For Interview &nbsp;<i class="fa fa-users"></i></button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Selected" aria-controls="tab-Selected" aria-selected="false">Selected &nbsp;<i class="fa fa-check"></i></button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-History" aria-controls="tab-History" aria-selected="false">History &nbsp;<i class="fa fa-history"></i></button>
                                    </li>

                                </ul>
                                <div class="tab-content">


                           <div class="tab-pane fade show active" id="tab-ViewQualification" role="tabpanel">
                                    <div class="row">

                                        <div style="width: 33.33%;">
                                            <div class="row">
                                                <div style="width: 90%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Education</label>
                                                    <div class="">

                                                        <select class="form-control" id="ddlViewQLEducation" style="border-color: lightgrey;">
                                                        </select>
                                                    </div>
                                                </div>

                                               <%-- <div style="width: 5%; padding-top: 8%; padding-left: 0%;">

                                                    <img id="btnAddEducation" src="Images/Add-Icon.png" title="Add" class="fa-icon-hover" style="cursor: pointer; width: 26px;" />


                                                </div>--%>

                                            </div>
                                        </div>

                                        <div style="width: 33.33%;">
                                            <div class="row">
                                                <div style="width: 90%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Nationality</label>
                                                    <div class="">

                                                        <select class="form-control" id="ddlViewQLNationality" style="border-color: lightgrey;">
                                                        </select>
                                                    </div>
                                                </div>
                                             <%--   <div style="width: 5%; padding-top: 8%; padding-left: 0%;">

                                                    <img id="btnAddNationality" src="Images/Add-Icon.png" title="Add" class="fa-icon-hover" style="cursor: pointer; width: 26px;" />


                                                </div>--%>
                                            </div>
                                        </div>

                                        <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Years of Experience</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtViewQLYearsOfExp" style="border-color: lightgrey;">
                                            </div>
                                        </div>

                                    </div>


                                    <div class="row">

                                        <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Gender</label>
                                            <div class="">

                                                <select class="form-control" id="ddlViewQLGender" style="border-color: lightgrey;">
                                                    <option value="MALE">Male</option>
                                                    <option value="FE_MALE">FeMale</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div style="width: 33.33%;">
                                            <div class="row">
                                                <div style="width: 90%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Languages</label>
                                                    <div class="">

                                                        <select class="form-control" id="ddlViewQLLanguages" style="border-color: lightgrey;">
                                                        </select>
                                                    </div>
                                                </div>

                                               <%-- <div style="width: 5%; padding-top: 8%; padding-left: 0%;">

                                                    <img id="btnAddLanguages" src="Images/Add-Icon.png" title="Add" class="fa-icon-hover" style="cursor: pointer; width: 26px;" />


                                                </div>--%>
                                            </div>
                                        </div>

                                        <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">UAE Driving License</label>
                                            <div class="">

                                                <%--  <select class="form-control" id="ddlQLYearsOfExp" style="border-color: lightgrey;">
                                                    </select>--%>

                                                <div class="netliva-switch">
                                                    <input type="checkbox" id="cbViewDrivingLicense" netliva-switch="OK">
                                                    <label for="cbViewDrivingLicense" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                    <div class="row">

                                        <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Computer Skills</label>
                                            <div class="">

                                                <input class="form-control" type="text" value="" id="txtViewQLComputerSkills" style="border-color: lightgrey;">
                                            </div>
                                        </div>

                                        <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Technical Skills</label>
                                            <div class="">

                                                <input class="form-control" type="text" value="" id="txtViewQLTechnicalSkills" style="border-color: lightgrey;">
                                            </div>
                                        </div>

                                        <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Category</label>
                                            <div class="">

                                                <select class="form-control" id="ddlViewQLCategory" style="border-color: lightgrey;">
                                                </select>
                                            </div>
                                        </div>

                                    </div>



                                </div>



                                <div class="tab-pane fade" id="tab-ViewQuestion" role="tabpanel">

                                    <div class="row">
                                        <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Template</label>
                                            <div class="">

                                                <select class="form-control" id="ddlViewQSTemplate" style="border-color: lightgrey;">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade show" id="tab-ViewAttachment" role="tabpanel">
                                    <div class="row">
                                       

                                      

                                    </div>
                                </div>


                                    <div class="tab-pane fade" id="tab-Approval" role="tabpanel">

                                        <table class="table table-bordered table-striped  nowrap tablepopup">

                                            <thead>
                                                <tr>



                                                    <th>Job Title</th>
                                                    <th>Approve Name</th>
                                                    <th>Approved Date</th>
                                                    <th>Remarks</th>
                                                    <th>Action</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Approval">
                                            </tbody>
                                        </table>


                                    </div>



                                    <div class="tab-pane fade" id="tab-AllCandidates" role="tabpanel">

                                        <table class="table table-bordered table-striped  nowrap tablepopup">

                                            <thead>
                                                <tr>
                                                    <th class="hidden">optNo</th>


                                                    <th>Name</th>
                                                    <th>Updated Date</th>
                                                    <th>Updated By</th>
                                                    <th>Remarks</th>
                                                    <th>Action</th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-AllCandidates">
                                            </tbody>
                                        </table>


                                    </div>
                                    <div class="tab-pane fade show" id="tab-Shortlisted" role="tabpanel">

                                        <table class="table table-bordered table-striped  nowrap tablepopup">

                                            <thead>
                                                <tr>
                                                    <th class="hidden">optNo</th>
                                                    <th>Name</th>
                                                    <th>Updated Date</th>
                                                    <th>Updated By</th>
                                                    <th>Remarks</th>
                                                    <th>Action</th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-SMUpdates">
                                            </tbody>
                                        </table>


                                    </div>
                                    <div class="tab-pane fade show" id="tab-ForInterview" role="tabpanel">

                                        <table class="table table-bordered table-striped  nowrap tablepopup">

                                            <thead>
                                                <tr>
                                                    


                                                    <th>Name</th>
                                                    <th>Updated Date</th>
                                                    <th>Updated By</th>
                                                    <th>Status</th>

                                                    <th>Action</th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-ForInterview">
                                            </tbody>
                                        </table>


                                    </div>
                                    <div class="tab-pane fade" id="tab-Selected" role="tabpanel">
                                        <table class="table table-bordered table-striped  nowrap tablepopup">

                                            <thead>
                                                <tr>

                                                    <th>Name </th>
                                                    <th>Updated Date</th>
                                                    <th>Updated By</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                 
                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Selected">
                                            </tbody>
                                        </table>
                                    </div>



                                    <div class="tab-pane fade" id="tab-History" role="tabpanel">
                                        <table class="table table-bordered table-striped  tablepopup">

                                            <thead>
                                                <tr>

                                                   
                                                    <th>Action Name</th>
                                                    <th>Action Taken By</th>
                                                    <th>Action Date</th>
                                                    <th>Remarks</th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-History">
                                                <tr>
                                                    <td>RRF Created</td>
                                                   <td>DPARTMENT COORDINATOR</td>
                                                    <td>8 Jan 2024</td>
                                                    <td><span class="badge bg-primary">DRAFT</span></td>
                                                </tr>

                                                <tr>
                                                    <td>RRF Submitted</td>
                                                   <td>DPARTMENT COORDINATOR</td>
                                                    <td>9 Jan 2024</td>
                                                    <td><span class="badge bg-Submit">SUBMITTED</span></td>
                                                </tr>

                                                <tr>
                                                   <td>RRF Approved By Line Manager</td>
                                                   <td>Ibrahem Quriq</td>
                                                    <td>9 Jan 2024</td>
                                                    <td><span class="badge bg-Approve">APPROVED</span></td>
                                                </tr>

                                                 <tr>
                                                   <td>RRF Approved By HOD</td>
                                                   <td>Kamel Abdullah</td>
                                                    <td>11 Jan 2024</td>
                                                     <td><span class="badge bg-Approve">APPROVED</span></td>
                                                </tr>

                                                 <tr>
                                                   <td>RRF Approved Recruitment</td>
                                                   <td>Sam Mathew</td>
                                                    <td>12 Jan 2024</td>
                                                     <td><span class="badge bg-Approve">APPROVED</span></td>
                                                </tr>

                                                <tr>
                                                   <td>RRF Approved HR Director</td>
                                                   <td>Omar Fakhira</td>
                                                    <td>12 Jan 2024</td>
                                                    <td><span class="badge bg-Approve">APPROVED</span></td>
                                                </tr>

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


       <div class="modal fade" id="ModaladdPersonalData" data-bs-backdrop="static" style="background-color: #00000070;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lblPersonalData">Personal Data Form</h5>
                    <button type="button" class="btn-close btn-close-task-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    
                        <%--parent after body div start--%>


                        <div class="row">
                           
                                <div class="col-4">
                                    <label for="html5-number-input" class="col-form-label label-custom">First Name<span style="color: red;">*</span></label>
                                    <div class="">
                                        <input class="form-control" type="text" value="" id="txtFirstName" style="border-color: lightgrey;">
                                    </div>
                                </div>

                                <div class="col-4">
                                    <label for="html5-number-input" class="col-form-label label-custom">Middle Name(Father Name)<span style="color: red;">*</span></label>
                                    <div class="">
                                        <input class="form-control" type="text" value="" id="txtMiddleName" style="border-color: lightgrey;">
                                    </div>
                                </div>

                              <div class="col-4">
                                    <label for="html5-number-input" class="col-form-label label-custom">Last Name<span style="color: red;">*</span></label>
                                    <div class="">
                                        <input class="form-control" type="text" value="" id="txtLastName" style="border-color: lightgrey;">
                                    </div>
                                </div>

                        </div>

                        <div class="row Section-Details">

                            <div class="col-4">
                                <label class="col-form-label label-custom" for="basic-default-name">Availablity To Join<span style="color: red;">*</span></label>
                                <div>
                                     <input class="form-control" type="text" value="" id="txtAvlToJoin" style="border-color: lightgrey;">
                                </div>
                            </div>

                            <div class="col-4">
                                <label class="col-form-label label-custom" for="basic-default-name">Gender<span style="color: red;">*</span></label>
                                <div>
                                     <select class="form-control" id="txtPrsGender" style="border-color: lightgrey;">
                                         <option value="MALE">Male</option>
                                          <option value="FEMAle">FeMale</option>
                                         </select>
                                </div>
                            </div>

                             <div class="col-4">
                                <label class="col-form-label label-custom" for="basic-default-name">Marital Status<span style="color: red;">*</span></label>
                                <div>
                                     <input class="form-control" type="text" value="" id="txtMaritalStatus" style="border-color: lightgrey;">
                                </div>
                            </div>

                        </div>

                    <div class="row Section-Details">

                        <div class="col-4">
                            <label class="col-form-label label-custom" for="basic-default-name">Date Of Birth<span style="color: red;">*</span></label>
                            <div>
                                <input class="form-control" type="date" value="" id="txtDateOfBirth" style="border-color: lightgrey;">
                            </div>
                        </div>

                        <div class="col-4">
                            <label class="col-form-label label-custom" for="basic-default-name">Country Of Birth<span style="color: red;">*</span></label>
                            <div>
                                <input class="form-control" type="text" value="" id="txtCountryOfBirth" style="border-color: lightgrey;" >
                            </div>
                        </div>

                        <div class="col-4">
                            <label class="col-form-label label-custom" for="basic-default-name">Nationality<span style="color: red;">*</span></label>
                            <div>
                                <input class="form-control" type="text" value="" id="txtNationality" style="border-color: lightgrey;">
                            </div>
                        </div>



                    </div>

                     <div class="row Section-Details">

                        <div class="col-4">
                            <label class="col-form-label label-custom" for="basic-default-name">Religion<span style="color: red;">*</span></label>
                            <div>
                                <input class="form-control" type="text" value="" id="txtReligion" style="border-color: lightgrey;">
                            </div>
                        </div>

                        <div class="col-4">
                            <label class="col-form-label label-custom" for="basic-default-name">Personal E-mail<span style="color: red;">*</span></label>
                            <div>
                                <input class="form-control" type="text" value="" id="txtPersonalEmail" style="border-color: lightgrey;">
                            </div>
                        </div>

                         <div class="col-4">
                             <label class="col-form-label label-custom" for="basic-default-name">Contact Number<span style="color: red;">*</span></label>
                             <div>
                                 <input class="form-control" type="text" value="" id="txtContactNumber" style="border-color: lightgrey;">
                             </div>
                         </div>

                    </div>


                        <div class="row" style="padding-top:2%;">
                            <div class="col-10"></div>
                            <div class="col-2">
                                <button type="button" id="btnCreateRequest" class="btn btn-primary btnAddTask">Create</button>
                            </div>
                        </div>

                    
                    
                </div>
            </div>
        </div>
 </div>








     <div class="modal fade" id="ModalInterviewRequest" data-bs-backdrop="static" style="background-color: #00000070;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lblNewInterviewRequest">Personal Data Form</h5>
                    <button type="button" class="btn-close btn-close-task-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    
                        <%--parent after body div start--%>


                        <div class="row">
                           
                                <div class="col-8">
                                    <label for="html5-number-input" class="col-form-label label-custom">Request For<span style="color: red;">*</span></label>
                                    <div class="">
                                     <select class="form-control" id="txtReqFor" style="border-color: lightgrey;">
                                         <option value="MALE">Online Interview</option>
                                          <option value="FEMAle">In Person Interview</option>
                                         </select>
                                    </div>
                                </div>

                                

                        </div>

                    <div class="row">

                        <div class="col-6">
                            <label class="col-form-label label-custom" for="basic-default-name">Date<span style="color: red;">*</span></label>
                            <div>
                                <input class="form-control" type="date" value="" id="txtInterviewReqDate" style="border-color: lightgrey;">
                            </div>
                        </div>

                        <div class="col-6">
                            <label class="col-form-label label-custom" for="basic-default-name">Time<span style="color: red;">*</span></label>
                            <div>
                                <input class="form-control" type="Time" value="" id="txtInterviewReqTime" style="border-color: lightgrey;">
                            </div>
                        </div>

                    </div>

                      <div class="row">

                        <div class="col-6">
                            <label class="col-form-label label-custom" for="basic-default-name">Location<span style="color: red;">*</span></label>
                            <div>
                                <input class="form-control" type="text" value="" id="txtInterviewReqLocation" style="border-color: lightgrey;">
                            </div>
                        </div>

                        <div class="col-6">
                            <label class="col-form-label label-custom" for="basic-default-name">Map URL<span style="color: red;">*</span></label>
                            <div>
                                <input class="form-control" type="text" value="" id="txtInterviewMapURL" style="border-color: lightgrey;">
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
 </div>



    <div class="modal fade" id="ModalEvelutionForm" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
         <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Interview Evelution Form</h5>
                    <button type="button" class="btn-close btn-close-task-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                     <div id="EvelutionFormRowDiv" style="background: #e8b79c3b; padding: 17px; border-radius: 12px; border: 2px solid #f9bfa86b; box-shadow: 0px 0px 13px -7px #d84d1a;">
                        <div class="row">

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Applicant Name</label>
                                    <div class="">

                                        <%--<input class="form-control" type="text" id="txtDepartment" readonly />--%>
                                        <label id="lblApplName" style="font-size: 12px;">Candidate Name</label>
                                    </div>
                                </div>

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                                    <div class="">
                                       <%-- <input class="form-control" type="text" id="txtNoOfPos" readonly />--%>
                                         <label id="lblEvelutionDepartment" style="font-size: 12px;">Information Technology</label>

                                    </div>
                                </div>
                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Position Applied For</label>
                                    <div class="">

                                       <%-- <input class="form-control" type="text" id="txtReportsTo" readonly />--%>
                                        <label id="lblPosAppliedFor" style="font-size: 12px;">NAVAS</label>
                                    </div>
                                </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Interviewer</label>
                                <div class="">

                                    <input class="form-control" type="text" id="txtInterviewer" readonly disabled />
                                    <%-- <label id="lblInterviewer" style="font-size: 12px;">SOFTWARE DEVELOPER</label>--%>
                                    <%-- <select class="form-control" id="ddlInterviewer" style="border-color: lightgrey;">
                                             </select>--%>
                                </div>
                            </div>

                               
                            </div>
                         </div>
                    <div style="padding-top: 1%;">
                        <div class="row" style="padding-top: 1%; text-align: center; background-color: #c92121;">
                            <h5 class="modal-title" style="color: white;">INTERVIEW INFORMATION</h5>
                        </div>
                    </div>



                     <div class="row" style="padding-top:1%;">

                                <div class="row">
                                    <div class="col-2">
                                    <label for="html5-number-input" class="col-form-label label-custom">Interview Date:</label>
                                        </div>
                                    <div class="col-2" style="padding-top: 6px;">

                                        <label id="lblInterviewDate" style="font-size: 12px;">Candidate Name</label>
                                    </div>

                                     <div class="col-1">
                                         </div>

                                     <div class="col-2">
                                    <label for="html5-number-input" class="col-form-label label-custom">Interview Location:</label>
                                        </div>
                                     <div class="col-2" style="padding-top: 6px;">

                                        <label id="lblInterviewLocation" style="font-size: 12px;">Candidate Name</label>
                                    </div>

                                </div>

                                <div class="row" style="padding-top:1%;">
                                    <div class="col-2">
                                    <label for="html5-number-input" class="col-form-label label-custom">Interview Type:</label>
                                        </div>
                                    <div class="col-2">

                                       <%-- <label id="lblInterviewType1" style="font-size: 12px;">Candidate Name</label>--%>
                                           <select class="form-control" id="ddlInterviewType1" style="border-color: lightgrey;" disabled>
                                             </select>
                                    </div>

                                     <div class="col-1">
                                      </div>

                                   
                                     <div class="col-2">

                                       <%-- <label id="lblInterviewType2" style="font-size: 12px;">Candidate Name</label>--%>
                                            <select class="form-control" id="ddlInterviewType2" style="border-color: lightgrey;" disabled>
                                             </select>
                                     </div>

                                </div>

                               
                            </div>
                    <div style="padding-top: 1%;">

                        <div class="tab-pane fade show active" id="tab-SOItemEntered" role="tabpanel">

                            <div class="" style="margin-top: 1%;">

                                <table class="table table-bordered InterviewInfo-Details-table" style="width: 100%;">


                                    <thead>
                                        <tr class="Head-tr">
                                            <%--<th>Id</th>--%>
                                            <th style="width:60%;">COMPETENCIES</th>
                                            <th style="width:10%;">EXCELLENT</th>
                                            <th style="width:10%;">GOOD</th>
                                            <th style="width:10%;">AVERAGE</th>
                                            <th style="width:10%;">POOR</th>
                                            </tr>
                                           <tr>
                                            <td>Job Knowledge</td>
                                            <td style="text-align:center;"><input type="radio" id="rdJK_Excellent" name="Job_Knowledge" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdJK_Good" name="Job_Knowledge" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdJK_Average" name="Job_Knowledge" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdJK_Poor" name="Job_Knowledge" value="POOR"></td>
                                          </tr>
                                          <tr>
                                            <td>Education</td>
                                            <td style="text-align:center;"><input type="radio" id="rdEd_Excellent" name="Education" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdEd_Good" name="Education" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdEd_Average" name="Education" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdEd_Poor" name="Education" value="POOR"></td>
                                          </tr>

                                        <tr>
                                            <td>Experience</td>
                                            <td style="text-align:center;"><input type="radio" id="rdExp_Excellent" name="Experience" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdExp_Good" name="Experience" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdExp_Average" name="Experience" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdExp_Poor" name="Experience" value="POOR"></td>
                                          </tr>

                                        <tr>
                                            <td>Communication</td>
                                            <td style="text-align:center;"><input type="radio" id="rdCmn_Excellent" name="Communication" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdCmn_Good" name="Communication" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdCmn_Average" name="Communication" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdCmn_Poor" name="Communication" value="POOR"></td>
                                          </tr>

                                         <tr>
                                            <td>Personality</td>
                                            <td style="text-align:center;"><input type="radio" id="rdPrs_Excellent" name="Personality" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPrs_Good" name="Personality" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPrs_Average" name="Personality" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPrs_Poor" name="Personality" value="POOR"></td>
                                          </tr>

                                         <tr>
                                            <td>Attittude</td>
                                            <td style="text-align:center;"><input type="radio" id="rdAtt_Excellent" name="Attittude" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdAtt_Good" name="Attittude" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdAtt_Average" name="Attittude" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdAtt_Poor" name="Attittude" value="POOR"></td>
                                          </tr>

                                        <tr>
                                            <td>Motivation</td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtv_Excellent" name="Motivation" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtv_Good" name="Motivation" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtv_Average" name="Motivation" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtv_Poor" name="Motivation" value="POOR"></td>
                                          </tr>

                                         <tr>
                                            <td>Maturity</td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtr_Excellent" name="Maturity" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtr_Good" name="Maturity" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtr_Average" name="Maturity" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtr_Poor" name="Maturity" value="POOR"></td>
                                          </tr>

                                         <tr>
                                            <td>Persuasiveness</td>
                                            <td style="text-align:center;"><input type="radio" id="rdPer_Excellent" name="Persuasiveness" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPer_Good" name="Persuasiveness" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPer_Average" name="Persuasiveness" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPer_Poor" name="Persuasiveness" value="POOR"></td>
                                          </tr>

                                        <tr>
                                            <td>Performance on Aptitude Test</td>
                                            <td style="text-align:center;"><input type="radio" id="rdPOAT_Excellent" name="Performance_on_Aptitude_Test" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPOAT_Good" name="Performance_on_Aptitude_Test" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPOAT_Average" name="Performance_on_Aptitude_Test" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPOAT_Poor" name="Performance_on_Aptitude_Test" value="POOR"></td>
                                          </tr>


                                     <%--   <tr>
                                            <td>Experience</td>
                                            <td><input type="radio" id="rdExp_Excellent" name="Experience" value="EXCELLENT"></td>
                                            <td><input type="radio" id="rdExp_Good" name="Experience" value="GOOD"></td>
                                            <td><input type="radio" id="rdExp_Average" name="Experience" value="AVERAGE"></td>
                                            <td><input type="radio" id="rdExp_Poor" name="Experience" value="POOR"></td>
                                          </tr>
                                        --%>
                                    </thead>


                                    <tbody class="tbody-InterviewInfo">
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
 </div>




    <div class="modal fade" id="mpCreateNewRRF" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">

                    <div style="width: 75%;">
                        <h5 class="modal-title">Create New RRF</h5>
                    </div>
                    <div style="width: 20%">

                        <button type="button" id="btnCreateRRF" class="btn btn-primary btnAddTask btn-verify">Create</button>
                        <div class="row div-update-btn" style="display: none;">
                            <div class="col-6">
                                <button type="button" id="btnSaveRRF" class="btn btn-primary btnAddTask">Save &nbsp;<i class="fa fa-save"></i></button>
                            </div>
                            <div class="col-6">
                                <button type="button" id="btnSubmitRRF" class="btn btn-primary btnAddTask btn-verify">Submit</button>
                            </div>
                        </div>


                    </div>


                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                </div>
                <div class="modal-body">


                    <div class="row">

                        <div style="width: 33.33%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtRRFDepartment" style="border-color: lightgrey;">
                            </div>
                        </div>

                        <div style="width: 33.33%;">
                            <label for="html5-number-input" class="col-form-label label-custom">No.of Position</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtRRFNoOfPosition" style="border-color: lightgrey;">
                            </div>
                        </div>
                        <div style="width: 33.33%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Reports to</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtRRFReportsTo" style="border-color: lightgrey;">
                            </div>
                        </div>



                    </div>


                    <div class="row">
                        <div style="width: 33.33%;">
                            <div class="row">
                                <div style="width: 90%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Job Title</label>
                                    <div class="">
                                        <%--  <input class="form-control" type="text" value="" id="txtRRFJobTitle" style="border-color: lightgrey;">--%>
                                        <select class="form-control" id="ddlRRFJobTitle" style="border-color: lightgrey;">
                                        </select>
                                    </div>
                                </div>

                                <div style="width: 5%; padding-top: 8%; padding-left: 0%;">

                                    <img id="btnAddJobTitle" src="Images/Add-Icon.png" title="Add" class="fa-icon-hover" style="cursor: pointer; width: 26px;" />

                                </div>
                            </div>
                        </div>

                        <div style="width: 33.33%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Salary Range</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtRRFSalaryRange" style="border-color: lightgrey;">
                            </div>
                        </div>

                        <div style="width: 33.33%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Location</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtRRFLocation" style="border-color: lightgrey;">
                            </div>
                        </div>

                    </div>


                    <div class="row">

                        <div style="width: 33.33%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Age Range</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtRRFAgeRange" style="border-color: lightgrey;">
                            </div>
                        </div>

                        <div style="width: 33.33%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Reason For Hiring</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtRRFReasonForHiring" style="border-color: lightgrey;">
                            </div>
                        </div>

                        <div style="width: 33.33%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Employee Id</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtRRFEmployeeId" style="border-color: lightgrey;">
                            </div>
                        </div>

                    </div>




                    <div class="div-RRF-form" style="margin-top: 2%; display: none;">



                        <div class="nav-align-top">
                            <ul class="nav nav-tabs" role="tablist">


                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Qualification" aria-controls="tab-Qualification" aria-selected="false">Qualification &nbsp;<i class="fa fa-graduation-cap"></i></button>
                                </li>

                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Question" aria-controls="tab-Question" aria-selected="true">Question &nbsp;<i class="fa fa-question"></i></button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Attachment" aria-controls="tab-Attachment" aria-selected="true">Attachment &nbsp;<i class="	fa fa-thumb-tack"></i></button>
                                </li>

                            </ul>
                            <div class="tab-content">



                                <div class="tab-pane fade show active" id="tab-Qualification" role="tabpanel">
                                    <div class="row">

                                        <div style="width: 33.33%;">
                                            <div class="row">
                                                <div style="width: 90%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Education</label>
                                                    <div class="">

                                                        <select class="form-control" id="ddlQLEducation" style="border-color: lightgrey;">
                                                        </select>
                                                    </div>
                                                </div>

                                                <div style="width: 5%; padding-top: 8%; padding-left: 0%;">

                                                    <img id="btnAddEducation" src="Images/Add-Icon.png" title="Add" class="fa-icon-hover" style="cursor: pointer; width: 26px;" />


                                                </div>

                                            </div>
                                        </div>

                                        <div style="width: 33.33%;">
                                            <div class="row">
                                                <div style="width: 90%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Nationality</label>
                                                    <div class="">

                                                        <select class="form-control" id="ddlQLNationality" style="border-color: lightgrey;">
                                                        </select>
                                                    </div>
                                                </div>
                                                <div style="width: 5%; padding-top: 8%; padding-left: 0%;">

                                                    <img id="btnAddNationality" src="Images/Add-Icon.png" title="Add" class="fa-icon-hover" style="cursor: pointer; width: 26px;" />


                                                </div>
                                            </div>
                                        </div>

                                        <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Years of Experience</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtQLYearsOfExp" style="border-color: lightgrey;">
                                            </div>
                                        </div>

                                    </div>


                                    <div class="row">

                                        <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Gender</label>
                                            <div class="">

                                                <select class="form-control" id="ddlQLGender" style="border-color: lightgrey;">
                                                    <option value="MALE">Male</option>
                                                    <option value="FE_MALE">FeMale</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div style="width: 33.33%;">
                                            <div class="row">
                                                <div style="width: 90%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Languages</label>
                                                    <div class="">

                                                        <select class="form-control" id="ddlQLLanguages" style="border-color: lightgrey;">
                                                        </select>
                                                    </div>
                                                </div>

                                                <div style="width: 5%; padding-top: 8%; padding-left: 0%;">

                                                    <img id="btnAddLanguages" src="Images/Add-Icon.png" title="Add" class="fa-icon-hover" style="cursor: pointer; width: 26px;" />


                                                </div>
                                            </div>
                                        </div>

                                        <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">UAE Driving License</label>
                                            <div class="">

                                                <%--  <select class="form-control" id="ddlQLYearsOfExp" style="border-color: lightgrey;">
                                                    </select>--%>

                                                <div class="netliva-switch">
                                                    <input type="checkbox" id="cbDrivingLicense" netliva-switch="OK">
                                                    <label for="cbDrivingLicense" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                    <div class="row">

                                        <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Computer Skills</label>
                                            <div class="">

                                                <input class="form-control" type="text" value="" id="txtQLComputerSkills" style="border-color: lightgrey;">
                                            </div>
                                        </div>

                                        <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Technical Skills</label>
                                            <div class="">

                                                <input class="form-control" type="text" value="" id="txtQLTechnicalSkills" style="border-color: lightgrey;">
                                            </div>
                                        </div>

                                        <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Category</label>
                                            <div class="">

                                                <select class="form-control" id="ddlQLCategory" style="border-color: lightgrey;">
                                                </select>
                                            </div>
                                        </div>

                                    </div>



                                </div>



                                <div class="tab-pane fade" id="tab-Question" role="tabpanel">

                                    <div class="row">
                                        <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Template</label>
                                            <div class="">

                                                <select class="form-control" id="ddlQSTemplate" style="border-color: lightgrey;">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade show" id="tab-Attachment" role="tabpanel">
                                    <div class="row">
                                        <div style="width: 10%;">
                                            <div class="input-group mb-3 col-2">
                                                <%--      <label style="margin-right: 10px;" class="lbl-fufile-count"></label>--%>
                                                <label for="html5-number-input" class="col-form-label label-custom">Upload Profile<span style="color: red;">*</span></label>
                                                <div class="">
                                                    <input class="form-control" type="file" id="fu-RRF-Request-Attachment" accept=".doc,.docx,.pdf,.png,.jpeg,.jpg" style="display: none;" onchange="getFileName()">
                                                    <label class="input-group-text ml-3" for="fu-RRF-Request-Attachment">
                                                        <img id="imgRRF" src="Images/Upload-img.jpg" title="Upload Profile" class="fa-icon-hover Upload-Details" style="cursor: pointer; width: 78px; height: 60px;" /></label>

                                                    <%-- <a href="#" id="btnUploadChatFile" class="btn btn-primary" style="margin-left: 4px;">Upload File </a>--%>

                                                    <input type="text" id="lblFilesForRRF" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                                                </div>
                                            </div>
                                        </div>

                                        <div style="width: 30%;">
                                            <label class="col-form-label label-custom" for="basic-default-name">Comment<span style="color: red;">*</span></label>
                                            <div>
                                                <textarea class="form-control" id="txtRRFComment" rows="4" placeholder="Enter Comments" style="border-color: lightgrey;"></textarea>
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
    </div>
 


    <div class="modal fade" id="ConfirmActivityPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;padding-bottom:15%;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div class="Acc-Req"><i class="fa fa-plus-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;color:#cb3a0d;"></i></div>
                  <%--  <span class="gridicons--add"></span>--%>

                </div>
                <div class="row">
                  
                    <label Font-Size="Medium" Font-Bold="true" style="margin-left:3%">Option</label>
                     <input type="text" id="txtAddOption" class="form-control" style="margin-left:5%; width:90%;"/>

                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;padding-top:18px;">
                        <asp:LinkButton ID="btnNo" runat="server" class="btn btn-secondary" data-bs-dismiss="modal">NO</asp:LinkButton>
                        <button type="button" ID="btnYes" class="btn btn-primary">Add</button>
                    </div>
                </div>
            </div>
        </div>
    </div>





     <script type="text/javascript">
        var currUserId = '';
        var EmpNo = '';
        var myrole = '';
        var overAllPerfo = 0;
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';

                });

    </script >
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
    <script src="Script/RequestList.js?v=0.5"></script>
     <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>
     <script src="../KPI/Flatpickr/js/flatpickr.js"></script>

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

     <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

     <%--<link href="../Calendar/dist/select2.css" rel="stylesheet" />
     <script src="../Calendar/dist/select2.js"></script>
     <script src="../KPI/Flatpickr/js/flatpickr.js"></script>--%>


</asp:Content>

