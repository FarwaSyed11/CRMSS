<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="DashboardExport.aspx.cs" Inherits="Export_DashboardExport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"
     integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI="
     crossorigin=""/>


    <style>
        .card{
            box-shadow: 1px 1px 8px;
        }
        .cardfilter {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid #d9dee3;
            border-radius: 0.5rem;
            width: 97%;
            margin-left: 28px;
            margin-top: 15px;
        }

        .tblfilter {
            background-color: white;
            width: 97%;
            margin-left: 28px;
            margin-top: 14px;
            border-radius: 7px;
            margin-bottom: 0px;
        }

        .rounded {
            border-radius: 0.375rem !important;
            width: 10%;
        }

        .listoprty {
            font-weight: bold;
            font-size: xx-large;
            color: blueviolet;
        }

        ::-webkit-scrollbar {
            width: 10px;
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

        .colwidthfirst {
            width: 10.333333%
        }
         .colwidthfirstcopy {
            width: 15.333333%
        }
        .rowfisthding {
            padding-top: 10px;
        }

        .rowfirstchrt {
            padding-bottom: 10px;
        }

        .tooltipbtn {
            border: none;
            border-radius: 20%;
            height: 22px;
            width: 25px;
            float:right;
            /*margin-left: 76%;*/
        }

        /*.perfoSuccess{
           color: #12C05D;
           font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        .perfoWarning{
           color:  #F6BE00;
           font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        .perfoDanger{
            color: #a92828;
            font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }*/
        .nav-scroll-custom{
                float: left;
    overflow-y: auto;
    height: 565px;
        }
                    .nav-pills .nav-link.active, .nav-pills .nav-link.active:hover, .nav-pills .nav-link.active:focus {
    background-color: #c74747 !important;
    color: #fff;
    box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%);
}
    .map-div-position{
          position: relative;
    outline: none;
    border: groove;
    height: 512px;
        border: 3px solid #c747478c;
    /*top: 7px;
    right: 11px*/;
  }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdnUserId" runat="server" />
       <asp:HiddenField ID="hdnCompId" runat="server" />
       <asp:HiddenField ID="hdnManagerId" runat="server" />
    <asp:HiddenField ID="hdnImagePath" runat="server" />
        <asp:HiddenField ID="hdnEmpFullName" runat="server" />

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always" >
                  

        <ContentTemplate>

            
            <script type="text/javascript">
                var currUserId = '';
                var ddlYearId = '';
                var imgPath = '';
                var empName = '';
                var overAllPerfo=0;
                $(document).ready(function () {
                    currUserId = $('#<%=hdnUserId.ClientID%>');
                    ddlYearId = $('#<%=ddlOverview.ClientID%>');
                    imgPath = $('#<%=hdnImagePath.ClientID%>');
                    empName = $('#<%=hdnEmpFullName.ClientID%>');
                    rolesList = '<%=Session["CurrentUserRolesList"].ToString()%>';
                });




                </script>





               <div class="content-wrapper">
             <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

                          <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label8" Text="Organization" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <%--<asp:DropDownList ID="ddlCompany" runat="server" Font-Names="tahoma" CssClass="form-select color-dropdown" AutoPostBack="true" />--%>
                              <select id="selectTypeOpt" class="form-select color-dropdown"> </select>
                          </td>


                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label10" Text="Manager" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="selectmanager"> </select>
                              <%--<asp:DropDownList ID="ddlManager" runat="server" Font-Names="tahoma" CssClass="form-select color-dropdown" AutoPostBack="true" />--%>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label11" Text="Salesman" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <%--<asp:DropDownList ID="ddlSalesman" runat="server" Font-Names="tahoma" CssClass="form-select color-dropdown" />--%>
                              <select class="form-select placement-dropdown" id="selectsalesman">
                          </td>

                          <td class="no-border  label-alignment" style="width: 8%">
                              <asp:Label ID="lblUserStatus" Text="User Status" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <%--<label id="lblUserStatus"  Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman">User Status</label>--%>
                          </td>
                           <td class="no-border" style="width: 12%">
                              <%--<asp:DropDownList ID="ddlSalesman" runat="server" Font-Names="tahoma" CssClass="form-select color-dropdown" />--%>
                              <select class="form-select placement-dropdown" id="ddlActiveOrDeactiveUser">
                                  <option value="-1"> All </option>
                                  <option value="Active" selected="selected"> Active </option>
                                  <option value="Inactive"> In Active </option>
                          </td>
                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label9" Text="Year" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>
                          <td class=" " style="width: 12%">
                              <asp:DropDownList ID="ddlOverview" runat="server" Font-Names="tahoma" CssClass="form-select color-dropdown">
                                

                              </asp:DropDownList>
                          </td>
                          <td class="no-border" style="width: 5%">

                              <%--<asp:LinkButton ID="btnSearch" runat="server" Text="Search"
                                  CssClass="btn btn-primary d-block" Font-Size="Small"></i>Search</asp:LinkButton>--%>
                              <input type="button" id="btnSearchDashBoard" value="Search" class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>
                      </tr>
                  </table>

          
                   <%-- Filter bar End --%>

                   <div class="container-xxl flex-grow-1 container-p-y">

                       <div class="row">

                           <div class="col-12 col-lg-12 order-1">
                               <div class="card" style="height: 100%;">
                                  <div class="row">

                                   

                                      <div class="col-md-1 colwidthfirst"> 
                                          
                                         <div style="text-align: center; padding-top: 25%;" > <img src=""  id="dashboardProPic"  style="width: 60%; border-radius: 60%; "/></div>

                                      </div>

                                      <div class="col-md-2" style="padding-top: 2%;"> 
                                          <%--<h4  id="UserAdd"> </h4>--%>
                                          <h6 class="loggedin-username"></h6>
                                      </div>
                                      <div class="col-md-1 colwidthfirst" style=" text-align: center; padding-top: 1%; border-left:solid 8px #e6e6e6; border-right:solid 8px #e6e6e6; ">
                                          
                                            <button class="bg-label-primary tooltipbtn"
                                              type="button"                                             
                                              data-bs-toggle="tooltip"
                                              data-bs-offset="0,4"
                                              data-bs-placement="right"
                                              data-bs-html="true"
                                              title="<span>           
                                                   YTD-SO : 25%</br>
                                                   YTD-INV : 25%</br>
                                                   YTD-COLL : 25%</br>                                                   
                                                   Update : 25%</br>

                                                     </span>" >
                                               <i class='bx bx-question-mark'></i>
                     
                                          </button>

                                          
                                          
                                          <h4>Overall</h4>
                                          <%--<h4 style="color:dodgerblue; font-size: 48px;">4</h4>--%>
                                          <div id="growthChartCRMSOverAll" class="rowfirstchrt"></div>
                                      </div>




                                      <div class="col-md-1 colwidthfirstcopy">
                                          <div class="text-center rowfisthding">YTD-SO </div>
                                          <div id="growthChartCRMS1" class="rowfirstchrt"> </div>
                                          <h6 style="text-align:center;" id="g-chart-crms1"></h6>
                                      </div>
                                      <div class="col-md-1 colwidthfirstcopy">
                                          <div class="text-center rowfisthding">YTD-INV </div>
                                          <div id="growthChartCRMS2" class="rowfirstchrt"></div>
                                          <h6 style="text-align:center;" id="g-chart-crms2"></h6>

                                      </div>
                                      <div class="col-md-1 colwidthfirstcopy rowfisthding">
                                          <div class="text-center">YTD-COLL </div>
                                          <div id="growthChartCRMS3" class="rowfirstchrt"></div>
                                          <h6 style="text-align:center;" id="g-chart-crms3"></h6>
                                      </div>
                                     <%-- <div class="col-md-1 colwidthfirst">
                                          <div class="text-center rowfisthding">JOH Count </div>
                                          <div id="growthChartCRMS4" class="rowfirstchrt"></div>
                                          <h6 style="text-align:center;" id="g-chart-crms4"></h6>
                                      </div>
                                      <div class="col-md-1 colwidthfirst">
                                          <div class="text-center rowfisthding">Other System </div>
                                          <div id="growthChartCRMS5" class="rowfirstchrt"></div>
                                          <h6 style="text-align:center;" id="g-chart-crms5"></h6>
                                      </div>--%>
                                      <div class="col-md-1 colwidthfirstcopy">
                                          <div class="text-center rowfisthding">Update </div>
                                          <div id="growthChartCRMS6" class="rowfirstchrt"></div>
                                          <h6 style="text-align:center;" id="g-chart-crms6"></h6>
                                      </div>
                                     

                                  </div>
                               </div>
                           </div>

                        <%--   <div class="col-6 col-lg-6 order-2 ">
                               <div class="card" style="height:96%">
                                  <div class="row">

                                      <div class="col-md-4"><div id="growthChartCRMS1"></div></div>
                                        <div class="col-md-4"><div id="growthChartCRMS2"></div></div>
                                        <div class="col-md-4"><div id="growthChartCRMS3"></div></div>
                                       

                                  </div>
                               </div>
                           </div>--%>

                       </div>


         <%--               <div class="row">

                           <div class="col-6 col-lg-6 order-2 ">
                               <div class="card" style="height: 95%;">
                                  <div class="row">

                                      <div class="col-md-2"> <img src="" id="dashboardProPic" style="width: 86%; border-radius: 60%; padding-left: 4%; padding-top:9%"/></div>
                                      <div class="col-md-6" style="padding-top: 2%;"> 
                                          <h4>Hi!</h4>
                                          <h4 class="loggedin-username"></h4>
                                      </div>
                                      <div class="col-md-4" style=" text-align: center; padding-top: 3%;">
                                          <h4>Your Rank is</h4>
                                          <h1 style="color:dodgerblue; font-size: 60px;">4</h1>
                                      </div>
                                  </div>
                               </div>
                           </div>

                           <div class="col-6 col-lg-6 order-2 ">
                               <div class="card" style="height:96%">
                                  <div class="row">

                                      <div class="col-md-3"><div id="growthChartCRMS1" class="rowfirstchrt"></div></div>
                                        <div class="col-md-3"><div id="growthChartCRMS2" class="rowfirstchrt"></div></div>
                                        <div class="col-md-3"><div id="growthChartCRMS3" class="rowfirstchrt"></div></div>
                                        <div class="col-md-3"><div id="growthChartCRMS5" class="rowfirstchrt"></div></div>

                                  </div>
                               </div>
                           </div>

                       </div>--%>





                       <div class="row rowrev" >

                           <!-- Total Revenue -->
                           <%--<div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">--%>
                           

            <div class="nav-align-top card h-100 revenue-tab" style="width:49.8%; background: #ffffff;margin-bottom: 0!important;">

                            <ul class="nav nav-pills mb-3" style="top:6px;margin-bottom: 0!important;" role="tablist">
                                
                                 <li class="nav-item">
                                   <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" aria-selected="true" id="btnSototal">Total Value</button>
                                 </li>
                                 <li class="nav-item">
                                   <button type="button" class="nav-link " role="tab" data-bs-toggle="tab"  aria-selected="false" id="btnSoProductWise">Product Wise</button>
                                 </li>                        
                              
                            </ul>
            <div class="tab-content card-body tabpnlttlvalue" role="tabpanel">
                <%--style="float: left; overflow-y: hidden; height: 339px;margin-bottom: 0!important;--%>
                    
                    <div class="tab-pane fade show active" id="navs-reve-won-loss-grph" >
                     <%--   <div class="row"> 
                                <div class="col-md-8">--%>

                            <div class="col-12 col-lg-12 order-2 ">
                               <%--<div class="card">--%>
                                   <div class="row row-bordered g-0">
                                      
                                       <div class="col-md-8">
                                           <%--<h5 class="card-header m-0 me-2 pb-3 totrevtop">Total Revenue</h5>--%>
                                           <div id="totalRevenueChartCRMS" class="px-2  totrev"></div>
                                       </div>

                                       <div class="col-md-4">
                                           <div class="cardbody-wonper">
                                               <div class="text-center">
                                                   Won Percentage 
                                                 
                                               </div>
                                           </div>
                                           <div id="growthChartCRMS" class="grwtcharttop"></div>
                                           <%--<div class="text-center fw-semibold pt-3 mb-2">62% Company Growth</div>--%>

                                           <div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
                                               <div class="d-flex">
                                                   <div class="me-2">
                                                       <span class="badge bg-label-primary p-2">
                                                          <i class="fa fa-thumbs-up text-primary" style="font-size:x-large;color:#64c345 !important;"></i></span>
                                                   </div>
                                                   <div class="d-flex flex-column roundgraph-year-profit">
                                                       <small>Won</small>
                                                       <h6 class="mb-0">$32.5k</h6>
                                                   </div>
                                               </div>
                                               
                                                  <div class="d-flex">
                                                   <div class="me-2">
                                                       <span class="badge bg-label-info p-2">
                                                           <i class="fa fa-thumbs-down text-primary" style="font-size:x-large; color:#e35d5d !important;"></i> </span>
                                                   </div>
                                                   <div class="d-flex flex-column roundgraph-year-loss">
                                                       <small>Lost</small>
                                                       <h6 class="mb-0">$41.2k</h6>
                                                   </div>
                                               </div>

                                           </div>

                                          
                                       </div>
                                   </div>
                       <%--        </div>--%>
                           </div>

                         <%--       </div> 
                               
                        </div>--%>
                         
                    </div>
    
                    

               

        </div>

 </div>


                           <!--/ Total Revenue -->
                           <%--  <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">--%>
                           <div class="col-6 col-md-6 order-2">
                               <div class="row">
                                   <%--  <div class="col-6 mb-4">--%>
                                   <div class="col-6 mb-2">
                                       <div class="card">
                                           <div class="card-body">
                                               <div class="card-title d-flex align-items-start justify-content-between">
                                                   <div class="avatar flex-shrink-0">
                                                       <img src="../Dashboard/assets/img/icons/unicons/sale-forcast.png" alt="Credit Card" class="rounded" />
                                                   </div>
                                                   <div><h4> FORECAST </h4></div>
                                                   <div class="dropdown">
                                                       <button
                                                           class="btn p-0"
                                                           type="button"
                                                           id="cardOpt4"
                                                           data-bs-toggle="dropdown"
                                                           aria-haspopup="true"
                                                           aria-expanded="false">
                                                           <i class="bx bx-dots-vertical-rounded"></i>
                                                       </button>
                                                       <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt4">
                                                           <a class="dropdown-item" href="../sales/Forcasted.aspx">View More</a>
                                                           <%--<a class="dropdown-item" href="javascript:void(0);">Delete</a>--%>
                                                       </div>
                                                   </div>
                                               </div>
                                               
                                               <div class="row">
                                                   <div class="col-md-8">
                                                       <span class="d-block mb-1">Value</span>
                                               <h5 class="card-title text-nowrap mb-2 sales-forecast-value-card"><img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 60%;" /></h5>
                                                   </div>
                                                   <div class="col-md-4">
                                                       <span class="d-block mb-1">Count</span>
                                               <h5 class="card-title text-nowrap mb-2 sales-forecast-value-card-count"><img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 85px;" /></h5>
                                                   </div>
                                               </div>
                                               
                                               
                                               <%--<small class="text-danger fw-semibold"><i class="bx bx-down-arrow-alt"></i>-14.82%</small>--%>
                                           </div>
                                       </div>
                                   </div>
                <%--                   <div class="col-4 mb-2">
                                       <div class="card">
                                           <div class="card-body">
                                               <div class="card-title d-flex align-items-start justify-content-between">
                                                   <div class="avatar flex-shrink-0">
                                                       <img src="../Dashboard/assets/img/icons/unicons/finalprice.png" alt="Credit Card" class="rounded" />
                                                   </div>
                                                    <div><h4> Final Price </h4></div>
                                                   <div class="dropdown">
                                                       <button
                                                           class="btn p-0"
                                                           type="button"
                                                           id="cardOpt2"
                                                           data-bs-toggle="dropdown"
                                                           aria-haspopup="true"
                                                           aria-expanded="false">
                                                           <i class="bx bx-dots-vertical-rounded"></i>
                                                       </button>
                                                       <div class="dropdown-menu" aria-labelledby="cardOpt2">
                                                           <a class="dropdown-item" href="../Sales/FinalPriced.aspx">View More</a>
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="row">
                                                   <div class="col-md-8">
                                             <span class="fw-semibold d-block mb-1">Value</span>
                                               <h5 class="card-title mb-2 final-price-value-card"><img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 60%;" /></h5>
                                                   </div>
                                                   <div class="col-md-4">
                                                <span class="fw-semibold d-block mb-1">Count</span>
                                               <h5 class="card-title mb-2 final-price-value-card-count"><img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 85px;" /></h5>
                                                   </div>
                                               </div>
                                              
                                           </div>
                                       </div>
                                   </div>--%>

                       <%--            <div class="col-6 mb-2">
                                       <div class="card">
                                           <div class="card-body">
                                               <div class="card-title d-flex align-items-start justify-content-between">
                                                   <div class="avatar flex-shrink-0">
                                                       <img src="../Dashboard/assets/img/icons/unicons/jobnhand.png" alt="Credit Card" class="rounded" />
                                                   </div>
                                                   <div class="dropdown">
                                                       <button
                                                           class="btn p-0"
                                                           type="button"
                                                           id="cardOpt1"
                                                           data-bs-toggle="dropdown"
                                                           aria-haspopup="true"
                                                           aria-expanded="false">
                                                           <i class="bx bx-dots-vertical-rounded"></i>
                                                       </button>
                                                       <div class="dropdown-menu" aria-labelledby="cardOpt1">
                                                           <a class="dropdown-item" href="../MonthlyMeeting/Monthlymeeting.aspx">View More</a>
                                                       </div>
                                                   </div>
                                               </div>
                                               <span class="fw-semibold d-block mb-1">Number of JOH</span>
                                               <h5 class="card-title mb-2 no-joh-count"><img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 45%;" /></h5>
                                                                                            
                                           </div>
                                       </div>
                                   </div>--%>
                                   

                                          <div class="col-6 mb-2">
                                       <div class="card">
                                           <div class="card-body">
                                               <div class="card-title d-flex align-items-start justify-content-between">
                                                   <div class="avatar flex-shrink-0">
                                                       <img src="../Dashboard/assets/img/icons/unicons/jobnhand.png" alt="Credit Card" class="rounded" />
                                                   </div>
                                                   <div><h4> OPEN </h4></div>
                                                   <div class="dropdown">
                                                       <button
                                                           class="btn p-0"
                                                           type="button"
                                                           id="cardOpt1"
                                                           data-bs-toggle="dropdown"
                                                           aria-haspopup="true"
                                                           aria-expanded="false">
                                                           <i class="bx bx-dots-vertical-rounded"></i>
                                                       </button>
                                                       <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt4">
                                                           <a class="dropdown-item" href="../sales/Forcasted.aspx">View More</a>
                                                           <%--<a class="dropdown-item" href="javascript:void(0);">Delete</a>--%>
                                                       </div>
                                                   </div>
                                               </div>
                                               
                                               <div class="row">
                                                   <div class="col-md-8">
                                                       <span class="d-block mb-1">Value</span>
                                               <h5 class="card-title text-nowrap mb-2 no-joh-value"><img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 60%;" /></h5>
                                                   </div>
                                                   <div class="col-md-4">
                                                       <span class="d-block mb-1">Count</span>
                                               <h5 class="card-title text-nowrap mb-2 no-joh-count"><img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 85px;" /></h5>
                                                   </div>
                                               </div>
                                               
                                               
                                               <%--<small class="text-danger fw-semibold"><i class="bx bx-down-arrow-alt"></i>-14.82%</small>--%>
                                           </div>
                                       </div>
                                   </div>







                                    <div class="col-lg-6 col-md-12 col-6 mb-4">
                                       <div class="card">
                                           <div class="row row-bordered g-0">
                                               <div class="col-md-3">
                                                    <div class="card-body" style="padding-bottom: 60px;">
                                                       <div class="card-title d-flex align-items-start justify-content-between">
                                                           <div class="avatar flex-shrink-0">
                                                               <img
                                                                   src="../Dashboard/assets/img/icons/unicons/globe-icon.jpg"
                                                                   alt="chart success"
                                                                   class="rounded" />                                                               
                                                           </div>
                                                       </div>
                                                       <h6 style="display:flex">Country</h6>
                                                       <h6 class="card-title mb-2 no-of-finalized-count"><%--<img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 83%; margin-bottom: -34%;" />--%></h6>
                                                   </div>
                                               </div>  
                                                <div class="col-md-8 finalize-parent-height">
                                                   <div class="card-body" style="padding:0px!important">
                                                       
