<%@ Page Title="" Language="C#" MasterPageFile="/EconnectNew.master" AutoEventWireup="true" CodeFile="ProjectsQCview.aspx.cs" Inherits="FireDuctWork_ProjectsQCview" %>

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
        /*.body{
            color:black !important;
        }*/

        /*table, th, td {
            font-size: 0.75rem;
            text-transform: none !important;
            font-size: 0.85rem;
            letter-spacing: 1px;
        }*/

        /*td {
            padding: 5px;
            text-align: left;
        }

        th {
            padding: 5px;
            text-align: left;
            width: 20%;
        }*/

         .btn-search {
            display: inline-flex;
            padding-right: 10%
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
                 <div>
                     <input type="text" id="SearchPrjNumber" placeholder="Enter  Project Number" style="background: white;" class="form-control flatpickr-input active">
                 </div>


                 <div>
                     <button type="button" data-bs-toggle="modal" data-bs-target="#FRDaddProjectReport" class="btn rounded-pill btn-outline-secondary" onclick="getUniqueFRDId()">
                         <%--<span class="tf-icons bx bx-plus"></span>&nbsp; Add Project--%>
                         &nbsp; Generate Report
                     </button>
                 </div>

                 
             </div>
        </div>

        <div>
            <hr style="width: 100%; text-align: left; margin-left: 0">
        </div>

        <div class="card-body" style="margin-top: -2%;">

            <div class="" style="margin-top: 1%;">

                      <table class="table table-bordered table-striped kpi-user-list-table">
                
                        <thead>
                            <tr>
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

                        <tbody class="tbody-employees">
                    
                        </tbody>
                    </table>
             </div>

        </div>



    </div>

    <%-- Reporrt Modal --%>


                <div class="modal fade" id="FRDaddProjectReport" tabindex="-1" aria-hidden="true">
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


                                <div style="padding-left: 2%; padding-top: 1%;">

                                    <%--<div class="pull-left">
                                        <h4 style="text-shadow: 1px 6px 13px; color: #a92828;">FIRE DUCKWORF INSTALLATION REPORT </h4>
                                    </div--%>

                                   <%-- <div class="pull-right" style="padding-right: 10%; padding-bottom: 10px">
                                        <span class="float-end pt-2">
                                            <button type="button" onclick="generatePDF()" class="btn rounded-pill me-2 btn-outline-secondary pull-right">Export to PDF</button>
                                        </span>
                                    </div>--%>

                                </div>


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
                                                </tr>
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
                                                    <th>Action</th>


                                                    <%--<th style="width: 12%;">Actions</th>--%>
                                                </tr>
                                            </thead>

                                            <tbody class="tbody-checklist">
                                            </tbody>
                                        </table>
                    
                                    </div>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                                










                            


<%--                                <div class="modal-footer">
                                    <button type="button" id="BtnProjectAdd" class="btn btn-primary" runat="server" data-bs-dismiss="modal" onclick="addProject()">Add</button>
                                   

                                </div>--%>
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

        <script src="Scripts/qc-project-view.js"></script>


    
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
                  
                    

                  
                    jsPDF: { unit: 'in', format: 'a4', orientation: 'portrait', precision: '12' }
                };

                var doc = new jsPDF();
                 doc.rect(20, 20, doc.internal.pageSize.width - 40, doc.internal.pageSize.height - 40, 'S');

               
                // choose the element and pass it to html2pdf() function and call the save() on it to save as pdf.
                html2pdf().set(opt).from(element).save();


            }
        </script>

</asp:Content>

