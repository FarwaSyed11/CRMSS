var selTerritory, selCompany, selManager =  '';
var lgGrowthSO, lgGrowthInv, lgGrowthCO = [];
var listvalgrowthSO, listvalgrowthINV, listvalgrowthCO = [];

var lgCompSO, lgCompInv, lgCompCO = [];
var listvalCompSOTY, listvalCompINVTY, listvalCompCOTY = [];
var listvalCompSOLY, listvalCompINVLY, listvalCompCOLY = [];

var listytdSO, listytdINV, listytdCO, listytdPERC = [];
var ytdSOpercVal, ytdINVpercVal, ytdCOpercVal = 0;

var listallPERCnTARG = [];

var SOtargetVal, INVtargetVal, COtargetVal = 0;
var SOOverallVal, INVOverallVal, COOverallVal = 0;
var SOAchVal, INVAchVal, COAchVal = 0;
var SOPercVal, INVPercVal, COPercVal = 0;

$(document).ready(function () {
    loadEmpDetails();
    loadEmpImage();
    LoadTerritory();
    LoadCompany(selTerritory, currUserId);
    LoadManager(selTerritory, selCompany, currUserId);
    LoadSalesman(selTerritory, selCompany, selManager, currUserId);
    LoadGrowthColInvSO();
    LoadComparisionColInvSO();
    loadYeartoDate();
    loadTargetPercAch();
});

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

var chart = new ApexCharts(document.querySelector("#SOperc"), options);

chart.render();

var options = {
    chart: {
        height: 200,
        type: "radialBar",
    },

    series: [84],
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

var chart = new ApexCharts(document.querySelector("#InvcPerc"), options);

chart.render();

var options = {
    chart: {
        height: 200,
        type: "radialBar",
    },

    series: [40],
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
        lineCap: "straight"
    }
};

var chart = new ApexCharts(document.querySelector("#CollectPerc"), options);

chart.render();

function initiateSalesGrowthGraphs(listvalgrowthSO, listvalgrowthINV, listvalgrowthCO) {

    var options = {
        series: [{
            name: "This Year",
            data: listvalgrowthSO,
        }],
        chart: {
            height: 360,
            type: 'line',
            zoom: {
                enabled: false
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            width: [2, 2],
            curve: 'smooth',
            dashArray: [0, 4]
        },
        legend: {
            tooltipHoverFormatter: function (val, opts) {
                return val + ' - <strong>' + opts.w.globals.series[opts.seriesIndex][opts.dataPointIndex] + '</strong>'
            }
        },
        markers: {
            size: 0,
            hover: {
                sizeOffset: 6
            },

        },
        xaxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        },
        tooltip: {
            y: [
                {
                    title: {
                        formatter: function (val) {
                            return val + " (Sales)"
                        }
                    }
                },
                {
                    title: {
                        formatter: function (val) {
                            return val;
                        }
                    }
                }
            ]
        }
    };

    var chart = new ApexCharts(document.querySelector("#sg-SalesOrder"), options);
    chart.render();

    var options1 = {
        series: [{
            name: "This Year",
            data: listvalgrowthINV,
            color: '#FF69B4'
        },],
        chart: {
            height: 360,
            type: 'line',
            zoom: {
                enabled: false
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            width: [2, 2],
            curve: 'smooth',
            dashArray: [0, 4],
            colors: ['#FF69B4', '#FA8072']
        },
        legend: {
            tooltipHoverFormatter: function (val, opts) {
                return val + ' - <strong>' + opts.w.globals.series[opts.seriesIndex][opts.dataPointIndex] + '</strong>'
            },
            markers: {
                fillColors: ['#FF69B4', '#FA8072']
            },
        },
        markers: {
            size: 0,
            hover: {
                sizeOffset: 6
            },
            colors: ['#FF69B4', '#FA8072']
        },
        xaxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        },
        tooltip: {
            y: [
                {
                    title: {
                        formatter: function (val) {
                            return val + " (Invoices)"
                        }
                    }
                },
                {
                    title: {
                        formatter: function (val) {
                            return val + " Invoices"
                        }
                    }
                },
                {
                    title: {
                        formatter: function (val) {
                            return val;
                        }
                    }
                }
            ]
        }
    };

    var chart1 = new ApexCharts(document.querySelector("#sg-Invoice"), options1);
    chart1.render();

    var options2 = {
        series: [{
            name: "This Year",
            data: listvalgrowthCO,
            color: '#48D1CC'
        },],
        chart: {
            height: 360,
            type: 'line',
            zoom: {
                enabled: false
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            width: [2, 2],
            curve: 'smooth',
            dashArray: [0, 4],
            colors: ['#48D1CC', '#BC8F8F']
        },
        legend: {
            tooltipHoverFormatter: function (val, opts) {
                return val + ' - <strong>' + opts.w.globals.series[opts.seriesIndex][opts.dataPointIndex] + '</strong>'
            },
            markers: {
                fillColors: ['#48D1CC', '#BC8F8F'],
            },
        },
        markers: {
            size: 0,
            hover: {
                sizeOffset: 6
            },
            colors: ['#48D1CC', '#BC8F8F']
        },
        xaxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        },
        tooltip: {
            y: [
                {
                    title: {
                        formatter: function (val) {
                            return val + " (Collections)"
                        }
                    }
                },
                {
                    title: {
                        formatter: function (val) {
                            return val + " per session"
                        }
                    }
                },
                {
                    title: {
                        formatter: function (val) {
                            return val;
                        }
                    }
                }
            ]
        }
    };

    var chart2 = new ApexCharts(document.querySelector("#sg-Collection"), options2);
    chart2.render();
}


