<%@ Page Title="" Language="C#" MasterPageFile="../EconnectNew.master" AutoEventWireup="true" CodeFile="LodingGate.aspx.cs" Inherits="RMA_LodinGate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   
    <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />


    <link href="css/rma-master.css" rel="stylesheet" />

    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

  

    <style>



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


        .btn-Classic {
           color: #fff;
            background-color: #ff0202;
            border-color: #f7e4e4;
            box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255,0.4);
          }
           .btn-Classic:hover {
            color: #fff;
            background-color: #b1b1ab;
            border-color: #f7e4e4;
            transform: translateY(-1px);
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
           /*.btn-Classic:active{
             color: #fff;
             background-color: #b1b1ab;
             border-color: #f7e4e4;
             transform: translateY(0);
             box-shadow: none;
           }*/
             .btn-active-custom{
             color: #fff;
             background-color: #b1b1ab;
             border-color: #f7e4e4;
             transform: translateY(0);
             box-shadow: none;
           }

         /* .btn-Classic:active{             
              color: #fff;
              background-color: #595cd9;
              border-color: #595cd9;
          }*/
           

          .btn-ClassicGreen {
           color: #fff;
            background-color: #0cf734;
            border-color: #f7e4e4;
            box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255,0.4);
          }
           .btn-ClassicGreen:hover {
            color: #fff;
            background-color: #b1b1ab;
            border-color: #f7e4e4;
            transform: translateY(-1px);
          }
            .btn-active-Green{
             color: #fff;
             background-color: #b1b1ab;
             border-color: #f7e4e4;
             transform: translateY(0);
             box-shadow: none;
           }
          /* .btn-check:focus + .btn-ClassicGreen, .btn-ClassicGreen:focus, .btn-ClassicGreen.focus {
             color: #fff;
             background-color: #b1b1ab;
             border-color: #f7e4e4;
             transform: translateY(0);
             box-shadow: none;
           }
          .btn-ClassicGreen:active{             
              color: #fff;
              background-color: #595cd9;
              border-color: #595cd9;
          }*/
        
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
            background-color: #dddddd;
        }



        /*for LM approved data*/

     .Request-LMapproved-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .Request-LMapproved-table td {
             color: #333333 !important;
         }

          .iconClassExcel {
             margin-left: 8px;
             background: #933737;
         }

             .iconClassExcel:hover {MATERIAL RETURN REQUEST DETAIL
                 background: #a54141;
             }

         #DataTables_Table_0_paginate .current {
             color: white !important;
             background: #d33a3a !important;
         }

          /*for Return Request data*/

     .Request-ReturnReq-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .Request-ReturnReq-table td {
             color: #333333 !important;
         }
     .Request-ClosedItem-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .Request-ClosedItem-table td {
             color: #333333 !important;
         }

         .Request-Modification-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .Request-Modification-table td {
             color: #333333 !important;
         }

          .Request-Cancelled-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .Request-Cancelled-table td {
             color: #333333 !important;
         }
          
          .Return-Modify-list-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .Return-Modify-list-table td {
             color: #333333 !important;
         }

         .View-item-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .View-item-table td {
             color: #333333 !important;
         }
          .RLGV-item-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .RLGV-item-table td {
             color: #333333 !important;
         }

         
          .Closed-item-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .Closed-item-table td {
             color: #333333 !important;
         }

         .ActualClosed-item-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .ActualClosed-item-table td {
             color: #333333 !important;
         }

         .New-Attatchment-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .New-Attatchment-table td {
             color: #333333 !important;
         }
         .MIN-Attatchment-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .MIN-Attatchment-table td {
             color: #333333 !important;
         }

         .SOorg-item-list-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .SOorg-item-list-table td {
             color: #333333 !important;
         }
          
         .table-report{
                 text-align: left;
                 padding: 8px;
                 background-color: white;
         }

        .table-report th {
            border:none;
             
        }
            .table-report td {
                border:none;
                 background-color: white;

            }

             .bg-secondary {
            --bs-bg-opacity: 1;
            background-color: #0b7c85 !important;
            font-size: larger;
        }

             .headng {
            color: #a92828;
            color: #bf2e1a;
            font-weight: 800;
            padding-left: 10%;
            /*padding-right: 2%;*/
        }

             .table-reportDetails{
                 text-align: left;
                 padding: 8px;
                 background-color: white;
                 
                 
         }

        .table-reportDetails th {
            border-width:1px;
            border-color:black;
            background-color:#a92828;
            color:white;
             
        }
            .table-reportDetails td {
                border-width:1px;
                 background-color: white;
                 border-color:black;

            }

        
    </style>

    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">


        <div style="padding-left: 2%; padding-top: 1%;">

            <div class="pull-left">
                <h4 style="text-shadow: 1px 6px 13px; color: #a92828;">Materials Return Notice </h4>
            </div>

            <div class="pull-right btn-search" style="padding-right: 10%; padding-bottom: 10px">

