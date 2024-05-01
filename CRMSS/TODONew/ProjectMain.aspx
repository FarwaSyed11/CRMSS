<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="ProjectMain.aspx.cs" Inherits="TODONew_ProjectMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
  <link href="Asset/css/todonew.css?v=2.2" rel="stylesheet" />
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
           
          ::-webkit-scrollbar{
        height: 4px;
        width: 4px;
        background: gray;
    }
    ::-webkit-scrollbar-thumb:horizontal{
        background: #000;
        border-radius: 10px;
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

#mstone-task-modal-ul li button{
    background:white;
}

.project-list-table th{
    text-align:center;
}
.proj-popup .row{
    margin-top:5px;
}
/*table header color*/
.project-list-table th{
    color:white !important;
    background-color:#d54832;
}
.tbody-project-list{
    text-align:center;
}

/*Involved Projects List table*/
.Inv-project-list-table th{
    text-align:center;
}
/*table header color*/
.Inv-project-list-table th{
    color:white !important;
    background-color:#d54832;
}
.tbody-Inv-project-list{
    text-align:center;
}

/*end*/

.mstone-list-table{
     color:white !important;
    background-color:#d54832;
}
.mstone-list-table th{
     color:white !important;    
}

/*task table header*/
.task-list-table th{
    color:white !important;
    background-color:#d54832;
}

.members-list-table th{
    color:white !important;
    background-color:#d54832;
}

