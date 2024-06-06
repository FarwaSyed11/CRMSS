var options = {
    series: [44, 55, 13],
    chart: {
        width: 300,
        type: 'pie',
    },
    labels: ['Never Visited', 'Visited', 'Not Visited'],
    responsive: [{
        breakpoint: 480,
        options: {
            chart: {
                width: 100
            },
            legend: {
                position: 'top'
            }
        }
    }]
};

var chart = new ApexCharts(document.querySelector("#TypePotential"), options);
chart.render();