<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="UserMaster.aspx.cs" Inherits="E_ConnetAdmin_UserMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
      <link href="css/e-connectadmin.css" rel="stylesheet" />

    <style>


        body {
            background-image: url(assets/img/avatars/background.jpg) !important;
            background-size: cover;
            /*zoom:76% !important;*/
            /* background-color: gray; */
        }

        .Admin-user-list-table th {
            background-color: #d54832 !important;
            color: white !important;
        }

        .Admin-user-list-table td {
            color: #333333 !important;
        }

        .iconClassExcel {
            margin-left: 8px;
            /*background:#933737;*/
            color: #d54832;
            background-color: #ffffff;
            border: #f9bfa8 1px solid;
            box-shadow: 0 0.125rem 0.25rem 0 rgba(133, 146, 163, 0.4);
        }

            .iconClassExcel:hover {
                background: #a54141;
            }

            .iconClassExcel:hover {
                /*background:#a54141;*/
                background: #d54832;
            }

        #DataTables_Table_0_paginate .current {
            color: white !important;
            background: #d54832  !important;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%; zoom:80%">

        <div style="padding-left: 2%; padding-top: 1%;">

            <div class="pull-left">
                <h4 style="color: #a92828;">User List </h4>
            </div>

        </div>

        <div class="card-body" style="margin-top: -2%;">


            <div class="" style="margin-top: 1%;">

                <table class="table table-bordered table-striped Admin-user-list-table">

                    <%--<a href="#" class="btn btn-primary pull-right btn-add-task-grid"><i class="fa fa-user" aria-hidden="true"></i>&nbsp; Add User</a>--%>


                    <thead>
                        <tr>
                            <th>Emp.No</th>
                            <th>Employee Name</th>
                            <th>E-mail</th>  
                            <th>Org. Name</th>
                                                      
                            <th>HOD </th>
                            <th>Line Manager</th>

                            <th style="width: 10%;">Details</th>
                        </tr>
                    </thead>

                    <tbody class="tbody-empdetails">
                    </tbody>
                </table>

                <%-- Modal for FRD Priject status --%>
            </div>

        </div>

    </div>

    <%-- Modal for Creating User Acess --%>

         <div class="modal fade" id="ModalUserDetails" style="background-color: #00000070;" tabindex="-1" aria-hidden="true">
         <div class="modal-dialog modal-xl" role="document" style="zoom:85%">
            <div class="modal-content">
                <div class="modalheader">
                    <h5 class="modal-title" id="lbladdTaskModal">User Application Details</h5>

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                    <div class="nav-align-top row" >

                        <ul class="nav nav-tabs" id="task-ul" role="tablist">
                            <li class="nav-item">
                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-my-task">Applications</button>
                            </li>

                            <li class="nav-item">
                                <button type="button" class="nav-link " role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-involved-task">Roles</button>
                            </li>

                             <li class="nav-item">
                                <button type="button" class="nav-link " role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-involved-task">Modules</button>
                            </li>

                             <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-involved-task">Forms </button>
                            </li>

                              <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-involved-task">Form Accessibility</button>
                            </li>

                        </ul>

                         <div class="tab-content">

                                 <div class="tab-pane fade active" id="navs-top-my-task">
                                     <div> 
                                         <a href="#" class="btn btn-primary pull-right btn-add-task-grid"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add New Application</a>
                                      </div>
                                     
                                      <div class="" style="margin-top: 1%;">

                                          <table class="table table-bordered table-striped user-application-list-table" style="width:100%">

                                              <%--<a href="#" class="btn btn-primary pull-right btn-add-task-grid"><i class="fa fa-user" aria-hidden="true"></i>&nbsp; Add User</a>--%>


                                              <thead>
                                                  <tr>
                                                      <th>App.Id</th>
                                                      <th>Application Name</th>
                                                      <th>Description</th>
                                                     
                                                      <th>Actions</th>
                                                  </tr>
                                              </thead>

                                              <tbody class="tbody-userapplicationlist">
                                              </tbody>
                                          </table>
                                      </div>    
                                </div>


                                 <div class="tab-pane fade show" id="navs-top-involved-task">
                                       <div > 
                                         <a href="#" class="btn btn-primary pull-right btn-add-task-grid"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add New Role</a>
                                      </div>
                         
                                        <div class="" style="margin-top: 0%;">
                                                 <table class="table task-list-table1" style="width: 100%;">
                                                   <%--<caption class="ms-4">List of Projects</caption>--%>
                                                   <thead>
                                                     <tr>
                                                      <th>Role.Id</th>
                                                      <th>Role Name</th>
                                                      <th>Description</th>
                                                      
                                                      <th style="width: 10%;">Details</th>
                                                  </tr>
                                                   </thead>
                                                   <tbody class="tbody-task-list" style="text-align:center;">

                                                   </tbody>
                                                 </table>
                                       </div>
                                </div>


                              <div class="tab-pane fade show" id="navs-top-involved-module">
                                       <div > 
                                         <a href="#" class="btn btn-primary pull-right btn-add-task-grid"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add New Module</a>
                                      </div>
                         
                                        <div class="" style="margin-top: 0%;">
                                                 <table class="table task-list-table1" style="width: 100%;">
                                                   <%--<caption class="ms-4">List of Projects</caption>--%>
                                                   <thead>
                                                     <tr>
                                                      <th>Role.Id</th>
                                                      <th>Role Name</th>
                                                      <th>Description</th>
                                                      
                                                      <th style="width: 10%;">Details</th>
                                                  </tr>
                                                   </thead>
                                                   <tbody class="tbody-task-list" style="text-align:center;">

                                                   </tbody>
                                                 </table>
                                       </div>
                                </div>

                             <div class="tab-pane fade" id="navs-top-my-task1">
                                  <div> 
                                         <a href="#" class="btn btn-primary pull-right btn-add-task-grid"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add New Form</a>
                                      </div>
                                      <div class="" style="margin-top: 0%;">
                                          <table class="table table-bordered table-striped Admin-user-list-table1">

                                              <%--<a href="#" class="btn btn-primary pull-right btn-add-task-grid"><i class="fa fa-user" aria-hidden="true"></i>&nbsp; Add User</a>--%>


                                              <thead>
                                                  <tr>
                                                      <th>Form Id</th>
                                                      <th>Name</th>
                                                      <th>E-mail</th>
                                                      <th>Description</th>

                                                      <th style="width: 10%;">Details</th>
                                                  </tr>
                                              </thead>

                                              <tbody class="tbody-empdetails">
                                              </tbody>
                                          </table>
                                      </div>    
                                </div>

                              <div class="tab-pane fade" id="navs-top-my-task11">
                                  <div> 
                                         <a href="#" class="btn btn-primary pull-right btn-add-task-grid"> <i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add New Form</a>
                                      </div>
                                      <div class="" style="margin-top: 0%;">
                                          <table class="table table-bordered table-striped Admin-user-list-table1">

                                              <%--<a href="#" class="btn btn-primary pull-right btn-add-task-grid"><i class="fa fa-user" aria-hidden="true"></i>&nbsp; Add User</a>--%>


                                              <thead>
                                                  <tr>
                                                      <th>Emp.No</th>
                                                      <th>Employee Name</th>
                                                      <th>E-mail</th>
                                                      <th>Org. Name</th>

                                                      <th>HOD </th>
                                                      <th>Line Manager</th>

                                                      <th style="width: 10%;">Details</th>
                                                  </tr>
                                              </thead>

                                              <tbody class="tbody-empdetails">
                                              </tbody>
                                          </table>
                                      </div>    
                                </div>

                      

                        </div>
                      

                    
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnAddTask">Create</button>
                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

    <%-- Modal for Inside User details --%>

    <div class="modal fade" id="ModalUserApplicationDetails" style="background-color: #00000070;" tabindex="-1" aria-hidden="true">
         <div class="modal-dialog modal-xl" role="document" style="zoom:85%">
            <div class="modal-content">
                <div class="modalheader">
                    <h5 class="modal-title" id="lblUsrAppdetails">Roles Details</h5>

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                        <div class="" style="margin-top: 0%;">
                            <table class="table table-bordered table-striped User-Application-Details-table">

                                <%--<a href="#" class="btn btn-primary pull-right btn-add-task-grid"><i class="fa fa-user" aria-hidden="true"></i>&nbsp; Add User</a>--%>


                                <thead>
                                    <tr style="background-color: #d54832">
                                        <th>Select</th>
                                        <th>Role.Id</th>
                                        <th>Role Name </th>
                                        <th>Description</th>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="roles" id="radio1" /></td>
                                        <td>2066</td>
                                        <td >CRM ADMIN</td>
                                        <td>CRM ADMIN</td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="roles" id="radio2" /></td>
                                        <td>2068</td>
                                        <td>Quotation Data Entry</td>
                                        <td>Quotation Data Entry</td>
                                    </tr>
                                    <tr>
                                         <td><input type="radio" name="roles" id="radio3" /></td>
                                        <td>2065</td>
                                        <td>CRMSS QUOTATION ADMIN</td>
                                        <td>CRMSS QUOTATION ADMIN</td>
                                    </tr>
                                </thead>

                                <tbody class="tbody-applicationdtls">
                                </tbody>
                            </table>
                        </div>

                    <div class="abc" style="display:none">
                     <h5 class="modal-title" id="lblUsrAppdetails1">Module Details</h5>

                     <div class="" style="margin-top: 0%;">
                            <table id="abc" class="table table-bordered table-striped User-Module-Details-table">

                                <%--<a href="#" class="btn btn-primary pull-right btn-add-task-grid"><i class="fa fa-user" aria-hidden="true"></i>&nbsp; Add User</a>--%>


                                <thead>
                                    <tr style="background-color: #d54832">
                                        <th>Module.Id</th>
                                        <th>Role Name </th>
                                         <th>Module Name </th>
                                        <th>Description</th>
                                        <th>Menu Id</th>
                                    </tr>
                                    <tr>
                                        <td>2066</td>
                                        <td>CRM ADMIN</td>
                                        <td>Master Project</td>
                                        <td> CRM Master Project</td>
                                        <td> 2</td>

                                    </tr>
                                    <tr>
                                        <td>2068</td>
                                        <td>CRM ADMIN</td>
                                        <td>Master Account</td>
                                        <td>CRM ADMIN-Master Account</td>
                                         <td> 2</td>
                                    </tr>
                                    <tr>
                                        <td>2065</td>
                                        <td>CRM ADMIN</td>
                                        <td>Accounts</td>
                                        <td>CRM ADMIN-Accounts</td>
                                         <td> 2</td>
                                    </tr>
                                    <tr>
                                        <td>2077</td>
                                        <td>CRM ADMIN</td>
                                        <td>Opportunity</td>
                                        <td>CRM Opportunity</td>
                                         <td> 2</td>
                                    </tr>
                                </thead>

                                <tbody class="tbody-moduledetails">
                                </tbody>
                            </table>
                        </div>

                   </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnAddTask">Create</button>
                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

    <%-- Modal for New Application assign to user --%>

    <div class="modal fade" id="ModalUserAppAssign" style="background-color: #00000070;" tabindex="-1" aria-hidden="true">
         <div class="modal-dialog" role="document" style="zoom:85%">
            <div class="modal-content">
                <div class="modalheader">
                    <h5 class="modal-title" id="lbladduserappModal">User Application Acess</h5>

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                    <div class="mb-3">
                        <label for="exampleFormControlReadOnlyInput1" class="form-label label-custom">Application Name*</label>
                        <input class="form-control" type="text" id="exampleFormControlReadOnlyInput1" />
                    </div>

                    <div class="mb-3">
                        <label for="exampleFormControlReadOnlyInput1" class="form-label label-custom">Description*</label>
                        <%--<input class="form-control" type="textarea" id="exampleFormControlReadOnlyInput2" />--%>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                    </div>

                   

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnAddTask">Create</button>
                </div>
            </div>
        </div>
    </div>

    <%-- End --%>


    <script type="text/javascript">

        var currUserId = '';
        var EmpNo = '';
        var EmpName = '';
        var myrole = '';
        var overAllPerfo = 0;
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            EmpName ='<%=Session["EmpName"]%>'
        });

    </script>


    <script src="../Template/Datatable/js/jquery.dataTables.min.js"></script>
    <script src="../Template/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../Template/Datatable/js/jszip.min.js"></script>
    <script src="../Template/Datatable/js/pdfmake.min.js"></script>
    <script src="../Template/Datatable/js/buttons.print.min.js"></script>
    <script src="../Template/Datatable/js/vfs_fonts.js"></script>
    <script src="../Template/Datatable/js/buttons.html5.min.js"></script>

    

    <script src="Flatpickr/js/flatpickr.js"></script>

    <script src="js/e-usermaster.js"></script>

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

</asp:Content>

