<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="KPIManager.aspx.cs" Inherits="KPI_KPIManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Css/kpi.css?v=2.2" rel="stylesheet" />
     <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
        <style type="text/css">
    
        .hidden{
            display:none;
        }
  
      /*.toast-success {
    background-color: #13a317;
}*/
        .overflow-custom{
                max-height: 250px; 
                overflow-y: scroll;
        }
           .kpi-year-table th{
        background-color: #a92828 !important;
        color:white !important;
    }
           .nav-pills .nav-link.active, .nav-pills .nav-link.active:hover, .nav-pills .nav-link.active:focus {
    background-color: #ff8f69;
    color: #fff;
    box-shadow: 0 2px 4px 0 rgb(255 143 105 / 40%);
}
 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div style="padding-left: 2%; padding-top: 1%">
            <h4 style="text-shadow: 1px -3px 8px; color: #a92828;">My Reportees</h4>

        </div>

        <div class="card-body">
            <div class="table-responsive row">

                <div class="col-md-4" style="padding-bottom: 25px;">
                    <label for="exampleDataList" class="form-label">Employee Name</label>
                    <%--<input class="form-control" list="empDatalistOptions" id="txtEmpDataList" placeholder="Type to search...">--%>
               <%--     <datalist id="empDatalistOptions">--%>
                       <%-- <option value="NA1677" >ABDULNAVAS PALLIKERE MAJEED</option>--%>

                    <%--</datalist>--%>
                    <select name="ddlempDatalistOptions" id="empDatalistOptions" class="form-select"> </select>
                    
                </div>

                <div style="width:9.9%;">
                    <label for="exampleDataList" class="form-label">Filter</label>
                    <div class="nav-align-top" style="zoom:72%;">
                        <ul class="nav nav-pills mb-3 filter-ul" style="background: #fae2d79e;border-radius: 6px; padding: 5px;" role="tablist">
                          <li class="nav-item">
                            <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-home" aria-controls="navs-pills-top-home" aria-selected="true">Pending</button>
                          </li>
                          <li class="nav-item">
                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-profile" aria-controls="navs-pills-top-profile" aria-selected="false">Approved</button>
                          </li>   
                        </ul>
                    </div>
               </div>
               
                <div style="width:37%;"></div>

           <div class="col-md-2">
                <div class="row" style="padding-top:17px;">
                    <div class="col-md-2"><label for="defaultSelect" class="form-label">Years</label></div>
                    <div class="col-md-9"> 
                        <select name="Years" id="ddlYears" class="form-select"> </select>                       
                    </div>
                </div>             
            </div>
        

            </div>
            <table class="table kpi-year-table table-striped">

                <thead>
                    <tr>
                            <th>Month</th>
                            <th>January</th>
                            <th>February</th>
                            <th>March</th>
                            <th>April</th>
                            <th>May</th>
                            <th>June</th>
                            <th>July</th>
                            <th>August</th>
                            <th>September</th>
                            <th>October</th>
                            <th>November</th>
                            <th>December</th>
                        <%--<th>Month</th>
                        <th>Status</th>
                        <th>Manager Status</th>

                        <th>Actions</th>--%>
                    </tr>
                </thead>
                <tbody>
                        <tr class="kpi-actions">
                          <%--  <td>
                                <div class="">
                                 <button type="button" class="btn rounded-pill btn-icon btn-mykpi" 
                                        data-popup="tooltip-custom" data-bs-placement="top"title=" MY KPI"
                                        data-bs-toggle="modal"
                                        data-bs-target="#KpiSaveAndSubmitModal"
                                        data-month="1">                                        

                                        <span class="tf-icons bx bx-task"></span>
                                    </button>      
                                    <button type="button" class="btn rounded-pill btn-icon btn-review">
                                        <span class="tf-icons bx bx-revision" data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" title="Review"></span>
                                    </button>
                                    <button type="button" class="btn rounded-pill btn-icon btn-trrequest">
                                        <span class="tf-icons bx bx-book-reader" data-bs-toggle="modal" data-popup="tooltip-custom" 
                                            data-bs-target="#ModalTraningRequest" data-bs-placement="top" title="Traning Request"></span>
                                      
                                    </button>
                                     </div>

                            </td>--%>

                       


                        </tr>

                        
                        
                        <tr class="Kpi-trans-requester-status">
                            <td>Status</td>
                  <%--          <td data-month="1"><span class="badge bg-label-success me-1">Submitted</span></td>
                            <td data-month="2"><span class="badge bg-label-success me-1">Submitted</span></td>
                            <td data-month="3"><span class="badge bg-label-success me-1">Submitted</span></td>
                            <td data-month="4"><span class="badge bg-label-success me-1">Submitted</span></td>
                            <td data-month="5"><span class="badge bg-label-success me-1">Submitted</span></td>
                            <td data-month="6"><span class="badge bg-label-secondary me-1">Not Active</span></td>
                            <td data-month="7"><span class="badge bg-label-success me-1">Submitted</span></td>
                            <td data-month="8"><span class="badge bg-label-success me-1">Submitted</span></td>
                            <td data-month="9"><span class="badge bg-label-success me-1">Submitted</span></td>
                            <td data-month="10"><span class="badge bg-label-primary me-1">Saved</span></td>
                            <td data-month="11"><span class="badge bg-label-secondary me-1">Not Active</span></td>
                            <td data-month="12"><span class="badge bg-label-secondary me-1">Not Active</span></td>--%>
                     
                        </tr>



                        <tr class="Kpi-trans-reviewer-status">
                            <td>Manager Status</td> 
                    <%--        <td data-month="1"></td>
                            <td data-month="2"></td>
                            <td data-month="3"></td>
                            <td data-month="4"></td>
                            <td data-month="5"></td>
                            <td data-month="6"></td>
                            <td data-month="7"></td>
                            <td data-month="8"></td>
                            <td data-month="9"></td>
                            <td data-month="10"></td>
                            <td data-month="11"></td>
                            <td data-month="12"></td>--%>
                         <%--  <td data-month="1"> <span class="badge bg-label-secondary me-1">Not Active</span></td>
                            <td data-month="2"><span class="badge bg-label-secondary me-1">Not Active</span></td>
                            <td data-month="3"><span class="badge bg-label-secondary me-1">Not Active</span></td>
                            <td data-month="4"><span class="badge bg-label-secondary me-1">Not Active</span></td>
                            <td data-month="5"><span class="badge bg-label-secondary me-1">Not Active</span></td>
                            <td data-month="6"><span class="badge bg-label-secondary me-1">Not Active</span></td>
                            <td data-month="7"><span class="badge bg-label-secondary me-1">Not Active</span></td>
                            <td data-month="8"><span class="badge bg-label-secondary me-1">Not Active</span></td>
                            <td data-month="9"><span class="badge bg-label-secondary me-1">Not Active</span></td>
                           <td data-month="10"><span class="badge bg-label-secondary me-1">Not Active</span></td>
                           <td data-month="11"><span class="badge bg-label-secondary me-1">Not Active</span></td>
                           <td data-month="12"><span class="badge bg-label-secondary me-1">Not Active</span></td>--%>
                        </tr>


                    </tbody>
            </table>
        </div>

    </div>
  


    <!-- Extra Large Modal -->
