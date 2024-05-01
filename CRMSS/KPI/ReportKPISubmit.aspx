<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="ReportKPISubmit.aspx.cs" Inherits="KPI_ReportKPISubmit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="Css/kpi.css" rel="stylesheet" />
    <link href="Flatpickr/css/_flatpickr.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
       <style type="text/css">
    
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
     .kpi-user-list-table th{
        background-color: #a92828 !important;
        color:white !important;
    }
      .kpi-user-list-table td{
        
        color:#333333 !important;
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
    background: #d33a3a !important;
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

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%; padding-top: 1%;"><h4 style="text-shadow: 1px -3px 8px; color: #a92828;">KPI SUBMISSION REPORTS</h4></div> 

  <div class="card-body" style="margin-top: -2%;">

      <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

                         
                          <td class="no-border" style="width: 20%">
                              <%--<asp:DropDownList ID="ddlCompany" runat="server" Font-Names="tahoma" CssClass="form-select color-dropdown" AutoPostBack="true" />--%>
                              <asp:Label ID="Label8" Text="Organization" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select id="ddlOrg" class="form-select color-dropdown"> </select>
                          </td>


                         
                          <td class="no-border" style="width: 20%">
                              <asp:Label ID="Label10" Text="Department" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlDepart"> </select>
                              <%--<asp:DropDownList ID="ddlManager" runat="server" Font-Names="tahoma" CssClass="form-select color-dropdown" AutoPostBack="true" />--%>
                          </td>

                          <%--<td class="no-border label-alignment" style="width: 1%"></td>--%>
                        
                          <td class="no-border" style="width: 20%">
                              <%--<asp:DropDownList ID="ddlSalesman" runat="server" Font-Names="tahoma" CssClass="form-select color-dropdown" />--%>
                            <asp:Label ID="Label11" Text="Division" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlDivision"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 14%">
                                  <asp:Label ID="Label1" Text="Employee Status" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlEmpStatus">
                                  <option value="-1">--- All ---</option>
                                  <option value="ASSIGNED PENDING">ASSIGNED PENDING</option>
                                  <option value="NOT ASSIGNED">NOT ASSIGNED</option>
                                  <option value="DRAFT">DRAFT</option>                                  
                                  <option value="SUBMITTED">SUBMITTED</option>
                              </select>
                          </td>
                        <td class="no-border label-alignment" style="width: 10%">
                                <asp:Label ID="Label2" Text="Mananger Status" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlManStatus"> 
                                  <option value="-1">--- All ---</option>
                                  <option value="PENDING">PENDING</option>
                                  <option value="APPROVED">APPROVED</option>
                                  <option value="REJECTED">REJECTED</option>
                              </select>
                          </td>

                            <td class="no-border label-alignment" style="width: 8%">
                                  <asp:Label ID="Label4" Text="Month" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlMonth"> 
                                  <option value="-1">--- All ---</option>
                                  <option value="1">Jan</option>
                                  <option value="2">Feb</option>
                                  <option value="3">Mar</option>
                                  <option value="4">Apr</option>
                                  <option value="5">May</option>
                                  <option value="6">June</option>
                                  <option value="7">July</option>
                                  <option value="8">Aug</option>
                                  <option value="9">Sep</option>
                                  <option value="10">Oct</option>
                                  <option value="11">Nov</option>
                                  <option value="12">Dec</option>
                              </select>
                          </td>
                          <td class="no-border label-alignment" style="width: 7%">
                                  <asp:Label ID="Label3" Text="Year" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlYear"> </select>
                          </td>
                   
                          <td class="no-border" style="width: 0%">
                              <input type="button" id="btnSearchDashBoard" value="Search" class="btn btn-primary d-block" style="font-size:small; margin-top:19px;" /> 
                          </td>
                      </tr>
                  </table>
      </div>


     <%--   <div class="ajax-loader custom-loader hidden">
     <span class="spinner-border kpi-loader-name"  role="status" aria-hidden="true"></span><h4>Please wait...</h4>      
        </div>--%>

    <div class="" style="margin-top: 1%;">
  <table class="table table-bordered table-striped kpi-user-list-table">
    <%--<caption class="ms-4">List of Projects</caption>--%>
    <thead>
      <tr>
        <th>Employee Number</th>
        <th>Employee Name</th>
        <th>Department</th>
           <th>Division Name</th>
           <th>Designation</th>
           <th>Joining Date</th>
       <th>organization</th>
          <th>Submission Month</th>
          <th>KPI Point</th>
          <th>Employee Status</th>
          <th>KPI Assigned Date</th>
          <th>Manager Status</th>

        <th style="width: 10%;color:white;padding-left:58px;"> 
            <div style="display: inline-flex;">
                <label class="btn-all-cb" style="background:transparent;"> <input class="form-check-input" type="checkbox"> All  </label> 
                <a href="#" class="btn-send-email hidden" style="border: 1px solid #dc7f5e;padding: 2px; border-radius: 7%;background: #d54832;color: white; box-shadow: 0px 0px 0px 1px #d8cbcb;text-transform: capitalize; margin-left: 8px; width: 100px; text-align: center; line-height: 27px;">Send Email</a> 

            </div>
        </th> 
      </tr>
    </thead>
    <tbody class="tbody-employees">

    </tbody>
  </table>
</div>




    </div>
</div>
  
    <%--Indicator Popup--%>
         
<%--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exLargeModal">
  Extra Large
</button>--%>
<!-- Extra Large Modal -->
<div class="modal fade" id="KPIPopupEmployee" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #296881;">
        <h5 class="modal-title" id="KPIPopupEmployeeLabel" style="color:white">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
     
 <div class="modal-body">

  <div class="nav-align-top" id="nav-kpi">
       <ul class="nav nav-tabs" role="tablist">
          <li class="nav-item">
            <button type="button" class="nav-link nav1 active" role="tab" data-bs-toggle="tab" data-bs-target="#nav-add-kpi">Add Indicator</button>
          </li>
          <li class="nav-item">
            <button type="button" class="nav-link nav2" role="tab" data-bs-toggle="tab" data-bs-target="#nav-add-matrics">Add Metrics</button>
          </li>
 
       </ul>

  <div class="tab-content">

      <%--Indicator tab--%>
         <div class="tab-pane fade show active" id="nav-add-kpi">
          
          <div class="row">

                 <div class="col-md-3">
                     <%--<div class="" id="kpiAccordianPopup">    </div>--%>
                     
                     <div class="nav-align-left" id="nav-kpi-only">
                             <ul class="nav nav-tabs" role="tablist" id="nav-kpi-only-ul" style="min-width: 100% !important;">
                             
                             </ul>
                         </div>
                     <%--<div class="nav-align-top" id="nav-kpi-only">
                            <ul class="nav nav-tabs" role="tablist">
                            </ul>
                         </div>--%>

                 </div>

      
                 
                 <div class="col-md-9">

                             <div class="row" > 
                                 <div class="col-md-2">
                                              <i class="fa fa-trash fa-del-kpi" title="Delete KPI" style="cursor:pointer; padding-right: 10px;font-size: x-large;color: #e14b4b;"></i>   </div>
                                  <div class="col-md-10">
                                      <div class="form-check form-switch" style="float: right;">
                                      <input class="form-check-input" type="checkbox" role="switch" id="cbIsKpiInsertOn" >
                                      <label class="form-check-label" for="cbTarget" style="font-weight: bold;color: #c93434;">Add New KPI</label>
                                      </div>
                                  </div>
                             </div>
                            <div class="row">
                                <div class="col mb-3">
                                  <label for="nameExLarge" class="form-label">Indicator <span style="color:red;">&nbsp; *</span></label>
                                  <%--<input type="text" id="txtIndicator" class="form-control" placeholder="Enter Indicator">--%>
                                <textarea class="form-control" id="txtIndicator" rows="4" placeholder="Enter Indicator"></textarea>

                                </div>
                                <div class="col mb-3">
                                  <label for="nameExLarge" class="form-label">Weightage <span style="color:red;">&nbsp; *</span></label>
                                  <input type="text" id="txtWeightage" class="form-control" placeholder="Enter Weightage" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                </div>
                           </div>

                              <div class="row g-2">
                                   <div class="col mb-0">   
                                         <label for="taTargetDesc" class="form-label">Target Description</label>
                                         <textarea class="form-control" id="taTargetDesc" rows="4" placeholder="Enter Target Description"></textarea>
                                   </div>
                                   <div class="col mb-0">   
                                          <label for="defaultSelect" class="form-label">Indicator Type</label>
                                             <select id="ddlIndicatorType" class="form-select">                              
                                               <option value="Percentage" selected>Percentage</option>
                                               <option value="Numeric">Numeric</option>
                                                  <option value="Rating">Rating</option>
                                                 <option value="Complaint">Complaint</option>
                                             </select>
                                       <div class="divtxtComplaint hidden">  <span style="color:red; float: right;">&nbsp; *</span> <input type="text" id="txtComplaint" class="form-control" placeholder="Enter Reduce Value" style=" width: 50%; float: right; margin-top: 6px;" onkeypress='return event.charCode >= 48 && event.charCode <= 57'></div>
                                   </div>  

                                  <div class="input-group">
                                         <label class="input-group-text ">
                                             <span>
                                                 Indicator Start Date
                                             </span>
                                             <span style="color:red;">&nbsp; *</span>
                                         </label>
                                         <input type="text" id="weeklyDatePickerStart" placeholder="Select Date" class="form-control flatpickr-input active" readonly="readonly">
                                 </div>
                                   <div class="input-group">
                                         <label class="input-group-text ">
                                             <span>
                                                 Indicator End Date
                                             </span>                                             
                                         </label>
                                         <input type="text" id="weeklyDatePickerEnd" placeholder="Select Date" class="form-control flatpickr-input active" readonly="readonly">
                                 </div>
                             </div>  
                 
                </div>

        </div>

            
             
 
  </div>

      <%--Matrics Tab--%>
      <div class="tab-pane fade" id="nav-add-matrics">
          <div class="row"> 
              <div class="col-md-4">
                  <h6>KPIs</h6> 
              </div>

              <div class="col-md-8">
                  <div class="form-check form-switch" style="float: right;">
                     <input class="form-check-input" type="checkbox" role="switch" id="cbIsMatricInsertOn" >
                     <label class="form-check-label" for="cbIsMatricInsertOn" style="font-weight: bold;color: #c93434;">Add New Metrics</label>
                     </div>
              </div>
          </div>

          <div class="row">
              <div class="col-md-3">
                  <div class="accordion overFlowNavKpi" id="kpiAccordionKpiNMatrics"> </div>
              </div>

               <div class="col-md-9">
                <div class="row">
                  <div class="col mb-3">
                    <label for="txtName" class="form-label">Name</label>
                    <input type="text" id="txtName" class="form-control txtName" placeholder="Enter Indocator" disabled>
                  </div>

                  <div class="col mb-3">
                    <label for="txtEmpNum" class="form-label">Employee Number</label>
                    <input type="text" id="txtEmpNum" class="form-control txtEmpNum" placeholder="Enter Weightage" disabled>
                  </div>          
            </div> 

             <div class="row g-2">
                  <div class="col mb-0">   
                        <label for="txtOrg" class="form-label">Organization</label>
                         <input type="text" id="txtOrg" class="form-control txtOrg" placeholder="Enter Weightage" disabled>
                  </div>
                  <div class="col mb-0">   
                         <label for="defaultSelect" class="form-label">Department</label>
                          <input type="text" id="txtDepart" class="form-control txtDepart" placeholder="Enter Weightage" disabled>
                  </div>         
            </div>

            <div class="row" style="border-top: 2px solid; border-bottom: 2px solid; margin-top: 9px; padding: 2px;">
                    <div class="col-md-4 overClass"> <span style="font-weight: bold;">Indicator</span>      <div id="divIndicator"> </div> </div>
                    <div class="col-md-4 overClass"> <span style="font-weight: bold;">Taget </span>         <div id="divTarget"> </div> </div>
                    <div class="col-md-2"> <span style="font-weight: bold;">Weight </span>                  <div id="divWeight"> </div> </div>
                    <div class="col-md-2"> <span style="font-weight: bold;">Indicator Type</span>           <div id="divIndicatorType"> </div> </div>
           </div>

            <div class="row" style="padding: 11px;"> 
                    <div class="col-md-2"><h5 style="text-align:center; padding-top:36px;">Metrics</h5> </div>
                    <div class="col-md-10">
                       <textarea class="form-control" id="taMatric" rows="4" placeholder="Enter Metrics"></textarea> 
                    </div>                                                     
              </div>
            <div class="row" > 
                    <div class="col-md-4">
                        <div class="form-check form-switch" style="float: right;">
                        <input class="form-check-input" type="checkbox" role="switch" id="cbTarget" >
                        <label class="form-check-label" for="cbTarget">Target</label>
                        </div>
                    </div>
                    <div class="col-md-4"> 
                       <div class="form-check form-switch" style="float: right;">
                        <input class="form-check-input" type="checkbox" role="switch" id="cbAchievement" >
                        <label class="form-check-label" for="cbAchievement">Achievement</label>
                        </div>
                    </div>                                                     
              </div>
         
              <div class="row " style="margin-top:16px;">
                    <div class="col-md-2 divIsTargetFixbyAdmin hidden">
                          <input class="form-check-input cbIsTargetFixbyAdmin" type="checkbox" value="" id="cbIsTargetFixbyAdmin"  />
                          <label class="form-check-label " for="customCheckDanger">Is Fixed</label>
                    </div> 

                   <div class="col-md-4 divTargetValByAdmin hidden"> 
                       <input type="text" id="txtTarget" class="form-control txtTarget" placeholder="Enter Target" > 
                  </div>                   
             </div>

     </div>

          </div>
             
        <%-- <div class="nav-align-left">
            <ul class="nav nav-tabs" role="tablist" id="nav-ul-kpi" style="width:22%">
              <li class="nav-item">
                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-home">Home</button>
              </li>
              <li class="nav-item">
                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-profile">Profile</button>
              </li>
              
            </ul>
         <div class="tab-content" id="nav-tabcontent-kpi">
    <div class="tab-pane fade show active" id="navs-left-align-home">
      <p>
        Icing pastry pudding oat cake. Lemon drops cotton candy caramels cake caramels sesame snaps
        powder.
        Bear claw candy topping.
      </p>     
    </div>
    <div class="tab-pane fade" id="navs-left-align-profile">
      <p>
        Donut dragée jelly pie halvah. Danish gingerbread bonbon cookie wafer candy oat cake ice cream.
        Gummies halvah tootsie roll muffin biscuit icing dessert gingerbread. Pastry ice cream
        cheesecake
        fruitcake.
      </p>
  
    </div>
  
         </div>
     </div>
         
</div>--%>



  </div>
</div>

      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnSave">Save Indicator</button>
      </div>

    </div>


   



  </div>
</div>
</div>
</div>         
    <%--Pop up for view KPIS--%>

    <!-- Extra Large Modal -->
<div class="modal fade" id="viewKPIPopup" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="viewKPIPopupLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
          <div class="row">
              <div><h6>KPIs</h6></div>
              <div class="col-md-4">
                  <div class="accordion" id="kpiAccordionView">

           <%--      <div class="card accordion-item active">
                   <h2 class="accordion-header" id="headingOne">
                     <button type="button" class="accordion-button" data-bs-toggle="collapse" data-bs-target="#accordionOne" aria-expanded="true" aria-controls="accordionOne" role="tabpanel">
                       KPI 1
                     </button>
                   </h2>

                   <div id="accordionOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                     <div class="accordion-body">
                      <ul>
                          <li>Matrics 1</li>
                          <li>Matrics 2</li>
                      </ul>
                     </div>
                   </div>
                 </div>

           <div class="card accordion-item">
               <h2 class="accordion-header" id="headingTwo">
                 <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#accordionTwo" aria-expanded="false" aria-controls="accordionTwo" role="tabpanel">
                  KPI 2
                 </button>
               </h2>
               <div id="accordionTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                 <div class="accordion-body">
                   <ul>
                      <li>Matrics 1</li>
                      <li>Matrics 2</li>
                  </ul>
                 </div>
               </div>
         </div>--%>

        </div>
              </div>

              <div class="col-md-8">

                      <div  class="mdlbody-heng">
                                                        <h5 class="alignleft">MY KPI</h5>
                                                        <h5 class="alignright">SEPTEMBER 2022</h5>
                                                    </div>
                                                    <div style="clear: both;"></div>

                                                    <div class="row" style="padding-top: 25px;margin-left: 80%;">
                                                        <div class="col-sm-2">
                                                            <label class="col-form-label"  for="basic-default-name">YTD</label>
                                                        </div>
                                                        <div class="col-sm-8" style="float: right">
                                                            <input type="text" class="form-control" id="txtYTDView" placeholder="30%" />
                                                        </div>
                                                    </div>
                                                   
                                                    <div class="row" style="padding-top:25px">
                                                        <div style="width:14%">
                                                            <label class="col-form-label" for="basic-default-name">Indicators</label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                             <textarea id="txtIndicatorView" class="form-control"></textarea>                                                        
                                                        </div>

                                                        <div class="col-sm-1">
                                                            <label class="col-form-label" for="basic-default-name">Target</label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                             <textarea id="txtTargetView" class="form-control"></textarea>
                                                        
                                                        </div>

                                                         <div class="col-sm-1">
                                                            <label class="col-form-label" for="basic-default-name">Weight</label>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <input type="text" class="form-control" id="txtWeightView" />
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
                                                            <span id="basic-icon-default-message21" class="input-group-text"></span>
                                                            <textarea
                                                                id="basic-icon-default-message1"
                                                                class="form-control"
                                                                placeholder="Type your Comments…."
                                                               
                                                                aria-describedby="basic-icon-default-message2"></textarea>
                                                        </div>
                                                    </div>
              </div>

          </div>
          

      </div>
      <%--<div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>--%>
    </div>
  </div>
</div>

    <%--cop kpi popup--%>

     <div class="modal fade" id="copyKpiPopup" tabindex="-1" aria-hidden="true" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel3">Copy KPI</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col mb-3">
            <label for="nameLarge" class="form-label">Enter Employee Number of her/him you want to copy KPI for</label> <span style="color: red;"> *</span>
            <input type="text" id="txtEmpNumber" class="form-control" placeholder="Enter Employee Number">
              <label style="color:#e14b4b" class="searchedEmpName"></label>
          </div>
        </div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnConfirm">Confirm</button>
      </div>
    </div>
  </div>
</div>

    <%--end--%>

        <div class="modal fade" id="copyKPIConfirmPopup" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-md" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="approveconfirmmodalLabel2">Confirmation</h5>
        <%--<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
      </div>
      <div class="modal-body row">
        
          <div class="col-md-1"> <i class="bx bxs-info-square" style="color:forestgreen"></i> </div> 
          <div class="col-md-10 "><label class="copy-kpi-info-msg"></label></div>

      </div>

      
      <div class="modal-footer">
          <button type="button" class="btn btn-primary btn-yes-apporve-kpi">Yes</button>
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">No</button>
        
      </div>
    </div>
  </div>
</div>


    <%--confirmation pop up for delete KPi--%>
<div class="modal fade" id="delKpiConfirmPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
          <div><h3>Are you sure?</h3></div>
        Do you really want to delete this KPI? This process cannot be undone.
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-delete-kpi">Delete</button>
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

	
	<meta content="initial-scale=1, maximum-scale=1,
		user-scalable=0" name="viewport" />
	<meta name="viewport" content="width=device-width" />


    	<!-- Datatable plugin CSS file -->
    <link href="Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
	<!-- Datatable plugin JS library file -->	
    <script src="Datatable/js/jquery.dataTables.min.js"></script>
    
    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>



    <script src="Scripts/report-kpi-submit.js?v=1.8"></script>
    <script src="Flatpickr/js/flatpickr.js"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

</asp:Content>

