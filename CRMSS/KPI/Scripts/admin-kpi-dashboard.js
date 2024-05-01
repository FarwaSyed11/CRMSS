


let cardColor, headingColor, axisColor, shadeColor, borderColor;

cardColor = config.colors.white;
headingColor = config.colors.headingColor;
axisColor = config.colors.axisColor;
borderColor = config.colors.borderColor;

var oKpiPointsYearlyBarChart;
var arrKpiPointsYearly = [], growthChart = [];
var YTDKPIListYearly = [];
var employeesList = [];

var overallyearP = 0;
var overallyearPoints = 0;

const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
var selMonth = '', selYear = '';

var selEmpNo = '';
var isURlExistId = '', pageURL = '';

var employeeObj = [];
var selOrg = '', selDep = '', selLineMan = '', selHOD = '';

var gaugeKpi2 = '', target2 = '';

var HODListByFilter = [], ManListByFilter = []; EmpListByFilter = [];

$(document).ready(function () {


    $('#ddlMonth').val(new Date().getMonth() + 1);
    fillYearDDL();
    //new Date().getMonth() == 0 ? new Date().getFullYear() : new Date().getFullYear() - 1
    $('#ddlMonth').val() == 1 ? $('#ddlYear').val(new Date().getFullYear() - 1) : '';

    
    isURlExistId = window.location.search;
    if (isURlExistId != '') {
        EmpNo = atob(window.location.search.split('?')[1].trim()).split('&')[0].split('=')[1];
        eName = atob(window.location.search.split('?')[1].trim()).split('&')[1].split('=')[1];
        getProPic();
        loggedInUserName = eName;
        $('#dashboardProPic').attr("src", employeeObj.PicUrl);

        $('#ddlManager').html('<option value="' + EmpNo + '" >' + eName + '</option>');

    } else {
        $('#dashboardProPic').attr("src", profilpicurl);
    }


   // loadEmployees();
    fillOrgDDL();

    loadAllDashbaordValues();


    $('.kpi-year-table tr').on('click', function () {
        console.log(this);
    });

    var pageName = 'Admin Kpi Dashboard'
    activeCurrentPage(pageName,0,0);
      
});
     

function fillYearDDL() {

    var htm = '';
    for (var i = 0; i < 3; i++) {
        let year = new Date().getFullYear() - i;
        htm += '<option value="' + year + '">' + year + '</option>';
    }
    $('#ddlYear').html(htm);
}

