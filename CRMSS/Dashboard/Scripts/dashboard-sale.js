
//var growthChartEl;


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

var profitArray = [], lossArray = [], MonthArrayGraph = [];
const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
var securedValueForOverview = '', securedValueForecastOpp = 0, securedValueFuturForecastOpp = 0, securedValuePendingForecastOpp = 0;

cardColor = config.colors.white;
headingColor = config.colors.headingColor;
axisColor = config.colors.axisColor;
borderColor = config.colors.borderColor;


var compId = '';
var manId = '';
var salesmanId = '';
var selectedYear = '';

$(document).ready(function () {
    fillYearDropdown();
    $('#growthReportId').html(new Date().getFullYear());

    selectedYear = new Date().getMonth() == 0 ? (parseInt(ddlYearId.val()) - 1) : ddlYearId.val();
    ddlYearId.val(selectedYear);

    loadDDLCompany();
    loadDDLManager($('#selectTypeOpt option:selected').text().trim(), currUserId.val());
    loadDDLSal(currUserId.val(), $('#selectTypeOpt option:selected').text().trim(), manId);

    getAllDashboardDataValues();

    // $('#dashboardProPic').attr("src", imgPath.val());
    // $('.loggedin-username').html(empName.val());
});

function fillYearDropdown() {
    
    var htm = '';
    for (var i = 0; i < 3; i++) {
        let year = new Date().getFullYear() - i;
        htm += '<option value="' + year + '">' + year+'</option>';
    }
    ddlYearId.html(htm);
}

$('#btnSearchDashBoard').on('click', function () {
    selectedYear = ddlYearId.val();

    barChartForFinalizationCard.destroy();
    barChartForPipelineCard.destroy();
    growthChart.destroy();
    totalRevenueChart.destroy();
    growthChartEmpOverAll.destroy();

    growthChartEmp1.destroy();
    growthChartEmp2.destroy();
    growthChartEmp3.destroy();
    growthChartEmp4.destroy();
    growthChartEmp5.destroy();
    growthChartEmp6.destroy();

    getAllDashboardDataValues();
});

$('#btnSototal').on('click', function () {

    totalRevenueChart.destroy();

    //totalRevenueChartElcc = [];
    let compId = $('#selectTypeOpt option:selected').text().trim();
    let manId = $('#selectmanager option:selected').val().trim();
    let salesmanId = $('#selectsalesman option:selected').val() == 'undefined' ? '' : $('#selectsalesman option:selected').val().trim();
    let selectedYear = ddlYearId.val();
    let currLoginUser = currUserId.val().trim();
    let userStatus = $('#ddlActiveOrDeactiveUser option:selected').val().trim();

    loadWinLostData(compId, manId, salesmanId, currLoginUser, selectedYear, userStatus, "0");
    loadBarRevenueChartTheme();

});
$('#btnSoProductWise').on('click', function () {
    //totalRevenueChartElcc = [];
    totalRevenueChart.destroy();

    let compId = $('#selectTypeOpt option:selected').text().trim();
    let manId = $('#selectmanager option:selected').val().trim();
    let salesmanId = $('#selectsalesman option:selected').val().trim();
    let selectedYear = ddlYearId.val();
    let currLoginUser = currUserId.val().trim();
    let userStatus = $('#ddlActiveOrDeactiveUser option:selected').val().trim();

    loadWinLostData(compId, manId, salesmanId, currLoginUser, selectedYear, userStatus, "1");
    loadBarRevenueChartTheme();
});

