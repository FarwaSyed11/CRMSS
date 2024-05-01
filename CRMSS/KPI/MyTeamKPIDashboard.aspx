<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="MyTeamKPIDashboard.aspx.cs" Inherits="KPI_MyTeamKPIDashboard" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="../Template/assets/vendor/libs/apex-charts/apex-charts.css" />
    <link href="Css/kpi.css" rel="stylesheet" />

<%--   <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
    --%>
    
           <style type="text/css">
    .card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid #d9dee3;
    border-radius: 0.5rem;
    height:100%;
}
               </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>


            <div class="content-wrapper">

                <%-- filter tab --%>

                <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>


                        <%--   <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label10" Text="Organization" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                               
                          </td>--%>
                          <td class="no-border" style="width: 10%">
                              <span id="Label10" style="font-family:Times New Roman;font-size:Medium;font-weight:bold;">Organization</span>
                                  <select class="form-select placement-dropdown" id="ddlOrg" disabled> </select>   
                          </td>


<%--                          <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label1" Text="Department" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              
                          </td>--%>
                          <td class="no-border" style="width: 10%">
                              <span id="Label1" style="font-family:Times New Roman;font-size:Medium;font-weight:bold;">Department</span>
                                 <select class="form-select placement-dropdown" id="ddlDepart" disabled> </select>   
                          </td>


                         <%-- <td class="no-border  label-alignment" style="width: 8%">
                              <asp:Label ID="lblUserStatus" Text="HOD" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>--%>
                          <td class="no-border" style="width: 10%">
                              <span id="Label111" style="font-family:Times New Roman;font-size:Medium;font-weight:bold;">HOD</span>
                              <select class="form-select placement-dropdown" id="ddlHOD" disabled> </select>   
                              <%--<option value="Kamel" selected="selected">Kamel </option>--%>
                          </td>


                          <%-- <td class="no-border  label-alignment" style="width: 10%">
                              <asp:Label ID="Label11" Text="Line Manager" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>--%>
                          
                              <td class="no-border" style="width: 10%"> 
                                  <span id="Label11" style="font-family:Times New Roman;font-size:Medium;font-weight:bold;">Line Manager</span>
                              <select Id="ddlManager" class="form-select color-dropdown" >  </select>                                                 
                          </td>

                         


                         <%-- <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label8" Text="Employee" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>--%>
                          <td class="no-border" style="width: 10%">      
                               <span id="Label2" style="font-family:Times New Roman;font-size:Medium;font-weight:bold;">Employee</span>
                              <select Id="ddlEmployee" class="form-select color-dropdown" >  </select>                                                 
                          </td>



                        <%--  <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label9" Text="Year" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                          </td>--%>
                          <td class=" " style="display:none" >
                               <span id="Label999" style="font-family:Times New Roman;font-size:Medium;font-weight:bold;">Month</span>
                              <select Id="ddlMonth" class="form-select color-dropdown">  
                                  <option value="1">Jan</option>
                                  <option value="2">Feb</option>
                                  <option value="3">Mar</option>
                                  <option value="4">Apr</option>
                                  <option value="5">May</option>
                                  <option value="6">June</option>
                                  <option value="7">July</option>
                                  <option value="8">Aug</option>
                                  <option value="9">Sep</option>
                                  <option value="10">Oct</option>
                                  <option value="11">Nov</option>
                                  <option value="12">Dec</option>
                              </select> 
                           
                          </td>
                          <td class=" " style="width: 6%">
                               <span id="Label9" style="font-family:Times New Roman;font-size:Medium;font-weight:bold;">Year</span>
                              <select Id="ddlYear" class="form-select color-dropdown">  </select>                            
                          </td>
                          <td class="no-border" style="width: 5%">

                              <%--<asp:LinkButton ID="btnSearch" runat="server" Text="Search"
                                  CssClass="btn btn-primary d-block" Font-Size="Small"></i>Search</asp:LinkButton>--%>
                              <input type="button" id="btnSearchDashBoard" value="Search" class="btn btn-primary d-block" style="font-size:small; margin-top: 18%;" /> 
                          </td>
                      </tr>
                  </table>

                <%-- End filter tab --%>

                <div class="container-xxl flex-grow-1 container-p-y">

                 
                    <%-- Row for KIP --%>
                    <div class="row rowrev kpi-boxes-parent">
                     <%--   <div class="row">
                            <div class="col-3 mb-2">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="card-title d-flex align-items-start justify-content-between">
                                            
                                            <div>
                                                <h5>To ensure all assigned tickets are close </h5>
                                            </div>
                                            <div><span class="badge bg-label-info me-1">Active</span></div>
                                          
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <span class="fw-kpiname d-block mb-1">No. of Tickets Assigned</span>
                                                <h4 class="card-title mb-2 final-price-value-card">
                                                    <h3>420</h3>
                                            </div>
                                            <div class="col-md-4">
                                            </div>
                                            <div class="col-md-4">
                                                <span class="fw-kpiname d-block mb-1">No. of Closed Tickets within SLA</span>
                                                <h4 class="card-title mb-2 final-price-value-card-count">
                                                    <h3>852</h3>
                                            </div>


                                        </div>

                                        <canvas width="400" height="200" id="canvas-preview1"></canvas>                                         
                                              <h5 class="text-center">62% Completed</h5>

                                    </div>
                                </div>
                            </div>
                        </div>--%>

                    </div>

             

                </div>

                <div class="content-backdrop fade"></div>
            </div>

            <script type="text/javascript">
                var currUserId = '';   
                var EmpNo = '';
                var myrole = '';
                var overAllPerfo = 0;
                var profilpicurl;
                var loggedInUserName = '';
                $(document).ready(function () {
                    currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;               
                    EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';
                    profilpicurl = '<%=Session["EmpProPicKpi"].ToString()%>';
                    loggedInUserName = "<%=Session["EmpNameKpi"].ToString()%>";
                });

                </script>

            
    
            <script src="../assets/js/econnect-common.js"></script>
            <script src="Scripts/my-team-kpi-dashboard.js?v=2.1"></script>

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