<div class="modal fade" id="KpiSaveAndSubmitModal" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel4">KPIs List</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
                <%--<div class="input-group">
                    <label class="input-group-text ">
                        <span>
                            <i class="fas fa-calendar"></i>txtindicator1
                        </span>
                    </label>
                    <input type="text" id="weeklyDatePicker" placeholder="Select Date" class="form-control flatpickr-input active" readonly="readonly">
                </div>
           --%>
<div class="row">
    
        

   <div class="col-md-3">
      <div style="max-height: 625px !important;  overflow-y: auto; overflow-x: hidden;">
           <div class="nav-align-left">
             <ul class="nav nav-tabs" id="kpi-and-matrics-nav-ul" role="tablist">
             <%--  <li class="nav-item">
                 <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-align-home">Home</button>
               </li>
               <li class="nav-item">
                 <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-align-home">Profile</button>
               </li>--%>

             </ul>
       </div>
   </div>
           <div><span class="lbl-total-perc custom-success-label-kpi-points">0%</span></div>
   </div>

            <div class="col-md-9">
  <div class="tab-content">

    <div class="tab-pane fade show active" id="navs-emp-kpi">

              <div>
                
                 <div  class="mdlbody-heng">
                     <h5 class="alignleft">MY KPI</h5>
                     <h5 class="alignright sel-month-heading">SEPTEMBER 2022</h5>
                 </div>
                 <div style="clear: both;"></div>



               <div class="row" style="padding-top: 7px;">
                                                        <div class="col-sm-8">
                                                            Indicator Type: <span class="lblIndiType" style="color: cornflowerblue;">N/A</span>
                                                        </div>
                                                        
                                                        <div class="col-sm-1">
                                                            <label class="col-form-label"  for="basic-default-name">YTD</label>
                                                        </div>
                                                        <div class="col-sm-2" style="float: right">
                                                            <input type="text" class="form-control" id="txtYTD" placeholder="0" />
                                                        </div>
                                                    </div>

                
                 <div class="row" style="padding-top:25px">
                      <div style="width:10.33%">
                         <label class="col-form-label" for="basic-default-name">Indicators</label>
                     </div>
                     <div style="width:56%;">
                          <textarea id="taIndicator" class="form-control" disabled></textarea>
                     
                     </div>


                     <%--<div class="col-sm-1">
                         <label class="col-form-label" for="basic-default-name">Target</label>
                     </div>
                     <div class="col-sm-3">
                          <textarea id="taTarget" class="form-control" disabled></textarea>
                     
                     </div>--%>

                      <div class="col-sm-1">
                         <label class="col-form-label" for="basic-default-name">Weight</label>
                     </div>
                     <div class="col-sm-3">
                         <input type="text" class="form-control" id="txtWeight" disabled/>
                     </div>

                 </div>

          <!-- Bordered Table -->
          <h5 class="card-header">Metrics</h5>
          <div class="card-body">
              <div class="table-responsive text-nowrap overflow-custom">
                  <table class="table table-bordered">
                      <thead>
                          <tr>                          
                              <th>Metrics</th>
                              <th></th>                       

                          </tr>
                      </thead>
                      <tbody class="tbody-matrics">
                        
                 



                      </tbody>
                  </table>
                  </div>
                      <div class="table-responsive text-nowrap " style="margin-top:2px;">
                  <table class="table table-bordered">
                      <thead>
                          <tr>
                          
                              <th>% Success</th>
                              <th>Points</th>
                        

                          </tr>
                      </thead>
                      <tbody class="">
                        
                          <tr>
                              <td><span class="badge bg-label-info me-1 lblSuccessPercen">0</span></td>
                              <td><span class="lblPoint">0</span></td>

                          </tr>



                      </tbody>
                  </table>
              </div>
          </div>

                                                    <!--/ Bordered Table -->

                                                <div style="display:inline-flex; width:97%;">
                                                    <div class="mb-3 commentBoxEmp" style="width:100%;">
                                                        <label class="form-label" for="basic-icon-default-message">Employee Comments:</label>
                                                
                                                    </div>
                                                          <%--Table for response Attachment--%>
                                                          <div style="width:100%; margin-left:3px; max-height: 169px;overflow-y: scroll;">
                                                                <table class="table">
                                                              <thead>
                                                                  <tr>
                                                                    
                                                                      <th style="width:75%;">Supporting Docs</th>
                                                                      <th style="width:25%;">
                                                                       <%--  <div class="fuKpiResDiv"> <span class="" style="cursor:pointer;">
                                                                                  <input class="form-control hidden" type="file" id="fuKpiRes" accept=".doc,.docx,.pdf,.png,.jpeg,.msg" multiple>
                                                                                  <label style="cursor:pointer;" for="fuKpiRes"><i class="fa fa-upload ifukpi" style="color:#298df2;" aria-hidden="true"></i> upload</label>
                                                                             </span>
                                                                        </div>--%>
                                                                      </th>
                                                                

                                                                  </tr>
                                                              </thead>
                                                              <tbody class="tbody-kpi-res-attach">
                                                                
                                                              <%--    <tr>
                                                                      <td>No File(s)</td>
                                                                     <td style="display: inline-flex;">
                                                                          <span class="" style="cursor:pointer;"><i style="color:#84c217;" class="bx bxs-download fa-icon-hover"></i></span> 
                                                                         <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-mstone-delete" title="Delete Docs" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
                                                                      </td>

                                                                  </tr> --%>
                                                                  
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
      <div class="modal-footer btn-app-rej-div">
          <%--<div style="margin-right:66%;"><button type="button" class="btn btn-primary hidden btnSubmit" >Submit KPI</button></div>--%>
          <button type="button" class="btn btn-success btnApprove"><i class="bx bxs-check-circle"></i> Approve</button>
           <button type="button" class="btn btn-danger btnReject"><i class="bx bxs-x-circle"></i> Reject</button>
        <%--<button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>--%>

        <%--<button type="button" class="btn btn-primary btnSave hidden">Save changes</button>--%> 
          
      </div>
    </div>
  </div>
