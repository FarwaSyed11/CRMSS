var options = {
    chart: {
        height: 140,
        type: "radialBar",
        width: 140
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

var chart = new ApexCharts(document.querySelector("#NoofProj"), options);
chart.render();
//====================================================================================

var options = {
    chart: {
        height: 140,
        type: "radialBar",
        width: 140
    },

    series: [67],
    colors: ["#68D1F3"],
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
            gradientToColors: ["#68D1F3"],
            stops: [0, 100]
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#ProjInfo"), options);
chart.render();
//==================================================================================

var options = {
    chart: {
        height: 140,
        type: "radialBar",
        width: 140
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

var chart = new ApexCharts(document.querySelector("#BOQ"), options);
chart.render();
//==================================================================================

var options = {
    chart: {
        height: 140,
        type: "radialBar",
        width: 140
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

var chart = new ApexCharts(document.querySelector("#QuotSupply"), options);
chart.render();
//==================================================================================
var options = {
    chart: {
        height: 140,
        type: "radialBar",
        width:140
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

var chart = new ApexCharts(document.querySelector("#QuotSupplynInstall"), options);
chart.render();
//================================================================================

var options = {
    series: [{
        name: 'Net Profit',
        data: [44, 55, 57, 56, 61, 58, 89]
    }],
    chart: {
        type: 'bar',
        height: 270
    },
    plotOptions: {
        bar: {
            horizontal: false,
            columnWidth: '60%',
            endingShape: 'rounded',
            distributed: true,
        },
    },
    dataLabels: {
        enabled: false
    },
    stroke: {
        show: true,
        width: 2,
        colors: ['transparent']
    },
    xaxis: {
        categories: ['FF', 'FA', 'SMS', 'SEC', 'EE', 'FP', 'FD'],
    },
    yaxis: {
        title: {
            text: '$ (thousands)'
        }
    },
    fill: {
        opacity: 1
    },
    tooltip: {
        y: {
            formatter: function (val) {
                return "$ " + val + " thousands"
            }
        }
    }
};

var chart = new ApexCharts(document.querySelector("#ProductWise"), options);
chart.render();

