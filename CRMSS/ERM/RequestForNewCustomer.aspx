<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="RequestForNewCustomer.aspx.cs" Inherits="ERM_RequestForNewUser" %>

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
            color: #fff;
            background-color: #bb1414;
            border-color: #bb1414;
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
                background-color: #76dd4b;
                border-color: #7bdd59;
                transform: translateY(-1px);
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

        table.dataTable.no-footer {
            border-bottom: 1px solid #aeddff73 !important;
        }

        .table-Costomer-Details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Opt-det-drilldown {
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

        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #bf242c !important;
            border-bottom: 4px solid #bf242c !important;
        }

        .nav-tabs .nav-item .nav-link:not(.active) {
            background-color: white;
        }

        .nav-tabs .nav-item .nav-link:focus {
            color: #000000;
            border-bottom: 4px solid black;
        }

        table.dataTable tbody tr:hover {
            background-color: #ff6f591a !important;
            border-right: 5px solid #db7e2f !important;
        }



        .NewCustReq-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .NewCustReq-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }


        .table-MAccount-Details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .table-MAccount-Details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .input-group {
            position: relative !important;
            display: flex !important;
            flex-wrap: wrap !important;
            align-items: stretch !important;
            width: 100% !important;
        }

        .form-control {
            background-color: #ffffff !important;
        }

            .form-control:focus, .form-select:focus {
                border-color: #ff9869 !important;
            }

        .Create-New:hover {
            content: url("images/gif-created-new.gif")
        }

        .tbody-NewCustReq .ibtn-Request-Details:hover {
            content: url("images/output-onlinegiftools.gif");
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
            <h4 style="text-shadow: 1px -3px 8px; color: #a92828;">CUSTOMER REQUEST</h4>
        </div>

        <div class="card-body" style="margin-top: -2%;">

            <div>
                <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                    <tr>

                        <%--    
                          <td class="no-border" style="width: 12%">
                                <asp:Label ID="Label8" Text="Organization" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select id="ddlOrganization" class="form-select color-dropdown">
                              </select>
                          </td>

                           


                          <td class="no-border label-alignment" style="width: 1%"></td>
                        
                          <td class="no-border" style="width: 12%">
                               <asp:Label ID="Label2" Text="Manager" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlManager"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                        
                          <td class="no-border" style="width: 12%">
                                <asp:Label ID="Label3" Text="Team Member" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlMember"> </select>
                          </td>
                            <td class="no-border label-alignment" style="width: 1%"></td>--%>


                        <%--   <td class="no-border label-alignment" style="width: 1%"></td>
                        
                          <td class="no-border" style="width: 12%">
                                <asp:Label ID="Label1" Text="CreatedBy Company" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select id="ddlCompany" class="form-select color-dropdown">
                              </select>
                          </td>--%>

                        <%--<td class="no-border" style="width: 18%">
                                <asp:Label ID="Label1" Text="Stage" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select id="ddlSection" class="form-select color-dropdown">
                                  <option value="TENDER">TENDER</option>
                                   <option value="HOLD">HOLD</option>
                              </select>
                          </td>--%>
                        <%-- <td class="no-border" style="width: 12%">
                              <asp:Label ID="Label4" Text="Status" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlStatus">
                                  <option value="DRAFT" selected">DRAFT</option>
                                  <option value="SUBMIT">SUBMIT</option>
                              </select>
                          </td>--%>

                        <%-- <td class="no-border label-alignment" style="width: 1%"></td>--%>


                        <%--      <td class="no-border" style="width: 5%;padding-top:34px">

                              <input type="button" id="btnSearch" value="Search" class="btn btn-primary d-block" style="font-size:small;background-color:#d54832;" /> 
                          </td>--%>
                        <%--  <td class="no-border" style="width: 5%">
                              <input type="button" id="btnExport" value="Export" class="btn btn-primary d-block" style="font-size:small;background-color:#d54832;" /> 
                          </td>--%>
                        <%-- <td class="no-border" style="width: 5%">
                              <input type="button" id="btnAddNew" value="New " class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>--%>
                    </tr>
                </table>
            </div>




            <div class="" style="margin-top: 1%;">
                <table class="table NewCustReq-list-table">

                    <thead>
                        <tr>

                            <th style="width: 8%;">Req.No</th>
                            <th style="width: 14%;">Customer Name</th>
                            <th style="width: 14%;">Primary Category</th>
                            <%--              <th style="width:6%;">Owner</th>--%>
                            <th style="width: 6%;">Phone</th>
                            <th style="width: 8%;">Email</th>
                            <th style="width: 8%;">Country</th>
                            <th style="width: 8%;">City</th>
                            <th style="width: 8%;">CreatedBy</th>
                            <th style="width: 8%;">Created Date</th>
                            <th style="width: 10%;">Remarks</th>
                            <th style="width: 8%; display: none;">Sub Category</th>
                            <th style="width: 10%; display: none;">Address</th>
                            <th style="width: 10%; display: none;">URL</th>
                            <th style="width: 10%; display: none;">Owner</th>
                            <th style="width: 10%; display: none;">OwnerId</th>
                            <th style="width: 6%;">View</th>

                        </tr>

                    </thead>
                    <tbody class="tbody-NewCustReq">
                    </tbody>
                </table>
            </div>




        </div>
    </div>



    <div class="modal fade" id="ModalNewCustomer" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalCustomerAdd">NEW CUSTOMER</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">



                    <div style="margin-top: -1%;">
                        <div class="p-3" style="">

                            <div>
                                <h5 class="prpmdl-hed" style="">CUSTOMER</h5>
                            </div>

                            <div class="row">

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Name </label>
                                    <div class="">


                                        <input type="text" id="txtCustName" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />
                                    </div>
                                </div>

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Primary Category </label>
                                    <div class="">



                                        <input type="text" id="txtCustPRCategory" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />
                                    </div>
                                </div>


                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Sub Category </label>
                                    <div class="">



                                        <input type="text" id="txtCustSubCategory" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />
                                    </div>
                                </div>

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Phone </label>
                                    <div class="">


                                        <input type="text" id="txtCustNumber" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                    </div>
                                </div>


                            </div>


                            <div class="row">

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Email </label>
                                    <div class="">


                                        <input type="text" id="txtCustEmail" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />
                                    </div>
                                </div>

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">URL </label>
                                    <div class="">


                                        <input type="text" id="txtCustURL" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />
                                    </div>
                                </div>

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Country </label>
                                    <div class="">


                                        <input type="text" id="txtCountry" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />
                                    </div>
                                </div>

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">City </label>
                                    <div class="">


                                        <input type="text" id="txtCity" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />
                                    </div>
                                </div>
                            </div>


                            <div class="row">


                                <div style="width: 50%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Owner </label>
                                    <div class="">


                                        <input type="text" id="txtOwner" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />
                                    </div>
                                </div>


                                <div class="col mb-3 discriptionDiv">
                                    <label for="nameBasic" class="form-label">Address </label>
                                    <textarea class="form-control" id="txtCustAddress" rows="3" style="color: #697a8d; border: none; border-bottom: solid; border-color: #ffc1a3; overflow-y: scroll;"></textarea>
                                </div>
                            </div>

                            <div class="row">
                                <div style="width: 50%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Master Account </label>
                                    <%-- <div class="">--%>


                                    <%--   <input type="text" id="txtMasterAccount" value="" style="width: 100%; background: #ffffff; border: 0px; color: #697a8d; border: none;border-bottom: solid;border-color: #ffc1a3;" />
                                         </div>
                                        </div>
                                         <div style="width:2%;">
                                        <a href="#" id="btnSearchMasterAcc"><i class="fa fa-search" aria-hidden="true" style="padding-top:40px;margin-left:-45px;color:red;"></i></a>--%>

                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <a href="#" id="btnSearchMasterAcc" text=""><i class="tf-icons bx bx-search"></i></a></span>
                                        <input type="text" id="txtMasterAccount" cssclass="textBox1 form-control " font-bold="True" enabled="false" style="width: 93%;" />

                                    </div>

                                    <%--        </div>--%>
                                </div>

                                <div style="width: 2%;">
                                    <%-- <a href="#" id="btnAddNewMasterAccount"> <i class="fa fa-plus" aria-hidden="true" style="color:#ff460c;padding-top:39px;font-size: xx-large;margin-left: -15px;"></i></a>--%>
                                    <img src="images/icons8-create-New.png" title="Add New" id="btnAddNewMasterAccount" class="fa-icon-hover Create-New" style="cursor: pointer; width: 36px; padding-top: 36px; font-size: xx-large; margin-left: -15px;" />

                                </div>




                                <div class="row" style="padding-top: 1%;">
                                    <div class="col-12">
                                        <a href="#" id="btnApproveReq" class="btn btn-primary pull-right" style="width: 10%;">Approve</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <div class="modal fade" id="ModalMasterAccountDetails" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title" id="MasterAccountDet">MASTER ACCOUNT</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <%--Grid--%>
                    <div style="margin-top: 2%;">

                        <div class="nav-align-top">
                            <ul class="nav nav-tabs" id="mstone-task-modal-ul" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-MAccount" aria-controls="navs-top-MAccount" aria-selected="true">Master Account</button>
                                </li>


                            </ul>
                            <div class="tab-content">
                                <%--1st--%>
                                <div class="tab-pane fade show active" id="navs-top-MAccount" role="tabpanel" style="margin-top: -1%;">

                                    <%--            <div>
                                       <a href="#" class="btn btn-primary pull-right btn-add-tenant-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Tenant</a>
                                   </div>--%>

                                    <div class="table-responsive" style="margin-top: 1%; width: 100%;">

                                        <table class="table table-MAccount-Details" style="width: 100%;">

                                            <thead>
                                                <tr style="text-align: center;">


                                                    <th style="display: none;">Id</th>
                                                    <th>Account Name</th>
                                                    <th>City</th>
                                                    <th>Country</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>CreatedBy</th>
                                                    <th>Created Date</th>

                                                    <%--  <th>Substage </th>
                                                   <th>Value </th>--%>
                                                </tr>
                                            </thead>
                                            <tbody class="tbody-MAccount-details" style="text-align: center;">
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




    <div class="modal fade" id="ModalNewMasterAccount" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="max-width: 50%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalMasterAccountAdd">NEW MASTER ACOOUNT</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">



                    <div style="margin-top: -1%;">
                        <div style="background: #1d1b1b36; padding: 17px; border-radius: 12px; border: 1px solid #1d1b1b36; box-shadow: 0px 0px 13px -7px #1d1b1b36;">

                            <div>
                                <h5 class="prpmdl-hed" style="text-decoration: underline;">MASTER ACCOUNT</h5>
                            </div>

                            <div class="row">

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Name </label>
                                    <div class="">


                                        <input type="text" id="txtMAccountName" value="" class="form-control" style="border-bottom: solid; border-color: #b9b9b9;" />
                                    </div>
                                </div>

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Phone </label>
                                    <div class="">


                                        <input type="text" id="txtMAccountNumber" value="" class="form-control" style="border-bottom: solid; border-color: #b9b9b9;" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                    </div>
                                </div>


                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Email </label>
                                    <div class="">


                                        <input type="text" id="txtMAccountEmail" value="" class="form-control" style="border-bottom: solid; border-color: #b9b9b9;" />
                                    </div>
                                </div>



                            </div>


                            <div class="row">

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">URL </label>
                                    <div class="">


                                        <input type="text" id="txtMAccountURL" value="" class="form-control" style="border-bottom: solid; border-color: #b9b9b9;" />
                                    </div>
                                </div>

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Country </label>
                                    <div class="">


                                        <select id="dlMAccountCountry" value="" class="form-control" style="border-bottom: solid; border-color: #b9b9b9;">
                                        </select>
                                    </div>
                                </div>

                                <div style="width: 33.33%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">City </label>
                                    <div class="">


                                        <select id="dlMAccountCity" value="" class="form-control" style="border-bottom: solid; border-color: #b9b9b9;">
                                        </select>
                                    </div>
                                </div>


                            </div>

                            <div class="row" style="padding-top: 1%;">
                                <div class="col-12">
                                    <a href="#" id="btnAddMasterAccount" class="btn btn-primary pull-right" style="width: 10%;">Add</a>
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

    <script src="Scripts/RequestForNewCustomer.js?v=0.5"></script>

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>



    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <link href="css/quotation.css" rel="stylesheet" />
    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

</asp:Content>