</div>
    
                            <div class="demo-inline-spacing">                                

                                <%-- modal MY KPI --%>

                                <div class="modal fade" id="basicModal" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog  modal-xl" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel1">Modal title</h5>
                                                <button
                                                    type="button"
                                                    class="btn-close"
                                                    data-bs-dismiss="modal"
                                                    aria-label="Close">
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <div class="mdlbody-heng">
                                                    <h5 class="alignleft">EMPLOYEE NAME</h5>
                                                    <h5 class="alignright">SEPTEMBER 2022</h5>
                                                </div>
                                                <div style="clear: both;"></div>



                                             <div class="row" style="padding-top: 7px;">
                                                        <div class="col-sm-8">
                                                            Indicator Type: <span class="lblIndiType" style="color: cornflowerblue;">N/A</span>
                                                        </div>
                                                        
                                                        <div class="col-sm-1">
                                                            <label class="col-form-label"  for="basic-default-name">YTD</label>
                                                        </div>
                                                        <div class="col-sm-2" style="float: right">
                                                            <input type="text" class="form-control" id="txtYTD1" placeholder="0" />
                                                        </div>
                                                    </div>



                                                <div class="row" style="padding-top: 25px">
                                                    <div class="col-sm-1">
                                                        <label class="col-form-label" for="basic-default-name">Indicators</label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <textarea id="txtindicator1" class="form-control" placeholder="E-connect Rollout" readonly=""></textarea>

                                                    </div>


                                                   <%-- <div class="col-sm-1">
                                                        <label class="col-form-label" for="basic-default-name">Target</label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <textarea id="basic-default-message1" class="form-control" readonly=""></textarea>

                                                    </div>--%>

                                                    <div class="col-sm-1">
                                                        <label class="col-form-label" for="basic-default-name">Weight</label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <input type="text" class="form-control" id="txtWeight1" readonly="" />
                                                    </div>

                                                </div>

                                                <!-- Bordered Table -->

                                                <h5 class="card-header">Metrics</h5>
                                                <div class="card-body">
                                                    <div class="table-responsive text-nowrap">
                                                        <table class="table table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th>Actual No.Of Organization</th>
                                                                    <th>No.Of Rolled-Out Organization</th>
                                                                    <th>% Success</th>
                                                                    <th>Points</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <i class="fab fa-angular fa-lg text-danger me-3"></i><strong>18</strong>
                                                                    </td>
                                                                    <td>30</td>
                                                                    <td><span class="badge bg-label-info me-1">28%</span></td>
                                                                    <td>11</td>

                                                                </tr>



                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                                <!--/ Bordered Table -->



                                                <div class="mb-3">
                                                    <label class="form-label" for="basic-icon-default-message" style="color: red">Employee Comments:</label>
                                                    <div class="input-group input-group-merge">
                                                        <span id="lblemployeecomments" class="input-group-text"></span>
                                                        <textarea
                                                            id="txtemployeecomments"
                                                            class="form-control"
                                                            placeholder="Will Prioritize to rollout  on all ORG"
                                                            readonly=""
                                                            aria-describedby="basic-icon-default-message2"></textarea>
                                                    </div>
                                                </div>


                                                <div class="mb-3">
                                                    <label class="form-label" for="basic-icon-default-message" style="color: red">Manager Comments:</label>
                                                    <div class="input-group input-group-merge">
                                                        <span id="basic-icon-default-message21" class="input-group-text"></span>
                                                        <textarea
                                                            id="basic-icon-default-message1"
                                                            class="form-control"
                                                            placeholder="Type your Comments…."
                                                            aria-describedby="basic-icon-default-message2"></textarea>
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-approve" data-bs-dismiss="modal">
                                                    Approve
                                                </button>
                                                <button type="button" class="btn btn-save">Reject</button>

                                                <%--<button type="button" class="btn btn-reqtraining" data-bs-toggle="modal" data-bs-target="#ModalTraningRequest">Request To Training</button>--%>
                                            </div>



                                        </div>
                                    </div>
                                </div>

 

                                <div class="modal fade" id="ModalComments">
                                    <div class="modal-dialog  modal-l" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalcommentslabel">Modal title</h5>
                                                <button
                                                    type="button"
                                                    class="btn-close"
                                                    data-bs-dismiss="modal"
                                                    aria-label="Close">
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <div class="mdlbody-heng">
                                                    <h5 class="alignleft">General Comments</h5>

                                                </div>


                                                <div class="row" style="padding-top: 25px">

                                                    <div class="col-sm-12">
                                                        <label class="form-label" for="basic-default-message">Comments</label>
                                                        <textarea id="txtGeneralcomments" class="form-control" placeholder="Enter Your Comments.."></textarea>

                                                    </div>

                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-submit" data-bs-dismiss="modal">
                                                    Submit
                                                </button>
                                                <%--<button type="button" class="btn btn-save">Save</button>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <%-- modal Traning Request --%>

                                <div class="modal fade" id="ModalTraningRequest">
                                    <div class="modal-dialog  modal-xl" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel2">Modal title</h5>
                                                <button
                                                    type="button"
                                                    class="btn-close"
                                                    data-bs-dismiss="modal"
                                                    aria-label="Close">
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <div class="mdlbody-heng">
                                                    <h5 class="alignleft">Required Training </h5>

                                                </div>
                                                <div style="clear: both;"></div>


                                                <div class="row" style="padding-top: 25px">
                                                    <div class="col-sm-2">
                                                        <label class="col-form-label" for="basic-default-name">Name</label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <input type="text" class="form-control" id="txemptname" readonly="" />

                                                    </div>


                                                    <div class="col-sm-2">
                                                        <label class="col-form-label" for="basic-default-name">Employee Number</label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <input type="text" class="form-control" id="txtEmpnumber" readonly="" />

                                                    </div>

                                                </div>



                                                <div class="row" style="padding-top: 25px">
                                                    <div class="col-sm-2">
                                                        <label class="col-form-label" for="basic-default-name">Organization</label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <input type="text" class="form-control" id="txtorganization" readonly="" />

                                                    </div>

                                                    <div class="col-sm-2">
                                                        <label class="col-form-label" for="basic-default-name">Department</label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <input type="text" class="form-control" id="txtDepartment" readonly="" />

                                                    </div>

                                                </div>

                                                <div class="btn-add-training">

                                                    <button type="button" class="btn btn-save">ADD</button>


                                                </div>


                                                <div class="row" style="padding-top: 25px">

                                                    <div class="col-sm-3">
                                                        <label class="form-label field-heddng" for="basic-icon-default-message">Training Description</label>
                                                        <textarea id="txtTraningdescrption" class="form-control"></textarea>
                                                    </div>

                                                     <div class="col-sm-3">
                                                        <label class="form-label field-heddng" for="basic-icon-default-message">REMARKS</label>
                                                        <textarea id="txtremarks" class="form-control"></textarea>
                                                    </div>


                                                    <div class="col-sm-1" style="padding-top: 50px">

                                                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
                                                        <label class="form-check-label" for="defaultCheck1">YES </label>
                                                    </div>
                                                    <div class="col-sm-1" style="padding-top: 50px">
                                                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                                        <label class="form-check-label" for="defaultCheck1">NO </label>

                                                    </div>

                                                     <div class="col-sm-3">
                                                        <label class="form-label field-heddng" for="basic-icon-default-message"> MANAGER REMARKS</label>
                                                        <textarea id="managerremark" class="form-control"></textarea>
                                                    </div>

                                                   

                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-submit" data-bs-dismiss="modal">
                                                    Submit
                                                </button>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>



