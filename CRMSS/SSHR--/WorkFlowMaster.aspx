<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="WorkFlowMaster.aspx.cs" Inherits="SSHR_WorkFlowMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>


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

        .WorkFlow-table-details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .WorkFlow-table-details td {
            border-bottom: 1px solid #96a2ab45 !important;
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

        .tbody-WorkFlow .ibtn-Request-Details:hover {
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
       .animated-button2:hover {
    color: ghostwhite !important;
    background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px);
;
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <%--<div class="ajax-loader loader-bg-blur">
          <div class="custom-loader ">
              <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
              <h4>Loading Data...</h4>
          </div>
      </div>--%>


      <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

       <div style="padding-left: 2%; padding-top: 1%;"> <h5 style="color: #a92828; margin-top:13px">WORK FLOW</h5></div> 

  <div class="card-body" style="margin-top: -1%;zoom:90%;">
      <div style="padding-bottom: 2%;">
      <a href="#" id="btnAddNewWorkFlow" class="animated-button1 WFAdd" style="float:right;font-size:smaller;"><%--<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;--%><span></span><span></span><span></span><span></span><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</a>
          </div>

      <%--SSHR Work--%>
        
       <div class="" style="margin-top: 1%;">
           
          <table class="table WorkFlow-table-details" style="width:100%;">

              <thead>
                  <tr> 
                      <th style="width:8%;display:none;">Work FlowId</th>
                      <th style="width:10%;">Work Flow Name</th>
                       <th style="width:10%;">Organization</th>
                     <%-- <th style="width:6%;">Description</th>--%>
                      <th style="width:14%;">Description</th>
                      <th style="width:12%;">Request Type</th>
                      <th style="width:8%;">Enabled</th>
                      <th style="width:8%;">View</th>
                    <%--  <th style="width:8%;">IspaidLeave</th>
                      <th style="width:6%;">Action</th>                  --%>

              </thead>
              <tbody class="tbody-WorkFlow">
              </tbody>
          </table>
      </div>



    </div>   <%--card-body end--%>
</div>


    <div class="modal fade" id="modalWorkFlowDet" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="WorkFlowDet">WORKFLOW DETAILS</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">



                    <div class="card-body" style="margin-top: -2%;">
                        <div class="nav-align-top tab-Inspections">

                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Stage" aria-controls="tab-Stage" aria-selected="true">STAGE</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Employee" aria-controls="tab-Employee" aria-selected="false">EMPLOYEE</button>
                                </li>



                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="tab-Stage" role="tabpanel">


                                    <div class="" style="margin-top: 1%;">
                                        <div style="padding-bottom: 2%;">
                                          <%--  <a href="#" id="btnAddNewStage" class="btn btn-primary" style="float: right;"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</a>--%>
                                            <a href="#" id="btnAddNewStage" class="animated-button2 Popup-Add" style="float:right;font-size:smaller;"><%--<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;--%><span></span><span></span><span></span><span></span><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</a>
                                        </div>

                                        <table class="table table-bordered stage-Details-table" style="width:100%;">


                                            <thead>
                                                <tr>
                                                    <%--<th>Id</th>--%>
                                                    <th style="display:none;">StageId</th>
                                                    <th>Order Number</th>
                                                    <th>Stage</th>
                                                    <th>Description</th>
                                                    <th>CreatedBy</th>
                                                    <th>Created Date</th>
                                                    <th>Enabled </th>
                                                   
                                                   
                                                    <%--<th>Status</th>--%>

                                                   <%-- <th style="width: 10%;">Action</th>--%>
                                                </tr>
                                            </thead>


                                            <tbody class="tbody-Stage">
                                            </tbody>
                                        </table>
                                    </div>


                                     <div class="div-Autority-table" style="margin-top: 3%;display:none;">
                                          <div style="padding-left: 2%; padding-top: 1%;"> <h4 style="color: #a92828; margin-top:13px">AUTHORITY</h4></div> 
                                         <div style="padding-bottom: 2%;">
                                           <%-- <a href="#" id="btnAddNewAuthority" class="btn btn-primary" style="float: right;"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</a>--%>
                                              <a href="#" id="btnAddNewAuthority" class="animated-button2 Popup-Add" style="float:right;font-size:smaller;"><%--<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;--%><span></span><span></span><span></span><span></span><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</a>
                                        </div>

                                        <table class="table table-bordered Authority-Details-table" style="width:100%;">


                                            <thead>
                                                <tr>
                                                    <%--<th>Id</th>--%>
                                                    <th style="display:none;">AuthorityId</th>
                                                    <th>Authority</th>
                                                    <th>Description</th>
                                                    <th>CreatedBy</th>
                                                    <th>CreatedDate</th>
                                                    <th>Enabled</th>
                                                   <%-- <th>Enabled </th>
                                                    <th>View</th>--%>
                                                   
                                                    <%--<th>Status</th>--%>

                                                   <%-- <th style="width: 10%;">Action</th>--%>
                                                </tr>
                                            </thead>


                                            <tbody class="tbody-Authority">
                                            </tbody>
                                        </table>
                                    </div>



                                </div>

                                <div class="tab-pane fade" id="tab-Employee" role="tabpanel">

                                    <div class="" style="margin-top: 1%;">
                                        <div style="padding-bottom: 2%;">
                                         <%--   <a href="#" id="btnAddNewEmployee" class="btn btn-primary" style="float: right;"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</a>--%>
                                             <a href="#" id="btnAddNewEmployee" class="animated-button2 Popup-Add" style="float:right;font-size:smaller;"><%--<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;--%><span></span><span></span><span></span><span></span><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</a>
                                        </div>

                                        <table class="table table-bordered employee-Details-table" style="width: 100%;">


                                            <thead>
                                                <tr>
                                                    <%--<th>Id</th>--%>
                                                    <th style="display: none;">EmployeeId</th>
                                                    <th>Employee Name</th>
                                                    <th>Description</th>
                                                    <th>CreatedBy</th>
                                                    <th>Created Date</th>
                                                    <th>Enabled</th>
                                                  



                                                    <%--<th style="width: 10%;">Action</th>--%>
                                                </tr>
                                            </thead>


                                            <tbody class="tbody-Employee">
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>



                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="modalAddNewWorkFlow" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="width:45%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddNewWorkFlow">NEW WORKFLOW</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="Estimation-details-rectangle-div" style="background: #dbdbdb17; padding: 17px; border-radius: 12px; border: 1px solid #dbd7d6;box-shadow: 0px 0px 13px -7px #444444;"> 

                    <div class="row">
                        <div class="">
                            <label for="html5-number-input" class="col-form-label label-custom">Organization</label>
                            <div>
                                <select id="ddlWFOrg" class="form-control textbox-border-color" >
                                    </select>
                            </div>
                        </div>
                    </div>

                     <div class="row">
                        <div class="">
                            <label for="html5-number-input" class="col-form-label label-custom">WorkFlow Name</label>
                            <div>
                                <input type="text" id="txtWFName" class="form-control textbox-border-color" />
                                    
                            </div>
                        </div>
                    </div>

                     <div class="row">
                        <div class="">
                            <label for="html5-number-input" class="col-form-label label-custom">Description</label>
                            <div>
                                <input type="text" id="txtWFDescription" class="form-control textbox-border-color" />
                                    
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="div-consultedDoctor">
                            <label for="html5-number-input" class="col-form-label label-custom">Is Enable</label>
                            <div>
                                <div class="netliva-switch">
                                    <input type="checkbox" id="cbIsEnabled" netliva-switch="OK">
                                    <label for="cbIsEnabled" data-active-text="Enable" data-passive-text="disable" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696;max-width:55%"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                         <div class="row">
                             <div style="float:right;">
                        <a href="#" id="btnSubmitWFDet" class="btn btn-primary pull-right" style="float:right;">Submit</a>
                                 </div>
                             </div>

                        </div>



                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>



      <div class="modal fade" id="modalAddNewStage" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="width:45%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddNewStage">NEW STAGE</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div style="background: #dbdbdb17; padding: 17px; border-radius: 12px; border: 1px solid #dbd7d6;box-shadow: 0px 0px 13px -7px #444444;"> 

                    <div class="row">
                        <div class="">
                            <label for="html5-number-input" class="col-form-label label-custom">Order Number</label>
                            <div>
                                 <input type="text" id="txtStgOrderNo" class="form-control textbox-border-color" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                            </div>
                        </div>
                    </div>

                     <div class="row">
                        <div class="">
                            <label for="html5-number-input" class="col-form-label label-custom">Stage</label>
                            <div>
                                <input type="text" id="txtStageName" class="form-control textbox-border-color" />
                                    
                            </div>
                        </div>
                    </div>

                     <div class="row">
                        <div class="">
                            <label for="html5-number-input" class="col-form-label label-custom">Description</label>
                            <div>
                                <input type="text" id="txtstgDescription" class="form-control textbox-border-color" />
                                    
                            </div>
                        </div>
                    </div>

                          <div class="row">
                        <div class="">
                            <label for="html5-number-input" class="col-form-label label-custom">Back Step</label>
                            <div>
                                <input type="text" id="txtStgBackStep" class="form-control textbox-border-color" onkeypress="return event.charCode >= 48 && event.charCode <= 57"/>
                                    
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div style="width:20%;" class="div-consultedDoctor">
                            <label for="html5-number-input" class="col-form-label label-custom">Is Enable</label>
                            <div>
                                <div class="netliva-switch">
                                    <input type="checkbox" id="cbStgIsEnabled" netliva-switch="OK">
                                    <label for="cbStgIsEnabled" data-active-text="Enable" data-passive-text="disable" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696;max-width:55%"></label>
                                </div>
                            </div>
                        </div>


                         <div style="width:20%;" class="div-consultedDoctor">
                            <label for="html5-number-input" class="col-form-label label-custom">Back Step</label>
                            <div>
                                <div class="netliva-switch">
                                    <input type="checkbox" id="cbStgBackStep" netliva-switch="OK">
                                    <label for="cbStgBackStep" data-active-text="Enable" data-passive-text="disable" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696;max-width:55%"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                         <div class="row">
                             <div style="float:right;">
                        <a href="#" id="btnSubmitStgDet" class="btn btn-primary pull-right" style="float:right;">Submit</a>
                                 </div>
                             </div>

                        </div>



                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>



     <div class="modal fade" id="modalAddNewAuthority" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="width:45%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddNewAuthority">NEW AUTHORITY</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div style="background: #dbdbdb17; padding: 17px; border-radius: 12px; border: 1px solid #dbd7d6;box-shadow: 0px 0px 13px -7px #444444;"> 

                    <div class="row">
                        <div class="">
                            <label for="html5-number-input" class="col-form-label label-custom">Authority</label>
                            <div>
                                 <input type="text" id="txtAuthorityName" class="form-control textbox-border-color" />
                            </div>
                        </div>
                    </div>

                     <div class="row">
                        <div class="">
                            <label for="html5-number-input" class="col-form-label label-custom">Description</label>
                            <div>
                                <input type="text" id="txtAuthDescription" class="form-control textbox-border-color" />
                                    
                            </div>
                        </div>
                    </div>

                     <div class="row">
                        <div class="">
                            <label for="html5-number-input" class="col-form-label label-custom">Role</label>
                            <div>
                                <select id="ddlAuthRole" class="form-control textbox-border-color" >
                                    </select>
                                    
                            </div>
                        </div>
                    </div>

                       

                    <div class="row">
                        <div class="div-consultedDoctor">
                            <label for="html5-number-input" class="col-form-label label-custom">Is Enable</label>
                            <div>
                                <div class="netliva-switch">
                                    <input type="checkbox" id="cbAuthIsEnabled" netliva-switch="OK">
                                    <label for="cbAuthIsEnabled" data-active-text="Enable" data-passive-text="disable" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696;max-width:55%"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                         <div class="row">
                             <div style="float:right;">
                        <a href="#" id="btnSubmitAuthDet" class="btn btn-primary pull-right" style="float:right;">Submit</a>
                                 </div>
                             </div>

                        </div>



                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>



     <div class="modal fade" id="modalAddNewEmployee" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="width:45%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddNewEmployee">NEW AUTHORITY</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div style="background: #dbdbdb17; padding: 17px; border-radius: 12px; border: 1px solid #dbd7d6;box-shadow: 0px 0px 13px -7px #444444;"> 

                    <div class="row">
                        <div class="">
                            <label for="html5-number-input" class="col-form-label label-custom">Employee Name</label>
                            <div>
                                 <input type="text" id="txtEmpName" class="form-control textbox-border-color" />
                            </div>
                        </div>
                    </div>

                     <div class="row">
                        <div class="">
                            <label for="html5-number-input" class="col-form-label label-custom">Description</label>
                            <div>
                                <input type="text" id="txtEmpDescription" class="form-control textbox-border-color" />
                                    
                            </div>
                        </div>
                    </div>

                   <%--  <div class="row">
                        <div class="">
                            <label for="html5-number-input" class="col-form-label label-custom">Role</label>
                            <div>
                                <select id="ddlAuthRole" class="form-control textbox-border-color" >
                                    </select>
                                    
                            </div>
                        </div>
                    </div>--%>

                       

                    <div class="row">
                        <div class="div-consultedDoctor">
                            <label for="html5-number-input" class="col-form-label label-custom">Is Enable</label>
                            <div>
                                <div class="netliva-switch">
                                    <input type="checkbox" id="cbEmpIsEnabled" netliva-switch="OK">
                                    <label for="cbEmpIsEnabled" data-active-text="Enable" data-passive-text="disable" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696;max-width:55%"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                         <div class="row">
                             <div style="float:right;">
                        <a href="#" id="btnSubmitEmpDet" class="btn btn-primary pull-right" style="float:right;">Submit</a>
                                 </div>
                             </div>

                        </div>



                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>



      <script type="text/javascript">
                var currUserId = '';   
                var EmpNo = '';
                var myrole = '';
                var overAllPerfo=0;
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
    <script src="Scripts/WorkFlowMaster.js?v=0.5"></script>

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


	<!-- Datatable plugin JS library file -->	
   
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
   
        <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
        <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <link href="Css/SSHRStyle.css" rel="stylesheet" />
     <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

    <link href="../Dashboard/assets/multiselect/example-styles.css" rel="stylesheet" />
    <script src="../Dashboard/assets/multiselect/jquery.multi-select.js"></script>

       <link href="../TODONew/Asset/css/netliva_switch.css"  rel="stylesheet" />
      <script src="../TODONew/Asset/js/netliva_switch.js"></script>

</asp:Content>