function initiateComparisionGraph(listvalCompSOTY, listvalCompSOLY, listvalCompINVTY, listvalCompINVLY, listvalCompCOTY, listvalCompCOLY) {
    var options = {
        series: [{
            name: 'This Year',
            type: 'area',
            data: listvalCompSOTY,
            color: '#00BFFF'
        }, {
            name: 'Last Year',
            type: 'line',
            data: listvalCompSOLY,
            color: '#7B68EE'
        }],
        chart: {
            height: 350,
            type: 'line',
        },
        stroke: {
            curve: 'smooth',
            width: [2, 2],
        },
        fill: {
            type: 'solid',
            opacity: [0.15, 1],
            gradient: {
                shade: 'dark',
                type: "horizontal",
                stops: [0, 20, 100],
                gradientToColors: ['#E0FFFF']
            },
        },
        labels: ['Jeb', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        markers: {
            size: 0
        },
        tooltip: {
            shared: true,
            intersect: false,
            y: {
                formatter: function (y) {
                    if (typeof y !== "undefined") {
                        return y.toFixed(0) + " points";
                    }
                    return y;
                }
            }
        }
    };

    var chart = new ApexCharts(document.querySelector("#cp-SalesOrder"), options);
    chart.render();

    var options = {
        series: [{
            name: 'This Year',
            type: 'area',
            data: listvalCompINVTY,
            color: '#6B8E23'
        }, {
            name: 'Last Year',
            type: 'line',
            data: listvalCompINVLY,
            color: '#A52A2A'
        }],
        chart: {
            height: 350,
            type: 'line',
        },
        stroke: {
            curve: 'smooth',
            width: [2, 2],
        },
        fill: {
            type: 'solid',
            opacity: [0.15, 1],
            gradient: {
                shade: 'dark',
                type: "vertical",
                stops: [0, 50, 100],
                gradientToColors: ['#00FF7F']
            },
        },
        labels: ['Jeb', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        markers: {
            size: 0
        },
        tooltip: {
            shared: true,
            intersect: false,
            y: {
                formatter: function (y) {
                    if (typeof y !== "undefined") {
                        return y.toFixed(0) + " points";
                    }
                    return y;
                }
            }
        }
    };

    var chart = new ApexCharts(document.querySelector("#cp-Invoice"), options);
    chart.render();

    var options = {
        series: [{
            name: 'This Year',
            type: 'area',
            data: listvalCompCOTY,
            color: '#E0FFFF'
        }, {
            name: 'Last Year',
            type: 'line',
            data: listvalCompCOLY,
            color: '#5F9EA0'
        }],
        chart: {
            height: 350,
            type: 'line',
        },
        stroke: {
            curve: 'smooth',
            width: [2, 2],
        },
        fill: {
            type: 'solid',
            opacity: [0.15, 1],
            gradient: {
                shade: 'dark',
                type: "vertical",
                stops: [0, 50, 100],
                gradientToColors: ['#E0FFFF']
            },
        },
        labels: ['Jeb', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        markers: {
            size: 0
        },
        tooltip: {
            shared: true,
            intersect: false,
            y: {
                formatter: function (y) {
                    if (typeof y !== "undefined") {
                        return y.toFixed(0) + " points";
                    }
                    return y;
                }
            }
        }
    };

    var chart = new ApexCharts(document.querySelector("#cp-Collection"), options);
    chart.render();

}

function initiateYTDPercRange(ytdSOpercVal, ytdINVpercVal, ytdCOpercVal) {
    var options1= {
        chart: {
            height: 250,
            type: "radialBar",
        },
        series: [ytdSOpercVal],
        colors: ["#3CB371"],
        plotOptions: {
            radialBar: {
                startAngle: -90,
                endAngle: 90,
                track: {
                    background: '#DBFFE6',
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
                gradientToColors: ["#008080"],
                stops: [0, 50, 100]
            }
        },
        stroke: {
            lineCap: "round"
        },
        labels: ["Progress"]
    };

    new ApexCharts(document.querySelector("#salesorderrange"), options1).render();

    var options2 = {
        chart: {
            height: 250,
            type: "radialBar",
        },
        series: [ytdINVpercVal],
        colors: ["#8762FF"],
        plotOptions: {
            radialBar: {
                startAngle: -90,
                endAngle: 90,
                track: {
                    background: '#EFEAFF',
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
                gradientToColors: ["#25009C", '#3100CF'],
                stops: [0, 50, 100]
            }
        },
        stroke: {
            lineCap: "round"
        },
        labels: ["Progress"]
    };

    new ApexCharts(document.querySelector("#invoicerange"), options2).render();

    var options3 = {
        chart: {
            height: 250,
            type: "radialBar",
        },
        series: [ytdCOpercVal],
        colors: ["#73DFFF"],
        plotOptions: {
            radialBar: {
                startAngle: -90,
                endAngle: 90,
                track: {
                    background: '#D1E5FF',
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
                gradientToColors: ["#3D92FF"],
                stops: [0, 50, 100]
            }
        },
        stroke: {
            lineCap: "round"
        },
        labels: ["Progress"]
    };

    new ApexCharts(document.querySelector("#collectionrange"), options3).render();
}

function loadEmpImage() {

    $.ajax({
        url: "FinanceDashboard.aspx/GetEmpImage",
        data: JSON.stringify({ "EmpNo": EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#imgUser2').attr('src', result.d);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadEmpDetails() {

    $.ajax({
        url: "FinanceDashboard.aspx/GetEmpInfo",
        data: JSON.stringify({ "EmpNo": EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#lblName').html(result.d[0].FULL_NAME);
            $('#lbProfPosition').html(result.d[0].POSITION);

            $('#lbPhoneNumber').html(result.d[0].MOBILE_PHONE);
            $('#lbTeleNumber').html(result.d[0].WORK_PHONE);

            $('#lbEmpNumber').html(result.d[0].EMPLOYEE_NUMBER);
            $('#lbTitle').html(result.d[0].TITLE);
            $('#lbFirstName').html(result.d[0].FIRST_NAME);
            $('#lbMiddleName').html(result.d[0].MIDDLE_NAMES);
            $('#lbLastName').html(result.d[0].LAST_NAME);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadTerritory() {
    $.ajax({
        url: "FinanceDashboard.aspx/ddlTerritoryFilter",
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
            selTerritory = $('#territoryFilter option:selected').val();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function LoadCompany(selTerritory, currUserId) {
    $.ajax({
        url: "FinanceDashboard.aspx/ddlCompanyFilter",
        data: JSON.stringify({ "UserId": currUserId, "Territory": selTerritory }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var content = '';
            listDDL = result.d;
            $.each(listDDL, function (key, item) {
                content += '<option value="' + item.company + '" >' + item.company + '</option>';
            });
            $('#companyFilter').html(content);
            selCompany = $('#companyFilter option:selected').val();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function LoadManager(selTerritory, selCompany, currUserId) {
    $.ajax({
        url: "FinanceDashboard.aspx/ddlManagerFilter",
        data: JSON.stringify({ "UserId": currUserId, "Territory": selTerritory, "Company": selCompany }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var content = '';
            listDDL = result.d;
            $.each(listDDL, function (key, item) {
                content += '<option value="' + item.value + '" >' + item.name + '</option>';
            });
            $('#managerFilter').html(content);
            selManager = $('#managerFilter option:selected').val();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function LoadSalesman(selTerritory, selCompany, selManager, currUserId) {
    $.ajax({
        url: "FinanceDashboard.aspx/ddlSalesmanFilter",
        data: JSON.stringify({ "UserId": currUserId, "Territory": selTerritory, "Company": selCompany, "Manager": selManager }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var content = '';
            listDDL = result.d;
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
$('#territoryFilter').on('change', function () {
    selTerritory = $('#territoryFilter option:selected').val();
    LoadCompany(selTerritory, currUserId);
});
$('#companyFilter').on('change', function () {
    selTerritory = $('#territoryFilter option:selected').val();
    selCompany = $('#companyFilter option:selected').val();
    LoadManager(selTerritory, selCompany, currUserId);
});

$('#managerFilter').on('change', function () {
    selTerritory = $('#territoryFilter option:selected').val();
    selCompany = $('#companyFilter option:selected').val();
    selManager = $('#managerFilter option:selected').val();
    LoadSalesman(selTerritory, selCompany, selManager, currUserId);
});

$('#btngoFilter').on('click', function () {
    selTerritory = $('#territoryFilter option:selected').val();
    selCompany = $('#companyFilter option:selected').val();
    selManager = $('#managerFilter option:selected').val();
    selSalesman = $('#salesmanFilter option:selected').val();
    LoadGrowthColInvSO();
    LoadComparisionColInvSO();
    loadYeartoDate();
    loadTargetPercAch();
});

function EmpPerformance() {

}

function LoadGrowthColInvSO() {
    $.ajax({
        url: "FinanceDashboard.aspx/LoadGrowthColInvSO",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman, "Year":'2024' }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            lgGrowthSO = result.d.listSOGrowth;
            lgGrowthInv = result.d.listInvGrowth;
            lgGrowthCO = result.d.listCOGrowth;

            listvalgrowthSO = [];
            $.each(lgGrowthSO, function (key, item) {
                listvalgrowthSO.push(parseInt(item.Value));
            });
            
            listvalgrowthINV = [];
            $.each(lgGrowthInv, function (key, item) {
                listvalgrowthINV.push(parseInt(item.Value))
            });
           
            listvalgrowthCO = [];
            $.each(lgGrowthCO, function (key, item) {
                listvalgrowthCO.push(parseInt(item.Value))
            });
            
            initiateSalesGrowthGraphs(listvalgrowthSO, listvalgrowthINV, listvalgrowthCO)
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function LoadComparisionColInvSO() {
    $.ajax({
        url: "FinanceDashboard.aspx/LoadComparisionColInvSO",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman, "Year": '2024' }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            lgCompSO = result.d.listSOGrowthComp;
            lgCompInv = result.d.listInvGrowthComp;
            lgCompCO = result.d.listCOGrowthComp;

            listvalCompSOTY = []; listvalCompSOLY = [];
            $.each(lgCompSO, function (key, item) {
                listvalCompSOTY.push(parseInt(item.ValueTY));
                listvalCompSOLY.push(parseInt(item.ValueLY));
            });

            listvalCompINVTY = []; listvalCompINVLY = [];
            $.each(lgCompInv, function (key, item) {
                listvalCompINVTY.push(parseInt(item.ValueTY));
                listvalCompINVLY.push(parseInt(item.ValueLY));
            });

            listvalCompCOTY = []; listvalCompCOLY = [];
            $.each(lgCompCO, function (key, item) {
                listvalCompCOTY.push(parseInt(item.ValueTY));
                listvalCompCOLY.push(parseInt(item.ValueLY));
            });

            initiateComparisionGraph(listvalCompSOTY, listvalCompSOLY, listvalCompINVTY, listvalCompINVLY, listvalCompCOTY, listvalCompCOLY);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadYeartoDate() {
    $.ajax({
        url: "FinanceDashboard.aspx/loadYeartoDate",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman, "Year": '2024' }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            listytdSO = result.d.listSOytd;
            listytdINV = result.d.listInvytd;
            listytdCO = result.d.listCOytd;
            listytdPERC = result.d.allPercentage;

            $.each(listytdSO, function (key, item) {
                $("#valTotEntered").html(item.TotEntered);
                $("#valTotBooked").html(item.TotBooked);
                $("#valTotClosed").html(item.TotClosed);
                $("#valTotal").html(item.TotSOAmount);
                $("#valInvAmount").html(item.InvoiceAmount);
                $("#valPendingInv").html(item.PendingInv);
            });
            $.each(listytdINV, function (key, item) {
                $("#valCollected").html(item.Collected);
                $("#valNotCollected").html(item.NotCollected);
                $("#valPendingDue").html(item.PendingDue);
                $("#valPendingNotDue").html(item.PendingNotDue);
                $("#valInvoiceYTD").html(item.TotInvAmount);
            });
            $.each(listytdCO, function (key, item) {
                $("#valCleared").html(item.Cleared);
                $("#valRemitted").html(item.Remitted);
                $("#valMatured").html(item.Matured);
                $("#valNotMatured").html(item.NotMatured);
                $("#valCOYTD").html(item.TotCOlValue);
            });

            ytdSOpercVal, ytdINVpercVal, ytdCOpercVal = [];
            $.each(listytdPERC, function (key, item) {
                
                if (item.Name == 'SO') {
                    ytdSOpercVal = parseInt(item.Percentage);
                }
                if (item.Name == 'Invoice') {
                    ytdINVpercVal = parseInt(item.Percentage);
                }
                if (item.Name == "Collection") {
                    ytdCOpercVal = parseInt(item.Percentage);
                }
            });

            initiateYTDPercRange(ytdSOpercVal, ytdINVpercVal, ytdCOpercVal)
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadTargetPercAch() {
    $.ajax({
        url: "FinanceDashboard.aspx/loadTargetPercAch",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman, "Year": '2024' }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            listallPERCnTARG = result.d.allPercentageTarget;

            $.each(listallPERCnTARG, function (key, item) {
                if (item.Name == "SO") {
                    SOPercVal = item.Percentage;
                    $("#valSOAchievement").html(item.Achiement);
                    $("#valSOTarget").html(item.Target);
                    $("#valOverallSO").html(item.Overall);
                }
                if (item.Name == "INV") {
                    INVPercVal = item.Percentage;
                    $("#valINVAchievement").html(item.Achiement);
                    $("#valINVTarget").html(item.Target);
                    $("#valOverallINV").html(item.Overall);
                }
                if (item.Name == "COL") {
                    COPercVal = item.Percentage;
                    $("#valCOAchievement").html(item.Achiement);
                    $("#valCOTarget").html(item.Target);
                    $("#valOverallCollection").html(item.Overall);
                }
            });
            initiateAllOverallPie(SOPercVal, INVPercVal, COOverallVal);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}