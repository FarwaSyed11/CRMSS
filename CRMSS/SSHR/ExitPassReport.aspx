<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="ExitPassReport.aspx.cs" Inherits="SSHR_ExitPassReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        .Table-ExitPassReport th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Table-ExitPassReport td {
            border-bottom: 1px solid #96a2ab45 !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
    <div style="padding-left: 2%; padding-top: 1%;">
        <h4 style="text-shadow: 1px -1px 8px; color: #a92828;">Exit Pass Report</h4>
    </div>
    <div class="card-body" style="margin-top: -1%;">
    </div>

    <div class="row" style="padding-left:2%">
        <table class="table table-condensed tblfilter" style="border-bottom-width: 1px !important" runat="server" id="tbltopsearch">
            <tr>

                <td class="no-border  label-alignment" style="width: 10%">
                    <asp:Label ID="Label8" Text="From Date" runat="server" Font-Size="Medium" Font-Bold="true" />
                </td>
                <td class="no-border" style="width: 15%">
                    <input type="date" class="form-control" id="txtstartDtExitPass" />
                </td>
                <td class="no-border  label-alignment" style="width: 10%">
                    <asp:Label ID="Label3" Text="To Date" runat="server" Font-Size="Medium" Font-Bold="true" />
                </td>
                <td class="no-border" style="width: 15%">
                    <input type="date" class="form-control" id="txtEndDateExitPass" />
                </td>
               
                
               
                <td class="no-border" style="width: 12%">
                    <a href="#" id="btnSearch" class="btn btn-primary" style="float: left;"><i class="fa fa-search" aria-hidden="true"></i>&nbsp;Search</a>
                </td>

                <td class="no-border col-2 btn-reports">
                    <input type="button" id="btnExitPassdownload" value="Detailed Report" class="btn btn-primary d-block" style="font-size: small" />
                </td>

            </tr>
        </table>

    </div>


    <div class="" style="margin: 2%;">
        <table class="table Table-ExitPassReport" style="width: 100%!important;">

            <thead>
                <tr>

                    <th class="hidden">EXIT_ID</th>
                    <th>Req.Ref.No</th>

                    <th>Employee Name</th>
                    <th>Department</th>
                    <th>Request Date</th>
                    <th>Exit Date</th>
                    <th> Time Out</th>                  
                    <th>Time In</th>
                    <th>Status</th>
                    <th style="width:25%">Remarks</th>
                    <th>Exit Pass Type</th>

                </tr>

            </thead>
            <tbody class="tbody-ExitPassReport">
            </tbody>
        </table>
    </div>


</div>


     <script type="text/javascript">
       var currUserId = '';
       var EmpNo = '';
       var EmpName = '';
       var myrole = '';
       var overAllPerfo = 0;
       $(document).ready(function () {
           currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
          EmpNo = '<%= Session["EmpNo"] %>';
          myrole = '<%=Session["Role"]%>';
          EmpName = '<%=Session["EmpName"]%>';
          myroleList = '<%=Session["CurrentUserRolesList"]%>';
      });

     </script>

   
    <script src="../SSHR/Scripts/exitpassReport.js"></script>

     <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
     <script src="../Template/Datatable/js/jquery.dataTables.min.js"></script>

    <script src="../Template/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../Template/Datatable/js/jszip.min.js"></script>
    <script src="../Template/Datatable/js/pdfmake.min.js"></script>
    <script src="../Template/Datatable/js/vfs_fonts.js"></script>
    <script src="../Template/Datatable/js/buttons.html5.min.js"></script>
    <script src="../Template/Datatable/js/buttons.print.min.js"></script>

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <link href="../Template/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
    <script src="../Template/Flatpickr/js/flatpickr.js"></script>

</asp:Content>

