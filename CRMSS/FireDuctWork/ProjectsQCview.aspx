<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="ProjectsQCview.aspx.cs" Inherits="FireDuctWork_ProjectsQCview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="CSS/frdmaster.css" rel="stylesheet" />
    <script src="Scripts/jspdf.min.js"></script>
    <script src="Scripts/html2pdf.bundle.min.js"></script>
   <script src="Scripts/Inspection-report.js"></script>
    <link href="CSS/frdmaster.css" rel="stylesheet" />
    <style>
        .headng {
            color: #a92828;
            color: #bf2e1a;
            font-weight: 800;
            padding-left: 10%;
            /*padding-right: 2%;*/
        }

        .border {
            border: 3px solid #0a0b0b !important;
        }

        .bg-secondary {
            --bs-bg-opacity: 1;
            background-color: #0b7c85 !important;
            font-size: larger;
        }
       

         .btn-search {
            display: inline-flex;
            padding-right: 10%
        }

          .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link:not(.active) {
            background-color: #b4b9bf;
        }

          /*table for tab1*/


        .newProjectsQc-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .newProjectsQc-table td {
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


        /*table for tab2*/
        .im-submited-list-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .im-submited-list-table td {
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

      /* for tab-3*/

       /*table for tab2*/
        .reust-coc-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .reust-coct-table td {
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

         .frdInstald-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .frdInstald-table td {
            color: #333333 !important;
        }

         .SiteInspection-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .SiteInspection-table td {
            color: #333333 !important;
        }
          .active-tr {
            border-left: 5px solid #db7e2f !important;
        }
    </style>

 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">


        <div style="padding-left: 2%; padding-top: 1%;">
           
            <div class="pull-left">
                <h4 style="text-shadow: 1px 6px 13px; color: #a92828;">New Project Details </h4>
            </div>
             <div class="pull-right btn-search" style="padding-right: 10%; padding-bottom:10px">
                <%-- <div>
                     <input type="text" id="SearchPrjNumber" placeholder="Enter  Project Number" style="background: white;" class="form-control flatpickr-input active">
                 </div>--%>


                 <%--<div>--%>
                 <%--    <button type="button" data-bs-toggle="modal" data-bs-target="#FRDaddProjectReport" class="btn rounded-pill btn-outline-secondary" onclick="getUniqueFRDId()">--%>
                         <%--<span class="tf-icons bx bx-plus"></span>&nbsp; Add Project--%>
                       <%--  &nbsp; Generate Report--%>
                    <%-- </button>--%>
                 <%--</div>--%>

                 
             </div>
        </div>

        <div>
            <hr style="width: 100%; text-align: left; margin-left: 0">
        </div>

        <div class="card-body" style="margin-top: -2%;">

             <div class="nav-align-top">


                            <ul class="nav nav-tabs" role="tablist">
                              <li class="nav-item">
                                  <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-new-proj" aria-controls="navs-new-proj" aria-selected="true"> NEW PROJECTS</button>
                              </li>
                              <li class="nav-item">
                                  <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#im-submited" aria-controls="im-submited" aria-selected="false"> SITE VISIT REQUEST</button>
                              </li>
                              <li class="nav-item">
                                  <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-req-coc" aria-controls="navs-req-coc" aria-selected="false"> COC REQUEST</button>
                              </li>
                                    <li class="nav-item">
                                  <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#FRD-Report" aria-controls="FRD-Report" aria-selected="false">FRD Report</button>
                              </li>
                          </ul>

                 <div class="tab-content">

                     <div class="tab-pane fade show active" id="navs-new-proj" role="tabpanel">

                        <div class="" style="margin-top: 1%;">

                                  <table class="table table-bordered table-striped newProjectsQc-table">
                
                                    <thead>
                                        <tr>
                                            <th>Sl.No</th>
                                            <th> Created Date</th>
                                            <th>Customer Number</th>
                                            <th>customer Name</th>
                                            <th>Project </th>
                                            <th>Location</th>
                                            <th>Consultant</th>
                                            <th>Main Contractor</th>
                                            <th>MEP Contractor</th>
                                            <th style ="display:none">Delivery Date</th>

                                            <th style="width: 12%;">Actions</th>
                                        </tr>
                                    </thead>

                                    <tbody class="tbody-FRDprojectqc">
                    
                                    </tbody>
                                </table>
                         </div>
                    </div>

                     <%-- tab IM submited --%>

                       <div class="tab-pane fade" id="navs-req-coc" role="tabpanel">

                                  <table class="table table-bordered table-striped reust-coc-table" style="width:100%">
                
                                    <thead>
                                        <tr>
                                            <th>Sl.No</th>
                                            <th> Created Date</th>
                                            <th>Customer Number</th>
                                            <th>customer Name</th>
                                            <th>Project </th>
                                            <th>Location</th>
                                            <th>Consultant</th>
                                            <th style="display:none">Main Contractor</th>
                                            <th style="display:none">MEP Contractor</th>
                                            <th>Delivery Date</th>

                                            <th style="width: 12%;">Actions</th>
                                        </tr>
                                    </thead>

                                    <tbody class="tbody-reqtococ">
                    
                                    </tbody>
                                </table>
                       
                    </div>


                     <%-- Request to COC --%>

                        <div class="tab-pane fade" id="im-submited" role="tabpanel">

                                  <table class="table table-bordered table-striped im-submited-list-table" style="width:100%">
                
                                    <thead>
                                        <tr>
                                            <th>Sl.No</th>
                                            <th> Created Date</th>
                                            <th>Customer Number</th>
                                            <th>customer Name</th>
                                            <th>Project </th>
                                            <th>Location</th>
                                            <th>Consultant</th>
                                            <th style="display:none">Main Contractor</th>
                                            <th style="display:none">MEP Contractor</th>
                                            <th>Delivery Date</th>

                                            <th style="width: 12%;">Actions</th>
                                        </tr>
                                    </thead>

                                    <tbody class="tbody-imSubmited">
                    
                                    </tbody>
                                </table>
                        
                    </div>




                      <div class="tab-pane fade" id="FRD-Report" role="tabpanel">

               <table class="table table-bordered table-striped SiteInspection-table" style="width:100%">

                    <thead>
                        <tr>
                            <th style="display: none">Id</th>
                            <th>Sl.No</th>
                            <th>Date</th>
                            <th>Customer Number</th>
                            <th>customer Name</th>
                            <th>Project </th>
                            <th>Location</th>
                            <th>Consultant</th>
                            <th>Main Contractor</th>
                            <th>MEP Contractor</th>
                            <th>Delivery Date</th>

                            <th style="width: 12%;">Actions</th>
                        </tr>
                    </thead>

                    <tbody class="tbody-siteinspection">
                    </tbody>
                </table>
                        
                    </div>


                 </div>   
            </div>

        </div>



    </div>

    <%-- Reporrt Modal --%>


<%--                <div class="modal fade" id="FRDaddProjectReport" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-xl" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel3">FIRE DUCK WORK INSPECTION REPORT</h5>
                                <button
                                    type="button"
                                    class="btn-close"
                                    data-bs-dismiss="modal"
                                    aria-label="Close">
                                </button>
                            </div>

                             <div class="pull-right" style="padding-right: 10%; padding-bottom: 10px">
                                        <span class="float-end pt-2">
                                            <button type="button" onclick="generatePDF()" class="btn rounded-pill me-2 btn-outline-secondary pull-right">Export to PDF</button>
                                        </span>
                                    </div>
                            <div class="modal-body">


                                <div style="padding-left: 2%; padding-top: 1%;">--%>

                                    <%--<div class="pull-left">
                                        <h4 style="text-shadow: 1px 6px 13px; color: #a92828;">FIRE DUCKWORF INSTALLATION REPORT </h4>
                                    </div--%>

                                   <%-- <div class="pull-right" style="padding-right: 10%; padding-bottom: 10px">
                                        <span class="float-end pt-2">
                                            <button type="button" onclick="generatePDF()" class="btn rounded-pill me-2 btn-outline-secondary pull-right">Export to PDF</button>
                                        </span>
                                    </div>--%>

<%--                                </div>


                                <div class="row">
                                        <div class="col-sm-2"></div>


                                <div class="col-sm-8" id="divToExport">
               
                                    <div class="border border-3 rounded p-3 my-3">

                                            <div>
                                                <img src="img/naffco-logo.png" / style="width:20%" >
                                                <h3 class="headng" >NAFFCO FIRE RATED DUCTWORK SYSTEM </h3>
                                            </div>

                        
                                        <div>
                                            <hr style="width: 100%; text-align: left; margin-left: 0;border:1px solid;color:black">
                                        </div>

                                        <div style="padding-left:10%">
                                             <span class="badge rounded-pill bg-secondary">Fire Rated Ductwork Installation Inspection Report</span>
                                        </div>
                    

                                        <div class="" style="margin-top: 5%;">

                                            <table class="table table-bordered table-striped">
                                                <tr>
                                                    <th>Project Name</th>
                                                    <td> </td>
                                                    <th>Order No.</th>
                                                    <td> </td>
                                                </tr>
                                                <tr>
                                                     <th>Project Number</th>
                                                    <td></td>
                                                    <th>Drawing Number:</th>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                     <th>Client/Customer</th>
                                                    <td></td>
                                                    <th>Installation Completion</th>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                     <th>Main Contractor</th>
                                                    <td></td>
                                                    <th>Inspection No.</th>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                     <th>MEP Contractor</th>
                                                    <td></td>
                                                    <th>Inspection Date</th>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                     <th colspan="3">FRD Location</th>
                                                    <td> </td>
                                                    <%--<th>Name:</th>
                                                    <td>Bill Gates</td>--%>
                                            <%--    </tr>
                                            </table>

                                        </div>



                                        <br>
                   
                                        <br>

                                        <table class="table table-bordered table-striped kpi-user-list-table">

                                            <thead>
                                                <tr>
                                                    <th>Sl.No</th>
                                                    <th>Check List</th>
                                                    <th>Status</th>
                                                    <th>Photos</th>
                                                    <th>Comment</th>
                                                    <th>Action</th>--%>


                                                    <%--<th style="width: 12%;">Actions</th>--%>
                                               <%-- </tr>
                                            </thead>

                                            <tbody class="tbody-checklist">
                                            </tbody>
                                        </table>
                    
                                    </div>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                                

                            </div>
                        </div>
                    </div>

                </div>--%>






            <div class="modal fade" id="ModalInspectionDetails" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalProject">Inspection Details</h5>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">

                        <%--tabs--%>
                        



                                    <div class="row">

                                        <div class="col-3">

                                            <div class="" style="margin-top: 1%;">

                                                <table class="table table-bordered table-striped inspection-table frdInstald-table">

                                                    <thead>
                                                        <tr>
                                                            <th>Project No</th>

                                                            <th>Project Name</th>
                                                            <th>Customer Name</th>
                                                            <th>Inspection No</th>



                                                        </tr>
                                                    </thead>

                                                    <tbody class="tbody-InspectProject">
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>


                                        <div class="col-9 ReportView" style="padding-left: 3%; margin-top: 5px">

                                            <%--<div class="" style="margin-top: 1%;">--%>
                                            <div style="padding-left:41%;">
                                             <button type="button" onclick="generateFRDPDF()" class="btn rounded-pill me-2 btn-outline-secondary" style="background-color:green;color:white">Download PDF</button>
                                                </div>
                      
                                            <iframe id="myIframe" src=""  style="height: 1500px;width: 841px;"></iframe>


                                            <%--</div>--%>
                                        </div>

                                 
                        </div>


                        <div class="modal-footer">
                            <%--<button type="button" id="Button1" class="btn btn-primary" runat="server"  data-bs-dismiss="modal"  onclick="addProject()">Add</button>--%>
                        </div>
                    </div>
                </div>
            </div>

        </div>





    <%-- Modal for Delivery Date --%>

    <div class="modal fade" id="ModalDeliveryDate" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog modal-small" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modalProjectStatus"> Enter Project Delivery Date</h5>
                                                    <button
                                                        type="button"
                                                        class="btn-close"
                                                        data-bs-dismiss="modal"
                                                        aria-label="Close">
                                                    </button>
                                                </div>
                                                <div class="modal-body">

                                                    <div class="mb-3 row">
                                                        <%--<label for="html5-date-input" class="col-md-3 col-form-label">Date</label>--%>
                                                        <div class="col-md-12">
                                                            <input class="form-control" type="date"  id="projectdate" />

                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                           
                                                        <div class="modal-footer">
                                                            <button type="button" id="BtnAddDeliverydate" class="btn btn-primary" runat="server"  data-bs-dismiss="modal"  onclick="InstallReq()">Request To Installation</button>
                                                            
                                                        </div>
                                     

                                                    </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                 <%-- for Datatable --%>
    <script src="../Template/Datatable/js/jquery.dataTables.min.js"></script>
    <script src="../Template/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../Template/Datatable/js/jszip.min.js"></script>
    <script src="../Template/Datatable/js/pdfmake.min.js"></script>
    <script src="../Template/Datatable/js/buttons.print.min.js"></script>
    <script src="../Template/Datatable/js/vfs_fonts.js"></script>
    <script src="../Template/Datatable/js/buttons.html5.min.js"></script>

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

        <script src="Scripts/qc-project-view.js?v=0.5"></script>


    
        <script type="text/javascript">




            function generatePDF() {

                // Choose the element id which you want to export.
                var element = document.getElementById('divToExport');
                element.style.width = '700px';
                element.style.height = '100%';
           
                var opt = { 
                    margin: 0.5,
                    filename: 'InspectionReport.pdf',
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
        </script>

</asp:Content>

