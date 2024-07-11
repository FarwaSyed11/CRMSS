var Type = '-1';
var objDatatable = [];
var objDatatableb = [];
var selLeaveType = '';
var EmpNumb = '';
var ApplicationId = 0;
var PPTReasonId = '';
var reqStatus = '';
var OrgID = 0;
var StatusOrder = 0;
var RemainingHRAAdvance = 0;
var RemainingSalaryAdvance = 0;
var LeaveBalance = 0;
var LastTicketEncashDate = "";
var NumberoFTicketAvailable = 0;

var htmActionButton = "";

var selobjDatatableMisc = [];

var day = ["Sun", "Mon", "Tues", "Wed", "Thu", "Fri", "Sat"];
var monthsbyName = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
$(document).ready(function () {
    flatpickr(jQuery("#txtStartDate"), jQuery("#txtEndDate"), jQuery("#txtReturnToWork"), jQuery("#txtTravellingDate"), jQuery("#txtEptDOReturn"), jQuery("#txtCLoanDedStartMonth"), jQuery("#txtLAReqDate"), jQuery("#txtEXTPassDate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        //onChange: function (selectedDates, dateStr, instance) {

        //    selLostDate = dateStr;
        //}
    });
    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        LoadRequestData('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
    setTimeout(function () {
        LoadRequestDataforOnbehalf('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
    GetBasicEmpDet();
    onbehalfrolecheck();
    //loadEmpDetails();
    //loadEmpLoanDetails();
});

$('#empLeaveModal').on('keyup keypress', function (e) {
    var keyCode = e.keyCode || e.which;
    if (keyCode === 13) {
        e.preventDefault();
        return false;
    }
});

function hideShowProjDetails() {
    var x = document.getElementById("proj-details-rectangle-div");
    if (x.style.height == "110px") {
        // x.style.display = "block";
        //$('#proj-details-rectangle-div').show('400');
        $('#proj-details-rectangle-div').css("height", "210px");
        $('#empimgvatar').removeClass('w-px-85');
        $('#empimgvatar').addClass('w-px-120');
        $('.divimage').css("width", "12%");
        $('.empMoreInfor').css("display", "");
        $('#empheading').html("Basic Info");
        $('.empMainInfo').css("padding-top", "0px");

        $('.proj-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.proj-det-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#proj-details-rectangle-div').css("height", "110px");
        // $('#proj-details-rectangle-div').hide('400');
        $('.empMoreInfor').css("display", "none");
        $('.divimage').css("width", "9%");
        $('#empimgvatar').addClass('w-px-85');
        $('#empimgvatar').removeClass('w-px-120');
        $('.empMainInfo').css("padding-top", "10px");
        $('#empheading').html("");
        $('.proj-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.proj-det-drilldown').addClass('bx bxs-chevron-down');

    }
}

function hideShowSalDeets() {
    var x = document.getElementById("bankdeetSidenav");
    if (x.style.width == "0px") {
        $('#Bank-details-rectangle-div').css("width", "50%");
        $('#Bank-details-rectangle-div').css("display", "block");
        $('.half-deets').css("width", "50%");
        $('#salary').addClass('show');
        $('#bankdeetSidenav').css("width", "100%");
        $('#loandeets').css("display", "none");
        //$("#salary").click(function () {
        //    if ($('#salary').find('.show') == true) {
        //        $('#Bank-details-rectangle-div').animate({ width: 'show' }, 1000);
        //        $('#salary').removeClass('show');
        //    }
        //});
    } else {
        $('#Bank-details-rectangle-div').css("width", "0%");
        $('#Bank-details-rectangle-div').css("display", "none");
        $('.half-deets').css("width", "100%");
        $('#salary').addClass('hide');
        $('#bankdeetSidenav').css("width", "0px");
        $('#loandeets').css("display", "none");
    }
}
function hideShowLoanDeets() {
    var x = document.getElementById("bankdeetSidenav");
    if (x.style.width == "0px") {
        $('#loandeets').css("width", "100%");
        $('#loandeets').css("display", "block");
        $('.half-deets').css("width", "50%");
        $('#details').addClass('show');
        $('#bankdeetSidenav').css("width", "50%");
        $('#Bank-details-rectangle-div').css("display", "none");
        //$("#salary").click(function () {
        //    if ($('#salary').find('.show') == true) {
        //        $('#Bank-details-rectangle-div').animate({ width: 'show' }, 1000);
        //        $('#salary').removeClass('show');
        //    }
        //});
    } else {
        $('#loandeets').css("width", "0%");
        $('#loandeets').css("display", "none");
        $('.half-deets').css("width", "100%");
        $('#details').addClass('hide');
        $('#bankdeetSidenav').css("width", "0px");
        $('#Bank-details-rectangle-div').css("display", "none");
    }
}

function LoadRequestData(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "AllRequests.aspx/GettableData",
        data: JSON.stringify({
            "UserID": currUserId, "RequestType": $('#ddlRequests option:selected').val(),
            "Status": $('#ddlStatus option:selected').val(),
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-emp-req td').length > 0 ? objDatatable.destroy() : '';
            var htm = '';
            var htmlHead = '';

            if ($('#ddlRequests option:selected').val() == 0) {

                htmlHead += `<tr style="text-align: center;">
                               <th class="table-cahnge" colspan="7" style="font-size:large;background: #b70000 !important;color: white !important;">LEAVE APPLICATION</th></tr>`

                htmlHead += `   <tr style="text-align:center;" class="Head-tr">
                                 <th style="display:none;">ID</th> 
                                 <th>Leave App No</th>
                                 <th>Leave Type</th>
                                 <th>Start Date</th>
                                 <th>End Date</th>
                                 <th>Reason</th>
                                 <th>Stage</th>
                                 <th>Action</th>
                             

                 </tr>`;

                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.LEAVE_APPLICATION_ID + `</td>  
                 <td style=" text-align: center;">`+ item.LEAVE_APPLICATION_NO + `</td>
                 <td style=" ">`+ item.LEAVE_TYPE + `</td>     
                 <td style="text-align:center"><span class="hidden"> `+ item.FromDate_Sort + `</span>` + datedayformat(item.FROM_DATE) + `</td>
                 <td style="text-align:center"><span class="hidden"> `+ item.ToDate_Sort + `</span>` + datedayformat(item.TO_DATE) + `</td>
                  <td style=" ">`+ item.REASON + `</td> 
                  <td style=" text-align: center;" ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                  <td style="text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-leave-req-info" title="Other" data-projid="`+ item.LEAVE_APPLICATION_NO + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                    </tr>`;

                });

                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);

            }


            else if ($('#ddlRequests option:selected').val() == 1) {





                htmlHead += ` <tr style="text-align: center;" class="Head-tr">
                                      <th class="table-cahnge" colspan="7" style="font-size:large;background: #b70000 !important;color: white !important;">PASSPORT RELEASE</th></tr>`

                htmlHead += `  <tr style="text-align: center;" class="Head-tr">
                                <th style="display:none;">ID</th > 
                                <th> Request Numb</th>
                                 <th>Reason</th>
                                 <th>Travelling Date</th>
                                 <th>Return Date</th>
                                 <th>Request Date</th>
                                 <th>Stage</th>
                                 <th>Action</th>
                 </tr>`;

                $.each(result.d, function (key, item) {

                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td>  
                 <td style="text-align: center; ">`+ item.Req_Number + `</td>
                 <td style=" ">`+ item.RequestFor + `</td>     
                 <td style="text-align:center"><span class="hidden"> `+ item.Travelling_Date_sort + `</span>` + datedayformat(item.Travelling_Date) + `</td>
                 <td style="text-align:center"><span class="hidden"> `+ item.Expected_Date_Of_Return_sort + `</span>` + datedayformat(item.Expected_Date_Of_Return) + `</td>
                  <td style="text-align:center"><span class="hidden"> `+ item.ReqDate_sort + `</span>` + datedayformat(item.RequestDate) + `</td>
                    <td style="text-align: center; " ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                   <td style="text-align:center ">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-PPT-req-info" title="Other" data-pptid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                   </tr>`;

                });

                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);

            }



            else if ($('#ddlRequests option:selected').val() == 2) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="5" style="font-size:large;background: #b70000 !important;color: white !important;">BANK RELATED REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th > 
                                 <th>Request Number</th >
                                 <th>Request Type</th>
                                 <th>Request Date</th>
                                 <th>Request Status</th>
                                 <th>Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                  <td style="text-align: center; ">`+ item.Req_Number + `</td>
                 <td style=" ">`+ item.REQUEST_TYPE + `</td>  
                 <td style="text-align:center"><span class="hidden"> `+ item.ReqDate_sort + `</span>` + datedayformat(item.RequestDate) + `</td> 
               <td style=" text-align: center;" ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                <td style="text-align:center ">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-BDR-req-info" title="Other" data-bankrelid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);

            }


            else if ($('#ddlRequests option:selected').val() == 3) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="6" style="font-size:large;background: #b70000 !important;color: white !important;">MISCELLANEOUS REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th > 
                                 <th>Request Number</th >
                                 <th>Request Type</th>
                                 <th>Reason</th>
                                 <th>Request Date</th>
                                 <th>Status</th>
                                  <th>Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                  <td style=" text-align: center;">`+ item.Req_Number + `</td>
                 <td style=" ">`+ item.REQUEST_TYPE + `</td>   
                 <td style=" ">`+ item.RequestFor + `</td>   
                  <td style="text-align:center"><span class="hidden"> `+ item.ReqDate_sort + `</span>` + datedayformat(item.RequestDate) + `</td> 
                 <td style="text-align: center; " ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                <td style="text-align:center ">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-Misc-req-info" title="Other Misc" data-miscid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);

            }


            else if ($('#ddlRequests option:selected').val() == 4) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="8" style="font-size:large;background: #b70000 !important;color: white !important;">COMPANY LOAN REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th > 
                                 <th style="width:20%">Request Number</th>
                                 <th style="width:10%">Loan Type</th>
                                 <th style="width:20%">Reason</th>
                                 <th style="width:10%">Date Start</th>
                                 <th style="width:10%">Amount</th>
                                 <th style="width:10%">Request Date</th>
                                 <th style="width:10%">Status</th>
                                  <th style="width:10%">Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                  <td style=" text-align: center;">`+ item.Req_Number + `</td>
                 <td style=" ">`+ item.REQUEST_TYPE + `</td>   
                 <td style=" ">`+ item.RequestFor + `</td>   
                 <td style="text-align:center"><span class="hidden"> `+ item.DateStart_sort + `</span>` + datedayformat(item.FROM_DATE) + `</td>
                 <td style=" text-align: center;">`+ item.AMOUNT + `</td>
                 <td style="text-align:center"><span class="hidden"> `+ item.ReqDate_sort + `</span>` + datedayformat(item.RequestDate) + `</td> 
                  <td style=" text-align: center;" ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                <td style="text-align:center ">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-CL-req-info" title="Other" data-comloid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);

            }


            else if ($('#ddlRequests option:selected').val() == 5) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="7" style="font-size:large;background: #b70000 !important;color: white !important;">LATE ATTENDANCE REQUEST</th></tr>`

                htmlHead += `    <tr style="text-align: center;">
                                 <th style="display:none;">ID</th > 
                                 <th style="width:20%">Request Number</th >
                                 <th style="width:10%">Date</th>
                                 <th style="width:10%">Arrived Time</th>
                                 <th style="width:20%">Reason</th>
                                 <th style="width:10%">Request Date</th>
                                 <th style="width:20%">Status</th>
                                  <th style="width:20%">Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                  <td style=" text-align: center;">`+ item.Req_Number + `</td>
                  <td style="text-align:center"><span class="hidden"> `+ item.LateDate_sort + `</span>` + datedayformat(item.FROM_DATE) + `</td> 
                 <td style=" text-align: center;">`+ (item.ARRIVED_TIME) + `</td>
                 <td style=" ">`+ item.REASON + `</td>   
                 <td style="text-align:center"><span class="hidden"> `+ item.ReqDate_sort + `</span>` + datedayformat(item.RequestDate) + `</td>  
                   <td style=" text-align: center;" ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                <td style=" text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-LA-req-info" title="Other" data-laid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);

            }

            else if ($('#ddlRequests option:selected').val() == 6) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="7" style="font-size:large;background: #b70000 !important;color: white !important;">EXIT PASS REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th > 
                                 <th style="width:10%">Request Number</th >
                                 <th style="width:10%">Exit Date</th>
                                 <th style="width:10%">Exit Time</th>
                                 <th style="width:20%">Reason</th>
                                 <th style="width:10%">Request Date</th>
                                 <th style="width:10%">Status</th>
                                  <th style="width:10%">Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                  <td style=" text-align: center;">`+ item.Req_Number + `</td>
                <td style="text-align:center"><span class="hidden"> `+ item.ExitDate_sort + `</span>` + datedayformat(item.EXIT_DATE) + `</td>  
                 <td style=" text-align: center;">`+ (item.OUT_TIME) + `</td>
                 <td style=" ">`+ item.REASON + `</td>   
                <td style="text-align:center"><span class="hidden"> `+ item.ReqDate_sort + `</span>` + datedayformat(item.RequestDate) + `</td>  
                 <td style=" text-align: center;" ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                <td style=" text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-EXTPass-req-info" title="Other" data-exitid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);

            }
            else if ($('#ddlRequests option:selected').val() == 7) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="7" style="font-size:large;background: #b70000 !important;color: white !important;">TICKET ENCASHMENT REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th > 
                                 <th style="width:10%">Request Number</th >
                                 <th style="width:10%">Last Ticket Encash Date</th>
                                 <th style="width:10%">Requested Date</th>
                                 <th style="width:20%">Reason</th>
                                 <th style="width:10%">Status</th>
                                  <th style="width:10%">Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                  <td style=" text-align: center;">`+ item.Req_Number + `</td>

                 <td style=" text-align: center;"><span class="hidden"> `+ item.LastTicketEncashDate_sort + `</span>` + datedayformat(item.LastEncashDate) + `</td>
                      <td style=" text-align: center;"><span class="hidden"> `+ item.ReqDate_sort + `</span>` + datedayformat(item.RequestDate) + `</td>
                  <td style=" ">`+ item.REASON + `</td>   
                 <td style=" text-align: center;" ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                 <td style=" text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-TE-req-info" title="Other" data-exitid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);

            }

            //all Request
            else if ($('#ddlRequests option:selected').val() == -1) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="6" style="font-size:large;background: #b70000 !important;color: white !important;">ALL REQUESTS</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th>
                                 
                                  <th style="display:none;">ReqTypeID</th>
                                  <th style="width:25%">Request Number</th>
                                 <th style="width:20%">Request Type</th>
                                 
                                 <th style="width:25%">Reason</th>
                                 <th style="width:20%">Request Date</th>
                                 <th style="width:20%">Status</th>
                                 <th style="width:10%">Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                 <td style=" ;display:none;">`+ item.REQUEST_TYPEID + `</td> 
                 <td style=" text-align: center;">`+ item.Req_Number + `</td>
                 <td style=" ">`+ item.REQUEST_TYPE + `</td>   
                   
                 <td style=" ">`+ item.REASON + `</td>   
                 <td style="text-align:center"><span class="hidden"> `+ item.ReqDate_sort + `</span>` + datedayformat(item.RequestDate) + `</td> 
                  <td style="text-align: center; " ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                <td style=" text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-AllReq-req-info" title="Other" data-projid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);

            }

            initiateDataTableEmp();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function LoadRequestDataforOnbehalf(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "AllRequests.aspx/GettableDataOnbehalf",
        data: JSON.stringify({
            "UserID": currUserId, "RequestType": $('#ddlRequests-behalf option:selected').val(),
            "Status": $('#ddlStatus-behalf option:selected').val(),
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-emp-req-behalf td').length > 0 ? objDatatableb.destroy() : '';
            var htm = '';
            var htmlHead = '';

            if ($('#ddlRequests-behalf option:selected').val() == 0) {

                htmlHead += `<tr style="text-align: center;">
                               <th class="table-cahnge" colspan="8" style="font-size:large;background: #b70000 !important;color: white !important;">LEAVE APPLICATION</th></tr>`

                htmlHead += `   <tr style=" ;" class="Head-tr">
                                 <th style="display:none;">ID</th>
                                 
                                 <th>Leave App No</th>
                                 <th>Applied For</th>
                                 <th>Leave Type</th>
                                 <th>Start Date</th>
                                 <th>End Date</th>
                                 <th>Reason</th>
                                 <th>Stage</th>
                                 <th>Action</th>
                             

                 </tr>`;

                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.LEAVE_APPLICATION_ID + `</td>  
                 <td style="text-align: center; ">`+ item.LEAVE_APPLICATION_NO + `</td>
                 <td style=" ">`+ item.EmployeeName + `</td> 
                  
                 <td style=" ">`+ item.LEAVE_TYPE + `</td>     
                 <td style="text-align: center; ">`+ datedayformat(item.FROM_DATE) + `</td>
                 <td style=" text-align: center;">`+ datedayformat(item.TO_DATE) + `</td>
                  <td style=" ">`+ item.REASON + `</td> 
                  <td style=" text-align: center;" ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                  <td style="text-align:center ">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-leave-req-info" title="Other" data-projid="`+ item.LEAVE_APPLICATION_NO + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                    </tr>`;

                });

                $('.thead-Request_Details-behalf').html(htmlHead);
                $('.tbody-emp-req-behalf').html(htm);

            }


            else if ($('#ddlRequests-behalf option:selected').val() == 1) {





                htmlHead += ` <tr style="text-align: center;" class="Head-tr">
                                      <th class="table-cahnge" colspan="8" style="font-size:large;background: #b70000 !important;color: white !important;">PASSPORT RELEASE</th></tr>`

                htmlHead += `  <tr style="text-align: center;" class="Head-tr">
                                <th style="display:none;">ID</th >
                                
                                <th> Request Numb</th>
                                <th>Applied For</th>
                                 <th>Reason</th>
                                 <th>Travelling Date</th>
                                 <th>Return Date</th>
                                 <th>Request Date</th>
                                 <th>Stage</th>
                                 <th>Action</th>
                 </tr>`;

                $.each(result.d, function (key, item) {

                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                 <td style="text-align: center; ">`+ item.Req_Number + `</td>
                 <td style=" ">`+ item.EmployeeName + `</td>
                  
                 <td style=" ">`+ item.RequestFor + `</td>     
                 <td style=" text-align: center;">`+ datedayformat(item.Travelling_Date) + `</td>
                 <td style=" text-align: center;">`+ datedayformat(item.Expected_Date_Of_Return) + `</td>
                  <td style=" text-align: center;">`+ datedayformat(item.RequestDate) + `</td>
                    <td style="text-align: center; " ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                   <td style=" text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-PPT-req-info" title="Other" data-pptid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                   </tr>`;

                });

                $('.thead-Request_Details-behalf').html(htmlHead);
                $('.tbody-emp-req-behalf').html(htm);

            }



            else if ($('#ddlRequests-behalf option:selected').val() == 2) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="6" style="font-size:large;background: #b70000 !important;color: white !important;">BANK RELATED REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th >
                                 <th>Request Number</th >
                                 <th>Applied For</th>
                                 
                                 <th>Request Type</th>
                                 <th>Request Date</th>
                                 <th>Request Status</th>
                                 <th>Action</th></tr>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                 <td style="text-align: center; ">`+ item.Req_Number + `</td>
                 <td style=" ">`+ item.EmployeeName + `</td>
                   
                 <td style=" ">`+ item.REQUEST_TYPE + `</td>  
                 <td style=" text-align: center;">`+ datedayformat(item.RequestDate) + `</td>
               <td style=" text-align: center;" ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                <td style="text-align:center ">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-BDR-req-info" title="Other" data-bankrelid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details-behalf').html(htmlHead);
                $('.tbody-emp-req-behalf').html(htm);

            }


            else if ($('#ddlRequests-behalf option:selected').val() == 3) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="7" style="font-size:large;background: #b70000 !important;color: white !important;">MISCELLANEOUS REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th >
                                
                                 <th>Request Number</th >
                                  <th>Applied For</th>
                                 <th>Request Type</th>
                                 <th>Reason</th>
                                 <th>Request Date</th>
                                 <th>Status</th>
                                  <th>Action</th></tr>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                 
                  <td style=" text-align: center;">`+ item.Req_Number + `</td>
                  <td style=" ">`+ item.EmployeeName + `</td>
                 <td style=" ">`+ item.REQUEST_TYPE + `</td>   
                 <td style=" ">`+ item.RequestFor + `</td>   
                  <td style=" text-align: center;">`+ datedayformat(item.RequestDate) + `</td>
                 <td style=" text-align: center;" ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                <td style=" text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-Misc-req-info" title="Other Misc" data-miscid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details-behalf').html(htmlHead);
                $('.tbody-emp-req-behalf').html(htm);

            }


            else if ($('#ddlRequests-behalf option:selected').val() == 4) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="9" style="font-size:large;background: #b70000 !important;color: white !important;">COMPANY LOAN REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th >
                                 
                                 <th style="width:20%">Request Number</th >
                                 <th>Applied For</th>
                                 <th style="width:10%">Loan Type</th>
                                 <th style="width:20%">Reason</th>
                                 <th style="width:10%">Date Start</th>
                                 <th style="width:10%">Amount</th>
                                 <th style="width:10%">Request Date</th>
                                 <th style="width:10%">Status</th>
                                  <th style="width:10%">Action</th></tr>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                  <td style=" text-align: center;">`+ item.Req_Number + `</td>
                 <td style=" ">`+ item.EmployeeName + `</td>
                   
                 <td style=" ">`+ item.REQUEST_TYPE + `</td>   
                 <td style=" ">`+ item.RequestFor + `</td>   
                 <td style="text-align: center; ">`+ datedayformat(item.FROM_DATE) + `</td>
                 <td style=" text-align: center;">`+ item.AMOUNT + `</td>
                 <td style=" text-align: center;">`+ datedayformat(item.RequestDate) + `</td>
                  <td style=" text-align: center;" ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                <td style="text-align:center ">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-CL-req-info" title="Other" data-comloid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details-behalf').html(htmlHead);
                $('.tbody-emp-req-behalf').html(htm);

            }


            else if ($('#ddlRequests-behalf option:selected').val() == 5) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="8" style="font-size:large;background: #b70000 !important;color: white !important;">LATE ATTENDANCE REQUEST</th></tr>`

                htmlHead += `    <tr style="text-align: center;">
                                 <th style="display:none;">ID</th >
                                 <th style="width:20%">Request Number</th >
                                 <th>Applied For</th>
                                 
                                 <th style="width:10%">Date</th>
                                 <th style="width:10%">Arrived Time</th>
                                 <th style="width:20%">Reason</th>
                                 <th style="width:10%">Request Date</th>
                                 <th style="width:20%">Status</th>
                                  <th style="width:20%">Action</th></tr>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                 <td style=" ">`+ item.Req_Number + `</td>
                 <td style=" ">`+ item.EmployeeName + `</td>
                    
                  <td style="text-align:center ">`+ datedayformat(item.FROM_DATE) + `</td>
                 <td style=" text-align:center">`+ item.ARRIVED_TIME + `</td>
                 <td style=" ">`+ item.REASON + `</td>   
                 <td style="text-align:center ">`+ datedayformat(item.RequestDate) + `</td>
                   <td style=" text-align:center" ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                <td style="text-align:center ">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-LA-req-info" title="Other" data-laid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details-behalf').html(htmlHead);
                $('.tbody-emp-req-behalf').html(htm);

            }

            else if ($('#ddlRequests-behalf option:selected').val() == 6) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="8" style="font-size:large;background: #b70000 !important;color: white !important;">EXIT PASS REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th >
                                 
                                 <th style="width:10%">Request Number</th >
                                 <th>Applied For</th>
                                 <th style="width:10%">Exit Date</th>
                                 <th style="width:10%">Exit Time</th>
                                 <th style="width:20%">Reason</th>
                                 <th style="width:10%">Request Date</th>
                                 <th style="width:10%">Status</th>
                                  <th style="width:10%">Action</th></tr>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                 <td style=" ">`+ item.Req_Number + `</td> 
                 <td style=" ">`+ item.EmployeeName + `</td>
                   
                 <td style="text-align:center ">`+ datedayformat(item.EXIT_DATE) + `</td>
                 <td style="text-align:center ">`+ item.OUT_TIME + `</td>
                 <td style=" ">`+ item.REASON + `</td>   
                 <td style=" text-align:center">`+ datedayformat(item.RequestDate) + `</td>
                 <td style=" text-align:center" ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                <td style="text-align:center ">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-EXTPass-req-info" title="Other" data-exitid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details-behalf').html(htmlHead);
                $('.tbody-emp-req-behalf').html(htm);

            }
            else if ($('#ddlRequests-behalf option:selected').val() == 7) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="7" style="font-size:large;background: #b70000 !important;color: white !important;">TICKET ENCASHMENT REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th > 
                                 <th style="width:10%">Request Number</th >
                                 <th style="width:10%">Last Ticket Encash Date</th>
                                 <th style="width:10%">Requested Date</th>
                                 <th style="width:20%">Reason</th>
                                 <th style="width:10%">Status</th>
                                  <th style="width:10%">Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                  <td style=" text-align: center;">`+ item.Req_Number + `</td>

                 <td style="text-align: center; ">`+ datedayformat(item.LastEncashDate) + `</td>
                 <td style=" text-align: center;">`+ datedayformat(item.RequestDate) + `</td>
                  <td style=" ">`+ item.REASON + `</td>   
                 <td style=" text-align: center;" ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                 <td style=" text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-TE-req-info" title="Other" data-exitid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details-behalf').html(htmlHead);
                $('.tbody-emp-req-behalf').html(htm);

            }
            //all Request
            else if ($('#ddlRequests-behalf option:selected').val() == -1) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="7" style="font-size:large;background: #b70000 !important;color: white !important;">ALL REQUESTS</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th>
                                  <th style="display:none;">ReqTypeID</th>
                                 <th style="width:25%">Request Number</th>
                                   <th>Applied For</th>
                                 
                                 <th style="width:25%">Reason</th>
                                 <th style="width:20%">Request Date</th>
                                 <th style="width:20%">Status</th>
                                 <th style="width:10%">Action</th></tr>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 

                 <td style=" ;display:none;">`+ item.REQUEST_TYPEID + `</td> 
                 <td style="text-align: center; ">`+ item.Req_Number + `</td>
                 <td style=" ">`+ item.EmployeeName + `</td>
                 <td style=" ">`+ item.REASON + `</td>   
                 <td style=" ">`+ datedayformat(item.RequestDate) + `</td> 
                 <td style=" text-align:center" ><a class="`+ item.StageClass + `">` + item.Stage + `</a></td>
                 <td style=" text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-AllReq-req-info" title="Other" data-projid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details-behalf').html(htmlHead);
                $('.tbody-emp-req-behalf').html(htm);

            }

            initiateDataTableEmpbehalf();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


} 


