<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="PropertyMaster.aspx.cs" Inherits="FacilityManagementNew_PropertyMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
       
         .Units-list-table th {
            background-color: #d54832 !important;
            color: white !important;
        }

        .Units-list-table td {
            color: #333333 !important;
        }

        .table-contract-details th {
            background-color: #d54832 !important;
            color: white !important;
        }

        .table-contract-details td {
            color: #333333 !important;
        }

        .WODailySummary-table th{

            background-color: #d54832 !important;
            color: white !important;
        }

        .WODailySummary-table td{

           color: #333333 !important;
        }


        .WorkOrder-UnderUnits th
        {
            background-color: #d54832 !important;
            color: white !important;
        }

        .WorkOrder-UnderUnits  td {
            color: #333333 !important;
        }

        .table-AllproblemsUnderWO th
        {
            background-color: #d54832 !important;
            color: white !important;
        }

         .table-AllproblemsUnderWO  td
         {
             color: #333333 !important;
         }

        .table-WOrequest-UnderUnit th
        {
            background-color: #d54832 !important;
            color: white !important;
        }

        
        .table-WOrequest-UnderUnit td {
            color: #333333 !important;
        }

        .table-requstActions th {
            background-color: #d54832 !important;
            color: white !important;
        }

        .table-requstActions td {
            color: #333333 !important;
        }

        
        .pending-units-table th {
            background-color: #d54832 !important;
            color: white !important;
        }

        .pending-units-table td {
            color: #333333 !important;
        }

        .rejected-units-table th{
             background-color: #d54832 !important;
            color: white !important;
        }

         .rejected-units-table td {
            color: #333333 !important;
        }

        .property-list-table th {
            background-color: #d54832 !important;
            color: white !important;
        }

        .property-list-table td {
            color: #333333 !important;
        }

        .iconClassExcel {
            margin-left: 8px;
            /*background:#933737;*/
            color: #d54832;
            background-color: #ffffff;
            border: #f9bfa8 1px solid;
            box-shadow: 0 0.125rem 0.25rem 0 rgba(133, 146, 163, 0.4);
        }

            .iconClassExcel:hover {
                background: #a54141;
            }

            .iconClassExcel:hover {
                /*background:#a54141;*/
                background: #d54832;
            }

        #DataTables_Table_0_paginate .current {
            color: white !important;
            background: #d54832  !important;
        }

        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: white !important;
            background: #d54832;
            border-color: #fff;
        }
        
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div class="card-body" style="margin-top: -1%; min-height: 85vh;">
            <%--<h2 style="padding:3px"></h2>--%>


            <h4 style="color: #a92828; margin-top: 13px">Property Details  </h4>
            <%--Child Tab--%>
            <div class="nav-align-top row">
                <ul class="nav nav-tabs" id="propery-tabs-ul"  role="tablist">

                     <li class="nav-item">
                        <button type="button" class="nav-link active pendingunits" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-pendingUnits">Pending Units</button>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="nav-link  approvedunits" role="tab" data-bs-toggle="tab"  data-bs-target="#navs-top-my-project"> Approved Units</button>
                    </li>
                    
                    <li class="nav-item">
                        <button type="button" class="nav-link rejectedunits" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-rejectedUnits">Rejected Units </button>
                    </li>

                </ul>

                <div>
                    <a href="#" class="btn btn-primary pull-right btn-add-proj-grid" data-bs-toggle="modal" data-bs-target="#ModalAddItems" style="display: none;"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Properties</a>
                </div>
                <div class="tab-content">

                    

                    <%-- 1st --%>

                    <div class="tab-pane fade show active" id="navs-top-pendingUnits">

                        <div class="" style="margin-top: 0%;">
                            <table class="table pending-units-table" style="width: 100%;">
                                
                                <thead>
                                    <tr>
                                        <th style="display:none">RoomID</th>
                                        <th>Room Code</th>
                                        <th>Room Name</th>
                                        <th>Floor Name</th>
                                        <th>Block Name</th>       
                                                                             
                                        <th>BuildUp Area SqFt</th>
                                        <th>Balcony Area SqFt</th>
                                        <th>Total Area SqFt</th>
                                        <th>Action</th>
                                     
                                    </tr>
                                </thead>
                                <tbody class="tbody-pending-units">
                                </tbody>
                            </table>
                        </div>

                    </div>


                    <%-- 2nd --%>

                    <div class="tab-pane fade" id="navs-top-my-project">

                        <%--<div>
                            <a href="#" class="btn btn-primary pull-right btn-add-proj-grid" data-bs-toggle="modal" data-bs-target="#ModalAddItems" style="display:none;"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Properties</a>
                        </div>--%>

                        <div class="" style="margin-top: 0%;">
                            <table class="table Units-list-table" style="width: 100%;">
                                <%--<caption class="ms-4">List of Projects</caption>--%>
                                <thead>
                                    <tr>
                                        <th style="display:none">RoomID</th>
                                        <th>Room Code</th>
                                        <th>Room Name</th>
                                        <th>Floor Name</th>
                                        <th>Block Name</th>       
                                                                          
                                        <th>BuildUp Area SqFt</th>
                                        <th>Balcony Area SqFt</th>
                                        <th>Total Area SqFt</th>
                                        <th>Action</th>
                                        

                                    </tr>
                                </thead>
                                <tbody class="tbody-Unit-list">
                                </tbody>
                            </table>
                        </div>

                    </div>

                    <%-- 3rd --%>

                     <div class="tab-pane fade" id="navs-top-rejectedUnits">

                        <div class="" style="margin-top: 0%;">
                            <table class="table rejected-units-table" style="width: 100%;">
                                
                                <thead>
                                    <tr>
                                        <th style="display:none">RoomID</th>
                                        <th>Room Code</th>
                                        <th>Room Name</th>
                                        <th>Floor Name</th>
                                        <th>Block Name</th>       
                                                                             
                                        <th>BuildUp Area SqFt</th>
                                        <th>Balcony Area SqFt</th>
                                        <th>Total Area SqFt</th>
                                        <th>Action</th>
                                     
                                    </tr>
                                </thead>
                                <tbody class="tbody-rejected-units">
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>
            </div>



            <div class="ajax-loader custom-loader hidden">
                <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
                <h4>Please wait...</h4>
            </div>


        </div>
    </div>

 

    
    <%--  Property Blook   --%>


        <div class="modal fade" id="ModalAddItems" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <%--<h5 class="modal-title" id="lbladditems">Create New Property</h5>--%>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body proj-popup">


                        

                        <div id="divproperty"  style="background: #e14f0c17; padding: 15px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">

                            <div class="row">
                                <h6 class="prpmdl-hed" id="lbladditemsa">Property Details</h6>
                            <div class="col-4">
                               
                                <div>
                                       <div>
                                            <select id="ddlAllpropertys" class="form-select color-dropdown">                                               
                                                
                                            </select>
                                        </div>
                                </div>

                            </div>

                            <div class="col-1">
                                  
                                 <span class="btn pull-right addproperty" >
                                     <img src="../Template/Images/Icons/addicon.png" style="width: 24px;cursor:pointer;height: 21px;"/> 
                                 </span>
                                    
                               
                            </div>

                        </div>

                            <div class="row">


                                <div class="col-3">
                                    <label for="html5-number-input" class="col-form-label label-custom">Property Code <span style="color: red;">*</span></label>
                                    <div>
                                        <input type="text" id="txtprtyCode" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                    </div>
                                </div>

                                <div class="col-3">
                                    <label for="html5-number-input" class="col-form-label label-custom">Property Name<span style="color: red;">*</span></label>
                                    <div>
                                        <input type="text" id="txtprptyname" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57">
                                    </div>
                                </div>

                                <div class="col-3">
                                    <label for="html5-number-input" class="col-form-label label-custom">Location <span style="color: red;">*</span></label>
                                    <div>
                                        <div>
                                            <input type="text" id="txtprtylocation" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                        </div>
                                    </div>
                                </div>

                                <div class="col-3">
                                    <label for="html5-number-input" class="col-form-label label-custom">Address <span style="color: red;">*</span></label>
                                    <div>
                                        <div>
                                            <input type="text" id="txtprtyaddress" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                        </div>
                                    </div>
                                </div>

                            </div>

                           

                        </div>


                         <div id="divblock"  style="background: #e14f0c17; padding: 15px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">
                                 <div class="row">
                                     <h6 class="prpmdl-hed" id="lbladdBloockdetails">Block Details</h6>
                                         <div class="col-4">

                                             <div>
                                                 <select id="ddlAllblock" class="form-select color-dropdown">
                                                      <option value="Not Applicable"> Active</option>
                                                 </select>
                                             </div>

                                         </div>

                                         <div class="col-1">

                                            <%-- <span class="btn  pull-right addproperty" data-bs-toggle="modal" data-bs-target="#ModalAddblook">
                                                 <img src="../Template/Images/Icons/addicon.png"
                                                     style="width: 24px; cursor: pointer; height: 21px;" /></span>--%>

                                              <span class="btn pull-right addblock" > <img src="../Template/Images/Icons/addicon.png" style="width: 24px;cursor:pointer;height: 21px;"/>  </span>

                                             
                                         </div>

                                     <div class="col-3">
                                         <label for="html5-number-input" class="col-form-label label-custom">BlockCode <span style="color: red;">*</span></label>
                                         <div>
                                             <input type="text" id="txtblkcode" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                         </div>
                                     </div>

                                      <div class="col-3">
                                         <label for="html5-number-input" class="col-form-label label-custom">Location <span style="color: red;">*</span></label>
                                         <div>
                                             <input type="text" id="textblklocation" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                         </div>
                                     </div>

                                      <div style="display:none" class="col-3">
                                         <label for="html5-number-input" class="col-form-label label-custom">Location <span style="color: red;">*</span></label>
                                         <div>
                                             <input type="text" id="txtblockname" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                         </div>
                                     </div>

                            
                                </div>
                          </div>
                         <div id="divfloor"  style="background: #e14f0c17; padding: 15px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">
                             <div class="row">

                                 <h6 class="prpmdl-hed" id="lbladdfloordlts">Floor Details </h6>
                                 <div class="col-4">

                                     <div>
                                         <select id="ddlAllfloor" class="form-select color-dropdown">

                                              <option value="-2 " selected> NOT APPLICABLE </option>
                                             
                                         </select>
                                     </div>

                                 </div>

                                 <div class="col-1">

                                     <%--<a href="#" class="btn  pull-right addproperty" data-bs-toggle="modal" data-bs-target="#ModalAddfloor">
                                         <img src="../Template/Images/Icons/addicon.png"
                                             style="width: 24px; cursor: pointer; height: 21px;" /></a>--%>
                                      <span class="btn pull-right addfloor" > <img src="../Template/Images/Icons/addicon.png" style="width: 24px;cursor:pointer;height: 21px;"/>  </span>


                                 </div>

                                 <div class="col-3">
                                     <label for="html5-number-input" class="col-form-label label-custom">Floor Code <span style="color: red;">*</span></label>
                                     <div>
                                         <input type="text" id="txtfloorcodebasc" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                     </div>
                                 </div>

                                   <div class="col-3" style="display:none">
                                     <label for="html5-number-input" class="col-form-label label-custom">Floor Id <span style="color: red;">*</span></label>
                                     <div>
                                         <input type="text" id="txtfloorId" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                     </div>
                                 </div>

                                 <div class="col-3" style="display:none">
                                     <label for="html5-number-input" class="col-form-label label-custom">Floor Name <span style="color: red;">*</span></label>
                                     <div>
                                         <input type="text" id="txtfloorName" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                     </div>
                                 </div>

                                   <div class="col-3">
                                     <label for="html5-number-input" class="col-form-label label-custom">Description <span style="color: red;">*</span></label>
                                     <div>
                                         <input type="text" id="txtfloordesc" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                     </div>
                                 </div>

                             </div>
                         </div>


                        <div id="divunitdetails"  style="background: #e14f0c17; padding: 15px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">

                            <div class="row">

                                <h6 class="prpmdl-hed" id="lblunitdetails">Unit Details</h6>
                            
                            </div>

                            <div class="row">


                                <div class="col-2">
                                    <label for="html5-number-input" class="col-form-label label-custom">Unit Code <span style="color: red;">*</span></label>
                                    <div>
                                        <input type="text" id="txtroomcode" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                    </div>
                                </div>

                                <div class="col-2">
                                    <label for="html5-number-input" class="col-form-label label-custom">Unit Number<span style="color: red;">*</span></label>
                                    <div>
                                        <input type="text" id="txtRoomName" class="form-control" >
                                    </div>
                                </div>

                                

                                <div class="col-2">
                                    <label for="html5-number-input" class="col-form-label label-custom">Unit Category <span style="color: red;">*</span></label>
                                    <div>
                                        <div>
                                            <input type="text" id="textunitcategory" class="form-control" />

                                        </div>
                                    </div>
                                </div>

                                <div class="col-3">
                                    <label for="html5-number-input" class="col-form-label label-custom">Electricity Account No.<span style="color: red;">*</span></label>
                                    <div>
                                        <div>
                                            <input type="text" id="textelectricityaccnt" class="form-control"  />

                                        </div>
                                    </div>
                                </div>
                                

                                <div class="col-3">
                                    <label for="html5-number-input" class="col-form-label label-custom">Chiller Account No. <span style="color: red;"></span></label>
                                    <div>
                                        <div>
                                            <input type="text" id="textchilleraccnt" class="form-control"  />

                                        </div>
                                    </div>
                                </div>

                            </div>


                            <div class="row">


                            </div>


                            <div class="row">

                                
                                <div class="col-3">
                                    <label for="html5-number-input" class="col-form-label label-custom">Property Usage<span style="color: red;">*</span></label>
                                    <div>
                                         <select id="ddlpropertyusage" class="form-select color-dropdown">    
                                               <option> ---Select---</option>
                                                <option value="Commercial " selected> Commercial </option>
                                                <option value="Residential">  Residential</option>
                                               
                                            </select>

                                    </div>
                                </div>

                              
                                <div class="col-3">
                                    <label for="html5-number-input" class="col-form-label label-custom">BuildUp Area SqFt <span style="color: red;">*</span></label>
                                    <div>
                                        <div>
                                            <input type="text" id="textbuldupsqrt" class="form-control"  />

                                        </div>
                                    </div>
                                </div>
                                

                                <div class="col-2">
                                    <label for="html5-number-input" class="col-form-label label-custom">Balcony Area SqFt <span style="color: red;">*</span></label>
                                    <div>
                                        <div>
                                            <input type="text" id="textbalconysqrt" class="form-control"  />

                                        </div>
                                    </div>
                                </div>

                                  <div class="col-2">
                                    <label for="html5-number-input" class="col-form-label label-custom">Total Area SqFt <span style="color: red;">*</span></label>
                                    <div>
                                        <div>
                                            <input type="text" id="texttotelsqrt" class="form-control"  />

                                        </div>
                                    </div>
                                </div>
                                 <div class="col-2">
                                    <label for="html5-number-input" class="col-form-label label-custom">Parking Number <span style="color: red;">*</span></label>
                                    <div>
                                        <div>
                                            <input type="text" id="textNoOfparking" class="form-control"  />

                                        </div>
                                    </div>
                                </div>
                               

                            </div>




                            

                           

                        </div>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btnAddProj1"  runat="server" data-bs-dismiss="modal" onclick="addUnit()">Create</button>
                    </div>
                </div>
            </div>
        </div>


    <%-- end --%>
    
      <%-- Modal For Property Creation --%>

        <div class="modal fade" id="ModalAddProperty" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="lbladdproperty">Create New Property</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body proj-popup">


                        <div class="row">
                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">Property Code <span style="color: red;">*</span></label>
                                <div class="">
                                    <input type="text" id="txtProperyCode"  class="form-control" disabled style="background: white;" >
                                </div>
                            </div>

                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">Plot Number <span style="color: red;">*</span></label>
                                <div class="">
                                    <input type="text" id="txtplotnumber" class="form-control"  />

                                </div>
                            </div>

                             <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">Location <span style="color: red;">*</span></label>
                                <div class="">
                                    <input type="text" id="propLocation" class="form-control"  />

                                </div>
                            </div>

                        </div>



                        <div class="row">
                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">Type <span style="color: red;">*</span></label>
                                <div>
                                       <div>
                                            <select id="ddlPopType" class="form-select color-dropdown">                                               
                                                
                                            </select>
                                        </div>
                                </div>


                              


                                <label class="col-form-label label-custom" for="basic-default-name">Status</label>
                                <div>
                                      <select id="ddlstatus" class="form-select color-dropdown">    
                                               <option> ---Select---</option>
                                                <option value="Active" selected> Active</option>
                                                <option value="Inactive">  Inactive</option>
                                               
                                            </select>
                                </div>
                            </div>

                            <div class="col-4">
                                <label class="col-form-label label-custom" for="basic-default-name"> Building Name</label>
                                <div>
                                    <input type="text" id="txtName" class="form-control"  />
                                </div>


                                <label class="col-form-label label-custom" for="basic-default-name">Ownership</label>
                                <div>
                                      <select id="ddlOwnership" class="form-select color-dropdown">                                               
                                                <option> ---Select---</option>
                                                <option value="Owned" selected> Owned</option>
                                                <option value="Rented">  Rented</option>
                                            </select>
                                </div>
                            </div>

                            <div class="col-4">
                                <label class="col-form-label label-custom" for="basic-default-name">Address <span style="color: red;">*</span></label>
                                <div>
                                    <textarea class="form-control" id="propAddress" rows="4" placeholder="Enter The Property Address"></textarea>
                                </div>
                            </div>

                            
                        </div>



                        <div class="row">
                           

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">No.Unit <span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="txtNumOfUnit" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">No.Of Floor <span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="txtNumOfFloor" class="form-control"onkeypress="return event.charCode >= 48 && event.charCode <= 57">
                                    
                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Number Of Room <span style="color: red;">*</span></label>
                                <div>
                                    <div>
                                            <input type="text" id="txtnumOfRoom" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                        </div>
                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Number Of Parking <span style="color: red;">*</span></label>
                                <div>
                                    <div>
                                            <input type="text" id="txtnumberofParking" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                        </div>
                                </div>
                            </div>

                             <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">PlotArea <span style="color: red;">*</span></label>
                                <div>
                                    <div>
                                            <input type="text" id="txtplotarea" class="form-control" />

                                        </div>
                                </div>
                            </div>

                             <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">PremiseNo <span style="color: red;">*</span></label>
                                <div>
                                   <input type="text" id="txtPremiseNo" class="form-control" />

                                </div>
                            </div>

                        </div>

                           <div class="row">
                           

                           

                             <%--<div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Minimum Rent <span style="color: red;">*</span></label>
                                <div>
                                    <div>
                                            <input type="text" id="txtMinRent" class="form-control" />

                                        </div>
                                </div>
                            </div>--%>

                              <%--<div class="col-3">
                                <label for="html5-number-input" class="col-form-label label-custom">Maximum Rent <span style="color: red;">*</span></label>
                                <div>
                                   <input type="text" id="txtmaxRent" class="form-control" />

                                </div>
                            </div>--%>

                        </div>
                     
                        <div class="row">
                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">LandlordsName <span style="color: red;">*</span></label>
                                <div>
                                    <div>
                                            <input type="text" id="txtlandlordsName" class="form-control" />

                                        </div>
                                </div>
                            </div>

                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">LandlordsEmail <span style="color: red;">*</span></label>
                                <div>
                                   <input type="text" id="txtlandlordsemail" class="form-control" />

                                </div>
                            </div>

                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">LandlordsPhone <span style="color: red;">*</span></label>
                                <div>
                                     
                                <input type="text" id="txtlandlordsphone" class="form-control" />
                                    
                                </div>
                            </div>

                        </div>


                        


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btnAddProj" runat="server" data-bs-dismiss="modal" onclick="addProperty()">Create</button>
                    </div>
                </div>
            </div>
        </div>

    <%-- End --%>


    <%-- Modal for Block --%>

    <div class="modal fade" id="ModalAddblook" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="lbladdblock">Create New block</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body proj-popup">




                        <div class="row">                           
                             <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Block Code <span style="color: red;">*</span></label>
                                <div class="">
                                    <input type="text" id="txtblockcode" disabled class="form-control"  />

                                </div>
                            </div>
                        </div>

                        <div class="row">                           
                             <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Block Name <span style="color: red;">*</span></label>
                                <div class="">
                                    <input type="text" id="txtblkname" class="form-control"  />

                                </div>
                            </div>
                        </div>

                        <div class="row">                           
                             <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Location <span style="color: red;">*</span></label>
                                <div class="">
                                    <input type="text" id="txtblocklocation" class="form-control"  />

                                </div>
                            </div>
                        </div>


                        <div class="row">
                             <div>
                                <label class="col-form-label label-custom" for="basic-default-name">Description <span style="color: red;">*</span></label>
                                <div>
                                    <textarea class="form-control" id="textblkdescription" rows="4" placeholder="Enter The block description"></textarea>
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btnAddBlock" runat="server" data-bs-dismiss="modal" onclick="addBlock()">Create</button>
                    </div>
                </div>
            </div>
        </div>

    <%-- End --%>


     <%-- Modal for Floor --%>

    <div class="modal fade" id="ModalAddfloor" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="lbladdbfloor">Add New Floor</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body proj-popup">




                        <div class="row">                           
                             <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Floor Code <span style="color: red;">*</span></label>
                                <div class="">
                                    <input type="text" id="txtfloorcode" class="form-control"  />

                                </div>
                            </div>
                        </div>

                        <div class="row">                           
                             <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Floor Name <span style="color: red;">*</span></label>
                                <div class="">
                                    <input type="text" id="txtfloorname" class="form-control"  />

                                </div>
                            </div>
                        </div>


                        <div class="row">
                             <div>
                                <label class="col-form-label label-custom" for="basic-default-name">Description <span style="color: red;">*</span></label>
                                <div>
                                    <textarea class="form-control" id="textfloordescription" rows="4" placeholder="Enter The Property Address"></textarea>
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" runat="server" data-bs-dismiss="modal" onclick="addFloor()">Create</button>
                    </div>
                </div>
            </div>
        </div>

    <%-- End --%>


    <%-- Modal Unittable information --%>

       <div class="modal fade" id="ModalUnitdetails" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
           <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
             <div class="modal-content"<%-- style="background: antiquewhite;"--%>>
               <div class="modal-header">
                 <h5 class="modal-title" id="lblprojDetailModal">Unit Details</h5>
                 <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
              
                   <div style=" margin-top: -13px; position: absolute; width: 96%;"> 
                       <div style=" text-align: right;">
                           <i class="bx bxs-chevron-up proj-det-drilldown" onclick="hideShowProjDetails()"></i>
                       </div>
                   </div>


                   <div id="propertyDetailsRow1Div" style="background: #dcb3b336; padding: 17px; border-radius: 12px; border: 1px solid #1d1b1b36; box-shadow: 4px 4px 13px -7px #1d1b1b36;">

                       

                         <div class="row">

                           <div class="col-1">
                               <label for="html5-number-input" class="col-form-label label-custom">Room Code </label>
                               <div class="">

                                   <input class="form-control" type="text" id="lblroomcode2" readonly />
                               </div>
                           </div>

                           <div class="col-1">
                               <label for="html5-number-input" class="col-form-label label-custom">Room Number </label>
                               <div class="">
                                   <input class="form-control" type="text" id="lblRoomName2" readonly />


                               </div>
                           </div>

                           <div class="col-1">
                               <label for="html5-number-input" class="col-form-label label-custom">Floor Name </label>
                               <div class="">

                                   <input class="form-control" type="text" id="lblfloorname2" readonly />
                               </div>
                           </div>

                           <div class="col-1">
                               <label for="html5-number-input" class="col-form-label label-custom">Block Name</label>
                               <div class="">

                                   <input class="form-control" type="text" id="lblblockrname2" readonly />
                               </div>
                           </div>

                           <div class="col-2">
                               <label for="html5-number-input" class="col-form-label label-custom">Property Code</label>
                               <div class="">

                                   <input class="form-control" type="text" id="lblpropertycode2" readonly />
                               </div>
                           </div>

                           <div class="col-2">
                               <label for="html5-number-input" class="col-form-label label-custom">Property Name </label>
                               <div class="">

                                   <input class="form-control" type="text" id="lblpropertyName2" readonly />
                               </div>
                           </div>
                           <div class="col-2">
                               <label for="html5-number-input" class="col-form-label label-custom">Ownership </label>
                               <div class="">
                                   <input class="form-control" type="text" id="lblwonership2" readonly />

                               </div>
                           </div>
                           <div class="col-2">
                               <label for="html5-number-input" class="col-form-label label-custom">Property Usage</label>
                               <div class="">
                                   <input class="form-control" type="text" id="lblpropertyusage2" readonly />
                               </div>
                           </div>


                       </div>


                       <div class="row">


                           <div class="col-1">
                               <label for="html5-number-input" class="col-form-label label-custom">Number Of Floor </label>
                               <div class="">
                                   <input class="form-control" type="text" id="lblnumberoffloor2" readonly />

                               </div>
                           </div>

                           <div class="col-1">
                               <label for="html5-number-input" class="col-form-label label-custom">Number of Rooms </label>
                               <div class="">
                                   <input class="form-control" type="text" id="lblnumberifroom2" readonly />

                               </div>
                           </div>



                           <div class="col-2">
                               <label for="html5-number-input" class="col-form-label label-custom">Location </label>
                               <div class="">
                                   <input class="form-control" type="text" id="lbllocation2" readonly />

                               </div>
                           </div>

                           <div class="col-2">
                               <label for="html5-number-input" class="col-form-label label-custom">Address </label>
                               <div class="">
                                   <input class="form-control" type="text" id="lbladdress2" readonly />

                               </div>
                           </div>

                            <div class="col-2">
                               <label for="html5-number-input" class="col-form-label label-custom">Unit Category</label>
                               <div class="">
                                   <input class="form-control" type="text" id="lblunitcategory2" readonly />
                               </div>
                           </div>

                           <div class="col-2">
                               <label for="html5-number-input" class="col-form-label label-custom">Electricity Account</label>
                               <div class="">
                                   <input class="form-control" type="text" id="lblelectrictyaccnt2" readonly />
                               </div>
                           </div>

                            <div class="col-2">
                               <label for="html5-number-input" class="col-form-label label-custom">Chiller Account</label>
                               <div class="">
                                   <input class="form-control" type="text" id="lblchilleraccount2" readonly />
                               </div>
                           </div>
                       </div>

                       

                       <div class="row">

                           <div class="col-1">
                               <label for="html5-number-input" class="col-form-label label-custom">BuildUp Area SqFt</label>
                               <div class="">
                                   <input class="form-control" type="text" id="lblbuldpAreaSqrft12" readonly />

                               </div>
                           </div>

                           <div class="col-1">
                               <label for="html5-number-input" class="col-form-label label-custom">Balcony Area SqFt</label>
                               <div class="">
                                   <input class="form-control" type="text" id="lblbalconysqrft2" readonly />

                               </div>
                           </div>
                           <div class="col-1">
                               <label for="html5-number-input" class="col-form-label label-custom">Total Area SqFt</label>
                               <div class="">
                                   <input class="form-control" type="text" id="lbltotalAreaSqrft2" readonly />

                               </div>
                           </div>

                           <div class="col-1">
                               <label for="html5-number-input" class="col-form-label label-custom">Parking Number</label>
                               <div class="">

                                   <input class="form-control" type="text" id="lblNumberOfparking2" readonly />

                               </div>
                           </div>



                           <div class="col-2">
                               <label for="html5-number-input" class="col-form-label label-custom">Premise No</label>
                               <div class="">
                                   <input class="form-control" type="text" id="lblpremisenumber2" readonly />

                               </div>
                           </div>
                           <div class="col-2">
                               <label for="html5-number-input" class="col-form-label label-custom">LandlordsName</label>
                               <div class="">
                                   <input class="form-control" type="text" id="lblLandordesName2" readonly />

                               </div>
                           </div>

                           <div class="col-2">
                               <label for="html5-number-input" class="col-form-label label-custom">Landlords Phone</label>
                               <div class="">
                                   <input class="form-control" type="text" id="lbllandordphone2" readonly />

                               </div>
                           </div>

                           <div class="col-2">
                               <label for="html5-number-input" class="col-form-label label-custom">Landlords Email</label>
                               <div class="">
                                   <input class="form-control" type="text" id="lbllandlordsEmail2" readonly />

                               </div>
                           </div>

                       </div>




                   </div>
                   

                   <%--Grid--%>

                   <div style="margin-top: 1.5%;">

                       <div class="nav-align-top">
                           <ul class="nav nav-tabs" id="unitApprovelDetailsMDL1" role="tablist">
                               <li class="nav-item">

                                   <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-WO-request" aria-controls="navs-top-WO-request" aria-selected="true"> Work Order Requests</button>
                               </li>

                           </ul>
                           <div class="tab-content">
                               <%--1st--%>
                               <div class="tab-pane fade show active" id="navs-top-WO-request" role="tabpanel" style="margin-top: -2%;">

                                   <div class="table-responsive" style="margin-top: 1%; width: 100%;">
                                       <table class="table table-WOrequest-UnderUnit" style="width: 100%;">

                                           <thead>
                                               <tr style="text-align: center;">

                                                   <th style="display: none">Id</th>
                                                   <th>Request Id</th>
                                                   <th>Property Name</th>
                                                   <th>Priority</th>
                                                   <th>Category</th>
                                                   <th>Requested By</th>
                                                   <th>Due Date</th>

                                                   <th>Action</th>


                                               </tr>
                                           </thead>
                                           <tbody class="tbody-WOrequest-UnderUnit" style="text-align: center;">
                                           </tbody>
                                       </table>
                                   </div>
                               </div>

                               <%--2nd--%>


                               <%--3rd--%>
                           </div>
                       </div>

                   </div>

    
                   

               </div>
             
             </div>
           </div>
      </div>

    <%-- END --%>


    <%-- Modal Request Unit details --%>

    <div class="modal fade" id="ModalUnitRequestDtls" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title" id="lblModalUnitRequestDtls">Unit Request Details</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div style="margin-top: -13px; position: absolute; width: 96%;">
                        <div style="text-align: right;">
                            <i class="bx bxs-chevron-up proj-det-drilldown" onclick="hideShowProjDetails()"></i>
                        </div>
                    </div>


                    <div id="unitReqDetailsDiv" style="background: #1d1b1b36; padding: 17px; border-radius: 12px; border: 1px solid #1d1b1b36; box-shadow: 4px 4px 13px -7px #1d1b1b36;">

                        <div class="row">

                            <div class="col-1">
                                <label for="html5-number-input" class="col-form-label label-custom">Room Code </label>
                                <div class="">

                                    <input class="form-control" type="text" id="lblroomcode1" readonly />
                                </div>
                            </div>

                            <div class="col-1">
                                <label for="html5-number-input" class="col-form-label label-custom">Room Number </label>
                                <div class="">
                                    <input class="form-control" type="text" id="lblRoomName1" readonly />


                                </div>
                            </div>

                            <div class="col-1">
                                <label for="html5-number-input" class="col-form-label label-custom">Floor Name </label>
                                <div class="">

                                    <input class="form-control" type="text" id="lblfloorname1" readonly />
                                </div>
                            </div>

                            <div class="col-1">
                                <label for="html5-number-input" class="col-form-label label-custom">Block Name</label>
                                <div class="">

                                    <input class="form-control" type="text" id="lblblockrname1" readonly />
                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Property Code</label>
                                <div class="">

                                    <input class="form-control" type="text" id="lblpropertycode1" readonly />
                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Property Name </label>
                                <div class="">

                                    <input class="form-control" type="text" id="lblpropertyName1" readonly />
                                </div>
                            </div>
                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Ownership </label>
                                <div class="">
                                    <input class="form-control" type="text" id="lblwonership" readonly />

                                </div>
                            </div>
                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Property Usage</label>
                                <div class="">
                                    <input class="form-control" type="text" id="lblpropertyusage" readonly />
                                </div>
                            </div>


                        </div>


                        <div class="row">


                            <div class="col-1">
                                <label for="html5-number-input" class="col-form-label label-custom">Number Of Floor </label>
                                <div class="">
                                    <input class="form-control" type="text" id="lblnumberoffloor" readonly />

                                </div>
                            </div>

                            <div class="col-1">
                                <label for="html5-number-input" class="col-form-label label-custom">Number of Rooms </label>
                                <div class="">
                                    <input class="form-control" type="text" id="lblnumberifroom" readonly />

                                </div>
                            </div>



                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Location </label>
                                <div class="">
                                    <input class="form-control" type="text" id="textlocation" readonly />

                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Address </label>
                                <div class="">
                                    <input class="form-control" type="text" id="lbladdress" readonly />

                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Unit Category</label>
                                <div class="">
                                    <input class="form-control" type="text" id="lblunitcategory1" readonly />
                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Electricity Account</label>
                                <div class="">
                                    <input class="form-control" type="text" id="lblelectrictyaccnt" readonly />
                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Chiller Account</label>
                                <div class="">
                                    <input class="form-control" type="text" id="lblchilleraccount" readonly />
                                </div>
                            </div>
                        </div>



                        <div class="row">

                            <div class="col-1">
                                <label for="html5-number-input" class="col-form-label label-custom">BuildUp Area SqFt</label>
                                <div class="">
                                    <input class="form-control" type="text" id="lblbuldpAreaSqrft1" readonly />

                                </div>
                            </div>

                            <div class="col-1">
                                <label for="html5-number-input" class="col-form-label label-custom">Balcony Area SqFt</label>
                                <div class="">
                                    <input class="form-control" type="text" id="lblbalconysqrft1" readonly />

                                </div>
                            </div>
                            <div class="col-1">
                                <label for="html5-number-input" class="col-form-label label-custom">Total Area SqFt</label>
                                <div class="">
                                    <input class="form-control" type="text" id="lbltotalAreaSqrft1" readonly />

                                </div>
                            </div>

                            <div class="col-1">
                                <label for="html5-number-input" class="col-form-label label-custom">Parking Number</label>
                                <div class="">

                                    <input class="form-control" type="text" id="lblNumberOfparking1" readonly />

                                </div>
                            </div>



                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Premise No</label>
                                <div class="">
                                    <input class="form-control" type="text" id="lblpremisenumber1" readonly />

                                </div>
                            </div>
                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">LandlordsName</label>
                                <div class="">
                                    <input class="form-control" type="text" id="lblLandordesName1" readonly />

                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Landlords Phone</label>
                                <div class="">
                                    <input class="form-control" type="text" id="lbllandordphone1" readonly />

                                </div>
                            </div>

                            <div class="col-2">
                                <label for="html5-number-input" class="col-form-label label-custom">Landlords Email</label>
                                <div class="">
                                    <input class="form-control" type="text" id="lbllandlordsEmail1" readonly />

                                </div>
                            </div>

                        </div>
                    </div>


                    <div style="margin-left: 75%; margin-top: 10px">
                        <button type="button" id="btnunitReqApproved" class="btn btn-success btn-approved hidden" onclick="StatusUpdate('APPROVED')">Approved</button>
                        <button type="button" id="btnUnitReqVerified" class="btn btn-info btn-verified hidden" onclick="StatusUpdate('APPROVED')">Verified</button>
                        <button type="button" id="btnunitReqRejected" class="btn btn-danger btn-rejected" >Rejected</button>

                    </div>

                    <%--data-bs-toggle="modal" data-bs-target="#Modalrejectreason"--%>
                </div>




            </div>


            <%--Grid--%>


            <div style="margin-top: 1.5%;">

                <div class="nav-align-top">
                    <ul class="nav nav-tabs" id="unitApprovelDetailsMDL" role="tablist">
                        <li class="nav-item">

                            <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Aproveldtls" aria-controls="navs-top-mstones" aria-selected="true">Approval Details</button>
                        </li>

                    </ul>
                    <div class="tab-content">
                        <%--1st--%>
                        <div class="tab-pane fade show active" id="navs-top-Aproveldtls" role="tabpanel" style="margin-top: -2%;">

                            <div class="table-responsive" style="margin-top: 1%; width: 100%;">
                                <table class="table table-requstActions" style="width: 100%;">

                                    <thead>
                                        <tr style="text-align: center;">

                                            <%-- <th>Sl.No</th>--%>
                                            <th>Role Name</th>
                                            <th>Action Taken By</th>
                                            <th>Action Taken On</th>
                                            <th>Comments</th>
                                            <th>Status </th>


                                        </tr>
                                    </thead>
                                    <tbody class="tbody-unitreq-actions" style="text-align: center;">
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <%--2nd--%>


                        <%--3rd--%>
                    </div>
                </div>

            </div>


        </div>

    </div>
          
      

    <%-- End --%>


    <%-- Modal for reject reason --%>

    <div class="modal fade" id="Modalrejectreason" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <%--<h5 class="modal-title" id="lbladdbfloor">Add New Floor</h5>--%>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body proj-popup">




                        <div class="row">
                             <div>
                                <label class="col-form-label label-custom" for="basic-default-name">Enter The Reason For Rejection <span style="color: red;">*</span></label>
                                <div>
                                    <textarea class="form-control" id="textreasonforrejection" rows="4" ></textarea>
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" runat="server"  onclick="RejectReason()">Create</button>

                       

                        
                </div>
            </div>
        </div>
        </div>


    <%-- End --%>

    <%-- Modal Workorder Details --%>

    <div class="modal fade" id="ModalWOunderUnits" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<h5 class="modal-title" id="lbladdbfloor">Add New Floor</h5>--%>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">



                    <div style="margin-top: 1.5%;">


                        <%--<div>
                            <a href="#" class="btn btn-primary pull-right btn-add-workorder-grid"><i class="fa fa-plus" aria-hidden="false"></i>&nbsp; Add Work Order</a>
                        </div>--%>

                        <div class="nav-align-top">



                            <ul class="nav nav-tabs" id="workorder-AllDetailsList1-ul" role="tablist">


                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-Workorderlist" aria-controls="navs-Workorderlist" aria-selected="false">Workorder</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Allproblems" aria-controls="navs-top-Allproblems" aria-selected="false">All Problems</button>
                                </li>


                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-alldaysummary" aria-controls="navs-top-alldaysummary" aria-selected="false">Daily Work Summary</button>
                                </li>

                                <%--   <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-allWOAttachement" aria-controls="navs-top-allWOAttachement" aria-selected="false">Remark & Attachments </button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-allMaterialRequest" aria-controls="navs-top-allMaterialRequest" aria-selected="false">Material Request </button>
                                </li>--%>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="navs-Workorderlist" role="tabpanel">
                                    <%--<div>
                                    <a href="#" id="addnewworkorder" class="btn btn-primary pull-right btn-add-workorder-grid"><i class="fa fa-plus" aria-hidden="false"></i>&nbsp; Add Work Order</a>
                                </div>--%>
                                    <div class="table-responsive" style="margin-top: 1%; width: 100%">

                                        <table class="table WorkOrder-UnderUnits" style="width: 100%">

                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th>WorkOrderID</th>
                                                    <th style="display: none">RequestID</th>
                                                    <th>Assigned To</th>
                                                    <th>Cost Allocation</th>
                                                    <th>DueDate </th>
                                                    <th>Status </th>
                                                    <th>Description </th>




                                                </tr>
                                            </thead>
                                            <tbody class="tbody-WorkOrder-UnderUnits" style="text-align: center">
                                            </tbody>
                                        </table>

                                    </div>

                                </div>

                                <%-- 2nd --%>
                                <div class="tab-pane" id="navs-top-Allproblems" role="tabpanel">


                                    <div class="table-responsive active" id="" style="margin-top: 1%; width: 100%;">

                                        <table class="table table-AllproblemsUnderWO" style="width: 100%;">

                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th>WorkOrderID</th>

                                                    <th>Description </th>
                                                    <th>Created Date</th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-AllproblemsUnderWO" style="text-align: center;">
                                            </tbody>
                                        </table>

                                    </div>
                                </div>

                                <%-- 3rd --%>
                                <div class="tab-pane" id="navs-top-alldaysummary" role="tabpanel">


                                    <div class="table-responsive" style="margin-top: 0%; width: 100%;">
                                        <table class="table WODailySummary-table" style="width: 100%;">

                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th>WorkOrder</th>
                                                    <th>Task</th>
                                                    <th>Date</th>
                                                    <th>EmployeeName</th>
                                                    <th>Man Hourse</th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-WODailySummary" style="text-align: center;">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <%-- 4th --%>
                                <%--<div class="tab-pane" id="navs-top-allWOAttachement" role="tabpanel" style="margin-top: -2%;">

                                    <br />

                                  

                                    <div class="table-responsive active" style="margin-top: 1%; width: 100%;">

                                        <table class="table table-AllAttechements" style="width: 100%;">

                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th>WorkOrderID</th>
                                                    <th>ImageURL</th>
                                                    <th>FileName </th>
                                                    <th>CreatedDate </th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-AllAttechemets" style="text-align: center;">
                                            </tbody>
                                        </table>

                                    </div>


                                </div>--%>

                                <%-- 5th --%>
                                <%--  <div class="tab-pane fade " id="navs-top-allMaterialRequest" role="tabpanel">


                                    <div class="table-responsive active" id="" style="margin-top: 1%; width: 100%;">

                                        <table class="table table-AllMaterialRequest" style="width: 100%;">

                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th style="display: none">MRequestID</th>
                                                    <th style="display: none">WorkOrderID</th>
                                                    <th>Request ID </th>
                                                    <th>Property Name</th>

                                                    <th>Item Category </th>
                                                    <th>Item Code</th>
                                                    <th>Item Name</th>
                                                    <th>Action</th>


                                                </tr>
                                            </thead>
                                            <tbody class="tbody-AllMaterialRequest" style="text-align: center;">
                                            </tbody>
                                        </table>

                                    </div>
                                </div>--%>
                            </div>
                        </div>

                    </div>



                </div>

                <%-- <div class="modal-footer">
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" runat="server"  onclick="RejectReason()">Create</button>

                   </div>--%>
            </div>
        </div>
    </div>

    <%-- End --%>


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
            EmpName = '<%=Session["EmpName"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';
  });

    </script>

   
    <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../Template/Datatable/js/jquery.dataTables.min.js"></script>

    <link href="css/propertymaster.css" rel="stylesheet" />

    <script src="js/property.js?v=1.2"></script>
  

    <script src="../Template/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../Template/Datatable/js/jszip.min.js"></script>
    <script src="../Template/Datatable/js/pdfmake.min.js"></script>
    <script src="../Template/Datatable/js/vfs_fonts.js"></script>
    <script src="../Template/Datatable/js/buttons.html5.min.js"></script>
    <script src="../Template/Datatable/js/buttons.print.min.js"></script>

    <script src="../Template/Flatpickr/js/flatpickr.js"></script>
    <link href="../Template/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

     <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

</asp:Content>


