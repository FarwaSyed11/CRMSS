
var listTopBox = [];
var listOG1 = [];
var listOG2 = [];
var listRectgrh = [];
var listRightSec = [];
var listTotelHrExitpass = [];
var listTotelNoLateAtte = [];
var listLeavehistorytbl = [];

var arrExitPassChart = [], arrLateAttendance = [], linGraphArrLateAtt = [], linGraphArrExitPass = [];


$(document).ready(function () {

    //currentWeekDate = getWeekDate(new Date())

    loadDashBoardDetails();

});


function loadDashBoardDetails() {

    var date = new Date(),

        Month = date.getMonth() +1,

    

        Year = date.getFullYear();



    $.ajax({
        url: "DashboardSSHR.aspx/GetEmployeeDetails",
        data: JSON.stringify({ "EmpNo": EmpNo, "Month": Month, "Year": Year }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            htmhistory = '';

            listTopBox = result.d.listTopBoxes;
            listOG1 = result.d.listGraph1;
            listOG2 = result.d.listGraph2;
            listRectgrh = result.d.listRectGraph;
            listRightSec = result.d.listRightSec;
            listTotelHrExitpass = result.d.listTypeHOurGraph1;
            listTotelNoLateAtte = result.d.listTypeHOurGraph2;
            listLeavehistorytbl = result.d.listLeaveHis;

            
            $.each(listTopBox, function (key, item) {

                $('#totelPendingRequest').html(item.PENDINGREQUEST);
                $('#approvedReq').html(item.APPROVEDREQ);
                $('#rejectedRequest').html(item.REJECTEDREQ);
                $('#minuteOflate').html(item.LateMin);
                $('#earlyExitMin').html(item.EarlyExitMin);
            });

            linGraphArrLateAtt = [];
            $.each(listOG1, function (key, item) {

                linGraphArrLateAtt.push(parseInt(item.Value))
            });

            linGraphArrExitPass = [];
            $.each(listOG2, function (key, item) {
                linGraphArrExitPass.push(parseInt(item.Value))

            });
            initiateLineGraphForLateAttnExitPass();


            $.each(listRectgrh, function (key, item) {

                $('#divoneTofive').html(item.OneTo5);
                $('#divdixToten').html(item.SixTo10);
                $('#divlevenToFifteen').html(item.ElevenTo15);
                $('#divsixteenToTwenty').html(item.SixteenTo20);
                $('#divtwentyToTwefive').html(item.TwentyOneTo25);
            });

            $.each(listRightSec, function (key, item) {
                if (item.TYPE == "LEAVE") {

                    $('#Rightpendingleave').html(item.PENDINGREQUEST);
                    $('#Righttotelleave').html(item.TOTALREQ);
                    $('#Rightleaveperse').html(item.perc);

                    let perc = parseInt(item.perc) + '%';
                    $('.progLeaveDiv').css('width', perc)
                }

                else if (item.TYPE == "LOAN") {

                    $('#rightPendingloan').html(item.PENDINGREQUEST);
                    $('#righttotelloan').html(item.TOTALREQ); 
                    $('#rightloanperce').html(item.perc);

                    let perc = parseInt(item.perc) + '%';
                    $('.progLoanDiv').css('width', perc)
                }

                if (item.TYPE == "PASSPORT") {

                    $('#pendingpassportreq').html(item.PENDINGREQUEST);
                    $('#totelpassportreq').html(item.TOTALREQ); 
                    $('#passportreqperc').html(item.perc);

                    let perc = parseInt(item.perc) + '%';
                    $('.progpassportDiv').css('width', perc)
                }

                if (item.TYPE == "BANK") {

                    $('#pendingbankrequest').html(item.PENDINGREQUEST);
                    $('#totelbankrequest').html(item.TOTALREQ);
                    $('#bankreqPerc').html(item.perc);

                    let perc = parseInt(item.perc) + '%';
                    $('.progBankDiv').css('width', perc)

                }

                if (item.TYPE == "MISC") {

                    $('#pendingmescellaneousreq').html(item.PENDINGREQUEST);
                    $('#totelmisalenusreq').html(item.TOTALREQ);
                    $('#misereqperce').html(item.perc);

                    let perc = parseInt(item.perc) + '%';
                    $('.progmiseDiv').css('width', perc)
                }

                if (item.TYPE == "LATE") {

                    $('#pendinglateattreq').html(item.PENDINGREQUEST);
                    $('#totellatereq').html(item.TOTALREQ);
                    $('#lateattendprese').html(item.perc);

                    let perc = parseInt(item.perc) + '%';
                    $('.progLateattenDiv').css('width', perc)
                }

                if (item.TYPE == "EARLY") {

                    $('#penndingexitpass').html(item.PENDINGREQUEST);
                    $('#totelexitpass').html(item.TOTALREQ);
                    $('#exitpassperse').html(item.perc);

                    let perc = parseInt(item.perc) + '%';
                    $('.progExitpassDiv').css('width', perc)
                } 

            });

            $.each(listTotelHrExitpass, function (key, item) {

                //arrExitPassChart.push(parseInt(item.Type));
                arrExitPassChart.push(parseInt(item.Hours));
            });
            inititateExitPassPieChart();

            $.each(listTotelNoLateAtte, function (key, item) {

                //arrLateAttendance.push(parseInt(item.Type));
                arrLateAttendance.push(parseInt(item.Hours));

            });
            inititateLateAttendancePieChart();

            $.each(listLeavehistorytbl, function (key, item) {

                htmhistory += `  <tr>        
               
                 <td>`+ item.FromDate.split(' ')[0] + `</td>
                 <td>`+ item.ReturnToWork.split(' ')[0] + `</td> 
                 <td><span style="width: 86px; height: 31px; background: rgba(130, 205, 89, 0.15); border-radius: 5px; padding: 5px 34px;">`+ item.LeaveReqDays + `</span></td>`;
                 
             
                htmhistory += `</tr>`;

            

                $('.tbody-leaveHistory').html(htmhistory);
            });
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

//<td>`+ item.LeaveType + `</td>


var options = {
    series: [67],
    chart: {
        height: 350,
        type: 'radialBar',
    },
    plotOptions: {
        radialBar: {
            hollow: {
                margin: 15,
                size: '70%',
                image: '../../assets/images/clock.png',
                imageWidth: 64,
                imageHeight: 64,
                imageClipped: false
            },
            dataLabels: {
                name: {
                    show: true,
                    color: '#fff'
                },
                value: {
                    show: true,
                    color: '#333',
                    offsetY: 70,
                    fontSize: '22px'
                }
            }
        }
    },
    fill: {
        type: 'image',
        image: {
            src: ['Images/Graph/istockphoto-1331100622-612x612.jpg'],
        }
    },
    stroke: {
        lineCap: 'round'
    },
    labels: ['Volatility'],
};

var chart1 = new ApexCharts(document.querySelector("#chart1"), options);
chart1.render();


var options = {
    series: [{
        name: 'Approved',
        data: [44, 55, 57, 56, 61, 58, 63, 60, 66, 57, 56, 61]
    }, {
        name: 'Rejected',
        data: [16, 18, 10, 18, 17, 11, 11, 14, 9, 5, 11, 14,]
    }, {
        name: 'Pending',
        data: [15, 14, 3, 16, 5, 8, 5, 13, 9, 15, 8, 12]
    }],
    chart: {
        type: 'bar',
        height: 350
    },
    plotOptions: {
        bar: {
            horizontal: false,
            columnWidth: '40%',
            endingShape: 'rounded'
        },
    },
    dataLabels: {
        enabled: false,
        //style: {
        //    colors: ['#00e396', '#f44336', '#feb019']
        //}
    },
    stroke: {
        show: true,
        width: 2,
        colors: ['transparent']
    },
    xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    },
    yaxis: {
        title: {
            text: 'Request Count'
        }
    },
    legend: {
        markers: {
            fillColors: ['#00e396', '#f44336', '#feb019']
        }
        
    },
    fill: {
        opacity: 1,
        colors: ['#00e396', '#f44336', '#feb019']
    },
    tooltip: {
        y: {
            formatter: function (val) {
                return val + " Requests"
            }
        }
    }
};

var chart = new ApexCharts(document.querySelector("#barchart"), options);
chart.render();


function initiateLineGraphForLateAttnExitPass() {
    var options = {
        series: [
            {
                name: "Late Attendance",
                data: linGraphArrLateAtt,//[28, 29, 33, 36, 32, 32, 33, 28, 9, 3, 6, 32, 32, 33, 2, 9, 33, 36, 32, 32, 33, 28, 9, 3, 6, 32, 32, 33, 1,0,0]
            },
            {
                name: "Exit Pass",
                data: linGraphArrExitPass,//[12, 11, 14, 18, 17, 13, 13, 2, 5, 2, 1, 14, 18, 7, 3, 13, 12, 11, 4, 8, 17, 3, 13, 2, 1, 4, 18, 17, 13, 13,0]
            }
        ],
        chart: {
            height: 230,
            type: 'line',
            zoom: {
                type: 'x',
                enabled: true,
                autoScaleYaxis: true
            },
            toolbar: {
                autoSelected: 'zoom'
            },
            dropShadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 0.2
            },
        },
        dataLabels: {
            enabled: false
        },
        colors: [
            '#FFE55F',
            '#ff9518b3',
        ],
        stroke: {
            curve: 'smooth'
        },
        title: {
            text: '',
            align: 'left'
        },
        grid: {
            row: {
                colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
                opacity: 0.5
            },
        },
        fill: {
            type: 'gradient',
            gradient: {
                shade: 'dark',
                gradientToColors: ['#FDD835'],
                shadeIntensity: 1,
                type: 'horizontal',
                opacityFrom: 1,
                opacityTo: 1,
                stops: [0, 100, 100, 100]
            },
        },
        xaxis: {
            categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'],
        }
    };

    var chart = new ApexCharts(document.querySelector("#linechart"), options);
    chart.render();
}



//********************Late Attendance piechart*********************************/

function inititateLateAttendancePieChart() {
    var Lateattendance = {
        series: arrLateAttendance,  // [70, 30],
        chart: {
            width: 290,
            type: 'pie',
        },
        labels: ['Paid', 'Unpaid'],
        fill: {
            opacity: 1,
            colors: ['#82CD59', '#EC1A25']
        },
        stroke: {
            width: 4,
        },
        legend: {
            markers: {
                fillColors: ['#82CD59', '#EC1A25']

            }

        },
        dataLabels: {
            enabled: true,
            style: {
                colors: ['#555']
            },
            background: {
                enabled: true,
                foreColor: '#fff',
                borderWidth: 0
            }
        },
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 100
                },
                legend: {
                    position: 'bottom',
                    horizontalAlign: 'left'
                }
            }
        }]
    };

    var chartlateattend = new ApexCharts(document.querySelector("#LatePiechart"), Lateattendance);
    chartlateattend.render();
}



