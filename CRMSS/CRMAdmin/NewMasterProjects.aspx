<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="NewMasterProjects.aspx.cs" Inherits="CRMAdmin_NewMasterProjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>


    <style type="text/css">
        /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
        .kpi-user-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
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

        .overFlowNavKpi {
            overflow-y: auto;
            height: 565px;
        }

        .accordion li {
            font-size: small;
        }

        .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
            background-color: #e14b4b;
            border-color: #e14b4b;
            box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%);
        }
        /*Custom Menu Anwar*/
        .container {
            border-radius: 3px;
            padding: 5px;
            width: 60%;
            margin: 0 auto;
        }

        h2 {
            font-weight: normal;
            font-size: 25px;
        }

            h2:hover {
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

        .table td {
            color: #333333 !important;
        }

        .custom-loader {
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

        .loader-bg-blur {
            height: 100%;
            z-index: 9999999;
            position: fixed;
            background: #c3d3ce6b;
            width: 100%;
        }

        .hidden {
            display: none !important;
        }

        .iconClassExcel {
            margin-left: 8px;
            background: #933737;
        }

        .iconClassPdf {
            background: #933737;
        }

        .iconClassExcel:hover {
            background: #a54141;
        }

        .iconClassPdf:hover {
            background: #a54141;
        }

        .tablepopup th {
            background-color: #a92828;
            color: white !important;
            text-align: center;
        }

        .tablepopup td {
            text-align: center;
        }

        .tablepopup {
            width: 100%;
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
        /*.tab-content
        {
            background: #d7d6d6 !important;
        }*/
        hr {
            margin: 1rem 0;
            color: #565656;
            background-color: currentColor;
            border: 0;
            opacity: 1;
        }

        .MProject-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

             .MProject-list-table td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }
             table.dataTable.no-footer {
              border-bottom: 1px solid #aeddff73 !important;
              }

        .table-Costomer-Details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Opt-det-drilldown {
            font-weight: 800;
            color: #ffffff;
            border: 1px solid #b8adad;
            width: 3%;
            cursor: pointer;
            margin-top: 6px;
            position: inherit;
            background: #d54832e8;
            border-radius: 13px;
            text-align: center;
        }

        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link.active {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }   

        .nav-tabs .nav-item .nav-link:hover {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link:not(.active) {
            color: black;
            background-color: #b4b9bf;
        }
        table.dataTable tbody tr:hover {
          background-color:#ff6f591a !important;
         border-right: 5px solid #db7e2f !important;
    
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="ajax-loader loader-bg-blur">
          <div class="custom-loader ">
              <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
              <h4>Loading Data...</h4>
          </div>
      </div>


      <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%; padding-top: 1%;"><h4 style="text-shadow: 1px -3px 8px; color: #a92828;">NEW MASTER PROJECTS</h4></div> 

  <div class="card-body" style="margin-top: -2%;">

     <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

                          
                          <td class="no-border" style="width: 1%">
                                <asp:Label ID="Label8" Text="Organization" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select id="ddlOrganization" class="form-select color-dropdown">
                              </select>
                          </td>

                            <td class="no-border" style="width: 1%">
                                <asp:Label ID="Label1" Text="CreatedBy Company" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select id="ddlCompany" class="form-select color-dropdown">
                              </select>
                          </td>


                        <%--  <td class="no-border label-alignment" style="width: 1%"></td>
                        
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
                        

                            <td class="no-border" style="width: 18%">
                                <asp:Label ID="Label1" Text="Stage" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select id="ddlSection" class="form-select color-dropdown">
                                  <option value="TENDER">TENDER</option>
                                   <option value="HOLD">HOLD</option>
                              </select>
                          </td>--%>
                         <%-- <td class="no-border" style="width: 12%">
                              <asp:Label ID="Label4" Text="Status" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlStatus">
                                  <option value="DRAFT" selected">DRAFT</option>
                                  <option value="SUBMIT">SUBMIT</option>
                              </select>
                          </td>--%>

                         <%-- <td class="no-border label-alignment" style="width: 1%"></td>--%>
                        
                   
                          <td class="no-border" style="width: 0%;padding-top:34px;">

                              <input type="button" id="btnSearch" value="Search" class="btn btn-primary d-block" style="font-size:small;background-color:#d54832;" /> 
                          </td>
                            <td class="no-border" style="width: 5%;padding-top:34px">
                              <input type="button" id="btnExport" value="Export" class="btn btn-primary d-block" style="font-size:small;background-color:#d54832;" /> 
                          </td>
                          <%-- <td class="no-border" style="width: 5%">
                              <input type="button" id="btnAddNew" value="New " class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>--%>
                      </tr>
                  </table>
      </div>


      

      <div class="" style="margin-top: 1%;">
          <table class="table MProject-list-table">

              <thead>
                  <tr>
                      <th style="display:none;">Name</th>
                      <th style="width:8%;">Ref.Number</th>
                      <th style="width:14%;">Name</th>
                      <th style="width:6%;">Type</th>
                      <th style="width:8%;">Consultant</th>
                      <th style="width:8%;display:none;">ConsultantId</th>
                      <th style="width:6%;">Project Type</th>
                      <th style="width:8%;">Country</th>
                      <th style="width:8%;">Plot Number</th>
                      <th style="width:8%;">Created Date</th>
                      <th style="width:8%;">Company</th>
                      <th style="width:6%;">Created Aging</th>
                      <th style="width:4%;">VIEW</th>
                      <%-- <th>PropertyUsage</th>
                                             <th>ContractValue</th>
                                             <th>SecurityDeposit</th>
                                             <th>ModeOfPayment</th>
                                             <th>StartDate</th>
                                             <th>EndDate</th>
                                             <th>Action</th>--%>
                  </tr>

              </thead>
              <tbody class="tbody-MProject">
              </tbody>
          </table>
      </div>




    </div>
</div>


         <div class="modal fade" id="ModalCostomerDetails" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
           <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
             <div class="modal-content"<%-- style="background: antiquewhite;"--%>>
               <div class="modal-header">
                 <h5 class="modal-title" id="lblprojDetailModal">Customer Details</h5>
                 <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
              

                   

                   <%--Grid--%>


                   <div style="margin-top: 1.5%;">

                       <div class="nav-align-top">
                           <ul class="nav nav-tabs" id="mstone-task-modal-ul" role="tablist">
                               <li class="nav-item">
                                   <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Costomer" aria-controls="navs-top-Costomer" aria-selected="true">Costomer</button>
                               </li>


                           </ul>
                           <div class="tab-content">
                               <%--1st--%>
                               <div class="tab-pane fade show active" id="navs-top-Costomer" role="tabpanel" style="margin-top: -1%;">

                       <%--            <div>
                                       <a href="#" class="btn btn-primary pull-right btn-add-tenant-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Tenant</a>
                                   </div>--%>

                                   <div class="table-responsive" style="margin-top: 1%; width: 100%;">

                                       <table class="table table-Costomer-Details" style="width: 100%;">

                                           <thead>
                                               <tr style="text-align: center;">
                                                  
                                                 
                                                   <th>Account Name</th>
                                                   <th>Owner</th>
                                                   <th>Company </th>
                                                 <%--  <th>Substage </th>
                                                   <th>Value </th>--%>

                                               </tr>
                                           </thead>
                                           <tbody class="tbody-Costomer-details" style="text-align: center;">
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
   
    <script src="Script/NewMasterProjects.js?v=1.0"></script>

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>



	<!-- Datatable plugin JS library file -->	
   
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <link href="css/quotation.css" rel="stylesheet" />
        <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
        <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

</asp:Content>


