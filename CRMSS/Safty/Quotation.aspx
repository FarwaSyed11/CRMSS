<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="Quotation.aspx.cs" Inherits="SaftyQuotation_Quotation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>


       <style type="text/css">
    
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/

    .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
    color: #ffffff;
    background-color: #a92828;
    border-color: #fff;
   
}
 .nav-tabs .nav-item .nav-link.active
 {
     color: #ffffff;
    background-color: #a92828;
    border-color: #fff;
 }
 .nav-tabs .nav-item .nav-link:hover
 {
      color: #ffffff;
    background-color: #a92828;
    border-color: #fff;
 }
  .nav-tabs .nav-item .nav-link:not(.active) {
        color: black;
        background-color: #b4b9bf;
          
}
     .kpi-user-list-table th{
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

           .OPP-PTOverview-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

     .Quotation-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

             .Quotation-list-table td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }


           .Product-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

          .Product-list-table td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }

           .EngProduct-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

          .EngProduct-list-table td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }

           .Attachment-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

          .Attachment-list-table td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }

          .Approval-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

          .Approval-list-table td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }


              .table-Customer-Details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

             .table-Customer-Details td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }


                .table-Opportunity-Details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

             .table-Opportunity-Details td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }



               .Contact-item-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

             .Contact-item-list-table td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }

              table.dataTable tbody tr:hover {
          background-color:#ff6f591a !important;
         border-right: 5px solid #db7e2f !important;
    
}

            .btn-primary:hover {
            color: #fff;
            background-color: #bb1414;
            border-color: #bb1414;
            transform: translateY(-1px);
        }

               .btn-primary {
            color: #fff;
            background-color: #e12508;
            border-color: #e12508;
        }

               .btn-check:focus + .btn-primary, .btn-primary:focus {
                color: #ffffff;
                background-color: #76dd4b;
                border-color: #7bdd59;
                transform: translateY(-1px);
            }

                .btn-primary:hover {
                color: #ffffff;
                background-color: #76dd4b;
                border-color: #7bdd59;
                transform: translateY(-1px);
            }
                 .Radio-info th{
                    border:none !important;
                    width:10% !important;
                    font-size: 100%;
                    text-decoration: underline;
}
    
                .Radio-info td{
                    border:none !important;
                }


    input[type="radio"] {
	appearance: none;
	-webkit-appearance: none;
	width: 20px;
	height: 20px;
	border: 1px solid #ff8318;
	border-radius: 50%;
	margin-right: 10px;
	background-color: transparent;
	position: relative;
	top: 6px;
}

      input[type="radio"]:checked::before {
	content: "";
	display: block;
	width: 12px;
	height: 12px;
	background-color: #ca8489;
	border-radius: 50%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	animation: appear 0.8s;
}


.col-form-label{
    color:#cd6a52 !important;
}


.form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
    background-color: #ff7835 !important;
    border-color: #ff7835 !important;
    box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%) !important;
}


 .form-control:focus, .form-select:focus {
    border-color: #ff9869 !important;
}

 .form-control:disabled, .form-control[readonly] {
    background-color: #c5c5c52e;
    opacity: 1;
}

 .form-check-input[type=checkbox] {
    border-radius: 0.25em;
    background-color: #ededed;
}

 .form-check-input[disabled] ~ .form-check-label, .form-check-input:disabled ~ .form-check-label {
    opacity: 1.5;
}

 .tbody-ERMRequest .ibtn-Request-Details:hover
 {
     content:url("images/output-onlinegiftools.gif");
 }

 .tbody-Attachment-list .ibtn-Request-Details:hover
 {
     content:url("images/gif-download.gif");
 }

 .Save-button:hover
 {
     content:url("images/gif-submit-progress.gif");
 }

  .select2-container--default .select2-selection--single { 

     padding-top:1% !important;

  }
   hr.new1 {
  border-top: 1px solid red;
}
           .setzoom {
           zoom:85% !important;
           }