//**********************Exit Pass Piechart***********************************//

function inititateExitPassPieChart() {
    var exitPassoptions = {
        series: arrExitPassChart,// [40, 60],
        chart: {
            width: 290,
            type: 'pie',
        },
        labels: ['Official', 'Personal'],
        legend: {
            markers: {
                fillColors: ['#FFE601', '#FF9518']
                //fillColors: ['#82CD59', '#EC1A25']
            }

        },
        fill: {
            opacity: 1,
            colors:
                ['#FFE601', '#FF9518']
        },
        dataLabels: {
            enabled: true,
            style: {
                colors: ['#555']
            },
            background: {
                enabled: true,
                foreColor: '#fff',
                borderWidth: 0
            }
        },
        stroke: {
            //show: true,
            width: 4,
            //colors: ['transparent']
        },
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 100
                },
                legend: {
                    position: 'top',
                    horizontalAlign: 'left'
                }
            }
        }]
    };

    var chart = new ApexCharts(document.querySelector("#ExitPiechart"), exitPassoptions);
    chart.render();
}




/*********************End ******************************/

var options = {
    series: [
        {
            name: "Pending Requests",
            data: [5, 4, 2, 1,],
        },
    ],
    chart: {
        type: 'bar',
        height: 200,
    },
    plotOptions: {
        bar: {
            borderRadius: 0,
            horizontal: true,
            distributed: true,
            barHeight: '60%',
            isFunnel: true,
        },
    },
    colors: [
        '#FFE55F',
        '#C5EC71',
        '#94DC79',
        '#68C981',
    ],
    dataLabels: {
        enabled: true,
        formatter: function (val, opt) {
            return opt.w.globals.labels[opt.dataPointIndex]
        },
        dropShadow: {
            enabled: true,
        },
    },
    xaxis: {
        categories: ['Line Manager', 'HOD', 'HR', 'HRM'],
    },
    legend: {
        show: false,
    },
};

var chart = new ApexCharts(document.querySelector("#chartpyramid"), options);
chart.render();

//****************************************************

