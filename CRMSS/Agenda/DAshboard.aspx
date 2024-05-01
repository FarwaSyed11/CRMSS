<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="DAshboard.aspx.cs" Inherits="Agenda_DAshboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="../Template/assets/vendor/libs/apex-charts/apex-charts.css" />
   
    <link href="CSS/dashboard.css" rel="stylesheet" />
    <link href="assets/fullcalendar/main.css" rel="stylesheet" />

 <style type="text/css">
    
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
     #fullcalendar th{
        background-color: #50585e;
        color:white !important;
    }
     i:not(i.fa-eye) {
    color: #607387;
}

                   .nav-pills .nav-link.active, .nav-pills .nav-link.active:hover, .nav-pills .nav-link.active:focus {
    background-color: #c74747 !important;
    color: #fff;
    box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%);
}
                   .btn-primary {
    color: #fff;
    background-color: #c74747 !important;
    border-color: #c74747 !important;
    box-shadow: 0 0.125rem 0.25rem 0 rgb(105 108 255 / 40%);
}
      </style>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:HiddenField ID="hdnUserId" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>

             <script type="text/javascript">
                 var currUserId = '';
                 var EmpNo ='';

                $(document).ready(function () {
                    currUserId = $('#<%=hdnUserId.ClientID%>');
                    EmpNo = '<%= Session["EmpNo"] %>';
                    var overAllPerfo=0;


                });

        
            </script>

            <%--<div id='fullcalendar'></div>--%>
            <div class="content-wrapper">

                <%-- filter tab --%>

                <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>


                      <%--     <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label10" Text="Organization" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <asp:DropDownList ID="DropDownList1" runat="server" Font-Names="tahoma" CssClass="form-select color-dropdown">
                              </asp:DropDownList>
                          </td>


                          <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label1" Text="Department" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <asp:DropDownList ID="DropDownList2" runat="server" Font-Names="tahoma" CssClass="form-select color-dropdown">

                                  <asp:ListItem Text="IT" Value="IT"></asp:ListItem>
                                  <asp:ListItem Text="Sales" Value="Sales"></asp:ListItem>
                                  <asp:ListItem Text="CRM" Value="CRM"></asp:ListItem>
                              </asp:DropDownList>
                          </td>


                          <td class="no-border  label-alignment" style="width: 8%">
                              <asp:Label ID="lblUserStatus" Text="HOD" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlActiveOrDeactiveUser">
                              <option value="Kamel" selected="selected">Kamel </option>
                          </td>


                           <td class="no-border  label-alignment" style="width: 10%">
                              <asp:Label ID="Label11" Text="Line Manager" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <asp:DropDownList ID="DDLDepartment" runat="server" Font-Names="tahoma" CssClass="form-select color-dropdown">
                                  <asp:ListItem Text="Ibrahem Tawfiq Quriq" Value="Ibrahem Tawfiq Quriq"></asp:ListItem>
                                  <asp:ListItem Text="Abhi Viswam" Value="Abhi Viswam"></asp:ListItem>
                                  <asp:ListItem Text="Mohannad Hennawi" Value="Mohannad Hennawi"></asp:ListItem>
                              </asp:DropDownList>
                          </td>--%>

                          
                           <td class="no-border  label-alignment" style="width: 19%; background-color:#5355a9">
                              <%--<asp:Label ID="Label11" Text="MONDAY, 14 NOVEMBER 2022" runat="server" CssClass="month-hedng" />--%>
                               <label id="lblCurrentDate" class="lblCurrentDate month-hedng"></label>
                          </td>

                          <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label8" Text="Month" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>
                          <td class="no-border" style="width: 12%">   
                              <select id="DDLEmployee" class="form-select color-dropdown">
                                  <option value="1" >January</option>
                                  <option value="2" >February</option>
                                  <option value="3" >March</option>
                                  <option value="4" >April</option>
                                  <option value="5" >May</option>
                                  <option value="6" >June</option>
                                  <option value="7" >July</option>
                                  <option value="8" >August</option>
                                  <option value="9" >September</option>
                                  <option value="10" >October</option>
                                  <option value="11" >November</option>
                                  <option value="12" >December</option>

                              </select>

                                     
                          </td>



                          <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label9" Text="Year" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>
                          <td class=" " style="width: 12%">
                                <select id="DDLYear" class="form-select color-dropdown">   </select>
                          </td>
                          <td class="no-border" style="width: 5%">

                           
                              <input type="button" id="btnSearchDashBoard" value="Search" class="btn btn-primary d-block" style="font-size:small;"/> 
                          </td>
                      </tr>
                  </table>

                <%-- End filter tab --%>

                <div class="container-xxl flex-grow-1 container-p-y">

                    <div class="row">

                        <div class="col-12 col-lg-12 order-1">
                            <div class="card" style="height: 100%;">

                                <div class="row">

                                     <div class="col-md-1 colwidthfirst"> 
                                          
                                         <div style="text-align: center; padding-top: 25%;" > <img src=""  id="dashboardProPic"  style="width: 60%; border-radius: 60%; "/></div>

                                      </div>

                                      <div class="col-md-2" style="padding-top: 2%;"> 
                                         
                                          <h4 class="loggedin-username"></h4>
                                      </div>


                               <%--     <div class="col-md-1 colwidthfirst">

                                        <div style="text-align: center; padding-top: 25%;">
                                            <img src="../Dashboard/assets/img/avatars/5.png" id="dashboardProPic" style="width: 60%; border-radius: 60%;" /></div>

                                    </div>

                                    <div class="col-md-2" style="padding-top: 2%;">
                                         <h5 class="loggedin-username"> Good Morning..</h5> <br />
                                        <h4 class="loggedin-username"> &nbsp&nbsp ABDUL NAVAS</h4> <br />
                                           <h5>" Your overall performance is not up to standards; we urge you to generate an effective recovery plan  to drastically improve your % Efficiency"</h5>
                                       
                                    </div>--%>
                                    <div class="col-md-2" style="text-align: center; padding-top: 1%; border-left: solid 8px #e6e6e6; border-right: solid 8px #e6e6e6;">


                                        <h4>Overall Perfomance</h4>

                                        <div id="growthChartOverAll"></div>
                                        <div class="text-center fw-semibold pt-3 mb-2">% - Current Month</div>

                                    </div>

                                    <div class="col-md-6">
                                        <div class="text-center rowfisthding"> Efficency's Of The Month  </div>
                                        <div id="MonthlyEfficency" class="px-2  totrev"></div>

                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                    <%-- Row for List Items --%>


                    <div class="row" style="margin-top: .8%; margin-left: 0%;">
                           <!-- Overview -->

                          <div class="nav-align-top card h-100 overview-tab" style="width:32.2%; background: #ffffff;">
                            <ul class="nav nav-pills mb-3" style="top:6px;" role="tablist">
                                <li class="nav-item">
                                   <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-profilee" aria-controls="navs-pills-top-profilee" aria-selected="false">Completed Task</button>
                                 </li>
                                 <li class="nav-item">
                                   <button type="button" class="nav-link " role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-homee" aria-controls="navs-pills-top-homee" aria-selected="true">Transfered Task</button>
                                 </li>                                 
                              
                            </ul>
                <div class="tab-content card-body" style="float: left; overflow-y: auto !important; height: 510px;" role="tabpanel">
                    <div class="tab-pane fade show active" id="navs-pills-top-profilee" >
                        <div class="row"> 
                                <div class="col-md-8 ">                                                         
                                                                        
                                     <div class="row">
                                        <%--<div class="col-md-6"><h4>Total Value </h4></div>--%>
                                         <div class="col-md-6"> <h4 class="forecast-total-value"> </h4>  </div>
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
                                    </div>
                                    

                                </div> 
                                <div class="col-md-4"><div id="forecastedOppChartt"></div> <%--<div id="forecastedOppChart"></div>--%> </div>
                        </div>
                         <ul class="p-0 m-0 comp-task-ul"> <img src="assets/img/icons/unicons/line-loader.gif" style="width: 100%; padding-top: 12%;">  </ul>
                    </div>
    
                    <div class="tab-pane fade" id="navs-pills-top-homee" role="tabpanel">
     
                          <div class="row"> 
                                <div class="col-md-8 ">

                                      <div class="row">
                                        <%--<div class="col-md-6"><h4>Total Value </h4></div>--%>
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
                                <div class="col-md-4"> <div id="pendingForecastedOppChartt"></div> </div>
                        </div>
                          <ul class="p-0 m-0 trans-task-ul">  </ul>

                    </div>           

                </div>

                </div>
                <%--           <div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
                               <div class="card h-100">
                                   <div class="card-header d-flex align-items-center justify-content-between pb-0">
                                       <div class="card-title mb-0">
                                           <h5 class="m-0 me-2">Task OverView</h5>
                                           
                                       </div>
                                      
                                   </div>
                                   <div class="card-body">
                                       <div class="d-flex justify-content-between align-items-center mb-3">
                                           <div class="d-flex flex-column align-items-center gap-1">
                                               <h2 class="mb-2 oview-joh-count"></h2>
                                               
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
                                                       <h6 class="mb-0">Completed Tasks</h6>
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
                                                       <h6 class="mb-0">Transfered Tasks</h6>
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold ov-underrisk-value">Loading...</small>
                                                   </div>
                                               </div>
                                           </li>
                                        
                                              </li>
                                         
                                            <li class="d-flex mb-4 pb-1">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="avatar-initial bg-label-success">
                                                       <i class='fa fa-thumbs-down' style="font-size:x-large; color:#ff3e1d;"></i></span>
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <h6 class="mb-0">Pending Tasks</h6>
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold ov-lost-value">Loading...</small>
                                                   </div>
                                               </div>
                                           </li>
                                           
                                  
                                           
                                       </ul>
                                   </div>
                               </div>
                           </div>--%>
                           <!--/ Order Statistics -->

                      
            <div class="nav-align-top card h-100 forecast-opp-tab" style="width:33.2%; background: #ffffff; margin-left:1%;">
                            <ul class="nav nav-pills mb-3" style="top:6px;" role="tablist">
                                <li class="nav-item">
                                   <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-profile" aria-controls="navs-pills-top-profile" aria-selected="false">Previous Task</button>
                                 </li>
                                 <li class="nav-item">
                                   <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-home" aria-controls="navs-pills-top-home" aria-selected="true">Todays Task</button>
                                 </li>                                 
                                 <li class="nav-item">
                                   <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-messages" aria-controls="navs-pills-top-messages" aria-selected="false">Future Task</button>
                                 </li>
                            </ul>
                <div class="tab-content card-body" style="float: left; overflow-y: auto !important; height: 510px;" role="tabpanel">
                    <div class="tab-pane fade show active" id="navs-pills-top-home" >
                        <div class="row"> 
                                <div class="col-md-8 ">                                                         
                                                                        
                                     <div class="row">
                                        <%--<div class="col-md-6"><h4>Total Value </h4></div>--%>
                                         <div class="col-md-6"> <h4 class="forecast-total-value"> </h4>  </div>
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
                                    </div>
                                    

                                </div> 
                                <div class="col-md-4"><div id="forecastedOppChart"></div> <%--<div id="forecastedOppChart"></div>--%> </div>
                        </div>
                         <ul class="p-0 m-0 forcasted-opportunity-ul"> <img src="assets/img/icons/unicons/line-loader.gif" style="width: 100%; padding-top: 12%;">  </ul>
                    </div>
    
                    <div class="tab-pane fade" id="navs-pills-top-profile" role="tabpanel">
     
                          <div class="row"> 
                                <div class="col-md-8 ">

                                      <div class="row">
                                        <%--<div class="col-md-6"><h4>Total Value </h4></div>--%>
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
                        </div>
                          <ul class="p-0 m-0 forcasted-pending-opportunity-ul">  </ul>

                    </div>

                    <div class="tab-pane fade" id="navs-pills-top-messages" role="tabpanel">
                       
                          <div class="row"> 
                                <div class="col-md-8 ">

                                      <div class="row">
                                        <%--<div class="col-md-6"><h4>Total Value </h4></div>--%>
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
                        </div>
                          <ul class="p-0 m-0 forcasted-futur-opportunity-ul">  </ul>

                   </div>

                </div>

                </div>

                  <%-- Opportunities --%>


                           <div class="col-md-6 col-lg-4 order-2 mb-4">
                               <div class="card h-100">                                  
                                   <div>
                                       <div id='fullcalendar'></div>
                                   </div>
                               
                               </div>
                           </div>
                       </div>


                </div>

                <div class="content-backdrop fade"></div>
            </div>

           
            <script src="assets/fullcalendar/main.js"></script>

            <script src="js/dashboard.js"></script>
            <script src="../Template/assets/vendor/libs/gauge/dist/gauge.js"></script>          
            <script src="https://cdn.jsdelivr.net/npm/d3-format@3"></script>
            <script src="../Template/assets/vendor/js/menu.js"></script>          
            <script src="../Template/assets/vendor/libs/apex-charts/apexcharts.js"></script>
            <script src="../Template/assets/js/main.js"></script>           
            <script async defer src="https://buttons.github.io/buttons.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>           
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

