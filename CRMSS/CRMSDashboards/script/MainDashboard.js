var options2 = {
    chart: {
        height: 350,
        type: "radialBar",
    },
    series: [89],
    colors: ["#A2ACFF"],
    plotOptions: {
        radialBar: {
            startAngle: -90,
            endAngle: 90,
            track: {
                background: '#E2E5FF',
                startAngle: -90,
                endAngle: 90,
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    fontSize: "15px",
                    show: true
                }
            }
        }
    },
    fill: {
        type: "gradient",
        gradient: {
            shade: "dark",
            type: "horizontal",
            gradientToColors: ["#4151D4"],
            stops: [0, 50, 100]
        }
    },
    stroke: {
        lineCap: "round"
    },
    labels: ["Progress"]
};

new ApexCharts(document.querySelector("#WonRatio"), options2).render();
//================================================================================
var options = {
    chart: {
        height: 200,
        type: "radialBar",
        width: 150,
        offsetX: 30
    },

    series: [67],
    colors: ["#FF9518"],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 20,
                size: "60%",
                background: "#B7B7B7"
            },
            track: {
                background: '#D2D4D4',
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    color: "#fff",
                    fontSize: "12px",
                    show: true,
                    offsetY: 5
                }
            }
        }
    },
    //title: {
    //    ["Sales Order"]
    //},
    fill: {
        type: "gradient",
        gradient: {
            shade: "dark",
            type: "vertical",
            gradientToColors: ["#FF9518"],
            stops: [0, 100]
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#Finance1"), options);
chart.render();
//=======================================================================================
var options = {
    chart: {
        height: 200,
        type: "radialBar",
        width: 150,
        offsetX: 30
    },

    series: [67],
    colors: ["#43D1B7"],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 20,
                size: "60%",
                background: "#B7B7B7"
            },
            track: {
                background: '#D2D4D4',
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    color: "#fff",
                    fontSize: "12px",
                    show: true,
                    offsetY: 5
                }
            }
        }
    },
    //title: {
    //    ["Sales Order"]
    //},
    fill: {
        type: "gradient",
        gradient: {
            shade: "dark",
            type: "vertical",
            gradientToColors: ["#43D1B7"],
            stops: [0, 100]
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#Finance2"), options);
chart.render();
//=======================================================================================
var options = {
    chart: {
        height: 200,
        type: "radialBar",
        width: 150,
        offsetX:30
    },

    series: [67],
    colors: ["#A24AD8"],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 20,
                size: "60%",
                background: "#B7B7B7"
            },
            track: {
                background: '#D2D4D4',
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    color: "#fff",
                    fontSize: "12px",
                    show: true,
                    offsetY: 5
                }
            }
        }
    },
    //title: {
    //    text: 'Collection'
    //},
    fill: {
        type: "gradient",
        gradient: {
            shade: "dark",
            type: "vertical",
            gradientToColors: ["#A24AD8"],
            stops: [0, 100]
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#Finance3"), options);
chart.render();
//=======================================================================================

var options = {
    chart: {
        height: 180,
        type: "radialBar",
        width: 120,
        offsetY:-20
    },

    series: [67],
    colors: ["#EC1A25"],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 20,
                size: "60%",
                background: "#B7B7B7"
            },
            track: {
                background: '#D2D4D4',
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    color: "#fff",
                    fontSize: "12px",
                    show: true,
                    offsetY: 5
                }
            }
        }
    },
    fill: {
        type: "gradient",
        gradient: {
            shade: "dark",
            type: "vertical",
            gradientToColors: ["#EC1A25"],
            stops: [0, 100]
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#Forecast"), options);
chart.render();
//=======================================================================================

var options = {
    series: [{
        name: 'Won',
        data: [44, 55, 41, 37, 22, 43, 21]
    }, {
        name: 'Loss',
        data: [53, 32, 33, 52, 13, 43, 32]
    }],
    chart: {
        type: 'bar',
        height: 400,
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
        categories: ['FF', 'FA', 'FP', 'EE', 'SEC', 'SMS', 'FC'],
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

var chart = new ApexCharts(document.querySelector("#ProductPerf"), options);
chart.render();