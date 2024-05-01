
//var growthChartEl;


var growthChartElcc;
var growthChart;

var totalRevenueChartElcc;
var totalRevenueChart;

var overViewChartcc;
var overViewChart;

var barChartForFinalizationCard, barChartForPipelineCard;

var arrayForFinalizedBarChartX_Axis = [], arrayForFinalizedBarChartY_Axis = [], arrayForPipelineBarChartX_Axis =[], arrayForPipelineBarChartY_Axis= [];
let cardColor, headingColor, axisColor, shadeColor, borderColor; 
let profitBarColor = '#0B9747', lossBarColor = '#cf4848', yearPercValueForGrowthGraph=[];

var profitArray = [], lossArray = [], MonthArrayGraph=[];
const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
var securedValueForOverview = '';

cardColor = config.colors.white;
headingColor = config.colors.headingColor;
axisColor = config.colors.axisColor;
borderColor = config.colors.borderColor;


var compId = '';
var manId = '';
var salesmanId = '';


$(document).ready(function () {
    //fillYearDropdown();
    $('#growthReportId').html(new Date().getFullYear());
    
    loadDDLCompany();
    loadDDLManager($('#selectTypeOpt option:selected').text().trim(), currUserId.val());
    loadDDLSal(currUserId.val(), $('#selectTypeOpt option:selected').text().trim(), manId);

    getAllDashboardDataValues();
 

});

$('#btnSearchDashBoard').on('click', function () {

    getAllDashboardDataValues();
});


function getAllDashboardDataValues() {
    growthChartElcc =[];
    totalRevenueChartElcc = [];


    let compId = $('#selectTypeOpt option:selected').text().trim();
    let manId = $('#selectmanager option:selected').val().trim();
    let salesmanId = $('#selectsalesman option:selected').val().trim();

    //for cards
    loadNumbersOfJOH(compId, manId, salesmanId);
    loadNumbersOfFinalized(compId, manId, salesmanId);
    loadNumberOfSalesForecast(compId, manId, salesmanId);
    loadPipline(compId, manId, salesmanId);
    loadFinalPrice(compId, manId, salesmanId);

    loadBChartValForFinalCard(compId, manId, salesmanId);
    loadBChartValForPipelineCard(compId, manId, salesmanId);

    //load for cahrt value
    loadWinLostData(compId, manId, salesmanId);
    loadWonPerDataByYear(compId, manId, salesmanId);
    //end here 

    //chart calling
    loadBarRevenueChartTheme();
    loadGrowthChartTheme();
    loadFinalizationbarChart();
    loadPipelinebarChart();

    growthChart.update();
    totalRevenueChart.update();
    barChartForPipelineCard.options.scales.yAxes[0].ticks.display = false;
    barChartForPipelineCard.update();
    barChartForFinalizationCard.options.scales.yAxes[0].ticks.display = false;
    barChartForFinalizationCard.update();

    //end here

    loadOpenOpportunities(compId, manId, salesmanId);
    loadOverview(compId, manId, salesmanId);

    //chart calling
    loadOverViewRoundChart();

}

