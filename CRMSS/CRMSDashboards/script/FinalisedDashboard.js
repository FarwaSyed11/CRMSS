var options = {
    chart: {
        height: 200,
        type: "radialBar",
    },

    series: [67],
    colors: ["#FFAF9B"],
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
    fill: {
        type: "gradient",
        gradient: {
            shade: "dark",
            type: "vertical",
            gradientToColors: ["#FFDA3F"],
            stops: [0, 100]
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#Finalisedperc"), options);

chart.render();

var options = {
    chart: {
        height: 200,
        type: "radialBar",
    },

    series: [67],
    colors: ["#6981FF"],
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
    fill: {
        type: "gradient",
        gradient: {
            shade: "dark",
            type: "vertical",
            gradientToColors: ["#94D9FF"],
            stops: [0, 100]
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#LPOperc"), options);

chart.render();

var options = {
    chart: {
        height: 200,
        type: "radialBar",
    },

    series: [67],
    colors: ["#FF81FF"],
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
    fill: {
        type: "gradient",
        gradient: {
            shade: "dark",
            type: "vertical",
            gradientToColors: ["#FFC3D1"],
            stops: [0, 100]
        }
    },
    stroke: {
        lineCap: "straight",
    }
};

var chart = new ApexCharts(document.querySelector("#Contractperc"), options);

chart.render();


var options = {
    series: [{
        data: [400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380]
    }],
    chart: {
        type: 'bar',
        height: 400
    },
    plotOptions: {
        bar: {
            borderRadius: 4,
            borderRadiusApplication: 'end',
            horizontal: true,
            distributed: true
        }
    },
    dataLabels: {
        enabled: false
    },
    xaxis: {
        categories: ['South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan',
            'United States', 'China', 'Germany'
        ],
    }
};

var chart = new ApexCharts(document.querySelector("#FinalisedProduct"), options);
chart.render();