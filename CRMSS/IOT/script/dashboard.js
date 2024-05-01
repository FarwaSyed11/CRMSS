


// css  temp Chart*************


if (!Array.prototype.forEach) {
    Array.prototype.forEach = function (cb) {
        var i = 0, s = this.length;
        for (; i < s; i++) {
            cb && cb(this[i], i, this);
        }
    }
}

var timers = [];

function animateGauges() {
    document.gauges.forEach(function (gauge) {
        timers.push(setInterval(function () {
            gauge.value = Math.random() *
                (gauge.options.maxValue - gauge.options.minValue) +
                gauge.options.minValue;
        }, gauge.animation.duration + 500));
    });
}

function stopGaugesAnimation() {
    timers.forEach(function (timer) {
        clearInterval(timer);
    });
}
// for fueal cahart

if (!Array.prototype.forEach) {
    Array.prototype.forEach = function (cb) {
        var i = 0, s = this.length;
        for (; i < s; i++) {
            cb && cb(this[i], i, this);
        }
    }
}

document.fonts && document.fonts.forEach(function (font) {
    font.loaded.then(function () {
        if (font.family.match(/Led/)) {
            document.gauges.forEach(function (gauge) {
                gauge.update();
                gauge.options.renderTo.style.visibility = 'visible';
            });
        }
    });
});

var timers = [];

function animateGauges() {
    document.gauges.forEach(function (gauge) {
        timers.push(setInterval(function () {
            gauge.value = Math.random() *
                (gauge.options.maxValue - gauge.options.minValue) +
                gauge.options.minValue;
        }, gauge.animation.duration + 50));
    });
}

function stopGaugesAnimation() {
    timers.forEach(function (timer) {
        clearInterval(timer);
    });
}

function resize() {
    var size = parseFloat(document.getElementById('gauge-size').value) || 400;

    document.gauges.forEach(function (gauge) {
        gauge.update({ width: size, height: size });
    });
}

function updateUnits() {
    document.gauges.forEach(function (gauge) {
        gauge.update({ units: 'Miles' });
    });
}

function setText() {
    var text = document.getElementById('gauge-text').value;

    document.gauges.forEach(function (gauge) {
        gauge.update({ valueText: text });
    });
}

window.onload = function () {
    // refer gauge
    var gauge = document.gauges[0];

    // this will draw red or blue circle on a gauge plate depending on
    // current value
    gauge.on('beforeNeedle', function () {
        // getting canvas 2d drawing context
        var context = this.canvas.context;

        // we can use gauge context special 'max' property which represents
        // gauge radius in a real pixels and calculate size of relative pixel
        // for our drawing needs
        var pixel = context.max / 100;

        // step out our circle center coordinate by 30% of its radius from
        // gauge center
        var centerX = 30 * pixel;

        // stay in center by Y-coordinate
        var centerY = 0;

        // use circle radius equal to 5%
        var radius = 5 * pixel;

        // save previous context state
        context.save();

        // draw circle using canvas JS API
        context.beginPath();
        context.arc(centerX, centerY, radius, 0, 2 * Math.PI, false);

        var gradient = context.createRadialGradient(
            centerX, centerY, 0,
            centerX, centerY, radius);
        gradient.addColorStop(0, this.options.value <= 0 ? '#aaf' : '#faa');
        gradient.addColorStop(0.82, this.options.value <= 0 ? '#00f' : '#f00');
        gradient.addColorStop(1, this.options.value <= 0 ? '#88a' : '#a88');

        context.fillStyle = gradient;
        context.fill();
        context.closePath();

        // restore previous context state to prevent break of
        // further drawings
        context.restore();
    });

    // redraw the gauge if it has been already drawn
    gauge.draw();
}

        //wave chart*********************************************


window.onload = function () {

   

    var options = {
        //exportEnabled: true,
        animationEnabled: true,
        title: {
            //text: "jQuery Spline Area Chart"

        },
        data: [
            {
                type: "splineArea",
                dataPoints: [
                    { y: 10 },
                    { y: 6 },
                    { y: 14 },
                    { y: 12 },
                    { y: 19 },
                    { y: 14 },
                    { y: 26 },
                    { y: 10 },
                    { y: 22 }
                ]
            }
        ]
    };
    $("#chartContainer").CanvasJSChart(options);

}


     /*system pressure live data */

