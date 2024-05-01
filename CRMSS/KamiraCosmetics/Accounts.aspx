<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="Accounts.aspx.cs" Inherits="KamiraCosmetics_Accounts" %>



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
     .kpi-user-list-table th{
        background-color: #a92828;
        color:white !important;
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
           .fa-icon-hover:hover {
           transform:scale(1.3);
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

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%;padding-right: 2%; padding-top: 1%;"><h4 id="Header" style="text-shadow: 1px -3px 8px; color: #a92828;float: left;">Customers</h4>
             
            <a href="#" id="btnAddNew" class="btn btn-primary" style="float: right;"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</a>
       </div> 
     
         
          
                   
             
                    
  <div class="card-body" >

     <div>
           <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                      <tr>

                              <td class="no-border" style="width: 5%">
                                 <asp:Label ID="Label1" Text="Owner" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                </td>
                         
                          <td class="no-border" style="width: 18%">
                                
                              <select id="ddlOwner" class="form-select color-dropdown">
                              </select>
                          </td>

                   
                          <td class="no-border" style="width: 5%">

                              <input type="button" id="btnSearch" value="Search" class="btn btn-primary d-block" style="font-size:small" /> 
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
  <table class="table table-bordered table-striped kpi-user-list-table">
  
    <thead>
     <tr style="height:50px">
         <th class="hidden" style="width:8%;text-align:center;vertical-align:middle">Customer ID</th>
          <th  style="width:14%;text-align:center;vertical-align:middle">Customer Name</th>
            <th  style="width:10%;text-align:center;vertical-align:middle">Owner</th>
          <th style="width:8%;text-align:center;vertical-align:middle">last Assignment Date</th>
         <th  style="width:8%;text-align:center;vertical-align:middle">Phone</th>
          <th style="width:8%;text-align:center;vertical-align:middle">Email</th>
          <th style="width:8%;text-align:center;vertical-align:middle">URL</th>
             <th style="width:8%;text-align:center;vertical-align:middle">Address</th>
            <th style="width:8%;text-align:center;vertical-align:middle">Country</th>
         <th style="width:8%;text-align:center;vertical-align:middle">City</th>
         <th style="width:8%;text-align:center;vertical-align:middle">Action</th>
           
        </tr>
    </thead>
    <tbody class="tbody-MainList">

    </tbody>
  </table>
</div>




    </div>
</div>
   <!--- -->
      

      <!-- Revenue List Popup -->

       <!-- Customer Search Popup -->
  <div class="modal fade" id="mpAccountDetails" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-l" role="document" style="max-width: 80vw!important; top: 10%;zoom:90%">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Account Details</h5>
                    
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                   
                   
                </div>
                <div class="modal-body">





                    <div class="card">



                        <div class="card-body">

                            <div class="row">
                                <div class="col-5">
                                    <label class="col-form-label label-custom" for="basic-default-name">Customer Name</label>
                                    <div class="">
                                        <input class="form-control" type="text" value="" id="txtCustomerName" />

                                    </div>
                                </div>


                                <div class="col-2">
                                    <label class="col-form-label label-custom" for="basic-default-name">Phone</label>
                                    <div class="">
                                        <input class="form-control" type="text" value="" id="txtPhone" />

                                    </div>
                                </div>

                                <div class="col-3">
                                    <label class="col-form-label label-custom" for="basic-default-name">Cutomer Em@il</label>
                                    <div class="">
                                        <input class="form-control" type="text" value="" id="txtCustomerEm" />
                                    </div>
                                </div>
                                <div class="col-2">
                                    <label for="html5-number-input" class="col-form-label label-custom">URL</label>
                                    <div class="">
                                        <input class="form-control" type="text" value="" id="txtURL" />

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-2">
                                        <label for="html5-number-input" class="col-form-label label-custom">Address</label>
                                        <div class="">
                                            <textarea id="txtAddress" class="form-control"></textarea>

                                        </div>
                                    </div>
                                       <div class="col-2">
                                        <label for="html5-number-input" class="col-form-label label-custom">Owner</label>
                                        <div class="">
                                            <select id="ddlOwnerEdit" class="form-select color-dropdown">
                                            </select>

                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <label for="html5-number-input" class="col-form-label label-custom">Country</label>
                                        <div class="">
                                            <select id="ddlCountry" class="form-select color-dropdown">
                                            </select>

                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <label for="html5-number-input" class="col-form-label label-custom">City</label>
                                        <div class="">
                                            <select id="ddlCity" class="form-select color-dropdown">
                                            </select>

                                        </div>
                                    </div>
                                      <div class="col-2">
                                        <label for="html5-number-input" class="col-form-label label-custom">Sector</label>
                                        <div class="">
                                            <select id="ddlSector" class="form-select color-dropdown">
                                            </select>

                                        </div>
                                    </div>
                                    <div class="col-2 other_sector">
                                        <label for="html5-number-input" class="col-form-label label-custom">Other</label>
                                        <div class="">
                                           <input class="form-control" type="text" value="" id="txtOther" />

                                        </div>
                                    </div>
                                </div>








                            </div>
                            <br />
                            <br />

                            <div class="row">
                                  <a href="#" id="btnSaveNewCustomer" class="btn btn-primary" style="float: left;"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp;Save</a>
                            </div>
                        </div>





                    </div>


                </div>
        </div>
    </div>
      </div>

      

      <script type="text/javascript">
                var currUserId = '';   
                var EmpNo = '';
                var myrole = '';
                var myrole = '';
                var overAllPerfo=0;
                $(document).ready(function () {
                    currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;               
                    EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';
                    myroleList = '<%=Session["CurrentUserRolesList"]%>';
                });

      </script>
    	<!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />


    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
    <%--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.13.1/datatables.min.css"/>--%>
    
 <%--     
    <script src="Datatable/js/jquery.dataTables.min.js"></script>--%>
   
    <script src="Scripts/Accounts.js?v=1"></script>

	<!-- Datatable plugin JS library file -->	
   
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
     <link href="../Common/button/customizedButtons.css" rel="stylesheet" />
    
        <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
        <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

</asp:Content>