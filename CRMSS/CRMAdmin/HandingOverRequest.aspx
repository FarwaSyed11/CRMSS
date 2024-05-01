<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="HandingOverRequest.aspx.cs" Inherits="CRMAdmin_HandingOverRequest" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>



       <style type="text/css">
    
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
     .kpi-user-list-table th{
        background-color: #a92828;
        color:white !important;
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
            .overFlowNavKpi{
                 overflow-y: auto;
                height: 565px;
            }
            .accordion li{
                font-size: small;
            }

            .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
    background-color: #e14b4b;
    border-color: #e14b4b;
    box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%);
}
                /*Custom Menu Anwar*/
            .container{
    border-radius:3px;
    padding:5px;
    width: 60%;
    margin: 0 auto;
}

h2{
    font-weight: normal;
    font-size: 25px;
}
h2:hover{
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
    color: #fff;
    background-color: #bb1414;
    border-color: #bb1414;
    transform: translateY(-1px);
}
.btn-primary {
    color: #fff;
    background-color: #d54832;
    border-color: #d54832;
}
/*#DataTables_Table_0_paginate a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}*/

#DataTables_Table_0_paginate .current {
    color: white !important;
    background: #d54832 !important;
}
  .table td{
        
        color:#333333 !important;
    }
.custom-loader{
        text-align: center;
    top: 40%;
    left: 44%;
    position: fixed;
    z-index: 99999999;
    box-shadow: 0px 1px 7px #e14b4b;
    border-radius: 3px;
    background: white;
    width: 10%;
    padding: 10px;
}
.hidden{
    display:none !important;
}
.iconClassExcel{
    margin-left:8px;
    /*background:#933737;*/
    color: #b12020db;
    background-color: #ffffff;
    border: #f9bfa8 1px solid;
    box-shadow: 0 0.125rem 0.25rem 0 rgba(133, 146, 163, 0.4);

}
.iconClassPdf{
    
    background:#933737;
}

.iconClassExcel:hover{
    
    /*background:#a54141;*/
    background:#c9410db8;
}
.iconClassPdf:hover{
    
    background:#a54141;
}
.bg-label-success {
    background-color: #e8fadf !important;
    color: #48a516 !important;
    letter-spacing: 1px;
}
.label-custom {
    color: #d4432c !important;
    font-weight: 400 !important;
    text-transform: capitalize;
    /* padding-top: 3px; */
}
.select2-ddlOwner-container{
    height:35px;
}


.proj-popup .row{
    margin-top:5px;
}
/*table header color*/

/*task table header*/
.task-list-table th{
    color:white !important;
    background-color:#d54832;
}

.task-raised-list-table th{
    color:white !important;
    background-color:#d54832;
}

.fa-icon-color{
    color: #d54832;
}
.dd-menu-proj .dropdown-item:hover{
    color:white;
}

       /*Task Statuses classes*/
.task-status-draft{
    background:#fbc11e;  /*#e97662;*/
       padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 6px;
    color:white;
}
.task-status-Submit{
    /*background: #07aeea;*/
    background: #a7bcee;
    padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 6px;
    color:white;
}
.task-status-inprogress{
    background: #0b9adcbf;
        padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 6px;
    color:white;
}
.task-status-closed{
    background: #98ca3c;
        padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 6px;
    color:white;
}
.task-status-cancelled{
    background: #f56b61;
        padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 6px;
    color:white;
}

/*task priority classes*/
.task-priority-urgent{
    font-size: 11px;
    color: #e93737;
    
}
.task-priority-impo{
    font-size:11px;
    color: Orange;
}
.task-priority-medium{
    font-size:11px;
    color: #80b546;
}
.task-priority-low{
     font-size:11px;
     color: #56b8e6;
}

