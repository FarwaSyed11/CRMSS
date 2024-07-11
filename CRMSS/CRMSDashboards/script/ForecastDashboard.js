
var selTerritory, selCompany, selManager, selSalesman = '';
var listCompanyID = '';

var chartProductWise = [], chartCurrentForecast = [], chartPreviousForecast = [], chartPredictionForecast = [];
var chartPPercentage = [], chartPAchievement = [];
$(document).ready(function () {
    LoadYearddl();
    LoadTerritory();
    LoadCompany(selTerritory, currUserId);
    LoadManager(selTerritory, getCompniesFromDDL(), currUserId);
    LoadSalesman(selTerritory, getCompniesFromDDL(), selManager, currUserId);


});



function LoadYearddl() {
    var htm = '';
    for (var i = 0; i < 3; i++) {
        let year = new Date().getFullYear() - i;
        htm += '<option value="' + year + '">' + year + '</option>';
    }
    $("#yearFilter").html(htm);
}

$('#territoryFilter').on('change', function () {
    selTerritory = $('#territoryFilter option:selected').val();
    LoadCompany(selTerritory, currUserId);
});

$('#managerFilter').on('change', function () {
    selTerritory = $('#territoryFilter option:selected').val();
    listCompanyID = getCompniesFromDDL();
    selManager = $('#managerFilter option:selected').val();
    LoadSalesman(selTerritory, listCompanyID, selManager, currUserId);
});

$('#btngoFilter').on('click', function () {
    selTerritory = $('#territoryFilter option:selected').val();
    selCompany = getCompniesFromDDL();
    selManager = $('#managerFilter option:selected').val();
    selSalesman = $('#salesmanFilter option:selected').val();
    chartProductWise.destroy();
    chartCurrentForecast.destroy();
    chartPreviousForecast.destroy();
    chartPredictionForecast.destroy();
    chartPPercentage.destroy();
    chartPAchievement.destroy();
});


function LoadTerritory() {
    $.ajax({
        url: "ForecastDashboard.aspx/ddlTerritoryFilter",
        data: JSON.stringify({ "UserId": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var content = '';
            listDDL = result.d;
            $.each(listDDL, function (key, item) {
                content += '<option value="' + item.territory + '" >' + item.territory + '</option>';
            });
            $('#territoryFilter').html(content);
            $('#territoryFilter option[value="United Arab Emirates"]').prop('selected', true);
            selTerritory = $('#territoryFilter option:selected').val().trim();
            LoadCompany(selTerritory, currUserId);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function LoadCompany(selTerritory, currUserId) {
    selTerritory = selTerritory;
    $.ajax({
        url: "ForecastDashboard.aspx/ddlCompanyFilter",
        data: JSON.stringify({ "UserId": currUserId, "Territory": selTerritory }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var content = '';
            listDDL = result.d;
            $.each(listDDL, function (key, item) {
                content += item.company == 'Local Sales' ? '<option value="' + item.company + '" selected>' + item.company + '</option>' : '<option value="' + item.company + '" >' + item.company + '</option>';
            });
            $('#companyFilter').html(content);
            //$('#companyFilter option[value="Local Sales"]').prop('selected', true);
            selCompany = getCompniesFromDDL();
            //selCompany = $('#companyFilter option:selected').val();
            //listCompanyID = getCompniesFromDDL();
            $('#companyFilter').multipleSelect({
                onClick: function (view) {
                    listCompanyID = getCompniesFromDDL();
                    selTerritory = $('#territoryFilter option:selected').val();
                    //selCompany = $('#companyFilter option:selected').val();
                    LoadManager(selTerritory, listCompanyID, currUserId);
                },
                onCheckAll: function () {
                    LoadManager(selTerritory, selCompany, currUserId);
                },
                onUncheckAll: function () {
                    if (getCompanyFromDDL() == "") {
                        toastr.error('Please select any company.', '');
                        $('.ms-parent').css('box-shadow', 'rgb(255 0 0) 0px 0.5px 3.5px');
                    } else {
                        $('.ms-parent').css('box-shadow', ' ');
                        LoadManager(selTerritory, selCompany, currUserId);
                    }
                }
            });

            LoadManager(selTerritory, selCompany, currUserId)
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function getCompniesFromDDL() {
    var compnies = '';
    for (var i = 0; i < $('#companyFilter option:selected').length; i++) {
        compnies += $('#companyFilter option:selected')[i].text.trim() + ',';
    }
    return compnies.substring(0, compnies.lastIndexOf(","));
}

function LoadManager(selTerritory, listCompanyID, currUserId) {
    listCompanyID = listCompanyID;
    $.ajax({
        url: "ForecastDashboard.aspx/ddlManagerFilter",
        data: JSON.stringify({ "UserId": currUserId, "Territory": selTerritory, "Company": listCompanyID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var content = '';
            listDDL = result.d;
            content = result.d.length > 1 ? '<option value="-1"> All </option>' : '';
            $.each(listDDL, function (key, item) {
                content += '<option value="' + item.value + '" >' + item.name + '</option>';
            });
            $('#managerFilter').html(content);
            selManager = $('#managerFilter option:selected').val();
            LoadSalesman(selTerritory, listCompanyID, selManager, currUserId)
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function LoadSalesman(selTerritory, listCompanyID, selManager, currUserId) {
    listCompanyID = listCompanyID
    $.ajax({
        url: "ForecastDashboard.aspx/ddlSalesmanFilter",
        data: JSON.stringify({ "UserId": currUserId, "Territory": selTerritory, "Company": listCompanyID, "Manager": selManager }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var content = '';
            listDDL = result.d;
            content = result.d.length > 1 ? '<option value="-1"> All </option>' : '';
            $.each(listDDL, function (key, item) {
                content += '<option value="' + item.value + '" >' + item.name + '</option>';
            });
            $('#salesmanFilter').html(content);
            selSalesman = $('#salesmanFilter option:selected').val();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function initialiseProductwiseChart() {

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

    var chartProductWise = new ApexCharts(document.querySelector("#ProductWise"), options);
    chartProductWise.render();
}

//=================================================================================================================

function initialiseAllForecastedCharts() {

    var options1 = {
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

    chartCurrentForecast = new ApexCharts(document.querySelector("#CurrentForecast"), options1);
    chartCurrentForecast.render();
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

    chartPreviousForecast = new ApexCharts(document.querySelector("#PreviousForecast"), options2);
    chartPreviousForecast.render();
    //=================================================================================================================

    var options3 = {
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

    chartPredictionForecast = new ApexCharts(document.querySelector("#PredictionForecast"), options3);
    chartPredictionForecast.render()
}

//==================================================================================

function initialisePredictionPercChart() {

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

    var chartPPercentage = new ApexCharts(document.querySelector("#P-Percentage"), options);
    chartPPercentage.render();

}

//==================================================================================
function initialisePredictionAchChart() {
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

    var chartPAchievement = new ApexCharts(document.querySelector("#P-Achievement"), options);
    chartPAchievement.render();
}
