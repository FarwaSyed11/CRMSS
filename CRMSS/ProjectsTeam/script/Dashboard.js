
var OverallMarginVariance = [], ManpowerMarginVariance = [];


//$(document).ready(function () {

//});

//================================================== Installation Material Performance
//var options = {
//    series: [{
//        name: "Desktops",
//        data: [10, 41, 35, 51, 49, 62, 69, 91, 148]
//    },
//    {
//        name: 'Striking Calf',
//        data: [53, 32, 33, 52, 13, 43, 32]
//    }, {
//        name: 'Tank Picture',
//        data: [12, 17, 11, 9, 15, 11, 20]
//    }, {
//        name: 'Bucket Slope',
//        data: [9, 7, 5, 8, 6, 9, 4]
//    },
//    ],
//    chart: {
//        height: 150,
//        type: 'line',
//        zoom: {
//            enabled: false
//        }
//    },
//    dataLabels: {
//        enabled: false
//    },
//    stroke: {
//        curve: 'smooth',
//        width: 1,
//    },
//    grid: {
//        row: {
//            colors: ['#f3f3f3', 'transparent'],
//            opacity: 0.5
//        },
//    },
//    xaxis: {
//        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
//    }
//};

//var chart = new ApexCharts(document.querySelector("#chartInstMaterial"), options);
//chart.render();

//==================================================== Completion Percentage
var options = {
    chart: {
        height: 250,
        type: "radialBar",
    },

    series: [67],
    colors: ["#20E647"],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 0,
                size: "70%",
                background: "#293450"
            },
            track: {
                dropShadow: {
                    enabled: true,
                    top: 2,
                    left: 0,
                    blur: 4,
                    opacity: 0.15
                }
            },
            dataLabels: {
                name: {
                    offsetY: -10,
                    color: "#fff",
                    fontSize: "13px"
                },
                value: {
                    color: "#fff",
                    fontSize: "30px",
                    show: true
                }
            }
        }
    },
    fill: {
        type: "gradient",
        gradient: {
            shade: "dark",
            type: "vertical",
            gradientToColors: ["#87D4F9"],
            stops: [0, 100]
        }
    },
    stroke: {
        lineCap: "round"
    },
    labels: ["Progress"]
};

var chart = new ApexCharts(document.querySelector("#chartCompletionPercentage"), options);

chart.render();


//========================================= Overall Projects Performance
var options = {
    series: [{
        data: [44, 55, 41, 64, 22, 43]
    }, {
        data: [53, 32, 33, 52, 13, 44]
    }, {
        data: [53, 32, 33, 52, 13, 44]
    }, {
        data: [53, 32, 33, 52, 13, 44]
    }, {
        data: [53, 32, 33, 52, 13, 44]
    }],
    chart: {
        type: 'bar',
        height: 230
    },
    plotOptions: {
        bar: {
            horizontal: false,
            dataLabels: {
                position: 'top',
            },
        }
    },
    dataLabels: {
        enabled: false,
        offsetX: -6,
        style: {
            fontSize: '12px',
            colors: ['#fff']
        }
    },
    stroke: {
        show: false,
        width: 1,
        colors: ['#fff']
    },
    tooltip: {
        shared: true,
        intersect: false
    },
    xaxis: {
        categories: [2001, 2002, 2003, 2004, 2005, 2006],
    },
};

var chart = new ApexCharts(document.querySelector("#ProjOveralPerf"), options);
chart.render();


//================================================= Remaining Collection

var options = {
    series: [70, 30],
    chart: {
        width: 200,
        height: 200,
        type: 'pie',
    },
    labels: ['Invoiced', 'Not Invoiced'],
    fill: {
        opacity: 1,
        colors: ['#82CD59', '#EC1A25']
    },
    stroke: {
        width: 4,
    },
    legend:
    {
        position: 'bottom',
        markers: {
            fillColors: ['#82CD59', '#EC1A25']

        }


    },
    dataLabels: {
        enabled: true,
        style: {
            colors: ['#555']
        },
        background: {
            enabled: true,
            foreColor: '#fff',
            borderWidth: 0
        }
    },
    responsive: [{
        breakpoint: 480,
        options: {
            chart: {
                width: 100
            },
            legend: {
                position: 'bottom',
                horizontalAlign: 'bottom'
            }
        }
    }]
};

