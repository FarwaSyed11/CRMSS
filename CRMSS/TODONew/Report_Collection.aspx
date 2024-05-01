<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="Report_Collection.aspx.cs" Inherits="Collection_Report_Collection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

       <style type="text/css">
    
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
     .kpi-user-list-table th{
        background-color: #a92828;
        color:white !important;
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
    background: #a92828 !important;
}
  .table td{
        
        color:#333333 !important;
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
.hidden{
    display:none !important;
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
.bg-label-success {
    background-color: #e8fadf !important;
    color: #48a516 !important;
    letter-spacing: 1px;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
 <div class="row" style="padding-left: 2%; padding-top: 1%;">
    
     <div class="col-2"><h4 style="text-shadow: 1px -3px 8px; color: #a92828;">Collection Report </h4> </div>
        <div class="col-2">
            <input class="form-check-input mt-0" id="cbVSup" type="checkbox" name="RemarksVerified" value="AllDay" aria-label="Checkbox for following text input">
            <span>Verified Supervisor</span>
           <%-- <br />
            <input class="form-check-input mt-0" id="cbUVSup" type="checkbox" name="RemarksVerified" value="AllDay" aria-label="Checkbox for following text input">
            <span>Un-Verified Supervisor</span>--%>
        </div>
    
         <div class="col-2">
            <input class="form-check-input mt-0" id="cbVMan" type="checkbox" name="RemarksVerified" value="AllDay" aria-label="Checkbox for following text input">
            <span>Verified Manager</span>
           <%--  <br />
             <input class="form-check-input mt-0" id="cbUVMan" type="checkbox" name="RemarksVerified" value="AllDay" aria-label="Checkbox for following text input">
            <span>Un-Verified Manager</span>--%>
        </div>

<%--       <div class="col-2">
            <input class="form-check-input mt-0" id="cbBoth" type="checkbox" name="RemarksVerified" value="AllDay" checked aria-label="Checkbox for following text input">
            <span>Both</span>
        </div>--%>

  </div>

  <div class="card-body" style="margin-top: -1%;">

     <div class="hidden">
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearchProp">
                      <tr>

                          <td class="no-border  label-alignment" style="width: 11%">
                              <asp:Label ID="Label8" Text="Property Status" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 20%">
                              <select id="ddlPropertyStatus" class="form-select color-dropdown">
                                  <option value="-1">--- All ---</option>
                                  <option value="Rented"">Rented</option>
                                  <option value="Vacant">Vacant</option>
                              </select>
                          </td>


                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 9%">
                              <asp:Label ID="Label10" Text="Property Name" runat="server" Font-Size="Medium" Font-Bold="true" />
                          </td>
                          <td class="no-border" style="width: 20%">
                              <select class="form-select placement-dropdown" id="ddlPropertiesName"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                          <td class="no-border  label-alignment" style="width: 10%">
                              <asp:Label ID="Label11" Text="Property Type" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 20%">
                              <select class="form-select placement-dropdown" id="ddlPropertType"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                        
                   
                          <td class="no-border" style="width: 5%">

                              <input type="button" id="btnSearchDashBoard1" value="Search" class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>
                      </tr>
                  </table>
      </div>

      <%--collection filters--%>
             <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
            <tr>

                <td class="no-border  label-alignment" style="width: 15%">
                    <label style="font-weight: 700; color: #1c1c1c;"> Company</label>
                     <select id="ddlCompany" class="form-select color-dropdown hidden">
                    </select>
                    
                    <select id="ddlCompanyCol" class="form-select color-dropdown"> </select>
                </td>
                
               
                <td class="no-border  label-alignment" style="width: 16%">
                    <label style="font-weight: 700; color: #1c1c1c;"> Manager</label>
                         <select class="form-select placement-dropdownc hidden" id="ddlManager"></select>
                    <select class="form-select placement-dropdown" id="ddlManagerCol"></select>
                </td>
                

                <td class="no-border  label-alignment" style="width: 16%">
                    <label style="font-weight: 700; color: #1c1c1c;"> Supervisor</label>
                    <select class="form-select placement-dropdown" id="ddlSup"></select>
                </td>
               

                <td class="no-border  label-alignment" style="width: 16%">
                    <label style="font-weight: 700; color: #1c1c1c;"> Collector</label>
                      <select class="form-select placement-dropdown" id="ddlColl"></select>
                </td>
               
                 <td class="no-border  label-alignment" style="width: 16%">
                     <label style="font-weight: 700; color: #1c1c1c;"> From</label>
                     <input type="text" id="dtFrom" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" >
                </td>

                 <td class="no-border  label-alignment" style="width: 16%">
                     <label style="font-weight: 700; color: #1c1c1c;"> To</label>
                      <input type="text" id="dtTo" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" >
                </td>

                <td class="no-border" style="width: 5%">

                    <input type="button" id="btnSearchDashBoard" value="Search" class="btn btn-primary d-block" style="font-size: small" />
                </td>
                
            </tr>
        </table>


        <div class="ajax-loader custom-loader hidden">
     <span class="spinner-border kpi-loader-name"  role="status" aria-hidden="true"></span><h4>Please wait...</h4>      
        </div>

          <div class="" style="margin-top: 1%;">
  <table class="table table-bordered table-striped kpi-user-list-table">
    <%--<caption class="ms-4">List of Projects</caption>--%>
    <thead>
      <tr>
          <th colspan="6" style="text-align:center;font-style:oblique;vertical-align:middle;font-size: x-large; background-color:#364150 !important;" rowspan="1">Credit Controller Input</th>
            <th colspan="2" style="text-align:center;font-style:oblique;vertical-align:middle;font-size: large; background-color:#2f5597 !important;" rowspan="1">Supervisor Verification</th>
            <th colspan="2" style="text-align:center;font-style:oblique;vertical-align:middle;font-size: large; background-color:#2f5597 !important;" rowspan="1">Manager Verification</th>
          <th colspan="1" style="text-align:center;font-style:oblique;vertical-align:middle;font-size: large; background-color:#2f5597 !important;" rowspan="1"></th>
         </tr>

        <tr>            
        <th>Customer Name</th>
        <th>Salesman Name</th>
        <th>Amount Collected </th>
          <th>Credit Controller Comment </th> 
           <th>Activity date </th>
           <th>Next Follow-up date </th>
      
      <th>Verified </th> 
      <th>Comment </th> 
      
      <th>Verified </th> 
      <th>Comment </th> 
      <th>Actions </th> 

    <%--    <th style="width: 10%;">Actions</th>--%>
      </tr>
    </thead>
    <tbody class="tbody-employees">

    </tbody>
  </table>
</div>


    <div class="" style="margin-top: 1%; display:none;">
  <table class="table table-bordered table-striped kpi-user-list-table1">
    <%--<caption class="ms-4">List of Projects</caption>--%>
    <thead>
      <tr>
          <th class="hidden">PropId</th>
        <th>Property Name</th>
        <th>Property Type</th>
        <th>Block </th>
          <th>Plot </th> 
           <th>Floor </th>
            <th>Room </th> 
      <th>Room type </th> 

    <%--    <th style="width: 10%;">Actions</th>--%>
      </tr>
    </thead>
    <tbody class="tbody-employees">

    </tbody>
  </table>
</div>




    </div>
</div>
   
    <%--comment module--%>
    <div class="modal fade" id="commModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lblcommModal">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
          <div class="mb-3 commentBoxEmp"> <label class="form-label" for="basic-icon-default-message">Please Add your Comment:</label>
               <div class="input-group input-group-merge">
                   <textarea id="taComment" class="form-control taComment" placeholder="Type your Comments…." aria-describedby="basic-icon-default-message2" rows="5"></textarea>
               </div>
          </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnSaveComment">Save comment</button>
      </div>
    </div>
  </div>
</div>




        <%--confirmation pop up for delete KPi--%>
<div class="modal fade" id="payStatusConfirmPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>
          <div><h3>Are you sure?</h3></div>
        Do you want to update the payment status?
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-update-paystatus">Update</button>
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
           var rolesList = '';
                $(document).ready(function () {
                    currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;               
                    EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';
                    rolesList = '<%=Session["CurrentUserRolesList"].ToString()%>';
                });

                </script>
    

     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
	<!-- Datatable plugin JS library file -->	

     <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <script src="Scripts/report-collection.js?v=1.4"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

</asp:Content>

