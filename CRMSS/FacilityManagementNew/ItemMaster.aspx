<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="ItemMaster.aspx.cs" Inherits="FacilityManagementNew_ItemMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style> 
        
        .table-WOmaterialRequest th
        {
            background-color: #d54832 !important;
            color: white !important;
        }

        .table-WOmaterialRequest td{
            color: #333333 !important;
        }

          .table-ItemsINlocation th
        {
            background-color: #d54832 !important;
            color: white !important;
        }

        .table-ItemsINlocation td{
            color: #333333 !important;
        }

        .Allitem-list-table th
        {
            background-color: #d54832 !important;
            color: white !important;
        }

        .Allitem-list-table td{
            color: #333333 !important;
        }
        .table-Itemlocation th
        {
            background-color: #d54832 !important;
            color: white !important;
        }

         .table-Itemlocation td{
            color: #333333 !important;
        }
        .table-WOmaterialReqCompleted th{
            background-color: #d54832 !important;
            color: white !important;
        }

         .table-WOmaterialReqCompleted td{
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

        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: white !important;
            background: #FFF;
            border-color: orangered;
        }

       /* .modal.show .modal-dialog {
            transform: translateY(0) scale(1)!important;
            background-color: #ffff!important;
        }*/

        .file--upload > label {
            color: hsl(210deg 52.77% 39.92%);
            border-color: hsl(212deg 14% 54%);
        }

        .hide
        {
            display:none;
        }
        .LowQuant {
            background-color: #f44336ed !important;
            color: white !important;
            border-radius: 10px;
            font-weight: 600;
            font-size: 16px;
            box-shadow: 0 2px 5px rgba(0,0,0,.25) !important;
            margin: 0 10px;
            color: white !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div class="card-body" style="margin-top: -1%; min-height: 85vh;">
            <%--<h2 style="padding:3px"></h2>--%>


            <h4 style="color: #a92828; margin-top: 13px">Item Master  </h4>
            <%--Child Tab--%>
            <div class="nav-align-top row">
                <ul class="nav nav-tabs" id="propery-tabs-ul"  role="tablist">
                    <li class="nav-item">
                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab"  data-bs-target="#navs-top-my-project">New Item</button>
                    </li>
                    <%-- <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-pendingUnits">Pending Request</button>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-involved-project">Completed </button>
                    </li>--%>

                </ul>
                <div class="tab-content">

                    <div class="tab-pane fade show active" id="navs-top-my-project">

                        <div>
                            <a href="#" class="btn btn-primary pull-right btn-addNew-Item" data-bs-toggle="modal" data-bs-target="#ModalAddItems"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add New Item</a>
                        </div>

                        <div class="" style="margin-top: 0%;">
                            <table class="table Allitem-list-table" style="width: 100%;">
                                <%--<caption class="ms-4">List of Projects</caption>--%>
                                <thead>
                                    <tr>
                                        <th>Item Id</th>
                                        <th>Item Code</th>
                                        <th>Category</th>
                                        <th>Item Name</th>
                                        <%--<th>Description</th>--%>
                                         <th>total Stock</th>
                                        
                                        <th>Action</th>

                                    </tr>
                                </thead>
                                <tbody class="tbody-allitems-list">
                                </tbody>
                            </table>
                        </div>

                    </div>



                    <%-- TAble here based on tab2 --%>
                </div>
            </div>



            <div class="ajax-loader custom-loader hidden">
                <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
                <h4>Please wait...</h4>
            </div>


        </div>
    </div>

       <%-- Modal For Create New Itemm --%>

    <div class="modal fade" id="ModalCreateNewItem" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<h5 class="modal-title" id="lbladditems">Create New Property</h5>--%>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                       <%-- <div class="row">
                            <h6 class="prpmdl-hed" id="lbladditemsa">Contract Details</h6>

                        </div>--%>

                        <div class="row">

                            <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Item Code<span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="textitemcode" class="form-control" disabled   />
                                 
                                </div>
                             </div>
                           </div>

                  
                         <div class="row">
                             <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Category</label>
                                <div>
                                   <div>
                                        <select id="ddlitemcategory" class="form-select color-dropdown">
                                        </select>
                                    </div>

                                </div>
                            </div>
                        </div>

                     <div class="row hidden" id="newitemcategory">
                            <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Category Name</label>
                                <div>
                                     <input type="text" id="textnewcategory" class="form-control"   />

                                </div>
                            </div>
                      </div>
                    <div class="row">
                            <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Item Name</label>
                                <div>
                                     <input type="text" id="textitemname" class="form-control"   />

                                </div>
                            </div>
                        </div>

                      <div class="row">
                             <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Unit Of Measurement <span style="color: red;"></span></label>
                                <div>
                                    <div>
                                        <input type="text" id="textunitofmeasurement" class="form-control"   />
                                        
                                    </div>
                                </div>
                            </div>

                        </div>

                     <div class="row">
                             <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Size <span style="color: red;"></span></label>
                                <div>
                                    <div>
                                        <input type="text" id="textitemsize" class="form-control"   />
                                        
                                    </div>
                                </div>
                            </div>

                     </div>

                    <div class="row">

                            <div>
                                <label for="html5-number-input" class="col-form-label label-custom"> Item Description<span style="color: red;"></span></label>
                                <div>
                                   
                                    <textarea class="form-control" id="txtitemDescription" rows="2" ></textarea>

                                </div>
                            </div>

                    </div>

                    <div class="modal-footer" id="add-items" >
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal"  onclick="addItem()">Create</button>
                    </div>


                    <%--</div>--%>
                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

    <%-- Modal dor item details --%>

    <div class="modal fade" id="ModalItemDetails" data-bs-backdrop="static" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title" id="lblprojDetailModal">Item Details Details</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div style="margin-top: -13px; position: absolute; width: 96%;">
                        <div style="text-align: right;">
                            <i class="bx bxs-chevron-up contract-det-drilldown" onclick="hideShowProjDetails()"></i>
                        </div>
                    </div>


                    <div id="ContractDetailsRowDiv" style="background: #1d1b1b36; padding: 17px; border-radius: 12px; border: 1px solid #1d1b1b36; box-shadow: 4px 4px 13px -7px #1d1b1b36;">

                        <div class="row">

                            <div style="width: 20%">
                                <label for="html5-number-input" class="col-form-label label-custom">ItemID</label>
                                <div class="">

                                    <input class="form-control" type="text" id="txtitemid" readonly />
                                </div>
                            </div>

                            <div style="width: 20%">
                                <label for="html5-number-input" class="col-form-label label-custom">ItemCode </label>
                                <div class="">
                                    <input class="form-control" type="text" id="txtitemcode" readonly />


                                </div>
                            </div>
                            <div style="width: 20%">
                                <label for="html5-number-input" class="col-form-label label-custom">CategoryName</label>
                                <div class="">

                                    <input class="form-control" type="text" id="txtcategoryname" readonly />
                                </div>
                            </div>

                            <div style="width: 20%">
                                <label for="html5-number-input" class="col-form-label label-custom">ItemName </label>
                                <div class="">

                                    <input class="form-control" type="text" id="txtitemname" readonly />
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Total Stock</label>
                                <div class="">

                                    <input class="form-control" type="text" id="currentstock" readonly />
                                </div>
                            </div>

                          <%--  <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom"> UnitPrice </label>
                                <div class="">

                                    <input class="form-control" type="text" id="txtunitprice" readonly />
                                </div>
                            </div>--%>
                            <div style="width: 20%">
                                <label for="html5-number-input" class="col-form-label label-custom">Description </label>
                                <div class="">

                                    <input class="form-control" type="text" id="textdesc" readonly />
                                </div>
                            </div>

                           

                        </div>


                        

                        

                    </div>


                    <%--Grid--%>


                    <div style="margin-top: 1.5%;">


                        <div>
                            <a href="#" class="btn btn-primary pull-right btn-add-location"><i class="fa fa-plus" aria-hidden="false"></i>&nbsp; Add Location</a>
                        </div>

                        <div class="table-responsive" style="margin-top: 1%; width: 100%;">

                            <table class="table table-Itemlocation" style="width: 100%;">

                                <thead>
                                    <tr style="text-align: center;">
                                        <th style="display:none">Location Id</th>
                                        <th style="display:none">Item Id</th>
                                        <th style="display:none">Item code</th>
                                        <th>Item Name</th>
                                        <th>Item Location</th>
                                        <th>Description</th>
                                         <th>Item Quantity</th>
                                         
                                        <th> Action</th>


                                    </tr>
                                </thead>
                                <tbody class="tbody-ItemLocation" style="text-align: center;">
                                </tbody>
                            </table>

                        </div>

                    </div>
                </div>

            </div>


        </div>

    </div>

    <%-- End --%>

    <%-- Modal for Item location --%>

    <div class="modal fade" id="ModalItemLocation" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<h5 class="modal-title" id="lbladditems">Create New Property</h5>--%>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                       <%-- <div class="row">
                            <h6 class="prpmdl-hed" id="lbladditemsa">Contract Details</h6>

                        </div>--%>

                        <div class="row">

                            <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Item Location <span style="color: red;">*</span></label>
                                <div>
                                    <%--<input type="text" id="textitemlocation" class="form-control"   />--%>
                                     <div>
                                    <select id="ddlitemlocation" class="form-select color-dropdown">
                                       
                                        <option value="DIP CAMP">DIP Camp</option>
                                        <option value="HQ">HQ</option>
                                        <option value="Brass Light">Brass Light</option>
                                    </select>
                                </div>
                                 
                                </div>
                             </div>
                           </div>

                  
                         <div class="row">
                             <div>
                                <label for="html5-number-input" class="col-form-label label-custom">Description</label>
                                <div>
                                   <div>
                                        <textarea class="form-control" id="textitemdescription" rows="2" ></textarea> 
                                      
                                    </div>

                                </div>
                            </div>
                        </div>
                


                    
                    

                    <div class="modal-footer" id="add-items111" >
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal"  onclick="addItemLocation()">Create</button>
                    </div>


                    <%--</div>--%>
                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

    <%-- Modal for item Deatils and attachements --%>

    <div class="modal fade" id="ModalUpdateitemdetails" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<h5 class="modal-title" id="lbladditems">Create New Property</h5>--%>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                       <%-- <div class="row">
                            <h6 class="prpmdl-hed" id="lbladditemsa">Contract Details</h6>

                        </div>--%>

                      <div class="row">

                            <div class="col-6">
                                <label for="html5-number-input" class="col-form-label label-custom">Item Quantity<span style="color: red;"></span></label>
                                <div>
                                    <input type="text" id="textItemQuantity" class="form-control"   />
                                 
                                </div>
                            </div>


                            <div class="col-6">
                                <label for="html5-number-input" class="col-form-label label-custom">Unit Price<span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="textunitprice" class="form-control" />
                                </div>
                            </div>
                        </div>
                        
                      <div class="row">

                            <div class="col-6">
                                <label for="html5-number-input" class="col-form-label label-custom">Minimum Stock <span style="color: red;">*</span></label>
                                <div>
                                    <div>
                                        <input type="text" id="minimumstock" class="form-control" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-6">
                                <label for="html5-number-input" class="col-form-label label-custom">Purchase Date <span style="color: red;">*</span></label>
                                <div>
                                    <div>
                                        <input type="date" id="purchesedate" class="form-control" />
                                    </div>
                                </div>
                            </div>

                        </div>

                   
                      
                        
                        <div class="row">
                             
                            <div class="col-6">
                                <label for="html5-number-input" class="col-form-label label-custom">Upload Your Attachement </label>

                        
                                <div class="input-group" style="padding-top:10px;padding-left:15%" id="btn-documetuploaded">
                                    <label style="margin-right: 10px; display: none;" class="lbl-fufile-count"></label>

                                    <input class="form-control" type="file" id="fu-docment-attach" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" multiple="">
                                    <label class="input-group-text ml-3" for="fu-docment-attach"><i class="fa fa-upload " title="Upload File" style="color: #2196F3; cursor: pointer; font-size: large;"></i></label>

                                    <a href="#" id="btnsaveDocuments" class="btn btn-upload" style="margin-left: 4px; border-radius: 10px;" onclick="uploadDocumentAttach()">Upload </a>

                                    <%--<input type="text" id="lblFilesName" value="" style="background: #80808000; border: ; color: #697a8d; border: none; margin-left: 10px;" readonly="">--%>
                                </div>


                           </div>
                           

                            <div class="col-6">
                                <label for="html5-number-input" class="col-form-label label-custom">Remarks <span style="color: red;">*</span></label>
                                <div>
                                    <div>

                                        <textarea class="form-control" id="textattachementremarks" rows="2"></textarea>
                                    </div>
                                </div>

                            </div>

                        </div>

                    <div class="modal-footer" id="add-contract" >
                        <button type="button" class="btn btn-close-down" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary"   onclick="UpdateItemDetails()">Update</button>
                    </div>


                    <div style="margin-top: 1.5%;">



                        <div class="table-responsive" style="margin-top: 1%; width: 100%;">

                            <table class="table table-ItemsINlocation" style="width: 100%;">

                                <thead>
                                    <tr style="text-align: center;">
                                        <th>Location Id</th>
                                        <th>Item Id</th>
                                       
                                         <th>Item Quantity</th>
                                         <th>Unit Price</th>
                                         <th>Minimum Stock</th>

                                        <th> Purchase Date</th>
                                        <th style="display:none">Attachement</th>
                                        <th> Action</th>


                                    </tr>
                                </thead>
                                <tbody class="tbody-ItemINLocation" style="text-align: center;">
                                </tbody>
                            </table>

                        </div>

                    </div>

                    </div>
                </div>
            </div>
        </div>
    
    <%-- end --%>

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
            EmpName = '<%=Session["EmpName"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';
        });

     </script>


    <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../Template/Datatable/js/jquery.dataTables.min.js"></script>

    <link href="css/propertymaster.css" rel="stylesheet" />

   <script src="js/itemmaster.js?v=0.5"></script>
    

    <script src="../Template/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../Template/Datatable/js/jszip.min.js"></script>
    <script src="../Template/Datatable/js/pdfmake.min.js"></script>
    <script src="../Template/Datatable/js/vfs_fonts.js"></script>
    <script src="../Template/Datatable/js/buttons.html5.min.js"></script>
    <script src="../Template/Datatable/js/buttons.print.min.js"></script>

    <script src="../Template/Flatpickr/js/flatpickr.js"></script>
    <link href="../Template/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

</asp:Content>