<%--                                                       <canvas id="Finalization" style="width: 254px; height:159px; max-width: 600px;display: block;"></canvas>--%>
                                                       <div id="Finalization"></div>
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                   </div>


                                   <div class="col-lg-6 col-md-12 col-6 mb-4">
                                       <div class="card">
                                         <div class="row row-bordered g-0">
                                               <div class="col-md-3" >
                                                   <div class="card-body" style="padding-bottom: 52px";>
                                                       <div class="card-title d-flex align-items-start justify-content-between">
                                                           <%--<div class="avatar flex-shrink-0">
                                                               <img
                                                                   src="../Dashboard/assets/img/icons/unicons/pipline.png"
                                                                   alt="chart success"
                                                                   class="rounded" />
                                                                 
                                                           </div>--%>
                                                            <div class="avatar flex-shrink-0">
                                                               <img
                                                                   src="../Dashboard/assets/img/icons/unicons/sfunel.png"
                                                                   alt="chart success"
                                                                   class="rounded" />
                                                                 
                                                           </div>
                                                           
                                                       </div>
                                                       <h5 style="display:flex">Pipeline</h5>
                                                    <h6 class="card-title mb-2 pipeline-value-card"><%--<img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 83%; margin-bottom: -34%;" />--%></h6>
                                                      
                                                   </div>
                                               </div>
                                               <div class="col-md-9 pipe-parent-height">
                                                   <div class="" style="padding-top: 0px;">
                                                       
                                                       <%--<canvas id="Pipeline" style="width: 254px; height:191px; max-width: 600px;display: block;"></canvas>--%>
                                                       <div id="Pipeline" class=""></div>
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                   </div>

                               </div> 

                           </div>

                       </div>

                       <div class="row" style="margin-top: -1.2%;">
                           <!-- Overview -->
                           <div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4" style="width:32.33%">
                               <div class="card h-100">
                                   <div class="card-header d-flex align-items-center justify-content-between pb-0">
                                       <div class="card-title mb-0">
                                           <h5 class="m-0 me-2">Overview</h5>
                                           <%--<small class="text-muted">42.82k Total Sales</small>--%>
                                       </div>
                                       <%--<div class="dropdown">
                                           <button
                                               class="btn p-0"
                                               type="button"
                                               id="orederStatistics"
                                               data-bs-toggle="dropdown"
                                               aria-haspopup="true"
                                               aria-expanded="false">
                                               <i class="bx bx-dots-vertical-rounded"></i>
                                           </button>
                                           <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orederStatistics">
                                               <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                                               <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                                               <a class="dropdown-item" href="javascript:void(0);">Share</a>
                                           </div>
                                       </div>--%>
                                   </div>
                                   <div class="card-body">
                                       <div class="d-flex justify-content-between align-items-center mb-3">
                                           <div class="d-flex flex-column align-items-center gap-1">
                                               <h2 class="mb-2 oview-joh-count" style="color: #c74747;"><img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 39%; padding-right:13%;" /></h2>
                                               <span>#JOH</span>
                                           </div>
                                           <div id="overViewChart"></div>
                                       </div>
                                       <ul class="p-0 m-0">
                                           <li class="d-flex mb-4 pb-1">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="avatar-initial bg-label-primary">
                                                       <i class='fa fa-thumbs-up' style="font-size:x-large; color:#71dd37;"></i></span>
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <h6 class="mb-0">Secured</h6>
                                                       <%--<small class="text-muted">Mobile, Earbuds, TV</small>--%>
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold ov-secured-value">Loading...</small>
                                                   </div>
                                               </div>
                                           </li>
                                           <li class="d-flex mb-4 pb-1">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="avatar-initial bg-label-success">
                                                      <i class='fa fa-registered' style="font-size:x-large; color:#ff3e1d;"></i></span>

                                                 
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <h6 class="mb-0">Under Risk</h6>
                                                       <%--<small class="text-muted">T-shirt, Jeans, Shoes</small>--%>
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold ov-underrisk-value">Loading...</small>
                                                   </div>
                                               </div>
                                           </li>
                                           <li class="d-flex mb-4 pb-1">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="avatar-initial bg-label-info">
                                                       <i class='fa fa-map-marker' style="font-size:x-large"></i></span>
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <h6 class="mb-0">Ontrack</h6>
                                                       <%--<small class="text-muted">Fine Art, Dining</small>--%>
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold ov-ontrack-value">Loading...</small>
                                                   </div>
                                               </div>
                                           </li>
                                              </li>
                                           <li class="d-flex mb-4 pb-1">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="avatar-initial bg-label-info">
                                                       <i class="fa fa-shield" style="font-size:x-large; color:#696cff"></i></span>
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <h6 class="mb-0">Early To Judge</h6>
                                                       <%--<small class="text-muted">Fine Art, Dining</small>--%>
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold ov-earlytojudge-value">Loading...</small>
                                                   </div>
                                               </div>
                                           </li>
                                            <li class="d-flex mb-4 pb-1">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="avatar-initial bg-label-success">
                                                       <i class='fa fa-thumbs-down' style="font-size:x-large; color:#ff3e1d;"></i></span>
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <h6 class="mb-0">Lost</h6>
                                                       <%--<small class="text-muted">T-shirt, Jeans, Shoes</small>--%>
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold ov-lost-value">Loading...</small>
                                                   </div>
                                               </div>
                                           </li>
                                           
                                           <li class="d-flex mb-4 pb-1">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="avatar-initial bg-label-info">
                                                        <i class="fa fa-ellipsis-h" style="font-size:x-large; color:#ffab00;"></i></span>
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <h6 class="mb-0">Other</h6>
                                                       <%--<small class="text-muted">Fine Art, Dining</small>--%>
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold ov-others-value">Loading...</small>
                                                   </div>
                                               </div>
                                           </li>
                                           
                                       </ul>
                                   </div>
                               </div>
                           </div>
                           <!--/ Order Statistics -->

                           <!-- Expense Overview -->

                           <%--<div class="col-md-6 col-lg-4 order-1 mb-4">
                               <div class="card h-100">
                                   <div class="card-header">
                                       <ul class="nav nav-pills" role="tablist">
                                           <li class="nav-item">
                                               <button
                                                   type="button"
                                                   class="nav-link active"
                                                   role="tab"
                                                   data-bs-toggle="tab"
                                                   data-bs-target="#navs-tabs-line-card-income"
                                                   aria-controls="navs-tabs-line-card-income"
                                                   aria-selected="true">
                                                   Lost by Product
                         
                                               </button>
                                           </li>
                                           <li class="nav-item">
                                               <button type="button" class="nav-link" role="tab">Lost By Competitor</button>
                                           </li>
                                           <li class="nav-item">
                                               <button type="button" class="nav-link" role="tab">Lost By Reason</button>
                                           </li>
                                       </ul>
                                   </div>
                                   <div class="card-body px-0">

                                        
                                       <div class="tab-content p-0">
                                           <div class="tab-pane fade show active" id="navs-tabs-line-card-income" role="tabpanel">
                                               <div class="d-flex p-4 pt-3">
                                                   <%--<div class="avatar flex-shrink-0 me-3">
                                                       <img src="../assets/img/icons/unicons/wallet.png" alt="User" />
                                                   </div>--%>
                                                  <%-- <div>
                                                       <small class="text-muted d-block">Total Balance</small>
                                                       <div class="d-flex align-items-center">
                                                           <h6 class="mb-0 me-1">$459.10</h6>
                                                           <small class="text-success fw-semibold">
                                                               <i class="bx bx-chevron-up"></i>
                                                               42.9%
                                                                  </small>
                                                       </div>
                                                   </div>--
                                               </div>

                                                <canvas id="myChart" style="max-width:550px;float:right"></canvas>
                                               
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>   --%>                    

                           <%--Forcasted opportunities--%>
                         <%--  <div class="col-md-6 col-lg-4 order-2 mb-4">
                               <div class="card h-100">
                                   <div class="card-header d-flex align-items-center justify-content-between">
                                       <h5 class="card-title m-0 me-2">Forecasted Opportunities </h5>
                                     <%--  <div class="dropdown">
                                           <button
                                               class="btn p-0"
                                               type="button"
                                               id="transactionID"
                                               data-bs-toggle="dropdown"
                                               aria-haspopup="true"
                                               aria-expanded="false">
                                               <i class="bx bx-dots-vertical-rounded"></i>
                                           </button>
                                           <div class="dropdown-menu dropdown-menu-end" aria-labelledby="transactionID">
                                               <a class="dropdown-item" href="javascript:void(0);">Last 28 Days</a>
                                               <a class="dropdown-item" href="javascript:void(0);">Last Month</a>
                                               <a class="dropdown-item" href="javascript:void(0);">Last Year</a>
                                           </div>
                                       </div>--
                                   </div>
                                   <div class="card-body" style="float: left; overflow-y: auto; height: 100px;">
                                       <ul class="p-0 m-0 forcasted-opportunity-ul">
                                           Loading...
                                      
                                       </ul>
                                   </div>
                               </div>
                           </div>--%>

            <div class="nav-align-top card h-100 forecast-opp-tab" style="width:33.2%; background: #ffffff;">
                            <ul class="nav nav-pills mb-3" style="top:6px;" role="tablist">
                                <li class="nav-item">
                                   <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-profile" aria-controls="navs-pills-top-profile" aria-selected="false">Previous Forecast</button>
                                 </li>
                                 <li class="nav-item">
                                   <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-home" aria-controls="navs-pills-top-home" aria-selected="true">Current Month Forecast</button>
                                 </li>                                 
                                 <li class="nav-item">
                                   <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-messages" aria-controls="navs-pills-top-messages" aria-selected="false">Future Forecast</button>
                                 </li>
                            </ul>
                <div class="tab-content card-body" style="float: left; overflow-y: auto; height: 565px;" role="tabpanel">
                    <div class="tab-pane fade show active" id="navs-pills-top-home" >
                        <div class="row"> 
                                <div class="col-md-8 ">                                                         
                                                                        
                                   <%--   <div class="row">
                                        <div class="col-md-6 curr-fcast-total-heading"><h4> </h4></div>
                                         <%--<div class="col-md-6"> <h4 class="forecast-total-value"> </h4>  </div>
                                    </div>

                                   <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="forecast-won-value" style="color:#399d39">   </h6>
                                            <h6 class="forecast-lost-value" style="color:#e35d5d">   </h6>
                                            <h6 class="forecast-nosal" style="color:#e35d5d">   </h6>
                                        </div>

                                        <div class="col-md-6">
                                             <h6 class="forecast-pipeline" style="color:#247dbd">   </h6>
                                             <h6 class="forecast-finalized" style="color:#399d39">   </h6>
                                        </div>
                                    </div>--%>
                                    

                                </div> 
                               <%-- <div class="col-md-4"><div id="forecastedOppChart"></div> </div>--%>
                        </div>
                         <ul class="p-0 m-0 forcasted-opportunity-ul"> <img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 100%; padding-top: 12%;">  </ul>
                    </div>
    
                    <div class="tab-pane fade" id="navs-pills-top-profile" role="tabpanel">
     
                        <%--  <div class="row"> 
                                <div class="col-md-8 ">

                                      <div class="row">
                                        <div class="col-md-6 prev-fcast-total-heading"><h4> </h4></div>
                                         <div class="col-md-6"> <h4 class="forecast-pending-total-value"> </h4>  </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="pending-forecast-won-value" style="color:#399d39">   </h6>
                                            <h6 class="pending-forecast-lost-value" style="color:#e35d5d">   </h6>
                                            <h6 class="pending-forecast-nosal" style="color:#e35d5d">   </h6>
                                        </div>

                                        <div class="col-md-6">
                                             <h6 class="pending-forecast-pipeline" style="color:#247dbd">   </h6>
                                             <h6 class="pending-forecast-finalized" style="color:#399d39">   </h6>
                                        </div>
                                    </div>

                                </div> 
                                <div class="col-md-4"> <div id="pendingForecastedOppChart"></div> </div>
                        </div>--%>
                          <ul class="p-0 m-0 forcasted-pending-opportunity-ul">  </ul>

                    </div>

                    <div class="tab-pane fade" id="navs-pills-top-messages" role="tabpanel">
                       
                      <%--    <div class="row"> 
                                <div class="col-md-8 ">

                                      <div class="row">
                                        <div class="col-md-6 futur-fcast-total-heading"><h4> </h4></div>
                                         <div class="col-md-6"> <h4 class="forecast-futur-total-value"> </h4>  </div>
                                    </div>

                                  <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="futur-forecast-won-value" style="color:#399d39">   </h6>
                                            <h6 class="futur-forecast-lost-value" style="color:#e35d5d">   </h6>
                                            <h6 class="futur-forecast-nosal" style="color:#e35d5d">   </h6>
                                        </div>

                                        <div class="col-md-6">
                                             <h6 class="futur-forecast-pipeline" style="color:#247dbd">   </h6>
                                             <h6 class="futur-forecast-finalized" style="color:#399d39">   </h6>
                                        </div>
                                    </div>

                                </div> 
                                <div class="col-md-4"> <div id="futureForecastedOppChart"></div> </div>
                        </div>--%>
                          <ul class="p-0 m-0 forcasted-futur-opportunity-ul">  </ul>

                   </div>

                </div>

                </div>

                  <%-- Opportunities top 50 tender and joh --%>


                <div class="nav-align-top card h-100" style="width:33%; background: #ffffff; margin-left: .7%;">
                            <ul class="nav nav-pills mb-3" role="tablist" style="margin-top: 1%;">
                              <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-t50-opp" aria-controls="navs-t50-opp" aria-selected="true">Top 50</button>
                              </li>
                              <li class="nav-item">
                                <button type="button" class="nav-link active map-class" role="tab" data-bs-toggle="tab" data-bs-target="#navs-t50-tender" aria-controls="navs-t50-tender" aria-selected="false">Map View</button>
                              </li>
                            </ul>

                         <div class="tab-content nav-scroll-custom" >
                            
                             <div class="tab-pane fade " id="navs-t50-opp" role="tabpanel">
                                 
                               <%--<div class="card h-100">--%>
                                  
                                   <div class="card-body" >
                                       <ul class="p-0 m-0 top-opportunity-ul">
                                           <img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                      
                                       </ul>
                                   </div>
                             <%--  </div>--%>
                          </div>


                              <div class="tab-pane fade show active" id="navs-t50-tender" role="tabpanel">
                               <div id='mapSarathe' class="map-div-position"></div>
                               <%--    <div class="card-body" >--%>
                                     <%--  <ul class="p-0 m-0 top-opportunity-tender-ul">
                                           <img src="line-loader.gif" style="width: 100%;">
                                           <img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                      
                                       </ul>--%>
                                       <%--<div id='mapSarathe1' class="map-div-position"></div>--%>
                                   <%--</div>--%>

                              </div>
                            
                        </div>
                </div>

   
                       </div>

                   </div>
                  
                   <div class="content-backdrop fade"></div>
               </div>

            

                <%--for map--%>
 <!-- Make sure you put this AFTER Leaflet's CSS -->
 <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
     integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM="
     crossorigin=""></script>

         <script src="https://cdn.jsdelivr.net/npm/d3-format@3"></script>
     <script src="../Dashboard/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="../Dashboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="../Dashboard/assets/js/main.js"></script>
    <!-- Page JS -->
    <script src="../Dashboard/assets/js/dashboards-analytics.js"></script>
    
            <script src="Scripts/dashboard-export.js?v1.4"></script>
    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <!-- Place this tag in your head or just before your close body tag. -->
    <!-- For  -->
  
  
           </ContentTemplate>
    </asp:UpdatePanel>
               
</asp:Content>