<%--    <div class="modal fade" id="approveconfirmmodal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-md" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="approveconfirmmodalLabel2">Confirmation</h5>
        <%--<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--
      </div>
      <div class="modal-body row">
        
          <div class="col-md-1"> <i class="bx bxs-info-square" style="color:forestgreen"></i></div> 
          <div class="col-md-10"><label>Are you sure to Approve this KPI?</label></div>

      </div>

      
      <div class="modal-footer">
          <button type="button" class="btn btn-primary btn-yes-apporve-kpi">Yes</button>
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">No</button>
        
      </div>
    </div>
  </div>
</div>--%>


    <div class="modal fade" id="approveconfirmmodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-check-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #26871ab8;"></i></div>
          <div><h3>Are you sure?</h3></div>
        Do you really want to approve this request? This process cannot be undone.
      </div>
      <div class="modal-footer">
      <div style="margin-right: 192px;">  
          <button type="button" class="btn btn-primary btn-yes-apporve-kpi">Yes</button>
          <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">No</button>
        
          </div>
      </div>
    </div>
  </div>
</div>





 <%--<div class="modal fade" id="rejectconfirmmodal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-md" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="rejectconfirmmodalLabel2">Confirmation</h5>
        <%--<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%
      </div>
      <div class="modal-body row">
       <div class="col-md-1"> <i class="bx bx-info-circle" style="color:#e35d5d"></i> </div> 
          <div class="col-md-10"><h5>Are you sure to Reject this KPI?</h5></div>
      </div>

      <div class="modal-footer">
          <button type="button" class="btn btn-primary btn-yes-reject-kpi">Yes</button>
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">No</button>
        
      </div>
    </div>
  </div>