</style>

 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">




    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div style="padding-left: 2%; padding-top: 1%;">
            <h4 style="text-shadow: 1px -1px 8px; color: #a92828;">Quotation</h4>
        </div>

        <div class="card-body" style="margin-top: -1%;">

            <div class="row">
                <table class="table table-condensed tblfilter" style="border-bottom-width: 1px !important;" runat="server" id="tbltopsearch">
                    <tr>
                                    <td class="no-border" style="width: 5%">
                                 <asp:Label ID="Label8" Text="Status" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                </td>
                         
                          <td class="no-border" style="width: 10%">
                                
                              <select id="ddlStatus" class="form-select color-dropdown">
                              </select>
                          </td>

                        <td class="no-border" style="padding-top: 34px">
                            <a href="#" id="btnNewAddReq" class="btn btn-primary" style="float: right;"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</a>

                        </td>

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
          <table class="table Quotation-list-table">

              <thead>
                  <tr>
 
                      <th style="display:none">QuotationID</th>
                      <th>Type</th>
                      <th>Date</th>
                      <th>inquiry Type</th>
                      <th>Quotation Number</th>
                      <th>Customer</th>
                      <th>Project</th>
                      <th>Total Amount</th>
                      <th>Status</th>
                      <th>Action</th>
                   

                  </tr>

              </thead>
              <tbody class="tbody-Quotation">
              </tbody>
          </table>
      </div>





        </div>
    </div>








    <div class="modal fade" id="NewRequest" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document" style="max-width: 85%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <div class="row" style="width: 100%;">

                        <div class="col-6">
                            <h4 class="modal-title" id="EstimationDet">REQUEST DETAILS</h4>
                        </div>

                        <div style="width: 47.666%;">

                            <%-- <div>
                                      <button type="button" class="btn btn-success btnSubmitRequest" style="float:right;margin-left: 5px;"><i class="bx bxs-save"></i>Submit</button>
                                  </div>
                                  <div>
                                      <button type="button" class="btn btn-success btnApprove" style="float:right;margin-left: 5px;"><i class="bx bxs-check-circle"></i>Approve</button>
                                  </div>
                                  <div>
                                      <button type="button" class="btn btn-danger btnReject" style="float:right;"><i class="bx bxs-x-circle"></i>Reject</button>
                                  </div>--%>
                        </div>

                        <div style="width: 1.333%;">
                            <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                    </div>



                </div>
                <div class="modal-body" style="zoom: 85%">





                    <div id="Estimation-details-rectangle-div" style="background: #e14f0c17; padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">

                        <div class="row">

                            <div style="width: 14%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Type</label>
                                <div class="">

                                    <select id="ddlType" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                        <option value="QUOTATION">QUOTATION</option>
                                        <option value="COMMERCIAL OFFER">COMMERCIAL OFFER</option>
                                        <option value="BUDGETARY PRICE">BUDGETARY PRICE (BANK GUARANTEE)</option>
                                    </select>

                                </div>
                            </div>

                            <div style="width: 14%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Organization</label>
                                <div class="">

                                    <select id="ddlOrganization" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                    </select>
                                </div>
                            </div>

                            <div style="width: 14%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Quotation Type</label>
                                <div class="">



                                    <select id="ddlQTNType" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                        <option value="BOQ">BOQ</option>
                                        <option value="PROJECT">PROJECT</option>
                                        <option value="TENDER">TENDER</option>
                                    </select>

                                </div>
                            </div>

                            <div style="width: 14%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Currency</label>
                                <div class="">

                                    <select id="ddlCurrency" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                    </select>
                                </div>
                            </div>

                            <div style="width: 14%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Quotation NO</label>
                                <div class="">

                                    <input type="text" id="txtQtnNo" value="" class="form-control" disabled />
                                </div>
                            </div>

                            <div style="width: 14%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Quotation Date</label>
                                <div class="">

                                    <input type="text" id="txtQtnDate" value="" class="form-control" disabled />
                                </div>
                            </div>


                        </div>
                        <hr class="new1">
                        <div class="row" style="margin-top: 1%;">


                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Client</label>
                                <div class="">

                                    <input type="text" id="txtClient" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" placeholder="-----Click to select Customer-----" />
                                </div>
                            </div>

                            <div style="width: 12.5%;">
                                <label for="html5-number-input" class="col-form-label label-custom">OPT # </label>
                                <div class="">

                                    <input type="text" id="txtOptNumber" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" disabled />
                                </div>
                            </div>

                            <div style="width: 37.5%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Project</label>
                                <div class="">


                                    <input type="text" id="txtProjectName" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" disabled />

                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Location</label>
                                <div class="">

                                    <input type="text" id="txtProjectLocation" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />
                                </div>
                            </div>





                        </div>

                        <div class="row">

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Address </label>
                                <div class="">

                                    <input type="text" id="txtAddress" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />
                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Tel</label>
                                <div class="">

                                    <input type="text" id="txtTel" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />
                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Contact Person</label>
                                <div class="">
                                        

                                    <input type="text" id="txtPrjContactPerson" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" placeholder="-----Click to select Contact Person-----" />

                                </div>
                            </div>


                            <div style="width: 4%; display: none;" class="div-New">
                                <label for="html5-number-input" class="col-form-label label-custom"></label>
                                <div class="">


                                    <img src="images/gif-user.gif" title="Add New" class="fa-icon-hover" style="cursor: pointer; width: 36px; padding-top: 11px;" />

                                </div>
                            </div>


                            <div style="width: 25%;" class="div-win">
                                <label for="html5-number-input" class="col-form-label label-custom">Em@il</label>
                                <div class="">


                                    <input type="text" id="txtEm" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />

                                </div>
                            </div>





                        </div>

                        <div class="row">

                            <div style="width: 21%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Price Validity </label>
                                <div class="">
                                    <select id="ddlPriceValidity" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                    </select>

                                </div>
                            </div>
                            <div style="width: 4%;">
                                <label for="html5-number-input" class="col-form-label label-custom"></label>
                                <div class="">


                                    <img src="images/gif-created-new.gif" title="Add New" class="fa-icon-hover AddPriceValidity" style="cursor: pointer; width: 36px; padding-top: 11px;" />

                                </div>
                            </div>

                            <div style="width: 21%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Payment Terms</label>
                                <div class="">
                                    <select id="ddlPaymentTerm" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                    </select>

                                </div>
                            </div>
                            <div style="width: 4%;">
                                <label for="html5-number-input" class="col-form-label label-custom"></label>
                                <div class="">


                                    <img src="images/gif-created-new.gif" title="Add New" class="fa-icon-hover AddPayment" style="cursor: pointer; width: 36px; padding-top: 11px;" />

                                </div>
                            </div>
                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Dead Line Date</label>
                                <div class="">

                                    <input type="Date" id="txtDeadLineDate" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />

                                </div>
                            </div>
                            <div style="width: 25%;" class="div-tender-Closing-Date">
                                <label for="html5-number-input" class="col-form-label label-custom">Tender CLosing Date</label>
                                <div class="">


                                    <input type="date" id="txtTenderClosingDate" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />

                                </div>
                            </div>

                        </div>
                        <div class="row">

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Special Note </label>
                                <div class="">
                                    <textarea id="txtSpecialNote" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;"></textarea>

                                </div>
                            </div>
                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Discount Amount</label>
                                <div class="">
                                    <input type="number" id="txtDiscountAmount" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" placeholder="0.0" />
                                </div>
                            </div>
                            <div style="width: 25%;">
                            </div>
                            <div style="width: 25%; align-self: self-end;" class="Quotation_Buttons">

                               
                                   
                              
                            </div>
                        </div>

                        <br />
                        
                       





                    </div>






                    <%--Grid--%>


                    <div style="margin-top: 1.5%;" class="Line-Data">

                        <div class="nav-align-top">
                            <ul class="nav nav-tabs" id="Estimation-Det-modal-ul" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Product" aria-controls="navs-top-Product" aria-selected="true">Product</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Attachment" aria-controls="navs-top-Attachment" aria-selected="false">Attachment</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Approval" aria-controls="navs-top-Approval" aria-selected="false">Approval Status</button>
                                </li>


                            </ul>
                            <div class="tab-content">

                                <%--  <div class="tab-pane fade show active" id="navs-top-Dashboard" role="tabpanel" style="margin-top: -1%;">--%>

                                <%--<div> 
                             <a href="#" class="btn btn-primary pull-right btn-add-mstone-grid"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Milestone</a>
                         </div>
                         
                              
                </div>

                  <%--2nd--%>



                                <div class="tab-pane fade show active" id="navs-top-Product" role="tabpanel">
                                    <div>
                                        <a href="#" id="btnNewAddProduct" class="btn btn-primary pull-right"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</a>
                                    </div>
                                    <div style="padding-top: 2%">

                                        <table class="table Product-list-table" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead class="thead-Product-list">
                                              
                                            </thead>
                                            <tbody class="tbody-Product-list" style="text-align: center;">
                                            </tbody>
                                        </table>

                                    </div>
                                </div>

                                <%--3rd--%>


                                <div class="tab-pane fade" id="navs-top-Attachment" role="tabpanel">

                                    <div>
                                        <a href="#" id="btnNewAttacment" class="btn btn-primary pull-right" style="display:none"><i class="fa fa-plus" aria-hidden="true" ></i>&nbsp;New Attachment</a>
                                    </div>
                                    <div style="padding-top: 2%">


                                        <table class="table Attachment-list-table" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th style="display: none;">Id</th>
                                                    <th>Filename</th>
                                                    <th>Comments</th>
                                                    <th style="display: none;">Comments</th>
                                                    <th>Action</th>


                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Attachment-list" style="text-align: center;">
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="navs-top-Approval" role="tabpanel">


                                    <div>


                                        <table class="table Approval-list-table" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead>
                                                <tr style="text-align: center;">

                                                    <th>Role</th>
                                                    <th>User</th>
                                                    <th>Status</th>
                                                    <th>Comments</th>
                                                    <th>Date</th>


                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Approval-list" style="text-align: center;">
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




    <div class="modal fade" id="ModalCustomerDetails" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title" id="lblprojDetailModal">Customer Details</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">



                    <div class="New-Add" style="margin-top: -1%;">

                        <a href="#" id="btnAddCustomer" class="btn btn-primary" style="float: right;"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</a>
                    </div>
                    <%--Grid--%>
                    <div style="margin-top: 3%;">

                        <div class="nav-align-top">
                            <ul class="nav nav-tabs" id="mstone-task-modal-ul" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Customer" aria-controls="navs-top-Customer" aria-selected="true">Customer</button>
                                </li>


                            </ul>
                            <div class="tab-content">
                                <%--1st--%>
                                <div class="tab-pane fade show active" id="navs-top-Customer" role="tabpanel" style="margin-top: -1%;">

                                    <%--            <div>
                                       <a href="#" class="btn btn-primary pull-right btn-add-tenant-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Tenant</a>
                                   </div>--%>

                                    <div class="table-responsive" style="margin-top: 1%; width: 100%;">

                                        <table class="table table-Customer-Details" style="width: 100%;">

                                            <thead>
                                                <tr style="text-align: center;">


                                                    <th style="display: none;">CRMAccountId</th>
                                                    <th>Account Name</th>
                                                    <th style="display: none;">OwnerId</th>
                                                    <th>Owner</th>
                                                    <th>Company</th>
                                                    <%--  <th>Substage </th>
                                                   <th>Value </th>--%>
                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Customer-details" style="text-align: center;">
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
    <div class="modal fade" id="ModalOpportuniryDetails" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title" id="lbloPPModal">OPPORTUNITY DETAILS</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="New-Add" style="margin-top: -1%;">

                        <a href="#" id="btnAddOpp" class="btn btn-primary" style="float: right;"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</a>
                    </div>


                    <%--Grid--%>


                    <div style="margin-top: 3%;">

                        <div class="nav-align-top">
                            <ul class="nav nav-tabs" id="mstone-Opp-modal-ul" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Costomer" aria-controls="navs-top-Costomer" aria-selected="true">Opportunity</button>
                                </li>


                            </ul>
                            <div class="tab-content">
                                <%--1st--%>
                                <div class="tab-pane fade show active" id="navs-top-Det" role="tabpanel" style="margin-top: -1%;">

                                    <%--            <div>
                                       <a href="#" class="btn btn-primary pull-right btn-add-tenant-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Tenant</a>
                                   </div>--%>

                                    <div class="table-responsive" style="margin-top: 1%; width: 100%;">

                                        <table class="table table-Opportunity-Details" style="width: 100%;">

                                            <thead>
                                                <tr style="text-align: center;">


                                                    <th style="display: none;">OpportunitId</th>
                                                    <th>Opportunity Numbere</th>
                                                    <th>Name</th>
                                                    <th>Owner</th>
                                                    <th>MEP Contractor</th>
                                                    <th>MEP Consultant</th>
                                                    <th>Sales Stage</th>
                                                    <th>Status</th>
                                                    <th>Company</th>


                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Opportunity-details" style="text-align: center;">
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
    <div class="modal fade" id="ModalContact" tabindex="-2" aria-hidden="true" style="background-color: #13131466" data-bs-backdrop="static">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalcontact">CONTACT DETAILS</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">

                    <a href="#" id="btnNewContact" class="btn btn-primary pull-right" style="float: right">New Contact</a>

                    <table class="table table-bordered table-striped Contact-item-list-table" style="width: 100%;">


                        <thead>

                            <tr>
                                <th style="display: none">Contact Id</th>
                                <th>Contact Name</th>
                                <th>Email</th>
                                <th>Phone Number</th>




                            </tr>
                        </thead>


                        <tbody class="tbody-Contact">
                        </tbody>
                    </table>


                    <div class="modal-footer">
                        <%--<button type="button" id="Button2" class="btn btn-primary" runat="server" data-bs-dismiss="modal">Add</button>--%>
                        <%--<input type="button" id="btnSOOrgAdd" class="btn btn-primary" runat="server" value="Add" />--%>
                    </div>
                </div>
            </div>
        </div>

    </div>

       <div class="modal fade" id="mpDropDownValues" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                     <div class="modal-header">
                    <h5 class="modal-title" ">Enter the value for the dropdown list</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body" style="text-align: center;">
                     <input class="form-control" type="text" value="" id="txtDropdownValue" />
                        <input type="hidden" id="hfdDropdownId" />
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 41%;">
                         <button id="btnSaveDrodownValue" type="button" class="btn btn-primary" data-bs-dismiss="modal">Save </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
   

        <div class="modal fade" id="modalAddNewProduct" style="background: rgb(177 171 171 / 36%); zoom: 90%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="width: 60%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddNewProduct">NEW PRODUCT</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div style="background: #dbdbdb5c; padding: 17px; border-radius: 12px; border: 1px solid #dbd7d6; box-shadow: 0px 0px 13px -7px #444444;">
                        <div class="Sale-Item-Details">
                            <div class="row">
                                <div style="width: 12%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">SL NO</label>
                                    <div>
                                        <input type="number" id="txtSLNo" class="form-control textbox-border-color" placeholder="0" />

                                    </div>
                                </div>
                                <div style="width: 68%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Requested Item/Description</label>
                                    <div>
                                        <input type="text" id="txtReqItemDesc" class="form-control textbox-border-color" />
                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Requested Qty</label>
                                    <div>
                                        <input type="number" id="txtReqQty" class="form-control textbox-border-color" placeholder="0.0" />

                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="Estimation-Item-Details">
                            <div class="row">

                                <div style="width: 80%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Item/Description</label>
                                    <div>
                                        <input type="text" id="txtItemDesc" class="form-control textbox-border-color" />
                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Qty</label>
                                    <div>
                                        <input type="number" id="txtQty" class="form-control textbox-border-color" placeholder="0.0" />

                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div style="width: 30%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Model</label>
                                    <div>
                                        <input type="text" id="txtModel" class="form-control textbox-border-color" />
                                    </div>
                                </div>
                                <div style="width: 30%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Supplier</label>
                                    <div>
                                        <input type="text" id="txtSupplier" class="form-control textbox-border-color" />

                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Supplier Type</label>
                                    <div>
                                        <select id="ddlSupplierType" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                            <option value="-1">--Select--</option>
                                            <option value="LOCAL">Local</option>
                                            <option value="OVERSEAS">Overseas</option>

                                        </select>

                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Product Catgoery</label>
                                    <div>
                                        <select id="ddlProductCategory" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                            <option value="-1">--Select--</option>
                                            <option value="Fire">Fire</option>
                                            <option value="Safety">Safety</option>
                                            <option value="Rescue">Rescue</option>
                                            <option value="Rescue">Rescue</option>
                                            <option value="Other">Other</option>

                                        </select>

                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">UOM</label>
                                    <div>
                                        <input type="text" id="txtUOM" class="form-control textbox-border-color" />
                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Cost Price</label>
                                    <div>
                                        <input type="number" id="txtCostPrice" class="form-control textbox-border-color costCalculation" placeholder="0.0" />

                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Currency</label>
                                    <div>
                                        <select id="ddlCostCurrency" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                        </select>

                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Exchange Rate</label>
                                    <div>
                                        <input type="number" id="txCostExchangeRate" class="form-control textbox-border-color costCalculation" placeholder="0.0" />

                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Unit Cost (AED)</label>
                                    <div>
                                        <input type="number" id="txtUnitCostAED" class="form-control textbox-border-color costCalculation" placeholder="0.0" disabled />

                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Shipping CHarge</label>
                                    <div>
                                        <input type="number" id="txtShippingCharge" class="form-control textbox-border-color costCalculation" placeholder="0.0" />
                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Landed Cost</label>
                                    <div>
                                        <input type="number" id="txtLandedCost" class="form-control textbox-border-color " placeholder="0.0" disabled />

                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Total Landed Cost</label>
                                    <div>
                                        <input type="number" id="txtTotalLandedCost" class="form-control textbox-border-color" placeholder="0.0" disabled />

                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">O/H</label>
                                    <div>
                                        <input type="number" id="txtOH" class="form-control textbox-border-color costCalculation" placeholder="0.0" />

                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Landed Cost Overhead</label>
                                    <div>
                                        <input type="number" id="txtLandedCostOH" class="form-control textbox-border-color" placeholder="0.0" disabled />

                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Margin</label>
                                    <div>
                                        <input type="number" id="txtMargin" class="form-control textbox-border-color costCalculation" placeholder="0.0" />
                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Unit Selling Price(AED)</label>
                                    <div>
                                        <input type="number" id="txtUnitSellingPrice" class="form-control textbox-border-color" placeholder="0.0" disabled />

                                    </div>
                                </div>
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Total Selling Price (AED)</label>
                                    <div>
                                        <input type="number" id="txtTotalSellingPrice" class="form-control textbox-border-color" placeholder="0.0" disabled />

                                    </div>
                                </div>
                                <div style="width: 40%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Delivery</label>
                                    <div>
                                        <input type="text" id="txtDelivery" class="form-control textbox-border-color" />

                                    </div>
                                </div>

                            </div>



                        </div>


                       

                        </div>



                </div>
                <div class="modal-footer">
                     <div class="row">
                            <div style="float: right;">
                                <a href="#" id="btnSaveProductDet" class="btn btn-primary pull-right" style="float: right;">Update</a>
                            </div>
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
            var overAllPerfo = 0;
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



    <!-- Datatable plugin JS library file -->
    <script src="Scripts/Quotation.js?v=0.5"></script>

    <%--      <link href="Css/ERMStyle.css" rel="stylesheet" />--%>
    <%--       <link href="Css/ERMtextbox.scss" rel="stylesheet" />--%>

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>
</asp:Content>

