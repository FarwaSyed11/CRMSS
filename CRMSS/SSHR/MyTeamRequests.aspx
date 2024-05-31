<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="MyTeamRequests.aspx.cs" Inherits="SSHR_MyTeamRequests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="
https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js
"></script>
    <style type="text/css">
        /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/

        .kpi-user-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
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

        .btn-primary:hover {
            color: #ffffff;
            background-color: #ed974e !important;
            border-color: #ed974e !important;
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

        .btn-primary {
            color: #fff;
            background-color: #a62b2b;
            border-color: #a62b2b;
        }

            .btn-primary:hover {
                color: #ffffff;
                background-color: #76dd4b;
                border-color: #7bdd59;
                transform: translateY(-1px);
            }

            .btn-check:focus + .btn-primary, .btn-primary:focus {
                color: #ffffff;
                background-color: #76dd4b;
                border-color: #7bdd59;
                transform: translateY(-1px);
            }


        /*.tab-content
        {
            background: #d7d6d6 !important;
        }*/
        hr {
            margin: 1rem 0;
            color: #565656;
            background-color: currentColor;
            border: 0;
            opacity: 1;
        }

        .Survey-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Survey-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .Question-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Question-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .question-master-list-table th {
            /*text-align: center;*/
            color: white !important;
            background-color: #d54832;
        }

        .emp-leave-req-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .emp-leave-req-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }


        .Answer-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Answer-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        table.dataTable.no-footer {
            border-bottom: 1px solid #aeddff73 !important;
        }

        .table-Costomer-Details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
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

        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #ffffff;
            background-color: #a92828;
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

        /*.nav-tabs .nav-item .nav-link:not(.active) {
            color: black;
            background-color: #b4b9bf;
        }*/
        .nav-tabs .nav-item .nav-link:not(.active) {
            color: #a92828;
            background-color: #ffe7dc;
        }

        table.dataTable tbody tr:hover {
            background-color: #ff6f591a !important;
            border-right: 5px solid #db7e2f !important;
        }

        .Survey-status-Draft {
            background-color: #fff2d6 !important;
            color: #ffab00 !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #ffab00;
        }

        .Survey-status-completed {
            /*background-color: #e8fadf !important;
    color: #48a516 !important;
    letter-spacing: 0.5px;
    box-shadow: 0px 0px 3px 0px #48a516;
    min-width: 52%;
    text-align: center;*/
            background-color: #d7f5fc !important;
            color: #03c3ec !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #03c3ec;
        }

        .Survey-status-NotActive {
            background-color: #ffe0db !important;
            color: #ff3e1d !important;
            letter-spacing: 0.5px;
            box-shadow: 0px 0px 3px 0px #ff3e1d;
            min-width: 52%;
            text-align: center;
        }


        .Survey-det-drilldown {
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

        /* .active-tr {
            border-left: 7px solid #db7e2f !important;
        }*/

        .form-control:focus, .form-select:focus {
            border-color: #ff9869 !important;
        }

        .select2-container--default .select2-selection--multiple .select2-selection__choice__display {
            cursor: default;
            padding-left: 12px !important;
            padding-right: 5px;
            color: #e02d0a;
        }

        .emps-list-table th {
            background: #ffe7e0;
            position: sticky;
            top: -10px;
            border-bottom: 1px solid #fff !important;
        }

        .select2-results__options li strong {
            color: rgb(242 71 71);
        }

        .LM-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        /* table tbody tr:hover {
            background-color: #ff6f591a !important;
            border-right: 5px solid #db7e2f !important;
        }*/

        .badge {
            text-transform: uppercase;
            line-height: 0.75;
        }

        .taDiv:focus {
            outline: none;
        }

        .modal-xxl {
            max-width: 1854px !important;
        }

        ::-webkit-scrollbar {
            height: 8px; /* height of horizontal scrollbar ← You're missing this */
            width: 4px; /* width of vertical scrollbar */
            border: 1px solid #d5d5d5;
        }



        .tbody-quesopt-list tr:hover {
            cursor: pointer;
        }

        #lblEmpName, #lblDesignation, #lblDepart, #lblLeaveReqFileName:focus {
            outline: none;
        }


        .proj-det-drillup {
            font-weight: 800;
            color: #ffffff;
            border: 1px solid #b8adad;
            width: 1.5%;
            cursor: pointer;
            margin-top: 6px;
            position: inherit;
            background: #d54832e8;
            /*border-radius: 13px;*/
            text-align: center;
        }

        .textbox-border-color {
            border-bottom: 4px solid #fc71224a;
        }

        #Bank-details-rectangle-div {
            padding: 17px;
            background: #e8b79c3b;
            border-radius: 12px;
            border: 4px solid #f9bfa86b;
            box-shadow: 0px 0px 13px -7px #d84d1a;
        }

        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: -11px;
            line-height: 14px;
            margin-top: 5px;
        }

        .select2-container {
            box-sizing: border-box;
            display: inline-block;
            margin: 0;
            position: relative;
            vertical-align: middle;
            width: 100% !important;
        }

        input[type="checkbox"] {
            /* Add if not using autoprefixer */
            -webkit-appearance: none;
            /* Remove most all native input styles */
            appearance: none;
            /* For iOS < 15 */
            background-color: var(--form-background);
            /* Not removed via appearance */
            margin: 0;
            font: inherit;
            color: currentColor;
            width: 1.15em;
            height: 1.15em;
            border: 0.15em solid currentColor;
            border-radius: 0.15em;
            transform: translateY(-0.075em);
            display: grid;
            place-content: center;
        }

            input[type="checkbox"]::before {
                content: "";
                width: 0.65em;
                height: 0.65em;
                clip-path: polygon(14% 44%, 0 65%, 50% 100%, 100% 16%, 80% 0%, 43% 62%);
                transform: scale(0);
                transform-origin: bottom left;
                transition: 120ms transform ease-in-out;
                box-shadow: inset 1em 1em var(--form-control-color);
                /* Windows High Contrast Mode */
                background-color: CanvasText;
            }

            input[type="checkbox"]:checked::before {
                transform: scale(1);
            }

            input[type="checkbox"]:focus {
                outline: max(2px, 0.15em) solid currentColor;
                outline-offset: max(2px, 0.15em);
            }
    </style>


    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--<div class="ajax-loader loader-bg-blur">
          <div class="custom-loader ">
              <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
              <h4>Loading Data...</h4>
          </div>
      </div>--%>
    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div class="card-body" style="">
            <div class="row m-3">
                <div class="col-6">
                    <div class="pull-left">
                        <h4 style="color: #a92828;">My Team Requests</h4>
                    </div>
                </div>

            </div>
            <div>
                <div class="row tblfilter" runat="server" id="tbltopsearch">
                    <div class="col-2">
                        <%--<asp:Label ID="Label3" Text="Requests" runat="server" Font-Size="Medium" Font-Bold="true" />--%>
                        <select id="ddlRequests" class="form-select color-dropdown">
                            <option value="-1">All Requests</option>
                            <option value="0">Leave Application</option>
                            <option value="1">Passport Release</option>
                            <option value="2">Bank Related Request</option>
                            <option value="3">Miscellaneous Request</option>
                            <option value="4">Company Loan</option>
                            <option value="5">Late Attendance Request</option>
                            <option value="6">Exit Pass Request</option>
                            <option value="7">Ticket Encashment</option>
                        </select>
                    </div>
                    <div class="col-2">
                        <%--<asp:Label ID="Label4" Text="Status" runat="server" Font-Size="Medium" Font-Bold="true" />--%>

                        <select id="ddlStatus" class="form-select color-dropdown">
                            <option value="PENDING" selected>Pending</option>
                            <option value="APPROVED">Approved</option>
                            <option value="REJECTED">Rejected</option>

                        </select>
                    </div>
                </div>

            </div>
            <div class="row" style="margin-top: 1%;">
                <table class="table Request_Details emp-req-table" style="width: 100% !important">
                    <thead class="table thead-Request_Details emp-req-table-th">
                    </thead>
                    <tbody class="tbody-emp-req">
                    </tbody>
                </table>
            </div>

        </div>
    </div>

    <div class="modal fade" id="empLeaveModal" style="background: #fff2f085; zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%-- <h5 class="modal-title" id="empLeaveModalLabel" style="width:85%;">Leave Request Application</h5>--%>
                    <div class="row" style="width: 100%">
                        <div class="col-2 label-alignment" style="padding-left: 20px; padding-top: 10px; font-size: medium">
                            <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24">
                                <path fill="none" stroke="#ec1a25" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 9h16M4 15h16M10 3L8 21m8-18l-2 18" />
                            </svg>
                            <label id="lblRequestNumber"></label>

                        </div>
                        <div class="col-3">
                            <select id="ddlRequestType" class="form-select color-dropdown" style="">
                                <option value="0">Leave Application</option>
                                <option value="1">Passport Release</option>
                                <option value="2">Bank Related Request</option>
                                <option value="3">Miscellaneous Request</option>
                                <option value="4">Company Loan</option>
                                <option value="5">Late Attendance Request</option>
                                <option value="6">Exit Pass Request</option>
                                <option value="7">Ticket Encashment</option>
                            </select>
                        </div>
                        <div class="col-6 divOnbehalf" style="">
                            <div class="row">
                                <div class="col-4">
                                    <input type="checkbox" id="cbEmpOnBehalf" netliva-switch="OK" style="">
                                    <label for="cbEmpOnBehalf" data-active-text="On Behalf" data-passive-text="On Behalf" style="--switch-active-color: #30ca51; --switch-passive-color: #66666696; display: none"></label>
                                    <label for="html5-number-input" class="col-form-label label-custom on-beh" style="">Applied By </label>
                                </div>

                                <div class="col-5 onbehalf-controls-div hidden" style="">
                                    <div>
                                        <%--<label for="html5-number-input" class="col-form-label label-custom" style="float: left;padding-right: 10px;padding-top: 2px;">Employee Name </label>--%>
                                        <div class="employee-drop">
                                            <select id="txtEmpName" style=""></select>
                                        </div>
                                        <div class="employee-text" style="padding-left: 20px; padding-top: 10px; font-size: medium">
                                            <label id="txtEmpNametext" style=""></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-3 onbehalf-controls-div1 hidden" style="">
                                    <div class="input-group mb-3 insert-Attachment">
                                        <%--<label for="html5-number-input" class="col-form-label label-custom" style="float: left;padding-right: 10px;padding-top: 2px;">Attachment</label>--%>

                                        <input class="form-control" type="file" id="fu-on-behalf" title="On Behalf" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getOnBehalfFileName()" />
                                        <label class="input-group-text ml-3" for="fu-on-behalf" style="cursor: pointer;">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24" title="Download File">
                                                <g fill="none" stroke="#ec1a25" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                                    <path d="M4 22h14a2 2 0 0 0 2-2V7l-5-5H6a2 2 0 0 0-2 2v4" />
                                                    <path d="M14 2v4a2 2 0 0 0 2 2h4M3 15h6m-3-3v6" />
                                                </g>
                                            </svg>
                                            <%--<img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; margin-top: -15px;" />--%>
                                        </label>
                                        <input class="form-control" type="text" id="lblOnBehalfFU" value="" style="background: #80808000; color: #8b8b8b !important" readonly="" />
                                    </div>
                                    <div class="download-Attachment">
                                        <img src="Images/Icon-download.png" id="btnDownloadOBAtt" title="Download File" class="fa-icon-hover" style="cursor: pointer; width: 30px" />
                                        <span><i class="bx bxs-show fa-icon-hover btnDownloadOBAtt" style="color: #eb9d96;font-size: 1.5rem;margin: -17px 0px 0px 0px;cursor: pointer;"></i></span>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                </div>

                <div class="modal-body">

                    <div style="margin-top: -13px; position: absolute; width: 96%;">
                        <div style="text-align: right;">
                            <i class="bx bxs-chevron-up proj-det-drilldown" onclick="hideShowProjDetails()"></i>
                        </div>
                    </div>

                    <div id="proj-details-rectangle-div" style="border-left: 5px solid red;">


                        <b id="empheading">Basic Info</b>
                        <div class="row">
                            <div style="align-self: center; width: 10%;" class="divimage">

                                <img src="http://localhost:49753/Images/Profile/NA584.jpeg" alt="" class="w-px-120 h-auto rounded-circle" id="empimgvatar">
                            </div>
                            <div style="margin-right: 30px; width: 20%; border-right: 1px solid #dbdbdb;">
                                <input type="hidden" id="lblAppID">
                                <input type="hidden" id="lblStatus">
                                <div>
                                    <div class="row empMainInfo">
                                        <div style="align-self: center; width: 12%">
                                            <img src="icons/Number.png" style="width: 25px;">
                                        </div>
                                        <div class="empInfo" style="width: 88%">
                                            <label for="html5-number-input" class="col-form-label label-custom">Emp No. </label>
                                            <div class="">
                                                <label id="lblEmpNo" style="font-weight: bold;"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row empMoreInfor">
                                    <div style="align-self: center; width: 12%">
                                        <img src="icons/GroupPED.png" style="width: 26px;">
                                    </div>
                                    <div class="empInfo" style="width: 88%">
                                        <label for="html5-number-input" class="col-form-label label-custom">Assignment</label>
                                        <div class="">

                                            <label id="assstatus" style="font-weight: bold;">Active</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row empMoreInfor">
                                    <div style="align-self: center; width: 12%">
                                        <img src="icons/VectorDOJ.png" style="width: 26px;">
                                    </div>
                                    <div class="empInfo " style="width: 88%">
                                        <label for="html5-number-input" class="col-form-label label-custom">Date of Joining </label>
                                        <div class="">
                                            <label id="lblDateOfJoin" style="font-weight: bold;">Sep, 2 2023</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-right: 30px; width: 20%; border-right: 1px solid #dbdbdb;">
                                <div class="row empMainInfo">
                                    <div style="align-self: center; width: 12%">
                                        <img src="icons/EmpName.png" style="width: 28px;">
                                    </div>
                                    <div class="empInfo" style="width: 88%">
                                        <label for="html5-number-input" class="col-form-label label-custom">Emp Name </label>
                                        <div class="">
                                            <input type="text" id="lblEmpName" value="" style="width: 100%; background: #80808000; border: 0px; border: none; font-weight: bold;" readonly="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row empMoreInfor">
                                    <div style="align-self: center; width: 12%">
                                        <img src="icons/VectorEED.png" style="width: 26px;">
                                    </div>
                                    <div class="empInfo" style="width: 88%">
                                        <label for="html5-number-input" class="col-form-label label-custom">Last Ticket Encash Date</label>
                                        <div class="">

                                            <label id="lblLastVacationFromDate" style="font-weight: bold;">--</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row empMoreInfor">
                                    <div style="align-self: center; width: 12%">
                                        <img src="icons/GroupPED.png" style="width: 26px;">
                                    </div>
                                    <div class="empInfo" style="width: 88%">
                                        <label for="html5-number-input" class="col-form-label label-custom">Passport Exp Date </label>
                                        <div class="">

                                            <label id="lblPassExpDate" style="font-weight: bold;">Sep, 2 2023</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-right: 30px; width: 20%; border-right: 1px solid #dbdbdb;">

                                <div class="row empMainInfo">
                                    <div style="align-self: center; width: 12%">
                                        <img src="icons/Designation.png" style="width: 26px;">
                                    </div>
                                    <div class="empInfo" style="width: 88%">
                                        <label for="html5-number-input" class="col-form-label label-custom">Designation </label>
                                        <div class="">
                                            <input type="text" id="lblDesignation" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none; font-weight: bold;" readonly="">
                                        </div>
                                    </div>
                                </div>

                                <%--<div class="row empMoreInfor">
                                    <div style="align-self: center; width: 12%">
                                        <img src="icons/VectorEID.png" style="width: 26px;">
                                    </div>
                                    <div class="empInfo" style="width: 88%">
                                        <label for="html5-number-input" class="col-form-label label-custom">Emirates ID </label>
                                        <div class="">
                                            <label id="lblEID" style="font-weight: bold;">Sep, 2 2023</label>
                                        </div>
                                    </div>
                                </div>--%>
                                <div class="row empMoreInfor">
                                    <div style="align-self: center; width: 12%">
                                        <img src="icons/VectorEID.png" style="width: 26px;">
                                    </div>
                                    <div class="empInfo" style="width: 88%">
                                        <label for="html5-number-input" class="col-form-label label-custom">Visa Authority </label>
                                        <div class="">
                                            <label id="vauth" style="font-weight: bold;">JAFZA</label>
                                        </div>
                                    </div>
                                </div>


                                <div class="row empMoreInfor">
                                    <div style="align-self: center; width: 12%">
                                        <img src="icons/GroupVED.png" style="width: 26px;">
                                    </div>
                                    <div class="empInfo" style="width: 88%">
                                        <label for="html5-number-input" class="col-form-label label-custom">Visa Exp Date </label>
                                        <div class="">
                                            <label id="lblVisaExpDate" style="font-weight: bold;">Aug, 18 2023</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <div class="row empMainInfo">
                                    <div style="align-self: center; width: 12%">
                                        <img src="icons/GroupDepartment.png" style="width: 26px;">
                                    </div>
                                    <div class="empInfo" style="width: 88%">
                                        <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                                        <div class="">

                                            <input type="text" id="lblDepart" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none; font-weight: bold;" readonly="">
                                        </div>
                                    </div>
                                </div>

                                <div class="row empMoreInfor">
                                    <div style="align-self: center; width: 12%">
                                        <img src="icons/VectorEID.png" style="width: 26px;">
                                    </div>
                                    <div class="empInfo" style="width: 88%">
                                        <label for="html5-number-input" class="col-form-label label-custom">Weekly Off  </label>
                                        <div class="">
                                            <label id="lblWeeklyOff" style="font-weight: bold;">Sep, 2 2023</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row empMoreInfor">
                                    <div style="align-self: center; width: 12%">
                                        <img src="icons/VectorEED.png" style="width: 26px;">
                                    </div>
                                    <div class="empInfo" style="width: 88%">
                                        <label for="html5-number-input" class="col-form-label label-custom">Emirates ID Exp Date</label>
                                        <div class="">
                                            <label id="lblEIDExpDate" style="font-weight: bold;">Sep, 2 2023</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <%--<button id="capture">Capture Screenshot</button>
                    <div class="col-3">

                        <div class="form-check">
    <input class="form-check-input" type="checkbox" value="paid" id="paidcheck">
    <label class="form-check-label" for="paidcheck" style="margin: 3px">Paid</label>
