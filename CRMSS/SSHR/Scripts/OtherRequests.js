var Type = '-1';
var objDatatable = [];
var selLeaveType = '';
var EmpNumb = '';
var ApplicationId = 0;
var PPTReasonId = '';
var reqStatus = '';
var OrgID = 0;
var MyOrderNumber = 0;
var CurrentOrderNumber = 0;
var MyRoleID = 0;
var WorkFlowID = 0;
var Action = '';
var reqEmpno = '';
var RemainingHRAAdvance = 0;
var htmActionButton = "";
var Ispaid = 1;
var LastTicketEncashDate = "";
var NumberoFTicketAvailable = 0;

var selobjDatatableMisc = [];

var day = ["Sun", "Mon", "Tues", "Wed", "Thu", "Fri", "Sat"];
var monthsbyName = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

let defaulSortCol = 0;
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
    GetBasicEmpDet();
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

function LoadRequestData(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "OtherRequests.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "RequestType": Type, "Status": $('#ddlStatus option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-emp-req td').length > 0 ? objDatatable.destroy() : '';
            var htm = '';
            var htmlHead = '';

            if (Type == 0) {

                htmlHead += `<tr style="text-align: center;">
                               <th class="table-cahnge" colspan="10"  style="font-size:medium;background: #b70000 !important;color: white !important;">LEAVE APPLICATION</th></tr>`

                htmlHead += `   <tr style="text-align:center;" class="Head-tr">
                                 <th style="display:none;">ID</th> 
                                 <th style="display:none;">MyOrderNumber</th> 
                                 <th style="display:none;">MyRoleID</th>
                                 <th>Leave #</th>
                                 <th>Emp #</th>
                                 <th>Requester</th>
                                 <th>Department</th>
                                 <th>Leave Type</th>
                                 <th>Start Date</th>
                                 <th>End Date</th>
                                 <th>Reason</th>
                                 <th>Stage</th>
                                 <th>Action</th>
                             

                 </tr>`;

                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style="text-align:center;display:none;">`+ item.LEAVE_APPLICATION_ID + `</td>  
                 <td style="text-align:center;display:none;">`+ item.MyOrderNumber + `</td>  
                 <td style="text-align:center;display:none;">`+ item.MyRoleID + `</td>  
                 <td style="text-align:center;font-weight: 500;">`+ item.LEAVE_APPLICATION_NO + `</td>
                 <td style="text-align:center;">`+ item.EMP_NO + `</td>
                 <td style=" ">`+ item.RequestBy + `</td>  
                 <td style=" ">`+ item.Depart + `</td>  
                 <td style=" ">`+ item.LEAVE_TYPE + `</td>     
                 <td style="text-align:center"><span class="hidden"> `+ item.FromDate_Sort +`</span>`+ datedayformat(item.FROM_DATE) + `</td>
                 <td style="text-align:center"><span class="hidden"> `+ item.ToDate_Sort +`</span>`+ datedayformat(item.TO_DATE) + `</td>
                  <td style=" ">`+ item.REASON + `</td> 
                  <td style="text-align:center" ><a class="`+ item.StageClass + `">` + item.STATUS + `</a></td>
                  <td style="text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-leave-req-info" title="Other" data-projid="`+ item.LEAVE_APPLICATION_NO + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                    </tr>`;

                });

                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);
                defaulSortCol = 9;
            }


            else if (Type == 1) {





                htmlHead += ` <tr style="text-align: center;" class="Head-tr">
                                      <th class="table-cahnge" colspan="10"  style="font-size:medium;background: #b70000 !important;color: white !important;">PASSPORT RELEASE</th></tr>`

                htmlHead += `  <tr style="text-align: center;" class="Head-tr">
                                <th style="display:none;">ID</th>
                                <th style="display:none;">MyOrderNumber</th>
                                <th style="display:none;">MyRoleID</th>
                                <th> Request #</th>
                                <th>Emp #</th>
                                <th>Requester</th>
                                <th>Department</th>
                                 <th>Reason</th>
                                 <th>Travelling Date</th>
                                 <th>Return Date</th>
                                 <th>Request Date</th>
                                 <th>Stage</th>
                                 <th>Action</th>
                 </tr>`;

                $.each(result.d, function (key, item) {

                    htm += `  <tr>        
               
                 <td style="text-align:center;display:none;">`+ item.ReqID + `</td>
                 <td style="text-align:center;display:none;">`+ item.MyOrderNumber + `</td>  
                 <td style="text-align:center;display:none;">`+ item.MyRoleID + `</td>
                 <td style="text-align:center;font-weight: 500;">`+ item.Req_Number + `</td>
                 <td style="text-align:center;">`+ item.EMP_NO + `</td>
                 <td style=" ">`+ item.RequestBy + `</td>  
                 <td style=" ">`+ item.Depart + `</td> 
                 <td style=" ">`+ item.RequestFor + `</td>     
                 <td style="text-align:center"><span class="hidden"> `+ item.Travelling_Date_sort+`</span>`+ datedayformat(item.Travelling_Date) + `</td>
                 <td style="text-align:center"><span class="hidden"> `+ item.Expected_Date_Of_Return_sort +`</span>`+ datedayformat(item.Expected_Date_Of_Return) + `</td>
                  <td style="text-align:center"><span class="hidden"> `+ item.ReqDate_sort +`</span>`+ datedayformat(item.RequestDate) + `</td>
                    <td style="text-align:center" ><a class="`+ item.StageClass + `">` + item.STATUS + `</a></td>
                   <td style="text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-PPT-req-info" title="Other" data-pptid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                   </tr>`;

                });

                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);
                defaulSortCol = 11;
            }



            else if (Type == 2) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="8"  style="font-size:medium;background: #b70000 !important;color: white !important;">BANK RELATED REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th>
                                <th style="display:none;">MyOrderNumber</th>
                                <th style="display:none;">MyRoleID</th>
                                 <th>Request #</th>
                                <th>Emp #</th>
                                 <th>Requester</th>
                                  <th>Department</th>
                                 <th>Request Type</th>
                                 <th>Request Date</th>
                                 <th>Request Status</th>
                                 <th>Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style="text-align:center;display:none;">`+ item.ReqID + `</td>
                 <td style="text-align:center;display:none;">`+ item.MyOrderNumber + `</td>  
                 <td style="text-align:center;display:none;">`+ item.MyRoleID + `</td>
                  <td style="text-align:center;font-weight: 500;">`+ item.Req_Number + `</td>
                  <td style="text-align:center;">`+ item.EMP_NO + `</td>
                  <td style=" ">`+ item.RequestBy + `</td>  
                  <td style=" ">`+ item.Depart + `</td> 
                 <td style=" ">`+ item.REQUEST_TYPE + `</td>  
                 <td style="text-align:center"><span class="hidden"> `+ item.ReqDate_sort +`</span>`+ datedayformat(item.RequestDate) + `</td>     
               <td style="text-align:center" ><a class="`+ item.StageClass + `">` + item.STATUS + `</a></td>
                <td style="text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-BDR-req-info" title="Other" data-bankrelid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);
                defaulSortCol = 9;
            }


            else if (Type == 3) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="9"  style="font-size:medium;background: #b70000 !important;color: white !important;">MISCELLANEOUS REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th>
                                 <th style="display:none;">MyOrderNumber</th>
                                <th style="display:none;">MyRoleID</th>
                                 <th>Request #</th>
                                <th>Emp #</th>
                                 <th>Requester</th>
                                  <th>Department</th>
                                 <th>Request Type</th>
                                 <th>Reason</th>
                                 <th>Request Date</th>
                                 <th>Status</th>
                                  <th>Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style="text-align:center;display:none;">`+ item.ReqID + `</td>
                 <td style="text-align:center;display:none;">`+ item.MyOrderNumber + `</td>  
                 <td style="text-align:center;display:none;">`+ item.MyRoleID + `</td>
                  <td style="text-align:center;font-weight: 500;">`+ item.Req_Number + `</td>
                  <td style="text-align:center;">`+ item.EMP_NO + `</td>
                  <td style=" ">`+ item.RequestBy + `</td>  
                  <td style=" ">`+ item.Depart + `</td> 
                 <td style=" ">`+ item.REQUEST_TYPE + `</td>   
               
                 <td style="text-align:center"><span class="hidden"> `+ item.ReqDate_sort +`</span>`+ datedayformat(item.RequestDate) + `</td>     
                  <td style="text-align:center">`+ datedayformat(item.RequestDate) + `</td>   
                 <td style="text-align:center" ><a class="`+ item.StageClass + `">` + item.STATUS + `</a></td>
                <td style="text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-Misc-req-info" title="Other Misc" data-miscid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);
                defaulSortCol = 9;
            }


            else if (Type == 4) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="11"  style="font-size:medium;background: #b70000 !important;color: white !important;">COMPANY LOAN REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th>
                                 <th style="display:none;">MyOrderNumber</th>
                                <th style="display:none;">MyRoleID</th>
                                 <th style="width:10%">Request #</th>
                                <th>Emp #</th>
                                 <th style="width:20%">Requester</th>
                                  <th>Department</th>
                                 <th style="width:10%">Loan Type</th>
                                 <th style="width:10%">Reason</th>
                                 <th style="width:10%">Date Start</th>
                                 <th style="width:10%">Amount</th>
                                 <th style="width:10%">Request Date</th>
                                 <th style="width:10%">Status</th>
                                  <th style="width:10%">Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style="text-align:center;display:none;">`+ item.ReqID + `</td>
                 <td style="text-align:center;display:none;">`+ item.MyOrderNumber + `</td>  
                 <td style="text-align:center;display:none;">`+ item.MyRoleID + `</td>
                  <td style="text-align:center;font-weight: 500;">`+ item.Req_Number + `</td>
                  <td style="text-align:center;">`+ item.EMP_NO + `</td>
                  <td style=" ">`+ item.RequestBy + `</td>  
                  <td style=" ">`+ item.Depart + `</td> 
                 <td style=" ">`+ item.REQUEST_TYPE + `</td>   
                 <td style=" ">`+ item.RequestFor + `</td>   
                 <td style="text-align:center"><span class="hidden"> `+ item.DateStart_sort +`</span>`+ datedayformat(item.FROM_DATE) + `</td>   
                 <td style="text-align:center">`+ item.AMOUNT + `</td>   
                 <td style="text-align:center"><span class="hidden"> `+ item.ReqDate_sort +`</span>`+ datedayformat(item.RequestDate) + `</td>   
                  <td style="text-align:center" ><a class="`+ item.StageClass + `">` + item.STATUS + `</a></td>
                <td style="text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-CL-req-info" title="Other" data-comloid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);
                defaulSortCol = 12;
            }


            else if (Type == 5) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="10"  style="font-size:medium;background: #b70000 !important;color: white !important;">LATE ATTENDANCE REQUEST</th></tr>`

                htmlHead += `    <tr style="text-align: center;">
                                 <th style="display:none;">ID</th>
                                 <th style="display:none;">MyOrderNumber</th>
                                <th style="display:none;">MyRoleID</th>
                                 <th style="width:10%">Request #</th>
                                <th>Emp #</th>
                                 <th style="width:20%">Requester</th>
                                  <th>Department</th>
                                 <th style="width:10%">Date</th>
                                 <th style="width:10%">Arrived Time</th>
                                 <th style="width:20%">Reason</th>
                                 <th style="width:10%">Request Date</th>
                                 <th style="width:10%">Status</th>
                                  <th style="width:10%">Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style="text-align:center;display:none;">`+ item.ReqID + `</td>
                 <td style="text-align:center;display:none;">`+ item.MyOrderNumber + `</td>  
                 <td style="text-align:center;display:none;">`+ item.MyRoleID + `</td>
                  <td style="text-align:center;font-weight: 500;">`+ item.Req_Number + `</td>
                  <td style="text-align:center;">`+ item.EMP_NO + `</td>
                  <td style=" ">`+ item.RequestBy + `</td>
                  <td style=" ">`+ item.Depart + `</td> 
                  <td style="text-align:center"><span class="hidden"> `+ item.LateDate_sort +`</span>`+ datedayformat(item.FROM_DATE) + `</td>  
                 <td style="text-align:center">`+ item.ARRIVED_TIME + `</td>   
                 <td style=" ">`+ item.REASON + `</td>   
                 <td style="text-align:center"><span class="hidden"> `+ item.ReqDate_sort +`</span>`+ datedayformat(item.RequestDate) + `</td>   
                   <td style="text-align:center" ><a class="`+ item.StageClass + `">` + item.STATUS + `</a></td>
                <td style="text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-LA-req-info" title="Other" data-laid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);
                defaulSortCol = 11;
            }

            else if (Type == 6) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="10"  style="font-size:medium;background: #b70000 !important;color: white !important;">EXIT PASS REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th>
                                 <th style="display:none;">MyOrderNumber</th>
                                <th style="display:none;">MyRoleID</th>
                                 <th style="width:5%">Request #</th>
                                <th>Emp #</th>
                                 <th style="width:20%">Requester</th>
                                  <th>Department</th>
                                 <th style="width:10%">Exit Date</th>
                                 <th style="width:10%">Exit Time</th>
                                 <th style="width:20%">Reason</th>
                                 <th style="width:10%">Request Date</th>
                                 <th style="width:10%">Status</th>
                                  <th style="width:10%">Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style="text-align:center;display:none;">`+ item.ReqID + `</td>
                 <td style="text-align:center;display:none;">`+ item.MyOrderNumber + `</td>  
                 <td style="text-align:center;display:none;">`+ item.MyRoleID + `</td>
                  <td style="text-align:center;font-weight: 500;">`+ item.Req_Number + `</td>
                  <td style="text-align:center;">`+ item.EMP_NO + `</td>
                  <td style=" ">`+ item.RequestBy + `</td> 
                  <td style=" ">`+ item.Depart + `</td> 
                 <td style="text-align:center"><span class="hidden"> `+ item.ExitDate_sort +`</span>`+ datedayformat(item.EXIT_DATE) + `</td>   
                 <td style="text-align:center">`+ item.OUT_TIME + `</td>   
                 <td style=" ">`+ item.REASON + `</td>   
                 <td style="text-align:center"><span class="hidden"> `+ item.ReqDate_sort +`</span>`+ datedayformat(item.RequestDate) + `</td> 
                 <td style="text-align:center" ><a class="`+ item.StageClass + `">` + item.STATUS + `</a></td>
                <td style="text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-EXTPass-req-info" title="Other" data-exitid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);
                defaulSortCol = 11;

            }
            else if (Type == 7) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="9" style="font-size:large;background: #b70000 !important;color: white !important;">TICKET ENCASHMENT REQUEST</th></tr>`

               htmlHead += `    <tr style="text-align: center;">
                                 <th style="display:none;">ID</th>
                                 <th style="display:none;">MyOrderNumber</th>
                                <th style="display:none;">MyRoleID</th>
                                 <th style="width:10%">Request #</th>
                                <th>Emp #</th>
                                 <th style="width:20%">Requester</th>
                                  <th>Department</th>
                                 <th style="width:10%">Last Ticket Encash Date</th>
                                 <th style="width:10%">Request Date</th>
                                 <th style="width:20%">Reason</th>
                                 <th style="width:10%">Status</th>
                                  <th style="width:10%">Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style=" ;display:none;">`+ item.ReqID + `</td> 
                     <td style=" ;display:none;">`+ item.MyOrderNumber + `</td> 
                               <td style=" ;display:none;">`+ item.MyRoleID + `</td> 
                  <td style="text-align:center;font-weight: 500;">`+ item.Req_Number + `</td>
                                <td style="text-align:center;">`+ item.EMP_NO + `</td>
                                   <td>`+ item.RequestBy + `</td>
                                   <td style=" ">`+ item.Depart + `</td> 
                 <td style=" text-align: center;"><span class="hidden"> `+ item.LastTicketEncashDate_sort +`</span>`+ datedayformat(item.LastEncashDate) + `</td>
                      <td style=" text-align: center;"><span class="hidden"> `+ item.ReqDate_sort +`</span>`+ datedayformat(item.RequestDate) + `</td>
                 <td style=" ">`+ item.REASON + `</td>   
                
                 <td style=" text-align: center;" ><a class="`+ item.StageClass + `">` + item.STATUS + `</a></td>
                <td style=" text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-TE-req-info" title="Other" data-exitid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);
                defaulSortCol = 9;
            }
            //all Request
            else if (Type == -1) {

                htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="9" style="font-size:medium;background: #b70000 !important;color: white !important;">ALL REQUESTS</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                                 <th style="display:none;">ID</th> 
                                  <th style="display:none;">ReqTypeID</th>
                                  <th style="display:none;">MyOrderNumber</th>
                                <th style="display:none;">MyRoleID</th>
                                 <th style="width:10%">Request #</th>
                                <th>Emp #</th>
                                  <th style="width:20%">Requester</th>
                                   <th>Department</th>
                                 <th style="width:20%">Request Type</th>
                                 <th style="width:20%">Reason</th>
                                 <th style="width:10%">Request Date</th>
                                 <th style="width:10%">Status</th>
                                 <th style="width:10%">Action</th>`


                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                 <td style="text-align:center;display:none;">`+ item.ReqID + `</td> 
                 <td style="text-align:center;display:none;">`+ item.REQUEST_TYPEID + `</td>
                 <td style="text-align:center;display:none;">`+ item.MyOrderNumber + `</td>  
                 <td style="text-align:center;display:none;">`+ item.MyRoleID + `</td>
                 <td style="text-align:center;font-weight: 500;">`+ item.Req_Number + `</td>
                  <td style="text-align:center;">`+ item.EMP_NO + `</td>
                 <td style=" ">`+ item.RequestBy + `</td>   
                 <td style=" ">`+ item.Depart + `</td> 
                 <td style=" ">`+ item.REQUEST_TYPE + `</td>
                 <td style=" ">`+ item.REASON + `</td>   
                 <td style="text-align:center"><span class="hidden"> `+ item.ReqDate_sort +`</span>`+ datedayformat(item.RequestDate) + `</td> 
                  <td style="text-align:center" ><a class="`+ item.StageClass + `">` + item.STATUS + `</a></td>
                <td style="text-align:center">
                  <span style="margin-left: 4%;"> <i class="bx bx-area fa-icon-hover ibtn-AllReq-req-info" title="Other" data-projid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                  </td>

                  </tr>`;

                });


                $('.thead-Request_Details').html(htmlHead);
                $('.tbody-emp-req').html(htm);
                defaulSortCol = 11;
            }

            initiateDataTableEmp(defaulSortCol);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
