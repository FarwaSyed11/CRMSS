<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="ScrapMarket.aspx.cs" Inherits="ScrapSystem_ScrapMarket" %>

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

        .btn-addtoCart {
            color: #fff;
            background-color: #2196F3;
            border-color: #2196F3;
            float: right;
        }

        .card-body {
            flex: 1 1 auto;
            padding: .5rem .5rem !important;
        }

         .btn-Accept {
            color: #fff;
            background-color: #4CAF50;
            border-color: #4CAF50;
            margin-right: 10px;
            /*box-shadow: 0 0.125rem 0.25rem 0 #4CAF50;*/
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <%-- <div style="padding-left: 2%; padding-top: 1%;">
            <h5 style="color: #a92828; margin-top: 13px">SCRAP SYSTEM</h5>
        </div>--%>

       
        <%--<div class="row"> 
                <div class="col-2">
                  <div class="card h-100">
                    <img class="card-img-top" src="Image/fire-equipment-inspection-1024x605.jpg" alt="Card image cap" />
                    <div class="card-body">
                      <h5 class="card-title txtCenter">Item Code &nbsp 3257673</h5>
                        <h5 class="card-title itmavl">QTY &nbsp 12</h5>
                      <p class="card-text">
                        Some quick example text to build on the card title and make up the bulk of the card's content.
                      </p>
                     
                    </div>
                  </div>
                </div>

                


               <div class="col-2">
                  <div class="card h-100">
                    <img class="card-img-top" src="Image/img_nature_wide.jpg" alt="Card image cap" />
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">
                        Some quick example text to build on the card title and make up the bulk of the card's content.
                      </p>
                    
                    </div>
                  </div>
                </div>
          
              <div class="col-2">
                  <div class="card h-100">
                    <img class="card-img-top" src="Image/img_mountains_wide.jpg" alt="Card image cap" />
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">
                        Some quick example text to build on the card title and make up the bulk of the card's content.
                      </p>
                   
                    </div>
                  </div>
                </div>
             <div class="col-2">  
                  <div class="card h-100">
                    <img class="card-img-top" src="Image/fire-equipment-inspection-1024x605.jpg" alt="Card image cap" />
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">
                        Some quick example text to build on the card title and make up the bulk of the card's content.
                      </p>
                     
                    </div>
                  </div>
                </div>
             <div class="col-2">
                  <div class="card h-100">
                    <img class="card-img-top" src="Image/img_mountains_wide.jpg" alt="Card image cap" />
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">
                        Some quick example text to build on the card title and make up the bulk of the card's content.
                      </p>
                    
                    </div>
                  </div>
                </div>

             <div class="col-2">
                  <div class="card h-100">
                    <img class="card-img-top" src="Image/img_nature_wide.jpg" alt="Card image cap" />
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">
                        Some quick example text to build on the card title and make up the bulk of the card's content.
                      </p>
                     
                    </div>
                  </div>
                </div>
            
              </div>--%>
        <div class="itemgridList">



            <table class="table AllScrapeItems" style="width: 100%;">
                <thead>
                    <tr>
                        <th></th>
<th></th>
<th></th>
<th></th>
<th></th>
<th></th>
<th></th>

                        
                    </tr>
                </thead>



                <tbody class="tbody-AllItemList">
                </tbody>
            </table>
        </div>

        </div>
 
        <%-- Modal product view --%>

        <div class="modal fade" id="modalItemDetails" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
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
                                    <%--<h3 class="d-inline-block d-sm-none">LOWA Men’s Renegade</h3>--%>
                                    <div class="col-12">
                                        <%--<img src="../../dist/img/prod-1.jpg" class="product-image" alt="Product Image">--%>
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
                                    <h3 class="my-3 Item-Code"></h3>

                                    <h4>Description</h4>
                                    <p class="Item-Description"></p>

                                    <hr>

                                    <h4>Quantity</h4>
                                    <div class="col-6">
                                        <div class="row">
                                            <div style="width:10%;">
                                       <image src="Image/remove.png" style="width:40px;" id="btnMinus">
                                                </div>
                                            <div style="width:20%;margin-right:-4%;">
                                       <input class="form-control" type="text" value="" id="txtTotalQuantity" style="border-color: lightgrey;width:100%;"/>
                                                </div>
                                            <div style="width:10%;">
                                       <image src="Image/plus-symbol.png" style="width:40px;" id="btnPlus">
                                                </div>
                                             <div style="width:10%;">
                                       <image src="Image/slash.png" style="width:40px;">
                                                </div>

                                            <div style="width:20%;">
                                       <label type="text" value="" id="txtOutOfQuant" style="font-size: 26px;font-weight: bold;"/>
                                                </div>

                                             <div style="width:30%;margin-right:-4%;padding-top: 2%;">
                                       <label style="display:none;color:red;font-weight: bold;" id="lblStockQuant">Out of Stock</label>
                                                </div>
                                        </div>
                                        <br />

                                        <h4>Reason</h4>
                                        <p class="Item-Reason"></p>

                                        <br />

                                        <h4>Comment</h4>
                                        <p class="Item-Comment"></p>


                                    </div>

                                

                                </div>


                            </div>
                            <div style="margin-left: 80%; margin-top: 10px; display: flex">
                                        <button type="button" id="btnunitReqGet" class="btn btn-Accept btn-Get"><i class="fa fa-check" style="font-size: larger;"></i>&nbsp;Get</button> &nbsp;&nbsp;

                                        <button type="button" id="btnunitNotInterest" class="btn btn-danger btn-Not Interest"><i class="fa fa-close" style="font-size: larger;"></i>&nbsp;Not Interested</button>

                                    </div>
                            <!-- /.card-body -->
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

        <%-- End --%>

     <script>
         $(document).ready(function () {
            
         });
    </script>

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

    <script src="Script/scrapMarket.js?v=1.1"></script>
    <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>--%>


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

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
         
    <link href="Css/Style.css" rel="stylesheet" />
    
    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

</asp:Content>

