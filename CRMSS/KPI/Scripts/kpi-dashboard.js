


let cardColor, headingColor, axisColor, shadeColor, borderColor;

cardColor = config.colors.white;
headingColor = config.colors.headingColor;
axisColor = config.colors.axisColor;
borderColor = config.colors.borderColor;

var oKpiPointsYearlyBarChart;
var arrKpiPointsYearly = [], growthChart = [];
var YTDKPIListYearly = [];

var overallyearPoints = 0;

var isURlExistId = '', pageURL = '';

const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
var selMonth = '', selYear = '';

var employeeObj = [];

var gaugeKpi2 = '', target2='';
$(document).ready(function () {


    $('#ddlMonth').val(new Date().getMonth() + 1);
    fillYearDDL();    
    //new Date().getMonth() == 0 ? new Date().getFullYear() : new Date().getFullYear() - 1
    //$('#ddlMonth').val() == 1 ? $('#ddlYear').val(new Date().getFullYear() - 1) : '';
    if ($('#ddlMonth').val() == 1) {
        $('#ddlYear').val(new Date().getFullYear() - 1);
        $('#ddlMonth').val(12);
    } else {
        $('#ddlMonth').val(new Date().getMonth() );
    }

    isURlExistId = window.location.search;
    if (isURlExistId != '') {
        EmpNo = atob(window.location.search.split('?')[1].trim()).split('&')[0].split('=')[1];
        eName = atob(window.location.search.split('?')[1].trim()).split('&')[1].split('=')[1];
        getProPic();
        loggedInUserName = eName;
        $('#dashboardProPic').attr("src", employeeObj.PicUrl);
    } else {
        $('#dashboardProPic').attr("src", profilpicurl);
    }



    loadAllDashbaordValues();
    fillFiltersOfDashboard();   

    $('.kpi-year-table tr').on('click', function () {
        console.log(this);
    });
    
    //$('#dashboardProPic').attr("src", profilpicurl);
    //$('.loggedin-username').html(loggedInUserName);

    var pageName = 'My Dashboard'
    activeCurrentPage(pageName, 0, 1);
});

function fillYearDDL(){
    
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
         colors: ['#389afb'], //[profitBarColor, lossBarColor], '#2f7cb3', '#47b1d1'
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
            colors: ['#2CBBC9', '#EADF53', '#74CA43', '#C9462C', '#6b6666' ],
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

function growthchart()
{
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
                        background: cardColor, //'#f9f7f7'
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
    oKpiPointsYearlyBarChart.destroy();
    growthChart.destroy();
    loadYTDKpi();

    loadAllDashbaordValues();

});

function loadBarGraphForThisKPI(i,KpiTotalPoint) {

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
                width:120,
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

    loadYTDKpi();

    loadKPIAccToMonthYear();
    loadKpiPointsYearlyBasis();

    loadKPIYearlyChartTheme();
    growthchart();

}

