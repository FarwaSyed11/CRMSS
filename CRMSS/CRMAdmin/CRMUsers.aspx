<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="CRMUsers.aspx.cs" Inherits="CRMAdmin_CRMUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />



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
            color: #ffffff;
            background-color: #ed974e !important;
            border-color: #ed974e !important;
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
                background-color: #76dd4b !important;
                border-color: #7bdd59 !important;
                transform: translateY(-1px) !important;
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

        .CRMUser-table-details .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .CRMUser-table-details th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .CRMUser-table-details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

       


        .Popup-table th {
            text-align: center;
            color: white !important;
            background-color: #a16363;
        }

        .Popup-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

         .Opt-table th {
            text-align: center;
            color: white !important;
            background-color: #a16363;
        }

        .Opt-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

         .Prj-table th {
            text-align: center;
            color: white !important;
            background-color: #a16363;
        }

        .Prj-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .Event-det-drilldown {
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

        .Head-det-drilldown {
            font-weight: 800;
            color: #ffffff;
            /* border: 1px solid #b8adad;*/
            width: 3%;
            cursor: pointer;
            margin-top: 6px;
            position: inherit;
            /* background: #d54832e8;*/
            /* border-radius: 13px;*/
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

        /*.nav-tabs .nav-item .nav-link:not(.active) {
            color: black;
            background-color: #b4b9bf;
        }*/
        .nav-tabs .nav-item .nav-link:not(.active) {
            color: #a92828;
            background-color: #e5bbbb;
        }

       /* table.dataTable tbody tr:hover {
            background-color: #ff6f591a !important;
            border-right: 5px solid #db7e2f !important;
        }*/

        .Survey-status-Draft {
            background-color: #fff2d6 !important;
            color: #ffab00 !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #ffab00;
        }

        .Survey-status-completed {
            /*background-color: #e8fadf !important;
    color: #48a516 !important;
    letter-spacing: 0.5px;
    box-shadow: 0px 0px 3px 0px #48a516;
    min-width: 52%;
    text-align: center;*/
            background-color: #d7f5fc !important;
            color: #03c3ec !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #03c3ec;
        }

        .Survey-status-NotActive {
            background-color: #ffe0db !important;
            color: #ff3e1d !important;
            letter-spacing: 0.5px;
            box-shadow: 0px 0px 3px 0px #ff3e1d;
            min-width: 52%;
            text-align: center;
        }


        .Survey-det-drilldown {
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

     /*   .active-tr {
            border-left: 7px solid #db7e2f !important;
        }*/

        .form-control:focus, .form-select:focus {
            border-color: #ff9869 !important;
        }

        .select2-container--default .select2-selection--multiple .select2-selection__choice__display {
            cursor: default;
            padding-left: 12px !important;
            padding-right: 5px;
            color: #e02d0a;
        }

        .emps-list-table th {
            background: #ffe7e0;
            position: sticky;
            top: -10px;
            border-bottom: 1px solid #fff !important;
        }

        .select2-results__options li strong {
            color: rgb(242 71 71);
        }

        .LM-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .tbody-CRMUser tr:hover {
            background-color: #ff6f591a !important;
            border-right: 5px solid #db7e2f !important;
        }

        .badge {
            text-transform: uppercase;
            line-height: 0.75;
        }

        .taDiv:focus {
            outline: none;
        }

        .modal-xxl {
            max-width: 1854px !important;
        }

        ::-webkit-scrollbar {
            height: 8px; /* height of horizontal scrollbar ← You're missing this */
            width: 4px; /* width of vertical scrollbar */
            border: 1px solid #d5d5d5;
        }

        .active-ass {
            /*background-color:#e6eeff !important;*/
            background-color: #ffede6 !important;
        }

        /*.tbody-quesopt-list tr:hover {
            cursor: pointer;
        }
*/
        #lblEmpName, #lblDesignation, #lblDepart, #lblLeaveReqFileName:focus {
            outline: none;
        }

        .proj-det-drilldown {
            font-weight: 800;
            color: #ffffff;
            border: 1px solid #b8adad;
            width: 1.5%;
            cursor: pointer;
            margin-top: 6px;
            position: inherit;
            background: #d54832e8;
            /*border-radius: 13px;*/
            text-align: center;
        }

        .proj-det-drillup {
            font-weight: 800;
            color: #ffffff;
            border: 1px solid #b8adad;
            width: 1.5%;
            cursor: pointer;
            margin-top: 6px;
            position: inherit;
            background: #d54832e8;
            /*border-radius: 13px;*/
            text-align: center;
        }

        .proj-det-drillup, .proj-det-drilldown:hover {
            background-color: #c52a11;
        }

        .textbox-border-color {
            border-bottom: 4px solid #fc71224a;
        }

        #proj-details-rectangle-div {
            padding: 17px;
            background: #e8b79c3b;
            border-radius: 12px;
            border: 4px solid #f9bfa86b;
            box-shadow: 0px 0px 13px -7px #d84d1a;
        }

        .tbody-CRMUser .ibtn-Request-Details:hover {
            content: url("images/gif-eye.gif");
        }
        /*        .WFAdd
        {
       background: repeating-linear-gradient(45deg, #652525, #d54832 100px) !important;
       }

        .WFAdd:hover
        {
      color: ghostwhite !important;
    background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px);
    background: linear-gradient(-30deg, #4f8539 50%, #4a6a15 50%);
       }

        .Popup-Add
        {
            background: repeating-linear-gradient(45deg, #692020, #a16363 100px) !important;
        }

        .Popup-Add:hover
        {
           color: ghostwhite !important;
    background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px);
    background: linear-gradient(-30deg, #4f8539 50%, #4a6a15 50%);
        }*/


      /*  .active-tr {
            border-left: 7px solid #db7e2f !important;
        }*/
            .bg-success {
            background-color: #c9f9cf !important;
            color: #02e128 !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #03d91d;
            border-radius: 0rem !important;
        }

                .bg-primary {
                background-color: #f5cdcd !important;
                color: #ff0000 !important;
                letter-spacing: 1px;
                box-shadow: 0px 0px 3px 0px #ff0000;
                border-radius: 0rem !important;
        }
     
     
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="ajax-loader loader-bg-blur">
        <div class="custom-loader ">
            <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
            <h4>Loading Data...</h4>
        </div>
    </div>


    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div style="padding-left: 2%; padding-top: 1%;">
            <h5 style="color: #a92828; margin-top: 13px">USER LIST</h5>
        </div>

       <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
               <tr>
                   <td class="no-border  label-alignment" style="width: 0%">
                       <asp:Label ID="Label1" Text="Organization" runat="server" Font-Size="Medium" Font-Bold="true" />
                   </td>
                   <td class="no-border" style="width: 14%; padding-right: 0%;">
                       <select id="ddlOrganization" class="form-select color-dropdown">
                          
                       </select>
                   </td>


                   <td class="no-border  label-alignment" style="width: 0%">
                       <asp:Label ID="Label2" Text="Status" runat="server" Font-Size="Medium" Font-Bold="true" />
                   </td>
                   <td class="no-border" style="width: 12%; padding-right: 0%;">
                       <select id="ddlStatus" class="form-select color-dropdown">
                          <option value="-1">--All--</option>
                           <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                       </select>
                   </td>

                     <td class="no-border" style="width: 72%; padding-right: 0%;"/>
                     

               </tr>
           </table>
       </div>

        <div class="card-body" style="margin-top: -1%; zoom: 90%;">
           

            <%--SSHR Work--%>

            <div class="" style="margin-top: 1%;">

                <table class="table CRMUser-table-details" style="width: 100%;">

                    <thead>
                        <tr class="Head-tr">
                            <th style="display: none;">Em.Id</th>
                            <th>Emp.No</th>
                            <th>Name</th>
                            <th>Manager Of Employee</th>
                            <%-- <th style="width:6%;">Description</th>--%>
                            <th>Account Status</th>
                            <th>No.Of.Active Accounts</th>
                            <th>No.Of.Open Opportunity</th>
                            <th>No.Of.Open Project</th>
                            <th>View</th>
                            <%--  <th style="width:8%;">IspaidLeave</th>
                      <th style="width:6%;">Action</th>                  --%>
                    </thead>
                    <tbody class="tbody-CRMUser">
                    </tbody>
                </table>
            </div>



        </div>
        <%--card-body end--%>
    </div>



    <div class="modal fade" id="ModalUserAllDetails" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: rgb(177 171 171 / 36%); zoom: 85%;">
        <div class="modal-dialog modal-xxl" role="document" style="width: 82%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h3 class="modal-title" id="UserDetails">USER DETAILS</h3>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">

                 <div style="margin-top: -13px; position: absolute; width: 96%;">
                        <div style="text-align: right;">
                            <i class="bx bxs-chevron-up Event-det-drilldown Detail-det-drilldown" onclick="hideShowUserDet()"></i>
                        </div>
                    </div>

                    <%----- BASIC DETAILS -----%>
                <div id="UserDetailsRowDiv" style="background: rgb(159 159 159 / 6%); padding: 17px; border-radius: 12px; border: 1px solid rgb(0 0 0 / 17%); box-shadow: rgb(117 75 51 / 9%)">

                    <div class="row">

                        <div style="width: 25%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Name</label>
                            <div class="">

                                <input type="text" id="txtName" class="form-control textbox-border-color" disabled />
                            </div>
                        </div>

                       <div style="width: 25%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Company</label>
                            <div class="">

                                <input type="text" id="txtCompany" class="form-control textbox-border-color" disabled />
                            </div>
                        </div>

                         <div style="width: 25%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Manager</label>
                            <div class="">

                                <input type="text" id="txtManager" class="form-control textbox-border-color" disabled />
                            </div>
                        </div>


                       <div style="width: 25%;">
                            <label for="html5-number-input" class="col-form-label label-custom">User Name</label>
                            <div class="">

                                <input type="text" id="txtUserName" class="form-control textbox-border-color" disabled />
                            </div>
                        </div>

                      
                    </div>



                     <div class="row">

                        <div style="width: 25%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Email</label>
                            <div class="">

                                <input type="text" id="txtEmail" class="form-control textbox-border-color" disabled />
                            </div>
                        </div>

                       <div style="width: 25%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Team Name</label>
                            <div class="">

                                <input type="text" id="txtTeamName" class="form-control textbox-border-color" disabled />
                            </div>
                        </div>

                         <div style="width: 25%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Status</label>
                            <div class="" style="padding-top: 3%;">

                                <label id="txtStatus" class=""/>
                            </div>
                        </div>

                      
                    </div>


                </div>
                


                <div class="" style="margin-top: 1%;">
                    <div class="nav-align-top tab-Inspections">

                        <ul class="nav nav-tabs" role="tablist">

                            <li class="nav-item">
                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Account" aria-controls="tab-Account" aria-selected="false">Account</button>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Opportunity" aria-controls="tab-Opportunity" aria-selected="false">Opportunity</button>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Project" aria-controls="tab-Project" aria-selected="false">Project</button>
                            </li>





                        </ul>
                          <div style="overflow-y: auto; max-height: calc(100vh - 118px); overflow-x: hidden;">
                        <div class="tab-content">
                          


                            <div class="tab-pane fade show active" id="tab-Account" role="tabpanel">

                                <div style="margin-top:-1%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Status</label>
                                    <div class="" style="padding-bottom:1%;">


                                        <select id="ddlAccountStatus" class="form-control textbox-border-color" style="width:10%;">
                                            <option value="-1">-- All --</option>
                                            <option value="Active">Active</option>
                                            <option value="InActive">InActive</option>
                                        </select>
                                    </div>
                                </div>


                                <table class="table table-bordered table-striped Popup-table" style="width: 100%;">


                                    <thead>
                                        <tr>
                                            <th style="display: none">CRMAccntId</th>
                                            <th>Account Name</th>
                                            <th>Owner</th>
                                            <th>UpdatedBy</th>
                                            <th>Updated Date</th>
                                            <th>Phone</th>
                                            <th>Email</th>
                                            <th>Country</th>
                                            <th>City</th>


                                        </tr>
                                    </thead>


                                    <tbody class="tbody-Account">
                                    </tbody>
                                </table>
                            </div>
                             




                                <div class="tab-pane fade" id="tab-Opportunity" role="tabpanel">

                                    <div class="row" style="margin-top:-1%;padding-bottom: 1%;">
                                        <div style="width:10%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Status</label>
                                            <div class="">


                                                <select id="ddlOptStatus" class="form-control textbox-border-color" >
                                                </select>
                                            </div>
                                        </div>



                                        <div style="width:10%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Stage</label>
                                            <div class="">


                                                <select id="ddlOptStage" class="form-control textbox-border-color" >
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                   

                                        <table class="table table-bordered table-striped Opt-table" style="width:100%;">


                                            <thead>
                                                <tr>
                                                    <th style="display: none">OpportunityId</th>
                                                    <th>Opt.Numb</th>
                                                    <th>Name</th>
                                                    <th>Owner</th>
                                                    <th>Sales Stage</th>
                                                    <th>Status</th>
                                                    <th>MEPContractor</th>
                                                    <th>MEPConsultant</th>
                                                    <th>CreatedBy</th>
                                                    <th>Created Date</th>
                                                </tr>
                                            </thead>


                                            <tbody class="tbody-Opportunity">
                                            </tbody>
                                        </table>
                                    </div>
                            


                                <div class="tab-pane fade" id="tab-Project" role="tabpanel">

                                      <div class="row" style="margin-top:-1%;padding-bottom: 1%;">
                                        <div style="width:10%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Status</label>
                                            <div class="">


                                                <select id="ddlPrjStatus" class="form-control textbox-border-color" >
                                                </select>
                                            </div>
                                        </div>



                                        <div style="width:10%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Stage</label>
                                            <div class="">


                                                <select id="ddlPrjStage" class="form-control textbox-border-color" >
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                 

                                        <table class="table table-bordered table-striped Prj-table" style="width:100%;">


                                            <thead>
                                                <tr>
                                                    <th style="display: none">ProjectId</th>
                                                    <th>Project Number</th>
                                                    <th>Name</th>
                                                    <th>Status</th>
                                                    <th>Stage</th>
                                                    <th>Project Type</th>
                                                    <th>Client</th>
                                                    <th>MEPConsultant</th>
                                                    <th>Country</th>
                                                
                                                </tr>
                                            </thead>


                                            <tbody class="tbody-Project">
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
        var overAllPerfo = 0;
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';

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

    <%--    <script src="Scripts/SurveyAdmin.js?v=0.7"></script>--%>
    <script src="Script/CRMUsers.js?v=0.6"></script>

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />



    <link href="Css/Style.css" rel="stylesheet" />

    <%--  <link href="Css/Badges.scss" rel="stylesheet" />--%>
    <%--<link href="Css/Badges.scss"/>--%>

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

    <link href="../Dashboard/assets/multiselect/example-styles.css" rel="stylesheet" />
    <script src="../Dashboard/assets/multiselect/jquery.multi-select.js"></script>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

</asp:Content>