function loadDDLCompany() {

    $.ajax({
        url: "Dashboard.aspx/LoadCompanyDropdown",
        type: "POST",
        data: JSON.stringify({ "userId": currUserId.val() }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            companyList = '';

            $.each(result.d, function (key, item) {
                companyList += '<option value="bg-primary">'+item.CompanyName+' </option>';
                
            });
            $('#selectTypeOpt').html(companyList);
            //compId = $('#selectTypeOpt option:selected').val();
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}

function loadDDLManager(compId,uId) {
    compId = compId;

    $.ajax({
        url: "Dashboard.aspx/LoadManagerDropdown",
        type: "POST",
        data: JSON.stringify({ "compId": compId, "userId": uId }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            managerList = '<option value="-1"> All </option>';

            $.each(result.d, function (key, item) {
                managerList += '<option value="' +item.ManagerId+ '">' + item.ManagerName + ' </option>';

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
        url: "Dashboard.aspx/LoadSalemanDropdown",
        type: "POST",
        data: JSON.stringify({ "userId": uId, "compId": compId, "manId": manId}),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            salesmanList = '<option value="-1"> All </option>';

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
                    offsetY: 10,
                    startAngle: -150,
                    endAngle: 150,
                    hollow: {
                        size: '55%'
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

function loadBarRevenueChartTheme() {

    var profitBar = getProfitBar();
    var lossBar = getLossBar();

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
                    columnHeight: '100%',
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
                categories: monthNames,//,MonthArrayGraph
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
            series: [85, 10, 50, 50],
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



function loadFinalizationbarChart(){
    var xValues = arrayForFinalizedBarChartX_Axis;//["FF", "FP", "BMS", "FD", "SM", "FCD"];
    var yValues = arrayForFinalizedBarChartY_Axis;// [55, 49, 50, 60, 54, 50];
    var barColors = ['#49b824', '#49b824', '#49b824', '#49b824', '#49b824', '#49b824']; //["red", "green", "blue", "orange", "brown", "black"];
    barChartForFinalizationCard = new Chart("Finalization", {
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
            title: {
                display: true,
                text: "" //Finalization
            }
            
        }       
        
    });
}
function loadPipelinebarChart() {
    var xValues = arrayForPipelineBarChartX_Axis; //["FF", "FP", "BMS", "FD", "SM", "FCD"];
    var yValues = arrayForPipelineBarChartY_Axis; //[55, 49, 50, 60, 54, 50];
    var barColors = ['#7aa7eb', '#7aa7eb', '#7aa7eb', '#7aa7eb', '#7aa7eb', '#7aa7eb'];//["red", "green", "blue", "orange", "brown", "black"];
    barChartForPipelineCard = new Chart("Pipeline", {
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
            title: {
                display: true,
                text: "" //Pipeline
            }
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

function fillYearDropdown() {
    var htm = '';
    for (var i = 3; i >= 0; i--) {
        htm += '<a class="dropdown-item" href="javascript:void(0);">' + (new Date().getFullYear() - i) +'</a>';        
    }
    $('.db-year-ddl').append(htm);
}



function loadBChartValForFinalCard(compId, managerId, salesmanId) {
    arrayForFinalizedBarChartX_Axis = []; arrayForFinalizedBarChartY_Axis = [];
    $.ajax({
        url: "Dashboard.aspx/GetBarChartValueForFinalizedCard",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId }),
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
            alert(errormessage.responseText);
        }
    });

}

function loadBChartValForPipelineCard(compId, managerId, salesmanId) {
    arrayForPipelineBarChartX_Axis = []; arrayForPipelineBarChartY_Axis = []
    $.ajax({
        url: "Dashboard.aspx/GetBarChartValueForPipelineCard",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId }),
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
            alert(errormessage.responseText);
        }
    });

}




function getProfitPercentage() {

    return 60;
}

function getProfitBar() {
    return [18, 7, 15, 29, 18, 12, 90];

}
 
function getLossBar() {
    return [-13, -18, -9, 0, -5, -17, -150];
}



function loadWinLostData(compId,managerId,salesmanId) {
   
    $.ajax({
        url: "Dashboard.aspx/GetWonLostgraph",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            profitArray = [];
            lossArray = [];
            MonthArrayGraph = [];

            $.each(result.d, function (key, item) {
                //if (key < 6) {   item.WonValue == "" ? 0 : (d3.format(".2s")(item.WonValue)) // for showing in M eg 12M
                    profitArray.push(    
                        item.WonValue == "" ? 0 : item.WonValue
                    );
                    lossArray.push(
                        item.LostValue == "" ? 0 : ('-' + item.LostValue)
                    );

                    MonthArrayGraph.push(monthNames[item.Month + 1]);
                //}
                
            });
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadWonPerDataByYear(compId, managerId, salesmanId) {

    $.ajax({
        url: "Dashboard.aspx/GetWonPerc",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            yearPercValueForGrowthGraph = [];
            //$('.roundgraph-year-profit h6').html(parseFloat(d3.format(".2s")(result.d[0].WonValue)).toFixed(1));
            //$('.roundgraph-year-loss h6').html(parseFloat(d3.format(".2s")(result.d[0].LostValue)).toFixed(1));
            if (result.d.length > 0) {
                $('.roundgraph-year-profit h6').html(d3.format(".4s")(result.d[0].WonValue));
                $('.roundgraph-year-loss h6').html(d3.format(".4s")(result.d[0].LostValue));
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
            alert(errormessage.responseText);
        }
    });
}


function loadNumbersOfJOH(compId, managerId, salesmanId) {
    
    $.ajax({
        url: "Dashboard.aspx/GetNumbersOfJOH", 
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.no-joh-count').html(result.d[0].OTPCount);
           
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function loadNumbersOfFinalized(compId, managerId, salesmanId) {

    $.ajax({
        url: "Dashboard.aspx/GetNumbersOfFinalized",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            result.d.length > 0 ? $('.no-of-finalized-count').html(d3.format(".4s")(result.d[0].FinalizedValue)) : '';

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


function loadNumberOfSalesForecast(compId, managerId, salesmanId) {

    $.ajax({
        url: "Dashboard.aspx/GetNumbersOfSalesForecast",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.sales-forecast-value-card').html(d3.format(".4s")(result.d[0].SalesForecastValue));

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    
}

function loadPipline(compId, managerId, salesmanId) {

    $.ajax({
        url: "Dashboard.aspx/GetPiplineValue",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            result.d.length > 0 ? $('.pipeline-value-card').html(d3.format(".4s")(result.d[0].PipelineValue)) : '';

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function loadFinalPrice(compId, managerId, salesmanId) {

    $.ajax({
        url: "Dashboard.aspx/GetFinalPrice",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            //$('.final-price-value-card').html(result.d[0].FinalPriceValue);
            $('.final-price-value-card').html(d3.format(".4s")(result.d[0].FinalPriceValue));
       
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadOpenOpportunities(compId, managerId, salesmanId) {
    
    $.ajax({
        url: "Dashboard.aspx/GetTopOpportunities",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId }),
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
                            <small class="text-muted d-block mb-1">	`+item.Owner+`</small>                         
                                <a href="`+item.OppId+`" class="mb-0">`+ item.Name +`</a>
                        </div>
                        <div class="user-progress d-flex align-items-center gap-1">
                            <h6 class="mb-0">`+ d3.format(".2s")(item.Value)+`</h6>
                            <span class="text-muted">AED</span>
                        </div>
                    </div>
                </li>`;
            });

            $('.top-opportunity-ul').html(topOpp);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
} 

function loadOverview(compId, managerId, salesmanId) {

    $.ajax({
        url: "Dashboard.aspx/GetOverview",
        data: JSON.stringify({ "compId": compId, "manId": managerId, "salesmanId": salesmanId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var item = result.d[0];

            $('.oview-joh-count').html(d3.format(".2s")(item.JOHCount));
            $('.ov-secured-value').html(d3.format(".2s")(item.SecuredValue));
            $('.ov-underrisk-value').html(d3.format(".2s")(item.UnderRiskValue));
            $('.ov-ontrack-value').html(d3.format(".2s")(item.OnTrackValue));
            $('.ov-earlytojudge-value').html(d3.format(".2s")(item.EarlyToJudgeValue));
            $('.ov-lost-value').html(d3.format(".2s")(item.LostValue));
            $('.ov-others-value').html(d3.format(".2s")(item.OthersValue));    

            securedValueForOverview = (item.JOHCount / item.SecuredValue ).toFixed('1') + '%';
            $('#SvgjsText1302').html((item.JOHCount / item.SecuredValue).toFixed('1') + '%');
            overViewChart.update();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function showbarGraphYAxisLabelAsMillion() {
    
    //$(".apexcharts-yaxis tspan").each(function (e, v) {
    //    let spanId = v.id;
    //    $('#' + spanId).text(d3.format(".2s")($('#' + spanId).text()))
    //});
     $(".apexcharts-yaxis tspan").each(function (e, v) {
        let spanId = v.id;
        $('#' + spanId).text(d3.format(".0s")($('#' + spanId).text()))
    });
}


