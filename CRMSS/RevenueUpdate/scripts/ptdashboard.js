var options = {
    series: [{
        name: 'Won',
        data: [0.4, 0.65, 0.76, 0.88, 1.5, 2.1, 2.9, 3.8, 3.9, 4.2, 4, 4.3, 4.1, 4.2, 4.5,
            3.9, 3.5, 3
        ]
    },
    {
        name: 'Loss',
        data: [-0.8, -1.05, -1.06, -1.18, -1.4, -2.2, -2.85, -3.7, -3.96, -4.22, -4.3, -4.4,
        -4.1, -4, -4.1, -3.4, -3.1, -2.8
        ]
    }
    ],
    chart: {
        type: 'bar',
        height: 380,
        stacked: true
    },
    colors: ['#008FFB', '#FF4560'],
    plotOptions: {
        bar: {
            horizontal: true,
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
        min: -5,
        max: 5,
        title: {
            // text: 'Age',
        },
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
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
        ],
        labels: {
            formatter: function (val) {
                return Math.abs(Math.round(val)) + "%"
            }
        }
    },
};

var chart = new ApexCharts(document.querySelector("#totvalchart"), options);
chart.render();

var options = {
    series: [{
        name: 'Won',
        data: [0.4, 0.65, 0.76, 0.88, 1.5, 2.1, 2.9, 3.8, 3.9, 4.2, 4, 4.3, 4.1, 4.2, 4.5,
            3.9, 3.5, 3
        ]
    },
    {
        name: 'Loss',
        data: [-0.8, -1.05, -1.06, -1.18, -1.4, -2.2, -2.85, -3.7, -3.96, -4.22, -4.3, -4.4,
        -4.1, -4, -4.1, -3.4, -3.1, -2.8
        ]
    }
    ],
    chart: {
        type: 'bar',
        height: 380,
        stacked: true
    },
    colors: ['#008FFB', '#FF4560'],
    plotOptions: {
        bar: {
            horizontal: true,
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
        min: -5,
        max: 5,
        title: {
            // text: 'Age',
        },
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
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
        ],
        labels: {
            formatter: function (val) {
                return Math.abs(Math.round(val)) + "%"
            }
        }
    },
};

var chart = new ApexCharts(document.querySelector("#byprodchart"), options);
chart.render();

var options = {
    series: [67],
    chart: {
        height: 200,
        type: 'radialBar',
        offsetY: -10
    },
    plotOptions: {
        radialBar: {
            startAngle: -135,
            endAngle: 135,
            dataLabels: {
                name: {
                    fontSize: '16px',
                    color: undefined,
                    offsetY: 120
                },
                value: {
                    offsetY: 76,
                    fontSize: '22px',
                    color: undefined,
                    formatter: function (val) {
                        return val + "%";
                    }
                }
            }
        }
    },
    fill: {
        type: 'gradient',
        gradient: {
            shade: 'dark',
            shadeIntensity: 0.15,
            inverseColors: false,
            opacityFrom: 1,
            opacityTo: 1,
            stops: [0, 50, 65, 91]
        },
    },
    stroke: {
        dashArray: 4,
    },
    labels: [''],
};

var chart = new ApexCharts(document.querySelector("#currentqua"), options);
chart.render();

var options = {
    series: [67],
    chart: {
        height: 200,
        type: 'radialBar',
        offsetY: -10
    },
    plotOptions: {
        radialBar: {
            startAngle: -135,
            endAngle: 135,
            dataLabels: {
                name: {
                    fontSize: '16px',
                    color: undefined,
                    offsetY: 120
                },
                value: {
                    offsetY: 76,
                    fontSize: '22px',
                    color: undefined,
                    formatter: function (val) {
                        return val + "%";
                    }
                }
            }
        }
    },
    fill: {
        type: 'gradient',
        gradient: {
            shade: 'dark',
            shadeIntensity: 0.15,
            inverseColors: false,
            opacityFrom: 1,
            opacityTo: 1,
            stops: [0, 50, 65, 91]
        },
    },
    stroke: {
        dashArray: 6
    },
    labels: [''],
};

var chart = new ApexCharts(document.querySelector("#wonprec"), options);
chart.render();





var nav = $('#nav-tab');
var line = $('<div />').addClass('line');
line.appendTo(nav);
var active = nav.find('.active');
var pos = 0;
var wid = 0;
if (active.length) {
    pos = active.position().left;
    wid = active.width();
    line.css({
        left: pos,
        width: wid
    });
}


var nav2 = $('#nav-tab2');
var line2 = $('<div />').addClass('line2');
line2.appendTo(nav2);
var active2 = nav2.find('.active');
var pos2 = 0;
var wid2 = 0;
if (active2.length) {
    pos2 = active2.position().left;
    wid2 = active2.width();
    line2.css({
        left: pos2,
        width: wid2
    });
}

nav.find('#pills-tab li button').click(function (e) {
    e.preventDefault();
    if (!$(this).parent().hasClass('active') && !nav.hasClass('animate')) {

        nav.addClass('animate');

        var _this = $(this);

        nav.find('#pills-tab li button').removeClass('active');

        var position = _this.parent().position();
        var width = _this.parent().width();

        if (position.left >= pos) {
            line.animate({
                width: ((position.left - pos) + width)
            }, 300, function () {
                line.animate({
                    width: width,
                    left: position.left
                }, 150, function () {
                    nav.removeClass('animate');
                });
                _this.parent().parent().addClass('active');
            });
        } else {
            line.animate({
                left: position.left,
                width: ((pos - position.left) + wid)
            }, 300, function () {
                line.animate({
                    width: width
                }, 150, function () {
                    nav.removeClass('animate');
                });
                _this.parent().parent().addClass('active');
            });
        }

        pos = position.left;
        wid = width;
    }
});
nav2.find('ul li button').click(function (e) {
    e.preventDefault();
    if (!$(this).parent().hasClass('active2') && !nav2.hasClass('animate2')) {

        nav2.addClass('animate2');

        var _this = $(this);

        nav.find('ul li button').removeClass('active');

        var position2 = _this.parent().position();
        var width2 = _this.parent().width();

        if (position2.left >= pos2) {
            line.animate({
                width: ((position2.left - pos2) + width2)
            }, 300, function () {
                line2.animate({
                    width: width2,
                    left: position2.left
                }, 150, function () {
                    nav2.removeClass('animate2');
                });
                _this.parent().parent().addClass('active');
            });
        } else {
            line2.animate({
                left: position2.left,
                width: ((pos2 - position2.left) + wid2)
            }, 300, function () {
                line2.animate({
                    width: width2
                }, 150, function () {
                    nav2.removeClass('animate2');
                });
                _this.parent().parent().addClass('active');
            });
        }

        pos2 = position2.left;
        wid2 = width2;
    }
});