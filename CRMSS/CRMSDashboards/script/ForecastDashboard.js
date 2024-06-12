var options = {
    series: [{
        name: 'Product Won',
        data: [0.4, 0.65, 0.76, 0.88, 1.5, 2.1, 2.9, 3.8, 3.9, 4.2, 4, 4.3
        ]
    },
    {
        name: 'Product Loss',
        data: [-4, -1.5, - 0.6, -0.88, -1.5, -0.1, -2, -3.8, -0.9, -4.2, -4, -4
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
        width: 1,
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
        stepSize: 1
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

        labels: {
            formatter: function (val) {
                return Math.abs(Math.round(val)) + "%"
            }
        }
    },
    labels: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    }
};

var chart = new ApexCharts(document.querySelector("#ProductWise"), options);
chart.render();
//=================================================================================================================

var options2 = {
    chart: {
        height: 250,
        type: "radialBar",
    },
    series: [67],
    colors: ["#A5E5FB"],
    plotOptions: {
        radialBar: {
            startAngle: -90,
            endAngle: 90,
            track: {
                background: '#DBF6FF',
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
            gradientToColors: ["#6CBAD5"],
            stops: [0, 50, 100]
        }
    },
    stroke: {
        lineCap: "round"
    },
    labels: ["Progress"]
};

new ApexCharts(document.querySelector("#CurrentForecast"), options2).render();

//=================================================================================================================

var options2 = {
    chart: {
        height: 250,
        type: "radialBar",
    },
    series: [67],
    colors: ["#F4AFFA"],
    plotOptions: {
        radialBar: {
            startAngle: -90,
            endAngle: 90,
            track: {
                background: '#FDE6FF',
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
            gradientToColors: ["#B87CBD"],
            stops: [0, 50, 100]
        }
    },
    stroke: {
        lineCap: "round"
    },
    labels: ["Progress"]
};

new ApexCharts(document.querySelector("#PreviousForecast"), options2).render();

//=================================================================================================================

var options2 = {
    chart: {
        height: 250,
        type: "radialBar",
    },
    series: [67],
    colors: ["#AAF2AA"],
    plotOptions: {
        radialBar: {
            startAngle: -90,
            endAngle: 90,
            track: {
                background: '#EBFFEB',
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
            gradientToColors: ["#74D074"],
            stops: [0, 50, 100]
        }
    },
    stroke: {
        lineCap: "round"
    },
    labels: ["Progress"]
};

new ApexCharts(document.querySelector("#PredictionForecast"), options2).render();

//==================================================================================

var options = {
    chart: {
        height: 90,
        type: "radialBar",
        width: 100
    },

    series: [7],
    colors: ["#FF7C88"],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 5,
                size: "25%",
                background: "#fff"
            },
            track: {
                background: '#D2D4D4',
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    color: "#555",
                    fontSize: "10px",
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
            gradientToColors: ["#FE5F8F"],
            stops: [0, 100]
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#P-Percentage"), options);
chart.render();

//==================================================================================

var options = {
    chart: {
        height: 90,
        type: "radialBar",
        width: 100
    },

    series: [67],
    colors: ["#27B2D1"],
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 5,
                size: "25%",
                background: "#fff"
            },
            track: {
                background: '#D2D4D4',
            },
            dataLabels: {
                name: {
                    show: false,
                },
                value: {
                    color: "#555",
                    fontSize: "10px",
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
            gradientToColors: ["#4274B9"],
            stops: [0, 100]
        }
    },
    stroke: {
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#P-Achievement"), options);
chart.render();