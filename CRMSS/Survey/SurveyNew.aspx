<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="SurveyNew.aspx.cs" Inherits="Survey_SurveyNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
 
       <style type="text/css">
    .main-div-question {
        border: 2px solid #ff270040;
    box-shadow: 0px 0px 3px 1px #ff750033;
    border-radius: 7px;
    padding-top: 12px;
    }

    /*.form-check-danger{
        background-color: #e70404c9;
    border-color: #e70404c9;
    box-shadow: 0 2px 4px 0 rgb(255 105 105 / 40%);
    }*/
    .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
      background-color: #e70404c9;
    border-color: #ffffffb5;
       box-shadow: 0 2px 4px 0 rgb(255 105 105 / 40%);
}
    .heading-comp{
        font-size: 18px;
        font-weight: 400;
        color: #45a7d3;
    }
    .custom-sec-button{
        color: #d54832;
    background-color: #ffffff;
    border-color: #d54832;
    }
 
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


 
   
  


    <%--Modal of Survey--%>
    
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#surveyModal">
  Extra Large
</button>
<!-- Extra Large Modal -->
<div class="modal fade" id="surveyModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="surveyModalLabel">Survey</h5>
        <%--<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
      </div>
      <div class="modal-body">
      
          <div class="card">

  <div class="card-body" style="margin-top: -1%; "><%-- min-height:75vh;--%>
     
<%--        <div class="ajax-loader custom-loader hidden">
            <span class="spinner-border kpi-loader-name"  role="status" aria-hidden="true"></span><h4>Please wait...</h4>      
        </div>--%>


    <%-- <div class="row" style="background: #fbedeb; text-align: center; padding-top: 14px;">
          <h4 style="color: #d54832;" class="heading-survay">Survey 2</h4>
      </div>--%>

      <div class="row">
            <div class="heading-survey-category">Loading...</div>
      </div>
      
      <div class="row" style="margin-top:3px">
          <p class="p-survey-category-desc" ></p>
      </div>


      <div class="row main-div-question">

          <h5 class="">Question <i class="q-heading-active" style="font-size: xx-large;color: #d54832d1;"></i> <i>/ </i> <b class="q-heading-total"></b></h5> 


      <div class="q-content-div-parent">

           <%--<div class="q-content-div" data-qstep="1" style="padding: 13px 0px 0px 15px;">              
              
              <p class="q-label"><b>Please choose one answer only that best describes the “Meet customer expectations” (C-CS-01) skill of department’s team members.</b></p>

              <div class="form-check form-check-danger">
                        <input name="q1-rb-opt" class="form-check-input" type="radio" value="" id="q1-opt-1" />
                        <label class="form-check-label" for="q1-opt-1"> As employee, I agree that the department’s team members keep internal customers the focal point and view business situations from their perspectives and respond effectively to their needs most of the time.  </label>
                    </div>

              <div class="form-check form-check-danger">
                        <input name="q1-rb-opt" class="form-check-input" type="radio" value="" id="q1-opt-2" checked />
                        <label class="form-check-label" for="q1-opt-2"> As employee, I agree that the department’s team members show a conceptual understanding of internal customers’ current and future needs all the time.  </label>
                    </div>

              <div class="form-check form-check-danger">
                        <input name="q1-rb-opt" class="form-check-input" type="radio" value="" id="q1-opt-3" />
                        <label class="form-check-label" for="q1-opt-3"> As employee, I agree that the department’s team members show a basic understanding of internal customers’ needs and able to meet them most of the sometimes.  </label>
                    </div>

              <div class="form-check form-check-danger">
                        <input name="q1-rb-opt" class="form-check-input" type="radio" value="" id="q1-opt-4" />
                        <label class="form-check-label" for="q1-opt-4"> As employee, I agree that the department’s team members lack the understanding of the service-related duties and requirements or internal customers’ needs and never been able to meet them.  </label>
                    </div>



               <div class="row q-justif-div" style="margin-top:40px;">
                   <h5><i style="color: #d54832;">Why?</i> <i style="font-size: 15px;">(Choose minimum 1 or max 2)</i></h5>
                   <div class="form-check form-check-danger">
                        <input class="form-check-input" type="checkbox" value="" id="q1-opt3-justi1"  />
                        <label class="form-check-label" for="q1-opt3-justi1">The department is expected to embrace a two-way discussion and communication with different functions team members and peers about the common goals and how to create value for internal customers</label>
                   </div>

                   <div class="form-check form-check-danger">
                        <input class="form-check-input" type="checkbox" value="" id="q1-opt3-justi2" checked />
                        <label class="form-check-label" for="q1-opt3-justi2">The department is expected to provide the department's team members with autonomy and more delegation to make the provided services more efficient and avoid delay</label>
                   </div>

                   <div class="form-check form-check-danger">
                        <input class="form-check-input" type="checkbox" value="" id="q1-opt3-justi3"  />
                        <label class="form-check-label" for="q1-opt3-justi3">The department’s line managers are expected to set approved service-related duties standards by eliminating waste tasks and focus on value-added tasks and share it with internal customers</label>
                   </div>

                   <div class="form-check form-check-danger">
                        <input class="form-check-input" type="checkbox" value="" id="q1-opt3-justi4" checked />
                        <label class="form-check-label" for="q1-opt3-justi4">The department is expected to embrace automated processes and relevant technology to improve the responsiveness level which will improve the efficiency of cross functional processes</label>
                   </div>

               </div>

          </div>--%>
 
    </div>
          <div class="last-step-for-manager-rating-div hidden"> 
              <p style="color:red;"><b>Note:</b> Please provide general rating for each section’s line manager to be able to differentiate the performance gap in which area of provided services.</p>
                <div class="table-responsive" style="margin-top: 2%;width:100%;">
                                         <table class="table linemanager-list-table" style="width: 100%;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr style="background: #fae2d7;text-align: center;">
                                                 <th>Line Manager Name</th>
                                                 <th>Section</th>
                                               <th>Overall Feedback</th>
                                               <th>Not Applicable</th>                                                                             
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-linemanager-list" style="text-align: center;">

                                           </tbody>
                                         </table>
                               </div>

          </div>

          <div class="row">
              <div style="padding: 40px 0px 20px 25px;">
                  <a href="#" class="btn btn-primary btn-surv-prev hidden" style="width: 40px;height: 36px; padding: 5px 4px 0px 0px;color: #dd6957;background-color: white;border-color: #f2b0b0;" title="Previos Question"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
                  <a href="#" class="btn btn-primary btn-surv-next" style="width: 40px;height: 36px; padding: 6px 0px 0px 0px;color: #dd6957;background-color: white;border-color: #f2b0b0;" title="Next Question"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
              </div>
          </div>

      </div>



    </div>
