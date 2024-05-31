
//================================================== Installation Material Performance
var options = {
    series: [{
        name: "Desktops",
        data: [10, 41, 35, 51, 49, 62, 69, 91, 148]
    },
    {
        name: 'Striking Calf',
        data: [53, 32, 33, 52, 13, 43, 32]
    }, {
        name: 'Tank Picture',
        data: [12, 17, 11, 9, 15, 11, 20]
    }, {
        name: 'Bucket Slope',
        data: [9, 7, 5, 8, 6, 9, 4]
    },
    ],
    chart: {
        height: 150,
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
    }
};

var chart = new ApexCharts(document.querySelector("#chartInstMaterial"), options);
chart.render();

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
    }, {
        data: [12, 17, 11, 9, 15, 11, 20]
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

var chart = new ApexCharts(document.querySelector("#completionStatus"), options);
chart.render();


//================================================== Manpower Performance
var options = {
    series: [
        {
            name: 'Actual',
            data: [
                {
                    x: '2011',
                    y: 12,
                    goals: [
                        {
                            name: 'Expected',
                            value: 14,
                            strokeWidth: 2,
                            strokeDashArray: 2,
                            strokeColor: '#775DD0'
                        }
                    ]
                },
                {
                    x: '2012',
                    y: 44,
                    goals: [
                        {
                            name: 'Expected',
                            value: 54,
                            strokeWidth: 5,
                            strokeHeight: 10,
                            strokeColor: '#775DD0'
                        }
                    ]
                },
                {
                    x: '2013',
                    y: 54,
                    goals: [
                        {
                            name: 'Expected',
                            value: 52,
                            strokeWidth: 10,
                            strokeHeight: 0,
                            strokeLineCap: 'round',
                            strokeColor: '#775DD0'
                        }
                    ]
                },
                {
                    x: '2014',
                    y: 66,
                    goals: [
                        {
                            name: 'Expected',
                            value: 61,
                            strokeWidth: 10,
                            strokeHeight: 0,
                            strokeLineCap: 'round',
                            strokeColor: '#775DD0'
                        }
                    ]
                },
                {
                    x: '2015',
                    y: 81,
                    goals: [
                        {
                            name: 'Expected',
                            value: 66,
                            strokeWidth: 10,
                            strokeHeight: 0,
                            strokeLineCap: 'round',
                            strokeColor: '#775DD0'
                        }
                    ]
                },
                {
                    x: '2016',
                    y: 67,
                    goals: [
                        {
                            name: 'Expected',
                            value: 70,
                            strokeWidth: 5,
                            strokeHeight: 10,
                            strokeColor: '#775DD0'
                        }
                    ]
                }
            ]
        }
    ],
    chart: {
        height: 200,
        type: 'bar'
    },
    plotOptions: {
        bar: {
            horizontal: true,
        }
    },
    colors: ['#00E396'],
    dataLabels: {
        formatter: function (val, opt) {
            const goals =
                opt.w.config.series[opt.seriesIndex].data[opt.dataPointIndex]
                    .goals

            if (goals && goals.length) {
                return `${val} / ${goals[0].value}`
            }
            return val
        }
    },
    legend: {
        show: true,
        showForSingleSeries: true,
        customLegendItems: ['Actual', 'Expected'],
        markers: {
            fillColors: ['#00E396', '#775DD0']
        }
    }
};

var chart = new ApexCharts(document.querySelector("#ManpowerPerf"), options);
chart.render();