$('.tbody-emp-req-behalf').on('click', '.ibtn-AllReq-req-info', function () {


    Type = this.parentNode.parentNode.parentNode.children[1].textContent;

    if (Type == 0) {

        $('#ddlRequestType').val('0');
        $('#ddlRequestType').attr('disabled', true);
        RequestPageLoad();
        ClearDetails();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        GetAllDetails();
        SetForm();

        $('.insert-Attachment').css('display', 'none');
        $('.download-Attachment').css('display', '');
        $('#empLeaveModal').modal('show');

    }
    else if (Type == 1) {

        $('#ddlRequestType').val('1');
        $('#ddlRequestType').attr('disabled', true);
        RequestPageLoad();
        ClearPPTDetails();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllPPTDetails();
       

        $('#empLeaveModal').modal('show');
    }

    else if (Type == 2) {

        $('#ddlRequestType').val('2');
        $('#ddlRequestType').attr('disabled', true);

        RequestPageLoad();
        ClearBankDetails();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllBankDetails();
        BankDetReqTypeChange();

        $('.insert-Attachment').css('display', 'none');
        $('.download-Attachment').css('display', '');
        $('#empLeaveModal').modal('show');
        loadEmpDetails();
        loadEmpLoanDetails();
    }

    else if (Type == 3) {

        $('#ddlRequestType').val('3');
        $('#ddlRequestType').attr('disabled', true);
        RequestPageLoad();
        ClearMiscReqDetails();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllMiscRequestDetails();
        miscReqTypeFormate();

        $('.insert-Attachment').css('display', 'none');
        $('.download-Attachment').css('display', '');
        $('#empLeaveModal').modal('show');
    }

    else if (Type == 4) {

        $('#ddlRequestType').val('4');
        $('#ddlRequestType').attr('disabled', true);

        RequestPageLoad();
        ClearCLReqDetails();
        CompanyLoanInitialForm();
        loadEmpDetails();
        loadEmpLoanDetails();

        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllCompanyLoanDetails();

        $('.insert-Attachment').css('display', 'none');
        $('.download-Attachment').css('display', '');
        $('#empLeaveModal').modal('show');

    }

    else if (Type == 5) {

        $('#ddlRequestType').val('5');
        $('#ddlRequestType').attr('disabled', true);
        RequestPageLoad();
        ClearLAReq();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllLAReqDetails();

        $('#empLeaveModal').modal('show');
    }

    else if (Type == 6) {

        $('#ddlRequests option:selected').val();
        $('#ddlRequestType').val('6');
        $('#ddlRequestType').attr('disabled', true);
        RequestPageLoad();
        ClearEPReq();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllEPReqDetails();

        $('#empLeaveModal').modal('show');
    }
    else if (Type == 7) {

        $('#ddlRequests option:selected').val();
        $('#ddlRequestType').val('7');
        $('#ddlRequestType').attr('disabled', true);
        RequestPageLoad();
        ClearTEReq();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllTEReqDetails();
        $('#dtLastEncashDate').val(LastTicketEncashDate);
        $('#empLeaveModal').modal('show');
    }
});

$('.tbody-emp-req-behalf').on('click', '.ibtn-leave-req-info', function () {

    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('0');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearDetails();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    GetAllDetails();
    SetForm();
    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');
});
$('.tbody-emp-req-behalf').on('click', '.ibtn-PPT-req-info', function () {


    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('1');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearPPTDetails();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    getAllPPTDetails();
   
    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');
});
$('.tbody-emp-req-behalf').on('click', '.ibtn-BDR-req-info', function () {


    let selBADId = $(this).data('bankrelid');

    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('2');
    $('#ddlRequestType').attr('disabled', true);

    RequestPageLoad();
    ClearBankDetails();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    getAllBankDetails();
    BankDetReqTypeChange();

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');
});
$('.tbody-emp-req-behalf').on('click', '.ibtn-misc-req-info', function () {
    let selMiscId = $(this).data('miscid');
    //selobjDatatableMisc = result.filter(s => s.ID == selMiscId);

    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('3');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearMiscReqDetails();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    getAllMiscRequestDetails();
    miscReqTypeFormate();
    $('#empLeaveModal').modal('show');
});


$('.tbody-emp-req-behalf').on('click', '.ibtn-CL-req-info', function () {

    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('4');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearCLReqDetails();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    getAllCompanyLoanDetails();
    $('#empLeaveModal').modal('show');
});

$('.tbody-emp-req-behalf').on('click', '.ibtn-LA-req-info', function () {


    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('5');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearLAReq();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    getAllLAReqDetails();

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');

});
$('.tbody-emp-req-behalf').on('click', '.ibtn-EXTPass-req-info', function () {


    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('6');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearEPReq();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    getAllEPReqDetails();

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');
});
$('.tbody-emp-req-behalf').on('click', '.ibtn-TE-req-info', function () {


    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('7');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearEPReq();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    getAllTEReqDetails();

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');

});
$('.tbody-emp-req').on('click', '.ibtn-AllReq-req-info', function () {


    Type = this.parentNode.parentNode.parentNode.children[1].textContent;

    if (Type == 0) {

        $('#ddlRequestType').val('0');
        $('#ddlRequestType').attr('disabled', true);
        RequestPageLoad();
        ClearDetails();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        GetAllDetails();
        SetForm();

        $('.insert-Attachment').css('display', 'none');
        $('.download-Attachment').css('display', '');
        $('#empLeaveModal').modal('show');

    }
    else if (Type == 1) {


        $('#ddlRequestType').val('1');
        $('#ddlRequestType').attr('disabled', true);
        RequestPageLoad();
        ClearPPTDetails();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllPPTDetails();
       

        $('#empLeaveModal').modal('show');
    }

    else if (Type == 2) {



        $('#ddlRequestType').val('2');
        $('#ddlRequestType').attr('disabled', true);

        RequestPageLoad();
        ClearBankDetails();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllBankDetails();
        BankDetReqTypeChange();

        $('.insert-Attachment').css('display', 'none');
        $('.download-Attachment').css('display', '');
        $('#empLeaveModal').modal('show');
        loadEmpDetails();
        loadEmpLoanDetails();
    }

    else if (Type == 3) {

        $('#ddlRequestType').val('3');
        $('#ddlRequestType').attr('disabled', true);
        RequestPageLoad();
        ClearMiscReqDetails();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllMiscRequestDetails();
        miscReqTypeFormate();


        $('.insert-Attachment').css('display', 'none');
        $('.download-Attachment').css('display', '');
        $('#empLeaveModal').modal('show');
    }

    else if (Type == 4) {


        $('#ddlRequestType').val('4');
        $('#ddlRequestType').attr('disabled', true);

        RequestPageLoad();
        ClearCLReqDetails();
        CompanyLoanInitialForm();
        loadEmpDetails();
        loadEmpLoanDetails();

        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllCompanyLoanDetails();
        
        
        $('.insert-Attachment').css('display', 'none');
        $('.download-Attachment').css('display', '');
        $('#empLeaveModal').modal('show');
        
        
    }

    else if (Type == 5) {


        $('#ddlRequestType').val('5');
        $('#ddlRequestType').attr('disabled', true);
        RequestPageLoad();
        ClearLAReq();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllLAReqDetails();


        $('#empLeaveModal').modal('show');
    }

    else if (Type == 6) {

        $('#ddlRequests option:selected').val();
        $('#ddlRequestType').val('6');
        $('#ddlRequestType').attr('disabled', true);
        RequestPageLoad();
        ClearEPReq();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllEPReqDetails();


        $('#empLeaveModal').modal('show');
    }
    else if (Type == 7) {

        $('#ddlRequests option:selected').val();
        $('#ddlRequestType').val('7');
        $('#ddlRequestType').attr('disabled', true);
        RequestPageLoad();
        ClearTEReq();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllTEReqDetails();
        $('#dtLastEncashDate').val(LastTicketEncashDate);
        $('#empLeaveModal').modal('show');
    }


});

