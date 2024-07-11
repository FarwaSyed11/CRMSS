
var selTerritory, selCompany, selManager, selSalesman = '';
var listCompanyID = '';
var listAllValuenPerc = [];

var LPOperc = 0, LOIperc = 0, Contractperc = 0;

var listFinalisedProdGraph = [], listAllProducts= [], listAllFinalisedValues = [];

var objDatatableProjList = [], listTableProjLOI = [];

var chartFinalisedperc = [], chartLPOperc = [], chartContractperc = [], chartFinalisedProduct = [];

var listAgingFinalised = [];

$(document).ready(function () {

    LoadTerritory();
    LoadCompany(selTerritory, currUserId);
    LoadManager(selTerritory, getCompniesFromDDL(), currUserId);
    LoadSalesman(selTerritory, getCompniesFromDDL(), selManager, currUserId);
    LoadLPOLOIContract();
    LoadFinalisedProduct();
    LoadProjList();
    loadFinalisedAging();

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
    chartFinalisedperc.destroy();
    chartLPOperc.destroy();
    chartContractperc.destroy();
    chartFinalisedProduct.destroy();
    LoadLPOLOIContract();
    LoadFinalisedProduct();
    LoadProjList();
    loadFinalisedAging();
});

function LoadTerritory() {
    $.ajax({
        url: "FinalisedDashbaord.aspx/ddlTerritoryFilter",
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
        url: "FinalisedDashbaord.aspx/ddlCompanyFilter",
        data: JSON.stringify({ "UserId": currUserId, "Territory": selTerritory }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var content = '';//<option value="-1" selected> ALL</option>
            listDDL = result.d;
            $.each(listDDL, function (key, item) {
                //content += item.company == 'Local Sales' ? '<option value="' + item.company + '" selected>' + item.company + '</option>' : '<option value="' + item.company + '" >' + item.company + '</option>';
                content += '<option value="' + item.company + '" selected>' + item.company + '</option>';
            });
            $('#ddlCompany').html(content);
            //$('#ddlCompany option[value="Local Sales"]').prop('selected', true);
            selCompany = getCompniesFromDDL();
            //selCompany = $('#ddlCompany option:selected').val();
            //listCompanyID = getCompniesFromDDL();
            $('#ddlCompany').multipleSelect({
                onClick: function (view) {
                    $('.ms-parent').css('box-shadow', 'none');
                    listCompanyID = getCompniesFromDDL();
                    selTerritory = $('#territoryFilter option:selected').val();
                    //selCompany = $('#companyFilter option:selected').val();
                    LoadManager(selTerritory, listCompanyID, currUserId);
                },
                selectAll: { 'checked': true},
                onCheckAll: function () {
                    $('.ms-parent').css('box-shadow', 'none');
                    LoadManager(selTerritory, selCompany, currUserId);
                },
                onUncheckAll: function () {
                    if ($('#ddlCompany').val() == "") {
                        toastr.error('Please select any company.', '');
                        $('.ms-parent').css('animation', 'blink-animation 1s steps(5, start) infinite');
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
    for (var i = 0; i < $('#ddlCompany option:selected').length; i++) {
        compnies += $('#ddlCompany option:selected')[i].text.trim() + ',';
    }
    return compnies.substring(0, compnies.lastIndexOf(","));
}

function LoadManager(selTerritory, listCompanyID, currUserId) {
    listCompanyID = listCompanyID;
    $.ajax({
        url: "FinalisedDashbaord.aspx/ddlManagerFilter",
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
        url: "FinalisedDashbaord.aspx/ddlSalesmanFilter",
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

function LoadLPOLOIContract() {
    $.ajax({
        url: "FinalisedDashbaord.aspx/LoadLPOLOIContract",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            listAllValuenPerc = result.d.listLPOLOIContractPercnValue;

            LPOperc, LOIperc, Contractperc = 0;

            $.each(listAllValuenPerc, function (key, item) {
                LPOperc = parseInt(item.LPOPerc);
            });

            $.each(listAllValuenPerc, function (key, item) {
                LOIperc = parseInt(item.LOIPerc)
            });

            $.each(listAllValuenPerc, function (key, item) {
                Contractperc = parseInt(item.ContractPerc)
            });

            initiateLOIContractLPOperc(LPOperc, LOIperc, Contractperc)

            $.each(listAllValuenPerc, function (key, item) {
                $("#valTotUnderrisk").html(nFormatter(parseInt(item.UnderriskValue)));
                $("#valTotOnTrack").html(nFormatter(parseInt(item.OntrackValue)));
                $("#valTotSecure").html(nFormatter(parseInt(item.SecuredValue)));
                $("#valTotLOI").html(nFormatter(parseInt(item.LOIValue)));
            });
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function LoadProjList() {

    $.ajax({
        url: "FinalisedDashbaord.aspx/LoadProjList",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            var htm = '';
            listTableProjLOI = result.d.listLOIProjects;
            $('.ProjLOI-tbody td').length > 0 ? objDatatableProjList.destroy() : '';
            $.each(listTableProjLOI, function (key, item) {//nFormatter(parseInt(item.Value))                                                                           '999.5K'.substring('999.5K'.length-1, '999.5K'.length); //<span>' + (nFormatter(parseInt(item.Value))).substring(nFormatter(item.Value).length - 1, nFormatter(item.Value).length) + '</span>
                htm += '<tr><td>' + item.Customer + '</td><td>' + item.OptName + '</td><td>' + item.Product + '</td><td><span style="display:none">' + parseFloat(item.Value) + '</span> ' + nFormatter(parseInt(item.Value)) + ' </td> </tr>'
                //htm += '<td><span> ' + (nFormatter(parseInt(item.Value))).substring(nFormatter(item.Value).length - 1, nFormatter(item.Value).length) + '</span> </td></tr>'
            });
            $('.ProjLOI-tbody').html(htm);
            initiateProjListDataTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateProjListDataTable() {                                                                                                                                                                                                                                                                                                                       
    //$('#ProjLOI-tbody td').length > 0 ? objDatatableProjList.destroy() : '';
    objDatatableProjList = [];
    objDatatableProjList = $('#ProjLOI-table').DataTable({
        dom: 'lBfrtip',
        "bStateSave": true,
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa-solid fa-file-excel" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "order": [[3, 'desc']],
        "columnDefs": [
            { orderable: true, "targets": [] },
            { type: 'num-fmt', targets: 3 }
        ],
        "columns": [null, null, null, { type: 'num-fmt' }]
        
    });

}


function loadFinalisedAging() {

    $.ajax({
        url: "FinalisedDashbaord.aspx/loadFinalisedAging",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $.each(result, function (key, item) {
                $("#divoneTofive").html(nFormatter(parseInt(result.d[0].Five)));
                $("#divdixToten").html(nFormatter(parseInt(result.d[0].Ten)));
                $("#divlevenToFifteen").html(nFormatter(parseInt(result.d[0].Fifteen)));
                $("#divsixteenToTwenty").html(nFormatter(parseInt(result.d[0].Twenty)));
                $("#divtwentyToTwefive").html(nFormatter(parseInt(result.d[0].MorethanTwentyfive)));
            });
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function LoadFinalisedProduct() {

    $.ajax({
        url: "FinalisedDashbaord.aspx/LoadFinalisedProduct",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            listFinalisedProdGraph = result.d.listProdnValue;
            listAllProducts = [];
            $.each(listFinalisedProdGraph, function (key, item) {
                listAllProducts.push(item.ItemType);
            });
            listAllFinalisedValues = [];
            $.each(listFinalisedProdGraph, function (key, item) {
                listAllFinalisedValues.push(parseInt(item.Value))
            });

            initiateFinalisedProdGraph(listAllProducts, listAllFinalisedValues)

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateFinalisedProdGraph(listAllProducts, listAllFinalisedValues) {
    var options = {
        series: [{
            data: listAllFinalisedValues
        }],
        chart: {
            type: 'bar',
            height: 500
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
            enabled: true,
            formatter: function (val, opts) {
                return numberWithCommas(val)
            },
            style: {
                fontSize: '14px',
                fontFamily: 'Helvetica, Arial, sans-serif',
                fontWeight: 'bold',
                colors: undefined
            },
            background: {
                enabled: true,
                foreColor: '#fff',
                padding: 5,
                borderRadius: 2,
                borderWidth: 1,
                borderColor: '#fff',
                opacity: 0.9,
            }
        },
        xaxis: {
            categories: listAllProducts,
            labels: {
                formatter: function (value) {
                    return nFormatter(value) + " ";
                }
            },
        },
        tooltip: {
            x: [
                {
                    title: {
                        formatter: function (val) {
                            return numberWithCommas(val)
                        }
                    }
                },
            ]
        }
    };

    chartFinalisedProduct = new ApexCharts(document.querySelector("#FinalisedProduct"), options);
    chartFinalisedProduct.render();
}
function initiateLOIContractLPOperc(LPOperc, LOIperc, Contractperc) {
    var options1 = {
        chart: {
            height: 200,
            type: "radialBar",
        },

        series: [LOIperc],
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

    chartFinalisedperc = new ApexCharts(document.querySelector("#Finalisedperc"), options1);

    chartFinalisedperc.render();

    var options2 = {
        chart: {
            height: 200,
            type: "radialBar",
        },

        series: [LPOperc],
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

    chartLPOperc = new ApexCharts(document.querySelector("#LPOperc"), options2);

    chartLPOperc.render();

    var options3 = {
        chart: {
            height: 200,
            type: "radialBar",
        },

        series: [Contractperc],
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

    chartContractperc = new ApexCharts(document.querySelector("#Contractperc"), options3);
    chartContractperc.render();

}
function numberWithCommas(number) {
    var parts = number.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts.join(".");
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