<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="WorkFlowDetails.aspx.cs" Inherits="FacilityManagement_WorkFlowDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
       <style type="text/css">
    
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
     .kpi-user-list-table th{
        /*background-color: #23547c;*/
         background-color: #a92828;
        color:white !important;
    }

     .WO-Root-Casuse-table{
         /*background-color: #23547c;*/
           background-color: #a92828;
        color:white !important;
        width: 100% !important;
     }
     .WO-Root-Casuse-table th{
         color:white;
     }
     .table:not(.table-dark) th {
    color:white;
}

     table.dataTable tbody tr {
    background-color: #ffffff;
    color: #697a8d;
}
      .table td{
        
        color:#333333 !important;
    }

       .kpi-user-list-table ul{
        font-size: 80%;
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
#DataTables_Table_1_paginate .current {
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
        .btn-primary {
    color: #fff;
    background-color: #c74747;
    border-color: #c74747;
    box-shadow: 0 0.125rem 0.25rem 0 rgb(255 105 105 / 40%);
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
.nav-tabs .nav-item .nav-link:hover, .nav-tabs .nav-item .nav-link:focus {
    color: #ffffff;
    background: #e14b4b;
}
.nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
   color: #ffffff;
    background: #e14b4b;
    border-color: #fff;
}
.fa-icon-hover:hover{
    transform: scale(1.3);
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%; padding-top: 1%;"><h4 style="text-shadow: 1px 6px 13px; color: #a92828;">WORKFLOW DETAILS LIST </h4></div> 

  <div class="card-body" style="margin-top: -2%;">

          <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

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
                        <td class="no-border  label-alignment" style="width: 11%">
                              <asp:Label ID="Label8" Text="Contract Status" runat="server" Font-Size="Medium" Font-Bold="true"  />
                          </td>
                          <td class="no-border" style="width: 20%">
                              <select id="ddlContractStatus" class="form-select color-dropdown">
                                  <option value="-1">--- All ---</option>
                                  <option value="Active"">Active</option>
                                  <option value="Inactive">Inactive</option>
                              </select>
                          </td>
                   
                          <td class="no-border" style="width: 5%">

                              <input type="button" id="btnSearchDashBoard" value="Search" class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>
                      </tr>
                  </table>
      </div>


      <%--  <div class="ajax-loader custom-loader hidden">
     <span class="spinner-border kpi-loader-name"  role="status" aria-hidden="true"></span><h4>Please wait...</h4>      
        </div>--%>

    <div class="" style="margin-top: 1%;">
  <table class="table table-bordered table-striped kpi-user-list-table">
    <%--<caption class="ms-4">List of Projects</caption>--%>
    <thead>
      <tr>
           <th class="hidden">WOId</th>
          <th>R W O Id</th>
        <th>Workorder</th>        
        <th>Property Name</th>
           <th>Property Type </th>
           <th>Block </th>  
         <th>Floor</th>
            <th>Room </th>
           <th>Due Date </th>  
         <th>Created Date</th>
       
          <th style="width:140px">Action </th>  
            
      

    <%--    <th style="width: 10%;">Actions</th>--%>
      </tr>
    </thead>
    <tbody class="tbody-employees">

    </tbody>
  </table>
</div>




    </div>
</div>
   


    
    <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="updateContractModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel1">Add/Update Attachment</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">



          <%--tabs--%>
          <div class="nav-align-top">
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-home" aria-controls="navs-top-home" aria-selected="true">Existing</button>
    </li>
    <li class="nav-item">
      <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-profile" aria-controls="navs-top-profile" aria-selected="false">New Attachment</button>
    </li>
  
  </ul>
  <div class="tab-content">
    <div class="tab-pane fade show active" id="navs-top-home" role="tabpanel">
      
                     <div class="" style="margin-top: 1%;">
  <table class="table table-bordered table-striped WO-Root-Casuse-table" style="width: 100%;">
    <%--<caption class="ms-4">List of Projects</caption>--%>
    <thead>
      <tr>
          <th class="hidden">WO_ROOTCAUSE_ID</th>
        <th>Workorder Root Cause</th>        
        <th >File Name</th>
           <th>Cost </th>
   <th>Due Date</th>
          <th>Action</th>
          <%--<th style="width:140px">Action </th>--%>  
            
      

    <%--    <th style="width: 10%;">Actions</th>--%>
      </tr>
    </thead>
    <tbody class="tbody-root-cause">

    </tbody>
  </table>
</div>

        <div style="margin-top: 3%;">
             <div class="input-group updateCostDiv hidden">
                                        <label class="input-group-text "><i class="fa fa-money" aria-hidden="true"></i>
                                             <span style="margin-left: 6%;">
                                                  Cost
                                             </span> 
                                             <span style="color:red;">&nbsp; *</span>
                                         </label>
                                         <input type="text" id="txtUpdateCost" placeholder="input update cost" style="background:white;" class="form-control" >
                 <span style="margin-left: 1%;"> <i class="fa fa-floppy-o btnUpdateCost"  title="Update Cost" style="color:#d33a3a; cursor:pointer;font-size: xx-large;"></i></span>
                                 </div>
        </div>
     
        <div class="hidden docImageDiv">
                <div><a href="" id="aDOcFile" style=" float: right;"><i class="fa fa-download docDownloadIcon"  title="Download File" style="color:#d33a3a; cursor:pointer;font-size: xx-large;"></i></a></div>
                <div  style=" overflow-y: auto;  max-height: 500px; text-align:center;"><img id="docImagePreview" src="" class="img-responsive" style="width:auto;height:auto;">  </div>
        </div>

</div>

    <div class="tab-pane fade" id="navs-top-profile" role="tabpanel">  <%--second --%>
       
             <div class="row">
                 <div class="col mb-3">
                     <label for="nameBasic" class="form-label">Root Cause</label>
                     <%--<input type="text" id="txtRootCause" class="form-control" runat="server" placeholder="Enter Root Cause" >--%>
    
                     <input id="txtRootCause1" class="form-control" placeholder="Enter Root Cause" />

                 </div>
             </div>

             <div class="row">
                 <div class="col mb-3">
                     <label for="nameBasic" class="form-label">Cost</label>
                     <%--<input type="text" id="txtCost" class="form-control" placeholder="Enter Amount" runat="server" onkeypress="return event.charCode >= 48 && event.charCode <= 57">--%>
                 
                     <input ID="txtCost1" Class="form-control" placeholder="Enter Amount" />
                 </div>
             </div>
        
        <div class="row g-2">

            <div class="input-group mb-3">
                <%--<input type="file" class="form-control" id="FUUploadNewAttach">--%>
                <%--<asp:FileUpload ID="FUUploadNewAttach" CssClass="form-control" runat="server"   />--%>
        
                <%--<label class="input-group-text" for="inputGroupFile02"><i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i></label>--%>
                <%--<br />--%> 
                <input class="form-control" type="file" id="suggestionfileupload"  accept=".doc,.docx,.pdf,.png,.jpeg" >
                <label class="input-group-text" for="inputGroupFile02"><i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i></label>
            </div>

            <div class="input-group hidden">
                <label class="input-group-text ">
                    <i class="fa fa-calendar" aria-hidden="true"></i>
                    <span style="margin-left: 6%;">Start Date
                    </span>
                    <span style="color: red;">&nbsp; *</span>
                </label>
                <input type="text" id="weeklyDatePickerStart" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
            </div>
            <div class="input-group">
                <label class="input-group-text ">
                    <i class="fa fa-calendar" aria-hidden="true"></i>
                    <span style="margin-left: 6%;">Due Date
                    </span>
                    <span style="color: red;">&nbsp; *</span>
                </label>
                <input type="text" id="weeklyDatePickerEnd" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
            </div>
        </div>
    
         
        <div style="margin-top: 2%;">
        <a href="#" ID="btnUpload1" Class=" btn btn-primary">Add Attachment </a> </div>      
        <%--<button type="button" class="btn btn-primary btn-Renew-Contract" id="btnAddAttach" style="width: 15%; margin-left: 84%; margin-top: 2%;" >Renew Contract</button>--%>
    </div>

  
  </div>
</div>


          <%--end--%>



    
      </div>
    <%--  <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-Renew-Contract">Renew Contract</button>
      </div>--%>
    </div>
  </div>
</div>


    <%--payment schedule--%>




    <%--end--%>







        <%--confirmation pop up for delete KPi--%>
<div class="modal fade" id="RenewalUpdateConfirmPopUp" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
     
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-check-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #4cb14f;"></i></div>
          <div><h3>Are you sure?</h3></div>
        Do you really want to Renew this contract?
      </div>
      <div class="modal-footer">
      <div style="margin-right: 38%;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
        <button type="button" class="btn btn-primary btn-renew-contract-final">Yes</button>
          </div>
      </div>
    </div>
  </div>
</div>


            <%--delete Attachment pop up--%>
<div class="modal fade" id="delAttachModal" style="background: #0009125c;" tabindex="-1" aria-labelledby="delAttachModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
     
      <div class="modal-body" style="text-align:center;">
          <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #b14c4c;"></i></div>
          <div><h3>Are you sure?</h3></div>
        Do you really want to delete this Attachment?
      </div>
      <div class="modal-footer">
      <div style="margin-right: 38%;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
        <button type="button" class="btn btn-primary btn-del-attach-yes">Yes</button>
          </div>
      </div>
    </div>
  </div>
</div>


    <asp:HiddenField ID="hfDate" runat="server"/>
    <asp:HiddenField ID="hfSelecWOBId" runat="server"/>


       <script type="text/javascript">
                var currUserId = '';   
                var EmpNo = '';
                var myrole = '';
           var overAllPerfo = 0;
           var hfldDate = '';
           var hfSelWOBId = '';
                $(document).ready(function () {
                    currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;               
                    EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';                  
                    hfldDate = $('#<%=hfDate.ClientID%>');
                     hfSelWOBId = $('#<%=hfSelecWOBId.ClientID%>');
                });

                </script>


       <script src="Datatable/js/jquery.dataTables.min.js"></script>
   <script src="Datatable/js/dataTables.buttons.min.js"></script>
    <script src="Datatable/js/jszip.min.js"></script>
    <script src="Datatable/js/pdfmake.min.js"></script>
    <script src="Datatable/js/vfs_fonts.js"></script>
    <script src="Datatable/js/buttons.html5.min.js"></script>
    <script src="Datatable/js/buttons.print.min.js"></script>
    
   
	<!-- Datatable plugin CSS file -->
    <link href="Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />


    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
	<!-- Datatable plugin CSS file -->
	<!-- Datatable plugin JS library file -->	
    <script src="Scripts/workflow-details.js?v=1.2"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

</asp:Content>


