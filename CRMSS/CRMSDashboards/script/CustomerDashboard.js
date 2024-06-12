var options = {
    series: [44, 55, 13],
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

var chart = new ApexCharts(document.querySelector("#TypePotential3"), options);
chart.render();

var options = {
    series: [44, 43, 22],
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

var chart = new ApexCharts(document.querySelector("#TypePotential2"), options);
chart.render();

var options = {
    series: [55, 13, 22],
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

var chart = new ApexCharts(document.querySelector("#TypePotential1"), options);
chart.render();

var options = {
    series: [{
        name: "Customer",
        data: [10, 41, 35, 51, 49, 62, 69, 91, 148, 20, 50,44]
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

var chart = new ApexCharts(document.querySelector("#AssignedCustomer"), options);
chart.render();