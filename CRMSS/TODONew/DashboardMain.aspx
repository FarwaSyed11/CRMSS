<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="DashboardMain.aspx.cs" Inherits="TODONew_DashboardMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="../Dashboard/assets/multiselect/example-styles.css" rel="stylesheet" />

    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css" integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI=" crossorigin="" />

    <style>
        .custom-loader {
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

        .loader-bg-blur {
            height: 100%;
            z-index: 9999999;
            position: fixed;
            background: #c3d3ce6b;
            width: 100%;
        }

        .nav-tabs .nav-item .nav-link:hover, .nav-tabs .nav-item .nav-link:focus {
            /*color: #ffffff;
    background: #e14b4b;*/
            color: #d4432c;
            background: #ffffff !important;
        }

        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            /*color: #ffffff;
    background: #e14b4b;
    border-color: #fff;*/
            color: #d4432c;
            background: #ffffff !important;
            border-color: #fff !important;
            border-bottom: 2px solid #d4432c !important;
        }



        .nav-tabs button {
            background: white !important;
        }

        .cardfilter {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid #d9dee3;
            border-radius: 0.5rem;
            width: 97%;
            margin-left: 28px;
            margin-top: 15px;
        }

        .tblfilter {
            background-color: white;
            width: 97%;
            margin-left: 28px;
            margin-top: 14px;
            border-radius: 7px;
            margin-bottom: 0px;
        }

        .rounded {
            border-radius: 0.375rem !important;
            width: 10%;
        }

        .listoprty {
            font-weight: bold;
            font-size: xx-large;
            color: blueviolet;
        }

        ::-webkit-scrollbar {
            width: 5px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #ad8a8a;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #555;
            }

        .colwidthfirst {
            width: 11.333333%
        }

        .rowfisthding {
            padding-top: 10px;
        }

        .rowfirstchrt {
            padding-bottom: 10px;
        }

        .tooltipbtn {
            border: none;
            border-radius: 20%;
            height: 22px;
            width: 25px;
            float: right;
            /*margin-left: 76%;*/
        }

        /*.perfoSuccess{
           color: #12C05D;
           font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        .perfoWarning{
           color:  #F6BE00;
           font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        .perfoDanger{
            color: #a92828;
            font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }*/
        .nav-scroll-custom {
            float: left;
            overflow-y: auto;
            overflow-x: hidden;
            height: 455px;
        }

        .nav-pills .nav-link.active, .nav-pills .nav-link.active:hover, .nav-pills .nav-link.active:focus {
            background-color: #ffeadd !important;
            color: #fff;
            box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%);
        }

        .com-soon-grad {
            background: -webkit-linear-gradient(#c95050, #3a2929);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            /* box-shadow: 1px 2px 3px 4px #00000094; */
            text-shadow: 0px 10px 11px #cf5959;
        }

        .hidden {
            display: none;
        }

        .rowrev {
            margin-top: -1.1%;
            margin-bottom: 1%;
            margin-left: 0%;
        }

        .card {
            box-shadow: 1px 1px 14px #fff2f2;
        }

        .btn-primary {
            color: #fff;
            background-color: #c74747;
            border-color: #c74747;
            box-shadow: 0 0.125rem 0.25rem 0 rgb(255 105 105 / 40%);
        }

        .box-pending {
            height: 24%;
            background: #e56426;
            color: white;
            font-size: 31px;
            border-radius: 5px;
            padding: 12px 14px;
        }

        .box-accepted {
            height: 24%;
            background: #b2d233;
            color: white;
            font-size: 31px;
            margin-top: 3px;
            border-radius: 5px;
            padding: 12px 14px;
        }

        .box-rejected {
            height: 24%;
            background: #c74747;
            color: white;
            font-size: 31px;
            margin-top: 3px;
            border-radius: 5px;
            padding: 12px 14px;
        }

        .box-closed {
            height: 24%;
            background: #5f67a0;
            color: white;
            font-size: 31px;
            margin-top: 3px;
            border-radius: 5px;
            padding: 12px 14px;
        }

        .total-status-box {
            height: 45%;
            background: #6e5858;
            color: white;
            font-size: 63px;
            padding: 5% 41%;
        }

        .total-status-box-below {
            color: white;
            background: brown;
            margin-top: 3px;
            height: 43%;
            padding: 4% 22%;
            font-size: 25px;
        }

        .summary-box {
            /*height: 24%;
    background: #ffffff;   
    color: #e36535;
    font-size: 16px;
    border-radius: 5px;
    padding: 12px 14px;
    margin: 1%;
    BOX-SHADOW: 0px 5px 63px #cfc4c4;*/
            height: 24%;
            background: #ffffff;
            /*color: #e36535;*/
            font-size: 16px;
            border-radius: 5px;
            padding: 12px 14px;
            margin: 2%;
            BOX-SHADOW: 0px 0px 3px #db7c4e; /*#4eaddb; blue*/
        }

        .proPicPosition {
            height: 137px;
            width: 60%;
            position: relative;
            top: 25px;
            border: 1px solid #b3aaaa;
            /* border-radius: 141px; */
            border-radius: 51%;
            left: 52px;
            box-shadow: 0px 0px 7px #566856;
        }

        .total-countvalue-box {
            background: #ffeadd;
            /*color: white;*/
            height: 40px;
            font-size: 23px;
            margin: 2px;
            padding: 1px 9px;
            width: 48%;
        }

        .map-div-position {
            position: relative;
            outline: none;
            border: groove;
            height: 443px;
            top: 7px;
            right: 11px;
        }

        .move-status-div {
            background: #ffeadd; /*#c74949;*/
            color: #e36535;
            position: relative;
            top: -11px;
            height: 8.5%;
            padding-top: 5px;
        }

        option :hover {
            background: #d4432c !important;
        }
        /*option:checked{
      COLOR: #d4432c;
  }*/
        .pr-aging-sq-green {
            color: #a3dc15;
            font-size: 1rem;
            line-height: 1.5;
            text-shadow: -1px 0px 3px #2b5e08;
        }

        .pr-aging-sq-orange {
            color: #ffab00;
            font-size: 1rem;
            line-height: 1.5;
            text-shadow: -1px 0px 3px #513908;
        }

        .pr-aging-sq-red {
            color: #ff3e1d;
            font-size: 1rem;
            line-height: 1.5;
            text-shadow: -1px 0px 3px #8c200e;
        }

        .pr-aging-sq-darkred {
            color: #c34747;
            font-size: 1rem;
            line-height: 1.5;
        }

        .pr-aging-sq-blue {
            color: #00a7ff;
            font-size: 1rem;
            line-height: 1.5;
            text-shadow: -1px 0px 3px #0b3951;
        }

        .pr-aging-count-green {
            color: #98ca3c;
            text-shadow: 0px 0.5px 0px green;
        }

        .pr-aging-count-orange {
            color: #ffab00;
            text-shadow: 0px 0.5px 0px #cb9809;
        }

        .pr-aging-count-red {
            color: #ff3e1d;
            text-shadow: 0px 0.5px 0px #d80f0f;
        }

        .pr-aging-count-darkred {
            color: #c34747;
            text-shadow: 0px 0.5px 0px #8a1010;
        }

        .pr-aging-count-blue {
            color: #00a7ff;
            text-shadow: 0px 0.5px 0px #004a71;
        }

        .po-aging-parent-div .nav-pills .nav-link.active, .nav-pills .nav-link.active:hover, .nav-pills .nav-link.active:focus {
            background-color: #34b8ed00;
            color: #e67144;
            border-bottom: #e67144 3px solid;
            box-shadow: 0px 0px 0px 0px;
            border-radius: 0px;
        }

        .pending-task-table th {
            background-color: #ffeadd;
            color: #e36535 !important;
        }

        .db-task-tab {
            width: 100%;
            background: #80808000;
            border: 0px;
            color: #750909f5;
            border: none;
        }

            .db-task-tab:focus {
                outline: none;
            }

        .progrees-bar-grid {
            font-size: 11px;
            height: 18px;
            width: 16vw;
            background: #dddddd52;
            border-radius: 4px;
            margin-top: 12px;
        }

        .closed-tab-div {
            background-image: url("./Asset/comp-task-bg-img.png");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center center;
        }

        .open-tab-div {
            background-image: url("./Asset/pending-task-bg-img.png");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center center;
        }

        .sp-meter-bg {
            background-image: url("./Asset/trans-img-for-speedometer.png");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center center;
        }

        .sp-meter-bg-red {
            background-image: url("./Asset/trans-img-for-speedometer1.png");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center center;
        }

        .db-box-bg {
            background-image: url("./Asset/db-box-bg-img2.png");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center center;
            margin-top: 6px;
            min-height: 94px;
        }

        .pending-task-list-bg {
            background-image: url("./Asset/pattern-rect-box2.png");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center center;
            margin-top: 6px;
        }

        .multi-select-button {
    display: inline-block;
    font-size: 0.875em;
    padding: 0.2em 0.6em;
    max-width: 18em;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    vertical-align: -0.5em;
    background-color: #fff;
    border: 1px solid #aaa;
    border-radius: 4px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
    cursor: default;
    min-width: 21em;
}
        .multi-select-menu{
            z-index:99;
        }
    .toponeempbox{
            border-radius: 15px;margin: 9px 0px 0px 0px;padding-top: 16px; border-top: 18px solid #6eff4a75;border-left: 3px solid #6eff4a75;border-right: 3px solid #6eff4a75;border-bottom: 2px solid #6eff4a75;
    }
    .topsecondempbox{
            border-radius: 15px;margin: 9px 0px 0px 0px;padding-top: 16px; border-top: 18px solid #4acbff75;border-left: 3px solid #4acbff75;border-right: 3px solid #4acbff75;border-bottom: 2px solid #4acbff75;
    }
    .topthirdempbox{
            border-radius: 15px;margin: 9px 0px 0px 0px;padding-top: 16px;border-top: 18px solid #ffe94a75;border-left: 3px solid #ffe94a75;border-right: 3px solid #ffe94a75;border-bottom: 2px solid #ffe94a75;
    }
    .top-rank-bg-img{
            background-image: url("./Asset/toprank-bg.png");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center center;
    }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnUserId" runat="server" />
    <asp:HiddenField ID="hdnCompId" runat="server" />
    <asp:HiddenField ID="hdnManagerId" runat="server" />
    <asp:HiddenField ID="hdnImagePath" runat="server" />
    <asp:HiddenField ID="hdnEmpFullName" runat="server" />

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">


        <ContentTemplate>


            <script type="text/javascript">
                var currUserId = '';
                var EmpNo = '';
                var imgPath = '';
                var empName = '';
                var rolesList = '';
                var overAllPerfo = 0;
                $(document).ready(function () {
                    currUserId = $('#<%=hdnUserId.ClientID%>');

                    imgPath = $('#<%=hdnImagePath.ClientID%>');
                    empName = $('#<%=hdnEmpFullName.ClientID%>');
                    rolesList = '<%=Session["CurrentUserRolesList"].ToString()%>';
                    EmpNo = '<%= Session["EmpNo"] %>';
                });

            </script>





            <div class="content-wrapper">
                <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                    <tr>
                        <td style="width: 15%; border-left: 4px solid #cf5757;">
                            <h5><i style="color: #cf5757;">SO DASHBOARD</i></h5>

                            <td style="width: 18%;">
                                <span id="Label11" style="font-family: Times New Roman; font-size: Medium; font-weight: bold;">Company</span>
                                <select id="ddlCompany" style="z-index:99;" class="form-select color-dropdown" multiple></select>
                            </td>

                            <td style="width: 18%;">
                                <span id="Label11" style="font-family: Times New Roman; font-size: Medium; font-weight: bold;">Manager</span>
                                <select id="ddlManager" class="form-select color-dropdown"></select>
                            </td>
                        </td>
                        <%--<td style="width:2%;  COLOR: #d4432c;" class="tic-filter-td">Employee</td>--%>
                        <td style="width: 20%" class="tic-filter-td">
                            <span id="lblEmpFilter" style="font-family: Times New Roman; font-size: Medium; font-weight: bold;">Salesman</span>
                            <select id="ddlSalesman" class="form-select color-dropdown">
                            </select>
                        </td>

                        <td style="width: 20%">
                            <span id="lblMonthFilter" style="font-family: Times New Roman; font-size: Medium; font-weight: bold;">Month / Year</span>
                            <div class="row">

                                <div class="col-md-4" style="border-right: 1px solid #cecece66;">
                                    <label class="btn" style="border-color: #8592a3; box-shadow: 0 0.125rem 0.25rem 0 rgba(133, 146, 163, 0.4);">
                                        <input type="checkbox" name="cb-ytd" class="cb-ytd-filter">
                                        &nbsp; YTD
                                   
                                    </label>
                                </div>

                                <div class="col-md-4" style="border-right: 1px solid #cecece66;">
                                    <select class="form-select placement-dropdown" id="ddlMonth" style="/* border-right: 1px solid #cecece66; */">
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
                                </div>
                                <div class="col-md-4" style="/* border-right: 1px solid #cecece66; */">
                                    <select class="form-select placement-dropdown" id="ddlYear">
                                        <option value="2024">2024</option>
                                        <option value="2023">2023</option>
                                        <option value="2022">2022</option>                                        
                                    </select>
                                </div>

                            </div>

                            <%--<div class="input-group">
                              <label class="input-group-text "><i class="fa fa-calendar" style="COLOR: #d4432c;" aria-hidden="true"></i>
                                             <span style="margin-left: 6%; COLOR: #d4432c;">
                                                  From
                                             </span>
                                          
                                         </label>
                                         <input type="text" id="weeklyDatePickerStart" placeholder="Select Date" style="background:white;" class="form-control flatpickr-input active" readonly="readonly">
                                   </div>--%>
                        </td>

                        <%--  <td style="width: 20%">
                            <span id="lblYearFilter" style="font-family: Times New Roman; font-size: Medium; font-weight: bold;">Year</span>
                            <select class="form-select placement-dropdown" id="ddlYear">
                                <option value="2023">2023</option>
                                <option value="2022">2022</option>
                                <option value="2021">2021</option>
                            </select>
                        </td>--%>

                        <td class="no-border" style="width: 5%">

                            <%--<asp:LinkButton ID="btnSearch" runat="server" Text="Search"
                                  CssClass="btn btn-primary d-block" Font-Size="Small"></i>Search</asp:LinkButton>--%>
                            <input type="button" id="btnSearchDashBoard" value="Search" class="btn btn-primary d-block" style="font-size: small" />
                        </td>
                    </tr>
                </table>

                <%-- Filter bar End --%>



                <%--First Row of Dashboard--%>
                <div class="container-xxl flex-grow-1 container-p-y">
                    <%--Parent div after filter--%>

                    <div class="row rowrev">
                        <%--second parent div--%>

                        <div class="card" style="width: 15%; border-left: 5px solid #ff7d3c;">
                            <div>
                                <img src="../Masters/assets/images/img_avatar.png" class="proPicPosition empProfilePic" alt="" />
                            </div>
                            <div style="position: relative; top: 13%; text-align: center;">
                                <span style="color: #d4432c;">Hi, Have a good day.</span>
                                <br />
                                <h5 class="empNameH">Anwar Ahmed</h5>
                            </div>
                            <div style="margin: 77px 0px 0px 24px;">
                                <canvas width="200" height="95" id="canvas-speedometer"></canvas>
                            </div>
                            <div style="color: #e1430ce3; font-weight: 600; margin: -13px 0px 0px 67px; letter-spacing: 2px;"><i>Performance</i></div>
                        </div>


                        <div class="" style="width: 84%;">
                            <%--For Sales Order--%>

                            <div class="card" style="border: 1px solid #14dffe61;">
                                <div class="row" style="min-height: 128px;">

                                    <div style="width: 2%; margin-left: 8px; padding: 20px 0px 0px 5px; background: #35b6fc; border-radius: 5px; color: white; box-shadow: 0px 0px 3px 3px #35b6fc9c;">
                                        <span style="writing-mode: vertical-rl; text-orientation: upleft; transform: rotate(180deg);">Sales Order </span>
                                    </div>

                                    <div style="background: white; width: 25%;">
                                        <div class="db-box-bg">
                                            <span style="font-size: 10px;">SO Value</span>
                                            <div class="row" style="border-right: 1.8px solid #b7b7b738;">
                                                <div class="col-md-4">
                                                    <h4 class="box-val-sototal" style="color: #596368;">-</h4>
                                                </div>
                                                <div class="col-md-8" style="text-align: right;">
                                                    <div class="row">

                                                        <div class="col-md-5" style="font-size: 15px;">Entered:  </div>
                                                        <div class="col-md-7 box-val-soentered" style="color: #35b6fc; font-weight: 600;">-</div>
                                                    </div>
                                                    <div class="row">

                                                        <div class="col-md-5" style="font-size: 15px;">Booked:  </div>
                                                        <div class="col-md-7 box-val-sobooked" style="color: #7872f2; font-weight: 600;">-</div>
                                                    </div>
                                                    <div class="row">

                                                        <div class="col-md-5 " style="font-size: 15px;">Closed: </div>
                                                        <div class="col-md-7 box-val-soclosed" style="color: #7ab115; font-weight: 600;">-</div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <%--<div class="progrees-bar-grid"><span style="position: absolute; margin-left: 6.5%; color: white;">58% </span>
                                                            <div style="width: 58%; background: #35b6fc; border-radius: 4px; height: 17px;"></div>
                                                        </div>--%>
                                    </div>

                                    <div style="background: white; width: 25%;">
                                        <div class="db-box-bg">
                                            <span style="font-size: 10px;">Confirmed Invoice</span>
                                            <div class="row" style="border-right: 1.8px solid #b7b7b738;">
                                                <div class="col-md-4">
                                                    <h4 class="box-val-so-totalinvoice" style="color: #596368;">-</h4>
                                                </div>
                                                <div class="col-md-8" style="text-align: right;">
                                                    <div class="row">

                                                        <div class="col-md-7" style="font-size: 15px;">Invoice Amount:  </div>
                                                        <div class="col-md-5 box-val-so-invoicamount" style="color: #35b6fc; font-weight: 600;">-</div>
                                                    </div>
                                                    <div class="row">

                                                        <div class="col-md-7" style="font-size: 14px;">Pending for Invoice:  </div>
                                                        <div class="col-md-5 box-val-so-pendingforinvoice" style="color: #7872f2; font-weight: 600;">-</div>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                        <%--  <div class="progrees-bar-grid"><span style="position: absolute; margin-left: 6.5%; color: white;">58% </span>
                                                            <div style="width: 58%; background: #35b6fc; border-radius: 4px; height: 17px;"></div>
                                                        </div>--%>
                                    </div>

                                    <div style="background: white; width: 25%;">
                                        <div class="db-box-bg">
                                            <span style="font-size: 10px;">Invoice Amount</span>
                                            <div class="row" style="border-right: 1.8px solid #b7b7b738;">
                                                <div class="col-md-4">
                                                    <h4 class="box-val-so-totalreceipt" style="color: #596368;">-</h4>
                                                </div>
                                                <div class="col-md-8" style="text-align: right;">
                                                    <div class="row">

                                                        <div class="col-md-7" style="font-size: 15px;">Pending Due:  </div>
                                                        <div class="col-md-5 box-val-so-pendueinvoice" style="color: #35b6fc; font-weight: 600;">-</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-7" style="font-size: 14px;">Pending Not Due:  </div>
                                                        <div class="col-md-5 box-val-so-pennotdueinvoice" style="color: #7872f2; font-weight: 600;">-</div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-7" style="font-size: 13px;">Receipt Amount:  </div>
                                                        <div class="col-md-5 box-val-so-receiptamount" style="color: #7872f2; font-weight: 600;">-</div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <%--  <div class="progrees-bar-grid"><span style="position: absolute; margin-left: 6.5%; color: white;">58% </span>
                                                            <div style="width: 58%; background: #35b6fc; border-radius: 4px; height: 17px;"></div>
                                                        </div>--%>
                                    </div>

                                    <div style="background: white; width: 21.5%;">
                                        <div class="db-box-bg row">

                                            <div style="width:34%;">
                                                <div>
                                                    <div> <span style="font-size: 10px;">This Year</span> </div>
                                                    <div style="margin-top: -6px;"> <span class="so-speedo-curr-year" style="font-size: 17px;color: #50a7d7;font-weight: 500;">-</span> </div>
                                                </div>

                                                 <div style="margin-top:9px;">
                                                    <div> <span style="font-size: 10px;">Prev Year</span> </div>
                                                    <div style="margin-top: -6px;"> <span class="so-speedo-prev-year" style="font-size: 17px;color: #596368;font-weight: 500;">-</span> </div>
                                                </div>
                                            </div>                                            
                                            
                                            <div style="width:66%;">
                                                <div style="margin: 10px 0px 0px 0px;">
                                                    <canvas id="spmeter-salesorder" style="width:160px;height:90px;"></canvas>
                                                    <div style="margin: -10px 0px 0px 38px; font-weight: 400; color: #2da3e3;"><a class="so-speed-perc">0%</a> Overall</div>
                                                 </div>
                                            </div>

                                            
                                        </div>
                                        <%--  <div class="progrees-bar-grid"><span style="position: absolute; margin-left: 6.5%; color: white;">58% </span>
                                                            <div style="width: 58%; background: #35b6fc; border-radius: 4px; height: 17px;"></div>
                                                        </div>--%>
                                    </div>

                                </div>

                            </div>

                            <%--sales order end here--%>


                            <%--For Invoice Box--%>
                            <div class="card" style="margin-top: 8px; border: 1px solid #a2f70482;">
                                <div class="row" style="min-height: 128px;">

                                    <div style="width: 2%; margin-left: 8px; padding: 35px 0px 0px 5px; background: #82b624; border-radius: 5px; color: white; box-shadow: 0px 0px 3px 3px #93cb2ee6;">
                                        <span style="writing-mode: vertical-rl; text-orientation: upleft; transform: rotate(180deg);">Invoice </span>
                                    </div>

                                    <div style="background: white; width: 25%;">
                                        <div class="db-box-bg">
                                            <span style="font-size: 10px;">Invoice Value</span>
                                            <div class="row" style="border-right: 1.8px solid #b7b7b738;">
                                                <div class="col-md-4">
                                                    <h4 class="box-val-totinvoice" style="color: #596368;">-</h4>
                                                </div>
                                                <div class="col-md-8" style="text-align: right;">
                                                    <div class="row">

                                                        <div class="col-md-7" style="font-size: 15px;">Collected:  </div>
                                                        <div class="col-md-5 box-val-collected" style="color: #35b6fc; font-weight: 600;">-</div>
                                                    </div>
                                                    <div class="row">

                                                        <div class="col-md-7" style="font-size: 14px;">Not Collected:  </div>
                                                        <div class="col-md-5 box-val-notcollected" style="color: #7872f2; font-weight: 600;">-</div>
                                                    </div>
                                                    <%--   <div class="row">

                                                                        <div class="col-md-7" style="font-size: 14px;">Receipt Amount: </div>
                                                                        <div class="col-md-5 box-val-receiptamount" style="color: #7ab115; font-weight: 600;">-</div>
                                                                    </div>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- <div class="progrees-bar-grid"><span style="position: absolute; margin-left: 6.5%; color: white;">58% </span>
                                                            <div style="width: 58%; background: #35b6fc; border-radius: 4px; height: 17px;"></div>
                                                        </div>--%>
                                    </div>

                                    <div style="background: white; width: 25%;">
                                        <div class="db-box-bg">
                                            <span style="font-size: 10px;">Pending For Collected</span>
                                            <div class="row" style="border-right: 1.8px solid #b7b7b738;">
                                                <div class="col-md-4">
                                                    <h4 class="box-val-inv-penforcoll" style="color: #596368;">-</h4>
                                                </div>
                                                <div class="col-md-8" style="text-align: right;">
                                                    <div class="row">

                                                        <div class="col-md-7" style="font-size: 15px;">Pending Due:  </div>
                                                        <div class="col-md-5 box-val-inv-pendue" style="color: #35b6fc; font-weight: 600;">-</div>
                                                    </div>
                                                    <div class="row">

                                                        <div class="col-md-7" style="font-size: 13.5px;">Pending Not Due:  </div>
                                                        <div class="col-md-5 box-val-inv-pennotdue" style="color: #7872f2; font-weight: 600;">-</div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <%-- <div class="progrees-bar-grid"><span style="position: absolute; margin-left: 6.5%; color: white;">58% </span>
                                                            <div style="width: 58%; background: #35b6fc; border-radius: 4px; height: 17px;"></div>
                                                        </div>--%>
                                    </div>

                                    <div style="background: white; width: 25%;">
                                        <div class="db-box-bg">
                                            <span style="font-size: 10px;">Collected Value</span>
                                            <div class="row" style="border-right: 1.8px solid #b7b7b738;">
                                                <div class="col-md-4">
                                                    <h4 class=" box-val-inv-collvalue" style="color: #596368;">-</h4>
                                                </div>
                                                <div class="col-md-8" style="text-align: right;">
                                                    <div class="row">

                                                        <div class="col-md-5" style="font-size: 15px;">Cleared:  </div>
                                                        <div class="col-md-7 box-val-inv-cleared" style="color: #35b6fc; font-weight: 600;">-</div>
                                                    </div>
                                                    <div class="row">

                                                        <div class="col-md-5" style="font-size: 15px;">Remitted:  </div>
                                                        <div class="col-md-7 box-val-inv-remitted" style="color: #7872f2; font-weight: 600;">-</div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <%-- <div class="progrees-bar-grid"><span style="position: absolute; margin-left: 6.5%; color: white;">58% </span>
                                                            <div style="width: 58%; background: #35b6fc; border-radius: 4px; height: 17px;"></div>
                                                        </div>--%>
                                    </div>

                                    <div style="background: white; width: 21.5%;">
                                        <div class="db-box-bg row">


                                            <div style="width:34%;">
                                                   <div>
                                                    <div> <span style="font-size: 10px;">This Year</span> </div>
                                                    <div style="margin-top: -6px;"> <span class="inv-speedo-curr-year" style="font-size: 17px;color: #81bf0f;font-weight: 500;">-</span> </div>
                                                </div>

                                                 <div style="margin-top:9px;">
                                                    <div> <span style="font-size: 10px;">Prev Year</span> </div>
                                                    <div style="margin-top: -6px;"> <span class="inv-speedo-prev-year" style="font-size: 17px;color: #596368;font-weight: 500;">-</span> </div>
                                                </div>
                                            </div>                                            
                                            
                                            <div style="width:66%;">
                                                <div style="margin: 10px 0px 0px 0px;">
                                                    <canvas id="spmeter-invoice" style="width:160px;height:90px;"></canvas>
                                                    <div style="margin: -10px 0px 0px 38px; font-weight: 400; color: #82b624;"><a class="invoice-speed-perc">0%</a> Overall</div>
                                                </div>
                                            </div>
                                                                                                                                  

                                        </div>
                                        <%--   <div class="progrees-bar-grid"><span style="position: absolute; margin-left: 6.5%; color: white;">58% </span>
                                                            <div style="width: 58%; background: #35b6fc; border-radius: 4px; height: 17px;"></div>
                                                        </div>--%>
                                    </div>

                                </div>

                            </div>

                            <%--Invoice Box End--%>


                            <%--For Collection Box--%>
                            <div class="card" style="margin-top: 8px; border: 1px solid #ffff00a3;">
                                <div class="row" style="min-height: 128px;">

                                    <div style="width: 2%; margin-left: 8px; padding: 30px 0px 0px 5px; background: #ffab00; border-radius: 5px; color: white; box-shadow: 0px 0px 3px 3px #ffab009e;">
                                        <span style="writing-mode: vertical-rl; text-orientation: upleft; transform: rotate(180deg);">Collection </span>
                                    </div>

                                    <div style="background: white; width: 25%;">
                                        <div class="db-box-bg">
                                            <span style="font-size: 10px;">Collected Value</span>
                                            <div class="row" style="border-right: 1.8px solid #b7b7b738;">
                                                <div class="col-md-4">
                                                    <h4 class="box-val-coll-totvaluecoll" style="color: #596368;">-</h4>
                                                </div>
                                                <div class="col-md-8" style="text-align: right;">
                                                    <div class="row">

                                                        <div class="col-md-5" style="font-size: 15px;">Cleared:  </div>
                                                        <div class="col-md-7 box-val-coll-cleared" style="color: #35b6fc; font-weight: 600;">-</div>
                                                    </div>
                                                    <div class="row">

                                                        <div class="col-md-5" style="font-size: 15px;">Remitted:  </div>
                                                        <div class="col-md-7 box-val-coll-remitted" style="color: #7872f2; font-weight: 600;">-</div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <%-- <div class="progrees-bar-grid"><span style="position: absolute; margin-left: 6.5%; color: white;">58% </span>
                                                            <div style="width: 58%; background: #35b6fc; border-radius: 4px; height: 17px;"></div>
                                                        </div>--%>
                                    </div>

                                    <div style="background: white; width: 25%;">
                                        <div class="db-box-bg">
                                            <span style="font-size: 10px;">Remitted Value</span>
                                            <div class="row" style="border-right: 1.8px solid #b7b7b738;">
                                                <div class="col-md-4">
                                                    <h4 class="box-lbl-totalso" style="color: #596368;">-</h4>
                                                </div>
                                                <div class="col-md-8" style="text-align: right;">
                                                    <div class="row">

                                                        <div class="col-md-5" style="font-size: 15px;">Matured:  </div>
                                                        <div class="col-md-7" style="color: #35b6fc; font-weight: 600;">-</div>
                                                    </div>
                                                    <div class="row">

                                                        <div class="col-md-5" style="font-size: 15px;">Not Matured:  </div>
                                                        <div class="col-md-7" style="color: #7872f2; font-weight: 600;">-</div>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                        <%-- <div class="progrees-bar-grid"><span style="position: absolute; margin-left: 6.5%; color: white;">58% </span>
                                                            <div style="width: 58%; background: #35b6fc; border-radius: 4px; height: 17px;"></div>
                                                        </div>--%>
                                    </div>

                                    <div style="background: white; width: 25%;">
                                        <div class="db-box-bg">
                                            <span style="font-size: 10px;">Matured Value</span>
                                            <div class="row" style="border-right: 1.8px solid #b7b7b738;">
                                                <div class="col-md-4">
                                                    <h4 class="box-lbl-totalso" style="color: #596368;">-</h4>
                                                </div>
                                                <div class="col-md-8" style="text-align: right;">
                                                    <div class="row">

                                                        <div class="col-md-5" style="font-size: 15px;">Bounced:  </div>
                                                        <div class="col-md-7" style="color: #35b6fc; font-weight: 600;">-</div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <%-- <div class="progrees-bar-grid"><span style="position: absolute; margin-left: 6.5%; color: white;">58% </span>
                                                            <div style="width: 58%; background: #35b6fc; border-radius: 4px; height: 17px;"></div>
                                                        </div>--%>
                                    </div>

                                    <div style="background: white; width: 21.5%;">
                                        <div class="db-box-bg row">
                                            
                                             <div style="width:34%;">
                                                <div>
                                                    <div> <span style="font-size: 10px;">This Year</span> </div>
                                                    <div style="margin-top: -6px;"> <span class="coll-speedo-curr-year" style="font-size: 17px;color: #ffab00;font-weight: 500;">-</span> </div>
                                                </div>

                                                 <div style="margin-top:9px;">
                                                    <div> <span style="font-size: 10px;">Prev Year</span> </div>
                                                    <div style="margin-top: -6px;"> <span class="coll-speedo-prev-year" style="font-size: 17px;color: #596368;font-weight: 500;">-</span> </div>
                                                </div>
                                            </div>                                            
                                            
                                            <div style="width:66%;">
                                                <div style="margin: 10px 0px 0px 0px;">
                                                    <canvas id="spmeter-collection" style="width:160px;height:90px;"></canvas>
                                                    <div style="margin: -10px 0px 0px 38px; font-weight: 400; color: #ffab00;"><a class="collection-speed-perc">0%</a> Overall</div>
                                                </div>
                                            </div>


                                        </div>
                                        <%--   <div class="progrees-bar-grid"><span style="position: absolute; margin-left: 6.5%; color: white;">58% </span>
                                                            <div style="width: 58%; background: #35b6fc; border-radius: 4px; height: 17px;"></div>
                                                        </div>--%>
                                    </div>

                                </div>

                            </div>

                            <%--Collection Box End--%>
                        </div>



                        <div class="row" style="margin-top: 7px; height: 274px">

                            <%--<div  style="margin-left: 5px;background: white;width: 33%;border-bottom: 3px solid #15c52770;">
                                     <div class="sp-meter-bg"> 
                                       <div style="text-align: center;margin-top: 8px;background: #15c52721; color: #15c527;">COMPLETED TASKS</div>
                                       <div style="margin: 47px 0px 0px 2px;"> <canvas id="spmeter-comp-task"></canvas>  <div style="text-align:center;font-weight: 600;color:#0ea21d;"><b class="com-speed-perc"> 0</b> Completed</div> </div>
                                    </div>
                                   </div>

                                   <div style="margin-left: 5px;background: white;width: 33%;border-bottom: 3px solid #ffab006e;">
                                     <div class="sp-meter-bg">
                                       <div style="text-align: center;margin-top: 8px;background: #ffab0030; color: #ffab00;">PENDING TASKS</div>
                                       <div style="margin: 47px 0px 0px 2px;"> <canvas id="spmeter-pending-task"></canvas> <div style="text-align:center;font-weight: 600;color:#f4a401;"><b class="pending-speed-perc">0 </b> Pending</div>  </div>
                                    </div>
                                   </div>

                                   <div style="margin-left: 5px;background: white;width: 32.5%;border-bottom: 3px solid #d3272766;">
                                       <div class="sp-meter-bg-red">
                                       <div style="text-align: center;margin-top: 8px;background: #d327271a;color: #d32727;">OVERDUE TASKS</div>
                                       <div style="margin: 47px 0px 0px 2px;"> <canvas id="spmeter-overdue-task"></canvas> <div style="text-align:center;font-weight: 600;color:#eb3516;"><b class="overdue-speed-perc">0 </b> Overdue</div> </div>
                                           </div>
                                   </div>--%>

                            <div style="width: 38%">

                                <div class="nav-align-top card">
                                        <div style="display:flex;justify-content:center;background: #b5b5b50a;">
                                          <ul class="nav nav-tabs growth-chart-ul" role="tablist">
                                               <li class="nav-item">
                                                 <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-so" aria-controls="navs-so" aria-selected="true">Sales Order</button>
                                               </li>
                                               <li class="nav-item">
                                                 <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-invoice" aria-controls="navs-invoice" aria-selected="false">Invoice</button>
                                               </li>
                                               <li class="nav-item">
                                                 <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-collection" aria-controls="navs-collection" aria-selected="false">Collection</button>
                                               </li>
                                             </ul>
                                        </div>
                                             <div class="tab-content">

                                               <div class="tab-pane fade show active" id="navs-so" role="tabpanel">
                                                   <div id="chartGrowthSO" class="chartContainerGrowth" style="width: 101%; margin-left: -6px; height: 400px;"></div>
                                               </div>
                                               <div class="tab-pane fade" id="navs-invoice" role="tabpanel">
                                                 <div id="chartGrowthInv" class="chartContainerGrowth" style="width: 101%; margin-left: -6px; height: 400px;"></div>
                                               </div>
                                               <div class="tab-pane fade" id="navs-collection" role="tabpanel">
                                                <div id="chartGrowthColl" class="chartContainerGrowth" style="width: 101%; margin-left: -6px; height: 400px;"></div>
                                               </div>

                                             </div>
                                </div>
                                
                            </div>

                            <div style="width: 38%;margin-left: -18px;">

                                <div class="nav-align-top card">
                                        <div style="display:flex;justify-content:center;background: #b5b5b50a;">
                                             <ul class="nav nav-tabs compare-chart-ul" role="tablist">
                                               <li class="nav-item">
                                                 <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-comp-so" aria-controls="navs-comp-so" aria-selected="true">Sales Order</button>
                                               </li>
                                               <li class="nav-item">
                                                 <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-comp-invoice" aria-controls="navs-comp-invoice" aria-selected="false">Invoice</button>
                                               </li>
                                               <li class="nav-item">
                                                 <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-comp-collection" aria-controls="navs-comp-collection" aria-selected="false">Collection</button>
                                               </li>
                                             </ul>
                                        </div>
                                             <div class="tab-content">

                                               <div class="tab-pane fade show active" id="navs-comp-so" role="tabpanel">
                                                   <div id="chartCompareSO" class="chartCompare" style="width: 101%; height: 400px;"></div>
                                               </div>
                                               <div class="tab-pane fade" id="navs-comp-invoice" role="tabpanel">
                                                 <div id="chartCompareInv" class="chartCompare" style="width: 101%; height: 400px;"></div>
                                               </div>
                                               <div class="tab-pane fade" id="navs-comp-collection" role="tabpanel">
                                                <div id="chartCompareColl" class="chartCompare" style="width: 101%;  height: 400px;"></div>
                                               </div>

                                             </div>
                                </div>
                                
                            </div>


                            <div class="nav-align-top card pending-task-list-bg po-aging-parent-div" style="width: 25%; background: #ffffff; margin-left: -8px; margin-top: -1px;">
                                <span style="text-align: center;margin-top: 7px;font-weight: 500;background: #eae8e840;color: #d4432c;">TOP EMPLOYEES</span>

                                <div class="nav-scroll-custom">

                                    <div class="tab-pane fade show active" id="navs-entered" role="tabpanel">

                                        <div class="card-body entered-tab-div" style="padding: 0px; zoom: 90%;">
                                            
                                           <%-- <div class="row toponeempbox top-rank-bg-img">
                                                <ul class="m-0 entered-ul" style="list-style-type: none;">
                                                    <li style="float: left; padding-right: 14px;">
                                                        <img src="../Images/Profile/alternet.png" class="" alt="" style="width: 58px; border-radius: 50%; height: 56px;">
                                                    </li>
                                                    <li style="float: left; padding-right: 12px;"> <span style="color: #cc5a16;font-size: 16px;">Ibrahem Tawfiq Quriq </span> <br>
                                                        <span style="color: #a1acb8;">Information Tecnology</span> </li>

                                                    <li style="text-align: right;margin-right:29px;"><i style="font-size: xxx-large; color: #90e43b;text-shadow: 2px 0px 3px #4f930b,0px 8px 10px #4f930b;">1 <i style="font-size: 23px; margin-left: -13px;">st</i> </i></li>

                                                    <li>
                                                        <div class="row" style="display: flex;justify-content: center;margin-top: -17px;padding-bottom: 19px;"> 
                                                            <div style="width:18%;border-right: 1px solid #80808017;color:#148dcf;font-size: 20px;font-style: italic;" title="Sales Order"> 60%</div>
                                                            <div style="width:18%;border-right: 1px solid #80808017;color:#71a415;font-size: 20px;font-style: italic;" title="Invoice"> 79%</div>
                                                            <div style="width:18%;color:#e59900;font-size: 20px;font-style: italic;" title="Collection"> 66%</div>
                                                        </div>
                                                    </li>

                                                </ul>
                                            </div>

                                             <div class="row topsecondempbox top-rank-bg-img">
                                                <ul class="m-0 entered-ul" style="list-style-type: none;padding-top: 10px;">
                                                    <li style="float: left; padding-right: 14px;">
                                                        <img src="../Images/Profile/alternet.png" class="" alt="" style="width: 58px; border-radius: 50%; height: 56px;">
                                                    </li>
                                                    <li style="float: left; padding-right: 12px;"><span style="color: #cc5a16;font-size: 16px;">Anwar Ahmed </span> <br>
                                                        <span style="color: #a1acb8;">Information Tecnology</span> </li>

                                                    <li style="text-align: right;margin-right:29px;">
                                                        <i style="font-size: xxx-large; color: #35b6fc;text-shadow: 2px 0px 3px #0a5d8a,0px 8px 10px #5cb5e5;">2 
                                                        <i style="font-size: 23px; margin-left: -13px;">nd</i> 
                                                        </i>  
                                                    </li>

                                                     <li>
                                                        <div class="row" style="display: flex;justify-content: center;margin-top: -17px;padding-bottom: 19px;"> 
                                                            <div style="width:18%;border-right: 1px solid #80808017;color:#148dcf;font-size: 20px;font-style: italic;" title="Sales Order"> 60%</div>
                                                            <div style="width:18%;border-right: 1px solid #80808017;color:#71a415;font-size: 20px;font-style: italic;" title="Invoice"> 79%</div>
                                                            <div style="width:18%;color:#e59900;font-size: 20px;font-style: italic;" title="Collection"> 66%</div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>

                                             <div class="row topthirdempbox top-rank-bg-img">
                                                <ul class="m-0 entered-ul" style="list-style-type: none;padding-top: 10px;">
                                                    <li style="float: left; padding-right: 14px;">
                                                        <img src="../Images/Profile/alternet.png" class="" alt="" style="width: 58px; border-radius: 50%; height: 56px;">
                                                    </li>
                                                    <li style="float: left; padding-right: 12px;"><span style="color: #cc5a16;font-size: 16px;">Elyza Marie Ferrer</span> <br>
                                                       <span style="color: #a1acb8;">Information Tecnology</span> </li>

                                                    <li style="text-align: right;margin-right:29px;"><i style="font-size: xxx-large; color: #ffab00;text-shadow: 2px 0px 3px #765500,0px 8px 10px #765500;">3  <i style="font-size: 23px; margin-left: -13px;">rd</i> </i>  </li>

                                                     <li>                                                        
                                                         <div class="row" style="display: flex;justify-content: center;margin-top: -17px;padding-bottom: 19px;"> 
                                                            <div style="width:18%;border-right: 1px solid #80808017;color:#148dcf;font-size: 20px;font-style: italic;" title="Sales Order"> 60%</div>
                                                            <div style="width:18%;border-right: 1px solid #80808017;color:#71a415;font-size: 20px;font-style: italic;" title="Invoice"> 79%</div>
                                                            <div style="width:18%;color:#e59900;font-size: 20px;font-style: italic;" title="Collection"> 66%</div>
                                                        </div>

                                                    </li>
                                                </ul>
                                            </div>--%>


                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="navs-closed" role="tabpanel">

                                        <div class="card-body closed-tab-div" style="padding: 0px; zoom: 90%;">
                                            <ul class="p-0 m-0 closed-ul">
                                                <img src="assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>



                        </div>




                        <%--  <div class="row" style="margin-top: -8px;">

                        <%--  top 10 Vendor --

                        <div class="nav-align-top card pending-task-list-bg po-aging-parent-div" style="width: 33.5%; background: #ffffff; margin-left: .7%;">
                            <span style="text-align: center; margin-top: 7px; font-weight: 600;">AGING</span>
                            <ul class="nav nav-pills mb-3" role="tablist" style="margin-top: 1%; zoom: 80%;">
                                <li class="nav-item" style="width: 50%;">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-entered" aria-controls="navs-entered" aria-selected="true">Entered</button>
                                </li>
                                <li class="nav-item" style="width: 50%;">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-closed" aria-controls="navs-closed" aria-selected="false">Closed</button>
                                </li>
                            </ul>


                            <div class="tab-content nav-scroll-custom">

                                <div class="tab-pane fade show active" id="navs-entered" role="tabpanel">

                                    <div class="card-body entered-tab-div" style="padding: 0px; zoom: 90%;">
                                        <ul class="p-0 m-0 entered-ul">
                                            <img src="assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                        </ul>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="navs-closed" role="tabpanel">

                                    <div class="card-body closed-tab-div" style="padding: 0px; zoom: 90%;">
                                        <ul class="p-0 m-0 closed-ul">
                                            <img src="assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>


                        <%--For Pending Task with Aging--
                        <div class="nav-align-top card pending-task-list-bg po-aging-parent-div" style="width: 33.5%; margin-left: 0.7%;">
                            <span style="text-align: center; margin-top: 7px; font-weight: 600;">AGING</span>
                            <ul class="nav nav-pills mb-3" role="tablist" style="margin-top: 1%; zoom: 80%;">
                                <li class="nav-item" style="width: 50%;">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-overdue" aria-controls="navs-overdue" aria-selected="true">Overdue</button>
                                </li>
                                <li class="nav-item" style="width: 50%;">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pending" aria-controls="navs-pending" aria-selected="false">Pending</button>
                                </li>
                            </ul>


                            <div class="tab-content nav-scroll-custom">

                                <div class="tab-pane fade show active" id="navs-overdue" role="tabpanel">

                                    <div class="card-body overdue-tab-div" style="padding: 0px; zoom: 90%;">
                                        <ul class="p-0 m-0 overdue-ul">
                                            <img src="assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                        </ul>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="navs-pending" role="tabpanel">

                                    <div class="card-body pending-tab-div" style="padding: 0px; zoom: 90%;">
                                        <ul class="p-0 m-0 pending-ul">
                                            <img src="assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                        </ul>
                                    </div>
                                </div>

                            </div>

                        </div>


                        <%--Aging Remittence--
                        <div class="nav-align-top card pending-task-list-bg po-aging-parent-div" style="width: 30%; margin-left: 0.7%;">
                            <span style="text-align: center; margin-top: 7px; font-weight: 600;">AGING</span>
                            <ul class="nav nav-pills mb-3" role="tablist" style="margin-top: 1%; zoom: 80%;">
                                <li class="nav-item" style="width: 50%;">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-remitted" aria-controls="navs-remitted" aria-selected="true">Remitted</button>
                                </li>
                                <li class="nav-item" style="width: 50%;">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-cleared" aria-controls="navs-cleared" aria-selected="false">Cleared</button>
                                </li>
                            </ul>


                            <div class="tab-content nav-scroll-custom">
                          

                                <div class="tab-pane fade show active" id="navs-remitted" role="tabpanel">

                                    <div class="card-body remitted-tab-div" style="padding: 0px; zoom: 90%;">
                                        <ul class="p-0 m-0 remitted-ul">
                                            <img src="assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                        </ul>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="navs-cleared" role="tabpanel">

                                    <div class="card-body cleared-tab-div" style="padding: 0px; zoom: 90%;">
                                        <ul class="p-0 m-0 cleared-ul">
                                            <img src="assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                        </ul>
                                    </div>
                                </div>

                           
                            </div>
                        </div>

                        <%--end--

                    </div>--%>
                    </div>

                    <div class="content-backdrop fade"></div>
                </div>


                <%--for map--%>
                <!-- Make sure you put this AFTER Leaflet's CSS -->
                <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
                    integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM="
                    crossorigin=""></script>

                <%--map end--%>
                <script src="../Template/assets/vendor/libs/gauge/dist/gauge.js"></script>
                <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/d3-format@3"></script>
                <script src="../Dashboard/assets/vendor/js/menu.js"></script>
                <!-- endbuild -->

                <!-- Vendors JS -->
                <script src="../Dashboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>

                <!-- Main JS -->
                <script src="../Dashboard/assets/js/main.js"></script>
                <!-- Page JS -->
                <script src="../Dashboard/assets/js/dashboards-analytics.js"></script>

<script src="../assets/js/econnect-common.js"></script>

                <script src="Scripts/dashboard-main.js?v=2.2"></script>

                <!-- Place this tag in your head or just before your close body tag. -->
                <script async defer src="https://buttons.github.io/buttons.js"></script>

                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
                <script src="../Template/assets/js/canvasjs.js"></script>

                
                <script src="../Dashboard/assets/multiselect/jquery.multi-select.js"></script>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>