function getAllDashboardDataValues() {
    //growthChartElcc =[];
    //totalRevenueChartElcc = [];


    arrForGCSaleEmp4 = [];
    arrForGCSaleEmp5 = [];
    arrForGCSaleEmp6 = [];
    arrForGCSaleEmp1 = [];
    arrForGCSaleEmp2 = [];
    arrForGCSaleEmp3 = [];
    overAllPerfo = 0;
    arrOverallPerf = [];


    let compId = $('#selectTypeOpt option:selected').text().trim();
    let manId = $('#selectmanager option:selected').val().trim();
    let salesmanId = $('#selectsalesman option:selected').val() == undefined ? '' : $('#selectsalesman option:selected').val().trim(); //$('#selectsalesman option:selected').val().trim();
    //let selectedYear = ddlYearId.val();
    let currLoginUser = currUserId.val().trim();
    let userStatus = $('#ddlActiveOrDeactiveUser option:selected').val().trim();

    //for cards
    loadSalesCalForGC1(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);  //compId, manId, salesmanId, currLoginUser, selectedYear, userStatus
    loadSalesCalForGC2(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    loadSalesCalForGC3(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    loadSalesCalForGC4(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    loadSalesCalForGC5(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    loadSalesCalForGC6(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    loadUserDetails(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);


    loadNumbersOfJOH(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    loadNumbersOfFinalized(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    loadNumberOfSalesForecast(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    loadPipline(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    loadFinalPrice(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    getCurrentForcastedOpportunities(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    getFutureForcastedOpportunities(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    getPendingForcastedOpportunities(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);

    loadBChartValForFinalCard(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    loadBChartValForPipelineCard(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);

    //load for chart value
    loadWinLostData(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus, "0");
    ////loadWonPerDataByYear(compId, manId, salesmanId, currLoginUser, selectedYear );

    getValueForProductOrValueBar(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    ////loadLossByProductOrValueBarChart();
    ////loadLossByProductOrValueBarChart();
    //end here 

    //chart calling

    loadGrowthChartForSalesCalculationForEmp();
    loadBarRevenueChartTheme();
    loadGrowthChartTheme();
    loadFinalizationbarChart();
    loadPipelinebarChart();
    ///loadForecastOppChart();
    /// loadFutureForecastOppChart();
    loadGrowthChartCRMSOverAll();

    //growthChart.update();
    //totalRevenueChart.update();

    ///  barChartForPipelineCard.options.scales.yAxes[0].ticks.display = false;
    //$('#Pipeline').css("height", $('.pipe-parent-height').height() + "px")
    ////barChartForPipelineCard.chart.canvas.clientHeight = 191;
    ////barChartForFinalizationCard.update();
    //barChartForPipelineCard.update();

    /// barChartForFinalizationCard.options.scales.yAxes[0].ticks.display = false;
    //$('#Finalization').css("height", $('.finalize-parent-height').height() + "px");
    //barChartForFinalizationCard.update();

    ////barChartForLostByCompitOrvalue.update();
    //end here

    loadOpenOpportunities(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    loadTop50Tender(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);
    loadOverview(compId, "-1", salesmanId, currLoginUser, selectedYear, userStatus);

    //chart calling
    loadOverViewRoundChart();

    //growthChartEmp1.update();
    //growthChartEmp2.update();
    //growthChartEmp3.update();

}

function loadDDLCompany() {

    $.ajax({
        url: "SaleDashboard.aspx/LoadCompanyDropdown",
        type: "POST",
        data: JSON.stringify({ "userId": currUserId.val() }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            companyList = '';

            $.each(result.d, function (key, item) {
                companyList += '<option value="bg-primary">' + item.CompanyName + ' </option>';

            });
            $('#selectTypeOpt').html(companyList);
            //compId = $('#selectTypeOpt option:selected').val();
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}

function loadDDLManager(compId, uId) {
    compId = compId;

    $.ajax({
        url: "SaleDashboard.aspx/LoadManagerDropdown",
        type: "POST",
        data: JSON.stringify({ "compId": compId, "userId": uId }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            managerList = result.d.length > 1 ? '<option value="-1"> All </option>' : '';

            $.each(result.d, function (key, item) {
                managerList += '<option value="' + item.ManagerId + '">' + item.ManagerName + ' </option>';

            });

            $('#selectmanager').html(managerList);
            loadDDLSal(currUserId.val(), compId, $('#selectmanager option:selected').val().trim());
            manId = $('#selectmanager option:selected').val();
            //compId = $('#selectTypeOpt option:selected').text().trim();
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}

function loadDDLSal(uId, compId, manId) {

    $.ajax({
        url: "SaleDashboard.aspx/LoadSalemanDropdown",
        type: "POST",
        data: JSON.stringify({ "userId": uId, "compId": compId, "manId": manId }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            salesmanList = result.d.length > 1 ? '<option value="-1"> All </option>' : '';

            $.each(result.d, function (key, item) {
                salesmanList += '<option value="' + item.SalemanId + '">' + item.SalemanName + ' </option>';

            });
            $('#selectsalesman').html(salesmanList);
            salesmanId = $('#selectsalesman option:selected').val();
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}


//chart initialization start here

function loadGrowthChartForSalesCalculationForEmp() {

    growthChartForSaleEmp1 = document.querySelector('#growthChartCRMS1'),
        growthChartOptions1 = {
            series: arrAchiechedPercValueForGC1, //yearPercValueForGrowthGraph
            labels: [nFormatter(arrForGCSaleEmp1)],//[''],
            chart: {
                height: 200,
                type: 'radialBar'
            },
            plotOptions: {
                radialBar: {
                    size: 150,
                    offsetY: 25,
                    startAngle: -150,
                    endAngle: 150,
                    hollow: {
                        size: '45%'
                    },
                    track: {
                        background: cardColor,
                        strokeWidth: '100%'
                    },
                    dataLabels: {
                        name: {
                            offsetY: 18,
                            color: headingColor,
                            fontSize: '12px',  // text inside circle "won perc"
                            fontWeight: '600',
                            fontFamily: 'Public Sans'
                        },
                        value: {
                            offsetY: -14,
                            color: headingColor,
                            fontSize: '22px',
                            fontWeight: '500',
                            fontFamily: 'Public Sans'
                        }
                    }
                }
            },
            colors: [getLightShade(arrAchiechedPercValueForGC1)], // ['#12C05D'] growth char color Green
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.5,
                    gradientToColors: [getDarkShade(arrAchiechedPercValueForGC1)], ///['#12C05D'] growth char color Green
                    inverseColors: true,
                    opacityFrom: 1,
                    opacityTo: 0.6,
                    stops: [30, 70, 100]
                }
            },
            stroke: {
                dashArray: 5
            },
            grid: {
                padding: {
                    top: -35,
                    bottom: -10
                }
            },
            states: {
                hover: {
                    filter: {
                        type: 'none'
                    }
                },
                active: {
                    filter: {
                        type: 'none'
                    }
                }
            }
        };
    if (typeof growthChartForSaleEmp1 !== undefined && growthChartForSaleEmp1 !== null) {
        growthChartEmp1 = new ApexCharts(growthChartForSaleEmp1, growthChartOptions1);
        growthChartEmp1.render();
    }

    //-------------------------2--------------------------------

    growthChartForSaleEmp2 = document.querySelector('#growthChartCRMS2'),
        growthChartOptions2 = {
            series: arrAchiechedPercValueForGC2, //yearPercValueForGrowthGraph
            labels: [nFormatter(arrForGCSaleEmp2)],//[''],
            chart: {
                height: 200,
                type: 'radialBar'
            },
            plotOptions: {
                radialBar: {
                    size: 150,
                    offsetY: 25,
                    startAngle: -150,
                    endAngle: 150,
                    hollow: {
                        size: '45%'
                    },
                    track: {
                        background: cardColor,
                        strokeWidth: '100%'
                    },
                    dataLabels: {
                        name: {
                            offsetY: 18,
                            color: headingColor,
                            fontSize: '12px',  // text inside circle "won perc"
                            fontWeight: '600',
                            fontFamily: 'Public Sans'
                        },
                        value: {
                            offsetY: -14,
                            color: headingColor,
                            fontSize: '22px',
                            fontWeight: '500',
                            fontFamily: 'Public Sans'
                        }
                    }
                }
            },
            colors: [getLightShade(arrAchiechedPercValueForGC2)], // growth char color Green
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.5,
                    gradientToColors: [getDarkShade(arrAchiechedPercValueForGC2)], /// growth char color Green
                    inverseColors: true,
                    opacityFrom: 1,
                    opacityTo: 0.6,
                    stops: [30, 70, 100]
                }
            },
            stroke: {
                dashArray: 5
            },
            grid: {
                padding: {
                    top: -35,
                    bottom: -10
                }
            },
            states: {
                hover: {
                    filter: {
                        type: 'none'
                    }
                },
                active: {
                    filter: {
                        type: 'none'
                    }
                }
            }
        };
    if (typeof growthChartForSaleEmp2 !== undefined && growthChartForSaleEmp2 !== null) {
        growthChartEmp2 = new ApexCharts(growthChartForSaleEmp2, growthChartOptions2);
        growthChartEmp2.render();
    }

    //------------------------3----------------------------------

    growthChartForSaleEmp3 = document.querySelector('#growthChartCRMS3'),
        growthChartOptions3 = {
            series: arrAchiechedPercValueForGC3, //yearPercValueForGrowthGraph
            labels: [nFormatter(arrForGCSaleEmp3)],//[''],
            chart: {
                height: 200,
                type: 'radialBar'
            },
            plotOptions: {
                radialBar: {
                    size: 150,
                    offsetY: 25,
                    startAngle: -150,
                    endAngle: 150,
                    hollow: {
                        size: '45%'
                    },
                    track: {
                        background: cardColor,
                        strokeWidth: '100%'
                    },
                    dataLabels: {
                        name: {
                            offsetY: 18,
                            color: headingColor,
                            fontSize: '12px',  // text inside circle "won perc"
                            fontWeight: '600',
                            fontFamily: 'Public Sans'
                        },
                        value: {
                            offsetY: -14,
                            color: headingColor,
                            fontSize: '22px',
                            fontWeight: '500',
                            fontFamily: 'Public Sans'
                        }
                    }
                }
            },
            colors: [getLightShade(arrAchiechedPercValueForGC3)], // growth char color Green
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.5,
                    gradientToColors: [getDarkShade(arrAchiechedPercValueForGC3)], /// growth char color Green
                    inverseColors: true,
                    opacityFrom: 1,
                    opacityTo: 0.6,
                    stops: [30, 70, 100]
                }
            },
            stroke: {
                dashArray: 5
            },
            grid: {
                padding: {
                    top: -35,
                    bottom: -10
                }
            },
            states: {
                hover: {
                    filter: {
                        type: 'none'
                    }
                },
                active: {
                    filter: {
                        type: 'none'
                    }
                }
            }
        };
    if (typeof growthChartForSaleEmp3 !== undefined && growthChartForSaleEmp3 !== null) {
        growthChartEmp3 = new ApexCharts(growthChartForSaleEmp3, growthChartOptions3);
        growthChartEmp3.render();
    }

    //------------------------4----------------------------------

    growthChartForSaleEmp4 = document.querySelector('#growthChartCRMS4'),
        growthChartOptions4 = {
            series: arrAchiechedPercValueForGC4, //yearPercValueForGrowthGraph
            labels: [nFormatter(arrForGCSaleEmp4)],//[''],
            chart: {
                height: 200,
                type: 'radialBar'
            },
            plotOptions: {
                radialBar: {
                    size: 150,
                    offsetY: 25,
                    startAngle: -150,
                    endAngle: 150,
                    hollow: {
                        size: '45%'
                    },
                    track: {
                        background: cardColor,
                        strokeWidth: '100%'
                    },
                    dataLabels: {
                        name: {
                            offsetY: 18,
                            color: headingColor,
                            fontSize: '12px',  // text inside circle "won perc"
                            fontWeight: '600',
                            fontFamily: 'Public Sans'
                        },
                        value: {
                            offsetY: -14,
                            color: headingColor,
                            fontSize: '22px',
                            fontWeight: '500',
                            fontFamily: 'Public Sans'
                        }
                    }
                }
            },
            colors: [getLightShade(arrAchiechedPercValueForGC4)], // growth char color Green
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.5,
                    gradientToColors: [getDarkShade(arrAchiechedPercValueForGC4)], /// growth char color Green
                    inverseColors: true,
                    opacityFrom: 1,
                    opacityTo: 0.6,
                    stops: [30, 70, 100]
                }
            },
            stroke: {
                dashArray: 5
            },
            grid: {
                padding: {
                    top: -35,
                    bottom: -10
                }
            },
            states: {
                hover: {
                    filter: {
                        type: 'none'
                    }
                },
                active: {
                    filter: {
                        type: 'none'
                    }
                }
            }
        };
    if (typeof growthChartForSaleEmp4 !== undefined && growthChartForSaleEmp4 !== null) {
        growthChartEmp4 = new ApexCharts(growthChartForSaleEmp4, growthChartOptions4);
        growthChartEmp4.render();
    }

    //------------------------5----------------------------------

    growthChartForSaleEmp5 = document.querySelector('#growthChartCRMS5'),
        growthChartOptions5 = {
            series: arrAchiechedPercValueForGC5, //yearPercValueForGrowthGraph
            labels: [nFormatter(arrForGCSaleEmp5)],//[''],
            chart: {
                height: 200,
                type: 'radialBar'
            },
            plotOptions: {
                radialBar: {
                    size: 150,
                    offsetY: 25,
                    startAngle: -150,
                    endAngle: 150,
                    hollow: {
                        size: '45%'
                    },
                    track: {
                        background: cardColor,
                        strokeWidth: '100%'
                    },
                    dataLabels: {
                        name: {
                            offsetY: 18,
                            color: headingColor,
                            fontSize: '12px',  // text inside circle "won perc"
                            fontWeight: '600',
                            fontFamily: 'Public Sans'
                        },
                        value: {
                            offsetY: -14,
                            color: headingColor,
                            fontSize: '22px',
                            fontWeight: '500',
                            fontFamily: 'Public Sans'
                        }
                    }
                }
            },
            colors: [getLightShade(arrAchiechedPercValueForGC5)], // growth char color Green
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.5,
                    gradientToColors: [getDarkShade(arrAchiechedPercValueForGC5)], /// growth char color Green
                    inverseColors: true,
                    opacityFrom: 1,
                    opacityTo: 0.6,
                    stops: [30, 70, 100]
                }
            },
            stroke: {
                dashArray: 5
            },
            grid: {
                padding: {
                    top: -35,
                    bottom: -10
                }
            },
            states: {
                hover: {
                    filter: {
                        type: 'none'
                    }
                },
                active: {
                    filter: {
                        type: 'none'
                    }
                }
            }
        };
    if (typeof growthChartForSaleEmp5 !== undefined && growthChartForSaleEmp5 !== null) {
        growthChartEmp5 = new ApexCharts(growthChartForSaleEmp5, growthChartOptions5);
        growthChartEmp5.render();
    }

    //------------------------6----------------------------------

    growthChartForSaleEmp6 = document.querySelector('#growthChartCRMS6'),
        growthChartOptions6 = {
            series: arrAchiechedPercValueForGC6, //yearPercValueForGrowthGraph
            labels: [nFormatter(arrForGCSaleEmp6)],
            chart: {
                height: 200,
                type: 'radialBar'
            },
            plotOptions: {
                radialBar: {
                    size: 150,
                    offsetY: 25,
                    startAngle: -150,
                    endAngle: 150,
                    hollow: {
                        size: '45%'
                    },
                    track: {
                        background: cardColor,
                        strokeWidth: '100%'
                    },
                    dataLabels: {
                        name: {
                            offsetY: 18,
                            color: headingColor,
                            fontSize: '12px',  // text inside circle "won perc"
                            fontWeight: '600',
                            fontFamily: 'Public Sans'
                        },
                        value: {
                            offsetY: -14,
                            color: headingColor,
                            fontSize: '22px',
                            fontWeight: '500',
                            fontFamily: 'Public Sans'
                        }
                    }
                }
            },
            colors: [getLightShade(arrAchiechedPercValueForGC6)], // growth char color Green
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.5,
                    gradientToColors: [getDarkShade(arrAchiechedPercValueForGC6)], /// growth char color Green
                    inverseColors: true,
                    opacityFrom: 1,
                    opacityTo: 0.6,
                    stops: [30, 70, 100]
                }
            },
            stroke: {
                dashArray: 5
            },
            grid: {
                padding: {
                    top: -35,
                    bottom: -10
                }
            },
            states: {
                hover: {
                    filter: {
                        type: 'none'
                    }
                },
                active: {
                    filter: {
                        type: 'none'
                    }
                }
            }
        };
    if (typeof growthChartForSaleEmp6 !== undefined && growthChartForSaleEmp6 !== null) {
        growthChartEmp6 = new ApexCharts(growthChartForSaleEmp6, growthChartOptions6);
        growthChartEmp6.render();
    }
}

function loadGrowthChartCRMSOverAll() {

    growthChartForSaleEmpOverAll = document.querySelector('#growthChartCRMSOverAll'),
        growthChartOptionsOverAll = {
            series: arrOverallPerf, //yearPercValueForGrowthGraph
            labels: [''],//[''],
            chart: {
                height: 200,
                type: 'radialBar'
            },
            plotOptions: {
                radialBar: {
                    size: 150,
                    offsetY: 25,
                    startAngle: -150,
                    endAngle: 150,
                    hollow: {
                        size: '45%'
                    },
                    track: {
                        background: cardColor,
                        strokeWidth: '100%'
                    },
                    dataLabels: {
                        name: {
                            offsetY: 1,
                            color: headingColor,
                            fontSize: '0px',  // text inside circle "won perc"
                            fontWeight: '600',
                            fontFamily: 'Public Sans'
                        },
                        value: {
                            offsetY: -14,
                            color: headingColor,
                            fontSize: '22px',
                            fontWeight: '500',
                            fontFamily: 'Public Sans'
                        }
                    }
                }
            },
            colors: [getLightShade(arrOverallPerf)], // ['#12C05D'] growth char color Green
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.5,
                    gradientToColors: [getDarkShade(arrOverallPerf)], ///['#12C05D'] growth char color Green
                    inverseColors: true,
                    opacityFrom: 1,
                    opacityTo: 0.6,
                    stops: [30, 70, 100]
                }
            },
            stroke: {
                dashArray: 5
            },
            grid: {
                padding: {
                    top: -35,
                    bottom: -10
                }
            },
            states: {
                hover: {
                    filter: {
                        type: 'none'
                    }
                },
                active: {
                    filter: {
                        type: 'none'
                    }
                }
            }
        };
    if (typeof growthChartForSaleEmpOverAll !== undefined && growthChartForSaleEmpOverAll !== null) {
        growthChartEmpOverAll = new ApexCharts(growthChartForSaleEmpOverAll, growthChartOptionsOverAll);
        growthChartEmpOverAll.render();
    }
}

function loadBarRevenueChartTheme() {


    // Total Revenue Report Chart - Bar Chart
    // --------------------------------------------------------------------
    totalRevenueChartElcc = document.querySelector('#totalRevenueChartCRMS'),
        totalRevenueChartOptions = {
            series: [
                {
                    name: 'Won', //'2021',
                    data: profitArray // [18, 7, 15, 29, 18, 12, 9] //profitArray
                },
                {
                    name: 'Loss', //'2020',
                    data: lossArray //  [-13, -18, -9, -14, -5, -17, -15] //lossArray
                }
            ],
            chart: {
                height: 300,
                stacked: true,
                type: 'bar',
                toolbar: { show: false },

            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '80%',
                    columnHeight: '80%',
                    borderRadius: 0,
                    startingShape: 'rounded',
                    endingShape: 'rounded'
                }
            },
            colors: [profitBarColor, lossBarColor], //[config.colors.primary, config.colors.info],
            dataLabels: {
                enabled: false,
                //formatter: function (val, opt) {
                //    return parseInt(val) + '%';
                //}
            },
            stroke: {
                curve: 'smooth',
                width: 6,
                lineCap: 'round',
                colors: [cardColor]
            },
            legend: {
                show: true,
                horizontalAlign: 'left',
                position: 'top',
                markers: {
                    height: 8,
                    width: 8,
                    radius: 12,
                    offsetX: -3
                },
                labels: {
                    colors: axisColor
                },
                itemMargin: {
                    horizontal: 10
                }
            },
            grid: {
                borderColor: borderColor,
                padding: {
                    top: 0,
                    bottom: -8,
                    left: 20,
                    right: 20
                }
            },
            xaxis: {
                categories: MonthArrayGraph,// monthNames,//,MonthArrayGraph
                labels: {
                    style: {
                        fontSize: '13px',
                        colors: axisColor
                    }
                },
                axisTicks: {
                    show: false
                },
                axisBorder: {
                    show: false
                }
            },
            yaxis: {
                labels: {
                    style: {
                        fontSize: '13px',
                        colors: axisColor,
                    }
                }
            },
            responsive: [
                {
                    breakpoint: 1700,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '32%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1580,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '35%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1440,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '42%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1300,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '48%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1200,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '40%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1040,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 11,
                                columnWidth: '48%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 991,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '30%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 840,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '35%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 768,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '28%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 640,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '32%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 576,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '37%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 480,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '45%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 420,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '52%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 380,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '60%'
                            }
                        }
                    }
                }
            ],
            states: {
                hover: {
                    filter: {
                        type: 'none'
                    }
                },
                active: {
                    filter: {
                        type: 'none'
                    }
                }
            }
        };
    if (typeof totalRevenueChartElcc !== undefined && totalRevenueChartElcc !== null) {
        totalRevenueChart = new ApexCharts(totalRevenueChartElcc, totalRevenueChartOptions);
        totalRevenueChart.render();
    }


}

function loadGrowthChartTheme() {


    growthChartElcc = document.querySelector('#growthChartCRMS'),
        growthChartOptions = {
            series: [yearPercValueForGrowthGraph],
            labels: ['Won Perc'],//[''],
            chart: {
                height: 240,
                type: 'radialBar'
            },
            plotOptions: {
                radialBar: {
                    size: 150,
                    offsetY: 0,
                    startAngle: -150,
                    endAngle: 150,
                    hollow: {
                        size: '40%'
                    },
                    track: {
                        background: cardColor,
                        strokeWidth: '100%'
                    },
                    dataLabels: {
                        name: {
                            offsetY: 15,
                            color: headingColor,
                            fontSize: '15px',
                            fontWeight: '600',
                            fontFamily: 'Public Sans'
                        },
                        value: {
                            offsetY: -25,
                            color: headingColor,
                            fontSize: '22px',
                            fontWeight: '500',
                            fontFamily: 'Public Sans'
                        }
                    }
                }
            },
            colors: ['#12C05D'], // growth char color Green
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.5,
                    gradientToColors: ['#12C05D'], /// growth char color Green
                    inverseColors: true,
                    opacityFrom: 1,
                    opacityTo: 0.6,
                    stops: [30, 70, 100]
                }
            },
            stroke: {
                dashArray: 5
            },
            grid: {
                padding: {
                    top: -35,
                    bottom: -10
                }
            },
            states: {
                hover: {
                    filter: {
                        type: 'none'
                    }
                },
                active: {
                    filter: {
                        type: 'none'
                    }
                }
            }
        };
    if (typeof growthChartElcc !== undefined && growthChartElcc !== null) {
        growthChart = new ApexCharts(growthChartElcc, growthChartOptions);
        growthChart.render();
    }

}

function loadOverViewRoundChart() {

    // OverView Chart Chart
    // --------------------------------------------------------------------
    overViewChartcc = document.querySelector('#overViewChart'),
        orderChartConfig = {
            chart: {
                height: 165,
                width: 130,
                type: 'donut'
            },
            labels: ['Secured', 'Under Risk', 'Early to Judge', 'Lost'],
            series: arrOverViewChart, //[500, 122, 500, 550],
            colors: [config.colors.success, config.colors.warning, config.colors.info, config.colors.danger],
            stroke: {
                width: 5,
                colors: cardColor
            },
            dataLabels: {
                enabled: false,
                formatter: function (val, opt) {
                    return parseInt(val) + '%';
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
                                    return parseInt(val) + '%';
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
                                label: 'Secured',
                                formatter: function (w) {
                                    return securedValueForOverview;
                                }
                            }
                        }
                    }
                }
            }
        };
    if (typeof overViewChartcc !== undefined && overViewChartcc !== null) {
        overViewChart = new ApexCharts(overViewChartcc, orderChartConfig);
        overViewChart.render();
    }

}

function loadForecastOppChart() {

    // Current month forecast Chart
    // --------------------------------------------------------------------
    forecastedOppViewChartcc = document.querySelector('#forecastedOppChart'),
        orderChartForecastOppConfig = {
            chart: {
                height: 165,
                width: 130,
                type: 'donut'
            },
            labels: ['Total'],
            series: [securedValueForecastOpp], //arrForecastOppChart,//[0, 0, 0, 0], 
            colors: [config.colors.success],
            stroke: {
                width: 5,
                colors: cardColor
            },
            dataLabels: {
                enabled: false,
                formatter: function (val, opt) {
                    return nFormatter(parseInt(val));
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
                                    return nFormatter(parseInt(val));
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
                                label: 'Secured',
                                formatter: function (w) {
                                    return securedValueForecastOpp + "%";
                                }
                            }
                        }
                    }
                }
            }
        };
    if (typeof forecastedOppViewChartcc !== undefined && forecastedOppViewChartcc !== null) {
        forecastedOppViewChart = new ApexCharts(forecastedOppViewChartcc, orderChartForecastOppConfig);
        forecastedOppViewChart.render();
    }

}
function loadPendingForecastOppChart() {

    // Current month forecast Chart
    // --------------------------------------------------------------------
    const pendingForecastedOppViewChartcc = document.querySelector('#pendingForecastedOppChart'),
        orderChartPendingForecastOppConfig = {
            chart: {
                height: 165,
                width: 130,
                type: 'donut'
            },
            labels: ['Total'],
            series: [securedValuePendingForecastOpp], //arrForecastOppChart,//[0, 0, 0, 0], 
            colors: [config.colors.success],
            stroke: {
                width: 5,
                colors: cardColor
            },
            dataLabels: {
                enabled: false,
                formatter: function (val, opt) {
                    return nFormatter(parseInt(val));
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
                                    return nFormatter(parseInt(val));
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
                                label: 'Secured',
                                formatter: function (w) {
                                    return securedValuePendingForecastOpp + "%";
                                }
                            }
                        }
                    }
                }
            }
        };
    if (typeof pendingForecastedOppViewChartcc !== undefined && pendingForecastedOppViewChartcc !== null) {
        pendingForecastedOppViewChart = new ApexCharts(pendingForecastedOppViewChartcc, orderChartPendingForecastOppConfig);
        pendingForecastedOppViewChart.render();
    }

}
function loadFutureForecastOppChart() {
    //arrFutureForecastOppChart
    //--------------------------------------------------------------------
    futureForecastedOppViewChartcc = document.querySelector('#futureForecastedOppChart'),
        orderChartFutureForecastOppConfig = {
            chart: {
                height: 165,
                width: 130,
                type: 'donut'
            },
            labels: ['Secured'],     //['Total Value', 'Open', 'Lost'],
            series: [securedValueFuturForecastOpp],     //arrFutureForecastOppChart, 
            colors: [config.colors.success],
            stroke: {
                width: 5,
                colors: cardColor
            },
            dataLabels: {
                enabled: false,
                formatter: function (val, opt) {
                    return nFormatter(parseInt(val));
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
                                    return nFormatter(parseInt(val));
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
                                label: 'Secured',
                                formatter: function (w) {
                                    return securedValueFuturForecastOpp + "%"; /*securedValueForecastOpp;*/
                                }
                            }
                        }
                    }
                }
            }
        };
    if (typeof futureForecastedOppViewChartcc !== undefined && futureForecastedOppViewChartcc !== null) {
        futureForecastedOppViewChart = new ApexCharts(futureForecastedOppViewChartcc, orderChartFutureForecastOppConfig);
        futureForecastedOppViewChart.render();
    }

}


