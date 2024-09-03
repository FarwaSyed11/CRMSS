<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/EconnectNew.master" CodeFile="TechnicalNote.aspx.cs" Inherits="ERM_TechnicalNote" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <!-- Flatpicker Datepicker JS/CSS file-->
    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div class="card-body">
            <div>
                <h3 class="mb-3" style="">Technical Note</h3>
            </div>

            <div class="card-body" style="margin-top: -1%;">
                <div class="mt-3 table">
                    <table class="table technote-list-table">
                        <thead>
                            <tr class="">
                                <th style="display: none">ID</th>
                                <th style="display: none">Role ID</th>
                                <th style="display: none">EstID</th>
                                <th>Estimation#</th>
                                <th>Product Name</th>
                                <th>Status</th>
                                <th>Date</th>
                                <th>Remarks</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody class="technote-tbody"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


    <%--TOC End--%>



    <script type="text/javascript">
        var currUserId = '';
        var EmpNo = '';
        var myrole = '';
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';
        });

    </script>

    <!-- Bootstrap JS/CSS file-->
    <link href="bootstrap-5.2.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>

    <!-- Toaster JS/CSS file-->
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

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

    <!-- Page JS/CSS file -->
    <script src="Scripts/TechnicalNote.js?v=1"></script>
    <script src="Scripts/common.js?v=1"></script>
    <link href="Css/EMSStyle.css" rel="stylesheet" />

    <!-- Select/Multiselect Dropdown JS/CSS file -->
    <%--  <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>--%>
    <script src="script/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />

    <script src="Assets/Js/multiple-select.js"></script>
    <link href="../sitesurvey/Assets/Css/multiple-select.css" rel="stylesheet" />
</asp:Content>




