<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="NewQuotation.aspx.cs" Inherits="CRMQuotation_NewQuotation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>


       <style type="text/css">
    
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
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
        .tab-content
        {
            background: #d7d6d6 !important;
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
           .tbody-CutomerList tr:hover{
               cursor:pointer;
               --bs-table-accent-bg: cadetblue !important
               
           }
           .tbody-OPTLIST tr:hover{
               cursor:pointer;
               --bs-table-accent-bg: cadetblue !important
               
           }
           .form-control,.form-select  {
                   border: 1px solid #b2b3b4;
           }
           
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%; padding-top: 1%;"><h4 style="text-shadow: 1px -3px 8px; color: #a92828;">QUOTATION</h4></div> 

  <div class="card-body" style="margin-top: -2%;">

     <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

                          
                          <td class="no-border" style="width: 18%">
                                <asp:Label ID="Label8" Text="Organization" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select id="ddlOrganization" class="form-select color-dropdown">
                              </select>
                          </td>


                          <td class="no-border label-alignment" style="width: 1%"></td>
                        
                          <td class="no-border" style="width: 18%">
                               <asp:Label ID="Label2" Text="Manager" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlManager"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                        
                          <td class="no-border" style="width: 12%">
                                <asp:Label ID="Label3" Text="Team Member" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlMember"> </select>
                          </td>
                            <td class="no-border label-alignment" style="width: 1%"></td>
                        
                          <td class="no-border" style="width: 12%">
                              <asp:Label ID="Label4" Text="Status" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlStatus">
                                  <option value="DRAFT" selected">DRAFT</option>
                                  <option value="SUBMIT">SUBMIT</option>
                              </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                        
                   
                          <td class="no-border" style="width: 5%">

                              <input type="button" id="btnSearch" value="Search" class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>
                            <td class="no-border" style="width: 5%">
                              <input type="button" id="btnExport" value="Export" class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>
                           <td class="no-border" style="width: 5%">
                              <input type="button" id="btnAddNew" value="New " class="btn btn-primary d-block" style="font-size:small" /> 
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
  <table class="table table-bordered table-striped kpi-user-list-table">
  
    <thead>
     <tr style="height:50px">
            <th class="hidden" style="width:14%;text-align:center;vertical-align:middle">QTN ID</th>
             <th style="width:10%;text-align:center;vertical-align:middle">QTN NO</th>
         <th style="width:10%;text-align:center;vertical-align:middle">OPT NO</th>
            <th style="width:16%;text-align:center;vertical-align:middle">PROJECT NAME</th>
            <th style="width:16%;text-align:center;vertical-align:middle">CLIENT</th>
              <th style="width:10%;text-align:center;vertical-align:middle">DATE</th>
		<th style="width:10%;text-align:center;vertical-align:middle">VALUE</th>
               <th style="width:10%;text-align:center;vertical-align:middle">CREATED BY</th>
                <th style="width:10%;text-align:center;vertical-align:middle">STATUS</th>
                 <th style="width:10%;text-align:center;vertical-align:middle">VIEW</th>
        </tr>
    </thead>
    <tbody class="tbody-employees">

    </tbody>
  </table>
</div>




    </div>
</div>
   
    <div class="modal fade" id="NewQuotation" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 97vw!important;max-height:100vh">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eventModalHeading">Edit Quotation</h5>
                 
                        <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">

                    <div class="nav-align-left">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-home" id="btnQtnDetails">Quotation Header</button>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-profile" id="btnItemDetails">Item Details</button>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-messages">Reports</button>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="navs-left-align-home">
                                <div>
                                    <div class="row">

                                        <div class="col-2">
                                            <label class="col-form-label label-custom" for="basic-default-name">Type</label>
                                            <div class="">
                                                <select id="txtQuotationHeader" class="form-select color-dropdown">
                                                    <option value="QUOTATION">QUOTATION</option>
                                                    <option value="PROFORMA INVOICE">PROFORMA INVOICE</option>
                                                    <option value="COMMERCIAL OFFER">COMMERCIAL OFFER</option>
                                                </select>
                                            </div>
                                        </div>


                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Organization</label>
                                            <div class="">
                                                <select id="ddlOrg" class="form-select color-dropdown">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Quotation Type</label>
                                            <div class="">
                                                <select id="rbQuotationType" class="form-select color-dropdown">
                                                    <option value="BOQ">BOQ</option>
                                                    <option value="Project">Project</option>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-1">
                                            <label for="html5-number-input" class="col-form-label label-custom">Currency</label>
                                            <div class="">
                                                <select id="ddlCurrency" class="form-select color-dropdown">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-1">
                                            <label for="html5-number-input" class="col-form-label label-custom">Rate</label>
                                            <div class="">
                                                <input type="number" id="txtExchangeRate" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Quotation No</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtQTNNumber" readonly="readonly"/>
                                                <input type="hidden" id="hfdQtnID" />
                                                  <input type="hidden" id="hfdRevCopyQtnNumber" />
                                            </div>
                                        </div>

                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Quotation Date</label>
                                             <i class="icontransform deleteQuotation fa fa-trash" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Submit"></i>

                                            <div class="">
                                                <input type="text" id="txtDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
                                            </div>
                                        </div>




                                    </div>
                                </div>
                                <hr />
                                <div>
                                    <div class="row">
                                           <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Client</label>
                                            <div class="">
                                                <div class="input-group">
										
                                            
                                                <input class="form-control" type="text" value="" id="txtClient"  disabled/>
                                                    <span class="input-group-text">
                                            <i class="tf-icons bx bx-search"></i>
                                            </span>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <label class="col-form-label label-custom" for="basic-default-name">OPT Number</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtOptNumber" disabled/>

                                            </div>
                                        </div>
                                        <div class="col-1" style="margin-top: 36px">
                                            <input type="button" id="btnGetOPT" value="Get" class="btn btn-primary d-block" style="font-size: small;display:none !important" />

                                        </div>
                                        

                                        <div class="col-3">
                                            <label class="col-form-label label-custom" for="basic-default-name">Project</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtProjectName" />
                                            </div>
                                        </div>
                                     
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Location</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtProjectLocation" />

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Contact</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtAttentionTo" />

                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Address</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtAddress" />
                                            </div>
                                        </div>

                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Tel</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtTel" />
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Email</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtEmail" />
                                            </div>
                                        </div>



                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Price Validity</label>
                                            <div class="">
                                                <select id="ddlPriceValidity" class="form-select color-dropdown">
                                                </select>

                                            </div>
                                        </div>
                                        <div class="col-1" style="margin-top: 36px">
                                            <input type="button" id="btnAddPriceValidity" value="Other" class="btn btn-primary " style="font-size: small;"  />

                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Delivery</label>
                                            <div class="">
                                                <select id="ddlDelivery" class="form-select color-dropdown">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-1" style="margin-top: 36px">
                                            <input type="button" id="AddDelivery" value="Other" class="btn btn-primary " style="font-size: small;" />

                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Payment Term</label>
                                            <div class="">
                                                <select id="ddlPaymentTerm" class="form-select color-dropdown">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-1" style="margin-top: 36px">
                                            <input type="button" id="AddPayment" value="Other" class="btn btn-primary " style="font-size: small" />

                                        </div>




                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Bidder Name</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtBidderName" />

                                            </div>
                                        </div>

                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Bank</label>
                                            <div class="">
                                                <div class="list-group" id="BankList" style="height: 100px; overflow-y: scroll">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Speacial Note</label>
                                            <div class="">
                                                <textarea id="txtSpecialNote" class="form-control"></textarea>

                                            </div>
                                        </div>
                                         <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Cover Page Desc</label>
                                            <div class="">
                                                <textarea id="txtCoverpageDesc" class="form-control"></textarea>

                                            </div>
                                        </div>





                                    </div>
                                           <div class="row">
                                 
                                    <div class="col-1">
                                        <label class="col-form-label label-custom" for="basic-default-name">Total Amount</label>
                                        <div class="">
                                            <input type="number" id="txtTotalAmount" class="form-control" value="0.000"  readonly>
                                        </div>
                                    </div>


                                    <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Discount</label>
                                        <div class="">
                                            <input type="number" id="txtDiscount" class="form-control" value="0.000" onfocus="Focus(this.id,'0.000')" onblur="Blur(this.id,'0.000')">
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <label for="html5-number-input" class="col-form-label label-custom">Charges(1) Desc</label>
                                        <div class="">
                                            <input type="text" id="txtFreightChargesDesc" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Amount</label>
                                        <div class="">
                                            <input type="number" id="txtCharges" class="form-control" value="0.000" onfocus="Focus(this.id,'0.000')" onblur="Blur(this.id,'0.000')">
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <label for="html5-number-input" class="col-form-label label-custom">Charges(2) Desc</label>
                                        <div class="">
                                            <input type="text" id="txtVATDesc" class="form-control">
                                        </div>
                                    </div>
                                     <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Amount</label>
                                        <div class="">
                                            <input type="number" id="txtVat" class="form-control" value="0.000" onfocus="Focus(this.id,'0.000')" onblur="Blur(this.id,'0.000')">
                                        </div>
                                    </div>
                                    <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Net Amount</label>
                                        <div class="">
                                            <input type="number" id="txtNetAmount" class="form-control" value="0.000"  readonly>
                                        </div>
                                    </div>

                                    <div class="col-2" style="width: 250px;">
                                        <label for="html5-number-input" class="col-form-label label-custom">Total Amount Desc</label>
                                        <div class="">
                                            <input type="text" id="txtTotalAmountDescription" class="form-control">
                                        </div>
                                    </div>

                                  




                                </div>
                                    <div class="row">

                                        <div class="col-12"><i class="icontransform saveqtnHeader fa fa-floppy-o" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;margin-left: 15px;" title="Save Header Data"></i>
                                            
                                             <i class="icontransform SubmitQuotation fa fa-paper-plane" aria-hidden="true" style="margin-left: 11px;float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Submit"></i>
                                            <i class="icontransform CopyQuotation fa fa-files-o" aria-hidden="true" style="margin-left: 11px;float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Copy"></i>
                                            <i class="icontransform RevisedQuot fa fa-retweet" aria-hidden="true" style=" float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Revision"></i>
                                           
                                        </div>
                                    </div>

                                </div>

                            </div>

                            <div class="tab-pane fade" id="navs-left-align-profile">
                                   <div class="row">
                                  <div class="col-12">
                                        <div class="">
                                            <span><i class="icontransform UploadExcel fa fa-upload" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer; margin-left: 15px" title="Upload Excel"></i></span>
                                            <span><i class="icontransform AddNewItem fa fa-plus" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Add an item"></i></span>
                                        </div>
                                    </div>
                                       </div>
                                 <div class="row">
                                 
                                    <div class="col-1">
                                        <label class="col-form-label label-custom" for="basic-default-name">Total Amount</label>
                                        <div class="">
                                            <input type="number" id="txtTotalAmountview" class="form-control" value="0.000"  readonly>
                                        </div>
                                    </div>


                                    <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Discount</label>
                                        <div class="">
                                            <input type="number" id="txtDiscountview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <label for="html5-number-input" class="col-form-label label-custom">Charges(1) Desc</label>
                                        <div class="">
                                            <input type="text" id="txtFreightChargesDescview" class="form-control" readonly>
                                        </div>
                                    </div>
                                    <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Amount</label>
                                        <div class="">
                                            <input type="number" id="txtChargesview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <label for="html5-number-input" class="col-form-label label-custom">Charges(2) Desc</label>
                                        <div class="">
                                            <input type="text" id="txtVATDescview" class="form-control" readonly>
                                        </div>
                                    </div>
                                     <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Amount</label>
                                        <div class="">
                                            <input type="number" id="txtVatview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>
                                    <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Net Amount</label>
                                        <div class="">
                                            <input type="number" id="txtNetAmountview" class="form-control" value="0.000"  readonly>
                                        </div>
                                    </div>

                                    <div class="col-2" style="width: 250px;">
                                        <label for="html5-number-input" class="col-form-label label-custom">Total Amount Desc</label>
                                        <div class="">
                                            <input type="text" id="txtTotalAmountDescriptionview" class="form-control" readonly>
                                        </div>
                                    </div>

                                  




                                </div>
                         



                                <div class="" style="margin-top: 1%;">
                                    <table class="table table-bordered table-striped table-itemList" style="width: 100%">

                                        <thead style="background-color: #a62b2b">
                                            <tr style="height: 50px">
                                                <th class="hidden" style="width: 5%; text-align: center; vertical-align: middle">Line ID</th>
                                                <th class="hidden" style="width: 5%; text-align: center; vertical-align: middle">ORDER NO</th>
                                                 <th class="hidden" style="width: 5%; text-align: center; vertical-align: middle">Group NO</th>
                                                <th style="width: 5%; text-align: center; vertical-align: middle">SL NO</th>
                                                 <th class="hidden" style="width: 5%; text-align: center; vertical-align: middle">Parant SL NO</th>
                                                <th style="width: 10%; text-align: center; vertical-align: middle">CRM Product Group</th>
                                                <th style="width: 12%; text-align: center; vertical-align: middle">DESCRIPTION</th>
                                                <th style="width: 7%; text-align: center; vertical-align: middle">BRAND</th>
                                                <th style="width: 6%; text-align: center; vertical-align: middle">MODEL</th>
                                                <th style="width: 5%; text-align: center; vertical-align: middle">AVAILABILITY / COO</th>
                                                <th style="width: 5%; text-align: center; vertical-align: middle">UNIT WEIGHT</th>
                                                <th style="width: 6%; text-align: center; vertical-align: middle">UOM</th>
                                                <th style="width: 6%; text-align: center; vertical-align: middle">QTY</th>
                                                <th style="width: 7%; text-align: center; vertical-align: middle">UNIT PRICE (AED)</th>
                                                <th style="width: 7%; text-align: center; vertical-align: middle">UNIT PRICE</th>
                                                <th style="width: 6%; text-align: center; vertical-align: middle">MARGIN</th>
                                                <th style="width: 8%; text-align: center; vertical-align: middle">AMOUNT</th>
                                                <th style="width: 10%; text-align: center; vertical-align: middle">ACTIONS</th>
                                            </tr>
                                        </thead>
                                        <tbody class="tbody-itemDetails" style="font-size: smaller;">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="navs-left-align-messages">
                                <div class="row">
                                    <div class="col-3">
                                    <select id="ddlReportType" class="form-select color-dropdown">
                                     <option value="1">General Quotation</option>
                                     <option value="2">General Quotation With Availibility</option>
                                     <option value="3">General Quotation Without Model</option>
                                      <option value="4">Summary</option>
                                     <option value="5">Detailed</option>
                                        <option value="6">Test</option>
                                 </select>
                                        </div>
                                        <div class="col-1">
                                            <input type="button" id="btnLoadReport" value="Load" class="btn btn-primary d-block" style="font-size: small" />
                                            </div>
                                            <div class="col-1">
                                <input type="button" id="btnDownloadReport" value="Download" class="btn btn-primary d-block" style="font-size: small" />
                                    </div>
                                      <div class="col-1">
                                <input type="button" id="btnExportExcel" value="Export Excel" class="btn btn-primary d-block" style="font-size: small" />
                                    </div>
                                </div>
                             
                            <iframe id="myIframe" src=""  style="height: 1300px;width: 841px;"></iframe>
                               


                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>


    <div class="modal fade" id="NewQuotationItem" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 92vw!important; top: 10%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eventModalHeadingItem">Add item</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body" style="background: #bcbbbb !important;">
                    <div class="row">

                        <div class="col-1">
                            <label class="col-form-label label-custom" for="basic-default-name">Order Number</label>
                            <div class="">
                                  <input class="form-control" type="number" id="txtOrderNumber" value="1" onfocus="Focus(this.id,'1')" onblur="Blur(this.id,'1')" />
                                <input type="hidden" id="hfdLineID" />
                            </div>
                        </div>
                          <div class="col-1">
                             <label class="col-form-label label-custom" for="basic-default-name">Group No</label>
                            <div class="">
                           <input class="form-control" type="number" id="txtGroupNumber"  />
                                </div>
                            </div>
                        <div class="col-1">
                             <label class="col-form-label label-custom" for="basic-default-name">Sl No</label>
                            <div class="">
                           <input class="form-control" type="text" id="txtSLNO"  />
                                </div>
                         </div>
                         <div class="col-1">
                             <label class="col-form-label label-custom" for="basic-default-name">Parent Sl No</label>
                            <div class="">
                           <input class="form-control" type="text" id="txtParentSLNo"  />
                              </div>
                    </div>

                         <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">CRM Product Group</label>
                                            <div class="">
                                                <select id="ddlCRMProductGroup" class="form-select color-dropdown">
                                                </select>
                                            </div>
                                        </div>
                        </div>
                    <div class="row">

                        <div class="col-1">
                            <label class="col-form-label label-custom" for="basic-default-name">Item Code</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtItemCode" />

                            </div>
                        </div>
                        <div class="col-1" style="margin-top: 36px">
                            <input type="button" id="btnGetItemDetails" value="Get" class="btn btn-primary d-block" style="font-size: small" />
                        </div>

                        <div class="col-3">
                            <label class="col-form-label label-custom" for="basic-default-name">Item Desc</label>
                            <div class="">
                                   <textarea id="txtItemDesc" class="form-control"></textarea>
                              <%--  <textarea class="form-control"  id="txtItemDesc" ></textarea>--%>
                            </div>
                        </div>
                        <div class="col-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Brand</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtBrand" />

                            </div>
                        </div>
                        <div class="col-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Model</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtModel" />

                            </div>
                        </div>
                        <div class="col-1">
                            <label for="html5-number-input" class="col-form-label label-custom">Availability</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtAvailable" />

                            </div>
                        </div>
                        <div class="col-1">
                            <label for="html5-number-input" class="col-form-label label-custom">COO</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtCOO" />

                            </div>
                        </div>
                        <div class="col-1">
                            <label for="html5-number-input" class="col-form-label label-custom">Unit Weight(kg)</label>
                            <div class="">
                                <input class="form-control" type="text" id="txtUnitWeight" value="0.0" onfocus="Focus(this.id,'0.0')" onblur="Blur(this.id,'0.0')" />

                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-1">
                            <label class="col-form-label label-custom" for="basic-default-name">QTY</label>
                            <div class="">
                                <input class="form-control" type="number" id="txtQTY" value="0" onfocus="Focus(this.id,'0')" onblur="Blur(this.id,'0')" />

                            </div>
                        </div>
                        <div class="col-1">
                            <label class="col-form-label label-custom" for="basic-default-name">UOM</label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtUOM" />
                            </div>
                        </div>
                        <div class="col-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Unit Price (AED)</label>
                            <div class="">
                                <input class="form-control" type="number" id="txtUnitPriceAED" value="0.000" onfocus="Focus(this.id,'0.000')" onblur="Blur(this.id,'0.000')" />

                            </div>
                        </div>
                        <div class="col-2">
                            <label id="lblUnitpriceCurr" for="html5-number-input" class="col-form-label label-custom">Unit Price ()</label>
                            <div class="">
                                <input class="form-control" type="number" id="txtUnitPrice" value="0.000" onfocus="Focus(this.id,'0.000')" onblur="Blur(this.id,'0.000')" />

                            </div>
                        </div>
                        <div class="col-1">
                            <label for="html5-number-input" class="col-form-label label-custom">Margin</label>
                            <div class="">
                                <input class="form-control" type="number" id="txtMargin" value="0.0" onfocus="Focus(this.id,'0.0')" onblur="Blur(this.id,'0.0')" />


                            </div>
                        </div>
                        <div class="col-1">
                            <label id="lblTotalAmountCurr" for="html5-number-input" class="col-form-label label-custom">Total Amount</label>
                            <div class="">
                                <input class="form-control" type="number" id="txtLineTotalAmount" value="0.000" readonly />

                            </div>
                        </div>
                        <div class="col-1" style="width: 10%;">
                            <label for="html5-number-input" class="col-form-label label-custom">&nbsp</label>
                            <div class="">
                                <label class="list-group-item" style="border: 0px">
                                    <input class="form-check-input me-1" id="cbOptional"
                                        type="checkbox">Optional
                                </label>
                       
                            </div>
                        </div>
                            <div class="col-1" style="width: 150px;">
                            <label for="html5-number-input" class="col-form-label label-custom">&nbsp</label>
                            <div class="">
                                <label class="list-group-item" style="border: 0px">
                                    <input class="form-check-input me-1" id="cbLumpsumAmount" 
                                        type="checkbox">Lumpsum
                                </label>
                       
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-12"><i class="icontransform SaveLineData fa fa-floppy-o" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Save Line Data"></i></div>
                    </div>

                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="QuotationItemFileUpload" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 85vw!important; top: 322px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eventModaItemupload">Upload Quotation Item</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body" style="background: #bcbbbb !important;">
                    <input class="form-control" type="file" id="Quotationfileupload" accept=".xls,.xlsx">


                    <div class="modal-footer">

                        <button id="btnUploadExcel" type="button" class="btn btn-primary" data-bs-dismiss="modal">Upload </button>

                    </div>


                </div>
            </div>
        </div>
    </div>


     <div class="modal fade" id="delActivityPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;"></i></div>
                    <div>
                        <h3>Are you sure?</h3>
                    </div>
                    Do you really want to delete this Quotation? This process cannot be undone.
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btn-delete-act">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="delLineItemConformation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;"></i></div>
                    <div>
                        <h3>Are you sure?</h3>
                    </div>
                    Do you really want to delete this Line? This process cannot be undone.
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btn-delete-line">Delete</button>
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
     
    <!-- Create New OPT Popup -->
    <div class="modal fade" id="mpaddNewOPT" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 92vw!important; top: 10%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">NEW OPPORTUNITY</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
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
                             <label class="col-form-label label-custom" for="basic-default-name">Project Location</label>
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

     <!-- Request to Create New Customer -->
    <div class="modal fade" id="mpReqCustomer" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 92vw!important; top: 10%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Request to add new Customer</h5>
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
   
    <script src="Script/Quotation.js?v=14.3"></script>

	<!-- Datatable plugin JS library file -->	
   
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <link href="css/quotation.css" rel="stylesheet" />
        <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
        <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

</asp:Content>