function getAllTEReqDetails() {
    $.ajax({
        url: "AllRequests.aspx/getAllTEReqDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //GetTikEncashRefNo();
            $('#lblStatus').html(result.d[0].Status);
            $('#lblAppID').html(result.d[0].ReqID);
            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(result.d[0].VisaExpiryDate);
            $('#lblPassExpDate').html(result.d[0].PassportExpireDate);
            $('#lblDateOfJoin').html(result.d[0].JoiningDate);
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(result.d[0].EmiratesExpDate);

            $('.on-beh').text('Applied By');
            $('.employee-drop').css('display', 'none');
            $('.employee-text').css('display', '');
            TicketencInitialForm();
            $('#txtEmpNametext').html(result.d[0].CreatedBy);
            /* loadAllEmployees(result.d[0].EmpNo);*/

            $('#lblRequestNumber').html(result.d[0].Req_Number);
            $("#txtTikEncashReason").val(result.d[0].Reason);
            $('#dtLastEncashDate').val(result.d[0].LastEncashDate);
            $('#txtNoOfTik').val(result.d[0].NoofTicketRequired);

            OnBehalfURL = result.d[0].On_Behalf_URL;
            RequestURL = result.d[0].Attchement_Link;

            reqStatus = result.d[0].ReqID;
            ApplicationId = result.d[0].ReqID;
            StatusOrder = result.d[0].StatusOrder;

           

            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].On_Behalf == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            } else {
                $('#cbEmpOnBehalf').prop('checked', false);
            }

            OnBehalfChange();
            
            htmActionButton = "";

            if (result.d[0].Status == "SUBMIT" && StatusOrder == 0) {
                SubmitTicketEncashDetForm();
                htmActionButton += `<div class="pull-right">
                <button id="btnCancellRequest" type="button" class="btn btn-primary btnTagTemp"><i class='bx bx-x-circle'></i>Cancel</button>
                </div>`;

            }
            else if (result.d[0].Status == "DRAFT") {

                htmActionButton += `<div class="pull-right">
                    <button id="btnSubmit" type="button" class="btn btn-primary btnTagTemp" style=""><i class='bx bxs-check-circle me-3'></i>Submit</button>
                    <button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-save me-3'></i>Save as Draft</button>
            
                     </div>`
            }
            else {
                SubmitTicketEncashDetForm();
                htmActionButton = "";
            }
            $(".ActionButtons").html(htmActionButton);
            $(".dvApprovalStage").css("display", "");
            loadApproverAuthorityPeople();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function SubmitTicketEncashDetForm() {
    $('#cbEmpOnBehalf').attr('disabled', true);
    $('#txtEmpName').attr('disabled', true);
    $('#txtTikEncashReason').attr('disabled', true);
    $('#txtNoOfTik').attr('disabled', true);
    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
}

$('.tbody-emp-req').on('click', '.ibtn-TE-req-info', function () {


    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('7');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearEPReq();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
   getAllTEReqDetails();

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');

});
$('.tbody-emp-req').on('click', '.ibtn-EXTPass-req-info', function () {


    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('6');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearEPReq();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    getAllEPReqDetails();

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');

});

$('.tbody-emp-req').on('click', '.ibtn-LA-req-info', function () {


    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('5');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearLAReq();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    getAllLAReqDetails();

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');


});


$('.tbody-emp-req').on('click', '.ibtn-CL-req-info', function () {


    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('4');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearCLReqDetails();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    getAllCompanyLoanDetails();



    $('#empLeaveModal').modal('show');



});

function SubmitCompanyLoanDetForm() {

    $('#cbEmpOnBehalf').attr('disabled', true);
    $('#txtEmpName').attr('disabled', true);
    $('#empLeaveModal').find('input[name="nmCLControll"]').attr('disabled', true);
    $('#txtCLoanReason').attr('disabled', true);
    $('#ddlBLLoanType').attr('disabled', true);
    $('#txtCLoanAmount').attr('disabled', true);

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
     if ($('#ddlBLLoanType').val() == 'HRA') {

                $(".divnumberofMonth").css('display', '');


            }
            else {
                $(".divnumberofMonth").css('display', 'none');
            }
}

function SubmitLateAttendanceDetForm() {

    $('#cbEmpOnBehalf').attr('disabled', true);
    $('#txtEmpName').attr('disabled', true);
    $('#txtLAReqReason').attr('disabled', true);
    $('#txtLAReqDate').attr('disabled', true);
    $('#txtLAreqTime').attr('disabled', true);
    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');


}
function SubmitExitPassDetForm() {
    $('#cbEmpOnBehalf').attr('disabled', true);
    $('#txtEmpName').attr('disabled', true);
    $('#txtEXTPassDate').attr('disabled', true);
    $('#ddlEXTPassType').attr('disabled', true);
    $('#txtEXTPassOutTime').attr('disabled', true);
    $('#txtEXTPassBackTime').attr('disabled', true);
    $('#txtEXTPassReason').attr('disabled', true);
    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
}
function getAllCompanyLoanDetails() {

    $.ajax({
        url: "AllRequests.aspx/GetAllCompanyLoanDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

             GetBDBasicSalaryDet();
            $('#lblStatus').html(result.d[0].Status);
            $('#lblAppID').html(result.d[0].ReqID);

            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(result.d[0].VisaExpiryDate);
            $('#lblPassExpDate').html(result.d[0].PassportExpireDate);
            $('#lblDateOfJoin').html(result.d[0].JoiningDate);
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(result.d[0].EmiratesExpDate);

            $('#txtBDBasic').val(result.d[0].BASIC);
            $('#txtBDHRA').html(result.d[0].HRAA);
            $('#txtBDCar').val(result.d[0].CARALW);
            $('#txtBDMobile').val(result.d[0].MOBALW);
            $('#txtBDOther').val(result.d[0].OTHALW);

            $('.on-beh').text('Applied By');
            $('.employee-drop').css('display', 'none');
            $('.employee-text').css('display', '');

            $('#txtEmpNametext').html(result.d[0].CreatedBy);
            /*loadAllEmployees(result.d[0].EmpNo);*/

            $('#lblRequestNumber').html(result.d[0].Req_Number);
            $('#txtCLoanReqDate').val(result.d[0].CREATEDDATE);
            $('#ddlBLLoanType').val(result.d[0].REQUEST_TYPE);
            CompanyLoanInitialForm();
            CompanyLoanTypeFormat();
            /* $('#txtCLoanDedStartMonth').val(result.d[0].DATE_START);*/
            $("#txtCLoanDedStartMonth").val(result.d[0].DATE_START);
            $('#txtCLoanAmount').val(result.d[0].AMOUNT);
            $('#txtCLoanMonthlyDed').val(result.d[0].MONTHLY_DEDUCTION);
            $('#txtCLoanReason').val(result.d[0].Reason);

            $('#txtBDBank').val(result.d[0].BANK);
            $('#txtBDBankName').val(result.d[0].BANK);
            $('#txtBDIBANNo').val(result.d[0].IBAN_NO);
            $('#txtBDBankAddress').val(result.d[0].BANK_ADDRESS);
            $('#txtBDReqamount').val(result.d[0].AMOUNT);
            $("#txtNumberofMonth").val(result.d[0].No_OF_Month);

            OnBehalfURL = result.d[0].On_Behalf_URL;
            RequestURL = result.d[0].Attchement_Link;
            reqStatus = result.d[0].Status;
            ApplicationId = result.d[0].ReqID;
            StatusOrder = result.d[0].StatusOrder;

            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].On_Behalf == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            } else {
                $('#cbEmpOnBehalf').prop('checked', false);
            }

            OnBehalfChange();
            
            htmActionButton = "";

            if (result.d[0].Status == "SUBMIT" && StatusOrder == 0 ) {
                SubmitCompanyLoanDetForm();
                htmActionButton += `<div class="pull-right">
                <button id="btnCancellRequest" type="button" class="btn btn-primary btnTagTemp"><i class='bx bx-x-circle'></i>Cancel</button>
                </div>`;

            }
            else if (result.d[0].Status == "DRAFT") {

                htmActionButton += `<div class="pull-right">
                    <button id="btnSubmit" type="button" class="btn btn-primary btnTagTemp" style=""><i class='bx bxs-check-circle me-3'></i>Submit</button>
                    <button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-save me-3'></i>Save as Draft</button>
            
                     </div>`
            }
            else {
                SubmitCompanyLoanDetForm();
                htmActionButton = "";
            }
            $(".ActionButtons").html(htmActionButton);
            $(".dvApprovalStage").css("display", "");
            loadApproverAuthorityPeople();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function getAllEPReqDetails() {

    $.ajax({
        url: "AllRequests.aspx/GetAllEPReqDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#lblStatus').html(result.d[0].Status);
            $('#lblAppID').html(result.d[0].ReqID);
            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(result.d[0].VisaExpiryDate);
            $('#lblPassExpDate').html(result.d[0].PassportExpireDate);
            $('#lblDateOfJoin').html(result.d[0].JoiningDate);
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(result.d[0].EmiratesExpDate);

            $('.on-beh').text('Applied By');
            $('.employee-drop').css('display', 'none');
            $('.employee-text').css('display', '');

            $('#txtEmpNametext').html(result.d[0].CreatedBy);
           /* loadAllEmployees(result.d[0].EmpNo);*/

            $('#lblRequestNumber').html(result.d[0].Req_Number);
            /* $('#txtEXTPassDate').val(result.d[0].EXIT_DATE);*/
            /* $('#txtCLoanDedStartMonth').val(result.d[0].DATE_START);*/
            $("#txtEXTPassDate").val(result.d[0].EXIT_DATE);
            $('#ddlEXTPassType').val(result.d[0].EXIT_TYPE);
            $('#txtEXTPassOutTime').val((result.d[0].OUT_TIME));
            $('#txtEXTPassBackTime').val((result.d[0].BACK_TIME));
            $('#txtEXTPassReason').val(result.d[0].Reason);

            OnBehalfURL = result.d[0].On_Behalf_URL;
            RequestURL = result.d[0].Attchement_Link;

            reqStatus = result.d[0].ReqID;
            ApplicationId = result.d[0].ReqID;
            StatusOrder = result.d[0].StatusOrder;

            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].On_Behalf == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            } else {
                $('#cbEmpOnBehalf').prop('checked', false);
            }

            OnBehalfChange();
            ExitPassInitialForm();
            htmActionButton = "";

            if (result.d[0].Status == "SUBMIT" && StatusOrder == 0) {
                SubmitExitPassDetForm();
                htmActionButton += `<div class="pull-right">
                <button id="btnCancellRequest" type="button" class="btn btn-primary btnTagTemp"><i class='bx bx-x-circle'></i>Cancel</button>
                </div>`;

            }
            else if (result.d[0].Status == "DRAFT") {

                htmActionButton += `<div class="pull-right">
                    <button id="btnSubmit" type="button" class="btn btn-primary btnTagTemp" style=""><i class='bx bxs-check-circle me-3'></i>Submit</button>
                    <button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-save me-3'></i>Save as Draft</button>
            
                     </div>`
            }
            else {
                SubmitExitPassDetForm();
                htmActionButton = "";
            }
            $(".ActionButtons").html(htmActionButton);
            $(".dvApprovalStage").css("display", "");
            loadApproverAuthorityPeople();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function getAllLAReqDetails() {

    $.ajax({
        url: "AllRequests.aspx/GetAllLAReqDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#lblStatus').html(result.d[0].Status);
            $('#lblAppID').html(result.d[0].ReqID);

            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(result.d[0].VisaExpiryDate);
            $('#lblPassExpDate').html(result.d[0].PassportExpireDate);
            $('#lblDateOfJoin').html(result.d[0].JoiningDate);
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(result.d[0].EmiratesExpDate);



            $('.on-beh').text('Applied By');
            $('.employee-drop').css('display', 'none');
            $('.employee-text').css('display', '');

            $('#txtEmpNametext').html(result.d[0].CreatedBy);
           /* loadAllEmployees(result.d[0].EmpNo);*/

            $('#lblRequestNumber').html(result.d[0].Req_Number);
            $('#txtLAReqDate').val(result.d[0].LATE_DATE);
            /* $('#txtCLoanDedStartMonth').val(result.d[0].DATE_START);*/
            $("#txtLAReqDate").val(result.d[0].LATE_DATE);
            $('#txtLAreqTime').val((result.d[0].ARRIVED_TIME));
            $('#txtLAReqReason').val(result.d[0].Reason);

            OnBehalfURL = result.d[0].On_Behalf_URL;
            RequestURL = result.d[0].Attchement_Link;

            reqStatus = result.d[0].Status;
            ApplicationId = result.d[0].ReqID;
            StatusOrder = result.d[0].StatusOrder;
            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].On_Behalf == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            } else {
                $('#cbEmpOnBehalf').prop('checked', false);
            }

            OnBehalfChange();
            LateAttendanceInitialForm();
            htmActionButton = "";
            if (result.d[0].Status == "SUBMIT" && StatusOrder == 0) {
                SubmitLateAttendanceDetForm();
                htmActionButton += `<div class="pull-right">
                <button id="btnCancellRequest" type="button" class="btn btn-primary btnTagTemp"><i class='bx bx-x-circle'></i>Cancel</button>
                </div>`;

            }
            else if (result.d[0].Status == "DRAFT") {
                htmActionButton += `<div class="pull-right">
                    <button id="btnSubmit" type="button" class="btn btn-primary btnTagTemp" style=""><i class='bx bxs-check-circle me-3'></i>Submit</button>
                    <button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-save me-3'></i>Save as Draft</button>
            
                     </div>`
            }
            else {
                SubmitLateAttendanceDetForm();
                htmActionButton = "";
            }
            if ((parseInt(StatusOrder) >= 1 && reqStatus != "SUBMIT") || (parseInt(StatusOrder) >= 1 && reqStatus == "SUBMIT") ) {
                if (result.d[0].Ispaid == 0) {
                    $('#lblIsPaid').html("Paid Status: PAID")
                }
                else if (result.d[0].Ispaid == 1) {
                    $('#lblIsPaid').html("Paid Status: UN-PAID")
                }
                else if (result.d[0].Ispaid == 2) {
                    $('#lblIsPaid').html("Paid Status: COMPANY POLICY")
                }
                else if (result.d[0].Ispaid == -1) {
                    $('#lblIsPaid').html("PAID Status: Pending..")
                }
            }
            else {
                $('#lblIsPaid').html("PAID Status: Pending..")
            }

            $(".ActionButtons").html(htmActionButton);
            $(".dvApprovalStage").css("display", "");
            loadApproverAuthorityPeople();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-emp-req').on('click', '.ibtn-Misc-req-info', function () {

    let selMiscId = $(this).data('miscid');
    //selobjDatatableMisc = result.filter(s => s.ID == selMiscId);

    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('3');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearMiscReqDetails();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    getAllMiscRequestDetails();
    miscReqTypeFormate();



    $('#empLeaveModal').modal('show');




});

function SubmitMiscDetForm(id, sts) {


    $('#cbEmpOnBehalf').attr('disabled', true);
    $('#txtEmpName').attr('disabled', true);
    $('#empLeaveModal').find('input[name="nmMiscControll"]').attr('disabled', true);
    $('#txtMiscReason').attr('disabled', true);
    $('#ddlMiscReqType').attr('disabled', true);
    $('#ddlMiscReason').attr('disabled', true);
    $('#ddlMiscEmpType').attr('disabled', true);
    $('#ddlMiscTransType').attr('disabled', true);

    $('#txtMiscFromDate').attr('disabled', true);
    $('#txtMiscToDate').attr('disabled', true);
    $('#txtMiscFromDateTrans').attr('disabled', true);
    $('#txtMiscToDateTrans').attr('disabled', true);

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');

}

function getAllMiscRequestDetails() {

    $.ajax({
        url: "AllRequests.aspx/GetAllMiscReqDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#lblStatus').html(result.d[0].Status);
            $('#lblAppID').html(result.d[0].ReqID);
            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(result.d[0].VisaExpiryDate);
            $('#lblPassExpDate').html(result.d[0].PassportExpireDate);
            $('#lblDateOfJoin').html(result.d[0].JoiningDate);
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(result.d[0].EmiratesExpDate);

            $('.on-beh').text('Applied By');
            $('.employee-drop').css('display', 'none');
            $('.employee-text').css('display', '');

            $('#txtEmpNametext').html(result.d[0].CreatedBy);
           /* loadAllEmployees(result.d[0].EmpNo);*/

            $('#lblRequestNumber').html(result.d[0].Req_Number);
            $('#txtMiscReqDate').val(result.d[0].CREATEDDATE);
            loadMiscRequestType();
            $('#ddlMiscReqType').val(result.d[0].REQUEST_TYPE);
            loadMiscReason();
            $('#ddlMiscReason').val(result.d[0].Reason);

            $('#txtMiscReason').val(result.d[0].Reason);
            $('#txtMiscAddToWhom').val(result.d[0].Address_To_Whom);
            $('#txtMiscOtherRemarks').val(result.d[0].OtherRemarks);
            /* $('#txtMiscFromDate').val(result.d[0].From_Date);*/
            document.getElementById("txtMiscFromDate").valueAsDate = new Date(result.d[0].From_Date);
            /* $('#txtMiscToDate').val(result.d[0].To_Date);*/
            document.getElementById("txtMiscToDate").valueAsDate = new Date(result.d[0].To_Date);
            $('#txtCountryToApplyVisa').val(result.d[0].Country_Apply_Visa);

            LoadMiscEmpType();
            $('#ddlMiscEmpType').val(result.d[0].Employee_Type);
            $('#txtMiscCurrLocation').val(result.d[0].Current_Location);
            $('#txtMiscReqLocation').val(result.d[0].To_Location);
            $('#ddlMiscTransType').val(result.d[0].Transport_Type);
            /*$('#txtMiscFromDateTrans').val(result.d[0].From_Date); */
            document.getElementById("txtMiscFromDateTrans").valueAsDate = new Date(result.d[0].From_Date);
            /* $('#txtMiscToDateTrans').val(result.d[0].To_Date);*/
            document.getElementById("txtMiscToDateTrans").valueAsDate = new Date(result.d[0].To_Date);

            $('#txtMiscDateOfChange').val(result.d[0].DateOfChange);

            OnBehalfURL = result.d[0].On_Behalf_URL;
            RequestURL = result.d[0].Attchement_Link;

            reqStatus = result.d[0].Status;
            StatusOrder = result.d[0].StatusOrder;
            ApplicationId = result.d[0].ReqID;

            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].On_Behalf == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            } else {
                $('#cbEmpOnBehalf').prop('checked', false);
            }

            OnBehalfChange();
            MiscInitialForm();
            htmActionButton = "";

            if (result.d[0].Status == "SUBMIT" && StatusOrder == 0) {
                SubmitMiscDetForm();
                htmActionButton += `<div class="pull-right">
                <button id="btnCancellRequest" type="button" class="btn btn-primary btnTagTemp"><i class='bx bx-x-circle'></i>Cancel</button>
                </div>`;

            }
            else if (result.d[0].Status == "DRAFT") {

                htmActionButton += `<div class="pull-right">
                    <button id="btnSubmit" type="button" class="btn btn-primary btnTagTemp" style=""><i class='bx bxs-check-circle me-3'></i>Submit</button>
                    <button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-save me-3'></i>Save as Draft</button>
            
                     </div>`
            }
            else {
                SubmitMiscDetForm();
                htmActionButton = "";
            }
            $(".ActionButtons").html(htmActionButton);
            $(".dvApprovalStage").css("display", "");
            loadApproverAuthorityPeople();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-emp-req').on('click', '.ibtn-BDR-req-info', function () {

    let selBADId = $(this).data('bankrelid');

    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('2');
    $('#ddlRequestType').attr('disabled', true);

    RequestPageLoad();
    ClearBankDetails();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    getAllBankDetails();
    BankDetReqTypeChange();

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');


});

function SubmitBankDetForm(sts, id) {


    $('#cbEmpOnBehalf').attr('disabled', true);
    $('#txtEmpName').attr('disabled', true);
    $('#ddlBDReqType').attr('disabled', true);
    $('#ddlBDReason').attr('disabled', true);
    $('#txtBDBankAddress').attr('disabled', true);
    $('#txtBDReqamount').attr('disabled', true);
    $('#txtBDBank').attr('disabled', true);



}

function InitialBankDet() {
    $('#cbEmpOnBehalf').attr('disabled', false);
    $('#txtEmpName').attr('disabled', false);
    $('#ddlBDReqType').attr('disabled', false);
    $('#ddlBDReason').attr('disabled', false);
    $('#txtBDBankAddress').attr('disabled', false);
    $('#txtBDReqamount').attr('disabled', false);
    $('#txtBDBank').attr('disabled', false);
    BankDetReqTypeChange();
}


function getAllBankDetails() {

    $.ajax({
        url: "AllRequests.aspx/GetAllBankDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#lblStatus').html(result.d[0].Status);
            $('#lblAppID').html(result.d[0].ReqID);

            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(datedayformat(result.d[0].VisaExpiryDate));
            $('#lblPassExpDate').html(datedayformat(result.d[0].PassportExpireDate));
            $('#lblDateOfJoin').html(datedayformat(result.d[0].JoiningDate));
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(datedayformat(result.d[0].EmiratesExpDate));

            $('#txtBDBasic').val(result.d[0].BASIC);
            $('#txtBDHRA').val(result.d[0].HRAA);
            $('#txtBDCar').val(result.d[0].CARALW);
            $('#txtBDMobile').val(result.d[0].MOBALW);
            $('#txtBDOther').val(result.d[0].OTHALW);

            $('.on-beh').text('Applied By');
            $('.employee-drop').css('display', 'none');
            $('.employee-text').css('display', '');

            $('#txtEmpNametext').html(result.d[0].CreatedBy);

            /*loadAllEmployees(result.d[0].EmpNo);*/

            $('#lblRequestNumber').html(result.d[0].Req_Number);
            $('#txtBDReqDate').val(result.d[0].CREATEDDATE);
            loadBDRequestType();
            $('#ddlBDReqType').val(result.d[0].REQUEST_TYPE);
            loadBDReason();
            $('#ddlBDReason').val(result.d[0].Reason);

            $('#txtBDBank').val(result.d[0].BANK);
            $('#txtBDBankName').val(result.d[0].BANK);
            $('#txtBDIBANNo').val(result.d[0].IBAN_NO);
            $('#txtBDBankAddress').val(result.d[0].BANK_ADDRESS);
            $('#txtBDReqamount').val(result.d[0].AMOUNT);

            OnBehalfURL = result.d[0].On_Behalf_URL;
            RequestURL = result.d[0].Attchement_Link;

            reqStatus = result.d[0].Status;
            StatusOrder = result.d[0].StatusOrder;
            ApplicationId = result.d[0].ReqID;

            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].On_Behalf == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            } else {
                $('#cbEmpOnBehalf').prop('checked', false);
            }

            OnBehalfChange();

            htmActionButton = "";
            InitialBankDet();
            if (result.d[0].Status == "SUBMIT" && StatusOrder == 0) {
                SubmitBankDetForm();
                htmActionButton += `<div class="pull-right">
                <button id="btnCancellRequest" type="button" class="btn btn-primary btnTagTemp"><i class='bx bx-x-circle'></i>Cancel</button>
                </div>`;

            }
            else if (result.d[0].Status == "DRAFT") {
                htmActionButton += `<div class="pull-right">
                    <button id="btnSubmit" type="button" class="btn btn-primary btnTagTemp" style=""><i class='bx bxs-check-circle me-3'></i>Submit</button>
                    <button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-save me-3'></i>Save as Draft</button>
            
                     </div>`
            }
            else {
                SubmitBankDetForm();
                htmActionButton = "";
            }
            $(".ActionButtons").html(htmActionButton);
            $(".dvApprovalStage").css("display", "");
            loadApproverAuthorityPeople();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTableEmp() {
    objDatatable = [];
    objDatatable = $('.emp-req-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });
}

function initiateDataTableEmpbehalf() {
    objDatatableb = [];
    objDatatableb = $('.emp-req-table-behalf').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });
}

$('#ddlRequests').on('change', function () {

    Type = $('#ddlRequests option:selected').val();

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadRequestData('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

//$('#ddlStatus').on('change', function () {

//    Type = $('#ddlRequests option:selected').val();

//    $('.ajax-loader').removeClass('hidden');

//    setTimeout(function () {
//        LoadRequestData('Please Wait...');
//        $(".ajax-loader").addClass('hidden');
//    }, 500);

//});




$('#ddlStatus').on('change', function () {

    Type = $('#ddlRequests option:selected').val();

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadRequestData('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

$('#ddlRequests-behalf').on('change', function () {

    Type = $('#ddlRequests-behalf option:selected').val();

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadRequestDataforOnbehalf('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

$('#ddlStatus-behalf').on('change', function () {

    Type = $('#ddlStatus-behalf option:selected').val();

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadRequestDataforOnbehalf('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});
$('#empLeaveModal').on('change', '#ddlLeaveType', function () {

    selLeaveType = $('#ddlLeaveType option:selected').val();

    SetForm();


});




//$("#details").click(function () {
//    $('#admin-menu').animate({ width: 'show' }, 1000);
//});
function RequestPageLoad() {

    var htm = '';

    if (Type == 0) {
        htm += `
        <div class="row">
            <div class="col-2">
                <label for="html5-number-input" class="col-form-label label-custom">Leave Type  </label>
                <div>
                    <select id="ddlLeaveType" class="form-select color-dropdown"></select>
                </div>
            </div>

            <div class="col-1">
                <label for="html5-number-input" class="col-form-label label-custom">Balance </label>
                <div>
                    <input type="text" id="txtLeaveBal" class="form-control  " disabled />
                </div>
            </div>

                      
                <div class="col-2">
                <label for="html5-number-input" class="col-form-label label-custom">Start Date </label>
                            
                <div>
                    <input type="date" id="txtStartDate" name="nmReqDet" class="form-control flatpickr flatpickr-input"/>
                </div>
            </div>
                <div class="col-1">
                <label for="html5-number-input" class="col-form-label label-custom">No of Day </label>
                <div>
                    <input type="text" id="txtLeaveReqDay" name="nmReqDet" class="form-control   " />
                </div>
            </div>

            <div class="col-2 div-EndDate">
                <label for="html5-number-input" class="col-form-label label-custom">End Date </label>
                <div>
                    <input type="text" id="txtEndDate"  class="form-control flatpickr-input" disabled />
                </div>
            </div>
            <div class="col-2 div-Retwork">
                <label for="html5-number-input" class="col-form-label label-custom">Return to Work</label>
                <div class="">
                    <input type="text" id="txtReturnToWork" class="form-control flatpickr-input" />
                </div>
            </div>
            <div class="col-2">
                <label for="html5-number-input" class="col-form-label label-custom">Primary Contact</label>
                <div>
                    <input type="text" id="txtPrimaryContact" name="nmContactDet" class="form-control  " />
                </div>
            </div>
        </div>

                
        <div class="row">
            <div class="col-3" style="display:none;">
                <label for="html5-number-input" class="col-form-label label-custom">Leave Status</label>
                <div>
                    <input type="text" id="txtLeaveStatus" name="nmReqDet" class="form-control  " />
                </div>
            </div>
        </div>

        <div class="row ddl-opt-annual-leave Grop-Of-Det">
                        

            <div class="col-2">
                <label for="html5-number-input" class="col-form-label label-custom">Secondary Contact</label>
                <div>
                    <input type="text" id="txtSecContact" name="nmContactDet" class="form-control  " />
                </div>
            </div>

            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Contact Name</label>
                <div>
                    <input type="text" id="txtContactName" name="nmContactDet" class="form-control  " />
                </div>
            </div>

            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Contact Email</label>
                <div>
                    <input type="text" id="txtContactEmail" name="nmContactDet" class="form-control  " />
                </div>
            </div>

                      

        </div>

        <div class="row ddl-opt-annual-leave">
            <div class="col-4">
                <label for="html5-number-input" class="col-form-label label-custom">Remark</label>
                <div>
                    <textarea class="form-control  " id="taRemark" rows="4" placeholder="Enter Remarks"></textarea>
                </div>
            </div>
            <div class="col-3 div-Attachment">
                <label for="html5-number-input" class="col-form-label label-custom">Attachment</label>
                <div style="align-content: center;height: 106px;border: 1px solid #d9dee3;">

                <div class="input-group mb-3 insert-Attachment" style="">

                    <input class="form-control" type="file" id="fu-leave-req" title="Leave Request" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getFileName()">
                    <label class="input-group-text ml-3" for="fu-leave-req" style="border: transparent;">

                        <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 49px; margin-top: -10px;" />
                    </label>

                    <input type="text" id="lblLeaveReqFileName" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                </div>


                    <div class="input-group mb-3 download-Attachment" style="margin-left: 102px;">
                    <img src="Images/Icon-download.png" id="btnDownloadAttachment" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 60px;" />
                </div>
            </div>

            </div>

                <div class="col-5" style="align-self: center;">
            <div class="Group-Of-Cb" style="overflow-x: auto;">
                            
                <div style="float: left;padding-top: 7px;padding-right: 10px;">
                    <div class="netliva-switch">
                        <input type="checkbox" id="cbIsAdvSalaryReq" name="nmSbReq" netliva-switch="OK">
                        <label for="cbIsAdvSalaryReq" data-active-text="Consulted Doctor?" data-passive-text="Consulted Doctor?" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; display: none"></label>
                    </div>
                </div>
                <label for="html5-number-input" class="col-form-label label-custom">Advanced Salary Required? </label>
            </div>
            <div class="Group-Of-Cb" style="overflow-x: auto;">
                            
                <div style="float: left;padding-top: 7px;padding-right: 10px;">
                    <div class="netliva-switch">
                        <input type="checkbox" id="cbIsTicketReq" name="nmSbReq" netliva-switch="OK">
                        <label for="cbIsTicketReq" data-active-text="Consulted Doctor?" data-passive-text="Consulted Doctor?" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; display: none"></label>
                    </div>
                </div>
                <label for="html5-number-input" class="col-form-label label-custom">Ticket Required? </label>
            </div>

            <div class="Group-Of-Cb" style="overflow-x: auto;">
                            
                <div style="float: left;padding-top: 7px;padding-right: 10px;">
                    <div class="netliva-switch">
                        <input type="checkbox" id="cbIsPassReq" name="nmSbReq" netliva-switch="OK">
                        <label for="cbIsPassReq" data-active-text="Consulted Doctor?" data-passive-text="Consulted Doctor?" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; display: none"></label>
                    </div>
                </div>
                <label for="html5-number-input" class="col-form-label label-custom">Passport Required?</label>
            </div>
                <div class="div-Cons-Doc" style="overflow-x: auto;">
                            
                    <div style="float: left;padding-top: 7px;padding-right: 10px;">
                        <div class="netliva-switch">
                        <input type="checkbox" id="cbIsConsultWithDoc" name="nmSbReq" netliva-switch="OK">
                        <label for="cbIsConsultWithDoc" data-active-text="Consulted Doctor?" data-passive-text="Consulted Doctor?" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; display: none"></label>
                    </div>

                </div>
                    <label for="html5-number-input" class="col-form-label label-custom">Consulted Doctor? </label>
            </div>
            </div>
                        
        </div>

        `

        $('.Leave-Req').html(htm);



    }

    if (Type == 1) {

        htm += `

        <div class="row">
                      

            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Reason</label>
                <div>
                    <select id="ddlPPTReason" class="form-select color-dropdown  "></select>
                </div>
            </div>

                <div class="col-3 Other-Reason" style="display:none;">
                <label for="html5-number-input" class="col-form-label label-custom">Other Reason</label>
                <div>
                    <select id="ddlPPTOtherReason" class="form-select color-dropdown  "></select>
                </div>
            </div>


                <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Travelling Date</label>
                <div>
                    <input type="date" id="txtTravellingDate" name="nmReqDet" class="form-control flatpickr-input" placeholder="dd/mm/yyyy" />
                </div>
            </div>
                  

                    
            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Expected Date Of Return</label>
                <div>
                    <input type="date" id="txtEptDOReturn" class="form-control flatpickr-input"/>
                </div>
            </div>
            <div class="col-3 div-Attachment">
                <label for="html5-number-input" class="col-form-label label-custom">Attachment</label>

                <div class="input-group mb-3 insert-Attachment">

                    <input class="form-control" type="file" id="fu-leave-req" title="Leave Request" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getFileName()">
                    <label class="input-group-text ml-3" for="fu-leave-req" style="border: transparent;">

                        <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 49px; margin-top: -10px;" />
                    </label>

                    <input type="text" id="lblLeaveReqFileName" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                </div>


                    <div class="input-group mb-3 download-Attachment">

                        <img src="Images/Icon-download.png" id="btnDownloadAttachment" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 40px;" />

                </div>


            </div>

        </div>


        <div class="row">

        </div> `

        $('.Leave-Req').html(htm);

    }


    if (Type == 2) {

        htm += `

        
        <div class="row mb-2 detailsrow" style="margin-inline: auto;border: 1px solid #a19f9f6b;border-radius: 5px;">
            <div class="col-6 mt-2 mb-2 me-4 bankcard" id="" style="border-right: 1px solid #e7e7e7;">

                <h5 class="mb-4">
                    <img src="Images/all-request-icon/money.svg" class="me-2"  />
                    Salary Details
                </h5>
                <div class="row">

                    <div class="col-4 bankcard-col">
                        <label>Basic:
                            <span id="txtBDBasic">000</span>
                        </label>
                        <label>HRA:
                            <span id="txtBDHRA">000</span>
                        </label>
                        <label>Car:
                            <span id="txtBDCar">000</span>
                        </label>
                    </div>
                    <div class="col-4  bankcard-col">
                        <label>Petrol:
                            <span id="lbSLTransport">000</span>
                        </label>
                        <label>Mobile:
                            <span id="txtBDMobile">000</span>
                        </label>
                        <label>Food:
                            <span id="lbSLFood">000</span>
                        </label>
                    </div>
                    <div class="col-4  bankcard-col">
                        <label>Other:
                            <span id="txtBDOther">000</span>
                        </label>
                        <label>Total:
                            <span id="lbSLGrossSal">000</span>
                        </label>
                    </div>
                </div>

            </div>
            <div class="col-6 mb-2 mt-2 bankcard">
                <h5 style="margin-bottom: 0;">
                    <img src="Images/all-request-icon/loan.svg" class="me-2" />
                    Loan Details
                </h5>

                <div class="table" style="margin: 0 !important;">
                    <table class="table table-responsive">
                        <thead>
                            <tr>
                                <th>Loan Type</th>
                                <th>Paid</th>
                                <th>Recovered</th>
                                <th>Remaining</th>
                            </tr>
                        </thead>
                        <tbody class="loan-body">
                            <tr>
                                <td id="">HRA</td>
                                <td>000</td>
                                <td>000</td>
                                <td>000</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
                    
        <div class="row">     
            <div class="row">

                <div class="col-3">
                    <label for="html5-number-input" class="col-form-label label-custom">Request Date</label>
                    <div>
                        <input type="text" id="txtBDReqDate" name="nmBasicDet" class="form-control flatpickr-input" disabled />
                    </div>
                </div>


                    <div class="col-3">
                    <label for="html5-number-input" class="col-form-label label-custom">Request Type</label>
                    <div>
                        <select id="ddlBDReqType" class="form-select color-dropdown"></select>
                    </div>
                </div>

                <div class="col-3">
                    <label for="html5-number-input" class="col-form-label label-custom">Reason</label>
                    <div>
                        <select id="ddlBDReason" class="form-select color-dropdown "></select>
                    </div>
                </div>
               <div class="col-3">
                    <label for="html5-number-input" class="col-form-label label-custom">Requested Amount</label>
                    <div>
                        <input type="number" id="txtBDReqamount" name="nmSTL" class="form-control" value="0 AED" />
                    </div>
                </div>
            
            </div>

            <div class="row Salary-CF">
                <div class="col-3" style="display:none">
                    <label for="html5-number-input" class="col-form-label label-custom">Purpose</label>
                    <div>
                        <input type="text" id="txtBDPurpose" name="nmSCB" class="form-control" disabled />
                    </div>
                </div>
            </div>

            <div class="row Salary-TL" style="display:none;">
                <div class="col-3">
                    <label for="html5-number-input" class="col-form-label label-custom">Bank Name</label>
                    <div>
                        <input type="text" id="txtBDBankName" name="nmSTL" class="form-control  " disabled/>
                    </div>
                </div>

                <div class="col-3">
                    <label for="html5-number-input" class="col-form-label label-custom">IBAN No.</label>
                    <div>
                        <input type="text" id="txtBDIBANNo" name="nmSTL" class="form-control  " disabled  />
                    </div>
                </div>

                <div class="col-3">
                    <label for="html5-number-input" class="col-form-label label-custom">Bank Address</label>
                    <div>
                        <input type="text" id="txtBDBankAddress" name="nmSTL" class="form-control  "  />
                    </div>
                </div>
            </div>

            <div class="row">
                
                 <div class="col-3 Salary-CF">
                    <label for="html5-number-input" class="col-form-label label-custom">Bank</label>
                    <div>
                        <input type="text" id="txtBDBank" name="nmSCB" class="form-control"/>
                    </div>
                </div>
                <div class="col-3 div-Attachment">
                    <label for="html5-number-input" class="col-form-label label-custom">Attachment</label>

                    <div class="input-group mb-3 insert-Attachment">

                        <input class="form-control" type="file" id="fu-leave-req" title="Leave Request" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getFileName()">
                        <label class="input-group-text ml-3" for="fu-leave-req" style="border: transparent;">

                            <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 49px; margin-top: -10px;" />
                        </label>

                        <input type="text" id="lblLeaveReqFileName" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                    </div>


                    <div class="input-group mb-3 download-Attachment">

                        <img src="Images/Icon-download.png" id="btnDownloadAttachment" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 40px;" />
                        <span><i class="bx bxs-show fa-icon-hover btnDownloadAttachment" style="color: #eb9d96;font-size: 1.9rem;margin: -33px 0px 0px 109px;cursor: pointer;" ></i></span>
                    </div>
                </div>
            </div>
        </div>`

        $('.Leave-Req').html(htm);
        bankcarddisplay();
    }


    if (Type == 3) {

        htm += `

        <div class="row">
                       
            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Request Date</label>
                <div>
                    <input type="text" id="txtMiscReqDate" class="form-control flatpickr-input" disabled />
                </div>
            </div>

            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Request Type</label>
                <div>
                    <select id="ddlMiscReqType" class="form-select color-dropdown  "></select>
                </div>
            </div>
                       
            <div class="col-3 Misc_Address-ToWhom">
                <label for="html5-number-input" class="col-form-label label-custom">Address To whom</label>
                <div>
                    <input type="text" id="txtMiscAddToWhom" name="nmMiscControll" class="form-control  "/>
                </div>
            </div>
            <div class="col-3 MiscReason-Drop">
                <label for="html5-number-input" class="col-form-label label-custom">Reason</label>
                <div>
                    <select id="ddlMiscReason" class="form-select color-dropdown  "></select>
                </div>
            </div>
            <div class="col-3 OtherRemarks-Area" style="display:none;">
                <label for="html5-number-input" class="col-form-label label-custom">Other Remarks</label>
                <div>
                    <input type="text" id="txtMiscOtherRemarks" name="nmMiscControll" class="form-control  "/>
                </div>
            </div>
            <div class="col-3 Trans-Location">
                <label for="html5-number-input" class="col-form-label label-custom">Employee Type</label>
                <div>
                    <select id="ddlMiscEmpType" class="form-select color-dropdown  ">
                    </select>
                </div>
            </div>
        </div>

        <div class="row">

            <div class="col-3 Date-Period">
                <label for="html5-number-input" class="col-form-label label-custom">From Date</label>
                <div>
                    <input type="date" id="txtMiscFromDate" class="form-control flatpickr-input " />
                </div>
            </div>

            <div class="col-3 Date-Period">
                <label for="html5-number-input" class="col-form-label label-custom">To Date</label>
                <div>
                    <input type="date" id="txtMiscToDate" class="form-control  flatpickr-input"   />
                </div>
            </div>

            <div class="col-3 Date-Period">
                <label for="html5-number-input" class="col-form-label label-custom">Country To Apply Visa</label>
                <div>
                    <input type="text" id="txtCountryToApplyVisa" name="nmMiscControll" class="form-control  "  />
                </div>
            </div>

            <div class="col-3 Trans-Location">
                <label for="html5-number-input" class="col-form-label label-custom">Current Location</label>
                <div>
                    <input type="text" id="txtMiscCurrLocation" name="nmMiscControll" class="form-control  "  />
                </div>
            </div>

            <div class="col-3 Trans-Location">
                <label for="html5-number-input" class="col-form-label label-custom">Req Location</label>
                <div>
                    <input type="text" id="txtMiscReqLocation" name="nmMiscControll" class="form-control  "  />
                </div>
            </div>

            <div class="col-3 Trans-Type">
                <label for="html5-number-input" class="col-form-label label-custom">Tranport Type</label>
                <div>
                    <select id="ddlMiscTransType" class="form-select color-dropdown  ">
                    <option value="1">Permenent Change of Location</option>
                    <option value="2">Temporary Request</option>
                    </select>
                </div>
            </div>

            <div class="col-3 Date-Of-Change">
                <label for="html5-number-input" class="col-form-label label-custom">Date Of Change</label>
                <div>
                    <input type="date" id="txtMiscDateOfChange" name="nmMiscControll" class="form-control flatpickr-input"  />
                </div>
            </div>

            <div class="col-3 Diff-Date">
                <label for="html5-number-input" class="col-form-label label-custom">From Date</label>
                <div>
                    <input type="date" id="txtMiscFromDateTrans" class="form-control flatpickr-input"  />
                </div>
            </div>

            <div class="col-3 Diff-Date">
                <label for="html5-number-input" class="col-form-label label-custom">To Date</label>
                <div>
                    <input type="date" id="txtMiscToDateTrans" class="form-control flatpickr-input"  />
                </div>
            </div>

            <div class="row">
                <div class="col-4 MiscReason-Area">
                    <label for="html5-number-input" class="col-form-label label-custom">Reason</label>
                    <div>
                        <textarea id="txtMiscReason" name="nmMiscControll" class="form-control" rows="4" placeholder="Enter reason..."></textarea>
                    </div>
                </div>

                <div class="col-3 div-Attachment">
                    <label for="html5-number-input" class="col-form-label label-custom">Attachment</label>
                    <div style="align-content: center;height: 106px;border: 1px solid #d9dee3;">
                        <div class="input-group mb-3 insert-Attachment">
                            <input class="form-control" type="file" id="fu-leave-req" title="Leave Request" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getFileName()">
                            <label class="input-group-text ml-3" for="fu-leave-req" style="border: transparent;">

                                <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 49px; margin-top: -10px;" />
                            </label>

                            <input type="text" id="lblLeaveReqFileName" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                        </div>

                        <div class="input-group mb-3 download-Attachment">
                            <img src="Images/Icon-download.png" id="btnDownloadAttachment" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 40px;" />
                        </div>

                    </div>
                </div>
            </div>

        </div> `

        $('.Leave-Req').html(htm);

    }


    if (Type == 4) {

        htm += `

        <div class="row mb-2 detailsrow" style="margin-inline: auto;border: 1px solid #a19f9f6b;border-radius: 5px;">
            <div class="col-6 mt-2 mb-2 me-4 bankcard" id="" style="border-right: 1px solid #e7e7e7;">

                <h5 class="mb-4">
                    <img src="Images/all-request-icon/money.svg" class="me-2"  />
                    Salary Details
                </h5>
                <div class="row">

                   <div class="col-4 bankcard-col">
                        <label>Basic:
                            <span id="txtBDBasic">000</span>
                        </label>
                        <label>HRA:
                            <span id="txtBDHRA">000</span>
                        </label>
                        <label>Car:
                            <span id="txtBDCar">000</span>
                        </label>
                    </div>
                    <div class="col-4  bankcard-col">
                        <label>Petrol:
                            <span id="lbSLTransport">000</span>
                        </label>
                        <label>Mobile:
                            <span id="txtBDMobile">000</span>
                        </label>
                        <label>Food:
                            <span id="lbSLFood">000</span>
                        </label>
                    </div>
                    <div class="col-4  bankcard-col">
                        <label>Other:
                            <span id="txtBDOther">000</span>
                        </label>
                        <label>Total:
                            <span id="lbSLGrossSal">000</span>
                        </label>
                    </div>
                </div>

            </div>
            <div class="col-6 mb-2 mt-2 bankcard">
                <h5 style="margin-bottom: 0;">
                    <img src="Images/all-request-icon/loan.svg" class="me-2" />
                    Loan Details
                </h5>

                <div class="table" style="margin: 0 !important;">
                   <table class="table table-responsive">
                        <thead>
                            <tr>
                                <th>Loan Type</th>
                                <th>Paid</th>
                                <th>Recovered</th>
                                <th>Remaining</th>
                            </tr>
                        </thead>
                        <tbody class="loan-body">
                            <tr>
                                <td id="">HRA</td>
                                <td>000</td>
                                <td>000</td>
                                <td>000</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Request Date</label>
                <div>
                    <input type="text" id="txtCLoanReqDate" class="form-control flatpickr-input" disabled />
                </div>
            </div>


            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Loan Type</label>
                <div>
                    <select id="ddlBLLoanType" class="form-select color-dropdown  ">
                    <option value="HRA">HRA</option>
                        <option value="Salary Advance">Salary Advance</option>
                    </select>
                </div>
            </div>

            <div class="col-3" >
                <label for="html5-number-input" class="col-form-label label-custom">Deduction Start Month</label>
                <div>
                    <input type="month" id="txtCLoanDedStartMonth" name="nmCLControll" class="form-control" readonly="readonly" />
                </div>
            </div>
            <div class="col-3 divnumberofMonth">
                <label for="html5-number-input" class="col-form-label label-custom">No. Months</label>
                <div>
                    <input type="number" id="txtNumberofMonth" name="nmCLControll" class="form-control" min="0" max="6"  value="1"/>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Amount</label>
                <div>
                    <input type="text" id="txtCLoanAmount" name="nmCLControll" class="form-control" disabled />
                </div>
            </div>

            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Monthly Deduction</label>
                <div>
                    <input type="text" id="txtCLoanMonthlyDed" name="nmCLControll" class="form-control" readonly="readonly"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-4">
                <label for="html5-number-input" class="col-form-label label-custom">Reason</label>
                <div>
                    <textarea type="text" id="txtCLoanReason" name="nmCLControll" class="form-control" rows="4" placeholder="Enter reason..."></textarea>
                </div>
            </div>
            <div class="col-3 div-Attachment">
                <label for="html5-number-input" class="col-form-label label-custom">Attachment</label>
                <div style="align-content: center;height: 106px;border: 1px solid #d9dee3;">
                    <div class="input-group mb-3 insert-Attachment">
                        <input class="form-control" type="file" id="fu-leave-req" title="Leave Request" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getFileName()">
                        <label class="input-group-text ml-3" for="fu-leave-req" style="border: transparent;">
                                  
                            <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 49px; margin-top: -10px;" />
                        </label>
                             
                        <input type="text" id="lblLeaveReqFileName" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                    </div>
                    <div class="input-group mb-3 download-Attachment">
                        <img src="Images/Icon-download.png" id="btnDownloadAttachment" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 40px;" />
                    </div>
                </div>
            </div>
        </div>
                `

        $('.Leave-Req').html(htm);
        bankcarddisplay();
    }


    if (Type == 5) {

        htm += `
        <div class="row">
            <div class="col-12"><div class="pull-right" id="lblIsPaid"></div></div>

            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Date</label>
                <div>
                    <input type="date" id="txtLAReqDate" class="form-control flatpickr-input"/>
                </div>
            </div>


            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Time Arrived</label>
                <div>
                    <input type="time" id="txtLAreqTime" class="form-control  flatpickr-input"/>
                </div>
            </div>

            <div class="row">
                <div class="col-4">
                    <label for="html5-number-input" class="col-form-label label-custom">Reason For Delay</label>
                    <div>
                        <textarea type="text" id="txtLAReqReason" class="form-control" rows="4" placeholder="Enter reason.."></textarea>
                    </div>
                </div>

                <div class="col-3 div-Attachment">
                    <label for="html5-number-input" class="col-form-label label-custom">Attachment</label>

                    <div style="align-content: center;height: 106px;border: 1px solid #d9dee3;">
                        <div class="input-group mb-3 insert-Attachment">

                            <input class="form-control" type="file" id="fu-leave-req" title="Leave Request" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getFileName()">
                            <label class="input-group-text ml-3" for="fu-leave-req" style="border: transparent;">

                                <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 49px; margin-top: -10px;" />
                            </label>

                            <input type="text" id="lblLeaveReqFileName" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                        </div>
                        <div class="input-group mb-3 download-Attachment">
                            <img src="Images/Icon-download.png" id="btnDownloadAttachment" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 40px;" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
                       
        </div> `

        $('.Leave-Req').html(htm);

    }


    if (Type == 6) {

        htm += `
        <div class="row">
            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Date</label>
                <div>
                    <input type="date" id="txtEXTPassDate" class="form-control flatpickr-input" />
                </div>
            </div>

            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Exit Type</label>
                <div>
                    <select id="ddlEXTPassType" class="form-select color-dropdown  ">
                    <option value="0">Personal</option>
                    <option value="1">Official</option>
                    </select>
                </div>
            </div>

            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Out Time</label>
                <div>
                    <input type="time" id="txtEXTPassOutTime" class="form-control flatpickr-input"/>
                </div>
            </div>

            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Back Time</label>
                <div>
                    <input type="time" id="txtEXTPassBackTime" class="form-control flatpickr-input"/>
                </div>
            </div>

            

                 
            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Exit Reason</label>
                <div>
                    <textarea type="text" id="txtEXTPassReason" class="form-control" rows="4" placeholder="Enter reason..."></textarea>
                </div>
            </div>

            <div class="col-3 div-Attachment">
                <label for="html5-number-input" class="col-form-label label-custom">Attachment</label>
                <div style="align-content: center;height: 106px;border: 1px solid #d9dee3;">
                    <div class="input-group mb-3 insert-Attachment">

                        <input class="form-control" type="file" id="fu-leave-req" title="Leave Request" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getFileName()">
                        <label class="input-group-text ml-3" for="fu-leave-req" style="border: transparent;">

                            <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 49px; margin-top: -10px;" />
                        </label>

                        <input type="text" id="lblLeaveReqFileName" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                    </div>


                    <div class="input-group mb-3 download-Attachment">
                        <img src="Images/Icon-download.png" id="btnDownloadAttachment" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 40px;" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
                       
        </div> `

        $('.Leave-Req').html(htm);

    }
    if (Type == 7) {

        htm += `

        <div class="row">
                       
            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">Last Encashed Date</label>
                <div>
                    <input type="text" id="dtLastEncashDate" class="form-control flatpickr-input" disabled/>
                </div>
            </div>
            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">No. Of Ticket(s)</label>
                <div>
                    <input type="number" id="txtNoOfTik" class="form-control" value="0"  min="0" max="30" />
                </div>
            </div>
            
            <div class="row">
                <div class="col-4">
                    <label for="html5-number-input" class="col-form-label label-custom">Reason</label>
                    <div>
                        <textarea type="text" id="txtTikEncashReason" class="form-control" rows="4" placeholder="Enter reason..."></textarea>
                    </div>
                </div>
                <div class="col-3 div-Attachment">
                    <label for="html5-number-input" class="col-form-label label-custom">Upload E-Ticket</label>

                    <div style="align-content: center;height: 106px;border: 1px solid #d9dee3;">
                        <div class="input-group mb-3 insert-Attachment">

                            <input class="form-control" type="file" id="fu-leave-req" title="Leave Request" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getFileName()">
                            <label class="input-group-text ml-3" for="fu-leave-req" style="border: transparent;">

                                <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 49px; margin-top: -10px;" />
                            </label>

                            <input type="text" id="lblLeaveReqFileName" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                        </div>
                        <div class="input-group mb-3 download-Attachment">
                            <img src="Images/Icon-download.png" id="btnDownloadAttachment" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 40px;" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-3"><h6 style="color: #b70000 !important;"> Note : Please note that you will get 75% of your ticket encashment if ticket copy is not attached.</h6> </div>
        <div class="row">
                       
        </div>  `

        $('.Leave-Req').html(htm);

    }

    initiateAllCB();




}

function getFileName() {
    $('.lbl-fufile-count').html($('#fu-leave-req')[0].files.length + " File(s)");

    $('#lblLeaveReqFileName').val($('#fu-leave-req')[0].files[0].name);
}

function getOnBehalfFileName() {
    $('.lbl-fufile-count').html($('#fu-on-behalf')[0].files.length + " File(s)");

    $('#lblOnBehalfFU').val($('#fu-on-behalf')[0].files[0].name);
}
//$(".Leave-Req").on("change", '#fu-leave-req', function () {

//    $('.lbl-fufile-count').html($(this)[0].files.length + " File(s)");
//    var htm = '';
//    for (var i = 0; i < $(this)[0].files.length; i++) {
//        htm += $(this)[0].files[i].name + "| ";
//    }
//    $('#lblFilesName').val(removeCommaFromLast(htm));
//});

function initiateAllCB() {

    $("#cbEmpOnBehalf").netlivaSwitch({
        'size': 'mini',
        'active-text': 'Yes',
        'passive-text': 'No',
        'active-color': '#98ca3c',
        'passive-color': '#66666696',
        'width': '64px'
    });

    $("#cbIsAdvSalaryReq").netlivaSwitch({
        'size': 'mini',
        'active-text': 'Yes',
        'passive-text': 'No',
        'active-color': '#98ca3c',
        'passive-color': '#66666696',
        'width': '64px'
    });

    $("#cbIsTicketReq").netlivaSwitch({
        'size': 'mini',
        'active-text': 'Yes',
        'passive-text': 'No',
        'active-color': '#98ca3c',
        'passive-color': '#66666696',
        'width': '64px'
    });

    $("#cbIsPassReq").netlivaSwitch({
        'size': 'mini',
        'active-text': 'Yes',
        'passive-text': 'No',
        'active-color': '#98ca3c',
        'passive-color': '#66666696',
        'width': '64px'
    });
    $("#cbIsConsultWithDoc").netlivaSwitch({
        'size': 'mini',
        'active-text': 'Yes',
        'passive-text': 'No',
        'active-color': '#98ca3c',
        'passive-color': '#66666696',
        'width': '64px'
    });


}


$('#AddNewReq').on('click', function () {

    $('#proj-details-rectangle-div').css("height", "110px");
    // $('#proj-details-rectangle-div').hide('400');
    $('.empMoreInfor').css("display", "none");
    $('.divimage').css("width", "9%");
    $('#empimgvatar').addClass('w-px-85');
    $('#empimgvatar').removeClass('w-px-120');
    $('.empMainInfo').css("padding-top", "10px");
    $('#empheading').html("");
    $('.proj-det-drilldown').removeClass('bx bxs-chevron-up');
    $('.proj-det-drilldown').addClass('bx bxs-chevron-down');

    $('.on-beh').text('On Behalf');
    $('.employee-drop').css('display', '');
    $('.employee-text').css('display', 'none');

    $("#lblStatus").html("NEW");
    resetEmployeeNumber();

    htmActionButton = "";


    htmActionButton += `<div class="pull-right">
            <button id="btnSubmit" type="button" class="btn btn-primary btnTagTemp" style=""><i class='bx bxs-check-circle me-3'></i>Submit</button>
            <button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-save me-3'></i>Save as Draft</button>
            
        </div>`

    $(".ActionButtons").html(htmActionButton);
    $(".dvApprovalStage").css("display", "none");
    ApplicationId = 0;

    $("#lblAppID").html(ApplicationId);
    if (Type == 0) {
        $('#ddlRequestType').attr('disabled', false);
        $('#ddlRequestType').val('0');

        RequestPageLoad();
        ClearDetails();
        GetBasicEmpDet();
        GetRefNo();
        loadLeaveType();
        InitialForm();
        onbehalfrolecheck();
    }
    else if (Type == 1) {

        $('#ddlRequestType').attr('disabled', false);
        $('#ddlRequestType').val('1');

        RequestPageLoad();
        ClearPPTDetails();
        GetBasicEmpDet();
        GetPPTRefNo();
        loadPPTReason();
        PPTInitialForm();
        onbehalfrolecheck();
    }

    else if (Type == 2) {
        $('#ddlRequestType').attr('disabled', false);
        $('#ddlRequestType').val('2');

        RequestPageLoad();
        ClearBankDetails();
        GetBasicEmpDet();
        GetBDBasicSalaryDet();
        GetBDRefNo();
        InitialBankDet();
        loadApproverAuthorityPeople();
        onbehalfrolecheck();

    }

    else if (Type == 3) {

        $('#ddlRequestType').attr('disabled', false);
        $('#ddlRequestType').val('3');

        RequestPageLoad();
        ClearMiscReqDetails();
        GetBasicEmpDet();
        GetMiscRefNo();
        loadMiscRequestType();
        miscReqTypeFormate();
        MiscInitialForm();
        loadApproverAuthorityPeople();
        onbehalfrolecheck();

    }

    else if (Type == 4) {

        $('#ddlRequestType').attr('disabled', false);
        $('#ddlRequestType').val('4');

        RequestPageLoad();
        ClearCLReqDetails();
        GetBasicEmpDet();
        GetBDBasicSalaryDet();
        GetCLoanRefNo();
        CompanyLoanInitialForm();
        loadApproverAuthorityPeople();
        CompanyLoanTypeFormat();
 
        onbehalfrolecheck();

    }



    else if (Type == 5) {

        $('#ddlRequestType').attr('disabled', false);
        $('#ddlRequestType').val('5');

        RequestPageLoad();
        ClearLAReq();
        GetBasicEmpDet();
        GetLAReqRefNo();
        LateAttendanceInitialForm();
        loadApproverAuthorityPeople();
        onbehalfrolecheck();

    }

    else if (Type == 6) {

        $('#ddlRequestType').attr('disabled', false);
        $('#ddlRequestType').val('6');

        RequestPageLoad();
        ClearEPReq();
        GetBasicEmpDet();
        GetEPReqRefNo();
        ExitPassInitialForm();
        loadApproverAuthorityPeople();
        onbehalfrolecheck();

    }

    else if (Type == 7) {

        $('#ddlRequestType').attr('disabled', false);
        $('#ddlRequestType').val('7');

        RequestPageLoad();
        ClearTEReq();
        GetBasicEmpDet();
        GetTikEncashRefNo();
        TicketencInitialForm();
        //ExitPassInitialForm();  //disabled
        loadApproverAuthorityPeople();
        onbehalfrolecheck();
    }

    else if (Type == -1) {


        $('#ddlRequestType').val('0');
        Type = 0;
        RequestPageLoad();
        ClearDetails();
        GetBasicEmpDet();
        GetRefNo();
        loadLeaveType();
        loadApproverAuthorityPeople();
        InitialForm();
        onbehalfrolecheck();

    }
    loadAllEmployees('-1');
    $('.insert-Attachment').css('display', '');
    $('.download-Attachment').css('display', 'none');
    $('#empLeaveModal').modal('show');
});

function ClearTEReq() {
    //LastTicketEncashDate = "";
    $('#lblEmpName').val("");
    $('#lblEmpNo').html("");
    $('#lblDesignation').val("");
    $('#lblDepart').val("");
    $('#lblVisaExpDate').html("");
    $('#lblPassExpDate').html("");
    $('#lblDateOfJoin').html("");
    $('#lblEID').html("");
    $('#lblEIDExpDate').html("");

    $('#fu-on-behalf').val('');
    $('#lblOnBehalfFU').val('');
    $('#fu-leave-req').val('');
    $('#lblLeaveReqFileName').val('');

    $('#lblRequestNumber').html('');
    $('#txtEXTPassReason').val('');
}

function CompanyLoanInitialForm() {

    $('#cbEmpOnBehalf').attr('disabled', false);
    $('#txtEmpName').attr('disabled', false);
    $('#empLeaveModal').find('input[name="nmCLControll"]').attr('disabled', false); 
    $('#txtCLoanReason').attr('disabled', false);
    $('#ddlBLLoanType').attr('disabled', false);
    $('.insert-Attachment').css('display', '');
    $('.download-Attachment').css('display', 'none');


}
$('#empLeaveModal').on('change', '#txtEmpName', function () {

    EmpNo = $("#txtEmpName").val();
    GetBasicEmpDet();

    if (Type == 4){
	
        GetBDBasicSalaryDet();
        
        CompanyLoanTypeFormat();

    }
});
function GetBasicEmpDet() {

    $.ajax({
        url: "AllRequests.aspx/GetBasicDetails",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(datedayformat(result.d[0].VisaExpiryDate));
            $('#lblPassExpDate').html(datedayformat(result.d[0].PassportExpireDate));
            $('#lblDateOfJoin').html(datedayformat(result.d[0].JoiningDate));
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(datedayformat(result.d[0].EmiratesExpDate));
            $('#lblWeeklyOff').html(result.d[0].WEEKLYOFF);
            $('#assstatus').html(result.d[0].AssStatus);
            $('#vauth').html(result.d[0].VisaAuth);
            //$('#lblLastVacationFromDate').html(datedayformat(result.d[0].LastTicketEncashDate));
$('#lblLastVacationFromDate').html("--");
            LeaveBalance = result.d[0].LeaveBalance;
            $('#txtLeaveBal').val(LeaveBalance);
            LastTicketEncashDate = result.d[0].LastTicketEncashDate;
            NumberoFTicketAvailable = result.d[0].NoTicketEncash;
            $('#dtLastEncashDate').val(LastTicketEncashDate);
            $('#txtNoOfTik').attr("max", NumberoFTicketAvailable);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetRefNo() {

    $.ajax({
        url: "AllRequests.aspx/GetRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {

            $('#lblRequestNumber').html(result.d);


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadLeaveType() {

    $.ajax({
        url: "AllRequests.aspx/GetAllLeaveType",
        //data: JSON.stringify({ 'data': objAddSurvey }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var opt = '';
            listLeaveType = result.d;
            $.each(listLeaveType, function (key, item) {
                opt += '<option value="' + item.Id + '" >' + item.Value + '</option>';
            });
            $('#ddlLeaveType').html(opt);
            selLeaveType = $('#ddlLeaveType option:selected').val();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}




function SetForm() {

    if ($('#ddlLeaveType option:selected').val() == "203") {
        $('.div-EndDate').css('display', '');
        $('.Group-Of-Doc').css('display', '');
        $('.div-Retwork').css('display', '');
        $('.div-Cons-Doc').css('display', '');

        $('.Grop-Of-Det').css('display', 'none');

        $('.Group-Of-Cb').css('display', 'none');
        $('.div-Attachment').css('display', 'none');
    }

    else if ($('#ddlLeaveType option:selected').val() == "143") {
        $('.div-EndDate').css('display', '');
        $('.Group-Of-Doc').css('display', '');
        $('.div-Retwork').css('display', '');
        $('.div-Cons-Doc').css('display', 'none');

        $('.Grop-Of-Det').css('display', '');

        $('.Group-Of-Cb').css('display', '');
        $('.div-Attachment').css('display', '');
    }

    else if ($('#ddlLeaveType option:selected').val() == "225") {
        $('.div-EndDate').css('display', '');
        $('.Group-Of-Doc').css('display', 'none');
        $('.div-Retwork').css('display', 'none');
        $('.div-Cons-Doc').css('display', 'none');
        $('.Grop-Of-Det').css('display', 'none');

        $('.Group-Of-Cb').css('display', '');
        $('.div-Attachment').css('display', '');
    }

    else if ($('#ddlLeaveType option:selected').val() == "3226") {
        $('.div-EndDate').css('display', '');
        $('.Group-Of-Doc').css('display', 'none');
        $('.div-Retwork').css('display', 'none');
        $('.div-Cons-Doc').css('display', 'none');

        $('.Grop-Of-Det').css('display', 'none');

        $('.Group-Of-Cb').css('display', 'none');
        $('.div-Attachment').css('display', '');
    }

    else if ($('#ddlLeaveType option:selected').val() == "21228") {
        $('.div-EndDate').css('display', '');
        $('.Group-Of-Doc').css('display', '');
        $('.div-Retwork').css('display', '');
        $('.div-Cons-Doc').css('display', "");

        $('.Grop-Of-Det').css('display', 'none');

        $('.Group-Of-Cb').css('display', 'none');
        $('.div-Attachment').css('display', '');
    }

    else if ($('#ddlLeaveType option:selected').val() == "24228") {
        $('.div-EndDate').css('display', 'none');
        $('.Group-Of-Doc').css('display', 'none');
        $('.div-Retwork').css('display', 'none');
        $('.div-Cons-Doc').css('display', 'none');

        $('.Grop-Of-Det').css('display', 'none');

        $('.Group-Of-Cb').css('display', 'none');
        $('.div-Attachment').css('display', '');
    }

    else if ($('#ddlLeaveType option:selected').val() == "26228") {
        $('.div-EndDate').css('display', '');
        $('.Group-Of-Doc').css('display', '');
        $('.div-Retwork').css('display', '');
        $('.div-Cons-Doc').css('display', 'none');

        $('.Grop-Of-Det').css('display', 'none');

        $('.Group-Of-Cb').css('display', 'none');
        $('.div-Attachment').css('display', '');
    }
}

$('#empLeaveModal').on('change', '#txtStartDate', function () {

    if ($('#txtLeaveReqDay').val() != '') {

        $('#txtEndDate').val('');
        let endDate = AddDays((AddDays($('#txtStartDate').val(), $('#txtLeaveReqDay').val())),-1);
        $('#txtEndDate').val(endDate)
        let Return = AddDays($('#txtEndDate').val(), "1");
        $('#txtReturnToWork').val(Return)
    }

});

$('#empLeaveModal').on('change', '#txtLeaveReqDay', function () {

    $('#txtEndDate').val('');
    let endDate = AddDays((AddDays($('#txtStartDate').val(), $('#txtLeaveReqDay').val())), -1);
    $('#txtEndDate').val(endDate);
    let Return = AddDays($('#txtEndDate').val(), "1");
    $('#txtReturnToWork').val(Return);

});

function formatDate(date, format) {
    const map = {
        mm: String(date.getMonth() + 1).padStart(2, '0'),
        dd: String(date.getDate()).padStart(2, '0'),
        //yy: date.getFullYear().toString().slice(-2),
        yyyy: date.getFullYear()

    }


    return format.replace(/mm|dd|yyyy/gi, matched => map[matched])
}
function AddDays(dt, nod) {
    let finalDate = new Date(new Date(dt).setDate(new Date(dt).getDate() + (nod == "" ? 0 : parseInt(nod))));
    return finalDate.getFullYear() + '-' + String(finalDate.getMonth() + 1).padStart(2, '0') + '-' + String(finalDate.getDate()).padStart(2, '0');

}

function ClearDetails() {
    reqStatus = 'DRAFT';
    $('#lblEmpName').val("");
    $('#lblEmpNo').html("");
    $('#lblDesignation').val("");
    $('#lblDepart').val("");
    $('#lblVisaExpDate').html("");
    $('#lblPassExpDate').html("");
    $('#lblDateOfJoin').html("");
    $('#lblEID').html("");
    $('#lblEIDExpDate').html("");

    $('#fu-on-behalf').val('');
    $('#lblOnBehalfFU').val('');
    $('#fu-leave-req').val('');
    $('#lblLeaveReqFileName').val('');

    $('#lblRequestNumber').html("");
   
    $('#cbEmpOnBehalf').prop('checked', false);
    if ($('#cbEmpOnBehalf').is(':checked')) { $('.onbehalf-controls-div').removeClass('hidden'); $('.onbehalf-controls-div1').removeClass('hidden') }
    else { $('.onbehalf-controls-div').addClass('hidden'); $('.onbehalf-controls-div1').addClass('hidden') }
    $('#txtEmpName').val('');

    $('#txtLeaveBal').val('');
    $('#empLeaveModal').find('input[name="nmReqDet"]').val('');
    $('#txtReturnToWork').val('');
    $('#cbIsConsultWithDoc').prop('checked', false);

    $('#empLeaveModal').find('input[name="nmContactDet"]').val('');
    $('#taRemark').val('');
    $('#empLeaveModal').find('input[name="nmSbReq"]').prop('checked', false);

    loadLeaveType();
    SetForm();


}

function loadApproverAuthorityPeople() {

    $.ajax({
        url: "AllRequests.aspx/GetApproverAuthorityPeople",
        data: JSON.stringify({ 'ApplicationId': ApplicationId, "ReqType": $('#ddlRequestType option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '';
            listApprAuthPeople = result.d;
            //$('.tbody-appr-auth td').length > 0 ? objDTApprAuthPeople.destroy() : '';

            $.each(listApprAuthPeople, function (key, item) {
                let StatusClass = '';
                if (item.Status == "PENDING")
                    StatusClass = 'badge bg-label-danger me-1';
                else if (item.Status == "APPROVED")
                    StatusClass = 'badge bg-label-success me-1';
                else if (item.Status == "REJECTED")
                    StatusClass = 'badge bg-label-danger me-1';
                else if (item.Status == "PASSED")
                    StatusClass = 'badge bg-label-info me-1';

                htm += `<tr> 
                    <td> `+ item.STAGE + ` </td>
                    <td> `+ item.APPROVER + ` </td>
                    <td style="text-align:center;"> `+ item.ApprovedDate + ` </td>
                    <td> `+ item.COMMENTS + ` </td>
                     <td style="text-align:center" ><a class="`+ StatusClass + `">` + item.Status + `</a></td>             
                    </tr>`
            });
            $('.tbody-appr-auth').html(htm);
            //initiateApproAuthPeopleDataTable();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function InitialForm() {
    $('#cbEmpOnBehalf').attr('disabled', false);
    $('#txtEmpName').attr('disabled', false);
    $('#ddlLeaveType').attr('disabled', false);


    $('#empLeaveModal').find('input[name="nmReqDet"]').attr('disabled', false);


    $('#txtReturnToWork').attr('disabled', false);
    $('#cbIsConsultWithDoc').attr('disabled', false);

    $('#empLeaveModal').find('input[name="nmContactDet"]').attr('disabled', false);
    $('#taRemark').attr('disabled', false);

    $('#empLeaveModal').find('input[name="nmSbReq"]').attr('disabled', false);


    $("#txtLeaveBal").val(LeaveBalance);
}

function loadAllEmployees(Emp) {
    $.ajax({
        url: "AllRequests.aspx/GetAllEmployees",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Employee --- </option> ';
            empList = result.d;

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.EmpNo + '">  ' + item.EmpNo + ` | ` + item.EmpName + '</option>';
            });

            $('#txtEmpName').html(htm);
            $('#txtEmpName').val(Emp)

            $("#txtEmpName").select2({
                dropdownParent: $("#empLeaveModal"),
                width: '100%',
                height: '100%'
            });
            OwnerNo = $('#txtEmpName option:selected').val();
            OwnerName = $('#txtEmpName option:selected').text();


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#empLeaveModal').on('change', '#cbEmpOnBehalf', function () {

    OnBehalfChange();

    if (Type == 2 || Type == 4) {

        BasicSalDetView();
    }
});

$('#empLeaveModal').on('change', '#cbIsConsultWithDoc', function () {
    if (Type == 0 && $("#ddlLeaveType").val() == '203') {
        showconsult();
    }
});
function showconsult(){
    if ($('#cbIsConsultWithDoc').is(':checked')) { $('.div-Attachment').css('display','block'); }
    else { $('.div-Attachment').css('display', 'none'); }
}
function BasicSalDetView() {

    if ($('#cbEmpOnBehalf').is(':checked')) {
        if ($('#txtEmpName').val() == EmpNo) {
            $('.Bank-Det').css('display', '');
        }
        else {
            $('.Bank-Det').css('display', 'none');
        }
    }
    else {
        $('.Bank-Det').css('display', '');
    }
}

$('#empLeaveModal').on('change', '#txtEmpName', function () {

    if (Type == 2) {

        BasicSalDetView();
    }

});

function OnBehalfChange() {

    if ($('#cbEmpOnBehalf').is(':checked')) { $('.onbehalf-controls-div').removeClass('hidden'); $('.onbehalf-controls-div1').removeClass('hidden') }
    else { $('.onbehalf-controls-div').addClass('hidden'); $('.onbehalf-controls-div1').addClass('hidden') }
}


$('.ActionButtons').on('click', '#btnSaveApplication', function () {
    reqStatus = "DRAFT";

    if (Type == 0) {

        AddReqDetails();
    }

    else if (Type == 1) {
        if ($("txtTravellingDate").val() == "" || $("txtEptDOReturn").val() == "") {
            toastr.error("Please fill all the fields")
        }
        else {
            AddPPTReqDetails();
        }
    }

    else if (Type == 2) {

        AddBankDetReqDetails();
    }

    else if (Type == 3) {

        AddMiscDetReqDetails();

    }

    else if (Type == 4) {

        AddCompanyLoanReqDetails();
    }

    else if (Type == 5) {

        AddLateAttendanceReqDetails();
    }

    else if (Type == 6) {

        AddExitPassReqDetails();
    }
    else if (Type == 7) {

        AddTEReqDetails();
    }
});
$('.ActionButtons').on('click', '#btnCancellRequest', function () {
    $('#mpCancelRequest').modal('show');
});

$('.btn-Cancel-Request').on('click', function () {

    $.ajax({
        url: "AllRequests.aspx/RequestCancel",
        data: JSON.stringify({
            "ReqID": ApplicationId,
            "ReqType": $('#ddlRequestType option:selected').val(),
            "UserID": currUserId,
        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result.d) {
                toastr.success('Request Cancelled Successfully', '');
                $('.ajax-loader').removeClass('hidden');

                setTimeout(function () {
                    LoadRequestData('Please Wait...');
                    $(".ajax-loader").addClass('hidden');
                }, 500);
                GetBasicEmpDet();
                ApplicationId = 0;

                $("#empLeaveModal").modal("hide");
                $("#mpCancelRequest").modal("hide");
            }
            else {
                toastr.success('ooooppsss Something Went Wrong Please Refresh the page and try again ,if the error is repeating please contact IT', '');

            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
});




$('.ActionButtons').on('click', '#btnSubmit', function () {
    reqStatus = "SUBMIT";
    if (Type == 0) {

        AddReqDetails();
    }

    else if (Type == 1) {

        AddPPTReqDetails();
    }

    else if (Type == 2) {

        AddBankDetReqDetails();
    }

    else if (Type == 3) {

        AddMiscDetReqDetails();

    }

    else if (Type == 4) {

        AddCompanyLoanReqDetails();
    }

    else if (Type == 5) {

        AddLateAttendanceReqDetails();
    }

    else if (Type == 6) {

        AddExitPassReqDetails();
    }
    else if (Type == 7) {

        AddTEReqDetails();
    }
});


function AddReqDetails() {

    if ($('#cbEmpOnBehalf').is(':checked') == false) {

        $('#txtEmpName').val('');
        $('#fu-on-behalf').val('');
    }
    EmpNumb = $("#lblEmpNo").html();
    
    $.ajax({
        url: "AllRequests.aspx/setRequestDetails",
        data: JSON.stringify({
            "LeaveApplicationID": ApplicationId, "RefNo": $('#lblRequestNumber').text(), "User": currUserId, "EmpNo": EmpNumb, "OnBehalf": $('#cbEmpOnBehalf').is(':checked'), "LeaveBal": $('#txtLeaveBal').val(), "LeaveType": $('#ddlLeaveType option:selected').text(),
            "StartDate": $('#txtStartDate').val().split(',')[0], "EndDate": $('#txtEndDate').val().split(',')[0], "LeaveReqDay": $('#txtLeaveReqDay').val(), "LeavetypeId": $('#ddlLeaveType').val(),
            "ReturnToWork": $('#txtReturnToWork').val().split(',')[0], "Consulted": $('#cbIsConsultWithDoc').is(':checked'),
            "PrimaryContact": $('#txtPrimaryContact').val(), "SecondaryContact": $('#txtSecContact').val(), "ContactName": $('#txtContactName').val(), "ContactEmail": $('#txtContactEmail').val(), "EMPRemarks": $('#taRemark').val(),
            "AdvanceSalRequired": $('#cbIsAdvSalaryReq').is(':checked'), "TicketRequired": $('#cbIsTicketReq').is(':checked'), "PassportRequired": $('#cbIsPassReq').is(':checked'), "Status": reqStatus,
        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d[0].Id != 0) {
                toastr.success('Updated Successfully', '');
                ApplicationId = result.d[0].Id;
                UploadTheFiles();
                //loadEmpDetails();
                GetAllDetails();
                LoadRequestData();
            }
            else {
                toastr.error(result.d[0].Messsage, '');
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function UploadTheFiles() {
    if ($('#cbEmpOnBehalf').is(':checked') == true) {
        onBehalfFileUpload();
    }

    LeaveFileUpload();


}


function onBehalfFileUpload() {

    //var seloption = $('input[name="inlineRadioOptions"]:checked').val().trim();


    //let paraProjName = $('#txtsuggprojectname').val();
    //let paraSuggType = $('input[name=inlineRadioOptions]:checked').val()
    //let paraModName = $('#ddlsuggmoduleName').val();



    var formData = new FormData();
    var formData = new FormData();
    var fileUpload = $('#fu-on-behalf').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    /*var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/SSHRFileUploadHandler.ashx?EventId=' + EventId + '&UserId=' + currUserId + '&Type=' + Type + '&Name=' + $('#txtName').val().trim() + '&Location=' + $('#txtLocation').val().trim() + '&Address=' + $('#txtAddress').val().trim() + '&Remarks=' + $('#txtRemarks').val().trim();    //for Live*/
    var qrystringLocal = 'Services/SSHRFileUploadHandler.ashx?fufor=onbehalfattach&ApplicationId=' + ApplicationId + '&Type=' + Type;     // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        async: false,
        success: function (status) {
            if (status != 'error') {

            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });

}


function LeaveFileUpload() {




    var formData = new FormData();
    var formData = new FormData();
    var fileUpload = $('#fu-leave-req').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    /*var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/EventDownload.ashx?EventId=' + EventId + '&UserId=' + currUserId + '&Type=' + Type + '&Name=' + $('#txtName').val().trim() + '&Location=' + $('#txtLocation').val().trim() + '&Address=' + $('#txtAddress').val().trim() + '&Remarks=' + $('#txtRemarks').val().trim();    //for Live*/
    //var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/SSHRFileUploadHandler.ashx?fufor=leaveattach&ApplicationId=' + ApplicationId;    // For Development
    var qrystringLocal = 'Services/SSHRFileUploadHandler.ashx?fufor=leaveattach&ApplicationId=' + ApplicationId + '&Type=' + Type;    // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        async: false,
        success: function (status) {
            if (status != 'error') {

                toastr.success('File has been Uploaded Successfully.', '');

            }
        },
        processData: false,
        contentType: false,
        error: function (errormessage) {
            console.log(errormessage.responseText);
            alert("Whoops something went wrong!");

        }
    });

}


$('.tbody-emp-req').on('click', '.ibtn-leave-req-info', function () {

    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('0');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearDetails();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    GetAllDetails();
    SetForm();
    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');

    //For Rectangle Box


});

function GetAllDetails() {
    //$("#txtStartDate").prop("type", "text");
    $.ajax({
        url: "AllRequests.aspx/GetAllDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#lblRequestNumber').html(result.d[0].LEAVE_APPLICATION_NO);
            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(result.d[0].VisaExpiryDate);
            $('#lblPassExpDate').html(result.d[0].PassportExpireDate);
            $('#lblDateOfJoin').html(result.d[0].JoiningDate);
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(result.d[0].EmiratesExpDate);

            /*loadAllEmployees(result.d[0].EmpNo);*/
            $('.on-beh').text('Applied By');
            $('.employee-drop').css('display','none');
            $('.employee-text').css('display', '');

            $('#txtEmpNametext').html(result.d[0].CreatedBy);

            reqStatus = result.d[0].Status;
            StatusOrder = result.d[0].STATUS_ORDER;

            $('#ddlLeaveType').val(result.d[0].LEAVE_TYPE_ID);

            if (result.d[0].Status == "DRAFT") {
    		$("#txtStartDate").prop("type", "date");
    		$('#txtStartDate').val(result.d[0].FROM_DATE);
    		$('#txtEndDate').val(result.d[0].TO_DATE);
    		$('#txtReturnToWork').val(result.d[0].RETURNED_TO_WORK);
		}
		else {
    			$("#txtStartDate").prop("type", "text");
    			$('#txtStartDate').val(datedayformat(result.d[0].FROM_DATE));
    			$('#txtEndDate').val(datedayformat(result.d[0].TO_DATE));
    			$('#txtReturnToWork').val(datedayformat(result.d[0].RETURNED_TO_WORK));
		}	

            // document.getElementById("txtStartDate").valueAsDate = new Date(result.d[0].FROM_DATE.split(" ")[0]);
            /* $('#txtEndDate').val(result.d[0].TO_DATE.split(" ")[0]);*/
            //  document.getElementById("txtEndDate").valueAsDate = new Date(result.d[0].TO_DATE.split(" ")[0]);
            $('#txtLeaveReqDay').val(result.d[0].LEAVE_REQ_DAYS);
            /*  $('#txtReturnToWork').val(result.d[0].RETURNED_TO_WORK.split(" ")[0]);*/
            // document.getElementById("txtReturnToWork").valueAsDate = new Date(result.d[0].RETURNED_TO_WORK.split(" ")[0]);

            if (result.d[0].CONSULTED_DOCTER == "True") {

                $('#cbIsConsultWithDoc').prop('checked', true);
                $('#txtEmpName').val(result.d[0].EmpNo);

            }
            if (result.d[0].CONSULTED_DOCTER == "true" && $("#ddlLeaveType").val() == "203") {
                $(".div-Attachment").css("display","block")
            }
            else {
                $(".div-Attachment").css("display", "none")
            }
            $('#txtPrimaryContact').val(result.d[0].CONTACT_MOBNO_WOL);
            $('#txtSecContact').val(result.d[0].CONTACT_TELNO_WOL);
            $('#txtContactName').val(result.d[0].CONTACT_NAME_WOL);
            $('#txtContactEmail').val(result.d[0].CONTACT_EMAIL_WOL);

            $('#taRemark').val(result.d[0].EMP_REMARKS);

            OnBehalfURL = result.d[0].On_BehalfURL;
            RequestURL = result.d[0].RequestURL;

            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].LEAVE_SALARY_REQUIRED == "True") {

                $('#cbIsAdvSalaryReq').prop('checked', true);

            }

            if (result.d[0].TICKET_REQUIRED == "True") {

                $('#cbIsTicketReq').prop('checked', true);

            }

            if (result.d[0].IS_PASSPORT_REQUIRED == "True") {

                $('#cbIsPassReq').prop('checked', true);

            }

            if (result.d[0].ONBEHALF_FLAG == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            }

            OnBehalfChange();
            InitialForm();
            htmActionButton = "";
            if (result.d[0].Status == "SUBMIT" && StatusOrder==0) {
                SubmitForm();
                htmActionButton += `<div class="pull-right">
                <button id="btnCancellRequest" type="button" class="btn btn-primary btnTagTemp"><i class='bx bx-x-circle'></i>Cancel</button>
                </div>`;

            }
            else if (result.d[0].Status == "DRAFT") {
                htmActionButton += `<div class="pull-right">
                    <button id="btnSubmit" type="button" class="btn btn-primary btnTagTemp" style=""><i class='bx bxs-check-circle me-3'></i>Submit</button>
                    <button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-save me-3'></i>Save as Draft</button>
            
                     </div>`
            }
            else {
                SubmitForm();
                htmActionButton = "";
            }
            $(".ActionButtons").html(htmActionButton);
            $(".dvApprovalStage").css("display", "");
            loadApproverAuthorityPeople();


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function SubmitForm() {

    $('#cbEmpOnBehalf').attr('disabled', true);
    $('#txtEmpName').attr('disabled', true);
    $('#ddlLeaveType').attr('disabled', true);


    $('#empLeaveModal').find('input[name="nmReqDet"]').attr('disabled', true);

    $('#txtReturnToWork').attr('disabled', true);
    $('#cbIsConsultWithDoc').attr('disabled', true);

    $('#empLeaveModal').find('input[name="nmContactDet"]').attr('disabled', true);
    $('#taRemark').attr('disabled', true);

    $('#empLeaveModal').find('input[name="nmSbReq"]').attr('disabled', true);

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');



}


$('#empLeaveModal').on('click', '#btnDownloadOBAtt', function () {

    if (OnBehalfURL != '') {

        //window.location = 'https://crmss.naffco.com/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + OnBehalfURL;
        window.location = '/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + OnBehalfURL;

    }

});

$('#empLeaveModal').on('click', '#btnDownloadAttachment', function () {

    if (RequestURL != '') {

        //window.location = 'https://crmss.naffco.com/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + RequestURL;
        window.location = '/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + RequestURL;

    }

});


function loadPPTReason() {

    $.ajax({
        url: "AllRequests.aspx/GetAllPPTReasons",
        //data: JSON.stringify({ 'data': objAddSurvey }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var opt = '';
            listLeaveType = result.d;

            $.each(listLeaveType, function (key, item) {
                opt += '<option value="' + item.Id + '" >' + item.Text + '</option>';
            });
            $('#ddlPPTReason').html(opt);



        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function GetPPTRefNo() {

    $.ajax({
        url: "AllRequests.aspx/GetPPTRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {

            $('#lblRequestNumber').html(result.d)
            /* $('#txtPPTReqNo').val(result.d);*/

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('#empLeaveModal').on('change', '#ddlPPTReason', function () {

    if ($('#ddlPPTReason option:selected').val() == 4) {

        $('.Other-Reason').css('display', '');
        loadPPTOtherReason();
    }
    else {

        $('.Other-Reason').css('display', 'none');

    }

});

function loadPPTOtherReason() {

    $.ajax({
        url: "AllRequests.aspx/GetAllPPTOtherReasons",
        data: JSON.stringify({ "ReasonValue": $('#ddlPPTReason option:selected').val(), "Reason": $('#ddlPPTReason option:selected').text(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var opt = '';
            listLeaveType = result.d;

            $.each(listLeaveType, function (key, item) {
                opt += '<option value="' + item.Value + '" >' + item.Text + '</option>';
            });
            $('#ddlPPTOtherReason').html(opt);



        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function AddPPTReqDetails() {

    if ($('#cbEmpOnBehalf').is(':checked') == false) {

        $('#txtEmpName').val('');
        $('#fu-on-behalf').val('');


    }
    EmpNumb = '';
    if ($('#cbEmpOnBehalf').is(':checked') == true) {

        EmpNumb = $('#txtEmpName option:selected').val();
    }
    else {
        EmpNumb = $('#lblEmpNo').html();
    }

    $.ajax({
        url: "AllRequests.aspx/setPPTRequestDetails",
        data: JSON.stringify({
            "ReqID": ApplicationId,
            "RefNo": $('#lblRequestNumber').text(),
            "User": currUserId,
            "EmpNo": EmpNumb,
            "OnBehalf": $('#cbEmpOnBehalf').is(':checked'),
            "Reason": $('#ddlPPTReason option:selected').text(),
            "OtherReason": $('#ddlPPTReason option:selected').text() == 'Others' ? $('#ddlPPTOtherReason option:selected').val() : '',
            "TravellingDate": $('#txtTravellingDate').val(),
            "EDOfReturn": $('#txtEptDOReturn').val(),
            "ReasonId": $('#ddlPPTReason option:selected').val(),
            "Status": reqStatus,
            "StatusOrder": 0,
        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            if (result.d[0].Id != 0) {
                ApplicationId = result.d[0].Id;
                UploadTheFiles();
                getAllPPTDetails();
                LoadRequestData();
              
            }
            else {
                toastr.error(result.d[0].Messsage, '');
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });





}


function ClearPPTDetails() {
    $('#lblEmpName').val("");
    $('#lblEmpNo').html("");
    $('#lblDesignation').val("");
    $('#lblDepart').val("");
    $('#lblVisaExpDate').html("");
    $('#lblPassExpDate').html("");
    $('#lblDateOfJoin').html("");
    $('#lblEID').html("");
    $('#lblEIDExpDate').html("");

    $('#fu-on-behalf').val('');
    $('#lblOnBehalfFU').val('');
    $('#fu-leave-req').val('');
    $('#lblLeaveReqFileName').val('');


    $('#cbEmpOnBehalf').prop('checked', false);
    if ($('#cbEmpOnBehalf').is(':checked')) { $('.onbehalf-controls-div').removeClass('hidden'); $('.onbehalf-controls-div1').removeClass('hidden') }
    else { $('.onbehalf-controls-div').addClass('hidden'); $('.onbehalf-controls-div1').addClass('hidden') }
    $('#txtEmpName').val('');

    $('#lblRequestNumber').html('');
    $('#txtTravellingDate').val('');
    $('#txtEptDOReturn').find('input[name="nmReqDet"]').val('');
    loadPPTReason();


    SetPPTForm();

}

function SetPPTForm() {

    $('#ddlPPTReason').trigger('change');
}


function PPTInitialForm() {
    $('#cbEmpOnBehalf').attr('disabled', false);
    $('#txtEmpName').attr('disabled', false);
    $('#ddlPPTReason').attr('disabled', false);
    $('#ddlPPTOtherReason').attr('disabled', false);
    $('#txtTravellingDate').attr('disabled', false);
    $('#txtEptDOReturn').attr('disabled', false);
    $('.insert-Attachment').css('display', '');
    $('.download-Attachment').css('display', 'none');
}

$('.tbody-emp-req').on('click', '.ibtn-PPT-req-info', function () {


    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('1');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearPPTDetails();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    getAllPPTDetails();
   

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');



    //For Rectangle Box


});


function getAllPPTDetails() {

    $.ajax({
        url: "AllRequests.aspx/GetAllPPTDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#lblStatus').html(result.d[0].Status);
            $('#lblAppID').html(result.d[0].ReqID);

            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(result.d[0].VisaExpiryDate);
            $('#lblPassExpDate').html(result.d[0].PassportExpireDate);
            $('#lblDateOfJoin').html(result.d[0].JoiningDate);
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(result.d[0].EmiratesExpDate);

            /*loadAllEmployees(result.d[0].EmpNo);*/

            $('.on-beh').text('Applied By');
            $('.employee-drop').css('display', 'none');
            $('.employee-text').css('display', '');

            $('#txtEmpNametext').html(result.d[0].CreatedBy);

            $('#lblRequestNumber').html(result.d[0].Req_Number);
            loadPPTReason();

            $('#ddlPPTReason').val(result.d[0].ReasonValue);
            $('#ddlPPTReason').trigger('change');
            $('#ddlPPTOtherReason').val(result.d[0].OtherReason);
            $("#txtTravellingDate").val(result.d[0].Travelling_Date);
            $("#txtEptDOReturn").val(result.d[0].Expected_Date_Of_Return);


            OnBehalfURL = result.d[0].On_Behalf_URL;
            RequestURL = result.d[0].Attchement_Link;

            reqStatus = result.d[0].Status;
            ApplicationId = result.d[0].ReqID;

            StatusOrder = result.d[0].StatusOrder;



            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].On_Behalf == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            } else {
                $('#cbEmpOnBehalf').prop('checked', false);
            }

            OnBehalfChange();
            PPTInitialForm();
            htmActionButton = "";

            if (result.d[0].Status == "SUBMIT" && StatusOrder == 0) {
                SubmitPPTForm();
                htmActionButton += `<div class="pull-right">
                <button id="btnCancellRequest" type="button" class="btn btn-primary btnTagTemp"><i class='bx bx-x-circle'></i>Cancel</button>
                </div>`;

            }
            else if (result.d[0].Status == "DRAFT") {

                htmActionButton += `<div class="pull-right">
                    <button id="btnSubmit" type="button" class="btn btn-primary btnTagTemp" style=""><i class='bx bxs-check-circle me-3'></i>Submit</button>
                    <button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-save me-3'></i>Save as Draft</button>
            
                     </div>`
            }
            else {
                SubmitPPTForm();
                htmActionButton = "";
            }
            $(".ActionButtons").html(htmActionButton);
            $(".dvApprovalStage").css("display", "");
            loadApproverAuthorityPeople();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function SubmitPPTForm() {

    $('#cbEmpOnBehalf').attr('disabled', true);
    $('#txtEmpName').attr('disabled', true);
    $('#ddlPPTReason').attr('disabled', true);
    $('#ddlPPTOtherReason').attr('disabled', true);
    $('#txtTravellingDate').attr('disabled', true);
    $('#txtEptDOReturn').attr('disabled', true);
    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');

}

function loadBDRequestType() {

    $.ajax({
        url: "AllRequests.aspx/GetBDRequestType",
        //data: JSON.stringify({ 'data': objAddSurvey }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var opt = '';
            listLeaveType = result.d;

            $.each(listLeaveType, function (key, item) {
                opt += '<option value="' + item.Id + '" >' + item.Text + '</option>';
            });
            $('#ddlBDReqType').html(opt);
            loadBDReason();


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function loadBDReason() {

    $.ajax({
        url: "AllRequests.aspx/GetBDREasons",
        data: JSON.stringify({ "RequestTypeValue": $('#ddlBDReqType option:selected').val(), "RequestType": $('#ddlBDReqType option:selected').text(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var opt = '';
            listLeaveType = result.d;

            $.each(listLeaveType, function (key, item) {
                opt += '<option value="' + item.Value + '" >' + item.Text + '</option>';
            });
            $('#ddlBDReason').html(opt);



        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#empLeaveModal').on('change', '#ddlBDReqType', function () {

    loadBDReason();
    BankDetReqTypeChange();


});


function ClearPPTDetails() {
    $('#lblEmpName').val("");
    $('#lblEmpNo').html("");
    $('#lblDesignation').val("");
    $('#lblDepart').val("");
    $('#lblVisaExpDate').html("");
    $('#lblPassExpDate').html("");
    $('#lblDateOfJoin').html("");
    $('#lblEID').html("");
    $('#lblEIDExpDate').html("");

    $('#fu-on-behalf').val('');
    $('#lblOnBehalfFU').val('');
    $('#fu-leave-req').val('');
    $('#lblLeaveReqFileName').val('');


    $('#cbEmpOnBehalf').prop('checked', false);
    if ($('#cbEmpOnBehalf').is(':checked')) { $('.onbehalf-controls-div').removeClass('hidden'); $('.onbehalf-controls-div1').removeClass('hidden') }
    else { $('.onbehalf-controls-div').addClass('hidden'); $('.onbehalf-controls-div1').addClass('hidden') }
    $('#txtEmpName').val('');

    $('#lblRequestNumber').html('');
    $('#txtTravellingDate').val('');
    $('#txtEptDOReturn').find('input[name="nmReqDet"]').val('');

    loadPPTReason();


    SetPPTForm();

}

function ClearBankDetails() {
    $('#lblEmpName').val("");
    $('#lblEmpNo').html("");
    $('#lblDesignation').val("");
    $('#lblDepart').val("");
    $('#lblVisaExpDate').html("");
    $('#lblPassExpDate').html("");
    $('#lblDateOfJoin').html("");
    $('#lblEID').html("");
    $('#lblEIDExpDate').html("");

    $('#lblRequestNumber').html(''),
        $('#fu-on-behalf').val('');
    $('#lblOnBehalfFU').val('');
    $('#fu-leave-req').val('');
    $('#lblLeaveReqFileName').val('');
    $('#empLeaveModal').find('input[name="nmBDBasicSalDet"]').val('');
    $('#empLeaveModal').find('input[name="nmBasicDet"]').val('');
    loadBDRequestType();
    $('#empLeaveModal').find('input[name="nmSCB"]').val('');
    $('#empLeaveModal').find('input[name="nmSTL"]').val('');

}

function GetBDRefNo() {

    $.ajax({
        url: "AllRequests.aspx/GetBDRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {

            const BDVal = result.d.split(',');
            let BDRefNo = BDVal[0];
            let BDReqDate = BDVal[1];

            $('#txtBDReqNo').val(BDRefNo);
            $('#txtBDReqDate').val(BDReqDate.split(' ')[0]);
            $('#lblRequestNumber').html(BDRefNo);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetMiscRefNo() {

    $.ajax({
        url: "AllRequests.aspx/GetMiscRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {

            const BDVal = result.d.split(',');
            let MiscRefNo = BDVal[0];
            let MiscReqDate = BDVal[1];

            $('#lblRequestNumber').html(MiscRefNo);
            $('#txtMiscReqDate').val(MiscReqDate.split(' ')[0]);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetTikEncashRefNo() {

    $.ajax({
        url: "AllRequests.aspx/GetTikEncashRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {

            let tikEcashRef = result.d;
            //let BDRefNo = BDVal[0];
            //let BDReqDate = BDVal[1];

            //$('#txtBDReqNo').val(BDRefNo);
            //$('#txtBDReqDate').val(BDReqDate.split(' ')[0]);
            $('#lblRequestNumber').html(tikEcashRef);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function PPTInitialForm() {
    $('#cbEmpOnBehalf').attr('disabled', false);
    $('#empLeaveModal').find('input[name="nmSCB"]').attr('disabled', false);
    $('#empLeaveModal').find('input[name="nmSTL"]').attr('disabled', false);

}

function BankDetReqTypeChange() {

    if ($('#ddlBDReqType').val() == 5) {

        $("#txtBDPurpose").val("BANK");
        $('.Salary-CF').css('display', '');
        $('.Salary-TL').css('display', 'none');
    }

    else if ($('#ddlBDReqType').val() == 6) {
        $("#txtBDPurpose").val("");
        $('.Salary-CF').css('display', 'none');
        $('.Salary-TL').css('display', '');
        GetBDSTLDet();
    }
}


function GetBDBasicSalaryDet() {



    $.ajax({
        url: "AllRequests.aspx/GetBasicSalDet",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            loadEmpDetails();
            loadEmpLoanDetails();
            $('#txtBDBasic').html(result.d[0].BASIC);
            $('#txtBDHRA').html(result.d[0].HRAA);
            $('#txtBDCar').html(result.d[0].CARALW);
            $('#txtBDMobile').html(result.d[0].MOBALW);
            $('#txtBDOther').html(result.d[0].OTHALW);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function GetBDSTLDet() {



    $.ajax({
        url: "AllRequests.aspx/GetBDSTDet",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {

            const BankDet = result.d.split(',');
            let BankName = BankDet[0];
            let IBAN = BankDet[1];

            $('#txtBDBankName').val(BankName);
            $('#txtBDIBANNo').val(IBAN);
            $('#lblRequestNumber').html(RefNo);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function AddBankDetReqDetails() {

    if ($('#cbEmpOnBehalf').is(':checked') == false) {

        $('#txtEmpName').val('');
        $('#fu-on-behalf').val('');


    }
    EmpNumb = '';
    if ($('#cbEmpOnBehalf').is(':checked') == true) {

        EmpNumb = $('#txtEmpName option:selected').val();
    }
    else {
        EmpNumb = $('#lblEmpNo').html();
    }
    if ($("#ddlBDReqType").val() == "6" && ($("#txtBDReqamount").val() == "" || $("#txtBDReqamount").val() == "0")) {

        toastr.error('Amount cannot be zero');
    }
    else { 
    $.ajax({
        url: "AllRequests.aspx/setBankDetRequestDetails",
        data: JSON.stringify({
            "ReqID": ApplicationId,
            "RefNo": $('#lblRequestNumber').text(),
            "User": currUserId,
            "EmpNo": EmpNumb,
            "OnBehalf": $('#cbEmpOnBehalf').is(':checked'),
            "ReqDate": $('#txtBDReqDate').val(),
            "ReqTypeVal": $('#ddlBDReqType option:selected').val(),
            "ReqType": $('#ddlBDReqType option:selected').text(),
            "Reason": $('#ddlBDReason option:selected').text(),
            "SCBank": $('#ddlBDReqType option:selected').val() == 5 ? $('#txtBDBank').val() : ' ',
            "SCPurpose": $('#ddlBDReqType option:selected').val() == 5 ? $('#txtBDBank').val() : ' ',
            "STLBankName": $('#ddlBDReqType option:selected').val() == 6 ? $('#txtBDBankName').val() : '',
            "STLIBAN": $('#ddlBDReqType option:selected').val() == 6 ? $('#txtBDIBANNo').val() : '',
            "STLBankAddress": $('#ddlBDReqType option:selected').val() == 6 ? $('#txtBDBankAddress').val() : '',
            "STLReqAmount": $('#txtBDReqamount').val() != '' ? $('#txtBDReqamount').val() : 0,
            "Status": reqStatus,
        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            if (result.d[0].Id != 0) {
                ApplicationId = result.d[0].Id;
                UploadTheFiles();
                getAllBankDetails();
                LoadRequestData();
                toastr.success('Updated Successfully', '');
            }
            else {
                toastr.error(result.d[0].Messsage, '');
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    }
}

function loadMiscRequestType() {

    $.ajax({
        url: "AllRequests.aspx/GetMiscRequestType",
        //data: JSON.stringify({ 'data': objAddSurvey }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var opt = '';
            listLeaveType = result.d;

            $.each(listLeaveType, function (key, item) {
                opt += '<option value="' + item.Id + '" >' + item.Text + '</option>';
            });
            $('#ddlMiscReqType').html(opt);
            /* loadBDReason();*/


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function miscReqTypeFormate() {

    if ($('#ddlMiscReqType').val() == '10005') {

        $('.MiscReason-Area').css('display', '');
        $('.OtherRemarks-Area').css('display', 'none');
        $('.Misc_Address-ToWhom').css('display', '');
        $('.MiscReason-Drop').css('display', 'none');
        $('.Date-Period').css('display', 'none');
        $('.Trans-Location').css('display', 'none');
        $('.Trans-Type').css('display', 'none');
        $('.Date-Of-Change').css('display', 'none');
        $('.Diff-Date').css('display', 'none');

    }

    else if ($('#ddlMiscReqType').val() == '10006') {

        $('.MiscReason-Area').css('display', '');
        $('.OtherRemarks-Area').css('display', 'none');
        $('.Misc_Address-ToWhom').css('display', 'none');
        $('.MiscReason-Drop').css('display', 'none');
        $('.Date-Period').css('display', 'none');
        $('.Trans-Location').css('display', 'none');
        $('.Trans-Type').css('display', 'none');
        $('.Date-Of-Change').css('display', 'none');
        $('.Diff-Date').css('display', 'none');

    }

    else if ($('#ddlMiscReqType').val() == '10007') {

        $('.MiscReason-Area').css('display', '');
        $('.OtherRemarks-Area').css('display', 'none');
        $('.Misc_Address-ToWhom').css('display', '');
        $('.MiscReason-Drop').css('display', 'none');
        $('.Date-Period').css('display', 'none');
        $('.Trans-Location').css('display', 'none');
        $('.Trans-Type').css('display', 'none');
        $('.Date-Of-Change').css('display', 'none');
        $('.Diff-Date').css('display', 'none');

    }

    else if ($('#ddlMiscReqType').val() == '10008') {

        $('.MiscReason-Area').css('display', 'none');
        $('.OtherRemarks-Area').css('display', 'none');
        $('.Misc_Address-ToWhom').css('display', 'none');
        $('.MiscReason-Drop').css('display', '');
        $('.Date-Period').css('display', 'none');
        $('.Trans-Location').css('display', 'none');
        $('.Trans-Type').css('display', 'none');
        $('.Date-Of-Change').css('display', 'none');
        $('.Diff-Date').css('display', 'none');
        loadMiscReason();
    }

    else if ($('#ddlMiscReqType').val() == '10009') {

        $('.MiscReason-Area').css('display', '');
        $('.OtherRemarks-Area').css('display', 'none');
        $('.Misc_Address-ToWhom').css('display', 'none');
        $('.MiscReason-Drop').css('display', 'none');
        $('.Date-Period').css('display', '');
        $('.Trans-Location').css('display', 'none');
        $('.Trans-Type').css('display', 'none');
        $('.Date-Of-Change').css('display', 'none');
        $('.Diff-Date').css('display', 'none');

    }

    else if ($('#ddlMiscReqType').val() == '10010') {

        $('.MiscReason-Area').css('display', '');
        $('.OtherRemarks-Area').css('display', 'none');
        $('.Misc_Address-ToWhom').css('display', 'none');
        $('.MiscReason-Drop').css('display', 'none');
        $('.Date-Period').css('display', '');
        $('.Trans-Location').css('display', 'none');
        $('.Trans-Type').css('display', 'none');
        $('.Date-Of-Change').css('display', 'none');
        $('.Diff-Date').css('display', 'none');

    }

    if ($('#ddlMiscReqType').val() == '10011') {

        $('.MiscReason-Area').css('display', '');
        $('.OtherRemarks-Area').css('display', 'none');
        $('.Misc_Address-ToWhom').css('display', '');
        $('.MiscReason-Drop').css('display', 'none');
        $('.Date-Period').css('display', 'none');
        $('.Trans-Location').css('display', 'none');
        $('.Trans-Type').css('display', 'none');
        $('.Date-Of-Change').css('display', 'none');
        $('.Diff-Date').css('display', 'none');

    }

    if ($('#ddlMiscReqType').val() == '10012') {

        $('.MiscReason-Area').css('display', '');
        $('.OtherRemarks-Area').css('display', 'none');
        $('.Misc_Address-ToWhom').css('display', 'none');
        $('.MiscReason-Drop').css('display', 'none');
        $('.Date-Period').css('display', 'none');
        $('.Trans-Location').css('display', '');
        $('.Trans-Type').css('display', '');
        $('.Date-Of-Change').css('display', 'none');
        $('.Diff-Date').css('display', 'none');
        LoadMiscEmpType();
        transEmpTypeFormat();
    }
}

$('#empLeaveModal').on('change', '#ddlMiscReqType', function () {

    miscReqTypeFormate();

});


function loadMiscReason() {

    $.ajax({
        url: "AllRequests.aspx/GetBDREasons",
        data: JSON.stringify({ "RequestTypeValue": $('#ddlMiscReqType option:selected').val(), "RequestType": $('#ddlMiscReqType option:selected').text(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var opt = '';
            listLeaveType = result.d;

            $.each(listLeaveType, function (key, item) {
                opt += '<option value="' + item.Value + '" >' + item.Text + '</option>';
            });
            $('#ddlMiscReason').html(opt);



        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#empLeaveModal').on('change', '#ddlMiscReason', function () {

    if ($('#ddlMiscReason').val() == 'Others-Please Specify On The Remarks') {

        $('.OtherRemarks-Area').css('display', '');
    }
    else {
        $('.OtherRemarks-Area').css('display', 'none');
    }

});

function transEmpTypeFormat() {
    if ($('#ddlMiscReqType').val() == '10012' && $('#ddlMiscEmpType').val() == 'Existing Employee') {

        $('.Trans-Type').css('display', '');
        if ($('#ddlMiscEmpType').val() == 'Existing Employee' && $('#ddlMiscTransType').val() == '1') {
            $('.Diff-Date').css('display', 'none');
            $('.Date-Of-Change').css('display', '');
        }
        else if ($('#ddlMiscEmpType').val() == 'Existing Employee' && $('#ddlMiscTransType').val() == '2') {

            $('.Diff-Date').css('display', '');
            $('.Date-Of-Change').css('display', 'none');
        }
    }

    else if ($('#ddlMiscReqType').val() == '10012' && $('#ddlMiscEmpType').val() == 'New Joiner') {
        $('.Trans-Type').css('display', 'none');
        $('.Diff-Date').css('display', 'none');
        $('.Date-Of-Change').css('display', 'none');
    }
}

function LoadMiscEmpType() {

    $.ajax({
        url: "AllRequests.aspx/GetBDREasons",
        data: JSON.stringify({ "RequestTypeValue": $('#ddlMiscReqType option:selected').val(), "RequestType": $('#ddlMiscReqType option:selected').text(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var opt = '';
            listLeaveType = result.d;

            $.each(listLeaveType, function (key, item) {
                opt += '<option value="' + item.Value + '" >' + item.Text + '</option>';
            });
            $('#ddlMiscEmpType').html(opt);



        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#empLeaveModal').on('change', '#ddlMiscEmpType', function () {

    transEmpTypeFormat();

});

$('#empLeaveModal').on('change', '#ddlMiscTransType', function () {

    transEmpTypeFormat();

});

function ClearMiscReqDetails() {
    $('#lblEmpName').val("");
    $('#lblEmpNo').html("");
    $('#lblDesignation').val("");
    $('#lblDepart').val("");
    $('#lblVisaExpDate').html("");
    $('#lblPassExpDate').html("");
    $('#lblDateOfJoin').html("");
    $('#lblEID').html("");
    $('#lblEIDExpDate').html("");

    $('#fu-on-behalf').val('');
    $('#lblOnBehalfFU').val('');
    $('#fu-leave-req').val('');
    $('#lblLeaveReqFileName').val('');

    $('#lblRequestNumber').html('');
    $('#txtMiscReqDate').val('');
    $('#empLeaveModal').find('input[name="nmMiscControll"]').val('');
    $('#txtMiscReason').val('');

}

function MiscInitialForm() {
    $('#cbEmpOnBehalf').attr('disabled', false);
    $('#txtEmpName').attr('disabled', false);
    $('#empLeaveModal').find('input[name="nmMiscControll"]').attr('disabled', false);
    $('#txtMiscReason').attr('disabled', false);
    $('#ddlMiscReqType').attr('disabled', false);
    $('#ddlMiscReason').attr('disabled', false);
    $('#ddlMiscEmpType').attr('disabled', false);
    $('#ddlMiscTransType').attr('disabled', false);

    $('#txtMiscFromDate').attr('disabled', false);
    $('#txtMiscToDate').attr('disabled', false);
    $('#txtMiscFromDateTrans').attr('disabled', false);
    $('#txtMiscToDateTrans').attr('disabled', false);
    $('.insert-Attachment').css('display', '');
    $('.download-Attachment').css('display', 'none');

}

function AddMiscDetReqDetails() {

    if ($('#cbEmpOnBehalf').is(':checked') == false) {

        $('#txtEmpName').val('');
        $('#fu-on-behalf').val('');
    }
    EmpNumb = '';
    if ($('#cbEmpOnBehalf').is(':checked') == true) {

        EmpNumb = $('#txtEmpName option:selected').val();
    }
    else {
        EmpNumb = $('#lblEmpNo').html();
    }


    $.ajax({
        url: "AllRequests.aspx/setMiscRequestDetails",
        data: JSON.stringify({
            "ReqID": ApplicationId,
            "RefNo": $('#lblRequestNumber').text(),
            "User": currUserId,
            "EmpNo": EmpNumb,
            "OnBehalf": $('#cbEmpOnBehalf').is(':checked'),
            "ReqDate": $('#txtMiscReqDate').val(),
            "ReqTypeVal": $('#ddlMiscReqType option:selected').val(),
            "ReqType": $('#ddlMiscReqType option:selected').text(),
            "ReasonText": $('#txtMiscReason').val(),
            "ReasonDrop": $('#ddlMiscReqType option:selected').val() == '10008' ? $('#ddlMiscReason option:selected').val() : '',
            "AddressToWhom": $('#txtMiscAddToWhom').val(),
            "OtherRemarks": $('#txtMiscOtherRemarks').val(),
            "FromDate": $('#txtMiscFromDate').val(),
            "ToDate": $('#txtMiscToDate').val(),
            "CountryToApplyVisa": $('#txtCountryToApplyVisa').val(),
            "EmployeeType": $('#ddlMiscReqType option:selected').val() == '10012' ? $('#ddlMiscEmpType option:selected').val() : '',
            "CurrentLocation": $('#txtMiscCurrLocation').val(),
            "ReqLocation": $('#txtMiscReqLocation').val(),
            "TransportType": ($('#ddlMiscReqType option:selected').val() == '10012' && $('#ddlMiscEmpType option:selected').val() == 'Existing Employee') ? $('#ddlMiscTransType option:selected').val() : '',
            "DateOfChange": $('#txtMiscDateOfChange').val(),
            "TransFromDate": $('#txtMiscFromDateTrans').val(),
            "TransToDate": $('#txtMiscToDateTrans').val(),
            "Status": reqStatus,
        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d[0].Id != 0) {



                toastr.success('Updated Successfully', '');
                ApplicationId = result.d[0].Id;
                UploadTheFiles();
                //loadEmpDetails();
                getAllMiscRequestDetails();
                LoadRequestData();
            }
            else {
                toastr.error(result.d[0].Messsage, '');
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function GetCLoanRefNo() {

    $.ajax({
        url: "AllRequests.aspx/GetCLoanRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {

            const BDVal = result.d.split(',');
            let CLoanRefNo = BDVal[0];
            let CLoanReqDate = BDVal[1];

            $('#lblRequestNumber').html(CLoanRefNo);
            $('#txtCLoanReqDate').val(CLoanReqDate.split(' ')[0]);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetLAReqRefNo() {

    $.ajax({
        url: "AllRequests.aspx/GetLAReqRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {

            const BDVal = result.d.split(',');
            let LAReqRefNo = BDVal[0];
            let LAReqDate = BDVal[1];

            $('#lblRequestNumber').html(LAReqRefNo);
            /*  $('#txtCLoanReqDate').val(CLoanReqDate.split(' ')[0]);*/

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetEPReqRefNo() {

    $.ajax({
        url: "AllRequests.aspx/GetEPReqRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {

            const BDVal = result.d.split(',');
            let EPReqRefNo = BDVal[0];
            let EPReqDate = BDVal[1];

            $('#lblRequestNumber').html(EPReqRefNo);
            /*  $('#txtCLoanReqDate').val(CLoanReqDate.split(' ')[0]);*/

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function AddCompanyLoanReqDetails() {

    if ($('#cbEmpOnBehalf').is(':checked') == false) {

        $('#txtEmpName').val('');
        $('#fu-on-behalf').val('');
    }

    EmpNumb = '';

    if ($('#cbEmpOnBehalf').is(':checked') == true) {

        EmpNumb = $('#txtEmpName option:selected').val();
    }
    else {
        EmpNumb = $('#lblEmpNo').html();
    }

    if (parseInt($('#txtNumberofMonth').val() == "" ? 0 : $('#txtNumberofMonth').val()) > 4 && $("#lblLeaveReqFileName").val() == "") {
        toastr.error("You should attach your tenent contract to prove that your contract is by annum");
        return;
    }

   


    $.ajax({
        url: "AllRequests.aspx/setCompanyLoanRequestDetails",
        data: JSON.stringify({
            "ReqID": ApplicationId,
            "RefNo": $('#lblRequestNumber').text(),
            "User": currUserId,
            "EmpNo": EmpNumb,
            "OnBehalf": $('#cbEmpOnBehalf').is(':checked'),
            "LoanType": $('#ddlBLLoanType option:selected').val(),
            "DedStartMonth": $('#txtCLoanDedStartMonth').val(),
            "Reason": $('#txtCLoanReason').val(),
            "MonthlyDeduction": $('#txtCLoanMonthlyDed').val(),
            "Status": reqStatus,
            "NofoMonths": $('#txtNumberofMonth').val(),
            "Amount": $('#txtCLoanAmount').val(),

        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            if (result.d[0].Id != 0) {



                toastr.success('Updated Successfully', '');
                ApplicationId = result.d[0].Id;
                UploadTheFiles();
                getAllCompanyLoanDetails();
                LoadRequestData();
            }
            else {
                toastr.error(result.d[0].Messsage, '');
            }



        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function AddLateAttendanceReqDetails() {

    if ($('#cbEmpOnBehalf').is(':checked') == false) {

        $('#txtEmpName').val('');
        $('#fu-on-behalf').val('');


    }
    EmpNumb = '';
    if ($('#cbEmpOnBehalf').is(':checked') == true) {

        EmpNumb = $('#txtEmpName option:selected').val();
    }
    else {
        EmpNumb = $('#lblEmpNo').html();
    }

    $.ajax({
        url: "AllRequests.aspx/setLateAttendanceReqDetails",
        data: JSON.stringify({
            "ReqID": ApplicationId,
            "RefNo": $('#lblRequestNumber').text(),
            "User": currUserId,
            "EmpNo": EmpNumb,
            "OnBehalf": $('#cbEmpOnBehalf').is(':checked'),
            "Date": $('#txtLAReqDate').val(),
            "ArrivedTime": $('#txtLAreqTime').val(),
            "Reason": $('#txtLAReqReason').val(),
            "Status": reqStatus,

        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d[0].Id != 0) {



                toastr.success('Updated Successfully', '');
                ApplicationId = result.d[0].Id;
                UploadTheFiles();
                getAllLAReqDetails();
                LoadRequestData();
            }
            else {
                toastr.error(result.d[0].Messsage, '');
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });



}


function AddExitPassReqDetails(Exist) {

    if ($('#cbEmpOnBehalf').is(':checked') == false) {

        $('#txtEmpName').val('');
        $('#fu-on-behalf').val('');


    }
    EmpNumb = '';
    if ($('#cbEmpOnBehalf').is(':checked') == true) {

        EmpNumb = $('#txtEmpName option:selected').val();
    }
    else {
        EmpNumb = $('#lblEmpNo').html();
    }

    if ($('#txtEXTPassDate').val() == "" || $('#txtEXTPassOutTime').val() == "") {
        toastr.error("Please fill all the fields", '');
    }
    else {
        $.ajax({
            url: "AllRequests.aspx/setExitPassReqDetails",
            data: JSON.stringify({
                "ReqID": ApplicationId,
                "RefNo": $('#lblRequestNumber').text(),
                "User": currUserId,
                "EmpNo": EmpNumb,
                "OnBehalf": $('#cbEmpOnBehalf').is(':checked'),
                "Date": $('#txtEXTPassDate').val(),
                "ExitType": $('#ddlEXTPassType option:selected').val(),
                "OutTime": $('#txtEXTPassOutTime').val(),
                "BackTime": $('#txtEXTPassBackTime').val(),
                "Reason": $('#txtEXTPassReason').val(),
                "Status": reqStatus,
            }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                if (result.d[0].Id != 0) {

                    toastr.success('Updated Successfully', '');
                    ApplicationId = result.d[0].Id;
                    UploadTheFiles();
                    getAllEPReqDetails();
                    LoadRequestData();
                }
                else {
                    toastr.error(result.d[0].Messsage, '');
                }
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}

function AddTEReqDetails(Exist) {

    if ($('#cbEmpOnBehalf').is(':checked') == false) {

        $('#txtEmpName').val('');
        $('#fu-on-behalf').val('');


    }
    EmpNumb = '';
    if ($('#cbEmpOnBehalf').is(':checked') == true) {

        EmpNumb = $('#txtEmpName option:selected').val();
    }
    else {
        EmpNumb = $('#lblEmpNo').html();
    }

    $.ajax({
        url: "AllRequests.aspx/setTEReqDetails",
        data: JSON.stringify({
            "ReqID": ApplicationId,
            "RefNo": $('#lblRequestNumber').text(),
            "User": currUserId,
            "EmpNo": EmpNumb,
            "OnBehalf": $('#cbEmpOnBehalf').is(':checked'),
            //"Date": $('#txtEXTPassDate').val(),
            "NoofTicketRequired": $('#txtNoOfTik').val(),
            "REASON": $('#txtTikEncashReason').val(),
            "Status": reqStatus,
            "LastTicketEncashDate": $("#dtLastEncashDate").val(),
        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d[0].Id != 0) {
                toastr.success('Updated Successfully', '');
                ApplicationId = result.d[0].Id;
                UploadTheFiles();
                getAllTEReqDetails();
                LoadRequestData();
            }
            else {
                toastr.error(result.d[0].Messsage, '');
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#empLeaveModal').on('change', '#ddlBLLoanType', function () {

    CompanyLoanTypeFormat();

});
$('#empLeaveModal').on('change', '#txtNumberofMonth', function () {
    $("#txtCLoanAmount").val(parseInt($("#txtBDHRA").text()) * parseInt($("#txtNumberofMonth").val() == "" ? 0 : $("#txtNumberofMonth").val()));
});


$('#empLeaveModal').on('change', '#txtCLoanAmount', function () {
    $("#txtCLoanMonthlyDed").val($("#txtCLoanAmount").val());
});
function CompanyLoanTypeFormat() {
    if ($('#ddlBLLoanType').val() == 'HRA') {
        $(".divnumberofMonth").css('display', '');
        $('#txtCLoanMonthlyDed').val($('#txtBDHRA').text());
        $('#txtCLoanMonthlyDed').attr('disabled', false);
        $("#txtCLoanAmount").attr('disabled',true)
        $("#txtNumberofMonth").attr('value', '0');
        $("#txtCLoanAmount").val('0');
        const dt = new Date();
        var day = ("0" + dt.getDate()).slice(-2);
        var month = ("0" + (dt.getMonth())).slice(-2);
        var date;
        
        if (RemainingHRAAdvance > 0) {
            var RemaingMonths = 0;
            RemaingMonths = parseInt(RemainingHRAAdvance) / parseInt($("#txtCLoanMonthlyDed").val());
            if (RemaingMonths == 1) {

                $("#txtNumberofMonth").prop("max", 5);
                month = ("0" + (dt.getMonth() + 2)).slice(-2);
                date = dt.getFullYear() + "-" + month;
                $("#txtCLoanDedStartMonth").val(date);

            }
            else if (RemaingMonths >= 2) {
                toastr.error('You are not eligible to go for HRA Advance since you have more than two months pending .. ');
                $("#txtNumberofMonth").prop("max", 0);
            }
            else {
                month = ("0" + (dt.getMonth() + 1)).slice(-2);
                date = dt.getFullYear() + "-" + month;
                $("#txtCLoanDedStartMonth").val(date);
                  
            }
        }
  else if (RemainingHRAAdvance==0) {
    $("#txtNumberofMonth").prop("max", 6);
}


    }

    else if ($('#ddlBLLoanType').val() == 'Salary Advance') {
        $('#txtCLoanMonthlyDed').val('0');
        $('#txtCLoanAmount').val('0');  
        $('#txtCLoanMonthlyDed').attr('disabled', true);
        $('#txtCLoanAmount').removeAttr('disabled', true);

        $(".divnumberofMonth").css('display', 'none');
        $('#txtNumberofMonth').val('0');


        const dt = new Date();
        var day = ("0" + dt.getDate()).slice(-2);
        var month = ("0" + (dt.getMonth())).slice(-2);
        var date;


        month = ("0" + (dt.getMonth() + 1)).slice(-2);
        date = dt.getFullYear() + "-" + month;
        $("#txtCLoanDedStartMonth").val(date);

    }
}
function ClearCLReqDetails() {
    $('#lblEmpName').val("");
    $('#lblEmpNo').html("");
    $('#lblDesignation').val("");
    $('#lblDepart').val("");
    $('#lblVisaExpDate').html("");
    $('#lblPassExpDate').html("");
    $('#lblDateOfJoin').html("");
    $('#lblEID').html("");
    $('#lblEIDExpDate').html("");

    $('#fu-on-behalf').val('');
    $('#lblOnBehalfFU').val('');
    $('#fu-leave-req').val('');
    $('#lblLeaveReqFileName').val('');

    $('#lblRequestNumber').text('');
    $('#txtCLoanReqDate').val('');
    $('#empLeaveModal').find('input[name="nmCLControll"]').val('');
    $('#txtCLoanReason').val('');
    $('#empLeaveModal').find('input[name="nmBDBasicSalDet"]').val('');
    $('#ddlBLLoanType').val('HRA');
    $('#txtNumberofMonth').val('0');
    $("#txtCLoanAmount").val(parseInt($("#txtBDHRA").text() == "" ? 0 : $("#txtBDHRA").text()) * parseInt($("#txtNumberofMonth").val() == "" ? 0 : $("#txtNumberofMonth").val()));
    $("#txtCLoanAmount").attr('disabled', true);

    const dt = new Date();
    var day = ("0" + dt.getDate()).slice(-2);
    var month = ("0" + (dt.getMonth())).slice(-2);
    var date;

  
        month = ("0" + (dt.getMonth() + 1)).slice(-2);
        date = dt.getFullYear() + "-" + month;
        $("#txtCLoanDedStartMonth").val(date);
    


}

function ClearLAReq() {
    $('#lblEmpName').val("");
    $('#lblEmpNo').html("");
    $('#lblDesignation').val("");
    $('#lblDepart').val("");
    $('#lblVisaExpDate').html("");
    $('#lblPassExpDate').html("");
    $('#lblDateOfJoin').html("");
    $('#lblEID').html("");
    $('#lblEIDExpDate').html("");

    $('#fu-on-behalf').val('');
    $('#lblOnBehalfFU').val('');
    $('#fu-leave-req').val('');
    $('#lblLeaveReqFileName').val('');

    $('#lblRequestNumber').html('');
    $('#txtLAReqReason').val('');


}

function ClearEPReq() {
    $('#lblEmpName').val("");
    $('#lblEmpNo').html("");
    $('#lblDesignation').val("");
    $('#lblDepart').val("");
    $('#lblVisaExpDate').html("");
    $('#lblPassExpDate').html("");
    $('#lblDateOfJoin').html("");
    $('#lblEID').html("");
    $('#lblEIDExpDate').html("");

    $('#fu-on-behalf').val('');
    $('#lblOnBehalfFU').val('');
    $('#fu-leave-req').val('');
    $('#lblLeaveReqFileName').val('');

    $('#lblRequestNumber').html('');
    $('#txtEXTPassReason').val('');
    $('#ddlEXTPassType option:selected').val('0');


}

function ClearTikEncash() {
    $('#lblEmpName').val("");
    $('#lblEmpNo').html("");
    $('#lblDesignation').val("");
    $('#lblDepart').val("");
    $('#lblVisaExpDate').html("");
    $('#lblPassExpDate').html("");
    $('#lblDateOfJoin').html("");
    $('#lblEID').html("");
    $('#lblEIDExpDate').html("");

    $('#fu-on-behalf').val('');
    $('#lblOnBehalfFU').val('');
    $('#fu-leave-req').val('');
    $('#lblLeaveReqFileName').val('');

    $('#lblRequestNumber').html('');
    $('#txtEXTPassReason').val('');
    $('#ddlEXTPassType option:selected').val('0');
}

function LateAttendanceInitialForm() {
    $('#cbEmpOnBehalf').attr('disabled', false);
    $('#txtEmpName').attr('disabled', false);
    $('#txtLAReqDate').attr('disabled', false);
    $('#txtLAreqTime').attr('disabled', false);
    $('#txtLAReqReason').attr('disabled', false);
    $('.insert-Attachment').css('display', '');
    $('.download-Attachment').css('display', 'none');
}
function TicketencInitialForm() {

    
   
    $('#cbEmpOnBehalf').attr('disabled', false);
    $('#txtEmpName').attr('disabled', false);
    $('#txtTikEncashReason').attr('disabled', false);
    $('#txtNoOfTik').attr('disabled', false);
    $('.insert-Attachment').css('display', '');
    $('.download-Attachment').css('display', 'none');

    $('#dtLastEncashDate').val(LastTicketEncashDate);
    $('#txtNoOfTik').attr("max", NumberoFTicketAvailable);
  

}
function ExitPassInitialForm() {
    $('#cbEmpOnBehalf').attr('disabled', false);
    $('#txtEmpName').attr('disabled', false);
    $('#txtEXTPassDate').attr('disabled', false);
    $('#ddlEXTPassType').attr('disabled', false);
    $('#txtEXTPassOutTime').attr('disabled', false);
    $('#txtEXTPassBackTime').attr('disabled', false);
    $('#txtEXTPassReason').attr('disabled', false);
    $('.insert-Attachment').css('display', '');
    $('.download-Attachment').css('display', 'none');
}

$('#ddlRequestType').on('change', function (ApplicationId) {

    Type = $('#ddlRequestType option:selected').val();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    var Exist = ApplicationId;
    $('#AddNewReq').trigger('click', Exist);

});

function onbehalfrolecheck() {
    if (myroleList.includes('13195') || myroleList.includes('13177') || myroleList.includes('13173')) {
        $(".divOnbehalf").css("display", "flex"); 
        $("#pills-behalfreq-tab").css("display", "block");
    }
    else {
        $(".divOnbehalf").css("display", "none");
        $("#pills-behalfreq-tab").css("display", "none");
    }
}
function loadEmpDetails() {

    $.ajax({
        url: "Profile.aspx/GetEmpInfo",
        data: JSON.stringify({ "EmpNo": EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#lblName').html(result.d[0].FULL_NAME);
            $('#lbProfPosition').html(result.d[0].POSITION);

            $('#lbPhoneNumber').html(result.d[0].MOBILE_PHONE);
            $('#lbTeleNumber').html(result.d[0].WORK_PHONE);

            $('#lbEmpNumber').html(result.d[0].EMPLOYEE_NUMBER);
            $('#lbTitle').html(result.d[0].TITLE);
            $('#lbFirstName').html(result.d[0].FIRST_NAME);
            $('#lbMiddleName').html(result.d[0].MIDDLE_NAMES);
            $('#lbLastName').html(result.d[0].LAST_NAME);

            $('#lbEmergencyPhone').html(result.d[0].EMERGENCY_PHONE);
            $('#lbAddress').html(result.d[0].ADDRESS_LINE1);
            $('#lbCountry').html(result.d[0].COUNTRY);
            $('#lbEmail').html(result.d[0].EMAIL_ADDRESS);
            $('#lbPosition').html(result.d[0].POSITION);
            $('#lbReligion').html(result.d[0].RELIGION);
            $('#lbBirthDate').html(result.d[0].DATE_OF_BIRTH);
            $('#lbGender').html(result.d[0].SEX);
            $('#lbMeterialStatus').html(result.d[0].MARITAL_STATUS);
            $('#lbEducation').html(result.d[0].EDUCATION);
            $('#lbNationality').html(result.d[0].NATIONALITY);

            $('#lbPassportNumber').html(result.d[0].PPNO);
            $('#lbPTCountry').html(result.d[0].COUNTRY);
            $('#lbPTCustody').html(result.d[0].PPCUSTODY);
            $('#lbPTPlaceOfIssue').html(result.d[0].PPCONTRYISSUE);
            $('#lbPTExpiriDate').html(result.d[0].PPDTEXPIRY);
            $('#lbPTIssueDate').html(result.d[0].PPDTISSUE);
            $('#lbPTUpdateStatus').html("N/A");

            $('#lbVIAuthority').html(result.d[0].VVVISAISSUEAUTH);
            $('#lbVINumber').html(result.d[0].VVNO);
            $('#lbVIType').html(result.d[0].VVVISATYPE);
            $('#lbVIPosition').html(result.d[0].VVVISAPOSITION);
            $('#lbVIExpDate').html(result.d[0].VVDTEXPIRY);
            $('#lbVIIssueCompany').html(result.d[0].VVVISAISSUECO);
            $('#lbVIIssueDate').html(result.d[0].VVDTISSUE);
            $('#lbVIUidNo').html(result.d[0].VVUIDNO);
            $('#lbVIMolNo').html("N/A");

            $('#lbTKClass').html(result.d[0].TKTRATETYP);
            $('#lbTKFamilyEligble').html(result.d[0].FAMELIG);
            $('#lbTKNoOfChildrens').html(result.d[0].NOOFCHILD);
            $('#lbTKFamilyClass').html(result.d[0].FAMCLASS);
            $('#lbTKNoOfAdults').html(result.d[0].NOOFADULTS);
            $('#lbTKDestination').html("N/A");
            $('#lbTKTerm').html(result.d[0].EMPPERIOD);

            $('#lbSLBasic').html(result.d[0].BASIC);
            $('#txtBDMobile').html(result.d[0].MOBALW);
            $('#lbSLOther').html(result.d[0].OTHALW);
            $('#lbSLFood').html(result.d[0].FOODALW);
            $('#lbSLHousingProvided').html(result.d[0].HRAP);
            $('#lbSLCar').html(result.d[0].CARALW);

            if (result.d[0].TransProvided == 'checked') {

                $('#cbTransportProv').prop('checked', true);
            }
            else {
                $('#cbTransportProv').prop('checked', false);
            }

            $('#lbSLTransport').html(result.d[0].TRANSALW);
            $('#lbSLHRA').html(result.d[0].HRAP);
            $('#lbSLCompanyCar').html("N/A");
            $('#lbSLLastSal').html("N/A");
            $('#lbSLGrossSal').html(result.d[0].Gross_salary);

            $('#lbBNKPayement').html(result.d[0].PAYMETHOD);
            $('#lbBNKBranch').html(result.d[0].BANKBRANCH);
            $('#lbBNKName').html(result.d[0].BANKNAME);
            $('#lbBNKIban').html(result.d[0].IBANNUMBER);
            $('#lbBNKAccntNo').html(result.d[0].ACCOUNTNUMBER);
            $('#basic-default-password12').val(result.d[0].LDpassword);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



function loadEmpLoanDetails() {

    $.ajax({
        url: "AllRequests.aspx/GetEmployeeLoanDetails",
        data: JSON.stringify({ "EmpNo": EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
		  if (result.d.length == 0) {
      				RemainingHRAAdvance = 0;
      				RemainingSalaryAdvance = 0;
  			}

            $.each(result.d, function (key, item) {
                htm += `<tr> 
                    <td style="text-align: center;" > <span class="badge badge-for-taskcode"> `+ item.LTYPE + ` </span> </td>
                    <td> `+ item.PAID + ` </td>
                    <td> `+ item.RECOVERED + ` </td>
                    <td> `+ item.REMAINING + ` </td>`
                htm += `</tr>`

                if (item.LTYPE == "Housing") {
                    RemainingHRAAdvance = item.REMAINING
                   
                }
                if (item.LTYPE == "SalaryAdvance") {
                    RemainingSalaryAdvance = item.REMAINING
                  
                }
            });
            $('.loan-body').html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function bankcarddisplay() {
    if (myroleList.includes("13189") || myroleList.includes("13188") || myroleList.includes("13186") || myroleList.includes("13185") || myroleList.includes("13166") || myroleList.includes("13165")) {
        $(".detailsrow").css("display", "none")
    }
    else {
        $(".detailsrow").css("display", "none")
    }
}

$(function () {
    // $('#ddlStatus').multiselect();
    $("#ddlStatus").select2({
        //dropdownParent: $("#ModalBriefForm"),
        multi: true,
        width: '100%',
        height: '173px',
        maximumSelectionLength: '5'
    });
    
});

//$("#ddlStatus").on('change', function () {
//    var selTaskStatusesForFilers = '';
//    $('#ddlStatus option:selected').each(function () {
//        selTaskStatusesForFilers += $(this).val() + ',';
//    });
//    selTaskStatusesForFilers = (removeCommaFromTaskStatuseLast(selTaskStatusesForFilers) == "" ? '-1' : removeCommaFromTaskStatuseLast(selTaskStatusesForFilers));
//    //filterAssignedToMetaskByStatuses();

//    if (validateFilterInputDate()) {
//        $('.ajax-loader').removeClass('hidden');
//        setTimeout(function () {
//            LoadRequestData()
//            renderTasksToTable();
//            $('.ajax-loader').addClass('hidden');
//        }, 500);
//    }
//});

function removeCommaFromTaskStatuseLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}

//date format
function datedayformat(dt) {
    if (dt != null && dt != '') {
        return (new Date(dt).getDate() + '-' + monthsbyName[new Date(dt).getMonth()] + '-' + new Date(dt).getFullYear() + ', ' + day[new Date(dt).getDay()]);
    }
    else {
        return '-';
    }
}

//time format
function timeFormat(dTime) {
    var date = new Date(dTime);
    var hour = '';
    var amPm = '';
    hour = date.getHours();
    hour = String('00' + hour).slice(-2);

    var time = hour + ":" + String('00' + date.getMinutes()).slice(-2) + ":" + String('00' + date.getSeconds()).slice(-2);

    return time;
}
