<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="AllRequests.aspx.cs" Inherits="SSHR_AllRequests" %>

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
            /*padding: 17px;
            background: #e8b79c3b;
            border-radius: 12px;
            border: 4px solid #f9bfa86b;
            box-shadow: 0px 0px 13px -7px #d84d1a;*/
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
        <%--<div class="row m-3">
            <div class="col-6">
                <div class="pull-left">
                    <h4 style="color: #a92828;">My Requests</h4>
                </div>
            </div>
         
        </div>--%>

        <div class="card-body" style="">
            <nav id="nav-tab">
                <ul class="nav nav-pills" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="pills-myreq-tab" data-bs-toggle="pill" data-bs-target="#pills-myreq" type="button" role="tab" aria-controls="pills-myreq" aria-selected="true">My Requests</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-behalfreq-tab" data-bs-toggle="pill" data-bs-target="#pills-behalfreq" type="button" role="tab" aria-controls="pills-behalfreq" aria-selected="false">On-Behalf Requests</button>
                    </li>
                </ul>
            </nav>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-myreq" role="tabpanel" aria-labelledby="pills-myreq-tab">
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
                                    <option value="ALL">All Statuses</option>
                                    <option value="DRAFT" selected>Drafted</option>
                                    <option value="SUBMIT" selected>Submitted</option>
                                    <option value="APPROVED">Approved</option>
                                    <option value="REJECTED">Rejected</option>
                                    <option value="CANCELLED">Cancelled</option>
                                </select>
                            </div>
                             
                            <div class="col-8">
                                <button id="AddNewReq" type="button" class="btn btn-primary" style="float: right; width: 150px;"><i class='fa fa-plus me-3'></i>Add New</button>
                            </div>
                        </div>
                        <%--<table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
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
                                        <option value="ALL">ALL</option>
                                        <option value="DRAFT">DRAFT</option>
                                        <option value="SUBMIT">SUBMIT</option>
                                        <option value="APPROVED">APPROVED</option>
                                        <option value="REJECTED">REJECTED</option>
                                        <option value="CANCELLED">CANCELLED</option>
                 
                                    </select>
                                </td>
                                 <td class="no-border  label-alignment">
                                  <button id="AddNewReq" type="button" class="btn btn-primary" style="float: right; width: 150px;"><i class='fa fa-plus me-3'></i>Add New</button>
                                     </td>


                            </tr>
                        </table>--%>
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
                <div class="tab-pane fade" id="pills-behalfreq" role="tabpanel" aria-labelledby="pills-behalfreq-tab">
                    <div class="row tblfilter" runat="server" id="Div1">
                        <div class="col-2">
                            <%--<asp:Label ID="Label3" Text="Requests" runat="server" Font-Size="Medium" Font-Bold="true" />--%>
                            <select id="ddlRequests-behalf" class="form-select color-dropdown">
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
            
                            <select id="ddlStatus-behalf" class="form-select color-dropdown">
                                <option value="ALL">All Statuses</option>
                                <option value="DRAFT">Drafted</option>
                                <option value="SUBMIT">Submitted</option>
                                <option value="APPROVED">Approved</option>
                                <option value="REJECTED">Rejected</option>
                                <option value="CANCELLED">Cancelled</option>
                            </select>
                        </div>
                    </div>
                    <div class="card-body" style="margin-top: 1%;">
                        <table class="table Request_Details emp-req-table-behalf" style="width:100% !important">
                            <thead class="table thead-Request_Details-behalf emp-req-table-th-behalf">
                            </thead>
                            <tbody class="tbody-emp-req-behalf">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%--card-body end--%>
    </div>



    <div class="modal fade" id="empLeaveModal" style="background: #fff2f085; zoom: 85%;" tabindex="-1" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%-- <h5 class="modal-title" id="empLeaveModalLabel" style="width:85%;">Leave Request Application</h5>--%>
                    <div class="row" style="width:100%">
                        <div class="col-2 label-alignment" style="padding-left:20px;padding-top:10px;font-size:medium">
                            <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24">
	                            <path fill="none" stroke="#ec1a25" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 9h16M4 15h16M10 3L8 21m8-18l-2 18" />
                            </svg>
                            <label" id="lblRequestNumber">NA584</label>
                          
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
                                    <label for="html5-number-input" class="col-form-label label-custom on-beh" style="">On Behalf </label>
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



                <%--<div id="bankdeetSidenav" class="sidenav" style="width:0px">
                    <a href="#" onclick="hideShowSalnLoanDeets()" id="salary">Salary Details

                            
                        <%--%--<svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24">
	                        <g fill="none" stroke="#c70000" stroke-width="1.5">
		                        <path d="M17.414 10.414C18 9.828 18 8.886 18 7c0-1.886 0-2.828-.586-3.414m0 6.828C16.828 11 15.886 11 14 11h-4c-1.886 0-2.828 0-3.414-.586m10.828 0Zm0-6.828C16.828 3 15.886 3 14 3h-4c-1.886 0-2.828 0-3.414.586m10.828 0Zm-10.828 0C6 4.172 6 5.114 6 7c0 1.886 0 2.828.586 3.414m0-6.828Zm0 6.828ZM13 7a1 1 0 1 1-2 0a1 1 0 0 1 2 0Z" />
		                        <path stroke-linecap="round" d="M18 6a3 3 0 0 1-3-3m3 5a3 3 0 0 0-3 3M6 6a3 3 0 0 0 3-3M6 8a3 3 0 0 1 3 3m-4 9.388h2.26c1.01 0 2.033.106 3.016.308a14.85 14.85 0 0 0 5.33.118c.868-.14 1.72-.355 2.492-.727c.696-.337 1.549-.81 2.122-1.341c.572-.53 1.168-1.397 1.59-2.075c.364-.582.188-1.295-.386-1.728a1.887 1.887 0 0 0-2.22 0l-1.807 1.365c-.7.53-1.465 1.017-2.376 1.162c-.11.017-.225.033-.345.047m0 0a8.176 8.176 0 0 1-.11.012m.11-.012a.998.998 0 0 0 .427-.24a1.492 1.492 0 0 0 .126-2.134a1.9 1.9 0 0 0-.45-.367c-2.797-1.669-7.15-.398-9.779 1.467m9.676 1.274a.524.524 0 0 1-.11.012m0 0a9.274 9.274 0 0 1-1.814.004" />
		                        <rect width="3" height="8" x="2" y="14" rx="1.5" />
	                        </g>
                        </svg>---%
                        <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24">
	                        <g fill="none" stroke="#c70000" stroke-linecap="round" stroke-width="1.5">
		                        <path d="M12 15.333c1.105 0 2-.746 2-1.666c0-.92-.895-1.667-2-1.667s-2-.746-2-1.667c0-.92.895-1.666 2-1.666m0 6.666c-1.105 0-2-.746-2-1.666m2 1.666V16m0-8v.667m0 0c1.105 0 2 .746 2 1.666" />
		                        <path d="M17 3.338A9.954 9.954 0 0 0 12 2C6.477 2 2 6.477 2 12c0 1.6.376 3.112 1.043 4.453c.178.356.237.763.134 1.148l-.595 2.226a1.3 1.3 0 0 0 1.591 1.592l2.226-.596a1.634 1.634 0 0 1 1.149.133A9.958 9.958 0 0 0 12 22c5.523 0 10-4.477 10-10c0-1.821-.487-3.53-1.338-5" />
	                        </g>
                        </svg>
                    </a>
                    <a href="#" id="details">Loan Details
                        <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24">
                            <g fill="none" stroke="#c70000" stroke-width="1.5">
                                <path d="M17.414 10.414C18 9.828 18 8.886 18 7c0-1.886 0-2.828-.586-3.414m0 6.828C16.828 11 15.886 11 14 11h-4c-1.886 0-2.828 0-3.414-.586m10.828 0Zm0-6.828C16.828 3 15.886 3 14 3h-4c-1.886 0-2.828 0-3.414.586m10.828 0Zm-10.828 0C6 4.172 6 5.114 6 7c0 1.886 0 2.828.586 3.414m0-6.828Zm0 6.828ZM13 7a1 1 0 1 1-2 0a1 1 0 0 1 2 0Z" />
                                <path stroke-linecap="round" d="M18 6a3 3 0 0 1-3-3m3 5a3 3 0 0 0-3 3M6 6a3 3 0 0 0 3-3M6 8a3 3 0 0 1 3 3M4 21.388h2.26c1.01 0 2.033.106 3.016.308a14.85 14.85 0 0 0 5.33.118m-.93-3.297c.12-.014.235-.03.345-.047c.911-.145 1.676-.633 2.376-1.162l1.808-1.365a1.887 1.887 0 0 1 2.22 0c.573.433.749 1.146.386 1.728c-.423.678-1.019 1.545-1.591 2.075m-5.544-1.229a8.176 8.176 0 0 1-.11.012m.11-.012a.998.998 0 0 0 .427-.24a1.492 1.492 0 0 0 .126-2.134a1.9 1.9 0 0 0-.45-.367c-2.797-1.669-7.15-.398-9.779 1.467m9.676 1.274a.524.524 0 0 1-.11.012m0 0a9.274 9.274 0 0 1-1.814.004" />
                            </g>
                        </svg>
                        <%--<svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24">
	                        <g fill="none">
		                        <path stroke="#c70000" stroke-linecap="round" stroke-width="1.5" d="M6 14.5h8M6 18h5.5" />
		                        <path stroke="#c70000" stroke-width="1.5" d="M13 2.5V5c0 2.357 0 3.536.732 4.268C14.464 10 15.643 10 18 10h4" />
		                        <path fill="#c70000" d="M2.75 10a.75.75 0 0 0-1.5 0zm18.5 4a.75.75 0 0 0 1.5 0zm-5.857-9.946l-.502.557zm3.959 3.563l-.502.557zm2.302 2.537l-.685.305zM3.172 20.828l.53-.53zm17.656 0l-.53-.53zM1.355 5.927a.75.75 0 0 0 1.493.146zm21.29 12.146a.75.75 0 1 0-1.493-.146zM14 21.25h-4v1.5h4zM2.75 14v-4h-1.5v4zm18.5-.437V14h1.5v-.437zM14.891 4.61l3.959 3.563l1.003-1.115l-3.958-3.563zm7.859 8.952c0-1.689.015-2.758-.41-3.714l-1.371.61c.266.598.281 1.283.281 3.104zm-3.9-5.389c1.353 1.218 1.853 1.688 2.119 2.285l1.37-.61c-.426-.957-1.23-1.66-2.486-2.79zM10.03 2.75c1.582 0 2.179.012 2.71.216l.538-1.4c-.852-.328-1.78-.316-3.248-.316zm5.865.746c-1.086-.977-1.765-1.604-2.617-1.93l-.537 1.4c.532.204.98.592 2.15 1.645zM10 21.25c-1.907 0-3.261-.002-4.29-.14c-1.005-.135-1.585-.389-2.008-.812l-1.06 1.06c.748.75 1.697 1.081 2.869 1.239c1.15.155 2.625.153 4.489.153zM1.25 14c0 1.864-.002 3.338.153 4.489c.158 1.172.49 2.121 1.238 2.87l1.06-1.06c-.422-.424-.676-1.004-.811-2.01c-.138-1.027-.14-2.382-.14-4.289zM14 22.75c1.864 0 3.338.002 4.489-.153c1.172-.158 2.121-.49 2.87-1.238l-1.06-1.06c-.424.422-1.004.676-2.01.811c-1.027.138-2.382.14-4.289.14zm-3.97-21.5c-1.875 0-3.356-.002-4.511.153c-1.177.158-2.129.49-2.878 1.238l1.06 1.06c.424-.422 1.005-.676 2.017-.811c1.033-.138 2.395-.14 4.312-.14zM2.848 6.073c.121-1.234.382-1.9.854-2.371l-1.06-1.06c-.836.834-1.153 1.919-1.287 3.285zm18.304 11.854c-.121 1.234-.383 1.9-.854 2.371l1.06 1.06c.836-.834 1.153-1.919 1.287-3.285z" />
	                        </g>
                        </svg>--%
                    </a>
                    <div class="row">
                        <div class="col-6">
                                <div id="Bank-details-rectangle-div" class="Bank-Det" style="margin-top: 14px;    border-left: 5px solid red; width:0px; display:none">
                                    <div class="row">
                                    <div class="col-12">
                                        <label for="html5-number-input" class="col-form-label label-custom">Basic</label>
                                        <div>
                                            <input type="text" id="txtBDBasic" name="nmBDBasicSalDet" class="form-control" disabled />
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="html5-number-input" class="col-form-label label-custom">HRA</label>
                                        <div>
                                            <input type="text" id="txtBDHRA" name="nmBDBasicSalDet" class="form-control" disabled />
                                        </div>
                                    </div>

                                        <div class="col-12">
                                        <label for="html5-number-input" class="col-form-label label-custom">Car</label>
                                        <div>
                                            <input type="text" id="txtBDCar" name="nmBDBasicSalDet" class="form-control" disabled />
                                        </div>
                                    </div>


                                        <div class="col-12">
                                        <label for="html5-number-input" class="col-form-label label-custom">Petrol</label>
                                        <div>
                                                <input type="text" id="txtBDPetrol" name="nmBDBasicSalDet" class="form-control" disabled />
                                        </div>
                                    </div>
          

            
                                    <div class="col-12">
                                        <label for="html5-number-input" class="col-form-label label-custom">Mobile</label>
                                        <div>
                                            <input type="text" id="txtBDMobile" name="nmBDBasicSalDet" class="form-control" disabled />
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="html5-number-input" class="col-form-label label-custom">Other</label>
                                        <div>
                                            <input type="text" id="txtBDOther" name="nmBDBasicSalDet" class="form-control" disabled />
                                        </div>
                                    </div>

               
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="table">
                        <table class="table loandeets">
                            <thead class="">
                                <tr>
                                    <th class="">Amount</th>
                                    <th class="">Last Deduction</th>
                                        
                                    <th class="">Monthly Deduction</th>
                                    <th class="">Remaining</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="">
                                    <td>120</td>
                                    <td>120</td>
                                    <td>120</td>
                                    <td>120</td>
                                </tr>
                                <tr class="">
                                    <td>120</td>
                                    <td>120</td>
                                    <td>120</td>
                                    <td>120</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                          
                </div>--%>

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
                                        </tr>
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
    </div>


    <div class="modal fade" id="mpCancelRequest" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header hidden">
                    <h5 class="modal-title" id="lbldelKpiConfirmPopup">Confirmation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bx-x-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;"></i></div>
                    <div>
                        <h3>Are you sure ?</h3>
                    </div>
                    Do you want to Cancel this Request?
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btn-Cancel-Request">Update</button>
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
        var overAllPerfo = 0
        function resetEmployeeNumber() {
            EmpNo = '<%= Session["EmpNo"] %>';
        }
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';
        });

    </script>

    <script src="Scripts/AllRequests.js?v=13"></script>
    <link href="Css/allrequest.css?v=1.31" rel="stylesheet" />

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

