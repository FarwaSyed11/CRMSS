<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="InventoryMaster.aspx.cs" Inherits="ERM_InventoryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />



    <style type="text/css">
        .centerforall {
            text-align: -webkit-center;
            text-align: -moz-center;
        }
        /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
        .tbody-UserMaster .ibtn-Request-Details:hover {
            content: url("Images/gif-eye.gif");
        }

        .UserMaster-table-details .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .UserMaster-table-details th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .UserMaster-table-details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }


        .UserList-BOn-Role .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .UserList-BOn-Role th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .UserList-BOn-Role td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .RoleMaster-table-details .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .RoleMaster-table-details th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .RoleMaster-table-details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .Application-table-details .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .Application-table-details th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .Application-table-details td {
        border-bottom: 1px solid #96a2ab45 !important;
        }

        .FormMaster-table-details .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .FormMaster-table-details th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .FormMaster-table-details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .image--cover {
            width: 160px;
            height: 160px;
            border-radius: 50%;
            object-fit: cover;
            object-position: center right;
            BORDER: OUTSET;
            BORDER-WIDTH: 5PX;
            BORDER-COLOR: #c9c9c9;
        }

        .modal-xxl {
            max-width: 1854px !important;
        }

        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 25px !important;
            height: 20px;
        }


        .NotActive-User {
            background-color: #ffa2a22e;
            border: double;
            color: #e70000bf;
        }




        .Active-User {
            background-color: #82b5722e;
            border: double;
            color: #00b107bd;
        }


        .btn-InActive {
            color: #fff;
            background-color: #cb0000;
            border-color: #c13434;
            box-shadow: 0 0.125rem 0.25rem 0 rgb(0 0 0 / 41%);
        }

            .btn-InActive:hover {
                color: #fff;
                background-color: #f50000;
                border-color: #ff5858;
                box-shadow: 0 0.125rem 0.25rem 0 rgb(0 0 0 / 41%);
            }


        .btn-Active {
            color: #fff;
            background-color: #0ccb00;
            border-color: #5ce153;
            box-shadow: 0 0.125rem 0.25rem 0 rgb(0 0 0 / 41%);
        }

            .btn-Active:hover {
                color: #fff;
                background-color: #49db40;
                border-color: #8cfd84;
                box-shadow: 0 0.125rem 0.25rem 0 rgb(0 0 0 / 41%);
            }

        .salesOrderBOX {
            height: 126px;
            border: 3px solid #e1dddd;
        }

        .lbl-BasicDet {
            background-color: #ec1a2542;
            text-align: center;
            width: auto;
            color: #EC1A25;
            font-size: 17px;
            border-radius: 20px;
            font-family: auto;
            height: 35px;
            padding-top: 0%;
        }


        .div-BasicDet {
            border-left: 3px solid #efefef
        }

        .head-BasicDet {
            color: gray;
            font-size: 18px;
            padding-bottom: 5px !important;
        }
                         .Radio-info th{
                    border:none !important;
                    width:10% !important;
                    font-size: 100%;
                    text-decoration: underline;
}
    
                .Radio-info td{
                    border:none !important;
                }


    input[type="radio"] {
	appearance: none;
	-webkit-appearance: none;
	width: 20px;
	height: 20px;
	border: 1px solid #e0bbbd;
	border-radius: 50%;
	margin-right: 10px;
	background-color: transparent;
	position: relative;
	top: 6px;
}

    input[type="radio"]:checked::before {
	content: "";
	display: block;
	width: 12px;
	height: 12px;
	background-color: #ca8489;
	border-radius: 50%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	animation: appear 0.8s;
}
    .hr-history{
        color:#efeeee;
    }

   /* .table{
        border-collapse: separate !important;
        background-color: rgb(255 255 255) !important;
    }*/

   .SO-Line-Details-table th{
       background-color:#c51111 !important;
       color:white !important;
   }

   .SO-Comments-Details-table th{
    background-color:#c51111 !important;
    color:white !important;
}

   .SO-Escalation-Details-table th{
    background-color:#c51111 !important;
    color:white !important;
}
   .btn-Approve{
    color: #fff;
    background-color: #ff3e1d;
    border-color: #55e33b;
    box-shadow: 0 0.125rem 0.25rem 0 rgb(19 179 0 / 40%);
   }

   .btn-Approve:hover{
    color: #fff;
    /*background-color: #e6381a;*/
    border-color: #aeffa4;
    transform: translateY(-1px);
   }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div class="row" style="padding-left: 2%; padding-top: 1%;">
            <div style="width: 22%;" class="pull-left">
            </div>
            <div style="width: 74%" class="pull-left"></div>

           <%--<div style="width: 25%" class="pull-right">
                <label>System</label>
            </div>

            <div style="width: 25%" class="pull-right">
                <label>Category</label>
            </div>--%>

            <%-- <div style="width: 10%" class="pull-right">
                <label>Member</label>
            </div>--%>


           <%-- <div style="width: 3%; padding-top: 3px;" class="pull-right">
            </div>--%>

        </div>
        <div class="row" style="padding-left: 2%;">
            <div style="width: 22%;" class="pull-left">
                <h4 style="color: #a92828; margin-top: 13px">Inventory Master</h4>
            </div>
            <div style="width: 74%" class="pull-left"></div>

         <%--  <div style="width: 25%" class="pull-right">
                <select id="ddlSystem" class="form-select color-dropdown">
                </select>
            </div>

            <div style="width: 25%" class="pull-right">
                <select class="form-select placement-dropdown" id="ddlCategory">
                </select>
            </div>--%>

            <%-- <div style="width: 10%" class="pull-right">
                <select class="form-select placement-dropdown" id="ddlMember">
                </select>
            </div>--%>

          <%--  <div style="width: 3%; padding-top: 3px;" class="pull-right">
                <button id="btnsearch" type="button" class="btn-danger" style="background-color: #EC1A25; font-size: 17px; float: left;"><i class="fa fa-search" style="color: white;"></i></button>
            </div>--%>

        </div>

        <%--SSHR Work--%>

        <div class="card-body" style="margin-top: -1%;">
            <div>
                <button id="AddNewItem" type="button" class="btn btn-primary" style="float: right; width: 150px;"><i class="fa fa-plus"></i>&nbsp;Add</button>
            </div>

            <div class="" style="margin-top: 3%;">

                <table class="table Inventory-Master-details" style="width: 100%;">

                    <thead>
                        <tr style="text-align: center;">

                            <th style="width: 8%;">OracleItemID</th>
                            <th style="width: 10%;">Item Code</th>
                            <th style="width: 18%;">Description</th>
                            <th style="width: 8%;">Action</th>
                        </tr>
                    </thead>

                    <tbody class="tbody-InventoryMaster">
                    </tbody>
                </table>
            </div>
        </div>
   </div>

     <div class="modal fade" id="modalUpdateInventory" style="background: rgb(177 171 171 / 36%); zoom: 80%;" tabindex="-1" aria-hidden="true">
     <div class="modal-dialog modal-lg" role="document" style="width: 22%;">
         <div class="modal-content">
             <div class="modal-header">
                 <h5 class="modal-title">Inventory Details</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">
                 <div class="row">
                     <label style="font-size: 18px;">Brand</label>
                 </div>
                 <div class="row" style="padding-top: 1px;">
                     <div>
                          <input type="text" id="txtBrandUpdate" class="form-control" placeholder="Enter Brand" />
                     </div>
                    
                 </div>

                 <div class="row" style="padding-top: 4%;">
                     <label style="font-size: 18px;">Model</label>
                 </div>
                 <div class="row" style="padding-top: 1px;">
                     <div>
                         <input type="text" id="txtModelUpdate" class="form-control" placeholder="Enter Model"/>
                     </div>
                     
                 </div>


                 <div class="row" style="padding-top: 4%;">
                     <label style="font-size: 18px;">Manufacturer</label>
                 </div>
                 <div class="row" style="padding-top: 1px;">
                     <div>
                         <input type="text" id="txtManufacturerUpdate" class="form-control" placeholder="Enter Manufacturer" />
                     </div>

                 </div>

                 <div class="row" style="padding-top: 4%;">
                     <label style="font-size: 18px;">Warranty Period</label>
                 </div>
                 <div class="row" style="padding-top: 1px;">
                     <div>
                         <input type="text" id="txtwarrantyUpdate" class="form-control" placeholder="Enter Warranty Period" />
                     </div>

                 </div>

             

              
                 <div class="row" style="padding-top: 4%;">
                     <label style="font-size: 18px;">Country Of Origin</label>
                 </div>
                 <div class="row" style="padding-top: 1px;">
                     <div>
                         <select id="ddlCountryUpdate" class="form-select color-dropdown">
                         </select>
                     </div>

                 </div>

                 <div class="row" style="padding-top: 4%;">
                     <label style="font-size: 18px;">Status</label>
                 </div>
                 <div class="row" style="padding-top: 1px;">
                     <div>
                         <select id="ddlStatusUpdate" class="form-select color-dropdown">
                             <option value="1">Active</option>
                             <option value="0">Inactive</option>
                         </select>
                     </div>

                 </div>

                 <div class="row" style="padding-top: 6%;">
                     <div class="centerforall">
                         <button id="btnUpdateInventory" type="button" class="btn-danger" style="background-color: #EC1A25; font-size: 17px;width: 70%;">Update</button>
                     </div>
                 </div>


             </div>
         </div>
     </div>
 </div>


   <div class="modal fade" id="modalInventoryetails" style="background: rgb(177 171 171 / 36%); zoom: 80%;" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-xxl" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title">Requested Details</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">

                  <div class="row">
                      <div style="width: 15%;" class="pull-left">
                          <h4 style="color: #a92828; margin-top: 13px">Inventory Details</h4>
                      </div>
                  </div>

                  <div class="row Basic-info" style="padding-top: 1%;">

                      <div class="col-3 centerforall">
                          <table style="background-color: white !important; width: 82%;">
                              <tr style="text-align: center;">
                                  <td class="head-BasicDet">Item Code</td>

                              </tr>
                              <tr style="text-align: center;">
                                  <td class="lbl-BasicDet centerforall td-Inv-ItemCode"></td>

                              </tr>
                          </table>
                      </div>

                      <div class="col-3 div-BasicDet centerforall">
                          <table style="background-color: white !important; width: 82%;">
                              <tr style="text-align: center;">
                                  <td class="head-BasicDet">Description</td>

                              </tr>
                              <tr style="text-align: center;">
                                  <td class="lbl-BasicDet centerforall td-Inv-Description"></td>

                              </tr>
                          </table>
                      </div>

                      <div class="col-3 div-BasicDet centerforall">
                          <table style="background-color: white !important; width: 82%;">
                              <tr style="text-align: center;">
                                  <td class="head-BasicDet">Brand</td>

                              </tr>
                              <tr style="text-align: center;">
                                  <td class="lbl-BasicDet centerforall td-Inv-Brand"></td>

                              </tr>
                          </table>
                      </div>

                      <div class="col-3 div-BasicDet centerforall">
                          <table style="background-color: white !important; width: 82%;">
                              <tr style="text-align: center;">
                                  <td class="head-BasicDet">Model</td>

                              </tr>
                              <tr style="text-align: center;">
                                  <td class="lbl-BasicDet centerforall td-Inv-Mdel"></td>

                              </tr>
                          </table>
                      </div>
                      </div>
                       <div class="row Basic-info" style="padding-top: 2%;">

                      <div class="col-3 centerforall">
                          <table style="background-color: white !important; width: 82%;">
                              <tr style="text-align: center;">
                                  <td class="head-BasicDet">Manufacturer</td>

                              </tr>
                              <tr style="text-align: center;">
                                  <td class="lbl-BasicDet centerforall td-Inv-manufacturer"></td>

                              </tr>
                          </table>
                      </div>

                      <div class="col-3 div-BasicDet centerforall">
                          <table style="background-color: white !important; width: 82%;">
                              <tr style="text-align: center;">
                                  <td class="head-BasicDet">Warranty Period</td>
                              </tr>
                              <tr style="text-align: center;">
                                  <td class="lbl-BasicDet centerforall td-Inv-Warranty"></td>
                              </tr>
                          </table>
                      </div>

                      <div class="col-3 div-BasicDet centerforall">
                          <table style="background-color: white !important; width: 82%;">
                              <tr style="text-align: center;">
                                  <td class="head-BasicDet">Country Of Origin</td>
                              </tr>
                              <tr style="text-align: center;">
                                  <td class="lbl-BasicDet centerforall td-Inv-Country"></td>
                              </tr>
                          </table>
                      </div>

                      <div class="col-3 div-BasicDet centerforall">
                          <table style="background-color: white !important; width: 82%;">
                              <tr style="text-align: center;">
                                  <td class="head-BasicDet">Status</td>
                              </tr>
                              <tr style="text-align: center;">
                                  <td class="lbl-BasicDet centerforall td-Inv-Status"></td>
                              </tr>
                          </table>
                      </div>


                  </div>

               

              </div>
          </div>
      </div>
 </div>


    <div class="modal fade" id="modalAllItemToSearch" style="background: rgb(177 171 171 / 36%); zoom: 80%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oracle Item Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">

                        <div style="width: 18%; padding-top: 5px;">
                            <label style="font-size: 18px; font-weight: bold;">Item Code/Description</label>
                        </div>
                        <div style="width: 22%">
                            <input type="text" id="txtGeneralSearch" class="form-control" placeholder="Enter to Search" />
                        </div>
                        <div style="width: 3%; padding-top: 4px;">
                            <button id="btnsearchItem" type="button" class="btn-danger" style="background-color: #EC1A25; font-size: 17px; float: left;"><i class="fa fa-search" style="color: white;"></i></button>
                        </div>
                        <div style="width: 52%">
                        </div>

                    </div>
                    <div style="padding-top: 2%;">
                        <table class="table table-OracleItem-Details" style="width: 100%;">
                            <thead>
                                <tr style="text-align: center;">
                                    <th>Oracle Id</th>
                                    <th>Item Code</th>
                                    <th>Description</th>

                                </tr>
                            </thead>
                            <tbody class="tbody-OracleItemDet">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="mpAddItemConfirmation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
             <div class="modal-header hidden">
                 <h5 class="modal-title" id="lbldelKpiConfirmPopup">Confirmation</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body" style="text-align: center;">
                 <div><i class="bx bx-check-circle fa-del-kpi" title="" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #2db93f;"></i></div>
                 <div>
                     <h3>Are you sure ?</h3>
                 </div>
                 Do you Want to Add this Item : Item Code - <label id="lblItemConfirmation" style="font-size: 18px;color:red;font-weight:bold;"></label>
             </div>
             <div class="modal-footer">
                 <div style="margin-right: 165px;">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                     <button type="button" id="btnAddItem" class="btn btn-primary btn-Cancel-Request">Add</button>
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


    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
    <%--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.13.1/datatables.min.css"/>--%>

    <script src="../Template/assets/vendor/libs/gauge/dist/gauge.js"></script>

    <%--    <script src="Scripts/SurveyAdmin.js?v=0.7"></script>--%>
    <script src="Scripts/InventoryMaster.js?v=0.5"></script>
  <%--  <link href="../CRMAdmin/Css/CRMAdmin.css" rel="stylesheet" />--%>




    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />




    <link href="../SalesOrderTrack/Css/SalesOrderCss.css" rel="stylesheet" />

    <%--  <link href="Css/Badges.scss" rel="stylesheet" />--%>
    <%--<link href="Css/Badges.scss"/>--%>

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>



    <%--  <link href="../Dashboard/assets/multiselect/example-styles.css" rel="stylesheet" />
    <script src="../Dashboard/assets/multiselect/jquery.multi-select.js"></script>--%>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

     <link href="../Calendar/dist/select2.css" rel="stylesheet"/>
     <script src="../Calendar/dist/select2.js"></script>

</asp:Content>