function loadPipelinebarChart() {

    const barChartForPipelineCardcc = document.querySelector('#Pipeline'),
        barChartForPipelineCardOptions = {
            series: [
                {
                    name: 'Won', //'2021',
                    data: arrayForPipelineBarChartY_Axis // [18, 7, 15, 29, 18, 12, 9] //profitArray
                }
            ],
            chart: {
                height: 200,
                width: 300,
                stacked: true,
                type: 'bar',
                toolbar: { show: false },

            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '100%',
                    columnHeight: '80%',
                    borderRadius: 0,
                    startingShape: 'rounded',
                    endingShape: 'rounded'
                }
            },
            colors: ['#1689fc', lossBarColor], //[config.colors.primary, config.colors.info],
            dataLabels: {
                enabled: false,
                //formatter: function (val, opt) {
                //    return parseInt(val) + '%';
                //}
            },
            stroke: {
                curve: 'smooth',
                width: 6,
                lineCap: 'round',
                colors: [cardColor]
            },
            legend: {
                show: true,
                horizontalAlign: 'left',
                position: 'top',
                markers: {
                    height: 8,
                    width: 8,
                    radius: 12,
                    offsetX: -3
                },
                labels: {
                    colors: axisColor
                },
                itemMargin: {
                    horizontal: 10
                }
            },
            grid: {
                borderColor: borderColor,
                padding: {
                    top: 0,
                    bottom: -8,
                    left: 20,
                    right: 20
                }
            },
            xaxis: {
                categories: arrayForPipelineBarChartX_Axis,// monthNames,//,MonthArrayGraph
                labels: {
                    style: {
                        fontSize: '13px',
                        colors: axisColor
                    }
                },
                axisTicks: {
                    show: false
                },
                axisBorder: {
                    show: false
                }
            },
            yaxis: {
                labels: {
                    style: {
                        fontSize: '0px',
                        colors: axisColor,
                    }
                }
            },
            responsive: [
                {
                    breakpoint: 1700,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '32%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1580,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '35%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1440,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '42%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1300,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '48%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1200,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '40%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1040,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 11,
                                columnWidth: '48%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 991,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '30%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 840,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '35%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 768,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '28%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 640,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '32%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 576,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '37%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 480,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '45%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 420,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '52%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 380,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '60%'
                            }
                        }
                    }
                }
            ],
            states: {
                hover: {
                    filter: {
                        type: 'none'
                    }
                },
                active: {
                    filter: {
                        type: 'none'
                    }
                }
            }
        };
    if (typeof barChartForPipelineCardcc !== undefined && barChartForPipelineCardcc !== null) {
        barChartForPipelineCard = new ApexCharts(barChartForPipelineCardcc, barChartForPipelineCardOptions);
        barChartForPipelineCard.render();
    }

}
function loadFinalizationbarChart() {

    const barChartForFinalizationCardcc = document.querySelector('#Finalization'),
        barChartForFinalizationCardOptions = {
            series: [
                {
                    name: 'Won', //'2021',
                    data: arrayForFinalizedBarChartY_Axis // [18, 7, 15, 29, 18, 12, 9] //profitArray
                }
            ],
            chart: {
                height: 200,
                width: 300,
                stacked: true,
                type: 'bar',
                toolbar: { show: false },

            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '100%',
                    columnHeight: '80%',
                    borderRadius: 0,
                    startingShape: 'rounded',
                    endingShape: 'rounded'
                }
            },
            colors: ['#49b824', lossBarColor], //[config.colors.primary, config.colors.info],
            dataLabels: {
                enabled: false,
                //formatter: function (val, opt) {
                //    return parseInt(val) + '%';
                //}
            },
            stroke: {
                curve: 'smooth',
                width: 6,
                lineCap: 'round',
                colors: [cardColor]
            },
            legend: {
                show: true,
                horizontalAlign: 'left',
                position: 'top',
                markers: {
                    height: 8,
                    width: 8,
                    radius: 12,
                    offsetX: -3
                },
                labels: {
                    colors: axisColor
                },
                itemMargin: {
                    horizontal: 10
                }
            },
            grid: {
                borderColor: borderColor,
                padding: {
                    top: 0,
                    bottom: -8,
                    left: 20,
                    right: 20
                }
            },
            xaxis: {
                categories: arrayForFinalizedBarChartX_Axis,// monthNames,//,MonthArrayGraph
                labels: {
                    style: {
                        fontSize: '13px',
                        colors: axisColor
                    }
                },
                axisTicks: {
                    show: false
                },
                axisBorder: {
                    show: false
                }
            },
            yaxis: {
                labels: {
                    style: {
                        fontSize: '0px',
                        colors: axisColor,
                    }
                }
            },
            responsive: [
                {
                    breakpoint: 1700,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '32%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1580,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '35%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1440,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '42%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1300,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '48%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1200,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '40%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1040,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 11,
                                columnWidth: '48%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 991,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '30%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 840,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '35%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 768,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '28%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 640,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '32%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 576,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '37%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 480,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '45%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 420,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '52%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 380,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '60%'
                            }
                        }
                    }
                }
            ],
            states: {
                hover: {
                    filter: {
                        type: 'none'
                    }
                },
                active: {
                    filter: {
                        type: 'none'
                    }
                }
            }
        };
    if (typeof barChartForFinalizationCardcc !== undefined && barChartForFinalizationCardcc !== null) {
        barChartForFinalizationCard = new ApexCharts(barChartForFinalizationCardcc, barChartForFinalizationCardOptions);
        barChartForFinalizationCard.render();
    }

}



