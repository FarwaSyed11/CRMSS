<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="OtherRequests.aspx.cs" Inherits="SSHR_OtherRequests" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

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
        .unprint-content-div{
            
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
        <div class="row m-3">
            <div class="col-6">
                <div class="pull-left">
                    <h4 style="color: #a92828;">Other Requests</h4>
                </div>
            </div>
        </div>

        <div class="card-body unprint-content-div" style="">
                <div class="tab-pane fade show active" id="pills-myreq" role="tabpanel" aria-labelledby="pills-myreq-tab">
                    <div>
                        <div class="row tblfilter" runat="server" id="tbltopsearch">
                            <div class="col-2">
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
                                <select id="ddlStatus" class="form-select color-dropdown">
                                    <option value="PENDING">PENDING</option>
                                    <option value="APPROVED">APPROVED</option>
                                    <option value="REJECTED">REJECTED</option>

                                </select>
                            </div>
                        </div>
                        
                    </div>
                    <div class="row" style="margin-top: 1%;">
                        <table class="table Request_Details emp-req-table" style="width:100% !important">
                            <thead class="table thead-Request_Details emp-req-table-th">
                            </thead>
                            <tbody class="tbody-emp-req">
                            </tbody>
                        </table>
                    </div>
                </div>
        </div>
        <%--card-body end--%>
    </div>
    <section>
<div class="content">
    <div class="modal fade" id="empLeaveModal" style="background: #fff2f085; zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                     
                    <%-- <h5 class="modal-title" id="empLeaveModalLabel" style="width:85%;">Leave Request Application</h5>--%>
                    <div class="row" style="width:100%">
                        <div class="col-2 label-alignment" style="padding-left:20px;padding-top:10px;font-size:medium">
                            <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24">
                                <path fill="none" stroke="#ec1a25" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 9h16M4 15h16M10 3L8 21m8-18l-2 18" />
                            </svg>
                            <label" id="lblRequestNumber"></label>
                      
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
                                    <label for="cbEmpOnBehalf" data-active-text="On Behalf" data-passive-text="On Behalf" style="--switch-active-color: #30ca51; --switch-passive-color: #66666696; display: none" ></label>
                                    <label for="html5-number-input" class="col-form-label label-custom on-beh" style="">Applied By</label>
                                </div>
                                <div class="col-5 onbehalf-controls-div hidden" style="">
                                    <div>
                                        <%--<label for="html5-number-input" class="col-form-label label-custom" style="float: left;padding-right: 10px;padding-top: 2px;">Employee Name </label>--%>
                                        <div class="employee-drop">
                                        <select id="txtEmpName" style=""> </select>
                                         </div>
                                        <div class="employee-text" style="padding-left:20px;padding-top:10px;font-size:medium">
                                        <label id="txtEmpNametext" style=""> </label>
                                            </div>
                                    </div>
                                </div>
                                <div class="col-3 onbehalf-controls-div1 hidden" style="">
                                    <div class="input-group mb-3 insert-Attachment">
                                        <%--<label for="html5-number-input" class="col-form-label label-custom" style="float: left;padding-right: 10px;padding-top: 2px;">Attachment</label>--%>
                                        <input class="form-control" type="file" id="fu-on-behalf" title="On Behalf" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getOnBehalfFileName()" />
                                        <label class="input-group-text ml-3" for="fu-on-behalf" style="cursor: pointer;">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24" title="Download File" >
                                                <g fill="none" stroke="#ec1a25" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                                    <path d="M4 22h14a2 2 0 0 0 2-2V7l-5-5H6a2 2 0 0 0-2 2v4" />
                                                    <path d="M14 2v4a2 2 0 0 0 2 2h4M3 15h6m-3-3v6" />
                                                </g>
                                            </svg>
                                            <%--<img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; margin-top: -15px;" />--%>
                                        </label>
                                        <input class="form-control" type="text" id="lblOnBehalfFU" value="" style=" background: #80808000;color: #8b8b8b !important" readonly="" />
                                    </div>
                                    <div class="download-Attachment">
                                        <img src="Images/Icon-download.png" id="btnDownloadOBAtt" title="Download File" class="fa-icon-hover" style="cursor: pointer;width:30px" />
                                        <span><i class="bx bxs-show fa-icon-hover btnDownloadOBAtt" style="color: #eb9d96;font-size: 1.5rem;margin: -17px 0px 0px 0px;cursor: pointer;"></i></span>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-1">
                            <button class="btn btn-primary print">Print</button>
                        </div>
                    </div>

                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

            </div>
                 <div class="modal-body-wrapper">

            <div class="modal-body modal-body-print">

                <div style="margin-top: -13px; position: absolute; width: 96%;">
                    <div style="text-align: right;">
                        <i class="bx bxs-chevron-up proj-det-drilldown" onclick="hideShowProjDetails()"></i>
                    </div>
                </div>

                <div id="proj-details-rectangle-div" style="border-left: 5px solid red;">
        

    <b id="empheading">  Basic Info</b>
    <div class="row">
        <div style="align-self: center; width: 10%;" class="divimage">

            <img src="http://localhost:49753/Images/Profile/NA584.jpeg" alt="" class="w-px-120 h-auto rounded-circle" id="empimgvatar">
        </div>
        <div style="margin-right: 30px;width: 20%;border-right: 1px solid #dbdbdb;">
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
            <div class="row empMoreInfor" >
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
        <div style="margin-right: 30px;width: 20%;border-right: 1px solid #dbdbdb;">
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
        <div style="margin-right: 30px;width: 20%;border-right: 1px solid #dbdbdb;">

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
                <%--<div class="row" style="margin-inline: auto;" >
                    <div class="col-6 mt-2 mb-2 me-4 bankcard" id="Bank-details-rectangle-div">
                    
                        <h5>
                            <img src="Images/all-request-icon/money.svg" />
                            Bank Details
                        </h5>
                        <div class="row">

                            <div class="col-4 bankcard-col">
                                <label>Basic: 
                                    <span id="txtBDBasic">5000</span>
                                </label>
                                <label>HRA:  
                                    <span id="txtBDHRA">5000</span>
                                </label>
                                <label>Car:
                                    <span id="txtBDCar">5000</span>
                                </label>
                            </div>
                            <div class="col-4  bankcard-col">
                                <label>Petrol:
                                    <span id="txtBDPetrol">5000</span>
                                </label>
                                <label>Mobile: 
                                    <span id="txtBDMobile">5000</span>
                                </label>
                                <label>Food:
                                    <span id="">5000</span>
                                </label>
                            </div>
                            <div class="col-4  bankcard-col">
                                <label>Other:
                                    <span id="txtBDOther">5000</span>
                                </label>
                                <label>Total: 
                                    <span id="">5000</span>
                                </label>
                            </div>
                        </div>

                    </div>
                    <div class="col-6 mb-2 mt-2 bankcard">
                        <h5>
                            <img src="Images/all-request-icon/loan.svg" />
                            Loan Details
                        </h5>
                    
                        <div class="table">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th>Type</th>
                                        <th>Amount</th>
                                        <th>Deduction</th>
                                        <th>Remaining</th>
                                        <th>Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Personal</td>
                                        <td>3000</td>
                                        <td>1000</td>
                                        <td>2000</td>
                                        <td>20/8/2024</td>
                                    </tr>
                                    <tr>
                                        <td>Personal</td>
                                        <td>3000</td>
                                        <td>1000</td>
                                        <td>2000</td>
                                        <td>20/8/2024</td>
                                    </tr>
                                    <tr>
                                        <td>Personal</td>
                                        <td>3000</td>
                                        <td>1000</td>
                                        <td>2000</td>
                                        <td>20/8/2024</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                
                </div>--%>

                <%--1st Row--%>
                <div class="Leave-Req">
                </div>
                <br />
                <br />
                <div class="row">
                     
                    <div class="col-12 ActionButtons">
                        <div class="pull-right">
                            <%-- <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>--%>
                            <button id="btnSubmit" type="button" class="btn btn-primary btnTagTemp" style=""><i class='bx bxs-check-circle me-3'></i>Submit</button>
                            <button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-save me-3'></i>Save as Draft</button>
                            <button id="btnCancellRequest" type="button" class="btn btn-primary btnTagTemp"><i class='bx bx-x-circle'></i>Cancell</button>
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

                <%--end--%>
            </div>
                     </div>
                <div class="modal-footer">
                </div>
            </div>

        </div>
    </div>

    </div>
        </section>

    <%--<div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div class="row m-3">
            <div class="col-6">
                <div class="pull-left">
                    <h4 style="color: #a92828;">ALL REQUESTS</h4>
                </div>
            </div>

        </div>

        <div class="card-body" style="margin-top: -2%;">

            <div>
                <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                    <tr>
                        <td class="no-border  label-alignment" style="width: 5%">
                            <asp:Label ID="Label1" Text="Requests" runat="server" Font-Size="Medium" Font-Bold="true" />
                        </td>
                        <td class="no-border" style="width: 20%;">
                            <select id="ddlRequests" class="form-select color-dropdown">
                                <option value="-1">All Requests</option>
                                <option value="0">Leave Application</option>
                                <option value="1">Passport Release</option>
                                <option value="2">Bank Related Request</option>
                                <option value="3">Miscellaneous Request</option>
                                <option value="4">Company Loan</option>
                                <option value="5">Late Attendance Request</option>
                                <option value="6">Exit Pass Request</option>
                            </select>
                        </td>
                        <td class="no-border  label-alignment" style="width: 3%"></td>
                        <td class="no-border  label-alignment" style="width: 5%">
                            <asp:Label ID="Label2" Text="Status" runat="server" Font-Size="Medium" Font-Bold="true" />
                        </td>
                        <td class="no-border" style="width: 20%;">
                            <select id="ddlStatus" class="form-select color-dropdown">
                                <option value="PENDING">PENDING</option>
                                <option value="APPROVED">APPROVED</option>
                                <option value="REJECTED">REJECTED</option>

                            </select>
                        </td>
                        <td class="no-border  label-alignment"></td>


                    </tr>
                </table>
            </div>


        </div>


        <div class="card-body" style="margin-top: -1%; zoom: 90%;">

            <table class="table Request_Details emp-req-table">

                <thead class="table thead-Request_Details emp-req-table-th">
                </thead>
                <tbody class="tbody-emp-req">
                </tbody>
            </table>




        </div>
        <%--card-body end--%>
     <%--</div>--%>

    <!--<div class="modal fade" id="empLeaveModal" style="background: #fff2f085; zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%-- <h5 class="modal-title" id="empLeaveModalLabel" style="width:85%;">Leave Request Application</h5>--%>
                    <div class="row">
                        <div class="col-12">
                            <select id="ddlRequestType" class="form-select color-dropdown" style="">
                                <option value="0">Leave Application</option>
                                <option value="1">Passport Release</option>
                                <option value="2">Bank Related Request</option>
                                <option value="3">Miscellaneous Request</option>
                                <option value="4">Company Loan</option>
                                <option value="5">Late Attendance Request</option>
                                <option value="6">Exit Pass Request</option>
                            </select>
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

                    <div id="proj-details-rectangle-div">

                        <div class="row">
                            <span id="lblAppID" style="visibility: hidden"></span>
                            <span id="lblStatus" style="visibility: hidden"></span>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Emp Name </label>
                                <div class="">
                                    <input type="text" id="lblEmpName" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                </div>
                            </div>

                            <div style="width: 13.33%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Emp No. </label>
                                <div class="">
                                    <label id="lblEmpNo"></label>
                                </div>
                            </div>
                            <div style="width: 12%; display: none;">
                                <label for="html5-number-input" class="col-form-label label-custom">Last Ticket Encash Date</label>
                                <div class="">

                                    <label id="lblLastTktEncash"></label>
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Designation </label>
                                <div class="">
                                    <input type="text" id="lblDesignation" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                                <div class="">

                                    <input type="text" id="lblDepart" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                </div>
                            </div>

                            <div style="width: 13.33%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Visa Exp Date </label>
                                <div class="">
                                    <label id="lblVisaExpDate" style="">Aug, 18 2023</label>
                                </div>
                            </div>

                            <div style="width: 13.33%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Passport Exp Date </label>
                                <div class="">

                                    <label id="lblPassExpDate" style="">Sep, 2 2023</label>
                                </div>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 1.5%;">

                            <%--  <div style="width: 60%;">

                                <div class="row">--%>

                            <div class="" style="width: 20%">
                                <div>
                                    <label for="html5-number-input" class="col-form-label label-custom">Date of Joining </label>
                                    <div class="">

                                        <label id="lblDateOfJoin" style="">Sep, 2 2023</label>
                                    </div>
                                </div>
                            </div>

                            <div class="" style="width: 13.33%">
                                <div>
                                    <label for="html5-number-input" class="col-form-label label-custom">Emirates ID </label>
                                    <div class="">

                                        <label id="lblEID" style="">Sep, 2 2023</label>
                                    </div>
                                </div>
                            </div>

                            <div class="" style="width: 20%">
                                <%--      <div id="projChart" style="margin-top: -18px; min-height: 112.55px;"><div id="apexchartsc01m0rw4" class="apexcharts-canvas apexchartsc01m0rw4 apexcharts-theme-light" style="width: 110px; height: 112.55px;"><svg id="SvgjsSvg1025" width="110" height="112.55000000000001" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG1027" class="apexcharts-inner apexcharts-graphical" transform="translate(-4.5, 0)"><defs id="SvgjsDefs1026"><clipPath id="gridRectMaskc01m0rw4"><rect id="SvgjsRect1029" width="125" height="148" x="-4.5" y="-2.5" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskc01m0rw4"></clipPath><clipPath id="nonForecastMaskc01m0rw4"></clipPath><clipPath id="gridRectMarkerMaskc01m0rw4"><rect id="SvgjsRect1030" width="120" height="147" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><g id="SvgjsG1031" class="apexcharts-pie"><g id="SvgjsG1032" transform="translate(0, 0) scale(1)"><circle id="SvgjsCircle1033" r="35.68902439024391" cx="58" cy="58" fill="transparent"></circle><g id="SvgjsG1034" class="apexcharts-slices"><g id="SvgjsG1035" class="apexcharts-series apexcharts-pie-series" seriesName="Completed" rel="1" data:realIndex="0"><path id="SvgjsPath1036" d="M 58 10.414634146341456 A 47.585365853658544 47.585365853658544 0 0 1 NaN NaN L NaN NaN A 35.68902439024391 35.68902439024391 0 0 0 58 22.310975609756092 L 58 10.414634146341456 z" fill="rgba(152,202,60,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="5" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-0" index="0" j="0" data:angle="NaN" data:startAngle="0" data:strokeWidth="5" data:value="NaN" data:pathOrig="M 58 10.414634146341456 A 47.585365853658544 47.585365853658544 0 0 1 NaN NaN L NaN NaN A 35.68902439024391 35.68902439024391 0 0 0 58 22.310975609756092 L 58 10.414634146341456 z" stroke="#ffffff"></path></g><g id="SvgjsG1037" class="apexcharts-series apexcharts-pie-series" seriesName="Remaining" rel="2" data:realIndex="1"><path id="SvgjsPath1038" d="M NaN NaN A 47.585365853658544 47.585365853658544 0 0 1 NaN NaN L NaN NaN A 35.68902439024391 35.68902439024391 0 0 0 NaN NaN L NaN NaN z" fill="rgba(251,193,30,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="5" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-1" index="0" j="1" data:angle="NaN" data:startAngle="NaN" data:strokeWidth="5" data:value="NaN" data:pathOrig="M NaN NaN A 47.585365853658544 47.585365853658544 0 0 1 NaN NaN L NaN NaN A 35.68902439024391 35.68902439024391 0 0 0 NaN NaN L NaN NaN z" stroke="#ffffff"></path></g></g></g><g id="SvgjsG1039" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)"><text id="SvgjsText1040" font-family="Helvetica, Arial, sans-serif" x="58" y="78" text-anchor="middle" dominant-baseline="auto" font-size="0.7125rem" font-weight="400" fill="#98ca3c" class="apexcharts-text apexcharts-datalabel-label" style="font-family: Helvetica, Arial, sans-serif;">Completed</text><text id="SvgjsText1041" font-family="Public Sans" x="58" y="59" text-anchor="middle" dominant-baseline="auto" font-size="1.1rem" font-weight="400" fill="#566a7f" class="apexcharts-text apexcharts-datalabel-value" style="font-family: &quot;Public Sans&quot;;">NaN%</text></g></g><line id="SvgjsLine1042" x1="0" y1="0" x2="116" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1043" x1="0" y1="0" x2="116" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line></g><g id="SvgjsG1028" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend"></div><div class="apexcharts-tooltip apexcharts-theme-dark"><div class="apexcharts-tooltip-series-group" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(152, 202, 60);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif;  "><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 2;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(251, 193, 30);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif;  "><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div></div></div>
                                 <div class="resize-triggers"><div class="expand-trigger"><div style="width: 315px; height: 96px;"></div></div><div class="contract-trigger"></div></div>--%>
                                <div>
                                    <label for="html5-number-input" class="col-form-label label-custom">Emirates Exp Date</label>
                                    <div class="">

                                        <label id="lblEIDExpDate" style="">Sep, 2 2023</label>
                                    </div>
                                </div>
                            </div>

                            <%-- </div>

                            </div>--%>



                            <div style="width: 10%; display: none;">
                                <label for="html5-number-input" class="col-form-label label-custom">last Leave Encash Date </label>
                                <div class="">
                                    <label id="lblLeaveEncaseDate">15 days</label>
                                </div>
                            </div>
                            <div style="width: 10%; display: none;">
                                <label for="html5-number-input" class="col-form-label label-custom">Weekly Off  </label>
                                <div class="">
                                    <label id="lblWeeklyOff">15 days</label>
                                </div>
                            </div>


                            <div style="width: 13.33%; display: none;">
                                <label for="html5-number-input" class="col-form-label label-custom">Last Vacation From</label>
                                <div class="">
                                    <label id="lblLastVacationFromDate" style="">Aug, 24 2023 8:12 AM</label>
                                </div>
                            </div>

                            <div style="width: 13.33%; display: none;">
                                <label for="html5-number-input" class="col-form-label label-custom">Last Vacation To</label>
                                <div class="">
                                    <label id="lblVacationToDate" style="">-</label>
                                </div>
                            </div>
                        </div>


                    </div>



                    <%--1st Row--%>
                    <div class="Leave-Req">
                        <%-- <div class="row" style="margin-top: 14px;">
                        
                          <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">On Behalf </label>
                            <div class="netliva-switch">
                                <input type="checkbox" id="cbEmpOnBehalf" netliva-switch="OK">
                                <label for="cbEmpOnBehalf" data-active-text="On Behalf" data-passive-text="On Behalf" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; display: none"></label>
                            </div>
                        </div>
                                           
                          <div class="onbehalf-controls-div col-md-4 hidden">
                                <label for="html5-number-input" class="col-form-label label-custom">Employee Name </label>
                                <div>
                                    <select id="txtEmpName" style=""> </select>
                                </div>
                            </div>
                                                 

                            <div class="onbehalf-controls-div1 col-md-4 hidden">
                                <label for="html5-number-input" class="col-form-label label-custom">Attachment</label>

                                <div class="input-group mb-3 insert-Attachment">
                                    <input class="form-control" type="file" id="fu-on-behalf" title="On Behalf" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" />
                                    <label class="input-group-text ml-3" for="fu-on-behalf" style="border: transparent;width:20%;">
                                        <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 49px; margin-top: -10px;" />
                                    </label>
                                    <input type="text" id="lblOnBehalfFU" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="" />
                                </div>


                                <div class="download-Attachment">
                                    <img src="Images/Icon-download.png" id="btnDownloadOBAtt" title="Download File" class="fa-icon-hover" style="cursor: pointer; width: 40px;" />
                                </div>

                            </div>
                     
                             </div>
                        --%>


                        <%--2nd Row--%>
                        <%-- <div class="row">
                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Request No. </label>
                            <div>
                                <input type="text" id="txtReqNo" class="form-control textbox-border-color" disabled />
                            </div>
                        </div>

                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Leave Balance </label>
                            <div>
                                <input type="text" id="txtLeaveBal" class="form-control textbox-border-color" disabled />
                            </div>
                        </div>

                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Leave Type  </label>
                            <div>
                                <select id="ddlLeaveType" class="form-select color-dropdown textbox-border-color"></select>
                            </div>
                        </div>

                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Leave Reason  </label>
                            <div>
                                <select id="ddlLeaveReason" class="form-select color-dropdown textbox-border-color"></select>
                            </div>
                        </div>
                    </div>--%>

                        <%--3rd Row--%>
                        <%--<div class="row">
                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Start Date </label>
                            <div>
                                <input type="date" id="txtStartDate" name="nmReqDet" class="form-control textbox-border-color" />
                            </div>
                        </div>

                        <div class="col-3 div-EndDate">
                            <label for="html5-number-input" class="col-form-label label-custom">End Date </label>
                            <div>
                                <input type="date" id="txtEndDate" name="nmReqDet" class="form-control textbox-border-color" disabled />
                            </div>
                        </div>

                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Leave Request Day </label>
                            <div>
                                <input type="text" id="txtLeaveReqDay" name="nmReqDet" class="form-control textbox-border-color" />
                            </div>
                        </div>

                        <div class="col-3" style="display:none;">
                            <label for="html5-number-input" class="col-form-label label-custom">Leave Status</label>
                            <div>
                                <input type="text" id="txtLeaveStatus" name="nmReqDet" class="form-control textbox-border-color" />
                            </div>
                        </div>
                    </div>--%>

                        <%--4th Row--%>

                        <%--will enable for sick leave--%>
                        <%--  <div class="row ddl-opt-sick-leave Group-Of-Doc">
                        <div class="col-3 div-Retwork">
                            <label for="html5-number-input" class="col-form-label label-custom">Return to Work</label>
                            <div class="">
                                <input type="date" id="txtReturnToWork" class="form-control textbox-border-color" />
                            </div>
                        </div>

                        <div class="col-3 div-Cons-Doc">
                            <label for="html5-number-input" class="col-form-label label-custom">Consulted Doctor? </label>
                            <div>
                                <div class="netliva-switch">
                                    <input type="checkbox" id="cbIsConsultWithDoc" netliva-switch="OK">
                                    <label for="cbIsConsultWithDoc" data-active-text="Consulted Doctor?" data-passive-text="Consulted Doctor?" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; display: none"></label>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                        <%--end--%>
                        <%--will enable for annual leave--%>
                        <%--<div class="row ddl-opt-annual-leave Grop-Of-Det">
                        <div class="col-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Primary Contact</label>
                            <div>
                                <input type="text" id="txtPrimaryContact" name="nmContactDet" class="form-control textbox-border-color" />
                            </div>
                        </div>

                        <div class="col-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Secondary Contact</label>
                            <div>
                                <input type="text" id="txtSecContact" name="nmContactDet" class="form-control textbox-border-color" />
                            </div>
                        </div>

                        <div class="col-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Contact Name</label>
                            <div>
                                <input type="text" id="txtContactName" name="nmContactDet" class="form-control textbox-border-color" />
                            </div>
                        </div>

                        <div class="col-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Contact Email</label>
                            <div>
                                <input type="text" id="txtContactEmail" name="nmContactDet" class="form-control textbox-border-color" />
                            </div>
                        </div>

                        <div class="col-4">
                            <label for="html5-number-input" class="col-form-label label-custom">Remark</label>
                            <div>
                                <textarea class="form-control textbox-border-color" id="taRemark" rows="2" placeholder="Enter Question Desc"></textarea>
                            </div>
                        </div>

                    </div>

                    <div class="row ddl-opt-annual-leave">
                        <div class="Group-Of-Cb" style="width: 12.3333%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Advanced Salary Required? </label>
                            <div>
                                <div class="netliva-switch">
                                    <input type="checkbox" id="cbIsAdvSalaryReq" name="nmSbReq" netliva-switch="OK">
                                    <label for="cbIsAdvSalaryReq" data-active-text="Consulted Doctor?" data-passive-text="Consulted Doctor?" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; display: none"></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-1 Group-Of-Cb">
                            <label for="html5-number-input" class="col-form-label label-custom">Ticket Required? </label>
                            <div>
                                <div class="netliva-switch">
                                    <input type="checkbox" id="cbIsTicketReq" name="nmSbReq" netliva-switch="OK">
                                    <label for="cbIsTicketReq" data-active-text="Consulted Doctor?" data-passive-text="Consulted Doctor?" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; display: none"></label>
                                </div>
                            </div>
                        </div>

                        <div class="col-1 Group-Of-Cb">
                            <label for="html5-number-input" class="col-form-label label-custom">Passport Required?</label>
                            <div>
                                <div class="netliva-switch">
                                    <input type="checkbox" id="cbIsPassReq" name="nmSbReq" netliva-switch="OK">
                                    <label for="cbIsPassReq" data-active-text="Consulted Doctor?" data-passive-text="Consulted Doctor?" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; display: none"></label>
                                </div>
                            </div>
                        </div>

                        <div class="col-3 div-Attachment">
                            <label for="html5-number-input" class="col-form-label label-custom">Attachment</label>

                            <div class="input-group mb-3 insert-Attachment">

                                <input class="form-control" type="file" id="fu-leave-req" title="Leave Request" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;">
                                <label class="input-group-text ml-3" for="fu-leave-req" style="border: transparent;">--%>
                        <%--<i class="fa fa-upload " title="Upload File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i>--%>
                        <%-- <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 49px; margin-top: -10px;" />
                                </label>--%>
                        <%--  <a href="#" id="btnUploadChatFile" class="btn btn-primary" style="margin-left: 4px;">Upload File </a>--%>
                        <%--  <input type="text" id="lblLeaveReqFileName" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                            </div>


                             <div class="input-group mb-3 download-Attachment">

                                    <img src="Images/Icon-download.png" id="btnDownloadAttachment" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 40px;" />
                               
                            </div>


                        </div>
                    </div>--%>
                    </div>

                    <div class="row">
                        <div class="col-12 ActionButtons">
                            <div class="pull-right">
                                <%-- <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>--%>
                                <button id="btnSubmit" type="button" class="btn btn-primary btnTagTemp" style=""><i class='bx bxs-check-circle me-3'></i>Submit</button>
                                <button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-save me-3'></i>Save as Draft</button>
                                <button id="btnCancellRequest" type="button" class="btn btn-primary btnTagTemp"><i class='bx bx-x-circle'></i>Cancell</button>
                            </div>
                        </div>
                        <div class="col-12 dvApprovalStage">
                            <h5>Approver Authority List</h5>

                            <div>
                                <table class="table appr-auth-table">

                                    <thead>
                                        <tr style="background: #ffede3; text-align: center;">
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

                    <%--end--%>
                </div>
                <div class="modal-footer">
                </div>
            </div>

        </div>
    </div> -->


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


         <script>
             $(document).on("click", ".print", function () {
                 $('#layout-navbar').addClass('hidden')
                 $('.unprint-content-div').addClass('hidden');
                // $('.modal-body1').removeClass('printClassv');
                
                 const section = $("section");
                 const modalBody1 = $(".modal-body-print").detach();

                 const content = $(".content").detach();
                 section.append(modalBody1);
                 window.print();
                 section.empty();
                 section.append(content);
                 $(".modal-body-wrapper").append(modalBody1); 
                 $('#empLeaveModal').css('background-color','white');
                 $('.unprint-content-div').removeClass('hidden');

                 $('#layout-navbar').removeClass('hidden');
             });
         </script>

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
    <script src="Scripts/OtherRequests.js?v=8"></script>
    <link href="Css/allrequest.css" rel="stylesheet" />

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

