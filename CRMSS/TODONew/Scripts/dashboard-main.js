//var growthChartEl;

var pChartObj = [];
var payTermChartObj = [];
var pChartOpenClosePOObj = [];

var growthChartElcc;
var growthChart;

var totalRevenueChartElcc;
var totalRevenueChart;

var overViewChartcc;
var overViewChart;

var forecastedOppViewChartcc;
var forecastedOppViewChart;

var futureForecastedOppViewChartcc;
var futureForecastedOppViewChart;

var pendingForecastedOppViewChart;

var barChartForFinalizationCard, barChartForPipelineCard;
var barChartForLostByCompitOrvalue;

var arrayForFinalizedBarChartX_Axis = [], arrayForFinalizedBarChartY_Axis = [], arrayForPipelineBarChartX_Axis = [], arrayForPipelineBarChartY_Axis = [];
var barChartForLostByCompitOrvalueX_Axis = [], barChartForLostByCompitOrvalueY_Axis = [];
var arrOverViewChart = [], arrForecastOppChart = [], arrFutureForecastOppChart = [];
var arrTenderOverViewChart = [];
var arrHoldOverViewChart = [];
var arrAchiechedPercValueForGC1 = [], arrAchiechedPercValueForGC2 = [], arrAchiechedPercValueForGC3 = [], arrAchiechedPercValueForGC4 = [], arrAchiechedPercValueForGC5 = [], arrAchiechedPercValueForGC6 = [];

var arrForGCSaleEmp4 = [];
var arrForGCSaleEmp5 = [];
var arrForGCSaleEmp6 = [];
var arrForGCSaleEmp1 = [];
var arrForGCSaleEmp2 = [];
var arrForGCSaleEmp3 = [];

var overAllPerfo = 0;
var arrOverallPerf = [];

var totalTaskC = 0, pendingTaskC = 0, compTaskC = 0, overdueTaskC = 0;

let cardColor, headingColor, axisColor, shadeColor, borderColor;
let profitBarColor = '#64c345', lossBarColor = '#cf4848', yearPercValueForGrowthGraph = [];
//let profitBarColor = '#0B9747'
var profitArray = [], lossArray = [], MonthArrayGraph = [];
const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
var colorsForPieChart = ["#ffab00", "#00a7ff", "#77b962", "#e36535", "#4d23e6", "#14d080", "#a67ff9", "#0e2eb5", "#9eb50e", "#e62b2b", "#4a4f56", "#2bd6e6", "#848080", "#ff85cf"]; //11 ->#e6972b
var securedValueForOverview = '', securedValueForecastOpp = 0, securedValueFuturForecastOpp = 0, securedValuePendingForecastOpp = 0;
var securedValueForTenderOverview = '', securedValueForHoldOverview = '';

var orderChartConfig = [], orderChartTenderConfig = [], orderChartHoldConfig = [];
var overViewChart, overViewTenderChart, overViewHoldChart;

cardColor = config.colors.white;
headingColor = config.colors.headingColor;
axisColor = config.colors.axisColor;
borderColor = config.colors.borderColor;

var TodoProjectRoles = [
    { 'RoleId': '1', 'RoleName': 'Project Manager' },
    { 'RoleId': '2', 'RoleName': 'Project Coordinator' },
    { 'RoleId': '3', 'RoleName': 'Team Leader' },
    { 'RoleId': '4', 'RoleName': 'Team Member' }
]

var compId = '';
var manId = '';
var salesmanId = '';

var arrExInternalChart = [];
var arrayForExpConChartX_Axis = []; arrayForExpConChartY_Axis = [];

var barChartForCheqDueCard = [];
var arrayForCHeqDueChartX_Axis = [], arrayForCHeqDueChartY_Axis = [];

var growthChartEmpOverAll = [];

var listCountSalesOrder = [], listCountInvoice = [], listCountCollection = [];
var listSOCompare = [], listInvoiceCompare = [], listCollectionCompare = [], listSOGrowth = [], listInvoiceGrowth = [], listCollectionGrowth = [];





var listTaskStatusCount = [];
var listTaskPrioriyWiseForBarGraph = []
var listTaskAnalysisForGraph = [];
var listPendingTaskAging = [];
var listInvlovedProjects = [];
var listOpenClosedProj = [];
var listSOInvCollGraphVal = [];
var listPaymentTerm = [];
var listPOItemLevel = [];
var listTopRepeatItems = [];

var TicketRoundChartObj = [], arrTicketRoundChart = [];
var ContainerRoundChartObj = []; arrContainerRoundChart = [];
var popupTest;
var map;
var totalCountDBrd = 0, totalValueDBrd = 0;

var dpContractStart = [], dpContractEnd = [];

var currUserRoleValidate = '';
var selTicType = '-1';
$(document).ready(function () {
    //fillYearDropdown();
    //initiatePieChart()

    dpContractStart = flatpickr(jQuery("#weeklyDatePickerStart"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: new Date(new Date().setMonth(new Date().getMonth() - 6)),//"today",
        enableTime: false,
        noCalendar: false,
        //mode: "range",
        //dateFormat: "Y-m-d",
        onChange: function (selectedDates, dateStr, instance) {


        }
    });
    //theme date picker start
    dpContractEnd = flatpickr(jQuery("#weeklyDatePickerEnd"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);
        }],
        defaultDate: new Date(new Date().setMonth(new Date().getMonth())),//"today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {
            // hfldDate.val($('#weeklyDatePickerEnd').val());
        }

    });
    

    roleListData = [];
    var roles = rolesList.split(',');
    for (var i = 0; i < roles.length; i++) {

        roleListData.push({ Roles: roles[i] });
    }
    

    $('#ddlMonth').val(new Date().getMonth()+1);
    $('#ddlYear').val(new Date().getFullYear());

    $('#growthReportId').html(new Date().getFullYear());

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        getAllCompany();
        getAllDashboardDataValues();
        GetStatusAndCountsForGraphs();
        GetTopSalesman();
    }, 500);

    $('.navnew li').css('border-bottom', '4px #aaa solid');
    $('.navnew li a').css('color', 'white');

    $.each($('.navnew li'), function (key, item) {
        if (item.textContent.trim() == 'Dashboard') {
            $('.navnew li:eq(' + key + ')').css('border-bottom', '4px #eee249 solid');
            $('.navnew li:eq(' + key + ') a').css('color', '#eee249');
        }
        //$('.navnew li:eq(1)').css('border-bottom', '4px #aaa solid');
    });
});

function getCompniesFromDDL() {
    var compnies = '';
    for (var i = 0; i < $('#ddlCompany option:selected').length; i++) {
        compnies += $('#ddlCompany option:selected')[i].text.trim() + ',';
    }
    return compnies.substring(0, compnies.lastIndexOf(","));
}