<%--                <div class="AddItems">
                    <button type="button" id="btnAdd" data-bs-toggle="modal" data-bs-target="#ModalMetrlRetnNotoce" class="btn rounded-pill btn-outline-secondary" style="display:none">
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
                        <button type="button" id="btnNewReq" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-NewRequest" aria-controls="tab-NewRequest" aria-selected="true">REQUESTS</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ReqApprovedByLM" aria-controls="tab-ReqApprovedByLM" aria-selected="false">APPROVED REQUEST</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-RFModification" aria-controls="tab-RFModification" aria-selected="false">MODIFY REQUESTS</button>
                    </li>
                      <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ReturnReq" aria-controls="tab-ReturnReq" aria-selected="false">RETURN REQUEST</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ClosedItem" aria-controls="tab-ClosedItem" aria-selected="false">CLOSED REQUEST</button>
                    </li>

                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-CancelledReq" aria-controls="tab-CancelledReq" aria-selected="false">CANCELLED REQUEST</button>
                    </li>
                    

                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-NewRequest" role="tabpanel">
                        <div class="row" style="margin-top: 1%;">
                            <div class="col-6">
                                <asp:Label ID="lblReq" Text="REQUEST:" runat="server" Font-Size="Medium" Font-Bold="true" />
                                &nbsp;&nbsp
                           
                                <select class="form-select placement-dropdown" id="ddlStatus" style="Width:31%">
                                    <%--<option value="-1" selected> --- All Requests --- </option>--%>
                                     <option value="0"> --- New Requests --- </option>
                                     <option value="1"> --- On Progress --- </option>
                                     <%--<option value="2"> --- Closed --- </option>--%>
                                </select>
                            </div>
                            <div class="col-6">
                                <%--<a href="#" class="btn btn-primary" style=" float: right;">submit</a>--%>
                                <button type="button" id="btnAdd" data-bs-toggle="modal" data-bs-target="#ModalMetrlRetnNotoce" class="btn rounded-pill btn-outline-secondary" style="float:right;margin-top:3%" >
                        Add Request
                        
                    </button>
                            </div>
                            </div>
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped rma-RequestList-table">


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
                                        <th>Status</th>
                                        <th>Date</th>
                                        <th style="display:none;">ORGid</th>
                                        <%--<th>Status</th>--%>

                                        <th style="width: 10%;">Action</th>
                                    </tr>
                                </thead>


                                <tbody class="tbody-returnreq">
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="tab-ReturnReq" role="tabpanel">

                        <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped Request-ReturnReq-table" style="width: 100%;">


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
                                        <th>Date</th>
                                        <th style="width: 10%;">Action</th>
                                      

                                        <%--<th style="width: 10%;">Action</th>--%>
                                    </tr>
                                </thead>


                                <tbody class="tbody-ReturnReq1">
                                </tbody>
                            </table>
                        </div>

                    </div>


                    <div class="tab-pane fade" id="tab-ReqApprovedByLM" role="tabpanel">

                        <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped Request-LMapproved-table" style="width: 100%;">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                        <th>MRN.No.</th>
                                        <th>SalesOrder</th>
                                        <th>Department</th>
                                        <th>ProjectName</th>
                                        <th>ReturnedBy </th>
                                        <th>ReceivedBy</th>
                                        <th>LM Approved Date</th>
                                        <th>Action</th>
                                      

                                        <%--<th style="width: 10%;">Action</th>--%>
                                    </tr>
                                </thead>


                                <tbody class="tbody-LMapproved">
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

                   <div class="tab-pane fade" id="tab-RFModification" role="tabpanel">
                        <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped Request-Modification-table" style="width: 100%;">


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
                                        <th>Date</th>
                                         <th style="display:none;">ORGid</th>
                                        <%--<th>Status</th>--%>

                                        <th style="width: 10%;">Action</th>
                                    </tr>
                                </thead>


                                <tbody class="tbody-RModification">
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="tab-CancelledReq" role="tabpanel">
                        <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped Request-Cancelled-table" style="width: 100%;">


                               <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                        <th>MRN.No.</th>
                                        <th>SalesOrder</th>
                                        <th>Department</th>
                                        <th style="display:none">MMR.No</th>
                                        <th>ProjectName</th>
                                        <th>ReturnedBy </th>
                                        <th>ReceivedBy</th>
                                        <th style="width:15%;">Reason</th>
                                        <th>Date</th>
                                        <%--<th>Status</th>--%>

                                        <th style="width: 10%;">Action</th>
                                    </tr>
                                </thead>


                                <tbody class="tbody-Cancelled">
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>




    <%--  Modal for return notice --%>

    <div class="modal fade" id="ModalMetrlRetnNotoce" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel3">MATERIAL RETURN REQUEST DETAILS</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">

                    <div class="row">
                        <div class="col-12">
                            <label class="col-form-label label-custom" for="basic-default-name">Department</label>
                            <select class="form-select" id="ddlDepartmentselect" aria-label="ddlDepartment select">
                                <option value="-1" selected>select </option>
                                <option value="Project">Project</option>
                                <option value="Sales">Sales</option>
                                <option value="Maintenance">Maintenance</option>
                                <option value="DirectReturn">Direct Return</option>
                                 <option value="Others">Others</option>
                            </select>
                        </div>
                    </div>



                      <div class="row projtxtdiv" style="display:none; margin-top:3px;">
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">MMR.NO</label>
                            <div class="">
                            <input class="form-control" type="text" value="" id="txtProject">
                                </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Type</label>
                            <select class="form-select" id="ddlTypeselect" aria-label="ddlTypeselect select">
                                <option value="-1">select </option>
                                <option value="Local">Local</option>
                                <option value="Export">Export</option>
                                
                            </select>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Sales Order</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="textSalesOrder">
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Project/Customer Name</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtProjectName" disabled>
                            </div>
                        </div>
                    </div>

                     <%--<div class="row">
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">ORG.Id</label>
                            <select class="form-select" id="ddlORGId" aria-label="ddlORGId select">
                               
                                
                            </select>
                        </div>
                    </div>--%>


                    <div class="row">
                        <div class="col-12">
                            <label class="col-form-label label-custom" for="basic-default-name">Returned By</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="textReturnedBy">
                            </div>
                        </div>
                    </div>

                 <%--   <div class="row">
                        <div class="col-12">
                            <label class="col-form-label label-custom" for="basic-default-name">Receved By</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="textRecevedBy">
                            </div>
                        </div>
                    </div>--%>

                   



                    <div class="modal-footer">
                        <button type="button" id="BtnProjectAdd" class="btn btn-primary" runat="server" onclick="addRequest()">Add</button>

                    </div>
                </div>
            </div>
        </div>
  </div>



    <%-- Modal for display  all items unser sales order --%>

    <div class="modal fade" id="RMASalesOrderItems" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalsalesorderitms">ALL ITEAMS UNDER SALES ORDER</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">
                   <%--<div class="nav-align-top tab-Inspections">--%>

                   <%-- <input class="form-control" type="file" id="colFileUpload"  accept=".pdf,.png,.jpeg" multiple >
                                    <label class="input-group-text" for="inputGroupFile02"><i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i></label>
                    <div class="nav-align-top tab-Inspections">--%>

                     
                <%--<ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <button type="button" id="btnSalesOrder" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SalesOrder" aria-controls="tab-SalesOrder" aria-selected="true">SALESORDER ITEM</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Attatchment" aria-controls="tab-Attatchment" aria-selected="false">ATTATCHMENTS</button>
                    </li>
                    </ul>--%>
                        <div class="tab-content">   


                            <div class="tab-pane fade show active" id="tab-SalesOrder" role="tabpanel">
                               


                                                  <div class="row">
                                                      
                                                     
                                                        <div >   
                                                             <a href="#" type="button" class="btn btn-Attatchment" onclick="AllAttactment()" style="float: right">
                                                                  <i class="fa fa-paperclip" style="font-size: x-large;"></i>
                                                            </a>
                                                             <a href="#" type="button" class="btn btn-Attatchment" onclick="ReportView()" style="float: right">
                                                                    <i class="fa fa-file-pdf-o" title="EXPORT" style="font-size: x-large;"></i>
                                                            </a>
                                                            
                                                        <div class="pull-right">
                                                               &nbsp;&nbsp;&nbsp;
                                                            <button type="button" class="btn rounded-pill me-2 btn-secondary btnAddCl" onclick="getSalesOrderItems()" style="float: right">
                                                                Add Items&nbsp; 
                                                            </button>
                                                            </div>
                                               </div>
                                                </div>


                                                <div class="row">

                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmadepartrment" disabled>
                                                        </div>
                                                    </div>


                                                    <div class="col-3">
                                                        <label class="col-form-label label-custom" for="basic-default-name">Customer Name</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmacustomername" disabled>
                                                        </div>

                                                    </div>

                                                  <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Refference Number</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmarefferance" disabled>
                                                        </div>
                                                    </div>

                                                    <div class="col-3">
                                                        <label class="col-form-label label-custom" for="basic-default-name">Sales Order</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmasalesorder" disabled>
                                                        </div>

                                                    </div>
                                                </div>

                                            
                                   


                                                <div class="card-body" style="margin-top: -2%;">

                                                    <div class="" style="margin-top: 1%;">

                                                        <table class="table table-bordered table-striped return-item-list-table" style="width:100%;">

                                                            <thead>
                                                                <tr>
                                                                     <th>Id</th>
                                                                    <th>MRN.No</th>
                                                                    <th>Item Code</th>
                                                                    <th>Item Category</th>
                                                                    <th>Item Description</th>
                                                                    <th>SalesOrder.QTY</th>
                                                                    <th>QTY.Returned</th>
                                                                    <th>Reason for Returning</th>
                                                                    <th>Section</th>
                                                                    <th>Action</th>
                                                                    

                                                                </tr>
                                                            </thead>

                                                            <tbody class="tbody-returnItemdetails">
                                                            </tbody>
                                                        </table>

                       

                                                        <div>
                                                            <div class="pull-right" style="padding-right: 10%; padding-bottom: 30px; padding-top: 30px">
                                                                <a href="#" class="btn rounded-pill me-2 btn-secondary btn-submit-cl" onclick="SaverequestItemStatus()" >
                                                                    Submit &nbsp; 
                                                                </a>


                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>

                       </div>

                </div>
          </div>
              </div>
            </div>
        </div>

 
    



    <%-- Modal for display  all items unser sales order For Modification--%>
       <div class="modal fade" id="RModification" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalModification">ALL ITEAMS UNDER SALES ORDER</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">


                    <div class="nav-align-top tab-Inspections">

                     

                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="ModifyItem" role="tabpanel">
                               


                                                  <div class="row">
                                                    <div>
                                                       <a href="#" type="button" class="btn btn-Attatchment" onclick="AllAttactment()" style="float: right">
                                                                  <i class="fa fa-paperclip" style="font-size: x-large;"></i>
                                                            </a>
                                                         <a href="#" type="button" class="btn btn-Attatchment" onclick="ReportView()" style="float: right">
                                                                <i class="fa fa-file-pdf-o" title="EXPORT" style="font-size: x-large;"></i>
                                                         </a>
                                                       <div class="pull-right">
                                                           &nbsp; &nbsp; &nbsp; 
                                                            <button type="button" class="btn rounded-pill me-2 btn-secondary btnAddCl" onclick="getSalesOrderItems()" style="float: right">
                                                                Add Items&nbsp; 
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">

                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmadepartrmentM" disabled>
                                                        </div>
                                                    </div>


                                                    <div class="col-3">
                                                        <label class="col-form-label label-custom" for="basic-default-name">Customer Name</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmacustomernameM" disabled>
                                                        </div>

                                                    </div>

                                                  <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Refference Number</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmarefferanceM" disabled>
                                                        </div>
                                                    </div>

                                                    <div class="col-3">
                                                        <label class="col-form-label label-custom" for="basic-default-name">Sales Order</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmasalesorderM" disabled>
                                                        </div>

                                                    </div>
                                                    <div style="padding-left:41%;margin-top:7px">
                                                         <label class="col-form-label label-custom" for="basic-default-name">UpdatedBy :</label>
                                                         <label class="col-form-label label-custom" style="color:green;font-size:22px" id="lblUpdatedBy"/>
                                                        </div>
                                                    <div style="padding-left:41%;margin-top:7px">
                                                         <label class="col-form-label label-custom" for="basic-default-name">REMARKS :</label>
                                                         <label class="col-form-label label-custom" style="color:red;font-size:22px" id="lblRemarks"/>
                                                        </div>
                                                </div>

                                                <div class="card-body" style="margin-top: -2%;">
                                                   
                                                    <div class="" style="margin-top: 1%;">
                                                         

                                                        <table class="table table-bordered table-striped Return-Modify-list-table" style="width:100%;">

                                                            <thead>
                                                                <tr>
                                                                     <th>Id</th>
                                                                    <th>MRN.No</th>
                                                                    <th>Item Code</th>
                                                                    <th>Item Category</th>
                                                                    <th>Item Description</th>
                                                                    <th>SalesOrder.QTY</th>
                                                                    <th style="display:none">Section</th>
                                                                    <th style="display:none">QTY.Returned</th>
                                                                    <th style="display:none">Reason for Returning</th>
                                                                     <th>Item.QTY</th>
                                                                     <th>Remarks</th>
                                                                     <th>Section</th>
                                                                    <th>Action</th>
                                                                  

                                                                </tr>
                                                            </thead>

                                                            <tbody class="tbody-ReturnModify">
                                                            </tbody>
                                                        </table>

                       

                                                        <div>
                                                            <div class="pull-right" style="padding-right: 10%; padding-bottom: 30px; padding-top: 30px">
                                                                <a href="#" class="btn rounded-pill me-2 btn-secondary btn-submit-cl" onclick="SaveModifiedItemStatus()" >
                                                                    Modified &nbsp; 
                                                                </a>


                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>

                            </div>

                        </div>

                    </div>

                    <div class="modal-footer">
                        <%--<button type="button" id="Button1" class="btn btn-primary" runat="server" data-bs-dismiss="modal" onclick="addchklist()">Add</button>--%>

                    </div>
                </div>
            </div>
        </div>

    </div>
   
    <%-- Modal for Iems from oracle, selet and add --%>

    <div class="modal fade" id="ModalRequesteditemadd" tabindex="-2" aria-hidden="true" style="background-color: #13131466">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalitemadadsfd">MATERIAL RETURN REQUEST ITEM DETAILS</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">

                     <table class="table table-bordered table-striped salesorder-item-list-table" style="width:100%;">


                    <thead>
                        <tr><th>Order.No</th>
                            <th>ItemCode</th>
                            <th>ItemCategory</th>
                            <th>Item Description</th>
                            <th>SalesOrderQTY</th>
                            <%-- <th style="display:none">Item Description</th>--%>
                           
                            <th>Action</th>
                           
                        </tr>
                    </thead>


                    <tbody class="tbody-itemlist">
                    </tbody>
                </table>


                    <div class="modal-footer">
                        <%--<button type="button" id="Button2" class="btn btn-primary" runat="server" data-bs-dismiss="modal">Add</button>--%>
                        <input type="button" id="btnAddItem" class="btn btn-primary" runat="server" value="Add" />

                    </div>
                </div>
            </div>
        </div>

    </div>




    <%-- Modal QC verified --%>


    <div class="modal fade" id="ModalQCverified" tabindex="-2" aria-hidden="true" style="background-color: #13131466">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalitemadd">MATERIAL RETURN AFTER  QC VERIFICATION</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">

                    <table>
                        <tr>
                            <th>Item Name</th>
                            <th>Item Checklist</th>
                            <th>Remarks</th>

                        </tr>

                        <tr>
                            <td>Centro comercial Moctezuma</td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="defaultChec4k3" checked />
                                    <label class="form-check-label" for="defaultCheck3">
                                        Selected
                                    </label>
                                </div>
                            </td>
                            <td>
                                <input type="text" class="form-control" id="defaultFormControlInput4" placeholder="Enter your comment" aria-describedby="defaultFormControlHelp" />

                            </td>
                        </tr>

                        <tr>
                            <td>Island Trading</td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck113" checked />
                                    <label class="form-check-label" for="defaultCheck3">
                                        Selected
                                    </label>
                                </div>
                            </td>
                            <td>
                                <input type="text" class="form-control" id="defaultFormControlIn11put" placeholder="Enter your comment" aria-describedby="defaultFormControlHelp" />

                            </td>

                        </tr>

                        <tr>
                            <td>Magazzini Alimentari Riuniti</td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="defaul11tCheck3" />
                                    <label class="form-check-label" for="defaultCheck3">
                                        Rejected
                                    </label>
                                </div>
                            </td>
                            <td>
                                <input type="text" class="form-control" id="defaultFo11rmControlInput" placeholder="Enter your comment" aria-describedby="defaultFormControlHelp" />

                            </td>
                        </tr>
                    </table>

                    <%-- <div class="modal-footer">
                        <button type="button" id="Button3" class="btn btn-primary" runat="server" data-bs-dismiss="modal">Add</button>

                    </div>--%>
                </div>
            </div>
        </div>

    </div>

        <%-- Modal for display  All Request Item Details View --%>

    <div class="modal fade" id="RMARequestDetailView" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalView">ITEM DETAILS</h5>
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
                              <i class="fa fa-paperclip" title="ATTATCMENT" style="font-size: x-large;"></i>
                      </a>
                           <a href="#" type="button" class="btn btn-Attatchment" onclick="ReportView()" style="float: right">
                              <i class="fa fa-file-pdf-o" title="EXPORT" style="font-size: x-large;"></i>
                      </a>
                     </div>

                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="ViewDetails" role="tabpanel">
                                <div class="row">
                                    <label id="lblValRcve" class="col-form-label label-custom" style="padding-left:90%;font-size:20px;" ></label>
                                </div>
                               
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

                                <table class="table table-bordered table-striped View-item-table" style="width:100%;">

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

                                                            <tbody class="tbody-ViewDetails">
                                                            </tbody>
                                                        </table>

                                                    </div>
                                                   

                                                </div>

                            </div>
                             <div class="modal-footer">
                                  <a href="#"  id="btnCancel" class="btn btn-Classic" onclick="CancelBox()" style="display:none;">Cancel</a>
                                  <a href="#"  id="btnCancelClose" class="btn btn-Classic" onclick="CloseBox()" style="display:none;">Close</a>
                                 </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>





      <%-- Modal for display  Return To LoadingGate Item Details View --%>

    <div class="modal fade" id="RMAReturnLGView" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalRLGView">ITEM DETAILS</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


               <div class="card-body" style="margin-top: -1%;">
                  <%-- <div class="nav-align-top tab-Inspections">--%>

                      <%--  <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <button type="button" id="btnMINDetails" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-MINDetails" aria-controls="tab-MINDetails" aria-selected="true">SALESORDER DETAILS</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-AttatchmentMIN" aria-controls="tab-AttatchmentMIN" aria-selected="false">ATTATCHMENTS</button>
                    </li>
                    </ul>--%>
                   <div class="pull-right">
                      <a href="#" type="button" class="btn btn-Attatchment" onclick="AllAttactment()" style="float: right">
                              <i class="fa fa-paperclip" style="font-size: x-large;"></i>
                      </a>
                        <a href="#" type="button" class="btn btn-Attatchment" onclick="ReportView()" style="float: right">
                              <i class="fa fa-file-pdf-o" title="EXPORT" style="font-size: x-large;"></i>
                      </a>
                     </div>

                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="tab-MINDetails" role="tabpanel">
                               
                                                <div class="row">

                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmadepartrmentRLGV" disabled>
                                                        </div>
                                                    </div>


                                                    <div class="col-3">
                                                        <label class="col-form-label label-custom" for="basic-default-name">Customer Name</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmacustomernameRLGV" disabled>
                                                        </div>

                                                    </div>

                                                  <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Refference Number</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmarefferanceRLGV" disabled>
                                                        </div>
                                                    </div>

                                                    <div class="col-3">
                                                        <label class="col-form-label label-custom" for="basic-default-name">Sales Order</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmasalesorderRLGV" disabled>
                                                        </div>

                                                    </div>
                                                </div>

                                            
                                   


                       <div class="card-body" style="margin-top: -2%;">

                             <div class="" style="margin-top: 1%;">

                                <table class="table table-bordered table-striped RLGV-item-table" style="width:100%;">

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
                                                                    <th>Return LoadingGate QTY</th>

                                                                </tr>
                                                            </thead>

                                                            <tbody class="tbody-ReturnLGView">
                                                            </tbody>
                                                        </table>

                                                    </div>
                                                  </div>
                        
                                                

                            <div class="modal-footer">
                        <a href="#" id="Button3" class="btn btn-primary" runat="server" onclick="CloseItemDetails()">Close</a>
                    </div>
                                </div>

