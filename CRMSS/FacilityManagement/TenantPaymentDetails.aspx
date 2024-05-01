﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="TenantPaymentDetails.aspx.cs" Inherits="FacilityManagement_TenantPaymentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

       <style type="text/css">
    
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
     .kpi-user-list-table th{
        background-color: #a92828;
        /*background-color: #585a5f;*/
        color:white !important;
    }
    
     .table td{
        
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
      /*background-color: #585a5f;*/
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
    width: 10%;
    padding: 10px;
}
.hidden{
    display:none !important;
}

        .btn-primary {
    color: #fff;
    background-color: #c74747;
    border-color: #c74747;
    box-shadow: 0 0.125rem 0.25rem 0 rgb(255 105 105 / 40%);
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
/*body {
    background-color: #000000;
    margin: 0px;
    overflow: hidden;
}*/

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



      <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%; padding-top: 1%;"><h4 style="text-shadow: 1px 6px 13px; color: #a92828;">Tenant Payment Details </h4></div> 

  <div class="card-body" style="margin-top: -2%;">

         <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

                          <td class="no-border  label-alignment" style="width: 9%">
                              <asp:Label ID="Label10" Text="Property Name" runat="server" Font-Size="Medium" Font-Bold="true" />
                          </td>
                          <td class="no-border" style="width: 20%">
                              <select class="form-select placement-dropdown" id="ddlPropertiesName"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 10%">
                              <asp:Label ID="Label11" Text="Property Type" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 20%">
                              <select class="form-select placement-dropdown" id="ddlPropertType"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                        <td class="no-border  label-alignment" style="width: 11%">
                              <asp:Label ID="Label8" Text="Payment Status" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 20%">
                              <select id="ddlPaymentStatus" class="form-select color-dropdown">
                                  <option value="-1">--- All ---</option>
                                  <option value="CLEARED"">Cleared</option>
                                  <option value="PENDING_DUE">Pending Due</option>
                                  <option value="PENDING_NOT_DUE">Pending No Due</option>
                              </select>
                          </td>
                   
                          <td class="no-border" style="width: 5%">

                              <input type="button" id="btnSearchDashBoard" value="Search" class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>
                      </tr>
                  </table>
      </div>


        <div class="ajax-loader custom-loader hidden">
     <span class="spinner-border kpi-loader-name"  role="status" aria-hidden="true"></span><h4>Please wait...</h4>      
        </div>

    <div class="" style="margin-top: 1%;">
  <table class="table table-bordered table-striped kpi-user-list-table">
    <%--<caption class="ms-4">List of Projects</caption>--%>
    <thead>
      <tr>
          <th class="hidden">Contract Id</th>
        <th>Contract No</th>
          <th style="width:160px !important">Payment On</th>
        <th>Contract Description</th>
        <th style="width:180px !important">Payment Status</th>
           <th>Property Name </th>
           <th>Property Type </th>
           <th>Block/Floor/Room </th>        
        <th>Contract From </th>
           <th>Contract To </th>
           <th>payment Date </th>      

        <th style="width: 10%;">Actions</th>
      </tr>
    </thead>
    <tbody class="tbody-employees">

    </tbody>
  </table>
</div>




    </div>
</div>
   

        <%--confirmation pop up for delete KPi--%>
<div class="modal fade" id="payStatusConfirmPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
     
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-check-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #26871ab8;"></i></div>
          <div><h3 style="text-shadow: 1px 4px 10px #a58f8f;">Are you sure?</h3></div>
        Do you want to update the payment status?
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-update-paystatus">Update</button>
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
    <!-- Datatable plugin JS library file -->	
       <script src="Datatable/js/jquery.dataTables.min.js"></script>
   <script src="Datatable/js/dataTables.buttons.min.js"></script>
    <script src="Datatable/js/jszip.min.js"></script>
    <script src="Datatable/js/pdfmake.min.js"></script>
    <script src="Datatable/js/vfs_fonts.js"></script>
    <script src="Datatable/js/buttons.html5.min.js"></script>
    <script src="Datatable/js/buttons.print.min.js"></script>
    
    	<!-- Datatable plugin CSS file -->
    <link href="Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />

    <script src="Scripts/fire-works.js"></script>

	
    <script src="Scripts/tenant-payment-details.js?v=1.1"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

</asp:Content>


