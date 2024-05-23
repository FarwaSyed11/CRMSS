<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="EmployeeLeaveArea.aspx.cs" Inherits="SSHR_EmployeeLeaveArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />


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

        .label-custom {
            color: #d4432c !important;
            font-weight: 500 !important;
            text-transform: capitalize;
            /*padding-top: 3px;*/
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
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link:hover {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
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

        .active-tr {
            border-left: 7px solid #db7e2f !important;
        }

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

        table tbody tr:hover {
            background-color: #ff6f591a !important;
            border-right: 5px solid #db7e2f !important;
        }

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

        .active-ass {
            /*background-color:#e6eeff !important;*/
            background-color: #ffede6 !important;
        }

        .tbody-quesopt-list tr:hover {
            cursor: pointer;
        }

        #lblEmpName, #lblDesignation, #lblDepart, #lblLeaveReqFileName:focus {
            outline: none;
        }

        .proj-det-drilldown {
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

        .proj-det-drillup, .proj-det-drilldown:hover {
            background-color: #c52a11;
        }

        .textbox-border-color {
            border-bottom: 4px solid #fc71224a;
        }

        #proj-details-rectangle-div {
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

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--<div class="ajax-loader loader-bg-blur">
          <div class="custom-loader ">
              <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
              <h4>Loading Data...</h4>
          </div>
      </div>--%>


    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div style="padding-left: 2%; padding-top: 1%;">
            <h5 style="color: #a92828; margin-top: 13px">Leave Requests</h5>
        </div>

        <div class="card-body" style="margin-top: -1%; zoom: 90%;">

            <%--SSHR Work--%>
            <div class="" style="margin-top: 1%;">
                <button id="AddNewReq" type="button" class="btn btn-primary" style="float: right; width: 150px;"><i class='fa fa-plus'></i>&nbsp;&nbsp;Add New</button>
            </div>

            <div class="" style="padding-top: 3%;">
                <table class="table emp-leave-req-table">

                    <thead>
                        <tr>
                            <%--<th style="width:8%;">SurveyId</th>--%>
                             <th style="width: 8%;display:none;">Leave App Id</th>
                            <th style="width: 14%;">Leave App No</th>
                            <%-- <th style="width:6%;">Description</th>--%>
                            <th style="width: 8%;">Leave Type</th>
                            <th style="width: 12%;">Start date</th>
                            <th style="width: 8%;">End Date</th>
                            <th style="width: 8%;">Reason</th>
                            <th style="width: 8%;">IspaidLeave</th>
                            <th style="width: 6%;">Action</th>

                    </thead>
                    <tbody class="tbody-emp-leave-req">
                    </tbody>
                </table>
            </div>



        </div>
        <%--card-body end--%>
    </div>



    <%-- SSHR Emp Leave App Modal --%>
    <div class="modal fade" id="empLeaveModal" style="background: #fff2f085; zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="empLeaveModalLabel" style="width:85%;">Leave Request Application</h5>
                    <div class="pull-right">
                       <%-- <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>--%>
                        <button id="btnSubmit" type="button" class="btn btn-primary btnTagTemp" style="display:none;"><i class='bx bxs-check-circle'></i>Submit</button>
                        <button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-save'></i>Save</button>
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
                            <div style="width: 12%;display:none;">
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
                                    <label id="lblVisaExpDate" style="font-size: 12px;">Aug, 18 2023</label>
                                </div>
                            </div>

                            <div style="width: 13.33%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Passport Exp Date </label>
                                <div class="">

                                    <label id="lblPassExpDate" style="font-size: 12px;">Sep, 2 2023</label>
                                </div>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 1.5%;">

                          <%--  <div style="width: 60%;">

                                <div class="row">--%>

                                    <div class="" style="width:20%">
                                        <div>
                                            <label for="html5-number-input" class="col-form-label label-custom">Date of Joining </label>
                                            <div class="">

                                                <label id="lblDateOfJoin" style="font-size: 12px;">Sep, 2 2023</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="" style="width:13.33%">
                                        <div>
                                            <label for="html5-number-input" class="col-form-label label-custom">Emirates ID </label>
                                            <div class="">

                                                <label id="lblEID" style="font-size: 12px;">Sep, 2 2023</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="" style="width:20%">
                                        <%--      <div id="projChart" style="margin-top: -18px; min-height: 112.55px;"><div id="apexchartsc01m0rw4" class="apexcharts-canvas apexchartsc01m0rw4 apexcharts-theme-light" style="width: 110px; height: 112.55px;"><svg id="SvgjsSvg1025" width="110" height="112.55000000000001" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG1027" class="apexcharts-inner apexcharts-graphical" transform="translate(-4.5, 0)"><defs id="SvgjsDefs1026"><clipPath id="gridRectMaskc01m0rw4"><rect id="SvgjsRect1029" width="125" height="148" x="-4.5" y="-2.5" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskc01m0rw4"></clipPath><clipPath id="nonForecastMaskc01m0rw4"></clipPath><clipPath id="gridRectMarkerMaskc01m0rw4"><rect id="SvgjsRect1030" width="120" height="147" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><g id="SvgjsG1031" class="apexcharts-pie"><g id="SvgjsG1032" transform="translate(0, 0) scale(1)"><circle id="SvgjsCircle1033" r="35.68902439024391" cx="58" cy="58" fill="transparent"></circle><g id="SvgjsG1034" class="apexcharts-slices"><g id="SvgjsG1035" class="apexcharts-series apexcharts-pie-series" seriesName="Completed" rel="1" data:realIndex="0"><path id="SvgjsPath1036" d="M 58 10.414634146341456 A 47.585365853658544 47.585365853658544 0 0 1 NaN NaN L NaN NaN A 35.68902439024391 35.68902439024391 0 0 0 58 22.310975609756092 L 58 10.414634146341456 z" fill="rgba(152,202,60,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="5" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-0" index="0" j="0" data:angle="NaN" data:startAngle="0" data:strokeWidth="5" data:value="NaN" data:pathOrig="M 58 10.414634146341456 A 47.585365853658544 47.585365853658544 0 0 1 NaN NaN L NaN NaN A 35.68902439024391 35.68902439024391 0 0 0 58 22.310975609756092 L 58 10.414634146341456 z" stroke="#ffffff"></path></g><g id="SvgjsG1037" class="apexcharts-series apexcharts-pie-series" seriesName="Remaining" rel="2" data:realIndex="1"><path id="SvgjsPath1038" d="M NaN NaN A 47.585365853658544 47.585365853658544 0 0 1 NaN NaN L NaN NaN A 35.68902439024391 35.68902439024391 0 0 0 NaN NaN L NaN NaN z" fill="rgba(251,193,30,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="5" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-1" index="0" j="1" data:angle="NaN" data:startAngle="NaN" data:strokeWidth="5" data:value="NaN" data:pathOrig="M NaN NaN A 47.585365853658544 47.585365853658544 0 0 1 NaN NaN L NaN NaN A 35.68902439024391 35.68902439024391 0 0 0 NaN NaN L NaN NaN z" stroke="#ffffff"></path></g></g></g><g id="SvgjsG1039" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)"><text id="SvgjsText1040" font-family="Helvetica, Arial, sans-serif" x="58" y="78" text-anchor="middle" dominant-baseline="auto" font-size="0.7125rem" font-weight="400" fill="#98ca3c" class="apexcharts-text apexcharts-datalabel-label" style="font-family: Helvetica, Arial, sans-serif;">Completed</text><text id="SvgjsText1041" font-family="Public Sans" x="58" y="59" text-anchor="middle" dominant-baseline="auto" font-size="1.1rem" font-weight="400" fill="#566a7f" class="apexcharts-text apexcharts-datalabel-value" style="font-family: &quot;Public Sans&quot;;">NaN%</text></g></g><line id="SvgjsLine1042" x1="0" y1="0" x2="116" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1043" x1="0" y1="0" x2="116" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line></g><g id="SvgjsG1028" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend"></div><div class="apexcharts-tooltip apexcharts-theme-dark"><div class="apexcharts-tooltip-series-group" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(152, 202, 60);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 2;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(251, 193, 30);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div></div></div>
                                 <div class="resize-triggers"><div class="expand-trigger"><div style="width: 315px; height: 96px;"></div></div><div class="contract-trigger"></div></div>--%>
                                        <div>
                                            <label for="html5-number-input" class="col-form-label label-custom">Emirates Exp Date</label>
                                            <div class="">

                                                <label id="lblEIDExpDate" style="font-size: 12px;">Sep, 2 2023</label>
                                            </div>
                                        </div>
                                    </div>

                               <%-- </div>

                            </div>--%>



                            <div style="width: 10%;display:none;">
                                <label for="html5-number-input" class="col-form-label label-custom">last Leave Encash Date </label>
                                <div class="">
                                    <label id="lblLeaveEncaseDate">15 days</label>
                                </div>
                            </div>
                            <div style="width: 10%;display:none;">
                                <label for="html5-number-input" class="col-form-label label-custom">Weekly Off  </label>
                                <div class="">
                                    <label id="lblWeeklyOff">15 days</label>
                                </div>
                            </div>


                            <div style="width: 13.33%;display:none;">
                                <label for="html5-number-input" class="col-form-label label-custom">Last Vacation From</label>
                                <div class="">
                                    <label id="lblLastVacationFromDate" style="font-size: 12px;">Aug, 24 2023 8:12 AM</label>
                                </div>
                            </div>

                            <div style="width: 13.33%;display:none;">
                                <label for="html5-number-input" class="col-form-label label-custom">Last Vacation To</label>
                                <div class="">
                                    <label id="lblVacationToDate" style="font-size: 12px;">-</label>
                                </div>
                            </div>
                        </div>


                    </div>


                    <%--1st Row--%>
                    <%--           <div class="row">
                <div class="col-3"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Name </label>
                     <div>
                            <input type="text" id="txtName" class="form-control"  />
                     </div> 
                </div> 

                <div class="col-3"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Emp No </label>
                     <div>
                            <input type="text" id="txtSurveyName" class="form-control"  />
                     </div> 
                </div>

                <div class="col-3"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Designation </label>
                     <div>
                            <input type="text" id="txtSurveyName" class="form-control"  />
                     </div> 
                </div>

                <div class="col-3"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Department </label>
                     <div>
                            <input type="text" id="txtSurveyName" class="form-control"  />
                     </div> 
                </div>
            </div>--%>

                    <%--2nd Row--%>
                    <%-- <div class="row">
                <div class="col-3"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Visa Expiry Date </label>
                     <div>
                            <input type="text" id="txtName" class="form-control"  />
                     </div> 
                </div> 

                <div class="col-3"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Passport Expiry Date </label>
                     <div>
                            <input type="text" id="txtSurveyName" class="form-control"  />
                     </div> 
                </div>

                <div class="col-3"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Date of Joining </label>
                     <div>
                            <input type="text" id="txtSurveyName" class="form-control"  />
                     </div> 
                </div>

                <div class="col-3"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Weekly Off </label>
                     <div>
                            <input type="text" id="txtSurveyName" class="form-control"  />
                     </div> 
                </div>
            </div>--%>

                    <%--3rd Row--%>
                    <%--  <div class="row">
                <div class="col-3"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Last Vacation From </label>
                     <div>
                            <input type="text" id="txtName" class="form-control"  />
                     </div> 
                </div> 

                <div class="col-3"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Last Vacation To  </label>
                     <div>
                            <input type="text" id="txtSurveyName" class="form-control"  />
                     </div> 
                </div>

                <div class="col-3"> 
                    <label for="html5-number-input" class="col-form-label label-custom">EmiratesID </label>
                     <div>
                            <input type="text" id="txtSurveyName" class="form-control"  />
                     </div> 
                </div>

                <div class="col-3"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Last Leave Encash Date </label>
                     <div>
                            <input type="text" id="txtSurveyName" class="form-control"  />
                     </div> 
                </div>
            </div>--%>

                    <%--4th Row--%>
                    <%--  <div class="row">
                <div class="col-3"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Emirates Exp Date </label>
                     <div>
                            <input type="text" id="txtName" class="form-control"  />
                     </div> 
                </div> 

                <div class="col-3"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Last Ticket Encash Date  </label>
                     <div>
                            <input type="text" id="txtSurveyName" class="form-control"  />
                     </div> 
                </div>
              
            </div>
          <hr style="background: #332f2e1f;" />--%>

                    <%--1st Row--%>
                      <div class="row" style="margin-top: 14px;">
                        
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
                  
                   

                    <%--2nd Row--%>
                    <div class="row">
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
                    </div>

                    <%--3rd Row--%>
                    <div class="row">
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
                    </div>

                    <%--4th Row--%>

                    <%--will enable for sick leave--%>
                    <div class="row ddl-opt-sick-leave Group-Of-Doc">
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
                    </div>
                    <%--end--%>
                    <%--will enable for annual leave--%>
                    <div class="row ddl-opt-annual-leave Grop-Of-Det">
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
                                <label class="input-group-text ml-3" for="fu-leave-req" style="border: transparent;">
                                    <%--<i class="fa fa-upload " title="Upload File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i>--%>
                                    <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 49px; margin-top: -10px;" />
                                </label>
                                <%--  <a href="#" id="btnUploadChatFile" class="btn btn-primary" style="margin-left: 4px;">Upload File </a>--%>
                                <input type="text" id="lblLeaveReqFileName" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                            </div>


                             <div class="input-group mb-3 download-Attachment">

                                    <img src="Images/Icon-download.png" id="btnDownloadAttachment" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 40px;" />
                               
                            </div>


                        </div>
                    </div>

                    <div class="row">
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

                    <%--end--%>
                </div>
                <div class="modal-footer">
                    
                </div>
            </div>
            
            </div>
        </div>
 

    <%--end here--%>


    <div class="modal fade" id="ModalAddSurvey" style="background: #fff2f085; zoom: 87%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lblModalAddSurvey">-</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                    <div id="divSurveyNew" style="background: #e14f0c17; padding: 15px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">

                        <h5 class="prpmdl-hed" id="lbladditemsa">New Survey</h5>
                        <div class="row">

                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">Survey Name <span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="txtSurveyName" class="form-control" />

                                </div>
                            </div>

                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">Survey Name <span style="color: red;">*</span></label>
                                <div>
                                    <select id="ddlSurveyTypeModal" class="form-select color-dropdown">
                                        <option value="Cross Functional" selected>Cross Functional</option>
                                        <option value="General Functional">General Functional</option>
                                    </select>

                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Survey Start Date <span style="color: red;">*</span></label>
                                <div>
                                    <%-- <input type="text" id="txtSurveyStartDate" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />--%>
                                    <input type="text" id="txtSurveyStartDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
                                </div>
                            </div>


                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Survey End Date <span style="color: red;">*</span></label>
                                <div>
                                    <%--<input type="text" id="txtSurveyEndDate" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />--%>
                                    <input type="text" id="txtSurveyEndDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">Organization <span style="color: red;">*</span></label>
                                <div>
                                    <select id="ddlOrg" class="form-select color-dropdown"></select>
                                </div>
                            </div>

                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">Survey For Department <span style="color: red;">*</span></label>
                                <div>

                                    <%-- <input type="text" id="txtSurveyDepartment" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />--%>
                                    <select id="ddlSurveyDepartment" class="form-select color-dropdown">
                                    </select>

                                </div>
                            </div>


                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">Status<span style="color: red;">*</span></label>
                                <div>
                                    <select id="ddlSurveyStatus" class="form-select color-dropdown">
                                        <option value="DRAFT">DRAFT</option>
                                        <option value="PUBLISHED">PUBLISHED</option>
                                    </select>

                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <label class="col-form-label label-custom" for="basic-default-name">Survey Description </label>
                            <div>
                                <textarea class="form-control" id="taSurveyDesc" rows="4" placeholder="Enter Survey Description"></textarea>
                            </div>
                        </div>




                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-closepu" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnAddSurvey">Create</button>
                </div>

            </div>
        </div>
    </div>



    <%--Tag Template Modal--%>
    <div class="modal fade" id="tagTempModal" style="background: #fff2f085;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="tagTempModalLabel">Tag Template</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-4">
                            <label for="html5-number-input" class="col-form-label label-custom">Template Name </label>
                            <div>
                                <select id="ddlTemplateList" class="form-select color-dropdown"></select>
                            </div>

                        </div>
                    </div>

                    <div class="row" style="text-align: center; color: #ff913c; font-size: 18px;">
                        <div>Template Preview </div>
                    </div>

                    <div class="row temp-draw-ques" style="padding: 20px;">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnTagTemp"><i class="bx bxs-purchase-tag"></i>Tag</button>
                </div>
            </div>
        </div>
    </div>


    <%--Tag Employee Modal--%>
    <div class="modal fade" id="tagEmpModal" style="background: #fff2f085;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="tagEmpModalLabel">Tag Employee(s)</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Select Department </label>
                            <div>
                                <select id="ddlDeptList" class="form-select color-dropdown" style="z-index: 9999999;" multiple></select>
                            </div>

                        </div>
                    </div>

                    <%--<div class="row" style="text-align: center;color: #ff913c;font-size: 18px;"> <div>Template Preview </div></div>--%>

                    <div class="row" style="padding: 20px;">

                        <div class="table-responsive" style="overflow-y: auto; max-height: 800px; width: 100%; padding-top: 10px; zoom: 90%;">
                            <table class="table emps-list-table" style="width: 100%; margin-top: 11px;">
                                <%--<caption class="ms-4">List of Projects</caption>--%>
                                <thead>
                                    <tr>
                                        <th style="background: #d54832 !important; color: white;">
                                            <label class="btn-all-cb" style="background: transparent;">
                                                <input class="form-check-input" type="checkbox">
                                                All 
                                            </label>
                                        </th>
                                        <th>Emp No </th>
                                        <th style="padding-right: 185px;">Emp Name</th>
                                        <th>Company</th>
                                        <th>Department</th>
                                    </tr>
                                </thead>
                                <tbody class="tbody-emps-list">
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnTagEmp"><i class="bx bxs-purchase-tag"></i>Save</button>
                </div>
            </div>
        </div>
    </div>


    <%--Add Question--%>
    <div class="modal fade" id="addQuesModal" style="background: #fff2f085;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addQuesModalLabel">Create Question</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Question Category </label>
                            <div>
                                <input type="text" id="txtQuesCategory" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Question Text </label>
                            <div>
                                <textarea class="form-control" id="taQuestion" rows="2" placeholder="Enter Question Text"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Question Description </label>
                            <div>
                                <textarea class="form-control" id="taQuestionDesc" rows="2" placeholder="Enter Question Desc"></textarea>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnAddQues">Create </button>
                </div>
            </div>
        </div>
    </div>


    <%--Add Answers--%>
    <div class="modal fade" id="addQuesOptnJustiModal" style="background: #fff2f085;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document">
            <div class="modal-content">
                <%-- <div class="modal-header">
        <h5 class="modal-title" id="addQuesOptModalLabel">Create Answer</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>--%>
                <div class="modal-body">

                    <div class="card-body row" style="zoom: 90%;">

                        <div class="" style="width: 60%;">
                            <div style="margin-top: 1px;">
                                <h5 style="color: #a92828; margin-top: -25px;">Answers List </h5>
                                <%--   <label><i class="bx bx-search-alt-2" style="margin-top: -7px; font-size: 26px;color:#7fa3ff;"></i></label>
                                        <select id="ddlAssTypeFilter" class="form-select color-dropdown" style="z-index: 99;" multiple> <option value="GLOBAL" selected="selected">Global</option>
                                                <option value="COMPANY" selected="selected">Company</option>
                                                <option value="DEPARTMENT" selected="selected">Department</option> </select>--%>
                                <a href="#" class="btn btn-primary pull-right btn-add-quesopt-grid" style="padding: 0.4075rem 0.55rem;"><i class="bx bx-file" aria-hidden="true"></i>&nbsp; Add Answers</a>
                            </div>

                            <div class="table-responsive" style="overflow-y: hidden; width: 100%; padding-top: 10px;">
                                <table class="table quesopt-list-table" style="width: 100%; margin-top: 11px;">
                                    <%--<caption class="ms-4">List of Projects</caption>--%>
                                    <thead>
                                        <tr>
                                            <th>ACTION </th>
                                            <th style="padding-right: 235px;">Answer</th>
                                            <th>Value</th>
                                            <th>Order No</th>
                                            <th>Max</th>
                                            <th>Min</th>
                                            <th>Justification</th>
                                        </tr>
                                    </thead>
                                    <tbody class="tbody-quesopt-list" style="color: #b35653;">
                                    </tbody>
                                </table>
                            </div>

                        </div>

                        <div style="width: 40%; border-left: 3px solid #a7b6a724; margin-top: -37px;">
                            <div class="row">
                                <h4 style="color: #a92828; margin-top: 13px;">Justification List </h4>
                                <span style="margin-top: -39px;"><a href="#" class="btn btn-primary pull-right btn-add-justi-grid hidden" style="padding: 0.4075rem 0.55rem;"><i class="fa fa-plus"></i>&nbsp; Add Justification</a></span>
                            </div>

                            <div class="table-responsive" style="overflow-y: hidden; width: 100%; padding-top: 10px;">
                                <table class="table justi-list-table" style="width: 100%; margin-top: 11px;">
                                    <%--<caption class="ms-4">List of Projects</caption>--%>
                                    <thead>
                                        <tr>
                                            <%--<th style="background: #d54832 !important;">Select</th>--%>
                                            <th style="padding-right: 550px;">Justification Text </th>
                                            <th>Action </th>

                                        </tr>
                                    </thead>
                                    <tbody class="tbody-justi-list">
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>



                </div>

            </div>
        </div>
    </div>


    <%--Add Answers--%>

    <div class="modal fade" id="addQuesOptModal" style="background: #fff2f085;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addQuesOptModalLabel">Create Answer</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Answer Text </label>
                            <div>
                                <textarea class="form-control" id="taQuestionOpt" rows="2" placeholder="Enter Question Text"></textarea>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-4">
                            <label for="html5-number-input" class="col-form-label label-custom">Answer Value</label>
                            <div>
                                <input type="number" id="txtQuesOpVal" class="form-control">
                            </div>
                        </div>

                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Answer Order No.</label>
                            <div>
                                <input type="number" id="txtQOptOrderNo" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="form-check form-check-warning" style="margin-top: 38px;">
                                <input class="form-check-input" type="checkbox" value="" id="cbIsJusti" />
                                <label class="form-check-label" for="cbIsJusti">Is Justification </label>
                            </div>
                        </div>
                    </div>

                    <div class="justi-parent-div hidden">
                        <div class="row" style="margin-top: 30px;">
                            <h5 style="text-decoration: underline;">Justification Details</h5>
                            <div style="width: 10.666667%; flex: 0 0 auto; padding-top: 11px;">Minimum </div>
                            <div class="col-2">
                                <input type="number" id="txtJustiMinimum" value="0" max="10" min="0" class="form-control">
                            </div>
                            <div class="col-3">will choose. <i class='bx bxs-info-circle' style="color: #ed7e7e; font-size: 21px;" title="0 denote No Limit"></i></div>

                        </div>

                        <div class="row" style="margin-top: 30px;">
                            <div style="width: 10.666667%; flex: 0 0 auto; padding-top: 11px;">Maximum </div>
                            <div class="col-2">
                                <input type="number" id="txtJustiMaximum" value="0" max="10" min="0" class="form-control">
                            </div>
                            <div class="col-3">will choose. <i class='bx bxs-info-circle' style="color: #ed7e7e; font-size: 21px;" title="0 denote No Limit"></i></div>
                        </div>


                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnAddQOpt">Create </button>
                </div>
            </div>
        </div>
    </div>


    <%--Add Justification--%>

    <div class="modal fade" id="addJustiModal" style="background: #fff2f085;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addJustiModalLabel">Create Justification</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="justi-parent-div">
                        <div class="row" style="margin-top: 30px;">
                            <h5 style="text-decoration: underline;">Justification Details</h5>
                            <div style="width: 10.666667%; flex: 0 0 auto; padding-top: 11px;">Minimum </div>
                            <div class="col-2">
                                <input type="number" id="txtJustiMin" value="0" max="10" min="0" class="form-control">
                            </div>
                            <div class="col-3">will choose. <i class='bx bxs-info-circle' style="color: #ed7e7e; font-size: 21px;" title="0 denote No Limit"></i></div>

                        </div>

                        <div class="row" style="margin-top: 30px;">
                            <div style="width: 10.666667%; flex: 0 0 auto; padding-top: 11px;">Maximum </div>
                            <div class="col-2">
                                <input type="number" id="txtJustiMax" value="0" max="10" min="0" class="form-control">
                            </div>
                            <div class="col-3">will choose. <i class='bx bxs-info-circle' style="color: #ed7e7e; font-size: 21px;" title="0 denote No Limit"></i></div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <label for="html5-number-input" class="col-form-label label-custom">Justification Text </label>
                                <div>
                                    <textarea class="form-control" id="taJustText" rows="2" placeholder="Enter Justification Text"></textarea>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnAddJusti">Create </button>
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

    <%--    <script src="Scripts/SurveyAdmin.js?v=0.7"></script>--%>
    <script src="Scripts/emp-leave-area.js?v=0.7"></script>

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>
        
    <link href="../Dashboard/assets/multiselect/example-styles.css" rel="stylesheet" />
    <script src="../Dashboard/assets/multiselect/jquery.multi-select.js"></script>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

</asp:Content>

