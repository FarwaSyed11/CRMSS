
var selTerritory, selCompany, selManager, selSalesman = '';
var listCompanyID = '';

var listAllValueforTopRow = [];

var listCustomerBehaviortable = [];

var objDatatable = [];

var listBigPotentialPerc = [], listJOHPerc = [], listTenderPerc = [];

var chartBigPotential = [], chartJOHPotential = [], chartTenderPotential = [];
var chartTotPerc = [];

var listCustomerAssignedChart = [];
var listMonths = [], listAssVal = [];

var chartAssignedCustomer = [];

var listTopCustomers = [];
$(document).ready(function () {

    LoadTerritory();
    //getCompniesFromDDL();
    LoadCompany(selTerritory, currUserId);
    LoadManager(selTerritory, getCompniesFromDDL(), currUserId);
    LoadSalesman(selTerritory, getCompniesFromDDL(), selManager, currUserId);
    TopRowValuesnCount();
    CustomerBehaviorTable();
    NewAssignedCustomerChart();
    TopCustomeronJOH();
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
    chartBigPotential.destroy();
    chartJOHPotential.destroy();
    chartTenderPotential.destroy();
    chartAssignedCustomer.destroy();
    TopRowValuesnCount();
    CustomerBehaviorTable();
    NewAssignedCustomerChart();
    TopCustomeronJOH();
});


