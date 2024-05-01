<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="ProjectMain.aspx.cs" Inherits="TODONew_ProjectMain" %>

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
    background:#933737;
}
.iconClassPdf{
    
    background:#933737;
}

.iconClassExcel:hover{
    
    background:#a54141;
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
    font-weight: 500 !important;
    text-transform: capitalize;
    /* padding-top: 3px; */
}
.select2-ddlOwner-container{
    height:35px;
}
.proj-main-parent-div ul{
    min-width: 21vh;
}
.proj-main-parent-ul .nav-item .nav-link:not(.active) {
    background-color: #eceef17d !important;
    min-width:25vh !important;
}

#proj-sub-proj-ul li button{
    background:white;
}

.project-list-table th{
    text-align:center;
}

.dot-default {
  height: 25px;
  width: 25px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
}
.dot-urgent {
  height: 25px;
  width: 25px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
}
.dot-important {
  height: 25px;
  width: 25px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
}
.dot-medium {
  height: 25px;
  width: 25px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
}
.dot-low {
  height: 25px;
  width: 25px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
}
.proj-popup .row{
    margin-top:5px;
}
.project-list-table th{
    color:white !important;
    background-color:#a92828;
}
.tbody-project-list{
    text-align:center;
}
.fa-icon-color{
    color: #d54832;
}
.dd-menu-proj .dropdown-item:hover{
    color:white;
}

/*Task Statuses classes*/
.task-status-notstarted{
    background:#5e99e3ad;  /*#e97662;*/
       padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 10px;
    color:white;
}
.task-status-open{
    background: #2196f3;
        padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 10px;
    color:white;
}
.task-status-inprogress{
    background: #8ec354;
        padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 10px;
    color:white;
}
.task-status-closed{
    background: #71dd37;
        padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 10px;
    color:white;
}
.task-status-cancelled{
    background: #ff3e1d;
        padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 10px;
    color:white;
}

/*task priority classes*/
.task-priority-urgent{
    font-size: 11px;
    color: #e93737;
    
}
.task-priority-impo{
    font-size:11px;
    color: #e36115;
}
.task-priority-medium{
    font-size:11px;
    color: #80b546;
}
.task-priority-low{
     font-size:11px;
     color: #4691b5;
}

