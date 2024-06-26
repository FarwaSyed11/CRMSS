
var selTerritory, selCompany, selManager, selSalesman = '';
var listCompanyID = [];
var listTopCards = [];
var listOverview = [];
var listProductgraph, listProduct, listProductValue = [];
var listTop50Jobs = [];
var ProductWiseChart = [];

$(document).ready(function () {
    LoadYearddl();
    LoadTerritory();
    LoadCompany(selTerritory, currUserId);
    LoadManager(selTerritory, getCompniesFromDDL(), currUserId);
    LoadSalesman(selTerritory, getCompniesFromDDL(), selManager, currUserId);
    loadOverview();
    loadPipelineAging();
    loadTopCards();
    loadProductWise();
    loadTop50Jobs();
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
    loadOverview();
    loadPipelineAging();
    loadTopCards();
    loadProductWise();
    loadTop50Jobs();
    
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
                content += item.company == 'Local Sales' ? '<option value="' + item.company + '" selected>' + item.company + '</option>' : '<option value="' + item.company + '" >' + item.company + '</option>';
            });
            $('#companyFilter').html(content);
            selCompany = getCompniesFromDDL();
            $('#companyFilter').multipleSelect({
                onClick: function (view) {
                    listCompanyID = getCompniesFromDDL();
                    selTerritory = $('#territoryFilter option:selected').val();
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

function loadTopCards() {

    $.ajax({
        url: "PipelineDashboard.aspx/loadTopCards",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listTopCards = result.d;
            $.each(listTopCards, function (key, item) {
                $('#ValTotProj').html(nFormatter(item.ValueProjTot));
                $('#CountTotProj').html(item.CountProjTot);
                $('#ValTotJOH').html(nFormatter(item.ValueJOHTot));
                $('#CountTotJOH').html(item.CountJOHTot);
                $('#ValTotBOQ').html(nFormatter(item.ValueBOQTot));
                $('#CountTotBOQ').html(item.CountBOQTot);
                $('#ValTotTender').html(nFormatter(item.ValueTenderTot));
                $('#CountTotTender').html(item.CountTenderTot);
                $('#ValTotOnHold').html(nFormatter(item.ValueHoldTot));
                $('#CountTotOnHold').html(item.CountHoldTot);
            });
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadOverview() {

    $.ajax({
        url: "PipelineDashboard.aspx/loadOverview",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listOverview = result.d;
            $.each(listOverview, function (key, item) {
                $('#securedcount').html(item.CountSecured);
                $('#underriskcount').html(item.CountUnderrisk);
                $('#ontrackcount').html(item.CountOntrack);
                $('#ETJcount').html(item.CountEarlytoJuj);
                $('#lostcount').html(item.CountLost);
                $('#otherscount').html(item.CountOther);
            });
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function loadPipelineAging() {

    $.ajax({
        url: "PipelineDashboard.aspx/loadPipelineAging",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $.each(result, function (key, item) {
                $("#divoneTofive").html(result.d[0].Five);
                $("#divdixToten").html(result.d[0].Ten);
                $("#divlevenToFifteen").html(result.d[0].Fifteen);
                $("#divsixteenToTwenty").html(result.d[0].Twenty);
                $("#divtwentyToTwefive").html(result.d[0].Twentyfive);
            });
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadProductWise() {
    $.ajax({
        url: "PipelineDashboard.aspx/loadProductWise",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = ''

            listProductgraph = result.d;

            $.each(listProductgraph, function (key, item) {
                htm += '<div class="d-flex justify-content-between border-bottom p-3 m-2 align-items-center"><div class="d-flex"><div><div class="" style="font-weight: 500;text-transform: capitalize;">' + item.ProdType + '</div><div class="d-flex text-muted mb-2" style="font-size: 14px"><span class="px-3 py-2 mx-1 rounded-pill shadow-sm border text-center"><img src="image/secured.png" style="width: 16px;"/><div>' + item.CountSecured + '<b class="mx-1">|</b>' + nFormatter(parseInt(item.Secured)) + '</div></span><span class="px-3 py-2 mx-1 rounded-pill shadow-sm border text-center"><img src="image/underrisk.png" style="width: 16px;"/><div>' + item.CountUnderrisk + '<b class="mx-1">|</b>' + nFormatter(parseInt(item.Underrisk)) + '</div></span><span class="px-3 py-2 mx-1 rounded-pill shadow-sm border text-center"><img src="image/ontrack.png" style="width: 16px;"/><div>' + item.CountOntrack + '<b class="mx-1">|</b>' + nFormatter(parseInt(item.Ontrack)) + '</div></span></div><div class="d-flex text-muted" style="font-size: 14px"><span class="px-3 py-2 mx-1 rounded-pill shadow-sm border text-center"><img src="image/earlytojuj.png" style="width: 16px;"/><div>' + item.CountEarlytoJuj + '<b class="mx-1">|</b>1' + nFormatter(parseInt(item.EarlytoJuj)) + '</div> </span><span class="px-3 py-2 mx-1 rounded-pill shadow-sm border text-center"><img src="image/lost.png" style="width: 16px;"/><div>' + item.CountLost + '<b class="mx-1">|</b>' + nFormatter(parseInt(item.Lost)) + '</div> </span><span class="px-3 py-2 mx-1 rounded-pill shadow-sm border text-center"><img src="image/other.png" style="width: 16px;"/><div>' + item.CountOther + '<b class="mx-1">|</b>' + nFormatter(parseInt(item.Other)) + '</div> </span></div></div></div><div class="text-danger fs-4">' + nFormatter(parseInt(item.Value)) + '</div></div>'
            });
            $(".topcustomers").html(htm);

            listProduct = [], listProductValue = [];

            $.each(listProductgraph, function (key, item) {
                listProduct.push(item.ProdType);

            });
            $.each(listProductgraph, function (key, item) {
                listProductValue.push(parseInt(item.Value));
            });

            initiateProductGraph(listProduct, listProductValue);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadTop50Jobs() {
    $.ajax({
        url: "PipelineDashboard.aspx/loadTop50Jobs",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listTop50Jobs = result.d;
            var htm = ''
            $.each(listTop50Jobs, function (key, item) {
                htm += '<div class="forcard"><div class="forcard-head">' + item.SalesmanName + '</div><span class="forcard-label">' + nFormatter(parseInt(item.Value)) + '</span><div class="forcard-body">' + item.ProjectName + '</div></div>'

            });
            $("#top50jobs").html(htm);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function nFormatter(num) {

    if (num >= 1000000000000) {
        return (num / 1000000000000).toFixed(1).replace(/\.0$/, '') + 'T';
    }
    else if (num >= 1000000000) {
        return (num / 1000000000).toFixed(1).replace(/\.0$/, '') + 'B';
    }
    else if (num >= 1000000) {
        return (num / 1000000).toFixed(1).replace(/\.0$/, '') + 'M';
    }
    else if (num >= 1000) {
        return (num / 1000).toFixed(1).replace(/\.0$/, '') + 'K';
    }
    return num;
}


//var options = {
//    chart: {
//        height: 140,
//        type: "radialBar",
//        width: 140
//    },

//    series: [67],
//    colors: ["#43D1B7"],
//    plotOptions: {
//        radialBar: {
//            hollow: {
//                margin: 20,
//                size: "60%",
//                background: "#B7B7B7"
//            },
//            track: {
//                background: '#D2D4D4',
//            },
//            dataLabels: {
//                name: {
//                    show: false,
//                },
//                value: {
//                    color: "#fff",
//                    fontSize: "12px",
//                    show: true,
//                    offsetY: 5
//                }
//            }
//        }
//    },
//    fill: {
//        type: "gradient",
//        gradient: {
//            shade: "dark",
//            type: "vertical",
//            gradientToColors: ["#43D1B7"],
//            stops: [0, 100]
//        }
//    },
//    stroke: {
//        lineCap: "straight"
//    }
//};

//var chart = new ApexCharts(document.querySelector("#NoofProj"), options);
//chart.render();
////====================================================================================

//var options = {
//    chart: {
//        height: 140,
//        type: "radialBar",
//        width: 140
//    },

//    series: [67],
//    colors: ["#68D1F3"],
//    plotOptions: {
//        radialBar: {
//            hollow: {
//                margin: 20,
//                size: "60%",
//                background: "#B7B7B7"
//            },
//            track: {
//                background: '#D2D4D4',
//            },
//            dataLabels: {
//                name: {
//                    show: false,
//                },
//                value: {
//                    color: "#fff",
//                    fontSize: "12px",
//                    show: true,
//                    offsetY: 5
//                }
//            }
//        }
//    },
//    fill: {
//        type: "gradient",
//        gradient: {
//            shade: "dark",
//            type: "vertical",
//            gradientToColors: ["#68D1F3"],
//            stops: [0, 100]
//        }
//    },
//    stroke: {
//        lineCap: "straight"
//    }
//};

//var chart = new ApexCharts(document.querySelector("#ProjInfo"), options);
//chart.render();
////==================================================================================

//var options = {
//    chart: {
//        height: 140,
//        type: "radialBar",
//        width: 140
//    },

//    series: [67],
//    colors: ["#FF9518"],
//    plotOptions: {
//        radialBar: {
//            hollow: {
//                margin: 20,
//                size: "60%",
//                background: "#B7B7B7"
//            },
//            track: {
//                background: '#D2D4D4',
//            },
//            dataLabels: {
//                name: {
//                    show: false,
//                },
//                value: {
//                    color: "#fff",
//                    fontSize: "12px",
//                    show: true,
//                    offsetY: 5
//                }
//            }
//        }
//    },
//    fill: {
//        type: "gradient",
//        gradient: {
//            shade: "dark",
//            type: "vertical",
//            gradientToColors: ["#FF9518"],
//            stops: [0, 100]
//        }
//    },
//    stroke: {
//        lineCap: "straight"
//    }
//};

//var chart = new ApexCharts(document.querySelector("#BOQ"), options);
//chart.render();
////==================================================================================

//var options = {
//    chart: {
//        height: 140,
//        type: "radialBar",
//        width: 140
//    },

//    series: [67],
//    colors: ["#A24AD8"],
//    plotOptions: {
//        radialBar: {
//            hollow: {
//                margin: 20,
//                size: "60%",
//                background: "#B7B7B7"
//            },
//            track: {
//                background: '#D2D4D4',
//            },
//            dataLabels: {
//                name: {
//                    show: false,
//                },
//                value: {
//                    color: "#fff",
//                    fontSize: "12px",
//                    show: true,
//                    offsetY: 5
//                }
//            }
//        }
//    },
//    fill: {
//        type: "gradient",
//        gradient: {
//            shade: "dark",
//            type: "vertical",
//            gradientToColors: ["#A24AD8"],
//            stops: [0, 100]
//        }
//    },
//    stroke: {
//        lineCap: "straight"
//    }
//};

//var chart = new ApexCharts(document.querySelector("#QuotSupply"), options);
//chart.render();
////==================================================================================
//var options = {
//    chart: {
//        height: 140,
//        type: "radialBar",
//        width: 140
//    },

//    series: [67],
//    colors: ["#EC1A25"],
//    plotOptions: {
//        radialBar: {
//            hollow: {
//                margin: 20,
//                size: "60%",
//                background: "#B7B7B7"
//            },
//            track: {
//                background: '#D2D4D4',
//            },
//            dataLabels: {
//                name: {
//                    show: false,
//                },
//                value: {
//                    color: "#fff",
//                    fontSize: "12px",
//                    show: true,
//                    offsetY: 5
//                }
//            }
//        }
//    },
//    fill: {
//        type: "gradient",
//        gradient: {
//            shade: "dark",
//            type: "vertical",
//            gradientToColors: ["#EC1A25"],
//            stops: [0, 100]
//        }
//    },
//    stroke: {
//        lineCap: "straight"
//    }
//};

//var chart = new ApexCharts(document.querySelector("#QuotSupplynInstall"), options);
//chart.render();
//================================================================================

function initiateProductGraph(listProduct, listProductValue) {
    var options = {
        series: [{
            name: 'Net Profit',
            data: listProductValue
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
            categories: listProduct
        },
        yaxis: {
            title: {
                text: 'AED (thousands)'
            }
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

    ProductWiseChart = new ApexCharts(document.querySelector("#ProductWise"), options);
    ProductWiseChart.render();
}


var pluginName = "multiSelect",
    defaults = {
        'noneText': '-- Select --',
    };