</div>



      </div>
      <div class="modal-footer">
        <%--<button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>--%>
        <button type="button" class="btn btn-primary btnSaveSurvey hidden" style="background-color: #0fc291; border-color: #0fc291;">Submit</button>
      </div>
    </div>
  </div>
</div>


    <%--end here--%> 




          <div class="modal fade" id="askingForSurveyModal" data-bs-backdrop="static" data-bs-keyboard="false" style="background-color:#00000070;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content">
   
      <div class="modal-body" style="text-align:center;">
          <div class="row" style="background: #d54832;margin-top: -15px;border-radius: 5px;">
              <div class="col-4"><img src="../Dashboard/assets/img/avatars/e-connect logo white.png" style="height: 57px; float:left;" alt="View Badge User" data-app-dark-img="illustrations/man-with-laptop-dark.png" data-app-light-img="illustrations/man-with-laptop-light.png"></div>
              <div class="col-4"><img src="./Images/icon-survey.png" class="fa-icon-hover ibtn-mstone-add-taskin" style="width: 80px;cursor:pointer;height: 76px;"></div>
              <div class="col-4"><img src="../Dashboard/assets/img/avatars/naffco-logoWhite.png" style="height: 57px;float:right;" alt="View Badge User" data-app-dark-img="illustrations/man-with-laptop-dark.png" data-app-light-img="illustrations/man-with-laptop-light.png"></div>              
          </div>
          <%--<div><h3>Are you sure?</h3></div>--%>
        <div style="text-align:left; margin-top: 20px;">
            <h5 >Dear <b class="lbl-name-for-survey-para"></b></h5>

<p>This questionnaire is created to understand the harmony and challenges that are facing the relationship between employees from different departments and functions who are working toward common outputs in order to avoid doing extra work, wasting more time, and spending more.</p>
<p>Furthermore; this questionnaire is designed to help in bridging the gap in communication between different functions and motivating teams to work as a whole unit toward achieving Naffco’s vision.</p>
<p>You are kindly requested to answer the following questionnaire because your feedback and suggestions are valuable for us for improvement purposes.</p>

