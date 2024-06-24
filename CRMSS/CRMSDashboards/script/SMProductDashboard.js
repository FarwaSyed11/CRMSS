
var chartForecast = [], chartPipeline = [], chartFinalized = [];
var chartSubstage = [];
var chartOverview = [];
var chartUpdated = [];

$(document).ready(function () {
    LoadYearddl();
    //LoadCompany(selTerritory, currUserId);
    //LoadManager(selTerritory, getCompniesFromDDL(), currUserId);
    initiateProductRadialChart();
    initiateSubstageChart();
    initiateOverviewChart();
    initiateUpdatedChart();
});

function LoadYearddl() {

    var htm = '';
    for (var i = 0; i < 3; i++) {
        let year = new Date().getFullYear() - i;
        htm += '<option value="' + year + '">' + year + '</option>';
    }
    $("#yearFilter").html(htm);
}
function initiateProductRadialChart() {
    var options1 = {
        series: [44, 55, 67, 83],
        chart: {
            height: 350,
            type: 'radialBar',
        },
        plotOptions: {
            radialBar: {
                dataLabels: {
                    name: {
                        fontSize: '22px',
                    },
                    value: {
                        fontSize: '16px',
                    },
                    total: {
                        show: true,
                        label: 'Total',
                        formatter: function (w) {
                            return 249
                        }
                    }
                }
            }
        },
        labels: [],
        stroke: {
            lineCap: "round"
        },
    };

    var chartForecast = new ApexCharts(document.querySelector("#chartForecast"), options1);
    chartForecast.render();

    var options2 = {
        series: [44, 55, 67, 83],
        chart: {
            height: 350,
            type: 'radialBar',
        },
        plotOptions: {
            radialBar: {
                dataLabels: {
                    name: {
                        fontSize: '22px',
                    },
                    value: {
                        fontSize: '16px',
                    },
                    total: {
                        show: true,
                        label: 'Total',
                        formatter: function (w) {
                            return 249
                        }
                    }
                }
            }
        },
        labels: [],
        stroke: {
            lineCap: "round"
        },
    };

    var chartPipeline = new ApexCharts(document.querySelector("#chartPipeline"), options2);
    chartPipeline.render();

    var options3 = {
        series: [44, 55, 67, 83],
        chart: {
            height: 350,
            type: 'radialBar',
        },
        plotOptions: {
            radialBar: {
                dataLabels: {
                    name: {
                        fontSize: '22px',
                    },
                    value: {
                        fontSize: '16px',
                    },
                    total: {
                        show: true,
                        label: 'Total',
                        formatter: function (w) {
                            return 249
                        }
                    }
                }
            }
        },
        labels: [],
        stroke: {
            lineCap: "round"
        },
    };

    var chartFinalized = new ApexCharts(document.querySelector("#chartFinalized"), options3);
    chartFinalized.render();
}

function initiateSubstageChart() {

    var options = {
        series: [{
            name: 'Secured ',
            data: [44, 55, 41, 37, 22, 43, 21]
        }, {
            name: 'Under Risk',
            data: [53, 32, 33, 52, 13, 43, 32]
        }, {
            name: 'On Track',
            data: [12, 17, 11, 9, 15, 11, 20]
        }, {
            name: 'Early to Judge',
            data: [9, 7, 5, 8, 6, 9, 4]
        }, {
            name: 'Lost',
            data: [25, 12, 19, 32, 25, 6, 10]
        }, {
            name: 'Others',
            data: [5, 12, 9, 32, 2, 29, 19]
        }],
        chart: {
            type: 'bar',
            height: 350,
            stacked: true,
        },
        plotOptions: {
            bar: {
                horizontal: true,
                dataLabels: {
                    total: {
                        enabled: true,
                        offsetX: 0,
                        style: {
                            fontSize: '13px',
                            fontWeight: 900
                        }
                    }
                }
            },
        },
        stroke: {
            width: 1,
            colors: ['#fff']
        },
        xaxis: {
            categories: ['FA', 'FF', 'EE', 'FD', 'FC', 'SM', 'PF'],
            labels: {
                formatter: function (val) {
                    return val + "K"
                }
            }
        },
        yaxis: {
            title: {
                text: undefined
            },
        },
        tooltip: {
            y: {
                formatter: function (val) {
                    return val + "K"
                }
            }
        },
        fill: {
            opacity: 1
        },
        legend: {
            position: 'top',
            horizontalAlign: 'center',
        }
    };

    var chartSubstage = new ApexCharts(document.querySelector("#chartSubstage"), options);
    chartSubstage.render();
}