.risk-list-table th{
    color:white !important;
    background-color:#d54832;
}
.budget-list-table th{
    color:white !important;
    background-color:#d54832;
}
.fa-icon-color{
    color: #d54832;
}
.dd-menu-proj .dropdown-item:hover{
    color:white;
}

 
.badge-for-taskcode{       
    letter-spacing: 0px;
    background-color: #787bff36 !important;
    color: #676aeb !important;
    box-shadow: 0px 0px 3px 0px #676aeb;
    height: 19px;
    font-size: 12px;
    /* margin-top: -24px; */
    /*position: absolute;
    top: 184px;
    left: auto;*/   
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

           /*Role TAgs form member area*/
 .member-role-pm {
    background: #ff702fc9;
    padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 6px;
    color: white;
    font-size: 13px;
}

 .member-role-cdr {
    background: #ff702fc9;
    padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 6px;
    color: white;
    font-size: 13px;
}

  .member-role-tl {
    background: #85bb1a;
    padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 6px;
    color: white;
    font-size: 13px;
}

   .member-role-tm {
    background: #1abbaf;             /*#c4a7ee;*/
    padding-left: 11px;
    padding-right: 12px;
    padding-top: 1px;
    padding-bottom: 4px;
    border-radius: 6px;
    color: white;
    font-size: 13px;
}

   .btn-closepu:hover {
    color: #ffffff;
    background-color: #d54832c9;
    border-color: #d54832;
    transform: translateY(-1px);
}
   .btn-closepu {
    color: #d54832;
    background-color: #ffffff;
    border-color: #d54832;
    /*box-shadow: 0 0.125rem 0.25rem 0 rgb(236 64 3 / 40%);*/
}

   .txt-for-name-in-grid{
       max-width:70%;
       border-color:transparent;
   }

   .proj-det-drilldown{
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
 
    .proj-det-drillup{
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
    .proj-det-drillup,.proj-det-drilldown:hover{
        background-color: #c52a11;
    }
    #lblProjectName1,#lblOwner1,#lblCreatedBy:focus{
    outline: none;
}
 .rectbox-pattern-img{
     /*background-image:url("./Asset/pattern-rect-box.png");
     width:95%;
     height:181px;
     opacity:0.1;*/
 }
 #projDetailModal .modal-body{
     /*background-image:url("./Asset/pattern-rect-box.png");*/     
    
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
    
      <div class="ajax-loader hidden" style="background: rgb(138 138 138 / 32%); position: fixed; width: 100%; height: 100%; z-index: 9999999999;">
            <div class="custom-loader-for-copy " style="/* display: none; */">
               <img src="./Asset/copy2.gif" style="width: 79%;">
                <h6 style="font-style: italic;">Copying...</h6>  
            </div> 

        </div>

      <h4 style="color: #a92828; margin-top:13px">Project List </h4>
                   <%--Child Tab--%>
                  <div class="nav-align-top row" style="zoom:90%;">
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
                         
                                <div class="table-responsive" style="margin-top: 0%; width:100%;">
                                         <table class="table project-list-table" style="width: 100%;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr>
                                                 <th>PROJECT CODE</th>
                                                 <th>PROJECT NAME</th>
                                               <th>PRIORITY</th>
                                               <th>STATUS</th>
                                               <th>OWNER</th>
                                               <th>Start Date</th>
                                               <th>DUE DATE </th>
                                                 <th>CREATED DATE </th> 
                                                 <th>MILESTONES </th> 
                                                 <th>TASKS </th> 
                                                  <th>ACTION </th>                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-project-list">

                                           </tbody>
                                         </table>
                               </div>

                            <%--Right click context menu--%>
                            <%--<span class="context-menu-one btn btn-neutral">right click me</span>--%>


                        </div>

                        <div class="tab-pane fade" id="navs-top-involved-project">
                          
                             <div class="table-responsive" style="margin-top: 0%;width:100%;">
                                         <table class="table Inv-project-list-table" style="width: 100%;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr>
                                                 <th>PROJECT CODE</th>
                                                 <th>PROJECT NAME</th>
                                               <th>PRIORITY</th>
                                               <th>STATUS</th>
                                               <th>OWNER</th>
                                               <th>Start Date</th>
                                               <th>DUE DATE </th>
                                                 <th>CREATED DATE </th> 
                                                 <th>MILESTONES </th> 
                                                 <th>TASKS </th> 
                                                  <th>ACTION </th>                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-Inv-project-list">

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
   
  


    <%--TODO PROJECT MODALS--%>

    <div class="modal fade" id="addProjModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lbladdProjModal">Create New Project</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body proj-popup">
       
          <div class="row">
              <div class="col-8">
                   <label for="html5-number-input" class="col-form-label label-custom">Project Name <span style="color: red;">*</span></label>
                   <div class="">
                       <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtProjectName">
                   </div>
              </div>

              <div class="col-4">
                   <label for="html5-number-input" class="col-form-label label-custom">Expected Budget <span style="color: red;">*</span></label>
                   <div class="">
                       <input class="form-control" type="text" placeholder="Enter Amount" value="" id="txtExpBudget" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57">
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
                                                <%--<option value="Not Started">Not Started</option>--%>
                                                        <%--<option value="Requested" selected>Requested</option>--%>
                                                        <option value="Assigned" selected>Assigned</option>
                                                        <option value="Started">Started</option>
                                                        <option value="Completed">Completed</option>
                                                        <option value="Cancelled">Cancelled</option>
                                            </select>
                                        </div>
              </div>

              <div class="col-8">
                    <label class="col-form-label label-custom" for="basic-default-name">Project Description <span style="color: red;">*</span></label>
                              <div>
                                  <textarea class="form-control" id="taProjDesc" rows="4" placeholder="Enter Project Description"></textarea>
                              </div>
              </div>
          </div>

   

          <div class="row">
              <div class="col-5">
                   <label for="html5-number-input" class="col-form-label label-custom">Expected Start Date <span style="color: red;">*</span></label>
                   <div class="">
                        <input type="text" id="projStartDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">

                   </div>
              </div>

                <div class="col-3">
                   <label for="html5-number-input" class="col-form-label label-custom">No. of Days <span style="color: red;">*</span></label>
                   <div class="">
                        <input type="text" id="NoOfDaysProj" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                   </div>
              </div>

              <div class="col-4">
                   <label for="html5-number-input" class="col-form-label label-custom">Expected End Date <%--<span style="color: red;">*</span>--%></label>
                   <div class="">
                        <input type="text" id="projDueDate" class="form-control" readonly="readonly">
                        <%--<input type="text" id="projDueDate" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">--%>

                   </div>
              </div>

          </div>
          
          <div class="row">
              <div class="col-12 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">Project Manager <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlProjManager" class="form-select color-dropdown ddlProjManager">     </select>
                      <%--<input type="text" id="ddlOwner" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly" />--%> 
                   </div>
              </div>
          </div>

               <div class="row">
              <div class="col-12 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">Project Co-ordinator <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlProjCoordinator" class="form-select color-dropdown ddlProjCoordinator">     </select>
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

    <%--end--%>

    
    <%--TODO INFO DETAIL MODAL--%>

       <div class="modal fade" id="projDetailModal" style="zoom:90%;" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
           <div class="modal-dialog modal-xl" role="document">
             <div class="modal-content"<%-- style="background: antiquewhite;"--%>>
               <div class="modal-header">
                 <h5 class="modal-title" id="lblprojDetailModal">Project Details</h5>
                 <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
              
                   <div style=" margin-top: -13px; position: absolute; width: 96%;"> 
                       <div style=" text-align: right;">
                           <i class="bx bxs-chevron-up proj-det-drilldown" onclick="hideShowProjDetails()"></i>
                       </div>
                   </div>



         <div id="proj-details-rectangle-div" style="/*background: #e14f0c17;*/ padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8;box-shadow: 0px 0px 13px -7px #d84d1a;"> 
                       <%--<div style="position: absolute; letter-spacing: 128px; font-style: italic;"><h1 style="font-size: 166px; color: #ff432508;">PROJECT</h1> </div>--%>
                       <div class="rectbox-pattern-img"> </div>
            <div class="row">

             <div style="width:20%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Project Name </label>
                   <div class="">                    
                       <%--<label id="lblProjectName1"></label>--%>
                       <input type="text" id="lblProjectName1" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>

            <div style="width:10%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Status </label>
                   <div class="">
                    
                                 <%--  <select id="ddlStatus1" class="form-select color-dropdown">
                                                <option value="Not Started" selected="">Not Started</option>
                                                <option value="Open">Open</option>
                                                <option value="In Progress">In Progress</option>
                                                <option value="Closed">Closed</option>
                                                <option value="Cancelled">Cancelled</option>
                                            </select>    --%>   
                       <label id="lblStatus1"></label>
                            
                   </div>
            </div>
             <div  style="width:10%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Priority</label>
                   <div class="">
                       <%--<select id="ddlPriority1" class="form-select color-dropdown">                                               
                                                <option value="Urgent" selected=""> Urgent</option>
                                                <option value="Important">  Important</option>
                                                <option value="Medium">  Medium</option>
                                                <option value="Low">  Low</option>
                                            </select>--%>
                       <label id="lblPriority1"></label>
                   </div>
            </div>
                       
              <div  style="width:16%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Project Manager </label>
                   <div class="">
                       <%--<select id="ddlOwner1" class="form-select color-dropdown">     </select>--%>
                       <%--<label id="lblOwner1"></label>--%>
                       <input type="text" id="lblOwner1" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>
                       
              <div  style="width:16%;">
                            <label for="html5-number-input" class="col-form-label label-custom"> Project Co-ordinator</label>
                   <div class="">
                       <%--<label id="lblCreatedBy"></label>--%>
                        <input type="text" id="lblCreatedBy" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>

                <div  style="width:8%;">
                            <label for="html5-number-input" class="col-form-label label-custom"> Expected Budget</label>
                   <div class="">
                        <%--<input type="text" id="lblExpBudget" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />--%>
                       <label id="lblExpBudget">  </label>
                   </div>
              </div>

                      <div style="width:10%; text-align:right;">
                            <label for="html5-number-input" class="col-form-label label-custom">Expected Start Date </label>
                                 <div class="">
                                     <%--<input class="form-control" type="text" value="" id="projStartDate1">--%>
                                     <label id="lblprojStartDate1" style="font-size:12px;"></label>
                                 </div>
                       </div>

                         <div style="width:10%; text-align:right;">
                                       <label for="html5-number-input" class="col-form-label label-custom">Expected End Date </label>
                              <div class="">
                                  <%--<input class="form-control" type="text" value="" id="projDueDate1">--%>
                                  <label id="lblprojDueDate1"  style="font-size:12px;"></label>
                              </div>
                       </div>
     </div>

     <div class="row" style="margin-top:1.5%;">

                        <div style="width:56%; text-align:right;">

                            <div class="row">

                                 <div class="col-4" style="border-right: 2px solid #a08f8f12;">  
                                        <table>
                                            
                                           <tr>
                                                <td colspan="4" style="text-align: center;font-weight: 700;background: #d7441124;color: #e25017cf;">Milestone </td>
                                            </tr>

                                            <tr>
                                                <td style="text-align:right;">Completed :</td>
                                                <td class="td-comp-mstone-count" style="color:#98ca3c; text-align:left; width: 42px; padding-left: 6px;text-shadow: 0px 1px 1px green;">-</td>
                                                
                                                <td style="text-align:right;">Remaining :</td>
                                                <td class="td-remain-mstone-count" style="color:#fbc11e; text-align:left; padding-left: 6px;text-shadow: 0px 1px 1px #cb9809;">-</td>   
                                            </tr>

                                            <tr>
                                                <td style="text-align:right;">Started :</td>
                                                <td class="td-active-mstone-count" style="color:#0b9adcbf; text-align:left; padding-left: 6px;text-shadow: 0px 1px 1px #099bc8;">-</td>       
                                                
                                                <td  style="text-align:right;">Cancelled :</td>
                                                <td class="td-cancel-mstone-count" style="color:#f56b61; text-align:left; padding-left: 6px;text-shadow: 0px 1px 1px #d80f0f;">-</td>     
                                            </tr>

                                          <%--  <tr>
                                                <td>Cancelled : &nbsp;</td>
                                                <td class="td-cancel-mstone-count" style="color:#f56b61;">-</td>                                                
                                            </tr>--%>
                                        </table>                                        
                                 </div>
                                 
                                <div class="col-4">  
                                         <table >

                                               <tr>
                                                <td colspan="4" style="text-align: center;font-weight: 700;background: #d7441124;color: #e25017cf;">Task </td>
                                            </tr>

                                            <tr>
                                                <td style="text-align:right;">Completed :</td>
                                                <td class="td-comp-task-count" style="color:#98ca3c; text-align:left; width: 42px; padding-left: 6px;text-shadow: 0px 1px 1px green;">-</td>
                                                
                                                <td style="text-align:right;">Remaining :</td>
                                                <td class="td-remain-task-count" style="color:#fbc11e; text-align:left; padding-left: 6px;text-shadow: 0px 1px 1px #cb9809;">-</td>   
                                            </tr>

                                            <tr>
                                                <td style="text-align:right;">Started :</td>
                                                <td class="td-active-task-count" style="color:#0b9adcbf; text-align:left; padding-left: 6px;text-shadow: 0px 1px 1px #099bc8;">-</td>       
                                                
                                                <td  style="text-align:right;">Cancelled :</td>
                                                <td class="td-cancel-task-count" style="color:#f56b61; text-align:left; padding-left: 6px;text-shadow: 0px 1px 1px #d80f0f;">-</td>     
                                            </tr>


                                          <%--  <tr>
                                                <td>Task Completed :</td>
                                                <td class="td-comp-task-count" style="color:#98ca3c;">-</td>                                                
                                            </tr>

                                            <tr>
                                                <td>Task Remaining :</td>
                                                <td class="td-remain-task-count" style="color:#fbc11e;">-</td>                                                
                                            </tr>

                                            <tr>
                                                <td>Task Cancelled : &nbsp;</td>
                                                <td class="td-cancel-task-count" style="color:#f56b61;">-</td>                                                
                                            </tr>--%>
                                        </table> 
                                 </div>

                                <div class="col-4">    
                                    <div id="projChart" style="margin-top:-18px"></div>
                                 </div>

                            </div>

                        </div>                

                        
         
                        <div style="width:16%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Project Duration </label>
                                 <div class="">
                                      <label id="lblNoOfDays"> - </label>
                                 </div>
                        </div> 

                    <div style="width:8%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Actual Budget </label>
                                 <div class="">
                                      <label id="lblActualBudget">  </label>
                                 </div>
                        </div> 


                         <div style="width:10%; text-align:right;">
                                 <label for="html5-number-input" class="col-form-label label-custom">Actual Start Date </label>
                                 <div class="">
                                      <label id="lblActualStartDate"  style="font-size:12px;"> - </label>
                                 </div>
                       </div>

                         <div style="width:10%; text-align:right;">
                                 <label for="html5-number-input" class="col-form-label label-custom">Actual End Date </label>
                                 <div class="">
                                      <label id="lblActualEndDate"  style="font-size:12px;"> - </label>
                                 </div>
                       </div>
       </div>


                   </div>
                   

                   <%--Grid--%>


    <div style="margin-top:1.5%;">

             <div class="nav-align-top">
              <ul class="nav nav-tabs" id="mstone-task-modal-ul" role="tablist">
                <li class="nav-item">
                  <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-mstones" aria-controls="navs-top-mstones" aria-selected="true"><i class='bx bx-football' ></i> Milestone</button>
                </li>
                <li class="nav-item">
                  <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-tasks" aria-controls="navs-top-tasks" aria-selected="false"><i class='bx bx-task'></i> Task</button>
                </li>
                <li class="nav-item">
                  <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-members" aria-controls="navs-top-members" aria-selected="false"><i class="bx bxs-user"></i> Members</button>
                </li>
                  <li class="nav-item">
                  <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-riskmanage" aria-controls="navs-top-riskmanage" aria-selected="false"><i class='bx bx-trending-up'></i> Risk Management</button>
                </li>
                  <li class="nav-item budget-li">
                  <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-budget" aria-controls="navs-top-budget" aria-selected="false"><i class="fa fa-money" aria-hidden="true"></i> Budget</button>
                </li>
              </ul>
              <div class="tab-content">
                  <%--1st--%>
                <div class="tab-pane fade show active" id="navs-top-mstones" role="tabpanel" style="margin-top: -2%;">
              
                         <div> 
                             <a href="#" class="btn btn-primary pull-right btn-add-mstone-grid"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Milestone</a>
                             <a href="#" class="btn btn-primary pull-right btn-copy-mstonentask-grid" title="Copy Milestones & Tasks" style="margin-right: 40px;"> <i class="bx bx-copy-alt"></i>&nbsp; Copy Project</a>
                         </div>
                         
                                <div class="table-responsive" style="margin-top: 1%;width:100%;">
                                         <table class="table mstone-list-table" style="width: 100%;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr style="text-align:center;">
                                                 <th>MLSTN Code</th>
                                                 <th>NAME</th>
                                               <th style="text-align:left;">PRIORITY</th>
                                               <th>STATUS</th>
                                               <th>OWNER</th>
                                               <th>Start Date</th>
                                               <th>DUE DATE </th>
                                                 <th>CREATED DATE </th> 
                                                 <th>TASK </th> 
                                                  <th>ACTION </th>                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-mstone-list" style="text-align:center;">

                                           </tbody>
                                         </table>
                               </div>
                </div>

                  <%--2nd--%>
                <div class="tab-pane fade" id="navs-top-tasks" role="tabpanel">
               
                         <div> 
                             <a href="#" class="btn btn-primary pull-right btn-add-task-grid"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Task</a>
                         </div>
                         
                                <div class="table-responsive" style="margin-top: 0%;width:100%;">
                                         <table class="table task-list-table" style="width: 100%;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr style="text-align:center;">
                                                 <th>TASK CODE</th>
                                                 <th>NAME</th>
                                               <th style="text-align:left;">PRIORITY</th>
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
                                           <tbody class="tbody-task-list" style="text-align:center;">

                                           </tbody>
                                         </table>
                               </div>
                </div>

                  <%--3rd--%>
                <div class="tab-pane fade" id="navs-top-members" role="tabpanel">
                 
                           <div> 
                             <a style="margin-top: -1.7%;" href="#" class="btn btn-primary pull-right btn-add-member-grid"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Members</a>
                         </div>
                         
                                <div class="" style="padding-top: 2%;">
                                         <table class="table members-list-table" style="width: 100%;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr style="text-align:center;">
                                                 <th style="text-align: left; width: 50%;">NAME</th>
                                               <th style="width: 12%;">PROJECT ROLE</th>
                                               <th style="width: 20%;">STATUS</th>                                               
                                                  <th style="width: 18%;">ACTION </th>                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-members-list" style="text-align:center;">

                                           </tbody>
                                         </table>
                               </div>

                </div>
                     <%--4th--%>
                <div class="tab-pane fade" id="navs-top-riskmanage" role="tabpanel">
                 
                           <div> 
                             <a style="margin-top: -1.7%;" href="#" class="btn btn-primary pull-right btn-add-risk-grid"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Risk</a>
                         </div>
                         
                                <div class="" style="padding-top: 2%;">
                                         <table class="table risk-list-table" style="width: 100%;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr style="text-align:center;">
                                                 <th style="text-align: left; width: 50%;">Project</th>
                                               <th style="width: 12%;">Risk Desc</th>
                                               <th style="width: 20%;">Risk Status</th>                                               
                                               <th style="width: 20%;">Risk Type</th>                                               
                                               <th style="width: 20%;">Risk Effort</th>                                               
                                                  <th style="width: 18%;">ACTION </th>                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-risk-list" style="text-align:center;">

                                           </tbody>
                                         </table>
                               </div>

                </div>

                     <%--5th--%>
                <div class="tab-pane fade" id="navs-top-budget" role="tabpanel">
                 
                           <div> 
                             <a style="margin-top: -1.7%;" href="#" class="btn btn-primary pull-right btn-add-budget-grid"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Budget</a>
                         </div>
                         
                                <div class="">
                                         <table class="table budget-list-table" style="width: 100%;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr style="text-align:center;">
                                                 <th style="text-align: left; width: 50%;">Project</th>
                                               <th style="width: 12%;">Amount</th>
                                               <th style="width: 20%;">Source</th>                                               
                                               <th style="width: 20%;text-align:left;padding-left: 40px;">Attachment(s)</th>                                               
                                                  <th style="width: 18%;">ACTION </th>                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-budget-list" style="text-align:center;">

                                           </tbody>
                                         </table>
                               </div>

                </div>


              </div>
            </div>

    </div>
                   

               </div>
             <%--  <div class="modal-footer">
                 <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                 <button type="button" class="btn btn-primary">Save changes</button>
               </div>--%>
             </div>
           </div>
      </div>

    <%--end--%>


    <%--TODO CREATE MISLTONE MODAL--%>

    
    <div class="modal fade" id="addMStoneModal" style="background-color:#00000070;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lbladdMStoneModal">Create New Milestone</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body proj-popup">
       
          <div class="row">
              <div class="col-12">
                   <label for="html5-number-input" class="col-form-label label-custom">Milestone Name <span style="color: red;">*</span></label>
                   <div class="">
                       <input class="form-control" type="text" placeholder="Enter Milestone Name" value="" id="txtNameMStone" >
                   </div>
              </div>
          </div>

          <div class="row">
              <div class="col-4">
                  <label class="col-form-label label-custom" for="basic-default-name">Priority</label>
                                        <div>
                                            <select id="ddlPriorityMStone" class="form-select color-dropdown">                                               
                                                <option value="Urgent" selected=""> Urgent</option>
                                                <option value="Important">  Important</option>
                                                <option value="Medium">  Medium</option>
                                                <option value="Low">  Low</option>
                                            </select>
                                        </div>


                  <label class="col-form-label label-custom" for="basic-default-name">Status</label>
                                        <div>
                                            <select id="ddlMStatusMStone" class="form-select color-dropdown">
                                                <%--<option value="Not Started">Not Started</option>
                                                        <option value="Requested" selected>Requested</option>--%>
                                                        <option value="Assigned" selected>Assigned</option>
                                                        <option value="Started">Started</option>
                                                        <option value="Completed">Completed</option>
                                                        <option value="Cancelled">Cancelled</option>
                                            </select>
                                        </div>
              </div>

              <div class="col-8">
                    <label class="col-form-label label-custom" for="basic-default-name">Milestone Description <span style="color: red;">*</span></label>
                              <div>
                                  <textarea class="form-control" id="taTaskDescMStone" rows="4" placeholder="Enter Milestone Description" ></textarea>
                              </div>
              </div>
          </div>

   

          <div class="row">
              <div class="col-5">
                   <label for="html5-number-input" class="col-form-label label-custom">Start Date <span style="color: red;">*</span></label>
                   <div class="">
                        <input type="text" id="StartDateMStone" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">

                   </div>
              </div>

              <div class="col-3">
                   <label for="html5-number-input" class="col-form-label label-custom">No. of Days <span style="color: red;">*</span></label>
                   <div class="">
                        <input type="text" id="NoOfDaysMStone" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                   </div>
              </div>


              <div class="col-4">
                   <label for="html5-number-input" class="col-form-label label-custom">Due Date <span style="color: red;">*</span></label>
                   <div class="">
                       <input type="text" id="DueDateMStone" class="form-control" readonly="readonly">
                        <%--<input type="text" id="DueDateMStone" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">--%>

                   </div>
              </div>

          </div>
          
          <div class="row">
              <div class="col-12 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">Team Lead <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlOwnerMStone" class="form-select color-dropdown ddlOwner">     </select>
                      <%--<input type="text" id="ddlOwner" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly" />--%> 
                   </div>
              </div>
          </div>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-closepu" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnAddMStone">Create</button>
      </div>
    </div>
  </div>
</div>

    <%--END--%>


      <%--TODO CREATE TASK MODAL--%>

    
    <div class="modal fade" id="addTaskModal" style="background-color:#00000070;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lbladdTaskModal">Create New Task</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body proj-popup">
       
          <div class="row">
              <div class="col-12">
                   <label for="html5-number-input" class="col-form-label label-custom">Milestone<span style="color: red;">*</span></label>
                   <div class="">
                       <%--<input class="form-control" type="text" value="" id="txtNameTaskMileStone" style="border-color: lightgrey;" disabled>--%>
                       <select id="ddlMilestoneForTask" class="form-select color-dropdown">  </select>
                   </div>
              </div>
          </div>

          <div class="row">
              <div class="col-12">
                   <label for="html5-number-input" class="col-form-label label-custom">Task Name <span style="color: red;">*</span></label>
                   <div class="">
                       <input class="form-control" type="text" value="" id="txtNameTask" placeholder="Enter Task Name">
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
                                               <%-- <option value="Not Started">Not Started</option>
                                                        <option value="Requested" selected>Requested</option>--%>
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
                                  <textarea class="form-control" id="taTaskDescTask" rows="4" placeholder="Enter Task Description" ></textarea>
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
          
          <div class="row">
              <div class="col-4"  style="margin-top: 2%;">
                  <input type="checkbox" id="cbDependTask" netliva-switch />
              </div>

              <div class="col-8" style="margin-top: 2%;">
                  <div class="ddl-depend-task-div hidden">  <select id="ddlDependTask" class="form-select color-dropdown ddlDependTask">     </select>  </div>
              </div>

          </div>


          <div class="row">
              <div class="col-12 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">Team Member <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlOwnerTask" class="form-select color-dropdown ddlOwner">     </select>
                      <%--<input type="text" id="ddlOwner" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly" />--%> 
                   </div>
              </div>
          </div>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-closepu" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnAddTask">Create</button>
      </div>
    </div>
  </div>
</div>

    <%--END--%>


      <%--TODO Add MEMBER MODAL--%>

    
    <div class="modal fade" id="addMemberModal" style="background-color:#00000070;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lbladdMemberModal">Add New Member</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body proj-popup">         
          <div class="row">
              <div class="col-12 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">Members <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlMemberForProj" class="color-dropdown ddlOwnerMember">     </select>
                      <%--<input type="text" id="ddlOwner" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly" />--%> 
                   </div>
              </div>
          </div>

            <div class="row">
              <div class="col-12 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">Role for Project <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlProjRole" class="form-select color-dropdown ddlProjRole">     </select>
                      <%--<input type="text" id="ddlOwner" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly" />--%> 
                   </div>
              </div>
          </div>

          <div class="row" style="padding: 14px;">
                 <div class=" col-md-12 form-check form-switch" style="float: right;">
                 <input class="form-check-input" type="checkbox" role="switch" id="cbIsMemActive">
                 <label class="form-check-label" for="cbIsMemActive" style="font-weight: bold;color: #c93434;">Active</label>
                 </div>
          </div>

      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-closepu" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnAddMember">Add</button>
      </div>
    </div>
  </div>
</div>

    <%--END--%>


    
      <%--TODO Add Risk Management MODAL--%>

    
    <div class="modal fade" id="addRiskModal" style="background-color:#00000070;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lbladdRiskModal">Add New Risk</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body proj-popup">         
          <div class="row">
              <div class="col-md-12">
                   <label for="html5-number-input" class="col-form-label label-custom">Project </label>     <%--<span style="color: red;">*</span>--%>
                   <div class="">
                       <%--<select id="ddlMemberForProj" class="color-dropdown ddlOwnerMember">     </select>--%>
                      <input type="text" id="txtProjNameForRisk" class="form-control" readonly="" /> 
                   </div>
              </div>
          </div>

          <div class="row"> 
              <label class="col-form-label label-custom" for="basic-default-name">Risk Description <span style="color: red;">*</span></label>
              <div><textarea class="form-control" id="taRiskDesc" rows="4" placeholder="Enter Risk Description"></textarea></div>
          </div>
      
          <div class="row"> 

              <div class="col-md-6">
              <label class="col-form-label label-custom" for="basic-default-name">Risk Type</label>
                                        <div>
                                            <select id="ddlRiskType" class="form-select color-dropdown">
                                                        <option value="Low" selected>Low</option>
                                                        <option value="Medium">Medium</option>
                                                        <option value="High">High</option>
                                                        <option value="Show Stopper">Show Stopper</option>
                                            </select>
                                        </div>
              </div>

              <div class="col-md-6">
              <label class="col-form-label label-custom" for="basic-default-name">Risk Status</label>
                                        <div>
                                            <select id="ddlRiskStatus" class="form-select color-dropdown">                                                
                                                        <option value="Not Started" selected>Not Started</option>
                                                        <option value="In Process">In Process</option>
                                                        <option value="Resolved">Resolved</option>                                                                                                                
                                            </select>
                                        </div>
              </div>
          </div>

          <div class="row risk-effort-div hidden"> 
              <label class="col-form-label label-custom" for="basic-default-name">Effort to reduce the risk</label>
              <div><textarea class="form-control" id="taEffortReduceRisk" rows="4" placeholder="Enter Effort For Reduce the Risk"></textarea></div>
          </div>
          

        <%--  <div class="row" style="padding: 14px;">
                 <div class=" col-md-12 form-check form-switch" style="float: right;">
                 <input class="form-check-input" type="checkbox" role="switch" id="cbIsMemActive">
                 <label class="form-check-label" for="cbIsMemActive" style="font-weight: bold;color: #c93434;">Active</label>
                 </div>
          </div>--%>

      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-closepu" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnAddRisk">Add</button>
      </div>
    </div>
  </div>
</div>

    <%--END--%>

     <%--TODO Add Budget MODAL--%>

    
    <div class="modal fade" id="addBudgetModal" style="background-color:#00000070;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lbladdBudgetModal">Add New Risk</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body proj-popup">         
          <div class="row">
              <div class="col-md-12">
                   <label for="html5-number-input" class="col-form-label label-custom">File Upload <span style="color: red;">*</span></label>     
                   <div class="input-group">        
                             <label style="margin-right: 10px;" class="lbl-fufile-count"></label>

                             <input class="form-control" type="file" id="fu-budget-attach" accept=".doc,.docx,.pdf,.png,.jpeg" style="display:none;" >
                             <label class="input-group-text ml-3" for="fu-budget-attach"><i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i></label>

                            <%--<a href="#" id="btnUploadChatFile" class="btn btn-primary" style="margin-left: 4px;">Upload File </a>--%>
                                                       
                       <input type="text" id="lblFilesName" value="" style="width:70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left:10px;" readonly="">                               
                    </div>
              </div>

          </div>

          <div class="row">
                   <label for="html5-number-input" class="col-form-label label-custom">Amount <span style="color: red;">*</span></label>     
                   <div class="">
                      <input type="number" id="txtBudgetAmount" class="form-control" placeholder="Enter Amount" /> 
                   </div>             
          </div>

          <div class="row"> 
              <label class="col-form-label label-custom" for="basic-default-name">Source <span style="color: red;">*</span></label>
              <div><textarea class="form-control" id="taBudgetSource" rows="4" placeholder="Enter Source"></textarea></div>
          </div>
     

      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-closepu" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnAddBudget">Add</button>
      </div>
    </div>
  </div>
</div>

    <%--END--%>


    <%--DELETE CONFIMATION MODAL FOR PROJECT--%>
    <div class="modal fade" id="deleteProjConfirmModal" style="background-color:#00000070;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
          <div><h3>Are you sure?</h3></div>
        Do you want to delete the Project?
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-del-proj-yes" data-bs-dismiss="modal">Delete</button>
          </div>
      </div>
    </div>
  </div>
</div>

    <%--DELETE CONFIMATION MODAL FOR MILESTONE--%>
        <div class="modal fade" id="deleteMStoneConfirmModal" style="background-color:#00000070;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
          <div><h3>Are you sure?</h3></div>
        <span class="cMStoneSentence">Do you want to delete the Milstone?</span>
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-del-mstone-yes" data-bs-dismiss="modal">Delete</button>
          </div>
      </div>
    </div>
  </div>
</div>

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

        <%--DELETE CONFIMATION MODAL FOR RISK--%>
        <div class="modal fade" id="deleteRiskConfirmModal" style="background-color:#00000070;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
          <div><h3>Are you sure?</h3></div>
        <span class="cMemberSentence">Do you want to delete the Member? </span> 
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-del-risk-yes" data-bs-dismiss="modal">Delete</button>
          </div>
      </div>
    </div>
  </div>
</div>


    <!--Copy Tasks and Milestones Modal -->
<div class="modal fade" id="copyMstoneNTasksModal" style="background-color:#00000070;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lblCopyMstoneNTasksModal">Copy Project's Tasks and Milestones</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
           <div class="row">
              <div class="col-md-6 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">From <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlCopyProjectFrom" class="form-select color-dropdown ddlOwner">     </select>
                      <%--<input type="text" id="ddlOwner" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly" />--%> 
                   </div>
              </div>

               <div class="col-md-6 multi-ddl-owner-div">
                   <label for="html5-number-input" class="col-form-label label-custom">To <span style="color: red;">*</span></label>
                   <div class="">
                       <select id="ddlCopyProjectTo" class="form-select color-dropdown ddlOwner" disabled>     </select>
                      <%--<input type="text" id="ddlOwner" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly" />--%> 
                   </div>
              </div>

          </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-copy">Copy</button>
      </div>
    </div>
  </div>
</div>

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


<%--  <div class="row">

      <div class="col-md-3" style="background:red;">My Name</div>
      <div class="col-md-3" style="background:blue;">Is the </div>
      <div class="col-md-3" style="background:green;">XYZ of Dashboard</div>
      <div class="col-md-3" style="background:black;">Yes, I am Right</div>

  </div>--%>
    <%--Side Canvas Like Modal--%>
  <%--  <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasEnd" aria-controls="offcanvasEnd">Toggle End</button>
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasEnd" aria-labelledby="offcanvasEndLabel">
  <div class="offcanvas-header">
    <h5 id="offcanvasEndLabel" class="offcanvas-title">Offcanvas End</h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body my-auto mx-0 flex-grow-0">
    <p class="text-center">Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.</p>
    <button type="button" class="btn btn-primary mb-2 d-grid w-100">Continue</button>
    <button type="button" class="btn btn-label-secondary d-grid w-100" data-bs-dismiss="offcanvas">Cancel</button>
  </div>
</div>--%>


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
    

<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>

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

    <script src="Scripts/project-main.js?v=3.2"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


      <link href="Asset/css/select2.css" rel="stylesheet" />
    <script src="Asset/js/select2.js"></script>

     <link href="Asset/css/netliva_switch.css"  rel="stylesheet" />
      <script src="Asset/js/netliva_switch.js"></script>

      <!-- Vendors JS -->
    <script src="../Dashboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>
</asp:Content>



