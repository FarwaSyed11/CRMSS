//var growthChartEl;

var pChartObj = [];
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


let cardColor, headingColor, axisColor, shadeColor, borderColor;
let profitBarColor = '#64c345', lossBarColor = '#cf4848', yearPercValueForGrowthGraph = [];
//let profitBarColor = '#0B9747'
var profitArray = [], lossArray = [], MonthArrayGraph = [];
const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
var securedValueForOverview = '', securedValueForecastOpp = 0, securedValueFuturForecastOpp = 0, securedValuePendingForecastOpp = 0;
var securedValueForTenderOverview = '', securedValueForHoldOverview = '';

var orderChartConfig = [], orderChartTenderConfig = [], orderChartHoldConfig = [];
var overViewChart, overViewTenderChart, overViewHoldChart;

cardColor = config.colors.white;
headingColor = config.colors.headingColor;
axisColor = config.colors.axisColor;
borderColor = config.colors.borderColor;


var compId = '';
var manId = '';
var salesmanId = '';

var arrExInternalChart = [];
var arrayForExpConChartX_Axis = []; arrayForExpConChartY_Axis = [];

var barChartForCheqDueCard = [];
var arrayForCHeqDueChartX_Axis = [], arrayForCHeqDueChartY_Axis = [];

var growthChartEmpOverAll = [];


var listTopRightBoxes = [];
var listMovementStatsues = []
var listContStatusesCount = [];
var listCountriesOnMap = [];

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
    initiatePieChart()
    initiateBarCharHorizon()

    dpContractStart = flatpickr(jQuery("#weeklyDatePickerStart"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: '2023-03-21',//"today",
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
        defaultDate: new Date(new Date().setMonth(new Date().getMonth() + 8)),//"today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {
            hfldDate.val($('#weeklyDatePickerEnd').val());
        }

    });



    roleListData = [];
    var roles = rolesList.split(',');
    for (var i = 0; i < roles.length; i++) {

        roleListData.push({ Roles: roles[i] });
    }

    if (roleListData.filter(s => s.Roles == '8096').length > 0 && roleListData.filter(s => s.Roles == '7094').length > 0) { currUserRoleValidate = 'LP'; $('.dbSwitcher').removeClass('hidden') }
    else if (roleListData.filter(s => s.Roles == '7094').length > 0) { currUserRoleValidate = 'P' }
    else if (roleListData.filter(s => s.Roles == '8096').length > 0) { currUserRoleValidate = 'L' }

    if (currUserRoleValidate == 'L') {
        $('.tic-filter-td').addClass('hidden')
    } else if (currUserRoleValidate == 'LP') {
        if ($('.dbSwitcher li .active').text().trim() == "Logistic") {
            $('.tic-filter-td').addClass('hidden');
            selTicType = -1;
        } else {
            $('.tic-filter-td').removeClass('hidden');
            selTicType = EmpNo;
        }
    }
    else {
        $('.tic-filter-td').removeClass('hidden');
        selTicType = EmpNo;
    }


    $('#growthReportId').html(new Date().getFullYear());

    getAllDashboardDataValues();

    $('.empProfilePic').attr('src', imgPath.val());
    $('.empNameH').html(empName.val());

});


function onMapClick(e) {

    //popupTest.setLatLng(e.latlng)
    //    .setContent("You clicked the map at " + e.latlng.toString())
    //    .openOn(map);


}

$('#btnSearchDashBoard').on('click', function () {
    //
    //selTicType = currUserRoleValidate == 'L' ? -1 : EmpNo;
    //

    TicketRoundChartObj.destroy();
    ContainerRoundChartObj.destroy();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        $.fn.getCountAndValuesFor8Boxes();

    }, 500);
});