function loadLossByProductOrValueBarChart() {

    var xValues = barChartForLostByCompitOrvalueX_Axis;//["SM", "FP", "BMS", "FD", "SM", "FCD", "FC"];
    var yValues = barChartForLostByCompitOrvalueY_Axis;//[55, 49, 50, 60, 54, 45, 50,];
    var barColors = ["red", "red", "red", "red", "red", "red", "red"];
    barChartForLostByCompitOrvalue = new Chart("myChart", {
        type: "bar",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: barColors,
                data: yValues
            }]
        },
        options: {
            legend: { display: false },
            //title: {
            //    display: true,
            //    text: "Product Details"
            //}
        }
    });

}

///initialize chart end here

$('#selectTypeOpt').on('change', function () {
    //alert(this.value);
    //$('#selectTypeOpt option:selected').text().trim()
    compId = this.selectedOptions[0].text.trim();
    loadDDLManager(compId, currUserId.val());

});
$('#selectmanager').on('change', function () {

    compId = $('#selectTypeOpt option:selected').text().trim();
    manId = this.selectedOptions[0].value.trim();

    loadDDLSal(currUserId.val(), compId, manId);
});

//function fillYearDropdown() {
//    var htm = '';
//    for (var i = 3; i >= 0; i--) {
//        htm += '<a class="dropdown-item" href="javascript:void(0);">' + (new Date().getFullYear() - i) + '</a>';
//    }
//    $('.db-year-ddl').append(htm);
//}