function loadKPIYearlyChartTheme() {


    // Total Revenue Report Chart - Bar Chart
    // --------------------------------------------------------------------
    KpiPointsYearlyChartElcc = document.querySelector('#KpiPointsYearlyBarChart'),
        KpiPointsYearlyChartOptions = {
            series: [
                {
                    name: 'Status', //'2021',
                    data: arrKpiPointsYearly, //profitArray
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
        colors: ['#389afb'], //[profitBarColor, lossBarColor],
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
                categories: monthNames,// monthNames,//,MonthArrayGraph
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
    if (typeof KpiPointsYearlyChartElcc !== undefined && KpiPointsYearlyChartElcc !== null) {
        oKpiPointsYearlyBarChart = new ApexCharts(KpiPointsYearlyChartElcc, KpiPointsYearlyChartOptions);
        oKpiPointsYearlyBarChart.render();
    }


    // Bubble Chart



}

function loadDonutChart() {

    const donutChartEl = document.querySelector('#donutChart'),
        donutChartConfig = {
            chart: {
                height: 390,
                type: 'donut'
            },
            labels: ['Submited', 'Reviewd', 'Approved', 'Rejected', 'New'],
            series: [85, 15, 25, 50, 60],
            colors: ['#2CBBC9', '#EADF53', '#74CA43', '#C9462C', '#6b6666'],
            stroke: {
                show: false,
                curve: 'straight'
            },
            dataLabels: {
                enabled: true,
                formatter: function (val, opt) {
                    return parseInt(val, 10) + '%';
                }
            },
            legend: {
                show: true,
                position: 'bottom',
                markers: { offsetX: -3 },
                itemMargin: {
                    vertical: 3,
                    horizontal: 10
                },
                labels: {
                    colors: 'Black', //legendColor,
                    useSeriesColors: false
                }
            },
            plotOptions: {
                pie: {
                    donut: {
                        labels: {
                            show: true,
                            name: {
                                fontSize: '2rem',
                                fontFamily: 'Open Sans'
                            },
                            value: {
                                fontSize: '1.2rem',
                                color: 'Black', //legendColor,
                                fontFamily: 'Open Sans',
                                formatter: function (val) {
                                    return parseInt(val, 10) + '%';
                                }
                            },
                            total: {
                                show: true,
                                fontSize: '1.5rem',
                                color: headingColor,
                                label: 'Submited',
                                formatter: function (w) {
                                    return '31%';
                                }
                            }
                        }
                    }
                }
            },
            responsive: [
                {
                    breakpoint: 992,
                    options: {
                        chart: {
                            height: 380
                        },
                        legend: {
                            position: 'bottom',
                            labels: {
                                colors: 'Red',
                                useSeriesColors: false
                            }
                        }
                    }
                },
                {
                    breakpoint: 576,
                    options: {
                        chart: {
                            height: 320
                        },
                        plotOptions: {
                            pie: {
                                donut: {
                                    labels: {
                                        show: true,
                                        name: {
                                            fontSize: '1.5rem'
                                        },
                                        value: {
                                            fontSize: '1rem'
                                        },
                                        total: {
                                            fontSize: '1.5rem'
                                        }
                                    }
                                }
                            }
                        },
                        legend: {
                            position: 'bottom',
                            labels: {
                                colors: 'Green', //legendColor,
                                useSeriesColors: false
                            }
                        }
                    }
                },
                {
                    breakpoint: 420,
                    options: {
                        chart: {
                            height: 280
                        },
                        legend: {
                            show: false
                        }
                    }
                },
                {
                    breakpoint: 360,
                    options: {
                        chart: {
                            height: 250
                        },
                        legend: {
                            show: false
                        }
                    }
                },
                {
                    breakpoint: 220,
                    options: {
                        chart: {
                            height: 250
                        },
                        legend: {
                            show: false
                        }
                    }
                }
            ]
        };
    if (typeof donutChartEl !== undefined && donutChartEl !== null) {
        const donutChart = new ApexCharts(donutChartEl, donutChartConfig);
        donutChart.render();
    }


}

function growthchart() {
    const growthChartEl = document.querySelector('#growthChart'),
        growthChartOptions = {
            series: [overallyearPoints],
            labels: ['Growth'],
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
            colors: [getLightShade(overallyearPoints)],
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.5,
                    gradientToColors: [getDarkShade(overallyearPoints)],
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
    if (typeof growthChartEl !== undefined && growthChartEl !== null) {
        growthChart = new ApexCharts(growthChartEl, growthChartOptions);
        growthChart.render();
    }
}


function generateGuageChart(i, value) {
    var opts = {
        angle: -0.01, // The span of the gauge arc
        lineWidth: 0.20, // The line thickness
        radiusScale: 1, // Relative radius
        pointer: {
            length: 0.35, // // Relative to gauge radius
            strokeWidth: 0.035, // The thickness
            color: '#000000' // Fill color
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
            divColor: '#333333',
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
        staticLabels: {
            font: "10px sans-serif",  // Specifies font
            labels: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100],  // Print labels at these values
            color: "#000000",  // Optional: Label text color
            fractionDigits: 0  // Optional: Numerical precision. 0=round off.
        },
    };
    var canvId = 'canvas-kpi' + i;
    var target = document.getElementById(canvId); // your canvas element
    var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
    gauge.maxValue = 100; // set max gauge value
    gauge.setMinValue(0);  // Prefer setter over gauge.minValue = 0
    gauge.animationSpeed = 72; // set animation speed (32 is default value)
    gauge.set(value > 100 ? 100 : value); // set actual value

    // loadBarGraphForThisKPI(i, value);
};
// trigger events / callback functions
//-----------------------------------------------
$('#btnSearchDashBoard').on('click', function () {
    //oKpiPointsYearlyBarChart.destroy();
    //growthChart.destroy();
    //loadYTDKpi();

    loadAllDashbaordValues();

});

function loadBarGraphForThisKPI(i, KpiTotalPoint) {

    //let KpiPointsYearlyChartElcc
    //let KpiPointsYearlyChartOptions
    // Total Revenue Report Chart - Bar Chart
    // --------------------------------------------------------------------
    var bChartId = '#specificKPI' + i;
    const objFirst = document.querySelector(bChartId),
        objSecond = {
            series: [
                {
                    name: 'Status', //'2021',
                    data: [KpiTotalPoint] //profitArray
                }

            ],
            chart: {
                height: 180,
                width: 120,
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
            colors: [getDarkShade(KpiTotalPoint)], //[profitBarColor, lossBarColor],
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
                categories: ['Completed'],// monthNames,//,MonthArrayGraph
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
                    show: false,
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
    if (typeof objFirst !== undefined && objFirst !== null) {
        oKpiPointsYearlyBarChart1 = new ApexCharts(objFirst, objSecond);
        oKpiPointsYearlyBarChart1.render();
    }
    //$('#' + $(bChartId).children().children()[0].id).css({ 'height': '50%', 'width': '50%' })
}

//-----------------------------------------------------------
function loadAllDashbaordValues() {
    selMonth = $('#ddlMonth option:selected').val();
    selYear = $('#ddlYear option:selected').val();

    $('#ddlHOD option:selected').val() != '-1' ? loadingTeamsCardDivCopy(HODListByFilter.filter(s => s.EmpNo == $('#ddlHOD option:selected').val())) : loadingTeamsCardDivCopy(HODListByFilter);;
   
       
}

function loadYTDKpi() {

    $.ajax({
        url: "AdminKPIDashboard.aspx/GetYTDKpi",
        data: JSON.stringify({ EmpNumber: selEmpNo, Year: selYear }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            YTDKPIListYearly = result.d;

            //toastr.success('Fecth Successfully', 'Successfull');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



function loadEmployees() {

    $.ajax({
        url: "AdminKPIDashboard.aspx/GetEmployeesList",
        data: JSON.stringify({ EmpNumber: EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            employeesList = result.d;
            var opt = '';
            var dptid = employeesList[0].DeptId;
            opt = '<option value="0" selected>ALL</option>'
            $.each(result.d, function (key, item) {
                if (key == 0) {
                    opt += '<optgroup label="' + item.DeptName + '">';
                }
                else if (dptid != item.DeptId) {
                    dptid = item.DeptId;
                    opt += '</optgroup>';
                    opt += '<optgroup label="' + item.DeptName + '">';
                }

                //opt += '<option value="' + item.MyEmpNo + '" >' + item.MyEmpNo + '-' + item.MyName + '</option>';
                opt += '<option value="' + item.MyEmpNo + '" >' + item.MyName + '</option>';

            });

            //$('#ddlEmployee').html(opt);

            fillOrgDDL();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



function loadKpiPointsYearlyBasis() {
    //KpiPointsYearlyBarChart.destroy();
    $.ajax({
        url: "AdminKPIDashboard.aspx/GetkpiPointsYearlyBasis",
        data: JSON.stringify({ Year: selYear, EmpNumber: selEmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            arrKpiPointsYearly = [];
            overallyearPoints = 0;
            let approvedKpiCount = result.d.filter(s => s.Points > 0).length;
            $.each(result.d, function (key, item) {
                arrKpiPointsYearly.push(item.Points);
                overallyearPoints += parseInt(item.Points);

                //KpiPointsYearlyBarChart.render();
            });
            overallyearPoints = parseInt(overallyearPoints / (approvedKpiCount == 0 ? 1 : approvedKpiCount));

            $('.overall-growth').html('Overall KPI Growth: ' + overallyearPoints + ' %');
            validateRankingEmp(overallyearPoints);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function loadKpiPointsYearlyBasisFolAllUsers(empno) {
    //KpiPointsYearlyBarChart.destroy();
    $.ajax({
        url: "AdminKPIDashboard.aspx/GetkpiPointsYearlyBasis",
        data: JSON.stringify({ Year: selYear, EmpNumber: empno }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            overallyearP = 0;
            let kpiMonthsPoints = 0;

            let approvedKpiCount = result.d.filter(s => s.Points > 0).length;

            $.each(result.d, function (key, item) {

                overallyearP += parseInt(item.Points);

                //KpiPointsYearlyBarChart.render();
            });
            overallyearP = parseInt(overallyearP / (approvedKpiCount == 0 ? 1 : approvedKpiCount));

            //$('.overall-growth').html('Overall KPI Growth: ' + overallyearPoints + ' %');
            getDarkShadeForProfPic(overallyearP);
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}


function loadingTeamsCardDivCopy(empList) {


    var htm = '';
    $('.kpi-boxes-parent').html('');
    $.each(empList, function (key, item) {
        loadKpiPointsYearlyBasisFolAllUsers(item.EmpNo);
        let profPicID = 'empCardProfPic' + key;
        encryptURLForMyEmp = item.EmpPageUrl.split('?')[0] + '?' + btoa(item.EmpPageUrl.split('?')[1]);
        encryptURLForManager = item.ManPageUrl.split('?')[0] + '?' + btoa(item.ManPageUrl.split('?')[1]);

        htm = `<div class="col-3 mb-2" style="width:16.6%;">
                                <div class="card">
                                    <div class="card-body row">
                                        <div class="card-title d-flex align-items-start justify-content-between col-md-4">
                                            
                                            <div>
                                                
                                                    <img src="`+ item.EmpProPicUrl + `" id=` + profPicID + ` alt="../Masters/assets/images/img_avatar.png" style="width: 60%; border-radius: 60%;" />
                                            </div>`;

        htm += `</div>`;          
        htm += `<div class="" style="width:54.3%;"> <label><b>` + item.EmpName + `</b></label>   </div>`;

        htm += `<div class="dropdown col-md-1">
                                                       <button class="btn p-0" type="button"  data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                           <i class="bx bx-dots-vertical-rounded"></i>
                                                       </button>
                                                       <div class="dropdown-menu" aria-labelledby="cardOpt1" style="">
                                                           <a class="dropdown-item" href="`+ `/CRMSS` + encryptURLForMyEmp + `" target="_blank">KPI</a>`;
        htm += item.IsManager != '' ? `<a class="dropdown-item" href="` + `/CRMSS` + encryptURLForManager + `" target="_blank">Team KPI</a>` : '';
        htm += `</div>
                                                   </div>`;

        htm += `</div>


                                        <canvas width="400" height="200" id="canvas-kpi`+ (key + 10) + `"></canvas>                                         
                                              <h5 class="text-center"> <label  style="color: `+ getDarkShade(parseInt(overallyearP)) + `">` + overallyearP + ` % </label> <label><b>Overall</b> </label></h5>

                                    </div>
                                </div>
                            </div>`;

        //if (key == 3 && key == 7 && key == 11 && key == 15 && key == 19 && key == 23) { htm += `</div>`; }
        $('.kpi-boxes-parent').append(htm);

        generateGuageChart(key + 10, parseInt(overallyearP));
        getDarkShadeForProfPic(overallyearP, profPicID);

    });


    //$('.kpi-boxes-parent').html(htm);
    //toastr.success('Fecth Successfully', 'Successfull');

}

function getProPic() {

    $.ajax({
        url: "KPIDashboard.aspx/GetUserProfPic",
        data: JSON.stringify({ EmpNumber: EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            employeeObj = result.d;

            //toastr.success('Fecth Successfully', 'Successfull');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


//ddl
function fillOrgDDL() {
    $.ajax({
        url: "AdminKPIDashboard.aspx/GetOrganizations",
        data: JSON.stringify({ EmpNumber: EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            let res = result.d;         
            let htm = '';

            $.each(res, function (key, item) {
                htm += '<option value="' + item.OrgName + '" >' + item.OrgName + '</option>'; 
            });

            //$('#ddlManager').html(optManagerddl);
            //$('#ddlHOD').html(optHODddl);
            //$('#ddlDepart').html(optDepartddl);
            $('#ddlOrg').html(htm);
            selOrg = $('#ddlOrg option:selected').val().trim();
            fillDepartDDL();
            //loadEmployees();
            //toastr.success('Fecth Successfully', 'Successfull');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#ddlOrg').on('change', function () {
    selOrg = $('#ddlOrg option:selected').val().trim();
    fillDepartDDL();
});

$('#ddlDepart').on('change', function () {
    selDep = $('#ddlDepart option:selected').val().trim();
    fillHOD_DDL();
});

$('#ddlHOD').on('change', function () {
    selHOD = $('#ddlHOD option:selected').val().trim();
   // fillLineManDDL();
});

//$('#ddlManager1').on('change', function () {
//    selLineMan = $('#ddlManager1 option:selected').val().trim();
//    fillEmployeeDDL();
//});


function fillDepartDDL() {
    $.ajax({
        url: "AdminKPIDashboard.aspx/GetDapartments",
        data: JSON.stringify({ orgName: selOrg }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            let res = result.d;
            let htm = '<option value="-1" >ALL</option>';

            $.each(res, function (key, item) {
                htm += '<option value="' + item.DeptId + '" >' + item.DeptName + '</option>';
            });

            $('#ddlDepart').html(htm);
            selDep = $('#ddlDepart option:selected').val().trim();
            fillHOD_DDL();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



function fillHOD_DDL() {
    $.ajax({
        url: "AdminKPIDashboard.aspx/GetHOD",
        data: JSON.stringify({ orgName: selOrg, deptId: selDep}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            HODListByFilter = [];

            let res = result.d;
            HODListByFilter = res;
            let htm = '<option value="-1" >ALL</option>';

            $.each(res, function (key, item) {
                htm += '<option value="' + item.EmpNo + '" >' + item.EmpName + '</option>';
            });

     
            $('#ddlHOD').html(htm);
            selHOD = $('#ddlHOD option:selected').val().trim();
            //fillLineManDDL();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//function fillLineManDDL() {
//    $.ajax({
//        url: "AdminKPIDashboard.aspx/GetManagers",
//        data: JSON.stringify({ orgName: selOrg, deptId: selDep, HOD: selHOD, LineMan: "-1" }),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        async: false,
//        success: function (result) {
//            ManListByFilter = [];

//            let res = result.d;
//            ManListByFilter = res;
//            let htm = '<option value="-1" >ALL</option>';

//            $.each(res, function (key, item) {
//                htm += '<option value="' + item.EmpNo + '" >' + item.EmpName + '</option>';
//            });

//            //$('#ddlManager').html(optManagerddl);
//            //$('#ddlHOD').html(optHODddl);
//            //$('#ddlDepart').html(optDepartddl);
//            $('#ddlManager1').html(htm);
//            selLineMan = $('#ddlManager1 option:selected').val().trim();
//            fillEmployeeDDL();

//            //loadEmployees();
//            //toastr.success('Fecth Successfully', 'Successfull');
//        },
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//}

//function fillEmployeeDDL() {
//    $.ajax({
//        url: "AdminKPIDashboard.aspx/GetEmployees",
//        data: JSON.stringify({ orgName: selOrg, deptId: selDep, LineMan: selLineMan, HOD: selHOD }),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        async: false,
//        success: function (result) {
//            EmpListByFilter = [];

//            let res = result.d;
//            EmpListByFilter = res;
//            let htm = '<option value="-1" >ALL</option>';

//            $.each(res, function (key, item) {
//                htm += '<option value="' + item.EmpNo + '" >' + item.EmpName + '</option>';
//            });

//            //$('#ddlManager').html(optManagerddl);
//            //$('#ddlHOD').html(optHODddl);
//            //$('#ddlDepart').html(optDepartddl);
//            $('#ddlEmployee1').html(htm);



//            //loadEmployees();
//            //toastr.success('Fecth Successfully', 'Successfull');
//        },
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//}




//end




//------------------------------------------------------

function validateRankingEmp(oyearPoints) {

    if (oyearPoints > 0) {
        if (oyearPoints < 50) {

            $('.loggedin-username').html("<h4>Hi  " + loggedInUserName + "</h4><br /> <h5>Red Flag. Your overall performance is beyond the acceptable mark! We urge you to take the necessary actions to improve your performance immediately.</h5>");
            getDarkShade(oyearPoints);
        }
        else if (oyearPoints < 70) {

            $('.loggedin-username').html("<h4>Hi  " + loggedInUserName + "</h4><br /> <h5><span>Your overall performance is not up to standards; we urge you to generate an effective recovery plan  to drastically improve your %Efficiency.</h5>");
            getDarkShade(oyearPoints);
        }
        else if (oyearPoints >= 70) {

            $('.loggedin-username').html("<h4>Hi " + loggedInUserName + "</h4><br /> <h5>Job well done! Keep your inner fire ignited.</h5>");
            getDarkShade(oyearPoints);
        }
    }
    else {
        $('.loggedin-username').html("<h4>Hi  " + loggedInUserName + "</h4>");
    }

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

function getDarkShadeForProfPic(val, profpicId) {
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

    $('#' + profpicId).css("border", "solid 3px" + finalColor)
    return finalColor;
}



