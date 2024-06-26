
var chartWonRatio = [], chartPipeline = [], chartProspects = [];
var chartProducts = [];
var chartTopCompetitor = [];

$(document).ready(function () {
    LoadYearddl();
    //LoadCompany(selTerritory, currUserId);
    //LoadManager(selTerritory, getCompniesFromDDL(), currUserId);
    initiateWonPipelineProspectsperc();
    initiateProductsChart();
    initiateTopComptChart();
});

function LoadYearddl() {

    var htm = '';
    for (var i = 0; i < 3; i++) {
        let year = new Date().getFullYear() - i;
        htm += '<option value="' + year + '">' + year + '</option>';
    }
    $("#yearFilter").html(htm);
}

function initiateWonPipelineProspectsperc() {
    var options1 = {
        chart: {
            height: 300,
            type: "radialBar",
        },

        series: [56],
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

    chartWonRatio = new ApexCharts(document.querySelector("#chartWonRatio"), options1);

    chartWonRatio.render();

    var options2 = {
        chart: {
            height: 300,
            type: "radialBar",
        },

        series: [34],
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

    chartPipeline = new ApexCharts(document.querySelector("#chartPipeline"), options2);
    chartPipeline.render();

    var options3 = {
        chart: {
            height: 300,
            type: "radialBar",
        },

        series: [78],
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

    chartProspects = new ApexCharts(document.querySelector("#chartProspects"), options3);
    chartProspects.render();

}

function initiateProductsChart() {

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
            height: 290,
            stacked: true,
        },
        plotOptions: {
            bar: {
                horizontal: false,
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

    chartProducts = new ApexCharts(document.querySelector("#chartProducts"), options);
    chartProducts.render();
}


function initiateTopComptChart() {
    var options1 = {
        series: [44, 55, 67, 83],
        chart: {
            height: 320,
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

    chartTopCompetitor = new ApexCharts(document.querySelector("#chartTopCompetitor"), options1);
    chartTopCompetitor.render();
}