function initiateOverviewChart() {

    var options = {
        series: [{
            name: 'Marine Sprite',

            data: [44, 55, 41, 37, 22, 43, 21],
            color: '#A7D579'
        }, {
            name: 'Striking Calf',
            data: [53, 32, 33, 52, 13, 43, 32],
            color: '#C4E2A5'
        }, {
            name: 'Tank Picture',
            data: [12, 17, 11, 9, 15, 11, 20],
            color: '#BDDEFC'
        }, {
            name: 'Bucket Slope',
            data: [9, 7, 5, 8, 6, 9, 4],
            color: '#FFCC80'
        }, {
            name: 'Reborn Kid',
            data: [25, 12, 19, 32, 25, 24, 10],
            color: '#FF8787'
        }, {
            name: 'Reborn Kid',
            data: [25, 12, 19, 32, 25, 24, 10],
            color: '#FFCCCC'
        }],
        chart: {
            type: 'bar',
            height: 350,
            stacked: true,
        },
        plotOptions: {
            bar: {
                horizontal: true,
                dataLabels: {
                    total: {
                        enabled: true,
                        offsetX: 0,
                        style: {
                            fontSize: '13px',
                            fontWeight: 900
                        }
                    }
                }
            },
        },
        stroke: {
            width: 1,
            colors: ['#fff']
        },
        xaxis: {
            categories: [2008, 2009, 2010, 2011, 2012, 2013, 2014],
            labels: {
                formatter: function (val) {
                    return val + "K"
                }
            }
        },
        yaxis: {
            title: {
                text: undefined
            },
        },
        tooltip: {
            y: {
                formatter: function (val) {
                    return val + "K"
                }
            }
        },
        fill: {
            opacity: 1
        },
        legend: {
            show: false
        }
    };

    var chartOverview = new ApexCharts(document.querySelector("#chartOverview"), options);
    chartOverview.render();
}

function initiateUpdatedChart() {

    var options = {
        series: [{
            name: 'Updated',
            data: [0.4, 0.65, 0.76, 0.88, 1.5, 2.1, 2.9, 3.8, 3.9, 4.2, 4, 4.3, 4.1, 4.2, 4.5,
                3.9, 3.5, 3
            ]
        },
        {
            name: 'Not Updated',
            data: [-0.8, -1.05, -1.06, -1.18, -1.4, -2.2, -2.85, -3.7, -3.96, -4.22, -4.3, -4.4,
            -4.1, -4, -4.1, -3.4, -3.1, -2.8
            ]
        }
        ],
        chart: {
            type: 'bar',
            height: 350,
            stacked: true
        },
        colors: ['#008FFB', '#FF4560'],
        plotOptions: {
            bar: {
                borderRadius: 5,
                borderRadiusApplication: 'end', // 'around', 'end'
                borderRadiusWhenStacked: 'all', // 'all', 'last'
                horizontal: false,
                barHeight: '80%',
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            width: 5,
            colors: ["#fff"]
        },

        grid: {
            xaxis: {
                lines: {
                    show: false
                }
            }
        },
        yaxis: {
            stepSize: 2
        },
        tooltip: {
            shared: false,
            x: {
                formatter: function (val) {
                    return val
                }
            },
            y: {
                formatter: function (val) {
                    return Math.abs(val) + "%"
                }
            }
        },
        xaxis: {
            categories: ['FA', 'FF', 'EE', 'FD', 'FC', 'SM', 'PF', 'FA', 'FF', 'EE', 'FD', 'FC', 'SM', 'PF', 'FA', 'FF', 'EE', 'FD',],
            stepSize:4
            //title: {
            //    text: 'Percent'
            //},
            //labels: {
            //    formatter: function (val) {
            //        return Math.abs(Math.round(val)) + "%"
            //    }
            //}
        },
        legend: {
            show: false
        }
    };

    var chartUpdated = new ApexCharts(document.querySelector("#chartUpdated"), options);
    chartUpdated.render();

}