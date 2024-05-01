<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="CalendarMaster.aspx.cs" Inherits="Collection_CalendarMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <%--<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">--%>

    <%--<link rel="stylesheet" href="plugins/fullcalendar/main.css">--%>
    <link rel="stylesheet" href="../Calendar/plugins/fullcalendar/main.css">
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">   

    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <style>
        .alert-info {
       color: #902424 !important;
    background: #d75d191c !important;
    border-color: #f8b884 !important;
}
        .not-allowed-cursor{
            cursor: not-allowed;
        }
        .toast-success {
            /*background-color: #51A351;*/
            /*background-color: #059b05;*/
            /*background-color: #9ebf1d;*/
            background-color: #92b700 !important;
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

        .blink {
            animation: blink-animation 1s steps(10, start) infinite;
            -webkit-animation: blink-animation 1s steps(10, start) infinite;
        }

        @keyframes blink-animation {
            to {
                visibility: hidden;
            }
        }

        @-webkit-keyframes blink-animation {
            to {
                visibility: hidden;
            }
        }

        .external-event {
            box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 20%);
            border-radius: 0.25rem;
            cursor: move;
            font-weight: 700;
            margin-bottom: 10px;
            padding: 10px 10px;
        }

        .nav-tabs .nav-item .nav-link:hover, .nav-tabs .nav-item .nav-link:focus {
            color: #ffffff;
            background: #e14b4b;
        }

        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #ffffff;
            background: #e14b4b;
            border-color: #fff;
        }

        .label-custom {
            color: #d4432c !important;
            font-weight: 500 !important;
            text-transform: capitalize;
            /*padding-top: 3px;*/
        }

        .btn-primary:hover {
            color: #fff;
            background-color: #d54832;
            border-color: #d54832;
        }

        .btn-primary {
            color: #fff;
            background-color: #d54832;
            border-color: #d54832;
        }

        .hidden {
            display: none;
        }

        .general-visit {
            border-color: #84b50ee0;
            background-color: #84b50ee0;
            color: white;
        }

        .customer-visit {
            border-color: #ff9900e0;
            background-color: #ff9900e0;
            color: white;
        }

        .project-visit {
            border-color: #076e7ede;
            background-color: #076e7ede;
            color: white;
        }

        .surveyy {
            border-color: #215b9be3;
            background-color: #215b9be3;
            color: white;
        }

        .fin-visit {
            border-color: #dc3545e8;
            background-color: #dc3545e8;
            color: white;
        }

        .office {
            border-color: #252626de !important;
            background-color: #252626de !important;
            color: white;
        }
        .collection{
            border-color: rgba(37, 140, 9, 0.84);
            background-color: rgba(37, 140, 9, 0.84);
            color: white;
        } .follow-up{
            border-color: #37b2d7e3;
            background-color: #37b2d7e3;
            color: white;
        } .others{
            border-color: #d78837e3;
            background-color: #d78837e3;
            color: white;
        }
        .table th {
            background-color: #a92828;
            color: white !important;
        }

        #DataTables_Table_0_paginate .current {
            color: white !important;
            background: #a92828 !important;
        }

        .iconClassExcel {
            margin-left: 8px;
            background: #933737;
        }

            .iconClassExcel:hover {
                background: #a54141;
            }

        .select2-selection select2-selection--single {
            height: 32%;
        }

        .dis-div1 {
            position: absolute;
            background: #c99e9e57;
            z-index: 99999999;
            margin-top: .5%;
            transition: .2s;
            box-shadow: 1px 1px 2px #bb909057;
        }

        .recur-icon:hover {
            transform: scale(1.5) !important;
            transition: .3s;
            /*transform: rotate(360deg)*/
            /*background-color: #b31c27;*/
        }

        .del-act-icon:hover {
            transform: scale(1.5) !important;
            transition: .3s;
            /*background-color: #b31c27;*/
        }

        #recurModal .nav-tabs .nav-link.active {
            border-left: 5px solid #9d5de3;
            background: transparent;
            color: #383232;
        }

        .nav-align-left .nav-tabs .nav-item:first-child .nav-link {
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
        }

        @media (min-width: 1200px) {
            .modal-xl {
                max-width: 1675px;
            }
        }

        @media (min-width: 992px) {
            #optOtherDetModal .modal-lg, .modal-xl {
                max-width: 1450px;
            }
        }
        .fa-icon-hoverc:hover{
                color: #d33a3a;
    cursor: pointer;
    font-size: xx-large;
    transition: .3s;
}
        }
        /*@media (min-width: 576px){
    .modal-dialog {
    max-width: 939px;
    margin: 8.75rem auto;
}}*/

        .tbody-revenue-table {
            font-size: small;
        }

            .tbody-revenue-table select {
                font-size: small;
            }

            .tbody-revenue-table textarea {
                font-size: small;
            }

            .tbody-revenue-table text {
                font-size: small;
            }

        .ddl-disable-custom {
            background: #d6d1d152 !important;
        }
        /*.icon-btn-save-opp:hover {margin-top: 5px;}*/
        .ui-datepicker-calendar {
            display: none;
        }
        .sforecast-table tr:hover{
            cursor:pointer;
        }
        .active-tr{
                border-left: 3px solid #db2f2f99 !important;
            }
        .sforecast-table tr{
font-size: small;
}
               .sforecast-table th{
font-size: smaller;
}   
      .tbody-sforecast-revenue-table tr{
font-size: small;
}
   .sforecast-revenue-table th{
font-size: 67%;
}

   .tbody-sforecast-revenue-table tr td{
       padding-top: 0em;
       text-align:center;
   }
   .save-forecastiproducts:hover{
       background-color:#ff310040;
       /*color:#ff310040;*/
   }

   .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
    background-color: #e70404c9;
    border-color: #e70404c9;
    box-shadow: 0 2px 4px 0 rgb(255 105 105 / 40%);
}
   #EventModal {
    overflow-x: hidden;
    overflow-y: auto;
}
   .icon-largehover:hover {
    transform: scale(1.5) !important;
    transition: .3s;
    /* transform: rotate(360deg); */
    /* background-color: #b31c27; */
}

   #ulAttendees li{
       padding: 6px;
    /* border: #00887d solid 1px; */
    background: #de6042f5;
    color: white;
    /* width: 37%; */
    border-radius: 3px;
    margin-top: 3px;
    box-shadow: 1px 0px 2px #de6042f5;
    
   }
   #ulAttendees{       
       height: 350px;
       max-height: 350px;
    overflow-y: auto;
    overflow-x:hidden;
   }
   .fa-hover:hover{
       color:lightcoral;
   }
   #ulActInvitationsReq li{
       cursor:pointer;
   }
   #ulActInvitationsReq li:hover{
       color:orangered;
   }
   #InviReqModal label{
       color:#dc3545;
   }

   /*adjust the close button */
   .select2-container--default .select2-selection--multiple .select2-selection__choice__display {
    cursor: default;
    padding-left: 12px !important;
    padding-right: 5px;
    color:#d4432c;

}
   /*dad*/
   .select2-container--default .select2-dropdown .select2-search__field:focus, .select2-container--default .select2-search--inline .select2-search__field:focus { 
    outline: 0;
    border: 1px solid #ffffff00;
}

   .select2-container--default.select2-container--focus .select2-selection--multiple {
    border: solid #d4591fb3 1px !important;
    outline: 0;
}
   .ddl-acc-child-div{
       max-height:110px;
       overflow-y:auto;
       /*position: relative;
    top: 45%;*/
   }
   .verified-label-box{
       background: #f35306e0;
       float: right;
    border: 1px solid;
    border-radius: 50%;
    width: 17px;
    text-align: center;
    height: 19px;
    margin-top: 5px;
    /* vertical-align: -24px; */
    line-height: 14px;
    /* color: green; */
    /* text-shadow: 1px 1px 2px #acff61;
   }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div style="padding-left: 2%; padding-top: 1%;">

            <div class="pull-left">
                <h4 style="text-shadow: 1px 6px 13px; color: #a92828;">Calendar </h4>
            </div>


        </div>


        <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
            <tr>

                <td class="no-border  label-alignment" style="width: 3%">
                    <asp:Label ID="Label8" Text="Company" runat="server" Font-Size="Medium" Font-Bold="true" />
                </td>
                <td class="no-border" style="width: 12%">
                    <select id="ddlCompany" class="form-select color-dropdown hidden">
                    </select>
                    
                    <select id="ddlCompanyCol" class="form-select color-dropdown"> </select>
                </td>


                <td class="no-border label-alignment" style="width: 1%"></td>
                <td class="no-border  label-alignment" style="width: 3%">
                    <asp:Label ID="Label10" Text="Manager" runat="server" Font-Size="Medium" Font-Bold="true" />
                </td>
                <td class="no-border" style="width: 12%">
                    <select class="form-select placement-dropdownc hidden" id="ddlManager"></select>
                    <select class="form-select placement-dropdown" id="ddlManagerCol"></select>
                </td>

                <td class="no-border label-alignment" style="width: 1%"></td>
                <td class="no-border  label-alignment" style="width: 5%">
                    <asp:Label ID="Label11" Text="Supervisor" runat="server" Font-Size="Medium" Font-Bold="true" />
                </td>
                <td class="no-border" style="width: 12%">
                    <select class="form-select placement-dropdown" id="ddlSup"></select>
                </td>

                <td class="no-border label-alignment" style="width: 1%"></td>
                <td class="no-border  label-alignment" style="width: 5%">
                    <asp:Label ID="Label1" Text="Collector" runat="server" Font-Size="Medium" Font-Bold="true" />
                </td>
                <td class="no-border" style="width: 12%">
                    <select class="form-select placement-dropdown" id="ddlColl"></select>
                </td>

                <td class="no-border" style="width: 5%">

                    <input type="button" id="btnSearch" value="Search" class="btn btn-primary d-block" style="font-size: small" />
                </td>
                <td style="width: 1%"><i class="fa fa-file-excel-o cal-week-rep-btn" style="cursor: pointer; font-size: xx-large; color: #d54832;" aria-hidden="true" title="Generate Report"></i></td>
            </tr>
        </table>

        <div id="content"></div>

        <div class="card-body">


            <div class="hold-transition sidebar-mini" style="margin-top: .5%">

                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-2">
                                <div class="sticky-top mb-3">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">Collection Activities</h4>
                                        </div>
                                        <div class="card-body" style="padding-top: 5%">
                                            <!-- the events -->
                                            <div id="external-events">
                                                <div class="external-event office hidden">Office</div>
                                                <div class="external-event general-visit hidden">General Visit</div>
                                                <div class="external-event customer-visit hidden">Customer Visit</div>
                                                <div class="external-event project-visit hidden">Project Visit</div>
                                                <div class="external-event bg-danger hidden">Finalization Visit</div>
                                                <div class="external-event surveyy hidden">Survey</div>
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
                                    <!-- /.card -->
                                    <%-- <div class="card">
                                         <div class="card-header">
                                             <h3 class="card-title">Create Event</h3>
                                         </div>
                                         <div class="card-body">
                                             <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                                                 <ul class="fc-color-picker" id="color-chooser">
                                                     <li><a class="text-primary" href="#"><i class="fas fa-square"></i></a></li>
                                                     <li><a class="text-warning" href="#"><i class="fas fa-square"></i></a></li>
                                                     <li><a class="text-success" href="#"><i class="fas fa-square"></i></a></li>
                                                     <li><a class="text-danger" href="#"><i class="fas fa-square"></i></a></li>
                                                     <li><a class="text-muted" href="#"><i class="fas fa-square"></i></a></li>
                                                 </ul>
                                             </div>
                                            
                                             <div class="input-group">
                                                 <input id="new-event" type="text" class="form-control" placeholder="Event Title">

                                                 <div class="input-group-append">
                                                     <button id="add-new-event" type="button" class="btn btn-primary">Add</button>
                                                 </div>
                                                
                                             </div>
                                             
                                         </div>
                                     </div>--%>
                                </div>
                                <div style="max-height:300px; overflow-y:auto;"> <h4 style="text-align: center;border-bottom: 1px solid;">Invitation List</h4>
                                    <ul id="ulActInvitationsReq">                                        
                                    </ul>
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-md-10">
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


    <div class="modal fade" id="EventModal" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eventModalHeading"></h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body" style="min-height: 400px;">

                    <div class="nav-align-top">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <button type="button" class="nav-link active liFirst" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-home" aria-controls="navs-top-home" aria-selected="true">Activity Summary</button>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="nav-link liSecond not-allowed-cursor" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-profile" aria-controls="navs-top-profile" aria-selected="false" disabled><span class="liSecondText">Related Opportunity</span></button>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="nav-link liThird not-allowed-cursor" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-related-project" aria-controls="navs-top-related-project" aria-selected="false" disabled>Related Project</button>
                            </li>
                             <li class="nav-item">
                                <button type="button" class="nav-link liFour not-allowed-cursor" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-attendees" aria-controls="navs-top-attendees" aria-selected="false" disabled>Attendees</button>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="nav-link liFive not-allowed-cursor" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-attachment" aria-controls="navs-top-attachment" aria-selected="false" disabled>Attachment</button>
                            </li>
                            <span style="position: relative; left: 27%;" class="lbl-act-status"></span>
                        </ul>
                        <div class="tab-content" style="min-height: 550px;">                            

                            <div class="tab-pane fade show active" id="navs-top-home" role="tabpanel">
                                <%--1--%>
                                <div class="row" style="height: 40px;">
                                <div class="del-act-icon-div col-1 hidden"><span><i class="fa fa-refresh recur-icon " style="float: left; font-size: x-large; color: #4b95e1; cursor: pointer;" aria-hidden="true" title="Repeat Activity"></i></span></div>
                                    <div class="info-msg-div col-10" style="top: -22%;"></div>
                                <div class="del-act-icon-div col-1"><span><i class="fa fa-trash-o del-act-icon" aria-hidden="true" style="float: right; font-size: x-large; color: #e14b4b; cursor: pointer;"></i></span></div>
                            </div>
                                <div class="row">

                                    <div class="col-6">
                                        <label class="col-form-label label-custom" for="basic-default-name">Type</label>
                                        <div class="">
                                            <select id="txtType" class="form-select color-dropdown">                                               
                                                <option value="Collection">Collection</option>
                                                <option value="Follow up">Follow up</option>
                                                <option value="Others">Others</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="col-6">
                                        <label for="html5-number-input" class="col-form-label label-custom">Customer <span style="color: red;">*</span></label>
                                        <div class="">
                                            <input class="form-control" type="text" value="" id="txtSubject" />
                                        </div>
                                    </div>


                                </div>

                                <div class="row">

                                    <div class="col-6">

                                        <label for="html5-time-input" class=" col-form-label label-custom">From Date</label>
                                        <div class="row">
                                            <div class="col-8">
                                                <input type="text" id="weeklyDatePickerStart" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
                                            </div>
                                            <div class="col-4" style="top: -38px;">
                                                <label for="html5-time-input" class=" col-form-label label-custom">From Time</label>
                                                <input class="form-control" type="time" value="12:30:00" id="from-timepicker" />
                                            </div>
                                        </div>

                                    </div>

                                    <div class="col-2">

                                        <label for="html5-time-input" class=" col-form-label label-custom">To Time</label>
                                        <div class="row">
                                            <div class="col-1">
                                                <input type="text" id="weeklyDatePickerEnd" placeholder="Select Date" style="background: white; display: none;" class="form-control flatpickr-input active" readonly="readonly">
                                            </div>
                                            <div class="col-11">
                                                <input class="form-control" type="time" value="12:30:00" id="to-timepicker" />
                                            </div>
                                        </div>

                                    </div>

                                    <div class="col-4">
                                        <label class="col-form-label label-custom" for="basic-default-name">Status</label>
                                        <div>
                                            <select id="ddlActStatus" class="form-select color-dropdown">
                                                <option value="PENDING" selected>PENDING</option>
                                                <option value="COMPLETED">COMPLETED</option>
                                            </select>
                                        </div>
                                    </div>


                                </div>

                                <div class="row">
                                 
                                    <div class="ddlAccIDDiv" style="width: 27%">
                                        <label for="html5-number-input " class="col-form-label label-custom">Account No</label>
                                        <div class="">
                                            <%--//<input class="form-control" type="text" value="" id="txtAccountId" />--%>                                           
                                                <select id="ddlAccID" class="form-select color-dropdown ddlAccID">
                                                </select>                                           
                                        </div>
                                    </div>

                                    <div style="width:7%" class="add-proj-for-GV-only hidden">
                                        <label for="html5-number-input " class="col-form-label label-custom" style="font-size: small;">Add Project</label>
                                        <%--<i class="fa fa-info-circle icon-show-added-proj" aria-hidden="true" style=" color: #1397f9; cursor: pointer;"></i>--%>
                                        <div><input type="checkbox" style="margin-left: 0rem !important;" class="form-check-input cb-add-proj" /></div>

                                    </div>

                                    <div class="" style="width: 27%">
                                        <label for="html5-number-input" class="col-form-label txtProjIdDiv label-custom">Project No</label>
                                        <div class="txtProjIdDiv">                                           
                                            <select class="form-select placement-dropdown ddlProjects" id="ddlProjects"></select>                                            
                                        </div>

                                         <div class="txtProjIdMultiDiv ddl-acc-child-div hidden">                                           
                                              <select id="ddlProjectsMulti" class="form-select color-dropdown ddlProjectsMulti" multiple>
                                                </select>                                            
                                        </div>
                                    </div>

                                     <div style="width:10%" class="add-opt-for-GV-only hidden">
                                        <label for="html5-number-input " class="col-form-label label-custom" style="font-size: small;">Add Opportunity</label>
                                        <%--<i class="fa fa-info-circle icon-show-added-proj" aria-hidden="true" style=" color: #1397f9; cursor: pointer;"></i>--%>
                                        <div><input type="checkbox" style="margin-left: 0rem !important;" class="form-check-input cb-add-opp" /></div>

                                    </div>

                                    <div class="" style="width: 29%">
                                        <label for="html5-number-input" class="col-form-label txtOppIdDiv label-custom">Opportunity No</label>
                                        <div class="txtOppIdDiv">
                                            <select class="form-select placement-dropdown ddlOpt" id="ddlOpt"></select>
                                        </div>

                                        <div class="txtOppIdMultiDiv ddl-acc-child-div hidden">                                           
                                              <select id="ddlOptMulti" class="form-select color-dropdown ddlOptMulti" placeholder="Select Opportunity" multiple>
                                                </select>                                            
                                        </div>
                                    </div>

                                </div>
                                
                                <%--<div class="row cv-parent-div hidden">
                                    <hr style="margin-top:15px;"/>
                                    <div class="col-4">
                                        <label for="html5-number-input " class="col-form-label label-custom">% of Relation with Account <span style="color: red;">*</span></label>
                                        <div class="">
                                            <div>
                                                <input class="form-control" type="text" value="" id="txtPercWithCust" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57"/>
                                            </div>
                                        </div>
                                    </div>                                   

                                    <div class="col-4">
                                        <label for="html5-number-input" class="col-form-label label-custom">Customer Assessment <span style="color: red;">*</span></label>
                                        <div class="">
                                            <textarea class="form-control" id="taCustAssess" rows="2" placeholder="Enter Customer Assessment"></textarea>
                                        </div>
                                    </div>

                                     <div class="col-4">
                                        <label for="html5-number-input" class="col-form-label label-custom">Customer Status <span style="color: red;">*</span></label>
                                        <div class="">

                                            <select id="ddlCustStatus" class="form-select color-dropdown">
                                                <option value="-1" selected>--- Select ---</option>                                             
                                                <option value="NEW_CUSTOMER">New Customer</option>                                          
                                                <option value="BLACK_LIST">Black List </option>
                                                <option value="WORKING_WITH_US">Working With Us </option>                                              
                                            </select>

                                        </div>
                                    </div>
                                    <hr style="margin-top:15px;" />
                                </div>--%>
                                <div class="row">
                                    <hr style="margin-top:15px;"/>
                                    <div class="col-4">
                                        <label for="html5-number-input " class="col-form-label label-custom">Amount To be Collected <%--<span style="color: red;">*</span>--%></label>
                                        <span class="icon-update-total-amount hidden" style="color: #d54832;float: right;font-size: x-large;"><i class="fa fa-floppy-o fa-icon-hoverc icon-update-total-amount-b" title="Update Amount" aria-hidden="true"></i></span>
                                        <div class="">
                                            <div>
                                                <input class="form-control" type="text" value="" id="txtPercWithCust" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57"/>
                                            </div>
                                        </div>
                                    </div>                                   

                                    <div class="col-4  cv-parent-div hidden">
                                        <label for="html5-number-input" class="col-form-label label-custom">Collected Amount <%--<span style="color: red;">*</span>--%></label>
                                        <span class="icon-update-col-amount hidden" style="color: #d54832;float: right;font-size: x-large;"><i class="fa fa-floppy-o fa-icon-hoverc icon-update-col-amount-b" title="Update Amount" aria-hidden="true"></i></span>
                                        <div class="">
                                            <%--<textarea class="form-control" id="taCustAssess" rows="2" placeholder="Enter Customer Assessment"></textarea>--%>
                                              <input class="form-control" type="text" value="" id="taCustAssess" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57"/>
                                        </div>
                                    </div>

                                     <div class="col-4 cv-parent-div hidden">
                                        <label for="html5-number-input" class="col-form-label label-custom">Collection Status <span style="color: red;">*</span></label>
                                        <div class="">

                                            <select id="ddlCustStatus" class="form-select color-dropdown">
                                                <option value="-1" selected>--- Select ---</option>                                             
                                                <option value="FULLY_COLLECTED">Fully Collected</option>                                          
                                                <option value="PARTIALLY_COLLECTED">Partially Collected </option>
                                                <option value="FAILED">Failed/ No Collection </option>                                              
                                            </select>

                                        </div>
                                    </div>

                                    <hr style="margin-top:15px;" />
                                </div>
                                <div class="row">

                                    <div class="col-12">
                                        <label class="col-form-label label-custom" for="basic-default-name">General Remarks  <b class="blink hidden" style="color: #ff3636;">Please specify the customer name in  remarks. </b></label>
                                        <textarea class="form-control" id="taRemarks" rows="4" placeholder="Enter Remarks"></textarea>
                                    </div>

                                </div>





                                <div class="row taMOMDiv">
                                    <%--For Further Futur FollowUp--%>
                                    <div class="row r-parent">

                                        <div class="dis-div1"></div>


                                        <div class="col-6 ffDateFrom">

                                            <label for="html5-time-input" class=" col-form-label label-custom">From Date</label>
                                            <div class="row">
                                                <div class="col-8">
                                                    <input type="text" id="weeklyDatePickerStartFF" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
                                                </div>
                                                <div class="col-4" style="top: -38px;">

                                                    <label for="html5-time-input" class=" col-form-label label-custom">From Time</label>
                                                    <input class="form-control" type="time" value="12:30:00" id="from-timepickerFF" />
                                                </div>
                                            </div>

                                        </div>

                                        <%--<div class="dis-div2"></div>--%>
                                        <div class="col-2 ffDateTo">

                                            <label for="html5-time-input" class=" col-form-label label-custom">To Time</label>
                                            <div class="row">
                                                <div class="col-1">
                                                    <input type="text" id="weeklyDatePickerEndFF" placeholder="Select Date" style="background: white; display: none" class="form-control flatpickr-input active" readonly="readonly">
                                                </div>
                                                <div class="col-11">
                                                    <input class="form-control" type="time" value="12:30:00" id="to-timepickerFF" />
                                                </div>
                                            </div>

                                        </div>

                                        <div class="col-4 ffIsFuturFollow" style="text-align: center; top: 55%;">
                                            <div class="form-check form-check-info">
                                                <input class="form-check-input cbIsFuturAct" type="checkbox" value="" id="customCheckInfo" />
                                                <label class="form-check-label" for="customCheckInfo" style="color: #d4432c !important; font-weight: 500 !important; text-shadow: 2px 0px 18px;">Is Futur FollowUp </label>
                                            </div>
                                        </div>


                                    </div>

                                    <div class="col-4" style="margin-top:2%;">
                                        <label class="col-form-label label-custom" for="basic-default-name">Collector Remarks <span style="color: red;">*</span></label>
                                        <div>
                                            <textarea class="form-control" id="taMOM" rows="4" placeholder="Enter Remarks"></textarea>
                                        </div>
                                    </div>

                                    <div class="col-4" style="margin-top:2%;">
                                        <label class="col-form-label label-custom" for="basic-default-name">Supervisor Remarks <%--<span style="color: red;">*</span>--%></label>
                                        <span class="icon-update-sup-remarks hidden" style="color: #d54832;float: right;font-size: x-large;"><i class="fa fa-floppy-o fa-icon-hoverc icon-update-sup-remarks-b" title="Insert/Update Remarks" aria-hidden="true"></i></span>
                                        <div>
                                            <textarea class="form-control" id="taSupRem" rows="4" placeholder="Enter Remarks" disabled></textarea>
                                        </div>
                                    </div>

                                    <div class="col-4" style="margin-top:2%;">
                                        <label class="col-form-label label-custom" for="basic-default-name">Manager Remarks <%--<span style="color: red;">*</span>--%></label>
                                        <span class="icon-update-man-remarks hidden" style="color: #d54832;float: right;font-size: x-large;"><i class="fa fa-floppy-o fa-icon-hoverc icon-update-man-remarks-b" title="Insert/Update Remarks" aria-hidden="true"></i></span>
                                        <div>
                                            <textarea class="form-control" id="taManRem" rows="4" placeholder="Enter Remarks" disabled></textarea>
                                        </div>
                                    </div>
                                </div>

                                <br />
                                <div class="addActBtnDiv">
                                    <button type="button" id="btnAddAct" class="btn btn-primary" style="float: right;">Save</button>
                                </div>
                                <div>
                                    <button type="button" id="btnVerifyAct" class="btn btn-success hidden" style="float: right;">Verify</button>
                                </div>

                            </div>

                            <div class="tab-pane fade" id="navs-top-profile" role="tabpanel">
                                <%--2--%>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-striped opt-list-table" style="width: 99%">
                                        <%--<caption class="ms-4">List of Projects</caption>--%>
                                        <thead>
                                            <tr>

                                                <th>Opt No</th>
                                                <th>Name</th>
                                                <th>Customer</th>
                                                <th>Open Value</th>

                                                <th>Update Aging </th>
                                                <th>Overview </th>
                                                <th>Remarks </th>
                                                <th>Win % </th>
                                                <th>Actions </th>

                                                <%--<th style="width:140px">Action </th>--%>



                                                <%--    <th style="width: 10%;">Actions</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody class="tbody-pay-sch">
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="navs-top-related-project" role="tabpanel">
                                <%--3--%>
                                <div class="table-responsive" >
                                    <table class="table table-bordered table-striped proj-list-table" style="width: 99%">
                                        <%--<caption class="ms-4">List of Projects</caption>--%>
                                        <thead>
                                            <tr>

                                                <th>Project Number</th>
                                                <th>Project Name</th>
                                                <th>Consultant</th>

                                                <th>Stage</th>
                                                <th>Overview</th>
                                                <th>Remarks</th>

                                                <th>Update Aging</th>                                                
                                                <th>Actions</th>                                                
                                                
                                            </tr>
                                        </thead>
                                        <tbody class="tbody-prj">
                                        </tbody>
                                    </table>
                                </div>

                            </div>

                            <div class="tab-pane fade" id="navs-top-attendees" role="tabpanel">
                                <%--4--%>
                             <div class="row parent-attendees-div">
                                <div class="col-4 ddlAccIDDiv">
                                        <label for="html5-number-input " class="col-form-label label-custom">Attendees</label>
                                        <div class="">
                                            <%--//<input class="form-control" type="text" value="" id="txtAccountId" />--%>
                                            <div>
                                                <select id="ddlAttendees" class="form-select color-dropdown ddlAccID">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                           </div>
                     
                     <div class="row" style="top: 23px; position: relative;">
                       <div class="col-4">
                          <ul id="ulAttendees">

                          </ul>   
                           
                      </div>

                         <div class="col-8">
                             <div style="text-align:center; color:#d4432c !important"><h3 style="text-shadow: 1px 1px 14px orange;">List of Added Participants</h3></div>
                             <div style="overflow-y: auto; max-height: 390px;">
                                 <table class="table table-bordered table-striped attendees-table" style="width: 100%">
                                        <%--<caption class="ms-4">List of Projects</caption>--%>
                                        <thead>
                                            <tr>
                                                <th>Participant</th>
                                                <th>Activity</th>
                                                <th>Status</th>
                                                <th>Availability</th>
                                                <th>Created By</th>
                                                <th>Action</th>
                                                                                                                                    
                                            </tr>
                                        </thead>
                                        <tbody class="tbody-attendees">
                                        </tbody>
                                    </table>
                                 </div>
                         </div>

                    </div>
                                <div class="row parent-add-parti-div" style="margin-top: 2%; max-width: 33.333333%;"> <a class="btn btn-primary btnAddparti" style="color:white;"> <i class="fa fa-users" aria-hidden="true"></i> Add participants</a> </div>



                            </div>

                            <div class="tab-pane fade" id="navs-top-attachment" role="tabpanel">
                                <%--5--%>
                                <div class="input-group mb-3" style="position: relative; top: 10px;">
                                    <asp:FileUpload ID="FUUploadNewAttach" CssClass="form-control hidden" runat="server" multiple />
                                    <label class="input-group-text hidden" for="inputGroupFile02"><i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i></label>

                                    <input class="form-control" type="file" id="colFileUpload"  accept=".pdf,.png,.jpeg" multiple >
                                    <label class="input-group-text" for="inputGroupFile02"><i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i></label>
                                </div>
                                                               
                                <div class="input-group input-group-merge">
                                    <textarea id="txtAttachComm" class="form-control hidden" placeholder="Type your Comments…" runat="server" aria-describedby="basic-icon-default-message2"></textarea>
                                    <textarea id="taColActAttachComment" class="form-control taColActAttachComment" placeholder="Type your Comments…." aria-describedby="basic-icon-default-message2"></textarea>
                                </div>

                                <div style="padding-top: 7px;">

                                    <asp:Button ID="btnUpload" runat="server" Text="Add Attachment" Style="float: right;" OnClick="btnUpload_Click" CssClass=" btn btn-primary hidden" />
                                    <a href="#" ID="btnUpload1" Class=" btn btn-primary">Add Attachment </a> 
                                </div>

                                <div class="row" style="margin-top: 4%; max-height: 500px; overflow-y: auto;">
                                    <table class="table table-bordered table-striped attach-list-table">
                                        <thead>
                                            <tr>
                                                <th style="display: none">Id</th>
                                                <th>S.No</th>
                                                <th>File Name</th>
                                                <th style="width: 60%;">Comments</th>
                                                <th>Actions</th>

                                            </tr>
                                        </thead>
                                        <tbody class="tbody-attach-list-table">
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

    <div class="modal fade" id="delActivityPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #e7e7e759;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;"></i></div>
                    <div>
                        <h3>Are you sure?</h3>
                    </div>
                    Do you really want to delete this Activity? This process cannot be undone.
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btn-delete-act">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

      <div class="modal fade" id="delPartiPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #e7e7e759;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;"></i></div>
                    <div>
                        <h3>Are you sure?</h3>
                    </div>
                    Do you really want to delete this Participant? This process cannot be undone.
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btn-delete-participant">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


     <div class="modal fade" id="actTimeExceedModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #e7e7e759;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div><i class="fa fa-info-circle" title="View More" style="cursor: pointer;padding-right: 10px;font-size: 80px;color: #4baee1;"></i></div>
                    <div>
                        <h3>Are you sure?</h3>
                    </div>
                    <span style="color: #d54832;"> Selected time is exceeding from working hours. Do you want to Continue?</span>
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btn-yes-Act-Exceed">Yes</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

         <div class="modal fade" id="isVerifyActModal" tabindex="-1" aria-labelledby="lblisVerifyActModal" aria-hidden="true" style="background: #e7e7e759;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div><i class="fa fa-info-circle" title="View More" style="cursor: pointer;padding-right: 10px;font-size: 80px;color: #4baee1;"></i></div>
                    <div>
                        <h3>Are you sure?</h3>
                    </div>
                    <span style="color: #d54832;"> You want to verify this Activity?</span>
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btn-yes-isVerifyAct">Yes</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--recurrence modal--%>

    <div class="modal fade" id="recurModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="recurModal3">Repeat Activity</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="nav-align-left">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-home">Day</button>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-profile">Week</button>
                            </li>

                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="navs-left-align-home">


                                <div class="row">
                                    <div class="col-2"><span style="top: 6px; position: relative;">end after </span></div>
                                    <div class="col-2">
                                        <input type="number" class="form-control txt-occur-day" min="1" value="1">
                                    </div>
                                    <div class="col-2" style="top: 6px; position: relative;">Occurrences</div>
                                </div>


                            </div>

                            <div class="tab-pane fade" id="navs-left-align-profile">

                                <div>
                                    <input class="form-check-input mt-0" id="cbAllDay" type="checkbox" name="CbDaysNameAll" value="AllDay" aria-label="Checkbox for following text input" />
                                    <span>All Days</span>
                                </div>
                                <div class="row">

                                    <div class="col-3">
                                        <div class="input-group">
                                            <div class="input-group-text">
                                                <input class="form-check-input mt-0" type="checkbox" name="CbDaysName" value="0" aria-label="Checkbox for following text input">
                                            </div>
                                            <label class="form-control" aria-label="Text input with checkbox" style="width: 55% !important;">Sunday</label>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="input-group ">
                                            <div class="input-group-text">
                                                <input class="form-check-input mt-0" type="checkbox" name="CbDaysName" value="1" aria-label="Checkbox for following text input">
                                            </div>
                                            <label class="form-control" aria-label="Text input with checkbox" style="width: 55% !important;">Monday</label>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="input-group ">
                                            <div class="input-group-text">
                                                <input class="form-check-input mt-0" type="checkbox" name="CbDaysName" value="2" aria-label="Checkbox for following text input">
                                            </div>
                                            <label class="form-control" aria-label="Text input with checkbox" style="width: 55% !important;">Tuesday</label>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="input-group ">
                                            <div class="input-group-text">
                                                <input class="form-check-input mt-0" type="checkbox" name="CbDaysName" value="3" aria-label="Checkbox for following text input">
                                            </div>
                                            <label class="form-control" aria-label="Text input with checkbox" style="width: 55% !important;">Wednesday</label>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-3">
                                        <div class="input-group ">
                                            <div class="input-group-text">
                                                <input class="form-check-input mt-0" type="checkbox" name="CbDaysName" value="4" aria-label="Checkbox for following text input">
                                            </div>
                                            <label class="form-control" aria-label="Text input with checkbox" style="width: 55% !important;">Thursday</label>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="input-group">
                                            <div class="input-group-text">
                                                <input class="form-check-input mt-0" type="checkbox" name="CbDaysName" value="5" aria-label="Checkbox for following text input">
                                            </div>
                                            <label class="form-control" aria-label="Text input with checkbox" style="width: 55% !important;">Friday</label>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="input-group">
                                            <div class="input-group-text">
                                                <input class="form-check-input mt-0" type="checkbox" name="CbDaysName" value="6" aria-label="Checkbox for following text input">
                                            </div>
                                            <label class="form-control" aria-label="Text input with checkbox" style="width: 55% !important;">Saturday</label>
                                        </div>
                                    </div>

                                </div>

                                <br />
                                <div class="row">
                                    <div class="col-2"><span style="top: 6px; position: relative;">end after </span></div>
                                    <div class="col-2">
                                        <input type="number" class="form-control txt-occur-week" min="1" value="1">
                                    </div>
                                    <div class="col-2" style="top: 6px; position: relative;">Occurrences</div>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnSaveDaysAct">Ok</button>
                </div>
            </div>

        </div>
    </div>
    <%--</div>--%>


    <%--end--%>


    <%--opportunity History modal--%>

    <div class="modal fade" id="optHistoryModal" tabindex="-1" aria-hidden="true" style="background: #00000052;">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="optHistoryModalLabel4">Opportunity History</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="row" style="margin-top: 1%; max-height: 500px; overflow-y: auto;">
                        <table class="table table-bordered table-striped opt-history-table">
                            <%--<caption class="ms-4">List of Projects</caption>--%>
                            <thead>
                                <tr>
                                    <th>Overview</th>
                                    <th>Remarks</th>
                                    <th>Win Percentage</th>
                                    <th <%--style="width: 60%;"--%>>Updated Date</th>
                                    <th>Updated By</th>

                                </tr>
                            </thead>
                            <tbody class="tbody-opt-history-table">
                            </tbody>
                        </table>
                    </div>

                </div>
                <%--     <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>--%>
            </div>
        </div>
    </div>
    <%--end--%>


    <%--Opportunity other detail Modal--%>
    <div class="modal fade" id="optOtherDetModal" tabindex="-1" aria-hidden="true" style="background: #00000052;">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="optOtherDetModalLabel4">Other Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="row" style="margin-top: 1%; max-height: 500px; overflow-y: auto;">
                        <table class="table table-bordered table-striped optother-det-table">
                            <%--<caption class="ms-4">List of Projects</caption>--%>
                            <thead>
                                <tr>
                                    <th style="background: #016eaf;">Sales Manager Remarks</th>
                                    <th style="background: #016eaf;">Sales Manager Win Perc</th>
                                    <th style="background: #016eaf;">File Name</th>
                                    <th style="background: #016eaf;">Sales Manager Update Date</th>
                                    <th>Marketing Manager Overview</th>
                                    <th>Marketing Remarks</th>
                                    <th>Marketing Win Perc</th>
                                    <th>Marketing Update Date </th>

                                </tr>
                            </thead>
                            <tbody class="tbody-optother-det-table">
                            </tbody>
                        </table>
                    </div>

                </div>
                <%-- <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>--%>
            </div>
        </div>
    </div>
    <%--end--%>


    <%--Revenue History modal--%>

    <div class="modal fade" id="revenueModal" tabindex="-1" aria-hidden="true" style="background: #00000052;">
        <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="revenueModalLabel4">Revenue List</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="row" style="margin-top: 1%; max-height: 500px; overflow-y: auto;">
                        <table class="table table-bordered table-striped revenue-table">
                            <%--<caption class="ms-4">List of Projects</caption>--%>
                            <thead>
                                <tr>
                                    <th>Product Type</th>
                                    <th>Scope</th>
                                    <th>Vendor List</th>
                                    <th>Revenue Status </th>
                                    <th style="width: 12%;">Sub Stage </th>

                                    <th>Waiting Till</th>
                                    <th style="width: 12%;">Overview</th>
                                    <th>Remarks</th>
                                    <th style="width: 6%;">Win %</th>
                                    <th>VALUE</th>
                                    <th>Updated Status</th>

                                    <th>Action</th>

                                </tr>
                            </thead>
                            <tbody class="tbody-revenue-table">
                            </tbody>
                        </table>
                    </div>

                </div>
                <%--     <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>--%>
            </div>
        </div>
    </div>
    <%--end--%>


    <%--Sales Forecast modal--%>

    <div class="modal fade" id="sForecastModal" tabindex="-1" aria-hidden="true" style="background: #00000052;">
        <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="sForecastModalModalLabel4">Sales Forecast</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="row" >

                        <div class="col-4" style="border-right: 1px solid #00000040">
                            <div class="row" style="padding: 2px;">
                                <div class="col-4">
                                    <label>Opportunity No.</label></div>
                                <div class="col-8">
                                    <input type="text" class="form-control" id="txtForecastOptNo" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57" disabled></div>
                            </div>
                            <div class="row" style="padding: 2px;">
                                <div class="col-4">
                                    <label>Forecasted For</label></div>
                                <div class="col-8">
                                    <input type="text" id="weeklyDatePickerForecast" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
                                </div>
                            </div>
                            <div class="row" style="padding: 2px;">
                                <div class="col-4">
                                    <label>Forecast Amount</label></div>
                                <div class="col-8">
                                    <input type="text" class="form-control" id="txtForecastAmount" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57"></div>
                            </div>
                            <div class="row" style="padding: 2px;">
                                <div class="col-4">
                                    <label>Remarks</label></div>
                                <div class="col-8">
                                    <textarea class="form-control" id="taForecastRemarks" placeholder="Input Remarks…." aria-describedby="basic-icon-default-message2"></textarea></div>
                            </div>

                            <hr />
                            <div class="row"  style="margin-top: 1%; max-height: 435px; overflow-y: auto; padding: 4px;">

                                <table class="table table-bordered table-striped sforecast-revenue-table">
                                    <%--<caption class="ms-4">List of Projects</caption>--%>
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Product Type</th>
                                            <th>Revenue Status</th>
                                            <th>Sub Stage</th>
                                            <th>Value</th>
                                        </tr>
                                    </thead>
                                    <tbody class="tbody-sforecast-revenue-table">
                                    </tbody>
                                </table>

                            </div>

                            <div class="row" style="padding: 5px;">
                                <span style="color: Tomato; border: solid 1px;  text-align: center;  cursor: pointer; height: 42px; line-height: 37px;" class="save-forecastiproducts"> <i class="fa fa-floppy-o" aria-hidden="true"></i> Save</span>
                                <%--<button class="btn"></button>--%>
                            </div>

                        </div>


                        <div class="col-8" style="margin-top: 1%; max-height: 650px; overflow-y: auto;">
                            <table class="table table-bordered table-striped sforecast-table">
                                <%--<caption class="ms-4">List of Projects</caption>--%>
                                <thead>
                                    <tr>
                                        <th>Forecasted Month</th>
                                        <th>Forecasted Amount	</th>
                                        <th>Remarks </th>
                                        <th>Products  </th>
                                        <th>Update Date</th>

                                    </tr>
                                </thead>
                                <tbody class="tbody-sforecast-table">
                                </tbody>
                            </table>

                        </div>


                    </div>

                </div>
                <%--     <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>--%>
            </div>
        </div>
    </div>
    <%--end--%>




     <%--Request LOST modal--%>

    <div class="modal fade" id="reqLostModal" tabindex="-1" aria-hidden="true" style="background: #00000052;">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="reqLostModalLabel4">Request Lost</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="row" >

                                    <div class="col-6 ddlLostReasonDiv">
                                        <label for="html5-number-input " class="col-form-label label-custom">Lost Reason</label>
                                        <div class="">
                                            <%--//<input class="form-control" type="text" value="" id="txtAccountId" />--%>
                                            <div>
                                                <select id="ddlLostReason" class="form-select color-dropdown ddlLostReason">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                      
                                        <div class="col-6">
                                             <label for="html5-number-input " class="col-form-label label-custom">Lost Date</label>
                                                <div>
                                                    <input type="text" id="DPLostDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" >
                                                </div>
                                            </div>
                                           
                                  
                    </div>

                    <div class="row">
                         <div class="col-6 ddlCompetitorDiv">
                                        <label for="html5-number-input " class="col-form-label label-custom">Competitor</label>
                                        <div class="">
                                            <%--//<input class="form-control" type="text" value="" id="txtAccountId" />--%>
                                            <div>
                                                <select id="ddlCompetitor" class="form-select color-dropdown ddlCompetitor">
                                                </select>
                                            </div>
                                        </div>
                                    </div>


                        <div class="col-6" >                                
                                    <label for="html5-number-input " class="col-form-label label-custom">Competitor Price</label>
                                <div>
                                    <input type="text" class="form-control" id="txtCompetPrice" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57" >
                                </div>                                 
                        </div>

                    </div>

                    <div class="row">

                        <label for="html5-number-input " class="col-form-label label-custom">Salesman Notes</label>
                        <div class="col-12">
                               <textarea id="taSalesNotes" class="form-control taSalesNotes" placeholder="Type your Notes..." aria-describedby="basic-icon-default-message2"></textarea>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-12" style="padding: 5px;">
                                <span class="btnSaveLostReason btn btn-primary" style="float:right;"> <i class="fa fa-floppy-o" aria-hidden="true"></i> Save</span>
                                
                            </div>

                    </div>

                </div>
            
            </div>
        </div>
    </div>
    <%--end--%>

        <%--INvitation Modal--%>
  
<!-- Extra Large Modal -->
<div class="modal fade" id="InviReqModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="InviReqModalLabel4">Activity Invitation</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
     <%-- <div style="width: 70%; border-right: solid 1px #4740402b"> --%>
          <div class="row">
              <div class="col-8" <%--style="border-right: solid 1px #4740402b"--%>>
                   <div class="row">
            <div class="col-12"><label>Activity : </label> <span class="act-subject"> - </span></div>
            
       </div>
          <div class="row">
            <div class="col-12 act-customer-div hidden"><label>Customer : </label> <span class="act-customer"> - </span></div>
           
       </div>
          <div class="row">
            <div class="col-12 act-project-div hidden"><label>Project :</label> <span class="act-project"> - </span></div>
           
       </div>
          <div class="row">
            <div class="col-12"><label>Invited By :</label> <span class="act-invited-by"> - </span></div>
           
       </div>
              </div>

              <div class="col-4">                  
                 
                  <div class="row">
                         <div class="col-12"><label>Activity Type :</label> <span class="act-type"> - </span></div>           
                 </div>

             <div class="row">
                   <div class="col-12"><label>Activity Date : </label> <span class="act-date"> - </span></div>           
            </div>
          <div class="row">
            <div class="col-12"><label>Activity Time :</label> <span class="act-time"> - </span></div>
           
       </div>

              </div>
          </div>
       
     <%--</div>--%>

      </div>
      <div class="modal-footer parent-footer">
        <button type="button" class="btn btn-success btn-InviYes">Yes</button>
        <%--<button type="button" class="btn btn-info btn-InviMaybe">May be</button>--%>
        <button type="button" class="btn btn-danger btn-InviNo">No</button>
      </div>
    </div>
  </div>
</div>


    <%--end--%>


    <%--opt popup when user going to select underrisk for updating opportunities--%>

    <div class="modal fade" id="oppInfoModal" tabindex="-1" aria-hidden="true" style="background: #00000052;">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content oppInfoModalContent">
      <div class="modal-header">
        <h5 class="modal-title" id="oppInfoModalLabel3">OPPORTUNITY INFORMATION</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
     
          <div class="row">
              <label for="html5-number-input " class="col-form-label label-custom">Action Owner *</label>
              <%--<input type="text" class="form-control" id="txtActionOwner">--%>
              <select class="form-select color-dropdown" id="ddlTaggedPerson"> </select> <br />
              <textarea class="form-control hidden" id="taTaggedOther" style="margin-top: 6px;" placeholder="Mention Action Owner" aria-describedby="basic-icon-default-message2"></textarea>
          </div>

          <div class="row">
              <label for="html5-number-input " class="col-form-label label-custom">Due Date *</label>
              <input type="text" class="form-control" style="background-color: white;" id="dpDueDate">
          </div>

          <div class="row">              
              <label for="html5-number-input " class="col-form-label label-custom">Action Required *</label> 
              <textarea class="form-control" id="taActionRequired" placeholder="Input Remarks…." aria-describedby="basic-icon-default-message2"></textarea>
            </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnUpdateOppUR">Save</button>
      </div>
    </div>
  </div>
</div>


    <%--end--%>


    <%--Add Project Only for General Visit--%>
    <!-- Large Modal -->
<div class="modal fade" id="addProjectOnlyForGVModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addProjectOnlyForGVModalLabel3">Add Project(s)</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="min-height: 200px;">
        
          <div class="row">
              <div style="width:44.333333%;">
                  <select id="ddlOppMulti" class="form-select color-dropdown ddlOppMulti add-proj-for-GV-only-ddl hidden">
                                                </select>
              </div>

              <div style="border-left: 1px solid #8080803d; width:55.666667%; min-height: 200px;">
                  <h5>Added Projects</h5>
                  <hr />
                  <ul>

                  </ul>
              </div>


          </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

    <%--end--%>


        <%--Add Project Only for General Visit--%>
    <!-- Large Modal -->
<div class="modal fade" id="partiReqNoComment" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="partiReqNoCommentLabel3">COMMENT</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="min-height: 200px;">
        
          <div class="row">          
              <label class="col-form-label label-custom">Comment/Reason <span style="color:red;">*</span></label>
              <textarea class="form-control" id="taReasonForNo" rows="4" placeholder="Enter Comment / Reason" style="border-color: lightgrey;"></textarea>
          </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-InviNoSubmit">Submit</button>
      </div>
    </div>
  </div>
</div>

    <%--end--%>


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
            rolesList = '<%=Session["CurrentUserRolesList"].ToString()%>';

        });

    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
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

    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>


    <%--<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
    <script src="../Calendar/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../Calendar/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../Calendar/dist/js/adminlte.min.js"></script>
    <script src="../Calendar/plugins/moment/moment.min.js"></script>
    <script src="../Calendar/plugins/fullcalendar/main.js"></script>

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <script src="Scripts/calendar-master.js?v=1.3"></script>

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

    <script src="https://phpcoder.tech/multiselect/js/jquery.multiselect.js"></script>
<link rel="stylesheet" href="https://phpcoder.tech/multiselect/css/jquery.multiselect.css">

    <%--    <link href="dist/jqcontext-menu.css" rel="stylesheet" />
    <script src="dist/jqcontext-menu.js"></script>--%>
    <%--   <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js"></script>--%>
</asp:Content>

