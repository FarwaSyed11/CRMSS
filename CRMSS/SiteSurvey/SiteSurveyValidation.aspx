<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="SiteSurveyValidation.aspx.cs" Inherits="SiteSurvey_SiteSurveyValidation" %>

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
    box-shadow: 0px 1px 7px #e14b4b;
    border-radius: 3px;
    background: white;
    width: 15%;
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

     .maindata-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

             .maindata-list-table td
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


              .table-Costomer-Details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

             .table-Costomer-Details td
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



               .Project-item-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

             .Project-item-list-table td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }

           table.dataTable tbody tr:hover {
               background-color: #ff6f591a !important;
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

 .tbody-maindata .ibtn-Request-Details:hover
 {
     content:url("../icons/newicons/output-onlinegiftools.gif");
 }

 .tbody-Attachment-list .ibtn-Request-Details:hover
 {
     content:url("images/gif-download.gif");
 }

 .submit-button:hover
 {
     content:url("../icons/newicons/gif-submit-progress.gif");
 }

  .select2-container--default .select2-selection--single { 

     padding-top:1% !important;

  }
  .Project-item-list-table tr:hover{
    cursor: pointer;
}
  .imageview {
 
 
  transition: transform .2s;
  width: 600px;
  height: 600px;
  margin: 0 auto;
}
           .imageview:hover {
            -ms-transform: scale(1.6); /* IE 9 */
  -webkit-transform: scale(1.6); /* Safari 3-8 */
  transform: scale(1.6); 
           }
.bg-label-gray {
    background-color: rgb(160 160 160 / 86%) !important;
    color: rgb(67 89 113) !important;
}
   
</style>

 </asp:Content>
 <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    


    
     <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
         <div style="padding-left: 2%; padding-top: 1%;">
             <h4 style="text-shadow: 1px -1px 8px; color: #a92828;">Survey Details</h4>
         </div>

         <div class="card-body" style="margin-top: -1%;">

             <div class="row">
                 <table class="table table-condensed tblfilter" style="border-bottom-width: 1px !important;" runat="server" id="tbltopsearch">
                     <tr>

                         <td class="no-border  label-alignment" style="width: 3%">
                             <asp:Label ID="Label8" Text="From Date" runat="server" Font-Size="Medium" Font-Bold="true" />
                         </td>
                         <td class="no-border" style="width: 12%">
                             <input type="date" class="form-control" id="txtDate" />
                         </td>
                         <td class="no-border  label-alignment" style="width: 3%">
                            <asp:Label ID="Label3" Text="To Date" runat="server" Font-Size="Medium" Font-Bold="true" />
                        </td>
                        <td class="no-border" style="width: 12%">
                            <input type="date" class="form-control" id="txtToDate" />
                        </td>
                         <td class="no-border  label-alignment" style="width: 3%">
                             <asp:Label ID="Label1" Text="Surveyor" runat="server" Font-Size="Medium" Font-Bold="true" />
                         </td>
                         <td class="no-border" style="width: 12%">
                             <select id="ddlSurveyor" class="form-select color-dropdown">
                             </select>
                         </td>
                         <td class="no-border  label-alignment" style="width: 3%">
                             <asp:Label ID="Label2" Text="Status" runat="server" Font-Size="Medium" Font-Bold="true" />
                         </td>
                         <td class="no-border" style="width: 12%">
                             <select id="ddlStatus" class="form-select color-dropdown">
                               
                             </select>
                         </td>
                         <td class="no-border" style="width: 12%">
                             <a href="#" id="btnSearch" class="btn btn-primary" style="float: left;"><i class="fa fa-search" aria-hidden="true"></i>&nbsp;Search</a>
                         </td>
                         <td class="no-border" style="width: 30%; padding-top: 34px" />



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
                 <table class="table maindata-list-table">

                     <thead>
                         <tr>

                             <th class="hidden">SurveyID</th>
                             <th>Date</th>
                             <th>Project No</th>
                             <th>Name</th>
                             <th>Client</th>
                             <th>Consultant</th>
                             <th>Plot Number</th>
                             <th>Project Current Status</th>
                             <th>Surveyor</th>
                             <th>Comments</th>
                             <th>Status</th>
                             <th>Actions</th>


                         </tr>

                     </thead>
                     <tbody class="tbody-maindata">
                     </tbody>
                 </table>
             </div>


         </div>

     </div>
     





     <div class="modal fade" id="mdDetailView" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document" style="max-width: 85%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <div class="row" style="width: 100%;">

                        <div class="col-6">
                            <h4 class="modal-title" id="DetailViewHead">Survey Details</h4>
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

                    <div class="nav-align-top">
                        <ul class="nav nav-tabs" id="Estimation-Det-modal-ul" role="tablist">
                            <li class="nav-item">
                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-General" aria-controls="navs-top-General" aria-selected="true">General</button>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Gallery" aria-controls="navs-top-Gallery" aria-selected="false">Gallery</button>
                            </li>



                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="navs-top-General" role="tabpanel">

                                <div id="proj-details-rectangle-div" style="/*background: #e14f0c17; */ padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">
                                    <div class="row">

                                        <div style="width: 100%;">
                                            <h4>Survey Information</h4>

                                        </div>
                                        <hr />
                                    </div>
                                    <div class="row">

                                        <div style="width: 14%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Project Number</label>
                                            <div class="">
                                                <input type="text" id="lbProjectNumber" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                            </div>
                                        </div>

                                        <div style="width: 14%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Name</label>
                                            <div class="">
                                                <input type="text" id="lbName" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                            </div>
                                        </div>

                                        <div style="width: 14%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Client</label>
                                            <div class="">
                                                <input type="text" id="lbClient" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                            </div>
                                        </div>

                                        <div style="width: 14%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Consultant</label>
                                            <div class="">
                                                <textarea id="lbConsultant" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly=""></textarea>
                                            </div>
                                        </div>

                                        <div style="width: 14%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Plot No</label>
                                            <div class="">

                                                <input type="text" id="lbPlotNumber" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                            </div>
                                        </div>

                                        <div style="width: 14%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Cusrrent Status</label>
                                            <div class="">

                                                <input type="text" id="lbCurrentStatus" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                            </div>
                                        </div>


                                    </div>

                                    <div class="row" style="margin-top: 1%;">


                                        <div style="width: 14%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Surveyor</label>
                                            <div class="">
                                                <input type="text" id="lbSurveyor" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                            </div>
                                        </div>

                                        <div style="width: 14%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Comments</label>
                                            <div class="">
                                                <textarea id="lbComments" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly=""></textarea>
                                            </div>
                                        </div>
                                        <div style="width: 14%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Survey Date</label>
                                            <div class="">
                                                <input type="text" id="lbSurveyDate" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                            </div>
                                        </div>

                                        <div style="width: 14%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Status</label>
                                            <div class="">
                                                <input type="text" id="lbStatus" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                            </div>
                                        </div>




                                    </div>


                                </div>
                                <br />
                                <div id="dvValidation" style="/*background: #e14f0c17; */ padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">
                                    <div style="width: 100%;">
                                        <h4>Validated Information</h4>

                                    </div>
                                    <hr />

                                    <div class="row">
                                                    <div style="width: 20%;">




                                            <div>
                                                <b>Major Information :
                                                </b>
                                                <div class="list-group" id="MajorInforList" style="height: 200px; overflow-y: scroll;">
                                                    <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkNewProject"
                                                            type="checkbox">New Project
                                                    </label>
                                                       <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkLead"
                                                            type="checkbox">New Lead
                                                    </label>
                                                      <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkOpportunity"
                                                            type="checkbox">Opportunity
                                                    </label>
                                                    <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkNewConsultant"
                                                            type="checkbox">New Consultant
                                                    </label>
                                                    <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkNewContractor"
                                                            type="checkbox">New Contractor
                                                    </label>
                                                    <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkMainContractorAwarded"
                                                            type="checkbox">Main Contractor Awarded
                                                    </label>
                                                    <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkJOH"
                                                            type="checkbox">JOH
                                                    </label>
                                                    <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkLost"
                                                            type="checkbox">Lost
                                                    </label>
                                                    <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkHold"
                                                            type="checkbox">Hold
                                                    </label>
                                                    <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkContractorChanged"
                                                            type="checkbox">ContractorChanged
                                                    </label>
                                                    <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkConsultantChanged"
                                                            type="checkbox">ConsultantChanged
                                                    </label>
                                                    <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkRestarted"
                                                            type="checkbox">Restarted
                                                    </label>
                                                    <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkReTender"
                                                            type="checkbox">Re-Tender
                                                    </label>
                                                     <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkCompleted"
                                                            type="checkbox">Completed
                                                    </label>
                                                      <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkFencingOnly"
                                                            type="checkbox">Fencing Only
                                                    </label>
                                                   
                                                    <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkVilla"
                                                            type="checkbox">Villa
                                                    </label>
                                                     <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkMosque"
                                                            type="checkbox">Mosque
                                                    </label>
                                                       <label class="list-group-item">
                                                        <input class="form-check-input me-1" id="chkNoFireScope"
"
                                                            type="checkbox">No Fire Scope

                                                    </label>

                                                </div>
                                            </div>

                                        </div>
                                        <div style="width: 80%;">
                                            <div class="row">

                                                <div style="width: 15%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Project/Lead Number</label>
                                                    <div class="">
                                                        <input type="text" id="txtProjectNumber" class="form-control" placeholder="-Click to select Project---" />
                                                    </div>
                                                </div>

                                                <div style="width: 35%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Name</label>
                                                    <div class="">
                                                        <input type="text" id="txtProjectName" class="form-control" readonly />
                                                    </div>
                                                </div>

                                                <div style="width: 25%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Client</label>
                                                    <div class="">
                                                        <input type="text" id="txtClient" class="form-control" readonly />

                                                    </div>
                                                </div>


                                                <div style="width: 15%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Stage</label>
                                                    <div class="">
                                                        <input type="text" id="txtStage" class="form-control" readonly />

                                                    </div>
                                                </div>




                                            </div>

                                            <div class="row">
                                                <div style="width: 20%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Consultant</label>
                                                    <div class="">
                                                        <input type="text" id="txtConsultant" class="form-control" readonly />
                                                    </div>
                                                </div>
                                                <div style="width: 10%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Plot No</label>
                                                    <div class="">

                                                        <input type="text" id="txtPlotNumber" class="form-control" readonly />
                                                    </div>
                                                </div>
                                                <div style="width: 14%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Marketing</label>
                                                    <div class="">
                                                        <input type="text" id="txtMarketing" class="form-control" readonly />
                                                    </div>
                                                </div>

                                                <div style="width: 20%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Main Contractor</label>
                                                    <div class="">
                                                        <input type="text" id="txtMainContractor" class="form-control" readonly />
                                                    </div>
                                                </div>



                                                <div style="width: 15%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Status</label>
                                                    <div class="">
                                                        <input type="text" id="txtProjectStatus" class="form-control" readonly />
                                                    </div>
                                                </div>
                                                <div style="width: 20%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">CRM Comments</label>
                                                    <div class="">
                                                        <textarea id="txtCRMComments" class="form-control"></textarea>
                                                    </div>
                                                </div>




                                            </div>
                                            <div class="row">
                                                <div style="width: 44%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Master Project</label>
                                                    <div class="masterProjectLink">
                                                    </div>
                                                </div>
                                                <div style="width: 20%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Counted</label>
                                                    <div class="">
                                                        <select id="ddlCount" class="form-select color-dropdown">
                                                            <option value="-1">--Select--</option>
                                                            <option value="YES">YES</option>
                                                            <option value="NO">NO</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div style="width: 15%;" class="ReasonforNotCount">
                                                    <label for="html5-number-input" class="col-form-label label-custom">REASON</label>
                                                    <div class="">
                                                        <textarea id="txtReason" class="form-control"></textarea>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                            






                                    </div>

                                    <br />
                                    <br />
                                    <div class="row SaveValidatedData">
                                        <a href="#" id="btNSave" class="btn btn-primary" style="float: left;"><i class="fa fa-save" aria-hidden="true"></i>&nbsp;Save</a>
                                    </div>
                                </div>

                                <br />

                                <div id="dvAudit" style="/*background: #e14f0c17; */ padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;" class="AuditInfo">
                                    <div style="width: 100%;">
                                        <h4>Audit Information</h4>

                                    </div>
                                    <hr />

                                    <div class="row">
                                        <div style="width: 100%;">

                                            <div class="row">

                                                <div style="width: 20%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Counted</label>
                                                    <div class="">
                                                        <select id="ddlAuditCount" class="form-select color-dropdown">
                                                            <option value="-1">--Select--</option>
                                                            <option value="YES">YES</option>
                                                            <option value="NO">NO</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div style="width: 15%;" class="AuditReasonforNotCount">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Comments</label>
                                                    <div class="">
                                                        <textarea id="txtAuditReason" class="form-control"></textarea>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>







                                    </div>

                                    <br />
                                    <br />
                                    <div class="row AuditSave">
                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="navs-top-Gallery" role="tabpanel">
                                <div class="row SiteSurveyimages">
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
         </div>



     <div class="modal fade" id="mdProjectDetails" tabindex="-2" aria-hidden="true" style="background-color: #13131466" data-bs-backdrop="static">
         <div class="modal-dialog modal-xl" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title" id="modalcontact">Project Details</h5>
                     <button
                         type="button"
                         class="btn-close"
                         data-bs-dismiss="modal"
                         aria-label="Close">
                     </button>
                 </div>


                 <div class="modal-body">
                       <div class="row">
                               <div style="width: 15%;">
                                                    
                                                </div>
                                       <div style="width: 30%;">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Search</label>
                                                    <div class="">
                                                        <input type="text" id="txtSearch" class="form-control" placeholder="Enter the Text To search"/>
                                                    </div>
                                                </div>

                                                <div style="width: 15%;">
                                                      <label for="html5-number-input" class="col-form-label label-custom">    &nbsp; &nbsp; </label>
                                                    <div class="">
                                                          <a href="#" id="btnSearchProjectDetails" class="btn btn-primary" style="float: left;"><i class="fa fa-search" aria-hidden="true"></i>&nbsp;Search</a>
                                                    </div>
                                                </div>
                                    </div>
                     <br />

                     <%--  <a href="#" id="btnNewContact" class="btn btn-primary pull-right" style="float:right">New Contact</a>--%>

                     <table class="table table-bordered table-striped Project-item-list-table" style="width: 100%;">


                         <thead>

                             <tr>
                                 <th class="hidden">CRM Project ID</th>
                                 <th>Project Number</th>
                                 <th>Name</th>
                                 <th>Client</th>
                                 <th>Consultant</th>
                                 <th>Marketing</th>
                                 <th>Plot Number</th>
                                 <th class="hidden">MainContractor</th>
                                 <th class="hidden">Stage</th>
                                 <th class="hidden">Status</th>
                                 <th class="hidden">MasterProject</th>
                                 <th class="hidden">MasterProjectLink</th>

                             </tr>
                         </thead>


                         <tbody class="tbody-ProjectList">
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
    <script src="Scripts/SiteSurveyvalidation.js?v=1"></script>

<%--      <link href="Css/ERMStyle.css" rel="stylesheet" />--%>
<%--       <link href="Css/ERMtextbox.scss" rel="stylesheet" />--%>

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
     
        <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
        <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
      <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>
</asp:Content>

