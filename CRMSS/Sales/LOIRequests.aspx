<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="LOIRequests.aspx.cs" Inherits="Sales_LOIRequests" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>


       <style type="text/css">
    
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
    .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
   
    background-color: #c1c1c1 !important;
   
}
     .kpi-user-list-table th{
        background-color: #a92828;
        color:white !important;
    }
      .Customer-List th{
        background-color: #a92828;
        color:white !important;
    }
      .OPT-List th{
        background-color: #a92828;
        color:white !important;
    }
       .Revenue-List th{
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
    background: #a92828 !important;
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
    box-shadow: 2px 2px 17px #e14b4b;
    border-radius: 20px;
    background: white;
    width: 10%;
    padding: 10px;
}
  .loader-bg-blur{
              height: 100%;
    z-index: 9999999;
    position: fixed;
    background: #c3d3ce6b;
    width: 100%;
        }
.hidden{
    display:none !important;
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
 .tablepopup th{
        background-color: #a92828;
        color:white !important;
        text-align:center;
    }
  .tablepopup td{
       
        text-align:center;
    }
   .tablepopup {
       
        width:100%;
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
       
        hr {
    margin: 1rem 0;
    color: #565656;
    background-color: currentColor;
    border: 0;
    opacity: 1;
}
           .bx-search:hover {
               zoom: 1.4;
           }
           .Verified:hover,.Duplicated:hover {
                zoom: 1.3;
           }

           .tbody-CutomerList tr:hover{
               cursor:pointer;
               --bs-table-accent-bg: cadetblue !important
               
           }
           .tbody-OPTLIST tr:hover{
               cursor:pointer;
               --bs-table-accent-bg: cadetblue !important
               
           }
           .tbody-RevenueList tr:hover{
               cursor:pointer;
               --bs-table-accent-bg: cadetblue !important
               
           }
           .form-control,.form-select  {
                   border: 1px solid #b2b3b4;
           }

  @import url('https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400&display=swap');
.design-section {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: #ebe5e4;
  min-height: 100vh;
  padding: 100px 0;
  font-family: Jost;
}

.design {
  display: flex;
  align-items: center;
  justify-content: center;
}

.timeline {
  width: 80%;
  height: auto;
  max-width: 800px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
}

.timeline-content {
  padding: 20px;
  background: #ffffff;
  -webkit-box-shadow: 5px 5px 10px #1a1a1a, -5px -5px 10px #242424;
          box-shadow: 5px 5px 10px #1a1a1a, -5px -5px 10px #242424;
  border-radius: 5px;
  color: white;
  padding: 1.75rem;
  transition: 0.4s ease;
  overflow-wrap: break-word !important;
  margin: 1rem;
  margin-bottom: 20px;
  border-radius: 6px;
}

.timeline-component {
  margin: 0px 20px 20px 20px;
}

@media screen and (min-width: 768px) {
  .timeline {
    display: grid;
    grid-template-columns: 1fr 3px 1fr;
  }
  .timeline-middle {
    position: relative;
    background-image: linear-gradient(45deg, #F27121, #E94057, #8A2387);
    width: 3px;
    height: 100%;
  }
  .main-middle {
    opacity: 0;
  }
  .timeline-circle {
    position: absolute;
    top: 0;
    left: 50%;
    width: 15px;
    height: 15px;
    border-radius: 50%;
    background-image: linear-gradient(45deg, #F27121, #E94057, #8A2387);
    -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
  }
}

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%;padding-right: 2%; padding-top: 1%;"><h4 id="RequestHeader" style="text-shadow: 1px -3px 8px; color: #a92828;float: left;">LOI REQUESTS</h4>
               <button type="button" class="btn btn-label-info AddnewRquests" style="float:right;">Add New Request</button>

       </div> 
     
         
          
                   
             
                    
  <div class="card-body" >

     <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>
                            <td class="no-border" style="width: 5%">
                                 <asp:Label ID="Label1" Text="Company" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                </td>
                         
                          <td class="no-border" style="width: 18%">
                                
                              <select id="ddlCompany" class="form-select color-dropdown">
                              </select>
                          </td>
                            <td class="no-border" style="width: 5%">
                                 <asp:Label ID="Label8" Text="Status" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                </td>
                         
                          <td class="no-border" style="width: 18%">
                                
                              <select id="ddlStatus" class="form-select color-dropdown">
                              </select>
                          </td>
                       


                   
                          <td class="no-border" style="width: 5%">

                              <input type="button" id="btnSearch" value="Search" class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>
                             <td class="no-border"></td>
                           
                      </tr>
                  </table>
      </div>


       <div class="ajax-loader loader-bg-blur">
          <div class="custom-loader ">
              <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
              <h4>Loading Data...</h4>
          </div>
      </div>

    <div class="" style="margin-top: 1%;">
  <table class="table table-bordered table-striped kpi-user-list-table">
  
    <thead>
     <tr style="height:50px">
         <th style="width:14%;text-align:center;vertical-align:middle">ReqNumber</th>
          <th  style="width:12%;text-align:center;vertical-align:middle">OPT #</th>
            <th  style="width:12%;text-align:center;vertical-align:middle">Project Name</th>
          <th style="width:8%;text-align:center;vertical-align:middle">Customer</th>
         <th  style="width:8%;text-align:center;vertical-align:middle">Owner</th>
          <th style="width:8%;text-align:center;vertical-align:middle">Consultant</th>
          <th style="width:8%;text-align:center;vertical-align:middle">Marketing</th>
             <th style="width:8%;text-align:center;vertical-align:middle">Value</th>
            <th style="width:8%;text-align:center;vertical-align:middle">Status</th>
         <th style="width:8%;text-align:center;vertical-align:middle"></th>
           
        </tr>
    </thead>
    <tbody class="tbody-RequestedList">

    </tbody>
  </table>
</div>




    </div>
</div>
   <!--- -->
      


     <!-- Customer Search Popup -->
  <div class="modal fade" id="mpSearchCustomer" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 92vw!important; top: 10%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Customer List</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                    <div class="row">
                        <i class="icontransform CreateNewCustomer fa fa-plus" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Save New Customer"></i>
                    </div>
                </div>
                <div class="modal-body" >
                    <div class="row">
                        <table class="table table-bordered  Customer-List" style="width:100%" id="tblCustomerList">
  
    <thead>
     <tr style="height:50px">
            <th class="hidden" style="width:14%;text-align:center;vertical-align:middle">CRMAccountID</th>
             <th style="width:14%;text-align:center;vertical-align:middle">Cutomer Name</th>
            <th style="width:16%;text-align:center;vertical-align:middle">Owner</th>
            <th style="width:16%;text-align:center;vertical-align:middle">Phone</th>
              <th style="width:14%;text-align:center;vertical-align:middle">Email</th>
               <th style="width:14%;text-align:center;vertical-align:middle">URL</th>
                <th style="width:14%;text-align:center;vertical-align:middle">Country</th>
                
        </tr>
    </thead>
    <tbody class="tbody-CutomerList">

    </tbody>
  </table>

                       </div>

                </div>
            </div>
        </div>
    </div>
         <!-- Opportunty List Popup -->
    <div class="modal fade" id="mpSearchOPT" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 92vw!important; top: 10%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">OPPORTUNITY LIST</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                    <div class="row">
                        <i class="icontransform AddnewOPT fa fa-plus" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Add New OPT"></i>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <table class="table table-bordered  OPT-List" style="width: 100%" id="tblOptList">

                            <thead>
                                <tr style="height: 50px">
                                    <th class="hidden" style="width: 14%; text-align: center; vertical-align: middle">Opportunity Id</th>
                                    <th style="width: 14%; text-align: center; vertical-align: middle">OPT Number</th>
                                    <th style="width: 16%; text-align: center; vertical-align: middle">Name</th>
                                    <th style="width: 16%; text-align: center; vertical-align: middle">Owner</th>
                                    <th style="width: 14%; text-align: center; vertical-align: middle">Country</th>
                                    <th style="width: 14%; text-align: center; vertical-align: middle">Stage</th>
                                    <th style="width: 14%; text-align: center; vertical-align: middle">Status</th>


                                </tr>
                            </thead>
                            <tbody class="tbody-OPTLIST">
                            </tbody>
                        </table>

                    </div>

                </div>
            </div>
        </div>
    </div>

      <!-- Revenue List Popup -->
    <div class="modal fade" id="mpRevenueList" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 92vw!important; top: 10%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Please Select  Product for the Request</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                      <div class="row">
                            <button id="CreateRequest" type="button" class="btn btn-success" >Create</button>
                      
                    </div>
                    
                </div>
                <div class="modal-body">
                    <div class="row">
                        <table class="table table-bordered  Revenue-List" style="width: 100%" id="tblRevenueList">

                            <thead>
                                <tr style="height: 50px">
                                    <th class="hidden" style="width: 14%; text-align: center; vertical-align: middle">RevId</th>
                                    <th style="width: 14%; text-align: center; vertical-align: middle">Product Type</th>
                                    <th style="width: 16%; text-align: center; vertical-align: middle">Vendor List</th>
                                    <th style="width: 16%; text-align: center; vertical-align: middle">Substage</th>
                                    <th style="width: 14%; text-align: center; vertical-align: middle">value</th>
                                    <th style="width: 5%; text-align: center; vertical-align: middle"></th>

                                </tr>
                            </thead>
                            <tbody class="tbody-RevenueList">
                            </tbody>
                        </table>

                    </div>

                </div>
            </div>
        </div>
    </div>


       <!-- Customer Search Popup -->
  <div class="modal fade" id="mpLOIrequest" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 92vw!important; top: 10%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Request Details</h5>
                    
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                   
                   
                </div>
                <div class="modal-body">

          



                    <div class="card" >
                        <div style="padding-left: 2%; padding-right: 2%; padding-top: 1%;background-color:#a92828">
                            <h4 style="color:white ; float: left;">OPPORTUNITY DETAILS</h4>
                            <div>
                                <button id="btnSubmitFinalizedValue" type="button" class="btn btn-success" style="float: right">Save & Submit</button>
                             <button id="btnSaveFinalizedValue" type="button" class="btn btn-secondary" style="float: right;margin-right: 10px;">Save</button>
                                 <button id="btnReject" type="button" class="btn btn-danger" style="float: right">Reject</button>
                                <button id="btnApprove" type="button" class="btn btn-success" style="float: right;margin-right: 10px">Approve</button>
                                 
                                </div>
                        </div>


                        <div class="card-body">

                                      <div class="row">
                                           <div class="col-2">
                            <label class="col-form-label label-custom" for="basic-default-name">Document Type</label>
                            <div class="">
                                <select id="ddlDocumentType" class="form-select color-dropdown">
                                  
                              </select>

                            </div>
                        </div>
                   

                        <div class="col-1">
                            <label class="col-form-label label-custom" for="basic-default-name">OPT #</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtOPTNumber" disabled/>

                            </div>
                        </div>
                   
                        <div class="col-3">
                            <label class="col-form-label label-custom" for="basic-default-name">Name</label>
                            <div class="">
                                   <textarea id="txtOPTName" class="form-control" disabled></textarea>
                              <%--  <textarea class="form-control"  id="txtItemDesc" ></textarea>--%>
                            </div>
                        </div>
                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Client</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtClient" disabled/>

                            </div>
                        </div>
                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Customer</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtCustomer" disabled/>

                            </div>
                        </div>
                      
                                          </div>
                               <div class="row">
                                     <div class="col-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Owner</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtOwner" disabled/>

                            </div>
                        </div>
                        <div class="col-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Consultant</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtConsultant" disabled />

                            </div>
                      
                    </div>
                                   <div class="col-2 divLoidata" >
                            <label for="html5-number-input" class="col-form-label label-custom">Document No.</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtDocumentNo"  />

                            </div>
                      
                    </div>
                                   <div class="col-2 divLoidata" >
                            <label for="html5-number-input" class="col-form-label label-custom">Document Date</label>
                            <div class="">
                                <input class="form-control" type="date" value="" id="txtDocumentDate"  />

                            </div>
                      
                    </div>
                                       <div class="col-2">
        <label for="html5-number-input" class="col-form-label label-custom">SO Team</label>
        <div class="">
             <select id="ddlSoTeam" class="form-select color-dropdown">
    
</select>

        </div>
  
</div>

                              <div class="nav-align-top" style="margin-top:5%">
                  <ul class="nav nav-tabs" role="tablist">
                      <li class="nav-item">
                          <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-home" aria-controls="navs-top-home" aria-selected="true">Selected Revenue</button>
                      </li>
                      <li class="nav-item">
                          <button type="button" class="nav-link LOIDocuments" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-profile" aria-controls="navs-top-profile" aria-selected="false">Documents</button>
                      </li>
                      <li class="nav-item">
                          <button type="button" class="nav-link LOIComments" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-messages" aria-controls="navs-top-messages" aria-selected="false">General Comments</button>
                      </li>
                  </ul>
                  <div class="tab-content">
                      <div class="tab-pane fade show active" id="navs-top-home" role="tabpanel">
                          <div class="row" style="padding-left: 50%;">

                              <div class="col-3" style="/* align-self: center; */padding-top: 7px;">
                                  <input class="form-check-input me-1 cbLumpSumClass" id="cbLumpsumAmount" type="checkbox">Lumpsum
                              </div>
                              <div class="col-3" >
                                  
                                  <div class="">
                                      <input class="form-control" type="text" id="txtFinalizedAmount" value="0.0"  disabled="disabled">

                                  </div>
                              </div>
                              <div class="col-3 bIsReqLeveldiv"  style="/* align-self: center; */padding-top: 7px;">
                                  <input class="form-check-input me-1 cbIsReqLevel" id="cbIsReqLevelId" type="checkbox">SO Request Level
                              </div>
                              <div class="col-3">
                                  
                                  <div class="">
                                      <input class="form-control" type="text" id="txtSoReqLevel"   disabled="disabled">

                                  </div>
                              </div>
                            
                          </div>
                          <table class="table table-bordered table-striped  nowrap tablepopup">

                              <thead class="thead-revenue">
                                  <tr>
                                      <th class="hidden">RequestNumber</th>
                                       <th class="hidden">ID</th>

                                      <th>Product</th>
                                      <th>Substage</th>
                                      <th>Revenue Amount</th>
                                      <th>FinaliZed Value</th>
                                      <th class="solnumber">SO Number</th>


                                  </tr>
                              </thead>
                              <tbody class="tbody-revenue">
                              </tbody>
                          </table>


                      </div>
                      <div class="tab-pane fade" id="navs-top-profile" role="tabpanel">
                           <div>
                        <i class="icontransform UploadNewDocument fa fa-plus" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Save New Customer"></i>
                    </div>
                          <table class="table table-bordered table-striped  nowrap tablepopup supportDocuments ">

                              <thead>
                                  <tr>

                                       <th class="hidden" >URL</th>
                                        <th class="hidden">ID</th>
                                      <th>SL.NO</th>
                                      <th>File Name</th>
                                      <th>Description</th>
                                      <th>Updated By</th>
                                      <th>Updated Date</th>

                                      <th>Actions</th>
                                      

                                  </tr>
                              </thead>
                              <tbody class="tbody-Documents">
                              </tbody>
                          </table>
                      </div>
                      <div class="tab-pane fade" id="navs-top-messages" role="tabpanel">
                              <div>
                        <i class="icontransform AddNewComment fa fa-plus" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Save New Customer"></i>
                    </div>
                          <table class="table table-bordered table-striped  tablepopup">

                              <thead>
                                  <tr>

                                      <th class="hidden">ID</th>
                                      <th>SL.NO</th>
                                      <th>Comments</th>
                                      <th>Update By</th>
                                      <th>Updated Date</th>
                                  </tr>
                              </thead>
                              <tbody class="tbody-Comments">
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
    </div>


      

        <!-- New Comments -->
    <div class="modal fade" id="mpAddComments" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 92vw!important; top: 10%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Comments</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                     <div class="row">
                        <i class="icontransform SaveComments fa fa-floppy-o" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Save"></i>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                      <div class="col-12">
                            <label class="col-form-label label-custom" for="basic-default-name">Comments</label>
                            <div class="">
                                  <textarea class="form-control"  id="txtComments" ></textarea>
                                    <input type="hidden" id="hfdRequestNumber" />
                            </div>
                        </div>
                      
                    

                    </div>

                </div>
            </div>
        </div>
    </div>


     

       <!-- Document Upload -->
    <div class="modal fade" id="mpUploadFile" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 20vw!important; top: 10%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Upload Supported Documents</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                     <div class="row">
                        <i class="icontransform UploadSupportDocument fa fa-floppy-o" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Save"></i>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col mb-3 discriptionDiv">
                            <label for="nameBasic" class="form-label">File Name </label>
                            <input type="text" class="form-control" id="txtFileName" />
                        </div>
                        </div>
                    <div class="row">
                        <div class="col mb-3 discriptionDiv">
                            <label for="nameBasic" class="form-label">Description </label>
                            <textarea class="form-control" id="txtDescription" rows="3"></textarea>
                        </div>
                        </div>
                        <div class="row">
                            <div class="col mb-3 multiplefileuploadDiv">
                                <label for="formFileMultiple" class="form-label">File</label>
                                <input class="form-control" type="file" id="fuDocument" accept=".doc,.docx,.pdf,.png,.jpeg">
                            </div>
                        </div>



                    </div>

                </div>
            </div>
        </div>
    </div>
      <div class="modal fade" id="mpSoNumber" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                     <div class="modal-header">
                    <h5 class="modal-title" ">Please Enter The Sales Order Number</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body" style="text-align: center;">
                     <input class="form-control" type="text" value="" id="txtSoNumber" />
                   
                     
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 41%;">
                         <button id="btnSaveSalesorder" type="button" class="btn btn-primary" data-bs-dismiss="modal">Update </button>
                    </div>
                </div>
            </div>
        </div>
    </div>


      <!------ Request History ------>

      
         <div class="modal fade" id="ModalHistory" tabindex="-2" aria-hidden="true" style="background-color: #13131466">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalhistory">REQUEST HISTORY</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body" style="max-height:820px;overflow-y:auto;">

                    <div class="design-section">
                         <div class="timeline" id="timelineHistory">

         


                            </div>
                      </div> 
             </div>

                    

                    
                    <br/>
                    <div class="modal-footer">
                        

                       


                    </div>
                </div>
            </div>
        </div>



    
      <!------ Request Status ------>

      
         <div class="modal fade" id="mdRequestStatus" tabindex="-2" aria-hidden="true" style="background-color: #13131466">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">APPROVAL STATUS</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body" style="max-height:820px;overflow-y:auto;">
                    <table class="table table-bordered table-striped kpi-user-list-table">

                        <thead>
                            <tr>
                              
                                <th style="text-align:center">ROLE</th>
                                <th style="text-align:center">ACTION TAKEN BY</th>
                                <th style="text-align:center">UPDATED DATE</th>
                                 <th style="text-align:center">COMMENTS</th>
                                <th style="text-align:center">ACTION</th>

                              
                             

                            </tr>
                        </thead>
                        <tbody class="tbody-ApprovalList">
                        </tbody>
                    </table>
                
             </div>

                    

                    
                    <br/>
                    <div class="modal-footer">
                        

                       


                    </div>
                </div>
            </div>
        </div>


      <div class="modal fade" id="mpActionComments" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                     <div class="modal-header">
                    <h5 class="modal-title" ">Please enter The action remarks</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body" style="text-align: center;">
                     <input class="form-control" type="text" value="" id="txtActionComments" />
                    <input type="hidden" id="hfdAction" />
                     
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 41%;">
                         <button id="btnSaveAction" type="button" class="btn btn-primary" data-bs-dismiss="modal">Update</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

      <script type="text/javascript">
                var currUserId = '';   
                var EmpNo = '';
                var myrole = '';
                var myrole = '';
                var overAllPerfo=0;
                $(document).ready(function () {
                    currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;               
                    EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';
                    myroleList = '<%=Session["CurrentUserRolesList"]%>';
                });

      </script>
    	<!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />


    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
    <%--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.13.1/datatables.min.css"/>--%>
    
 <%--     
    <script src="Datatable/js/jquery.dataTables.min.js"></script>--%>
   
    <script src="Scripts/LOIRequests.js?v=4"></script>

	<!-- Datatable plugin JS library file -->	
   
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
     <link href="../Common/button/customizedButtons.css" rel="stylesheet" />
    
        <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
        <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

</asp:Content>