var chart = new ApexCharts(document.querySelector("#RemCollection"), options);
chart.render();

//================================================== Completion Status
var options = {
    series: [{
        data: [10, 41, 35, 51, 49, 62, 69, 91, 148]
    },
    {
        data: [53, 32, 33, 52, 13, 43, 32]
    }
    ],
    chart: {
        height: 230,
        type: 'line',
        zoom: {
            enabled: false
        }
    },
    dataLabels: {
        enabled: false
    },
    stroke: {
        curve: 'smooth',
        width: 1,
    },
    grid: {
        row: {
            colors: ['#f3f3f3', 'transparent'],
            opacity: 0.5
        },
    },
    xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
    },
    legend: {
        show: false,
    }
};

var chart = new ApexCharts(document.querySelector("#ManpowerPerformance"), options);
chart.render();


var options = {
    series: [{
        data: [10, 41, 35, 51, 49, 62, 69, 91, 148]
    },
    {
        data: [53, 32, 33, 52, 13, 43, 32]
    }, 
    ],
    chart: {
        height: 230,
        type: 'line',
        zoom: {
            enabled: false
        }
    },
    dataLabels: {
        enabled: false
    },
    stroke: {
        curve: 'smooth',
        width: 1,
    },
    grid: {
        row: {
            colors: ['#f3f3f3', 'transparent'],
            opacity: 0.5
        },
    },
    xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
    },
    legend: {
        show: false,
    }
};

var chart = new ApexCharts(document.querySelector("#OverallPrjPerformance"), options);
chart.render();

var options = {
    series: [{
        data: [10, 41, 35, 51, 49, 62, 69, 91, 148]
    },
    {
        data: [53, 32, 33, 52, 13, 43, 32]
    }, 
    ],
    chart: {
        height: 230,
        type: 'line',
        zoom: {
            enabled: false
        }
    },
    dataLabels: {
        enabled: false
    },
    stroke: {
        curve: 'smooth',
        width: 1,
    },
    grid: {
        row: {
            colors: ['#f3f3f3', 'transparent'],
            opacity: 0.5
        },
    },
    xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
    },
    legend: {
        show: false,
    }
};

var chart = new ApexCharts(document.querySelector("#InstMatrlPerformance"), options);
chart.render();


//================================================== Manpower Performance
//var options = {
//    series: [
//        {
//            name: 'Actual',
//            data: [
//                {
//                    x: '2011',
//                    y: 12,
//                    goals: [
//                        {
//                            name: 'Expected',
//                            value: 14,
//                            strokeWidth: 2,
//                            strokeDashArray: 2,
//                            strokeColor: '#775DD0'
//                        }
//                    ]
//                },
//                {
//                    x: '2012',
//                    y: 44,
//                    goals: [
//                        {
//                            name: 'Expected',
//                            value: 54,
//                            strokeWidth: 5,
//                            strokeHeight: 10,
//                            strokeColor: '#775DD0'
//                        }
//                    ]
//                },
//                {
//                    x: '2013',
//                    y: 54,
//                    goals: [
//                        {
//                            name: 'Expected',
//                            value: 52,
//                            strokeWidth: 10,
//                            strokeHeight: 0,
//                            strokeLineCap: 'round',
//                            strokeColor: '#775DD0'
//                        }
//                    ]
//                },
//                {
//                    x: '2014',
//                    y: 66,
//                    goals: [
//                        {
//                            name: 'Expected',
//                            value: 61,
//                            strokeWidth: 10,
//                            strokeHeight: 0,
//                            strokeLineCap: 'round',
//                            strokeColor: '#775DD0'
//                        }
//                    ]
//                },
//                {
//                    x: '2015',
//                    y: 81,
//                    goals: [
//                        {
//                            name: 'Expected',
//                            value: 66,
//                            strokeWidth: 10,
//                            strokeHeight: 0,
//                            strokeLineCap: 'round',
//                            strokeColor: '#775DD0'
//                        }
//                    ]
//                },
//                {
//                    x: '2016',
//                    y: 67,
//                    goals: [
//                        {
//                            name: 'Expected',
//                            value: 70,
//                            strokeWidth: 5,
//                            strokeHeight: 10,
//                            strokeColor: '#775DD0'
//                        }
//                    ]
//                }
//            ]
//        }
//    ],
//    chart: {
//        height: 200,
//        type: 'bar'
//    },
//    plotOptions: {
//        bar: {
//            horizontal: true,
//        }
//    },
//    colors: ['#00E396'],
//    dataLabels: {
//        formatter: function (val, opt) {
//            const goals =
//                opt.w.config.series[opt.seriesIndex].data[opt.dataPointIndex]
//                    .goals

