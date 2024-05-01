<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="ReportKPIManagerRatingByEmp.aspx.cs" Inherits="KPI_ReportKPIManagerRatingByEmp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="Css/kpi.css" rel="stylesheet" />
    <link href="Flatpickr/css/_flatpickr.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
       <style type="text/css">
    
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
     .kpi-user-list-table th{
        background-color: #a92828 !important;
        color:white !important;
    }
      .kpi-user-list-table td{
        
        color:#333333 !important;
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
            .overFlowNavKpi{
                 overflow-y: auto;
                height: 565px;
            }
            .accordion li{
                font-size: small;
            }

            .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
    background-color: #e14b4b;
    border-color: #e14b4b;
    box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%);
}
                /*Custom Menu Anwar*/
            .container{
    border-radius:3px;
    padding:5px;
    width: 60%;
    margin: 0 auto;
}

h2{
    font-weight: normal;
    font-size: 25px;
}
h2:hover{
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
    background: #d33a3a !important;
}
.custom-loader{
       text-align: center;
    top: 40%;
    left: 44%;
    position: fixed;
    z-index: 99999999;
    box-shadow: 0px 1px 7px #e14b4b;
    border-radius: 3px;
    background: white;
    width: 10%;
    padding: 10px;
}

.iconClassExcel{
    margin-left:8px;
    background:#933737;
}
.iconClassPdf{
    
    background:#933737;
}

.iconClassExcel:hover{
    
    background:#a54141;
}
.iconClassPdf:hover{
    
    background:#a54141;
}

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%; padding-top: 1%;"><h4 style="text-shadow: 1px -3px 8px; color: #a92828;">KPI RATING REVIEW REPORTS</h4></div> 

  <div class="card-body" style="margin-top: -2%;">

      <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

                         
                          <td class="no-border" style="width: 27%">
                              <asp:Label ID="Label8" Text="Organization" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select id="ddlOrg" class="form-select color-dropdown"> </select>
                          </td>


                         
                          <td class="no-border" style="width: 27%">
                              <asp:Label ID="Label10" Text="Department" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlDepart"> </select>
                          </td>

                  
                        
                          <td class="no-border" style="width: 26%">
                            <asp:Label ID="Label11" Text="Division" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlDivision"> </select>
                          </td>

                      <%--    <td class="no-border label-alignment" style="width: 10%">
                                  <asp:Label ID="Label1" Text="Employee Status" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlEmpStatus">
                                  <option value="-1">--- All ---</option>
                                  <option value="ASSIGNED PENDING">ASSIGNED PENDING</option>
                                  <option value="NOT ASSIGNED">NOT ASSIGNED</option>
                                  <option value="DRAFT">DRAFT</option>                                  
                                  <option value="SUBMITTED">SUBMITTED</option>
                              </select>
                          </td>
                        <td class="no-border label-alignment" style="width: 10%">
                                <asp:Label ID="Label2" Text="Mananger Status" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlManStatus"> 
                                  <option value="-1">--- All ---</option>
                                  <option value="PENDING">PENDING</option>
                                  <option value="APPROVED">APPROVED</option>
                                  <option value="REJECTED">REJECTED</option>
                              </select>
                          </td>--%>

                            <td class="no-border label-alignment" style="width: 10%">
                                  <asp:Label ID="Label4" Text="Month" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlMonth"> 
                                 <option value="-1">--- All ---</option>
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
                          <td class="no-border label-alignment" style="width: 10%">
                                  <asp:Label ID="Label3" Text="Year" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select placement-dropdown" id="ddlYear"> </select>
                          </td>
                   
                          <td class="no-border" style="width: 0%">
                              <input type="button" id="btnSearchDashBoard" value="Search" class="btn btn-primary d-block" style="font-size:small; margin-top:19px;" /> 
                          </td>
                      </tr>
                  </table>
      </div>


        <div class="ajax-loader custom-loader hidden">
     <span class="spinner-border kpi-loader-name"  role="status" aria-hidden="true"></span><h4>Please wait...</h4>      
        </div>

    <div class="" style="margin-top: 1%;">
  <table class="table table-bordered table-striped kpi-user-list-table">
    <%--<caption class="ms-4">List of Projects</caption>--%>
    <thead>
      <tr>
        <th>Employee Number</th>
        <th>Employee Name</th>
        <th>Department</th>
           <th>Division Name</th>
       <th>organization</th>
          <th>Year/Month</th>
          <th>Employee Review For Manager</th>
          <th>Employee Rating For Manager</th>
          <th>Manager Name</th>

        <th style="width: 10%;">Actions</th>
      </tr>
    </thead>
    <tbody class="tbody-employees">

    </tbody>
  </table>
</div>




    </div>
</div>



       <script type="text/javascript">
                var currUserId = '';   
                var EmpNo = '';
                var myrole = '';
                var overAllPerfo=0;
                $(document).ready(function () {
                    currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;               
                    EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';

                });

                </script>

	
	<meta content="initial-scale=1, maximum-scale=1,
		user-scalable=0" name="viewport" />
	<meta name="viewport" content="width=device-width" />


    	<!-- Datatable plugin CSS file -->
    <link href="Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
	<!-- Datatable plugin JS library file -->	
    <script src="Datatable/js/jquery.dataTables.min.js"></script>
    
    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>



    
    <script src="Scripts/report-kpi-Manag-rating-by-emp.js"></script>
    <script src="Flatpickr/js/flatpickr.js"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

</asp:Content>


