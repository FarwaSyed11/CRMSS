<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="MyKPI.aspx.cs" Inherits="KPI_MyKPI" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
    <link href="Css/kpi.css?v=2.2" rel="stylesheet" />
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <link href="Flatpickr/css/_flatpickr.css" rel="stylesheet" />
    <link href="SmartWizard/smart-wizard.css" rel="stylesheet" />

    <style type="text/css">
    .modal-dialog-centered {
    min-height: calc(100% - 25.5rem);
}
        .hidden{
            display:none;
        }
        .modal-footer-custom {
            /* display: flex; */
            flex-wrap: wrap;
            flex-shrink: 0;
            align-items: center;
            justify-content: flex-end;
            padding: 1.25rem;
            border-top: 0px solid #d9dee3;
            border-bottom-right-radius: calc(0.5rem - 0px);
            border-bottom-left-radius: calc(0.5rem - 0px);
            flex-direction: column-reverse;
        }
        .overflow-custom{
                max-height: 250px; 
                overflow-y: scroll;
        }
      .kpi-year-table th{
        background-color: #a92828 !important;
        color:white !important;
    }
        .ifukpi:hover {
        color:#e9e9e9 !important;
        }
        #div_signcontract{ width: 99%; }
		.popupHeader{ margin: 10px; }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        
        <div class="row">
            <div class="col-md-8" style="padding-left: 2%; padding-top: 1%; "><h4 style="text-shadow: 1px -3px 8px; color: #a92828;">My KPI</h4></div>
            <div class="col-md-4">
                <div class="row" style="padding-top:17px;">
                    <div class="col-md-2"><label for="defaultSelect" class="form-label">Years</label></div>
                    <div class="col-md-9"> 
                        <select name="Years" id="ddlYears" class="form-select"> </select>
                    </div>
                </div>
                 
                                            
               
            </div>
        </div>
      
        <%--<button id="getLocation">Show Me My Location</button>--%>
         <%--<div id="locationData"></div>--%>

	<div data-role="page" class="hidden">
		<div data-role="header">
			<h1>Signature Pad - HTML5 - jQuery Mobile</h1>
		</div><!-- /header -->
		<div id="page" data-role="content" class="hidden">
			<%--<a href="#eSignModal" data-rel="popup" data-position-to="window" data-role="button" data-inline="true">Open Sign Pad</a>--%>
             <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#eSignModal"> Open Sign Pad</button>
		</div>	

<%--		<div data-role="popup" id="divPopUpSignContract">
			<div data-role="header" data-theme="b">
				<a data-role="button" data-rel="back" data-transition="slide" class="ui-btn-right" onclick="closePopUp()"> Close </a>
				<p class="popupHeader">Sign Pad</p>
			</div>
			<div class="ui-content popUpHeight">
				<div id="div_signcontract">
					<canvas id="canvas">Canvas is not supported</canvas>
					<div>
						<input id="btnSubmitSign" type="button" data-inline="true" data-mini="true" data-theme="b" value="Submit Sign" onclick="fun_submit()" />
						<input id="btnClearSign" type="button" data-inline="true" data-mini="true" data-theme="b" value="Clear" onclick="init_Sign_Canvas()" />
					</div>
				</div>	
			</div>
		</div>--%>

	</div>	


        <input type="file" id="fuForCanvas" style="display:none;" />
    
<!-- Small Modal -->
<div class="modal fade" id="eSignModal" tabindex="-1"  data-bs-backdrop="static" aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="eSignModallabel">Electronic Signature</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">    
        		
			<div class="ui-content popUpHeight">
				<div id="div_signcontract">
					<canvas id="canvas" style="border: 0px solid rgb(0, 0, 0) !important;">Canvas is not supported</canvas>
					<div>
						<input id="btnSubmitSign" type="button" data-inline="true" data-mini="true" data-theme="b" value="Submit Sign" data-bs-dismiss="modal" onclick="fun_submit()" />
						<input id="btnClearSign" type="button" data-inline="true" data-mini="true" data-theme="b" value="Clear" onclick="init_Sign_Canvas()" />
					</div>
				</div>	
			</div>	

      </div>
   
    </div>
  </div>
