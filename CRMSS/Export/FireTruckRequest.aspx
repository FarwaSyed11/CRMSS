<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="FireTruckRequest.aspx.cs" Inherits="ERM_FireTruckRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    s

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
     .tableHeading th{
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

     .FireTruckRequest-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

             .FireTruckRequest-list-table td
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

                   .table-Consultant-Details th {
    text-align: center;
    color: white !important;
    background-color: #d54832;
}

     .table-Consultant-Details td
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

 .submit-button:hover
 {
     content:url("images/gif-submit-progress.gif");
 }

  .select2-container--default .select2-selection--single { 

     padding-top:1% !important;

  }

  .Save-button:hover
{
    content:url("images/gif-submit-progress.gif");
}
   
     hr.new1 {
  border-top: 1px solid red;
}
           .setzoom {
           zoom:85% !important;
           }

           .green {
               color:green;
           }
           .orange {
               color:orange;
           }
           .red {
               color:red;
           }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div style="padding-left: 2%; padding-top: 1%;">
            <h4 style="text-shadow: 1px -1px 8px; color: #a92828;">Fire Truck Request</h4>
        </div>

        <div class="card-body" style="margin-top: -1%;">

            <%-- status drop menu --%>

            <div class="row">
                <table class="table table-condensed tblfilter" style="border-bottom-width: 1px !important;" runat="server" id="tbltopsearch">
                    <tr>
                        <td class="no-border" style="width: 5%">
                            <asp:Label ID="Label8" Text="Status" runat="server" Font-Size="Medium" Font-Bold="true" />
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

            <%-- firetruck table --%>

            <div class="ajax-loader loader-bg-blur">
                <div class="custom-loader ">
                    <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
                    <h4>Loading Data...</h4>
                </div>
            </div>
            <div class="" style="margin-top: 1%;">
                <table class="table FireTruckRequest-list-table">

                    <thead>
                        <tr>

                            <th class="hidden">ReqID</th>
                            <th class="hidden">OrderStatus</th>
                            <th class="hidden">RoleID</th>
                            <th> Request No</th>
                            <th>Date</th>
                            <th>Opportunity Number</th>

                            <th>Project</th>
                            <th>Customer</th>
                            <th>Status</th>
                            <th>Action</th>

                        </tr>

                    </thead>
                    <tbody class="tbody-FireTruckRequest">
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <%-- fire truck request form pop up  --%>

    <div class="modal fade" id="NewRequest" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document" style="max-width: 85%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <div class="row" style="width: 100%;">

                        <div class="col-6">
                            <h4 class="modal-title" id="EstimationDet">REQUEST DETAILS</h4>
                        </div>

                        <div style="width: 47.666%;">
                        </div>

                        <div style="width: 1.333%;">
                            <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                    </div>



                </div>
                <div class="modal-body" style="zoom: 85%">





                    <div id="Estimation-details-rectangle-div" style="background: #e14f0c17; padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">

                        <div class="row">

                            <div style="width: 10%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Request No.</label>
                                <div class="">

                                    <input type="text" id="txtrequestID" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" disabled/>
                                </div>
                            </div>

                            <div style="width: 15%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Customer</label>
                                <div class="">

                                    <input type="text" id="txtCustomer" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" placeholder=" Click to view customer details " />
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
                                <label for="html5-number-input" class="col-form-label label-custom">End User</label>
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
                                <label for="html5-number-input" class="col-form-label label-custom">Contact Person</label>
                                <div class="">


                                    <input type="text" id="txtPrjContactPerson" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" placeholder="  Click to view contact person details" />

                                </div>
                            </div>
                            <div style="width: 25%;" class="div-win">
                                <label for="html5-number-input" class="col-form-label label-custom">Email</label>
                                <div class="">


                                    <input type="text" id="txtEm" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />

                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Category </label>
                                <div class="">

                                    <select id="ddlCategoryType" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;" placeholder="--Select--">

                                        <option value="Goverment">Goverment</option>
                                        <option value="Consultant">Consultant</option>
                                        <option value="Contractor">Contractor</option>
                                        <option value="Distributor">Distributor</option>
                                        <option value="Agent">Agent</option>
                                        <option value="Client">Client</option>
                                    </select>

                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div style="width: 25%;" class="div-win">
                                <label for="html5-number-input" class="col-form-label label-custom">Owner</label>
                                <div class="">


                                    <input type="text" id="txtOwner" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" disabled />

                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Special Note</label>
                                <div class="">
                                    <textarea id="txtSpecialNote" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;"></textarea>

                                </div>
                            </div>
                        </div>

                        <hr class="new1">
                        <div class="row" style="margin-top: 1%;">


                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Project Status</label>
                                <div class="">

                                    <select id="ddlProjectStatus" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;" placeholder="--Select--">

                                        <option value="Proposal">Proposal</option>
                                        <option value="JobOnHand">J.O.H</option>
                                        <option value="Budgetary">Budgetary</option>
                                    </select>

                                </div>


                                <div style="width: 100%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Is this a tender? </label>
                                    <div class="">

                                        <select id="ddlTenderStatus" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;" placeholder="--Select--">

                                            <option value="True">Yes</option>
                                            <option value="False">No</option>
                                        </select>

                                    </div>

                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Offer Package</label>
                                <div class="">

                                    <input type="checkbox" id="package1" name="nmOfferPackage" value="CommercialOffer" onclick="OfferPackageclick()">
                                    <label for="package1">Commercial Offer</label><br>
                                    <input type="checkbox" id="package2" name="nmOfferPackage" value="TechnicalSpecification" onclick="OfferPackageclick()">
                                    <label for="package2">Technical Specification</label><br>
                                    <input type="checkbox" id="package3" name="nmOfferPackage" value="Drawing" onclick="OfferPackageclick()">
                                    <label for="package3">Drawing</label><br>
                                    <input type="checkbox" id="package4" name="nmOfferPackage" value="ComplianceSheet" onclick="OfferPackageclick()">
                                    <label for="package4">Compliance Sheet</label><br>
                                    <input type="checkbox" id="package5" name="nmOfferPackage" value="Others" onclick="OfferPackageclick()">
                                    <label for="package5">Others</label><br>
                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Required Date</label>
                                <div class="">

                                    <input type="Date" id="txtDateRequired" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />

                                </div>
                                <div style="width: 100%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Decision Date</label>
                                    <div class="">

                                        <input type="Date" id="txtDecisionDate" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />

                                    </div>
                                </div>
                            </div>
                            <div style="width: 25%;">
                                <div class="div-tender-Closing-Date">
                                <label for="html5-number-input" class="col-form-label label-custom">Tender Closing Date</label>
                                <div class="">
                                    <input type="Date" id="txtTenderClosingDate" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />

                                </div>
                              </div>

                                <div style="width: 100%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">WINNING%</label>
                                    <div class="">

                                        <select id="ddlWinStatus" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;" placeholder="--Select--">

                                            <option value="100">100%</option>
                                            <option value="95">95%</option>
                                            <option value="90">90%</option>
                                            <option value="85">85%</option>
                                            <option value="80">80%</option>
                                            <option value="75">75%</option>
                                            <option value="70">70%</option>
                                            <option value="65">65%</option>
                                            <option value="60">60%</option>
                                            <option value="55">55%</option>
                                            <option value="50">50%</option>
                                            <option value="45">45%</option>
                                            <option value="40">40%</option>
                                            <option value="35">35%</option>
                                            <option value="30">30%</option>
                                            <option value="25">25%</option>
                                            <option value="20">20%</option>
                                            <option value="15">15%</option>
                                            <option value="10">10%</option>
                                            <option value="5">5%</option>
                                            <option value="0">0%</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <br />
                        <br />


                       <div class="row">
      <div style="width: 25%;" class="dvAssignedET">
      </div>

      <div style="width: 25%;" class="dvAssignedQT">
      </div>

       <div style="width: 25%;" class="dvEstimationFile">
      </div>

       <div style="width: 25%;" class="">
      </div>
                            </div>
                        <div class="row QTDetails">
                           


                        </div>

                        <div class="row">
                            <div style="width:80%">

                            </div>
                            <div style="width: 20%; align-self: self-end;" class="FireTruck_Buttons">

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
                                     <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Comments" aria-controls="navs-top-Attachment" aria-selected="false">Comments</button>
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

                <%--1nd--%>


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
                                 <%--2nd--%>


                                <div class="tab-pane fade" id="navs-top-Comments" role="tabpanel">

                                    <div>
                                        <a href="#" id="btnNewComment" class="btn btn-primary pull-right"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add new Comment</a>
                                    </div>
                                    <div style="padding-top: 2.5%">


                                        <table class="table tableHeading Comment-list-table" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th class="hidden">ID</th>
                                                    <th>Comment</th>
                                                    <th>Updated By</th>
                                                    <th>Updated Date</th>
                                                    <th>Mail Raised</th>



                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Comment-list" style="text-align: center;">
                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                                <%--3rd--%>


                                <div class="tab-pane fade" id="navs-top-Attachment" role="tabpanel">

                                    <div>
                                        <a href="#" id="btnNewAttacment" class="btn btn-primary pull-right"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;New Attachment</a>
                                    </div>
                                    <div style="padding-top: 2.5%">


                                        <table class="table Attachment-list-table" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th class="hidden">URL</th>
                                                    <th class="hidden">ID</th>
                                                    <th>File Name</th>
                                                    <th>Description</th>
                                                    <th>Updated By</th>
                                                    <th>Updated Date</th>
                                                    <th>Actions</th>


                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Attachment-list" style="text-align: center;">
                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                                <%--4th--%>

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


            </div>
            <%--  <div class="modal-footer">
               <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary">Save changes</button>
             </div>--%>
        </div>
    </div>


    <%-- modal customer details --%>

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

    <%-- modal opportunity details --%>

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


                                                    <th style="display: none;">OpportunityId</th>
                                                    <th>Opportunity Number</th>
                                                    <th>Name</th>
                                                    <th>Assistant Owner</th>
                                                    <th>Owner</th>
                                                    <th>Country</th>



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

    <%-- modal contact details --%>

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


    <%-- add new product --%>

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
                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Category</label>
                                    <div>
                                        <select id="ddlProductCategory" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                        </select>

                                    </div>
                                </div>

                                <div style="width: 50%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Product List</label>
                                    <div>
                                        <select id="ddlProductList" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                        </select>

                                    </div>
                                </div>

                            </div>

                            <div class="row">

                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Quantity</label>
                                    <div>
                                        <input type="number" id="txtQuantity" class="form-control textbox-border-color" placeholder="0.0" />

                                    </div>
                                </div>

                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Unit Budget</label>
                                    <div>
                                        <input type="number" id="txtUnitBudget" class="form-control textbox-border-color costCalculation" placeholder="0.0" />

                                    </div>
                                </div>

                                <div style="width: 20%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Currency</label>
                                    <div>
                                        <select id="ddlCurrency" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                            <option value="AED">AED</option>
                                            <option value="USD">USD</option>
                                            <option value="SAR">SAR</option>
                                            <option value="OMR">OMR</option>
                                            <option value="EUR">EUR</option>
                                        </select>

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
                           <input class="form-control" type="file" id="fuDocument" >
                       </div>
                   </div>



               </div>

           </div>
       </div>
   </div>


    <%-- modal add new customer  --%>

    <div class="modal fade" id="mpReqCustomer" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 92vw!important; top: 10%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">New Customer</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                    <div class="row">
                        <i class="icontransform RequestNewCustomer fa fa-floppy-o" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Save"></i>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-6">
                            <label class="col-form-label label-custom" for="basic-default-name">Customer Name</label>
                            <div class="">
                                <input class="form-control" type="text" id="txtNewCustomerName" />
                            </div>
                        </div>
                        <div class="col-2">
                            <label class="col-form-label label-custom" for="basic-default-name">Primary Category</label>
                            <div class="">
                                <select id="ddlCustomerCategory" class="form-select color-dropdown"></select>
                            </div>
                        </div>

                        <div class="col-2">
                            <label class="col-form-label label-custom" for="basic-default-name">Country</label>
                            <div class="">
                                <select id="ddlCustomerCountry" class="form-select color-dropdown"></select>
                            </div>
                        </div>
                        <div class="col-2">
                            <label class="col-form-label label-custom" for="basic-default-name">City</label>
                            <div class="">
                                <select id="ddlCustomerCity" class="form-select color-dropdown"></select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <label class="col-form-label label-custom" for="basic-default-name">Phone</label>
                            <div class="">
                                <input class="form-control" type="text" id="txtCustomerPhone" />
                            </div>
                        </div>
                        <div class="col-2">
                            <label class="col-form-label label-custom" for="basic-default-name">Email</label>
                            <div class="">
                                <input class="form-control" type="text" id="txtCustomerEmail" />
                            </div>
                        </div>
                        <div class="col-3">
                            <label class="col-form-label label-custom" for="basic-default-name">URL</label>
                            <div class="">
                                <input class="form-control" type="text" id="txtCustomerURL" />
                            </div>
                        </div>

                        <div class="col-3">
                            <label class="col-form-label label-custom" for="basic-default-name">Address</label>
                            <div class="">
                                <textarea id="txtCustomerAddress" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="col-2">
                            <label class="col-form-label label-custom" for="basic-default-name">Remarks</label>
                            <div class="">
                                <textarea id="txtRemarks" class="form-control" placeholder="Please add project location"></textarea>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <%-- modal add new opportunity --%>

    <div class="modal fade" id="mpaddNewOPT" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 92vw!important; top: 10%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">NEW OPPORTUNITY</h5>
                    <button type="button" class="btn-close btn-close-event-modal" data-bs-dismiss="modal" aria-label="Close">
                    </button>
                    <div class="row">
                        <i class="icontransform CreateNewOPT fa fa-floppy-o" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Save New OPT"></i>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-8">
                            <label class="col-form-label label-custom" for="basic-default-name">Opportunity Name</label>
                            <div class="">
                                <input class="form-control" type="text" id="txtNewOPTName" />
                                <input type="hidden" id="hfdCustomerId" />
                            </div>
                        </div>

                        <div class="col-2">
                            <label class="col-form-label label-custom" for="basic-default-name">SubStage</label>
                            <div class="">
                                <select id="ddlSubstage" class="form-select color-dropdown">
                                    <option value="J.O.H">J.O.H</option>
                                    <option value="Tender">Tender</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-2">
                            <label class="col-form-label label-custom" for="basic-default-name">End user Location</label>
                            <div class="">
                                <select id="ddlProjectCountry" class="form-select color-dropdown">
                                </select>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>


    <%-- modal add new contact --%>

    <div class="modal fade" id="ModalAddNewContact" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="max-width: 60%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalNewContact">NEW CONTACT</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">



                    <div style="margin-top: -1%;">
                        <div style="background: #1d1b1b36; padding: 17px; border-radius: 12px; border: 1px solid #1d1b1b36; box-shadow: 0px 0px 13px -7px #1d1b1b36;">

                            <div>
                                <h5 class="prpmdl-hed" style="text-decoration: underline;">CONTACT</h5>
                            </div>

                            <div class="row" style="margin-top: 1%;">

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Contact Name </label>
                                    <div class="">


                                        <input type="text" id="txtContactName" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;" />
                                    </div>

                                    <%--<div class="wrap">
                                         <label for="txtContactName">Contact Name</label>
                                         <input id="txtContactName" type="text" class="cool" />
                                     </div>--%>
                                </div>

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Job Title </label>
                                    <div class="">


                                        <input type="text" id="txtJobTitle" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;" />
                                    </div>
                                </div>


                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Gender </label>
                                    <div class="">


                                        <select id="ddlGender" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                            <option value="MALE">Male</option>
                                            <option value="FEMALE">Female</option>
                                        </select>
                                    </div>
                                </div>



                            </div>


                            <div class="row" style="margin-top: 1%;">

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Phone Number </label>
                                    <div class="">


                                        <input type="text" id="txtPhoneNumber" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                    </div>
                                </div>

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Email </label>
                                    <div class="">


                                        <input type="text" id="txtEmail" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;" />
                                    </div>
                                </div>

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Country </label>
                                    <div class="">


                                        <select id="ddlCountry" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="margin-top: 1%;">

                                  <div style="width: 33.33%;">
      <label for="html5-number-input" class="col-form-label label-custom">City </label>
      <div class="">


          <select id="ddlCity" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
          </select>
      </div>
  </div>




                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Nationality </label>
                                    <div class="">


                                        <input type="text" id="txtNationality" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;" />
                                    </div>
                                </div>


                            </div>


                            <div class="row" style="padding-top: 1%;">
                                <div class="col-12">
                                    <a href="#" id="btnAddContact" class="btn btn-primary pull-right" style="width: 10%;">Add</a>
                                </div>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="mpActionComments" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Please enter The action remarks</h5>
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



        <%-- modal task information details --%>

    <div class="modal fade" id="ModalTaskDetails" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title">Task Details</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div style="margin-top: 3%;">


                        <div class="table-responsive" style="margin-top: 1%; width: 100%;">

                            <table class="table table-Task-Details tableHeading" style="width: 100%;">

                                <thead>
                                    <tr style="text-align: center;">

                                        <th>Name</th>
                                        <th>Assigned</th>
                                        <th>Completed</th>
                                        <th>Pending</th>
                                        <th>Completion Percentage</th>
                                    </tr>
                                </thead>
                                <tbody class="tbody-Task-details" style="text-align: center;">
                                </tbody>
                            </table>

                        </div>
                    </div>




                </div>

            </div>
        </div>
    </div>




    <div class="modal fade" id="mpPdfviewer" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="width: auto">
                <div class="modal-header">
                    <h5 class="modal-title"></h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body dvpdfview" style="text-align: center;">

                    <iframe id="myIframe" src="" style="height: 1150px; width: 841px;"></iframe>



                </div>

            </div>

        </div>
    </div>

       <!-- Comments -->
   <div class="modal fade" id="mpGeneralComments" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
       <div class="modal-dialog modal-xl" role="document" style="max-width: 35vw!important; top: 10%;">
           <div class="modal-content">
               <div class="modal-header">
                   <h5 class="modal-title">General Comments</h5>
                   <button
                       type="button"
                       class="btn-close btn-close-event-modal"
                       data-bs-dismiss="modal"
                       aria-label="Close">
                   </button>
                   <div class="row">
                       <i class="icontransform SavegeneralComments fa fa-floppy-o" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Save"></i>
                   </div>
               </div>
               <div class="modal-body">
                 
                   <div class="row">
                       <div class="col mb-3">
                           <label for="nameBasic" class="form-label">Comments </label>
                           <textarea class="form-control" id="txtComments" rows="3"></textarea>
                       </div>
                   </div>
                   <div class="row">
                       <div class="col-4">
                           <div class="">
                               <label for="html5-number-input" class="col-form-label label-custom">Raise E-mail</label>
                               <div>
                                   <div class="netliva-switch" style="padding-left: 20px;">
                                       <input type="checkbox" id="cbRaiseEmail" netliva-switch="OK" onchange="EmailToActive()">
                                       <label for="cbRaiseEmail" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="col-8 emailTo-Select" >
                           <div class="">
                               <label for="html5-number-input" class="col-form-label label-custom">Email-To</label>
                               <div>
                                   <select id="ddlEmailTo" style="z-index: 99 !important;" class="form-select color-dropdown" multiple>
                                </select>
                            
                               </div>
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
    <script src="Scripts/FireTruckRequest.js?v=8"></script>

    <%--      <link href="Css/ERMStyle.css" rel="stylesheet" />--%>
    <%--       <link href="Css/ERMtextbox.scss" rel="stylesheet" />--%>

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

        <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
        <script src="../TODONew/Asset/js/netliva_switch.js"></script>

          <script src="Assets/Js/multiple-select.js"></script>
         <link href="../sitesurvey/Assets/Css/multiple-select.css" rel="stylesheet" />

</asp:Content>

