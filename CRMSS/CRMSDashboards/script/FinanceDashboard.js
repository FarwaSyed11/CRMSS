var selTerritory, selCompany, selManager =  '';
var lgGrowthSO, lgGrowthInv, lgGrowthCO = [];
var listvalgrowthSO, listvalgrowthINV, listvalgrowthCO = [];

var listCompanyID = '';
var lgCompSO, lgCompInv, lgCompCO = [];
var listvalCompSOTY, listvalCompINVTY, listvalCompCOTY = [];
var listvalCompSOLY, listvalCompINVLY, listvalCompCOLY = [];

var listytdSO, listytdINV, listytdCO, listytdPERC = [];
var ytdSOpercVal, ytdINVpercVal, ytdCOpercVal = 0;

var listallPERCnTARG = [];

var SOOverallVal, INVOverallVal, COOverallVal = 0;
var SOPercVal, INVPercVal, COPercVal = [];

//var chart1SOperc = '';

var chart1SOperc = [], chart2InvcPerc = [], chart3CollectPerc = [];
var sgSalesOrderchart = [], sgInvoicechart1 = [], sgCollectionchart2 = [];
var cpSalesOrderchart = [], cpInvoicechart = [], cpCollectionchart = [];
var salesorderrange = [], invoicerange = [], collectionrange = [];