</div>
   

        <div class="card-body">
            <div class="table-responsive">
                <table class="table kpi-year-table table-striped">
                   <%-- <caption class="ms-4">List of Projects</caption>--%>
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
                 
                        <tr class="kpi-actions"></tr>
                        
                        
                        <tr class="Kpi-trans-requester-status">
                      
                           <%-- <td data-month="1"><span class="badge bg-label-success me-1">Submitted</span></td>
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
    </div> 



                                   

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

                                                    <div  class="mdlbody-heng">
                                                        <h5 class="alignleft">MY KPI</h5>
                                                        <h5 class="alignright">SEPTEMBER 2022</h5>
                                                    </div>
                                                    <div style="clear: both;"></div>



                                                    <div class="row" style="padding-top: 7px;">
                                                        <div class="col-sm-8">
                                                            Indicator Type: Numeric
                                                        </div>
                                                        
                                                        <div class="col-sm-1">
                                                            <label class="col-form-label"  for="basic-default-name">YTD</label>
                                                        </div>
                                                        <div class="col-sm-2" style="float: right">
                                                            <input type="text" class="form-control" id="txtYTD1" placeholder="0" />
                                                        </div>
                                                    </div>


                                                   
                                                    <div class="row" style="padding-top:25px">
                                                        <div class="col-sm-1">
                                                            <label class="col-form-label" for="basic-default-name">Indicators</label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                             <textarea id="txtindicator1" class="form-control"></textarea>
                                                        
                                                        </div>


