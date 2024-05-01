


let cardColor, headingColor, axisColor, shadeColor, borderColor;

cardColor = config.colors.white;
headingColor = config.colors.headingColor;
axisColor = config.colors.axisColor;
borderColor = config.colors.borderColor;

var daysInCurrentMonth;
var totalRevenueChart = [];
//const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec","sdg", "c\acbvhj", "davhdja"];
var monthNames = [];
var effiChartArray = [];
var cMonth = 0;
var cYear = 0;

var growthChart;
var arrOverallEff = 0;
var loggedInUserName = '';
var employeesList = [], lManagerList = [];
var selUserId = '';
var eventArrForFullCal = [];
var oFullCalendar;

$(document).ready(function () {
    fillYearDropdown();
    loadManangers();
    loadEmployees();

    //let cMonth = new Date().getMonth() + 1;
    //let cYear = new Date().getFullYear();

    //daysInCurrentMonth = getDaysInMonth(cYear, cMonth);
    //for (var i = 1; i <= daysInCurrentMonth; i++) {
    //    monthNames.push(i);
    //}
    $('#DDLMonth').val(new Date().getMonth() + 1);
    getDaysInMonth();
    $('.kpi-year-table tr').on('click', function () {

        console.log(this);
    });

    getAllFuncOfDashboard();

});

$('#btnSearchDashBoard').click(function () {

    totalRevenueChart.destroy();
    growthChart.destroy();
    oFullCalendar.destroy();

    getDaysInMonth();
    getAllFuncOfDashboard();
});



function getAllFuncOfDashboard() {

    $('.lblCurrentDate').html($('#DDLMonth option:selected').text().toUpperCase());

    if ($('#DDLEmployees option:selected').val() == 'NO EMPLOYEE AVAILABLE' || $('#DDLEmployees option:selected').val() =='FILTER NOT INCLUDE') {
        EmpNo = $('#DDLLineMan option:selected').val();
        selUserId = lManagerList.filter(s => s.EmpNo == EmpNo)[0].UserId;
    } else {
        EmpNo = $('#DDLEmployees option:selected').val();
        selUserId = employeesList.filter(s => s.EmpNo == EmpNo)[0].UserId;
    }
    //EmpNo = $('#DDLEmployees option:selected').val() == 'NO EMPLOYEE' ? $('#DDLEmployees option:selected').val() : $('#DDLEmployees option:selected').val();
    //selUserId = employeesList.filter(s => s.EmpNo == EmpNo).length == 0 ? '-1' : employeesList.filter(s => s.EmpNo == EmpNo)[0].UserId;
        
    loadEfficencyGraph(selUserId, cMonth, cYear);
    loadUserDetails(selUserId);
    getAllCount(selUserId, cMonth, cYear);
    getCurrentmonthTaskList(selUserId, cMonth, cYear);
    getCurrentmonthTaskListForOverview(selUserId, cMonth, cYear);
    getPreviousPendingTaskList(selUserId, cMonth, cYear);
    getFutureTaskList(selUserId, cMonth, cYear);

    // getCurrentDate();
    loadBarEfficencyChart();


    //EfficencyCalendar();
    loadOverAllEfficency(selUserId);
    growthchart();
}

//function getDaysInMonth(year, month) {
//    let cMonth = new Date().getMonth() + 1;
//    let cYear = new Date().getFullYear();

//     daysInCurrentMonth = getDaysInMonth(cYear, cMonth);
//    for (var i = 1; i <= daysInCurrentMonth; i++) {
//        monthNames.push(i);
//    }
//    return new Date(year, month, 0).getDate();
//}

