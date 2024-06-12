$(document).ready(function () {
    loadEmpDetails();
    loadEmpImage();
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

var options = {
    series: [{
        name: "This Year",
        data: [45, 52, 38, 24, 33, 26, 21, 20, 6, 8, 15, 10],

    },{
        name: "Last Year",
        data: [35, 41, 62, 42, 13, 18, 29, 37, 36, 51, 32, 35]
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
        categories: ['Jeb', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep','Oct', 'Nov', 'Dec'],
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
                        return val + " Sales"
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

var options = {
    series: [{
        name: "This Year",
        data: [45, 52, 38, 24, 33, 26, 21, 20, 6, 8, 15, 10],
        color: '#FF69B4'
    }, {
        name: "Last Year",
        data: [35, 41, 62, 42, 13, 18, 29, 37, 36, 51, 32, 35],
        color: '#FA8072'
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
        categories: ['Jeb', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
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

var chart = new ApexCharts(document.querySelector("#sg-Invoice"), options);
chart.render();

var options = {
    series: [{
        name: "This Year",
        data: [45, 52, 38, 24, 33, 26, 21, 20, 6, 8, 15, 10],
        color: '#48D1CC'
    }, {
        name: "Last Year",
        data: [35, 41, 62, 42, 13, 18, 29, 37, 36, 51, 32, 35],
        color: '#BC8F8F'
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
        categories: ['Jeb', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    },
    tooltip: {
        y: [
            {
                title: {
                    formatter: function (val) {
                        return val + " (mins)"
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

var chart = new ApexCharts(document.querySelector("#sg-Collection"), options);
chart.render();

var options = {
    series: [{
        name: 'This Year',
        type: 'area',
        data: [61, 55, 31, 47, 31, 43, 26, 41, 31, 47, 33],
        color:'#00BFFF'
    }, {
        name: 'Last Year',
        type: 'line',
        data: [55, 31, 45, 55, 43, 54, 37, 43, 44, 43, 43],
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
        data: [61, 55, 31, 47, 31, 43, 26, 41, 31, 47, 33],
        color: '#6B8E23'
    }, {
        name: 'Last Year',
        type: 'line',
        data: [55, 31, 45, 55, 43, 54, 37, 43, 44, 43, 43],
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
        data: [61, 55, 31, 47, 31, 43, 26, 41, 31, 47, 33],
        color: '#E0FFFF'
    }, {
        name: 'Last Year',
        type: 'line',
        data: [55, 31, 45, 55, 43, 54, 37, 43, 44, 43, 43],
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

var options2 = {
    chart: {
        height: 250,
        type: "radialBar",
    },
    series: [67],
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
            stops: [0, 50,100]
        }
    },
    stroke: {
        lineCap: "round"
    },
    labels: ["Progress"]
};

new ApexCharts(document.querySelector("#salesorderrange"), options2).render();

var options2 = {
    chart: {
        height: 250,
        type: "radialBar",
    },
    series: [67],
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

var options2 = {
    chart: {
        height: 250,
        type: "radialBar",
    },
    series: [67],
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

new ApexCharts(document.querySelector("#collectionrange"), options2).render();

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