</div>--%>

                    <%--<label class="form-control">
                            <input id="" type="checkbox" name="checkbox" checked value="" />
                            <label class="form-label"> Paid</label>
                        </label>--%>
                    <div class="Leave-Req">
                    </div>
                    <br />
                    <br />
                    <div class="row">
                        <div class="ispaid" style="display:none">
                            <div class="mb-2 pull-right" style="width: 20%;">
                                <select id="ddlPaid" class="form-select color-dropdown">
                                    <option value="-1" style="display:none" selected>Select Paid/Unpaid Status</option>
                                    <option value="0">Paid</option>
                                    <option value="1">Unpaid</option>
                                    <option value="2">Company Policy</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12 ActionButtons">
                            <div class="pull-right">
                                <%-- <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>--%>
                                <button id="btnSubmit" type="button" class="btn btn-primary btnTagTemp" style=""><i class='bx bxs-check-circle me-3'></i>Submit</button>
                                <button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-save me-3'></i>Save as Draft</button>
                                <button id="btnCancellRequest" type="button" class="btn btn-primary btnTagTemp"><i class='bx bx-x-circle'></i>Cancel</button>
                            </div>
                        </div>
                        <div class="col-12 dvApprovalStage">
                            <h5>Approver Authority List</h5>

                            <div>
                                <table class="table appr-auth-table">

                                    <thead>
                                        <tr style="text-align: center;">
                                            <th>Role</th>
                                            <th>Approved By</th>
                                            <th>Approved date</th>
                                            <th>Comment</th>
                                            <th>Status</th>
                                    </thead>
                                    <tbody class="tbody-appr-auth">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <%--1st Row--%>




                <%--end--%>

                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="mpAction" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header hidden">
                    <h5 class="modal-title" id="lbldelKpiConfirmPopup">Confirmation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="text-align: center;">

                    <div>
                        <h3>Please Enter your Remarks</h3>
                    </div>
                    <div>


                        <input type="text" id="txtActionComments" class="form-control textbox-border-color" />

                    </div>

                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btn-Update-Action">Update</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="mpPdfviewer" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;">
     <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content" style="width: auto">
             <div class="modal-header">
                 <h5 class="modal-title"></h5>
                 <button
                     type="button"
                     class="btn-close btn-close-event-modal"
                     data-bs-dismiss="modal"
                     aria-label="Close">
                 </button>
             </div>
             <div class="modal-body dvpdfview" style="text-align: center;">

                 <iframe id="myIframe" src="" style="height: 1150px; width: 841px;"></iframe>



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

    </script>
    <script src="Scripts/MyTeamRequests.js?v=3.2"></script>
    <link href="Css/allrequest.css?v=1.2" rel="stylesheet" />

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

    <link href="../Dashboard/assets/multiselect/example-styles.css" rel="stylesheet" />
    <script src="../Dashboard/assets/multiselect/jquery.multi-select.js"></script>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

    <script src="../Calendar/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../Calendar/dist/js/adminlte.min.js"></script>
    <script src="../Calendar/plugins/moment/moment.min.js"></script>

</asp:Content>