<%--                                                        <div class="col-sm-1">
                                                            <label class="col-form-label" for="basic-default-name">Target</label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                             <textarea id="basic-default-message1" class="form-control"></textarea>
                                                        
                                                        </div>--%>

                                                         <div class="col-sm-1">
                                                            <label class="col-form-label" for="basic-default-name">Weight</label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <input type="text" class="form-control" id="txtWeight1" />
                                                        </div>

                                                    </div>

                                                    <!-- Bordered Table -->

                                                    <h5 class="card-header">Metrics</h5>
                                                    <div class="card-body">
                                                        <div class="table-responsive text-nowrap">
                                                            <table class="table table-bordered">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Actual No. Tickets</th>
                                                                        <th>Actual No. Closed Tickets</th>
                                                                        <th>% Success</th>
                                                                        <th>Points</th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <i class="fab fa-angular fa-lg text-danger me-3"></i><strong>50</strong>
                                                                        </td>
                                                                        <td>30</td>
                                                                        <td><span class="badge bg-label-info me-1">28%</span></td>
                                                                        <td>18</td>

                                                                    </tr>



                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                    <!--/ Bordered Table -->



                                                    <div class="mb-3">
                                                        <label class="form-label" for="basic-icon-default-message">Employee Comments:</label>
                                                        <div class="input-group input-group-merge">
                                                            <span id="basic-icon-default-message11" class="input-group-text"></span>
                                                            <textarea
                                                                id="basic-icon-default-message11"
                                                                class="form-control"
                                                                placeholder="Type your Comments…."
                                                               
                                                                aria-describedby="basic-icon-default-message2"></textarea>
                                                        </div>
                                                    </div>


                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-submit" data-bs-dismiss="modal">
                                                        Submit
                                                    </button>
                                                    <button type="button" class="btn btn-save">Save</button>

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



                                                               <%-- <div class="row" style="padding-top: 25px; margin-left: 80%;">
                                                                    <div class="col-sm-2">
                                                                        <label class="col-form-label" for="basic-default-name">YTD</label>
                                                                    </div>
                                                                    <div class="col-sm-6" style="float: right">
                                                                        <input type="text" class="form-control" id="txtYTD" placeholder="30%" />
                                                                    </div>
                                                                </div>--%>



                                                                <div class="row" style="padding-top: 25px">
                                                                    <div class="col-sm-2">
                                                                        <label class="col-form-label" for="basic-default-name">Name</label>
                                                                    </div>
                                                                    <div class="col-sm-3">
                                                                        <input type="text" class="form-control" id="txemptname" />

                                                                    </div>


                                                                    <div class="col-sm-2">
                                                                        <label class="col-form-label" for="basic-default-name">Employee Number</label>
                                                                    </div>
                                                                    <div class="col-sm-3">
                                                                        <input type="text" class="form-control" id="txtEmpnumber" />

                                                                    </div>

                                                                </div>



                                                                <div class="row" style="padding-top: 25px">
                                                                    <div class="col-sm-2">
                                                                        <label class="col-form-label" for="basic-default-name">Organization</label>
                                                                    </div>
                                                                    <div class="col-sm-3">
                                                                        <input type="text" class="form-control" id="txtorganization" />

                                                                    </div>

                                                                    <div class="col-sm-2">
                                                                        <label class="col-form-label" for="basic-default-name">Department</label>
                                                                    </div>
                                                                    <div class="col-sm-3">
                                                                        <input type="text" class="form-control" id="txtDepartment" />

                                                                    </div>

                                                                </div>

                                                                <div class="btn-add-training">
                                                                    
                                                                    <button type="button" class="btn btn-save">ADD</button>

                                                                    
                                                                </div>

                                                                <div class="row" style="padding-top: 1px">
                                                                    <div class="col-sm-6">
                                                                         <h5 class="card-header">Training Description</h5>
                                                                    </div>

                                                                    <div class="col-sm-6">
                                                                        <h5 class="card-header">REMARKS</h5>
                                                                    </div>

                                                                </div>

                                                                 <div class="row" style="padding-top: 25px">
                                                                    
                                                                    <div class="col-sm-6">
                                                                    
                                                                        <textarea id="txtTraningdescrption" class="form-control"></textarea>

                                                                    </div>

                                                                    <div class="col-sm-6">
                                                                        <textarea id="txttraningremarks1" class="form-control"></textarea>
                                                        
                                                                    </div>
                                                                  

                                                                </div>

                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-submit" data-bs-dismiss="modal">
                                                                    Submit
                                                                </button>
                                                                <button type="button" class="btn btn-save">Save</button>

                                                                <%--<button type="button" class="btn btn-reqtraining" data-bs-toggle="modal" data-bs-target="#ModalTraningRequest"
                                                                    aria-labelledby="modalToggleLabel" tabindex="-1" style="display: none" aria-hidden="true">
                                                                    Request To Training</button>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <%-- End modal Traning Request --%>

                         

                                    <%-- modal Confidential --%>
                                     
                                     <div class="modal fade" id="ModalConfidential">
                                                    <div class="modal-dialog  modal-l" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel21">Modal title</h5>
                                                                <button
                                                                    type="button"
                                                                    class="btn-close"
                                                                    data-bs-dismiss="modal"
                                                                    aria-label="Close">
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">

                                                                <div class="mdlbody-heng">
                                                                    <h5 class="alignleft">CONFIDENTIAL </h5>
                                                                    
                                                                </div>
                                                                
                                                                <div class="row" style="padding-top: 20px">
                                                                    <div class="col-sm-12">
                                                                         <h4 class="conf-heding">**This will be reviewed by CEO Office ONLY</h4>
                                                                    </div>

                                                                </div>

                                                                 <div class="row" style="padding-top: 25px">
                                                                    
                                                                    <div class="col-sm-6">
                                                                         <label class="form-label" for="basic-default-message">Rate Your Manager</label>
                                                                        <textarea id="txtTraningdescrption1" class="form-control" placeholder="%"></textarea>

                                                                    </div>

                                                                    <div class="col-sm-6">
                                                                         <label class="form-label" for="basic-default-message">Why?</label>
                                                                        <textarea id="txttraningremarks11" class="form-control" ></textarea>
                                                        
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
                                    <%-- End Modal Confidential --%>



    <%--pop up--%>