//            if (goals && goals.length) {
//                return `${val} / ${goals[0].value}`
//            }
//            return val
//        }
//    },
//    legend: {
//        show: true,
//        showForSingleSeries: true,
//        customLegendItems: ['Actual', 'Expected'],
//        markers: {
//            fillColors: ['#00E396', '#775DD0']
//        }
//    }
//};

//var chart = new ApexCharts(document.querySelector("#ManpowerPerf"), options);
//chart.render();


$("#projectFilter").change(function () {
    loadProjectDetails($("#projectFilter").val());
});

function loadProjectDetails(PN) {
    $.ajax({
        url: "ProjectDashboard.aspx/loadProjectDetails",
        data: JSON.stringify({ 'PN': PN }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '';
            htm += `<tr>        

                    <td style=" ;display:none;">`+ result.PN + `</td> 
                 
                    <td>Project Manager</td>
                    <td>`+ result.d[0].PM + `</td>
                </tr>
                <tr>
                    <td>Project Name</td>
                    <td>`+ result.d[0].Name + `</td>
                </tr>
                <tr>
                    <td>Customer Name</td>
                    <td>`+ result.d[0].Customer + `</td>
                </tr>
                <tr>
                    <td>Salesman</td>
                    <td>`+ result.d[0].Salesman + `</td>
                </tr>
                <tr>
                    <td>Date</td>
                    <td>`+ result.d[0].StartDate + `</td>
                </tr>
                <tr>
                    <td>Original Project Value</td>
                    <td>`+ result.d[0].originalvalue + `</td>
                </tr>
                <tr>
                    <td>Variations</td>
                    <td>`+ result.d[0].variation + `</td>
                </tr>
                <tr>
                    <td>Total Project Value</td>
                    <td>`+ result.d[0].Totalvalue + `</td>
                </tr>`;


            $('.prj-detail-tbody').html(htm);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

var options1 = {
    chart: {
        height: 160,
        type: "radialBar",
        sparkline: {
            enabled: true
        }
    },

    series: [45],
    colors: [
        function ({ value, seriesIndex, w }) {
            if (value < 30) {
                return '#EC3129'
            }
            else if (value < 60) {
                return '#FFAF13'
            }
            else if (value < 111) {
                return '#50CB29'
            }
        },
    ],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 15,
                size: "50%",
                background: "#E0E0E0"
            },
            track: {
                dropShadow: {
                    enabled: true,
                    top: 2,
                    left: 0,
                    blur: 4,
                    opacity: 0.15
                }
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    color: "#555",
                    fontSize: "15px",
                    show: true,
                    offsetY: 5
                }
            }
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

OverallMarginVariance = new ApexCharts(document.querySelector("#OverallMarginVariance"), options1);
OverallMarginVariance.render();

var options2 = {
    chart: {
        height: 160,
        type: "radialBar",
        sparkline: {
            enabled: true
        }
    },

    series: [60],
    colors: [
        function ({ value, seriesIndex, w }) {
            if (value < 30) {
                return '#EC3129'
            }
            else if (value < 60) {
                return '#FFAF13'
            }
            else if (value < 111) {
                return '#50CB29'
            } 
        },
    ],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 15,
                size: "50%",
                background: "#E0E0E0"
            },
            track: {
                dropShadow: {
                    enabled: true,
                    top: 2,
                    left: 0,
                    blur: 4,
                    opacity: 0.15
                }
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    color: "#555",
                    fontSize: "15px",
                    show: true,
                    offsetY: 5
                }
            }
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

ManpowerMarginVariance = new ApexCharts(document.querySelector("#ManpowerMarginVariance"), options2);
ManpowerMarginVariance.render();

var options = {
    series: [
        {
            name: 'Q1 Budget',
            data: [44000, 55000, 41000]
        },
        {
            name: 'Q1 Actual',
            data: [48000, 50000, 40000]
        },
        {
            name: 'Q2 Budget',
            data: [13000, 36000, 20000]
        },
    ],
    chart: {
        type: 'bar',
        height: 190,
        stacked: true,
    },
    stroke: {
        width: 1,
        colors: ['#fff']
    },
    dataLabels: {
        formatter: (val) => {
            return val / 1000 + 'K'
        }
    },
    plotOptions: {
        bar: {
            horizontal: true
        }
    },
    xaxis: {
        categories: [
            'Supervision',
            'Manpower(ST)',
            'Manpower(OT)'
        ],
        labels: {
            formatter: (val) => {
                return val / 1000 + 'K'
            }
        }
    },
    fill: {
        opacity: 1,
    },
    colors: ['#82CD59', '#FF9518', '#EC1A25'],
    legend: {
        show: false,
    }
};

var chart = new ApexCharts(document.querySelector("#ManhourAnalysis"), options);
chart.render();


var options = {
    chart: {
        height: 160,
        type: "radialBar",
        sparkline: {
            enabled: true
        }
    },

    series: [60],
    colors: [
        function ({ value, seriesIndex, w }) {
            if (value < 30) {
                return '#EC3129'
            }
            else if (value < 60) {
                return '#FFAF13'
            }
            else if (value < 111) {
                return '#50CB29'
            }
        },
    ],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 15,
                size: "50%",
                background: "#E0E0E0"
            },
            track: {
                dropShadow: {
                    enabled: true,
                    top: 2,
                    left: 0,
                    blur: 4,
                    opacity: 0.15
                }
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    color: "#555",
                    fontSize: "15px",
                    show: true,
                    offsetY: 5
                }
            }
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#ActualHours"), options);
chart.render();



var options = {
    chart: {
        height: 160,
        type: "radialBar",
        sparkline: {
            enabled: true
        }
    },

    series: [20],
    colors: [
        function ({ value, seriesIndex, w }) {
            if (value < 30) {
                return '#EC3129'
            }
            else if (value < 60) {
                return '#FFAF13'
            }
            else if (value < 111) {
                return '#50CB29'
            }
        },
    ],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 15,
                size: "50%",
                background: "#E0E0E0"
            },
            track: {
                dropShadow: {
                    enabled: true,
                    top: 2,
                    left: 0,
                    blur: 4,
                    opacity: 0.15
                }
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    color: "#555",
                    fontSize: "15px",
                    show: true,
                    offsetY: 5
                }
            }
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#BreakevenRatio"), options);
chart.render();


