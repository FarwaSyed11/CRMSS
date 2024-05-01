<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="InspectionDetails.aspx.cs" Inherits="FireDuctWork_InspectionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="Scripts/InspectionDetails.js?v=0.7"></script>
    <link href="CSS/frdmaster.css" rel="stylesheet" />

    <style>
        .accordion-button {
            position: relative;
            display: flex;
            align-items: center;
            width: 100%;
            padding: 0.79rem 1.125rem;
            font-size: 1.2rem;
            color: #fff;
            text-align: left;
            background-color: #a92828;
            border: 0;
            border-radius: 0;
            overflow-anchor: none;
            transition: all 0.2s ease-in-out, border-radius 0.15s ease;
        }

            .accordion-button:not(.collapsed) {
                color: #a92828;
                background-color: #fff;
                box-shadow: inset 0 0 0 #d9dee3;
                text-transform: uppercase;
                font-size: x-large;
            }

        .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
            background-color: #a92828;
            border-color: #a92828;
            box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%);
        }

        .btn-secondary {
            color: #fff;
            background-color: #a92828;
            border-color: #a92828;
            box-shadow: 0 0.125rem 0.25rem 0 rgb(133 146 163 / 40%);
        }



        .file {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }

            .file > input[type='file'] {
                display: none
            }

            .file > label {
                outline: 0;
                user-select: none;
                /* border-color: rgb(216, 216, 216) rgb(209, 209, 209) rgb(186, 186, 186); */
                border-style: solid;
                border-radius: 9px;
                border-width: 1px;
                background-color: hsl(0, 0%, 100%);
                color: hsl(0, 0%, 29%);
                padding-left: 6px;
                padding-right: 6px;
                padding-top: 6px;
                padding-bottom: 6px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

                .file > label:hover {
                    border-color: hsl(0, 0%, 21%);
                }

                .file > label:active {
                    background-color: hsl(0, 0%, 96%);
                }

                .file > label > i {
                    padding-right: 5px;
                }

        .file--upload > label {
            color: hsl(210deg 14% 60%);
            border-color: hsl(212deg 14% 54%);
        }

            .file--upload > label:hover {
                border-color: hsl(204, 86%, 53%);
                background-color: hsl(204, 86%, 96%);
            }

            .file--upload > label:active {
                background-color: hsl(204, 86%, 91%);
            }


        .active-tr {
            border-left: 5px solid #db7e2f !important;
        }


        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link:not(.active) {
            background-color: #b4b9bf;
        }


        .frdInstald-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .frdInstald-table td {
            color: #333333 !important;
        }



        .SiteInspection-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .SiteInspection-table td {
            color: #333333 !important;
        }

        .iconClassExcel {
            margin-left: 8px;
            background: #933737;
        }

            .iconClassExcel:hover {
                background: #a54141;
            }

        #DataTables_Table_0_paginate .current {
            color: white !important;
            background: #d33a3a !important;
        }
        .txtArea
        {
            border-color: black;
        }
        .txtArea:focus
        {
               border-color:aqua;
               outline: 3px ridge cyan;
               box-shadow: 1px 1px 3px 4px rgba(0, 187, 150, 0.5);
        }
        .textarea {
      width: calc(100% - 12px);
      padding: 5px;
      }
      .testbox {
      display: flex;
      justify-content: center;
      align-items: center;
      height: inherit;
      padding: 20px;
      }
      form {
      width: 100%;
      padding: 20px;
      border-radius: 6px;
      background: #fff;
      box-shadow: 0 0 8px  #669999; 
      }
      .banner {
      position: relative;
      height: 300px;
      background-image: url("/uploads/media/default/0001/02/c1504011491c4e04e5158b63a27a4ea654b03ed1.jpeg");  
      background-size: cover;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      }
      .banner::after {
      content: "";
      background-color: rgba(0, 0, 0, 0.2); 
      position: absolute;
      width: 100%;
      height: 100%;
      }
      input, select, textarea {
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
      }
      input {
      width: calc(100% - 10px);
      padding: 5px;
      }
      input[type="date"] {
      padding: 4px 5px;
      }
      textarea {
      width: calc(100% - 12px);
      padding: 5px;
      }
      .item:hover p, .item:hover i, .question:hover p, .question label:hover, input:hover::placeholder {
      color:  #669999;
      }
      .item input:hover, .item select:hover, .item textarea:hover {
      border: 1px solid transparent;
      box-shadow: 0 0 3px 0  #669999;
      color: #669999;
      }
        .item input:focus, .item select:focus, .item textarea:focus {
        }
      .item {
      position: relative;
      margin: 10px 0;
      }
      .item span {
      color: red;
      }
      .week {
      display:flex;
      justfiy-content:space-between;
      }
      .colums {
      display:flex;
      justify-content:space-between;
      flex-direction:row;
      flex-wrap:wrap;
      }
      .colums div {
      width:48%;
      }
      input[type="date"]::-webkit-inner-spin-button {
      display: none;
      }
      .item i, input[type="date"]::-webkit-calendar-picker-indicator {
      position: absolute;
      font-size: 20px;
      color:  #a3c2c2;
      }

        .col-form-label {
            padding-top: calc(0.4375rem + 1px);
            padding-bottom: calc(0.4375rem + 1px);
            margin-bottom: 0;
            font-size: inherit;
            font-weight: 500;
            line-height: 1.53;
            color: #d62e22;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div style="padding-left: 2%; padding-top: 1%;">

            <div class="pull-left">
                <h4 style="text-shadow: 1px 6px 13px; color: #a92828;">FRD Project Inspection Details </h4>
            </div>

            <%-- <div class="pull-right" style="padding-right: 10%; padding-bottom:10px">
                <button type="button" data-bs-toggle="modal" data-bs-target="#FRDaddProject" class="btn rounded-pill btn-outline-secondary">
                    <span class="tf-icons bx bx-plus"></span>&nbsp; Add Project
                </button>
            </div>--%>

            <hr style="width: 100%; text-align: left; margin-left: 0">
        </div>

        <div class="card-body" style="margin-top: -2%;">

            <div class="" style="margin-top: 1%;">

                <table class="table table-bordered table-striped SiteInspection-table">

                    <thead>
                        <tr>
                            <th style="display: none">Id</th>
                            <th>Sl.No</th>
                            <th>Date</th>
                            <th>Customer Number</th>
                            <th>customer Name</th>
                            <th>Project </th>
                            <th>Location</th>
                            <th>Consultant</th>
                            <th>Main Contractor</th>
                            <th>MEP Contractor</th>
                            <th>Delivery Date</th>

                            <th style="width: 12%;">Actions</th>
                        </tr>
                    </thead>

                    <tbody class="tbody-siteinspection">
                    </tbody>
                </table>
            </div>

        </div>


        <%-- modal for inspection --%>

        <div class="modal fade" id="ModalInspectionDetails" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalProjectStatus">Inspection Details</h5>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">

                        <%--tabs--%>
                        <div class="nav-align-top tab-Inspections">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-home" aria-controls="navs-top-home" aria-selected="true">Add New</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-profile" aria-controls="navs-top-profile" aria-selected="false">Existing</button>
                                </li>

                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="navs-top-home" role="tabpanel">
                                    <div class="accordion" id="accordionExample">
                                        <div class="card accordion-item active">
                                            <h2 class="accordion-header" id="headingOne">
                                                <button type="button" class="accordion-button" data-bs-toggle="collapse" data-bs-target="#accordionOne" aria-expanded="true" aria-controls="accordionOne" role="tabpanel">
                                                    Inspection Details
                                                </button>
                                            </h2>

                                            <div id="accordionOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">

                                                    <div class="row">

                                                        <div class="col-2">
                                                            <label for="html5-number-input" class="col-form-label label-custom">Project Number</label>
                                                            <div class="">
                                                                <input class="form-control" type="text" value="" id="txtprojNumber" disabled>
                                                            </div>
                                                        </div>


                                                        <div class="col-5">
                                                            <label class="col-form-label label-custom" for="basic-default-name">Project Name</label>
                                                            <div class="">
                                                                <input class="form-control" type="text" value="" id="txtprojName" disabled>
                                                            </div>

                                                        </div>

                                                        <div class="col-5">
                                                            <label class="col-form-label label-custom" for="basic-default-name">Cilent/Customer</label>
                                                            <div class="">
                                                                <input class="form-control" type="text" value="" id="txtcustomerName" disabled>
                                                            </div>

                                                        </div>

                                                    </div>

                                                  
                                                    <div class="row">

                                                         <div class="col-4">
                                                            <label for="html5-number-input" class="col-form-label label-custom">Main Contractor</label>
                                                            <div class="">
                                                                <input class="form-control" type="text" value="" id="txtmainContractor" disabled>
                                                            </div>
                                                        </div>

                                                        <div class="col-4">
                                                            <label class="col-form-label label-custom" for="basic-default-name">MEP Contractor</label>
                                                            <div class="">
                                                                <input class="form-control" type="text" value="" id="txtMEPcontractor" disabled>
                                                            </div>

                                                        </div>


                                                        <div class="col-4">
                                                            <label for="html5-number-input" class="col-form-label label-custom">FRD Location/System Reference No.</label>
                                                            <div class="">
                                                                <input class="form-control" type="text" value="" id="txtFRDlocation" disabled>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">

                                                        <div class="col-3">
                                                            <label class="col-form-label label-custom" for="basic-default-name">Order Number</label>
                                                            <div class="">
                                                                <input class="form-control" type="text" value="" id="txtodredNumber">
                                                            </div>

                                                        </div>


                                                        <div class="col-3">
                                                            <label for="html5-number-input" class="col-form-label label-custom">Drawing No.</label>
                                                            <div class="">
                                                                <input class="form-control" type="text" value="" id="txtdrawingNo">
                                                            </div>
                                                        </div>

                                                 
                                                        <div class="col-3">
                                                            <label for="html5-number-input" class="col-form-label label-custom">Installation Completion</label>
                                                            <input type="text" class="form-control" id="txtinstallnCompltd" />

                                                        </div>


                                                    

                                                        <div class="col-3">
                                                            <label for="html5-date-input" class=" col-form-label">Inspection Date</label>
                                                            <div>
                                                                <input class="form-control" type="date"  id="txtinsptionDate" />

                                                            </div>
                                                        </div>

                                                        

                                                    </div>

                                                    <div class="row">

                                                        <div class="col-3">
                                                            <label for="html5-number-input" class="col-form-label label-custom">FRD Model Number</label>
                                                            <input type="text" class="form-control" id="txtfrdmodelnumber" />

                                                        </div>


                                                        <div class="col-3">
                                                            <label for="html5-number-input" class="col-form-label label-custom">Inspection Number</label>
                                                            <div class="">
                                                                <input type="text" class="form-control" id="txtInspectionNumber" />
                                                            </div>
                                                        </div>

                                                         <div class="col-3">
                                                            <label for="html5-number-input" class="col-form-label label-custom">Inspection Location</label>
                                                            <div class="">
                                                                <input type="text" class="form-control" id="textinspectionlocation" />
                                                            </div>
                                                        </div>

                                                        <div class="col-3">
                                                            <label for="html5-number-input" class="col-form-label label-custom">Is these a final Inspection ?</label>
                                                            <select class="form-select" id="ddlinspectionstatus" aria-label="Default select example">
                                                                 <option value="NOT-FINAL">NO</option>
                                                                 <option value="FINAL-INSPECTION">YES</option>
                                                                 <option value="NOT APPLICABLE">N/A</option>
                                                                

                                                            </select>
                                                        </div>

                                                    </div>

                                                    <%-- <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="form-label">Installation Completion</label>
                                                <input type="text" class="form-control" id="txtinstallnCompltd" />
                                            </div>--%>

                                                    <%--  <div class="col-12" hidden>
                                                <label class="col-form-label label-custom" for="basic-default-name">Observations</label>
                                                <textarea class="form-control" id="txtaObservations" rows="4" placeholder="1."></textarea>
                                            </div>--%>
                                                </div>

                                                <div class="pull-right" style="padding-right: 10%; padding-bottom: 10px">
                                                    <button type="button" class="btn rounded-pill me-2 btn-secondary btnObbCheck" onclick="AddInspectnDetl()">
                                                        Save&nbsp; 
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card accordion-item">
                                            <h2 class="accordion-header" id="headingTwo">
                                                <button type="button" class="accordion-button collapsed hidden" data-bs-toggle="collapse" data-bs-target="#accordionTwo" aria-expanded="false" aria-controls="accordionTwo" role="tabpanel">
                                                    Inspection Check List
                                                </button>
                                            </h2>
                                            <div id="accordionTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">

                                                    <%-- table --%>
                                                    <div class="card-body" style="margin-top: -2%;">

                                                        <div class="" style="margin-top: 1%;">

                                                            <table class="table table-bordered table-striped kpi-user-list-table">

                                                                <thead>
                                                                    <tr>
                                                                        <th>Sl.No</th>
                                                                        <th>Check List</th>
                                                                        <th>Status</th>

                                                                        <th>Comment</th>
                                                                        <th>Action Required </th>


                                                                        <%--<th style="width: 12%;">Actions</th>--%>
                                                                    </tr>
                                                                </thead>

                                                                <tbody class="tbody-checklist">
                                                                </tbody>
                                                            </table>

                                                            <div>
                                                                <div class="pull-right" style="padding-right: 10%; padding-bottom: 30px; padding-top: 30px">
                                                                    <button type="button" class="btn rounded-pill me-2 btn-secondary btnObbCheck" onclick="observation()">
                                                                        Submit&nbsp; 
                                                                    </button>
                                                                </div>
                                                            </div>

                                                        </div>

           

                                                    </div>

                                                    <%-- end table --%>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                                <div class="tab-pane fade" id="navs-top-profile" role="tabpanel">

                                    <div class="row">

                                        <div class="col-3">

                                            <div class="" style="margin-top: 1%;">

                                                <table class="table table-bordered table-striped inspection-table frdInstald-table">

                                                    <thead>
                                                        <tr>
                                                            <th>Project No</th>

                                                            <th>Project Name</th>
                                                            <th>Customer Name</th>
                                                            <th>Inspection No</th>



                                                        </tr>
                                                    </thead>

                                                    <tbody class="tbody-InspectProject">
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>


                                        <div class="col-9" style="padding-left: 3%; margin-top: 5px">

                                            <%--<div class="" style="margin-top: 1%;">--%>
                                            <table class="table table-bordered table-striped checklist-table-for-view frdInstald-table">

                                                <thead>
                                                    <tr>
                                                        <th>Sl.No</th>

                                                        <th>Check List</th>
                                                        <th>Status</th>
                                                        <th>Photos</th>
                                                        <th>Comment</th>
                                                        <th>Action Required </th>


                                                        <%--<th style="width: 12%;">Actions</th>--%>
                                                    </tr>
                                                </thead>

                                                <tbody class="tbody-checklistForView">
                                                </tbody>
                                            </table>
                                            <%--</div>--%>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>


                        <div class="modal-footer">
                            <%--<button type="button" id="Button1" class="btn btn-primary" runat="server"  data-bs-dismiss="modal"  onclick="addProject()">Add</button>--%>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>




        <div class="modal fade" id="modalObservation" tabindex="-2" aria-hidden="true" style="background-color: #13131466">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalitemadd">INSPECTOR ACCESS</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">
                   
                    <label id="lblObservation">OBSERVATION :</label>
                    <br />
                    <textarea id="txtObservation" rows="4" cols="6" class="txtArea" style="width:100%"></textarea> 
                
                    <button type="button" class="btn" id="btnOk" onclick="InspDet()" style="background-color:#a51f1f;color:white;float:right">OK</button>

                    <div class="testbox InspArea" style="padding-top: 4%;">
      <form action="/">
        <div class="colums">
            <div class="item">
            <h2><label>INSPECTOR AND CLIENT DETAILS</label></h2>
                </div>
             <div class="item">
          
              </div>
              <div class="item">
            <label for="txtInspName">Inspector Name<span>*</span></label>
            <input id="txtInspName" required/>
          </div>
          <div class="item">
            <label for="txtClient">Client Name<span>*</span></label>
            <input id="txtClient" type="text" required/>
          </div>
          <div class="item">
            <label for="txtInspDesignation">Inspector Designation<span>*</span></label>
            <input id="txtInspDesignation" type="text" required/>
          </div>
          <div class="item">
            <label for="txtClientDesignation">Client Designation<span>*</span></label>
            <input id="txtClientDesignation" type="text" required/>
          </div>
          <div class="item">
            <label for="txtInspMob">Inspector MobileNumber<span>*</span></label>
            <input id="txtInspMob" type="text" required/>
          </div>
          <div class="item">
            <label for="txtClientMob">Client Mobile Number<span>*</span></label>
            <input id="txtClientMob" type="text" required/>
          </div>
          

           

            <div class="item">
                <div id="inspectSignedDiv" data-role="content">
                    <button type="button" class="btn btn-primary btn-inspect-grid" style="background: #32a6d5; border: #32a6d5;">Inspector Signature</button>
                </div>
            </div>

             <div class="item">
                <div id="custSignedDiv" data-role="content">
                    <button type="button" class="btn btn-primary btn-cust-grid" style="background: #32a6d5; border: #32a6d5;">Customer Signature</button>
                </div>
            </div>


        </div>
          </form>

                <button type="button" class="btn" id="btnSubmitDet" onclick="InspDetSave()" style="background-color:#a51f1f;color:white;float:right">Submit</button>

                </div>
            </div>
        </div>

    </div>
            </div>
            
    

    <!-- Small Modal -->
<div class="modal fade" id="eSignCustomerModal" tabindex="-1"  data-bs-backdrop="static" aria-hidden="true" style="background: #5e606242;">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="eSignCustomerlabel">Electronic Signature</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">    
        		
			<div class="ui-content popUpHeight">
				<div id="div_signcontract">
					<canvas id="canvasCustomer" style="border: 0px solid rgb(0, 0, 0) !important;">Canvas is not supported</canvas>
					<div>
						<input id="btnSubmitSign" type="button" data-inline="true" data-mini="true" data-theme="b" value="Submit Sign" onclick="fun_submit_customer()" />
						<input id="btnClearSign" type="button" data-inline="true" data-mini="true" data-theme="b" value="Clear" onclick="init_Sign_Canvas('canvasCustomer')" />
					</div>
				</div>	
			</div>	

      </div>
   
    </div>
  </div>
</div>

    <!-- Small Modal -->
<div class="modal fade" id="eSignInspectorModal" tabindex="-1"  data-bs-backdrop="static" aria-hidden="true" style="background: #5e606242;">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="eSignInspectlabel">Electronic Signature</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">    
        		
			<div class="ui-content popUpHeight">
				<div id="div_signcontractInspect">
					<canvas id="canvasInspector" style="border: 0px solid rgb(0, 0, 0) !important;">Canvas is not supported</canvas>
					<div>
						<input id="btnSubmitSignInspect" type="button" data-inline="true" data-mini="true" data-theme="b" value="Submit Sign" onclick="fun_submit_inspector()" />
						<input id="btnClearSignInspect" type="button" data-inline="true" data-mini="true" data-theme="b" value="Clear" onclick="init_Sign_Canvas('canvasInspector')" />
					</div>
				</div>	
			</div>	

      </div>
   
    </div>
  </div>
</div>


    <script type="text/javascript">
        var currUserId = '';
        var EmpNo = '';
        var EmpName = '';
        var myrole = '';
        var overAllPerfo = 0;
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
                    EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';
                    EmpName ='<%=Session["EmpName"]%>'
        });

    </script>


    <script src="../Template/Datatable/js/jquery.dataTables.min.js"></script>
    <script src="../Template/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../Template/Datatable/js/jszip.min.js"></script>
    <script src="../Template/Datatable/js/pdfmake.min.js"></script>
    <script src="../Template/Datatable/js/buttons.print.min.js"></script>
    <script src="../Template/Datatable/js/vfs_fonts.js"></script>
    <script src="../Template/Datatable/js/buttons.html5.min.js"></script>



    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

     	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css" />
	<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>

</asp:Content>


