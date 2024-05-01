<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="InspectionReport.aspx.cs" Inherits="FireDuctWork_InspectionReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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

        table, th, td {
            font-size: 0.75rem;
            text-transform: none !important;
            font-size: 0.85rem;
            letter-spacing: 1px;
        }

        /*td {
            padding: 5px;
            text-align: left;
        }

        th {
            padding: 5px;
            text-align: left;
            width: 20%;
        }*/
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div style="padding-left: 2%; padding-top: 1%;">

            <div class="pull-left">
                <h4 style="text-shadow: 1px 6px 13px; color: #a92828;">FIRE DUCKWORF INSTALLATION REPORT </h4>
            </div>

            <div class="pull-right" style="padding-right: 10%; padding-bottom:10px">
                 <span class="float-end pt-2">
                <button type="button" onclick="generatePDF()" class="btn rounded-pill me-2 btn-outline-secondary pull-right">Export to PDF</button>
            </span>
            </div>

        </div>

        <div>
            <hr style="width: 100%; text-align: left; margin-left: 0">
        </div>

      

        <div class="card-body" style="margin-top: -2%;">

            <%--<div class="container-fluid">--%>
                <div class="row">
                    <div class="col-sm-3"></div>



                    <div class="col-sm-6" id="divToExport">
               
                <div class="border border-3 rounded p-3 my-3">


                    

                        <div>
                            <img src="img/naffco-logo.png" / style="width:20%" >
                            <h3 class="headng" >NAFFCO FIRE RATED DUCTWORK SYSTEM </h3>
                        </div>

                        
                    <div>
                        <hr style="width: 100%; text-align: left; margin-left: 0;border:1px solid;color:black">
                    </div>

                    <div style="padding-left:10%">
                         <span class="badge rounded-pill bg-secondary">Fire Rated Ductwirk Installation Inspection Report</span>
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
            <div class="col-sm-3"></div>
        </div>
    <%--</div>--%>

        </div>
   </div>



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

