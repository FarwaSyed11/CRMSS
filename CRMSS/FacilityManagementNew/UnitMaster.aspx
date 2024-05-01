<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="UnitMaster.aspx.cs" Inherits="FacilityManagementNew_UnitMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="css/unitmaster.css" rel="stylesheet" />
    <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />

    <style>

        .unit-master-table th {
            background-color: #d54832 !important;
            color: white !important;
        }

        .unit-master-table td {
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div class="card-body" style="margin-top: -1%; min-height: 85vh;">

            <h4 style="color: #a92828; margin-top: 13px">Task List </h4>
            <div class="nav-align-top row">
                <ul class="nav nav-tabs" id="task-ul" role="tablist">
                    <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-my-task">Raised By Me</button>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-involved-task">Assigned to Me</button>
                    </li>

                </ul>
                <div class="tab-content">

                    <div class="tab-pane fade" id="navs-top-my-task">

                        <div>
                            <a href="#" class="btn btn-primary pull-right unit-master-table"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Task</a>
                        </div>

                        <div class="" style="margin-top: 0%;">
                            <table class="table unit-master-table" style="width: 100%;">
                                
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

                                <tbody class="tbody-unitmaster" style="text-align: center;">
                                </tbody>
                            </table>
                        </div>



                    </div>

                    <div class="tab-pane fade show active" id="navs-top-involved-task">
                        <div>
                            <a href="#" class="btn btn-primary pull-right btn-add-task-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Task</a>
                        </div>

                        <div class="" style="margin-top: 0%;">
                            <table class="table task-list-table" style="width: 100%;">
                                
                                <thead>
                                    <tr style="text-align: center;">
                                        <th>NAME</th>
                                        <th style="text-align: left;">PRIORITY</th>
                                        <th style="text-align: left;">STATUS</th>
                                        <th>OWNER</th>
                                        <th>Start Date</th>
                                        <th>DUE DATE </th>
                                        <th>CREATED DATE </th>
                                       
                                        <th>Task % </th>
                                        <th>Assigned By</th>
                                        <th>ACTION </th>
                                    </tr>
                                </thead>
                                <tbody class="tbody-task-list" style="text-align: center;">
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>

           
            <div class="ajax-loader custom-loader hidden">
                <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
                <h4>Please wait...</h4>
            </div>


        </div>
</div>


    
      <%--TODO CREATE TASK MODAL--%>

    
    <div class="modal fade" id="addTaskModal" style="background-color: #00000070;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lbladdTaskModal">Create New Task</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">



                    <div class="row">
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Task Name <span style="color: red;">*</span></label>
                            <div class="">
                                <input class="form-control" type="text" value="" id="txtNameTask" placeholder="Enter Task Name" style="border-color: lightgrey;">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-4">
                            <label class="col-form-label label-custom" for="basic-default-name">Priority</label>
                            <div>
                                <select id="ddlPriorityTask" class="form-select color-dropdown">
                                    <option value="Urgent" selected="">Urgent</option>
                                    <option value="Important">Important</option>
                                    <option value="Medium">Medium</option>
                                    <option value="Low">Low</option>
                                </select>
                            </div>


                            <label class="col-form-label label-custom" for="basic-default-name">Status</label>
                            <div>
                                <select id="ddlMStatusTask" class="form-select color-dropdown">
                                    <option value="Not Started" selected="">Not Started</option>
                                    <option value="Open">Open</option>
                                    <option value="In Progress">In Progress</option>
                                    <option value="Closed">Closed</option>
                                    <option value="Cancelled">Cancelled</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-8">
                            <label class="col-form-label label-custom" for="basic-default-name">Task Description <span style="color: red;">*</span></label>
                            <div>
                                <textarea class="form-control" id="taTaskDescTask" rows="4" placeholder="Enter Task Description" style="border-color: lightgrey;"></textarea>
                            </div>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-5">
                            <label for="html5-number-input" class="col-form-label label-custom">Start Date <span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="StartDateTask" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
                            </div>
                        </div>

                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">No. of Days <span style="color: red;">*</span></label>
                            <div class="">

                                <input type="text" id="NoOfDaysTask" class="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                            </div>
                        </div>

                        <div class="col-4">
                            <label for="html5-number-input" class="col-form-label label-custom">Due Date <span style="color: red;">*</span></label>
                            <div class="">

                                <input type="text" id="DueDateTask" class="form-control" readonly="readonly">
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-12 multi-ddl-owner-div">
                            <label for="html5-number-input" class="col-form-label label-custom">Owner <span style="color: red;">*</span></label>
                            <div class="">
                                <select id="ddlOwnerTask" class="form-select color-dropdown ddlOwnerTask"></select>

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

    <%--END--%>


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

    <script src="js/unitmaster.js"></script>

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


</asp:Content>

