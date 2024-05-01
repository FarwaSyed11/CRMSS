<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="ExportSalesPerfomance.aspx.cs" Inherits="ExportReport_ExportSalesPerfomance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="css/exportreports.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%; padding-top: 1%;"><h4 style="text-shadow: 1px -3px 8px; color: #a92828;">Salesman Perfomance </h4></div> 

  <div class="card-body" style="margin-top: -2%;">

     <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

                          <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label8" Text="Company" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select id="ddlCompany" class="form-select color-dropdown">
                              </select>
                          </td>


                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 3%">
                              <asp:Label ID="Label10" Text="Manager" runat="server" Font-Size="Medium" Font-Bold="true" />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlManager"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 5%">
                              <asp:Label ID="Label11" Text="Salesman" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 12%">
                              <select class="form-select placement-dropdown" id="ddlMember"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                        
                   
                          <td class="no-border" style="width: 5%">

                              <input type="button" id="btnSearch" value="Search" class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>
                      </tr>
                  </table>
      </div>


       <div class="ajax-loader loader-bg-blur">
          <div class="custom-loader ">
              <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
              <h4>Generating Report...</h4>
          </div>
      </div>

    <div class="" style="margin-top: 1%;">
  <table class="table table-bordered table-striped sales-perfomance-table">
  
    <thead>
      <tr>
          <th colspan="11" style="height:70px;text-align:center;font-style:oblique;vertical-align:middle;font-size: xx-large;">SALES PERFOMANCE</th>
    </tr>
        <tr>
          <th rowspan="2" style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">Sales Engineer</th>
        <th colspan="4" style="height:50px;text-align:center;font-style:oblique;vertical-align:middle;font-size: x-large;background-color:gray">Sales Order</th>
        <th colspan="4" style="height:50px;text-align:center;font-style:oblique;vertical-align:middle;font-size: x-large;background-color:gray">Invoice Order</th>
        <th rowspan="2" style="width:9%;text-align:center;font-style:oblique;vertical-align:middle;background-color:green;display:none" >LOI Value</th>
        <th rowspan="2" style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">YTD Forecasted Value</th>
      </tr>
        <tr>
             <th style="width:9%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">Target</th>
            <th style="width:9%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle"> YTD Target</th>
            <th style="width:9%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">YTD Achievement</th>
              <th style="width:9%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">Achievement %</th>

            <th style="width:9%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">Target</th>
            <th style="width:9%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle"> YTD Target</th>
            <th style="width:9%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">YTD Achievement</th>
            <th style="width:9%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">Achievement %</th>
        </tr>
    </thead>
    <tbody class="tbody-salesperfomance">

    </tbody>
  </table>
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

    <script src="js/salesperfomance.js"></script>

     <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>

     <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>

     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

</asp:Content>

