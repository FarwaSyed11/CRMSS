<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="SurveyTemplateCreation.aspx.cs" Inherits="Survey_SurveyTemplateCreation" %>


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
.task-status-notstarted{
    background:#fbc11e;  /*#e97662;*/
       padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 6px;
    color:white;
}
.task-status-open{
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

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


 <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

  <div class="card-body" style="margin-top: -1%; min-height:85vh;">
      <%--<h2 style="padding:3px"></h2>--%>
    
      <h4 style="color: #a92828; margin-top:13px">Feedback Templates</h4>
       <div class="nav-align-top row" >
          
             

                       

                              <div>
                                  <a href="#" class="btn btn-primary pull-right btn-add-task-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add New Template</a>
                              </div>

                              <div class="" style="margin-top: 0%;">
                                  <table class="table task-raised-list-table" style="width: 100%;">
                                      <%--<caption class="ms-4">List of Projects</caption>--%>
                                      <thead>
                                          <tr style="text-align: center;">
                                              <th style="text-align: left;width:15%">Name</th>
                                              <th style="text-align: left;width:30%">Description</th>
                                              <th style="width:10%">Created Date</th>
                                              <th style="width:10%">Created By</th>
                                              <th style="text-align: left;width:10%">Status</th>
                                              <th style="width:10%">ACTION </th>
                                          </tr>
                                      </thead>
                                      <tbody class="tbody-task-raised-list" style="text-align: center;">
                                      </tbody>
                                  </table>
                              </div>



                          </div>

                  
                          
                        </div>
                      
                      
               </div>

      <%--tables--%>

        <div class="ajax-loader custom-loader hidden">
     <span class="spinner-border kpi-loader-name"  role="status" aria-hidden="true"></span><h4>Please wait...</h4>      
        </div>


    </div>
</div>


      <%--TODO CREATE TASK MODAL--%>

    
    <div class="modal fade" id="addTaskModal" style="background-color:#00000070;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lbladdTaskModal">Create New Task</h5>
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
          
          <div class="row">
              <div class="col-12 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">Owner <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlOwnerTask" class="form-select color-dropdown ddlOwnerTask">     </select>
                      <%--<input type="text" id="ddlOwner" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly" />--%> 
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
</div>

    <%--END--%>






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

    <script src="Scripts/SurveyTemplate.js"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


       <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

   <%--   <script src="Asset/css/netliva_switch.css"></script>
      <script src="Asset/js/netliva_switch.js"></script>--%>

</asp:Content>