<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="ScrapQC.aspx.cs" Inherits="ScrapSystem_ScrapQC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="src/css/lightslider.css" rel="stylesheet" />
    <style>
        ul {
            list-style: none outside none;
            padding-left: 0;
            margin: 0;
        }

        .demo .item {
            margin-bottom: 60px;
        }

        .content-slider li {
            background-color: #ed3020;
            text-align: center;
            color: #FFF;
        }

        .content-slider h3 {
            margin: 0;
            padding: 70px 0;
        }

        .demo {
            width: 800px;
        }

        AllScrapeItems .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .AllScrapeItems th {
            text-align: center;
            color: white !important;
            border-bottom:1px solid #11111138 !important;
           
           /*border-bottom: 1px solid #11111138;*/
        }

        .AllScrapeItems td {
            /*border-bottom: 1px solid #96a2ab45 !important;*/

            border-bottom:none!important;
        }

        .Upload-Details:hover {
            content: url("Image/Upload-Gif.gif");
        }

        .verticalLine {
            border-right: 2px solid #cfcfcf85;
            height: 136px;
        }

        .grid-text-header {
            font-size: larger;
            font-family: serif;
            font-weight: bold;
        }

        .bg-Badge-Item {
            background-color: #4ee12a6e !important;
            color: #019d00 !important;
            letter-spacing: 2px;
            box-shadow: 0px 0px 3px 0px #22a501;
           
            text-align-last: center;
            font-weight: bold;
            padding-left: 5px;
            padding-right: 5px;
           
            border-radius: 5px;
        }

        thead, tbody, tfoot, tr, td, th {
            /* border-color: inherit; */
            /* border-style: solid; */
            border: none !important;
        }

        .btn-Accept {
            color: #fff;
            background-color: #4CAF50;
            border-color: #4CAF50;
            margin-right: 10px;
            /*box-shadow: 0 0.125rem 0.25rem 0 #4CAF50;*/
        }
        /***********************************************************/








    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        

         <div style="padding-left: 2%; padding-top: 1%;">
            <h5 style="color: #a92828; margin-top: 13px">SCRAP SYSTEM</h5>
        </div>
        <div class="card-body" style="margin-top: -1%;">

        <div class="ManagerStage-ddl">
            <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                <tr>

                    <td class="no-border  label-alignment" style="width: 3%">
                        <asp:Label ID="Label8" Text="Stage" runat="server" Font-Size="Medium" Font-Bold="true" />
                    </td>
                    <td class="no-border" style="width: 17%">
                        <select id="ddlStage" class="form-select color-dropdown">
                            <option value="1">QC Approved</option>
                            <option value="2">Purchased Items</option>
                            <option value="3">Scrap Items</option>
                        </select>
                    </td>
                    <td class="no-border  label-alignment" style="width: 80%"/>
                </tr>
            </table>
        </div>

       <div class="Director-ddl">
            <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="Table1">
                <tr>

                    <td class="no-border  label-alignment" style="width: 3%">
                        <asp:Label ID="Label1" Text="Stage" runat="server" Font-Size="Medium" Font-Bold="true" />
                    </td>
                    <td class="no-border" style="width: 17%">
                        <select id="ddlStageDir" class="form-select color-dropdown">
                            <option value="2">Purchased Items</option>
                            <option value="3">Scrap Items</option>
                        </select>
                    </td>
                    <td class="no-border  label-alignment" style="width: 80%"/>
                </tr>
            </table>
        </div>
        <div class="itemgridList">

            <table class="table AllScrapeItemsqc" style="width: 100%;">
                <thead>
                    <tr>
                        <th></th>
                    </tr>
                </thead>



                <tbody class="tbody-AllItemListqc">
                </tbody>
            </table>
        </div>

        </div>
        </div>
    <div class="modal fade" id="modalItemDetailsQC" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document" style="zoom:90%;"> 
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">ITEM DETAILS</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="card card-solid">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-sm-6">
                                    
                                    <div class="col-12">
                                       
                                        <div>

                                            <div class="demo">
                                                <div class="item">
                                                    <div class="clearfix" style="">
                                                        <ul id="image-gallery" class="gallery list-unstyled cS-hidden gallery-slide-view">
                                                           <%-- <li data-thumb="src/img/ff1.jpg">
                                                                <img src="src/img/ff1.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff2.jpg">
                                                                <img src="src/img/ff2.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff3.jpg">
                                                                <img src="src/img/ff3.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff4.jpg">
                                                                <img src="src/img/ff4.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff1.jpg">
                                                                <img src="src/img/ff1.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff2.jpg">
                                                                <img src="src/img/ff2.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff3.jpg">
                                                                <img src="src/img/ff3.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff4.jpg">
                                                                <img src="src/img/ff4.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff1.jpg">
                                                                <img src="src/img/ff1.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff2.jpg">
                                                                <img src="src/img/ff2.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff3.jpg">
                                                                <img src="src/img/ff3.jpg" />
                                                            </li>--%>

                                                        </ul>
                                                    </div>
                                                </div>


                                            </div>

                                            
                                        </div>
                                    </div>

                                </div>
                                <div class="col-12 col-sm-6">

                                    <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="nav-item">
                                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Items" aria-controls="tab-Items" aria-selected="true">Item Details</button>
                                            </li>
                                            <li class="nav-item section-tab">
                                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Section" aria-controls="tab-Section" aria-selected="true">Section Details</button>
                                            </li>


                                        </ul>

                                        <div class="tab-content">

                                            <div class="tab-pane fade show active" id="tab-Items" role="tabpanel">




                                                <h3 class="my-3 Item-Code"></h3>

                                                <h4>Description</h4>
                                                <p class="Item-Description"></p>

                                                <hr>

                                                <h4>Available  Quantity</h4>
                                                <div class="col-6">
                                                    <input class="form-control" type="text" value="" id="txtTotalQuantity" style="border-color: lightgrey; width: 22%;" onkeypress="return event.charCode >= 48 && event.charCode <= 57" disabled>
                                                    <br />

                                                    <h4>Reason</h4>
                                                    <p class="Item-Reason"></p>

                                                    <br />

                                                    <h4>Comment</h4>
                                                    <p class="Item-Comment"></p>


                                                </div>
                                                <div class="row item-qc-details">

                                                    <div class="col-4">
                                                        <h4>Send to Scrap</h4>
                                                        <select class="form-select" id="ddlAcceptedQuantity" aria-label="Default select example">
                                                        </select>


                                                    </div>

                                                    <div class="col-4">
                                                        <h4>Used By Me </h4>
                                                        <select class="form-select" id="ddlUsedMeQuantity" aria-label="Default select example">
                                                        </select>
                                                        <input class="form-control" type="text" value="" id="txtUsedMeQuant" style="border-color: lightgrey; width: 96%; display: none;" disabled>
                                                    </div>

                                                    <div class="col-4">
                                                        <h4>Rejected  Quantity</h4>
                                                        <input class="form-control" type="text" value="" id="txtRejectQuantity" style="border-color: lightgrey; width: 36%;" disabled>
                                                    </div>
                                                </div>

                                                <div class="row item-Market-details" style="padding-top: 1%; display: none;">

                                                    <div class="col-4">
                                                        <h4>Approved QTY</h4>
                                                        <input class="form-control" type="text" value="" id="txtApprovedQTY" style="border-color: green; color: green; width: 75%;" disabled>
                                                    </div>

                                                    <div class="col-4">
                                                        <h4>Used By QC</h4>

                                                        <input class="form-control" type="text" value="" id="txtUsedByQC" style="border-color: green; color: green; width: 75%;" disabled>
                                                    </div>

                                                    <div class="col-4">
                                                        <h4>Rejected  QTY</h4>
                                                        <input class="form-control" type="text" value="" id="txtRejectQTY" style="border-color: red; color: red; width: 75%;" disabled>
                                                    </div>

                                                    <div class="col-4 section-Name-div" style="padding-top: 1%;">
                                                        <h4>Section</h4>
                                                        <input class="form-control" type="text" value="" id="txtsectionName" style="border-color: blue; color: blue; width: 75%;" disabled>
                                                    </div>

                                                    <div class="col-4" style="padding-top: 1%;">
                                                        <h4>Purchased QTY</h4>
                                                        <input class="form-control" type="text" value="" id="txtPurchasedQTY" style="border-color: green; color: green; width: 75%;" disabled>
                                                    </div>

                                                    <div class="col-4" style="padding-top: 1%;">
                                                        <h4>Scrap QTY</h4>
                                                        <input class="form-control" type="text" value="" id="txtScrapQTY" style="border-color: red; color: red; width: 75%;" disabled>
                                                    </div>
                                                </div>

                                                <br />
                                                <div style="margin-left: 75%; margin-top: 10px; display: flex">
                                                    <button type="button" id="btnunitReqApproved" class="btn btn-Accept btn-approved">Submit</button>
                                                    <button type="button" id="btnManagerApproved" class="btn btn-Accept btn-approved">Approve</button>
                                                    <button type="button" id="btnManagerRejected" class="btn btn-Reject btn-danger">Reject</button>

                                                    <%--    <button type="button" id="btnunitReqRejected" class="btn btn-danger btn-rejected">Rejected</button>--%>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="tab-Section" role="tabpanel">
                                                <div class="row">

                                                <div class="ag-format-container">
                                                    <div class="ag-courses_box section-details">
                                                       <%-- <div class="ag-courses_item">
                                                            <a href="#" class="ag-courses-item_link">
                                                                <div class="color-bg-1"></div>

                                                                <div class="ag-courses-item_title">
                                                                    QC
                                                                </div>

                                                                <div class="ag-courses-item_date-box">
                                                                    Quantity:
          <span class="ag-courses-item_date"><select type="text" style="border:none;width: 90px;background-color: #d9d9d9;color: #ff0000;" ></select>
          </span>
                                                                </div>
                                                            </a>
                                                        </div>--%>

                                                     

                                                    </div>
                                                </div>


                                            </div>
                                                </div>
                                            

                                        </div>
                                    </div>

                                </div>

                            </div>
                            <!-- /.card-body -->
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


   <link href="Css/ScrapStyle.css?v=1.1" rel="stylesheet" />
       <script src="src/js/lightslider.js"></script>

    <link href="Css/ScrapStyle.css" rel="stylesheet" />
     <script src="Script/scrapQC.js"></script>

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />


    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>
   

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
 

    
     

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


   
    
</asp:Content>

