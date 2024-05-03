<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="AuditCalendar.aspx.cs" Inherits="AuditManagement_AuditCalendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../Calendar/plugins/fullcalendar/main.css">
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <link rel="stylesheet" href="css/audit_calendar.css">

    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div class="row m-3">
            <div class="col-6">
                <div class="pull-left">
                    <h4 style="color: #a92828;">Audit Plan - Calendar </h4>
                </div>
            </div>
            <div class="col-6">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end Create-Audit">
                <button class="btn btn-primary me-md-2 d-block" type="button" onclick="addauditgrid()"><i class="fa-regular fa-calendar-plus me-2 fa-lg"></i>Create New Audit</button>
                </div>
            </div>
        </div>

        <div id="content"></div>

        <div class="card-body">

            <div class="hold-transition sidebar-mini" style="margin-top: .5%">

                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-2" style="">
                                <div class="sticky-top mb-3">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">Audit Plan Status</h4>
                                        </div>
                                        <div class="card-body" style="padding-top: 5%">
                                            <div class="row legend">
                                                <div class="col-12">
                                                    <div class="ass">Assigned</div>
                                                    <div class="tot">
                                                        Total Assigned Audits:
                                                        <span class="tot-ass">0</span>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="str">Started</div>
                                                    <div class="tot">
                                                        Total Started Audits:
                                                        <span class="tot-str">0</span>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="com">Completed</div>
                                                    <div class="tot">
                                                        Total Completed Audits:
                                                        <span class="tot-com">0</span>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="cnc">Cancelled</div>
                                                    <div class="tot">
                                                        Total Cancelled Audits:
                                                        <span class="tot-cnc">0</span>
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <div class="sbm">Submit</div>
                                                    <div class="tot">
                                                        Total Submit Audits:
                                                    <span class="tot-sub">0</span>
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <div class="apr">Approved</div>
                                                    <div class="tot">
                                                        Total Approved Audits:
                                                    <span class="tot-app">0</span>
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="">
                                            </div>
                                            <!-- the events -->
                                            <div id="external-events" style="display: none;">
                                                <div class="external-event office">Office Visit</div>
                                                <div class="external-event general-visit">General Visit</div>
                                                <div class="external-event customer-visit hidden">Customer Visit</div>
                                                <div class="external-event project-visit hidden">Project Visit</div>
                                                <div class="external-event bg-danger">Finalization Visit</div>
                                                <div class="external-event surveyy">Survey</div>
                                                <div class="external-event collection">Collection</div>
                                                <div class="external-event follow-up">Follow up</div>
                                                <div class="external-event others">Others</div>
                                                <%--<div class="external-event bg-danger">Sleep tight</div>--%>
                                                <div class="checkbox" style="display: none;">
                                                    <label for="drop-remove">
                                                        <input type="checkbox" id="drop-remove">
                                                        remove after drop
                             
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.card-body -->
                                    </div>
                                </div>
                                <div style="max-height: 300px; overflow-y: auto;">
                                    <h4 style="text-align: center; border-bottom: 1px solid; display: none">Audit List</h4>
                                    <ul id="ulActInvitationsReq">
                                    </ul>
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-10">
                                <div class="card card-primary">
                                    <div class="card-body p-0">
                                        <!-- THE CALENDAR -->
                                        <div id="calendar"></div>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </section>
            </div>
        </div>
    </div>

    <%--Add Audit event--%>
    <div class="modal fade" id="EventModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                        <h5 class="modal-title" id="lbladdTaskModal">Create New Audit Plan</h5>
                       
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                    <div class="row">
                        <%--<a href="#" data-bs-toggle="tooltip" title="Tooltip"><i class="fa-regular fa-circle-question"></i></a>--%>
                        <div class="col-8">
                            <label for="html5-number-input" class="col-form-label label-custom">Audit Department<span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="ddlAuditDepart" class="form-control" />
                                <%--<input class="form-control" type="text" value="" id="txtNameTaskMileStone" style="border-color: lightgrey;" disabled>--%>
                                <%--<select id="ddlAuditDepart" class="form-select color-dropdown"></select>--%>
                            </div>
                        </div>
                        <div class="col-4">
                            
                            <label for="html5-number-input" class="col-form-label label-custom">Notify Auditee</label>
                            

                            <a href="#" data-tooltip="This will send a notication to auditee via email about the audit" data-tooltip-location="right"><i class="fa-regular fa-circle-question"></i></a>
                            <div class="toggle-radio">
                                <input type="radio" name="rdo" id="yes">
                                <input type="radio" name="rdo" id="no" checked>
                                <div class="switch">
                                    <label for="yes">Yes</label>
                                    <label for="no">No</label>
                                    <span></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Auditee Owner<span style="color: red;">*</span></label>
                            <a href="#" data-tooltip="Select the owner who will be audited" data-tooltip-location="right"><i class="fa-regular fa-circle-question"></i></a>
                            <div class="">
                                <%--<input class="form-control" type="text" value="" id="txtNameTaskMileStone" style="border-color: lightgrey;" disabled>--%>
                                <select id="ddlAuditee" class="form-select color-dropdown">
                                    <option value="none" selected="">None</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Audit Owner<span style="color: red;">*</span></label>
                            <a href="#"  data-tooltip="Select the owner who will perform the audit" data-tooltip-location="right"><i class="fa-regular fa-circle-question"></i></a>
                            <div class="">
                                <%--<input class="form-control" type="text" value="" id="txtNameTaskMileStone" style="border-color: lightgrey;" disabled>--%>
                                <select id="ddlAuditor" class="form-select color-dropdown"> 
                                    <option value="none" selected>None</option>
                                </select>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <label class="col-form-label label-custom" for="basic-default-name">Priority</label>
                            <div>
                                <select id="ddlPriority" class="form-select color-dropdown">
                                    <option value="none" selected>None</option>
                                    <option value="Urgent">Urgent</option>
                                    <option value="Important">Important</option>
                                    <option value="Medium">Medium</option>
                                    <option value="Low">Low</option>
                                </select>
                            </div>

                            <label class="col-form-label label-custom" for="basic-default-name">Status</label>
                            <div>
                                <select id="ddlStatus" class="form-select color-dropdown">
                                    <option value="none" selected>None</option>
                                    <option value="Assigned">Assigned</option>
                                    <option value="Started">Started</option>
                                    <option value="Completed">Completed</option>
                                    <option value="Cancelled">Cancelled</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-8">
                            <label class="col-form-label label-custom" for="basic-default-name">Scope Of Audit<span style="color: red;">*</span></label>
                            <div>
                                <textarea class="form-control" id="taScopeAudit" rows="4" placeholder="Enter the scope of audit..."></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-5">
                            <label for="html5-number-input" class="col-form-label label-custom">Start Date <span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="StartDateTask" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
                            </div>
                        </div>

                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">No. of Days <span style="color: red;">*</span></label>
                            <div class="">
                                <%--<input type="text" id="DueDateTask" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">--%>
                                <input type="text" id="NoOfDaysTask" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                            </div>
                        </div>

                        <div class="col-4">
                            <label for="html5-number-input" class="col-form-label label-custom">Due Date <span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="DueDateTask" class="form-control" readonly="readonly">
                                <%--<input type="text" id="DueDateMStone" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">--%>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-close-event-modal" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnAddAudit">Create</button>
                </div>
            </div>
        </div>
    </div>

    <%--Show Audit details--%>
    <div class="modal fade" id="EventDetails" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div style="width:88%;">
                    <h5 class="modal-title" id="eventModalDetailHeading">Audit Details</h5>
                        </div>
                     <div style="width:10%" class="Validation-Button">

                        

                        </div>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal" data-bs-dismiss="modal" aria-label="Close">
                    </button>
                </div>
                <div class="modal-body proj-popup">
                    <div class="row useralert">
                        <div class="alert alert-primary" role="alert">
                            This is a primary alert with <a href="#" class="alert-link">an example link</a>. Give it a click if you like.
                        </div>
                    </div>
                    <div class="row deets p-3">
                        <div class="col-12">
                             
                            <div class="descriptionbox">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="row">
                                            <div class="col-3 pb-2">
                                                <div class="descriptionbox-icon">
                                                    <i class="fa-solid fa-building-flag fa-xl"></i>
                                                    <p>Audit Department</p>
                                                </div>
                                                <div class="descriptionbox-content">
                                                    <p id="auditDept">Naffco IT</p>
                                                </div>
                                            </div>
                                            <div class="col-3 pb-2">
                                                <div class="descriptionbox-icon">
                                                    <i class="fa-solid fa-user-tie fa-xl"></i>
                                                    <h6>Audit Owner</h6>
                                                </div>
                                                <div class="descriptionbox-content">
                                                    <p id="auditOwner">Mr. XYZ</p>
                                                </div>
                                            </div>
                                            <div class="col-3 pb-2">
                                                <div class="descriptionbox-icon">
                                                    <i class="fa-solid fa-user-tag fa-xl"></i>
                                                    <h6>Auditee Owner</h6>
                                                </div>
                                                <div class="descriptionbox-content">
                                                    <p id="auditeeOwner">Mr. ABC </p>
                                                </div>
                                            </div>
                                            <div class="col-3 pb-2">
                                                <div class="descriptionbox-icon">
                                                    <i class="fa-solid fa-arrow-up-short-wide fa-xl"></i>
                                                    <h6>Priority</h6>
                                                </div>
                                                <div class="descriptionbox-content">
                                                    <p id="auditPriority">Urgent</p>
                                                </div>
                                            </div>
                                            <div class="col-3 pb-2">
                                                <div class="descriptionbox-icon">
                                                    <i class="fa-regular fa-calendar-check fa-xl"></i>
                                                    <h6>Expected Start Date</h6>
                                                </div>
                                                <div class="descriptionbox-content">
                                                    <p id="auditExpStDate">1/4/24</p>
                                                </div>
                                            </div>
                                            <div class="col-3 pb-2">
                                                <div class="descriptionbox-icon">
                                                    <i class="fa-regular fa-calendar-check fa-xl"></i>
                                                    <h6>Expected End Date</h6>
                                                </div>
                                                <div class="descriptionbox-content">
                                                    <p id="auditExpEndDate">1/17/24 </p>
                                                </div>
                                            </div>
                                            <div class="col-3 pb-2">
                                                <div class="descriptionbox-icon">
                                                    <i class="fa-solid fa-calendar-xmark fa-xl"></i>
                                                    <h6>Actual Start Date</h6>
                                                </div>
                                                <div class="descriptionbox-content">
                                                    <p id="auditActStDate">1/5/24</p>
                                                </div>
                                            </div>
                                            <div class="col-3 pb-2">
                                                <div class="descriptionbox-icon">
                                                    <i class="fa-solid fa-calendar-check fa-xl"></i>
                                                    <h6>Actual End Date</h6>
                                                </div>
                                                <div class="descriptionbox-content">
                                                    <p id="auditActEndDate">1/16/24 </p>
                                                </div>
                                            </div>
                                            <div class="col-3 pb-2">
                                                <div class="descriptionbox-icon">
                                                    <i class="fa-solid fa-hourglass-half fa-xl"></i>
                                                    <h6>Duration</h6>
                                                </div>
                                                <div class="descriptionbox-content">
                                                    <p id="auditDuration">3 days </p>
                                                </div>
                                            </div>
                                            <div class="col-3 pb-2">
                                                <div class="descriptionbox-icon">
                                                    <i class="fa-solid fa-bars-progress fa-xl"></i>
                                                    <h6>Status</h6>
                                                </div>
                                                <div class="descriptionbox-content">
                                                    <p id="auditStatus">In Progress </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-2">
                                        <div class="auditarea-legend">
                                            <div class="auditarea-legend-head">Audit Area</div>
                                            <div class="auditarea-legend-content">
                                                <span class="complete">Completed :
                                                    <label id="lg-tot-comp">1</label>
                                                </span>
                                                <span class="remain">Remaining :
                                                    <label id="lg-tot-rem">2</label>
                                                </span>
                                                <br />
                                                <span class="start">Started :
                                                    <label id="lg-tot-str">1</label>
                                                </span>
                                                <span class="cancel">Cancelled :
                                                    <label id="lg-tot-cnc">0</label>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="observation-legend">
                                            <div class="observation-legend-head">Observation</div>
                                             <div class="observation-legend-content">
                                                <span class="completeobs">Completed :
                                                    <label id="lg-tot-compobs">1</label>
                                                </span>
                                                <span class="remainobs">Remaining :
                                                    <label id="lg-tot-remobs">2</label>
                                                </span>
                                                <br />
                                                <span class="startobs">Started :
                                                    <label id="lg-tot-strobs">1</label>
                                                </span>
                                                <span class="cancelobs">Cancelled :
                                                    <label id="lg-tot-cncobs">0</label>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-1 pt-3" id="">
                                        <div id="apexcharts9n5zqkfv" class="apexcharts-canvas apexcharts9n5zqkfv apexcharts-theme-light" style="width: 110px; height: 112.55px;"><svg id="SvgjsSvg1063" width="110" height="112.55000000000001" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG1065" class="apexcharts-inner apexcharts-graphical" transform="translate(-4.5, 0)"><defs id="SvgjsDefs1064"><clipPath id="gridRectMask9n5zqkfv"><rect id="SvgjsRect1067" width="125" height="148" x="-4.5" y="-2.5" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMask9n5zqkfv"></clipPath><clipPath id="nonForecastMask9n5zqkfv"></clipPath><clipPath id="gridRectMarkerMask9n5zqkfv"><rect id="SvgjsRect1068" width="120" height="147" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><g id="SvgjsG1069" class="apexcharts-pie"><g id="SvgjsG1070" transform="translate(0, 0) scale(1)"><circle id="SvgjsCircle1071" r="35.68902439024391" cx="58" cy="58" fill="transparent"></circle><g id="SvgjsG1072" class="apexcharts-slices"><g id="SvgjsG1073" class="apexcharts-series apexcharts-pie-series" seriesName="Completed" rel="1" data:realIndex="0"><path id="SvgjsPath1074" d="M 58 10.414634146341456 A 47.585365853658544 47.585365853658544 0 1 1 57.991694786943036 10.41463487110802 L 57.993771090207275 22.310976153331012 A 35.68902439024391 35.68902439024391 0 1 0 58 22.310975609756092 L 58 10.414634146341456 z" fill="rgba(152,202,60,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="5" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-0" index="0" j="0" data:angle="360" data:startAngle="0" data:strokeWidth="5" data:value="100" data:pathOrig="M 58 10.414634146341456 A 47.585365853658544 47.585365853658544 0 1 1 57.991694786943036 10.41463487110802 L 57.993771090207275 22.310976153331012 A 35.68902439024391 35.68902439024391 0 1 0 58 22.310975609756092 L 58 10.414634146341456 z" stroke="#ffffff"></path></g><g id="SvgjsG1075" class="apexcharts-series apexcharts-pie-series" seriesName="Remaining" rel="2" data:realIndex="1"><path id="SvgjsPath1076" d="M 57.99999999999999 10.414634146341456 A 47.585365853658544 47.585365853658544 0 0 1 57.991694786943036 10.41463487110802 L 57.993771090207275 22.310976153331012 A 35.68902439024391 35.68902439024391 0 0 0 57.99999999999999 22.310975609756092 L 57.99999999999999 10.414634146341456 z" fill="rgba(251,193,30,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="5" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-1" index="0" j="1" data:angle="0" data:startAngle="360" data:strokeWidth="5" data:value="0" data:pathOrig="M 57.99999999999999 10.414634146341456 A 47.585365853658544 47.585365853658544 0 0 1 57.991694786943036 10.41463487110802 L 57.993771090207275 22.310976153331012 A 35.68902439024391 35.68902439024391 0 0 0 57.99999999999999 22.310975609756092 L 57.99999999999999 10.414634146341456 z" stroke="#ffffff"></path></g></g></g><g id="SvgjsG1077" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)" style="opacity: 1;"><text id="SvgjsText1078" font-family="Helvetica, Arial, sans-serif" x="58" y="78" text-anchor="middle" dominant-baseline="auto" font-size="0.7125rem" font-weight="400" fill="#98ca3c" class="apexcharts-text apexcharts-datalabel-label" style="font-family: Helvetica, Arial, sans-serif; fill: rgb(152, 202, 60);">Completed</text><text id="SvgjsText1079" font-family="Public Sans" x="58" y="59" text-anchor="middle" dominant-baseline="auto" font-size="1.1rem" font-weight="400" fill="#566a7f" class="apexcharts-text apexcharts-datalabel-value" style="font-family: &quot;Public Sans&quot;;">100%</text></g></g><line id="SvgjsLine1080" x1="0" y1="0" x2="116" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1081" x1="0" y1="0" x2="116" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line></g><g id="SvgjsG1066" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend"></div><div class="apexcharts-tooltip apexcharts-theme-dark" style="left: -116.707px; top: -56.4722px;"><div class="apexcharts-tooltip-series-group apexcharts-active" style="order: 1; display: flex; background-color: rgb(152, 202, 60);"><span class="apexcharts-tooltip-marker" style="background-color: rgb(152, 202, 60); display: none;"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">Completed: </span><span class="apexcharts-tooltip-text-y-value">100</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 2; display: none; background-color: rgb(152, 202, 60);"><span class="apexcharts-tooltip-marker" style="background-color: rgb(152, 202, 60); display: none;"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">Completed: </span><span class="apexcharts-tooltip-text-y-value">100</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               
                <div class="nav-align-top p-2">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-AuditArea" aria-controls="navs-top-AuditArea" aria-selected="true">Audit Area</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-RiskManagement" aria-controls="navs-top-RiskManagement" aria-selected="false">Risk Control</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Observations" aria-controls="navs-top-Observations" aria-selected="false"><span class="liSecondText">Observations</span></button>
                        </li>
                         <li class="nav-item" role="presentation">
                             <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Requirement" aria-controls="navs-top-Requirement" aria-selected="false">Requirements</button>
                         </li>
                        <li class="nav-item" role="presentation">
                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-TeamMembers" aria-controls="navs-top-TeamMembers" aria-selected="false">Team Members</button>
                        </li>
                       
                        <%--<span style="position: relative; left: 27%;" class="lbl-act-status"></span>--%>
                    </ul>
                    <div class="tab-content">

                        <div class="tab-pane fade show active" id="navs-top-AuditArea" role="tabpanel">
                            <%--1--%>
                            <div class="Create-Audit-Area">
                               
                            </div>

                            <div class="" style="margin-top: 0%;">
                                <table class="table table-hover a-area-list-table" style="width: 100%; border-color: inherit; border-style: none !important; border-width: 0;">
                                    <%--<caption class="ms-4">List of Projects</caption>--%>
                                    <thead>
                                        <tr style="text-align: center;">
                                            <th style="">CODE</th>
                                            <th>AUDIT AREA</th>
                                            <th>AREA OWNER</th>
                                            <th>PRIORITY</th>
                                            <th>STATUS</th>
                                            <th>START DATE </th>
                                            <th>END DATE </th>
                                            <th>CREATED DATE</th>
                                            <th>Observation % </th>
                                            <th>ACTION</th>
                                        </tr>
                                    </thead>
                                    <tbody class="a-area-list-tbody" style="text-align: center; font-size: 12px;">
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="navs-top-RiskManagement" role="tabpanel">
                            <%--Nav 3 Risk--%>
                            <div class="Create-Risk">
                               
                            </div>
                           
                            <div class="table-responsive" style="margin-top: 0%;">
                                <table class="table table-hover rcm-added-list" style="width: 100%; border-color: inherit; border-style: none !important; border-width: 0;">
                                    <%--<caption class="ms-4">List of Projects</caption>--%>
                                    <thead>
                                        <tr style="text-align: center;">
                                            <th scope="col" style="width: 4%;">RCM Code</th>
                                            <th scope="col">Major Process</th>
                                            <th scope="col">Process Name</th>
                                            <th scope="col" style="width: 15%;">Process Description</th>
                                            <th scope="col">Risk Name</th>
                                            <th scope="col">Risk Description</th>
                                            <th scope="col">Risk Impact</th>
                                            <th scope="col">Risk Likelihood</th>
                                            <th scope="col">Risk Occurrence Responsibility</th>
                                            <th scope="col">Control Name</th>
                                            <th scope="col">Control Description</th>
                                            <th scope="col">Control Objective</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody class="rcm-added-list-tbody" style="text-align: center; font-size: 12px;">
                                    </tbody>
                                </table>
                                 
                            </div>
                        </div>

                        <div class="tab-pane fade" id="navs-top-Observations" role="tabpanel">
                            <%--Nav 2 Observation--%>
                            <div class="Create-Observation">
                               
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover obs-list-table" style=" width: 100%; border-color: inherit; border-style: none !important; border-width: 0;">
                                    <thead>
                                        <tr style="text-align: center;">
                                            <th>Code</th>
                                            <th>Audit Area</th>
                                            <th>Observation</th>
                                            <th>Observation Owner</th>
                                            <th>Details</th>
                                            <th>Consequence
                                                (Score A)
                                            </th>
                                            <th>Consequence
                                                (Score B) </th>
                                            <th>Consequence
                                                (Score AxB) </th>
                                            <th>Responsibility</th>
                                            <th>Entity</th>
                                            <th>Risks</th>
                                            <th>Recommendations</th>
                                            <th>Action Plan</th>
                                            <th>Status</th>
                                            <th>Remarks</th>
                                            <th>View Attachments</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody class="obs-list-tbody" style="text-align: center; font-size: 12px;">
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="navs-top-TeamMembers" role="tabpanel">
                            <%--4--%>
                            <div class="team-tbody">
                                            
                            </div>
                        </div>

                        <div class="tab-pane fade" id="navs-top-Requirement" role="tabpanel">
                            <%--5--%>
                            <div class="Create-Requirement">
                               
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover req-list-table" style=" width: 100%; border-color: inherit; border-style: none !important; border-width: 0;">
                                    <thead>
                                        <tr style="text-align: center;">
                                            <th>Ref#</th>
                                            <th>Name</th>
                                            <th>Description</th>
                                            <th>Owner</th>
                                            <th>Estimated Date</th>
                                            <th>Created Date</th>
                                            <th>Created By</th>
                                            <th>Priority</th>
                                            <th>Status</th>
                                            <th>Area</th>
                                            <th>Comments</th>
                                            <th>Escalation Count</th>
                                            <th>Escalation Level</th>
                                            <th>View Escalations</th>
                                            <th>View Attachments</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody class="req-list-tbody" style="text-align: center; font-size: 12px;">
                                    </tbody>
                                </table>
                                <table class="table table-hover esc-list-table" style=" width: 100%; border-color: inherit; border-style: none !important; border-width: 0;">
                                    <thead>
                                        <tr style="text-align: center;">
                                            <th>ESC Code</th>
                                            <th>Requirement Name</th>
                                            <th>Ref#</th>
                                            <th>Comments</th>
                                            <th>Escalation Level</th>
                                            <th>Escalation Date</th>
                                        </tr>
                                    </thead>
                                    <tbody class="esc-list-tbody" style="text-align: center; font-size: 12px;">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--ADD Audit AREA--%>
    <div class="modal fade" id="AddAreaModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lbladdAreaModal">Create New Audit Area</h5>
                    <button type="button" class="btn-close btn-close-event-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                    <div class="row">
                        <%--<a href="#" data-bs-toggle="tooltip" title="Tooltip"><i class="fa-regular fa-circle-question"></i></a>--%>
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Audit Area<span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="ddlAuditArea" class="form-control" />
                                <%--<input class="form-control" type="text" value="" id="txtNameTaskMileStone" style="border-color: lightgrey;" disabled>--%>
                                <%--<select id="ddlAuditDepart" class="form-select color-dropdown"></select>--%>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Area Owner<span style="color: red;">*</span></label>
                            <a href="#" data-bs-toggle="tooltip" title="Select the owner who will be auditing this area"><i class="fa-regular fa-circle-question"></i></a>
                            <div class="">
                                <%--<input class="form-control" type="text" value="" id="txtNameTaskMileStone" style="border-color: lightgrey;" disabled>--%>
                                <select id="ddlAuditor1" class="form-select color-dropdown">
                                    <option value="none" selected="">None</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label class="col-form-label label-custom" for="basic-default-name">Priority</label>
                            <div>
                                <select id="ddlAreaPriority" class="form-select color-dropdown">
                                    <option value="none" selected>None</option>
                                    <option value="Urgent">Urgent</option>
                                    <option value="Important">Important</option>
                                    <option value="Medium">Medium</option>
                                    <option value="Low">Low</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <label class="col-form-label label-custom" for="basic-default-name">Status</label>
                            <div>
                                <select id="ddlAreaStatus" class="form-select color-dropdown">
                                    <option value="none" selected>None</option>
                                    <option value="Assigned">Assigned</option>
                                    <option value="Started">Started</option>
                                    <option value="Completed">Completed</option>
                                    <option value="Cancelled">Cancelled</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Start Date <span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="StartDateArea" placeholder="Select Start Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
                            </div>
                        </div>

                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">End Date <span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="DueDateArea" class="form-control flatpickr-input active" style="background: white;" placeholder="Select End Date" readonly="readonly">
                                <%--<input type="text" id="DueDateMStone" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">--%>
                            </div>
                        </div>
                    </div>
                    <%--<div class="row">
                        <div class="col-12">
                            <label class="col-form-label label-custom" for="basic-default-name">Link Observations</label>
                                <div>
                                    <select id="ddlObservations" class="form-select color-dropdown" multiple>
                                        
                                    </select>
                                </div>
                        </div>

                    </div>--%>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-close-event-modal" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnAddAuditArea">Create</button>
                </div>
            </div>
        </div>
    </div>

     <%--ADD Audit Observation--%>
    <div class="modal fade" id="AddObservationaModal" tabindex="-1" aria-hidden="true">
         <div class="modal-dialog modal-xl" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title" id="lbladdObsModal">Create New Observation</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                 </div>
                 <div class="modal-body proj-popup">

                     <div class="row">
                         <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Area<span style="color: red;">*</span></label>
                             <div class="">
                                  <select id="ddlAreas" class="form-select color-dropdown">
                                    <option value="None" selected>Select Area</option>
                                </select>
                             </div>
                        </div>
                         <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Risk</label>
                             <div class="">
                                  <select id="ddlRisks" class="form-select color-dropdown">
                                    <option value="None" selected>Select Risks</option>
                                </select>
                             </div>
                        </div>
                         <div class="col-4">
                             <label for="html5-number-input" class="col-form-label label-custom">Observation Name<span style="color: red;">*</span></label>
                             <div class="">
                                 <input type="text" id="txtObsName" placeholder="Enter observation name" class="form-control" />
                             </div>
                         </div>
                        <%--<a href="#" data-bs-toggle="tooltip" title="Tooltip"><i class="fa-regular fa-circle-question"></i></a>--%>
                        <div class="col-5">
                            <label for="html5-number-input" class="col-form-label label-custom">Observation Owner<span style="color: red;">*</span></label>
                            <select id="ddlAuditor2" class="form-select color-dropdown">
                                <option value="none" selected="">None</option>
                            </select>
                            <%--<div class="">
                                <input type="text" id="ddlObsOwner" placeholder="Enter observation owner name" class="form-control" />
                            </div>--%>
                        </div>
                         <div class="col-3">
                            <label class="col-form-label label-custom" for="basic-default-name">Status</label>
                            <div>
                                <select id="ddlObsStatus" class="form-select color-dropdown">
                                    <option value="None" selected>Select Status</option>
                                    <option value="Assigned">Assigned</option>
                                    <option value="Started">Started</option>
                                    <option value="Completed">Completed</option>
                                    <option value="Cancelled">Cancelled</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12">
                            <label class="col-form-label label-custom" for="basic-default-name">Observation Details<span style="color: red;">*</span></label>
                            <div>
                                <textarea class="form-control" id="taObsDeets" rows="4" placeholder="Type observation details here..."></textarea>
                            </div>
                        </div>
                          <div class="col-4">
                             <label for="html5-number-input" class="col-form-label label-custom">Impact<span style="color: red;">*</span></label>
                             <div class="">
                                 <select id="ddlObsConsA" class="form-select color-dropdown">
                                    <option value="None" selected>Select Impact</option>
                                    <option value="Low">Low</option>
                                    <option value="Possible">Possible</option>
                                    <option value="Moderate">Moderate</option>
                                    <option value="High">High</option>
                                </select>
                             </div>
                         </div>
                        <div class="col-4">
                             <label for="html5-number-input" class="col-form-label label-custom">Likelihood<span style="color: red;">*</span></label>
                             <div class="">
                                  <select id="ddlObsConsB" class="form-select color-dropdown">
                                    <option value="None" selected>Select Likelihood</option>
                                    <option value="Low">Low</option>
                                    <option value="Possible">Possible</option>
                                    <option value="Moderate">Moderate</option>
                                    <option value="High">High</option>
                                </select>
                             </div>
                         </div>
                        <div class="col-4">
                             <label for="html5-number-input" class="col-form-label label-custom">Risk Rating<span style="color: red;">*</span></label>
                             <div class="">
                                  <select id="ddlObsConsAxB" class="form-select color-dropdown">
                                    <option value="None" selected>Select Risk Rating</option>
                                    <option value="Low">Low</option>
                                    <option value="Possible">Possible</option>
                                    <option value="Moderate">Moderate</option>
                                    <option value="High">High</option>
                                </select>
                             </div>
                         </div>
                         <div class="col-6">
                             <label for="html5-number-input" class="col-form-label label-custom">Responsibility<span style="color: red;">*</span></label>
                             <div class="">
                                 <input type="text" id="txtObsResp" class="form-control" placeholder="Enter responsibility"/>
                             </div>
                         </div>
                         <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Entity<span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="txtObsEntity" class="form-control" placeholder="Enter entity"/>
                            </div>
                        </div>
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Recommendations<span style="color: red;">*</span></label>
                            <div class="">
                                <textarea type="text" id="taObsRecom" class="form-control" rows="4" placeholder="Type recommendations here..."></textarea>
                            </div>
                        </div>
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Action Plan/Auditee Feedback<span style="color: red;">*</span></label>
                            <div class="">
                                <textarea type="text" id="taObsPlan" class="form-control" rows="4" placeholder="Type Action Plan/Auditee Feedback here..."></textarea>
                            </div>
                        </div>
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Audit Counter Remarks<span style="color: red;">*</span></label>
                            <div class="">
                                 <input type="text" id="txtObsRemarks" class="form-control" placeholder="Enter entity"/>
                            </div>
                        </div>

                         <div class="col-4">
                             <label for="html5-number-input" class="col-form-label label-custom">Target Date<span style="color: red;">*</span></label>
                             <div class="">
                                 <input type="text" id="dateTarget" class="form-control flatpickr-input active" style="background: white;" placeholder="Select End Date" readonly="readonly">
                             </div>
                         </div>
                    </div>
                 </div>

                 <div class="modal-footer">
                     <button type="button" class="btn btn-closepu" data-bs-dismiss="modal">Close</button>
                     <button type="button" class="btn btn-primary btnAddAuditObs">Create</button>
                 </div>
             </div>
         </div>
     </div>

    <%--ADD Audit Risk--%>
    <div class="modal fade" id="AddRiskModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lbladdRiskModal">Add New Risk in Audit</h5>
                    <button type="button" class="btn-close btn-close-event-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                    <div class="" style="margin-top: 0%;">
                        <table class="table rcm-list" style="width: 100%; border-color: inherit; border-style: none !important; border-width: 0;">
                            <%--<caption class="ms-4">List of Projects</caption>--%>
                            <thead>
                                <tr style="text-align: center;">
                                    <th scope="col" style="width: 4%;">Select</th>
                                    <th scope="col">RCM Code</th>
                                    <th scope="col">Risk Name</th>
                                    <th scope="col">Risk Description</th>
                                    <th scope="col">Risk Impact</th>
                                    <th scope="col">Risk Likelihood</th>
                                    <th scope="col">Risk Occurrence Responsibility</th>
                                    <th scope="col">Control Name</th>
                                    <th scope="col">Control Description</th>
                                    <th scope="col" style="">Control Objective</th>
                                </tr>
                            </thead>
                            <tbody class="rcm-list-tbody" style="text-align: center; font-size: 12px;">
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-close-event-modal" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnAddAuditRisk">Add</button>
                </div>
            </div>

            
        </div>
    </div>

     <%--ADD Audit Requirement--%>
    <div class="modal fade" id="AddRequirementModal" tabindex="-1" aria-hidden="true">
         <div class="modal-dialog modal-xl" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title" id="lbladdReqModal">Create New Requirement</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                 </div>
                 <div class="modal-body proj-popup">

                     <div class="row">
                         <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Requirement Name<span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="txtReqName" placeholder="Enter requirement name" class="form-control" />
                            </div>
                        </div>
                        <div class="col-6">
                             <label for="html5-number-input" class="col-form-label label-custom">Requirement Owner<span style="color: red;">*</span></label>
                             <select id="ddlAuditor3" class="form-select color-dropdown">
                                 <option value="none" selected="">None</option>
                             </select>
                        </div>
                         <div class="col-12">
                            <label class="col-form-label label-custom" for="basic-default-name">Requirement Details<span style="color: red;">*</span></label>
                            <div>
                                <textarea class="form-control" id="taReqDeets" rows="4" placeholder="Type requirement details here..."></textarea>
                            </div>
                        </div>
                         <div class="col-4">
                            <label for="html5-number-input" class="col-form-label label-custom">Requested Date <span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="DueDateReq" class="form-control flatpickr-input active" style="background: white;" placeholder="Select End Date" readonly="readonly">
                            </div>
                         </div>
                         
                        <%--<a href="#" data-bs-toggle="tooltip" title="Tooltip"><i class="fa-regular fa-circle-question"></i></a>--%>
                       
                         <div class="col-4">
                            <label class="col-form-label label-custom" for="basic-default-name">Status<span style="color: red;">*</span></label>
                            <div>
                                <select id="ddlReqStatus" class="form-select color-dropdown">
                                    <option value="none" selected>Select Status</option>
                                    <option value="Open">Open</option>
                                    <option value="Close">Closed</option>
                                </select>
                            </div>
                        </div>
                        
                          <div class="col-4">
                             <label for="html5-number-input" class="col-form-label label-custom">Priority<span style="color: red;">*</span></label>
                             <div class="">
                                 <select id="ddlReqPriority" class="form-select color-dropdown">
                                    <option value="none" selected>None</option>
                                    <option value="Urgent">Urgent</option>
                                    <option value="Important">Important</option>
                                    <option value="Medium">Medium</option>
                                    <option value="Low">Low</option>
                                </select>
                             </div>
                         </div>
                         <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Area</label>
                             <div class="">
                                  <select id="ddlAreas1" class="form-select color-dropdown">
                                    <option value="None" selected>Select Area</option>
                                </select>
                             </div>
                        </div>
                         <div class="col-12"></div>
                         <div class="col-6">
                             <label for="html5-number-input" class="col-form-label label-custom">Comments</label>
                             <div class="">
                                 <textarea type="text" id="taReqComments" class="form-control" rows="4" placeholder="Type your comments here..."></textarea>
                             </div>
                         </div>
                    </div>
                 </div>

                 <div class="modal-footer">
                     <button type="button" class="btn btn-closepu" data-bs-dismiss="modal">Close</button>
                     <button type="button" class="btn btn-primary btnAddRequirement">Create</button>
                 </div>
             </div>
         </div>
     </div>

    <%--DELETE CONFIMATION MODAL--%>
    <div class="modal fade" id="deleteModal" style="background-color:#00000070;" tabindex="-1" aria-labelledby="deelteModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
    
          <div class="modal-body" style="text-align:center;">
              <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
              <div><h3>Are you sure?</h3></div>
            <span class="dSentence"></span>
            
          </div>
          <div class="modal-footer">
          <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary btn-delete-y" data-bs-dismiss="modal">Delete</button>
              </div>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="escalationModal" style="background-color:#00000070;" tabindex="-1" aria-labelledby="deelteModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
    
          <div class="modal-body" style="text-align:center;">
              <div>
                  <svg xmlns="http://www.w3.org/2000/svg" width="5em" height="5em" viewBox="0 0 24 24">
	                   <path fill="#ddc136" d="M3 19V5q0-.825.588-1.412T5 3h2q.825 0 1.413.588T9 5v14q0 .825-.587 1.413T7 21H5q-.825 0-1.412-.587T3 19m14.175-6H12q-.425 0-.712-.288T11 12t.288-.712T12 11h5.175l-.9-.9Q16 9.825 16 9.413t.3-.713q.275-.275.7-.275t.7.275l2.6 2.6q.3.3.3.7t-.3.7l-2.6 2.6q-.275.275-.687.288T16.3 15.3q-.275-.275-.275-.7t.275-.7zM12 5q-.425 0-.712-.288T11 4t.288-.712T12 3t.713.288T13 4t-.288.713T12 5m4 0q-.425 0-.712-.288T15 4t.288-.712T16 3t.713.288T17 4t-.288.713T16 5m4 0q-.425 0-.712-.288T19 4t.288-.712T20 3t.713.288T21 4t-.288.713T20 5m-8 16q-.425 0-.712-.288T11 20t.288-.712T12 19t.713.288T13 20t-.288.713T12 21m4 0q-.425 0-.712-.288T15 20t.288-.712T16 19t.713.288T17 20t-.288.713T16 21m4 0q-.425 0-.712-.288T19 20t.288-.712T20 19t.713.288T21 20t-.288.713T20 21" />
                  </svg>
                  
                  <%--<i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>--%>
                    <div><h3>Are you sure you want to escalate?</h3></div>
                    <span class="drequirementName"></span>
                  <div class="col-6">
                    <label for="html5-number-input" class="col-form-label label-custom">Comments</label>
                    <div class="">
                        <textarea type="text" id="taEscComments" class="form-control" rows="4" placeholder="Type your comments here..."></textarea>
                    </div>
                </div>
                <div class="col-4">
                    <label for="html5-number-input" class="col-form-label label-custom">Escalation Level<span style="color: red;">*</span></label>
                    <div class="">
                        <select id="ddllevel" class="form-select color-dropdown">
                           <option value="Low" selected>Low</option>
                           <option value="Medium">Medium</option>
                           <option value="high">High</option>
                       </select>
                    </div>
                </div>
            </div>
          <div class="modal-footer">
          <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
            <button type="button" class="btn btn-primary btn-escalate">Yes</button>
              </div>
          </div>
        </div>
      </div>
    </div>

    <input type="hidden" value="0" id="hfId" />
    <asp:HiddenField ID="hfAttachId" runat="server" />
    <asp:HiddenField ID="hfServerMapPth" runat="server" />
    <script type="text/javascript">
        var currUserId = '';
        var EmpNo = '';
        var myrole = '';
        var overAllPerfo = 0;
        var actIDForAttach = 0;
        var rolesList = '';
        

        var loggedInUserName = '';
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            actIDForAttach = $('#<%=hfAttachId.ClientID%>');
            
            myroleList = '<%=Session["CurrentUserRolesList"]%>';

        });
    </script>

    <script src="Scripts/risk-control.js?v=1.3"></script>
    <script src="Scripts/audit-calendar.js?v=1.3"></script>
   

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js" integrity="sha512-GWzVrcGlo0TxTRvz9ttioyYJ+Wwk9Ck0G81D+eO63BaqHaJ3YZX9wuqjwgfcV/MrB2PhaVX9DkYVhbFpStnqpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

    <script src="../Calendar/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../Calendar/dist/js/adminlte.min.js"></script>
    <script src="../Calendar/plugins/moment/moment.min.js"></script>


    <link rel="stylesheet" href="../Calendar/plugins/fullcalendar/main.css">
    <script src="../Calendar/plugins/fullcalendar/main.js"></script>
    <%--<script src="fullcalendar-6.1.10/dist/index.global.js"></script>--%>

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <script src="../Dashboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>


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


    <script src="https://phpcoder.tech/multiselect/js/jquery.multiselect.js"></script>
    <link rel="stylesheet" href="https://phpcoder.tech/multiselect/css/jquery.multiselect.css">
    
</asp:Content>




