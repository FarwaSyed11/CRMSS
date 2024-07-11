
var selTerritory, selCompany, selManager, selSalesman = '';
var listCompanyID = [];


$(document).ready(function () {
    LoadYearddl();
    LoadTerritory();
    LoadCompany(selTerritory, currUserId);
    LoadManager(selTerritory, getCompniesFromDDL(), currUserId);
    LoadSalesman(selTerritory, getCompniesFromDDL(), selManager, currUserId);

});


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
    ProductWiseChart.destroy();
   

});
function LoadYearddl() {

    var htm = '';
    for (var i = 0; i < 3; i++) {
        let year = new Date().getFullYear() - i;
        htm += '<option value="' + year + '">' + year + '</option>';
    }
    $("#yearFilter").html(htm);
}

function LoadTerritory() {
    $.ajax({
        url: "PipelineDashboard.aspx/ddlTerritoryFilter",
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
            selTerritory = $('#territoryFilter option:selected').val();
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
        url: "PipelineDashboard.aspx/ddlCompanyFilter",
        data: JSON.stringify({ "UserId": currUserId, "Territory": selTerritory }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var content = '';
            listDDL = result.d;
            $.each(listDDL, function (key, item) {
                content += '<option value="' + item.company + '" selected>' + item.company + '</option>';
                //content += item.company == 'Local Sales' ? '<option value="' + item.company + '" selected>' + item.company + '</option>' : '<option value="' + item.company + '" >' + item.company + '</option>';
            });
            $('#companyFilter').html(content);
            selCompany = getCompniesFromDDL();
            $('#companyFilter').multipleSelect({
                onClick: function (view) {
                    $('.ms-parent').css('box-shadow', 'none');
                    listCompanyID = getCompniesFromDDL();
                    selTerritory = $('#territoryFilter option:selected').val();
                    LoadManager(selTerritory, listCompanyID, currUserId);
                },
                onCheckAll: function () {
                    $('.ms-parent').css('box-shadow', 'none');
                    LoadManager(selTerritory, selCompany, currUserId);
                },
                onUncheckAll: function () {
                    if ($('#companyFilter').val() == "") {
                        toastr.error('Please select any company.', '');
                        $('.ms-parent').css('box-shadow', 'rgb(255 0 0) 0px 0.5px 3.5px');
                    } else {
                        $('.ms-parent').css('box-shadow', 'none');
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
        url: "PipelineDashboard.aspx/ddlManagerFilter",
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
        url: "PipelineDashboard.aspx/ddlSalesmanFilter",
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