$('.tbody-emp-req').on('click', '.ibtn-AllReq-req-info', function () {


    Type = this.parentNode.parentNode.parentNode.children[1].textContent;
    MyOrderNumber = this.parentNode.parentNode.parentNode.children[2].textContent;
    MyRoleID = this.parentNode.parentNode.parentNode.children[3].textContent;

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
      
        $('.insert-Attachment').css('display', 'none');
        $('.download-Attachment').css('display', '');
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
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllCompanyLoanDetails();
        //CompanyLoanTypeFormat();

        $('.insert-Attachment').css('display', 'none');
        $('.download-Attachment').css('display', '');
        $('#empLeaveModal').modal('show');
        loadEmpDetails();
        loadEmpLoanDetails();
    }

    else if (Type == 5) {


        $('#ddlRequestType').val('5');
        $('#ddlRequestType').attr('disabled', true);
        RequestPageLoad();
        ClearLAReq();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllLAReqDetails();

        $('.insert-Attachment').css('display', 'none');
        $('.download-Attachment').css('display', '');
        $('#empLeaveModal').modal('show');
    }

    else if (Type == 6) {

       
        $('#ddlRequestType').val('6');
        $('#ddlRequestType').attr('disabled', true);
        RequestPageLoad();
        ClearEPReq();
        ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
        getAllEPReqDetails();

        $('.insert-Attachment').css('display', 'none');
        $('.download-Attachment').css('display', '');
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
function SubmitTicketEncashDetForm() {
    $('#cbEmpOnBehalf').attr('disabled', true);
    $('#txtEmpName').attr('disabled', true);
    $('#txtTikEncashReason').attr('disabled', true);
    $('#txtNoOfTik').attr('disabled', true);
    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
}
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
$('.tbody-emp-req').on('click', '.ibtn-TE-req-info', function () {
    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('7');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearTEReq();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    MyOrderNumber = this.parentNode.parentNode.parentNode.children[1].textContent;
    MyRoleID = this.parentNode.parentNode.parentNode.children[2].textContent;
    getAllTEReqDetails();

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');

});
function GetTikEncashRefNo() {

    $.ajax({
        url: "OtherRequests.aspx/GetTikEncashRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            const tikEcashRef = result.d;
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

function getAllTEReqDetails() {
    $.ajax({
        url: "otherRequests.aspx/getAllTEReqDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            EmpNo=result.d[0].EmpNo;
            GetBasicEmpDet();
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

            reqStatus = result.d[0].Status;
            ApplicationId = result.d[0].ReqID;
            StatusOrder = result.d[0].StatusOrder;
            CurrentOrderNumber = result.d[0].StatusOrder;
            WorkFlowID = result.d[0].WorkFlowID;

            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].On_Behalf == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            } else {
                $('#cbEmpOnBehalf').prop('checked', false);
            }

            OnBehalfChange();
            SubmitTicketEncashDetForm();
            htmActionButton = "";
            if (parseInt(MyOrderNumber) == parseInt(CurrentOrderNumber) + 1 && reqStatus != "REJECTED") {

                htmActionButton += `<div class="pull-right">
                     <button id="btnApprove" style="background-color:green !important;border-color:green !important" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-check-circle'></i>&nbsp;Approve</button>
                        <button id="btnReject" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-x-circle'></i>&nbsp;Reject</button>
                    </div>`;

            }
            else {

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

$('.tbody-emp-req').on('click', '.ibtn-EXTPass-req-info', function () {


    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('6');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearEPReq();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    MyOrderNumber = this.parentNode.parentNode.parentNode.children[1].textContent;
    MyRoleID = this.parentNode.parentNode.parentNode.children[2].textContent;
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
    MyOrderNumber = this.parentNode.parentNode.parentNode.children[1].textContent;
    MyRoleID = this.parentNode.parentNode.parentNode.children[2].textContent;
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
    MyOrderNumber = this.parentNode.parentNode.parentNode.children[1].textContent;
    MyRoleID = this.parentNode.parentNode.parentNode.children[2].textContent;
    getAllCompanyLoanDetails();
   // CompanyLoanTypeFormat();

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');
    loadEmpDetails();
    loadEmpLoanDetails();


});

function SubmitCompanyLoanDetForm() {

    $('#cbEmpOnBehalf').attr('disabled', true);
    $('#txtEmpName').attr('disabled', true);
    $('#empLeaveModal').find('input[name="nmCLControll"]').attr('disabled', true);
    $('#ddlBLLoanType').attr('disabled', true);


}

function SubmitLateAttendanceDetForm() {

    $('#cbEmpOnBehalf').attr('disabled', true);
    $('#txtEmpName').attr('disabled', true);
    $('#txtLAReqReason').attr('disabled', true);
    $('#txtLAReqDate').attr('disabled', true);
    $('#txtLAreqTime').attr('disabled', true);



}
function SubmitExitPassDetForm() {


    $('#cbEmpOnBehalf').attr('disabled', true);
    $('#txtEmpName').attr('disabled', true);
    $('#txtEXTPassDate').attr('disabled', true);
    $('#ddlEXTPassType').attr('disabled', true);
    $('#txtEXTPassOutTime').attr('disabled', true);
    $('#txtEXTPassBackTime').attr('disabled', true);
    $('#txtEXTPassReason').attr('disabled', true);




}


function getAllCompanyLoanDetails() {

    $.ajax({
        url: "OtherRequests.aspx/GetAllCompanyLoanDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#lblRequestNumber').html(result.d[0].Req_Number);
            $('#lblStatus').html(result.d[0].Status);
            $('#lblAppID').html(result.d[0].ReqID);

            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            reqEmpno = result.d[0].EmpNo;
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(datedayformat(result.d[0].VisaExpiryDate));
            $('#lblPassExpDate').html(datedayformat(result.d[0].PassportExpireDate));
            $('#lblDateOfJoin').html(datedayformat(result.d[0].JoiningDate));
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(datedayformat(result.d[0].EmiratesExpDate));

            $('#txtBDBasic').val(result.d[0].BASIC);
            $('#txtBDHRA').val(result.d[0].HRAP);
            $('#txtBDCar').val(result.d[0].CARALW);
            $('#txtBDMobile').val(result.d[0].MOBALW);
            $('#txtBDOther').val(result.d[0].OTHALW);

            $('#txtEmpName').html(result.d[0].CreatedBy);
           /* loadAllEmployees(result.d[0].EmpNo);*/
            $('.on-beh').text('Applied By');
            $('.employee-drop').css('display', 'none');
            $('.employee-text').css('display', '');

            $('#txtEmpNametext').html(result.d[0].CreatedBy);

            $('#txtCLoanReqNo').val(result.d[0].Req_Number);
            $('#txtCLoanReqDate').val(datedayformat(result.d[0].CREATEDDATE));
            $('#ddlBLLoanType').val(result.d[0].REQUEST_TYPE);
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
            CurrentOrderNumber = result.d[0].StatusOrder;
            WorkFlowID = result.d[0].WorkFlowID;
           

            if ($('#ddlBLLoanType').val() == 'HRA') {
                $(".divnumberofMonth").css('display', '');
            }
            else {
                $(".divnumberofMonth").css('display', 'none');

            }

            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].On_Behalf == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            } else {
                $('#cbEmpOnBehalf').prop('checked', false);
            }

            OnBehalfChange();
            CompanyLoanInitialForm();
            SubmitCompanyLoanDetForm();
            htmActionButton = "";
            if (parseInt(MyOrderNumber) == parseInt(CurrentOrderNumber) + 1) {

                htmActionButton += `<div class="pull-right">
     <button id="btnApprove" style="background-color:green !important;border-color:green !important" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-check-circle'></i>&nbsp;Approve</button>
        <button id="btnReject" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-x-circle'></i>&nbsp;Reject</button>
    </div>`;

            }
            else {

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
        url: "OtherRequests.aspx/GetAllEPReqDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#lblRequestNumber').html(result.d[0].Req_Number);
            $('#lblStatus').html(result.d[0].Status);
            $('#lblAppID').html(result.d[0].ReqID);
            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            reqEmpno = result.d[0].EmpNo;
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(datedayformat(result.d[0].VisaExpiryDate));
            $('#lblPassExpDate').html(datedayformat(result.d[0].PassportExpireDate));
            $('#lblDateOfJoin').html(datedayformat(result.d[0].JoiningDate));
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(datedayformat(result.d[0].EmiratesExpDate));

            $('#txtEmpName').html(result.d[0].CreatedBy);
            /*loadAllEmployees(result.d[0].EmpNo);*/
            $('.on-beh').text('Applied By');
            $('.employee-drop').css('display', 'none');
            $('.employee-text').css('display', '');

            $('#txtEmpNametext').html(result.d[0].CreatedBy);

            $('#txtEXTPassDate').val(datedayformat(result.d[0].EXIT_DATE));
            $('#txtEXTPassNo').val(result.d[0].Req_Number);
            /* $('#txtEXTPassDate').val(result.d[0].EXIT_DATE);*/
            /* $('#txtCLoanDedStartMonth').val(result.d[0].DATE_START);*/
            // document.getElementById("txtEXTPassDate").valueAsDate = new Date(result.d[0].EXIT_DATE);
            $('#ddlEXTPassType').val(result.d[0].EXIT_TYPE);
            $('#txtEXTPassOutTime').val(result.d[0].OUT_TIME);
            $('#txtEXTPassBackTime').val(result.d[0].BACK_TIME);
            $('#txtEXTPassReason').val(result.d[0].Reason);

            OnBehalfURL = result.d[0].On_Behalf_URL;
            RequestURL = result.d[0].Attchement_Link;

            reqStatus = result.d[0].ReqID;
            ApplicationId = result.d[0].ReqID;
            CurrentOrderNumber = result.d[0].StatusOrder;
            WorkFlowID = result.d[0].WorkFlowID;


            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].On_Behalf == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            } else {
                $('#cbEmpOnBehalf').prop('checked', false);
            }

            OnBehalfChange();
            ExitPassInitialForm();
            SubmitExitPassDetForm();
            htmActionButton = "";
            if (parseInt(MyOrderNumber) == parseInt(CurrentOrderNumber) + 1) {

                htmActionButton += `<div class="pull-right">
     <button id="btnApprove" style="background-color:green !important;border-color:green !important" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-check-circle'></i>&nbsp;Approve</button>
        <button id="btnReject" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-x-circle'></i>&nbsp;Reject</button>
    </div>`;

            }
            else {

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
        url: "OtherRequests.aspx/GetAllLAReqDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#lblRequestNumber').html(result.d[0].Req_Number);
            $('#lblStatus').html(result.d[0].Status);
            $('#lblAppID').html(result.d[0].ReqID);

            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            reqEmpno = result.d[0].EmpNo;
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

            $('#txtEmpName').html(result.d[0].CreatedBy);
         /*   loadAllEmployees(result.d[0].EmpNo);*/

            $('#txLAReqNo').val(result.d[0].Req_Number);
            $('#txtLAReqDate').val(datedayformat(result.d[0].LATE_DATE));
            /* $('#txtCLoanDedStartMonth').val(result.d[0].DATE_START);*/
            //document.getElementById("txtLAReqDate").valueAsDate = new Date(result.d[0].LATE_DATE);
            $('#txtLAreqTime').val(result.d[0].ARRIVED_TIME);
            $('#txtLAReqReason').val(result.d[0].Reason);

            OnBehalfURL = result.d[0].On_Behalf_URL;
            RequestURL = result.d[0].Attchement_Link;

            reqStatus = result.d[0].Status;
            ApplicationId = result.d[0].ReqID;
            CurrentOrderNumber = result.d[0].StatusOrder;
            WorkFlowID = result.d[0].WorkFlowID;

            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].On_Behalf == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            } else {
                $('#cbEmpOnBehalf').prop('checked', false);
            }

            OnBehalfChange();
            LateAttendanceInitialForm();
            SubmitLateAttendanceDetForm();
            htmActionButton = "";
            if (parseInt(MyOrderNumber) == parseInt(CurrentOrderNumber) + 1) {

                htmActionButton += `<div class="pull-right">
                 <button id="btnApprove" style="background-color:green !important;border-color:green !important" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-check-circle'></i>&nbsp;Approve</button>
                    <button id="btnReject" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-x-circle'></i>&nbsp;Reject</button>
                </div>`;

            }
            else {

                htmActionButton = "";
            }

            if ((parseInt(CurrentOrderNumber) >= 1 && reqStatus != "SUBMIT") || (parseInt(CurrentOrderNumber) >= 1 && reqStatus == "SUBMIT") ) {
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
    MyOrderNumber = this.parentNode.parentNode.parentNode.children[1].textContent;
    MyRoleID = this.parentNode.parentNode.parentNode.children[2].textContent;
    getAllMiscRequestDetails();
    miscReqTypeFormate();


    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');




});

function SubmitMiscDetForm(id, sts) {


    $('#cbEmpOnBehalf').attr('disabled', true);
    $('#txtEmpName').attr('disabled', true);
    $('#empLeaveModal').find('input[name="nmMiscControll"]').attr('disabled', true);
    $('#ddlMiscReqType').attr('disabled', true);
    $('#ddlMiscReason').attr('disabled', true);
    $('#ddlMiscEmpType').attr('disabled', true);
    $('#ddlMiscTransType').attr('disabled', true);

    $('#txtMiscFromDate').attr('disabled', true);
    $('#txtMiscToDate').attr('disabled', true);
    $('#txtMiscFromDateTrans').attr('disabled', true);
    $('#txtMiscToDateTrans').attr('disabled', true);



}

function getAllMiscRequestDetails() {

    $.ajax({
        url: "OtherRequests.aspx/GetAllMiscReqDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#lblRequestNumber').html(result.d[0].Req_Number);
            $('#lblStatus').html(result.d[0].Status);
            $('#lblAppID').html(result.d[0].ReqID);
            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            reqEmpno = result.d[0].EmpNo;
            EmpNo= result.d[0].EmpNo;
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(datedayformat(result.d[0].VisaExpiryDate));
            $('#lblPassExpDate').html(datedayformat(result.d[0].PassportExpireDate));
            $('#lblDateOfJoin').html(datedayformat(result.d[0].JoiningDate));
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(datedayformat(result.d[0].EmiratesExpDate));

            $('#txtEmpName').html(result.d[0].CreatedBy);
            /*loadAllEmployees(result.d[0].EmpNo);*/
            $('.on-beh').text('Applied By');
            $('.employee-drop').css('display', 'none');
            $('.employee-text').css('display', '');

            $('#txtEmpNametext').html(result.d[0].CreatedBy);

            $('#txMiscReqNo').val(result.d[0].Req_Number);
            $('#txtMiscReqDate').val(datedayformat(result.d[0].CREATEDDATE));
            loadMiscRequestType();
            $('#ddlMiscReqType').val(result.d[0].REQUEST_TYPE);
            loadMiscReason();
            $('#ddlMiscReason').val(result.d[0].Reason);

            $('#txtMiscReason').val(result.d[0].Reason);
            $('#txtMiscAddToWhom').val(result.d[0].Address_To_Whom);
            $('#txtMiscOtherRemarks').val(result.d[0].OtherRemarks);
            /* $('#txtMiscFromDate').val(result.d[0].From_Date);*/
            $("txtMiscFromDate").val(datedayformat(result.d[0].From_Date));
            /* $('#txtMiscToDate').val(result.d[0].To_Date);*/
            $("txtMiscToDate").val(datedayformat(result.d[0].To_Date));
            $('#txtCountryToApplyVisa').val(result.d[0].Country_Apply_Visa);

            LoadMiscEmpType();
            $('#ddlMiscEmpType').val(result.d[0].Employee_Type);
            $('#txtMiscCurrLocation').val(result.d[0].Current_Location);
            $('#txtMiscReqLocation').val(result.d[0].To_Location);
            $('#ddlMiscTransType').val(result.d[0].Transport_Type);
            /*$('#txtMiscFromDateTrans').val(result.d[0].From_Date); */
            $("txtMiscFromDateTrans").val(datedayformat(result.d[0].From_Date));
            /* $('#txtMiscToDateTrans').val(result.d[0].To_Date);*/
            $("txtMiscToDateTrans").val(datedayformat(result.d[0].To_Date));

            $('#txtMiscDateOfChange').val(datedayformat(result.d[0].DateOfChange));

            OnBehalfURL = result.d[0].On_Behalf_URL;
            RequestURL = result.d[0].Attchement_Link;

            reqStatus = result.d[0].Status;
            CurrentOrderNumber = result.d[0].StatusOrder;
            ApplicationId = result.d[0].ReqID;
            WorkFlowID = result.d[0].WorkFlowID;

            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].On_Behalf == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            } else {
                $('#cbEmpOnBehalf').prop('checked', false);
            }

            OnBehalfChange();
            MiscInitialForm();
            SubmitMiscDetForm();
            htmActionButton = "";
            if (parseInt(MyOrderNumber) == parseInt(CurrentOrderNumber) + 1) {

                htmActionButton += `<div class="pull-right">
     <button id="btnApprove" style="background-color:green !important;border-color:green !important" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-check-circle'></i>&nbsp;Approve</button>
        <button id="btnReject" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-x-circle'></i>&nbsp;Reject</button>
    </div>`;

            }
            else {

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
    MyOrderNumber = this.parentNode.parentNode.parentNode.children[1].textContent;
    MyRoleID = this.parentNode.parentNode.parentNode.children[2].textContent;
    getAllBankDetails();
    BankDetReqTypeChange();

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');
    loadEmpDetails();
    loadEmpLoanDetails();

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
        url: "OtherRequests.aspx/GetAllBankDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#lblRequestNumber').html(result.d[0].Req_Number);
            $('#lblStatus').html(result.d[0].Status);
            $('#lblAppID').html(result.d[0].ReqID);

            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            reqEmpno = result.d[0].EmpNo;
            EmpNo= result.d[0].EmpNo;

            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(datedayformat(result.d[0].VisaExpiryDate));
            $('#lblPassExpDate').html(datedayformat(result.d[0].PassportExpireDate));
            $('#lblDateOfJoin').html(datedayformat(result.d[0].JoiningDate));
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(datedayformat(result.d[0].EmiratesExpDate));

            $('#txtBDBasic').val(result.d[0].BASIC);
            $('#txtBDHRA').val(result.d[0].HRAP);
            $('#txtBDCar').val(result.d[0].CARALW);
            $('#txtBDMobile').val(result.d[0].MOBALW);
            $('#txtBDOther').val(result.d[0].OTHALW);

            $('#txtEmpName').html(result.d[0].CreatedBy);
            /*   loadAllEmployees(result.d[0].EmpNo);*/
            $('.on-beh').text('Applied By');
            $('.employee-drop').css('display', 'none');
            $('.employee-text').css('display', '');

            $('#txtEmpNametext').html(result.d[0].CreatedBy);

            $('#txtBDReqNo').val(result.d[0].Req_Number);
            $('#txtBDReqDate').val(datedayformat(result.d[0].CREATEDDATE));
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
            CurrentOrderNumber = result.d[0].StatusOrder;
            ApplicationId = result.d[0].ReqID;
            WorkFlowID = result.d[0].WorkFlowID;

            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].On_Behalf == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            } else {
                $('#cbEmpOnBehalf').prop('checked', false);
            }

            OnBehalfChange();

            htmActionButton = "";
            InitialBankDet();
            SubmitBankDetForm();
            if (parseInt(MyOrderNumber) == parseInt(CurrentOrderNumber) + 1) {

                htmActionButton += `<div class="pull-right">
                                 <button id="btnApprove" style="background-color:green !important;border-color:green !important" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-check-circle'></i>&nbsp;Approve</button>
                                    <button id="btnReject" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-x-circle'></i>&nbsp;Reject</button>
                                </div>`;

            }
            else {

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

function initiateDataTableEmp(pDefCol) {
    objDatatable = [];
    objDatatable = $('.emp-req-table').DataTable({
        dom: 'lBfrtip',
        "bStateSave": true,
        order: [[pDefCol,'desc']],
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

$('#ddlStatus').on('change', function () {

    Type = $('#ddlRequests option:selected').val();

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadRequestData('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

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
                                <input type="text" id="txtStartDate" name="nmReqDet" class="form-control flatpickr-input" />
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
                            <label for="html5-number-input" class="col-form-label label-custom">View/Download Attachment</label>
                           <div style="border: groove;height: 106px;">

                            <div class="input-group mb-3 insert-Attachment" style="margin-top: 24px;">

                                <input class="form-control" type="file" id="fu-leave-req" title="Leave Request" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getFileName()">
                                <label class="input-group-text ml-3" for="fu-leave-req" style="border: transparent;">

                                    <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 49px; margin-top: -10px;" />
                                </label>

                                <input type="text" id="lblLeaveReqFileName" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                            </div>


                             <div class="input-group mb-3 download-Attachment" style="margin-top: 24px;margin-left: 102px;">

                                    <img src="Images/Icon-download.png" id="btnDownloadAttachment" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 60px;" />
<span><i class="bx bxs-show fa-icon-hover btnDownloadAttachment" style="color: #eb9d96;font-size: 1.9rem;margin: -33px 0px 0px 109px;cursor: pointer;" ></i></span>
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
                                <input type="text" id="txtTravellingDate" name="nmReqDet" class="form-control flatpickr-input" />
                            </div>
                        </div>



                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Expected Date Of Return</label>
                            <div>
                                <input type="text" id="txtEptDOReturn" class="form-control flatpickr-input"/>
                            </div>
                        </div>
                                               <div class="col-3 div-Attachment">
                            <label for="html5-number-input" class="col-form-label label-custom">View/Download Attachment</label>

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


                      <div class="row">

                      </div>


                             `

        $('.Leave-Req').html(htm);

    }


    if (Type == 2) {

        htm += `


        <div class="row mb-2 detailsrow" style="">
            <div class="col-12 mt-2 mb-2 bankcard" id="" style="">

                <h5 class="mb-2">
                    <img src="Images/all-request-icon/money.svg" class="me-2"  />
                    Salary Details
                </h5>
                <div class="row">

                    <div class="col-2 bankcard-col">
                        <label>Basic
                            <span id="txtBDBasic">000</span>
                        </label>
                    </div>
                    <div class="col-2 bankcard-col">
                        <label>HRA
                            <span id="txtBDHRA">000</span>
                        </label>
                    </div>
                    <div class="col-2 bankcard-col">
                        <label>Car/Petrol
                            <span id="txtBDCarnPetrol">000</span>
                        </label>
                    </div>
                    <div class="col-2 bankcard-col">
                        <label>Mobile
                            <span id="txtBDMobile">000</span>
                        </label>
                    </div>
                    <div class="col-2 bankcard-col">
                        <label>Food/Others
                            <span id="lbSLFoodnOther">000</span>
                        </label>
                    </div>
                    <div class="col-2 bankcard-col">
                        <label>Total:
                            <span id="lbSLGrossSal">000</span>
                        </label>
                    </div>
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
                        <input type="text" id="txtBDReqamount" name="nmSTL" class="form-control  "  />
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
                    <label for="html5-number-input" class="col-form-label label-custom">View/Download Attachment</label>

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

                <div class="col-3 MiscReason-Area">
                    <label for="html5-number-input" class="col-form-label label-custom">Reason</label>
                    <div>
                        <input type="text" id="txtMiscReason" name="nmMiscControll" class="form-control  "/>
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
                        <input type="text" id="txtMiscFromDate" class="form-control flatpickr-input " />
                    </div>
                </div>

                    <div class="col-3 Date-Period">
                    <label for="html5-number-input" class="col-form-label label-custom">To Date</label>
                    <div>
                        <input type="text" id="txtMiscToDate" class="form-control  flatpickr-input"   />
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
                        <input type="text" id="txtMiscDateOfChange" name="nmMiscControll" class="form-control flatpickr-input"  />
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

                </div>

                <div class="row">
                <div class="col-3 div-Attachment">
                    <label for="html5-number-input" class="col-form-label label-custom">View/Download Attachment</label>

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

                             `

        $('.Leave-Req').html(htm);

    }


    if (Type == 4) {

        htm += `
        <div class="row mb-2 detailsrow" style="">
            <div class="col-12 mt-2 mb-2 me-4 bankcard" id="" style="">

                <h5 class="mb-4">
                    <img src="Images/all-request-icon/money.svg" class="me-2"  />
                    Salary Details
                </h5>
                <div class="row">

                    <div class="col-2 bankcard-col">
                        <label>Basic
                            <span id="txtBDBasic">000</span>
                        </label>
                    </div>
                    <div class="col-2 bankcard-col">
                        <label>HRA
                            <span id="txtBDHRA">000</span>
                        </label>
                    </div>
                    <div class="col-2 bankcard-col">
                        <label>Car/Petrol
                            <span id="txtBDCarnPetrol">000</span>
                        </label>
                    </div>
                    <div class="col-2 bankcard-col">
                        <label>Mobile
                            <span id="txtBDMobile">000</span>
                        </label>
                    </div>
                    <div class="col-2 bankcard-col">
                        <label>Food/Others
                            <span id="lbSLFoodnOther">000</span>
                        </label>
                    </div>
                    <div class="col-2 bankcard-col">
                        <label>Total:
                            <span id="lbSLGrossSal">000</span>
                        </label>
                    </div>
                </div>
            </div>
            <div class="col-12 mb-2 mt-2 bankcard">
                <h5 style="margin-bottom: 0;">
                    <img src="Images/all-request-icon/loan.svg" class="me-2" />
                    Loan Details
                </h5>

                <div class="loan-body">
                    <div class="type">
                    None
                    </div>
                    <div class="remain">Remaining : <span>
                    0<span>
                    </div>
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
                                <input type="number" id="txtNumberofMonth" name="nmCLControll" class="form-control" min="1" max="6"  value="1"/>
                            </div>
                        </div>

                      </div>

                      <div class="row">
                       <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Amount</label>
                            <div>
                                <input type="text" id="txtCLoanAmount" name="nmCLControll" class="form-control"  />
                            </div>
                        </div>

                          <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Monthly Deduction</label>
                            <div>
                                <input type="text" id="txtCLoanMonthlyDed" name="nmCLControll" class="form-control" readonly="readonly"/>
                            </div>
                        </div>

                         <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Reason</label>
                            <div>
                                <input type="text" id="txtCLoanReason" name="nmCLControll" class="form-control  "/>
                            </div>
                        </div>


                       </div>

                        <div class="row">
                       <div class="col-3 div-Attachment">
                            <label for="html5-number-input" class="col-form-label label-custom">View/Download Attachment</label>

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
                                <input type="Text" id="txtLAReqDate" class="form-control flatpickr-input"/>
                            </div>
                        </div>


                          <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Time Arrived</label>
                            <div>
                                <input type="time" id="txtLAreqTime" class="form-control  flatpickr-input"/>
                            </div>
                        </div>


                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Reason For Delay</label>
                            <div>
                                <input type="text" id="txtLAReqReason" class="form-control  "/>
                            </div>
                        </div>
                        <div class="col-3 div-Attachment">
                            <label for="html5-number-input" class="col-form-label label-custom">View/Download Attachment</label>

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


                        <div class="row">

                      </div>


                             `

        $('.Leave-Req').html(htm);

    }


    if (Type == 6) {

        htm += `

        <div class="row">



                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Date</label>
                            <div>
                                <input type="text" id="txtEXTPassDate" class="form-control flatpickr-input" />
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
                                <input type="text" id="txtEXTPassReason" class="form-control  "/>
                            </div>
                        </div>
                    <div class="col-3 div-Attachment">
                            <label for="html5-number-input" class="col-form-label label-custom">View/Download Attachment</label>

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

                        <div class="row">

                      </div>


                             `

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
                <label for="html5-number-input" class="col-form-label label-custom">Reason</label>
                <div>
                    <input type="text" id="txtTikEncashReason" class="form-control  "/>
                </div>
            </div>

            <div class="col-3">
                <label for="html5-number-input" class="col-form-label label-custom">No. Of Ticket(s)</label>
                <div>
                    <input type="number" id="txtNoOfTik" class="form-control" value="0"  min="0" max="30" />
                </div>
            </div>


            <div class="col-3 div-Attachment">
                <label for="html5-number-input" class="col-form-label label-custom">View/Download E-Ticket</label>

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

        <div><h6 style="color: #b70000 !important;"> </h6> </div>
        <div class="row">
                       
        </div>


                             `

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




function CompanyLoanInitialForm() {

    $('#cbEmpOnBehalf').attr('disabled', false);
    $('#txtEmpName').attr('disabled', false);
    $('#empLeaveModal').find('input[name="nmCLControll"]').attr('disabled', false);
    $('#ddlBLLoanType').attr('disabled', false);
}


function GetBasicEmpDet() {

    $.ajax({
        url: "OtherRequests.aspx/GetBasicDetails",
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
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetRefNo() {

    $.ajax({
        url: "OtherRequests.aspx/GetRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            $('#txtReqNo').val(result.d);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadLeaveType() {

    $.ajax({
        url: "OtherRequests.aspx/GetAllLeaveType",
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

            loadLeaveReason();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadLeaveReason() {

    $.ajax({
        url: "OtherRequests.aspx/GetAllLeaveReason",
        data: JSON.stringify({ 'LeaveTypeId': $('#ddlLeaveType option:selected').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var opt = '';
            listLeaveReason = result.d;

            $.each(listLeaveReason, function (key, item) {
                opt += '<option value="' + item.Id + '" >' + item.Value + '</option>';
            });
            $('#ddlLeaveReason').html(opt);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#empLeaveModal').on('change', '#ddlLeaveType', function () {

    selLeaveType = $('#ddlLeaveType option:selected').val();
    loadLeaveReason();
    SetForm();

});


function SetForm() {

    if ($('#ddlLeaveType option:selected').val() == "203") {
        $('.div-EndDate').css('display', '');
        $('.Group-Of-Doc').css('display', '');
        $('.div-Retwork').css('display', '');
        $('.div-Cons-Doc').css('display', '');

        $('.Grop-Of-Det').css('display', 'none');

        $('.Group-Of-Cb').css('display', 'none');
        $('.div-Attachment').css('display', '');
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
        $('.div-Attachment').css('display', 'none');
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
        let endDate = AddDays($('#txtStartDate').val(), $('#txtLeaveReqDay').val());
        $('#txtEndDate').val(endDate)
        let Return = AddDays($('#txtEndDate').val(), "1");
        $('#txtReturnToWork').val(Return)
    }

});

$('#empLeaveModal').on('change', '#txtLeaveReqDay', function () {

    $('#txtEndDate').val('');
    let endDate = AddDays($('#txtStartDate').val(), $('#txtLeaveReqDay').val());
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


    $('#cbEmpOnBehalf').prop('checked', false);
    if ($('#cbEmpOnBehalf').is(':checked')) { $('.onbehalf-controls-div').removeClass('hidden'); $('.onbehalf-controls-div1').removeClass('hidden') }
    else { $('.onbehalf-controls-div').addClass('hidden'); $('.onbehalf-controls-div1').addClass('hidden') }
    $('#txtEmpName').html('');

    $('#txtReqNo').val('');
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
        url: "OtherRequests.aspx/GetApproverAuthorityPeople",
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

                htm += `<tr style="text-align:center;"> 
                    <td> `+ item.STAGE + ` </td>
                    <td> `+ item.APPROVER + ` </td>
                    <td> `+ datedayformat(item.ApprovedDate) + ` </td>
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
    $('#ddlLeaveReason').attr('disabled', false);

    $('#empLeaveModal').find('input[name="nmReqDet"]').attr('disabled', false);


    $('#txtReturnToWork').attr('disabled', false);
    $('#cbIsConsultWithDoc').attr('disabled', false);

    $('#empLeaveModal').find('input[name="nmContactDet"]').attr('disabled', false);
    $('#taRemark').attr('disabled', false);

    $('#empLeaveModal').find('input[name="nmSbReq"]').attr('disabled', false);
}

//function loadAllEmployees(Emp) {
//    $.ajax({
//        url: "OtherRequests.aspx/GetAllEmployees",
//        data: JSON.stringify({ 'EmpNo': EmpNo }),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        success: function (result) {
//            var htm = '<option value="-1">--- Select Employee --- </option> ';
//            empList = result.d;

//            $.each(result.d, function (key, item) {
//                htm += '<option value="' + item.EmpNo + '">  ' + item.EmpNo + ` | ` + item.EmpName + '</option>';
//            });

//            $('#txtEmpName').html(htm);
//            $('#txtEmpName').val(Emp)

//            $("#txtEmpName").select2({
//                dropdownParent: $("#empLeaveModal"),
//                width: '100%',
//                height: '100%'
//            });
//            OwnerNo = $('#txtEmpName option:selected').val();
//            OwnerName = $('#txtEmpName option:selected').text();


//        },
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//}

$('#empLeaveModal').on('change', '#cbEmpOnBehalf', function () {

    OnBehalfChange();

    if (Type == 2 || Type == 4) {

        BasicSalDetView();
    }
});

function BasicSalDetView() {

    if ($('#cbEmpOnBehalf').is(':checked')) {
        if ($('#txtEmpName').html() == EmpNo) {
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

//$('#empLeaveModal').on('change', '#txtEmpName', function () {

//    if (Type == 2) {

//        BasicSalDetView();
//    }

//});

function OnBehalfChange() {

    if ($('#cbEmpOnBehalf').is(':checked')) { $('.onbehalf-controls-div').removeClass('hidden'); $('.onbehalf-controls-div1').removeClass('hidden') }
    else { $('.onbehalf-controls-div').addClass('hidden'); $('.onbehalf-controls-div1').addClass('hidden') }
}



$('.ActionButtons').on('click', '#btnApprove', function () {
    Action = "APPROVED";
    $("#txtActionComments").val("");
    $('#mpAction').modal('show');
});
$('.ActionButtons').on('click', '#btnReject', function () {
    Action = "REJECTED";
    $("#txtActionComments").val("");
    $('#mpAction').modal('show');
    toastr.info('Please enter remarks with the reason of rejection.')
});

$('.btn-Update-Action').on('click', function () {
    if (Action == "REJECTED" && $("#txtActionComments").val() == "") {
        toastr.error('You cannot leave remarks empty when the action is REJECT. Please enter remarks.')
    }
    else {
        $.ajax({
            url: "OtherRequests.aspx/UpdateActionRequest",
            data: JSON.stringify({
                "ReqID": ApplicationId,
                "ReqType": $('#ddlRequestType option:selected').val(),
                "WorkFLowID": WorkFlowID,
                "OrderNumber": MyOrderNumber,
                "RoleID": MyRoleID,
                "Action": Action,
                "Comments": $("#txtActionComments").val(),
                "UserID": currUserId,

            }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                if (result.d[0].Action == "Reject" && $("#txtActionComments").val() == "") {
                    toastr.error('You cannot leave remarks empty when the action is REJECT. Please enter remarks.')
                }
                else {
                    if (result.d == "Success") {
                        toastr.success('Request Updated Successfully', '');
                        $('.ajax-loader').removeClass('hidden');

                        setTimeout(function () {
                            Type = $("#ddlRequests option:selected").val();
                            LoadRequestData('Please Wait...');
                            $(".ajax-loader").addClass('hidden');
                        }, 500);
                        GetBasicEmpDet();
                        ApplicationId = 0;
                        Action = '';
                        MyOrderNumber = 0;
                        MyRoleID = 0;
                        CurrentOrderNumber = 0;
                        $("#empLeaveModal").modal("hide");
                        $("#mpAction").modal("hide");
                    }
                    else {
                        toastr.error(result.d);

                    }
                }

            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }


});



$('.tbody-emp-req').on('click', '.ibtn-leave-req-info', function () {

    Type = $('#ddlRequests option:selected').val();

    $('#ddlRequestType').val('0');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearDetails();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    MyOrderNumber = this.parentNode.parentNode.parentNode.children[1].textContent;
    MyRoleID = this.parentNode.parentNode.parentNode.children[2].textContent;
    GetAllDetails();
    SetForm();
    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');

    //For Rectangle Box


});

function GetAllDetails() {

    $.ajax({
        url: "OtherRequests.aspx/GetAllDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#lblRequestNumber').html(result.d[0].LEAVE_APPLICATION_NO);
            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            reqEmpno=result.d[0].EmpNo;
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(datedayformat(result.d[0].VisaExpiryDate));
            $('#lblPassExpDate').html(datedayformat(result.d[0].PassportExpireDate));
            $('#lblDateOfJoin').html(datedayformat(result.d[0].JoiningDate));
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(datedayformat(result.d[0].EmiratesExpDate));

            /* loadAllEmployees(result.d[0].EmpNo);*/
            $('#txtEmpName').html(result.d[0].CreatedBy);
            reqStatus = result.d[0].Status;
            CurrentOrderNumber = result.d[0].CurrentOrderNumber;
            WorkFlowID = result.d[0].WorkFlowID;

            $('.on-beh').text('Applied By');
            $('.employee-drop').css('display', 'none');
            $('.employee-text').css('display', '');

            $('#txtEmpNametext').html(result.d[0].CreatedBy);
            $('#txtReqNo').val(result.d[0].LEAVE_APPLICATION_NO);

            $('#ddlLeaveType').val(result.d[0].LEAVE_TYPE_ID);
            loadLeaveReason();
            $('#ddlLeaveReason option:selected').text(result.d[0].REASON);

            $('#txtStartDate').val(datedayformat(result.d[0].FROM_DATE));
            $('#txtEndDate').val(datedayformat(result.d[0].TO_DATE));
            $('#txtReturnToWork').val(datedayformat(result.d[0].RETURNED_TO_WORK));
            /*$('#txtStartDate').val(result.d[0].FROM_DATE.split(" ")[0]);*/
            //document.getElementById("txtStartDate").valueAsDate = datedayformat(result.d[0].FROM_DATE);
            /* $('#txtEndDate').val(result.d[0].TO_DATE.split(" ")[0]);*/
            //document.getElementById("txtEndDate").valueAsDate = datedayformat(result.d[0].TO_DATE);
            $('#txtLeaveReqDay').val(result.d[0].LEAVE_REQ_DAYS);
            /*  $('#txtReturnToWork').val(result.d[0].RETURNED_TO_WORK.split(" ")[0]);*/
            //document.getElementById("txtReturnToWork").valueAsDate = datedayformat(result.d[0].RETURNED_TO_WORK);

            if (result.d[0].CONSULTED_DOCTER == "True") {

                $('#cbIsConsultWithDoc').prop('checked', true);
                $('#txtEmpName').html(result.d[0].CreatedBy);

            }

            $('#txtPrimaryContact').val(result.d[0].CONTACT_MOBNO_WOL);
            $('#txtSecContact').val(result.d[0].CONTACT_TELNO_WOL);
            $('#txtContactName').val(result.d[0].CONTACT_NAME_WOL);
            $('#txtContactEmail').val(result.d[0].CONTACT_EMAIL_WOL);
            $('#taRemark').val(result.d[0].OTHER_REASON);
            $('#taRemark').val(result.d[0].EMP_REMARKS);
            $('#txtLeaveBal').val(result.d[0].LEAVE_BALANCE);

            OnBehalfURL = result.d[0].On_BehalfURL;
            RequestURL = result.d[0].RequestURL;

            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', '');
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
            SubmitForm();
            htmActionButton = "";
            if (parseInt(MyOrderNumber) == parseInt(CurrentOrderNumber) + 1 && reqStatus != "REJECTED") {

                htmActionButton += `<div class="pull-right">
                 <button id="btnApprove" style="background-color:green !important;border-color:green !important" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-check-circle'></i>&nbsp;Approve</button>
                    <button id="btnReject" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-x-circle'></i>&nbsp;Reject</button>
                </div>`;

            }
            else {

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
    $('#ddlLeaveReason').attr('disabled', true);

    $('#empLeaveModal').find('input[name="nmReqDet"]').attr('disabled', true);

    $('#txtReturnToWork').attr('disabled', true);
    $('#cbIsConsultWithDoc').attr('disabled', true);

    $('#empLeaveModal').find('input[name="nmContactDet"]').attr('disabled', true);
    $('#taRemark').attr('disabled', true);

    $('#empLeaveModal').find('input[name="nmSbReq"]').attr('disabled', true);




}


$('#empLeaveModal').on('click', '#btnDownloadOBAtt', function () {

    if (OnBehalfURL != '') {

        //window.location = 'https://crmss.naffco.com/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + OnBehalfURL;
        window.location = '/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + OnBehalfURL;

    }

});
$('#empLeaveModal').on('click', '.btnDownloadOBAtt', function () {

    if (OnBehalfURL != '') {
        initiatePDFView(OnBehalfURL);
    } else {
        toastr.error('No file for preview.')
    }

});

$('#empLeaveModal').on('click', '#btnDownloadAttachment', function () {

    if (RequestURL != '') {

        //window.location = 'https://crmss.naffco.com/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + RequestURL;
        window.location = '/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + RequestURL;

    }

});

$('#empLeaveModal').on('click', '.btnDownloadAttachment', function () {

    if (RequestURL != '') {
        initiatePDFView(RequestURL);
    } else {
        toastr.error('No file for preview.')
    }
});

function initiatePDFView(fileLink) {
   
    var _pdflink = fileLink; //"\\\\zylab\\Econnect\\Recruitment\\RRFRequest\\test_png_file.png" //this.parentNode.parentNode.parentNode.children[0].textContent;
    document.getElementById('myIframe').src = "Services/Fileviewer.ashx?attachurl=" + _pdflink;
    $('#mpPdfviewer').modal('show');

}


function loadPPTReason() {

    $.ajax({
        url: "OtherRequests.aspx/GetAllPPTReasons",
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
        url: "OtherRequests.aspx/GetPPTRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            $('#txtPPTReqNo').val(result.d);

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
        url: "OtherRequests.aspx/GetAllPPTOtherReasons",
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
    $('#txtEmpName').html('');

    $('#txtPPTReqNo').val('');
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

}

$('.tbody-emp-req').on('click', '.ibtn-PPT-req-info', function () {


    Type = $('#ddlRequests option:selected').val();
    $('#ddlRequestType').val('1');
    $('#ddlRequestType').attr('disabled', true);
    RequestPageLoad();
    ClearPPTDetails();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    MyOrderNumber = this.parentNode.parentNode.parentNode.children[1].textContent;
    MyRoleID = this.parentNode.parentNode.parentNode.children[2].textContent;
    getAllPPTDetails();
  

    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');



    //For Rectangle Box


});


function getAllPPTDetails() {

    $.ajax({
        url: "OtherRequests.aspx/GetAllPPTDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#lblRequestNumber').html(result.d[0].Req_Number);
            $('#lblStatus').html(result.d[0].Status);
            $('#lblAppID').html(result.d[0].ReqID);

            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            reqEmpno = result.d[0].EmpNo;
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(datedayformat(result.d[0].VisaExpiryDate));
            $('#lblPassExpDate').html(datedayformat(result.d[0].PassportExpireDate));
            $('#lblDateOfJoin').html(datedayformat(result.d[0].JoiningDate));
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(datedayformat(result.d[0].EmiratesExpDate));

            $('#txtEmpName').html(result.d[0].CreatedBy);
           /* loadAllEmployees(result.d[0].EmpNo);*/
            $('.on-beh').text('Applied By');
            $('.employee-drop').css('display', 'none');
            $('.employee-text').css('display', '');

            $('#txtEmpNametext').html(result.d[0].CreatedBy);
            $('#txtPPTReqNo').val(result.d[0].Req_Number);
            loadPPTReason();

            $('#ddlPPTReason').val(result.d[0].ReasonValue);
            $('#ddlPPTReason').trigger('change');
            $('#ddlPPTOtherReason').val(result.d[0].OtherReason);
            $("#txtTravellingDate").val(datedayformat(result.d[0].Travelling_Date));
            $("#txtEptDOReturn").val(datedayformat(result.d[0].Expected_Date_Of_Return));


            OnBehalfURL = result.d[0].On_Behalf_URL;
            RequestURL = result.d[0].Attchement_Link;

            reqStatus = result.d[0].Status;
            ApplicationId = result.d[0].ReqID;
            CurrentOrderNumber = result.d[0].CurrentOrderNumber;
            WorkFlowID = result.d[0].WorkFlowID;





            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt,.btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment,.btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].On_Behalf == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            } else {
                $('#cbEmpOnBehalf').prop('checked', false);
            }

            OnBehalfChange();
            PPTInitialForm();
            SubmitPPTForm();
            htmActionButton = "";
            if (parseInt(MyOrderNumber) == parseInt(CurrentOrderNumber) + 1 && reqStatus != "REJECTED") {

                htmActionButton += `<div class="pull-right">
                 <button id="btnApprove" style="background-color:green !important;border-color:green !important" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-check-circle'></i>&nbsp;Approve</button>
                    <button id="btnReject" type="button" class="btn btn-primary btnTagTemp"><i class='bx bxs-x-circle'></i>&nbsp;Reject</button>
                </div>`;

            }
            else {

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

}

function loadBDRequestType() {

    $.ajax({
        url: "OtherRequests.aspx/GetBDRequestType",
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
        url: "OtherRequests.aspx/GetBDREasons",
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
    $('#txtEmpName').html('');

    $('#txtPPTReqNo').val('');
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
        url: "OtherRequests.aspx/GetBDRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            const BDVal = result.d.split(',');
            let BDRefNo = BDVal[0];
            let BDReqDate = BDVal[1];

            $('#txtBDReqNo').val(BDRefNo);
            $('#txtBDReqDate').val(datedayformat(BDReqDate));

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetMiscRefNo() {

    $.ajax({
        url: "OtherRequests.aspx/GetMiscRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            const BDVal = result.d.split(',');
            let MiscRefNo = BDVal[0];
            let MiscReqDate = BDVal[1];

            $('#txMiscReqNo').val(MiscRefNo);
            $('#txtMiscReqDate').val(datedayformat(MiscReqDate));

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
        url: "OtherRequests.aspx/GetBasicSalDet",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            loadEmpDetails();
            loadEmpLoanDetails();
            $('#txtBDBasic').val(result.d[0].BASIC);
            $('#txtBDHRA').val(result.d[0].HRAP);
            $('#txtBDCar').val(result.d[0].CARALW);
            $('#txtBDMobile').val(result.d[0].MOBALW);
            $('#txtBDOther').val(result.d[0].OTHALW);



        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function GetBDSTLDet() {



    $.ajax({
        url: "OtherRequests.aspx/GetBDSTDet",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            const BankDet = result.d.split(',');
            let BankName = BankDet[0];
            let IBAN = BankDet[1];

            $('#txtBDBankName').val(BankName);
            $('#txtBDIBANNo').val(IBAN);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



function loadMiscRequestType() {

    $.ajax({
        url: "OtherRequests.aspx/GetMiscRequestType",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
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

    if ($('#ddlMiscReqType option:selected').text() == 'Salary Certificate(No Bank)') {

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

    else if ($('#ddlMiscReqType option:selected').text() == 'Experience Certificate') {

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

    else if ($('#ddlMiscReqType option:selected').text() == 'Employment Certificate') {

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

    else if ($('#ddlMiscReqType option:selected').text() == 'JAFZA Certificate') {

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

    else if ($('#ddlMiscReqType option:selected').text() == 'No Objection Certificate For Business') {

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

    else if ($('#ddlMiscReqType option:selected').text() == 'No Objection Certificate For Personal Purpose') {

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

    if ($('#ddlMiscReqType option:selected').text() == 'Other Request') {

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

    if ($('#ddlMiscReqType option:selected').text() == '10012') {

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
        url: "OtherRequests.aspx/GetBDREasons",
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
        url: "OtherRequests.aspx/GetBDREasons",
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

    $('#txMiscReqNo').val('');
    $('#txtMiscReqDate').val('');
    $('#empLeaveModal').find('input[name="nmMiscControll"]').val('');


}

function MiscInitialForm() {
    $('#cbEmpOnBehalf').attr('disabled', false);
    $('#txtEmpName').attr('disabled', false);
    $('#empLeaveModal').find('input[name="nmMiscControll"]').attr('disabled', false);
    $('#ddlMiscReqType').attr('disabled', false);
    $('#ddlMiscReason').attr('disabled', false);
    $('#ddlMiscEmpType').attr('disabled', false);
    $('#ddlMiscTransType').attr('disabled', false);

    $('#txtMiscFromDate').attr('disabled', false);
    $('#txtMiscToDate').attr('disabled', false);
    $('#txtMiscFromDateTrans').attr('disabled', false);
    $('#txtMiscToDateTrans').attr('disabled', false);

}



function GetCLoanRefNo() {

    $.ajax({
        url: "OtherRequests.aspx/GetCLoanRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            const BDVal = result.d.split(',');
            let CLoanRefNo = BDVal[0];
            let CLoanReqDate = BDVal[1];

            $('#txtCLoanReqNo').val(CLoanRefNo);
            $('#txtCLoanReqDate').val(datedayformat(CLoanReqDate));

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetLAReqRefNo() {

    $.ajax({
        url: "OtherRequests.aspx/GetLAReqRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            const BDVal = result.d.split(',');
            let LAReqRefNo = BDVal[0];
            let LAReqDate = BDVal[1];

            $('#txLAReqNo').val(LAReqRefNo);
            /*  $('#txtCLoanReqDate').val(CLoanReqDate.split(' ')[0]);*/

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetEPReqRefNo() {

    $.ajax({
        url: "OtherRequests.aspx/GetEPReqRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            const BDVal = result.d.split(',');
            let EPReqRefNo = BDVal[0];
            let EPReqDate = BDVal[1];

            $('#txtEXTPassNo').val(EPReqRefNo);
            /*  $('#txtCLoanReqDate').val(CLoanReqDate.split(' ')[0]);*/

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


$('#empLeaveModal').on('change', '#ddlBLLoanType', function () {

    $('#txtCLoanMonthlyDed').val($('#txtBDHRA').text());
    CompanyLoanTypeFormat();

});

function CompanyLoanTypeFormat() {
    if ($('#ddlBLLoanType').val() == 'HRA') {
        $(".divnumberofMonth").css('display', '');
        
        $('#txtCLoanMonthlyDed').attr('disabled', false);
        $('#txtCLoanAmount').attr('disabled', true);
        const dt = new Date();
        var day = ("0" + dt.getDate()).slice(-2);
        var month = ("0" + (dt.getMonth())).slice(-2);
        var date;

        if (RemainingHRAAdvance > 0) {
            var RemaingMonths = 0;
            RemaingMonths = parseInt(RemainingHRAAdvance) / parseInt($("#txtCLoanMonthlyDed").val());
            if (RemaingMonths == 1) {
                month = ("0" + (dt.getMonth() + 2)).slice(-2);
                date = dt.getFullYear() + "-" + month;
                $("#txtCLoanDedStartMonth").val(date);
                
            }
            else if (RemaingMonths > 2) {
                toastr.error('You are not eligible to go for HRA Advance since you have more than two months pending .. ');
                $("#txtNumberofMonth").prop("max", 5);
            }
            else {
                month = ("0" + (dt.getMonth() + 1)).slice(-2);
                date = dt.getFullYear() + "-" + month;
                $("#txtCLoanDedStartMonth").val(date);
            }
        }

    }

    else if ($('#ddlBLLoanType').val() == 'Salary Advance') {
        $('#txtCLoanMonthlyDed').val('0');
        $('#txtCLoanAmount').val('0');
        $('#txtCLoanMonthlyDed').attr('disabled', true);
        $('#txtCLoanAmount').removeAttr('disabled', false);

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

    $('#txtCLoanReqNo').val('');
    $('#txtCLoanReqDate').val('');
    $('#empLeaveModal').find('input[name="nmCLControll"]').val('');
    $('#empLeaveModal').find('input[name="nmBDBasicSalDet"]').val('');
    $('#ddlBLLoanType').val('HRA');




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

    $('#txLAReqNo').val('');
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

    $('#txtEXTPassNo').val('');
    $('#txtEXTPassReason').val('');
    $('#ddlEXTPassType option:selected').val('0');


}

function LateAttendanceInitialForm() {
    $('#cbEmpOnBehalf').attr('disabled', false);
    $('#txtEmpName').attr('disabled', false);
    $('#txtLAReqDate').attr('disabled', false);
    $('#txtLAreqTime').attr('disabled', false);
    $('#txtLAReqReason').attr('disabled', false);

}

function ExitPassInitialForm() {
    $('#cbEmpOnBehalf').attr('disabled', false);
    $('#txtEmpName').attr('disabled', false);
    $('#txtEXTPassDate').attr('disabled', false);
    $('#ddlEXTPassType').attr('disabled', false);
    $('#txtEXTPassOutTime').attr('disabled', false);
    $('#txtEXTPassBackTime').attr('disabled', false);
    $('#txtEXTPassReason').attr('disabled', false);

}

$('#ddlRequestType').on('change', function (ApplicationId) {

    Type = $('#ddlRequestType option:selected').val();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    var Exist = ApplicationId;
    $('#AddNewReq').trigger('click', Exist);

});

function loadEmpDetails() {

    $.ajax({
        url: "Profile.aspx/GetEmpInfo",
        data: JSON.stringify({ "EmpNo": reqEmpno }),
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

            $('#txtBDBasic').html(result.d[0].BASIC);
            $('#txtBDMobile').html(result.d[0].MOBALW);
            $('#txtBDOther').html(result.d[0].OTHALW);
            $('#lbSLFood').html(result.d[0].FOODALW);
            $('#txtBDHRA').html(result.d[0].HRAP);
            $('#txtBDCar').html(result.d[0].CARALW);

            $('#txtBDCarnPetrol').html(parseInt(result.d[0].CARALW) + parseInt(result.d[0].TRANSALW));

            $('#lbSLFoodnOther').html(parseInt(result.d[0].FOODALW) + parseInt(result.d[0].OTHALW));

            if (result.d[0].TransProvided == 'checked') {

                $('#cbTransportProv').prop('checked', true);
            }
            else {
                $('#cbTransportProv').prop('checked', false);
            }

            $('#lbSLTransport').html(result.d[0].TRANSALW);
            //$('#txtBDHRA').html(result.d[0].HRAA);
            $('#lbSLCompanyCar').html("N/A");
            $('#lbSLLastSal').html("N/A");
            let gross = parseInt(result.d[0].TRANSALW) + parseInt(result.d[0].BASIC) + parseInt(result.d[0].MOBALW) + parseInt(result.d[0].FOODALW) + parseInt(result.d[0].HRAP) + parseInt(result.d[0].CARALW) + parseInt(result.d[0].OTHALW);
            $('#lbSLGrossSal').html(gross);

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
        data: JSON.stringify({ "EmpNo": reqEmpno }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $.each(result.d, function (key, item) {
                htm += `<div class="loan-item"><div class="type">` + item.LTYPE + `  </div>
                <div class="remain"> Remaining :<span>  `+ item.REMAINING + `</span></div>`
                htm += `</div>`
                if (result.d[0].LTYPE == "Housing") {
                    RemainingHRAAdvance = result.d[0].REMAINING
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
    if (myroleList.includes("13189") || myroleList.includes("13188") || myroleList.includes("13186") || myroleList.includes("13185") || myroleList.includes("13166") || myroleList.includes("13165") || myroleList.includes("13171") || myroleList.includes("13170") || myroleList.includes("13192")) {
        $(".detailsrow").css("display", "flex")
    }
    else {
        $(".detailsrow").css("display", "none")
    }
}

function datedayformat(dt) {
    if (dt != null && dt != '') {
        return (new Date(dt).getDate() + '-' + monthsbyName[new Date(dt).getMonth()] + '-' + new Date(dt).getFullYear() + ', ' + day[new Date(dt).getDay()]);
    }
    else {
        return '';
    }
}






