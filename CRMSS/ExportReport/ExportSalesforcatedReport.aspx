﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="ExportSalesforcatedReport.aspx.cs" Inherits="ExportReport_ExportSalesforcatedReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

   


           <style type="text/css">
    
   
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
    width: 15%;
    padding: 10px;
}
        .loader-bg-blur{
              height: 100%;
    z-index: 9999999;
    position: fixed;
    background: #c3d3ce6b;
    width: 100%;
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
 .tablepopup th{
        background-color: #a92828;
        color:white !important;
        text-align:center;
    }
  .tablepopup td{
       
        text-align:center;
    }
   .tablepopup {
       
        width:100%;
    }
          .modal-xl {
               max-width: 1400px !important;
           }
           .btn-primary {
                   color: #fff;
    background-color: #a62b2b;
    border-color: #a62b2b;
           }
           .btn-primary:hover {
       color: #ffffff;
    background-color: #76dd4b;
    border-color: #7bdd59;
    transform: translateY(-1px);
}
      .btn-check:focus + .btn-primary, .btn-primary:focus {
       color: #ffffff;
    background-color: #76dd4b;
    border-color: #7bdd59;
    transform: translateY(-1px);
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%; padding-top: 1%;"><h4 style="text-shadow: 1px -3px 8px; color: #a92828;">Forecasted Report</h4></div> 

  <div class="card-body" style="margin-top: -2%;">

     <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

                      
                          <td class="no-border" style="width: 10%">
                               <asp:Label ID="Label3" Text="Comapny" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select id="ddlCompany" class="form-select color-dropdown">
                              </select>
                          </td>


                          <td class="no-border label-alignment" style="width: 1%"></td>
                          
                          <td class="no-border" style="width: 10%">
                              <asp:Label ID="Label4" Text="Manager" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select color-dropdown" id="ddlManager"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                         
                          <td class="no-border" style="width: 10%">
                               <asp:Label ID="Label5" Text="Team Member" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select color-dropdown" id="ddlMember"> </select>
                          </td>

                          <td class="no-border label-alignment" style="width: 1%"></td>
                        
                        <td class="no-border" style="width: 8%">
                             <asp:Label ID="Label1" Text="Quarter" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select color-dropdown" id="ddlQuarter">
                                  <option value="1">Q1 </option>
                                   <option value="2"> Q2 </option>
                                   <option value="3"> Q3 </option>
                                   <option value="4"> Q4 </option>
                              </select>
                          </td>
                           <td class="no-border label-alignment" style="width: 1%"></td>
                         
                        <td class="no-border" style="width: 8%">
                             <asp:Label ID="Label2" Text="Month" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              <select class="form-select color-dropdown" id="ddlMonth">
                                  
                              </select>
                          </td>
                   
                          <td class="no-border" style="width: 5%">
                              <input type="button" id="btnSearch" value="Search" class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>
                           <td class="no-border" style="width: 5%">
                              <input type="button" id="btnDownloadSummary" value="Export Summary" class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>
                         
                          <td class="no-border" style="width: 5%">
                              <input type="button" id="btnDownload" value="Detail Report" class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>
                      </tr>
                  </table>
      </div>


          <div class="ajax-loader loader-bg-blur">
                       <div class="custom-loader ">
            <span class="spinner-border kpi-loader-name"  role="status" aria-hidden="true"></span><h4>Generating Report...</h4>      
        </div>
                   </div>

    <div class="" style="margin-top: 1%;">
  <table class="table table-bordered table-striped kpi-user-list-table" style="font-size:10.5px;min-width:100%">
  
    <thead class="tbody-header">
  
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
           var overAllPerfo = 0;
           $(document).ready(function () {
               currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
                    EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';

                });

     </script>


     <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
     <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>

     <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>

    
     <script src="js/forcatedreport.js"></script>

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

</asp:Content>