var options = {
    series: [{
        name: 'Actual On Site Completion',
        data: [100]
    }],
    chart: {
        type: 'bar',
        width: '100%',
        height: 20,
        toolbar: {
            show: false
        },
        parentHeightOffset: 0,
    },
    grid: {
        show: true,
        padding: { left: -10, right: -10, top: -30, bottom: -15 },
        xaxis: {
            lines: {
                show: false
            }
        },
        yaxis: {
            lines: {
                show: false
            }
        },  
    },
    plotOptions: {
        bar: {
            barHeight: '100%',
            horizontal: true,
            dataLabels: {
                enabled: true,
                //total: {
                //    enabled: true,
                //    style: {
                //        fontSize: '14px',
                //        fontFamily: 'Helvetica, Arial, sans-serif',
                //        fontWeight: 'bold',
                //        colors: ['#555'],
                //    },
                //},
            },
            borderRadius: 5,
            borderRadiusApplication: 'around',
        },
    },
    colors: ['#98CEF5'],
    yaxis: {
        show: false,
        axisBorder: {
            show: false,
        },
        axisTicks: {
            show: false,
        }
    },
    stroke: {
        width: 1,
        colors: ["#fff"]
    },
    xaxis: {
        show: false,
        crosshairs: {
            width: 1
        },
        axisBorder: {
            show: false,
        },
        axisTicks: {
            show: false,
        },
        labels: {
            show: false,
        }
    },
    labels: ['Completion Status'],
    tooltip: {
        fixed: {
            enabled: true
        },
        x: {
            show: true
        },
        y: {
            title: {
                formatter: function (val, seriesName) {
                    return val+ ' %'
                }
            }
        },
        marker: {
            show: true
        }
    }
};

