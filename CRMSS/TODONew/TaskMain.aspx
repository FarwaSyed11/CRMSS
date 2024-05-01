<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="TaskMain.aspx.cs" Inherits="TODONew_TaskMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
      <link href="Asset/css/todonew.css?v=3.11" rel="stylesheet" />
 
       <style type="text/css">
    
           .flatpickr-month {
    border-radius: 3px 3px 0 0 !important;
    background: #ef5350 !important;
    color: #fff !important;
    fill: #fff !important;
    padding: 4px 0 0 !important;
    text-align: center !important;
}
           .flatpickr-monthDropdown-months{
               background: #993d3d57 !important;
           }
           .flatpickr-weekdays{
               background: #ef5350 !important;
           }
           .flatpickr-next-month{
               color:white !important;
               fill:white !important;
               font-weight:bold !important;
           }
           .flatpickr-prev-month{
               color:white !important;
               fill:white !important;
               font-weight:bold !important;
           }
          
           .flatpickr-months .flatpickr-prev-month:hover, .flatpickr-months .flatpickr-next-month:hover {
    color: white !important;
}
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
     .kpi-user-list-table th{
        background-color: #a92828;
        color:white !important;
    }
       .my-team-table th{
        background-color: #d54832;
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
.proj-popup-tkt .row{
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
.task-list-cust-represent th{
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


.task-tag-history{
    font-weight: 500;
    border: solid 1px #e1440bd4;
    padding: 3px 4px 1px 4px;
    background: #da3a0ede;
    color: white;
    cursor: pointer;
    font-size: 13px;
    box-shadow: 0px 0px 1px 3px #cf3c07cf;
}

.footer-mychat{
   background-color: #d9e7e5;
    text-align: right;
    bottom: 100px;
    position: fixed;
    width: 54%;
    height: 39px;
    display: inline-flex;
    border-bottom-right-radius: 11px;
    border-top-right-radius: 11px;
}

/*chatbox messages containers*/
.container {
  /*border: 2px solid #dedede;
  background-color: #f1f1f1;*/

  border: 2px solid #dedede30;
  background-color: #f5f5f536;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
  width:100%;
}

.darker {
  /*border-color: #ccc;
  background-color: #ddd;*/

      /*border-color: #00aed61a;*/   /*blue shade*/
    /*background-color: #00aed659;*/   /*blue shade*/

    border: 2px solid #dedede30;
    background-color: #f5f5f5;
    /*color:#1283aa;*/
}

.container::after {
  content: "";
  clear: both;
  display: table;
}

.container img {
  float: left;
  max-width: 60px;
  width: 100%;
  margin-right: 20px;
  border-radius: 50%;
}

.container img.right {
  float: right;
  margin-left: 20px;
  margin-right:0;
}

.time-right {
  float: right;
  color: #aaa;
  font-size:11px;
}

.time-left {
  float: left;
  color: #999;
  font-size:11px;
}
.circle-chat-member1 {
 display: inline-block;
    background-color: #00b9d5;
    margin: 0px;
    border-radius: 50%;
        float: right;
    max-width: 60px;
    /* width: 61%; */
    margin-right: 20px;
    border-radius: 50%;
}
.circle-chat-member2 {
 display: inline-block;
    background-color: #8682d6;
    margin: 0px;
    border-radius: 50%;
        float: left;
    max-width: 60px;
    /* width: 61%; */
    margin-right: 20px;
    border-radius: 50%;
}

.circle-inner {
color: white;
    display: table-cell;
    vertical-align: middle;
    text-align: center;
    text-decoration: none;
    height: 33px;
    width: 35px;
    font-size: 18px;
}

/*.nav-pills .nav-link.active, .nav-pills .nav-link.active:hover, .nav-pills .nav-link.active:focus {
    background-color: #34b8ed;
    color: #fff;
    box-shadow: 0 2px 4px 0 #34b8ed85;
}*/

.chat-tab-parent-div-tkt .nav-pills .nav-link.active, .nav-pills .nav-link.active:hover, .nav-pills .nav-link.active:focus {
    /*background-color: #34b8ed00;
    color: #fb8768;
    border-bottom: #fb8768 3px solid;
    box-shadow: 0px 0px 0px 0px;
    border-radius:0px;*/

    background-color: #34b8ed00;
    color: #ffa606;
    border-bottom: #ffa606 3px solid;
    box-shadow: 0px 0px 0px 0px;
    border-radius: 0px;
}

.chat-tab-parent-div .nav-pills .nav-link.active, .nav-pills .nav-link.active:hover, .nav-pills .nav-link.active:focus {
    background-color: #34b8ed00;
    color: #ffa606;
    border-bottom: #ffa606 3px solid;
    box-shadow: 0px 0px 0px 0px;
    border-radius: 0px;
}
/*.chat-tab-parent-div-tkt .nav-pills .nav-link:not(.active, .disabled) {
    color: #ffffff;
}*/
.chat-tab-parent-div-tkt .nav-pills .nav-link:not(.active, .disabled) {
    color: #5a5454;
}

.unseen-msg-count{   
    /*position: absolute;
    padding: 2px 8px;
    border-radius: 50%;
    background-color: #e85b5b;
    color: white;
    margin: -10px 0px 0px -19px;
    font-size: 11px;
    box-shadow: 0px 0px 7px 1px #e85b5b;*/
      position: absolute;
    border-color: transparent;
    color: #ea1919;
    margin: -21px 0px 0px 7px;
}
.chat-msg-parent-div{
   
    /*background-image: url("/todoNew/Asset/chat-bg1.jpg")*/
}
.chat-attach-table th{
    color:white !important;
    background-color:#d54832;
}

 
   /*dad*/
 

   /*background color-profile li form options*/
   /*.select2-results { background-color: #f03a0a14 !important; }*/
   /*.select2-dropdown {
    background-color: white;
    border: 1px solid #e44c1666;
    border-radius: 4px;
    box-sizing: border-box;
    display: block;
    position: absolute; 
    width: 100%;
    z-index: 1051;
    
    margin: -26px 0px 0px -26px;
}*/

   /* reducing width color-profile select 2*/
  .select2-dropdown > .select2-results > #select2-ddlFilterAssignedToMeTask-results{
      background-color: white;
    border: 1px solid #e44c1666;
    border-radius: 4px;
    box-sizing: border-box;
    display: block;
    position: absolute;
    /* left: -100000px; */
    /*width: 100%;*/
    z-index: 1051;
    width: 436.211px !important;
    margin: -26px 0px 0px -26px;
  }
  .table tr:hover{
      background:#fff6f0 !important;
  }
 
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   

 <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
      
  <div class="card-body" style="margin-top: -1%; min-height:85vh;">
      <%--<h2 style="padding:3px"></h2>--%>
    
      <h4 style="color: #a92828; margin-top:13px">Task List </h4>
       <div class="nav-align-top row" >
                      <ul class="nav nav-tabs" id="task-ul" role="tablist">
                           <li class="nav-item">
                          <button type="button" class="nav-link cust-represent-tab hidden" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-cust-representator">Customer Representative</button>
                        </li>
                          <li class="nav-item">
                          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-involved-task">Assigned to Me</button>
                        </li>
                        <li class="nav-item">
                          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-my-task">Raised By Me</button>
                        </li>                                            
                      <li class="nav-item">
                          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-my-team">My Team Task</button>
                        </li> 
                      </ul>
                      <div class="tab-content" style="zoom:90%;">

                             <div class="tab-pane fade cust-represent-tab hidden" id="navs-top-cust-representator" >                         
                         
                               <div class="row" style="display: flex;justify-content: flex-end;margin-top:-25px;">
                                   
                                   <div class="col-md-1">
                                       <label><i class="bx bx-search-alt-2" style="margin-top: -7px; font-size: 26px;color:#7fa3ff;"></i></label>
                                       <label for="html5-number-input" class="col-form-label label-custom">Task Status</label>
                                   </div>
                                                <div class="col-md-2">
                                                    <select id="ddlFilterTask" class="form-select color-dropdown ddlFilterTask">     
                                                        <option value="-1">All</option>
                                                        <%--<option value="Not Started">Not Started</option>--%>
                                                        <option value="Requested" selected>Requested</option>
                                                        <option value="Assigned">Assigned</option>
                                                        <option value="Started">Started</option>
                                                        <option value="Completed">Completed</option>
                                                        <option value="Cancelled">Cancelled</option>
                                                        <option value="Rejected">Rejected</option>
                                                    </select>                                                    
                                                </div>
                                   <div class="col-md-1"> <input type="button" id="btnSearchTask" value="Search" class="btn btn-primary d-block" style="font-size:small"> </div>
                                           <%--<input type="text" id="ddlOwner" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly" />--%> 
                                      
                               </div>
                               
                                   <div class="table-responsive" style="margin-top: 0%;">
                                         <table class="table task-list-cust-represent" style="width: 100%;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr style="text-align:center;">
                                               <th>TASK CODE</th>
                                               <th style="padding-right: 310px;text-align: left;">NAME</th>
                                               <th style="text-align:left;text-align: left;">PRIORITY</th>
                                               <th>STATUS</th>
                                               <th style="padding-right: 130px;">OWNER</th>
                                               <th>Start Date</th>
                                               <th>DUE DATE </th>
                                                 <th>CREATED DATE </th> 
                                                 <%--<th>MILESTONE </th>--%> 
                                                 <th>Task % </th> 
                                                 <th>Requested By</th>
                                                  <th style="padding-left:52px;">ACTION </th>                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-task-cust-represent" style="text-align:center;">

                                           </tbody>
                                         </table>
                                </div>
                                                              
                        </div>

                              <div class="tab-pane fade" id="navs-top-involved-task">
                           <div class="row">  <%--style="display: flex;justify-content: flex-end;"--%>
                             
                               <div class="col-md-3">

                                     <div class="row" style="/*display: flex;justify-content: flex-end;margin-top:-25px;*/">
                                   
                                   <div class="col-md-3">
                                       <label><i class="bx bx-search-alt-2" style="margin-top: -7px; font-size: 26px;color:#7fa3ff;"></i></label>
                                       <label for="html5-number-input" class="col-form-label label-custom">Task Status</label>
                                   </div>
                                                <div class="col-md-9">
                                                    <select id="ddlFilterAssignedToMeTask" class="form-select color-dropdown" multiple>     
                                                        <%--<option value="-1">All</option>--%>
                                                        <%--<option value="Not Started">Not Started</option>--%>
                                                        <option value="Requested" >Requested</option>
                                                        <option value="Assigned" selected>Assigned</option>
                                                        <option value="Started" selected>Started</option>
                                                        <option value="Completed">Completed</option>
                                                        <option value="Cancelled">Cancelled</option>
                                                        <option value="Rejected">Rejected</option>
                                                    </select>                                                    
                                                </div>
                                   <%--<div class="col-md-1"> <input type="button" id="btnSearchTask" value="Search" class="btn btn-primary d-block" style="font-size:small"> </div>--%>
                                      
                               </div>

                               </div>
                               
                               <div class="col-md-2">
                                   <div class="row">
                                        <div class="col-md-3"> <label for="html5-number-input" class="col-form-label label-custom">From Date</label> </div>
                                        <div class="col-md-9"> <input type="text" id="filterStDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly"> </div>
                                   </div>
                               </div>
                               
                               <div class="col-md-2">
                                   <div class="row">
                                        <div class="col-md-3"> <label for="html5-number-input" class="col-form-label label-custom">To Date</label> </div>
                                        <div class="col-md-9"> <input type="text" id="filterEndDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly"> </div>
                                   </div>
                               </div>
                               
                               <div class="col-md-2"> </div>
                               <div class="col-md-3">
                                   <a href="#" class="btn btn-primary btn-add-task-grid" style="float:right;"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Task</a>

                               </div>
                               
                         </div>
                         
                                   
                                <div class="table-responsive" style="margin-top: 1%;">
                                         <table class="table task-list-table" style="width: 100%;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr style="text-align:center;">
                                               <th>TASK CODE</th>
                                               <th style="padding-right: 310px;text-align: left;">NAME</th>
                                               <th style="text-align:left;">PRIORITY</th>
                                               <th>STATUS</th>
                                               <th style="padding-right: 130px;text-align: left;">Project</th>
                                               <th>Start Date</th>
                                               <th>DUE DATE </th>
                                                 <th>CREATED DATE </th> 
                                                 <%--<th>MILESTONE </th>--%> 
                                                 <th>Task % </th> 
                                                 <th>Assigned By</th>
                                                  <th style="padding-right: 40px;">ACTION </th>                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-task-list" style="text-align:center;">

                                           </tbody>
                                         </table>
                               </div>
                        </div>

                        <div class="tab-pane fade" id="navs-top-my-task">
                                                 
                              <div class="row" style="/*display: flex;justify-content: flex-end;margin-top:-25px;*/">
                                   
                                <div class="col-md-3">

                                  <div class="row" style="/*display: flex;justify-content: flex-end;margin-top:-25px;*/">
                                   
                                   <div class="col-md-3">
                                       <label><i class="bx bx-search-alt-2" style="margin-top: -7px; font-size: 26px;color:#7fa3ff;"></i></label>
                                       <label for="html5-number-input" class="col-form-label label-custom">Task Status</label>
                                   </div>
                                                <div class="col-md-9">
                                                    <select id="ddlFilterRaisedbyMeTask" class="form-select color-dropdown" multiple>     
                                                        <%--<option value="-1">All</option>--%>
                                                        <%--<option value="Not Started">Not Started</option>--%>
                                                        <option value="Requested" >Requested</option>
                                                        <option value="Assigned" selected>Assigned</option>
                                                        <option value="Started" selected>Started</option>
                                                        <option value="Completed">Completed</option>
                                                        <option value="Cancelled">Cancelled</option>
                                                        <option value="Rejected">Rejected</option>
                                                    </select>                                                    
                                                </div>
                                   <%--<div class="col-md-1"> <input type="button" id="btnSearchTask" value="Search" class="btn btn-primary d-block" style="font-size:small"> </div>--%>
                                      
                               </div>

                               </div>
                               
                                <div class="col-md-2">
                                   <div class="row">
                                        <div class="col-md-3"> <label for="html5-number-input" class="col-form-label label-custom">From Date</label> </div>
                                        <div class="col-md-9"> <input type="text" id="filterStDateRT" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly"> </div>
                                   </div>
                               </div>
                               
                               <div class="col-md-2">
                                   <div class="row">
                                        <div class="col-md-3"> <label for="html5-number-input" class="col-form-label label-custom">To Date</label> </div>
                                        <div class="col-md-9"> <input type="text" id="filterEndDateRT" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly"> </div>
                                   </div>
                               </div>
                               
                               <div class="col-md-2"> </div>
                               
                               <div class="col-md-3">
                                   <a href="#" class="btn btn-primary btn-add-task-grid" style="float:right;"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Task</a>

                               </div>
                          </div>

                                <div class="task-raised-list-table-div table-responsive" style="margin-top: 1%;">
                                         <table class="table task-raised-list-table" style="width: 100%;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr style="text-align:center;">
                                               <th>TASK CODE</th>
                                               <th style="padding-right: 310px;text-align: left;">NAME</th>
                                               <th style="text-align:left;">PRIORITY</th>
                                               <th>STATUS</th>
                                               <th style="padding-right: 130px;text-align: left;">OWNER</th>
                                               <th>Start Date</th>
                                               <th>DUE DATE </th>
                                                 <th>CREATED DATE </th> 
                                                 <%--<th>MILESTONE </th>--%> 
                                                 <th>Task % </th> 
                                                  <th>Project</th>
                                                  <th style="padding-right: 40px;">ACTION </th>                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-task-raised-list" style="text-align:center;">

                                           </tbody>
                                         </table>
                               </div>

                        </div>

                             
      <div class="tab-pane fade" id="navs-top-my-team">                      
           <div class="content-wrapper">
               <%-- filter tab --%>

               <div class="row" style="/*display: flex;justify-content: flex-end;margin-top:-25px;*/">
                                   
                                <div class="col-md-3">
                                  <div class="row" style="/*display: flex;justify-content: flex-end;margin-top:-25px;*/">
                                   
                                                <div class="col-md-12">
                                                    <label><i class="bx bx-search-alt-2" style="margin-top: -7px; font-size: 26px;color:#7fa3ff;"></i></label>
                                       <label for="html5-number-input" class="col-form-label label-custom">Task Status</label>

                                                    <select id="ddlFilterMyTeamTask" class="form-select color-dropdown" multiple>     
                                                        <%--<option value="-1">All</option>--%>
                                                        <%--<option value="Not Started">Not Started</option>--%>
                                                        <option value="Requested" >Requested</option>
                                                        <option value="Assigned" selected>Assigned</option>
                                                        <option value="Started" selected>Started</option>
                                                        <option value="Completed">Completed</option>
                                                        <option value="Cancelled">Cancelled</option>
                                                        <option value="Rejected">Rejected</option>
                                                    </select>                                                    
                                                </div>
                                   <%--<div class="col-md-1"> <input type="button" id="btnSearchTask" value="Search" class="btn btn-primary d-block" style="font-size:small"> </div>--%>
                                      
                               </div>

                               </div>
                               
                                <div class="col-md-2">
                                   <div class="row">
                                        <%--<div class="col-md-3">--%>  <%--</div>--%>
                                        <div class="col-md-12"> <label for="html5-number-input" class="col-form-label label-custom">From Date</label>
                                            <input type="text" id="filterStDateMTT" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly"> 
                                        </div>
                                   </div>
                               </div>
                               
                               <div class="col-md-2">
                                   <div class="row">                                        
                                        <div class="col-md-12"> <label for="html5-number-input" class="col-form-label label-custom">To Date</label> 
                                            <input type="text" id="filterEndDateMTT" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly"> 
                                        </div>
                                   </div>
                               </div>
                               
                               <div class="col-md-2">                                   
                                        <div class="col-md-12">
                                             <label for="html5-number-input" class="col-form-label label-custom">Manager</label> 
                                            <select Id="ddlManager" class="form-select color-dropdown" >  </select>    
                                        </div>
                               </div>

                               <div class="col-md-2"> 
                                    
                                        <div class="col-md-12">  <label for="html5-number-input" class="col-form-label label-custom">Employee</label> 
                                            <select Id="ddlEmployee" class="form-select color-dropdown" >  </select>    
                                        </div>
                               </div> 
                   
                              <div class="col-md-1">                                  
                                    <input type="button" id="btnSearchDashBoard" value="Search" class="btn btn-primary d-block" style="font-size:small; margin-top: 18%;" /> 
                               </div>

                               
                          </div>
               <%-- <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>
                              <td class="no-border" style="width: 0%"> 
                          </td>

                          <td class="no-border" style="width: 0%">                     
                          </td>

                             <td class="no-border" style="width: 17%"> 
                                  <span id="Label11" style="font-family:Times New Roman;font-size:Medium;font-weight:bold;"> Manager</span>
                              <select Id="ddlManager" class="form-select color-dropdown" >  </select>                                                 
                          </td>

                          <td class="no-border" style="width: 17%">      
                               <span id="Label2" style="font-family:Times New Roman;font-size:Medium;font-weight:bold;">Employee</span>
                              <select Id="ddlEmployee" class="form-select color-dropdown" >  </select>                                                 
                          </td>

                       
                          <td class="no-border" style="width: 5%">
                              <input type="button" id="btnSearchDashBoard" value="Search" class="btn btn-primary d-block" style="font-size:small; margin-top: 18%;" /> 
                          </td>
                      </tr>
                  </table>--%>

                <%-- End filter tab --%>

                            
            </div>
                         
                                <div class="my-team-table-div table-responsive" style="margin-top: 1%;">
                                         <table class="table my-team-table" style="width: 100%;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr style="text-align:center;">
                                               <th>TASK CODE</th>
                                               <th style="padding-right: 310px;text-align: left;">NAME</th>
                                               <th style="text-align:left;">PRIORITY</th>
                                               <th>STATUS</th>
                                               <th style="padding-right: 130px;text-align: left;">OWNER</th>
                                               <th>Start Date</th>
                                               <th>DUE DATE </th>
                                                 <th>CREATED DATE </th> 
                                                 <%--<th>MILESTONE </th>--%> 
                                                 <th>Task % </th> 
                                                  <th>Assigned By</th>
                                                  <th style="padding-right: 40px;">ACTION </th>                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-my-team-task" style="text-align:center;">

                                           </tbody>
                                         </table>
                               </div>

                        </div>

                      </div>
               </div>

      <%--tables--%>

       <%-- <div class="ajax-loader custom-loader hidden">
     <span class="spinner-border kpi-loader-name"  role="status" aria-hidden="true"></span><h4>Please wait...</h4>      
        </div>--%>


    </div>
</div>



      <%--TODO CREATE TASK MODAL--%>

    
  <%--  <div class="modal fade" id="addTaskModal" style="background-color:#00000070;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lbladdTaskModal">Create New Task</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body proj-popup">
       
       
          <div style="float: right; margin-top: -10px;" class="t-approve-reject-div hidden"> 
                <a href="#" class="btn btn-success btn-approve-task" style="height: 30px;padding: 3px 12px;background: #98ca3c;border-color:#98ca3c;"> <i class="bx bx-check-circle"></i> Approve</a>
                <a href="#" class="btn btn-danger  btn-reject-task" style="height: 30px;padding: 3px 9px;"><i class="bx bx-x"></i> Reject</a> 
          </div>

          <div class="">
              <div class="col-12">
                   <label for="html5-number-input" class="col-form-label label-custom">Task Name <span style="color: red;">*</span></label>
                   <div class="">
                       <input class="form-control" type="text" value="" id="txtNameTask" placeholder="Enter Task Name" style="border-color: lightgrey;">
                   </div>
              </div>
          </div>

          <div class="row">
              <div class="col-4">
                  <label class="col-form-label label-custom" for="basic-default-name">Priority</label>
                                        <div>
                                            <select id="ddlPriorityTask" class="form-select color-dropdown">                                               
                                                <option value="Urgent" selected=""> Urgent</option>
                                                <option value="Important">  Important</option>
                                                <option value="Medium">  Medium</option>
                                                <option value="Low">  Low</option>
                                            </select>
                                        </div>


                  <label class="col-form-label label-custom" for="basic-default-name">Status</label>
                                        <div>
                                            <select id="ddlMStatusTask" class="form-select color-dropdown">
                                                 <option value="Not Started" selected="">Not Started</option>                                               
                                                <option value="Active">Active</option>
                                                <option value="Completed">Completed</option>
                                                <option value="Cancelled">Cancelled</option>
                                            </select>
                                        </div>
              </div>

              <div class="col-8">
                    <label class="col-form-label label-custom" for="basic-default-name">Task Description <span style="color: red;">*</span></label>
                              <div>
                                  <textarea class="form-control" id="taTaskDescTask" rows="4" placeholder="Enter Task Description" style="border-color: lightgrey;"></textarea>
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
                       <input type="text" id="NoOfDaysTask" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                   </div>
              </div>

              <div class="col-4">
                   <label for="html5-number-input" class="col-form-label label-custom">Due Date <span style="color: red;">*</span></label>
                   <div class="">
                       <input type="text" id="DueDateTask" class="form-control" readonly="readonly">
                   </div>
              </div>

          </div>
          
          <div class="row">
              <div class="col-12 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">Owner <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlOwnerTask" class="form-select color-dropdown ddlOwnerTask">     </select>
                   </div>
              </div>
          </div>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnAddTask">Create</button>
      </div>
    </div>
  </div>
</div>--%>

    <%--END--%>




      <%--TODO CREATE TASK MODAL WIth CHATBOX--%>

    
    <div class="modal fade" id="addTaskModal" data-bs-backdrop="static" style="background-color:#00000070;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lbladdTaskModal">Create New Task</h5>
        <button type="button" class="btn-close btn-close-task-modal" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body proj-popup" style="display:inline-flex;">
       
       <div style="width: 40%;border-right:solid 2px #8b958b1c;padding-right: 24px;"> <%--parent after body div start--%>

          <div style="float: right; margin-top: -10px;" class="t-approve-reject-div hidden"> 
                <a href="#" class="btn-success btn-approve-task" style="height: 30px;padding: 3px 12px;background: #98ca3c;border-color:#98ca3c;border-radius: 5px;"> <i class="bx bx-check"></i> Approve</a>
                <a href="#" class="btn-danger  btn-reject-task" style="height: 30px;padding: 3px 9px;border-radius: 5px;"><i class="bx bx-x"></i> Reject</a> 
          </div>

          <div class="">
              <div class="col-12">
                   <label for="html5-number-input" class="col-form-label label-custom">Task Name <span style="color: red;">*</span></label>
                   <div class="">
                       <input class="form-control" type="text" value="" id="txtNameTask" placeholder="Enter Task Name" style="border-color: lightgrey;">
                   </div>
              </div>
          </div>

          <div class="row" style="margin-top:20px;">
              <div class="col-4">
                  <label class="col-form-label label-custom" for="basic-default-name">Priority</label>
                                        <div>
                                            <select id="ddlPriorityTask" class="form-select color-dropdown">                                               
                                                <option value="Urgent" selected=""> Urgent</option>
                                                <option value="Important">  Important</option>
                                                <option value="Medium">  Medium</option>
                                                <option value="Low">  Low</option>
                                            </select>
                                        </div>


                  <label class="col-form-label label-custom" for="basic-default-name">Status</label>
                                        <div>
                                            <select id="ddlMStatusTask" class="form-select color-dropdown">
                                                <%--<option value="Not Started">Not Started</option>--%>
                                                        <option value="Requested">Requested</option>
                                                        <option value="Assigned" selected>Assigned</option>
                                                        <option value="Started">Started</option>
                                                        <option value="Completed">Completed</option>
                                                        <option value="Cancelled">Cancelled</option>
                                            </select>
                                        </div>
              </div>

              <div class="col-8">
                    <label class="col-form-label label-custom" for="basic-default-name">Task Description <span style="color: red;">*</span></label>
                              <div>
                                  <textarea class="form-control" id="taTaskDescTask" rows="4" placeholder="Enter Task Description" style="border-color: lightgrey;"></textarea>
                              </div>
              </div>
          </div>

   

          <div class="row taskstrtNendDateDiv" style="margin-top:20px;">
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
                        <%--<input type="text" id="DueDateTask" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">--%>
                       <input type="text" id="DueDateTask" class="form-control" readonly="readonly">
                   </div>
              </div>

          </div>
          
          <div class="row" style="">
              <div class="col-12 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">Owner <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlOwnerTask" class="form-select color-dropdown ddlOwnerTask">     </select>
                      <%--<input type="text" id="ddlOwner" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly" />--%> 
                   </div>
              </div>
          </div>

          </div>  <%--parent after body div end--%>


          <div class="disable-div-of-chatarea" style="position:absolute;background-color: rgb(236 123 83 / 9%);z-index:999;left:41%;"></div>
   <div class="chat-tab-parent-div" style="width:60%;padding-left:1%;">

              <div class="nav-align-top">
                  <ul class="nav nav-pills mb-3 chat-parent-ul" role="tablist">
                    <li class="nav-item">
                      <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-chat" aria-controls="navs-pills-top-home" aria-selected="true">Chat</button>
                    </li>
                    <li class="nav-item">
                      <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-attach" aria-controls="navs-pills-top-profile" aria-selected="false">Attachment</button>
                    </li>
                    <li class="nav-item">
                      <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-task-history" aria-controls="navs-pills-top-messages" aria-selected="false">History</button>
                    </li>
                  </ul>
                  <div class="tab-content" style="min-height:43vh;">
                    <div class="tab-pane fade show active" id="navs-chat" role="tabpanel" style="max-height:43vh; overflow-y:auto;">
                      

                        <div class="chat-msg-parent-div">
                           
                           <%-- <div class="container">
                              <img src="/w3images/bandmember.jpg" alt="Avatar" style="width:100%;">
                              <p>Hello. How are you today?</p>
                              <span class="time-right">11:00</span>
                            </div>
                            
                            <div class="container darker">
                              <img src="/w3images/avatar_g2.jpg" alt="Avatar" class="right" style="width:100%;">
                              <p>Hey! I'm fine. Thanks for asking!</p>
                              <span class="time-left">11:01</span>
                            </div>--%>

                        </div>


                        <div class="footer-mychat">
                            <input class="form-control" type="text" value="" id="txtChatMsg" placeholder="Enter message here" style="border-color: lightgrey;width: 95.3% !important;">                            
                            <img src="./Asset/send-msg-icon.png" class="fa-icon-hover btn-send-msg" title="Add Task" data-mstoneid="43" style="width: 33px;cursor:pointer;height: 22px;margin-top: 7px;">
                        </div>
                      
                    </div>
                      <%--Tab 2--%>
                    <div class="tab-pane fade" id="navs-attach" role="tabpanel">
                      
                        <div class="input-group mb-3">        
                            <label style="margin-right: 10px;" class="lbl-fufile-count"></label>

                             <input class="form-control" type="file" id="fu-task-attach" accept=".doc,.docx,.pdf,.png,.jpeg" style="display:none;" multiple>
                             <label class="input-group-text ml-3" for="fu-task-attach"><i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i></label>

                            <a href="#" id="btnUploadChatFile" class="btn btn-primary" style="margin-left: 4px;">Upload File </a>
                                                       
                       <input type="text" id="lblFilesName" value="" style="width:70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left:10px;" readonly="">
                 
              
                        </div>
                        <%--<div id="#statustxt">0%</div>--%>

                             <div class="" style="padding-top: 2%;max-height:400px;overflow-y:auto;">
                                         <table class="table chat-attach-table" style="width: 100%;">
                                           <thead style="top: -18px; position: sticky;">
                                             <tr style="text-align:center;">
                                                 <th style="text-align: left; width: 40%;">File Name</th>
                                               <th style="width: 25%;">Uploaded By</th>
                                               <th style="width: 17%;">Size</th>                                               
                                                  <th style="width: 18%;">ACTION </th>                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-chat-attach" style="text-align:center;">

                                           </tbody>
                                         </table>
                               </div>

                    </div>

                      <%--Tab 3--%>
                    <div class="tab-pane fade" id="navs-task-history" style="max-height:55vh; overflow-y:auto;zoom:85%;overflow-x: hidden;" role="tabpanel">
                     
                        <div class="row">
                                 <div id="element">
                                   <ul class="timeline tash-history-ul">                                             
                                  </ul>                                             
                                 </div>
                        </div>
                     
                    </div>
                  </div>
         </div>

  </div>



      </div>
      <div class="modal-footer" style="display:block;">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnAddTask">Create</button>
      </div>
    </div>
  </div>
</div>

    <%--END--%>


     <%--TODO CREATE TASK MODAL WIth CHATBOX For Ticket Management--%>

    
    <div class="modal fade" id="addTaskModalTKT" data-bs-backdrop="static" style="background-color:#00000070;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lbladdTaskModalTKT">Create New Task</h5>
        <button type="button" class="btn-close btn-close-task-modal" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body proj-popup-tkt" style="display:inline-flex;">
       
       <div style="width: 40%;border-right:solid 2px #8b958b1c;padding-right: 24px;"> <%--parent after body div start--%>

          <div style="margin-top: -10px;display: flex;justify-content: flex-end;" class="t-approve-reject-div-tkt hidden"> 
                <a href="#" class="btn-success btn-approve-task" style="height: 30px;padding: 3px 12px;background: #98ca3c;border-color:#98ca3c;border-radius: 5px;"> <i class="bx bx-check"></i> Approve</a>
                <a href="#" class="btn-danger  btn-reject-task" style="height: 30px;padding: 3px 9px; margin-left: 5px;border-radius: 5px;"><i class="bx bx-x"></i> Reject</a> 
          </div>

          <div class="row">
              <div class="col-8">
                   <label for="html5-number-input" class="col-form-label label-custom">Task Name <span style="color: red;">*</span></label>
                   <div class="">
                       <input class="form-control" type="text" value="" id="txtNameTaskTKT" placeholder="Enter Task Name" style="border-color: lightgrey;">
                   </div>
              </div>

              <div class="col-4">
                   <label for="html5-number-input" class="col-form-label label-custom">Task Type <span style="color: red;">*</span></label>
                   <div class="">                       
                       <select id="ddlTaskTypeTKT" class="form-select color-dropdown">                                               
                                                <option value="Urgent" selected=""> Urgent</option>
                                                <option value="Important">  Important</option>
                                                <option value="Medium">  Medium</option>
                                                <option value="Low">  Low</option>
                                            </select>
                   </div>
              </div>
          </div>

          <div class="row" style="margin-top:20px;">
              <div class="col-4">
                  <label class="col-form-label label-custom" for="basic-default-name">Priority</label>
                                        <div>
                                            <select id="ddlPriorityTaskTKT" class="form-select color-dropdown">                                               
                                                <option value="Urgent" selected=""> Urgent</option>
                                                <option value="Important">  Important</option>
                                                <option value="Medium">  Medium</option>
                                                <option value="Low">  Low</option>
                                            </select>
                                        </div>


                  <label class="col-form-label label-custom" for="basic-default-name">Status</label>
                                        <div>
                                            <select id="ddlMStatusTaskTKT" class="form-select color-dropdown">
                                                <%--<option value="Not Started">Not Started</option>--%>
                                                        <option value="Requested">Requested</option>
                                                        <option value="Assigned" selected>Assigned</option>
                                                        <option value="Started">Started</option>
                                                        <option value="Completed">Completed</option>
                                                        <option value="Cancelled">Cancelled</option>
                                            </select>
                                        </div>
              </div>

              <div class="col-8">
                    <label class="col-form-label label-custom" for="basic-default-name">Task Description <span style="color: red;">*</span></label>
                              <div>
                                  <textarea class="form-control" id="taTaskDescTaskTKT" rows="4" placeholder="Enter Task Description" style="border-color: lightgrey;"></textarea>
                              </div>
              </div>
          </div>

   

          <div class="row taskstrtNendDateDivTKT" style="margin-top:20px;">
              <div class="label-custom" style="text-align: center;background: #fff0f0;"> Expected </div>
              <div class="col-5">
                   <label for="html5-number-input" class="col-form-label label-custom">Start Date <span style="color: red;">*</span></label>
                   <div class="">
                        <input type="text" id="StartDateTaskTKT" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">

                   </div>
              </div>

               <div class="col-3">
                   <label for="html5-number-input" class="col-form-label label-custom">No. of Days <span style="color: red;">*</span></label>
                   <div class="">
                        <%--<input type="text" id="DueDateTask" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">--%>
                       <input type="text" id="NoOfDaysTaskTKT" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                   </div>
              </div>

              <div class="col-4">
                   <label for="html5-number-input" class="col-form-label label-custom">Due Date <span style="color: red;">*</span></label>
                   <div class="">
                        <%--<input type="text" id="DueDateTask" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">--%>
                       <input type="text" id="DueDateTaskTKT" class="form-control" readonly="readonly">
                   </div>
              </div>

          </div>

             <div class="row taskActualDatesAreaDiv hidden" style="margin-top:20px;">
              <div class="label-custom" style="text-align: center;background: #fff0f0;"> Actual </div>
              <div class="col-5">
                   <label for="html5-number-input" class="col-form-label label-custom">Start Date <span style="color: red;">*</span></label>
                   <div class="">
                        <input type="text" id="StartDateTaskActualTKT" placeholder="" style="background: white;" class="form-control flatpickr-input active" disabled>

                   </div>
              </div>

               <div class="col-3">
                   <label for="html5-number-input" class="col-form-label label-custom">No. of Days <span style="color: red;">*</span></label>
                   <div class="">
                        <%--<input type="text" id="DueDateTask" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">--%>
                       <input type="text" id="NoOfDaysTaskActualTKT" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" disabled />

                   </div>
              </div>

              <div class="col-4">
                   <label for="html5-number-input" class="col-form-label label-custom">Completed Date <span style="color: red;">*</span></label>
                   <div class="">
                        <%--<input type="text" id="DueDateTask" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">--%>
                       <input type="text" id="DueDateTaskActualTKT" class="form-control" disabled />
                   </div>
              </div>

          </div>
          
          <div class="row" style="margin-top:20px;">
              <div class="col-12 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">Owner <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlOwnerTaskTKT" class="form-select color-dropdown ddlOwnerTaskTKT">     </select>
                      <%--<input type="text" id="ddlOwner" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly" />--%> 
                   </div>
              </div>
          </div>

          </div>  <%--parent after body div end--%>


          <div class="disable-div-of-chatarea-tkt" style="position:absolute;background-color: rgb(236 123 83 / 9%);z-index:999;left:41%;"></div>
   <div class="chat-tab-parent-div-tkt" style="width:60%;padding-left:0.5%; background: #7d858c08;">

              <div class="nav-align-top">
                  <ul class="nav nav-pills mb-3 chat-parent-ul" style="background:#e5c00d17;" role="tablist">  <%--#232323d1--%>
                    <li class="nav-item">
                      <button type="button"  class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-chat-tkt" aria-controls="navs-pills-top-home" aria-selected="true">Chat</button>
                    </li>
                    <li class="nav-item">
                      <button type="button"  class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-attach-tkt" aria-controls="navs-pills-top-profile" aria-selected="false">Attachment</button>
                    </li>
                    <li class="nav-item">
                      <button type="button"  class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-task-history-tkt" aria-controls="navs-pills-top-messages" aria-selected="false">History</button>
                    </li>
                  </ul>
                  <div class="tab-content" style="min-height:43vh;">
                    <div class="tab-pane fade show active" id="navs-chat-tkt" role="tabpanel" style="max-height:43vh; overflow-y:auto;">
                      

                        <div class="chat-msg-parent-div-tkt">
                           
                           <%-- <div class="container">
                              <img src="/w3images/bandmember.jpg" alt="Avatar" style="width:100%;">
                              <p>Hello. How are you today?</p>
                              <span class="time-right">11:00</span>
                            </div>
                            
                            <div class="container darker">
                              <img src="/w3images/avatar_g2.jpg" alt="Avatar" class="right" style="width:100%;">
                              <p>Hey! I'm fine. Thanks for asking!</p>
                              <span class="time-left">11:01</span>
                            </div>--%>

                        </div>


                        <div class="footer-mychat">
                            <input class="form-control" type="text" value="" id="txtChatMsgTKT" placeholder="Enter message here" style="border-color: lightgrey;width: 95.3% !important;">                            
                            <img src="./Asset/send-msg-icon.png" class="fa-icon-hover btn-send-msg-tkt" title="Add Task" data-mstoneid="43" style="width: 33px;cursor:pointer;height: 22px;margin-top: 7px;">
                        </div>
                      
                    </div>
                      <%--Tab 2--%>
                    <div class="tab-pane fade" id="navs-attach-tkt" role="tabpanel">
                      
                        <div class="input-group mb-3">        
                            <label style="margin-right: 10px;" class="lbl-fufile-count"></label>

                             <input class="form-control" type="file" id="fu-task-attach-tkt" accept=".doc,.docx,.pdf,.png,.jpeg" style="display:none;" multiple>
                             <label class="input-group-text ml-3" for="fu-task-attach-tkt"><i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i></label>

                            <a href="#" id="btnUploadChatFileTKT" class="btn btn-primary" style="margin-left: 4px;">Upload File </a>
                                                       
                       <input type="text" id="lblFilesNameTKT" value="" style="width:70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left:10px;" readonly="">
                 
              
                        </div>
                        <%--<div id="#statustxt">0%</div>--%>

                             <div class="" style="padding-top: 2%;max-height:400px;overflow-y:auto;">
                                         <table class="table chat-attach-table" style="width: 100%;">
                                           <thead style="top: -18px; position: sticky;">
                                             <tr style="text-align:center;">
                                                 <th style="text-align: left; width: 40%;">File Name</th>
                                               <th style="width: 25%;">Uploaded By</th>
                                               <th style="width: 17%;">Size</th>                                               
                                                  <th style="width: 18%;">ACTION </th>                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-chat-attach-tkt" style="text-align:center;">

                                           </tbody>
                                         </table>
                               </div>

                    </div>

                      <%--Tab 3--%>
                    <div class="tab-pane fade" id="navs-task-history-tkt" style="max-height:55vh; overflow-y:auto;zoom:85%;overflow-x: hidden;" role="tabpanel">
                     
                        <div class="row">
                                 <div id="elementTKT">
                                   <ul class="timeline tash-history-ul-tkt">                                             
                                  </ul>                                             
                                 </div>
                        </div>
                     
                    </div>
                  </div>
         </div>

  </div>



      </div>
      <div class="modal-footer" style="display:block;">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnUpdateTaskTKT"><i class="bx bx-save" style="color: #ffffff;cursor:pointer;font-size: x-large;"></i>Update</button>
        <button type="button" class="btn btn-success btnAddTaskTKT">Create</button>
      </div>
    </div>
  </div>
</div>

    <%--END--%>

    <%--Expected Start and EndDate from grid--%>

<!-- Modal -->
<div class="modal fade" id="ExpDateModal" tabindex="-1" style="background-color:#00000070;" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ExpDateModalLabel">Expected Date Duration</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
          <div class="row">

              <div class="col-md-5">
                  <label for="html5-number-input" class="col-form-label label-custom">Start Date <span style="color: red;">*</span></label>
                  <input type="text" id="StartDateTaskFromGridTKT" placeholder="Select Date" style="background: white; border-color: lightgrey;" class="form-control flatpickr-input active" readonly="readonly">
              </div>

              <div class="col-md-3">
                  <label for="html5-number-input" class="col-form-label label-custom">No. of days <span style="color: red;">*</span></label>
                  <input type="text" id="NoOfDaysTaskFromGridTKT" class="form-control" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57" style="border-color: lightgrey;">
              </div>

              <div class="col-md-4">
                  <label for="html5-number-input" class="col-form-label label-custom">End Date <span style="color: red;">*</span></label>
                  <input type="text" id="DueDateTaskFromGridTKT" class="form-control" readonly="readonly" style="border-color: lightgrey;">
              </div>

          </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-success btnUpdateExpDatenSave" style="color: #fff; background-color:#24c064fc; border-color:#24c064fc;"> <i class="bx bx-stopwatch" style="color: #ffffff;cursor:pointer;font-size: x-large;"></i> Start</button>
      </div>
    </div>
  </div>
</div>

    <%--End--%>


        <%--Expected Start and EndDate For Normal Task from grid--%>

<!-- Modal -->
<div class="modal fade" id="NormalExpDateModal" tabindex="-1" style="background-color:#00000070;" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="NormalExpDateModalLabel">Expected Date Duration</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
          <div class="row">

              <div class="col-md-5">
                  <label for="html5-number-input" class="col-form-label label-custom">Start Date <span style="color: red;">*</span></label>
                  <input type="text" id="StartDateTaskFromGrid" placeholder="Select Date" style="background: white; border-color: lightgrey;" class="form-control flatpickr-input active" readonly="readonly">
              </div>

              <div class="col-md-3">
                  <label for="html5-number-input" class="col-form-label label-custom">No. of days <span style="color: red;">*</span></label>
                  <input type="text" id="NoOfDaysTaskFromGrid" class="form-control" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57" style="border-color: lightgrey;">
              </div>

              <div class="col-md-4">
                  <label for="html5-number-input" class="col-form-label label-custom">End Date <span style="color: red;">*</span></label>
                  <input type="text" id="DueDateTaskFromGrid" class="form-control" readonly="readonly" style="border-color: lightgrey;">
              </div>

          </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-success btnUpdateExpDate" style="color: #fff; background-color:#24c064fc; border-color:#24c064fc;"> <i class="bx bx-stopwatch" style="color: #ffffff;cursor:pointer;font-size: x-large;"></i> Start</button>
      </div>
    </div>
  </div>
</div>

    <%--end--%>

        <%-- Reject Comment Modal by Department Coordinator --%>

<!-- Modal -->
<div class="modal fade" id="rejectCommentModal" tabindex="-1" style="background-color:#00000070;" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="rejectCommentModalLabel">Reject Remarks</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
          <div class="row">

              <div class="col-md-12">
                  <label for="html5-number-input" class="col-form-label label-custom">Remarks <span style="color: red;">*</span></label>
                  <textarea id="taRejectRemarks" class="form-control taEmployeeCommentC" placeholder="Type your Remarks..." aria-describedby="basic-icon-default-message2"></textarea>
              </div>
                        

          </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnRejectRemarks" style="color: #fff; background-color:#24c064fc; border-color:#24c064fc;"> <%--<i class="bx bx-stopwatch" style="color: #ffffff;cursor:pointer;font-size: x-large;"></i>--%> Reject</button>
      </div>
    </div>
  </div>
</div>

    <%--End--%>

            <%-- Task View For Cancel the ticket request --%>

<!-- Modal -->
<div class="modal fade" id="ticketTaskViewModal" tabindex="-1" style="background-color:#00000070;" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ticketTaskViewModalLabel">Reject Remarks</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
          <div class="row">
              <span style="">Ticket Details</span>
              <div class="col-md-2"> <label for="html5-number-input" class="col-form-label label-custom">Ticket Code </label> </div>
              <div class="col-md-10"><p id="pTktCode"></p></div>
         </div>

          <div class="row">
               <div class="col-md-2"><label for="html5-number-input" class="col-form-label label-custom">Ticket Name </label></div>
              <div class="col-md-10"><p id="pTktName"></p></div>
          </div>

          <div class="row">
               <div class="col-md-2"><label for="html5-number-input" class="col-form-label label-custom">Status </label></div>
              <div class="col-md-10"><span id="sTktStatus"></span></div>
          </div>

          <div class="row">
               <div class="col-md-2"><label for="html5-number-input" class="col-form-label label-custom">Priority </label></div>
              <div class="col-md-10"><span id="sTktPriority"></span></div>
          </div>

           <div class="row rejCommDiv">
               <div class="col-md-2"><label for="html5-number-input" class="col-form-label label-custom">Rejection Remarks </label></div>
              <div class="col-md-10"><span id="pTktRejComm"></span></div>
          </div>
        <%--  <div class="row">
               <div class="2"></div>
              <div class="10"></div>
          </div>--%>

      </div>
      <div class="modal-footer">
        <%--<button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>--%>
        <button type="button" class="btn btn-danger btnCancelTicket"> <i class="bx bx-x"></i> Cancel the Ticket</button>
      </div>
    </div>
  </div>
</div>

    <%--End--%>

    <%--DELETE CONFIMATION MODAL FOR TASK--%>
        <div class="modal fade" id="deleteTaskConfirmModal" style="background-color:#00000070;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
          <div><h3>Are you sure?</h3></div>
        <span class="cTaskSentence">Do you want to delete the Task? </span> 
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-del-task-yes" data-bs-dismiss="modal">Delete</button>
          </div>
      </div>
    </div>
  </div>
</div>


        <%--DELETE CONFIMATION MODAL FOR MEMBER--%>
        <div class="modal fade" id="deletememberConfirmModal" style="background-color:#00000070;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
          <div><h3>Are you sure?</h3></div>
        <span class="cMemberSentence">Do you want to delete the Member? </span> 
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-del-mem-yes" data-bs-dismiss="modal">Delete</button>
          </div>
      </div>
    </div>
  </div>
</div>



     <asp:HiddenField ID="hfServerMapPth" runat="server" />
       <script type="text/javascript">
                var currUserId = '';   
                var EmpNo = '';
                var myrole = '';
           var overAllPerfo = 0;
           var rolesList = '';
                $(document).ready(function () {
                    currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;               
                    EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';
                    rolesList = '<%=Session["CurrentUserRolesList"].ToString()%>';
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

    <script src="../assets/js/econnect-common.js"></script>

    <script src="Scripts/task-main.js?v=5.1"></script>
    <script src="Scripts/task-main-ticket.js?v=5.1"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <link href="Asset/css/select2.css" rel="stylesheet" />
    <script src="Asset/js/select2.js"></script>
   <%--   <script src="Asset/css/netliva_switch.css"></script>
      <script src="Asset/js/netliva_switch.js"></script>--%>
    <script src="../Calendar/plugins/jquery-ui/jquery-ui.js"></script>
   
    <link href="Asset/css/jquery.timeline.css" rel="stylesheet" />
    <script src="Asset/js/jquery.timeline.js"></script>

</asp:Content>