<%--                      <div class="tab-pane fade" id="tab-AttatchmentMIN" role="tabpanel">

                                <div class="row">
                                     <div class="col-6 pull-left">
                                <div class="input-group mb-3" style="position: relative; top: 10px;">                                   
                                    <input class="form-control" type="file" id="colFileUploadMin"  accept=".pdf,.png,.jpeg" multiple >
                                    <label class="input-group-text" for="inputGroupFile02"><i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i></label>

                                     <div style="margin-left: 9px;">

                                    <a href="#" ID="btnUploadMin" Class=" btn btn-primary">Add Attachment </a> 
                                </div>
                                </div>
                              </div>
                                     </div>
                       <div class="row">

                                    <div class="col-12">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped MIN-Attatchment-table" style="width:100%;">


                                                <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>MRN.No.</th>
                                                        <th>URL</th>
                                                        <th>File Name</th>
                                                        

                                                        <th style="width: 10%;">Action</th>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-AttatchmentMIN">
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>




                                </div>

                            </div>--%>



                            </div>
                            
                    </div>
                </div>
            </div>
        </div>

            <%-- modal for MIN number --%>

    <div class="modal fade" id="RMAMriNo" tabindex="-2" aria-hidden="true" style="background-color: #13131466";>
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content" >
                <div class="modal-header">
                    <h5 class="modal-title" id="modalrmanumber"> MIN NUMBER </h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">
                    <div style="padding-left:161px;">
                      <input type="checkbox" id="cbNotApplicable" value ="NotApplicable" />&nbsp;MIN not Applicable
                        
                        </div>
                     <div class="row">

                        <div class="col">
                            <label for="html5-number-input" class="col-form-label label-custom">Enter MIN Number</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtrmanumber">
                            </div>
                        </div>
                         
                    </div>


                    <div class="row remarks-note" style="display:none;">
                         <div class="col">
                             
                            <label for="html5-number-input" class="col-form-label label-custom">Enter The Remarks</label>
                            <div class="">
                                <textarea rows="3" cols="8" class="form-control" type="text" value="" id="txtMRemarks"></textarea>
                            </div>
                                 
                        </div>
                        </div>
                        
                  
                 
                    <div class="modal-footer">
                        <a href="#"  id="btnSaveLG" class="btn btn-primary"onclick="SaveLoadingGate()">Save</a>

                    </div>
                </div>
            </div>
        </div>
    </div>


      <%-- Modal for display  Return To LoadingGate Closed Item Details View --%>

    <div class="modal fade" id="RMAReturnLClosedView" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalClosedView">ITEM DETAILS</h5>
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
                            <div class="tab-pane fade show active" id="ViewDetailClosed" role="tabpanel">
                               
                                                <div class="row">

                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmadepartrmentClosed" disabled>
                                                        </div>
                                                    </div>


                                                    <div class="col-3">
                                                        <label class="col-form-label label-custom" for="basic-default-name">Customer Name</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmacustomernameClosed" disabled>
                                                        </div>

                                                    </div>

                                                  <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Refference Number</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmarefferanceClosed" disabled>
                                                        </div>
                                                    </div>

                                                    <div class="col-3">
                                                        <label class="col-form-label label-custom" for="basic-default-name">Sales Order</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" value="" id="txtrmasalesorderClosed" disabled>
                                                        </div>

                                                    </div>
                                                </div>

                                            
                                   


                       <div class="card-body" style="margin-top: -2%;">

                             <div class="" style="margin-top: 1%;">

                                <table class="table table-bordered table-striped Closed-item-table" style="width:100%;">

                                    <thead>
                                                                <tr>
                                                                    
                                                                     <th>Id</th>
                                                                    <th>MRN.No</th>
                                                                    <th>Item Code</th>
                                                                    <th>Item Category</th>
                                                                    <th>Item Description</th>
                                                                     <th>Item.QTY</th>
                                                                     <th>Remarks</th>
                                                                    <th>Accepted QTY</th>
                                                                     <th>RMA.No</th>
                                                                    <th>Rejected QTY</th>
                                                                    <th>RE-Use</th>
                                                                    <th>Scrap</th>
                                                                    <th>Return QTY</th>
                                                                    <th>MIN.No</th>

                                                                </tr>

                                                               
                                                            </thead>

                                                            <tbody class="tbody-ReturnClosedView">
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

     <%-- Modal for display  Actual Closed Item Details View --%>

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
                                                                    <th>Action</th>

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
                                     <div class="col-6 pull-left upload-Attatchment" style="display:block">
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
                     <div class="" style="margin-top: 1%;">
                    <table class="table table-bordered table-striped New-Attatchment-table" style="padding-top:1%;width:100%;">


                                                <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>File Name</th>
                                                          <th style="display:none;">URL</th>
                                                         <th>Description</th>

                                                        <th style="width: 20%;">Action</th>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-AttatchmentNew">
                                                </tbody>
                                            </table>
                       </div>
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

         
                 <%-- <div class="timeline-empty">
                  </div>

               <div class="timeline-middle">
                   <div class="timeline-circle"></div>
               </div>
              <div class=" timeline-component timeline-content">
                  <h3 style="color:blue;">MIN UPDATE</h3>
                   <p style="color:black;">UpdatedBy:&nbsp;&nbsp;<label id="lblMINBy" class="col-form-label" style="color:green;font-size:20px;"></label> </p>
                   <p style="color:black;">UpdatedDate:&nbsp;&nbsp<label id="lblMINDate" class="col-form-label" style="color:red;font-size:18px;"></label></p>
               </div>
         <div class=" timeline-component timeline-content">
                  <h3 style="color:blue;">REQUEST CLOSED</h3>
                   <p style="color:black;">UpdatedBy:&nbsp;&nbsp;<label id="lblQcCnfBy" class="col-form-label" style="color:green;font-size:20px;"></label> </p>
                   <p style="color:black;">UpdatedDate:&nbsp;&nbsp<label id="lblQcCnfDate" class="col-form-label" style="color:red;font-size:18px;"></label></p>
          </div>
               <div class="timeline-middle">
                    <div class="timeline-circle"></div>
                </div>
                <div class="timeline-empty">
                </div>

                <div class="timeline-empty">
                </div>

               <div class="timeline-middle">
                   <div class="timeline-circle"></div>
               </div>
           <div class=" timeline-component timeline-content">
                  <h3 style="color:blue;">QC TESTED</h3>
                   <p style="color:black;">UpdatedBy:&nbsp;&nbsp;<label id="lblQcTstBy" class="col-form-label" style="color:green;font-size:20px;"></label> </p>
                   <p style="color:black;">UpdatedDate:&nbsp;&nbsp<label id="lblQcTstDate" class="col-form-label" style="color:red;font-size:18px;"></label></p>
               </div>
              <div class=" timeline-component timeline-content">
                     <h3 style="color:blue;">STORE UPDATE</h3>
                   <p style="color:black;">UpdatedBy:&nbsp;&nbsp;<label id="lblStrRcvdBy" class="col-form-label" style="color:green;font-size:20px;"></label> </p>
                   <p style="color:black;">UpdatedDate:&nbsp;&nbsp<label id="lblStrRcvDate" class="col-form-label" style="color:red;font-size:18px;"></label></p>
                </div>
                <div class="timeline-middle">
                    <div class="timeline-circle"></div>
                </div>
                <div class="timeline-empty">
                </div>

                <div class="timeline-empty">
                </div>

               <div class="timeline-middle">
                   <div class="timeline-circle"></div>
               </div>
            <div class=" timeline-component timeline-content">
                <h3 style="color:blue;">MODIFY REQUEST</h3>
                   <p style="color:black;">UpdatedBy:&nbsp;&nbsp;<label id="lblModifydBy" class="col-form-label" style="color:green;font-size:20px;"></label> </p>
                   <p style="color:black;">UpdatedDate:&nbsp;&nbsp<label id="lblModifyDate" class="col-form-label" style="color:red;font-size:18px;"></label></p>
           </div>
              <div class="timeline-component timeline-content">
                   <h3 style="color:blue;">APPROVED REQUEST</h3>
                   <p style="color:black;">UpdatedBy:&nbsp;&nbsp;<label id="lblApprovedBy" class="col-form-label" style="color:green;font-size:20px;"></label> </p>
                   <p style="color:black;">UpdatedDate:&nbsp;&nbsp<label id="lblApprovedDate" class="col-form-label" style="color:red;font-size:18px;"></label></p>
                </div>
               <div class="timeline-middle">
                    <div class="timeline-circle"></div>
                </div>
                <div class="timeline-empty">
                </div>

                <div class="timeline-empty">
                </div>

               <div class="timeline-middle">
                   <div class="timeline-circle"></div>
               </div>
          <div class="timeline-component timeline-content">
                <h3 style="color:blue;">REQUEST CREATED</h3>
                <p style="color:black;">UpdatedBy:&nbsp;&nbsp;<label id="lblCrtBy" class="col-form-label" style="color:green;font-size:20px;"></label> </p>
                   <p style="color:black;">UpdatedDate:&nbsp;&nbsp<label id="lblCrtDate" class="col-form-label" style="color:red;font-size:18px;"></label></p>
           </div>--%>


       </div>
    </div> 
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

                <%-- modal for Cancel Remarks number --%>

    <div class="modal fade" id="RMACancelRemarks" tabindex="-2" aria-hidden="true" style="background-color: #13131466";>
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content" >
                <div class="modal-header">
                    <h5 class="modal-title" id="modalCancelRemarks">REMARKS</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body">
                    

                    <div class="row remarks-note" >
                         <div class="col">
                             
                            <label for="html5-number-input" class="col-form-label label-custom">Enter The Remarks</label>
                            <div class="">
                                <textarea rows="3" cols="8" class="form-control" type="text" value="" id="txtCLRemarks"></textarea>
                            </div>
                                 
                        </div>
                        </div>
                        <%-- <div class="row">

                        <div class="col">
                            <label for="html5-number-input" class="col-form-label label-custom">Enter MIN Number</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtrmanumber">
                            </div>
                        </div>

                    </div>--%>

                  
                 
                    <div class="modal-footer">
                        <a href="#"  id="btnSaveCLR" class="btn btn-primary" data-bs-dismiss="modal" onclick="Cancelled()">Save</a>

                    </div>
                </div>
            </div>
        </div>

    </div>


    <div class="modal fade" id="ModalSOOrg" tabindex="-2" aria-hidden="true" style="background-color: #13131466"  data-bs-backdrop="static">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalSOOrg">SALESORDER</h5>
                   
                </div>


                <div class="modal-body">

                     <table class="table table-bordered table-striped SOorg-item-list-table" style="width:100%;">


                    <thead>
                        <tr><th style="display:none;">Order.No</th>
                            
                             <th>Customer Name</th>
                            <th style="display:none;">ORG.Id</th>
                            <th>Company</th>
                            
                           
                           
                            
                        </tr>
                    </thead>


                    <tbody class="tbody-SOorg">
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


         <div class="modal fade" id="ModalSOHistory" tabindex="-2" aria-hidden="true" style="background-color: #13131466">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalSOhistory">ITEM HISTORY</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body" style="max-height:820px;overflow-y:auto;">

                    <div class="design-section">
                         <div class="timeline">

         
                  <div class="timeline-empty">
                  </div>

               <div class="timeline-middle">
                   <div class="timeline-circle"></div>
               </div>
              <div class=" timeline-component timeline-content">
                  <h3 style="color:blue;">MIN UPDATE</h3>
                   <p style="color:black;">MIN.NO:&nbsp;&nbsp;<label id="lblMINNo" class="col-form-label" style="color:red;font-size:20px;"></label> </p>
                   <p style="color:black;">Remarks:&nbsp;&nbsp<label id="lblMINRemarks" class="col-form-label" style="color:green;font-size:18px;"></label></p>
               </div>
         <div class=" timeline-component timeline-content">
                  <h3 style="color:blue;">RMA UPDATE</h3>
                   <p style="color:black;">RMA.NO:&nbsp;&nbsp;<label id="lblRmaNo" class="col-form-label" style="color:red;font-size:20px;"></label> </p>
                   <p style="color:black;">UpdatedDate:&nbsp;&nbsp<label id="lblRmaDate" class="col-form-label" style="color:green;font-size:18px;"></label></p>
          </div>
               <div class="timeline-middle">
                    <div class="timeline-circle"></div>
                </div>
                <div class="timeline-empty">
                </div>

                <div class="timeline-empty">
                </div>

               <div class="timeline-middle">
                   <div class="timeline-circle"></div>
               </div>
           <div class=" timeline-component timeline-content">
                  <h3 style="color:blue;">ACCEPTED & REJECTED</h3>
                   <p style="color:black;">AcceptedQTY:&nbsp;&nbsp;<label id="lblAccptd" class="col-form-label" style="color:red;font-size:20px;"></label> </p>
                   <p style="color:black;">RejecteedQTY:&nbsp;&nbsp<label id="lblRjected" class="col-form-label" style="color:red;font-size:18px;"></label></p>
                   <p style="color:black;">ReUseQTY:&nbsp;&nbsp<label id="lblReuse" class="col-form-label" style="color:red;font-size:18px;"></label></p>
                   <p style="color:black;">ScrapQTY:&nbsp;&nbsp<label id="lblScrap" class="col-form-label" style="color:red;font-size:18px;"></label></p>
                   <p style="color:black;">ReturnLG.QTY:&nbsp;&nbsp<label id="lblReturn" class="col-form-label" style="color:red;font-size:18px;"></label></p>
               </div>
              <div class=" timeline-component timeline-content">
                     <h3 style="color:blue;">STORE UPDATE</h3>
                   <p style="color:black;">Description:&nbsp;&nbsp;<label id="lblStoreDescription" class="col-form-label" style="color:green;font-size:20px;"></label> </p>
                   
                </div>
                <div class="timeline-middle">
                    <div class="timeline-circle"></div>
                </div>
                <div class="timeline-empty">
                </div>

                <div class="timeline-empty">
                </div>

               <div class="timeline-middle">
                   <div class="timeline-circle"></div>
               </div>
           <div class=" timeline-component timeline-content">
                <h3 style="color:blue;">QC UPDATE</h3>
                   <p style="color:black;">Remark:&nbsp;&nbsp;<label id="lblQcRemarks" class="col-form-label" style="color:green;font-size:20px;"></label> </p>
                  
           </div>
              <div class="timeline-component timeline-content">
                   <h3 style="color:blue;">RETURN DETAILS</h3>
                   <p style="color:black;">ReturnQTY:&nbsp;&nbsp;<label id="lblReturnQTY" class="col-form-label" style="color:red;font-size:20px;"></label> </p>
                   <p style="color:black;">Remarks:&nbsp;&nbsp<label id="lblReturnRemarks" class="col-form-label" style="color:green;font-size:18px;"></label></p>
                </div>
                <div class="timeline-middle">
                    <div class="timeline-circle"></div>
                </div>
               <%--<div class="timeline-middle">
                    <div class="timeline-circle"></div>
                </div>
                <div class="timeline-empty">
                </div>

                <div class="timeline-empty">
                </div>

               <div class="timeline-middle">
                   <div class="timeline-circle"></div>
               </div>
          <div class="timeline-component timeline-content">
                <h3>REQUEST CREATED</h3>
                <p>UpdatedBy:&nbsp;&nbsp;<label id="lblCrtBy" class="col-form-label" style="color:green;font-size:20px;"></label> </p>
                   <p>UpdatedDate:&nbsp;&nbsp<label id="lblCrtDate" class="col-form-label" style="color:red;font-size:18px;"></label></p>
           </div>--%>


       </div>
    </div> 
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