$('#btnSototal').on('click', function () {

    totalRevenueChart.destroy();
    //overViewChart.destroy();

    //totalRevenueChartElcc = [];
    //let compId = $('#selectTypeOpt option:selected').text().trim();
    //let manId = $('#selectmanager option:selected').val().trim();
    //let salesmanId = $('#selectsalesman option:selected').val() == 'undefined' ? '' : $('#selectsalesman option:selected').val().trim();
    //let selectedYear = ddlYearId.val();
    let currLoginUser = EmpNo.trim();
    //let userStatus = $('#ddlActiveOrDeactiveUser option:selected').val().trim();

    loadWinLostData();
    loadBarRevenueChartTheme();

});
$('#btnSoProductWise').on('click', function () {
    //totalRevenueChartElcc = [];
    totalRevenueChart.destroy();

    let compId = $('#selectTypeOpt option:selected').text().trim();
    let manId = $('#selectmanager option:selected').val().trim();
    let salesmanId = $('#selectsalesman option:selected').val().trim();
    let selectedYear = ddlYearId.val();
    let currLoginUser = EmpNo.trim();
    let userStatus = $('#ddlActiveOrDeactiveUser option:selected').val().trim();

    loadWinLostData();
    loadBarRevenueChartTheme();
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
        url: "PurchaseDashboard.aspx/GetCountAndValuesOfTopRightBoxes",
        data: JSON.stringify({ "FromDate": $('#weeklyDatePickerStart').val(), "ToDate": $('#weeklyDatePickerEnd').val(), 'TicketFor': selTicType }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $(".ajax-loader").fadeOut(500);
            totalCountDBrd = 0;
            totalValueDBrd = 0;
            if (currUserRoleValidate = "PL") { $('.dbSwitcher li .active').text().trim() == "Purchase" ? $('.tic-pending-heading').html('SUBMITTED') : $('.tic-pending-heading').html('REQUESTED') }
            else if (currUserRoleValidate = "L") { $('.tic-pending-heading').html('REQUESTED') }
            else if (currUserRoleValidate = "P") { $('.tic-pending-heading').html('SUBMITTED') }
            else { $('.dbSwitcher li .active').text().trim() == "Purchase" ? $('.tic-pending-heading').html('SUBMITTED') : $('.tic-pending-heading').html('REQUESTED') }

            listTopRightBoxes = result.d.listTopRightbox;
            listMovementStatsues = result.d.listMovementStatusesBoxes;
            listContStatusesCount = result.d.listContainerStatus;
            listCountriesOnMap = result.d.listCountriesMap;

            $('.air-fr-count, .air-fr-value, .lcl-count, .lcl-value, .bbulk-count, .bbulk-value, .fcl-count, .fcl-value, .roro-count, .roro-value, .courier-count, .courier-value, .gc-count, .gc-value, .land-count, .land-value').html('0');
            $.each(listTopRightBoxes, function (key, item) {
                totalCountDBrd += parseInt(item.Count);
                totalValueDBrd += item.Count != 0 ? parseInt(item.Value) : 0;
                if (item.Name == "AIR") {
                    $('.air-fr-count').html(item.Count);
                    $('.air-fr-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "LCL") {
                    $('.lcl-count').html(item.Count);
                    $('.lcl-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "B.BULK") {
                    $('.bbulk-count').html(item.Count);
                    $('.bbulk-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "FCL") {
                    $('.fcl-count').html(item.Count);
                    $('.fcl-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "UNT") { //extra
                    //$('.').html(item.Count);
                    //$('.').html(item.Value);
                }
                else if (item.Name == "RO RO") {
                    $('.roro-count').html(item.Count);
                    $('.roro-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "COURRIER") {
                    $('.courier-count').html(item.Count);
                    $('.courier-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "GC") { //extra
                    $('.gc-count').html(item.Count);
                    $('.gc-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "ROAD") { //extra
                    $('.land-count').html(item.Count);
                    $('.land-value').html(nFormatter(item.Value));
                }
            });   //For Top-Right 8 Boxes


            $.each(listMovementStatsues, function (key, item) {
                //totalCountDBrd += item.Name !='Ticket Closed' ? parseInt(item.Count) : 0;
                //totalValueDBrd += item.Name != 'Ticket Closed' ?  (item.Count != 0 ? parseInt(item.Value) : 0) : 0;
                if (item.Name == "Landed On Port") {
                    $('.LOP-count').html(item.Count);
                    $('.LOP-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "Out For Delivery") {
                    $('.OFD-count').html(item.Count);
                    $('.OFD-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "Cargo Delivered") {
                    $('.CDel-count').html(item.Count);
                    $('.CDel-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "Transit") {
                    $('.transit-count').html(item.Count);
                    $('.transit-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "Ticket Closed") {
                    $('.tic-closed-count').html(item.Count);
                    $('.tic-closed-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "Delivery Order Collection") {
                    $('.DOC-count').html(item.Count);
                    $('.DOC-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "Ticket Created") {
                    $('.tic-created').html(item.Count);

                    //if (currUserRoleValidate = "PL") {
                    //    $('.dbSwitcher li .active').text().trim() == "Purchase" ? $('.tic-pending, .tic-created').html(item.Count) : $('.tic-created').html(item.Count);
                    //} else if (currUserRoleValidate = "L") {
                    //    $(' .tic-created').html(item.Count);
                    //} else if (currUserRoleValidate = "P") {
                    //    $('.tic-pending, .tic-created').html(item.Count);
                    //}

                }
                else if (item.Name == "Ticket Submitted") { //for logistic person, submitted should be pending because the request coming from purchase person.
                    $('.tic-pending').html(item.Count)
                    //if (currUserRoleValidate = "PL") {
                    //    $('.dbSwitcher li .active').text().trim() != "Purchase" ? $('.tic-pending').html(item.Count) : '';
                    //} else if (currUserRoleValidate = "L") {
                    //    $('.tic-pending').html(item.Count)
                    //}
                }
                else if (item.Name == "Ticket Rejected") { //extra
                    $('.tic-rejected').html(item.Count);
                    //$('.').html(item.Value);
                }
                else if (item.Name == "Ticket Accepted") { //extra
                    $('.tic-accepted').html(item.Count);
                    //$('.').html(item.Value);
                }
                else if (item.Name == "Original Received From Bank") { //extra
                    $('.ORFB-count').html(item.Count);
                    $('.ORFB-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "Direct Delivery") { //extra
                    $('.dd-count').html(item.Count);
                    $('.dd-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "BOE Approved") { //extra
                    $('.BOE-count').html(item.Count);
                    $('.BOE-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "Waiting For Original Docs") { //extra
                    $('.WFODOC-count').html(item.Count);
                    $('.WFODOC-value').html(nFormatter(item.Value));
                }
                else if (item.Name == "LCM Created") { //extra
                    $('.LCMC-count').html(item.Count);
                    $('.LCMC-value').html(nFormatter(item.Value));
                }
            });  // For Left-Bottom boxes

            $('.total-count-curr').html('<span style="color: #cd5050;"> <b>Total Count</b>: </span> <span style="color:#e36535">' + totalCountDBrd + '</span>');
            $('.total-values-curr').html('<span style="color: #cd5050;"><b>Total Value</b>: </span> <span style="color:#e36535">' + nFormatter(totalValueDBrd) + ' AED' + '</span>');

            //for tickets charts assigning value
            $('.tic-total').html(parseInt($('.tic-pending').text()) + parseInt($('.tic-accepted').text()) + parseInt($('.tic-rejected').text()) + parseInt($('.tic-created').text()));
            arrTicketRoundChart = [];
            arrTicketRoundChart.push(parseInt($('.tic-accepted').text()));
            arrTicketRoundChart.push(parseInt($('.tic-pending').text()));
            arrTicketRoundChart.push(parseInt($('.tic-created').text()));
            arrTicketRoundChart.push(parseInt($('.tic-rejected').text()));
            loadTicketsRoundChart();
            //ticket end

            //for container
            $.each(listContStatusesCount, function (key, item) {
                if (item.Name.toUpperCase() == 'NOT UPDATED') {
                    $('.cont-wait-assign').html(item.Count);
                }
                else if (item.Name.toUpperCase() == 'MTY TO TOWN') {
                    $('.mty-to-town-count').html(item.Count);
                }
                else if (item.Name.toUpperCase() == 'FCL TO TOWN') {
                    $('.fcl-to-town-count').html(item.Count);
                }
                else if (item.Name.toUpperCase() == 'LANDED FROM VESSEL') {
                    $('.land-from-vsl-count').html(item.Count);
                }
            });
            $('.cont-total').html(parseInt($('.cont-wait-assign').text()) + parseInt($('.mty-to-town-count').text()) + parseInt($('.fcl-to-town-count').text()) + parseInt($('.land-from-vsl-count').text()));
            arrContainerRoundChart = [];
            arrContainerRoundChart.push(parseInt($('.cont-wait-assign').text()));
            arrContainerRoundChart.push(parseInt($('.land-from-vsl-count').text()));
            arrContainerRoundChart.push(parseInt($('.fcl-to-town-count').text()));
            arrContainerRoundChart.push(parseInt($('.mty-to-town-count').text()));
            loadContainerRoundChart();
            //container end


            //drawMarkOnMap();
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}
//function getCountAndValuesFor8Boxes() {

//}



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


//purchase
function loadTicketsRoundChart() {

    // OverView Chart Chart
    // --------------------------------------------------------------------
    var exInternalChartcc = document.querySelector('#ticketRoundChart'),
        orderExInChartConfig = {
            chart: {
                height: 140,
                width: 110,
                type: 'donut'
            },
            labels: ['Accepted', 'Pending', 'Created', 'Rejected'],
            series: arrTicketRoundChart, //[500, 122, 500, 550],
            colors: [config.colors.success, config.colors.warning, config.colors.info, config.colors.danger],
            stroke: {
                width: 5,
                colors: cardColor
            },
            dataLabels: {
                enabled: false,
                formatter: function (val, opt) {
                    //return parseInt(val) + '%';
                }
            },
            legend: {
                show: false
            },
            grid: {
                padding: {
                    top: 0,
                    bottom: 0,
                    right: 15
                }
            },
            plotOptions: {
                pie: {
                    donut: {
                        size: '75%',
                        labels: {
                            show: true,
                            value: {
                                fontSize: '1.5rem',
                                fontFamily: 'Public Sans',
                                color: headingColor,
                                offsetY: -15,
                                formatter: function (val) {
                                    //return parseInt(val) + '%';
                                }
                            },
                            name: {
                                offsetY: 20,
                                fontFamily: 'Public Sans'
                            },
                            total: {
                                show: true,
                                fontSize: '0.8125rem',
                                color: axisColor,
                                label: 'Ticket',//'Secured',
                                formatter: function (w) {
                                    //return securedValueForOverview;
                                }
                            }
                        }
                    }
                }
            }
        };
    if (typeof exInternalChartcc !== undefined && exInternalChartcc !== null) {
        TicketRoundChartObj = new ApexCharts(exInternalChartcc, orderExInChartConfig);
        TicketRoundChartObj.render();
    }

}


function loadContainerRoundChart() {

    // OverView Chart Chart
    // --------------------------------------------------------------------
    var exInternalChartcc = document.querySelector('#containerRoundChart'),
        orderExInChartConfig = {
            chart: {
                height: 140,
                width: 110,
                type: 'donut'
            },
            labels: ['Waiting Assignment', 'Landed From Vessel', 'FCL to Town', 'MTY to Town'],
            series: arrContainerRoundChart, //[500, 122, 500, 550],
            colors: [config.colors.info, config.colors.success, config.colors.danger, config.colors.warning],
            stroke: {
                width: 5,
                colors: cardColor
            },
            dataLabels: {
                enabled: false,
                formatter: function (val, opt) {
                    //return parseInt(val) + '%';
                }
            },
            legend: {
                show: false
            },
            grid: {
                padding: {
                    top: 0,
                    bottom: 0,
                    right: 15
                }
            },
            plotOptions: {
                pie: {
                    donut: {
                        size: '75%',
                        labels: {
                            show: true,
                            value: {
                                fontSize: '1.5rem',
                                fontFamily: 'Public Sans',
                                color: headingColor,
                                offsetY: -15,
                                formatter: function (val) {
                                    //return parseInt(val) + '%';
                                }
                            },
                            name: {
                                offsetY: 20,
                                fontFamily: 'Public Sans'
                            },
                            total: {
                                show: true,
                                fontSize: '0.8125rem',
                                color: axisColor,
                                label: 'Container',//'Secured',
                                formatter: function (w) {
                                    //return securedValueForOverview;
                                }
                            }
                        }
                    }
                }
            }
        };
    if (typeof exInternalChartcc !== undefined && exInternalChartcc !== null) {
        ContainerRoundChartObj = new ApexCharts(exInternalChartcc, orderExInChartConfig);
        ContainerRoundChartObj.render();
    }

}



//function 
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



function initiatePieChart() {

    let assigned = parseFloat((100 / 120) * 100).toFixed(1);
    let started = parseFloat((70 / 120) * 100).toFixed(1);
    let completed = parseFloat((60 / 120) * 100).toFixed(1);
    let rejected = parseFloat((5 / 120) * 100).toFixed(1);
    let cancelled = parseFloat((3 / 120) * 100).toFixed(1);

    pChartObj = $("#chartContainer").CanvasJSChart({
        title: {
            text: "Tickets and Tasks by Status",
            fontSize: 24
        },
        axisY: {
            title: "Products in %"
        },
        legend: {
            //verticalAlign: "center", 
            //horizontalAlign: "right" 
            verticalAlign: "center",
            horizontalAlign: "left"
        },
        data: [
            {
                type: "pie",
                showInLegend: true,
                toolTipContent: "{label} <br/> {y} %",
                indexLabel: "{y} %",
                dataPoints: [
                    //{ label: "Requested", y: 120, legendText: "Requested: 120", color:'#ffab00' },
                    { label: "Requested", y: 0, legendText: "Requested: 120", color:'#ffab00' },
                    { label: "Assigned", y: assigned, legendText: "Assigned: 100", color: '#069f90' },
                    { label: "Started", y: started, legendText: "Started: 70", color: '#56b8e6' },
                    { label: "Completed", y: completed, legendText: "Completed: 60", color: '#a3dc15' },
                    { label: "Rejected", y: rejected, legendText: "Rejected: 5", color: '#ff3e1d' },
                    { label: "Cancelled", y: cancelled, legendText: "Cancelled: 3", color: '#ae2710' }
                ]
            }
        ]
    });

}


//horizon bar
//var barArr = [
//    {
//        type: "bar",
//        showInLegend: true,
//        legendText: "Gold",
//        color: "gold",
//        dataPoints: [
//            { y: 198, label: "Italy" },
//            { y: 201, label: "China" },
//            { y: 202, label: "France" },
//            { y: 236, label: "Great Britain" },
//            { y: 395, label: "Soviet Union" },
//            { y: 957, label: "USA" }
//        ]
//    },
//    {
//        type: "bar",
//        showInLegend: true,
//        legendText: "Silver",
//        color: "silver",
//        dataPoints: [
//            { y: 166, label: "Italy" },
//            { y: 144, label: "China" },
//            { y: 223, label: "France" },
//            { y: 272, label: "Great Britain" },
//            { y: 319, label: "Soviet Union" },
//            { y: 759, label: "USA" }
//        ]
//    },
//    {
//        type: "bar",
//        showInLegend: true,
//        legendText: "Bronze",
//        color: "#DCA978",
//        dataPoints: [
//            { y: 185, label: "Italy" },
//            { y: 128, label: "China" },
//            { y: 246, label: "France" },
//            { y: 272, label: "Great Britain" },
//            { y: 296, label: "Soviet Union" },
//            { y: 666, label: "USA" }
//        ]
//    }
//]


var barArr = [
    {
        type: "bar",
        showInLegend: true,
        legendText: "Assigned Task",
        color: "#3aa7d3", //Blue
        dataPoints: [            
            { y: 68, label: "Sharjeel" },
            { y: 60, label: "Shihab" },
            { y: 50, label: "Ann" },
            { y: 80, label: "Casie" },
            { y: 55, label: "Thansi Alkasim" },
            { y: 65, label: "Abdu" },
            { y: 100, label: "Elyza Ferrer" },
            { y: 76, label: "Abdul Navas" },
            { y: 90, label: "Anwar Ahmed" }
            //{ y: 957, label: "USA" }
        ]
    },
    {
        type: "bar",
        showInLegend: true,
        legendText: "Completed",
        color: "#a3dc15", //Green
        dataPoints: [            
            { y: 60, label: "Sharjeel" },
            { y: 56, label: "Shihab" },
            { y: 45, label: "Ann" },
            { y: 70, label: "Casie" },
            { y: 45, label: "Thansi Alkasim" },
            { y: 55, label: "Abdu" },
            { y: 85, label: "Elyza Ferrer" },
            { y: 68, label: "Abdul Navas" },
            { y: 80, label: "Anwar Ahmed" }
            //{ y: 759, label: "USA" }
        ]
    },
    {
        type: "bar",
        showInLegend: true,
        legendText: "Remaining",
        color: "#ffa606",
        dataPoints: [            
            { y: 8, label: "Sharjeel" },
            { y: 4, label: "Shihab" },
            { y: 5, label: "Ann" },
            { y: 10, label: "Casie" },    
            { y: 10, label: "Thansi Alkasim" },
            { y: 10, label: "Abdu" },
            { y: 15, label: "Elyza Ferrer" },
            { y: 8, label: "Abdul Navas" },
            { y: 10, label: "Anwar Ahmed" }
            //{ y: 666, label: "USA" }
        ]
    }
]
function initiateBarCharHorizon() {
    var chart = new CanvasJS.Chart("barcharhorizon",
        {
            title: {
                text: "Assigned Tasks vs Completed Tasks",
                fontSize: 24
            },
            label:{
                fontSize: 4,
                color:'red'
            },
            axisY: {
                title: "No. of Tasks",
                maximum: 120
            },
            data: barArr
        });

    chart.render();
}