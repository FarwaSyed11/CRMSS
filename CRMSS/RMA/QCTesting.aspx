<%@ Page Title="" Language="C#" MasterPageFile="../EconnectNew.master" AutoEventWireup="true" CodeFile="QCTesting.aspx.cs" Inherits="RMA_QCTesting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />

    <link href="css/rma-master.css" rel="stylesheet" />

    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <style>

        .btn-outline-secondary {
            color: #ffffff;
            border-color: #8592a3;
            background: #06877b;
        }

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd3d;
        }
        .btn-Attatchment {
           color: #fff;
            background-color: #933737;
            border-color: #f7e4e4;
            box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255,0.4);
          }
           .btn-Attatchment:hover {
            color: #fff;
            background-color: #b1b1ab;
            border-color: #f7e4e4;
            transform: translateY(-1px);
          }



         .Request-recevedFTRY-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .Request-recevedFTRY-table td {
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


         
         .QCitemDetailsList-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .QCitemDetailsList-table td {
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

         .Request-Confirmed-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .Request-Confirmed-table td {
             color: #333333 !important;
         }
         .AfterQcVerification-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .AfterQcVerification-table td {
             color: #333333 !important;
         }
         .New-Attatchment-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .New-Attatchment-table td {
             color: #333333 !important;
         }

         .Request-ClosedItem-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .Request-ClosedItem-table td {
             color: #333333 !important;
         }

         .ActualClosed-item-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .ActualClosed-item-table td {
             color: #333333 !important;
         }

         .ONP-item-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .ONP-item-table td {
             color: #333333 !important;
         }

          .QCFinishedItems-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .QCFinishedItems-table td {
             color: #333333 !important;
         }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div style="padding-left: 2%; padding-top: 1%;">

            <div class="pull-left">
                <h4 style="text-shadow: 1px 6px 13px; color: #a92828;">Materials Return Details </h4>
            </div>
            <div class="pull-right btn-search" style="padding-right: 10%; padding-bottom: 10px">

                <%--<div>
                    <button type="button" data-bs-toggle="modal" data-bs-target="#ModalMetrlRetnNotoce" class="btn rounded-pill btn-outline-secondary">
                        Add Request
                       
                    </button>
                </div>--%>

            </div>
            <hr style="width: 100%; text-align: left; margin-left: 0">

            </div>


           <div class="card-body" style="margin-top: -2%;">
            <div class="nav-align-top tab-Inspections">
                 <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Received" aria-controls="tab-Received" aria-selected="true">TO BE RECEIVED</button>
                    </li>
                      <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-QcConfirmed" aria-controls="tab-QcConfirmed" aria-selected="false">QC CONFIRMED</button>
                    </li>
                      <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ClosedItem" aria-controls="tab-ClosedItem" aria-selected="false">CLOSED REQUEST</button>
                    </li>
                  </ul>
     <div class="tab-content">
         <div class="tab-pane fade show active" id="tab-Received" role="tabpanel">
            <div class="" style="margin-top: 1%;">

                 <div class="col-6" style="padding-bottom: 1%;">
                                <asp:Label ID="lblReq" Text="REQUEST:" runat="server" Font-Size="Medium" Font-Bold="true" />
                                &nbsp;&nbsp
                           
                                <select class="form-select placement-dropdown" id="ddlStatus" style="Width:31%">
                                     <option value="0"> --- New Requests --- </option>
                                     <option value="1"> --- On Progress --- </option>
                                   
                                </select>
                            </div>

                <table class="table table-bordered table-striped Request-recevedFTRY-table">


                    <thead>
                        <tr><th>MRN.No</th>
                            <%--<th>Reff.No.</th>--%>
                            <th>SalesOrder</th>
                            <th>Department</th>
                            <th>ProjectName</th>
                            <th>ReturnedBy </th>
                            <th>ReceivedBy</th>
                            <th>Date</th>
                           <%-- <th>Status</th>--%>

                            <th style="width: 10%;">Action</th>
                        </tr>
                    </thead>


                    <tbody class="tbody-recevedFTRY">
                    </tbody>
                </table>
              </div>
            </div>
        <div class="tab-pane fade" id="tab-QcConfirmed" role="tabpanel">
            <div class="" style="margin-top: 1%;">

                <table class="table table-bordered table-striped Request-Confirmed-table" style="width: 100%;">


                    <thead>
                        <tr><th>MRN.No</th>
                            <%--<th>Reff.No.</th>--%>
                            <th>SalesOrder</th>
                            <th>Department</th>
                            <th>ProjectName</th>
                            <th>ReturnedBy </th>
                            <th>ReceivedBy</th>
                            <th>Date</th>
                           <%-- <th>Status</th>--%>

                            <th style="width: 10%;">Action</th>
                        </tr>
                    </thead>


                    <tbody class="tbody-Confirmed">
                    </tbody>
                </table>
              </div>
            </div>

          <div class="tab-pane fade" id="tab-ClosedItem" role="tabpanel">

                        <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped Request-ClosedItem-table" style="width: 100%;">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                       <th>MRN.No.</th>
                                        <th>SalesOrder</th>
                                        <th>Department</th>
                                        <th>MMR.No</th>
                                        <th>ProjectName</th>
                                        <th>ReturnedBy </th>
                                        <th>ReceivedBy</th>
                                        <th>RMA.NO</th>
                                        <th>MIN.NO</th>
                                        <th>Date</th>
                                        <th style="width: 10%;">Action</th>
                                      

                                        <%--<th style="width: 10%;">Action</th>--%>
                                    </tr>
                                </thead>


                                <tbody class="tbody-ClosedItem">
                                </tbody>
                            </table>
                        </div>

                    </div>

         </div>
       </div>
     </div>
  </div>

        <div class="modal fade" id="ModalitemsAfterQCverification" tabindex="-2" aria-hidden="true" style="background-color: #13131466">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="itemsAfterQCverification">RETURN MATERIAL</h5>
                    <button
                        type="button"
                        class="btn-close"
                       data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">
                    <div class="pull-right">
                        <a href="#" type="button" class="btn btn-Attatchment" onclick="AllAttactment()" style="float: right">
                            <i class="fa fa-paperclip" style="font-size: x-large;"></i>
                        </a>

                         <a href="#" type="button" class="btn btn-Attatchment" onclick="ReportView()" style="float: right">
                              <i class="fa fa-file-pdf-o" title="EXPORT" style="font-size: x-large;"></i>
                      </a>

                    </div>

                      <table class="table table-bordered table-striped AfterQcVerification-table" style="width:100%">


                    <thead>
                        <tr>
                            <th style="display:none">Id</th>
                            <th style="display:none">MRN.No</th>
                            <th style="display:none">SalesOrder</th>
                            <th>Item Code</th>
                            <th>Item Category</th>
                             <th>Store Desc</th>
                            <th>Totel QTY</th>
                             <th>Section</th>
                            <th>ACC.QTY</th>
                            <th>REJ.QTY</th>
                            <th>Remarks</th>
                           

                           
                        </tr>
                    </thead>


                    <tbody class="tbody-ItemsAfterQCverifictn">
                    </tbody>
                </table>

                    
                    <br />
                   
                </div>
            </div>
        </div>

    </div>

    <div class="modal fade" id="ModalitemsRecevedFCTRY" tabindex="-2" aria-hidden="true" style="background-color: #13131466">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalitemadd">RETURN MATERIAL FOR QC INSPECTION </h5>
                    <button
                        type="button"
                        class="btn-close"
                       data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


               <div class="card-body" style="margin-top: -2%;">

                    
                     <div class="nav-align-top tab-Inspections">
                         <div class="pull-right">
                        <a href="#" type="button" class="btn btn-Attatchment" onclick="AllAttactment()" style="float: right">
                            <i class="fa fa-paperclip" style="font-size: x-large;"></i>
                         </a>

                         <a href="#" type="button" class="btn btn-Attatchment" onclick="ReportView()" style="float: right">
                              <i class="fa fa-file-pdf-o" title="EXPORT" style="font-size: x-large;"></i>
                      </a>
                    </div>
                 <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Workin" aria-controls="tab-Workin" aria-selected="true">WORKING ON</button>
                    </li>
                      <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Finished" aria-controls="tab-Finished" aria-selected="false">FINISHED</button>
                    </li>
                  </ul>
           <div class="tab-content">
              <div class="tab-pane fade show active" id="tab-Workin" role="tabpanel">

                      <table class="table table-bordered table-striped QCitemDetailsList-table" style="width:100%">


                    <thead>
                        <tr>
                            <th>Id</th>
                            <th style="display:none">MRN.No</th>
                            <th style="display:none">SalesOrder</th>
                            <th>Item Code</th>
                            <th>Item Category</th>
                             <th>Store Desc</th>
                            <th>Totel QTY</th>
                            <th>Section</th>
                            <th>ACC.QTY</th>
                            <th>REJ.QTY</th>
                            <th>Remarks</th>
                            <th>Action</th>
                           

                           
                        </tr>
                    </thead>


                    <tbody class="tbody-QCItemdetails">
                    </tbody>
                </table>
             

                    
                    <br />
                   <%-- <div class="modal-footer">
                        <a href="#" id="Button3" class="btn btn-primary" runat="server" onclick="sendTestedItemToStore()">Submit</a>
                    </div>--%>
                  </div>



                <div class="tab-pane fade" id="tab-Finished" role="tabpanel">

                      <table class="table table-bordered table-striped QCFinishedItems-table" style="width:100%">


                    <thead>
                        <tr>
                            <th>Id</th>
                            <th style="display:none">MRN.No</th>
                            <th style="display:none">SalesOrder</th>
                            <th>Item Code</th>
                            <th>Item Category</th>
                             <th>Store Desc</th>
                            <th>Totel QTY</th>
                            <th>Section</th>
                            <th>ACC.QTY</th>
                            <th>REJ.QTY</th>
                            <th>Remarks</th>
                           

                           
                        </tr>
                    </thead>


                    <tbody class="tbody-QCFinished">
                    </tbody>
                </table>
             

                    
                    <br />
                   <%-- <div class="modal-footer">
                        <a href="#" id="A1" class="btn btn-primary" runat="server" onclick="sendTestedItemToStore()">Submit</a>
                    </div>--%>
                  </div>



                </div>
            </div>
         </div>
     </div>
            
     
            
   </div>

 </div>

    <%-- Modal for Accepetd and rejected --%>

    <div class="modal fade" id="ModalitemsAcceptedList" tabindex="-2" aria-hidden="true" style="background-color: #13131466">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalitemAccList">RETURN MATERIAL FOR QC INSPECTION </h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">
                      <h3>ACCEPTED QTY</h3>
                      <table class="table table-bordered table-striped QCitemDetailsList-table1" style="width:100%">


                            <thead>
                                <tr>
                                    <th style="display:none">Id</th>
                                    <th style="display:none">MRN.No</th>
                                    <th style="display:none">SalesOrder</th>
                                  <%--  <th>Item Code</th>
                                    <th>Item Category</th>  --%>                        
                                    <th>Totel QTY</th>
                                    <th>ACC.QTY</th>
                            
                                    <th style="width: 20%;">Action</th>
                                </tr>
                            </thead>


                       <tbody class="tbody-QCItemdetails1">
                       </tbody>
                </table>

                    <br />
                       <h3>REJECTED QTY</h3>
                      <table class="table table-bordered table-striped QCitemDetailsList-table1" style="width:100%">


                            <thead>
                                <tr>
                                    <th style="display:none">Id</th>
                                    <th style="display:none">MRN.No</th>
                                    <th style="display:none">SalesOrder</th>
                                   <%-- <th>Item Code</th>
                                    <th>Item Category</th>--%>                          
                                    <th>Totel QTY</th>
                                    <th>Rejected.QTY</th>
                            
                                    <th style="width: 20%;">Action</th>
                                </tr>
                            </thead>


                       <tbody class="tbody-QCItemdetails1">
                       </tbody>
                </table>
                    <br />
                    <div class="modal-footer">
                        <button type="button" id="Button1" class="btn btn-primary" runat="server" data-bs-dismiss="modal">Submit</button>

                    </div>
                </div>
            </div>
        </div>

    </div>

    
    <div class="modal fade" id="RMAReturnActualClosed" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalActualClosed">ITEM DETAILS</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">


                    <div class="nav-align-top tab-Inspections">

                      <div class="pull-right">
                      <a href="#" type="button" class="btn btn-Attatchment" onclick="AllAttactment()" style="float: right">
                              <i class="fa fa-paperclip" style="font-size: x-large;"></i>
                      </a>

                           <a href="#" type="button" class="btn btn-Attatchment" onclick="ReportView()" style="float: right">
                              <i class="fa fa-file-pdf-o" title="EXPORT" style="font-size: x-large;"></i>
                      </a>
                     </div>

                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="ViewActualClosed" role="tabpanel">
                               
                                                <div class="row">

                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmadepartrmentACI" disabled>
                                                        </div>
                                                    </div>


                                                    <div class="col-3">
                                                        <label class="col-form-label label-custom" for="basic-default-name">Customer Name</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmacustomernameACI" disabled>
                                                        </div>

                                                    </div>

                                                  <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Refference Number</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmarefferanceACI" disabled>
                                                        </div>
                                                    </div>

                                                    <div class="col-3">
                                                        <label class="col-form-label label-custom" for="basic-default-name">Sales Order</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmasalesorderACI" disabled>
                                                        </div>

                                                    </div>
                                                </div>

                                            
                                   


                       <div class="card-body" style="margin-top: -2%;">

                             <div class="" style="margin-top: 1%;">

                                <table class="table table-bordered table-striped ActualClosed-item-table" style="width:100%;">

                                    <thead>
                                                                <tr>
                                                                    
                                                                     <th>Id</th>
                                                                    <th>MRN.No</th>
                                                                    <th>Item Code</th>
                                                                    <th>Item Category</th>
                                                                    <th>Item Description</th>
                                                                    <th>Item.QTY</th>
                                                                    <th>Remarks</th>
                                                                     <th>Section</th>
                                                                    <th>Accepted QTY</th>
                                                                    <th>RMA.No</th>
                                                                    <th>Rejected QTY</th>
                                                                    <th>RE-Use</th>
                                                                    <th>Scrap</th>
                                                                    <th>Return QTY</th>
                                                                    <th>MIN.No</th>

                                                                </tr>

                                                               
                                                            </thead>

                                                            <tbody class="tbody-ActualClosedView">
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

                <div class="modal fade" id="RMARequestONPView" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalONP">ITEM DETAILS</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">


                    <div class="nav-align-top tab-Inspections">

                      <div class="pull-right">
                      <a href="#" type="button" class="btn btn-Attatchment" onclick="AllAttactment()" style="float: right">
                              <i class="fa fa-paperclip" style="font-size: x-large;"></i>
                      </a>

                           <a href="#" type="button" class="btn btn-Attatchment" onclick="ReportView()" style="float: right">
                              <i class="fa fa-file-pdf-o" title="EXPORT" style="font-size: x-large;"></i>
                      </a>
                     </div>

                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="ViewONP" role="tabpanel">
                               <%-- <div class="row">
                                    <label id="lblValRcve" class="col-form-label label-custom" style="padding-left:90%;font-size:20px;" ></label>
                                </div>--%>
                               
                                                <div class="row">

                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmadepartrmentView" disabled>
                                                        </div>
                                                    </div>


                                                    <div class="col-3">
                                                        <label class="col-form-label label-custom" for="basic-default-name">Customer Name</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmacustomernameView" disabled>
                                                        </div>

                                                    </div>

                                                  <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Refference Number</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmarefferanceView" disabled>
                                                        </div>
                                                    </div>

                                                    <div class="col-3">
                                                        <label class="col-form-label label-custom" for="basic-default-name">Sales Order</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmasalesorderView" disabled>
                                                        </div>

                                                    </div>
                                                </div>

                                            
                                   


                       <div class="card-body" style="margin-top: -2%;">

                             <div class="" style="margin-top: 1%;">

                                <table class="table table-bordered table-striped ONP-item-table" style="width:100%;">

                                    <thead>
                                                                <tr>
                                                                     <th>Id</th>
                                                                    <th>MRN.No</th>
                                                                    <th>Item Code</th>
                                                                    <th>Item Category</th>
                                                                    <th>Item Description</th>
                                                                     <th>Item.QTY</th>
                                                                     <th>Remarks</th>
                                                                     <th>Section</th>
                                                                    <th>Accepted QTY</th>
                                                                    <th>Rejected QTY</th>
                                                                   

                                                                </tr>
                                                            </thead>

                                                            <tbody class="tbody-ViewDetailsONP">
                                                            </tbody>
                                                        </table>

                                                    </div>
                                                   

                                                </div>

                            </div>
                             <div class="modal-footer">
                                  <%--<a href="#"  id="btnCancel" class="btn btn-Classic" onclick="CancelBox()" style="display:none;">Cancel</a>
                                  <a href="#"  id="btnCancelClose" class="btn btn-Classic" onclick="CloseBox()" style="display:none;">Close</a>--%>
                                 </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


         <div class="modal fade" id="ModalAttatchment" tabindex="-2" aria-hidden="true" style="background-color: #13131466">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalAttatchment">ATTTATCHMENTS</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">
                     <div class="row">
                                     <div class="col-6 pull-left upload-Attatchment" style="display:block;">
                                <div class="input-group mb-3" style="position: relative; top: 10px;">                                   
                                    <input class="form-control" type="file" id="colFileUpload"  accept=".pdf,.png,.jpeg" multiple >
                                    <label class="input-group-text" for="inputGroupFile02"><i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i></label>

                                     <div style="margin-left: 9px;">

                                    <a href="#" ID="btnUpload1" Class=" btn btn-primary">Add Attachment </a> 
                                </div>
                                </div>
                              </div>
                                     </div>
                      <div class="row AttDescription">
                        Description:&nbsp;&nbsp;&nbsp; <textarea rows="3" cols="8" class="form-control" type="text" value="" id="txtDescription" style="width:40%;"></textarea>
                    </div>

                    <table class="table table-bordered table-striped New-Attatchment-table" style="width:100%;">


                                                <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>File Name</th>
                                                          <th style="display:none;">URL</th>
                                                         <th>Description</th>
                                                        

                                                        <th style="width: 10%;">Action</th>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-AttatchmentNew">
                                                </tbody>
                                            </table>
                    <div class="docImageDiv" style="display:none;">
                <div><button type="button" id="ImageClose" style="float:right;"><i class="fa fa-times" title="Close"></i></button></div>
                <div  style=" overflow-y: auto;  max-height: 500px; text-align:center;"><img id="docImagePreview" src="" class="img-responsive" style="width:63%;height:500px;">  </div>
                                </div>
                    <br/>
                    <div class="modal-footer">
                        

                        <%-- <button type="button" id="StatusReceived" class="btn btn-primary" runat="server"  onclick="RecevedItems()">Receved</button>--%>

                        <%--  <button type="button" id="Button2" class="btn btn-primary" runat="server" data-bs-dismiss="modal" onclick="ItemsWorkingOn()">Working On </button>--%>

                        <%--<button type="button" id="Button2" class="btn btn-primary" runat="server" onclick="Remarks()">Modify</button>
                         <button type="button" id="Button1" class="btn btn-primary" runat="server" data-bs-dismiss="modal" onclick="sendItemsToQC()">Submit</button>--%>


                    </div>
                </div>
            </div>
        </div>

    </div>


    

                    <div class="modal fade" id="FRDaddRMAReport" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-xl" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="RMAreport">RMA REQUEST REPORT</h5>
                                <button
                                    type="button"
                                    class="btn-close"
                                    data-bs-dismiss="modal"
                                    aria-label="Close">
                                </button>
                            </div>

                             <div class="pull-right" style="padding-right: 10%; padding-bottom: 10px">
                                        <span class="float-end pt-2">
                                          <%-- <a href="#" onclick="generatePDF()" class="btn rounded-pill me-2 btn-outline-secondary pull-right">Export to PDF</a>--%>
                                      <%--      <asp:LinkButton ID="lbPDF" runat="server" OnClick="lbPDF_Click">PDF</asp:LinkButton>--%>
                                        </span>
                                    </div>
                            <div class="modal-body">


                                <div style="padding-left: 2%; padding-top: 1%;">
                                     <button type="button" onclick="generatePDF()" class="btn rounded-pill me-2 btn-outline-secondary pull-right">Download PDF</button>


                                    <iframe id="myIframe" src=""  style="height: 1300px;width: 841px;"></iframe>


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
                var overAllPerfo=0;
                $(document).ready(function () {
                    currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;               
                    EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';
                    EmpName ='<%=Session["EmpName"]%>'
                });

     </script>
    <script src="script/qctesting.js?v=0.6"></script>
    <script src="../Template/Datatable/js/jquery.dataTables.min.js"></script>
    <script src="../Template/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../Template/Datatable/js/jszip.min.js"></script>
    <script src="../Template/Datatable/js/pdfmake.min.js"></script>
    <script src="../Template/Datatable/js/buttons.print.min.js"></script>
    <script src="../Template/Datatable/js/vfs_fonts.js"></script>
    <script src="../Template/Datatable/js/buttons.html5.min.js"></script>



    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


</asp:Content>