<%--    <script src="script/html2pdf.bundle.min.js"></script>
    <script src="script/jspdf.min.js"></script>--%>
    <script src="script/lodingmaster.js"></script>
    <script src="../Template/Datatable/js/jquery.dataTables.min.js"></script>
    <script src="../Template/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../Template/Datatable/js/jszip.min.js"></script>
    <script src="../Template/Datatable/js/pdfmake.min.js"></script>
    <script src="../Template/Datatable/js/buttons.print.min.js"></script>
    <script src="../Template/Datatable/js/vfs_fonts.js"></script>
    <script src="../Template/Datatable/js/buttons.html5.min.js"></script>


    <%-- Date picker --%>

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>



    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

     
  <%-- <script>

       function generatePDF() {

           // Choose the element id which you want to export.
           var element = document.getElementById('ExportDiv');
           element.style.width = '700px';
           element.style.height = '100%';

           var opt = {
               margin: 0.5,
               filename: 'RequestReport.pdf',
               image: { type: 'jpeg', quality: 1 },
               html2canvas: { scale: 2 },
               //pagebreak: { mode: 'avoid-all', before: '#page2el' },
               pagebreak: { mode: ['avoid-all', 'css', 'legacy'] },



               jsPDF: { unit: 'in', format: 'a3', orientation: 'portrait', precision: '12' }
           };

           var doc = new jsPDF();
           doc.rect(20, 20, doc.internal.pageSize.width - 40, doc.internal.pageSize.height - 40, 'S');


           // choose the element and pass it to html2pdf() function and call the save() on it to save as pdf.
           html2pdf().set(opt).from(element).save();


       }
   </script>--%>


</asp:Content>