<!-- Extra Large Modal -->
<div class="modal fade" id="KpiSaveAndSubmitModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel4">KPI SUBMISSION</h5>
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
    
        

       <div class="col-md-3" >
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


    <div class="tab-pane fade show active" id="navs-emp-kpi">

              <div>
                
                 <div  class="mdlbody-heng">
                     <h5 class="alignleft">MY KPI</h5>
                     <h5 class="alignright sel-month-heading">SEPTEMBER 2022</h5>
                 </div>
                 <div style="clear: both;"></div>



<%--                 <div class="row" style="padding-top: 25px;margin-left: 80%;">
                     <div class="col-sm-2">
                         <label class="col-form-label"  for="basic-default-name">YTD</label>
                     </div>
                     <div class="col-sm-6" style="float: right">
                         <input type="text" class="form-control" id="txtYTD" placeholder="0" disabled />
                     </div>
                 </div>--%>

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


                  <%--   <div class="col-sm-1">
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
              <div class="table-responsive overflow-custom">
                  <table class="table table-bordered metric-table">
                      <thead>
                          <tr>
                              <%--<th>Actual No. Tickets</th>
                              <th>Actual No. Closed Tickets</th>
                              <th>% Success</th>
                              <th>Points</th>--%>
                              <th>Metrics</th>
                              <th></th>
                        

                          </tr>
                      </thead>
                      <tbody class="tbody-matrics">
                        
                         <%-- <tr>
                              <td>
                                  <i class="fab fa-angular fa-lg text-danger me-3"></i>
                                  <input type="text" id="actualNumTickets" onkeypress='return event.charCode >= 48 && event.charCode <= 57' />
                              </td>
                              <td><input type="text" id="actualNumClosedTickets" onkeypress='return event.charCode >= 48 && event.charCode <= 57' /></td>
                              <td><span class="badge bg-label-info me-1">28%</span></td>
                              <td>18</td>

                          </tr>--%>



                      </tbody>
                  </table>
                  </div>
                   <div class="table-responsive text-nowrap" style="margin-top:2px;">
                  <table class="table table-bordered">
                      <thead>
                          <tr>
                              <%--<th>Actual No. Tickets</th>
                              <th>Actual No. Closed Tickets</th>
                              <th>% Success</th>
                              <th>Points</th>--%>
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
                                                                         <div class="fuKpiResDiv"> <span class="" style="cursor:pointer;">
                                                                                  <input class="form-control hidden" type="file" id="fuKpiRes" accept=".doc,.docx,.pdf,.png,.jpeg,.msg" multiple>
                                                                                  <label style="cursor:pointer;" for="fuKpiRes"><i class="fa fa-upload ifukpi" style="color:#298df2;" aria-hidden="true"></i> upload</label>
                                                                             </span>
                                                                        </div>
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
      <div class="modal-footer">
          <div style="margin-right:66%;"><button type="button" class="btn btn-primary hidden btnSubmit" >Submit KPI</button></div>
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnSave">Save changes</button>
      </div>
    </div>
  </div>
</div>

    <%--Submit KPIs Confirm Modal--%>

<!-- Modal -->
<div class="modal fade" id="submitKPIConfirmationModal" tabindex="-1" aria-labelledby="submitKPIConfirmationModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="submitKPIConfirmationModalLabel">ONE MORE STEP TO GO</h5>
       <%-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
          </button>--%>
      </div>
      <div class="modal-body">
       
           <!-- SmartWizard html -->