.dropdown-item:hover, .dropdown-item:focus {
    color: #fff !important;
    background-color: #d19898 !important;
}
.nav-align-top .table:not(.table-dark), .nav-align-top .table:not(.table-dark) thead:not(.table-dark) th, .nav-align-top .table:not(.table-dark) tfoot:not(.table-dark) th, .nav-align-top .table:not(.table-dark) td, .nav-align-right .table:not(.table-dark), .nav-align-right .table:not(.table-dark) thead:not(.table-dark) th, .nav-align-right .table:not(.table-dark) tfoot:not(.table-dark) th, .nav-align-right .table:not(.table-dark) td, .nav-align-bottom .table:not(.table-dark), .nav-align-bottom .table:not(.table-dark) thead:not(.table-dark) th, .nav-align-bottom .table:not(.table-dark) tfoot:not(.table-dark) th, .nav-align-bottom .table:not(.table-dark) td, .nav-align-left .table:not(.table-dark), .nav-align-left .table:not(.table-dark) thead:not(.table-dark) th, .nav-align-left .table:not(.table-dark) tfoot:not(.table-dark) th, .nav-align-left .table:not(.table-dark) td {
    border-color: #e8f3ff !important;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


 <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

  <div class="card-body" style="margin-top: -1%; min-height:85vh;">
      <%--<h2 style="padding:3px"></h2>--%>
     <div class="nav-align-left" style="min-height: 85vh; margin-top: 1%;">
            <ul class="nav nav-tabs proj-main-parent-ul" role="tablist">
              <li class="nav-item">
                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-home"><i class="fa fa-rocket" aria-hidden="true" style="font-size: large;"></i> &nbsp;&nbsp; <span>PROJECTS</span></button>
              </li>
              <li class="nav-item">
                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-profile"><i class='bx bx-target-lock'></i>&nbsp;&nbsp; <span>MILESTONES</span></button>
              </li>
              <li class="nav-item">
                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-messages"><i class="bx bx-task"></i>&nbsp;&nbsp;<span>TASK</span></button>
              </li>
            </ul>
            <div class="tab-content">
             
                <%--First Tab--%>
                <div class="tab-pane fade show active" id="navs-left-align-home"> 
                
                    <div class="row" style="padding-left: .5%;">    
                        <div class="col-2">
                            <h4 style="text-shadow: 1px 1px -1px; color: #a92828;">Project List </h4> </div>
                        </div>

                   <%--Child Tab--%>
                  <div class="nav-align-top row" >
                      <ul class="nav nav-tabs" id="proj-sub-proj-ul" role="tablist">
                        <li class="nav-item">
                          <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-my-project">MY PROJECTS</button>
                        </li>
                        <li class="nav-item">
                          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-involved-project">INVOLVED PROJECTS</button>
                        </li>
                      
                      </ul>
                      <div class="tab-content">

                        <div class="tab-pane fade show active" id="navs-top-my-project">

                         <div> 
                             <a href="#" class="btn btn-primary pull-right btn-add-proj-grid" data-bs-toggle="modal" data-bs-target="#addProjModal"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Project</a>
                         </div>
                         
                                <div class="" style="margin-top: 0%;">
                                         <table class="table table-striped project-list-table">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr>
                                                 <th>PROJECT NAME</th>
                                               <th>PRIORITY</th>
                                               <th>STATUS</th>
                                               <th>OWNER</th>
                                               <th>Start Date</th>
                                               <th>DUE DATE </th>
                                                 <th>CREATED DATE </th> 
                                                  <th>ACTION </th>                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-project-list">

                                           </tbody>
                                         </table>
                               </div>



                        </div>

                        <div class="tab-pane fade" id="navs-top-involved-project">
                          <p>
                            Icing pastry pudding oat cake. Lemon drops cotton candy caramels cake caramels sesame snaps                        
                          </p>
                        </div>
                      
                      </div>
               </div>

   
             
              </div>

                <%--Second Tab--%>
              <div class="tab-pane fade" id="navs-left-align-profile">
              
                <p class="mb-0">
                  Jelly-o jelly beans icing pastry cake cake lemon drops. Muffin muffin pie tiramisu halvah cotton
                  candy liquorice caramels.
                </p>
              </div>

                <%--Third Tab--%>
              <div class="tab-pane fade" id="navs-left-align-messages">
                <p>
                  Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly beans macaroon gummies
                  cupcake
                  gummi bears cake chocolate.
                </p>
               
              </div>
            </div>
    </div>

    







      <%--tables--%>

        <div class="ajax-loader custom-loader hidden">
     <span class="spinner-border kpi-loader-name"  role="status" aria-hidden="true"></span><h4>Please wait...</h4>      
        </div>

<div class="" style="margin-top: 1%;">
  <table class="table table-bordered table-striped kpi-user-list-table hidden">
    <thead>
      <tr>
          <th colspan="6" style="text-align:center;font-style:oblique;vertical-align:middle;font-size: x-large; background-color:#364150 !important;" rowspan="1">Credit Controller Input</th>
            <th colspan="2" style="text-align:center;font-style:oblique;vertical-align:middle;font-size: large; background-color:#2f5597 !important;" rowspan="1">Supervisor Verification</th>
            <th colspan="2" style="text-align:center;font-style:oblique;vertical-align:middle;font-size: large; background-color:#2f5597 !important;" rowspan="1">Manager Verification</th>
          <th colspan="1" style="text-align:center;font-style:oblique;vertical-align:middle;font-size: large; background-color:#2f5597 !important;" rowspan="1"></th>
         </tr>

        <tr>            
        <th>Customer Name</th>
        <th>Salesman Name</th>
        <th>Amount Collected </th>
          <th>Credit Controller Comment </th> 
           <th>Activity date </th>
           <th>Next Follow-up date </th>
      
      <th>Verified </th> 
      <th>Comment </th> 
      
      <th>Verified </th> 
      <th>Comment </th> 
      <th>Actions </th> 

      </tr>
    </thead>
    <tbody class="tbody-employees">

    </tbody>
  </table>
</div>


    <div class="" style="margin-top: 1%; display:none;">
  <table class="table table-bordered table-striped kpi-user-list-table1">
    <%--<caption class="ms-4">List of Projects</caption>--%>
    <thead>
      <tr>
          <th class="hidden">PropId</th>
        <th>Property Name</th>
        <th>Property Type</th>
        <th>Block </th>
          <th>Plot </th> 
           <th>Floor </th>
            <th>Room </th> 
      <th>Room type </th> 

    <%--    <th style="width: 10%;">Actions</th>--%>
      </tr>
    </thead>
    <tbody class="tbody-employees">

    </tbody>
  </table>
</div>




    </div>
</div>
   
    <%--comment module--%>
    <div class="modal fade" id="commModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lblcommModal">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
          <div class="mb-3 commentBoxEmp"> <label class="form-label" for="basic-icon-default-message">Please Add your Comment:</label>
               <div class="input-group input-group-merge">
                   <textarea id="taComment" class="form-control taComment" placeholder="Type your Comments…." aria-describedby="basic-icon-default-message2" rows="5"></textarea>
               </div>
          </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnSaveComment">Save comment</button>
      </div>
    </div>
  </div>
</div>




        <%--confirmation pop up for delete KPi--%>
<div class="modal fade" id="payStatusConfirmPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
          <div><h3>Are you sure?</h3></div>
        Do you want to update the payment status?
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-update-paystatus">Update</button>
          </div>
      </div>
    </div>
  </div>
</div>



    <%--TODO MODALS--%>

    <div class="modal fade" id="addProjModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lbladdProjModal">Create New Project</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body proj-popup">
       
          <div class="row">
              <div class="col-12">
                   <label for="html5-number-input" class="col-form-label label-custom">Task Name <span style="color: red;">*</span></label>
                   <div class="">
                       <input class="form-control" type="text" value="" id="txtProjectName" style="border-color: lightgrey;">
                   </div>
              </div>
          </div>

          <div class="row">
              <div class="col-4">
                  <label class="col-form-label label-custom" for="basic-default-name">Priority</label>
                                        <div>
                                            <select id="ddlPriority" class="form-select color-dropdown">                                               
                                                <option value="Urgent" selected=""> Urgent</option>
                                                <option value="Important">  Important</option>
                                                <option value="Medium">  Medium</option>
                                                <option value="Low">  Low</option>
                                            </select>
                                        </div>


                  <label class="col-form-label label-custom" for="basic-default-name">Status</label>
                                        <div>
                                            <select id="ddlStatus" class="form-select color-dropdown">
                                                <option value="Not Started" selected="">Not Started</option>
                                                <option value="Open">Open</option>
                                                <option value="In Progress">In Progress</option>
                                                <option value="Closed">Closed</option>
                                                <option value="Cancelled">Cancelled</option>
                                            </select>
                                        </div>
              </div>

              <div class="col-8">
                    <label class="col-form-label label-custom" for="basic-default-name">Task Description <span style="color: red;">*</span></label>
                              <div>
                                  <textarea class="form-control" id="taTaskDesc" rows="4" placeholder="Enter Task Description" style="border-color: lightgrey;"></textarea>
                              </div>
              </div>
          </div>

   

          <div class="row">
              <div class="col-6">
                   <label for="html5-number-input" class="col-form-label label-custom">Start Date <span style="color: red;">*</span></label>
                   <div class="">
                        <input type="text" id="projStartDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">

                   </div>
              </div>

              <div class="col-6">
                   <label for="html5-number-input" class="col-form-label label-custom">Due Date <span style="color: red;">*</span></label>
                   <div class="">
                        <input type="text" id="projDueDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">

                   </div>
              </div>

          </div>
          
          <div class="row">
              <div class="col-12 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">Owner <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlOwner" class="form-select color-dropdown ddlOwner">     </select>
                      <%--<input type="text" id="ddlOwner" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly" />--%> 
                   </div>
              </div>
          </div>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnAddProj">Create</button>
      </div>
    </div>
  </div>
</div>


    <div class="modal fade" id="deleteProjConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
          <div><h3>Are you sure?</h3></div>
        Do you want to delete the project?
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-del-proj-yes" data-bs-dismiss="modal">Delete</button>
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

    <script src="Scripts/project-main.js"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


       <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>


</asp:Content>



