<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="SurveyAdmin.aspx.cs" Inherits="Survey_SurveyAdmin" %>

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

             .Survey-list-table td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }

              .Question-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

             .Question-list-table td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }

         .question-master-list-table th{
             /*text-align: center;*/
            color: white !important;
            background-color: #d54832;
         }

               .Employee-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

             .Employee-list-table td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }


                 .Answer-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

             .Answer-list-table td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }
                    .Temp-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

             .Temp-list-table td
        {
              border-bottom: 1px solid #96a2ab45  !important;

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
          background-color:#ff6f591a !important;
         border-right: 5px solid #db7e2f !important;
    
}

.Survey-status-Draft{   
    background-color: #fff2d6 !important;
    color: #ffab00 !important;
    letter-spacing: 1px;
    box-shadow: 0px 0px 3px 0px #ffab00;   
}
.Survey-status-completed{
   

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
.Survey-status-NotActive{
 

    background-color: #ffe0db !important;
    color: #ff3e1d !important;
    letter-spacing: 0.5px;
    box-shadow: 0px 0px 3px 0px #ff3e1d;
    min-width: 52%;
    text-align: center;
}


 .Survey-det-drilldown{
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
  .emps-list-table th{
      background: #ffe7e0;
      position: sticky;
      top: -10px;
      border-bottom: 1px solid #fff !important;
  }
  
  .select2-results__options li strong{
      color:rgb(242 71 71);
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
  .taDiv:focus{
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
  .active-ass{
    /*background-color:#e6eeff !important;*/
    background-color:#ffede6 !important;
}
  .tbody-quesopt-list tr:hover{
      cursor:pointer;
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
       <div style="padding-left: 2%; padding-top: 1%;"> <h5 style="color: #a92828; margin-top:13px">SURVEY ADMIN</h5></div> 

  <div class="card-body" style="margin-top: -1%;zoom:90%;">

      <div class="nav-align-top">
  <ul class="nav nav-tabs survey-admin-ul-main" role="tablist">
    <li class="nav-item">
      <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-survey" aria-controls="navs-top-survey" aria-selected="true">Survey</button>
    </li>
    <li class="nav-item">
      <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-template" aria-controls="navs-top-template" aria-selected="false">Template</button>
    </li>
   <li class="nav-item">
      <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-question" aria-controls="navs-top-question" aria-selected="false">Question Master</button>
    </li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane fade show active" id="navs-top-survey" role="tabpanel">    
        
     <div class="row">

         <div class="col-3">
              <asp:Label ID="Label2" Text="TYPE" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select id="ddlType" class="form-select color-dropdown">
                                   <option value="Cross Functional">Cross Functional</option> 
                                   <option value="General Functional">General Functional</option>
                              </select>
         </div>
         <div class="col-7"></div>

         <div class="col-2">
             <a href="#" class="btn btn-primary pull-right Add-NewSurvey"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add Survey</a>
         </div>

          
      </div>


      <div class="" style="margin-top: 1%;">
          <table class="table Survey-list-table">

              <thead>
                  <tr>
 
                      <%--<th style="width:8%;">SurveyId</th>--%>
                      <th style="width:14%;">Survey Name</th>
                     <%-- <th style="width:6%;">Description</th>--%>
                      <th style="width:8%;">Status</th>
                      <th style="width:12%;">Company</th>
                      <th style="width:8%;">Survey Department</th>
                      <th style="width:8%;">Start Date</th>
                      <th style="width:8%;">End Date</th>
                      <th style="width:6%;">View</th>

                     

              </thead>
              <tbody class="tbody-Survey">
              </tbody>
          </table>
      </div>


    </div>

      <%--2nd Tab--%>
    <div class="tab-pane fade" id="navs-top-template" role="tabpanel">
      
        <div class="row">

         <div class="col-3">
              <asp:Label ID="Label1" Text="TYPE" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select id="ddlType1" class="form-select color-dropdown">
                                   <option value="Cross Functional">Cross Functional</option> 
                                   <option value="General Functional">General Functional</option>
                              </select>
         </div>
         <div class="col-7"></div>

         <div class="col-2">
             <a href="#" class="btn btn-primary pull-right add-temp-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add Template</a>
         </div>

          
      </div>


      <div class="" style="margin-top: 1%;">
          <table class="table Temp-list-table">

              <thead>
                  <tr>                       
                      <th>Template Name</th>
                      <th style="padding-right: 350px;">Description</th>
                      <%--<th>Status</th>--%>                      
                      <th style="padding-right: 79px;">Action</th>                      
              </thead>
              <tbody class="tbody-Temp">
              </tbody>
          </table>
      </div>

    </div>
    

   <%--3rd Tab--%>
    <div class="tab-pane fade" id="navs-top-question" role="tabpanel">
      
        <div class="row">

         <div class="col-3">
              <asp:Label ID="Label3" Text="TYPE" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select id="ddlQCategory" class="form-select color-dropdown">
                                   <option value="Cross Functional">Cross Functional</option> 
                                   <option value="General Functional">General Functional</option>
                              </select>
         </div>
         
         <div class="col-7">

           <%--  <div class="row" style="border: 1px solid #ff500054; border-radius: 5px;">
                    <div class="col-10">
                        <textarea class="taDiv" rowspan="2" style="width: 100%; border: 0px;resize:none;">asdasd a ad aad ad ad ada dadad a</textarea>
                    </div>
                        <div class="col-2">
                        <span style="margin-left: 0%;"><i class="bx bxs-edit fa-icon-hover ibtn-ass-edit" title="Edit KPI" data-assid="1" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
                    </div>
            </div>--%>

         </div>

         <div class="col-2">
             <a href="#" class="btn btn-primary pull-right add-ques-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add Question</a>
         </div>

          
      </div>


      <div class="" style="margin-top: 1%;">
          <table class="table question-master-list-table">

              <thead>
                  <tr>                       
                      <th style="padding-right: 200px;">Question</th>
                      <th>Category</th>
                      <th style="padding-right: 105px;">Category Description</th>
                      <%--<th>Status</th>--%>                      
                      <th>Action</th>                      
              </thead>
              <tbody class="tbody-question-master-list">
              </tbody>
          </table>
      </div>

    </div>

  </div>
</div>


    </div>   <%--card-body end--%>
</div>




           <div class="modal fade" id="SurveyDetailModal" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
           <div class="modal-dialog modal-xxl"  role="document" style="max-width: 95%;">
             <div class="modal-content"<%-- style="background: antiquewhite;"--%>>
               <div class="modal-header">
                 <h5 class="modal-title" id="lblprojDetailModal">Survey Details</h5>
                 <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
              
                   <div style=" margin-top: -13px; position: absolute; width: 96%;"> 
                       <div style=" text-align: right;">
                           <i class="bx bxs-chevron-up Survey-det-drilldown" onclick="hideShowSurveyDetails()"></i>
                       </div>
                   </div>



         <div id="Survey-details-rectangle-div" style="background: #e14f0c17; padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8;box-shadow: 0px 0px 13px -7px #d84d1a;"> 
                       
            <div class="row">

             <div style="width:20%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Survey Name </label>
                   <div class="">                    
                     
                       <input type="text" id="lblSurveyName" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>

                 <div style="width:20%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Survey Type </label>
                   <div class="">                    
                     
                       <input type="text" id="lblSurveyType" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>

            <div style="width:10%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Status </label>
                   <div class="">
                    
                                
                       <label id="lblStatus1"></label>
                            
                   </div>
            </div>

               <div style="width:30%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Survey Description </label>
                   <div class="">                    
                     
                       <input type="text" id="lblSurveyDesc" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>

                 <div style="width:20%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Company </label>
                   <div class="">                    
                     
                       <input type="text" id="lblCompany" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>

           
            
     </div>

     <div class="row" style="margin-top:1.5%;">

              <div style="width:20%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Department </label>
                   <div class="">                    
                     
                       <input type="text" id="lblDepartment" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>

          <div style="width:20%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Feedback Name </label>
                   <div class="">                    
                     
                       <input type="text" id="lblTempName" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>

            <div style="width:10%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Start Date </label>
                   <div class="">                    
                     
                       <input type="text" id="lblStartDate" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>

              <div style="width:10%;">
                            <label for="html5-number-input" class="col-form-label label-custom">End Date </label>
                   <div class="">                    
                     
                       <input type="text" id="lblEndDate" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>

         


            <%--<div style="width:20%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Employee </label>
                   <div class="">                    
                     
                       <input type="text" id="lblEmployee" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>

          <div style="width:10%;">
                            <label for="html5-number-input" class="col-form-label label-custom">ApplicationId </label>
                   <div class="">                    
                     
                       <input type="text" id="lblAppId" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>


          <div style="width:30%;">
                            <label for="html5-number-input" class="col-form-label label-custom">UpdatedBy </label>
                   <div class="">                    
                     
                       <input type="text" id="lblUpdatedBy" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>--%>

           <div style="width:20%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Updated Date </label>
                   <div class="">                    
                     
                       <input type="text" id="lblUpdatedDate" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>

          <div style="width:20%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Survey Department Name </label>
                   <div class="">                    
                     
                       <input type="text" id="lblSurveyDepName" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly />
                   </div>
              </div>
                        
         
                      
       </div>

            

                   </div>
                   

                   <%--Grid--%>


    <div style="margin-top:1.5%;zoom:87%;">

             <div class="nav-align-top">
              <ul class="nav nav-tabs" id="survey-ul" role="tablist">
                <li class="nav-item ">
                  <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Dashboard" aria-controls="navs-top-Dashboard" aria-selected="true">Dashboard</button>
                </li>
                <li class="nav-item">
                  <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Questions" aria-controls="navs-top-Questions" aria-selected="false">View Questions</button>
                </li>
                <li class="nav-item">
                  <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-AssignedEmp" aria-controls="navs-top-AssignedEmp" aria-selected="false">Employees Survey Response</button>
                </li>
                   <li class="nav-item">
                  <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-AddLM" aria-controls="navs-top-AssignedEmp" aria-selected="false">Add Line Managers</button>
                </li>

                  <div style="width: 98.7%;">
                      <a href="#" class="btn btn-primary btn-tag-emp-grid" style="float: right; margin-top: -38px;margin-left: 12px;"><i class="bx bxs-purchase-tag"></i> Tag Employee(s) </a>
                      <a href="#" class="btn btn-primary btn-tag-temp-grid" style="float: right; margin-top: -38px;"><i class='bx bxs-purchase-tag'></i> Tag Templete </a>
                  </div>
                 
              </ul>
              <div class="tab-content">
                  <%--1st--%>
                <div class="tab-pane fade show active" id="navs-top-Dashboard" role="tabpanel" style="margin-top: -2%;">
              
                         <%--<div> 
                             <a href="#" class="btn btn-primary pull-right btn-add-mstone-grid"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Milestone</a>
                         </div>
                         --%>
                              
                </div>

                  <%--2nd--%>



                  <div class="tab-pane fade" id="navs-top-Questions" role="tabpanel">


                      <div class="table-responsive" style="margin-top: 0%; width: 100%;">
                          <table class="table Question-list-table" style="width: 100%;">
                              <%--<caption class="ms-4">List of Projects</caption>--%>
                              <thead>
                                  <tr style="text-align: center;">
                                       <th style="display:none;">QID</th>
                                      <th>Category</th>
                                      <th>Question</th>
                                      <th >Question Type</th>
                                    <%--  <th style="width: 95px !important">STATUS</th>--%>
                                      <%--<th>Create Date</th>--%>
                                      <%--<th>Created By</th>--%>
                                      <th>View</th>
                                      
                                  </tr>
                              </thead>
                              <tbody class="tbody-Question-list" style="text-align: center;">
                              </tbody>
                          </table>
                      </div>
                  </div>
               
                  <%--3rd--%>


                   <div class="tab-pane fade" id="navs-top-AssignedEmp" role="tabpanel">


                      <div class="table-responsive" style="margin-top: 0%; width: 100%;">
                          <table class="table Employee-list-table" style="width: 100%;">
                              <%--<caption class="ms-4">List of Projects</caption>--%>
                              <thead>
                                  <tr style="text-align: center;">
                                      <th>Employee Name</th>
                                      <th>Company</th>
                                      <th>CreatedBy</th>
                                      <th>Created Date</th>
                                      <th style="width:10% !important">Status</th>
                                      <th>SubmittedON</th>
                                      <th>Start Date</th>
                                      <th>Comments</th>
                                      
                                  </tr>
                              </thead>
                              <tbody class="tbody-Employe-list" style="text-align: center;">
                              </tbody>
                          </table>
                      </div>
                  </div>

                  <%--4th--%>
                   <div class="tab-pane fade" id="navs-top-AddLM" role="tabpanel">

                  <div class="row" style="width: 98.7%;">
                      <div class="col-4"> <select id="ddlLM" class="form-select color-dropdown"> </select> </div>
                     
                      <div class="col-2"><a href="#" class="btn btn-primary btn-add-lm-grid" style="float: left; margin-top: -8px;background:#ed974e !important;border-color:#b87200 !important;"><i class="fa fa-plus" aria-hidden="true"></i> Add </a></div>                      
                      
                  </div>

                      <div class="table-responsive" style="margin-top: 1%; width: 100%;">
                          <table class="table LM-list-table" style="width: 100%;">
                              <%--<caption class="ms-4">List of Projects</caption>--%>
                              <thead>
                                  <tr style="text-align: center;">
                                      <th>Emp No</th>
                                      <th>Name</th>
                                      <th>Organization</th>
                                      <th>Department</th>                                      
                                      <th>Action</th>                                      
                                  </tr>
                              </thead>
                              <tbody class="tbody-LM-list" style="text-align: center;">
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






      <div class="modal fade" id="ModalAnswerDetails" tabindex="-1" aria-hidden="true">
           <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
             <div class="modal-content"<%-- style="background: antiquewhite;"--%>>
               <div class="modal-header">
                 <h5 class="modal-title" id="modaAnswer">ANSWERS</h5>
                 <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
              

                   

                   <%--Grid--%>


                   <div style="margin-top: 1.5%;">

                       <div class="nav-align-top">
                           <ul class="nav nav-tabs" id="modalAnswer" role="tablist">
                               <li class="nav-item">
                                   <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Answer" aria-controls="navs-top-Answer" aria-selected="true">Answers</button>
                               </li>


                           </ul>
                           <div class="tab-content">
                               <%--1st--%>
                               <div class="tab-pane fade show active" id="navs-top-Answer" role="tabpanel" style="margin-top: -1%;">

                       <%--            <div>
                                       <a href="#" class="btn btn-primary pull-right btn-add-tenant-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Tenant</a>
                                   </div>--%>

                                   <div class="table-responsive" style="margin-top: 1%; width: 100%;cursor:pointer;">
                                  
                                       <table class="table Answer-list-table" style="width: 100%;">

                                           <thead>
                                               <tr style="text-align: center;">
                                                  
                                                  <th style="display:none;">AnswerId</th>
                                                   <th>Answer</th>                                                 
                                                    <th>Answer Value </th>
                                                 <%--  <th>Substage </th>
                                                   <th>Value </th>--%>

                                               </tr>
                                           </thead>
                                           <tbody class="tbody-Question-details" style="text-align: center;">
                                           </tbody>
                                       </table>

                                   </div>
                               </div>

                           </div>
                       </div>

                        <div id="dvdJustification" style="background: rgb(185 169 169 / 21%); padding: 17px; border-radius: 12px; border: 1px solid #1d1b1b36; box-shadow: 4px 4px 13px -7px #1d1b1b36;margin-top:1%;">

                            
                         </div>

                   </div>
                   

               </div>
             
             </div>
           </div>
      </div>






    <div class="modal fade" id="ModalAddSurvey" style="background: #fff2f085;zoom: 87%;" tabindex="-1" aria-hidden="true">
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
                                    <input type="text" id="txtSurveyName" class="form-control"  />

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
                                 <select id="ddlOrg" class="form-select color-dropdown"> </select>
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
                    <div><select id="ddlTemplateList" class="form-select color-dropdown"> </select> </div>

                </div> 
            </div>
        
          <div class="row" style="text-align: center;color: #ff913c;font-size: 18px;"> <div>Template Preview </div></div>

          <div class="row temp-draw-ques" style="padding:20px;">

          </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnTagTemp"><i class="bx bxs-purchase-tag"></i> Tag</button>
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
                    <div><select id="ddlDeptList" class="form-select color-dropdown" style="z-index:9999999;" multiple> </select> </div>

                </div> 
            </div>
        
          <%--<div class="row" style="text-align: center;color: #ff913c;font-size: 18px;"> <div>Template Preview </div></div>--%>

          <div class="row" style="padding:20px;">

                 <div class="table-responsive" style="overflow-y: auto;max-height:800px; width: 100%;padding-top: 10px;zoom:90%;">
                                         <table class="table emps-list-table" style="width: 100%;margin-top: 11px;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr>
                                                 <th style="background: #d54832 !important;color:white;"> <label class="btn-all-cb" style="background:transparent;"> <input class="form-check-input" type="checkbox"> All  </label> </th>
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
        <button type="button" class="btn btn-primary btnTagEmp"><i class="bx bxs-purchase-tag"></i> Save</button>
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
                    <div> <textarea class="form-control" id="taQuestion" rows="2" placeholder="Enter Question Text"></textarea> </div>
                </div> 
            </div>
   
           <div class="row">
                <div class="col-12"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Question Description </label>
                    <div> <textarea class="form-control" id="taQuestionDesc" rows="2" placeholder="Enter Question Desc"></textarea> </div>
                </div> 
            </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnAddQues"> Create </button>
      </div>
    </div>
  </div>
</div>


 <%--Add Answers Justification--%>
        <div class="modal fade" id="addQuesOptnJustiModal" style="background: #fff2f085;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xxl" role="document">
    <div class="modal-content">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
     <%-- <div class="modal-header">
        <h5 class="modal-title" id="addQuesOptModalLabel">Create Answer</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>--%>
      <div class="modal-body">
        
          <div class="card-body row" style="zoom: 90%;">
                                       
                    <div class="" style="width:60%;">
                                    <div style="margin-top: 1px;"> 
                                        <h5 style="color: #a92828; margin-top:-25px;">Answers List </h5>
                                     <%--   <label><i class="bx bx-search-alt-2" style="margin-top: -7px; font-size: 26px;color:#7fa3ff;"></i></label>
                                        <select id="ddlAssTypeFilter" class="form-select color-dropdown" style="z-index: 99;" multiple> <option value="GLOBAL" selected="selected">Global</option>
                                                <option value="COMPANY" selected="selected">Company</option>
                                                <option value="DEPARTMENT" selected="selected">Department</option> </select>--%>
                                         <a href="#" class="btn btn-primary pull-right btn-add-quesopt-grid" style="padding: 0.4075rem 0.55rem;"> <i class="bx bx-file" aria-hidden="true"></i>&nbsp; Add Answers</a>
                                    </div>
                                    
                            <div class="table-responsive" style="overflow-y: hidden;width: 100%;padding-top: 10px;">
                                         <table class="table quesopt-list-table" style="width: 100%;margin-top: 11px;">
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

              <div style="width:40%;border-left:3px solid #a7b6a724; margin-top:-37px;">
                  <div class="row">
                      <h4 style="color: #a92828; margin-top:13px;">Justification List </h4>
                      <span style="margin-top: -39px;"><a href="#" class="btn btn-primary pull-right btn-add-justi-grid hidden" style="padding: 0.4075rem 0.55rem;"> <i class="fa fa-plus"></i>&nbsp; Add Justification</a></span>
                  </div>

                     <div class="table-responsive" style="overflow-y: hidden;width: 100%;padding-top: 10px;">
                                         <table class="table justi-list-table" style="width: 100%;margin-top: 11px;">
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
                    <div> <textarea class="form-control" id="taQuestionOpt" rows="2" placeholder="Enter Question Text"></textarea> </div>
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
                      <label class="form-check-label" for="cbIsJusti"> Is Justification </label>
                    </div>                  
               </div>
          </div>

               <div class="justi-parent-div hidden">
          <div class="row" style="margin-top: 30px;">
              <h5 style="text-decoration: underline;">Justification Details</h5>
              <div style="width:10.666667%;flex: 0 0 auto;padding-top: 11px;">Minimum </div> 
              <div class="col-2"> <input type="number" id="txtJustiMin" value="0" max="10" min="0" class="form-control"> </div> 
              <div class="col-3">will choose. <i class='bx bxs-info-circle' style="color: #ed7e7e; font-size: 21px;" title="0 denote No Limit"></i></div>
                          
          </div>

           <div class="row" style="margin-top: 30px;">
              <div style="width:10.666667%;flex: 0 0 auto;padding-top: 11px;">Maximum </div>
               <div class="col-2"> <input type="number" id="txtJustiMax" value="0" max="10" min="0" class="form-control"> </div> 
               <div class="col-3">will choose. <i class='bx bxs-info-circle' style="color: #ed7e7e; font-size: 21px;" title="0 denote No Limit"></i></div>              
          </div>  
          
    
    </div>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnAddQOpt"> Create </button>
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
         
      <div class="">
         <%-- <div class="row" style="margin-top: 30px;">
              <div style="width:10.666667%;flex: 0 0 auto;padding-top: 11px;">Minimum </div> 
              <div class="col-2"> <input type="number" id="txtJustiMin" value="0" max="10" min="0" class="form-control"> </div> 
              <div class="col-3">will choose. <i class='bx bxs-info-circle' style="color: #ed7e7e; font-size: 21px;" title="0 denote No Limit"></i></div>
                          
          </div>

           <div class="row" style="margin-top: 30px;">
              <div style="width:10.666667%;flex: 0 0 auto;padding-top: 11px;">Maximum </div>
               <div class="col-2"> <input type="number" id="txtJustiMax" value="0" max="10" min="0" class="form-control"> </div> 
               <div class="col-3">will choose. <i class='bx bxs-info-circle' style="color: #ed7e7e; font-size: 21px;" title="0 denote No Limit"></i></div>              
          </div>  --%>
          
          <div class="row">
                <div class="col-12"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Justification Text </label>
                    <div> <textarea class="form-control" id="taJustText" rows="2" placeholder="Enter Justification Text"></textarea> </div>
                </div> 
            </div>

    </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnAddJusti"> Create </button>
      </div>
    </div>
  </div>
</div>


      <%--Add Template--%>
        <div class="modal fade" id="addTempModal" style="background: #fff2f085;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addTempModalLabel">Create Template</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
           <div class="row">
                <div class="col-6"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Template Name</label>
                    <div>   
                        <input type="text" id="txtTempName" class="form-control">
                    </div>
                </div> 
            </div>              
   
           <div class="row">
                <div class="col-12"> 
                    <label for="html5-number-input" class="col-form-label label-custom">Question Description </label>
                    <div> <textarea class="form-control" id="taTempDesc" rows="2" placeholder="Enter Question Desc"></textarea> </div>
                </div> 
            </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnAddTemp"> Create </button>
      </div>
    </div>
  </div>
</div>



    
        <%--Tag Employee Modal--%>
    <div class="modal fade" id="tagQuesToTempModal" style="background: #fff2f085;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="tagQuesToTempModalLabel">Add/Update Questions into Template</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
                       
          <%--<div class="row" style="text-align: center;color: #ff913c;font-size: 18px;"> <div>Template Preview </div></div>--%>

          <div class="row" style="padding:20px;">

                 <div class="table-responsive" style="overflow-y: auto;max-height:800px; width: 100%;padding-top: 10px;zoom:90%;">
                                         <table class="table ques-to-temp-table" style="width: 100%;margin-top: 11px;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr>
                                                 <th style="background: #d54832 !important;color:white;"> <%--<label class="btn-all-cb" style="background:transparent;"> <input class="form-check-input" type="checkbox"> All  </label>--%> </th>
                                                  <th>Category</th> 
                                                 <th style="padding-right: 185px;">Question</th>                                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-ques-to-temp">

                                           </tbody>
                                         </table>
                          </div>

          </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnTagQuesToTemp"><i class="bx bxs-purchase-tag"></i> Save</button>
      </div>
    </div>
  </div>
</div>

      <%--DELETE CONFIMATION MODAL FOR Question--%>
    <div class="modal fade" id="delQuesModal" style="background-color:#00000070;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
          <div><h3>Are you sure?</h3></div>
        Do you want to delete the Question?
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-del-ques-yes" data-bs-dismiss="modal">Delete</button>
          </div>
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
   
    <script src="Scripts/SurveyAdmin.js?v=0.7"></script>
    <script src="Scripts/survey-admin-question.js?v=0.7"></script>

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>



	<!-- Datatable plugin JS library file -->	
   
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <%--<link href="css/quotation.css" rel="stylesheet" />--%>
        <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
        <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

     <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

    <link href="../Dashboard/assets/multiselect/example-styles.css" rel="stylesheet" />
    <script src="../Dashboard/assets/multiselect/jquery.multi-select.js"></script>

</asp:Content>