function loadManangers() {
    $.ajax({
        url: "DashboardManager.aspx/GetEmployeesListByManager",
        data: JSON.stringify({ EmpNumber: EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            lManagerList = result.d;
            var opt = '';         
            var sortManList = sortManByName();

            //lManagerList.sort(function (a, b) {
            //    return (a).EName.toUpperCase().localeCompare((b).EName.toUpperCase());
            //})
            //$.each(lManagerList, function (idx, itm) { sortManList.push(itm) });

        
            $.each(sortManList, function (key, item) {
                opt += '<option value="' + item.EmpNo + '" >' + item.EName + '</option>';
            });
            $('#DDLLineMan').html(opt);

            if (lManagerList.filter(s => s.IsManager != '').length > 0) {
                EmpNo = $('#DDLLineMan option:selected').val();
                selUserId = lManagerList.filter(s => s.EmpNo == EmpNo)[0].UserId;
                //$('.ddlLineManagerDiv').addClass('hidden');
            } else {
                $('.ddlLineManagerDiv').addClass('hidden');
            }
            


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadEmployees() {

    $.ajax({
        url: "DashboardManager.aspx/GetEmployeesListByManager",
        data: JSON.stringify({ EmpNumber: EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            employeesList = result.d;
            var opt = $('.ddlLineManagerDiv').hasClass('hidden') ? '' : '<option>NO EMPLOYEE AVAILABLE</option >';
           if (employeesList.length > 0) {
               opt = $('.ddlLineManagerDiv').hasClass('hidden') ? '' : '<option style="text-align:center;">FILTER NOT INCLUDE</option >';
                var dptid = employeesList[0].DeptId;
                //opt = '<option value="0" selected>ALL</option>'
                $.each(result.d, function (key, item) {
                    if (key == 0) {
                        opt += '<optgroup label="' + item.DeptName + '">';
                    }
                    else if (dptid != item.DeptId) {
                        dptid = item.DeptId;
                        opt += '</optgroup>';
                        opt += '<optgroup label="' + item.DeptName + '">';
                    }
                    if (key ==0) {
                        opt += '<option value="' + item.EmpNo + '" selected>' + item.EName + '</option>';
                    }
                    else {
                        opt += '<option value="' + item.EmpNo + '" >' + item.EName + '</option>';
            }
                    //opt += '<option value="' + item.EmpNo + '" >' + item.EName + '</option>';

                });
           } 

            $('#DDLEmployees').html(opt);
            //EmpNo = $('#DDLEmployees option:selected').val() == 'NO EMPLOYEE' ? '-1' : $('#DDLEmployees option:selected').val();
            //selUserId = employeesList.filter(s => s.EmpNo == EmpNo).length == 0 ? '-1' : employeesList.filter(s => s.EmpNo == EmpNo)[0].UserId ;

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$('#DDLLineMan').on('change', function () {
    EmpNo = $('#DDLLineMan option:selected').val();
    loadEmployees();

});


function fillYearDropdown() {

    var htm = '';
    for (var i = 0; i < 3; i++) {
        let year = new Date().getFullYear() - i;
        htm += '<option value="' + year + '">' + year + '</option>';
    }
    $('#DDLYear').html(htm);
}
function getDaysInMonth() {
    monthNames = [];
    cMonth = new Date($('#DDLMonth option:selected').val()).getMonth() + 1;
    cYear = new Date($('#DDLYear option:selected').val()).getFullYear();

    daysInCurrentMonth = new Date(cYear, cMonth, 0).getDate();
    for (var i = 1; i <= daysInCurrentMonth; i++) {
        monthNames.push(i);
    }

}





function getCurrentDate() {
    const date = new Date();

    //let now = new Date().toLocaleDateString('en-us', { weekday: "long", month: "long", day: "numeric" });
    let now = new Date().toLocaleDateString('en-us', { month: "long" });
    $("#lblCurrentDate").html('<span class="month-hedng">' + now + '</span>');

    //let day = date.getDate();
    //let month = date.getMonth();
    //let year = date.getFullYear();

    //$("#lblCurrentDate").html('<span class="month-hedng">'+ day + " " + month + " " + year + '</span>');
}

function loadBarEfficencyChart() {


    // Total Revenue Report Chart - Bar Chart
    // --------------------------------------------------------------------
    totalRevenueChartElcc = document.querySelector('#MonthlyEfficency'),
        totalRevenueChartOptions = {
            series: [
                {
                    name: 'Efficency', //'2021',
                    data: effiChartArray // [30, 50, 80, 85, 50, 100, 45, 90, 75, 60, 65, 45, 20, 86, 0, 50, 80, 85, 50, 100, 45, 90, 75, 60, 65, 45, 20, 86, 42,12], //profitArray
                }

            ],
            chart: {
                height: 300,
                stacked: true,
                type: 'bar',
                toolbar: { show: false },

            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '100%',
                    columnHeight: '50%',
                    borderRadius: 0,
                    startingShape: 'rounded',
                    endingShape: 'rounded'
                }
            },
            colors: ['#389afb'], //[profitBarColor, lossBarColor],
            dataLabels: {
                enabled: false,
                //formatter: function (val, opt) {
                //    return parseInt(val) + '%';
                //}
            },
            stroke: {
                curve: 'smooth',
                width: 6,
                lineCap: 'round',
                colors: [cardColor]
            },
            legend: {
                show: true,
                horizontalAlign: 'left',
                position: 'top',
                markers: {
                    height: 8,
                    width: 8,
                    radius: 12,
                    offsetX: -3
                },
                labels: {
                    colors: axisColor
                },
                itemMargin: {
                    horizontal: 10
                }
            },
            grid: {
                borderColor: borderColor,
                padding: {
                    top: 0,
                    bottom: -8,
                    left: 20,
                    right: 20
                }
            },
            xaxis: {
                categories: monthNames,// monthNames,//,MonthArrayGraph
                labels: {
                    style: {
                        fontSize: '13px',
                        colors: axisColor
                    }
                },
                axisTicks: {
                    show: false
                },
                axisBorder: {
                    show: false
                }
            },
            yaxis: {
                labels: {
                    style: {
                        fontSize: '13px',
                        colors: axisColor,
                    }
                }
            },
            responsive: [
                {
                    breakpoint: 1700,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '32%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1580,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '35%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1440,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '42%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1300,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '48%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1200,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '40%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1040,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 11,
                                columnWidth: '48%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 991,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '30%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 840,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '35%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 768,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '28%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 640,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '32%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 576,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '37%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 480,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '45%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 420,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '52%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 380,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 10,
                                columnWidth: '60%'
                            }
                        }
                    }
                }
            ],
            states: {
                hover: {
                    filter: {
                        type: 'none'
                    }
                },
                active: {
                    filter: {
                        type: 'none'
                    }
                }
            }
        };
    if (typeof totalRevenueChartElcc !== undefined && totalRevenueChartElcc !== null) {
        totalRevenueChart = new ApexCharts(totalRevenueChartElcc, totalRevenueChartOptions);
        totalRevenueChart.render();
    }


    // Bubble Chart



}


function growthchart() {
    const growthChartEl = document.querySelector('#growthChartOverAll'),
        growthChartOptions = {
            series: [arrOverallEff],
            labels: ['Growth'],
            chart: {
                height: 240,
                type: 'radialBar'
            },
            plotOptions: {
                radialBar: {
                    size: 150,
                    offsetY: 10,
                    startAngle: -150,
                    endAngle: 150,
                    hollow: {
                        size: '55%'
                    },
                    track: {
                        background: cardColor,
                        strokeWidth: '100%'
                    },
                    dataLabels: {
                        name: {
                            offsetY: 15,
                            color: headingColor,
                            fontSize: '15px',
                            fontWeight: '600',
                            fontFamily: 'Public Sans'
                        },
                        value: {
                            offsetY: -25,
                            color: headingColor,
                            fontSize: '22px',
                            fontWeight: '500',
                            fontFamily: 'Public Sans'
                        }
                    }
                }
            },
            colors: [getLightShade(arrOverallEff)],
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.5,
                    gradientToColors: [getDarkShade(arrOverallEff)],
                    inverseColors: true,
                    opacityFrom: 1,
                    opacityTo: 0.6,
                    stops: [30, 70, 100]
                }
            },
            stroke: {
                dashArray: 5
            },
            grid: {
                padding: {
                    top: -35,
                    bottom: -10
                }
            },
            states: {
                hover: {
                    filter: {
                        type: 'none'
                    }
                },
                active: {
                    filter: {
                        type: 'none'
                    }
                }
            }
        };
    if (typeof growthChartEl !== undefined && growthChartEl !== null) {
        growthChart = new ApexCharts(growthChartEl, growthChartOptions);
        growthChart.render();
    }
}


function getAllCount(uId, cMonth, cYear) {

    $.ajax({
        url: "DashboardManager.aspx/CurrentmonthCompletedTask",
        data: JSON.stringify({ "UserId": uId, "currentMonth": cMonth, "currentYear": cYear, "EmpNum": EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('.ov-secured-value').html(result.d.CompletedTask == null ? 0 : result.d.CompletedTask);
            $('.ov-underrisk-value').html(result.d.Transfered == null ? 0 : result.d.Transfered);
            $('.ov-lost-value').html(result.d.Pending == null ? 0 : result.d.Pending);
            $('.ov-secured-value').html(result.d.CompletedTask == null ? 0 : result.d.CompletedTask);

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}

$('.forecast-opp-tab ul li').on('click', function () {
    let navSelVal = $(this).find('button').text().trim();


    if (navSelVal == 'Current Task') {
        getCurrentmonthTaskList(uId);
    }
    //else if (navSelVal == 'Previous Forecast') {
    //    getPendingForcastedOpportunities(compId, managerId, salesmanId, uId, year, userStatus);
    //}
    //else if (navSelVal == 'Future Forecast') {
    //    getFutureForcastedOpportunities(compId, managerId, salesmanId, uId, year, userStatus);
    //}


});
//$('.overview-tab ul li').on('click', function () {
//        getCurrentmonthTaskListForOverview('');
//});


function getCurrentmonthTaskListForOverview(uID) {

    $.ajax({
        url: "DashboardManager.aspx/CurrentmonthTaskListForOverview",
        data: JSON.stringify({ "EmpNum": EmpNo, "currentMonth": cMonth, "currentYear": cYear }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var topOpp = '';
            $.each(result.d.filter(s => s.Status == 'COMPLETED'), function (key, item) {

                topOpp += `<li class="d-flex mb-4 pb-1">
                    <div class="avatar flex-shrink-0 me-3">
                   
                     <i class="bx bx-basketball listoprty" style="color:#6757ef"></i>


                    </div>
                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2" style="width:70%">
                           <span class="text-muted">Task Name : </span>
                                            
                                <a href="/CRMSS/Agenda/NewMyActivity.aspx?Date=`+ item.DueDate + `" class="mb-0">` + item.TaskName + `</a>
                       

                            <div  class="user-progress d-flex align-items-center gap-1">
                            <span class="text-muted">Due Date : </span>
                            <h6 class="mb-0">`+ item.DueDate + `</h6>
                            </div>

                        </div>
                    <div>

                    <div  class="user-progress d-flex align-items-center gap-1">
                            <h6 class="mb-0">`+ item.Status + `</h6>
                            <div>
                            
                     </div>
                    </div>
                </li>`;
            });
            //$('.forcasted-opportunity-ul').html(topOpp)
            result.d.filter(s => s.Status == 'COMPLETED').length > 0 ? $('.comp-task-ul').html(topOpp) : $('.comp-task-ul').html('<div style="text-align:center"><h3 >No Task(s)</h3> <img src="../Images/NO task todo.png"  style="width: 60%; "/> </div>');

            topOpp = '';
            $.each(result.d.filter(s => s.Status == 'TRANSFER'), function (key, item) {

                topOpp += `<li class="d-flex mb-4 pb-1">
                    <div class="avatar flex-shrink-0 me-3">
                   
                     <i class="bx bx-basketball listoprty" style="color:#6757ef"></i>


                    </div>
                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2" style="width:70%">
                           <span class="text-muted">Task Name : </span>
                                            
                                <a href="/CRMSS/Agenda/NewMyActivity.aspx?Date=`+ item.DueDate + `" class="mb-0">` + item.TaskName + `</a>
                       

                            <div  class="user-progress d-flex align-items-center gap-1">
                            <span class="text-muted">Due Date : </span>
                            <h6 class="mb-0">`+ item.DueDate + `</h6>
                            </div>

                        </div>
                    <div>

                    <div  class="user-progress d-flex align-items-center gap-1">
                            <h6 class="mb-0">`+ item.Status + `</h6>
                            <div>
                            
                     </div>
                    </div>
                </li>`;
            });
            result.d.filter(s => s.Status == 'TRANSFER').length > 0 ? $('.trans-task-ul').html(topOpp) : $('.trans-task-ul').html('<div style="text-align:center"><h3 >No Task(s)</h3> <img src="../Images/NO task todo.png"  style="width: 60%; "/> </div>');

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}

//--------------------------------------------------------

function getCurrentmonthTaskList(uID) {

    $.ajax({
        url: "DashboardManager.aspx/CurrentmonthTaskList",
        data: JSON.stringify({ "EmpNum": EmpNo, "currentMonth": cMonth, "currentYear": cYear }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var topOpp = '';
            $.each(result.d, function (key, item) {

                topOpp += `<li class="d-flex mb-4 pb-1">
                    <div class="avatar flex-shrink-0 me-3">
                   
                     <i class="bx bx-basketball listoprty" style="color:#6757ef"></i>


                    </div>
                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2" style="width:70%">
                           <span class="text-muted">Task Name : </span>
                                            
                                <a href="/CRMSS/Agenda/NewMyActivity.aspx?Date=`+ item.DueDate + `" class="mb-0">` + item.TaskName + `</a>
                       

                            <div  class="user-progress d-flex align-items-center gap-1">
                            <span class="text-muted">Due Date : </span>
                            <h6 class="mb-0">`+ item.DueDate + `</h6>
                            </div>

                        </div>
                    <div>

                    <div  class="user-progress d-flex align-items-center gap-1">
                            <h6 class="mb-0">`+ item.Status + `</h6>
                            <div>
                            
                     </div>
                    </div>
                </li>`;
            });
            //$('.forcasted-opportunity-ul').html(topOpp)
            result.d.length > 0 ? $('.forcasted-opportunity-ul').html(topOpp) : $('.forcasted-opportunity-ul').html('<div style="text-align:center"><h3 >No Task(s)</h3> <img src="../Images/NO task todo.png"  style="width: 60%; "/> </div>');
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}

function getPreviousPendingTaskList(uID) {
    $.ajax({
        url: "DashboardManager.aspx/PreviousPendingTaskList",
        data: JSON.stringify({ "EmpNum": EmpNo, "currentMonth": cMonth, "currentYear": cYear }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var topOpp = '';
            $.each(result.d, function (key, item) {

                topOpp += `<li class="d-flex mb-4 pb-1">
                    <div class="avatar flex-shrink-0 me-3">
                   
                   <i class="bx bx-basketball listoprty" style="color:#6757ef"></i>
                    </div>
                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2" style="width:70%">
                           <span class="text-muted">Task Name : </span>

                                <a href="/CRMSS/Agenda/NewMyActivity.aspx?Date=`+ item.DueDate + `" class="mb-0">` + item.TaskName + `</a>
                        

                                
                               
                            <div  class="user-progress d-flex align-items-center gap-1">
                            <h6 class="mb-0">`+ item.CreatedDate + `</h6>
                            </div>

                      </div>
                    <div>
                                                
                         <div  class="user-progress d-flex align-items-center gap-1">
                            <h6 class="mb-0">`+ item.Status + `</h6>
                            <div>

                            
                     </div>
                    </div>
                </li>`;
            });
            //$('.forcasted-pending-opportunity-ul').html(topOpp)
            result.d.length > 0 ? $('.forcasted-pending-opportunity-ul').html(topOpp) : $('.forcasted-pending-opportunity-ul').html('<div style="text-align:center"><h3 >No Task(s)</h3> <img src="../Images/NO task todo.png"  style="width: 60%; "/></div>');
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}

function getFutureTaskList(uID) {
    $.ajax({
        url: "DashboardManager.aspx/FutureTasksList",
        data: JSON.stringify({ "EmpNum": EmpNo, "currentMonth": cMonth, "currentYear": cYear }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var topOpp = '';
            $.each(result.d, function (key, item) {

                topOpp += `<li class="d-flex mb-4 pb-1">
                    <div class="avatar flex-shrink-0 me-3">
                   
                     <i class="bx bx-basketball listoprty" style="color:#6757ef"></i>


                    </div>
                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2" style="width:70%">
                           <span class="text-muted">Task Name : </span>

                                <a href="/CRMSS/Agenda/NewMyActivity.aspx?Date=`+ item.DueDate + `" class="mb-0">` + item.TaskName + `</a>

                              
                              <div  class="user-progress d-flex align-items-center gap-1">
                              <span class="text-muted">Due Date : </span>
                              <h6 class="mb-0">`+ item.DueDate + `</h6>
                             </div>

                        </div>
                    <div>
                             
                            <div  class="user-progress d-flex align-items-center gap-1">
                            <h6 class="mb-0">`+ item.Status + `</h6>
                            <div>

                     </div>
                    </div>
                </li>`;
            });
            result.d.length > 0 ? $('.forcasted-futur-opportunity-ul').html(topOpp) : $('.forcasted-futur-opportunity-ul').html('<div style="text-align:center"><h3 >No Task(s)</h3> <img src="../Images/NO task todo.png"  style="width: 60%; "/></div>');
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}


function loadEfficencyGraph(uID) {

    $.ajax({
        url: "DashboardManager.aspx/MonthlyEfficencyGraph",
        data: JSON.stringify({ "UserId": uID, "currentMonth": cMonth, "currentYear": cYear }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            effiChartArray = [];
            eventArrForFullCal = [];

            for (var i = 1; i <= daysInCurrentMonth; i++) {
                result.d.filter(t => t.Day == i).length > 0 ? effiChartArray.push(result.d.filter(t => t.Day == i)[0].Efficency) : effiChartArray.push(0);
            }

            for (var i = 1; i <= daysInCurrentMonth; i++) {
                let title = '', mDate = '', eColor = '';
                if (result.d.filter(t => t.Day == i).length > 0) {
                    title = 'SUBMITTED';
                    mDate = result.d.filter(t => t.Day == i)[0].TaskDate;
                    eColor = '#63c244'
                } else {
                    title = 'PENDING';
                    mDate = ($('#DDLYear option:selected').val()) + '-' + ($('#DDLMonth option:selected').val() < 10 ? '0' + $('#DDLMonth option:selected').val() : $('#DDLMonth option:selected').val()) + '-' + (i < 10 ? '0' + i : i);
                    eColor = '#e35d5d'
                }

                item = {};
                item["Id"] = i;
                item["title"] = title;
                item["start"] = mDate;
                item["color"] = eColor;
                eventArrForFullCal.push(item);
            }

            initializedFullCal();

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}

function loadUserDetails(uID) {

    $.ajax({
        url: "DashboardManager.aspx/GetUserImage",
        data: JSON.stringify({ "userId": uID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d.length > 0) {
                loggedInUserName = result.d[0].EmpName;
                $('#dashboardProPic').attr("src", result.d[0].ImagePath);
            } else {
                loggedInUserName = '';
                $('#dashboardProPic').attr("src", '');
            }
           
           
            // $('.loggedin-username').html(result.d[0].EmpName + "<br /><br /> Your overall performance is not up to standards; we urge you to generate an effective recovery plan  to drastically improve your %Efficiency.");

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}



function EfficencyCalendar() {

    const calendar = document.getElementById('calendar');
    const newEventModal = document.querySelector('.newEventModal');
    const deleteEventModal = document.querySelector('.deleteEventModal');
    const backDrop = document.getElementById('modalBackDrop');
    const eventTitleInput = document.querySelector('.eventTitleInput');
    const eventTitleInput02 = document.querySelector('.eventTitleInput02');
    const eventText = document.querySelector(".eventText");
    var weekdays = document.getElementById("weekdays");

    const content = document.querySelector("#content");
    const monthDisplay = document.getElementById("monthDisplay");

    let nav = 0;
    let clicked = null;
    let events = [];
    const days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

    content.onclick = toggle;
    weekdays.innerHTML = '';
    (function get_days() {
        for (let i = 0; i < days.length; i++) {
            const div = document.createElement("div");
            div.innerHTML = days[i].substring(0, 3);
            weekdays.appendChild(div);
        }
    })();

    function toggle(e) {
        const t = e.target;
        const date = t.dataset.date;
        if (t.closest('.day')) {
            openModal(date);
        } else if (t.closest(".closeBtn")) {
            closeModal();
        } else if (t.closest(".addBtn")) {
            addEvent(e);
        } else if (t.closest(".updateBtn")) {
            updateEvent(e);
        } else if (t.closest(".removeBtn")) {
            removeEvent();
        } else if (t.closest(".previousBtn")) {
            initPreviousBtn();
        } else if (t.closest(".nextBtn")) {
            initNextBtn();
        } else if (t.closest("#daySquare"))
            openModal();
    }

    function openModal(date) {
        clicked = date;
        const ref = localStorage.getItem("events");
        if (ref) {
            events = JSON.parse(ref);
            for (let i = 0; i < events.length; i++) {
                if (events[i].date == date) {
                    eventText.innerHTML = `
              <ul>
                <li>Date : <strong>${events[i].date}/</strong></li>
                <li>Event : ${events[i].title}</li>
              </ul>`;
                    eventTitleInput02.value = events[i].title;
                    deleteEventModal.style.display = 'block';
                    newEventModal.style.display = 'none';
                }
            }
        }
        newEventModal.style.display = 'block';
        backDrop.style.display = 'block';
    }

    function closeModal() {
        eventTitleInput.classList.remove('error');
        newEventModal.style.display = 'none';
        deleteEventModal.style.display = "none";
        backDrop.style.display = 'none';
        eventTitleInput.value = "";
        clicked = null;
    }

    function addEvent(e) {
        e.preventDefault();
        if (eventTitleInput.value.length > 3 && eventTitleInput.value.length <= 10) {
            eventTitleInput.classList.remove('error');
            const event = {
                id: Date.now().toString().slice(8),
                date: clicked,
                title: eventTitleInput.value
            };
            events.push(event);
            localStorage.setItem('events', JSON.stringify(events));
            loadCalendar();
            closeModal();
        } else {
            eventTitleInput.classList.add('error');
        }
    }

    function updateEvent(e) {
        e.preventDefault();
        const ref = localStorage.getItem("events");
        if (ref) {
            const events = JSON.parse(ref);
            for (let i = 0; i < events.length; i++) {
                if (events[i].date === clicked) {
                    if (eventTitleInput02.value.length > 3 && eventTitleInput02.value.length <= 10) {
                        eventTitleInput02.classList.remove('error');
                        events[i].title = eventTitleInput02.value;
                        const event = events[i];
                        events.splice(i, 1, event);
                        localStorage.setItem('events', JSON.stringify(events));
                        eventText.innerHTML = `
              <ul>
                <li>Date : <strong>${events[i].date}</strong></li>
                <li>Event : ${events[i].title}</li>
              </ul>`;
                        eventTitleInput02.value = events[i].title;
                        loadCalendar();
                    } else {
                        eventTitleInput02.classList.add('error');
                    }
                }
            }
        }
    }

    function removeEvent() {
        const ref = localStorage.getItem("events");
        if (ref) {
            const events = JSON.parse(ref);
            for (let i = 0; i < events.length; i++) {
                if (events[i].date === clicked) {
                    events.splice(i, 1);
                    localStorage.setItem('events', JSON.stringify(events));
                    closeModal();
                    loadCalendar();
                }
            }
        }
    }

    function initPreviousBtn() {
        console.log('previousBtn');
        nav--;
        loadCalendar();
    }

    function initNextBtn() {
        console.log('nextBtn');
        nav++;
        loadCalendar();
    }

    function loadCalendar() {

        calendar.innerHTML = "";

        const dt = new Date();
        console.log('-- dt : ' + dt);

        if (nav !== 0) {
            dt.setMonth(new Date().getMonth() + nav);
            console.log("-- nav : " + nav);
            console.log('-- dt.setMonth(new Date().getMonth() + nav) : ' + dt.setMonth(new Date().getMonth() + nav));
        }

        const year = dt.getFullYear();
        console.log("-- year : " + year);

        const month = dt.getMonth();
        console.log("-- month : " + month);

        const day = dt.getDate();
        console.log('-- day : ' + day);

        const monthString = dt.toLocaleDateString("en-US", { month: "long" });
        console.log('-- monthString : ' + monthString);

        monthDisplay.innerHTML = (monthString).substring(0, 3) + " " + year;

        const firstDayOfMonth = new Date(year, month, 1);
        console.log('-- firstDayOfMonth : ' + firstDayOfMonth);

        const options = {
            weekday: 'long',
            year: "numeric",
            month: "numeric",
            day: "numeric"
        }

        const dateString = firstDayOfMonth.toLocaleDateString('en-US', options);
        console.log("-- dateString : " + dateString);

        const firstDayWeek = dateString.split(',')[0];
        console.log('-- firstDayWeek : ' + firstDayWeek);

        const paddingDays = days.indexOf(firstDayWeek);
        console.log("-- paddingDays : " + paddingDays);

        const daysInMonth = new Date(year, month + 1, 0).getDate();
        console.log("-- daysInMonth : " + daysInMonth);

        const currentDay00 = nav == 0 ? dt.toLocaleDateString('en-US', options) : "";
        const currentDay = nav == 0 ? currentDay00.split(',')[1] : "";
        console.log('-- currentDay : ' + currentDay);

        const countDays = paddingDays + daysInCurrentMonth; //daysInMonth;
        console.log('-- countDays : ' + countDays);

        let days01 = [];

        for (let i = 1; i <= countDays; i++) {
            const day01 = {
                day: i - paddingDays,
                month: $('#DDLMonth option:selected').val(), //month + 1,
                year: year,
                currentDay: i - paddingDays == day && nav == 0 ? true : false
            }
            days01.push(day01);
            localStorage.setItem("calendar", JSON.stringify(days01));
        }

        var htm = '[';
        let currMonth = $('#DDLMonth option:selected').val();
        let currYear = $('#DDLYear option:selected').val();
        for (var i = 0; i < effiChartArray.length; i++) {
            let dateForCurrCalMonth = currMonth + "/" + (i + 1) + "/" + currYear;
            let status = effiChartArray[i] == '0' ? 'Pending' : 'Submitted';
            htm += '{ "id": "' + (i + 1) + '", "date": "' + dateForCurrCalMonth + '", "title": "' + status + '" }';
            htm += (i == effiChartArray.length - 1) ? '' : ',';
        }
        htm += ']';
        var ref = htm; //'[{ "id": "51378", "date": "11/9/2022", "title": "tfdhj" }, { "id": "04547", "date": "11/23/2022", "title": "test" }, { "id": "05309", "date": "11/10/2022", "title": "zvxgv" }]'; //localStorage.getItem("events");

        for (let i = 0; i < days01.length; i++) {
            const id = days01[i].id;
            const day01 = days01[i].day;
            console.log('day01 : ' + day01);
            const dayString = days01[i].month + "/" + days01[i].day + "/" + days01[i].year;
            let currentDay = days01[i].currentDay;

            const daySquare = document.createElement("div");
            daySquare.classList.add("day");

            if (day01 > 0) {

                daySquare.setAttribute('data-date', dayString);
                daySquare.textContent = day01;

                if (ref) {
                    events = JSON.parse(ref);
                    for (let i = 0; i < events.length; i++) {
                        if (events[i].date == dayString) {
                            const eventDiv = document.createElement("div");
                            eventDiv.classList.add('event');
                            events[i].title == 'Submitted' ? eventDiv.classList.add('eff-submit') : eventDiv.classList.add('eff-pending');
                            eventDiv.textContent = events[i].title;
                            daySquare.appendChild(eventDiv);
                        }
                    }
                }

            } else {
                daySquare.style.visibility = 'hidden';
            } if (currentDay) {
                daySquare.setAttribute("id", "currentDay");
            }
            const test = currentDay == true ? "-- currentDay" : "";
            console.log(`dayString[${i}] : ${dayString} ${test}`);
            calendar.appendChild(daySquare);
        }

    }

    loadCalendar();

    //https://github.com/portexe/VanillaCalendar/blob/master/script

}



function loadOverAllEfficency(uID) {

    $.ajax({
        url: "DashboardManager.aspx/GetOverallEfficiency",
        data: JSON.stringify({ "userId": uID, "currentMonth": cMonth, "currentYear": cYear }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            arrOverallEff = parseInt(result.d == "" ? 0 : result.d);
            validateRankingEmp(arrOverallEff);
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function initializedFullCal() {

    // document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('fullcalendar');
    oFullCalendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: "",
            center: "title",
            right: ""       //,listMonth
        },
        initialView: 'dayGridMonth',
        events: eventArrForFullCal,
        initialDate: ($('#DDLYear option:selected').val()) + '-' + ($('#DDLMonth option:selected').val() < 10 ? '0' + $('#DDLMonth option:selected').val() : $('#DDLMonth option:selected').val()),

        eventClick: function (info) {
            var item = info;

        }

    });

    oFullCalendar.render();
    //});

}




//----------------------------

function validateRankingEmp(oyearPoints) {

    if (oyearPoints > 0) {
        if (oyearPoints < 50) {

            $('.loggedin-username').html("<h4>Hi,  " + loggedInUserName + "</h4><br /> <h5>Red Flag. Your overall performance is beyond the acceptable mark! We urge you to take the necessary actions to improve your performance immediately.</h5>");
            getDarkShade(oyearPoints);
        }
        else if (oyearPoints < 70) {

            $('.loggedin-username').html("<h4>Hi,  " + loggedInUserName + "</h4><br /> <h5><span>Your overall performance is not up to standards; we urge you to generate an effective recovery plan  to drastically improve your %Efficiency.</h5>");
            getDarkShade(oyearPoints);
        }
        else if (oyearPoints >= 70) {

            $('.loggedin-username').html("<h4>Hi, " + loggedInUserName + "</h4><br /> <h5>Job well done! Keep your inner fire ignited.</h5>");
            getDarkShade(oyearPoints);
        }
    }
    else {
        $('.loggedin-username').html("<h4>Hi,  " + loggedInUserName + "</h4> <br /> <h5>Red Flag. Your overall performance is beyond the acceptable mark! We urge you to take the necessary actions to improve your performance immediately.</h5>");
    }

}

function getLightShade(val) {
    let cGreen = '#12C05D', cYellow = '#d9b024', cRed = '#a92828c7';
    finalColor = '';

    if (val < 50) {
        finalColor = cRed;
    } else if (val >= 50 && val < 70) {
        finalColor = cYellow;
    }
    else if (val >= 70) {
        finalColor = cGreen;
    }

    return finalColor;
}

function getDarkShade(val) {
    let cGreen = '#5cb33f', cYellow = '#F6BE00', cRed = '#a92828';
    finalColor = '';

    if (val < 50) {
        finalColor = cRed;
    } else if (val >= 50 && val < 70) {
        finalColor = cYellow;
    }
    else if (val >= 70) {
        finalColor = cGreen;
    }

    $('#dashboardProPic').css("border", "solid 8px" + finalColor)
    return finalColor;
}


function sortManByName() {
    var sortManList = [];
    lManagerList.sort(function (a, b) {
        return (a).EName.toUpperCase().localeCompare((b).EName.toUpperCase());
    })
    $.each(lManagerList, function (idx, itm) { sortManList.push(itm) });
    return sortManList;
}