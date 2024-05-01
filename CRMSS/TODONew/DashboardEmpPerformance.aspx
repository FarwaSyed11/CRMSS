<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="DashboardEmpPerformance.aspx.cs" Inherits="TODONew_DashboardEmpPerformance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"
     integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI="
     crossorigin=""/>

    <style>
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
        .loader-bg-blur{
              height: 100%;
    z-index: 9999999;
    position: fixed;
    background: #c3d3ce6b;
    width: 100%;
        }

        .nav-tabs .nav-item .nav-link:hover, .nav-tabs .nav-item .nav-link:focus {
    /*color: #ffffff;
    background: #e14b4b;*/
    color:#d4432c;
     background: #ffffff !important;
}
.nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
   /*color: #ffffff;
    background: #e14b4b;
    border-color: #fff;*/
   color:#d4432c;
     background: #ffffff !important;
    border-color: #fff !important;
    border-bottom: 2px solid #d4432c !important;
}



.nav-tabs button{
    background:white !important;
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
        .total-status-box{
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
        .proPicPosition{
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
  .total-countvalue-box{
          background: #ffeadd;
    /*color: white;*/
    height: 40px;
    font-size: 23px;
    margin: 2px;
    padding: 1px 9px;
    width:48%;
  }
  .map-div-position{
          position: relative;
    outline: none;
    border: groove;
    height: 443px;
    top: 7px;
    right: 11px;
  }
  .move-status-div{
      background: #ffeadd;   /*#c74949;*/
     color: #e36535; 
    position: relative;
    top: -11px;
    height: 8.5%;
    padding-top: 5px;
  }
  option :hover{
      background: #d4432c !important;
  }
    /*option:checked{
      COLOR: #d4432c;
  }*/
    .pr-aging-sq-green{
        color:#a3dc15; font-size: 1rem; line-height: 1.5; text-shadow: -1px 0px 3px #2b5e08;
    }
    .pr-aging-sq-orange{
        color:#ffab00; font-size: 1rem; line-height: 1.5; text-shadow: -1px 0px 3px #513908;
    }
    .pr-aging-sq-red{
        color:#ff3e1d; font-size: 1rem; line-height: 1.5; text-shadow: -1px 0px 3px #8c200e;
    }
    .pr-aging-sq-darkred{
        color:#c34747; font-size: 1rem; line-height: 1.5;
    }
    .pr-aging-sq-blue{
        color:#00a7ff; font-size: 1rem; line-height: 1.5; text-shadow: -1px 0px 3px #0b3951;
    }

    .pr-aging-count-green{
        color: #98ca3c;text-shadow: 0px 0.5px 0px green;
    }
    .pr-aging-count-orange{
        color: #ffab00;text-shadow: 0px 0.5px 0px #cb9809;
    }
    .pr-aging-count-red{
        color: #ff3e1d;text-shadow: 0px 0.5px 0px #d80f0f;
    }
    .pr-aging-count-darkred{
        color: #c34747;text-shadow: 0px 0.5px 0px #8a1010;
    } 
    .pr-aging-count-blue{
        color: #00a7ff;text-shadow: 0px 0.5px 0px #004a71;
    }

 .po-aging-parent-div .nav-pills .nav-link.active, .nav-pills .nav-link.active:hover, .nav-pills .nav-link.active:focus {
    background-color: #34b8ed00;
    color: #e67144;
    border-bottom: #e67144 3px solid;
    box-shadow: 0px 0px 0px 0px;
    border-radius: 0px;
}
    .pending-task-table th{
        background-color: #ffeadd;
        color:#e36535 !important;
    }
    .db-task-tab{
        width: 100%;
        background: #80808000;
        border: 0px;
        color: #750909f5;
        border: none;
    }
        .db-task-tab:focus {
            outline: none;
        }
    .progrees-bar-grid{
              font-size: 11px;
              height: 18px;
              width: 100px;
              background: #dddddd52;
              border-radius: 4px;
    }
    .closed-tab-div{
         background-image:url("./Asset/comp-task-bg-img.png");
         background-repeat: no-repeat;
         background-size: cover;
         background-position: center center;     
    }
    .open-tab-div{
         background-image:url("./Asset/pending-task-bg-img.png");
         background-repeat: no-repeat;
         background-size: cover;
         background-position: center center;
    } 
  
    .sp-meter-bg{
       background-image:url("./Asset/trans-img-for-speedometer.png");
         background-repeat: no-repeat;
         background-size: cover;
         background-position: center center; 
    }
    .sp-meter-bg-red{
       background-image:url("./Asset/trans-img-for-speedometer1.png");
         background-repeat: no-repeat;
         background-size: cover;
         background-position: center center; 
    }
    .db-box-bg{
       background-image:url("./Asset/db-box-bg-img1.png");
         background-repeat: no-repeat;
         background-size: cover;
         background-position: center center; 
         margin-top:6px;
    } 
    .pending-task-list-bg{
       background-image:url("./Asset/pattern-rect-box2.png");
         background-repeat: no-repeat;
         background-size: cover;
         background-position: center center; 
         margin-top:6px;
    }
    
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdnUserId" runat="server" />
       <asp:HiddenField ID="hdnCompId" runat="server" />
       <asp:HiddenField ID="hdnManagerId" runat="server" />
    <asp:HiddenField ID="hdnImagePath" runat="server" />
        <asp:HiddenField ID="hdnEmpFullName" runat="server" />

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always" >
                  

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
                          <td style="width:15%; border-left: 4px solid #cf5757;">
                              <h5><i style="color: #cf5757;">EMPLOYEE DASHBOARD</i></h5>
                          <ul class="nav nav-tabs dbSwitcher hidden" role="tablist">
   
    <li class="nav-item">
      <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-home" aria-controls="navs-top-home" aria-selected="true">Logistic</button>
    </li>
    <li class="nav-item">
      <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-profile" aria-controls="navs-top-profile" aria-selected="false">Purchase</button>
    </li>
   
  </ul>
                              <td style="width:18%;">
                                   <span id="Label11" style="font-family:Times New Roman;font-size:Medium;font-weight:bold;"> Manager</span>
                              <select id="ddlManager" class="form-select color-dropdown"></select>   
                              </td>
                          </td>
                         <%--<td style="width:2%;  COLOR: #d4432c;" class="tic-filter-td">Employee</td>--%>
                          <td style="width:20%" class="tic-filter-td">
                              <span id="lblEmpFilter" style="font-family:Times New Roman;font-size:Medium;font-weight:bold;">Employee</span>
                              <select id="ddlEmployee" class="form-select color-dropdown">
                              </select>
                          </td>

                          <td style="width:20%"> 
                                 <span id="lblMonthFilter" style="font-family:Times New Roman;font-size:Medium;font-weight:bold;">Month</span>
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
                               <%--<div class="input-group">
                              <label class="input-group-text "><i class="fa fa-calendar" style="COLOR: #d4432c;" aria-hidden="true"></i>
                                             <span style="margin-left: 6%; COLOR: #d4432c;">
                                                  From
                                             </span>
                                          
                                         </label>
                                         <input type="text" id="weeklyDatePickerStart" placeholder="Select Date" style="background:white;" class="form-control flatpickr-input active" readonly="readonly">
                                   </div>--%>
                          </td>
                           
                          <td style="width:20%"> 
                                   <span id="lblYearFilter" style="font-family:Times New Roman;font-size:Medium;font-weight:bold;">Year</span>
                              <select class="form-select placement-dropdown" id="ddlYear">
                                  <option value="2024">2024</option>
                                  <option value="2023">2023</option>
                                  <option value="2022">2022</option>
                                  </td>

                          <td class="no-border" style="width: 5%">

                              <%--<asp:LinkButton ID="btnSearch" runat="server" Text="Search"
                                  CssClass="btn btn-primary d-block" Font-Size="Small"></i>Search</asp:LinkButton>--%>
                              <input type="button" id="btnSearchDashBoard" value="Search" class="btn btn-primary d-block" style="font-size:small" /> 
                          </td>
                      </tr>
                  </table>
      
                   <%-- Filter bar End --%>
       
          

<%--First Row of Dashboard--%>
      <div class="container-xxl flex-grow-1 container-p-y">    <%--Parent div after filter--%>

                       <div class="row rowrev">     <%--second parent div--%>

                           <div class="card" style="width:15%;  border-left: 5px solid #ff7d3c;"> 
                             <div>  <img src="../Masters/assets/images/img_avatar.png" class="proPicPosition empProfilePic" alt="" /> </div>
                               <div style="position: relative; top: 13%; text-align: center;"><span style="color: #d4432c;">Hi, Have a good day.</span> <br /> <h5 class="empNameH">Anwar Ahmed</h5></div>
                               <div style="margin: 77px 0px 0px 24px;"> <canvas width="200" height="95" id="canvas-speedometer"></canvas>  </div>
                               <div style="color: #e1430ce3;font-weight: 600;margin: -13px 0px 0px 67px;letter-spacing: 2px;"><i>Performance</i></div>
                           </div>

                           <div class="" style="width:55%;">
                               <div class="row" style="height: 105px;">

                                   
                                   <div style="margin-left: 5px;background: white;width: 24.5%;border-left: 3px solid #00a7ff;">                                       
                                      <div class="db-box-bg">
                                             <span style="font-size: 10px;">Total Task</span>
                                            <div class="row">  
                                                 <div class="col-md-9"> <h4 class="box-lbl-totaltask" style="color: #35b6fc;">-</h4> </div>    
                                                 <div class="col-md-3"><img src="./Asset/icon-total-task.png" style="width: 41px;height: 40px;"></div>
                                            </div>
                                      </div>
                                   
                                   </div>
                                   

                                   <div style="margin-left: 5px;background: white;width: 24.5%;border-left: 3px solid #15c527;">
                                         <div class="db-box-bg">
                                                <span style="font-size: 10px;">Completed Task</span>
                                                <div class="row">  
                                                     <div class="col-md-9"> <h4 class="box-lbl-comptask" style="color: #15c527;">-</h4> </div>    
                                                     <div class="col-md-3"><img src="./Asset/icon-comp-task.png" style="width: 41px;height: 40px;"></div>
                                                </div>
                                         </div>
                                   </div>

                                   <div style="margin-left: 5px;background: white;width: 24.5%;border-left: 3px solid #ffab00;">
                                        <div class="db-box-bg">
                                                <span style="font-size: 10px;">Pending Task</span>
                                                <div class="row">  
                                                     <div class="col-md-9"> <h4 class="box-lbl-pendingtask" style="color: #ffab00;">-</h4> </div>    
                                                     <div class="col-md-3"><img src="./Asset/icon-pending-task.png" style="width: 41px;height: 40px;"></div>
                                                </div>
                                         </div>
                                   </div>

                                   <div style="margin-left: 5px;background: white;width: 24.5%;border-left: 3px solid #cf5757;">
                                       <div class="db-box-bg">
                                            <span style="font-size: 10px;">Overdue Task</span>
                                            <div class="row">  
                                                <div class="col-md-9"> <h4 class="box-lbl-overduetask" style="color: #cf5757;">-</h4> </div>    
                                                <div class="col-md-3"><img src="./Asset/icon-overdue-task.png" style="width: 41px;height: 40px;"></div>
                                            </div>
                                       </div>
                                   </div>

                                   

                               </div>

                              <%-- <div class="row" style="margin-left:-6px;">
                                   <div style="height: 50px;background: #fef5f5; margin-top: 6px;text-align:center;padding-top: 12px;"><h4 style="color: #fb5a5a; font-style: italic;">GRAPHICAL REPRESENTATION OF TASKS</h4></div>
                               </div>--%>
                                <div class="row" style="margin-top: 7px; height: 285px">
                                 <%--  <div style="margin-left: 5px;background: white;width: 24.5%;border-left: 3px solid #00a7ff;">
                                       <div style="margin: 77px 0px 0px 24px;"> <canvas width="200" height="95" id="canvas-speedometer1"></canvas>  </div>
                                   </div>--%>
                                   <div  style="margin-left: 5px;background: white;width: 33%;border-bottom: 3px solid #15c52770;">
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
                                   </div>
                               </div>

                           </div>
                              <%-- <div class="card" style="width:20%; display:none;">

                                   <div class="nav-align-top">
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-ticket" aria-controls="navs-ticket" aria-selected="true">Tickets Status</button>
    </li> 
   
  </ul>
  <div class="tab-content">
    <div class="tab-pane fade show active" id="navs-ticket" role="tabpanel">
       <div class="row" style="MARGIN-TOP: 3%;">

           <div class="col-6">
               
                   <div style="font-size: medium; font-weight: 600; position: relative; top: -9px;">Total PO Count </div>  
                   <div style="position: relative; top: -13px; font-size: x-large; color:#e35d5d;"><b class="tic-total-pr">0</b></div>
             
                 
           </div>
           <div class="col-6">
               <div style="font-size: medium; font-weight: 600; position: relative; top: -9px;">Total PO Amount </div>  
                   <div style="position: relative; top: -13px; font-size: x-large; color:#e35d5d;"><b class="tic-total-po">0</b></div>
           </div>
     
           <ul class="p-0 m-0 overview-tab-ull" style="margin-top: 3% !important;"> 
              
               <li class="d-flex" style="margin-bottom: 0.5rem !important;">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="">
                                                     <img src="img/incomplete2.png"></span> 
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <span style="font-size:smaller;color:#ffab00""  class="tic-pending-heading"><b>INCOMPLETE</b></span>
                                                      
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold"><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=Ticket_Submitted" class="tic-incomplete" style="font-size: medium; color:#ffab00" target="_blank">0</a></small>
                                                   </div>
                                               </div>
                                           </li> 

               <li class="d-flex" style="margin-bottom: 0.5rem !important;">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="">
                                                     <img src="img/inprocess3.png"></span>   
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <span style="font-size:smaller;color:#00a7ff""  class="tic-pending-heading"><b>IN PROCESS</b></span>
                                                      
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold"><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=Ticket_Submitted" class="tic-inprocess" style="font-size: medium; color:#00a7ff" target="_blank">0</a></small>
                                                   </div>
                                               </div>
                                           </li> 

               <li class="d-flex" style="margin-bottom: 0.5rem !important;">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="">
                                                      <img src="img/completed2.png"></span>
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <span style="font-size:smaller;color:#77b962""><b>COMPLETED</b></span>
                                                      
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold "><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=Ticket_Accepted" class="tic-completed" style="font-size: medium; color:#77b962" target="_blank">0</a></small>
                                                   </div>
                                               </div>
                                           </li>
               <li class="d-flex" style="margin-bottom: 0.5rem !important;">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="">
                                                      <img src="img/cancel1.png"></span>
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <span style="font-size:smaller;color:#e35d5d""><b>REAPPROVAL</b></span>
                                                      
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold " ><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=Ticket_Rejected" class="tic-cancelled" style="font-size: medium; color:#e35d5d" target="_blank">0</a></small>
                                                   </div>
                                               </div>
                                           </li>

           </ul>
                                     
              </div>
    
    </div>
    <div class="tab-pane fade" style="width:60%;" id="navs-container" role="tabpanel">
      
        <div class="row" style="MARGIN-TOP: -2%;">

           <div class="col-8">               
                   <div style="font-size: larger; text-shadow: 0px 5px 6px #cfc4c4; position: relative; top: -9px;">Total Container Count </div>  
                   <div style="position: relative; top: -13px; font-size: xx-large; color:#e35d5d;"><b class="cont-total">0</b></div>             
           </div>

           <div class="col-4">
               <div id="containerRoundChart" style="margin-top: -29%;"></div>
           </div>

           <ul class="p-0 m-0 overview-tab-ull" style="margin-top: -4% !important;"> 
               <li class="d-flex" style="margin-bottom: 0.5rem !important;">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="avatar-initial bg-label-primary">
                                                     <img src="img/PD.png"></span>
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <span style="font-size:smaller;">WAITING ASSIGMENT</span>
                                                      
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold cont-wait-assign" style="font-size: medium; color:#03c3ec">0</small>
                                                   </div>
                                               </div>
                                           </li> 
               <li class="d-flex" style="margin-bottom: 0.5rem !important;">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="avatar-initial bg-label-primary">
                                                      <i class="fa fa-thumbs-up" style="font-size:x-large; color:#71dd37;"></i></span>
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <span style="font-size:smaller;">LANDED FROM VSL</span>
                                                      
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold land-from-vsl-count" style="font-size: medium; color:#77b962">0</small>
                                                   </div>
                                               </div>
                                           </li>
                <li class="d-flex" style="margin-bottom: 0.5rem !important;">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="avatar-initial bg-label-primary">
                                                      <i class="fa fa-thumbs-down" style="font-size:x-large;color: #e35e5e;"></i></span>
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <span style="font-size:smaller;">FCL TO TOWN</span>
                                                      
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold fcl-to-town-count" style="font-size: medium; color:#e35d5d">0</small>
                                                   </div>
                                               </div>
                                           </li>
               <li class="d-flex" style="margin-bottom: 0.5rem !important;">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="avatar-initial bg-label-primary">
                                                     <i class="fa fa-info-circle" aria-hidden="true" style="FONT-SIZE: XX-LARGE; COLOR: #ffae09;"></i></span>
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <span style="font-size:smaller;">MTY TO TOWN</span>
                                                      
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold mty-to-town-count" style="font-size: medium; color:#ffab00">0</small>
                                                   </div>
                                               </div>
                                           </li> 
               
              

           </ul>
                                     
              </div>
    
    </div>
  
  </div>
</div>

                                  </div>--%>
                           


    <%--yearly graph display none--%>
            <div class="nav-align-top card h-100 revenue-tab" style="width:40%; background: #ffffff;margin-bottom: 0!important; display:none;">   <%--MAP Grid--%>

                            <ul class="nav nav-pills mb-3" style="top:6px;margin-bottom: 0!important;" role="tablist">
                                
                                 <li class="nav-item">
                                   <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" aria-selected="true" id="btnSototal">REVENUE<%--Total Value--%></button>
                                 </li>
                                 <li class="nav-item">
                                   <button type="button" class="nav-link " role="tab" data-bs-toggle="tab"  aria-selected="false" id="btnSoProductWise"><%--Product Wise--%></button>
                                 </li>                        
                              
                            </ul>
            <div class="tab-content card-body tabpnlttlvalue" role="tabpanel">
                <%--style="float: left; overflow-y: hidden; height: 339px;margin-bottom: 0!important;--%>
                    
                    <div class="tab-pane fade show active" id="navs-reve-won-loss-grph" >
                     <%--   <div class="row"> 
                                <div class="col-md-8">--%>

                            <div class="col-12 col-lg-12 order-2 ">
                               <%--<div class="card">--%>
                                   <div class="row row-bordered g-0">
                                      
                                       <div class="col-md-8">
                                           <%--<h5 class="card-header m-0 me-2 pb-3 totrevtop">Total Revenue</h5>--%>
                                           <div id="totalRevenueChartCRMS1" class="px-2  totrev"></div>
                                       </div>

                                       <div class="col-md-4">
                                           <div class="cardbody-wonper">
                                               <div class="text-center" style="text-shadow: 0px 5px 6px #cfc4c4;">
                                                   Won Percentage 
                                                 
                                               </div>
                                           </div>
                                           <div id="growthChartCRMS" class="grwtcharttop"></div>
                                           <%--<div class="text-center fw-semibold pt-3 mb-2">62% Company Growth</div>--%>

                                           <div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
                                               <div class="d-flex">
                                                   <div class="me-2">
                                                       <span class="badge bg-label-primary p-2">
                                                          <i class="fa fa-thumbs-up text-primary" style="font-size:x-large;color:#64c345 !important;"></i></span>
                                                   </div>
                                                   <div class="d-flex flex-column roundgraph-year-profit">
                                                       <small>Won</small>
                                                       <h6 class="mb-0">$32.5k</h6>
                                                   </div>
                                               </div>
                                               
                                                  <div class="d-flex">
                                                   <div class="me-2">
                                                       <span class="badge bg-label-info p-2">
                                                           <i class="fa fa-thumbs-down text-primary" style="font-size:x-large; color:#e35d5d !important;"></i> </span>
                                                   </div>
                                                   <div class="d-flex flex-column roundgraph-year-loss">
                                                       <small>Lost</small>
                                                       <h6 class="mb-0">$41.2k</h6>
                                                   </div>
                                               </div>

                                           </div>

                                          
                                       </div>
                                   </div>
                       <%--        </div>--%>
                           </div>

                         <%--       </div> 
                               
                        </div>--%>
                         
                    </div>
    
                    

               

        </div>

 </div>
                        

                           <%--<div style="width:35%; background:white;">

                               <div class="row">
                                   <%--<div style="width: 36%;margin-top: 115px;font-style: italic;font-weight: 700;">
                                       <div> <i style="text-decoration: underline;font-size: 22px;">Request Count</i>  </div>

                                       <div> <i class="bx bxs-circle pr-aging-sq-green" aria-hidden="true"></i>  Below 14<i class="bx bx-up-arrow-alt" style="color: #a3dc15;"></i> days :   <i class="pr-aging-count-green"></i>  </div>
                                       <div> <i class="bx bxs-circle pr-aging-sq-orange" aria-hidden="true"></i> Beyond 14<i class="bx bx-down-arrow-alt" style="color: #ffab00;"></i> days :  <i class="pr-aging-count-orange"></i>  </div>
                                       <div> <i class="bx bxs-circle pr-aging-sq-red" aria-hidden="true"></i>    Beyond &nbsp;1<i class="bx bx-down-arrow-alt" style="color: #ff3e1d;"></i> Month :  <i class="pr-aging-count-red"></i>  </div>
                                       <div> <i class="bx bxs-circle pr-aging-sq-darkred" aria-hidden="true"></i>Beyond &nbsp;3<i class="bx bx-down-arrow-alt" style="color: #c34747;"></i> Months:  <i class="pr-aging-count-darkred"></i>  </div>
                                   </div> --
                               
                                   <div style="width:100%">
                                       
                                        <div id="chartDogPayTerm" style="width: 100%;"></div>
                                   </div>  
                               </div>
                               
                           </div>--%>



                            <%--Pie Chart PR--%>
                          <div style="width:30%;"> 

                              <div class="row" style="margin-top:4px;">  
                                <div id="chartStackEmp" style="width: 96%;"></div>
                            </div>
                             <%-- <div class="row">
                                  <div class="row"  style="background: white;margin: 0px 0px 0px 13px; width: 96%;">  

                                      <div style="width:30%; height: 200px;">
                                         <div style="margin-top:50%;">
                                            <div> <i class="bx bxs-circle pr-aging-sq-green" aria-hidden="true"></i>   Total &nbsp;:   <i class="pr-aging-count-green">0</i>  </div>
                                            <div> <i class="bx bxs-circle pr-aging-sq-red" aria-hidden="true"></i> Open &nbsp;:    <i class="pr-aging-count-red">0</i>  </div>
                                            <div> <i class="bx bxs-circle pr-aging-sq-blue" aria-hidden="true"></i>  Closed:   <i class="pr-aging-count-blue">0</i>      </div>
                                        </div>
                                    </div> 

                                      <div id="chartDogOPennClosedPO" class="mb-2" style="width:60%; height: 200px;"></div> 
                                  </div>
                            </div>
                    
                            <div class="row" style="margin-top:4px;">  
                                <div id="chartDogIncoterm" style="width: 96%; height: 210px;"></div>
                            </div>--%>
                        
                      </div> 
                           <%--end--%>


            </div>   <%--End second parent div here--%> 

                       <div class="row" style="margin-top: -8px;">
                           
                           <!-- Overview -->
                                             
                           
                  <%--  top 10 Vendor --%>

                <div class="nav-align-top card" style="width:45%; background: #ffffff; margin-left: .7%;">
                           <%-- <ul class="nav nav-pills mb-3" role="tablist" style="margin-top: 1%;">
                              <li class="nav-item">
                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-t50-opp" aria-controls="navs-t50-opp" aria-selected="true">Top 10 Vendors List</button>
                              </li>
                              <%--<li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-t50-tender" aria-controls="navs-t50-tender" aria-selected="false">Top 50 Tender</button>
                              </li>--
                            </ul>--%>
                   <%--<span style="text-align:center;color:#e36535;background: #ffeadd;margin-top: 7px;">TOP 10 VENDOR LIST</span>--%> 

                         <div class="nav-scroll-custom" >
                            
                            <div id="chartContainer" style=" width: 100%; margin-top:40px;"></div>
                            
                        </div>
                </div>

                 

<%--           <div class="nav-align-top card" style="width:35.5%; background: #ffffff; margin-left: .7%;">
                           
                      <span style="text-align:center;color:#e36535;background: #ffeadd;margin-top: 7px;">PO Line Pending </span> 

                      <div class="nav-scroll-custom" style="margin-top: 4px;text-align:center;">  
                           <div style="border: 1px solid #dfdfdf;">   
                             
                             <div class="row mb-1" style="background: #1dbfb2fa; color:white;">
                                 <div class="col-md-4">PO LINE</div>
                                 <div class="col-md-4">QTY</div>
                                 <div class="col-md-4">VALUE</div>
                             </div>
                             
                             <div class="row mb-1" style="border-bottom: 1px solid #f7f7f7;">
                                 <div class="col-md-4" style="color:#00a7ff;text-align: left;padding-left: 30px;">TICKETS ISSUED</div>
                                 <div class="col-md-4 tic-issued-count">0</div>
                                 <div class="col-md-4 tic-issued-value" style="color:#00a7ff;">0</div>
                             </div>

                             <div class="row mb-1" style="border-bottom: 1px solid #f7f7f7;">
                                 <div class="col-md-4" style="color:#77b962;text-align: left;padding-left: 30px;">TICKETS NOT DUE</div>
                                 <div class="col-md-4 tic-notdue-count">0</div>
                                 <div class="col-md-4 tic-notdue-value" style="color:#77b962;">0</div>
                             </div>

                             <div class="row mb-1" style="border-bottom: 1px solid #f7f7f7;">
                                 <div class="col-md-4" style="color:#ffab00;text-align: left;padding-left: 30px;">TICKETS DUE</div>
                                 <div class="col-md-4 tic-due-count">0</div>
                                 <div class="col-md-4 tic-due-value" style="color:#ffab00;">0</div>
                             </div>

                             <div class="row mb-1" style="border-bottom: 1px solid #f7f7f7;">
                                 <div class="col-md-4" style="color:#e35d5d;text-align: left;padding-left: 30px;">RED FLAG</div>
                                 <div class="col-md-4 tic-redflag-count">0</div>
                                 <div class="col-md-4 tic-redflag-value" style="color:#e35d5d;">0</div>
                             </div>
</div>
                             <div class="row" style="margin-top:11px">
                                  <div id="chartDogPOLineLevel" style="width:100%; height: 300px;"></div> 
                             </div>

                        

                </div>
       </div>--%>

                                          <%--For Pending Task with Aging--%>
             <div class="nav-align-top card pending-task-list-bg po-aging-parent-div" style="width:28%; margin-left: 0.7%;">                            
                   <span style="text-align:center;margin-top: 7px;font-weight: 600;font-size: 17px;">PENDING TASKS</span> 
                                  
                                <div class="table-responsive" style="margin-top: 1%;width:100%;max-height:470px;">
                                         <table class="table pending-task-table" style="width: 100%;zoom:80%;">
                                           <%--<caption class="ms-4">List of Projects</caption>--%>
                                           <thead>
                                             <tr>
                                                 <th>Task Name</th>
                                                 <th>Project Name</th>                                                                             
                                                 <th>Due Date</th>                                                                             
                                                 <th>Due</th>                                                                             
                                             </tr>
                                           </thead>
                                           <tbody class="tbody-pending-task" >

                                           </tbody>
                                         </table>
                               </div>

                       <%--  <div class="nav-scroll-custom" >                                 
                                   <div class="card-body" >
                                       <ul class="p-0 m-0 top-moving-items-ul">
                                           <img src="assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                      
                                       </ul>
                                   </div>  
                        </div>--%>
                </div>


                           <%--For Involved Project--%>
           <div class="nav-align-top card po-aging-parent-div" style="width:24.4%; background: #ffffff; margin-left: 0.7%;">
               <span style="text-align:center;margin-top: 7px;font-weight: 600;">INVOLVED PROJECTS</span>   
               <ul class="nav nav-pills mb-3" role="tablist" style="margin-top: 1%; zoom:80%;">
                              <li class="nav-item" style="width:50%;">
                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-open-proj" aria-controls="navs-open-proj" aria-selected="true">Open</button>
                              </li>
                              <li class="nav-item" style="width:50%;">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-closed-proj" aria-controls="navs-closed-proj" aria-selected="false">Closed</button>
                              </li>
                            </ul>
                    

                         <div class="tab-content nav-scroll-custom" >
                         <%--<div class="nav-scroll-custom" >--%>
                            
                            <div class="tab-pane fade show active" id="navs-open-proj" role="tabpanel">
                                 
                                   <div class="card-body open-tab-div" style="padding:0px;zoom:90%;">
                                       <ul class="p-0 m-0 open-proj-ul">
                                           <img src="assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                      
                                       </ul>
                                   </div>                            
                          </div>

                         <div class="tab-pane fade" id="navs-closed-proj" role="tabpanel">
                               
                                   <div class="card-body closed-tab-div" style="padding:0px;zoom:90%;">
                                       <ul class="p-0 m-0 closed-proj-ul">
                                           <img src="assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                      
                                       </ul>
                                   </div>
                        </div>
                            
                       <%-- </div>--%>
                
                   </div>
            </div>

            
                           <!--/ Order Statistics -->
                           </div>

                         

          <div class="card hidden" style="position: relative; margin-top: -0.5%; min-height: 450px;">

              <div class="row">
                    <div class="col-6" style="padding: 1% 1.5%;">
                        <div class="move-status-div"><h3 style="TEXT-ALIGN: center; color:#e36535;">MOVEMENT STATUS SUMMARY</h3> </div>
                        <div class="row">
                            <div class="col-4">
                                <%--<div class="summary-box"><i class="fa fa-truck " title="View File" style="color: #c2daf3;cursor:pointer;font-size: x-large;margin-right: 5%;"></i> <b>TICKET CREATED</b> <b style="float: right;">59</b></div>--%>
                                          <%--<div class="summary-box"><i class="fa fa-ship " title="View File" style="color: #c2daf3;cursor:pointer;font-size: x-large;margin-right: 5%;"></i> <b>TICKET ACCEPTED </b> <b style="float: right;">59</b></div>--%>
                                          <%--<div class="summary-box"><i class="fa fa-truck " title="View File" style="color: #c2daf3;cursor:pointer;font-size: x-large;margin-right: 5%;"></i> <b>TICKET REJECTED</b> <b style="float: right;">59</b></div>--%>
                                  <div class="summary-box"><i class="fa fa-ship " title="View File" style="color: #cd5050;cursor:pointer;font-size: x-large;margin-right: 5%;"></i> <b><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=Direct_Delivery" style="color: #e36535;" target="_blank">DIRECT DELIVERY</a></b>
                                      
                                    <div class="row">
                                      <div class="col-6"> <div style="color: #cd5050;">Count</div> <b class="dd-count">0</b></div>
                                      <div class="col-6"><div style="color: #cd5050;">Value</div><b class="dd-value">0</b></div>
                                    </div>
                                      
                                      </div>

                                <div class="summary-box"><i class="fa fa-ship " title="View File" style="color: #cd5050;cursor:pointer;font-size: x-large;margin-right: 5%;"></i> <b><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=Transit" style="color: #e36535;" target="_blank">TRANSIT</a></b>                                    
                                     <div class="row">
                                      <div class="col-6"> <div style="color: #cd5050;">Count</div> <b class="transit-count">0</b></div>
                                      <div class="col-6"><div style="color: #cd5050;">Value</div><b class="transit-value">0</b></div>
                                    </div>

                                </div> 

                                <div class="summary-box"> <i class="fa fa-truck " title="View File" style="color: #cd5050;cursor:pointer;font-size: x-large;margin-right: 5%;"></i><b style="font-size: 14px;"><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=Waiting_For_Original_Docs" style="color: #e36535;" target="_blank">WAITING FOR ORIGINAL DOCs</a> </b> 
                                    <div class="row">
                                      <div class="col-6"> <div style="color: #cd5050;">Count</div> <b class="WFODOC-count">0</b></div>
                                      <div class="col-6"><div style="color: #cd5050;">Value</div><b class="WFODOC-value">0</b></div>
                                    </div>

                                </div>

                                 <div class="summary-box"><i class="fa fa-truck " title="View File" style="color: #cd5050;cursor:pointer;font-size: x-large;margin-right: 5%;"></i> <b style="font-size: 12px;"><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=Original_Received_From_Bank" style="color: #e36535;" target="_blank">ORIGINAL RECEIVED FROM BANK</a></b> 
                                     <div class="row">
                                      <div class="col-6"> <div style="color: #cd5050;">Count</div> <b class="ORFB-count">0</b></div>
                                      <div class="col-6"><div style="color: #cd5050;">Value</div><b class="ORFB-value">0</b></div>
                                    </div>

                                 </div>

                                
                            </div>

                            <div class="col-4">                 
                                    
                                  <div class="summary-box"><i class="fa fa-ship " title="View File" style="color: #cd5050;cursor:pointer;font-size: x-large;margin-right: 5%;"></i> <b><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=Landed_On_Port" style="color: #e36535;" target="_blank">LANDED ON PORT</a></b> 
                                      <div class="row">
                                      <div class="col-6"> <div style="color: #cd5050;">Count</div> <b class="LOP-count">0</b></div>
                                      <div class="col-6"><div style="color: #cd5050;">Value</div><b class="LOP-value">0</b></div>
                                    </div>

                                  </div>                                

                                 <div class="summary-box"> <i class="fa fa-truck " title="View File" style="color: #cd5050;cursor:pointer;font-size: x-large;margin-right: 5%;"></i><b style="font-size: 12px;"><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=Delivery_Order_Collection" style="color: #e36535;" target="_blank">DELIVERY ORDER COLLECTION</a></b>
                                      <div class="row">
                                      <div class="col-6"> <div style="color: #cd5050;">Count</div> <b class="DOC-count">0</b></div>
                                      <div class="col-6"><div style="color: #cd5050;">Value</div><b class="DOC-value">0</b></div>
                                    </div>

                                 </div>

                                 <div class="summary-box"><i class="fa fa-ship " title="View File" style="color: #cd5050;cursor:pointer;font-size: x-large;margin-right: 5%;"></i> <b><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=BOE_Approved" style="color: #e36535;" target="_blank">BOE APPROVED</a></b> 
                                     <div class="row">
                                      <div class="col-6"> <div style="color: #cd5050;">Count</div> <b class="BOE-count">0</b></div>
                                      <div class="col-6"><div style="color: #cd5050;">Value</div><b class="BOE-value">0</b></div>
                                    </div>

                                </div>                                             
                                
                                <div class="summary-box"> <i class="fa fa-truck " title="View FilhdnUserIde" style="color: #cd5050;cursor:pointer;font-size: x-large;margin-right: 5%;"></i><b><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=Out_For_Delivery" style="color: #e36535;" target="_blank">OUT FOR DELIVERY</a></b> 
                                     <div class="row">
                                      <div class="col-6"> <div style="color: #cd5050;">Count</div> <b class="OFD-count">0</b></div>
                                      <div class="col-6"><div style="color: #cd5050;">Value</div><b class="OFD-value">0</b></div>
                                    </div>

                                </div>
                              

                               

                            </div>

                            <div class="col-4">
                                
                                    <div class="summary-box"> <i class="fa fa-truck " title="View File" style="color: #cd5050;cursor:pointer;font-size: x-large;margin-right: 5%;"></i><b><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=Cargo_Delivered" style="color: #e36535;" target="_blank">CARGO DELIVERED</a> </b> 
                                              <div class="row">
                                      <div class="col-6"> <div style="color: #cd5050;">Count</div> <b class="CDel-count">0</b></div>
                                      <div class="col-6"><div style="color: #cd5050;">Value</div><b class="CDel-value">0</b></div>
                                    </div>

                                </div>                                
                                        
                                 <div class="summary-box"><i class="fa fa-ship " title="View File" style="color: #cd5050;cursor:pointer;font-size: x-large;margin-right: 5%;"></i> <b><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=LCM_Created" style="color: #e36535;" target="_blank">LCM CREATED</a></b>
                                              <div class="row">
                                      <div class="col-6"> <div style="color: #cd5050;">Count</div> <b class="LCMC-count">0</b></div>
                                      <div class="col-6"><div style="color: #cd5050;">Value</div><b class="LCMC-value">0</b></div>
                                              </div>

                                </div>

                                  <div class="summary-box"><i class="fa fa-ship " title="View File" style="color: #cd5050;cursor:pointer;font-size: x-large;margin-right: 5%;"></i> <b><a href="/crmss/Purchase/cargodetail.aspx?moveStatus=Ticket_Closed" style="color: #e36535;" target="_blank">TICKET CLOSED</a></b>
                                              <div class="row">
                                      <div class="col-6"> <div style="color: #cd5050;">Count</div> <b class="tic-closed-count">0</b></div>
                                      <div class="col-6"><div style="color: #cd5050;">Value</div><b class="tic-closed-value">0</b></div>
                                              </div>

                                </div>
                                          <%--<div class="summary-box"> <i class="fa fa-truck " title="View File" style="color: #c2daf3;cursor:pointer;font-size: x-large;margin-right: 5%;"></i><b>TICKET CLOSED</b> <b style="float: right;">59</b></div>--%>
                            </div>
                        </div>


                    </div>


                    <div class="col-6">
                       <div class="row" style="position: relative; top: 5px;">
                           <div class="total-count-curr total-countvalue-box"> </div>
                           <div class="total-values-curr total-countvalue-box"> </div>
                       </div>

                        <div id='mapSarathe' class="map-div-position"></div>
                    </div>
              </div>
          </div>




          <%--second row parent div display none--%>
                       <div class="row" style="position: relative; margin-top: -1.8%; display:none;"> 

  <div class="nav-align-top card h-100 overview-tender-hold-joh-tab" style="width:32.2%; background: #ffffff; ">
                            <ul class="nav nav-pills mb-3 hidden" style="top:6px;background: #fff2f2;" role="tablist">
                                <li class="nav-item">
                                   <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-JOH" aria-controls="navs-pills-JOH" aria-selected="true"><%--JOH Overview--%> Cheque Status</button>
                                 </li>
                                 <li class="nav-item">
                                   <%--<button type="button" class="nav-link " role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-tender" aria-controls="navs-pills-tender" aria-selected="false">Tender Overview</button>--%>
                                 </li>                                 
                                 <li class="nav-item">
                                   <%--<button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-Hold" aria-controls="navs-pills-Hold" aria-selected="false">Hold Overview</button>--%>
                                 </li>
                            </ul>
     <div class="tab-content card-body" style="float: left; height: 615px;" role="tabpanel">
                   
                    <div class="tab-pane fade " id="navs-pills-tender" >

                                

                     <div class="row" style="margin-top: -1.2%;">
                           <!-- Overview -->
                         
                     
                                 <%--  <div class="card-header d-flex align-items-center justify-content-between pb-0">
                                       <div class="card-title mb-0">
                                           <h5 class="m-0 me-2">Overview</h5>
                                       </div>
                                   
                                   </div>--%>
                                   <div class="card-body" style="margin-top: -71px;">
                                       <div class="d-flex justify-content-between align-items-center">
                                           <div class="d-flex flex-column align-items-center gap-1">
                                               <h2 class="mb-2 oview-tender-count" style="color:#c74747;"><img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 39%; padding-right:13%;" /></h2>
                                            <%--   <span>#JOH</span>--%>
                                           </div>
                                           <div id="overViewTenderChart"></div>
                                       </div>
                                       <ul class="p-0 m-0 overview-tender-tab-ul" style="margin-top: -32px !important;">
                                       </ul>
                                   </div>
                 
              
                           <!--/ Order Statistics -->
                           </div>
                    </div>
    
                    <div class="tab-pane fade show active" id="navs-pills-JOH" role="tabpanel">

                             <div class="row"> 
                                <div class="col-md-12 ">                                                         
                                              <h3 style="text-shadow: 0px 5px 6px #cfc4c4; text-align: center;">Cheque Status</h3>                          
                                    <%-- <div class="row">
                                        <div class="col-md-8"><h4 class="sTotalValue"> </h4></div>
                                         <div class="col-md-4"> <h4 class="forecast-total-value"> </h4>  </div>
                                    </div>--%>

                                    <div class="row">
                                        <div class="col-md-6">

                                            <h6 >PENDING DUE:  <b class="cheq-pending-val" style="color:#e35d5d"></b>  </h6>
                                            <h6> PENDING NOT DUE:  <b  class="cheq-pending-not-due-val" style="color:#247dbd"></b>   </h6>
                                           <%-- <h6 class="forecast-lost-value" style="color:#e35d5d">   </h6>
                                            <h6 class="forecast-nosal" style="color:#e35d5d">   </h6>--%>
                                        </div>

                                        <div class="col-md-6">
                                            <h6> CLEARED:  <b  class="cheq-cleared-val" style="color:#399d39"></b> </h6>
                                             
                                       <%--      <h6 class="forecast-finalized" style="color:#399d39">   </h6>--%>
                                        </div>
                                    </div>
                                    

                                </div> 
                                <div class="col-md-4"><div id="forecastedOppChart1"></div> <%--<div id="forecastedOppChart"></div>--%> </div>
                        </div>

                         <div class="row" style="margin-top: -1.2%;">
                           <!-- Overview -->                        
                     
                                   <div class="card-body" style="margin-top: -71px;">
                                       <div class="d-flex justify-content-between align-items-center">
                                           <div class="d-flex flex-column align-items-center gap-1">
                                               <%--<h2 class="mb-2 oview-joh-count" style="color:#c74747;"><img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 39%; padding-right:13%;" /></h2>--%>
                                              <%-- <span>#JOH</span>--%>
                                           </div>
                                           <div id="overViewChart"></div>
                                       </div>
                                       <ul class="p-0 m-0 overview-tab-ul" style="margin-top: 5% !important;">                                          
                                           <img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 39%; padding-right:13%;" />
                                       </ul>
                                   </div>
                 
              
                           <!--/ Order Statistics -->
                           </div>
                    </div>

                    <div class="tab-pane fade" id="navs-pills-Hold" role="tabpanel">                       
                        <div class="row" style="margin-top: -1.2%;">
                           <!-- Overview -->
                         
                     
                                 <%--  <div class="card-header d-flex align-items-center justify-content-between pb-0">
                                       <div class="card-title mb-0">
                                           <h5 class="m-0 me-2">Overview</h5>
                                       </div>
                                   
                                   </div>--%>
                                   <div class="card-body" style="margin-top: -71px;">
                                       <div class="d-flex justify-content-between align-items-center">
                                           <div class="d-flex flex-column align-items-center gap-1">
                                               <h2 class="mb-2 oview-hold-count" style="color:#c74747;"><img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 39%; padding-right:13%;" /></h2>
                                           <%--    <span>#JOH</span>--%>
                                           </div>
                                           <div id="overViewHoldChart"></div>
                                       </div>
                                       <ul class="p-0 m-0 overview-hold-tab-ul" style="margin-top: -32px !important;">
                                           <li class="d-flex mb-4 pb-1">
                                               <div class="avatar flex-shrink-0 me-3">
                                                   <span class="avatar-initial bg-label-primary">
                                                       <i class='fa fa-thumbs-up' style="font-size:x-large; color:#71dd37;"></i></span>
                                               </div>
                                               <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                   <div class="me-2">
                                                       <h6 class="mb-0">Secured</h6>
                                                       <%--<small class="text-muted">Mobile, Earbuds, TV</small>--%>
                                                   </div>
                                                   <div class="user-progress">
                                                       <small class="fw-semibold ov-secured-value">Loading...</small>
                                                   </div>
                                               </div>
                                           </li>                                          
                                           
                                       </ul>
                                   </div>
                 
              
                           <!--/ Order Statistics -->
                           </div>
                   </div>

       </div>

  </div>

                           <%--end--%>


            <div class="nav-align-top card h-100 forecast-opp-tab" style="width:33.2%; background: #ffffff; margin-left:1%">
                            <ul class="nav nav-pills mb-3" style="top:6px;background: #fff2f2;" role="tablist">
                                <li class="nav-item" style="width: 29%;">
                                   <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-profile" aria-controls="navs-pills-top-profile" aria-selected="true" style="font-size: 77%; width: 75%;">Contract Expire 30 Days</button>
                                 </li>
                                 <li class="nav-item" style="margin-left: -6%; width: 29%;">
                                   <button type="button" class="nav-link " role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-home" aria-controls="navs-pills-top-home" aria-selected="false" style="font-size: 77%; width: 75%;">Contract Expire 60 Days</button>
                                 </li>                                 
                                 <li class="nav-item" style="margin-left: -6%; width: 29%;">
                                   <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-messages" aria-controls="navs-pills-top-messages" aria-selected="false" style="font-size: 77%; width: 75%;">Contract Expire 90 Days</button>
                                 </li>
                                 <li class="nav-item" style="margin-left: -6%; width: 29%;">
                                   <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-messages4" aria-controls="navs-pills-top-messages4" aria-selected="false" style="font-size: 77%; width: 75%;">Contract Expire 120 Days</button>
                                 </li>
                            </ul>
                <div class="tab-content card-body" style="float: left; overflow-y: auto; height: 549px;" role="tabpanel">
                    <div class="tab-pane fade " id="navs-pills-top-home" >
                        <div class="row"> 
                                <div class="col-md-8 ">                                                         
                                                                        
                                     <div class="row">
                                        <div class="col-md-8"><h4 class="sTotalValue"> </h4></div>
                                         <div class="col-md-4"> <h4 class="forecast-total-value"> </h4>  </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="forecast-won-value" style="color:#399d39">   </h6>
                                            <h6 class="forecast-lost-value" style="color:#e35d5d">   </h6>
                                            <h6 class="forecast-nosal" style="color:#e35d5d">   </h6>
                                        </div>

                                        <div class="col-md-6">
                                             <h6 class="forecast-pipeline" style="color:#247dbd">   </h6>
                                             <h6 class="forecast-finalized" style="color:#399d39">   </h6>
                                        </div>
                                    </div>
                                    

                                </div> 
                                <div class="col-md-4"><div id="forecastedOppChart11"></div> <%--<div id="forecastedOppChart"></div>--%> </div>
                        </div>
                         <ul class="p-0 m-0 con-sixty-days-ul ">  <img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 100%;">  </ul>
                    </div>
    
                    <div class="tab-pane fade show active" id="navs-pills-top-profile" role="tabpanel">
     
                          <div class="row"> 
                                <div class="col-md-8 ">

                                      <div class="row">
                                        <div class="col-md-8"><h4 class="tTotalValue"> </h4></div>
                                         <div class="col-md-4"> <h4 class="forecast-pending-total-value"> </h4>  </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="pending-forecast-won-value" style="color:#399d39">   </h6>
                                            <h6 class="pending-forecast-lost-value" style="color:#e35d5d">   </h6>
                                            <h6 class="pending-forecast-nosal" style="color:#e35d5d">   </h6>
                                        </div>

                                        <div class="col-md-6">
                                             <h6 class="pending-forecast-pipeline" style="color:#247dbd">   </h6>
                                             <h6 class="pending-forecast-finalized" style="color:#399d39">   </h6>
                                        </div>
                                    </div>

                                </div> 
                                <div class="col-md-4"> <div id="pendingForecastedOppChart"></div> </div>
                        </div>
                          <ul class="p-0 m-0 con-thirty-days-ul">  </ul>

                    </div>

                    <div class="tab-pane fade" id="navs-pills-top-messages" role="tabpanel">
                       
                          <div class="row"> 
                                <div class="col-md-8 ">

                                      <div class="row">
                                        <div class="col-md-8"><h4 class="nTotalValue"> </h4></div>
                                         <div class="col-md-4"> <h4 class="forecast-futur-total-value"> </h4>  </div>
                                    </div>

                                  <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="futur-forecast-won-value" style="color:#399d39">   </h6>
                                            <h6 class="futur-forecast-lost-value" style="color:#e35d5d">   </h6>
                                            <h6 class="futur-forecast-nosal" style="color:#e35d5d">   </h6>
                                        </div>

                                        <div class="col-md-6">
                                             <h6 class="futur-forecast-pipeline" style="color:#247dbd">   </h6>
                                             <h6 class="futur-forecast-finalized" style="color:#399d39">   </h6>
                                        </div>
                                    </div>

                                </div> 
                                <div class="col-md-4"> <div id="futureForecastedOppChart"></div> </div>
                        </div>
                          <ul class="p-0 m-0 con-ninety-days-ul">  </ul>

                   </div>

                      <div class="tab-pane fade" id="navs-pills-top-messages4" role="tabpanel">
                       
                          <div class="row"> 
                                <div class="col-md-8 ">

                                      <div class="row">
                                        <div class="col-md-8"><h4 class="otTotalValue"> </h4></div>
                                         <div class="col-md-4"> <h4 class="forecast-futur-total-value"> </h4>  </div>
                                    </div>

                                  <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="futur-forecast-won-value" style="color:#399d39">   </h6>
                                            <h6 class="futur-forecast-lost-value" style="color:#e35d5d">   </h6>
                                            <h6 class="futur-forecast-nosal" style="color:#e35d5d">   </h6>
                                        </div>

                                        <div class="col-md-6">
                                             <h6 class="futur-forecast-pipeline" style="color:#247dbd">   </h6>
                                             <h6 class="futur-forecast-finalized" style="color:#399d39">   </h6>
                                        </div>
                                    </div>

                                </div> 
                                <div class="col-md-4"> </div>
                        </div>
                          <ul class="p-0 m-0 con-onetwenty-days-ul">  </ul>

                   </div>

                </div>

                </div>

                  <%-- Opportunities --%>

                         <%--  <div class="col-md-6 col-lg-4 order-2 mb-4">
                               <div class="card h-100">
                                   <div class="card-header d-flex align-items-center justify-content-between">
                                       <h5 class="card-title m-0 me-2">Top 20 JOH Opportunities </h5>
                                   
                                   </div>
                                   <div class="card-body nav-scroll-custom" >
                                       <ul class="p-0 m-0 top-opportunity-ul">
                                           <img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                      
                                       </ul>
                                   </div>
                               </div>
                           </div>--%>


   <div class="nav-align-top card h-100 topJOH-tender-opp-tab" style="width:32.2%; background: #ffffff; margin-left: 13px;">
                            <ul class="nav nav-pills mb-3 hidden" style="top:6px; background: #fff2f2;" role="tablist">
                                <li class="nav-item">
                                   <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-JOH" aria-controls="navs-pills-top-JOH" aria-selected="true">Pending Workorders</button>
                                 </li>                                                              
                                 <li class="nav-item">
                                   <%--<button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-tender" aria-controls="navs-pills-top-tender" aria-selected="false">Top 20 Tender</button>--%>
                                 </li>
                            </ul>
                <div class="tab-content card-body" style="float: left; overflow-y: auto; height: 615px;" role="tabpanel">                   
                    <div class="tab-pane fade active show" id="navs-pills-top-JOH" >

                                   <div class="card-header d-flex align-items-center justify-content-between" style="margin-top: -5%; text-shadow: 0px 5px 6px #cfc4c4; margin-left:19%">
                                       <h3 class="card-title m-0 me-2">Pending Workorders </h3>
                                   
                                   </div>
                                   <div class="card-body " style="margin-top: -4px; margin-left: -27px;">
                                       <ul class="p-0 m-0 top-opportunity-ul" >
                                           <img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                      
                                       </ul>
                                   </div>
                       
                    </div>    
                 

                    <div class="tab-pane fade" id="navs-pills-top-tender" role="tabpanel">                       
                            <div class="card-body " style="margin-top: -19px; margin-left: -27px;">
                                       <ul class="p-0 m-0 top-tender-opportunity-ul">
                                           <img src="../Dashboard/assets/img/icons/unicons/line-loader.gif" style="width: 100%;">
                                      
                                       </ul>
                                   </div>
                   </div>

             </div>

  </div>




                       <%--</div>--%>

                           </div>  <%--ROw end for Row 3 or Overview, Forecast and top 20 Tenders tabs section--%>

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

            <script src="Scripts/dashboard-emp-performance.js?v=2.2"></script>
    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
            
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <!-- Place this tag in your head or just before your close body tag. -->
    <!-- For  -->
  <script src="../Template/assets/js/canvasjs.js"></script>
 <%--<script type="text/javascript" src="https://cdn.canvasjs.com/jquery.canvasjs.min.js"></script>--%> 
           </ContentTemplate>
    </asp:UpdatePanel>
               
</asp:Content>