function LoadTerritory() {
    $.ajax({
        url: "CustomerDashboard.aspx/ddlTerritoryFilter",
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
        url: "CustomerDashboard.aspx/ddlCompanyFilter",
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
            //$('#ddlCompany option[value="Local Sales"]').prop('selected', true);
            selCompany = getCompniesFromDDL();
            //selCompany = $('#ddlCompany option:selected').val();
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
        url: "CustomerDashboard.aspx/ddlManagerFilter",
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
        url: "CustomerDashboard.aspx/ddlSalesmanFilter",
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


function TopRowValuesnCount() {
    $.ajax({
        url: "CustomerDashboard.aspx/TopRowValuesnCount",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            listAllValueforTopRow = result.d.listAllCountnValue;

            $.each(listAllValueforTopRow, function (key, item) {
                $("#valTotCust").html(item.TotalCustomer);
                $("#valBigPotential").html(item.BigPotential);
                $("#valJOHPotential").html(item.JOHPotential);
                $("#valTenderPotential").html(item.TenderPotential);
                $("#valNeverVisited").html(item.NeverVisisted);
                $("#valNotVisited").html(item.NotVisisted);
                $("#valPotVisited").html(item.Visisted);
            });
            listBigPotentialPerc = [], listJOHPerc = [], listTenderPerc = [];
            //percNeverVisited = 0, percVisited = 0, percNotVisted = 0;
            $.each(listAllValueforTopRow, function (key, item) {
                listBigPotentialPerc.push(parseInt(item.BNeverVisistedPerc));
                listBigPotentialPerc.push(parseInt(item.BNotVisistedPerc));
                listBigPotentialPerc.push(parseInt(item.BVisistedPerc));
            });
            $.each(listAllValueforTopRow, function (key, item) {
                listJOHPerc.push(parseInt(item.JNeverVisistedPerc));
                listJOHPerc.push(parseInt(item.JNotVisistedPerc));
                listJOHPerc.push(parseInt(item.JVisistedPerc));
            }); $.each(listAllValueforTopRow, function (key, item) {
                listTenderPerc.push(parseInt(item.TNeverVisistedPerc));
                listTenderPerc.push(parseInt(item.TNotVisistedPerc));
                listTenderPerc.push(parseInt(item.TVisistedPerc));
            });

            inititateTypePotentialCharts(listBigPotentialPerc, listJOHPerc, listTenderPerc);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function CustomerBehaviorTable() {
    $.ajax({
        url: "CustomerDashboard.aspx/CustomerBehaviorTable",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            listCustomerBehaviortable = result.d.listTableContent;
            $('.tbody-customerbehaviour td').length > 0 ? objDatatable.destroy() : '';
            //chartTotPerc.destroy();
            var percTotWon = 0;
            $.each(listCustomerBehaviortable, function (key, item) {
               // percTotWon = parseInt(item.PRC);
                //initiatetableOverallPerc(percTotWon, 'pieChart-' + key)
                htm += '<tr><td>' + item.MEPContractor + '</td><td>' + item.ProductType + '</td><td style="width:50px"><i style="display:none">' + parseInt(item.WONVALUE) + '</i><div class="won">' + nFormatter(parseInt(item.WONVALUE)) + '</div></td><td style="width:50px"><span style="display:none">' + parseInt(item.LOSTVALUE) + '</span><span class="loss">' + nFormatter(parseInt(item.LOSTVALUE)) + '</span></td><td id="pieChart-' + key + '">' + parseInt(item.PRC) + '</td><td><span style="display:none">' + item.OVERALLVALUE + '</span>' + nFormatter(parseInt(item.OVERALLVALUE)) + '</td><td>' + item.CompetitorName + '</td></tr >'
            });
            $('.tbody-customerbehaviour').html(htm);

            //$.each(listCustomerBehaviortable, function (key, item) {
            //    percTotWon = parseInt(item.PRC);
            //    initiatetableOverallPerc(percTotWon, 'pieChart-' + key)
            //    if (key == 10) { return false; }
            //});


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    initiateCustomerDataTable();
}


function initiateCustomerDataTable() {
    objDatatable = [];
    objDatatable = $('.table-customerbehaviour').DataTable({
        dom: 'lBfrtip',
        "bStateSave": true,
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa-solid fa-file-excel" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "orderable": true, "targets": [] }
        ]
    });

}

function NewAssignedCustomerChart() {
    $.ajax({
        url: "CustomerDashboard.aspx/NewAssignedCustomerChart",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            
            listCustomerAssignedChart = result.d.AssignedValues;
            listMonths = [], listAssVal = [];
            $.each(listCustomerAssignedChart, function (key, item) {
                listMonths.push(parseInt(item.Month));
            });
            $.each(listCustomerAssignedChart, function (key, item) {
                listAssVal.push(parseInt(item.AssignedVal));
            }); 

            initiateAssignedCustomer(listAssVal, listMonths);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function TopCustomeronJOH() {
    $.ajax({
        url: "CustomerDashboard.aspx/TopCustomeronJOH",
        data: JSON.stringify({ "Company": selCompany, "ManagerID": selManager, "SalesmanID": selSalesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            listTopCustomers = result.d.TopCustomerDetails;
            $.each(listTopCustomers, function (key, item) {
                htm += '<div class="d-flex justify-content-between border-bottom p-3 m-2 align-items-center"><div class="d-flex"><div><div class="">' + item.MEPContractor +'</div><div class="d-flex text-muted" style="font-size: 10px"><span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">' + item.JOHCount +'</span><span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">' + nFormatter(parseInt(item.JOHValue)) + '</span></div></div></div><div class="text-danger fs-4">' + item.PERC + '%</div></div>'
            });
            $(".topcustomers").html(htm);
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

function inititateTypePotentialCharts(listBigPotentialPerc, listJOHPerc, listTenderPerc) {


    var options = {
        series: listBigPotentialPerc,
        chart: {
            width: 290,
            type: 'pie',
            offsetY: 20,
            offsetX: -90,
            options: {
                chart: {
                    width: 100
                },
            },
        },
        legend: {
            position: 'top',
            horizontalAlign: 'left',
            offsetX: 60,
            offsetY: 0
        },
        labels: ['Never Visited', 'Visited', 'Not Visited'],
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 100
                },
                legend: {
                    position: 'top',
                    horizontalAlign: 'left',
                }
            }
        }]
    };

    chartBigPotential = new ApexCharts(document.querySelector("#chartBigPotential"), options);
    chartBigPotential.render();

    var options = {
        series: listJOHPerc,
        chart: {
            width: 200,
            type: 'pie',
            offsetX: -40,
            offsetY: 90,
        },
        legend: {
            show: false
        },
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 200
                },
            }
        }]
    };

    chartJOHPotential = new ApexCharts(document.querySelector("#chartJOHPotential"), options);
    chartJOHPotential.render();

    var options = {
        series: listTenderPerc,
        chart: {
            width: 200,
            type: 'pie',
            offsetX: -40,
            offsetY: 90,
        },
        legend: {
            show: false
        },
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 200
                },
            }
        }]
    };

    chartTenderPotential = new ApexCharts(document.querySelector("#chartTenderPotential"), options);
    chartTenderPotential.render();

}

function initiatetableOverallPerc(percTotWon,id) {
    var options = {
        chart: {
            height: 90,
            type: "radialBar",
            width: 100
        },

        series: [percTotWon],
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
    let pieId = '#' + id;
    chartTotPerc = new ApexCharts(document.querySelector(pieId), options);
    chartTotPerc.render();
}

function initiateAssignedCustomer(listAssVal, listMonths) {
    var options = {
        series: [{
            name: "Customer",
            data: listAssVal
        }],
        chart: {
            height: 300,
            type: 'line',
            zoom: {
                enabled: false
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            curve: 'smooth'
        },
        grid: {
            row: {
                colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
                opacity: 0.5
            },
        },
        xaxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        }
    };

    chartAssignedCustomer = new ApexCharts(document.querySelector("#AssignedCustomer"), options);
    chartAssignedCustomer.render();
}