</div>--%>

        <div class="modal fade" id="rejectconfirmmodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
          <div><h3>Are you sure?</h3></div>
        Do you really want to reject this request? This process cannot be undone.
      </div>
      <div class="modal-footer">
      <div style="margin-right: 192px;">  
          <button type="button" class="btn btn-primary btn-yes-reject-kpi">Yes</button>
          <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">No</button>
        
          </div>
      </div>
    </div>
  </div>
</div>

    <%--Mark on leave popup--%>
    
        <div class="modal fade" id="markOnLeaveModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <%--<div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>--%>
          <div><img src="./Images/icon-holiday.png" class="ibtn-mstone-add-taskin" title="On Leave" style="width: 67px;cursor:pointer;height: 63px;"></div>
          <div><h3>Are you sure?</h3></div>
        Do you really want to mark leave for <b class="onleave-month-bold"></b>? This process cannot be undone.
      </div>
      <div class="modal-footer">
      <div style="margin-right: 192px;">  
          <button type="button" class="btn btn-primary btn-yes-onleave-kpi">Yes</button>
          <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">No</button>
        
          </div>
      </div>
    </div>
  </div>
</div>

    <%--end--%>




     <script type="text/javascript">
                var currUserId = '';   
                var EmpNo = '';
                var myrole = '';
                var overAllPerfo=0;
                $(document).ready(function () {
                    currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;               
                    EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>'
                });




                </script>

       

    <script src="Scripts/kpi-manager.js?v=4.5"></script>
    <script src="../Template/assets/vendor/libs/popper/popper.js"></script>
    <script src="../Template/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../Template/assets/js/ui-modals.js"></script>
    <script src="../Template/assets/js/main.js"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <%--<script src="Scripts/KPI.js"></script>--%>
       

</asp:Content>

