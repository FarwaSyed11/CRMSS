<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="DashboardSSHR.aspx.cs" Inherits="SSHR_DashboardSSHR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link href="Css/dashboard.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid amin">

        <div class="row" style="height: 75px; background: white; margin: 10px 0 0px;">
            <div style="color: black; font-size: 26px; font-weight: 400; word-wrap: break-word; margin: 16px 0">Dashboard</div>
        </div>

        <div class="row">
            <div class="col-12 topstatusrow" style="">
                <div class="topstatuscard">
                    <img src="Images/card-icons/1.svg" />
                    <div class="headdiv" style="">Leave Balance</div>
                    <div class="valuediv">120 </div>
                </div>

                <div class="topstatuscard" style="">
                    <img src="Images/card-icons/2.svg" />
                    <div class="headdiv" style="">Loan Balance</div>
                    <div class="valuediv" style="">293 </div>
                </div>

                <div class="topstatuscard" style="">
                    <img src="Images/card-icons/3.svg" />
                    <div class="headdiv"  style="">Total Pending Request</div>
                    <div class="valuediv" id="totelPendingRequest" style="">120 </div>
                </div>

                <div class="topstatuscard" style="">
                    <img src="Images/card-icons/4.svg" />
                    <div class="headdiv" style="">Total Approved Request</div>
                    <div class="valuediv" id="approvedReq"  style="">120 </div>
                </div>

                <div class="topstatuscard" style="">
                    <img src="Images/card-icons/5.svg" />
                    <div class="headdiv" style="">Total Rejected Request</div>
                    <div class="valuediv" id="rejectedRequest"  style="">120 </div>
                </div>

                <div class="topstatuscard" style="">
                    <img src="Images/card-icons/6.svg" />
                    <div class="headdiv"  style="">Total Minutes Of Late </div>
                    <div class="valuediv" id="minuteOflate" style="">120 </div>
                </div>

                <div class="topstatuscard" style="">
                    <img src="Images/card-icons/7.svg" />
                    <div class="headdiv" style="">Total Minutes Of Exit Pass </div>
                    <div class="valuediv"  id="earlyExitMin" style="">120 </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-3">
                <div class="dashcard" style="padding: 20px 20px;">
                    <div class="mb-5 head" style="">All Request</div>

                    <div class="allreqcard" style="">
                        <div style="float: left">
                            <img src="Images/all-request-icon/Leave.svg" />
                            <div class="head" style="">Leave</div>
                        </div>

                        <div style="display: inline-flex; padding: 12px 2px;">
                            <div style="padding: 5.5px; font-size: 12px;" id="Rightpendingleave"></div>
                            <div class="progrees-bar-grid">
                                <span style="position: absolute; margin: 0.25% 3.25%;" id="Rightleaveperse"> </span>
                                <div class="progLeaveDiv" style="width: 0%; background: #fbc11e; border-radius: 60px; height: 25px;"></div>
                            </div>
                            <div style="padding: 5.5px; font-size: 12px;" id="Righttotelleave"></div>
                        </div>

                        <div style="float: right">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1.5emm" height="1.5em" viewBox="0 0 24 24">
                                <path fill="#46B58D" d="M12 22c-4.714 0-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12s0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22" opacity="0.5" />
                                <path fill="#46B58D" d="M12 17.75a.75.75 0 0 0 .75-.75v-6a.75.75 0 0 0-1.5 0v6c0 .414.336.75.75.75M12 7a1 1 0 1 1 0 2a1 1 0 0 1 0-2" />
                            </svg>
                        </div>
                    </div>

                    <div class="line" style=""></div>

                    <div class="allreqcard" style="">
                        <div style="float: left">
                            <img src="Images/all-request-icon/loan.png" />
                            <div class="head" style="">Loan</div>
                        </div>

                        <div style="display: inline-flex; padding: 12px 2px;">
                            <div style="padding: 5.5px; font-size: 12px;" id="rightPendingloan"></div>
                            <div class="progrees-bar-grid">
                                <span style="position: absolute; margin: 0.25% 3.25%;" id="rightloanperce"> </span>
                                <div class="progLoanDiv" style="width: 0%; background: #fbc11e; border-radius: 60px; height: 25px;"></div>
                            </div>
                            <div style="padding: 5.5px; font-size: 12px;" id="righttotelloan"></div>
                        </div>

                        <div style="float: right">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24">
                                <path fill="#46B58D" d="M12 22c-4.714 0-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12s0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22" opacity="0.5" />
                                <path fill="#46B58D" d="M12 17.75a.75.75 0 0 0 .75-.75v-6a.75.75 0 0 0-1.5 0v6c0 .414.336.75.75.75M12 7a1 1 0 1 1 0 2a1 1 0 0 1 0-2" />
                            </svg>
                        </div>
                    </div>

                    <div class="line" style=""></div>

                    <div class="allreqcard" style="">
                        <div style="float: left">
                            <img src="Images/all-request-icon/passport.png" />
                            <div class="head" style="">Passport</div>
                        </div>

                        <div style="display: inline-flex; padding: 12px 2px;">
                            <div style="padding: 5.5px; font-size: 12px;" id="pendingpassportreq"></div>
                            <div class="progrees-bar-grid">
                                <span style="position: absolute; margin: 0.25% 3.25%;" id="passportreqperc"> </span>
                                <div class="progpassportDiv" style="width: 0%; background: #fbc11e; border-radius: 60px; height: 25px;"></div>
                            </div>
                            <div style="padding: 5.5px; font-size: 12px;" id="totelpassportreq"></div>
                        </div>

                        <div style="float: right">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24">
                                <path fill="#46B58D" d="M12 22c-4.714 0-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12s0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22" opacity="0.5" />
                                <path fill="#46B58D" d="M12 17.75a.75.75 0 0 0 .75-.75v-6a.75.75 0 0 0-1.5 0v6c0 .414.336.75.75.75M12 7a1 1 0 1 1 0 2a1 1 0 0 1 0-2" />
                            </svg>
                        </div>
                    </div>

                    <div class="line" style=""></div>

                    <div class="allreqcard" style="">
                        <div style="float: left">
                            <img src="Images/all-request-icon/bank.png" />
                            <div class="head" style="">Bank</div>
                        </div>

                        <div style="display: inline-flex; padding: 12px 2px;">
                            <div style="padding: 5.5px; font-size: 12px;" id="pendingbankrequest"></div>
                            <div class="progrees-bar-grid">
                                <span style="position: absolute; margin: 0.25% 3.25%;" id="bankreqPerc"> </span>
                                <div class="progBankDiv" style="width: 0%; background: #fbc11e; border-radius: 60px; height: 25px;"></div>
                            </div>
                            <div style="padding: 5.5px; font-size: 12px;" id="totelbankrequest"></div>
                        </div>

                        <div style="float: right">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24">
                                <path fill="#46B58D" d="M12 22c-4.714 0-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12s0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22" opacity="0.5" />
                                <path fill="#46B58D" d="M12 17.75a.75.75 0 0 0 .75-.75v-6a.75.75 0 0 0-1.5 0v6c0 .414.336.75.75.75M12 7a1 1 0 1 1 0 2a1 1 0 0 1 0-2" />
                            </svg>
                        </div>
                    </div>

                    <div class="line" style=""></div>

                    <div class="allreqcard" style="">

                        <div style="float: left">
                            <img src="Images/all-request-icon/misc.png" />
                            <div class="head" style="">Miscellaneous</div>
                        </div>

                        <div style="display: inline-flex; padding: 12px 2px;">
                            <div style="padding: 5.5px; font-size: 12px;" id="pendingmescellaneousreq"></div>
                            <div class="progrees-bar-grid">
                                <span style="position: absolute; margin: 0.25% 3.25%;" id="misereqperce"> </span>
                                <div class="progmiseDiv" style="width: 0%; background: #fbc11e; border-radius: 60px; height: 25px;"></div>
                            </div>
                            <div style="padding: 5.5px; font-size: 12px;" id="totelmisalenusreq"></div>
                        </div>

                        <div style="float: right">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24">
                                <path fill="#46B58D" d="M12 22c-4.714 0-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12s0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22" opacity="0.5" />
                                <path fill="#46B58D" d="M12 17.75a.75.75 0 0 0 .75-.75v-6a.75.75 0 0 0-1.5 0v6c0 .414.336.75.75.75M12 7a1 1 0 1 1 0 2a1 1 0 0 1 0-2" />
                            </svg>
                        </div>
                    </div>

                    <div class="line" style=""></div>

                    <div class="allreqcard" style="">
                        <div style="float: left">
                            <img src="Images/all-request-icon/late.png" />
                            <div class="head" style="">Late</div>
                        </div>

                        <div style="display: inline-flex; padding: 12px 2px;">
                            <div style="padding: 5.5px; font-size: 12px;" id="pendinglateattreq"></div>
                            <div class="progrees-bar-grid">
                                <span style="position: absolute; margin: 0.25% 3.25%;" id="lateattendprese"></span>
                                <div class="progLateattenDiv" style="width: 0%; background: #fbc11e; border-radius: 60px; height: 25px;"></div>
                            </div>
                            <div style="padding: 5.5px; font-size: 12px;" id="totellatereq"></div>
                        </div>

                        <div style="float: right">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24">
                                <path fill="#46B58D" d="M12 22c-4.714 0-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12s0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22" opacity="0.5" />
                                <path fill="#46B58D" d="M12 17.75a.75.75 0 0 0 .75-.75v-6a.75.75 0 0 0-1.5 0v6c0 .414.336.75.75.75M12 7a1 1 0 1 1 0 2a1 1 0 0 1 0-2" />
                            </svg>
                        </div>
                    </div>

                    <div class="line" style=""></div>

                    <div class="allreqcard" style="">
                        <div style="float: left">
                            <img src="Images/all-request-icon/exit.png" />
                            <div class="head" style="">Exit Pass</div>

                        </div>

                        <div style="display: inline-flex; padding: 12px 2px;">
                            <div style="padding: 5.5px; font-size: 12px;"id="penndingexitpass"></div>
                            <div class="progrees-bar-grid">
                                <span style="position: absolute; margin: 0.25% 3.25%;"id="exitpassperse"> </span>
                                <div class="progExitpassDiv" style="width: 0%; background: #fbc11e; border-radius: 60px; height: 25px;"></div>
                            </div>
                            <div style="padding: 5.5px; font-size: 12px;" id="totelexitpass"></div>
                        </div>

                        <div style="float: right">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24">
                                <path fill="#46B58D" d="M12 22c-4.714 0-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12s0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22" opacity="0.5" />
                                <path fill="#46B58D" d="M12 17.75a.75.75 0 0 0 .75-.75v-6a.75.75 0 0 0-1.5 0v6c0 .414.336.75.75.75M12 7a1 1 0 1 1 0 2a1 1 0 0 1 0-2" />
                            </svg>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-9">
                <div class="row">
                    <div class="col-6">
                        <div class="p-2 dashcard" style="">
                            <div class="mb-3 head" style="">Total Hours Exit Pass-Total Number of late attendance</div>
                            <div id="linechart"></div>
                        </div>
                    </div>

                    <div class="col-3">
                        <div class="p-2 dashcard" style="">
                            <div class="mb-3 head" style="">Total Pending Request Per Authority</div>
                            <div id="chartpyramid"></div>
                        </div>
                    </div>

                    <div class="col-3">
                        <div style="">
                            <div class="p-3 dashcard" style="height: 300px;">
                                <div class="mb-3 head" style="">Total Pending Request Per Day</div>
                                <div style="position: relative;">
                                    <div style="">
                                        <div style="width: 55px; height: 190px; background: #82CD59"></div>
                                        <div style="width: 55px; height: 190px; left: 55px; top: 0px; position: absolute; background: rgba(130, 205, 89, 0.70)"></div>
                                        <div style="width: 55px; height: 190px; left: 110px; top: 0px; position: absolute; background: #FF9518"></div>
                                        <div style="width: 55px; height: 190px; left: 164px; top: 0px; position: absolute; background: rgba(255, 148.65, 23.80, 0.70)"></div>
                                        <div style="width: 55px; height: 190px; left: 219px; top: 0px; position: absolute; background: rgba(236, 26, 37, 0.70)"></div>
                                    </div>
                                    <div style="left: 26px; bottom: 99px; position: relative;">
                                        <div style="width: 30px; left: -8px; top: 100px; position: absolute; color: rgba(0, 0, 0, 0.50); font-size: 16px; font-weight: 300; word-wrap: break-word">1-5</div>
                                        <div style="left: 41px; top: 100px; position: absolute; color: rgba(0, 0, 0, 0.50); font-size: 16px; font-weight: 300; word-wrap: break-word">6-10</div>
                                        <div style="width: 34px; left: 98px; top: 100px; position: absolute; color: rgba(0, 0, 0, 0.50); font-size: 16px; font-weight: 300; word-wrap: break-word">11-15</div>
                                        <div style="width: 62px; left: 146px; top: 100px; position: absolute; color: rgba(0, 0, 0, 0.50); font-size: 16px; font-weight: 300; word-wrap: break-word">16-20</div>
                                        <div style="width: 63px; left: 201px; top: 100px; position: absolute; color: rgba(0, 0, 0, 0.50); font-size: 16px; font-weight: 300; word-wrap: break-word">21-25</div>
                                        <div id="divoneTofive" style="width: 31px; left: -6px; top: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word">10</div>
                                        <div id="divdixToten" style="width: 32px; left: 49px; top: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word">15</div>
                                        <div id="divlevenToFifteen"style="width: 33px; left: 102px; top: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word">20</div>
                                        <div id="divsixteenToTwenty" style="width: 34px; left: 156px; top: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word">25</div>
                                        <div id="divtwentyToTwefive" style="width: 35px; left: 210px; top: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word">30</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-5 mt-3">
                        <div class="p-3 dashcard" style="">
                            <div class="mb-3 head" style="">Current Loan</div>
                            <div class="table">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Amount</th>
                                            <th>Monthly Deduction</th>
                                            <th>Remaining</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <img src="Images/all-request-icon/hra.png" />
                                                <div class="tabenticon">
                                                    HRA
                                                </div>
                                            </td>
                                            <td>3000</td>
                                            <td>1000</td>
                                            <td>
                                                <div style="width: 86px; height: 30px; background: rgba(236, 26, 37, 0.15); border-radius: 5px; padding: 5px 25px;">1000</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="Images/all-request-icon/advance.png" />
                                                <div class="tabenticon">
                                                    Salary Advance
                                                </div>
                                            </td>
                                            <td>3000</td>
                                            <td>1000</td>
                                            <td>
                                                <div style="width: 86px; height: 30px; background: rgba(236, 26, 37, 0.15); border-radius: 5px; padding: 5px 25px;">1000</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="Images/all-request-icon/hra.png" />
                                                <div class="tabenticon">
                                                    HRA
                                                </div>
                                            </td>
                                            <td>3000</td>
                                            <td>1000</td>
                                            <td>
                                                <div style="width: 86px; height: 30px; background: rgba(236, 26, 37, 0.15); border-radius: 5px; padding: 5px 25px;">1000</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="Images/all-request-icon/advance.png" />
                                                <div class="tabenticon">
                                                    Salary Advance
                                                </div>
                                            </td>
                                            <td>3000</td>
                                            <td>1000</td>
                                            <td>
                                                <div style="width: 86px; height: 30px; background: rgba(236, 26, 37, 0.15); border-radius: 5px; padding: 5px 25px;">1000</div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-4 mt-3">
                        <div class="p-3 dashcard" style="">
                            <div class="mb-3 head" style="">Leave History</div>

                            <div class="table">
                                <table class="table LeaveRequestTable">
                                    <thead>
                                        <tr>
                                            <th>Leave Date</th>
                                            <th>Rejoin Leave Date</th>
                                            <th>Day Of Leaves</th>
                                        </tr>
                                    </thead>
                                    <tbody class="tbody-leaveHistory">
                                        <%--<tr>
                                            <td>22/2/2023</td>
                                            <td>22/2/2023</td>
                                            <td>
                                                <div style="width: 86px; height: 30px; background: rgba(236, 26, 37, 0.15); border-radius: 5px; padding: 5px 34px;">20</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>22/2/2023</td>
                                            <td>22/2/2023</td>
                                            <td>
                                                <div style="width: 86px; height: 31px; background: rgba(130, 205, 89, 0.15); border-radius: 5px; padding: 5px 34px;">10</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>22/2/2023</td>
                                            <td>22/2/2023</td>
                                            <td>
                                                <div style="width: 86px; height: 31px; background: rgba(130, 205, 89, 0.15); border-radius: 5px; padding: 5px 34px;">10</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>22/2/2023</td>
                                            <td>22/2/2023</td>
                                            <td>
                                                <div style="width: 86px; height: 31px; background: rgba(130, 205, 89, 0.15); border-radius: 5px; padding: 5px 34px;">10</div>
                                            </td>
                                        </tr>--%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-3 mt-3">
                        <div class="row">
                            <div class="col-12">
                                <div class="p-3 dashcard">
                                    <div class="mb-3 head">Total Hours Exit Pass</div>
                                    <div id="ExitPiechart"></div>
                                </div>
                                <div class="col-12 mt-3">
                                    <div class="p-3 dashcard">
                                        <div class="mb-3 head">Total Number of late attendance</div>
                                        <div id="LatePiechart"></div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <%--<div>
            <div class="div-26">
                <div class="card div-27">
                    <div class="div-28">
                        <div class="div-29">
                            <img src="Images/card-icons/5.png" width="70">
                            <div class="div-30">Leave Balance</div>
                        </div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24">
                            <path fill="none" stroke="#515151" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M12 11.5v5m0-8.99l.01-.011M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2S2 6.477 2 12s4.477 10 10 10" />
                        </svg>
                    </div>
                    <div class="div-31">
                        <div class="div-32">120</div>

                        <%--<div loading="lazy" id="chart"></div>--%
                    </div>
                </div>
                <div class="card div-33">
                    <div class="div-36">
                        <div class="div-29">
                            <img src="Images/card-icons/1.png" width="70">

                            <div class="div-37">Loan Balance</div>
                        </div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24">
                            <path fill="none" stroke="#515151" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M12 11.5v5m0-8.99l.01-.011M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2S2 6.477 2 12s4.477 10 10 10" />
                        </svg>
                    </div>
                    <div class="div-34">
                        <div class="div-35">293</div>
                        <%--<div loading="lazy" id="chart"></div>--%
                    </div>

                </div>
                <div class="card div-38">

                    <div class="div-41">
                        <div class="div-29">
                            <img src="Images/card-icons/2.png" width="70">
                            <div class="div-42">Total Deduction</div>
                        </div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24">
                            <path fill="none" stroke="#515151" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M12 11.5v5m0-8.99l.01-.011M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2S2 6.477 2 12s4.477 10 10 10" />
                        </svg>
                    </div>
                    <div class="div-39">
                        <div class="div-40">233</div>
                        <%--<div loading="lazy" id="chart"></div>--%
                    </div>
                </div>
                <div class="card div-43">
                    <div class="div-44">
                        <div class="div-29">
                            <img src="Images/card-icons/3.png" width="70">
                            <div class="div-45">Remaining Exit Pass Hours</div>
                        </div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24">
                            <path fill="none" stroke="#515151" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M12 11.5v5m0-8.99l.01-.011M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2S2 6.477 2 12s4.477 10 10 10" />
                        </svg>
                    </div>
                    <div class="div-46">
                        <div class="div-47">12</div>
                        <%--<div loading="lazy" id="chart"></div>--%
                    </div>
                </div>
                <div class="card div-48">

                    <div class="div-51">
                        <div class="div-52">
                            <img src="Images/card-icons/4.png" width="70">
                            <div class="div-53">Total Exit Pass Taken</div>
                        </div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24">
                            <path fill="none" stroke="#515151" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M12 11.5v5m0-8.99l.01-.011M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2S2 6.477 2 12s4.477 10 10 10" />
                        </svg>
                    </div>
                    <div class="div-49">
                        <div class="div-50">200</div>
                        <%--<div loading="lazy" id="chart"></div>--%
                    </div>
                </div>
            </div>
            <div class="div-54">
                <div class="div-55">
                    <div class="column">
                        <div class="div-56">
                            <div class="div-57">
                                <div class="div-58">Total Request</div>
                                <div class="div-59">360</div>
                            </div>
                            <div id="barchart"></div>
                            <div class="div-60">
                                <div class="div-61">
                                    <div class="column-2">
                                        <div class="div-62">
                                            <img
                                                loading="lazy"
                                                src="https://cdn.builder.io/api/v1/image/assets/TEMP/a9a0cb07f46c332901b07db3cade8239904b31ce939389534cde977649e94712?"
                                                class="img-29" />
                                            <div class="div-63">Total Rejected</div>
                                            <div class="div-64">120 Request</div>
                                        </div>
                                    </div>
                                    <div class="column-3">
                                        <div class="div-65">
                                            <img
                                                loading="lazy"
                                                src="https://cdn.builder.io/api/v1/image/assets/TEMP/f7d9ab8ceef2cb433e40a36e240168c39edd264198cba23975410fd28434983b?"
                                                class="img-30" />
                                            <div class="div-66">Total Pending</div>
                                            <div class="div-67">120 Request</div>
                                        </div>
                                    </div>
                                    <div class="column-4">
                                        <div class="div-68">
                                            <img
                                                loading="lazy"
                                                src="https://cdn.builder.io/api/v1/image/assets/TEMP/07226c15c2d567b462df4e3479b920e091604c5d9e605b707ac0662c6499fda5?"
                                                class="img-31" />
                                            <div class="div-69">Total Applied</div>
                                            <div class="div-70">120 Request</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="column-5">
                        <div class="div-71">
                            <div class="div-72">Current Month - Total Late Attendance - Total Hours Exit Pass </div>
                            <div id="linechart"></div>
                            <div class="div-73">
                                <div class="div-74">
                                    <div class="column-6">
                                        <div class="div-75">
                                            <div class="div-76">Total number of Late Attendance</div>
                                            <div class="div-77">
                                                <div id="LatePiechart"></div>
                                                <div style="margin-top: 22px; font-size: 12px; text-align: center;">
                                                    Total number of Late Minutes : 120 minutes
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="column-7">
                                        <div class="div-79">
                                            <div class="div-80">Total Hours Exit Pass</div>
                                            <div class="div-81">
                                                <div id="ExitPiechart"></div>
                                                <div style="margin-top: 22px; font-size: 12px; text-align: center;">
                                                    Total number of Exit Hours : 120 minutes
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="div-83">
                <div class="div-84">

                    <div class="column">
                        <table class="table div-85">
                            <thead>
                                <tr class="div-87">
                                    <th>Request</th>
                                    <th>Req Type</th>
                                    <th>Reason</th>
                                    <th>Status</th>
                                    <th>Req Date</th>
                                    <th>Days Of Pending</th>
                                    <th>Pending Authority</th>
                                </tr>

                            </thead>
                            <tbody>
                                <tr class="div-95">
                                    <td class="div-96">Leave</td>
                                    <td class="div-96">Annual</td>
                                    <td class="div-96">Vacation</td>
                                    <td class="div-99 div-96">Pending</td>
                                    <td class="div-96">22/2/2024</td>
                                    <td class="div-96">10 Days</td>
                                    <td class="div-96">HOD</td>
                                </tr>
                                <tr class="div-95">
                                    <td>Leave</td>
                                    <td>Annual</td>
                                    <td>Vacation</td>
                                    <td class="div-100">Rejected</td>
                                    <td>22/2/2024</td>
                                    <td>10 Days</td>
                                    <td>HOD</td>
                                </tr>
                                <tr class="div-95">
                                    <td>Leave</td>
                                    <td>Annual</td>
                                    <td>Vacation</td>
                                    <td class="div-101">Approved</td>
                                    <td>22/2/2024</td>
                                    <td>10 Days</td>
                                    <td>HOD</td>
                                </tr>
                                <tr class="div-95">
                                    <td>Leave</td>
                                    <td>Annual</td>
                                    <td>Vacation</td>
                                    <td class="div-102">Submitted</td>
                                    <td>22/2/2024</td>
                                    <td>10 Days</td>
                                    <td>HOD</td>
                                </tr>
                                <tr class="div-95">
                                    <td class="div-96">Leave</td>
                                    <td class="div-96">Annual</td>
                                    <td class="div-96">Vacation</td>
                                    <td class="div-99 div-96">Pending</td>
                                    <td class="div-96">22/2/2024</td>
                                    <td class="div-96">10 Days</td>
                                    <td class="div-96">HOD</td>
                                </tr>
                                <tr class="div-95">
                                    <td>Leave</td>
                                    <td>Annual</td>
                                    <td>Vacation</td>
                                    <td class="div-100">Rejected</td>
                                    <td>22/2/2024</td>
                                    <td>10 Days</td>
                                    <td>HOD</td>
                                </tr>
                                <tr class="div-95">
                                    <td>Leave</td>
                                    <td>Annual</td>
                                    <td>Vacation</td>
                                    <td class="div-101">Approved</td>
                                    <td>22/2/2024</td>
                                    <td>10 Days</td>
                                    <td>HOD</td>
                                </tr>
                                <tr class="div-95">
                                    <td>Leave</td>
                                    <td>Annual</td>
                                    <td>Vacation</td>
                                    <td class="div-102">Submitted</td>
                                    <td>22/2/2024</td>
                                    <td>10 Days</td>
                                    <td>HOD</td>
                                </tr>
                            </tbody>
                        </table>
                        <%--<div class="div-85">
                            <div class="div-86">
                                <div class="div-87">
                                    <div class="div-88">Request</div>
                                    <div class="div-89">Req Type</div>
                                    <div class="div-90">Reason</div>
                                    <div class="div-91">Status</div>
                                    <div class="div-92">Req Date</div>
                                    <div class="div-93">Days Of Pending</div>
                                    <div class="div-94">Pending Authority</div>
                                </div>
                                <div class="div-95">
                                    <div class="div-96">Leave</div>
                                    <div class="div-97">Vacation</div>
                                    <div class="div-98">
                                        <div class="div-99">Pending</div>
                                        <div class="div-100">Rejected</div>
                                        <div class="div-101">Approved</div>
                                        <div class="div-102">Submitted</div>
                                    </div>
                                </div>
                                <div class="div-103">
                                    <div class="div-104">Leave</div>
                                    <div class="div-105">Annual</div>
                                    <div class="div-106">10 Days</div>
                                    <div class="div-107">HOD</div>
                                    <div class="div-108">22/2/2024</div>
                                    <div class="div-109">Vacation</div>
                                </div>
                                <div class="div-110">
                                    <div class="div-111">Leave</div>
                                    <div class="div-112">Annual</div>
                                    <div class="div-113">10 Days</div>
                                    <div class="div-114">HOD</div>
                                    <div class="div-115">22/2/2024</div>
                                    <div class="div-116">Vacation</div>
                                </div>
                                <div class="div-117">
                                    <div class="div-118">Leave</div>
                                    <div class="div-119">Annual</div>
                                    <div class="div-120">10 Days</div>
                                    <div class="div-121">HOD</div>
                                    <div class="div-122">22/2/2024</div>
                                    <div class="div-123">Vacation</div>
                                </div>
                                <div class="div-124">
                                    <div class="div-125">Leave</div>
                                    <div class="div-126">Annual</div>
                                    <div class="div-127">10 Days</div>
                                    <div class="div-128">HOD</div>
                                    <div class="div-129">22/2/2024</div>
                                    <div class="div-130">Vacation</div>
                                    <div class="div-131">Rejected</div>
                                </div>
                                <div class="div-132">
                                    <div class="div-133">Leave</div>
                                    <div class="div-134">Annual</div>
                                    <div class="div-135">10 Days</div>
                                    <div class="div-136">HOD</div>
                                    <div class="div-137">22/2/2024</div>
                                    <div class="div-138">Vacation</div>
                                </div>
                                <div class="div-139">
                                    <div class="div-140">Leave</div>
                                    <div class="div-141">Annual</div>
                                    <div class="div-142">Approved</div>
                                    <div class="div-143">10 Days</div>
                                    <div class="div-144">HOD</div>
                                </div>
                            </div>
                        </div>--%
                    </div>
                    <div class="row">
                        <div class=" col-12">
                            <table class="table div-85">
                                <thead>
                                    <tr class="div-88">
                                        <th>Leave Date</th>
                                        <th>Rejoin Date</th>
                                        <th>Days of Leaves</th>
                                    </tr>

                                </thead>
                                <tbody>
                                    <tr class="div-95">
                                        <td class="div-96">22/2/2024</td>
                                        <td class="div-96">22/2/2024</td>
                                        <td class="div-96">10</td>
                                    </tr>
                                    <tr class="div-95">
                                        <td>22/2/2024</td>
                                        <td>22/2/2024</td>
                                        <td>10</td>
                                    </tr>
                                    <tr class="div-95">
                                        <td>22/2/2024</td>
                                        <td>Annual</td>
                                        <td>10</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-12">
                            <table class="table div-85">
                                <thead>
                                    <tr class="div-89">
                                        <th>Loan Type</th>
                                        <th>Amount</th>
                                        <th>Monthly Deduction</th>
                                        <th>Remaining Amount</th>
                                    </tr>

                                </thead>
                                <tbody>
                                    <tr class="div-95">
                                        <td class="div-96">Personal</td>
                                        <td class="div-96">4000</td>
                                        <td class="div-96">1000</td>
                                        <td class="div-96">3000</td>
                                    </tr>
                                    <tr class="div-95">
                                        <td>Personal</td>
                                        <td>4000</td>
                                        <td>1000</td>
                                        <td>3000</td>
                                    </tr>
                                    <tr class="div-95">
                                        <td>Personal</td>
                                        <td>4000</td>
                                        <td>1000</td>
                                        <td>3000</td>
                                    </tr>
                                    <tr class="div-95">
                                        <td>Personal</td>
                                        <td>4000</td>
                                        <td>1000</td>
                                        <td>3000</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    --<div class="column-8">
                        <div class="div-145">
                            <div class="div-146">My Profile</div>
                            <div class="div-147">
                                <img
                                    loading="lazy"
                                    srcset="..."
                                    class="img-35" />
                            </div>
                            <div class="div-148">IBRAHIM QURIQ</div>
                            <div class="div-149">Software Engineer/Information Technology</div>
                            <div class="div-150">
                                <div class="div-151">
                                    <div class="div-152">
                                        <img
                                            loading="lazy"
                                            src="https://cdn.builder.io/api/v1/image/assets/TEMP/ccd4822263be2ce40e4b77973c3324f85ac989ded8a45ae03da4685fff91f04d?"
                                            class="img-36" />
                                        <div class="div-153">
                                            <div class="div-154">Emp ID</div>
                                            <div class="div-155">NA3041</div>
                                        </div>
                                    </div>
                                    <div class="div-156">
                                        <div class="div-157">
                                            <img
                                                loading="lazy"
                                                src="https://cdn.builder.io/api/v1/image/assets/TEMP/4aaea704ddc61dcb7c9e479ef0931df72c1e433260b1283debfd54d1f6bdb003?"
                                                class="img-37" />
                                            <img
                                                loading="lazy"
                                                src="https://cdn.builder.io/api/v1/image/assets/TEMP/6ce39428e2699b2d46c981a620d184799d1ac3bc8d9315862c3d5b2eaaac5520?"
                                                class="img-38" />
                                            <img
                                                loading="lazy"
                                                src="https://cdn.builder.io/api/v1/image/assets/TEMP/b3d5c12d61bf9f9c61778cd46eea6bc9da56cdd6940fb7d9f712e40f1051fd25?"
                                                class="img-39" />
                                        </div>
                                        <div class="div-158">
                                            <div class="div-159">Salary</div>
                                            <div class="div-160">1000 $</div>
                                            <div class="div-161">Reporting Manager</div>
                                            <div class="div-162">Lorem ipsum dolor s</div>
                                            <div class="div-163">Emirates ID</div>
                                            <div class="div-164">Lorem ipsum dolor s</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="div-165"></div>
                                <div class="div-166">
                                    <img
                                        loading="lazy"
                                        src="https://cdn.builder.io/api/v1/image/assets/TEMP/592a52b3832870137cfd09d187671320da30ee396acd3c917a6a6025380a36c1?"
                                        class="img-40" />
                                    <img
                                        loading="lazy"
                                        src="https://cdn.builder.io/api/v1/image/assets/TEMP/5e2eac6a00c199b60a8bad3edc4e28d879e11ed3ca0edd9404b132abaff84b76?"
                                        class="img-41" />
                                    <img
                                        loading="lazy"
                                        src="https://cdn.builder.io/api/v1/image/assets/TEMP/9434939bd6272f132472e497e1cdc4b5aa4c30b11399413d31b6cd1af16366e3?"
                                        class="img-42" />
                                    <img
                                        loading="lazy"
                                        src="https://cdn.builder.io/api/v1/image/assets/TEMP/c1e355de3f57e765283c274124a2324e94a820d9e24da36f00d412ceca85ec3f?"
                                        class="img-43" />
                                </div>
                                <div class="div-167">
                                    <div class="div-168">Visa EXP Date</div>
                                    <div class="div-169">22/2/2024</div>
                                    <div class="div-170">Passport EXP Date</div>
                                    <div class="div-171">22/2/2024</div>
                                    <div class="div-172">Date Of Joining</div>
                                    <div class="div-173">22/2/2024</div>
                                    <div class="div-174">Emirate EXP Date</div>
                                    <div class="div-175">22/4/2024</div>
                                </div>
                            </div>
                        </div>
                    </div>--%
                </div>
            </div>
        </div>--%>







    <input type="hidden" value="0" id="hfId" />
    <asp:HiddenField ID="hfAttachId" runat="server" />
    <asp:HiddenField ID="hfServerMapPth" runat="server" />
    <script type="text/javascript">
        var currUserId = '';
        var EmpNo = '';
        var myrole = '';
        var overAllPerfo = 0;
        var actIDForAttach = 0;
        var rolesList = '';

        var loggedInUserName = '';
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            actIDForAttach = $('#<%=hfAttachId.ClientID%>');
          rolesList = '<%=Session["CurrentUserRolesList"].ToString()%>';

        });
    </script>

    <script src="Scripts/dashboard.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js" integrity="sha512-GWzVrcGlo0TxTRvz9ttioyYJ+Wwk9Ck0G81D+eO63BaqHaJ3YZX9wuqjwgfcV/MrB2PhaVX9DkYVhbFpStnqpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

    <script src="../Calendar/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../Calendar/dist/js/adminlte.min.js"></script>
    <script src="../Calendar/plugins/moment/moment.min.js"></script>


    <link rel="stylesheet" href="../Calendar/plugins/fullcalendar/main.css">
    <script src="../Calendar/plugins/fullcalendar/main.js"></script>
    <%--<script src="fullcalendar-6.1.10/dist/index.global.js"></script>--%>

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <script src="../Dashboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>


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


    <script src="https://phpcoder.tech/multiselect/js/jquery.multiselect.js"></script>
    <link rel="stylesheet" href="https://phpcoder.tech/multiselect/css/jquery.multiselect.css">
</asp:Content>

