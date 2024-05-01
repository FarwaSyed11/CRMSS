<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="RevenueAdminAction.aspx.cs" Inherits="CRMAdmin_RevenueAdminAction" %>

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

    .OPP-PTOverview-table td {
             color: #333333 !important;
    }

    .OPP-SUpdate-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

    .OPP-SUpdate-table td {
             color: #333333 !important;
    }

     .OPP-SMUpdate-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

    .OPP-SMUpdate-table td {
             color: #333333 !important;
    }

     .OPP-MUpdate-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

    .OPP-MUpdate-table td {
             color: #333333 !important;
    }

    .OPP-MoreInfo-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

    .OPP-MoreInfo-table td {
             color: #333333 !important;
    }

     .OPP-AdminHistory-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

    .OPP-AdminHistory-table td {
             color: #333333 !important;
    }

     .OPP-Quotation-table th {
             background-color: #a92828 !important;
             color: white !important;
    }
</style>

 </asp:Content>
 <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
      <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%; padding-top: 1%;"><h4 style="text-shadow: 1px -1px 8px; color: #a92828;">REVENUE ADMIN ACTION</h4></div> 

  <div class="card-body" style="margin-top: -1%;">

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
                              <asp:Label ID="Label1" Text="SubStage" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlSubStage"> </select>
                          </td>
                           <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label2" Text="Overview" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlOverview"> </select>
                          </td>

                            <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label4" Text="Product" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlProduct"> </select>
                          </td>


                           <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label3" Text="Admin Action" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlAdminAction">
                                  <option value="-1"> --- All --- </option>
                                  <option value="PENDING">PENDING</option>
                                  <option value="WAITING CONFIRMATION">WAITING CONFIRMATION</option>
                                  <option value="NEED MORE TIME">NEED MORE TIME</option>
                                   <option value="SITE VISIT">SITE VISIT</option>
                                  <option value="MEDIA FEEDBACK">MEDIA FEEDBACK</option>
                                  <option value="COMPLETED">COMPLETED</option>
                              </select>
                              
                          </td>


                          <td class="no-border label-alignment" style="width: 1%"></td>
                        
                   
                          <td class="no-border" style="width: 5%">

                              <input type="button" id="btnSearch" value="Search" class="btn btn-danger d-block" style="font-size:small" /> 
                          </td>

                       <td class="no-border" style="width: 5%">

                              <input type="button" id="btnExport" value="Export" class="btn btn-danger d-block" style="font-size:small" /> 
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
        <tr style="text-align: center">
            <th class="hidden">OPTID</th>
            <%--<th>Company</th>--%>
            <th style="display: none;">Revenue ROWID</th>
            <th>OPT #</th>
            <th>Name</th>
            <th>MEP Contractor</th>
            <th>Salesman</th>
            <th>Product Type</th>
            <th>SubStage</th>
            <th style="max-width: 10%;">Remarks</th>
            <th style="width: 10%">Action Status</th>
            <th>Action Date</th>
            <th style="width: 10%; max-width: 10%">CRM Remarks</th>
            <th>Update Aging</th>
            <th style="width: 8%">Actions</th>


        </tr>
    </thead>
    <tbody class="tbody-employees">

    </tbody>
  </table>
  </div>




    </div>
  </div>

                     <div class="modal fade" id="mpShowhistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="width: 300%;right: 100%;">
                                    <div class="modal-header">
                                        <h3 class="modal-title" id="H1">History</h3>
                                        <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                            
                                        </button>
                                    </div>
                                     <div class="card-body" style="margin-top: -2%;">
            <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <button type="button" id="btnPTOverview" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-PTOverview" aria-controls="tab-PTOverview" aria-selected="true">Product Team OverView</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Quotation" aria-controls="tab-Quotation" aria-selected="true">Quotation</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SalesmanUpdate" aria-controls="tab-SalesmanUpdate" aria-selected="false">Salesman Update</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SalesmanagerUpdate" aria-controls="tab-SalesmanagerUpdate" aria-selected="false">Salesmanager Update</button>
                    </li>
                      <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-MarketingUpdate" aria-controls="tab-MarketingUpdate" aria-selected="false">Marketing Update</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-AdminHistory" aria-controls="tab-AdminHistory" aria-selected="false">Admin History</button>
                    </li>

                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-MoreInfo" aria-controls="tab-MoreInfo" aria-selected="false">More Information</button>
                    </li>

                     
                    

                  </ul> 

                <div class="tab-content">

                    <div class="tab-pane fade show active" id="tab-PTOverview" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-PTOverview-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                        <th>OverView</th>
                                        <th>Remarks</th>
                                        <th>Win Perc.</th>
                                        <th>UpdatedBy</th>
                                        <th>Updated Date</th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-PTOverView">
                                </tbody>
                            </table>
                        </div>
                    </div>



                <div class="tab-pane fade" id="tab-Quotation" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-Quotation-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                       <th>Product Type</th>
                                        <th>Quotation.No</th>
                                        <th>Quotation Date</th>
                                        <th>Revenue Amount</th>
                                        <th>UpdatedBy</th>
                                        <th>UpdatedDate</th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-Quotation">
                                </tbody>
                            </table>
                        </div>
                    </div>




                     <div class="tab-pane fade" id="tab-SalesmanUpdate" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-SUpdate-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                       <th>OverView</th>
                                        <th>Remarks</th>
                                        <th>Win Perc.</th>
                                        <th>UpdatedBy</th>
                                        <th>Updated Date</th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-Supdate">
                                </tbody>
                            </table>
                        </div>
                    </div>


                    <div class="tab-pane fade" id="tab-SalesmanagerUpdate" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-SMUpdate-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                       <th>OverView</th>
                                        <th>Remarks</th>
                                        <th>Win Perc.</th>
                                        <th>UpdatedBy</th>
                                        <th>Updated Date</th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-SMUpdates">
                                </tbody>
                            </table>
                        </div>
                    </div>



                     <div class="tab-pane fade" id="tab-MarketingUpdate" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-MUpdate-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                        <th>OverView</th>
                                        <th>Remarks</th>
                                        <th>Win Perc.</th>
                                        <th>UpdatedBy</th>
                                        <th>Updated Date</th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-MKTUpdates">
                                </tbody>
                            </table>
                        </div>
                    </div>



                     <div class="tab-pane fade" id="tab-AdminHistory" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-AdminHistory-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                        <th>Product Type</th>
                                        <th>Status</th>
                                        <th>SubStage</th>
                                        <th>Remarks</th>
                                        <th>Quotation.No</th>
                                        <th>Quotation Date</th>
                                        <th>SO.No</th>
                                        <th>SO Date</th>
                                        <th>Amount</th>
                                        <th>UpdatedBy</th>
                                        <th>UpdatedDate</th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-AdminHistory">
                                </tbody>
                            </table>
                        </div>
                    </div>

                    
                     <div class="tab-pane fade" id="tab-MoreInfo" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-MoreInfo-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                        <th>Company</th>
                                        <th>Product Type</th>
                                        <th>Status</th>
                                        <th>Creation Date</th>
                                        <th>Remarks</th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-moreinfo">
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
   


	<!-- Datatable plugin JS library file -->	
    <script src="Script/RevenueAdminAction.js?v=1.2"></script>

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

</asp:Content>

