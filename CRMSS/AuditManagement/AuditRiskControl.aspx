<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="AuditRiskControl.aspx.cs" Inherits="AuditManagement_AuditRiskControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../Calendar/plugins/fullcalendar/main.css">
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <link rel="stylesheet" href="css/audit_calendar.css">
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div class="row m-3">
            <div class="col-6">
                <div class="pull-left">
                    <h4 style="color: #a92828;">Risk Control Management</h4>
                </div>
            </div>
            <div class="col-6">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button class="btn btn-primary me-md-2 d-block" id="btncreateriskgrid" type="button"><i class="fa-regular fa-calendar-plus me-2 fa-lg"></i>Create New Risk</button>
                </div>
            </div>
        </div>

        <div id="content"></div>

        <div class="card-body">

            <div class="table">
                <table class="table rcm-page-list">
                    <thead>
                        <tr style="text-align: center;">
                            <th scope="col" style="width: 4%; border-radius: 5px 0px 0px 0px;">RCM Code</th>
                            <th scope="col">Major Process</th>
                            <th scope="col">Process Name</th>
                            <th scope="col" style="width: 15%;">Process Description</th>
                            <th scope="col">Risk Name</th>
                            <th scope="col">Risk Impact</th>
                            <th scope="col">Risk Likelihood</th>
                            <th scope="col">Risk Occurrence Responsibility</th>
                            <th scope="col">Risk Description</th>
                            <th scope="col">Control Name</th>
                            <th scope="col">Control Objective</th>
                            <th scope="col">Control Description</th>
                            <th scope="col" style="border-radius: 0px 5px 0px 0px;">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="rcm-page-list-tbody">
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%--ADD New Risk--%>
    <div class="modal fade" id="CreateRiskModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lblcreateriskModal">Create New Risk</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">
                    <div class="row">
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Major Process<span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="txtMajPrc" placeholder="Enter Major Process" class="form-control" />
                            </div>
                        </div>
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Process Name<span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="txtPrcName" placeholder="Enter Process Name" class="form-control" />
                            </div>
                        </div>
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Process Description<span style="color: red;">*</span></label>
                            <div class="">
                                <textarea class="form-control" id="taPrcDesc" rows="4" placeholder="Type process description here..."></textarea>
                            </div>
                        </div>
                        <div class="col-12"></div>
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Risk Name<span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="txtRiskName" placeholder="Enter observation name" class="form-control" />
                            </div>
                        </div>
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Risk Occurrence Responsibility<span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="txtRiskOccRes" placeholder="Enter Occurrence Responsibility" class="form-control" />
                            </div>
                        </div>
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Risk Description<span style="color: red;">*</span></label>
                            <div class="">
                                <textarea class="form-control" id="taRiskDesc" rows="4" placeholder="Type risk description here..."></textarea>
                            </div>
                        </div>

                        <div class="col-12"></div>
                        <div class="col-6">
                            <label class="col-form-label label-custom" for="basic-default-name">Risk Impact</label>
                            <div>
                                <select id="ddlRiskImpact" class="form-select color-dropdown">
                                    <option value="None" selected>Select</option>
                                    <option value="Low">Low</option>
                                    <option value="Moderate">Moderate</option>
                                    <option value="High">High</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <label class="col-form-label label-custom" for="basic-default-name">Risk Likelihood</label>
                            <div>
                                <select id="ddlRiskLikelihood" class="form-select color-dropdown">
                                    <option value="None" selected>Select</option>
                                    <option value="Low">Low</option>
                                    <option value="Moderate">Moderate</option>
                                    <option value="High">High</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12"></div>
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Control Name<span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="txtContName" placeholder="Enter Control Name" class="form-control" />
                            </div>
                        </div>
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Control Objective<span style="color: red;">*</span></label>
                            <div class="">
                                <input type="text" id="txtContObj" placeholder="Enter Control Objective" class="form-control" />
                            </div>
                        </div>
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">Control Description<span style="color: red;">*</span></label>
                            <div class="">
                                <textarea class="form-control" id="taContDesc" rows="4" placeholder="Type control description here..."></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-closepu" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnCreateRisk">Create</button>
                </div>
            </div>
        </div>
    </div>

      <%--DELETE CONFIMATION MODAL--%>
      <div class="modal fade" id="deleteModal" style="background-color:#00000070;" tabindex="-1" aria-labelledby="deelteModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
  
            <div class="modal-body" style="text-align:center;">
                <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
                <div><h3>Are you sure?</h3></div>
              <span class="dSentence"></span>
            </div>
            <div class="modal-footer">
            <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary btn-delete-y" data-bs-dismiss="modal">Delete</button>
                </div>
            </div>
          </div>
        </div>
      </div>

    <input type="hidden" value="0" id="hfId" />
    <asp:HiddenField ID="hfAttachId" runat="server" />
    <asp:HiddenField ID="hfServerMapPth" runat="server" />
    <script type="text/javascript">
        var currUserId = '';
        var EmpNo = '';
        var myrole = '';
        var overAllPerfo = 0;
        var actIDForAttach = 0;
        var rolesList = '';

        var loggedInUserName = '';
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            actIDForAttach = $('#<%=hfAttachId.ClientID%>');
            rolesList = '<%=Session["CurrentUserRolesList"].ToString()%>';

        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js" integrity="sha512-GWzVrcGlo0TxTRvz9ttioyYJ+Wwk9Ck0G81D+eO63BaqHaJ3YZX9wuqjwgfcV/MrB2PhaVX9DkYVhbFpStnqpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <script src="../Calendar/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../Calendar/dist/js/adminlte.min.js"></script>
    <script src="../Calendar/plugins/moment/moment.min.js"></script>

    <link rel="stylesheet" href="../Calendar/plugins/fullcalendar/main.css">
    <script src="../Calendar/plugins/fullcalendar/main.js"></script>
    <%--<script src="fullcalendar-6.1.10/dist/index.global.js"></script>--%>

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

    <script src="Scripts/risk-control.js"></script>

    <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>


    <script src="https://phpcoder.tech/multiselect/js/jquery.multiselect.js"></script>
    <link rel="stylesheet" href="https://phpcoder.tech/multiselect/css/jquery.multiselect.css">
</asp:Content>


