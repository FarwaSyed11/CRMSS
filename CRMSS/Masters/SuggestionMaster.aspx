<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="SuggestionMaster.aspx.cs" Inherits="Masters_SuggestionMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
  <%--  <link href="CSS/frdmaster.css" rel="stylesheet" />--%>
  
    <style>
        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link:not(.active) {
            background-color: #b4b9bf;
        }

        /*style for datatable*/
        .suggestion-list-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .suggestion-list-table td {
            color: #333333 !important;
        }

    /*Table for project suggestion*/

     


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




        /*style for datatable*/
        .project-sugg-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .project-sugg-table td {
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


        .suggestion-enhance-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .suggestion-enhance-table td {
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


/*fir issues*/

         .suggestion-issues-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .suggestion-issues-table td {
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


    </style>
  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div style="padding-left: 2%; padding-top: 1%;">

            <div class="pull-left">
                <h4 style="text-shadow: 1px 6px 13px; color: #a92828;">Suggestion Master </h4>
            </div>

          <%--  <div class="pull-right" style="padding-right: 10%; padding-bottom: 10px">
                <button type="button" data-bs-toggle="modal" data-bs-target="#FRDaddProject" class="btn rounded-pill btn-outline-secondary" onclick="getUniqueFRDId()">
                    <span class="tf-icons bx bx-plus"></span>&nbsp; Add Project
                </button>
            </div>--%>

        </div>

        <div>
            <hr style="width: 100%; text-align: left; margin-left: 0">
        </div>


        <div class="card-body" style="margin-top: -2%;">

             <div class="nav-align-top">

                  <ul class="nav nav-tabs" role="tablist">
                      <li class="nav-item">
                          <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-suggestion" aria-controls="navs-top-suggestion" aria-selected="true">ALL SUGGESTIONS</button>
                      </li>
                      <li class="nav-item">
                          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-projects" aria-controls="navs-top-projects" aria-selected="false">NEW PROJECTS</button>
                      </li>
                      <li class="nav-item">
                          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-enhancement" aria-controls="navs-top-enhancement" aria-selected="false"> ENHANCEMENT</button>
                      </li>

                      <li class="nav-item">
                          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-issues" aria-controls="navs-top-issues" aria-selected="false"> ISSUES</button>
                      </li>

                  </ul>
                 <div class="pull-right">
                                <asp:Label ID="lblReq" Text="STATUS:" runat="server" Font-Size="Medium" Font-Bold="true" />
                                &nbsp;&nbsp
                           
                                <select class="form-select placement-dropdown" id="ddlStatus" style="Width:9%">
                                    <option value="-1" selected> --- ALL --- </option>
                                    <option value="0"> --- Submitted --- </option>
                                     <option value="1"> --- Under Review --- </option>
                                     <option value="2"> --- Scheduled --- </option>
                                     <option value="3"> --- Working On --- </option>
                                     <option value="4"> --- Completed --- </option>
                                     <option value="5"> --- Major Application --- </option>
                                    <option value="6"> --- Not Applicable --- </option>
                                </select>
                            </div>

                          <div class="tab-content">
                              <div class="tab-pane fade show active" id="navs-top-suggestion" role="tabpanel">
                           
          

                                    <div class="" style="margin-top: 1%;">

                                    <table class="table table-bordered table-striped suggestion-list-table">
                
                                        <thead>
                                           <tr>
                                               <%-- <th>Sl.No</th>--%>
                                                
                                                <th>Employee Name</th>
                                                <th>EmpNo</th>
                                                <th>Type of Suggestion</th>
                                                <th>Project Name </th>
                                                <th>Application Name</th>
                                                <th>Description</th>
                                               <th>Download File</th>
                                                <th> Date</th>
                                               <th style="width:81px;"> Status</th>
                                                
                                                <th style="width: 10%;">Action</th>
                                            </tr>
                                        </thead>

                                        <tbody class="tbody-suggestion">
                    
                                        </tbody>
                                    </table>

                                    <%-- Modal for FRD Priject status --%>

                                    

                                    </div>

                                </div>

                              <div class="tab-pane fade" id="navs-top-projects" role="tabpanel">
                                     <table class="table table-bordered table-striped project-sugg-table" style="width:100%">
                
                                        <thead>
                                            <tr>
                                               
                                               
                                                <th>Employee Name</th>
                                                <th>EmpNo</th>
                                                <%--<th>Type of Suggestion</th>--%>   
                                                <th>Project Name </th>
                                                <th>Description</th>
                                                <th> Date</th>
                                                <th> Status</th>
                                                
                                                <th style="width: 10%;">Action</th>
                                            </tr>
                                        </thead>

                                        <tbody class="tbody-Projsugg">
                    
                                        </tbody>
                                    </table>
                                 
                              </div>

                               <div class="tab-pane fade" id="navs-top-enhancement" role="tabpanel">
                                     <table class="table table-bordered table-striped suggestion-enhance-table" style="width:100%">
                
                                        <thead>
                                            <tr>
                                               
                                                <th>EmpNo</th>
                                                <th>Employee Name</th>                                       
                                                <th>Application Name</th>
                                                <th>Description</th>
                                                <th> Date</th>
                                                <th> Status</th>
                                                
                                                <th style="width: 10%;">Action</th>
                                            </tr>
                                        </thead>

                                        <tbody class="tbody-sugg-enhance">
                    
                                        </tbody>
                                    </table>
                                 
                              </div>

                              <div class="tab-pane fade" id="navs-top-issues" role="tabpanel">
                                     <table class="table table-bordered table-striped suggestion-issues-table" style="width:100%">
                
                                        <thead>
                                            <tr>
                                               
                                                <th>EmpNo</th>
                                                <th>Employee Name</th>                                       
                                                <th>Application Name</th>
                                                <th>Description</th>
                                                <th> Date</th>
                                                <th> Status</th>
                                                
                                                <th style="width: 10%;">Action</th>
                                            </tr>
                                        </thead>

                                        <tbody class="tbody-sugg-issues">
                    
                                        </tbody>
                                    </table>
                                 
                              </div>

                              </div>
 
             </div>


        </div>
        <asp:HiddenField ID="hdnUserId" runat="server" />
    </div>

    <script>
         var loggedInUserId = ''; 
        $(document).ready(function () {
             loggedInUserId = '<%= Session["UserId"] %>';
        });
    </script>

   <%-- <script>
        $(document).ready(function () {
            $('#suggestion-issues-table').DataTable({
                order: [[1, 'desc']],
            });
        });
    </script>--%>
     
   
    <script src="../Template/Datatable/js/jquery.dataTables.min.js"></script>
    <script src="../Template/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../Template/Datatable/js/jszip.min.js"></script>
    <script src="../Template/Datatable/js/pdfmake.min.js"></script>
    <script src="../Template/Datatable/js/buttons.print.min.js"></script>
    <script src="../Template/Datatable/js/vfs_fonts.js"></script>
    <script src="../Template/Datatable/js/buttons.html5.min.js"></script>

            <%-- For Toaster --%>
    
    <script src="Flatpickr/js/flatpickr.js"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


     <script src="Script/suggestion.js?v=1.4"></script>
     

</asp:Content>