<p>Please note that you will evaluate your experience as an internal customer with the <b style="font-weight: 500; color: #d54519e8;font-size: 19px;" class=".lbl-deptname-for-survey-para"> </b> department. and when you choose some specific answers, further justifications are mandatory to be able to consider your suggestions for improvement purposes.</p>
<p>The questionnaire summary results will be shared with the department head to highlight the strengths and areas of improvement. On the other hand, the employee’s personal information such as names or IDs will be confidential.</p>
<p>In addition, the questionnaire summary results will be considered as part of business unit (department’s) performance evaluation.</p>

<p style="font-weight: 500; color: #d54519e8;">This questionnaire will take from 10-15 minutes.</p>

<p>Your cooperation is highly appreciated.</p>

<br />
<p style="font-weight: 700;">Regards</p>

<p>Performance Management team</p>

        </div> 


      </div>
      <div class="modal-footer">
      <div>  <button type="button" class="btn btn-secondary custom-sec-button btn-survey-na">Not Applicable</button>
        <button type="button" class="btn btn-primary btn-survey-yes">Yes</button>
          </div>
      </div>
    </div>
  </div>
</div>
  

    <%--Confirmation modal for Not Applicable--%>
            <div class="modal fade" id="confirmNA" data-bs-backdrop="static" data-bs-keyboard="false" style="background-color:#00000070;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
            <div><img src="./Images/icon-info.png" class="fa-icon-hover ibtn-mstone-add-taskin" style="width: 80px;cursor:pointer;height: 76px;"></div>
          <div><h3>Are you sure?</h3></div>
        <span class="cMemberSentence">You are Not Applicable for this Survey? </span> 
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary custom-sec-button btn-na-no" >No</button>
        <button type="button" class="btn btn-primary btn-na-yes" data-bs-dismiss="modal">Yes</button>
          </div>
      </div>
    </div>
  </div>
</div>


    <%--Modal come on competency change--%>
                <div class="modal fade" id="competDescModal" data-bs-backdrop="static" data-bs-keyboard="false" style="background-color:#00000070;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
            <div><img src="./Images/icon-info.png" class="fa-icon-hover ibtn-mstone-add-taskin" style="width: 80px;cursor:pointer;height: 76px;"></div>
          <div><h3 class="compet-name-heading-on-chnage">- </h3></div>
        <p class="compet-desc-heading-on-chnage"> - </p> 
      </div>
      <div class="modal-footer">
      <div style="margin-right: 222px;">  <%--<button type="button" class="btn btn-secondary custom-sec-button btn-na-no" >No</button>--%>
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Start</button>
          </div>
      </div>
    </div>
  </div>
</div>
     

        <%--Modal come On Last when survey finish or in final step--%>
                <div class="modal fade" id="surveyFinalStepModal" data-bs-backdrop="static" data-bs-keyboard="false" style="background-color:#00000070;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="H1">Final Step</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="text-align:center;">
          
          <div class="input-group mb-3">        
                            <label style="margin-right: 10px;" class="lbl-fufile-count"></label>

                             <input class="form-control" type="file" id="fu-task-attach" accept=".doc,.docx,.pdf,.png,.jpeg" style="display:none;" multiple="">
                             <label class="input-group-text ml-3" for="fu-task-attach"><img src="./Images/icon-upload.png" class="fa-icon-hover ibtn-mstone-add-taskin" style="width: 80px;cursor:pointer;height: 76px;"></label>  
                        </div>
          <div>
              <div class="col-8">
                    <label class="col-form-label label-custom" for="basic-default-name">General Feedback <%--<span style="color: red;">*</span>--%></label>
                              <div>
                                  <textarea class="form-control" id="taGeneralFeedback" rows="4" placeholder="Enter Task Description" style="border-color: lightgrey;"></textarea>
                              </div>
              </div>
          </div>

      </div>
      <div class="modal-footer">
      <div style="width:100%;">  <%--<button type="button" class="btn btn-secondary custom-sec-button btn-na-no" >No</button>--%>
        <button type="button" style="width:100%;" class="btn btn-primary btnFinishSurvey" data-bs-dismiss="modal">Finish Survey</button>
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

    <script src="Scripts/survey-new.js?v=1.2"></script>
 
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


       <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
      <!-- Vendors JS -->
    <script src="../Dashboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>
    <script src="../Masters/assets/js/jquery.star-rating.js"></script>

</asp:Content>