<%--<div id="smartwizard">
    <ul class="nav">
        <li class="nav-item">
          <a class="nav-link" href="#step-1">
            <div class="num">1</div>
            Step 1
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#step-2">
            <span class="num">2</span>
            Finish
          </a>
        </li>
      
    </ul>
 
    <div class="tab-content">
        <div id="step-1" class="tab-pane" role="tabpanel" aria-labelledby="step-1">
           <div class="mdlbody-heng">
                  <h5 class="alignleft">CONFIDENTIAL </h5>
                  
              </div>
                                                                
               <div class="row" style="padding-top: 20px">
                   <div class="col-sm-12">
                        <h4 class="conf-heding">**This will be reviewed by CEO Office ONLY</h4>
                   </div>

               </div>

                <div class="row" style="padding-top: 25px">
                   
                   <div class="col-sm-6">
                        <label class="form-label" for="basic-default-message">Rate Your Manager</label>
                       <textarea id="txtTraningdescrption11" class="form-control" placeholder="%"></textarea>

                   </div>

                   <div class="col-sm-6">
                        <label class="form-label" for="basic-default-message">Why?</label>
                       <textarea id="txttraningremarks111" class="form-control" ></textarea>
              
                   </div>
                 

               </div>
        </div>
        <div id="step-2" class="tab-pane" role="tabpanel" aria-labelledby="step-2">
            Step content
            
        </div>
        
    </div>
 
    <!-- Include optional progressbar HTML -->
    <div class="progress">
      <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
</div>  --%>
          <div class="nav-align-right nav-kpi-submit">
  <ul class="nav nav-tabs nav-kpi-submit-ul" role="tablist">
    <li class="nav-item">
      <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-confidential-comment" style="display:none;">Home</button>
    </li>
    <li class="nav-item">
      <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-last-step"  style="display:none;">Profile</button>
    </li>
  
  </ul>
  <div class="tab-content nav-kpi-submit-tab">
    <div class="tab-pane fade show active" id="navs-confidential-comment">
      
        <div class="mdlbody-heng">
                  <h5 class="alignleft">CONFIDENTIAL </h5>
                  
              </div>
                                                                
               <div class="row" style="padding-top: 20px">
                   <div class="col-sm-12">
                        <h4 class="conf-heding">**This will be reviewed by CEO Office ONLY</h4>
                   </div>

               </div>

                <div class="row" style="padding-top: 25px">
                   
                   <div class="col-sm-6">
                        <label class="form-label" for="basic-default-message">Rate Your Manager</label>
                       <input type="text" id="txtRatingManager" class="form-control" placeholder="Out of 100" onkeypress="return event.charCode >= 48 && event.charCode <= 57"/>

                   </div>

                   <div class="col-sm-6">
                        <label class="form-label" for="basic-default-message">Why?</label>
                       <textarea id="txtRatingManagerComment" class="form-control" ></textarea>
              
                   </div>
                 

               </div>
      
    
    </div>
<%--    <div class="tab-pane fade" id="navs-last-step">
     <h2>Information!</h2>
<h5>By submitting you kpi you will not be able to edit any more. Are you sure you want to submit?</h5>    
    </div>--%>

      <div class="tab-pane fade" id="navs-last-step" style=" text-align: center;">
     <i class="bx bxs-check-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #26871ab8;"></i><h2>Are you sure?</h2>
            <h5>By submitting your KPI you will not be able to edit any more.</h5>    
    </div>


  </div>
</div>


      </div>
      <div class="modal-footer-custom">
          <div class="row">
              <div class="col-md-4">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary btnSubmitConfirm" disabled>Submit</button></div>
              
              <div class="col-md-5"></div>
              <div class="col-md-3">
                  <button type="button" class="btn btn-secondary btnPrevSubmitKpi">Prev</button>
          <button type="button" class="btn btn-primary btnNextSubmitKpi">Next</button>
              </div>
          </div>
        
          
          
      </div>
    </div>
  </div>
</div>
<%--This is KPI New Changes Branch--%>
    <asp:HiddenField ID="hfServerMapPth" runat="server" />
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

    

    <script src="../Template/assets/vendor/libs/popper/popper.js"></script>
    <script src="../Template/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../Template/assets/js/ui-modals.js"></script>
    <script src="../Template/assets/js/main.js"></script>
    <script src="Scripts/my-kpi.js?v=2.8"></script>
    <script src="Flatpickr/js/flatpickr.js"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <script src="SmartWizard/smart-wizard.js"></script>
           
    	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css" />
	<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>

</asp:Content>