$(document).ready(function () {
    LoadYearddl();
    loadEmpDetails();
    loadEmpImage();
    LoadTerritory();
    LoadCompany(selTerritory, currUserId);
    LoadManager(selTerritory, getCompniesFromDDL(), currUserId);
    LoadSalesman(selTerritory, getCompniesFromDDL(), selManager, currUserId);
    LoadGrowthColInvSO();
    LoadComparisionColInvSO();
    loadYeartoDate();
    loadTargetPercAch();
    loadFinanceAging();
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
        url: "FinanceDashboard.aspx/ddlManagerFilter",
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
    listCompanyID = listCompanyID;
    $.ajax({
        url: "FinanceDashboard.aspx/ddlSalesmanFilter",
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
function LoadGrowthColInvSO() {
    $.ajax({
        url: "FinanceDashboard.aspx/LoadGrowthColInvSO",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman, "Year": $("#yearFilter option:selected").val() }),
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
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman, "Year": $("#yearFilter option:selected").val() }),
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
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman, "Year": $("#yearFilter option:selected").val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            listytdSO = result.d.listSOytd;
            listytdINV = result.d.listInvytd;
            listytdCO = result.d.listCOytd;
            listytdPERC = result.d.allPercentage;

            $.each(listytdSO, function (key, item) {
                $("#valTotEntered").html(nFormatter(parseInt(item.TotEntered)));
                $("#valTotBooked").html(nFormatter(parseInt(item.TotBooked)));
                $("#valTotClosed").html(nFormatter(parseInt(item.TotClosed)));
                $("#valSOYTD").html(nFormatter(parseInt(item.TotSOAmount)));
                $("#valInvAmount").html(nFormatter(parseInt(item.InvoiceAmount)));
                $("#valPendingInv").html(nFormatter(parseInt(item.PendingInv)));
            });
            $.each(listytdINV, function (key, item) {
                $("#valCollected").html(nFormatter(parseInt(item.Collected)));
                $("#valNotCollected").html(nFormatter(parseInt(item.NotCollected)));
                $("#valPendingDue").html(nFormatter(parseInt(item.PendingDue)));
                $("#valPendingNotDue").html(nFormatter(parseInt(item.PendingNotDue)));
                $("#valInvoiceYTD").html(nFormatter(parseInt(item.TotInvAmount)));
            });
            $.each(listytdCO, function (key, item) {
                $("#valCleared").html(nFormatter(parseInt(item.Cleared)));
                $("#valRemitted").html(nFormatter(parseInt(item.Remitted)));
                $("#valMatured").html(nFormatter(parseInt(item.Matured)));
                $("#valNotMatured").html(nFormatter(parseInt(item.NotMatured)));
                $("#valCOYTD").html(nFormatter(parseInt(item.TotCOlValue)));
                
            });

            ytdSOpercVal, ytdINVpercVal, ytdCOpercVal = [];
            $.each(listytdPERC, function (key, item) {
                
                if (item.Name == 'SO') {
                    $("#valSOThisYear").html(nFormatter(parseInt(item.ThisYear)));
                    $("#valSOLastYear").html(nFormatter(parseInt(item.LastYear)));
                    ytdSOpercVal = parseInt(item.Percentage);
                }
                if (item.Name == 'Invoice') {
                    $("#valINVThisYear").html(nFormatter(parseInt(item.ThisYear)));
                    $("#valINVLastYear").html(nFormatter(parseInt(item.LastYear)));
                    ytdINVpercVal = parseInt(item.Percentage);
                }
                if (item.Name == "Collection") {
                    $("#valCOThisYear").html(nFormatter(parseInt(item.ThisYear)));
                    $("#valCOLastYear").html(nFormatter(parseInt(item.LastYear)));
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
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman, "Year": $("#yearFilter option:selected").val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        //async: false,
        success: function (result) {

            listallPERCnTARG = result.d.allPercentageTarget;
            SOPercVal, INVPercVal, COPercVal = [];
            $.each(listallPERCnTARG, function (key, item) {
                if (item.Name == "SO") {
                    SOPercVal = parseInt(item.Percentage);
                    $("#valSOAchievement").html(nFormatter(parseInt(item.Achiement)));
                    $("#valSOTarget").html(nFormatter(parseInt(item.Target)));
                    $("#valOverallSO").html(nFormatter(parseInt(item.Overall)));
                }
                if (item.Name == "INV") {
                    INVPercVal = parseInt(item.Percentage);
                    $("#valINVAchievement").html(nFormatter(parseInt(item.Achiement)));
                    $("#valINVTarget").html(nFormatter(parseInt(item.Target)));
                    $("#valOverallINV").html(item.Overall);
                }
                if (item.Name == "COL") {
                    COPercVal = parseInt(item.Percentage);
                    $("#valCOAchievement").html(nFormatter(parseInt(item.Achiement)));
                    $("#valCOTarget").html(nFormatter(parseInt(item.Target)));
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

function loadFinanceAging() {

    $.ajax({
        url: "FinanceDashboard.aspx/loadFinanceAging",
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


function initiateAllOverallPie(SOPercVal, INVPercVal, COOverallVal) {
    var options1 = {
        chart: {
            height: 200,
            type: "radialBar",
        },

        series: [SOPercVal],
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

    chart1SOperc = new ApexCharts(document.querySelector("#SOperc"), options1);
    chart1SOperc.render();

    var options2 = {
        chart: {
            height: 200,
            type: "radialBar",
        },

        series: [INVPercVal],
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
    chart2InvcPerc = new ApexCharts(document.querySelector("#InvcPerc"), options2);
    chart2InvcPerc.render();

    var options3 = {
        chart: {
            height: 200,
            type: "radialBar",
        },

        series: [COOverallVal],
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
    chart3CollectPerc = new ApexCharts(document.querySelector("#CollectPerc"), options3);
    chart3CollectPerc.render();

}

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

    sgSalesOrderchart = new ApexCharts(document.querySelector("#sg-SalesOrder"), options);
    sgSalesOrderchart.render();

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

    sgInvoicechart1 = new ApexCharts(document.querySelector("#sg-Invoice"), options1);
    sgInvoicechart1.render();

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

    sgCollectionchart2 = new ApexCharts(document.querySelector("#sg-Collection"), options2);
    sgCollectionchart2.render();
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
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
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

    cpSalesOrderchart = new ApexCharts(document.querySelector("#cp-SalesOrder"), options);
    cpSalesOrderchart.render();

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
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
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

    cpInvoicechart = new ApexCharts(document.querySelector("#cp-Invoice"), options);
    cpInvoicechart.render();

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
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
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

    cpCollectionchart = new ApexCharts(document.querySelector("#cp-Collection"), options);
    cpCollectionchart.render();

}

function initiateYTDPercRange(ytdSOpercVal, ytdINVpercVal, ytdCOpercVal) {
    var options1 = {
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

    salesorderrange = new ApexCharts(document.querySelector("#salesorderrange"), options1);
    salesorderrange.render();

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

    invoicerange = new ApexCharts(document.querySelector("#invoicerange"), options2);
    invoicerange.render();

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

    collectionrange = new ApexCharts(document.querySelector("#collectionrange"), options3);
    collectionrange.render();
}

$('#btngoFilter').on('click', function () {
    selTerritory = $('#territoryFilter option:selected').val();
    selCompany = $('#companyFilter option:selected').val();
    selManager = $('#managerFilter option:selected').val();
    selSalesman = $('#salesmanFilter option:selected').val();

    chart1SOperc.destroy();
    chart3CollectPerc.destroy();
    invoicerange.destroy();
    chart2InvcPerc.destroy();
    cpSalesOrderchart.destroy();
    sgSalesOrderchart.destroy();
    sgInvoicechart1.destroy();
    collectionrange.destroy();
    cpInvoicechart.destroy();
    sgCollectionchart2.destroy();
    cpCollectionchart.destroy();
    salesorderrange.destroy();

    LoadGrowthColInvSO();
    LoadComparisionColInvSO();
    loadYeartoDate();
    loadTargetPercAch();
});