window.onload = function () {

    //var dataPoints = [];

    //var chart = new CanvasJS.Chart("systempressure", {
    //    theme: "light2",
    //    title: {
    //        text: "Live Data"
    //    },
    //    data: [{
    //        type: "line",
    //        dataPoints: dataPoints
    //    }]
    //});
    //updateData();

    // Initial Values
    //var xValue = 0;
    //var yValue = 10;
    //var newDataCount = 6;

    //function addData(data) {
    //    if (newDataCount != 1) {
    //        $.each(data, function (key, value) {
    //            dataPoints.push({ x: value[0], y: parseInt(value[1]) });
    //            xValue++;
    //            yValue = parseInt(value[1]);
    //        });
    //    } else {
    //        //dataPoints.shift();
    //        dataPoints.push({ x: data[0][0], y: parseInt(data[0][1]) });
    //        xValue++;
    //        yValue = parseInt(data[0][1]);
    //    }

    //    newDataCount = 1;
    //    chart.render();
    //    setTimeout(updateData, 500);
    //}

    //function updateData() {
    //    $.getJSON("https://canvasjs.com/services/data/datapoints.php?xstart=" + xValue + "&ystart=" + yValue + "&length=" + newDataCount + "type=json&callback=?", addData);
    //}

}
var chartSysPrssure = [];
var dataPoints = [];
// Initial Values
var xValue = 0;
var yValue = 10;
var newDataCount = 6;
function updateData() {
   

    function addData(data) {
        if (newDataCount != 1) {
            $.each(data, function (key, value) {
                dataPoints.push({ x: value[0], y: parseInt(value[1]) });
                xValue++;
                yValue = parseInt(value[1]);
            });
        } else {
            //dataPoints.shift();
            dataPoints.push({ x: data[0][0], y: parseInt(data[0][1]) });
            xValue++;
            yValue = parseInt(data[0][1]);
        }

        newDataCount = 1;
        chartSysPrssure.render();
        setTimeout(updateData, 500);
    }

    $.getJSON("https://canvasjs.com/services/data/datapoints.php?xstart=" + xValue + "&ystart=" + yValue + "&length=" + newDataCount + "type=json&callback=?", addData);
}
function initSystemPressure() {
     //dataPoints = [];

    chartSysPrssure = new CanvasJS.Chart("systempressure", {
        theme: "light2",
        title: {
            text: "Live Data"
        },
        data: [{
            type: "line",
            dataPoints: dataPoints
        }]
    });
    updateData();

}







            //System flow livedata

window.onload = function () {
    initSystemPressure()

    var chart = new CanvasJS.Chart("systemflow", {
        title: {
            //text: "Temperature of Each Boiler"
        },
        axisY: {
            title: "Temperature (°C)",
            suffix: " °C"
        },
        data: [{
            type: "column",
            yValueFormatString: "#,### °C",
            indexLabel: "{y}",
            dataPoints: [
                { label: "boiler1", y: 206 },
                { label: "boiler2", y: 163 },
                { label: "boiler3", y: 154 },
                { label: "boiler4", y: 176 },
                { label: "boiler5", y: 184 },
                { label: "boiler6", y: 122 }
            ]
        }]
    });

    function updateChart() {
        var boilerColor, deltaY, yVal;
        var dps = chart.options.data[0].dataPoints;
        for (var i = 0; i < dps.length; i++) {
            deltaY = Math.round(2 + Math.random() * (-2 - 2));
            yVal = deltaY + dps[i].y > 0 ? dps[i].y + deltaY : 0;
            boilerColor = yVal > 200 ? "#FF2500" : yVal >= 170 ? "#FF6000" : yVal < 170 ? "#6B8E23 " : null;
            dps[i] = { label: "Boiler " + (i + 1), y: yVal, color: boilerColor };
        }
        chart.options.data[0].dataPoints = dps;
        chart.render();
    };
    updateChart();

    setInterval(function () { updateChart() }, 500);

}