function getAllCompany() {

    $.ajax({
        url: "DashboardMain.aspx/GetAllCompanies",
        data: JSON.stringify({ 'UserId': currUserId.val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            let res = result.d;
            var htm = '';
            $.each(result.d, function (key, item) {
                htm += item.Value == "Local Sales" ? '<option value="' + item.Value + '" selected> ' + item.Name + ' </option>' : '<option value="' + item.Value + '"> ' + item.Name + ' </option>';

            });
            $('#ddlCompany').html(htm);
            $('#ddlCompany').multiSelect();
            fillManagerDropdown();
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

$('#ddlCompany').on('change', function () {
    fillManagerDropdown();
});
$('#ddlManager').on('change', function () {
    loadTeamMembers();
});

function fillManagerDropdown() {

    $.ajax({
        url: "DashboardMain.aspx/GetManagers",
        data: JSON.stringify({ 'UserId': currUserId.val(), 'Company': getCompniesFromDDL() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            let res = result.d;
            var htm = '<option value="-1" >ALL</option>';
            $.each(res, function (key, item) {
                htm += item.EmpNo == '300000002310385' ? '<option value="' + item.EmpNo + '" selected>' + item.EmpName + '</option>' :'<option value="' + item.EmpNo + '" >' + item.EmpName + '</option>';
            });
            $('#ddlManager').html(htm);

            loadTeamMembers();
            //toastr.success('Fecth Successfully', 'Successfull');
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function loadTeamMembers() {

    $.ajax({
        url: "DashboardMain.aspx/GetTeamMembers",
        data: JSON.stringify({ 'UserId': currUserId.val(), 'Company': getCompniesFromDDL(), 'selManId': $('#ddlManager option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            let res = result.d;
            var htm = '<option value="-1" >ALL</option>';
            //htm += $('#ddlManager option:selected').val() != '-1' ? '<option value="' + $('#ddlManager option:selected').val() + '"> ' + $('#ddlManager option:selected').text().trim() + '</option>' : '';
            $.each(res, function (key, item) {
                htm += item.EmpNo == '300000002310385' ? '<option value="' + item.EmpNo + '" selected>' + item.EmpName + '</option>' : '<option value="' + item.EmpNo + '" >' + item.EmpName + '</option>';
            });

            $('#ddlSalesman').html(htm);

            //GetStatusAndCountsForGraphs();
            //GetTopSalesman();
            loadUserDetails();            
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}


$('.cb-ytd-filter').on('click', function () {
    if ($(this).is(':checked')) {
        $('#ddlMonth').prop('disabled', true);
    } else {
        $('#ddlMonth').prop('disabled', false);
    }
})



$('#btnSearchDashBoard').on('click', function () {
   
    loadUserDetails();

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        $.fn.getCountAndValuesFor8Boxes();
        GetStatusAndCountsForGraphs();
        GetTopSalesman();
    }, 500);
    
});




function getAllDashboardDataValues() {

    overAllPerfo = 0;
    arrOverallPerf = [];

    // Purchase Dashboard work
    $.fn.getCountAndValuesFor8Boxes();

    // Purchase Dashboard work End here

}

$('.dbSwitcher').on('click', 'li', function () {
    $('.tic-closed-count, .tic-accepted, .tic-pending, .tic-created, .tic-rejected').html(0);


    if ($('.dbSwitcher li .active').text().trim() == 'Logistic') {
        $('.tic-filter-td').addClass('hidden');
        selTicType = '-1';
    } else {
        $('.tic-filter-td').removeClass('hidden');
        selTicType = EmpNo;
    }

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        $.fn.getCountAndValuesFor8Boxes();

    }, 500);

});

$('#ddlTicketType').on('change', function () {
    selTicType = $('#ddlTicketType option:selected').val() == 'My_Ticket' ? EmpNo : -1;
});

$.fn.getCountAndValuesFor8Boxes = function () {


    $.ajax({
        url: "DashboardMain.aspx/GetStatusAndCountsForTopBox",
        data: JSON.stringify({
            'EmpNo': $('#ddlSalesman option:selected').val(),
            'CreatedDate': FormateDate(new Date()),
            'Month': $('.cb-ytd-filter').is(':checked') == true ? 0 : $('#ddlMonth option:selected').val(),
            'Year': $('#ddlYear option:selected').val(),
            'SalesmanId': $('#ddlSalesman option:selected').val().trim(),
            'ManagerId': $('#ddlManager option:selected').val().trim(),
            'Company': getCompniesFromDDL()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $(".ajax-loader").fadeOut(500);

            listCountSalesOrder = result.d.listCountSalesOrder;
            listCountInvoice = result.d.listCountInvoice;
            listCountCollection = result.d.listCountCollection;


            listTaskStatusCount = result.d.listTaskStatusCount;
            listTaskPrioriyWiseForBarGraph = result.d.listTaskPrioriyWiseForBarGraph;
            listTaskAnalysisForGraph = result.d.listTaskAnalysisForGraph;
            listPendingTaskAging = result.d.listPendingTaskAging;
            listInvlovedProjects = result.d.listInvlovedProjects;
            listOpenClosedProj = result.d.listOpenClosedProj;
            listSOInvCollGraphVal = result.d.listSOInvCollGraphVal;
           

            $('.box-val-sototal,.box-val-soentered,.box-val-sobooked,.box-val-soclosed,.box-val-so-totalinvoice,.box-val-so-invoicamount,.box-val-so-pendingforinvoice,.box-val-so-totalreceipt,.box-val-so-pendueinvoice,.box-val-so-pennotdueinvoice,.box-val-so-penforinvoice').html('0');
                                                                                        
            //For SO
            $.each(listCountSalesOrder, function (key, item) {
                
                $('.box-val-sototal').html(nFormatter(parseInt(item.Total)));
                $('.box-val-soentered').html(nFormatter(parseInt(item.EnteredValue)));
                $('.box-val-sobooked').html(nFormatter(parseInt(item.BookedValue)));
                $('.box-val-soclosed').html(nFormatter(parseInt(item.ClosedValue)));

                let totConfrmInv = parseInt(item.BookedValue) + parseInt(item.ClosedValue);
                $('.box-val-so-totalinvoice').html(nFormatter(totConfrmInv));
                $('.box-val-so-invoicamount').html(nFormatter(parseInt(item.TotalInvoice)));
                $('.box-val-so-pendingforinvoice').html(nFormatter(totConfrmInv - parseInt(item.TotalInvoice)));

                $('.box-val-so-totalreceipt').html(nFormatter(parseInt(item.TotalInvoice)));
                $('.box-val-so-pendueinvoice').html(nFormatter(parseInt(item.PendingDue)));
                $('.box-val-so-pennotdueinvoice').html(nFormatter(parseInt(item.PendingNotDue)));
                $('.box-val-so-receiptamount').html(nFormatter(parseInt(item.ReceiptAmount)));                

            });


            //FOR Invoice
            $.each(listCountInvoice, function (key, item) {

                $('.box-val-totinvoice').html(nFormatter(parseInt(item.InvoiceAmount)));
                $('.box-val-collected').html(nFormatter(parseInt(item.ReceiptAmount)));
                $('.box-val-notcollected').html(nFormatter(parseInt(item.PendingForReceipt)));

                $('.box-val-inv-penforcoll').html(nFormatter(parseInt(item.PendingForReceipt)));
                $('.box-val-inv-pendue').html(nFormatter(parseInt(item.PendingDue)));
                $('.box-val-inv-pennotdue').html(nFormatter(parseInt(item.PendingNotDue)));

                $('.box-val-inv-collvalue').html(nFormatter(parseInt(item.ReceiptAmount)));
                $('.box-val-inv-cleared').html(nFormatter(parseInt(item.ClearedAmount)));
                $('.box-val-inv-remitted').html(nFormatter(parseInt(item.RemittedAmount)));               

            });

            //FOR Collection
            $.each(listCountCollection, function (key, item) {

                $('.box-val-coll-totvaluecoll').html(nFormatter(parseInt(item.TotalAmount)));
                $('.box-val-coll-cleared').html(nFormatter(parseInt(item.ClearedAmount)));
                $('.box-val-coll-remitted').html(nFormatter(parseInt(item.RemittedAmount)));

            });

            //For Speemeter Graph of SO,Invoice and Collection
            $('.so-speed-perc,.inv-speedo-prev-year,.collection-speed-perc').html('0%');
            $.each(listSOInvCollGraphVal, function (key, item) {

                if (item.Name =='SO') {
                    $('.so-speedo-curr-year').html(nFormatter(parseInt(item.CurrYear)));
                    $('.so-speedo-prev-year').html(nFormatter(parseInt(item.PrevYear)));
                    $('.so-speed-perc').html(parseFloat(item.Perc).toFixed(1) + '%');
                    generateGuageChart2(parseFloat(item.Perc).toFixed(1));    
                }
                else if (item.Name =='Invoice') {
                    $('.inv-speedo-curr-year').html(nFormatter(parseInt(item.CurrYear)));
                    $('.inv-speedo-prev-year').html(nFormatter(parseInt(item.PrevYear)));
                    $('.invoice-speed-perc').html(parseFloat(item.Perc).toFixed(1) + '%');
                    generateGuageChart3(parseFloat(item.Perc).toFixed(1));
                }
                else if (item.Name == 'Collection') {
                    $('.coll-speedo-curr-year').html(nFormatter(parseInt(item.CurrYear)));
                    $('.coll-speedo-prev-year').html(nFormatter(parseInt(item.PrevYear)));
                    $('.collection-speed-perc').html(parseFloat(item.Perc).toFixed(1) +'%');
                    generateGuageChart4(parseFloat(item.Perc).toFixed(1));
                }
                
            });
            

            //-------------------- For Incoterm ------------------------------//
            //initiateDogIncoterm()

            //-------------------- Top 10 Vendor ------------------------------//
            //var topOpp = '';
            //$.each(listTopVendors, function (key, item) {

            //    topOpp += `<li class="d-flex mb-4 pb-1">
            //        <div class="avatar flex-shrink-0 me-3">                   
            //              <img src="../Purchase/img/icon-vendor1.png" alt="Credit Card" class="rounded">
            //        </div>
            //        <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
            //            <div class="me-2" style="width:50%">
            //                <small class="text-muted d-block mb-1">	 </small>                         
            //                    <a href="#" class="mb-0" style="color: #cd5050;">` + item.Name + `</a>
            //            </div>
            //            <div class="user-progress d-flex align-items-center gap-1">
            //                <h6 class="mb-0" style="color: #c37f24;">`+ nFormatter(item.Count) + `</h6>

            //            </div>
            //        </div>
            //    </li>`;
            //});
            //$('.top-vendor-ul').html(topOpp);


            //----------------- For OPen and Closed PO ---------------//
            //initiateOpenClosedPOPieChart()
            //$.each(listOpenClosedPO, function (key, item) {
            //    //if (item.Name == 'Without Buyer') { $('.withour-buyer-count').html(parseInt(item.Count).toLocaleString("en-US")) }
            //    //else { $('.withour-vendor-count').html(parseInt(item.Count).toLocaleString("en-US")) }
            //    $('.total-po-count').html(parseInt(item.Count).toLocaleString());
            //    $('.total-po-value').html(nFormatter(item.Value));
            //});


            //-----------------For Payment Term Chart------------------//
            //initiatePayTermDonutChart();


            //--------------- PO Item Level Count and Value --------------------//
            //$('.tic-issued-count,.tic-notdue-count,.tic-due-count,.tic-redflag-count,.tic-issued-value,.tic-notdue-value,.tic-due-value,.tic-redflag-value').html('0');
            //$.each(listPOItemLevel, function (key, item) {
            //    if (item.Name == 'Tickets Issued') { $('.tic-issued-count').html(parseInt(item.Count).toLocaleString()); $('.tic-issued-value').html(nFormatter(item.Value == "" ? 0 : item.Value)) }
            //    else if (item.Name == 'Tickets Not Due') { $('.tic-notdue-count').html(parseInt(item.Count).toLocaleString()); $('.tic-notdue-value').html(nFormatter(item.Value == "" ? 0 : item.Value)) }
            //    else if (item.Name == 'Tickets Due') { $('.tic-due-count').html(parseInt(item.Count).toLocaleString()); $('.tic-due-value').html(nFormatter(item.Value == "" ? 0 : item.Value)) }
            //    else if (item.Name == 'Red Flag') { $('.tic-redflag-count').html(parseInt(item.Count).toLocaleString()); $('.tic-redflag-value').html(nFormatter(item.Value == "" ? 0 : item.Value)) }
            //});
            //initiatePOItemLevelPieChart();
            var htm = '';
            //--------------------Pending Tasks --------------------------------//
            $.each(listPendingTaskAging, function (key, item) {

                htm += `<tr> 
                    <td style="text-align: left;"> <input type="text" title="`+ item.TaskName + `" class="db-task-tab" value="` + item.TaskName + `" readonly="" /></td>                 
                    <td style="text-align: left;"> <input type="text" title="`+ item.ProjectName + `" class="db-task-tab" value="` + item.ProjectName + `" readonly="" /> </td>                 
                    <td style="text-align: left;"> <input type="text"  class="db-task-tab" value="`+ item.EndDate.split(' ')[0] + `" readonly="" /> </td>                 
                    <td> <input type="text" class="db-task-tab" value="`+ item.TaskOverdueDate + ` days" readonly="" /></td>
                 </tr>`
            });
            $('.tbody-pending-task').html(htm);

            //---------------- Open and Closed Tasks -----------------------//

            //--------- for open project  (Table view)
            //htm = '';
            //htm += `<div class="row mb-1" style="background: #c27b7ffa; color:white;margin-top: -24px;">
            //                                <div style="font-size: 14px;width:11.3333%;">#</div>
            //                                <div class="col-md-4" style="font-size: 14px;">Project</div>
            //                                <div style="width:29%;" style="font-size: 14px;">% Completion</div>
            //                                <div style="font-size: 14px;width:26%;"">Role</div>
            //                            </div>`;
            //$.each(listOpenClosedProj.filter(s => s.CompPerc < 100), function (key, item) {

            //    var forMargin = item.CompPerc > 43 ? 43 : (item.CompPerc < 17 ? 0 : item.CompPerc);
            //    var progressBar = `<div style="display:inline-flex;">
            //        <div class="progrees-bar-grid"> <div style="color:#000000e6;background:` + getProgressColor(item.CompPerc) + `;border-radius: 4px;width:` + (item.CompPerc == 0 ? 100 : (forMargin < 17 ? 17 : item.CompPerc)) + `%"> <i style="margin-left: ` + (item.CompPerc == 0 ? 43 : forMargin) +`%;">`+ item.CompPerc + `% </i> </div>  </div>                    
            //    </div>`

            //    htm += `<div class="row mb-1" style="border-bottom: 1px solid #f7f7f7;">
            //                                <div style="color:#2b2020f5;text-align: left;width:11.3333%;">`+ (key + 1) +`</div>
            //                                <div class="col-md-4" style="color:#2b2020f5;text-align: left;">`+ item.ProjName + `</div>
            //                                <div style="width:29%;">`+ progressBar + `</div>
            //                                <div style="color:#2b2020f5;width:26%;">`+ TodoProjectRoles.filter(s => s.RoleId == item.MemberRole)[0].RoleName + `</div>
            //                            </div>`
            //});
            //$('.open-tab-div').html(htm);

        
            //----- for closed project   (Table View)
            //htm = ''; 
            //htm += `<div class="row mb-1" style="background: #c27b7ffa; color:white;margin-top: -24px;">
            //                                <div style="font-size: 14px;width:11.3333%;">#</div>
            //                                <div class="col-md-6" style="font-size: 14px;">Project</div>
            //                                <div style="font-size: 14px;width:23%;">% Completion</div>
            //                                <div style="font-size: 14px;width:15.6%;">Task Done</div>
            //                            </div>`;
            //$.each(listOpenClosedProj.filter(s => s.CompPerc == 100), function (key, item) {
            //    var forMargin = item.CompPerc > 43 ? 43 : (item.CompPerc < 17 ? 0 : item.CompPerc);
            //    var progressBar = `<div style="display:inline-flex;">
            //        <div class="progrees-bar-grid"> <div style="color:#000000e6;background:` + getProgressColor(item.CompPerc) + `;border-radius: 4px; width:` + (item.CompPerc == 0 ? 100 : (forMargin < 17 ? 17 : item.CompPerc)) + `%"> <i style="margin-left: ` + (item.CompPerc == 0 ? 43 : forMargin) +`%;">` + item.CompPerc + `% </i> </div>  </div>  
            //    </div>`
            //    htm += `<div class="row mb-1" style="border-bottom: 1px solid #f7f7f7;">
            //                                <div class="col-md-1" style="color:#2b2020f5;text-align: left;">`+ (key +1) +`</div>
            //                                <div class="col-md-6" style="color:#2b2020f5;text-align: left;">`+ item.ProjName +`</div>
            //                                <div style="width:23%;">`+ progressBar + `</div>
            //                                <div style="color:#2b2020f5;width:15.6%;text-align:right;">`+ item.CompCount +`</div>
            //                            </div>`
            //});
            //$('.closed-tab-div').html(htm);
            
            //-------------------- Invloved Projects ------------------------------//
            //var topItems = '';
            //$.each(listInvlovedProjects, function (key, item) {

            //    topItems += `<li class="d-flex mb-4 pb-1">
            //        <div class="avatar flex-shrink-0 me-3">                   
            //              <img src="../Purchase/img/icon-items.png" alt="Credit Card" class="rounded">
            //        </div>
            //        <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
            //            <div class="me-2" style="width:50%">
            //                <small class="text-muted d-block mb-1">	 </small>                         
            //                    <a href="#" class="mb-0" style="color: #cd5050;">` + item.Name + `</a>
            //            </div>
            //            <div class="user-progress d-flex align-items-center gap-1">
            //                <h6 class="mb-0" style="color: #c37f24;">`+ nFormatter(item.Count) + `</h6>

            //            </div>
            //        </div>
            //    </li>`;
            //});
            //$('.involved-proj-ul').html(topItems);



            generateGuageChart(90);
            //generateGuageChart2(40);
            //generateGuageChart3(20);
            //generateGuageChart4(-10);
            //InitiateStackEmpChart();
           
            //loadTicketsRoundChart()
            //drawMarkOnMap();
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function GetStatusAndCountsForGraphs() {

    $.ajax({
        url: "DashboardMain.aspx/GetStatusAndCountsForGraphs",
        data: JSON.stringify({
            'EmpNo': $('#ddlSalesman option:selected').val(),
            'CreatedDate': FormateDate(new Date()),
            'Month': $('.cb-ytd-filter').is(':checked') == true ? 0 : $('#ddlMonth option:selected').val(),
            'Year': $('#ddlYear option:selected').val(),
            'SalesmanId': $('#ddlSalesman option:selected').val().trim(),
            'ManagerId': $('#ddlManager option:selected').val().trim(),
            'Company': getCompniesFromDDL()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {
            $(".ajax-loader").fadeOut(500);

            listSOCompare = result.d.listSOCompare;
            listInvoiceCompare = result.d.listInvoiceCompare;
            listCollectionCompare = result.d.listCollectionCompare;
            listSOGrowth = result.d.listSOGrowth;
            listInvoiceGrowth = result.d.listInvoiceGrowth;
            listCollectionGrowth = result.d.listCollectionGrowth;

                
            //InitiateStackEmpChart();
            InititateMonthlyAndDailyChart(listSOCompare, 0,'chartCompareSO');
            InititateMonthlyAndDailyChart(listSOGrowth, 1, 'chartGrowthSO');


            InititateMonthlyAndDailyChart(listInvoiceCompare, 0, 'chartCompareInv');
            InititateMonthlyAndDailyChart(listCollectionCompare, 0, 'chartCompareColl');
            InititateMonthlyAndDailyChart(listInvoiceGrowth, 1, 'chartGrowthInv');
            InititateMonthlyAndDailyChart(listCollectionGrowth, 1, 'chartGrowthColl');
        
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

var classBoxArr = ['toponeempbox', 'topsecondempbox','topthirdempbox']
function GetTopSalesman() {

    $.ajax({
        url: "DashboardMain.aspx/GetTopSalesman",
        data: JSON.stringify({
            'EmpNo': $('#ddlSalesman option:selected').val(),
            'CreatedDate': FormateDate(new Date()),
            'Month': $('.cb-ytd-filter').is(':checked') == true ? 0 : $('#ddlMonth option:selected').val(),
            'Year': $('#ddlYear option:selected').val(),
            'SalesmanId': $('#ddlSalesman option:selected').val().trim(),
            'ManagerId': $('#ddlManager option:selected').val().trim(),
            'Company': getCompniesFromDDL()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            //$(".ajax-loader").fadeOut(500);
            var htm = '';
            var res = result.d;

            $.each(res, function (key,item) {
                if (key == 0) {
                    htm += `<div class="row ` + classBoxArr[key] +` top-rank-bg-img">
                                                <ul class="m-0 entered-ul" style="list-style-type: none;">
                                                    <li style="float: left; padding-right: 14px;">
                                                        <img src="../Images/Profile/alternet.png" class="" alt="" style="width: 58px; border-radius: 50%; height: 56px;">
                                                    </li>
                                                    <li style="float: left; padding-right: 12px;"> <span style="color: #cc5a16;font-size: 16px;">`+ item.Salesman +` </span> <br>
                                                        <span style="color: #a1acb8;">`+ item.Company +`</span> </li>

                                                    <li style="text-align: right;margin-right:29px;">
                                                        <i style="font-size: xx-large; color: #596368;text-shadow: 2px 0px 3px #ffffff, 0px 8px 10px #c2c0c0;">`+ parseFloat(item.AvgofAchv).toFixed(1) +`% </i> 
                                                     </li>
                                                </ul>
                                                        <div class="row" style="display: flex;justify-content: center;padding-bottom: 19px;">
                                                            <div style="width:18%;border-right: 1px solid #80808017;color:#148dcf;font-size: 17px;font-style: italic;" title="Sales Order"> `+ parseFloat(item.SoPerc).toFixed(1) + `%</div>
                                                            <div style="width:18%;border-right: 1px solid #80808017;color:#71a415;font-size: 17px;font-style: italic;" title="Invoice"> `+ parseFloat(item.InvPerc).toFixed(1) + `%</div>
                                                            <div style="width:18%;color:#e59900;font-size: 17px;font-style: italic;" title="Collection"> `+ parseFloat(item.ColPec).toFixed(1) +`%</div>
                                                        </div>
                                            </div>`
                }
                else {
                    htm += `  <div class="row ` + classBoxArr[key] +` top-rank-bg-img">
                                                <ul class="m-0 entered-ul" style="list-style-type: none;padding-top: 10px;">
                                                    <li style="float: left; padding-right: 14px;">
                                                        <img src="../Images/Profile/alternet.png" class="" alt="" style="width: 58px; border-radius: 50%; height: 56px;">
                                                    </li>
                                                    <li style="float: left; padding-right: 12px;"><span style="color: #cc5a16;font-size: 16px;">`+ item.Salesman +`</span> <br>
                                                        <span style="color: #a1acb8;">`+ item.Company +`</span> </li>

                                                    <li style="text-align: right;margin-right:29px;">
                                                        <i style="font-size: xx-large; color: #596368;text-shadow: 2px 0px 3px #ffffff, 0px 8px 10px #c2c0c0;">`+ parseFloat(item.AvgofAchv).toFixed(1) +`% </i>  
                                                    </li>
                                                </ul>
                                                        <div class="row" style="display: flex;justify-content: center;padding-bottom: 19px;">
                                                            <div style="width:18%;border-right: 1px solid #80808017;color:#148dcf;font-size: 17px;font-style: italic;" title="Sales Order"> `+ parseFloat(item.SoPerc).toFixed(1) + `%</div>
                                                            <div style="width:18%;border-right: 1px solid #80808017;color:#71a415;font-size: 17px;font-style: italic;" title="Invoice"> `+ parseFloat(item.InvPerc).toFixed(1) + `%</div>
                                                            <div style="width:18%;color:#e59900;font-size: 17px;font-style: italic;" title="Collection"> `+ parseFloat(item.ColPec).toFixed(1) +`%</div>
                                                        </div>
                                            </div>`
                }

            });

            $('.entered-tab-div').html(htm);

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}


$('.growth-chart-ul').on('click', 'li', function () {
    var selTab = $(this).text().trim();

    if (selTab == 'Sales Order') {        
        setTimeout(function () {
            InititateMonthlyAndDailyChart(listSOGrowth, 1, 'chartGrowthSO');
        }, 500);
    }
    else if (selTab == 'Invoice') {
        setTimeout(function () {
            InititateMonthlyAndDailyChart(listInvoiceGrowth, 1, 'chartGrowthInv');
        }, 500);
        
    }
    else if (selTab == 'Collection') {
        setTimeout(function () {
            InititateMonthlyAndDailyChart(listCollectionGrowth, 1, 'chartGrowthColl');
        }, 500);        
    }

});


$('.compare-chart-ul').on('click', 'li', function () {
    var selTab = $(this).text().trim();

    if (selTab == 'Sales Order') {
        setTimeout(function () {
            InititateMonthlyAndDailyChart(listSOCompare, 0, 'chartCompareSO');
        }, 500);
    }
    else if (selTab == 'Invoice') {
        setTimeout(function () {
            InititateMonthlyAndDailyChart(listInvoiceCompare, 0, 'chartCompareInv');
        }, 500);

    }
    else if (selTab == 'Collection') {
        setTimeout(function () {
            InititateMonthlyAndDailyChart(listCollectionCompare, 0, 'chartCompareColl');
        }, 500);
    }

});


function drawMarkOnMap() {
    //var circle = L.circle([51.508, -0.11], {
    //    color: 'red',
    //    fillColor: '#f03',
    //    fillOpacity: 0.5,
    //    radius: 500
    //}).addTo(map);

    $.each(listCountriesOnMap, function (key, item) {

        var htm = `<div style="text-align:center;"> <b style="color:#cd5050">` + item.Name + ` </b></div>
<div><span>Count: </span> <span style="color: #e36535;">`+ item.Count + `</span></div>
<div> <span>Value: </span> <span style="color: #e36535;">`+ nFormatter(item.Value) + ` </span><div>
`;
        if (item.Name != '') {
            L.circle([item.Lat, item.Lon], {
                color: 'red',
                fillColor: '#f03',
                fillOpacity: 0.5,
                radius: 500
            }).addTo(map);
            var mm = L.marker([item.Lat, item.Lon]).addTo(map);
            mm.bindPopup(htm).on('click', 'onMapClick');
        }



        //markerClusters.addLayer(mm).addTo(map); 
        //if (item.Name.toUpperCase() =="CHINA") {
        //    L.circle([35.8617, 104.1954], {  //for China
        //        color: 'red',
        //        fillColor: '#f03',
        //        fillOpacity: 0.5,
        //        radius: 500
        //    }).addTo(map);
        //    L.marker([35.8617, 104.1954]).addTo(map);
        //}

    });
    //var circle = L.circle([51.508, -0.11], {  // For London
    //    color: 'red',
    //    fillColor: '#f03',
    //    fillOpacity: 0.5,
    //    radius: 500
    //}).addTo(map);


    //L.DomUtil.addClass(UAEVar._icon,'demoClass')
    //UAEVar._icon.classList.add("asdas");

}


//function 


function getLightShade(val) {
    let cGreen = '#12C05D', cYellow = '#d9b024', cRed = '#a92828c7';
    finalColor = '';

    if (val < 50) {
        finalColor = cRed;
    } else if (val >= 50 && val < 70) {
        finalColor = cYellow;
    }
    else if (val >= 70) {
        finalColor = cGreen;
    }

    return finalColor;
}
function getDarkShade(val) {
    let cGreen = '#5cb33f', cYellow = '#F6BE00', cRed = '#a92828';
    //'#12C05D' , '#7cd75f'
    finalColor = '';

    if (val < 50) {
        finalColor = cRed;
    } else if (val >= 50 && val < 70) {
        finalColor = cYellow;
    }
    else if (val >= 70) {
        finalColor = cGreen;
    }

    $('#dashboardProPic').css("border", "solid 8px" + finalColor)
    return finalColor;
}

function FormateDate(dt) {

    var date = dt.getDate();
    var month = dt.getMonth() + 1;
    var year = dt.getFullYear();

    return year + "-" + month + "-" + date;
}


// Guage chart performance
function generateGuageChart(value) {
    var opts = {
        angle: -0.01, // The span of the gauge arc
        lineWidth: 0.20, // The line thickness
        radiusScale: 1, // Relative radius
        pointer: {
            length: 0.35, // // Relative to gauge radius
            strokeWidth: 0.035, // The thickness
            color: '#e36535' // Fill color  #000000
        },
        limitMax: false,     // If false, max value increases automatically if value > maxValue
        limitMin: false,     // If true, the min value of the gauge will be fixed
        colorStart: '#6F6EA0',   // Colors
        colorStop: '#C0C0DB',    // just experiment with them
        strokeColor: '#EEEEEE',  // to see which ones work best for you
        generateGradient: true,
        highDpiSupport: true,     // High resolution support
        // renderTicks is Optional
        renderTicks: {
            divisions: 10,
            divWidth: 1.1,
            divLength: 1,
            divColor: '#e3653500',   //#333333
            subDivisions: 0,
            subLength: 0.5,
            subWidth: 0.6,
            subColor: '#666666'
        },
        staticZones: [
            { strokeStyle: "#d32727", min: 0, max: 10 },
            { strokeStyle: "#d35227", min: 10, max: 20 },
            { strokeStyle: "#d37d27", min: 20, max: 30 },
            { strokeStyle: "#d3a827", min: 30, max: 40 },

            { strokeStyle: "#d3c527", min: 40, max: 50 },
            { strokeStyle: "#d3d327", min: 50, max: 60 },

            { strokeStyle: "#a8d327", min: 60, max: 70 },
            { strokeStyle: "#7dd327", min: 70, max: 80 },
            { strokeStyle: "#52d327", min: 80, max: 90 },
            { strokeStyle: "#27d327", min: 90, max: 100 }


        ],
        //staticLabels: {
        //    font: "10px sans-serif",  // Specifies font
        //    labels: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100],  // Print labels at these values
        //    color: "#000000",  // Optional: Label text color
        //    fractionDigits: 0  // Optional: Numerical precision. 0=round off.
        //},
    };
    var canvId = 'canvas-speedometer';
    var target = document.getElementById(canvId); // your canvas element
    var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
    gauge.maxValue = 100; // set max gauge value
    gauge.setMinValue(0);  // Prefer setter over gauge.minValue = 0
    gauge.animationSpeed = 72; // set animation speed (32 is default value)
    gauge.set(value > 100 ? 100 : value); // set actual value

    // loadBarGraphForThisKPI(i, value);
};

//Completed Task Chart
function generateGuageChart2(value) {
    //let com = totalTaskC == 0 ? 0 : parseInt((compTaskC / totalTaskC) * 100);
    //$('.com-speed-perc').html(com + '%');
    let com = value;

    var opts = {
        angle: -0.01, // The span of the gauge arc
        lineWidth: 0.20, // The line thickness
        radiusScale: 1, // Relative radius
        pointer: {
            length: 0.35, // // Relative to gauge radius
            strokeWidth: 0.035, // The thickness
            color: '#35b6fc' // Fill color  #000000
        },
        limitMax: false,     // If false, max value increases automatically if value > maxValue
        limitMin: false,     // If true, the min value of the gauge will be fixed
        colorStart: '#35b6fc',   // Colors
        colorStop: '#35b6fc',    // just experiment with them
        strokeColor: '#EEEEEE',  // to see which ones work best for you
        generateGradient: true,
        highDpiSupport: true,     // High resolution support
        // renderTicks is Optional
        renderTicks: {
            divisions: 10,
            divWidth: 1.1,
            divLength: 1,
            divColor: '#e3653500',   //#333333
            subDivisions: 0,
            subLength: 0.5,
            subWidth: 0.6,
            subColor: '#666666'
        },
        staticZones: [
            { strokeStyle: "#35b6fc", min: -50, max: (com < -50 ? -50 : com) },
            { strokeStyle: "#35b6fc36", min: (com < -50 ? -50 : com), max: 50 }
        ],
        staticLabels: {
            font: "10px sans-serif",  // Specifies font
            labels: [-50, -40, -30, -20, -10, 0, 10, 20, 30, 40, 50],  // Print labels at these values
            color: "#2da3e3",  // Optional: Label text color
            fractionDigits: 0  // Optional: Numerical precision. 0=round off.
        },
    };
    var canvId = 'spmeter-salesorder';
    var target = document.getElementById(canvId); // your canvas element
    var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
    gauge.maxValue = 50; // set max gauge value
    gauge.setMinValue(-50);  // Prefer setter over gauge.minValue = 0
    gauge.animationSpeed = 72; // set animation speed (32 is default value)
    gauge.set(com > 50 ? 50 : (com < -50 ? -50 : com)); // set actual value

    // loadBarGraphForThisKPI(i, value);
};

//Pending Task Chart
function generateGuageChart3(value) {
    //let pending = totalTaskC == 0 ? 0 : parseInt((pendingTaskC / totalTaskC) * 100);
    //$('.pending-speed-perc').html(pending + '%');
    let pending = value;

    var opts = {
        angle: -0.01, // The span of the gauge arc
        lineWidth: 0.20, // The line thickness
        radiusScale: 1, // Relative radius
        pointer: {
            length: 0.35, // // Relative to gauge radius
            strokeWidth: 0.035, // The thickness
            color: '#81bf0f' // Fill color  #000000
        },
        limitMax: false,     // If false, max value increases automatically if value > maxValue
        limitMin: false,     // If true, the min value of the gauge will be fixed
        colorStart: '#81bf0f',   // Colors
        colorStop: '#81bf0f',    // just experiment with them
        strokeColor: '#EEEEEE',  // to see which ones work best for you
        generateGradient: true,
        highDpiSupport: true,     // High resolution support
        // renderTicks is Optional
        renderTicks: {
            divisions: 10,
            divWidth: 1.1,
            divLength: 1,
            divColor: '#e3653500',   //#333333
            subDivisions: 0,
            subLength: 0.5,
            subWidth: 0.6,
            subColor: '#666666'
        },
        staticZones: [
            { strokeStyle: "#81bf0f", min: -50, max: (pending < -50 ? -50 : pending) },
            { strokeStyle: "#82b62438", min: (pending < -50 ? -50 : pending), max: 50 }

        ],
        staticLabels: {
            font: "10px sans-serif",  // Specifies font
            labels: [-50, -40, -30, -20, -10, 0, 10, 20, 30, 40, 50],  // Print labels at these values
            color: "#82b624",  // Optional: Label text color
            fractionDigits: 0  // Optional: Numerical precision. 0=round off.
        },
    };
    var canvId = 'spmeter-invoice';
    var target = document.getElementById(canvId); // your canvas element
    var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
    gauge.maxValue = 50; // set max gauge value
    gauge.setMinValue(-50);  // Prefer setter over gauge.minValue = 0
    gauge.animationSpeed = 72; // set animation speed (32 is default value)
    gauge.set(pending > 50 ? 50 : (pending < -50 ? -50 : pending)); // set actual value

    // loadBarGraphForThisKPI(i, value);
};

//Overdue Task Chart
function generateGuageChart4(value) {
    //let pending = totalTaskC == 0 ? 0 : parseInt((pendingTaskC / totalTaskC) * 100);
    //$('.pending-speed-perc').html(pending + '%');
    let pending = value;

    var opts = {
        angle: -0.01, // The span of the gauge arc
        lineWidth: 0.20, // The line thickness
        radiusScale: 1, // Relative radius
        pointer: {
            length: 0.35, // // Relative to gauge radius
            strokeWidth: 0.035, // The thickness
            color: '#ffab00' // Fill color  #000000
        },
        limitMax: false,     // If false, max value increases automatically if value > maxValue
        limitMin: false,     // If true, the min value of the gauge will be fixed
        colorStart: '#ffab00',   // Colors
        colorStop: '#ffab00',    // just experiment with them
        strokeColor: '#EEEEEE',  // to see which ones work best for you
        generateGradient: true,
        highDpiSupport: true,     // High resolution support
        // renderTicks is Optional
        renderTicks: {
            divisions: 10,
            divWidth: 1.1,
            divLength: 1,
            divColor: '#e3653500',   //#333333
            subDivisions: 0,
            subLength: 0.5,
            subWidth: 0.6,
            subColor: '#666666'
        },
        staticZones: [
            { strokeStyle: "#ffab00", min: -50, max: (pending < -50 ? -50 : pending) },
            { strokeStyle: "#ffab003d", min: (pending < -50 ? -50 : pending), max: 50 }

        ],
        staticLabels: {
            font: "10px sans-serif",  // Specifies font
            labels: [-50, -40, -30, -20, -10, 0, 10, 20, 30, 40, 50],  // Print labels at these values
            color: "#e29903",  // Optional: Label text color
            fractionDigits: 0  // Optional: Numerical precision. 0=round off.
        },
    };
    var canvId = 'spmeter-collection';
    var target = document.getElementById(canvId); // your canvas element
    var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
    gauge.maxValue = 50; // set max gauge value
    gauge.setMinValue(-50);  // Prefer setter over gauge.minValue = 0
    gauge.animationSpeed = 72; // set animation speed (32 is default value)
    gauge.set(pending > 50 ? 50 : (pending < -50 ? -49 : pending)); // set actual value

    // loadBarGraphForThisKPI(i, value);
};



function loadUserDetails() {
    let uId = $('#ddlSalesman option:selected').val().trim();

    $.ajax({
        url: "DashboardEmpPerformance.aspx/GetUserImage",
        data: JSON.stringify({ "EmpNo": uId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d.length > 0) {
                $('.empProfilePic').attr('src', result.d[0].ImagePath);
                $('.empNameH').html(result.d[0].EmpName);
            }
            else {
                $('.empProfilePic').attr("src", '../Images/Profile/alternet.png');
                $('.empNameH').html('');
            }



            //if (result.d.length > 0) {
            //    $('.#empProfilePic').attr("src", result.d[0].ImagePath);
            //    if (overAllPerfo < 50) {
            //        if (uId != result.d[0].EmpID) {
            //            $('.loggedin-username').html(result.d[0].EmpName + "<br /><br /> Red Flag. Your overall performance is beyond the acceptable mark! We urge you to take the necessary actions to improve your performance immediately.");

            //        }
            //        else {
            //            $('.loggedin-username').html("Hi  " + result.d[0].EmpName + "<br /><br /> Red Flag. Your overall performance is beyond the acceptable mark! We urge you to take the necessary actions to improve your performance immediately.");
            //        }
            //    }
            //    else if (overAllPerfo < 70) {
            //        if (uId != result.d[0].EmpID) {
            //            $('.loggedin-username').html(result.d[0].EmpName + "<br /><br /> Your overall performance is not up to standards; we urge you to generate an effective recovery plan  to drastically improve your %Efficiency.");
            //        }
            //        else {
            //            $('.loggedin-username').html("Hi  " + result.d[0].EmpName + "<br /><br /><span>Your overall performance is not up to standards; we urge you to generate an effective recovery plan  to drastically improve your %Efficiency.");
            //        }
            //    }
            //    else if (overAllPerfo >= 70) {
            //        if (uId != result.d[0].EmpID) {
            //            $('.loggedin-username').html(result.d[0].EmpName + "<br /><br /> Job well done! Keep your inner fire ignited");
            //        }
            //        else {
            //            $('.loggedin-username').html("Hi " + result.d[0].EmpName + "<br /><br /> Job well done! Keep your inner fire ignited");
            //        }

            //    }
            //}
            //else {
            //    $('.empProfilePic').attr("src", '../Images/Profile/alternet.png');
            //    $('.loggedin-username').html('');
            //}

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function getHighestVal(data, index) {
    var max = 0;
    $.each(data, function (i, v) {
        let thisVal = v[index];
        max = (parseInt(max) < parseInt(thisVal)) ? thisVal : max;
    });
    return max;
}

function nFormatter(num) {

    if (num >= 1000000000000) {
        return (num / 1000000000000).toFixed(1).replace(/\.0$/, '') + 'T';
    }
    else if (num >= 1000000000) {
        return (num / 1000000000).toFixed(1).replace(/\.0$/, '') + 'B';
    }
    else if (num >= 1000000) {
        return (num / 1000000).toFixed(1).replace(/\.0$/, '') + 'M';
    }
    else if (num >= 1000) {
        return (num / 1000).toFixed(1).replace(/\.0$/, '') + 'K';
    }
    return num;
}



//---------------------------- Charts for Emp Performance -----------------------------------//
function InitiateStackEmpChart() {

    var highPriorityTasksArr = [
        { y: parseInt(listTaskPrioriyWiseForBarGraph.filter(s => s.Name == 'Low Completed')[0].Count), label: "Low" },
        { y: parseInt(listTaskPrioriyWiseForBarGraph.filter(s => s.Name == 'Medium Completed')[0].Count), label: "Medium" },
        { y: parseInt(listTaskPrioriyWiseForBarGraph.filter(s => s.Name == 'Urgent Completed')[0].Count), label: "High" }
    ];

    var MediumPriorityTasksArr = [
        { y: parseInt(listTaskPrioriyWiseForBarGraph.filter(s => s.Name == 'Low Pending')[0].Count), label: "Low" },
        { y: parseInt(listTaskPrioriyWiseForBarGraph.filter(s => s.Name == 'Medium Pending')[0].Count), label: "Medium" },
        { y: parseInt(listTaskPrioriyWiseForBarGraph.filter(s => s.Name == 'Urgent Pending')[0].Count), label: "High" }
    ];

    var LowPriorityTasksArr = [
        { y: parseInt(listTaskPrioriyWiseForBarGraph.filter(s => s.Name == 'Low Overdue')[0].Count), label: "Low" },
        { y: parseInt(listTaskPrioriyWiseForBarGraph.filter(s => s.Name == 'Medium Overdue')[0].Count), label: "Medium" },
        { y: parseInt(listTaskPrioriyWiseForBarGraph.filter(s => s.Name == 'Urgent Overdue')[0].Count), label: "High" }
    ];





    var options = {
        animationEnabled: true,
        theme: "light2",
        title: {
            text: "Task Status"
        },
        axisY2: {
            prefix: "",
            lineThickness: 0
        },
        toolTip: {
            shared: true
        },
        legend: {
            verticalAlign: "top",
            horizontalAlign: "center"
        },
        data: [
            {
                type: "stackedBar",
                showInLegend: true,
                name: "Completed",
                axisYType: "secondary",
                color: "#15c527", //#4b822b
                dataPoints: highPriorityTasksArr
            },
            {
                type: "stackedBar",
                showInLegend: true,
                name: "Pending",
                axisYType: "secondary",
                color: "#d9ce2b", //#d9ce2b
                dataPoints: MediumPriorityTasksArr
            },
            {
                type: "stackedBar",
                showInLegend: true,
                name: "Overdue",
                axisYType: "secondary",
                color: "#d32727", //#d34c27
                dataPoints: LowPriorityTasksArr
            }
            //{
            //    type: "stackedBar",
            //    showInLegend: true,
            //    name: "Eggs (20)",
            //    axisYType: "secondary",
            //    color: "#DB9079",
            //    indexLabel: "$#total",
            //    dataPoints: [
            //        { y: 2, label: "India" },
            //        { y: 3, label: "US" },
            //        { y: 6, label: "Germany" }                    
            //    ]
            //}
        ]

        //data: [
        //    {
        //        type: "stackedBar",
        //        showInLegend: true,
        //        name: "Completed",
        //        axisYType: "secondary",
        //        color: "#15c527", //#4b822b
        //        dataPoints: [
        //            { y: 5, label: "Low" },
        //            { y: 10, label: "Medium" },
        //            { y: 41, label: "High" }
        //        ]
        //    },
        //    {
        //        type: "stackedBar",
        //        showInLegend: true,
        //        name: "Pending",
        //        axisYType: "secondary",
        //        color: "#d9ce2b", //#d9ce2b
        //        dataPoints: [
        //            { y: 15, label: "Low" },
        //            { y: 7, label: "Medium" },
        //            { y: 3, label: "High" }
        //        ]
        //    },
        //    {
        //        type: "stackedBar",
        //        showInLegend: true,
        //        name: "Overdue",
        //        axisYType: "secondary",
        //        color: "#d32727", //#d34c27
        //        dataPoints: [
        //            { y: 5, label: "Low" },
        //            { y: 2, label: "Medium" },
        //            { y: 2, label: "High" }
        //        ]
        //    }
        //    //{
        //    //    type: "stackedBar",
        //    //    showInLegend: true,
        //    //    name: "Eggs (20)",
        //    //    axisYType: "secondary",
        //    //    color: "#DB9079",
        //    //    indexLabel: "$#total",
        //    //    dataPoints: [
        //    //        { y: 2, label: "India" },
        //    //        { y: 3, label: "US" },
        //    //        { y: 6, label: "Germany" }                    
        //    //    ]
        //    //}
        //]
    };

    $("#chartStackEmp").CanvasJSChart(options);
}


//Monthly & Daily Basis chart
function InititateMonthlyAndDailyChart(listObj, isForGrowth, graphId) {


    //var valueCompArr = [52, 20, 30, 50, 60, 45, 50, 50, 12, 30, 50, 20, 56, 45, 12, 36, 60, 45, 65, 21, 25, 45, 46, 35, 34, 26, 15, 24, 28, 49, 56];
    //var valuePendingArr = [15, 5, 12, 12, 5, 23, 25, 10, 2, 8, 19, 5, 12, 8, 3, 9, 50, 33, 12, 21, 9, 12, 15, 15, 12, 5, 5, 8, 9, 9, 19];
    //var valueOverdueArr = [1, 1, 3, 2, 2, 8, 1, 2, 3, 1, 2, 1, 2, 2, 3, 1, 1, 1, 10, 3, 2, 6, 6, 2, 2, 3, 1, 2, 5, 5, 9];
    //let datesArr = getAllDatesInMonth(2023, 10);
    var itemComp = [], itemPending = [], itemOverdue = [];

    if (isForGrowth == 1) {
        $.each(listObj, function (key, item) {
            let subItem = {};
            subItem["x"] = new Date($('#ddlYear option:selected').val(), (parseInt(item.Month) - 1));
            subItem["y"] = parseInt(item.CurrYear);
            subItem["color"] = '#35b6fc';
            itemComp.push(subItem);
        });

        $.each(listObj, function (key, item) {
            let subItem = {};
            subItem["x"] = new Date($('#ddlYear option:selected').val(), (parseInt(item.Month) - 1));
            subItem["y"] = parseInt(item.CurrYear);
            subItem["color"] = '#15c527';
            itemPending.push(subItem);
        });

        //$.each(listObj, function (key, item) {
        //    let subItem = {};
        //    subItem["x"] = new Date($('#ddlYear option:selected').val(), (parseInt(item.Month) - 1));
        //    subItem["y"] = parseInt(item.CurrYear);
        //    subItem["color"] = '#cf5757';
        //    itemOverdue.push(subItem);
        //});

        var options = {
            animationEnabled: true,
            theme: "light2",
            title: {
                text: "Sales Growth",
                fontSize: 18
            },
            axisX: {
                valueFormatString: "MMM",
                interval: 0,
                fontSize: 8
                //intervalType: "day"
            },
            axisY: {
                //prefix: "$",
                labelFormatter: addSymbols
            },
            toolTip: {
                shared: true
            },
            legend: {
                cursor: "pointer",
                itemclick: toggleDataSeries
            },
            data: [
                //{
                //    type: "column",
                //    name: "My Sales",
                //    color: '#35b6fc',
                //    showInLegend: true,
                //    //xValueFormatString: "MMMM YYYY",
                //    xValueFormatString: "MMMM YYYY",
                //    fontSize:'5',
                //    //yValueFormatString: "$#,##0",
                //    dataPoints: itemComp
                //},
                {
                    type: "line",
                    name: "SO Value",
                    showInLegend: false,
                    //yValueFormatString: "$#,##0",
                    dataPoints: itemPending
                },
                //{
                //    type: "area",
                //    name: "OverDue Tasks",
                //    markerBorderColor: "white",
                //    markerBorderThickness: 2,
                //    showInLegend: true,
                //    //yValueFormatString: "$#,##0",
                //    dataPoints: itemOverdue
                //}
            ]
        };

        let grId = '#' + graphId;
        $(grId).CanvasJSChart(options);
        $('.chartContainerGrowth').find('.canvasjs-chart-credit').addClass('hidden')
    }
    else {
        $.each(listObj, function (key, item) {
            let subItem = {};
            subItem["x"] = new Date($('#ddlYear option:selected').val(), (parseInt(item.Month) - 1));
            subItem["y"] = parseInt(item.PrevYear);
            subItem["color"] = '#35b6fc';//
            itemComp.push(subItem);
        });

        $.each(listObj, function (key, item) {
            let subItem = {};
            subItem["x"] = new Date($('#ddlYear option:selected').val(), (parseInt(item.Month) - 1));
            subItem["y"] = parseInt(item.CurrYear);
            subItem["color"] = '#15c527';
            itemPending.push(subItem);
        });

        //$.each(listObj, function (key, item) {
        //    let subItem = {};
        //    subItem["x"] = new Date($('#ddlYear option:selected').val(), (parseInt(item.Month) - 1));
        //    subItem["y"] = parseInt(item.TaskDueCount);
        //    subItem["color"] = '#cf5757';
        //    itemOverdue.push(subItem);
        //});

        var options = {
            animationEnabled: true,
            theme: "light2",
            title: {
                text: "Prev Year Vs Current Year",
                fontSize: 18
            },
            highDpiSupport: true,
            axisX: {
                valueFormatString: "MMM",
                interval: 0,
                //intervalType: "day"
            },
            axisY: {
                //prefix: "$",
                labelFormatter: addSymbols
            },
            toolTip: {
                shared: true
            },
            legend: {
                cursor: "pointer",
                itemclick: toggleDataSeries
            },
            data: [
                {
                    type: "spline",
                    name: "Previous Year",
                    showInLegend: true,
                    color: '#35b6fc9c',//#35b6fc                    
                    lineDashType: "dash",
                    //xValueFormatString: "MMMM YYYY",
                    xValueFormatString: "MMMM YYYY",
                    //yValueFormatString: "$#,##0",
                    dataPoints: itemComp
                },
                {
                    type: "spline",
                    name: "Current Year",
                    showInLegend: true,
                    //yValueFormatString: "$#,##0",
                    dataPoints: itemPending
                },
                //{
                //    type: "area",
                //    name: "OverDue Tasks",
                //    markerBorderColor: "white",
                //    markerBorderThickness: 2,
                //    showInLegend: true,
                //    //yValueFormatString: "$#,##0",
                //    dataPoints: itemOverdue
                //}
            ]
        };
        let grId = '#'+ graphId;
        $(grId).CanvasJSChart(options);
        $('.chartCompare').find('.canvasjs-chart-credit').addClass('hidden');
    }
            
}

function addSymbols(e) {
    var suffixes = ["", "K", "M", "B"];
    var order = Math.max(Math.floor(Math.log(Math.abs(e.value)) / Math.log(1000)), 0);

    if (order > suffixes.length - 1)
        order = suffixes.length - 1;

    var suffix = suffixes[order];
    return CanvasJS.formatNumber(e.value / Math.pow(1000, order)) + suffix;
}

function toggleDataSeries(e) {
    if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
        e.dataSeries.visible = false;
    } else {
        e.dataSeries.visible = true;
    }
    e.chart.render();
}


function getMonthDays() {

    var valueArr = [52, 20, 30, 50, 70, 80, 90, 50, 12, 30, 74, 20, 56, 45, 12, 36, 85, 45, 65, 21, 25, 45, 46, 35, 34, 26, 15, 24, 28, 49, 75];
    let datesArr = getAllDatesInMonth(2023, 10);

    var itemComp = [], itemPending = [], itemOverdue = [];
    $.each(datesArr, function (key, item) {
        let subItem = {};
        subItem["x"] = item;
        subItem["y"] = valueArr[key];
        subItem["color"] = '#15c527';
        itemComp.push(subItem);
    });

    $.each(datesArr, function (key, item) {
        let subItem = {};
        subItem["x"] = item;
        subItem["y"] = valueArr[key];
        subItem["color"] = '#ffab00';
        itemPending.push(subItem);
    });

    $.each(datesArr, function (key, item) {
        let subItem = {};
        subItem["x"] = item;
        subItem["y"] = valueArr[key];
        subItem["color"] = '#d32727';
        itemOverdue.push(subItem);
    });


    var finalArr = [
        {
            type: "stackedBar",
            dataPoints: itemComp
        },
        {
            type: "stackedBar",
            dataPoints: itemPending
        },
        {
            type: "stackedBar",
            dataPoints: itemOverdue
        }
    ]


    var arr = [
        {
            type: "stackedBar",
            legendText: "Completed",
            showInLegend: "true",
            name: "Completed",
            dataPoints: [
                { label: 'Low', y: 30, color: '#15c527' },
                { label: 'Medium', y: 20, color: '#15c527' },
                { label: 'High', y: 10, color: '#15c527' }
            ]
        },
        {
            type: "stackedBar",
            legendText: "Pending",
            showInLegend: "true",
            name: "Pending",
            dataPoints: [
                { label: '', y: 31, color: '#ffab00' },
                { label: '', y: 21, color: '#ffab00' },
                { label: '', y: 11, color: '#ffab00' }
            ]
        },
        {
            type: "stackedBar",
            legendText: "Overdue",
            showInLegend: "true",
            name: "Overdue",
            dataPoints: [
                { label: '', y: 32, color: '#d32727' },
                { label: '', y: 22, color: '#d32727' },
                { label: '', y: 12, color: '#d32727' }
            ]
        }
    ]

    return arr;

}




function getAllDatesInMonth(year, month) {
    let startDate = new Date(year, month, 1); // month is 0-indexed
    let endDate = new Date(year, month + 1, 1);

    let dates = [];
    while (startDate < endDate) {
        dates.push(new Date(startDate)); // clone the date object
        startDate.setDate(startDate.getDate() + 1);
    }

    return dates;
}

function getProgressColor(wid) {
    let color = '';
    if (wid > 0 && wid < 41) {
        color = "#f35f1bc9";
    }
    else if (wid > 40 && wid < 70) {
        color = "#fbc11e";
    }
    else if (wid > 70) {
        color = "#a3dc15"; //"#a4d37c";
    }
    return color;

}