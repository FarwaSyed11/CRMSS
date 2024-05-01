<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="BriefForm.aspx.cs" Inherits="Branding_BriefForm" %>

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
                background-color: #76dd4b !important;
                border-color: #7bdd59 !important;
                transform: translateY(-1px) !important;
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

        .Event-table-details .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .Event-table-details th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .Event-table-details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .Item-table-details th {
            text-align: center;
            color: white !important;
            background-color: #af1a1a;
            vertical-align: middle;
        }

        .Item-table-details td {
            border-bottom: 1px solid #96a2ab45 !important;
            font-size: 16px !important;
            background-color: white !important;
        }

        .stage-Details-table th {
            text-align: center;
            color: white !important;
            background-color: #a16363;
        }

        .stage-Details-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }


        .Authority-Details-table th {
            text-align: center;
            color: white !important;
            background-color: #a16363;
        }

        .Authority-Details-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .employee-Details-table th {
            text-align: center;
            color: white !important;
            background-color: #a16363;
        }

        .employee-Details-table td {
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

        .Event-det-drilldown {
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

        .Head-det-drilldown {
            font-weight: 800;
            color: #ffffff;
            /* border: 1px solid #b8adad;*/
            width: 3%;
            cursor: pointer;
            margin-top: 6px;
            position: inherit;
            /* background: #d54832e8;*/
            /* border-radius: 13px;*/
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
            background-color: #e5bbbb;
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

        .tbody-Event .ibtn-Request-Details:hover {
            content: url("Images/gif-eye.gif");
        }
        /*        .WFAdd
        {
       background: repeating-linear-gradient(45deg, #652525, #d54832 100px) !important;
       }

        .WFAdd:hover
        {
      color: ghostwhite !important;
    background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px);
    background: linear-gradient(-30deg, #4f8539 50%, #4a6a15 50%);
       }

        .Popup-Add
        {
            background: repeating-linear-gradient(45deg, #692020, #a16363 100px) !important;
        }

        .Popup-Add:hover
        {
           color: ghostwhite !important;
    background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px);
    background: linear-gradient(-30deg, #4f8539 50%, #4a6a15 50%);
        }*/


        .active-tr {
            border-left: 7px solid #db7e2f !important;
        }


        .animated-button1:hover {
            color: ghostwhite !important;
            background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px);
        }

        .animated-button4:hover {
            color: ghostwhite !important;
            background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px);
        }

        .submit-req {
            background: linear-gradient(40deg, #855b5b, #e70000 100px) !important;
        }

        .animated-button2:hover {
            color: ghostwhite !important;
            background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px);
        }

        .submit-req:hover {
            color: ghostwhite !important;
            background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px) !important;
        }

        .accordion,
        .sub-accordion {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .accordion__item {
            background: rgb(117 75 51 / 9%);
            border-radius: 20px;
            margin-bottom: 5px;
            /*padding: 17px;*/
            /* border-radius: 12px;*/
            border: 1px solid rgb(0 0 0 / 17%);
            box-shadow: rgb(117 75 51 / 9%)
        }
        /* 
*	Стили для заголовка меню 
*/

        .navigation {
            font-weight: 300;
            font-size: 0.9375rem;
            max-width: 460px;
            min-width: 216px;
            margin: 0 auto;
            color: #696666;
        }

        .accordion__item:nth-child(odd) > :first-child:not(.accordion__link_active) {
            color: #ffffff;
            background: #696666;
        }

        .accordion__link {
            font-weight: 500;
            font-size: 1rem;
            position: relative;
            color: #696666;
            text-decoration: none;
            border-radius: 20px;
            display: block;
            padding: 12px 50px 12px 20px;
        }

            .accordion__link:not(.accordion__link_active):after {
                position: absolute;
                content: "";
                border-top: 12px #ff8663 solid;
                border-left: 7px solid transparent;
                border-right: 7px solid transparent;
                right: 22px;
                top: 50%;
                transform: translatey(-6px);
            }

            .accordion__link:not(.accordion__link_active):hover {
                opacity: .8;
                color: #fff;
                background: #B8B8B8;
            }

                .accordion__link:not(.accordion__link_active):hover:after {
                    border-top: 12px #ffffff solid;
                }
        /* 
*	Стили для подменю 
*/
        .sub-accordion {
            padding: 5px 20px;
            display: none;
            height: 0;
            overflow: hidden;
        }

        .sub-accordion__item {
            padding: 5px 0;
        }
        /* 
*	Стили для октивного подменю 
*/
        .accordion__link_active {
            color: #ffffff;
            /*background-color: #914040e0;   */
            background: repeating-linear-gradient(180deg, #5a3b3bf2, #e5a4a4e0 100px);
        }

            .accordion__link_active:after {
                position: absolute;
                content: "";
                border-bottom: 12px #fff solid;
                border-left: 7px solid transparent;
                border-right: 7px solid transparent;
                right: 22px;
                top: 50%;
                transform: translatey(-6px);
            }

            .accordion__link_active + ul {
                display: block;
                height: 100%;
            }

        a:not([href]) {
            text-decoration: none;
            color: white;
        }

            a:not([href]):hover {
                color: #c1bcbc;
                text-decoration: none;
            }

        .header-Bg-Active {
            /* background-color: #8d0000f2;*/
            border-radius: 20px;
            position: relative;
            background: repeating-linear-gradient(182deg, #e97878e3, #a31700b5 100px);
        }

        .header-Bg-NotActive {
            background-color: #696666;
            border-radius: 20px;
            position: relative;
        }

 .flatpickr-calendar{
            zoom:85%;
        }

        .Submit-AllDet:hover {
            content: url("Images/gif-Submit.gif");
        }

        .fa-icon-hover:hover {
            transform: scale(1.1) !important;
        }

        .bg-primary {
            background-color: #fff2d6 !important;
            color: #ffab00 !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #ffab00;
        }

        .bg-Approve {
            background-color: #c9f9cf !important;
            color: #02e128 !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #03d91d;
        }

        .bg-success {
            background-color: #d7f5fc !important;
            color: #03c3ec !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #03c3ec;
        }

        .add-new-icon:hover {
            content: url("Images/gif-AddNew.gif")
        }

        .flatpickr-input .active  {
            top: 212.746px !important;
            left: auto !important;
            right: 193.8714px !important;
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

      .attendees-table th {
            text-align: center;
            color: white !important;
            background-color: #af1a1a;
            vertical-align: middle;
        }

        .attendees-table td {
            border-bottom: 1px solid #96a2ab45 !important;
            font-size: 16px !important;
            background-color: white !important;
        }

        .tbody-Template .Save-Request-Details:hover{
            content:url("Images/Save-gif.gif")
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

   <%-- <div class="ajax-loader loader-bg-blur">
        <div class="custom-loader ">
            <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
            <h4>Loading Data...</h4>
        </div>
    </div>--%>


    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div style="padding-left: 2%; padding-top: 1%;">
            <h5 style="color: #a92828; margin-top: 13px">EXHIBITION / EVENT</h5>
        </div>

        <div class="card-body" style="margin-top: -1%; zoom: 90%;">
            <div style="padding-bottom: 2%;">
                <a href="#" id="btnAddNewEvent" class="animated-button1" style="float: right; font-size: smaller;"><%--<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;--%><span></span><span></span><span></span><span></span><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</a>
            </div>

            <%--SSHR Work--%>

            <div class="" style="margin-top: 1%;">

                <table class="table Event-table-details" style="width: 100%;">

                    <thead>
                        <tr class="Head-tr">
                            <th style="display: none;">Id</th>
                            <th>Ref.No</th>
                            <th style="width: 10%;">Event Name</th>
                            <th>Venue</th>
                            <%-- <th style="width:6%;">Description</th>--%>
                            <th>From Date</th>
                            <th>To Date</th>
                            <th>Hall And Stand No.</th>
                            <th>Status</th>
                            <th>CreatedBy</th>
                            <th>Created Date</th>
                            <th style="display: none;">RoleId</th>
                            <th>View</th>
                            <%--  <th style="width:8%;">IspaidLeave</th>
                      <th style="width:6%;">Action</th>                  --%>
                    </thead>
                    <tbody class="tbody-Event">
                    </tbody>
                </table>
            </div>



        </div>
        <%--card-body end--%>
    </div>









    <div class="modal fade" id="ModalBriefForm" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: rgb(177 171 171 / 36%); zoom: 85%;">
        <div class="modal-dialog modal-xxl" role="document" style="width: 82%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h3 class="modal-title" id="BriefForm">Event Details</h3>
                    <div class="pull-right" style="margin-right: 16%;">

                        <a href="#" id="btnReject" class="animated-button1 submit-req" style="float: right; font-size: smaller; display: none;"><%--<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;--%><span></span><span></span><span></span><span></span><i class="fa fa-times" aria-hidden="true"></i>&nbsp;Reject</a>
                        <a href="#" id="btnApprove" class="animated-button4" style="float: right; font-size: smaller; display: none;"><%--<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;--%><span></span><span></span><span></span><span></span><i class="fa fa-check-square-o" aria-hidden="true"></i>&nbsp;Approve</a>
                        <img id="btnSubmitRequest" src="Images/icon-Submit.png" title="Submit" class="fa-icon-hover Submit-AllDet" style="cursor: pointer; width: 150px; margin-top: 1%; display: none;" />

                    </div>
                    <div style="margin-left: -80%;">
                        <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                </div>



                <div class="modal-body">





                    <div style="margin-top: -13px; position: absolute; width: 96%;">
                        <div style="text-align: right;">
                            <i class="bx bxs-chevron-up Event-det-drilldown Detail-det-drilldown" onclick="hideShowEventInfo()"></i>
                        </div>
                    </div>

                    <%----- BASIC DETAILS -----%>
                    <div id="EventInfoDetailsRowDiv" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">

                        <div class="row">

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Ref No.</label>
                                <div class="">

                                    <input type="text" id="txtRefNo" class="form-control textbox-border-color" disabled />
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Event Name</label>
                                <div class="">
                                    <input type="text" id="txtEventName" class="form-control textbox-border-color" />

                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Venue</label>
                                <div class="">

                                    <input type="text" id="txtVenue" class="form-control textbox-border-color" />
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Show Date From</label>
                                <div class="">

                                    <%-- <input type="text" id="txtDateFrom" class="form-control textbox-border-color" />--%>
                                    <input type="date" id="txtDateFrom" placeholder="Select Date" style="background: white;" class="form-control textbox-border-color">
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Show Date To </label>

                                <div class="">

                                    <%--  <input type="text" id="txtDateTo" class="form-control textbox-border-color" />--%>
                                    <input type="date" id="txtDateTo" placeholder="Select Date" style="background: white;" class="form-control textbox-border-color">
                                </div>
                            </div>
                        </div>










                        <div class="row">


                            <div style="width: 40%">
                                <label for="html5-number-input" class="col-form-label label-custom">Stand Dimension(M) </label>
                                <div class="row">

                                    <div style="width: 33.33%;">
                                        <div class="row">
                                            <div style="width: 20%; padding-top: 5%;">
                                                L:
                                            </div>
                                            <div style="width: 80%;">
                                                <input type="text" id="txtDiLx" class="form-control textbox-border-color" placeholder="L" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                            </div>
                                        </div>
                                    </div>


                                    <div style="width: 33.33%;">
                                        <div class="row">
                                            <div style="width: 20%; padding-top: 5%;">
                                                W:
                                            </div>
                                            <div style="width: 80%;">
                                                <input type="text" id="txtDiWx" class="form-control textbox-border-color" placeholder="W" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                            </div>
                                        </div>
                                    </div>



                                    <div style="width: 33.33%;">
                                        <div class="row">
                                            <div style="width: 20%; padding-top: 5%;">
                                                H:
                                            </div>
                                            <div style="width: 80%;">

                                                <input type="text" id="txtDiH" class="form-control textbox-border-color" placeholder="H" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div style="width: 20%">
                                <label for="html5-number-input" class="col-form-label label-custom">Hall & Stand No. </label>
                                <div class="">

                                    <input type="text" id="txtHallAndStnd" class="form-control textbox-border-color" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Build Up Date</label>
                                <div class="">
                                    <input type="date" id="txtBuilUpDate" placeholder="Select Date" style="background: white;" class="form-control textbox-border-color">
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Design DeadLine </label>
                                <div class="">
                                    <%--   <input type="text" id="txtDesignDeadLine" class="form-control textbox-border-color" />--%>
                                    <input type="date" id="txtDesignDeadLine" placeholder="Select Date" style="background: white;" class="form-control textbox-border-color">
                                </div>
                            </div>

                            <%--   <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">MEP Contractor </label>
                                <div class="">

                                    <input class="form-control" type="text" id="txtMepContractor" readonly />
                                </div>
                            </div>--%>
                        </div>




                        <div class="row">

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Contact Person</label>
                                <div class="">

                                    <input type="text" id="txtContactPerson" class="form-control textbox-border-color" />
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Email Address</label>
                                <div class="">
                                    <input type="text" id="txtEmailAddress" class="form-control textbox-border-color" />

                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Organizers</label>
                                <div class="">

                                    <input type="text" id="txtOrganizers" class="form-control textbox-border-color" />
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Organizers Contact Deatils</label>
                                <div class="">

                                    <input type="text" id="txtOrgContactDet" class="form-control textbox-border-color" />

                                </div>
                            </div>

                            <div class="row Update-Basic_Info">
                                <div class="50%"></div>
                                <div class="50%">
                                    <a href="#" id="btnSubmitBasicDet" class="animated-button1" style="float: right; font-size: smaller;"><%--<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;--%><span></span><span></span><span></span><span></span><i class="fa fa-save" aria-hidden="true"></i>&nbsp;Save</a>
                                </div>

                            </div>


                        </div>
                    </div>

                    <%-----END OF BASIC DETAILS -----%>
                    <div class="More-Det" style="margin-top: 1%;">

                        <div class="nav-align-top tab-Inspections">
                            <div class="row">
                                <div class="col-8">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="nav-item">
                                            <button type="button" id="btnSDinfo" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SDInform" aria-controls="tab-SDInform" aria-selected="true">SD Infromation</button>
                                        </li>
                                        <%--  <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SDInform2" aria-controls="tab-SDInform2" aria-selected="false">SD Infromation(2)</button>
                                </li>--%>
                                        <li class="nav-item">
                                            <button type="button" id="btnProductOrItem" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ProductOrItem" aria-controls="tab-ProductOrItem" aria-selected="false">Product/Item</button>
                                        </li>
                                        <li class="nav-item">
                                            <button type="button" id="btnBudgetReq" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Budget" aria-controls="tab-Budget" aria-selected="false">Budget Request</button>
                                        </li>
                                        <li class="nav-item">
                                            <button type="button" id="btnAttendees" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Attendees" aria-controls="tab-Attendees" aria-selected="false">Attendees</button>
                                        </li>

                                         <li class="nav-item">
                                            <button type="button" id="btnAppStatus" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-AppStatus" aria-controls="tab-AppStatus" aria-selected="false">Approval Status</button>
                                        </li>

                                        <li class="nav-item">
                                            <button type="button" id="btnTemplate" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Template" aria-controls="tab-Template" aria-selected="false">Template</button>
                                        </li>



                                    </ul>
                                </div>
                                <div class="col-4">
                                    <a href="#" id="btnSaveStndDesignInfo" class="animated-button1" style="float: right; font-size: smaller;"><%--<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;--%><span></span><span></span><span></span><span></span><i class="fa fa-save" aria-hidden="true"></i>&nbsp;Save</a>
                                    <a href="#" id="btnSaveBudgetReq" class="animated-button1" style="float: right; font-size: smaller;"><%--<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;--%><span></span><span></span><span></span><span></span><i class="fa fa-save" aria-hidden="true"></i>&nbsp;Save</a>
                                    <a href="#" id="btnSaveAttendees" class="animated-button1" style="float: right; font-size: smaller;"><%--<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;--%><span></span><span></span><span></span><span></span><i class="fa fa-save" aria-hidden="true"></i>&nbsp;Save</a>

                                </div>
                            </div>

                            <div class="tab-content">

                                <%----- STAND DESIGN INFORMATION(1) -----%>
                                <div class="tab-pane fade show active" id="tab-SDInform" role="tabpanel">
                                    <div class="modal-body" style="overflow-y: auto; max-height: calc(100vh - 180px); overflow-x: hidden">

                                        <div style="padding-top: 2%;">
                                            <a onclick="hideShowStandDesign1()">
                                                <h3 id="headSGI1" class="header-Bg-Active" style="text-align: center;">
                                                    <label style="margin-top: 9px; color: white;">STAND DESIGN INFORMATION(1)</label><i class="bx bxs-chevron-up Head-det-drilldown StandDesign1-det-drilldown" style="float: right; margin-top: 10px; margin-right: 1%;"></i></h3>
                                            </a>
                                        </div>
                                        <%--  <div style="text-align: right;padding-right: 8px">
                            <i class="bx bxs-chevron-up Event-det-drilldown StandDesign1-det-drilldown" style="text-align: right;padding-right: 8px" onclick="hideShowStandDesign1()"></i>
                        </div>--%>

                                        <div id="div-StandDesign1">
                                            <div class="row">

                                                <%--  <div style="margin-top: -13px; position: absolute; width: 96%;">
                        <div style="text-align: right;">
                            <i class="bx bxs-chevron-up Event-det-drilldown Pref-det-drilldown" onclick="hideShowFlrPref()" style="margin-right:52%;"></i>
                        </div>
                    </div>--%>
                                                <div class="col-6">

                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">Flooring Preference</a>

                                                            <%-- <div>
                                <h4 style="margin-top: 13px;">Flooring Preference</h4>

                         </div>--%>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">
                                                                    <div id="div-FlrPreference">

                                                                        <%--     <div id="FloorimhPref" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>

                                                                        <div class="row">

                                                                            <div style="width: 40%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Carpet Colour</label>
                                                                                <div class="">


                                                                                    <select id="ddlCarpetColour" class="form-control textbox-border-color">
                                                                                        <option value="None">None</option>
                                                                                        <option value="Red">Red</option>
                                                                                        <option value="Orange">Orange</option>
                                                                                        <option value="Green">Green</option>
                                                                                        <option value="White">White</option>
                                                                                        <option value="Black">Black</option>
                                                                                        <option value="Blue">Blue</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>

                                                                            <div style="width: 30%;">
                                                                                <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                    <label for="html5-number-input" class="col-form-label label-custom">Glass Under Lit Flooring</label>
                                                                                    <div>
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbGlUnderFlr" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbGlUnderFlr" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div style="width: 30%;">
                                                                                <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                    <label for="html5-number-input" class="col-form-label label-custom">Wooden Parquet</label>
                                                                                    <div>
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbWoodenParquet" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbWoodenParquet" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <%--  <div style="width: 10%;">
                                  <div class="div-consultedDoctor">
                                    <label for="html5-number-input" class="col-form-label label-custom">Combination Of Wood & Glass</label>
                                    <div>
                                        <div class="netliva-switch">
                                            <input type="checkbox" id="cbCombWdAndGlass" netliva-switch="OK">
                                            <label for="cbCombWdAndGlass" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>

                                                                            <%--  <div style="width: 35%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Wood Laminated Flooring</label>
                                <div class="">

                                  <input type="text" id="txtWdLaminatedFlr" class="form-control textbox-border-color" />
                               
                                </div>
                            </div>--%>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div style="width: 40%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Wood Laminated Flooring</label>
                                                                                <div class="">

                                                                                    <input type="text" id="txtWdLaminatedFlr" name="NmAllEventText" class="form-control textbox-border-color" />

                                                                                </div>
                                                                            </div>


                                                                            <div style="width: 30%;">
                                                                                <div class="div-consultedDoctor">
                                                                                    <label for="html5-number-input" class="col-form-label label-custom">Combination Of Wood & Glass</label>
                                                                                    <div>
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbCombWdAndGlass" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbCombWdAndGlass" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                        <div class="row">

                                                                            <div class="col mb-3 discriptionDiv">
                                                                                <label for="nameBasic" class="form-label">Comments </label>
                                                                                <textarea class="form-control textbox-border-color" name="NmAllEventText" id="txtFlrPreferenceComment" rows="3" style="overflow-y: scroll; height: 60px;" placeholder="Enter the Comments"></textarea>
                                                                            </div>


                                                                        </div>
                                                                        <%--  </div>--%>
                                                                    </div>
                                                                </li>

                                                            </ul>

                                                        </li>
                                                    </ul>

                                                </div>






                                                <div class="col-6">
                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">Reception Area</a>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">
                                                                    <div id="div-ReceptionArea">

                                                                        <%--  <div id="ReceptionArea" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>
                                                                        <div class="row">

                                                                            <div style="width: 40%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Number Of Counters</label>
                                                                                <div class="">


                                                                                    <input type="text" id="txtNumbOfCount" name="NmAllEventText" class="form-control textbox-border-color" />
                                                                                </div>
                                                                            </div>

                                                                            <div style="width: 30%;">
                                                                                <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                    <label for="html5-number-input" class="col-form-label label-custom">Storage</label>
                                                                                    <div>
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbStorage" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbStorage" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div style="width: 30%;">
                                                                                <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                    <label for="html5-number-input" class="col-form-label label-custom">Bar Stool For Counters</label>
                                                                                    <div>
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbBarStlForCount" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbBarStlForCount" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <%--  <div style="width: 10%;">
                                  <div class="div-consultedDoctor">
                                    <label for="html5-number-input" class="col-form-label label-custom">Combination Of Wood & Glass</label>
                                    <div>
                                        <div class="netliva-switch">
                                            <input type="checkbox" id="cbCombWdAndGlass" netliva-switch="OK">
                                            <label for="cbCombWdAndGlass" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>

                                                                            <%--  <div style="width: 35%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Wood Laminated Flooring</label>
                                <div class="">

                                  <input type="text" id="txtWdLaminatedFlr" class="form-control textbox-border-color" />
                               
                                </div>
                            </div>--%>
                                                                        </div>


                                                                        <div class="row">

                                                                            <div class="col mb-3">
                                                                                <label for="nameBasic" class="form-label">Comments </label>
                                                                                <textarea class="form-control textbox-border-color" id="txtReceptionAreaComment" name="NmAllEventText" rows="3" style="overflow-y: scroll; height: 136px;" placeholder="Enter the Comments"></textarea>
                                                                            </div>


                                                                        </div>
                                                                        <%-- </div>--%>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                </div>


                                            </div>




                                            <div class="row" style="padding-top: 2%;">


                                                <div class="col-6">

                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">Meeting Area</a>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">

                                                                    <%-- <div id="divMeetingArea" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>

                                                                    <div class="row">

                                                                        <div style="width: 50%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Vip</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-Vip" netliva-switch="OK">
                                                                                            <label for="cb-Vip" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtVip" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>



                                                                        <div style="width: 50%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Totaly Closed Area</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-TotClosedArea" netliva-switch="OK">
                                                                                            <label for="cb-TotClosedArea" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtTotClosedArea" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>

                                                                                </div>
                                                                            </div>

                                                                        </div>



                                                                    </div>
                                                                    <div class="row">
                                                                        <div style="width: 50%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Semi Close Area</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-SemiCloseArea" netliva-switch="OK">
                                                                                            <label for="cb-SemiCloseArea" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%;"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtSemiCloseArea" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>



                                                                        <div style="width: 50%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Open Area</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-OpenArea" netliva-switch="OK">
                                                                                            <label for="cb-OpenArea" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtOpenArea" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>




                                                                    <div class="row">

                                                                        <div style="width: 50%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Coffe Table</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-CoffeTabe" netliva-switch="OK">
                                                                                            <label for="cb-CoffeTabe" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtCoffeTabe" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>



                                                                        <div style="width: 50%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Bar Stool</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-BarStool" netliva-switch="OK">
                                                                                            <label for="cb-BarStool" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtBarStool" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                        </div>



                                                                    </div>
                                                                    <div class="row">
                                                                        <div style="width: 50%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Chairs</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-Chairs" netliva-switch="OK">
                                                                                            <label for="cb-Chairs" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtChairs" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>



                                                                        <div style="width: 50%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Sofa</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-Sofa" netliva-switch="OK">
                                                                                            <label for="cb-Sofa" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtSofa" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>


                                                                    <div class="row">

                                                                        <div class="col mb-3 discriptionDiv">
                                                                            <label for="nameBasic" class="form-label">Comments </label>
                                                                            <textarea class="form-control textbox-border-color" name="NmAllEventText" id="txtMeetingAreaComment" rows="3" style="overflow-y: scroll; height: 60px;" placeholder="Enter the Comments"></textarea>
                                                                        </div>


                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                    <%-- </div>--%>
                                                </div>




                                                <div class="col-6">
                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">Audio Visual</a>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">

                                                                    <%--  <div id="divAudioVisual" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>

                                                                    <div class="row">


                                                                        <div style="width: 100%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Number Of Tv With Size</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-NUmbTvWithSize" netliva-switch="OK">
                                                                                            <label for="cb-NUmbTvWithSize" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtNUmbTvWithSize" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count and Tv Size" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>









                                                                    </div>
                                                                    <div class="row">
                                                                        <div style="width: 100%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Number Of Laptop</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-NumbOfLap" netliva-switch="OK">
                                                                                            <label for="cb-NumbOfLap" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtNumbOfLap" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>







                                                                    </div>




                                                                    <div class="row">


                                                                        <div style="width: 50%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Video Wall</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-VideoWall" netliva-switch="OK">
                                                                                            <label for="cb-VideoWall" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtVideoWall" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>


                                                                        <div style="width: 50%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Special Element</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-SpcElement" netliva-switch="OK">
                                                                                            <label for="cb-SpcElement" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtSpcElement" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>


                                                                        </div>




                                                                    </div>


                                                                    <div class="row">

                                                                        <div class="col mb-3 discriptionDiv">
                                                                            <label for="nameBasic" class="form-label">Comments </label>
                                                                            <textarea class="form-control textbox-border-color" name="NmAllEventText" id="txtAudioVisualComments" rows="3" style="overflow-y: scroll; height: 112px;" placeholder="Enter the Comments"></textarea>
                                                                        </div>


                                                                    </div>
                                                                    <%--  </div>--%>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                </div>

                                            </div>


                                            <%--END --%>


                                            <div class="row" style="padding-top: 2%;">


                                                <div class="col-6">

                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">Work Station</a>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">

                                                                    <%-- <div id="divMeetingArea" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>

                                                                    <div class="row">

                                                                        <div style="width: 50%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Number Of WorkStation</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-NumbOfWrkStation" netliva-switch="OK">
                                                                                            <label for="cb-NumbOfWrkStation" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtNumbOfWrkStation" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                        <div style="width: 50%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Number Of TV Screens</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-NumbOfTvScrn" netliva-switch="OK">
                                                                                            <label for="cb-NumbOfTvScrn" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtNumbOfTvScrn" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>


                                                                    </div>


                                                                    <div class="row">

                                                                        <div class="col mb-3 discriptionDiv">
                                                                            <label for="nameBasic" class="form-label">Comments </label>
                                                                            <textarea class="form-control textbox-border-color" name="NmAllEventText" id="txtWorkStationComment" rows="3" style="overflow-y: scroll; height: 120px;" placeholder="Enter Your Comments"></textarea>
                                                                        </div>


                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                    <%-- </div>--%>
                                                </div>

                                                <div class="col-6">

                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">Furniture & Fittings</a>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">

                                                                    <%-- <div id="divMeetingArea" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>

                                                                    <div class="row">

                                                                        <div style="width: 50%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Number Of Podium</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-NumbOfPodium" netliva-switch="OK">
                                                                                            <label for="cb-NumbOfPodium" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtNumbOfPodium" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>



                                                                        <div style="width: 50%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Number Of display Stands</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-NumbOfDsplyStands" netliva-switch="OK">
                                                                                            <label for="cb-NumbOfDsplyStands" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtNumbOfDsplyStands" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                        </div>



                                                                    </div>
                                                                    <div class="row">
                                                                        <div style="width: 50%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Number Of Boucher Racks</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-NumbOfBchrRacks" netliva-switch="OK">
                                                                                            <label for="cb-NumbOfBchrRacks" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtNumbOfBchrRacks" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>



                                                                        <div style="width: 50%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Storage Room</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbStorageRoom" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbStorageRoom" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>




                                                                    <div class="row">

                                                                        <div style="width: 100%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Number Of Shelves</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="EventCb" id="cb-NumbOfShelves" netliva-switch="OK">
                                                                                            <label for="cb-NumbOfShelves" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div style="width: 70%;">
                                                                                        <input type="text" id="txtNumbOfShelves" name="EventText" class="form-control textbox-border-color" placeholder="Enter the Count" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>

                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                    <%-- </div>--%>
                                                </div>


                                            </div>
                                        </div>


                                        <%----- END OF STAND DESIGN INFORMATION(1) -----%>


                                        <%----- STAND DESIGN INFORMATION(2) -----%>

                                        <div style="padding-top: 1%;">
                                            <a onclick="hideShowStandDesign2()">
                                                <h3 id="headSGI2" class="header-Bg-Active" style="text-align: center;">
                                                    <label style="margin-top: 9px; color: white;">STAND DESIGN INFORMATION(2)</label><i class="bx bxs-chevron-up Head-det-drilldown StandDesign2-det-drilldown" style="float: right; margin-top: 10px; margin-right: 1%;"></i></h3>
                                            </a>
                                        </div>

                                        <div id="div-StandDesign2">
                                            <div class="row" style="padding-top: 1%;">

                                                <div class="col-6">

                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">Theme & Style Of The Stand Design</a>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">

                                                                    <%-- <div id="divMeetingArea" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>

                                                                    <div class="row">

                                                                        <div style="width: 25%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Modern</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbModern" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbModern" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>


                                                                                </div>
                                                                            </div>

                                                                        </div>



                                                                        <div style="width: 25%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Hi-Tech</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbHiTech" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbHiTech" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div style="width: 25%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Heritage</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbHeritage" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbHeritage" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div style="width: 25%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Traditional</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbTraditional" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbTraditional" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>



                                                                    </div>
                                                                    <div class="row">
                                                                        <div style="width: 25%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Classic</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbClassic" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbClassic" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>


                                                                                </div>
                                                                            </div>

                                                                        </div>



                                                                        <div style="width: 25%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Corporate</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" name="NmAllEventCb" id="cbCorporate" netliva-switch="OK">
                                                                                            <label for="cbCorporate" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div style="width: 40%;">
                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Hanging Structure</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">

                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbHangingStructure" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbHangingStructure" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>


                                                                    <div class="row">

                                                                        <div class="col mb-3 discriptionDiv">
                                                                            <label for="nameBasic" class="form-label">Comments </label>
                                                                            <textarea class="form-control textbox-border-color" name="NmAllEventText" id="txtThemeAndStyleComment" rows="3" style="overflow-y: scroll; height: 117px;" placeholder="Enter Your Comments"></textarea>
                                                                        </div>


                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                    <%-- </div>--%>
                                                </div>


                                                <div class="col-6">

                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">Budget</a>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">

                                                                    <%-- <div id="divMeetingArea" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>

                                                                    <div class="row">

                                                                        <div style="width: 100%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Approx. Minimum</label>
                                                                                <div class="row">


                                                                                    <div>
                                                                                        <input type="text" id="txtAppMinimum" name="NmAllEventText" class="form-control textbox-border-color" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>


                                                                    </div>
                                                                    <div class="row">
                                                                        <div style="width: 100%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Approx. Maximum</label>
                                                                                <div class="row">


                                                                                    <div>
                                                                                        <input type="text" id="txtAppMaximum" name="NmAllEventText" class="form-control textbox-border-color" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>

                                                                    <div class="row">

                                                                        <div style="width: 100%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Last Year Spent on Stand Construction</label>
                                                                                <div class="row">


                                                                                    <div>
                                                                                        <input type="text" id="txtSpntOnConstruction" name="NmAllEventText" class="form-control textbox-border-color" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>

                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                    <%-- </div>--%>
                                                </div>


                                            </div>

                                            <%--END --%>

                                            <div class="row" style="padding-top: 2%;">


                                                <div class="col-3">

                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">Catalog And Gift Items</a>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">

                                                                    <%-- <div id="divMeetingArea" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>

                                                                    <div class="row">

                                                                        <div style="width: 100%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Catalogues</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbCatelogues" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbCatelogues" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>


                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>


                                                                    <div class="row">

                                                                        <div style="width: 100%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Gift Items</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbGiftItems" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbGiftItems" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>


                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>


                                                                    <div class="row" style="padding-top: 3px;">

                                                                        <div class="col mb-3 discriptionDiv">
                                                                            <label for="nameBasic" class="form-label">Comments </label>
                                                                            <textarea class="form-control textbox-border-color" name="NmAllEventText" id="txtMeterialRequest" rows="3" style="overflow-y: scroll; height: 60px;" placeholder="Enter Your Comments"></textarea>
                                                                        </div>


                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                    <%-- </div>--%>
                                                </div>



                                                <div class="col-3">

                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">Digital Presence</a>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">

                                                                    <%-- <div id="divMeetingArea" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>

                                                                    <div class="row">

                                                                        <div style="width: 50%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Email Signature</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbEmailSignature" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbEmailSignature" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>


                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                        <div style="width: 50%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Social Media Post</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbSMPost" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbSMPost" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>


                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>


                                                                    <div class="row">

                                                                        <div style="width: 100%;">

                                                                            <div class="div-consultedDoctor" style="padding-top: 3%;">
                                                                                <label for="html5-number-input" class="col-form-label label-custom">Invitation E-mail To Client</label>
                                                                                <div class="row">
                                                                                    <div style="width: 30%">
                                                                                        <div class="netliva-switch">
                                                                                            <input type="checkbox" id="cbEmailToClient" name="NmAllEventCb" netliva-switch="OK">
                                                                                            <label for="cbEmailToClient" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                                        </div>
                                                                                    </div>


                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>


                                                                    <div class="row" style="padding-top: 3px;">

                                                                        <div class="col mb-3 discriptionDiv">
                                                                            <label for="nameBasic" class="form-label">Comments </label>
                                                                            <textarea class="form-control textbox-border-color" id="txtDigitalPresence" name="NmAllEventText" rows="3" style="overflow-y: scroll; height: 66px;" placeholder="Enter Your Comments"></textarea>
                                                                        </div>


                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                    <%-- </div>--%>
                                                </div>




                                                
                                                <div class="col-6">

                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">How Many Side Open? (Please Tick)</a>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">

                                                                    <%-- <div id="divMeetingArea" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>

                                                                    <div class="row" style="padding-top:1%;">

                                                                        <div style="width: 20%;">

                                                                           <label style="color:red;">Tick the stand Orientation</label><br/><br/>
                                                                            <label style="color:red;">NOTE  :  Please provide us with Exhibition Floor Plan</label>

                                                                        </div>

                                                                        <div style="width: 80%;">

                                                                            <div class="row">
                                                                                <div style="width: 20%">
                                                                                    <img src="Images/Side3.png" style="width: 130px;padding-top:20px;" />
                                                                                </div>

                                                                        

                                                                             
                                                                                <div style="width: 20%">
                                                                                    <img src="Images/Side2Open.png" style="width: 130px;padding-top: 12px;" />
                                                                                </div>

                                                                     

                                                                             
                                                                                <div style="width: 20%">
                                                                                    <img src="Images/Side2.png" style="width: 130px;" />
                                                                                </div>

                                                                   

                                                                             
                                                                                <div style="width: 20%">
                                                                                    <img src="Images/Side1.png" style="width: 130px;" />
                                                                                </div>

                                                                      

                                                                  
                                                                                <div style="width: 20%">
                                                                                    <img src="Images/SideOpen.png" style="width: 130px;padding-top: 35%;" />
                                                                                </div>

                                                                            </div>



                                                                             <div class="row">
                                                                                <div style="width: 20%;text-align: center;">
                                                                                    <label style="font-weight: bold;color: black;">1 Side Open</label>
                                                                                </div>

                                                                        

                                                                             
                                                                                <div style="width: 20%;text-align: center;">
                                                                                   <label style="font-weight: bold;color: black;">2 Parellel Sides Open</label>
                                                                                </div>

                                                                     

                                                                             
                                                                                <div style="width: 20%;text-align: center;">
                                                                                    <label style="font-weight: bold;color: black;">2 Sides Open</label>
                                                                                </div>

                                                                   

                                                                             
                                                                                <div style="width: 20%;text-align: center;">
                                                                                     <label style="font-weight: bold;color: black;">3 Sides Open</label>
                                                                                </div>

                                                                      

                                                                  
                                                                                <div style="width: 20%;text-align: center;">
                                                                                     <label style="font-weight: bold;color: black;">4 Sides Open</label>
                                                                                </div>

                                                                            </div>





                                                                            <div class="row">
                                                                                <div style="width: 20%;text-align: center;">
                                                                                    <input type="radio" id="rdOneside" name="FloorPlan" value="OneSideOpen">
                                                                                </div>

                                                                        

                                                                             
                                                                                <div style="width: 20%;text-align: center;">
                                                                                   <input type="radio" id="rdTwoPrside" name="FloorPlan" value="TwoPrSidesOpen">
                                                                                </div>

                                                                     

                                                                             
                                                                                <div style="width: 20%;text-align: center;">
                                                                                    <input type="radio" id="rdTwosidesOpen" name="FloorPlan" value="TwoSidesOpen">
                                                                                </div>

                                                                   

                                                                             
                                                                                <div style="width: 20%;text-align: center;">
                                                                                     <input type="radio" id="rdThreesidesOpen" name="FloorPlan" value="ThreeSidesOpen">
                                                                                </div>

                                                                      

                                                                  
                                                                                <div style="width: 20%;text-align: center;">
                                                                                     <input type="radio" id="rdFoursidesOpen" name="FloorPlan" value="FourSidesOpen">
                                                                                </div>

                                                                            </div>



                                                                           </div>

                                                                        </div>


                                                                    <div class="row" style="padding-top: 6%;"></div>

                                                                    

                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                    <%-- </div>--%>
                                                </div>






                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%----- END OF STAND DESIGN INFORMATION(2) -----%>


                                <div class="tab-pane fade" id="tab-ProductOrItem" role="tabpanel">
                                    <%----- Item/Product -----%>
                                    <div class="modal-body" style="overflow-y: auto; max-height: calc(100vh - 180px); overflow-x: hidden">



                                        <div class="row" style="padding-top: 1%;">
                                            <ul class="accordion">
                                                <li class="accordion__item">
                                                    <a class="accordion__link accordion__link_active">Product Details</a>

                                                    <ul class="sub-accordion">
                                                        <li class="sub-accordion__item">

                                                            <div class="card-body" style="margin-top: -1%; zoom: 90%;">

                                                                <div class="row product-Add-det">
                                                                    <div style="width: 30%">
                                                                        <label for="html5-number-input" class="col-form-label label-custom">Product Name</label>
                                                                        <div class="">

                                                                            <input type="text" id="txtProductName" class="form-control textbox-border-color" placeholder="Enter Product_Name" />
                                                                        </div>
                                                                    </div>

                                                                    <div style="width: 30%">
                                                                        <label for="html5-number-input" class="col-form-label label-custom">Remarks</label>
                                                                        <div class="">

                                                                            <input type="text" id="txtProductDesc" class="form-control textbox-border-color" placeholder="Enter Comments" />
                                                                        </div>
                                                                    </div>

                                                                    <div style="width: 30%; padding-top: 1%;">


                                                                        <%--<span href="#" id="btnAddProduct" class="animated-button1" style="font-size: smaller;">--%><%--<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;--%><%--<span></span><span></span><span></span><span></span><i class="fa fa-save" aria-hidden="true"></i>&nbsp;Save</span>--%>
                                                                        <img id="btnAddProduct" src="Images/icon-AddNew.png" title="Add New" class="fa-icon-hover add-new-icon" style="cursor: pointer; width: 80px; margin-top: -1%;" />
                                                                    </div>

                                                                </div>


                                                                <%--SSHR Work--%>

                                                                <div class="" style="margin-top: 1%;">


                                                                    <table class="table table-bordered Item-table-details" style="width: 100%;">

                                                                        <thead>
                                                                            <tr class="Head-tr">
                                                                                <th style="display: none;">Id</th>
                                                                                <th>Product Name</th>
                                                                                <th>Remarks</th>
                                                                                <%-- <th rowspan="2">Weight</th>
                                                                             <th style="width:6%;">Description</th>
                                                                            <th rowspan="2">Electrical Requirement</th>
                                                                            <th rowspan="2">Remarks</th>
                                                                           
                                                                        </tr>
                                                                        <tr>
                                                                            <th>W</th>
                                                                            <th>L</th>
                                                                            <th>H</th>

                                                                        </tr>--%>
                                                                        </thead>
                                                                        <tbody class="tbody-Product">
                                                                        </tbody>
                                                                    </table>
                                                                </div>



                                                            </div>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>

                                        </div>



                                        <div class="row" style="padding-top: 1%;">
                                            <ul class="accordion">
                                                <li class="accordion__item">
                                                    <a class="accordion__link accordion__link_active">Models Or Products To Be Displayed</a>

                                                    <ul class="sub-accordion">
                                                        <li class="sub-accordion__item">

                                                            <div class="card-body" style="margin-top: -1%; zoom: 90%;">
                                                                <div style="padding-bottom: 2%;">
                                                                    <%--<span id="btnAddNewItem" class="animated-button2" style="float: right; font-size: smaller;">--%><%--<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;--%><%--<span></span><span></span><span></span><span></span><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</span>--%>
                                                                    <img id="btnAddNewItem" src="Images/icon-AddNew.png" title="Add New" class="fa-icon-hover add-new-icon" style="cursor: pointer; width: 80px; margin-top: -1%; float: right;" />
                                                                </div>

                                                                <%--SSHR Work--%>

                                                                <div class="" style="margin-top: 1%;">


                                                                    <table class="table table-bordered Item-table-details" style="width: 100%;">

                                                                        <thead>
                                                                            <tr class="Head-tr">
                                                                                <th rowspan="2">Item/Description</th>
                                                                                <th colspan="3">Dimension(M)</th>
                                                                                <th rowspan="2">Weight</th>
                                                                                <%-- <th style="width:6%;">Description</th>--%>
                                                                                <th rowspan="2">Electrical Requirement</th>
                                                                                <th rowspan="2">Remarks</th>

                                                                            </tr>
                                                                            <tr class="Head-tr">
                                                                                <th>W</th>
                                                                                <th>L</th>
                                                                                <th>H</th>

                                                                            </tr>
                                                                        </thead>
                                                                        <tbody class="tbody-Item">
                                                                        </tbody>
                                                                    </table>
                                                                </div>



                                                            </div>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>

                                        </div>
                                    </div>
                                </div>

                                <%----- END OF ITEM/PRODUCT -----%>


                                <%----- BUDGET REQUEST FOR EXHIBITION -----%>
                                <div class="tab-pane fade" id="tab-Budget" role="tabpanel">
                                    <div class="modal-body" style="overflow-y: auto; max-height: calc(100vh - 180px); overflow-x: hidden">

                                        <div style="padding-top: 1%;">
                                            <a onclick="hideShowBudgeReq()">
                                                <h3 id="headBRE" class="header-Bg-Active" style="text-align: center;">
                                                    <label style="margin-top: 9px; color: white;">BUDGET REQUEST FOR EXHIBITION</label><i class="bx bxs-chevron-up Head-det-drilldown BudgetReq-det-drilldown" style="float: right; margin-top: 10px; margin-right: 1%;"></i></h3>
                                            </a>
                                        </div>

                                        <div id="div-BudgetReq">
                                            <%-- <h3 style="margin-top: 13px;text-align:center;background-color: #696666;color: white;">BUDGET REQUEST FOR EXHIBITION</h3>--%>


                                            <div class="row">


                                                <div class="col-3">

                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">Space & Stand Cost</a>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">

                                                                    <%-- <div id="divMeetingArea" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>

                                                                    <div class="row">

                                                                        <div style="width: 40%; padding-top: 9%;">
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label label-custom" style="font-size: larger;">Expected</label>

                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label label-custom" style="font-size: larger;">Actual</label>

                                                                                </div>

                                                                            </div>
                                                                        </div>



                                                                    </div>




                                                                    <div class="row">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Stand Cost</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtStandCost" name="NmSpcAndStnd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualStandCost" name="NmActualSpcAndStnd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>

                                                                        </div>


                                                                    </div>


                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Space Rental</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtSpaceRental" name="NmSpcAndStnd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualSpaceRental" name="NmActualSpcAndStnd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>


                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Electricity</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtElectricity" name="NmSpcAndStnd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualElectricity" name="NmActualSpcAndStnd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>


                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Rigging</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtRigging" name="NmSpcAndStnd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualRigging" name="NmActualSpcAndStnd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Internet</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtInternet" name="NmSpcAndStnd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualInternet" name="NmActualSpcAndStnd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Others</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtSpaceStandOthers" name="NmSpcAndStnd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualSpaceStandOthers" name="NmActualSpcAndStnd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                    <div class="row" style="padding-top: 35%;">

                                                                        <div style="width: 30%; padding-top: 9%;">
                                                                        </div>
                                                                        <div style="width: 70%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label" style="font-size: revert; font-weight: bold;">Expected</label>

                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label" style="font-size: revert; font-weight: bold;">Actual</label>

                                                                                </div>

                                                                            </div>
                                                                        </div>



                                                                    </div>

                                                                    <div class="row">

                                                                        <div style="width: 30%;">


                                                                            <label for="html5-number-input" class="col-form-label" style="font-weight: bold; font-size: initial;">Sub Total</label>
                                                                        </div>
                                                                        <div style="width: 70%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtSpaceStandSubTotal" class="form-control textbox-border-color" disabled />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualSpaceStandSubTotal" class="form-control textbox-border-color" disabled />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                    <%-- </div>--%>
                                                </div>




                                                <div class="col-3">

                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">Marketing & Advertising Cost</a>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">

                                                                    <%-- <div id="divMeetingArea" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>


                                                                    <div class="row">

                                                                        <div style="width: 40%; padding-top: 9%;">
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label label-custom" style="font-size: larger;">Expected</label>

                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label label-custom" style="font-size: larger;">Actual</label>

                                                                                </div>

                                                                            </div>
                                                                        </div>



                                                                    </div>



                                                                    <div class="row">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Sponsership</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">

                                                                                    <input type="text" id="txtSponserShip" name="nmMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">

                                                                                    <input type="text" id="txtActualSponserShip" name="nmActualMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>

                                                                            </div>
                                                                        </div>



                                                                    </div>


                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Magazine/Disrectory Ad</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">

                                                                                    <input type="text" id="txtMgOrDrsctoryad" name="nmMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">

                                                                                    <input type="text" id="txtActualMgOrDrsctoryad" name="nmActualMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>


                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">On-Site Branding</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtOnSiteBranding" name="nmMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">

                                                                                    <input type="text" id="txtActualOnSiteBranding" name="nmActualMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>

                                                                            </div>
                                                                        </div>

                                                                    </div>


                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Technology</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtTechnology" name="nmMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">

                                                                                    <input type="text" id="txtActualTechnology" name="nmActualMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>

                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Entertainment</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtEntertainment" name="nmMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">

                                                                                    <input type="text" id="txtActualEntertainment" name="nmActualMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Catalogues</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtCatelogues" name="nmMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">

                                                                                    <input type="text" id="txtActualCatelogues" name="nmActualMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>


                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Gift Items</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtGiftItems" name="nmMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">

                                                                                    <input type="text" id="txtActualGiftItems" name="nmActualMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>


                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Others</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtMktOrAdOthers" name="nmMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">

                                                                                    <input type="text" id="txtActualMktOrAdOthers" name="nmActualMktOrAd" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>


                                                                    <div class="row" style="padding-top: 5%;">

                                                                        <div style="width: 30%; padding-top: 9%;">
                                                                        </div>
                                                                        <div style="width: 70%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label" style="font-size: revert; font-weight: bold;">Expected</label>

                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label" style="font-size: revert; font-weight: bold;">Actual</label>

                                                                                </div>

                                                                            </div>
                                                                        </div>



                                                                    </div>

                                                                    <div class="row">

                                                                        <div style="width: 30%;">


                                                                            <label for="html5-number-input" class="col-form-label" style="font-weight: bold; font-size: initial;">Sub Total</label>
                                                                        </div>
                                                                        <div style="width: 70%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtMktOrAdSubTotal" class="form-control textbox-border-color" disabled />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualMktOrAdSubTotal" class="form-control textbox-border-color" disabled />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                    <%-- </div>--%>
                                                </div>


                                                <div class="col-3">

                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">Visa & Travel Expenses</a>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">

                                                                    <%-- <div id="divMeetingArea" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>


                                                                    <div class="row">

                                                                        <div style="width: 40%; padding-top: 9%;">
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label label-custom" style="font-size: larger;">Expected</label>

                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label label-custom" style="font-size: larger;">Actual</label>

                                                                                </div>

                                                                            </div>
                                                                        </div>



                                                                    </div>

                                                                    <div class="row">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Visa</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtVisa" name="NmVisaAndTrvl" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualVisa" name="NmActualVisaAndTrvl" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>




                                                                    </div>


                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Air Fare</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtAirFare" name="NmVisaAndTrvl" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualAirFare" name="NmActualVisaAndTrvl" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>


                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Logistics</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtLogiStics" name="NmVisaAndTrvl" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualLogiStics" name="NmActualVisaAndTrvl" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>


                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Others</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtVisaTravelOthers" name="NmVisaAndTrvl" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualVisaTravelOthers" name="NmActualVisaAndTrvl" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                    <div class="row" style="padding-top: 61%;">

                                                                        <div style="width: 30%; padding-top: 9%;">
                                                                        </div>
                                                                        <div style="width: 70%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label" style="font-size: revert; font-weight: bold;">Expected</label>

                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label" style="font-size: revert; font-weight: bold;">Actual</label>

                                                                                </div>

                                                                            </div>
                                                                        </div>



                                                                    </div>


                                                                    <div class="row">

                                                                        <div style="width: 30%;">


                                                                            <label for="html5-number-input" class="col-form-label" style="font-weight: bold; font-size: initial;">Sub Total</label>
                                                                        </div>
                                                                        <div style="width: 70%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtVisaTravelSubTotal" class="form-control textbox-border-color" disabled />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualVisaTravelSubTotal" class="form-control textbox-border-color" disabled />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                    <%-- </div>--%>
                                                </div>


                                                <div class="col-3">

                                                    <ul class="accordion">
                                                        <li class="accordion__item">
                                                            <a class="accordion__link accordion__link_active">Operaion Expenses</a>

                                                            <ul class="sub-accordion">
                                                                <li class="sub-accordion__item">

                                                                    <%-- <div id="divMeetingArea" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>

                                                                    <div class="row">

                                                                        <div style="width: 40%; padding-top: 9%;">
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label label-custom" style="font-size: larger;">Expected</label>

                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label label-custom" style="font-size: larger;">Actual</label>

                                                                                </div>

                                                                            </div>
                                                                        </div>



                                                                    </div>

                                                                    <div class="row">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Meal & Trasportation</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtMealAndTrans" name="NmOperExp" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualMealAndTrans" name="NmActualOperExp" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>

                                                                        </div>


                                                                    </div>


                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Pantry Meterials</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtPantryMet" name="NmOperExp" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualPantryMet" name="NmActualOperExp" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>


                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Flowers, etc</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtFlowersEtc" name="NmOperExp" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualFlowersEtc" name="NmActualOperExp" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>


                                                                    <div class="row" style="padding-top: 2%;">

                                                                        <div style="width: 40%;">


                                                                            <label for="html5-number-input" class="col-form-label label-custom">Others</label>
                                                                        </div>
                                                                        <div style="width: 60%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtOperationExpOthers" name="NmOperExp" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualOperationExpOthers" name="NmActualOperExp" class="form-control textbox-border-color" placeholder="AED" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                    <div class="row" style="padding-top: 61%;">

                                                                        <div style="width: 30%; padding-top: 9%;">
                                                                        </div>
                                                                        <div style="width: 70%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label" style="font-size: revert; font-weight: bold;">Expected</label>

                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <label for="html5-number-input" class="col-form-label" style="font-size: revert; font-weight: bold;">Actual</label>

                                                                                </div>

                                                                            </div>
                                                                        </div>



                                                                    </div>


                                                                    <div class="row">

                                                                        <div style="width: 30%;">


                                                                            <label for="html5-number-input" class="col-form-label" style="font-weight: bold; font-size: initial;">Sub Total</label>
                                                                        </div>
                                                                        <div style="width: 70%;">
                                                                            <div class="row">
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtOperationExpSubTotal" class="form-control textbox-border-color" disabled />
                                                                                </div>
                                                                                <div style="width: 50%;">
                                                                                    <input type="text" id="txtActualOperationExpSubTotal" class="form-control textbox-border-color" disabled />
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                    <%-- </div>--%>
                                                </div>


                                            </div>
                                        </div>


                                        <%--END --%>
                                        <div class="row" style="padding-top: 1%;">


                                            <ul class="accordion">
                                                <li class="accordion__item">
                                                    <a class="accordion__link accordion__link_active">Grand Total</a>

                                                    <ul class="sub-accordion">
                                                        <li class="sub-accordion__item">

                                                            <%-- <div id="divMeetingArea" style="background: rgb(117 75 51 / 9%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">--%>


                                                            <div class="row">

                                                                <div style="width: 60%;">
                                                                </div>
                                                                <div style="width: 40%;">
                                                                    <div class="row">
                                                                        <div style="width: 50%; float: right;">
                                                                            <label for="html5-number-input" class="col-form-label" style="font-size: revert; font-weight: bold;">Expected</label>

                                                                        </div>
                                                                        <div style="width: 50%; float: right;">
                                                                            <label for="html5-number-input" class="col-form-label" style="font-size: revert; font-weight: bold;">Actual</label>

                                                                        </div>

                                                                    </div>
                                                                </div>



                                                            </div>

                                                            <div class="row">

                                                                <div style="width: 60%;">


                                                                    <label for="html5-number-input" class="col-form-label" style="font-weight: bold; font-size: initial;">Total Expenses</label>
                                                                </div>
                                                                <div style="width: 40%;">
                                                                    <div class="row">
                                                                        <div style="width: 50%; float: right;">
                                                                            <input type="text" id="txtGrandTotalTotal" class="form-control textbox-border-color" style="width: 58%;" disabled />
                                                                        </div>
                                                                        <div style="width: 50%; float: right;">
                                                                            <input type="text" id="txtActualGrandTotalTotal" class="form-control textbox-border-color" style="width: 58%;" disabled />
                                                                        </div>
                                                                    </div>
                                                                </div>




                                                            </div>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>

                                        </div>
                                    </div>
                                </div>
                                <%--  </div>--%>

                                <%--For Tab-Attendees--%>

                                     <div class="tab-pane fade" id="tab-Attendees" role="tabpanel">

                                           <div class="row">
                                                <div class="col-12 multi-ddl-owner-div">
                                                     <label for="html5-number-input" class="col-form-label label-custom">Select Attendees <%--<span style="color: red;">*</span>--%></label>
                                                     <div class="">
                                                         <select id="ddlAttendeesMulti" class="form-select color-dropdown ddlAttendeesMulti" multiple>     </select>
                                                     </div>
                                                </div>
                                         </div>

                                    <div class="modal-body" style="overflow-y: auto; max-height: calc(100vh - 180px); overflow-x: hidden">
                                        <div class="" style="margin-top: 1%;">


                                            <table class="table attendees-table" style="width: 100%;">

                                                <thead>
                                                    <tr class="Head-tr">
                                                       <%-- <th style="display: none;">Id</th>--%>
                                                        <th>RefNo</th>
                                                        <th>Branding Id</th>
                                                        <th>EmpNo</th>
                                                        <th>EmpName</th>                                                        
                                                        </tr>
                                                </thead>
                                                <tbody class="tbody-Attendees">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>

                                <%--end here--%>

                                <div class="tab-pane fade" id="tab-AppStatus" role="tabpanel">
                                    <div class="modal-body" style="overflow-y: auto; max-height: calc(100vh - 180px); overflow-x: hidden">
                                        <div class="" style="margin-top: 1%;">


                                            <table class="table Item-table-details" style="width: 100%;">

                                                <thead>
                                                    <tr class="Head-tr">
                                                       <%-- <th style="display: none;">Id</th>--%>
                                                        <th>Role</th>
                                                        <th>User Name</th>
                                                        <th>Status</th>
                                                         <th>Updated Date</th>
                                                        </tr>
                                                </thead>
                                                <tbody class="tbody-ApprovalStatus">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>



                                <div class="tab-pane fade" id="tab-Template" role="tabpanel">
                                    <div class="modal-body" style="overflow-y: auto; max-height: calc(100vh - 180px); overflow-x: hidden">
                                        <div class="" style="margin-top: 1%;">


                                            <table class="table Item-table-details" style="width: 100%;">

                                                <thead>
                                                    <tr class="Head-tr">
                                                        <th style="display: none;">Id</th>
                                                        <th>Description</th>
                                                        <th>File Name</th>
                                                        <th style="display:none;">URL</th>
                                                         <th>Save</th>
                                                       
                                                    </tr>
                                                </thead>
                                                <tbody class="tbody-Template">
                                                </tbody>
                                            </table>
                                        </div>


                                        <div class="Template-Image" style="display:none;text-align:center;" >

                                            <image id="imgTemplate" src=""></image>

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





    <div class="modal fade" id="modalAddNewProduct" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="width: 45%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddNewProduct">NEW PRODUCT</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div style="background: #dbdbdb17; padding: 17px; border-radius: 12px; border: 1px solid #dbd7d6; box-shadow: 0px 0px 13px -7px #444444;">

                        <div class="row">
                            <div class="">
                                <label for="html5-number-input" class="col-form-label label-custom">Item/Description</label>
                                <div>
                                    <input type="text" id="txtItemOrDesc" class="form-control textbox-border-color" />
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="">
                                <label for="html5-number-input" class="col-form-label label-custom">Dimension(M)</label>
                                <div class="row">
                                    <div style="width: 33.33%">
                                        <div class="row">
                                            <div style="width: 30%; padding-top: 4%;">
                                                W :
                                            </div>
                                            <div style="width: 70%">
                                                <input type="text" id="txtWidth" class="form-control textbox-border-color" />
                                            </div>
                                        </div>

                                    </div>

                                    <div style="width: 33.33%">
                                        <div class="row">
                                            <div style="width: 30%; padding-top: 4%;">
                                                L :
                                            </div>
                                            <div style="width: 70%">
                                                <input type="text" id="txtLength" class="form-control textbox-border-color" />
                                            </div>
                                        </div>

                                    </div>
                                    <div style="width: 33.33%">
                                        <div class="row">
                                            <div style="width: 30%; padding-top: 4%;">
                                                H :
                                            </div>
                                            <div style="width: 70%">
                                                <input type="text" id="txtHeight" class="form-control textbox-border-color" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div style="width: 50%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Wight(kg)</label>
                                <div>
                                    <input type="text" id="txtWeight" class="form-control textbox-border-color" />

                                </div>
                            </div>

                            <div style="width: 50%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Electrical Requirement</label>
                                <div>
                                    <input type="text" id="txtElectricalRequirement" class="form-control textbox-border-color" />

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col mb-3 discriptionDiv">
                                <label for="nameBasic" class="form-label">Remarks </label>
                                <textarea class="form-control textbox-border-color" id="txtProductRemarks" rows="3" style="overflow-y: scroll; height: 60px;" placeholder="Enter the Remarks"></textarea>
                            </div>
                        </div>








                        <div class="row">
                            <div style="float: right;">
                                <a href="#" id="btnSubmitProductDet" class="btn btn-primary pull-right" style="float: right;">Submit</a>
                            </div>
                        </div>

                    </div>



                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="ModalStatusHitory" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<h5 class="modal-title" id="lbladdbfloor">Add New Floor</h5>--%>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">



                    <div class="" style="margin-top: 1%;">


                        <table class="table table-bordered Item-table-details" style="width: 100%;">

                            <thead>
                                <tr class="Head-tr">

                                    <th>Stage</th>
                                    <th>Status</th>

                            </thead>
                            <tbody class="tbody-StatusHistory">
                            </tbody>
                        </table>
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
    <script src="Js/BriefForm.js?v=0.7"></script>

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

 <%--   <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />--%>



    <link href="Css/Style.css" rel="stylesheet" />

    <%--  <link href="Css/Badges.scss" rel="stylesheet" />--%>
    <%--<link href="Css/Badges.scss"/>--%>

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>



  <%--  <link href="../Dashboard/assets/multiselect/example-styles.css" rel="stylesheet" />
    <script src="../Dashboard/assets/multiselect/jquery.multi-select.js"></script>--%>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

</asp:Content>

