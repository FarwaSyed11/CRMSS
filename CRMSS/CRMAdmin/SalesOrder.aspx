<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="SalesOrder.aspx.cs" Inherits="CRMAdmin_SalesOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />



    <style type="text/css">

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

   

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

         

        <div style="padding-left: 2%; padding-top: 1%;">
            <h5 style="color: #a92828; margin-top: 13px">SALES ORDER</h5>
        </div>

        <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

                          <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label8" Text="Company" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select id="ddlCompany" class="form-select color-dropdown">
                              </select>
                          </td>


                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label10" Text="Manager" runat="server" Font-Size="Medium" Font-Bold="true" />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlManager"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label11" Text="Salesman" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlMember"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label1" Text="Year" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 6%">
                              <select class="form-select placement-dropdown" id="ddlYear"> </select>
                          </td>
                          

                          <td class="no-border label-alignment" style="width: 1%"></td>
                        
                   
                          <td class="no-border" style="width: 5%">

                              <input type="button" id="btnSearch" value="Search" class="btn btn-danger d-block" style="font-size:small" /> 
                          </td>
                      </tr>
                  </table>
      </div>

        <div class="card-body" style="margin-top: -1%;">
            <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SOEntered" aria-controls="tab-SOEntered" aria-selected="true">Entered</button>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SOBooked" aria-controls="tab-SOBooked" aria-selected="true">Booked</button>
                    </li>

                    <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SOClosed" aria-controls="tab-SOClosed" aria-selected="true">Closed</button>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SOCancelled" aria-controls="tab-SOCancelled" aria-selected="false">Cancelled</button>
                    </li>


                </ul>

                <div class="tab-content">

                    <div class="tab-pane fade show active" id="tab-SOEntered" role="tabpanel">

                        <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped SO-Entered-details" style="width: 100%;">


                                <thead>
                                    <tr class="Head-tr">
                                        <%--<th>Id</th>--%>
                                        <th class="hidden"  style="width: 8%">ID</th>
                                        <th style="width: 8%">SalesOrder Number</th>
                                        <th style="width: 10%; display: none;">Status</th>
                                        <th style="width: 10%; display: none;">OrgId</th>
                                        <th style="width: 10%">Order Date</th>
                                        <th style="width: 5%">Aging</th>
                                        <th style="width: 8%">Opportunity Number</th>
                                        <th style="width: 5%">Customer Name</th>
                                        <th style="width: 5%">Value</th>

                                        <th style="width: 5%; display: none;">Booked Date</th>
                                        <th style="width: 20%;display:none;">Header Remarks</th>
                                        <th style="width: 10%;display:none;">Header LastUpdate</th>
                                        <th style="width: 10%">Expected Booked On</th>
                                        <th style="width: 15%">Remarks</th>
                                        <th style="width: 8%">Action</th>



                                    </tr>
                                </thead>


                                <tbody class="tbody-SOEntered">
                                </tbody>
                            </table>
                        </div>
                    </div>



                    <div class="tab-pane fade" id="tab-SOBooked" role="tabpanel">

                        <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped SO-Booked-table" style="width: 100%;">


                                <thead>
                                    <tr class="Head-tr">
                                        <%--<th>Id</th>--%>
                                        <th class="hidden" style="width: 8%">ID</th>
                                        <th style="width: 10%">SalesOrder Number</th>
                                        <th style="width: 10%; display: none;">Status</th>
                                        <th style="width: 10%; display: none;">OrgId</th>
                                        <th style="width: 10%">Order Date</th>
                                        <th style="width: 10%">Aging</th>
                                        <th style="width: 10%">Booked Date</th>
                                        <th style="width: 15%">Opportunity Number</th>
                                        <th style="width: 15%">Customer  Name</th>
                                        <th style="width: 10%">Value</th>
                                        <th style="width: 5%">Invoiced Amount</th>
                                        <th style="width: 5%">Collected Amount</th>
                                        <th style="width: 5%">Pending For Invoice</th>
                                        <th style="width: 5%" class="hidden">Pending For Collection</th>
                                         <th style="width: 5%" class="hidden">Pending Due</th>
                                         <th style="width: 5%" class="hidden">Pending Not Due</th>
                                        <th style="width: 10%;display: none;">Booked Date</th>
                                        <th style="width: 20%;display: none;">Header Remarks</th>
                                        <th style="width: 10%;display: none;">Header LastUpdate</th>
                                        <th style="width: 5%">View</th>
                                    </tr>
                                </thead>


                                <tbody class="tbody-SOBooked">
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="tab-SOClosed" role="tabpanel">

                        <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped SO-Closed-table" style="width: 100%;">


                                <thead>
                                    <tr class="Head-tr">
                                        <%--<th>Id</th>--%>
                                        <th class="hidden" style="width: 8%">ID</th>
                                        <th style="width: 10%">SalesOrder Number</th>
                                        <th style="width: 10%; display: none;">Status</th>
                                        <th style="width: 10%; display: none;">OrgId</th>
                                        <th style="width: 10%">Order Date</th>
                                        <th style="width: 10%">Aging</th>
                                        <th style="width: 10%">Booked Date</th>
                                        <th style="width: 15%">Opportunity Number</th>
                                        <th style="width: 15%">Customer  Name</th>
                                        <th style="width: 10%">Value</th>
                                        <th style="width: 5%">Invoiced Amount</th>
                                        <th style="width: 5%">Collected Amount</th>
                                        <th style="width: 5%">Pending For Invoice</th>
                                        <th style="width: 5%" class="hidden">Pending For Collection</th>
                                         <th style="width: 5%" class="hidden">Pending Due</th>
                                         <th style="width: 5%" class="hidden">Pending Not Due</th>
                                        <th style="width: 10%;display: none;">Booked Date</th>
                                        <th style="width: 20%;display: none;">Header Remarks</th>
                                        <th style="width: 10%;display: none;">Header LastUpdate</th>
                                        <th style="width: 5%">View</th>
                                    </tr>
                                </thead>


                                <tbody class="tbody-SOClosed">
                                </tbody>
                            </table>
                        </div>
                    </div>




                    <div class="tab-pane fade" id="tab-SOCancelled" role="tabpanel">

                        <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped SO-Cancelled-table" style="width: 100%;">


                                <thead>
                                    <tr class="Head-tr">
                                        <th style="width: 8%">ID</th>
                                        <th style="width: 10%">SalesOrder Number</th>
                                        <th style="width: 10%; display: none;">Status</th>
                                        <th style="width: 10%; display: none;">OrgId</th>
                                        <th style="width: 10%">Order Date</th>
                                        <th style="width: 10%">Aging</th>
                                        <th style="width: 15%">Opportunity Number</th>
                                        <th style="width: 15%">Customer  Name</th>
                                        <th style="width: 10%">Value</th>
                                        <th style="width: 10%; display: none;">Booked Date</th>
                                        <th style="width: 20%;display: none;">Header Remarks</th>
                                        <th style="width: 10%;display: none;">Header LastUpdate</th>
                                        <th style="width: 5%">View</th>
                                    </tr>
                                </thead>


                                <tbody class="tbody-SOCancelled">
                                </tbody>
                            </table>
                        </div>
                    </div>



                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="modalSODetails" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="WorkFlowDet">SALES ORDER DETAILS</h5>
             <div class="containerButtn FormButton" style="display:none;">

      <%--  <div class="toggleButtn">

            <input type="radio" id="choice1" name="choice" value="Sales Order" onclick="ChangePage()">
            <label for="choice1">Sales Order</label>

            <input type="radio" id="choice2" name="choice" value="Invoice" onclick="ChangePage()">
            <label for="choice2">Invoice</label>

             <input type="radio" id="choice3" name="choice" value="Collection" onclick="ChangePage()">
             <label for="choice3">Collection</label>


            <div id="flap"><span class="content">Sales Order</span></div>

        </div>--%>

                 <div class="nav-align-top">
                        <ul class="nav nav-pills mb-3 ul-so" role="tablist">
                          <li class="nav-item" style="BACKGROUND: #e5bbbb;">
                            <button type="button" id="FormbtnSO" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-home" aria-controls="navs-pills-top-home" aria-selected="true">Sales Order</button>
                          </li>
                          <li class="nav-item" style="BACKGROUND: #e5bbbb;">
                            <button type="button" id="FormbtnInvoice" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-profile" aria-controls="navs-pills-top-profile" aria-selected="false">Invoice</button>
                          </li>
                          <li class="nav-item" style="BACKGROUND: #e5bbbb;">
                            <button type="button" id="FormbtnCollection" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-messages" aria-controls="navs-pills-top-messages" aria-selected="false">Collection</button>
                          </li>
                        </ul>
                </div>


    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body SalesOrder-Details">


                     <%--Rectangle box--%>

                    <div style="margin-top: -13px; position: absolute; width: 96%;">
                        <div style="text-align: right;">
                            <i class="bx bxs-chevron-up proj-det-drilldown" onclick="hideShowProjDetails()"></i>
                        </div>
                    </div>



                    <div id="proj-details-rectangle-div" style="background:white;padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">



                        <div class="" style="margin-top: 1.5%;">

                           

                                <div class="row">
                                    <div class="col-3 Entered-SO-Table" style="border-right: 2px solid #a08f8f12;">
                                        <table>

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;">Entered SalesOrder </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Number Of Item :</td>
                                                    <td class="td-Entered-Item-count" style="color: #98ca3c; text-align: left; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px green;"></td>

                                                    <td style="text-align: right;">Sum Of Value :</td>
                                                    <td class="td-Entered-Item-Value" style="color: #fbc11e; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #cb9809;"></td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Sum Of Quantity :</td>
                                                    <td class="td-Entered-Item-Quantity" style="color: #0b9adcbf; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #099bc8;"></td>

                                                </tr>


                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="col-3 Booked-SO-Table" style="border-right: 2px solid #a08f8f12;">
                                        <table>

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;">Booked SalesOrder </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Number Of Item :</td>
                                                    <td class="td-Booked-Item-count" style="color: #98ca3c; text-align: left; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px green;"></td>

                                                    <td style="text-align: right;">Sum Of Value :</td>
                                                    <td class="td-Booked-Item-Value" style="color: #fbc11e; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #cb9809;"></td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Sum Of Quantity :</td>
                                                    <td class="td-Booked-Item-Quantity" style="color: #0b9adcbf; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #099bc8;"></td>

                                                </tr>



                                            </tbody>
                                        </table>
                                    </div>



                                    <div class="col-3 AwShipping-SO-Table" style="border-right: 2px solid #a08f8f12;">
                                        <table>

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;">Awaiting Shipping SalesOrder </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Number Of Item :</td>
                                                    <td class="td-AwShipping-Item-count" style="color: #98ca3c; text-align: left; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px green;"></td>

                                                    <td style="text-align: right;">Sum Of Value :</td>
                                                    <td class="td-AwShipping-Item-Value" style="color: #fbc11e; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #cb9809;"></td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Sum Of Quantity :</td>
                                                    <td class="td-AwShipping-Item-Quantity" style="color: #0b9adcbf; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #099bc8;"></td>

                                                </tr>



                                            </tbody>
                                        </table>
                                    </div>

                                     <div class="col-3 AwReturn-SO-Table" style="border-right: 2px solid #a08f8f12;">
                                        <table>

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;">Awaiting Return SalesOrder </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Number Of Item :</td>
                                                    <td class="td-AwReturn-Item-count" style="color: #98ca3c; text-align: left; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px green;"></td>

                                                    <td style="text-align: right;">Sum Of Value :</td>
                                                    <td class="td-AwReturn-Item-Value" style="color: #fbc11e; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #cb9809;"></td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Sum Of Quantity :</td>
                                                    <td class="td-AwReturn-Item-Quantity" style="color: #0b9adcbf; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #099bc8;"></td>

                                                </tr>



                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                                <div class="row" style="padding-top:2%;">

                                  

                                     <div class="col-3 AwReturn-SO-Table" style="border-right: 2px solid #a08f8f12;">
                                        <table>

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;">Closed SalesOrder </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Number Of Item :</td>
                                                    <td class="td-Closed-Item-count" style="color: #98ca3c; text-align: left; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px green;"></td>

                                                    <td style="text-align: right;">Sum Of Value :</td>
                                                    <td class="td-Closed-Item-Value" style="color: #fbc11e; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #cb9809;"></td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Sum Of Quantity :</td>
                                                    <td class="td-Closed-Item-Quantity" style="color: #0b9adcbf; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #099bc8;"></td>

                                                </tr>



                                            </tbody>
                                        </table>
                                    </div>



                                      <div class="col-3 Cancelled-SO-Table" style="border-right: 2px solid #a08f8f12;">
                                        <table>

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;">Cancelled SalesOrder </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Number Of Item :</td>
                                                    <td class="td-Cancelled-Item-Count" style="color: #98ca3c; text-align: left; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px green;"></td>

                                                    <td style="text-align: right;">Sum Of Value :</td>
                                                    <td class="td-Cancelled-Item-Value" style="color: #fbc11e; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #cb9809;"></td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Sum Of Quantity :</td>
                                                    <td class="td-Cancelled-Item-Quantity" style="color: #0b9adcbf; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #099bc8;"></td>

                                                </tr>



                                            </tbody>
                                        </table>
                                    </div>


                                    <div class="col-3 Others-SO-Table" style="border-right: 2px solid #a08f8f12;">
                                        <table>

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;">Other SalesOrder </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Number Of Item :</td>
                                                    <td class="td-Others-Item-Count" style="color: #98ca3c; text-align: left; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px green;"></td>

                                                    <td style="text-align: right;">Sum Of Value :</td>
                                                    <td class="td-Others-Item-Value" style="color: #fbc11e; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #cb9809;"></td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Sum Of Quantity :</td>
                                                    <td class="td-Others-Item-Quantity" style="color: #0b9adcbf; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #099bc8;"></td>

                                                </tr>



                                            </tbody>
                                        </table>
                                    </div>

                                      <div class="col-3 Total-SO-Table" style="border-right: 2px solid #a08f8f12;">
                                        <table>

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #ff0404b0; color: #ffffff;">Total SalesOrder </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Number Of Item :</td>
                                                    <td class="td-Total-Item-Count" style="color: #98ca3c; text-align: left; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px green;"></td>

                                                    <td style="text-align: right;">Sum Of Value :</td>
                                                    <td class="td-Total-Item-Value" style="color: #fbc11e; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #cb9809;"></td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;">Sum Of Quantity :</td>
                                                    <td class="td-Total-Item-Quantity" style="color: #0b9adcbf; text-align: left; padding-left: 6px; text-shadow: 0px 1px 1px #099bc8;"></td>

                                                </tr>



                                            </tbody>
                                        </table>
                                    </div>

                                </div>


                              

                            </div>
                        </div>



                            <%--end--%>



                            <div class="card-body" style="margin-top: -1%;">

                                <div class="" style="overflow-y: auto; max-height: calc(100vh - 60px); overflow-x: hidden">


                                    <div class="card-body" style="margin-top: -1%;">
                                        <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                                            <ul class="nav nav-tabs" role="tablist">
                                                <li class="nav-item">
                                                    <button id="SODetEntered" type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SOItemEntered" aria-controls="tab-SOItemEntered" aria-selected="true">Entered</button>
                                                </li>
                                                <li class="nav-item">
                                                    <button id="SODetBooked" type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SOItemBooked" aria-controls="tab-SOItemBooked" aria-selected="true">Booked</button>
                                                </li>
                                                <li class="nav-item">
                                                    <button id="SODetAwShipping" type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SOItemAwaitingSh" aria-controls="tab-SOItemAwaitingSh" aria-selected="false">Awaiting Shipping</button>
                                                </li>

                                                <li class="nav-item">
                                                    <button id="SODetAwReturn" type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SOItemAwaitingReturn" aria-controls="tab-SOItemAwaitingReturn" aria-selected="false">Awaiting Return</button>
                                                </li>

                                                <li class="nav-item">
                                                    <button id="SODetClosed" type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SOItemClosed" aria-controls="tab-SOItemClosed" aria-selected="true">Closed</button>
                                                </li>
                                                <li class="nav-item">
                                                    <button id="SODetCancelled" type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SOItemCancelled" aria-controls="tab-SOItemCancelled" aria-selected="false">Cancelled</button>
                                                </li>

                                                <li class="nav-item">
                                                    <button id="SODetOtherStatus" type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SOItemOtherStatus" aria-controls="tab-SOItemOtherStatus" aria-selected="false">Other Status</button>
                                                </li>





                                            </ul>

                                            <div class="tab-content">

                                                <div class="tab-pane fade show active" id="tab-SOItemEntered" role="tabpanel">

                                                    <div class="" style="margin-top: 1%;">

                                                        <table class="table table-bordered EnteredSalesOrd-Details-table" style="width: 100%;">


                                                            <thead>
                                                                <tr class="Head-tr">
                                                                    <%--<th>Id</th>--%>
                                                                    <th style="display: none;">Order Number</th>
                                                                    <th style="display: none;">SOLineId</th>
                                                                    <th>Line Number</th>
                                                                    <th>Item Code</th>
                                                                    <th>Item Description</th>
                                                                    <th>Family</th>
                                                                    <th>Quantity</th>
                                                                    <th>Price </th>
                                                                    <th>Value</th>
                                                                    <th>Line Status</th>
                                                                    <th>Aging</th>


                                                                    <%--<th>Status</th>--%>

                                                                    <%-- <th style="width: 10%;">Action</th>--%>
                                                                </tr>
                                                            </thead>


                                                            <tbody class="tbody-SOEnteredDetails">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>




                                                <div class="tab-pane fade" id="tab-SOItemBooked" role="tabpanel">

                                                    <div class="" style="margin-top: 1%;">

                                                        <table class="table table-bordered BookedSalesOrd-Details-table" style="width: 100%;">


                                                            <thead>
                                                                <tr class="Head-tr">
                                                                    <%--<th>Id</th>--%>
                                                                    <th style="display: none;">Order Number</th>
                                                                    <th style="display: none;">SOLineId</th>
                                                                    <th>Line Number</th>
                                                                    <th>Item Code</th>
                                                                    <th>Item Description</th>
                                                                    <th>Family</th>
                                                                    <th>Quantity</th>
                                                                    <th>Price </th>
                                                                    <th>Value</th>
                                                                    <th>Line Status</th>
                                                                    <th>Aging</th>
                                                                    <th>Expected Delivery Dates</th>
                                                                    <th>Remarks</th>
                                                                    <th>Action</th>


                                                                    <%--<th>Status</th>--%>

                                                                    <%-- <th style="width: 10%;">Action</th>--%>
                                                                </tr>
                                                            </thead>


                                                            <tbody class="tbody-SOBookedDetails">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>





                                                <div class="tab-pane fade" id="tab-SOItemClosed" role="tabpanel">

                                                    <div class="" style="margin-top: 1%;">

                                                        <table class="table table-bordered ClosedSalesOrd-Details-table" style="width: 100%;">


                                                            <thead>
                                                                <tr class="Head-tr">
                                                                    <%--<th>Id</th>--%>
                                                                    <th style="display: none;">Order Number</th>
                                                                    <th style="display: none;">SOLineId</th>
                                                                    <th>Line Number</th>
                                                                    <th>Item Code</th>
                                                                    <th>Item Description</th>
                                                                    <th>Family</th>
                                                                    <th>Quantity</th>
                                                                    <th>Price </th>
                                                                    <th>Value</th>
                                                                    <th>Line Status</th>
                                                                    <th>Aging</th>


                                                                    <%--<th>Status</th>--%>

                                                                    <%-- <th style="width: 10%;">Action</th>--%>
                                                                </tr>
                                                            </thead>


                                                            <tbody class="tbody-SOClosedDetails">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                                <div class="tab-pane fade" id="tab-SOItemCancelled" role="tabpanel">

                                                    <div class="" style="margin-top: 1%;">

                                                        <table class="table table-bordered CancelledSalesOrd-Details-table" style="width: 100%;">


                                                            <thead>
                                                                <tr class="Head-tr">
                                                                    <%--<th>Id</th>--%>
                                                                    <th style="display: none;">Order Number</th>
                                                                    <th style="display: none;">SOLineId</th>
                                                                    <th>Line Number</th>
                                                                    <th>Item Code</th>
                                                                    <th>Item Description</th>
                                                                    <th>Family</th>
                                                                    <th>Quantity</th>
                                                                    <th>Price </th>
                                                                    <th>Value</th>
                                                                    <th>Line Status</th>
                                                                    <th>Aging</th>


                                                                    <%--<th>Status</th>--%>

                                                                    <%-- <th style="width: 10%;">Action</th>--%>
                                                                </tr>
                                                            </thead>


                                                            <tbody class="tbody-SOCancelledDetails">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                                <div class="tab-pane fade" id="tab-SOItemAwaitingSh" role="tabpanel">

                                                    <div class="" style="margin-top: 1%;">

                                                        <table class="table table-bordered AwaitingShSalesOrd-Details-table" style="width: 100%;">


                                                            <thead>
                                                                <tr class="Head-tr">
                                                                    <%--<th>Id</th>--%>
                                                                    <th style="display: none;">Order Number</th>
                                                                    <th style="display: none;">SOLineId</th>
                                                                    <th>Line Number</th>
                                                                    <th>Item Code</th>
                                                                    <th>Item Description</th>
                                                                    <th>Family</th>
                                                                    <th>Quantity</th>
                                                                    <th>Price </th>
                                                                    <th>Value</th>
                                                                    <th>Line Status</th>
                                                                    <th>Aging</th>
                                                                    <th>Expected Delivery Date</th>
                                                                    <th>Remarks</th>
                                                                    <th>Action</th>


                                                                    <%--<th>Status</th>--%>

                                                                    <%-- <th style="width: 10%;">Action</th>--%>
                                                                </tr>
                                                            </thead>


                                                            <tbody class="tbody-SOAwaitingShDetails">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>


                                                <div class="tab-pane fade" id="tab-SOItemAwaitingReturn" role="tabpanel">

                                                    <div class="" style="margin-top: 1%;">

                                                        <table class="table table-bordered AwaitingReturnSalesOrd-Details-table" style="width: 100%;">


                                                            <thead>
                                                                <tr class="Head-tr">
                                                                    <%--<th>Id</th>--%>
                                                                    <th style="display: none;">Order Number</th>
                                                                    <th style="display: none;">SOLineId</th>
                                                                    <th>Line Number</th>
                                                                    <th>Item Code</th>
                                                                    <th>Item Description</th>
                                                                    <th>Family</th>
                                                                    <th>Quantity</th>
                                                                    <th>Price </th>
                                                                    <th>Value</th>
                                                                    <th>Line Status</th>
                                                                    <th>Aging</th>


                                                                    <%--<th>Status</th>--%>

                                                                    <%-- <th style="width: 10%;">Action</th>--%>
                                                                </tr>
                                                            </thead>


                                                            <tbody class="tbody-SOAwaitingReturnDetails">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>




                                                <div class="tab-pane fade" id="tab-SOItemOtherStatus" role="tabpanel">

                                                    <div class="" style="margin-top: 1%;">

                                                        <table class="table table-bordered OthersSalesOrd-Details-table" style="width: 100%;">


                                                            <thead>
                                                                <tr class="Head-tr">
                                                                    <%--<th>Id</th>--%>
                                                                    <th style="display: none;">Order Number</th>
                                                                    <th style="display: none;">SOLineId</th>
                                                                    <th>Line Number</th>
                                                                    <th>Item Code</th>
                                                                    <th>Item Description</th>
                                                                    <th>Family</th>
                                                                    <th>Quantity</th>
                                                                    <th>Price </th>
                                                                    <th>Value</th>
                                                                    <th>Line Status</th>
                                                                    <th>Aging</th>


                                                                    <%--<th>Status</th>--%>

                                                                    <%-- <th style="width: 10%;">Action</th>--%>
                                                                </tr>
                                                            </thead>


                                                            <tbody class="tbody-SOOthersDetails">
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


                <div class="modal-body Invoice-Details" style="display: none;">



                    
                    <div style="margin-top: -13px; position: absolute; width: 96%;">
                        <div style="text-align: right;">
                            <i class="bx bxs-chevron-up proj-InvoiceDet-drilldown" onclick="hideShowInvoiceDetails()"></i>
                        </div>
                    </div>



                    <div id="proj-Invoice-Details-div" style="background:white;padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">



                        <div class="" style="margin-top: 1.5%;">

                           

                                <div class="row">
                                    <div style="border-right: 2px solid #a08f8f12;width:14.27%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer" onclick="GetInvoiceDetails('-1')">Sales Order</td>
                                                </tr>

                                                <tr>
                                                   
                                                    <td class="td-SO-Value" style="color: #0a4aff; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #adb3ff;"></td>

                                                </tr>

                                              


                                            </tbody>
                                        </table>
                                    </div>

                                     <div style="border-right: 2px solid #a08f8f12;width:14.27%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer" onclick="GetInvoiceDetails('-1')">Pending For Invoice</td>
                                                </tr>

                                                <tr>
                                                   
                                                    <td class="td-PendingForInv-Value" style="color: #00adff; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #b6e8ff;"></td>
                                                  
                                                </tr>

                                            
                                            </tbody>
                                        </table>
                                    </div>

                                    <div style="border-right: 2px solid #a08f8f12;width:14.27%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer" onclick="GetInvoiceDetails('-1')">Invoice</td>
                                                </tr>

                                                <tr>
                                                   
                                                    <td class="td-Invoice-Value" style="color: #d3ce2c; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #ada800;"></td>

                                                </tr>

                                               
                                            </tbody>
                                        </table>
                                    </div>

                                     <div style="border-right: 2px solid #a08f8f12;width:14.27%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer" onclick="GetInvoiceDetails('PENDING DUE')">Panding Due</td>
                                                </tr>

                                                <tr>
                                                   
                                                    <td class="td-PendingDue-Value" style="color: #f52323; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #a11313;"></td>

                                                </tr>

                                               
                                            </tbody>
                                        </table>
                                    </div>

                                    <div style="border-right: 2px solid #a08f8f12;width:14.27%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer" onclick="GetInvoiceDetails('PENDING NOT DUE')">Panding Not Due</td>
                                                </tr>

                                                <tr>
                                                   
                                                    <td class="td-PendingNotDue-Value" style="color: #ff0000; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #ff0909;"></td>

                                                </tr>

                                               
                                            </tbody>
                                        </table>
                                    </div>



                                    <div style="border-right: 2px solid #a08f8f12;width:14.27%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer" onclick="GetInvoiceDetails('COLLECTED')">Collected</td>
                                                </tr>

                                                <tr>
                                                    
                                                    <td class="td-Collected-Value" style="color: #98ca3c; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #008000;"></td>
                                                </tr>

                                             
                                            </tbody>
                                        </table>
                                    </div>

                                     <div style="border-right: 2px solid #a08f8f12;width:14.27%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer" onclick="GetInvoiceDetails('PENDING COLLECTED')">Pendind For Collect</td>
                                                </tr>

                                                <tr>
                       
                                                    <td class="td-PendingForCollect-Value" style="color: #ff0000; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #ff0909;"></td>
                                                    
                                                </tr>


                                            </tbody>
                                        </table>
                                    </div>

                                </div>


                              

                            </div>
                        </div>



                    <div class="card-body" style="margin-top: -1%;">
                        <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-InvoiceDet" aria-controls="tab-InvoiceDet" aria-selected="true">Invoice Details</button>
                                </li>


                            </ul>

                            <div class="tab-content">

                                <div class="tab-pane fade show active" id="tab-InvoiceDet" role="tabpanel">

                                    <div class="" style="margin-top: 1%;">

                                        <table class="table table-bordered SO-Invoice-details" style="width: 100%;">


                                            <thead>
                                                <tr class="Head-tr">
                                                    <%--<th>Id</th>--%>
                                                    <th class="hidden" style="width: 8%">InvoiceId</th>
                                                    <th style="width: 8%">Invoice Number</th>
                                                    <th style="width: 8%;">Invoice Date</th>
                                                    <th style="width: 8%;">Invoice Amount</th>
                                                    <th style="width: 8%">Amount Due</th>
                                                    <th style="width: 8%">Due Date</th>
                                                    <th style="width: 8%">Paid Amount</th>
                                                    <th style="width: 8%">Cleared Amount</th>
                                                    <th style="width: 6%">Action</th>


                                                </tr>
                                            </thead>


                                            <tbody class="tbody-InvoiceDet">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>




                </div>


       <div class="modal-body Collection-Details">

                     <div style="margin-top: -13px; position: absolute; width: 96%;">
                        <div style="text-align: right;">
                            <i class="bx bxs-chevron-up proj-MainCollection-drilldown" onclick="hideShowMainCollectionDetails()"></i>
                        </div>
                    </div>



                    <div id="proj-MainCollection-Details-div" style="background:white;padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">



                        <div class="" style="margin-top: 1.5%;">

                           

                                <div class="row">
                                    <div style="border-right: 2px solid #a08f8f12;width:20%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer">Sales Order</td>
                                                </tr>

                                                <tr>
                                                   
                                                    <td class="td-SO-Value" style="color: #0a4aff; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #adb3ff;"></td>

                                                </tr>

                                              


                                            </tbody>
                                        </table>
                                    </div>

                                    <div style="border-right: 2px solid #a08f8f12;width:20%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer">Invoice</td>
                                                </tr>

                                                <tr>
                                                   
                                                    <td class="td-MainCollection-Invoice-Value" style="color: #d3ce2c; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #ada800;"></td>

                                                </tr>

                                               
                                            </tbody>
                                        </table>
                                    </div>

                                     <div style="border-right: 2px solid #a08f8f12;width:20%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer">Panding For Collection</td>
                                                </tr>

                                                <tr>
                                                   
                                                    <td class="td-MainPendingCollection-Value" style="color: #f52323; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #a11313;"></td>

                                                </tr>

                                               
                                            </tbody>
                                        </table>
                                    </div>

                                    <div style="border-right: 2px solid #a08f8f12;width:20%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer">Collected</td>
                                                </tr>

                                                <tr>
                                                   
                                                    <td class="td-MainCollection-Collected-Value" style="color: #ff0000; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #ff0909;"></td>

                                                </tr>

                                               
                                            </tbody>
                                        </table>
                                    </div>



                                    <div style="border-right: 2px solid #a08f8f12;width:20%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer">Cleared</td>
                                                </tr>

                                                <tr>
                                                    
                                                    <td class="td-MainCleared-Value" style="color: #98ca3c; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #008000;"></td>
                                                </tr>

                                             
                                            </tbody>
                                        </table>
                                    </div>

                                </div>


                              

                            </div>
                        </div>

                    <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-MainCollectionDet" aria-controls="tab-MainCollectionDet" aria-selected="true">Collection Details</button>
                            </li>


                        </ul>

                        <div class="tab-content">

                            <div class="tab-pane fade show active" id="tab-MainCollectionDet" role="tabpanel">

                                <div class="" style="margin-top: 1%;">

                                    <table class="table table-bordered SO-MainCollection-details" style="width: 100%;">


                                        <thead>
                                            <tr class="Head-tr">
                                                <%--<th>Id</th>--%>
                                                <th style="width: 8%">Receipt Id</th>
                                                <th style="width: 8%">Amount Applied</th>
                                                <th style="width: 8%;">Invoice Number</th>
                                                <th style="width: 8%;">State</th>
                                               
                                            </tr>
                                        </thead>


                                        <tbody class="tbody-MainCollectionDet">
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









     <div class="modal fade" id="modalAddInfo" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="width: 45%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">FILL INFORMATION</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div style="background: #dbdbdb17; padding: 17px; border-radius: 12px; border: 1px solid #dbd7d6; box-shadow: 0px 0px 13px -7px #444444;">

                        <div class="row">
                            <div style="width: 50%">
                                <div class="">
                                    <label for="html5-number-input" class="col-form-label label-custom">Action</label>
                                    <div>
                                        <select id="ddlAction" class="form-control textbox-border-color" >
                                            <option value="TO_BE_BOOKED">To Be Bokked</option>
                                            <option value="CANCEL">Cancel</option>
                                            </select>
                                    </div>
                                </div>
                            </div>

                             <div style="width: 50%;">
                                 <div class="col mb-3 discriptionDiv">
                                     <label for="nameBasic" class="col-form-label label-custom">Remarks </label>
                                     <textarea  id="txtRemarks" rows="3" class="form-control textbox-border-color" placeholder="Enter the Remarks"></textarea>
                                 </div>
                            </div>

                        </div>



                        <div class="row" style="padding-top:1%;">
                            <div class="col-10">
                                </div>

                            <div class="col-2">
                             <a href="#" ID="btnSaveDet" Class=" btn btn-primary" style="float:left;width:95px;">Save</a> 
                                </div>
                        </div>

                    </div>



                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>



     <div class="modal fade" id="modalCollectionDet" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">COLLECTION DETAILS</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                     <div style="margin-top: -13px; position: absolute; width: 96%;">
                        <div style="text-align: right;">
                            <i class="bx bxs-chevron-up proj-Collection-drilldown" onclick="hideShowCollectionDetails()"></i>
                        </div>
                    </div>



                    <div id="proj-Collection-Details-div" style="background:white;padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">



                        <div class="" style="margin-top: 1.5%;">

                           

                                <div class="row">
                                    <div style="border-right: 2px solid #a08f8f12;width:20%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer">Sales Order</td>
                                                </tr>

                                                <tr>
                                                   
                                                    <td class="td-SO-Value" style="color: #0a4aff; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #adb3ff;"></td>

                                                </tr>

                                              


                                            </tbody>
                                        </table>
                                    </div>

                                    <div style="border-right: 2px solid #a08f8f12;width:20%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer">Invoice</td>
                                                </tr>

                                                <tr>
                                                   
                                                    <td class="td-Collection-Invoice-Value" style="color: #d3ce2c; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #ada800;"></td>

                                                </tr>

                                               
                                            </tbody>
                                        </table>
                                    </div>

                                     <div style="border-right: 2px solid #a08f8f12;width:20%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer">Panding For Collection</td>
                                                </tr>

                                                <tr>
                                                   
                                                    <td class="td-PendingCollection-Value" style="color: #f52323; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #a11313;"></td>

                                                </tr>

                                               
                                            </tbody>
                                        </table>
                                    </div>

                                    <div style="border-right: 2px solid #a08f8f12;width:20%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer"    >Collected</td>
                                                </tr>

                                                <tr>
                                                   
                                                    <td class="td-Collection-Collected-Value" style="color: #ff0000; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #ff0909;"></td>

                                                </tr>

                                               
                                            </tbody>
                                        </table>
                                    </div>



                                    <div style="border-right: 2px solid #a08f8f12;width:20%;">
                                        <table style="width:100%;">

                                            <tbody>
                                                <tr>
                                                    <td colspan="4" style="text-align: center; font-weight: 700; background: #d7441124; color: #e25017cf;cursor:pointer">Cleared</td>
                                                </tr>

                                                <tr>
                                                    
                                                    <td class="td-Cleared-Value" style="color: #98ca3c; text-align: center; width: 42px; padding-left: 6px; text-shadow: 0px 1px 1px #008000;"></td>
                                                </tr>

                                             
                                            </tbody>
                                        </table>
                                    </div>

                                </div>


                              

                            </div>
                        </div>

                    <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-CollectionDet" aria-controls="tab-CollectionDet" aria-selected="true">Collection Details</button>
                            </li>


                        </ul>

                        <div class="tab-content">

                            <div class="tab-pane fade show active" id="tab-CollectionDet" role="tabpanel">

                                <div class="" style="margin-top: 1%;">

                                    <table class="table table-bordered SO-Collection-details" style="width: 100%;">


                                        <thead>
                                            <tr class="Head-tr">
                                                <%--<th>Id</th>--%>
                                                <th style="width: 8%">Receipt Id</th>
                                                <th style="width: 8%">Amount Applied</th>
                                                <th style="width: 8%;">Invoice Number</th>
                                                <th style="width: 8%;">State</th>
                                               
                                            </tr>
                                        </thead>


                                        <tbody class="tbody-CollectionDet">
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


             
                
   






     <script type="text/javascript">
        var currUserId = '';
        var EmpNo = '';
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

    <%--    <script src="Scripts/SurveyAdmin.js?v=0.7"></script>--%>
    <script src="Script/SalesOrder.js?v=1.6"></script>
     <link href="Css/CRMAdmin.css" rel="stylesheet" />

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />




    <link href="Css/Style.css" rel="stylesheet" />

    <%--  <link href="Css/Badges.scss" rel="stylesheet" />--%>
    <%--<link href="Css/Badges.scss"/>--%>

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>



  <%--  <link href="../Dashboard/assets/multiselect/example-styles.css" rel="stylesheet" />
    <script src="../Dashboard/assets/multiselect/jquery.multi-select.js"></script>--%>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

</asp:Content>