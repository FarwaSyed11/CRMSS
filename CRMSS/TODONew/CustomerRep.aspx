<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="CustomerRep.aspx.cs" Inherits="TODONew_CustomerRep" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>


       <style type="text/css">
    
    /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
    .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
   
    background-color: #c1c1c1 !important;
   
}
      .maindata-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

             .maindata-list-table td
        {
              border-bottom: 1px solid #96a2ab45  !important;

        }
      .Customer-List th{
        background-color: #a92828;
        color:white !important;
    }
      .OPT-List th{
        background-color: #a92828;
        color:white !important;
    }
       .Revenue-List th{
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
    box-shadow: 2px 2px 17px #e14b4b;
    border-radius: 20px;
    background: white;
    width: 10%;
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
        .label-custom {
            color: #d4432c !important;
            font-weight: 500 !important;
            text-transform: capitalize;
            /*padding-top: 3px;*/
        }
       
        hr {
    margin: 1rem 0;
    color: #565656;
    background-color: currentColor;
    border: 0;
    opacity: 1;
}
           .bx-search:hover {
               zoom: 1.4;
           }
           .Verified:hover,.Duplicated:hover {
                zoom: 1.3;
           }

           .tbody-CutomerList tr:hover{
               cursor:pointer;
               --bs-table-accent-bg: cadetblue !important
               
           }
           .tbody-OPTLIST tr:hover{
               cursor:pointer;
               --bs-table-accent-bg: cadetblue !important
               
           }
           .tbody-RevenueList tr:hover{
               cursor:pointer;
               --bs-table-accent-bg: cadetblue !important
               
           }
           .form-control,.form-select  {
                   border: 1px solid #b2b3b4;
           }

  @import url('https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400&display=swap');
.design-section {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: #ebe5e4;
  min-height: 100vh;
  padding: 100px 0;
  font-family: Jost;
}

.design {
  display: flex;
  align-items: center;
  justify-content: center;
}

.timeline {
  width: 80%;
  height: auto;
  max-width: 800px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
}

.timeline-content {
  padding: 20px;
  background: #ffffff;
  -webkit-box-shadow: 5px 5px 10px #1a1a1a, -5px -5px 10px #242424;
          box-shadow: 5px 5px 10px #1a1a1a, -5px -5px 10px #242424;
  border-radius: 5px;
  color: white;
  padding: 1.75rem;
  transition: 0.4s ease;
  overflow-wrap: break-word !important;
  margin: 1rem;
  margin-bottom: 20px;
  border-radius: 6px;
}

.timeline-component {
  margin: 0px 20px 20px 20px;
}

@media screen and (min-width: 768px) {
  .timeline {
    display: grid;
    grid-template-columns: 1fr 3px 1fr;
  }
  .timeline-middle {
    position: relative;
    background-image: linear-gradient(45deg, #F27121, #E94057, #8A2387);
    width: 3px;
    height: 100%;
  }
  .main-middle {
    opacity: 0;
  }
  .timeline-circle {
    position: absolute;
    top: 0;
    left: 50%;
    width: 15px;
    height: 15px;
    border-radius: 50%;
    background-image: linear-gradient(45deg, #F27121, #E94057, #8A2387);
    -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
  }
}
           .fa-icon-hover:hover {
           zoom:1.2;
           }

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%;padding-right: 2%; padding-top: 1%;"><h4 id="RequestHeader" style="text-shadow: 1px -3px 8px; color: #a92828;float: left;">Department Customer Rep</h4>
              <a href="#" id="btnAddnew" class="btn btn-primary" style="float: right;"><i class="fa fa-add" aria-hidden="true"></i>&nbsp;Add New</a>

       </div> 
     
         
          
                   
             
                    
  <div class="card-body" >

     <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

                              <td class="no-border" style="width: 5%">
                                 <asp:Label ID="Label1" Text="Department" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                </td>
                         
                          <td class="no-border" style="width: 18%">
                                
                              <select id="ddlDept" class="form-select color-dropdown">
                              </select>
                          </td>
                   
                             <td class="no-border"></td>
                           
                      </tr>
                  </table>
      </div>


       <div class="ajax-loader loader-bg-blur">
          <div class="custom-loader ">
              <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
              <h4>Loading Data...</h4>
          </div>
      </div>

    <div class="" style="margin-top: 1%;">
  <table class="table table-bordered table-striped maindata-list-table">
  
    <thead>
     <tr style="height:50px">
         <th class="hidden" style="width:20%;text-align:center;vertical-align:middle">ID</th>
         <th style="width:20%;text-align:center;vertical-align:middle">Department</th>
         <th style="width:20%;text-align:center;vertical-align:middle">Customer Rep Empno</th>
         <th style="width:20%;text-align:center;vertical-align:middle">Customer Rep Name</th>
            <th  style="width:10%;text-align:center;vertical-align:middle">Status</th>
          <th  style="width:10%;text-align:center;vertical-align:middle">Created By</th>
          <th style="width:10%;text-align:center;vertical-align:middle">Created Date</th>
         <th style="width:10%;text-align:center;vertical-align:middle">Action</th>
           
        </tr>
    </thead>
    <tbody class="tbody-maindata">

    </tbody>
  </table>
</div>




    </div>
</div>



    
    <div class="modal fade" id="addType" data-bs-backdrop="static" style="background-color:#00000070;" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" >Create New Type</h5>
        <button type="button" class="btn-close btn-close-task-modal" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body proj-popup">
       
     
          <div class="row">
              <div class="col-4">
                   <label for="html5-number-input" class="col-form-label label-custom">Type <span style="color: red;">*</span></label>
                   <div class="">
                       <input class="form-control" type="text" value="" id="txtType" placeholder="Enter Type" style="border-color: lightgrey;">
                   </div>
              </div>
              <div class="col-5">
                   <label for="html5-number-input" class="col-form-label label-custom">Descripn <span style="color: red;">*</span></label>
                   <div class="">
                       <input class="form-control" type="text" value="" id="txtDescrion"  style="border-color: lightgrey;">
                   </div>
              </div>
               <div class="col-3">
                   <label for="html5-number-input" class="col-form-label label-custom">Required Day<span style="color: red;">*</span></label>
                   <div class="">
                       <input class="form-control" type="number" value="" id="txtTime"  style="border-color: lightgrey;">
                   </div>
              </div>
          </div>

          

       
      <div class="modal-footer" style="display:block;">
        <button type="button" class="btn btn-primary btnAddType" style="float:right">Save</button>
      </div>
    </div>
        </div>
      </div>
 
</div>

    <%--END--%>





     <asp:HiddenField ID="hfServerMapPth" runat="server" />
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
                 
                });

       </script>
    

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

    <script src="Scripts/CompanyTaskType.js?v=1.3"></script>
    <script src="Scripts/task-main-ticket.js?v=1.3"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


       <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

   <%--   <script src="Asset/css/netliva_switch.css"></script>
      <script src="Asset/js/netliva_switch.js"></script>--%>
    <script src="../Calendar/plugins/jquery-ui/jquery-ui.js"></script>
   
    <link href="Asset/css/jquery.timeline.css" rel="stylesheet" />
    <script src="Asset/js/jquery.timeline.js"></script>

</asp:Content>