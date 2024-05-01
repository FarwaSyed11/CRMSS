<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="OPTAdminRequests.aspx.cs" Inherits="CRMAdmin_Default" %>

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
    display:none;
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

            .opt-det th{
        background-color: #a92828;
        color:white !important;
    }
        .opt-det td {
             color: #333333 !important;
    }


          .prj-det th{
        background-color: #a92828;
        color:white !important;
    }
        .prj-det td {
             color: #333333 !important;
    }


         .RL-det th{
        background-color: #a92828;
        color:white !important;
    }
        .RL-det td {
             color: #333333 !important;
    }

           .Acc-det th{
        background-color: #a92828;
        color:white !important;
    }
        .Acc-det td {
             color: #333333 !important;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="ajax-loader loader-bg-blur">
        <div class="custom-loader ">
            <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
            <h4>Loading Data...</h4>
        </div>
    </div>


    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div style="padding-left: 2%; padding-top: 1%;">
            <h4 style="text-shadow: 1px -1px 8px; color: #a92828;">STATUS REQUESTS</h4>
        </div>

        <div class="card-body" style="margin-top: -2%;">

            <div>
                <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                    <tr>
                          <td class="no-border  label-alignment" style="width: 10%">
                            <asp:Label ID="Label1" Text="Requests" runat="server" Font-Size="Medium" Font-Bold="true" />
                        </td>
                        <td class="no-border" style="width: 20%;">
                            <select id="ddlSection" class="form-select color-dropdown">
                                <option value="0">Opportunity</option>
                                <option value="4">Project</option>
                                 <option value="8">Request Lost</option>
                                 <option value="12">Account Status</option>
                            </select>
                        </td>
                

                       
                        <td class="no-border  label-alignment" style="width: 10%">
                            <asp:Label ID="Label8" Text="Requests" runat="server" Font-Size="Medium" Font-Bold="true" />
                        </td>
                        <td class="no-border" style="width: 20%;">
                            <select id="ddlRequests" class="form-select color-dropdown">
                                <option value="0">Pending Requests</option>
                                <option value="1">Approved Requests</option>
                                <option value="2">Rejected Requests</option>
                            </select>
                        </td>
                         <td class="no-border  label-alignment" style="width: 10%">
                            <input type="button" id="btnSearch" value="Search" class="btn btn-danger d-block" style="font-size:small" /> 
                        </td>

                        <td class="no-border  label-alignment" style="width: 30%">
                           
                        </td>

                       


                      <%--  <td class="no-border" style="width: 5%">

                            <input type="button" id="btnExport" value="Export" class="btn btn-danger d-block" style="font-size: small" />
                        </td>--%>
                    </tr>
                </table>
            </div>

            <div class="" style="margin-top: 1%;">


                <table class="table table-bordered table-striped kpi-user-list-table">

                    <thead class="thead-Report-list kpi-user-list-table-th">
                    </thead>
                    <tbody class="tbody-OppRequests">
                    </tbody>
                </table>
            </div>

        </div>
    </div>



    <div class="modal fade" id="ConfirmActivityPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;padding-bottom:15%;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div class="Acc-Req"><i class="bx bx bx-check-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;color:#0dcb0d;"></i></div>

                     <div class="Rej-Req"><i class="bx bx bx-x-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;color:red;"></i></div>
                    <div>
                        <h3>Are you sure?</h3>
                    </div>
                    <div class="Acc-Req">
                      Do You Really Want To Approve this Request
                        </div>
                    <div class="Rej-Req">
                      Do You Really Want To Reject this Request
                        </div>
                </div>
                <div class="row">

                    <label Font-Size="Medium" Font-Bold="true" style="margin-left:3%">Comment</label>
                     <input type="text" id="txtActionReq" class="form-control" style="margin-left:5%; width:90%;"/>

                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;padding-top:18px;">
                        <asp:LinkButton ID="btnNo" runat="server" class="btn btn-secondary" data-bs-dismiss="modal">NO</asp:LinkButton>
                        <button type="button" ID="btnYes" class="btn btn-primary btn-delete-act">YES</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


     <div class="modal fade" id="mpOptHistoryDet" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="text-shadow: 1px -1px 8px; color: #a92828;">HISTORY</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="opt-det-div" style="margin-top: 1%;">



                       
                        
                        <table class="table table-bordered table-striped opt-det" style="width:100%;">

                            <thead>
                                <tr>
                                    <%--<th class="hidden">optNo</th>--%>


                                    <th>Opportunity Number</th>
                                    <th>CreatedBy</th>
                                    <th>CreatedDate</th>
                                    <th>SalesStage</th>
                                    <th>Status</th>
                                    <th>Remarks</th>
                                    <th>LastUpdatedBy</th>
                                    <th>LastUpdated Date</th>
                                    <th>Admin Action</th>
                                    <th>Action Remarks</th>
                                  

                                </tr>
                            </thead>
                            <tbody class="tbody-OptHistoryDet">
                            </tbody>
                        </table>
                   </div>
                     <div class="prj-det-div" style="margin-top: 1%;">

                         <table class="table table-bordered table-striped prj-det" style="width:100%;">

                            <thead>
                                <tr>
                                    <%--<th class="hidden">optNo</th>--%>


                                    <th>Project Number</th>
                                    <th>CreatedBy</th>
                                    <th>CreatedDate</th>
                                    <th>SalesStage</th>
                                    <th>Status</th>
                                    <th>Remarks</th>
                                    <th>LastUpdatedBy</th>
                                    <th>LastUpdated Date</th>
                                    <th>Admin Action</th>
                                    <th>Action Remarks</th>
                                  

                                </tr>
                            </thead>
                            <tbody class="tbody-PrjHistoryDet">
                            </tbody>
                        </table>



                    </div>


                      <div class="RL-det-div" style="margin-top: 1%;">



                       
                        
                        <table class="table table-bordered table-striped RL-det" style="width:100%;">

                            <thead>
                                <tr>
                                    <%--<th class="hidden">optNo</th>--%>


                                    <th>Opportunity Number</th>
                                    <th>CreatedBy</th>
                                    <th>CreatedDate</th>
                                    <th>Remarks</th>
                                    <th>Action Remarks</th>
                                    <th>LastUpdatedBy</th>
                                    <th>LastUpdated Date</th>
                                  

                                </tr>
                            </thead>
                            <tbody class="tbody-RLHistoryDet">
                            </tbody>
                        </table>
                   </div>



                     <div class="Acc-det-div" style="margin-top: 1%;">



                       
                        
                        <table class="table table-bordered table-striped Acc-det" style="width:100%;">

                            <thead>
                                <tr>
                                    <%--<th class="hidden">optNo</th>--%>


                                    <th>CRMAccountId</th>
                                    <th>CreatedBy</th>
                                    <th>CreatedDate</th>
                                    <th>Remarks</th>
                                    <th>Action Remarks</th>
                                      <th>LastUpdatedBy</th>
                                    <th>LastUpdated Date</th>
                                  

                                </tr>
                            </thead>
                            <tbody class="tbody-AccHistoryDet">
                            </tbody>
                        </table>
                   </div>


                </div>

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
                    myroleList = '<%=Session["CurrentUserRolesList"]%>';

                });

       </script>
    	<!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />


    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>
<%--    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>   
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.print.min.js"></script>--%>

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
    <%--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.13.1/datatables.min.css"/>--%>
    
 <%--     
    <script src="Datatable/js/jquery.dataTables.min.js"></script>--%>
   


	<!-- Datatable plugin JS library file -->	
    <script src="Script/OPTAdminRequests.js?v=1.5"></script>

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    


</asp:Content>