.dropdown-item:hover, .dropdown-item:focus {
    color: #fff !important;
    background-color: #d19898 !important;
}
.nav-align-top .table:not(.table-dark), .nav-align-top .table:not(.table-dark) thead:not(.table-dark) th, .nav-align-top .table:not(.table-dark) tfoot:not(.table-dark) th, .nav-align-top .table:not(.table-dark) td, .nav-align-right .table:not(.table-dark), .nav-align-right .table:not(.table-dark) thead:not(.table-dark) th, .nav-align-right .table:not(.table-dark) tfoot:not(.table-dark) th, .nav-align-right .table:not(.table-dark) td, .nav-align-bottom .table:not(.table-dark), .nav-align-bottom .table:not(.table-dark) thead:not(.table-dark) th, .nav-align-bottom .table:not(.table-dark) tfoot:not(.table-dark) th, .nav-align-bottom .table:not(.table-dark) td, .nav-align-left .table:not(.table-dark), .nav-align-left .table:not(.table-dark) thead:not(.table-dark) th, .nav-align-left .table:not(.table-dark) tfoot:not(.table-dark) th, .nav-align-left .table:not(.table-dark) td {
    border-color: #e8f3ff !important;
}
           @media (min-width: 1200px) {
               .modal-xl {
                   max-width: 1630px;
               }
           }
           .progrees-bar-grid{
                   font-size: 11px;
                   height: 18px;
                   width: 100px;
                   background: #dddddd52;
                   border-radius: 4px;
           }
  
           /*for tab background*/
.nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
    color: white !important;
    background: #d54832;
    border-color: #fff;
}


/*new loader*/
.loader,
.loader:before,
.loader:after {
  background: #ffffff;
  -webkit-animation: load1 1s infinite ease-in-out;
  animation: load1 1s infinite ease-in-out;
  width: 1em;
  height: 4em;
}
.loader {
  color: #ffffff;
  text-indent: -9999em;
  margin: 88px auto;
  position: relative;
  font-size: 11px;
  -webkit-transform: translateZ(0);
  -ms-transform: translateZ(0);
  transform: translateZ(0);
  -webkit-animation-delay: -0.16s;
  animation-delay: -0.16s;
}
.loader:before,
.loader:after {
  position: absolute;
  top: 0;
  content: '';
}
.loader:before {
  left: -1.5em;
  -webkit-animation-delay: -0.32s;
  animation-delay: -0.32s;
}
.loader:after {
  left: 1.5em;
}
@-webkit-keyframes load1 {
  0%,
  80%,
  100% {
    box-shadow: 0 0;
    height: 4em;
  }
  40% {
    box-shadow: 0 -2em;
    height: 5em;
  }
}
@keyframes load1 {
  0%,
  80%,
  100% {
    box-shadow: 0 0;
    height: 4em;
  }
  40% {
    box-shadow: 0 -2em;
    height: 5em;
  }
}

