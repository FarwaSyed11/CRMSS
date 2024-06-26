var chartSubsatge = [];
var chartBestMarket = [];
var chartApprovalStatus = [];
var chartCompetition = [];
$(document).ready(function () {
    LoadYearddl();
    //LoadCompany(selTerritory, currUserId);
    //LoadManager(selTerritory, getCompniesFromDDL(), currUserId);
    initiateSubstageGraph();
    initiateBestMarketChart();
    initateApprovalStatusChart();
    initiateCompetitionGraph();
});

function LoadYearddl() {

    var htm = '';
    for (var i = 0; i < 3; i++) {
        let year = new Date().getFullYear() - i;
        htm += '<option value="' + year + '">' + year + '</option>';
    }
    $("#yearFilter").html(htm);
}
function initiateSubstageGraph() {
    var options = {
        series: [{
            name: 'Net Profit',
            data: [1200,5900,9000,2345, 3000, 4990, 1300]
        }],
        chart: {
            type: 'bar',
            height: 300
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
            categories: ['FA', 'FF', 'EE', 'FD', 'FC', 'SM', 'PF']
        },
        
        fill: {
            opacity: 0.8
        },
        tooltip: {
            y: {
                formatter: function (val) {
                    return "AED " + val + " "
                }
            }
        },
        legend: {
            show: false,
        }
    };

    chartSubsatge = new ApexCharts(document.querySelector("#chartSubsatge"), options);
    chartSubsatge.render();
}

function initiateBestMarketChart() {
    var options1 = {
        series: [44, 55, 67, 83],
        chart: {
            height: 300,
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

    chartBestMarket = new ApexCharts(document.querySelector("#chartBestMarket"), options1);
    chartBestMarket.render();
}

function initateApprovalStatusChart() {
    var options = {
        series: [44, 55, 13],
        chart: {
            width: 350,
            type: 'pie',
            offsetY: 20,
            offsetX: -55,
            //options: {
            //    chart: {
            //        width: 200
            //    },
            //},
        },
        legend: {
            position: 'bottom',
            horizontalAlign: 'center',
            /*offsetX: -60,*/
            //offsetY: 0
        },
        labels: ['Partially', 'Approved', 'Not approved'],
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 100
                },
                legend: {
                    position: 'top',
                    horizontalAlign: 'right',
                }
            }
        }]
    };

    var chartApprovalStatus = new ApexCharts(document.querySelector("#chartApprovalStatus"), options);
    chartApprovalStatus.render();
}

function initiateCompetitionGraph() {
    var options = {
        series: [{
            name: 'Net Profit',
            data: [1200, 5900, 9000, 2345, 3000, 4990, 1300]
        }],
        chart: {
            type: 'bar',
            height: 300
        },
        plotOptions: {
            bar: {
                horizontal: true,
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
            categories: ['FA', 'FF', 'EE', 'FD', 'FC', 'SM', 'PF']
        },

        fill: {
            opacity: 0.8
        },
        tooltip: {
            y: {
                formatter: function (val) {
                    return "AED " + val + " "
                }
            }
        },
        legend: {
            show: false,
        }
    };

    chartCompetition = new ApexCharts(document.querySelector("#chartCompetition"), options);
    chartCompetition.render();
}