<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="KPIAdmin.aspx.cs" Inherits="KPI_KPIAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="Css/kpi.css?v=1.1" rel="stylesheet" />
    <link href="Flatpickr/css/_flatpickr.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
       <style type="text/css">
    
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
     /*.kpi-user-list-table th{
        background-color: #a92828 !important;
        color:white !important;
    }*/
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
/*.custom-loader{
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
}*/
.label-custom {
    color: #d4432c !important;
    font-weight: 400 !important;
    text-transform: capitalize;
        font-size: 0.85rem;
    /* padding-top: 3px; */
}

@media (min-width: 1200px){
.modal-xl {
    max-width: 1400px;
}
}
.active-ass{
    /*background-color:#e6eeff !important;*/
    background-color:#ffede6 !important;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">



        <div class="nav-align-top" style="margin: 7px 0px 0px 13px;">
  <ul class="nav nav-tabs ass-ul hidden" role="tablist">
    <li class="nav-item">
      <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-home" aria-controls="navs-top-home" aria-selected="true">Assigned KPIs List</button>
    </li>
    <li class="nav-item">
      <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-profile" aria-controls="navs-top-profile" aria-selected="false">Assign Assignment</button>
    </li>

      <li class="nav-item">
      <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-create-ass" aria-controls="navs-top-create-ass" aria-selected="false">Create Assignment</button>
    </li>
   
  </ul>
  <div class="tab-content" style="background:white;">
    <div class="tab-pane fade show active" id="navs-top-home" role="tabpanel"  style="margin-top: -15px;">
           <%--<div><h4 style="text-shadow: 1px 6px 13px; color: #a92828;">KPI - Admin </h4></div>--%> 
           <div><h4 style="color: #a92828; margin-top:13px;">Assigned KPIs to Employees List </h4></div> 
          <div class="card-body" style="margin-top: -2%; zoom: 90%;">

      <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

                          <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label8" Text="Organization" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <%--<asp:DropDownList ID="ddlCompany" runat="server" Font-Names="tahoma" CssClass="form-select color-dropdown" AutoPostBack="true" />--%>
                              <select id="ddlOrg" class="form-select color-dropdown"> </select>
                          </td>


                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label10" Text="Department" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlDepart"> </select>
                              <%--<asp:DropDownList ID="ddlManager" runat="server" Font-Names="tahoma" CssClass="form-select color-dropdown" AutoPostBack="true" />--%>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label11" Text="Division" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <%--<asp:DropDownList ID="ddlSalesman" runat="server" Font-Names="tahoma" CssClass="form-select color-dropdown" />--%>
                              <select class="form-select placement-dropdown" id="ddlDivision"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                        
                   
                          <td class="no-border" style="width: 5%">

                              <%--<asp:LinkButton ID="btnSearch" runat="server" Text="Search"
                                  CssClass="btn btn-primary d-block" Font-Size="Small"></i>Search</asp:LinkButton>--%>
                              <input type="button" id="btnSearchDashBoard" value="Search" class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>
                      </tr>
                  </table>
      </div>


       <%-- <div class="ajax-loader custom-loader hidden">
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
       <th>organization</th>

        <th style="width: 10%;">Actions</th>
      </tr>
    </thead>
    <tbody class="tbody-employees">

    </tbody>
  </table>
</div>




    </div>

    </div>
    <div class="tab-pane fade" id="navs-top-profile" role="tabpanel" style="min-height:180px;">
     
        <div><h4 style="color: #a92828; margin-top:13px;">Assign Assigment(s) </h4></div> 
          <div class="card-body" style="margin-top: -2%; zoom: 90%;">

              <div class="row">
                  <div class="col-4"></div>
                  <div class="col-4"></div>
                  <div class="col-4"></div>
              </div>

          </div>
    </div>
      <div class="tab-pane fade" id="navs-top-create-ass" role="tabpanel" style="min-height:180px;margin-top:-4px">
     
        <div><h4 style="color: #a92828; margin-top:13px;">Create Assigment </h4></div> 

          <div class="card-body row" style="zoom: 90%;">
                                       
                    <div class="" style="width:25%;">
                                    <div style="margin-top: 1px;"> 
                                        <label><i class="bx bx-search-alt-2" style="margin-top: -7px; font-size: 26px;color:#7fa3ff;"></i></label>
                                        <select id="ddlAssTypeFilter" class="form-select color-dropdown" style="z-index: 99;" multiple> <option value="GLOBAL" selected="selected">Global</option>
                                                <option value="COMPANY" selected="selected">Company</option>
                                                <option value="DEPARTMENT" selected="selected">Department</option> </select>
                                         <a href="#" class="btn btn-primary pull-right btn-add-ass-grid" style="padding: 0.4075rem 0.55rem;"> <i class="bx bx-file" aria-hidden="true"></i>&nbsp; Add Assignment</a>
                                    </div>
                                    
                            <div class="table-responsive" style="overflow-y: hidden;width: 100%;padding-top: 10px;">
                                         <table class="table assignment-list-table" style="width: 100%;margin-top: 11px;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr>
                                                  <th>ACTION </th> 
                                                 <th style="padding-right: 185px;">Name</th>
                                                 <th>Code</th>                                                 
                                               <th>Type</th>
                                               <th>Department</th>
                                               <th>company</th>
                                               <th>Status</th>
                                               <th>Created by </th>
                                                 <th>CREATED DATE </th>                                                  
                                                                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-assignment-list">

                                           </tbody>
                                         </table>
                          </div>

                   </div>

              <div style="width:75%;border-left:3px solid #a7b6a724; margin-top:-60px;">
                  <div class="row">
                      <h4 style="color: #a92828; margin-top:13px;">KPIs List </h4>
                      <span style="margin-top: -39px;"><a href="#" class="btn btn-primary pull-right btn-add-kpi-grid" style="padding: 0.4075rem 0.55rem;"> <i class="bx bx-tachometer"></i>&nbsp; Add KPI</a></span>
                  </div>

                     <div class="table-responsive" style="overflow-y: hidden;width: 100%;padding-top: 10px;">
                                         <table class="table kpis-list-table" style="width: 100%;margin-top: 11px;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr>
                                                 <th style="background: #d54832 !important;">Select</th>
                                                  <th>KPI Code </th> 
                                                 <th style="padding-right: 185px;">KPI Name</th>
                                                 <th>Description</th>                                                 
                                               <th>Type</th>
                                               <th>Status</th>                                               
                                               <th>Created by </th>
                                                 <th>CREATED DATE </th>                                                  
                                                 <th>Action </th>                                                  
                                                                                 
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-kpis-list">

                                           </tbody>
                                         </table>
                          </div>
              </div>
              

          </div>
    </div>
   
  </div>
</div>








</div>   <%--parent div end--%>
  
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
                                                 <%--<option value="Exceed">Exceed</option>--%>
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
                    <div class="col-md-4 overClass"> <span style="font-weight: bold;">Target </span>         <div id="divTarget"> </div> </div>
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


    <%--Create Assignment Modal--%>
    <div class="modal fade" id="addAssModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addAssModalLabel4">Create Assignment</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       

          <div class="row">
                  <div class="col-3">

                      <div class=""> <label for="html5-number-input" class="col-form-label label-custom">Assignment Type</label>
                            <div class="">
                                 <select id="ddlAssType" class="form-select color-dropdown" >                                                
                                                <option value="GLOBAL">Global</option>
                                                <option value="COMPANY">Company</option>
                                                <option value="DEPARTMENT">Department</option>
                                            </select>
                            </div>
                   </div>


                            <label for="html5-number-input" class="col-form-label label-custom">Assignment Name </label>
                            <div class="" style="width:208%;">
                                <input type="text" id="txtAssName" class="form-control" placeholder="Enter Assignment Name" />
                            </div>
                  </div>

                  <div class="col-3">
                              <label for="html5-number-input" class="col-form-label label-custom">Assignment Code </label>
                              <div class="">
                                  <input type="text" id="txtAssCode" class="form-control" placeholder="Enter Assignment Code eg => KA-SE" />
                              </div>
                  </div>
                  <div class="col-6">
                             <label class="col-form-label label-custom" for="basic-default-name">Assignment Description<span style="color: red;">*</span></label>
                              <div>
                                  <textarea class="form-control" id="taAssDesc" rows="4" placeholder="Enter Assignment Description"></textarea>
                              </div>
                  </div>
                 
              </div>

              <div class="row" style="margin-top: 20px;">                   
                   
                  <div class="col-6 comp-div"> 
                      <label for="html5-number-input" class="col-form-label label-custom">Company Name </label>
                            <div class="">
                                <input class="form-control" type="text" placeholder="Enter Company Name" value="" id="txtCompany">
                            </div>
                  </div>

                  <div class="col-6 depart-div"> 
                      <label for="html5-number-input" class="col-form-label label-custom">Department Name </label>
                            <div class="">
                                <input type="text" id="txtDepartment" class="form-control" placeholder="Enter Department Name" />
                            </div>
                   </div>             
                   
                  
              </div>



      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnAddAss">Create</button>
      </div>
    </div>
  </div>
</div>

    
    <%--KPI Master Popup For new KPI changes--%>



    <!-- Extra Large Modal -->
<div class="modal fade" id="KPIPopupEmployee1" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #296881;">
        <h5 class="modal-title" id="KPIPopupEmployeeLabel1" style="color:white">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
     
 <div class="modal-body">

  <div class="nav-align-top" id="nav-kpi1">
       <ul class="nav nav-tabs" role="tablist">
          <li class="nav-item">
            <button type="button" class="nav-link nav1 active" role="tab" data-bs-toggle="tab" data-bs-target="#nav-add-kpi1">Add Indicator</button>
          </li>
          <li class="nav-item">
            <button type="button" class="nav-link nav2" role="tab" data-bs-toggle="tab" data-bs-target="#nav-add-matrics1">Add Metrics</button>
          </li>
 
       </ul>

  <div class="tab-content">

      <%--Indicator tab--%>
         <div class="tab-pane fade show active" id="nav-add-kpi1">
          
          <div class="row">

                 <div class="col-md-3">
                     <%--<div class="" id="kpiAccordianPopup">    </div>--%>
                     
                     <div class="nav-align-left" id="nav-kpi-only1">
                             <ul class="nav nav-tabs" role="tablist" id="nav-kpi-only-ul1" style="min-width: 100% !important;">
                             
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
                                              <i class="fa fa-trash fa-del-kpi1" title="Delete KPI" style="cursor:pointer; padding-right: 10px;font-size: x-large;color: #e14b4b;"></i>   </div>
                                  <div class="col-md-10">
                                      <div class="form-check form-switch" style="float: right;">
                                      <input class="form-check-input" type="checkbox" role="switch" id="cbIsKpiInsertOn1" >
                                      <label class="form-check-label" for="cbTarget" style="font-weight: bold;color: #c93434;">Add New KPI</label>
                                      </div>
                                  </div>
                             </div>
                            <div class="row">
                                <div class="col mb-3">
                                  <label for="nameExLarge" class="form-label">Indicator <span style="color:red;">&nbsp; *</span></label>
                                  <%--<input type="text" id="txtIndicator" class="form-control" placeholder="Enter Indicator">--%>
                                <textarea class="form-control" id="txtIndicator1" rows="4" placeholder="Enter Indicator"></textarea>

                                </div>
                                 <div class="col mb-0">   
                                         <label for="taTargetDesc" class="form-label">Target Description</label>
                                         <textarea class="form-control" id="taTargetDesc1" rows="4" placeholder="Enter Target Description"></textarea>
                                   </div>
                               
                           </div>

                              <div class="row g-2">
                                <div class="col mb-3">
                                    <label for="nameExLarge" class="form-label">Weightage <span style="color:red;">&nbsp; *</span></label>
                                    <input type="text" id="txtWeightage1" class="form-control" placeholder="Enter Weightage" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                </div>

                                  <div class="col mb-0">   
                                          <label for="defaultSelect" class="form-label">Indicator Category</label>
                                             <select id="ddlKpiCategory" class="form-select">                              
                                              <option value="GLOBAL" selected>Global</option>
                                                <option value="COMPANY">Company</option>
                                                <option value="DEPARTMENT">Department</option>
                                             </select>
                                   </div>

                                   <div class="col mb-0">   
                                          <label for="defaultSelect" class="form-label">Indicator Type</label>
                                             <select id="ddlIndicatorType1" class="form-select">                              
                                               <option value="Percentage" selected>Percentage</option>
                                               <option value="Numeric">Numeric</option>
                                                  <option value="Rating">Rating</option>
                                                 <option value="Complaint">Complaint</option>
                                             </select>
                                       <div class="divtxtComplaint1 hidden">  <span style="color:red; float: right;">&nbsp; *</span> <input type="text" id="txtComplaint1" class="form-control" placeholder="Enter Reduce Value" style=" width: 50%; float: right; margin-top: 6px;" onkeypress='return event.charCode >= 48 && event.charCode <= 57'></div>
                                   </div>  

                               <%--   <div class="input-group">
                                         <label class="input-group-text ">
                                             <span>
                                                 Indicator Start Date
                                             </span>
                                             <span style="color:red;">&nbsp; *</span>
                                         </label>
                                         <input type="text" id="weeklyDatePickerStart1" placeholder="Select Date" class="form-control flatpickr-input active" readonly="readonly">
                                 </div>
                                   <div class="input-group">
                                         <label class="input-group-text ">
                                             <span>
                                                 Indicator End Date
                                             </span>                                             
                                         </label>
                                         <input type="text" id="weeklyDatePickerEnd1" placeholder="Select Date" class="form-control flatpickr-input active" readonly="readonly">
                                 </div>--%>
                             </div>  
                 
                </div>

        </div>

            
             
 
  </div>

      <%--Matrics Tab--%>
      <div class="tab-pane fade" id="nav-add-matrics1">
          <div class="row"> 
              <div class="col-md-4">
                  <h6>KPIs</h6> 
              </div>

              <div class="col-md-8">
                  <div class="form-check form-switch" style="float: right;">
                     <input class="form-check-input" type="checkbox" role="switch" id="cbIsMatricInsertOn1" >
                     <label class="form-check-label" for="cbIsMatricInsertOn" style="font-weight: bold;color: #c93434;">Add New Metrics</label>
                     </div>
              </div>
          </div>

          <div class="row">
              <div class="col-md-3">
                  <div class="accordion overFlowNavKpi" id="kpiAccordionKpiNMatrics1"> </div>
              </div>

               <div class="col-md-9">
                <div class="row">
                  <div class="col mb-3">
                    <label for="txtName1" class="form-label">Name</label>
                    <input type="text" id="txtName1" class="form-control txtName" placeholder="Enter Indocator" disabled>
                  </div>

                  <div class="col mb-3">
                    <label for="txtEmpNum1" class="form-label">Employee Number</label>
                    <input type="text" id="txtEmpNum1" class="form-control txtEmpNum" placeholder="Enter Weightage" disabled>
                  </div>          
            </div> 

             <div class="row g-2">
                  <div class="col mb-0">   
                        <label for="txtOrg1" class="form-label">Organization</label>
                         <input type="text" id="txtOrg1" class="form-control txtOrg" placeholder="Enter Weightage" disabled>
                  </div>
                  <div class="col mb-0">   
                         <label for="defaultSelect1" class="form-label">Department</label>
                          <input type="text" id="txtDepart1" class="form-control txtDepart" placeholder="Enter Weightage" disabled>
                  </div>         
            </div>

            <div class="row" style="border-top: 2px solid; border-bottom: 2px solid; margin-top: 9px; padding: 2px;">
                    <div class="col-md-4 overClass"> <span style="font-weight: bold;">Indicator</span>      <div id="divIndicator1"> </div> </div>
                    <div class="col-md-4 overClass"> <span style="font-weight: bold;">Target </span>         <div id="divTarget1"> </div> </div>
                    <div class="col-md-2"> <span style="font-weight: bold;">Weight </span>                  <div id="divWeight1"> </div> </div>
                    <div class="col-md-2"> <span style="font-weight: bold;">Indicator Type</span>           <div id="divIndicatorType1"> </div> </div>
           </div>

            <div class="row" style="padding: 11px;"> 
                    <div class="col-md-2"><h5 style="text-align:center; padding-top:36px;">Metrics</h5> </div>
                    <div class="col-md-10">
                       <textarea class="form-control" id="taMatric1" rows="4" placeholder="Enter Metrics"></textarea> 
                    </div>                                                     
              </div>
            <div class="row" > 
                    <div class="col-md-4">
                        <div class="form-check form-switch" style="float: right;">
                        <input class="form-check-input" type="checkbox" role="switch" id="cbTarget1" >
                        <label class="form-check-label" for="cbTarget">Target</label>
                        </div>
                    </div>
                    <div class="col-md-4"> 
                       <div class="form-check form-switch" style="float: right;">
                        <input class="form-check-input" type="checkbox" role="switch" id="cbAchievement1" >
                        <label class="form-check-label" for="cbAchievement">Achievement</label>
                        </div>
                    </div>                                                     
              </div>
         
              <div class="row " style="margin-top:16px;">
                    <div class="col-md-2 divIsTargetFixbyAdmin1 hidden">
                          <input class="form-check-input cbIsTargetFixbyAdmin1" type="checkbox" value="" id="cbIsTargetFixbyAdmin1"  />
                          <label class="form-check-label " for="customCheckDanger">Is Fixed</label>
                    </div> 

                   <div class="col-md-4 divTargetValByAdmin1 hidden"> 
                       <input type="text" id="txtTarget1" class="form-control txtTarget" placeholder="Enter Target" > 
                  </div>                   
             </div>

     </div>

          </div>
           
  </div>
</div>

      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnSave1">Save Indicator</button>
      </div>

    </div>


  </div>
</div>
</div>
</div> 


               <%--confirmation pop up for delete KPi--%>
<div class="modal fade" id="delKpiConfirmPopup1" style="background: #f0f8ff5c;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
     
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-x-circle fa-del-kpi1" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
          <div><h3>Are you sure?</h3></div>
        Do you really want to delete this KPI? This process cannot be undone.
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-delete-kpi1">Delete</button>
          </div>
      </div>
    </div>
  </div>
</div>
        <%--DELETE CONFIMATION MODAL FOR ASSIGNMENT--%>
        <div class="modal fade" id="deleteAssConfirmModal" style="background-color:#00000070;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
          <div><h3>Are you sure?</h3></div>
        <span class="cAssSentence">Do you want to delete the Assignment? </span> 
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-del-ass-yes" data-bs-dismiss="modal">Delete</button>
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

    <script src="Scripts/kpi-admin.js?v1.7"></script>
    <script src="Flatpickr/js/flatpickr.js"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <link href="../Dashboard/assets/multiselect/example-styles.css" rel="stylesheet" />
    <script src="../Dashboard/assets/multiselect/jquery.multi-select.js"></script>
</asp:Content>