.select2-container--default .select2-selection--single .select2-selection__rendered {
    line-height: 21px !important;
    height: 21px !important;
}
.accounts-list-table{
     color:white !important;
    background-color:#d54832;
}
.accounts-list-table th{
     color:white !important;    
}
 .tbody-CutomerList tr:hover{
               cursor:pointer;
               --bs-table-accent-bg: cadetblue !important
               
           }
 .Customer-List th{
        background-color: #a92828;
        color:white !important;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div style="padding-left: 2%; padding-right: 2%; padding-top: 1%;">
            <h4 id="RequestHeader" style="text-shadow: 1px -3px 8px; color: #a92828; float: left;">HANDOVER REQUEST</h4>
            <div>
                <a href="#" class="btn btn-primary pull-right btn-add-NewRequest"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; New Request</a>
            </div>

        </div>






        <div class="card-body">

            <div>
                <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                    <tr>
                        <td class="no-border" style="width: 5%">
                            <asp:Label ID="Label8" Text="Status" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                        </td>

                        <td class="no-border" style="width: 18%">

                            <select id="ddlStatus" class="form-select color-dropdown">
                            </select>
                        </td>




                        <td class="no-border" style="width: 5%">

                            <input type="button" id="btnSearch" value="Search" class="btn btn-primary d-block" style="font-size: small" />
                        </td>
                        <td class="no-border"></td>

                    </tr>
                </table>
            </div>


            <div class="ajax-loader loader-bg-blur">
                <div class="custom-loader ">
                    <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
                    <h4>Loading Data...</h4>
                </div>
            </div>

            <div class="" style="margin-top: 1%;">
                <table class="table table-bordered table-striped kpi-user-list-table">

                    <thead>
                        <tr style="height: 50px">
                            <th style="width: 14%; text-align: center; vertical-align: middle">Req Number</th>
                            <th style="width: 12%; text-align: center; vertical-align: middle">Req Date</th>
                              <th class="hidden" style="width: 12%; text-align: center; vertical-align: middle">Req TYPE</th>
                            <th style="width: 12%; text-align: center; vertical-align: middle">Handover From</th>
                            <th class="hidden" style="width: 12%; text-align: center; vertical-align: middle">Handover From</th>
                            <th style="width: 8%; text-align: center; vertical-align: middle">Handover TO</th>
                            <th class="hidden" style="width: 12%; text-align: center; vertical-align: middle">Handover TO</th>
                            <th style="width: 8%; text-align: center; vertical-align: middle">Req By</th>
                            <th style="width: 8%; text-align: center; vertical-align: middle">Status</th>
                            <th style="width: 8%; text-align: center; vertical-align: middle">Action</th>


                        </tr>
                    </thead>
                    <tbody class="tbody-RequestedList">
                    </tbody>
                </table>
            </div>




        </div>
    </div>
    <!--- -->

    
      <%--CREATE THE REQUEST--%>

    
    <div class="modal fade" id="addNewRequest" style="background-color:#00000070;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lbladdRequestModal">Create New Task</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body proj-popup">
       
         <%-- <div class="row">
              <div class="col-12">
                   <label for="html5-number-input" class="col-form-label label-custom">Milestone<span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlMilestoneForTask" class="form-select color-dropdown">  </select>
                   </div>
              </div>
          </div>--%>


          <div class="row">
              <div class="col-4">
                  <label class="col-form-label label-custom" for="basic-default-name">Req Type</label>
                                        <div>
                                            <select id="ddlReqTypeNew" class="form-select color-dropdown">                                               
                                                <option value="-1">---Select----</option>
                                                <option value="Marketing">Marketing</option>
                                                <option value="Sales">Sales</option>
                                            </select>
                                        </div>


               
              </div>

           
          </div>

            <div class="row">
              <div class="col-12 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">Hand Over From  <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlFromOwner" class="form-select color-dropdown ddlFromOwner">     </select>
                      <%--<input type="text" id="ddlOwner" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly" />--%> 
                   </div>
              </div>
          </div>

    
          
          <div class="row">
              <div class="col-12 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">Hand Over To <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlToOwner" class="form-select color-dropdown ddlToOwner">     </select>
                      <%--<input type="text" id="ddlOwner" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly" />--%> 
                   </div>
              </div>
          </div>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnSaveNewRquest">Create</button>
      </div>
    </div>
  </div>
</div>

    <%--END--%>





     <%--HANDING OVER REQUEST DETAIL MODAL--%>

    <div class="modal fade" id="mdReqDetails" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title" id="lblReqDetailModal">Handing over Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div style="background: #e14f0c17; padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">

                        <div class="row">

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Request Number</label>
                                <div class="">
                                    <%--<input class="form-control" type="text" value="" id="txtProjectName1">--%>
                                    <label id="lblReqNumberE"></label>
                                </div>
                            </div>

                            <div style="width: 10%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Status</label>
                                <div class="">

                                    <%--  <select id="ddlStatus1" class="form-select color-dropdown">
                                                <option value="Not Started" selected="">Not Started</option>
                                                <option value="Open">Open</option>
                                                <option value="In Progress">In Progress</option>
                                                <option value="Closed">Closed</option>
                                                <option value="Cancelled">Cancelled</option>
                                            </select>    --%>
                                    <label id="lbStatusE"></label>

                                </div>
                            </div>
                            <div style="width: 10%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Type</label>
                                <div class="">
                                    <%--<select id="ddlPriority1" class="form-select color-dropdown">                                               
                                                <option value="Urgent" selected=""> Urgent</option>
                                                <option value="Important">  Important</option>
                                                <option value="Medium">  Medium</option>
                                                <option value="Low">  Low</option>
                                            </select>--%>
                                    <label id="lblTypeE"></label>
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Handing Over From </label>
                                <div class="">
                                    <%--<select id="ddlOwner1" class="form-select color-dropdown">     </select>--%>
                                    <label id="lbFromOwnerE"></label>
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Handing Over To</label>
                                <div class="">
                                    <label id="lbToOwnerE"></label>
                                </div>
                            </div>

                            <div style="width: 10%; text-align: left;">
                                <label for="html5-number-input" class="col-form-label label-custom">Requested Date</label>
                                <div class="">
                                    <%--<input class="form-control" type="text" value="" id="projStartDate1">--%>
                                    <label id="lbReqDateE"></label>
                                </div>
                            </div>

                            <div style="width: 10%; text-align: left;">
                                <label for="html5-number-input" class="col-form-label label-custom">Requested By</label>
                                <div class="">
                                    <%--<input class="form-control" type="text" value="" id="projDueDate1">--%>
                                    <label id="lbReqByE"></label>
                                </div>
                            </div>
                        </div>




                    </div>


                    <div style="margin-top: 1.5%;">

                        <div class="nav-align-top">
                            <ul class="nav nav-tabs" id="mstone-task-modal-ul" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-accounts" aria-controls="navs-top-accounts" aria-selected="true">Accounts</button>
                                </li>
                                <li class="nav-item" style="display: none">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-tasks" aria-controls="navs-top-tasks" aria-selected="false">Projects</button>
                                </li>
                                <li class="nav-item" style="display: none">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-members" aria-controls="navs-top-members" aria-selected="false">Opportunities</button>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <%--1st--%>
                                <div class="tab-pane fade show active" id="navs-top-accounts" role="tabpanel" style="margin-top: -2%;">

                                    <div>
                                        <a href="#" style="margin-bottom:5px" class="btn btn-primary pull-right btn-add-accounts-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Account</a>
                                    </div>

                                    <div class="" style="margin-top: 1%;">
                                        <table class="table  accounts-header" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead class="thead-accounts-list accounts-list-table">
                                                
                                            </thead>
                                            <tbody class="tbody-accounts-list " style="text-align: center;">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <%--2nd--%>
                                <div class="tab-pane fade" id="navs-top-tasks" role="tabpanel">

                                    <div>
                                        <a href="#" class="btn btn-primary pull-right btn-add-task-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Task</a>
                                    </div>

                                    <div class="" style="margin-top: 0%;">
                                        <table class="table task-list-table" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th>NAME</th>
                                                    <th style="text-align: left;">PRIORITY</th>
                                                    <th style="width: 95px !important">STATUS</th>
                                                    <th>OWNER</th>
                                                    <th>Start Date</th>
                                                    <th>DUE DATE </th>
                                                    <th>CREATED DATE </th>
                                                    <th>MILESTONE </th>
                                                    <th>Task % </th>
                                                    <th>ACTION </th>
                                                </tr>
                                            </thead>
                                            <tbody class="tbody-task-list" style="text-align: center;">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <%--3rd--%>
                                <div class="tab-pane fade" id="navs-top-members" role="tabpanel">

                                    <div>
                                        <a style="margin-top: -1.7%;" href="#" class="btn btn-primary pull-right btn-add-member-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Members</a>
                                    </div>

                                    <div class="" style="padding-top: 2%;">
                                        <table class="table members-list-table" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th style="text-align: left; width: 50%;">NAME</th>
                                                    <th style="width: 12%;">PROJECT ROLE</th>
                                                    <th style="width: 20%;">STATUS</th>
                                                    <th style="width: 18%;">ACTION </th>
                                                </tr>
                                            </thead>
                                            <tbody class="tbody-members-list" style="text-align: center;">
                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                            </div>
                        </div>

                    </div>



                    <%--Grid--%>
                </div>
                <%--  <div class="modal-footer">
                 <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                 <button type="button" class="btn btn-primary">Save changes</button>
               </div>--%>
            </div>
        </div>
    </div>

    <%--end--%>


       <!-- Customer Search Popup -->
  <div class="modal fade" id="mpSearchCustomer" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 92vw!important; top: 10%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Customer List</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                  
                </div>
                <div class="modal-body" >
                    <div class="row">
                        <table class="table table-bordered  Customer-List" style="width:100%" id="tblCustomerList">
  
    <thead>
     <tr style="height:50px">
            <th class="hidden" style="width:14%;text-align:center;vertical-align:middle">CRMAccountId</th>
             <th style="width:20%;text-align:center;vertical-align:middle">Account Name</th>
              <th style="width:14%;text-align:center;vertical-align:middle">Category</th>
               <th style="width:14%;text-align:center;vertical-align:middle">Last Assignment Date</th>
                <th style="width:14%;text-align:center;vertical-align:middle">Account Status</th>
                <th style="width:14%;text-align:center;vertical-align:middle">Relation %</th>
                <th style="width:17%;text-align:center;vertical-align:middle">Assessment</th>
                <th style="width:5%;text-align:center;vertical-align:middle">No of Project/Opportunity</th>
                
        </tr>
    </thead>
    <tbody class="tbody-CutomerList">

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
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
	<!-- Datatable plugin JS library file -->	

     <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

     <script src="Script/HandingOverRequest.js?v=2.9"></script>
   
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


       <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>


</asp:Content>