function loadWinLostData(compId, managerId, salesmanId, uId, year, uStatus, oper) {

    $.ajax({
        url: "SaleDashboard.aspx/GetWonLostgraph",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus, "Oper": oper }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            profitArray = [];
            lossArray = [];
            MonthArrayGraph = [];
            let sumOfWon = 0, sumOfLost = 0;
            yearPercValueForGrowthGraph = 0;

            $.each(result.d, function (key, item) {

                sumOfWon += parseFloat(item.SoValue) * 1000000;
                sumOfLost += parseFloat(item.LostValue) * 1000000;

                profitArray.push(
                    item.SoValue == "" ? 0 : item.SoValue
                );
                lossArray.push(
                    item.LostValue == "" ? 0 : ('-' + item.LostValue)
                );
                if (oper == 0) {
                    MonthArrayGraph.push(monthNames[item.MonthNumber - 1]);
                }
                else {
                    MonthArrayGraph.push(item.MonthNumber);
                }
                //}
            });

            yearPercValueForGrowthGraph = (sumOfWon == 0 && sumOfLost == 0) ? 0 : parseFloat((parseInt(sumOfWon) / (parseInt(sumOfWon) + parseInt(sumOfLost))) * 100).toFixed(1);
            if (oper == 0) {

                $('.roundgraph-year-profit h6').html(nFormatter(sumOfWon));
                $('.roundgraph-year-loss h6').html(nFormatter(sumOfLost));
            }
            //let listWonYear = result.d.WonYearValList;
            //let listLostYear = result.d.LostYearValList;

            //$.each(listWonYear, function (key, item) {

            //    profitArray.push(
            //        item.WonValue == "" ? 0 : item.WonValue
            //    );            
            //    MonthArrayGraph.push(monthNames[item.Month + 1]);           
            //});

            //$.each(listLostYear, function (key, item) {
            //    lossArray.push(
            //        item.LostValue == "" ? 0 : ('-' + item.LostValue)
            //    );

            //});


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadWonPerDataByYear(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "SaleDashboard.aspx/GetWonPerc",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            yearPercValueForGrowthGraph = [];
            //$('.roundgraph-year-profit h6').html(parseFloat(d3.format(".2s")(result.d[0].WonValue)).toFixed(1));
            //$('.roundgraph-year-loss h6').html(parseFloat(d3.format(".2s")(result.d[0].LostValue)).toFixed(1));
            if (result.d.length > 0) {
                $('.roundgraph-year-profit h6').html(nFormatter(result.d[0].WonValue));
                $('.roundgraph-year-loss h6').html(nFormatter(result.d[0].LostValue));
                yearPercValueForGrowthGraph.push(result.d[0].WinPerc);
            } else {
                $('.roundgraph-year-profit h6').html(0);
                $('.roundgraph-year-loss h6').html(0);
                yearPercValueForGrowthGraph.push(0);
            }


            //loadBarRevenueChartTheme();
            //loadGrowthChartTheme();
            showbarGraphYAxisLabelAsMillion();

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}


function loadSalesCalForGC1(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "SaleDashboard.aspx/GetSalesCalForGC1",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            arrAchiechedPercValueForGC1 = [];
            arrAchiechedPercValueForGC1.push(parseInt(result.d[0].WinPerc == "" ? 0 : result.d[0].WinPerc ));
            arrForGCSaleEmp1.push(parseInt(result.d[0].WonValue == 0 ? 0 : result.d[0].WonValue));
            $('#g-chart-crms1').html(nFormatter(parseInt(result.d[0].Target == "" ? 0 : result.d[0].Target)));
            overAllPerfo = overAllPerfo + parseFloat(result.d[0].LostValue == "" ? 0 : result.d[0].LostValue);
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function loadSalesCalForGC2(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "SaleDashboard.aspx/GetSalesCalForGC2",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            arrAchiechedPercValueForGC2 = [];
            arrAchiechedPercValueForGC2.push(parseInt(result.d[0].WinPerc == "" ? 0 : result.d[0].WinPerc));
            arrForGCSaleEmp2.push(parseInt(result.d[0].WonValue == 0 ? 0 : result.d[0].WonValue));
            $('#g-chart-crms2').html(nFormatter(parseInt(result.d[0].Target == "" ? 0 : result.d[0].Target)));
            overAllPerfo = overAllPerfo + parseFloat(result.d[0].LostValue == "" ? 0 : result.d[0].LostValue);

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function loadSalesCalForGC3(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "SaleDashboard.aspx/GetSalesCalForGC3",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            arrAchiechedPercValueForGC3 = [];
            arrAchiechedPercValueForGC3.push(parseInt(result.d[0].WinPerc == "" ? 0 : result.d[0].WinPerc));
            arrForGCSaleEmp3.push(parseInt(result.d[0].WonValue == 0 ? 0 : result.d[0].WonValue));
            $('#g-chart-crms3').html(nFormatter(parseInt(result.d[0].Target == "" ? 0 : result.d[0].Target)));
            overAllPerfo = overAllPerfo + parseFloat(result.d[0].LostValue == "" ? 0 : result.d[0].LostValue);
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function loadSalesCalForGC4(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "SaleDashboard.aspx/GetSalesCalForGC4",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            arrAchiechedPercValueForGC4 = [];
            //arrAchiechedPercValueForGC4.push(parseInt(result.d[0].WinPerc));
            arrAchiechedPercValueForGC4.push(parseInt(result.d[0].WinPerc == "" ? 0 : result.d[0].WinPerc));
            arrForGCSaleEmp4.push(parseInt(result.d[0].WonValue == 0 ? 0 : result.d[0].WonValue));
            $('#g-chart-crms4').html(nFormatter(parseInt(result.d[0].Target == "" ? 0 : result.d[0].Target)));
            overAllPerfo = overAllPerfo + parseFloat(result.d[0].LostValue == "" ? 0 : result.d[0].LostValue);
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function loadSalesCalForGC5(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "SaleDashboard.aspx/GetSalesCalForGC5",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            arrAchiechedPercValueForGC5 = [];
            arrAchiechedPercValueForGC5.push(parseInt(result.d[0].WinPerc == "" ? 0 : result.d[0].WinPerc));
            arrForGCSaleEmp5.push(parseInt(result.d[0].WonValue == 0 ? 0 : result.d[0].WonValue));
            $('#g-chart-crms5').html(nFormatter(parseInt(result.d[0].Target == "" ? 0 : result.d[0].Target)));
            overAllPerfo = overAllPerfo + parseFloat(result.d[0].LostValue == "" ? 0 : result.d[0].LostValue);
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function loadSalesCalForGC6(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "SaleDashboard.aspx/GetSalesCalForGC6",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            arrAchiechedPercValueForGC6 = [];
            arrAchiechedPercValueForGC6.push(parseInt(result.d[0].WinPerc));
            arrForGCSaleEmp6.push(parseInt(result.d[0].WonValue));
            $('#g-chart-crms6').html(parseInt(result.d[0].Target));
            overAllPerfo = overAllPerfo + parseFloat(result.d[0].LostValue);


            arrOverallPerf.push(parseInt(overAllPerfo));
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}
function loadUserDetails(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "SaleDashboard.aspx/GetUserImage",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d.length > 0) {
                $('#dashboardProPic').attr("src", result.d[0].ImagePath);
                if (overAllPerfo < 50) {
                    if (uId != result.d[0].EmpID) {
                        $('.loggedin-username').html(result.d[0].EmpName + "<br /><br /> Red Flag. Your overall performance is beyond the acceptable mark! We urge you to take the necessary actions to improve your performance immediately.");

                    }
                    else {
                        $('.loggedin-username').html("Hi  " + result.d[0].EmpName + "<br /><br /> Red Flag. Your overall performance is beyond the acceptable mark! We urge you to take the necessary actions to improve your performance immediately.");
                    }
                }
                else if (overAllPerfo < 70) {
                    if (uId != result.d[0].EmpID) {
                        $('.loggedin-username').html(result.d[0].EmpName + "<br /><br /> Your overall performance is not up to standards; we urge you to generate an effective recovery plan  to drastically improve your %Efficiency.");
                    }
                    else {
                        $('.loggedin-username').html("Hi  " + result.d[0].EmpName + "<br /><br /><span>Your overall performance is not up to standards; we urge you to generate an effective recovery plan  to drastically improve your %Efficiency.");
                    }
                }
                else if (overAllPerfo >= 70) {
                    if (uId != result.d[0].EmpID) {
                        $('.loggedin-username').html(result.d[0].EmpName + "<br /><br /> Job well done! Keep your inner fire ignited");
                    }
                    else {
                        $('.loggedin-username').html("Hi " + result.d[0].EmpName + "<br /><br /> Job well done! Keep your inner fire ignited");
                    }

                }
            }
            else {
                $('#dashboardProPic').attr("src", '../Images/Profile/alternet.png');
                $('.loggedin-username').html('');
            }

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}


function loadNumberOfSalesForecast(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({

        url: "SaleDashboard.aspx/GetNumbersOfSalesForecast",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.sales-forecast-value-card').html(result.d[0].SalesForecastValue == "" ? 0 : nFormatter(result.d[0].SalesForecastValue));
            $('.sales-forecast-value-card-count').html(result.d[0].SalesForecastedCount == "" ? 0 : result.d[0].SalesForecastedCount);

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}

function loadFinalPrice(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "SaleDashboard.aspx/GetFinalPrice",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            //$('.final-price-value-card').html(result.d[0].FinalPriceValue);
            $('.final-price-value-card').html(nFormatter(result.d[0].FinalPriceValue));
            $('.final-price-value-card-count').html(nFormatter(result.d[0].FinalPriceCount));

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}

function loadNumbersOfJOH(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "SaleDashboard.aspx/GetNumbersOfJOH",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.no-joh-count').html(result.d[0].OTPCount);

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });


}

function loadNumbersOfFinalized(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "SaleDashboard.aspx/GetNumbersOfFinalized",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            result.d.length > 0 ? $('.no-of-finalized-count').html(nFormatter(result.d[0].FinalizedValue)) : '';

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });


}

function loadBChartValForFinalCard(compId, managerId, salesmanId, uId, year, uStatus) {
    arrayForFinalizedBarChartX_Axis = []; arrayForFinalizedBarChartY_Axis = [];
    $.ajax({
        url: "SaleDashboard.aspx/GetBarChartValueForFinalizedCard",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $.each(result.d, function (key, item) {

                arrayForFinalizedBarChartX_Axis.push(
                    item.Product == "" ? "N/A" : item.Product
                );

                arrayForFinalizedBarChartY_Axis.push(
                    item.FinalizedValue == "" ? 0 : item.FinalizedValue
                );

            });

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}

function loadPipline(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "SaleDashboard.aspx/GetPiplineValue",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            result.d.length > 0 ? $('.pipeline-value-card').html(nFormatter(result.d[0].PipelineValue)) : '';

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}

function loadBChartValForPipelineCard(compId, managerId, salesmanId, uId, year, uStatus) {
    arrayForPipelineBarChartX_Axis = []; arrayForPipelineBarChartY_Axis = []
    $.ajax({
        url: "SaleDashboard.aspx/GetBarChartValueForPipelineCard",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $.each(result.d, function (key, item) {

                arrayForPipelineBarChartX_Axis.push(
                    item.Product == "" ? "N/A" : item.Product
                );

                arrayForPipelineBarChartY_Axis.push(
                    item.PipelineValue == "" ? 0 : item.PipelineValue
                );

            });

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}

function loadOverview(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "SaleDashboard.aspx/GetOverview",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            arrOverViewChart = [];

            var item = result.d[0];

            $('.oview-joh-count').html(nFormatter(item.JOHCount));
            $('.ov-secured-value').html(nFormatter(item.SecuredValue));
            $('.ov-underrisk-value').html(nFormatter(item.UnderRiskValue));
            $('.ov-ontrack-value').html(nFormatter(item.OnTrackValue));
            $('.ov-earlytojudge-value').html(nFormatter(item.EarlyToJudgeValue));
            $('.ov-lost-value').html(nFormatter(item.LostValue));
            $('.ov-others-value').html(nFormatter(item.OthersValue));

            if (item.JOHCount == 0 || item.SecuredValue == 0) {
                $('#SvgjsText1302').html('0%');
                securedValueForOverview = '0%';
            } else {
                securedValueForOverview = (parseInt((item.SecuredValue / item.JOHCount) * 100)) + '%';
                $('#SvgjsText1302').html(parseInt((item.SecuredValue / item.JOHCount) * 100) + '%');
            }


            orderChartConfig.series.push(parseInt(item.SecuredValue));
            orderChartConfig.series.push(parseInt(item.UnderRiskValue));
            orderChartConfig.series.push(parseInt(item.EarlyToJudgeValue));
            orderChartConfig.series.push(parseInt(item.LostValue));
            //arrOverViewChart = [parseInt(item.SecuredValue), parseInt(item.UnderRiskValue), parseInt(item.EarlyToJudgeValue), parseInt(item.LostValue)]

            overViewChart.update();
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function getValueForProductOrValueBar(compId, managerId, salesmanId, uId, year, uStatus) {
    barChartForLostByCompitOrvalueX_Axis = []; barChartForLostByCompitOrvalueY_Axis = [];
    $.ajax({
        url: "SaleDashboard.aspx/GetValForLostByCompitOrValue",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $.each(result.d, function (key, item) {

                barChartForLostByCompitOrvalueX_Axis.push(
                    item.Product == "" ? "N/A" : item.Product
                );

                barChartForLostByCompitOrvalueY_Axis.push(
                    item.LostValue == "" ? 0 : item.LostValue
                );

            });

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function loadOpenOpportunities(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "SaleDashboard.aspx/GetTopOpportunities",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var topOpp = '';
            $.each(result.d, function (key, item) {

                topOpp += `<li class="d-flex mb-4 pb-1">
                    <div class="avatar flex-shrink-0 me-3">
                   
                                                   <i class="bx bx-basketball listoprty"></i>


                    </div>
                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2" style="width:70%">
                            <small class="text-muted d-block mb-1">	`+ item.Owner + `</small>                         
                                <a href="`+ item.OppId + `" class="mb-0">` + item.Name + `</a>
                        </div>
                        <div class="user-progress d-flex align-items-center gap-1">
                            <h6 class="mb-0">`+ nFormatter(item.Value) + `</h6>
                            <span class="text-muted">AED</span>
                        </div>
                    </div>
                </li>`;
            });

            $('.top-opportunity-ul').html(topOpp);

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function loadTop50Tender(compId, managerId, salesmanId, uId, year, uStatus) {

    $.ajax({
        url: "Dashboard.aspx/GetTopOpportunitiesTender",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var topOpp = '';
            $.each(result.d, function (key, item) {

                topOpp += `<li class="d-flex mb-4 pb-1">
                    <div class="avatar flex-shrink-0 me-3">
                   
                                                   <i class="bx bx-basketball listoprty"></i>


                    </div>
                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2" style="width:70%">
                            <small class="text-muted d-block mb-1">	`+ item.Owner + `</small>                         
                                <a href="`+ item.OppId + `" class="mb-0">` + item.Name + `</a>
                        </div>
                        <div class="user-progress d-flex align-items-center gap-1">
                            <h6 class="mb-0">`+ nFormatter(item.Value) + `</h6>
                            <span class="text-muted">AED</span>
                        </div>
                    </div>
                </li>`;
            });

            $('.top-opportunity-tender-ul').html(topOpp);

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function getCurrentForcastedOpportunities(compId, managerId, salesmanId, uId, year, uStatus) {
    arrForecastOppChart = [];
    $.ajax({
        url: "SaleDashboard.aspx/GetCurrentForcastedOpportunities",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {
            var topOpp = '';
            var sfValuesList = result.d[0].SalesForecastList;
            var sfChatValues = result.d[0].SaleForecastChartVal;
            //orderChartForecastOppConfig.series = [];

            $.each(sfValuesList, function (key, item) {

                //arrOverViewChart = [];
                //orderChartConfig.series = [];
                //var item = result.d[0];

                topOpp += `<li class="d-flex mb-4 pb-1">
                    <div class="avatar flex-shrink-0 me-3">
                   
                                                   <i class="bx bx-basketball listoprty"></i>


                    </div>
                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2" style="width:70%">
                            <small class="text-muted d-block mb-1">	`+ item.Owner + `</small>                         
                                <a href="`+ item.OptId + `" class="mb-0">` + item.OptName + `</a>
                        </div>
                        
<div>
                                <div style="text-align: center; color:#a92828; display:none;">`+ item.StatusCode + `</div>
                               
                            <div  class="user-progress d-flex align-items-center gap-1">
                            <h6 class="mb-0">`+ nFormatter(item.ForcastedValue) + `</h6>
                            <span class="text-muted">AED</span>
</div>
                            
                        </div>
                    </div>
                </li>`;
            });

            $('.forcasted-opportunity-ul').html(topOpp);
            var totalValue = parseInt(sfChatValues.TotalWonValue) + parseInt(sfChatValues.TotalLostValue) + parseInt(sfChatValues.NoSale) + parseInt(sfChatValues.TotalPipelineValue) + parseInt(sfChatValues.TotalFinalizedValue);
            $('.forecast-total-value').html(nFormatter(totalValue));

            //if ((parseInt(sfChatValues.TotalWonValue) == 0 && parseInt(sfChatValues.TotalValue)) == 0 || parseInt(sfChatValues.TotalValue == 0)) {
            //    securedValueForecastOpp = 0;
            //}
            //else {

            $('.forecast-won-value').html("Won: " + nFormatter(sfChatValues.TotalWonValue));
            $('.forecast-lost-value').html("Lost: " + nFormatter(sfChatValues.TotalLostValue));
            $('.forecast-nosal').html("No Sale: " + nFormatter(sfChatValues.NoSale));
            $('.forecast-pipeline').html("Pipeline: " + nFormatter(sfChatValues.TotalPipelineValue));
            $('.forecast-finalized').html("Finalized: " + nFormatter(sfChatValues.TotalFinalizedValue));

            //arrForecastOppChart.push(parseInt(sfChatValues.TotalWonValue));
            //arrForecastOppChart.push(parseInt(sfChatValues.TotalLostValue));
            //arrForecastOppChart.push(parseInt(sfChatValues.NoSale));
            //arrForecastOppChart.push(parseInt(sfChatValues.TotalPipelineValue));
            //arrForecastOppChart.push(parseInt(sfChatValues.TotalFinalizedValue));
            securedValueForecastOpp = parseInt(sfChatValues.Secured);

            //}
            loadForecastOppChart();

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function getPendingForcastedOpportunities(compId, managerId, salesmanId, uId, year, uStatus) {
    //arrForecastOppChart = [];
    $.ajax({
        url: "SaleDashboard.aspx/GetPendingForcastedOpportunities",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var topOpp = '';
            var sfValuesList = result.d[0].SalesForecastList;
            var sfChatValues = result.d[0].SaleForecastChartVal;

            $.each(sfValuesList, function (key, item) {

                topOpp += `<li class="d-flex mb-4 pb-1">
                    <div class="avatar flex-shrink-0 me-3">
                   
                                                   <i class="bx bx-basketball listoprty"></i>


                    </div>
                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2" style="width:70%">
                            <small class="text-muted d-block mb-1">	`+ item.Owner + `</small>                         
                                <a href="`+ item.OptId + `" class="mb-0">` + item.OptName + `</a>
                        </div>
                    <div>
                                <div style="text-align: center; color:#a92828; display:none;">`+ item.StatusCode + `</div>
                               
                            <div  class="user-progress d-flex align-items-center gap-1">
                            <h6 class="mb-0">`+ nFormatter(item.ForcastedValue) + `</h6>
                            <span class="text-muted">AED</span>
</div>
                    </div>
                </li>`;
            });

            $('.forcasted-pending-opportunity-ul').html(topOpp);
            var totalValue = parseInt(sfChatValues.TotalWonValue) + parseInt(sfChatValues.TotalLostValue) + parseInt(sfChatValues.NoSale) + parseInt(sfChatValues.TotalPipelineValue) + parseInt(sfChatValues.TotalFinalizedValue);
            $('.forecast-pending-total-value').html(nFormatter(totalValue));

            $('.pending-forecast-won-value').html("Won: " + nFormatter(sfChatValues.TotalWonValue));
            $('.pending-forecast-lost-value').html("Lost: " + nFormatter(sfChatValues.TotalLostValue));
            $('.pending-forecast-nosal').html("No Sale: " + nFormatter(sfChatValues.NoSale));
            $('.pending-forecast-pipeline').html("Pipeline: " + nFormatter(sfChatValues.TotalPipelineValue));
            $('.pending-forecast-finalized').html("Finalized: " + nFormatter(sfChatValues.TotalFinalizedValue));

            securedValuePendingForecastOpp = parseInt(sfChatValues.Secured);

            loadPendingForecastOppChart();
        },
        error: function (errormessage) {
            // alert(errormessage.responseText);
        }
    });
}

function getFutureForcastedOpportunities(compId, managerId, salesmanId, uId, year, uStatus) {
    arrFutureForecastOppChart = [];
    $.ajax({
        url: "SaleDashboard.aspx/GetFuturForcastedOpportunities",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId, "userId": uId, "year": year, "userStatus": uStatus }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var topOpp = '';
            var sfValuesList = result.d[0].SalesForecastList;
            var sfChatValues = result.d[0].SaleForecastChartVal;
            //orderChartFutureForecastOppConfig.series = null;

            $.each(sfValuesList, function (key, item) {

                topOpp += `<li class="d-flex mb-4 pb-1">
                    <div class="avatar flex-shrink-0 me-3">
                   
                                                   <i class="bx bx-basketball listoprty"></i>

                    </div>
                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2" style="width:70%">
                            <small class="text-muted d-block mb-1">	`+ item.Owner + `</small>                         
                                <a href="`+ item.OptId + `" class="mb-0">` + item.OptName + `</a>
                        </div>
                      <div>
                                <div style="text-align: center; color:#a92828; display:none;">`+ item.StatusCode + `</div>
                               
                            <div  class="user-progress d-flex align-items-center gap-1">
                            <h6 class="mb-0">`+ nFormatter(item.ForcastedValue) + `</h6>
                            <span class="text-muted">AED</span>
</div>
                    </div>
                </li>`;
            });

            $('.forcasted-futur-opportunity-ul').html(topOpp);
            var totalValue = parseInt(sfChatValues.TotalWonValue) + parseInt(sfChatValues.TotalLostValue) + parseInt(sfChatValues.NoSale) + parseInt(sfChatValues.TotalPipelineValue) + parseInt(sfChatValues.TotalFinalizedValue);
            $('.forecast-futur-total-value').html(nFormatter(totalValue));


            //arrFutureForecastOppChart.push(parseInt(sfChatValues.TotalWonValue));
            //arrFutureForecastOppChart.push(parseInt(sfChatValues.TotalLostValue));
            //arrFutureForecastOppChart.push(parseInt(sfChatValues.NoSale));
            //arrFutureForecastOppChart.push(parseInt(sfChatValues.TotalPipelineValue));
            //arrFutureForecastOppChart.push(parseInt(sfChatValues.TotalFinalizedValue));

            $('.futur-forecast-won-value').html("Won: " + nFormatter(sfChatValues.TotalWonValue));
            $('.futur-forecast-lost-value').html("Lost: " + nFormatter(sfChatValues.TotalLostValue));
            $('.futur-forecast-nosal').html("No Sale: " + nFormatter(sfChatValues.NoSale));
            $('.futur-forecast-pipeline').html("Pipeline: " + nFormatter(sfChatValues.TotalPipelineValue));
            $('.futur-forecast-finalized').html("Finalized: " + nFormatter(sfChatValues.TotalFinalizedValue));
            securedValueFuturForecastOpp = parseInt(sfChatValues.Secured);

            //}
            //futureForecastedOppViewChart.destroy();
            loadFutureForecastOppChart();
            ////futureForecastedOppViewChart.update();
            //futureForecastedOppViewChart.render();
            //futureForecastedOppViewChart.update();


        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}


$('.forecast-opp-tab ul li').on('click', function () {
    let navSelVal = $(this).find('button').text().trim();

    let compId = $('#selectTypeOpt option:selected').text().trim();
    let managerId = $('#selectmanager option:selected').val().trim();
    let salesmanId = $('#selectsalesman option:selected').val().trim();
    let year = ddlYearId.val();
    let uId = currUserId.val().trim();
    let userStatus = $('#ddlActiveOrDeactiveUser option:selected').val().trim();
    futureForecastedOppViewChart.destroy();
    forecastedOppViewChart.destroy();
    pendingForecastedOppViewChart.destroy();

    if (navSelVal == 'Current Month Forecast') {
        getCurrentForcastedOpportunities("-1", "-1", salesmanId, uId, year, userStatus);
    }
    else if (navSelVal == 'Previous Forecast') {
        getPendingForcastedOpportunities("-1", "-1", salesmanId, uId, year, userStatus);
    }
    else if (navSelVal == 'Future Forecast') {
        getFutureForcastedOpportunities("-1", "-1", salesmanId, uId, year, userStatus);
    }


});


// functions 

function showbarGraphYAxisLabelAsMillion() {

    //$(".apexcharts-yaxis tspan").each(function (e, v) {
    //    let spanId = v.id;
    //    $('#' + spanId).text(d3.format(".2s")($('#' + spanId).text()))
    //});
    $(".apexcharts-yaxis tspan").each(function (e, v) {
        let spanId = v.id;
        $('#' + spanId).text(nFormatter($('#' + spanId).text()))
    });
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