function getProPic() {

    $.ajax({
        url: "KPIDashboard.aspx/GetUserProfPic",
        data: JSON.stringify({ EmpNumber: EmpNo}),
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

function loadYTDKpi() {

    $.ajax({
        url: "KPIDashboard.aspx/GetYTDKpi",
        data: JSON.stringify({ EmpNumber: EmpNo, Year: selYear}),
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



function fillFiltersOfDashboard() {
    $.ajax({
        url: "KPIDashboard.aspx/GetMyAndMyManagerDetails",
        data: JSON.stringify({ EmpNumber: EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            let MyAndManDetails = result.d;
            var optMyddl = '', optManagerddl = '', optHODddl='', optDepartddl='', optOrgddl='';

            optMyddl = '<option value="' + MyAndManDetails.MyEmpNo + '" >' + MyAndManDetails.MyName + '</option>';
            optManagerddl = '<option value="' + MyAndManDetails.ManagerEmpNo + '" >' + MyAndManDetails.ManagerName + '</option>';
            optHODddl = '<option value="' + MyAndManDetails.HODEmpNo + '" >' + MyAndManDetails.HODName + '</option>';
            optDepartddl = '<option value="' + MyAndManDetails.DeptId + '" >' + MyAndManDetails.DeptName + '</option>';
            optOrgddl = '<option value="' + MyAndManDetails.OrgId + '" >' + MyAndManDetails.OrgName + '</option>';
            //$.each(result.d, function (key, item) {
            //    opt += '<option value="' + item.EmpName + '" >' + item.EmpNumber + '</option>';
            //});


            $('#ddlEmployee').html(optMyddl);
            $('#ddlManager').html(optManagerddl);
            $('#ddlHOD').html(optHODddl);
            $('#ddlDepart').html(optDepartddl);
            $('#ddlOrg').html(optOrgddl);

            //toastr.success('Fecth Successfully', 'Successfull');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadKPIAccToMonthYear() {
    $.ajax({
        url: "KPIDashboard.aspx/GetKPIAccToMonthYear",
        data: JSON.stringify({ EmpNumber: EmpNo, Month: selMonth, Year: selYear }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {            
            $('.kpi-boxes-parent').html('');

            $.each(result.d, function (key, item) {
                let kpitypeclass = 'hidden', Mtarget = '', Machieve = '', tarMatrixName='', achiveMatrixName='';
                let taskCompletePer = '';

                if (item.KpiType == 'Numeric') {
                    kpitypeclass = '';                    
                    Mtarget = (item.listMatricsTrans.filter(s => s.MatricsTxtBoxId == 'txtTargetTrans').length > 0) ? item.listMatricsTrans.filter(s => s.MatricsTxtBoxId == 'txtTargetTrans')[0].MatricsValue : '';
                    Machieve = (item.listMatricsTrans.filter(s => s.MatricsTxtBoxId == 'txtAchievementTrans').length > 0) ? item.listMatricsTrans.filter(s => s.MatricsTxtBoxId == 'txtAchievementTrans')[0].MatricsValue : '';
                    tarMatrixName = (item.listMatricsTrans.filter(s => s.MatricsTxtBoxId == 'txtTargetTrans').length > 0) ? item.listMatricsTrans.filter(s => s.MatricsTxtBoxId == 'txtTargetTrans')[0].MatricsName : '';
                    achiveMatrixName = (item.listMatricsTrans.filter(s => s.MatricsTxtBoxId == 'txtAchievementTrans').length > 0) ? item.listMatricsTrans.filter(s => s.MatricsTxtBoxId == 'txtAchievementTrans')[0].MatricsName : '';
                    taskCompletePer = (Machieve/Mtarget) * 100;
                } else if (item.KpiType == 'Rating') {
                    kpitypeclass = '';  
                    Mtarget = item.listMatricsTrans.filter(s => s.MatricsTxtBoxId == 'txtRatingMatrics1')[0].MatricsValue;
                    Machieve = item.listMatricsTrans.filter(s => s.MatricsTxtBoxId == 'txtRatingMatrics2')[0].MatricsValue;
                    taskCompletePer = (parseInt(Mtarget) + parseInt(Machieve)) / 2;
                } else if (item.KpiType == 'Complaint') {
                    kpitypeclass = '';  
                    taskCompletePer = item.listMatricsTrans[0].TotalPercAfterReduceCompPoint;
                    tarMatrixName = item.listMatricsTrans[0].MatricsName;
                    Mtarget = item.listMatricsTrans[0].MatricsValue;
                }
                    
                else {
                    taskCompletePer = (item.listMatricsTrans.filter(s => s.MatricsTxtBoxId == 'txtAchievementTrans').length > 0) ? item.listMatricsTrans.filter(s => s.MatricsTxtBoxId == 'txtAchievementTrans')[0].MatricsValue : 0;
                    Machieve = taskCompletePer;
                    achiveMatrixName = (item.listMatricsTrans.filter(s => s.MatricsTxtBoxId == 'txtAchievementTrans').length > 0) ? item.listMatricsTrans.filter(s => s.MatricsTxtBoxId == 'txtAchievementTrans')[0].MatricsName : '';
                }
                taskCompletePer = taskCompletePer < 0 ? 0 : taskCompletePer;
                var htm = '';
                if (key == 0 && key == 4 && key == 8 && key == 12 && key == 16 && key == 20) { htm += `<div class="row">`; } 

                let kpiNameShort = item.KpiName.length > 55 ? item.KpiName.substr(0, 55) + '...' : item.KpiName;
                let metricsShortNameTar = tarMatrixName.length > 22 ? tarMatrixName.substr(0, 22) + '...' : (item.KpiType =='Rating'? 'Self Rating by Employee' : tarMatrixName);
                let metricsShortNameAchiv = achiveMatrixName.length > 22 ? achiveMatrixName.substr(0, 22) + '...' : (item.KpiType == 'Rating' ? 'Manager Rating for Employee' : achiveMatrixName);

                htm += `<div class="col-3 mb-2">
                                <div class="card">
                                    <div class="card-body row">
                                        <div class="card-title d-flex align-items-start justify-content-between col-md-10">
                                            
                                            <div title="`+ item.KpiName+`">
                                                <h5>`+ kpiNameShort + `</h5>
                                            </div>`;
                                            //<div><span class="badge bg-label-info me-1">Active</span></div>
                                          
                              htm += `</div>`;  // closing "card-title d-flex align-items-start justify-content-between col-md-10"
                htm += `<div class="col-md-2"><label><b>YTD</b></label>  <label class="lblkpiYearToDate" style="color: ` + getDarkShade(YTDKPIListYearly.filter(s => s.KpiMasterId == item.kpiId)[0].YTD) + `">` + YTDKPIListYearly.filter(s => s.KpiMasterId == item.kpiId)[0].YTD + `% </label> </div>`;                
                                                   htm +=` <div class="col-md-4 `+ kpitypeclass + `" title="` + tarMatrixName + `">
                                                      <span class="fw-kpiname d-block mb-1">`+ metricsShortNameTar + `</span>
                                                      <h4 class="card-title mb-2 final-price-value-card">
                                                          <h3>`+ Mtarget + `</h3>
                                                  </div>
                                                  <div class="col-md-4 `+ kpitypeclass + `">
                                                  </div>
                                                  <div class="col-md-4 " title="`+ achiveMatrixName + `">
                                                      <span class="fw-kpiname d-block mb-1">`+ metricsShortNameAchiv + `</span>
                                                      <h4 class="card-title mb-2 final-price-value-card-count">
                                                          <h3>`+ Machieve + `</h3>
                                                  </div>
                                    </div>


                                        <canvas width="400" height="200" id="canvas-kpi`+ (key + 1) + `"></canvas>                                         
                                              <h5 class="text-center"> <label  style="color: `+ getDarkShade(parseInt(taskCompletePer)) + `">` + parseInt(taskCompletePer) +` %</label> <label><b>Current Month</b> </label></h5>

                                    </div>
                                </div>
                            </div>`;
            
                if (key == 3 && key == 7 && key == 11 && key == 15 && key == 19 && key == 23) { htm +=`</div>`; }  
                $('.kpi-boxes-parent').append(htm);               
                    generateGuageChart(key + 1, parseInt(taskCompletePer));

            });
            //$('.kpi-boxes-parent').html(htm);
            //toastr.success('Fecth Successfully', 'Successfull');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadKpiPointsYearlyBasis() {
    //KpiPointsYearlyBarChart.destroy();
    $.ajax({
        url: "KPIDashboard.aspx/GetkpiPointsYearlyBasis",
        data: JSON.stringify({ Year: selYear, EmpNumber:EmpNo }),
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
            validateRankingEmp(overallyearPoints)
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


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