var chart = new ApexCharts(document.querySelector("#OnsiteCompletion"), options);
chart.render();


var options = {
    chart: {
        height: 160,
        type: "radialBar",
        sparkline: {
            enabled: true
        }
    },

    series: [20],
    colors: [
        function ({ value, seriesIndex, w }) {
            if (value < 30) {
                return '#EC3129'
            }
            else if (value < 60) {
                return '#FFAF13'
            }
            else if (value < 111) {
                return '#50CB29'
            }
        },
    ],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 15,
                size: "50%",
                background: "#E0E0E0"
            },
            track: {
                dropShadow: {
                    enabled: true,
                    top: 2,
                    left: 0,
                    blur: 4,
                    opacity: 0.15
                }
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    color: "#555",
                    fontSize: "15px",
                    show: true,
                    offsetY: 5
                }
            }
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#ManpowerPerformanceEff"), options);
chart.render();



var options = {
    chart: {
        height: 160,
        type: "radialBar",
        sparkline: {
            enabled: true
        }
    },

    series: [20],
    colors: [
        function ({ value, seriesIndex, w }) {
            if (value < 30) {
                return '#EC3129'
            }
            else if (value < 60) {
                return '#FFAF13'
            }
            else if (value < 111) {
                return '#50CB29'
            }
        },
    ],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 15,
                size: "50%",
                background: "#E0E0E0"
            },
            track: {
                dropShadow: {
                    enabled: true,
                    top: 2,
                    left: 0,
                    blur: 4,
                    opacity: 0.15
                }
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    color: "#555",
                    fontSize: "15px",
                    show: true,
                    offsetY: 5
                }
            }
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#InstMatrlPerformanceEff"), options);
chart.render();



var options = {
    chart: {
        height: 160,
        type: "radialBar",
        sparkline: {
            enabled: true
        }
    },

    series: [20],
    colors: [
        function ({ value, seriesIndex, w }) {
            if (value < 30) {
                return '#EC3129'
            }
            else if (value < 60) {
                return '#FFAF13'
            }
            else if (value < 111) {
                return '#50CB29'
            }
        },
    ],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 15,
                size: "50%",
                background: "#E0E0E0"
            },
            track: {
                dropShadow: {
                    enabled: true,
                    top: 2,
                    left: 0,
                    blur: 4,
                    opacity: 0.15
                }
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    color: "#555",
                    fontSize: "15px",
                    show: true,
                    offsetY: 5
                }
            }
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#PrjPerfTillDate"), options);
chart.render();



var options = {
    chart: {
        height: 160,
        type: "radialBar",
        sparkline: {
            enabled: true
        }
    },

    series: [20],
    colors: [
        function ({ value, seriesIndex, w }) {
            if (value < 30) {
                return '#EC3129'
            }
            else if (value < 60) {
                return '#FFAF13'
            }
            else if (value < 111) {
                return '#50CB29'
            }
        },
    ],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 15,
                size: "50%",
                background: "#E0E0E0"
            },
            track: {
                dropShadow: {
                    enabled: true,
                    top: 2,
                    left: 0,
                    blur: 4,
                    opacity: 0.15
                }
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    color: "#555",
                    fontSize: "15px",
                    show: true,
                    offsetY: 5
                }
            }
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#PrjPerfatCompltn"), options);
chart.render();
