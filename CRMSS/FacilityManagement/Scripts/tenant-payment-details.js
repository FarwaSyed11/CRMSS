/* Initialization of datatable */

var selEmpNum = '';
var selEmpName = '';
var selEmpDepart = ''
var selEmpOrg = '';

var UserKPIsList = [];
var UserMatricsList = [];
var allEmpList = [];

var selKpiId = '', selMatId = '';
var lastCreatedKpiidForTabOpen = '';
var dpKpiStart = [], dpKpiEnd = [];
var targetByAdmin = 0;
var toEmpNum;
var objDatatable;

var tenantPayDetailsList = [];
var selPayContractId = 0, selPayStatus='';


var selPayStatus = '-1', selPropName = '-1', selPropType = '-1';

//fireworks
/* example functionality */
//var SCREEN_WIDTH = window.innerWidth,
//    SCREEN_HEIGHT = window.innerHeight,
//    mousePos = {
//        x: 400,
//        y: 300
//    },

//    // create canvas
//    canvas = document.createElement('canvas'),
//    context = canvas.getContext('2d'),
//    particles = [],
//    rockets = [],
//    MAX_PARTICLES = 400,
//    colorCode = 0;

//// init
//$(document).ready(function () {
//    document.body.appendChild(canvas);
//    canvas.width = SCREEN_WIDTH;
//    canvas.height = SCREEN_HEIGHT;
//    setInterval(launch, 800);
//    setInterval(loop, 1000 / 50);
//});

//// update mouse position
//$(document).mousemove(function (e) {
//    e.preventDefault();
//    mousePos = {
//        x: e.clientX,
//        y: e.clientY
//    };
//});

//// launch more rockets!!!
//$(document).mousedown(function (e) {
//    for (var i = 0; i < 5; i++) {
//        launchFrom(Math.random() * SCREEN_WIDTH * 2 / 3 + SCREEN_WIDTH / 6);
//    }
//});

//function launch() {
//    launchFrom(mousePos.x);
//}

//function launchFrom(x) {
//    if (rockets.length < 10) {
//        var rocket = new Rocket(x);
//        rocket.explosionColor = Math.floor(Math.random() * 360 / 10) * 10;
//        rocket.vel.y = Math.random() * -3 - 4;
//        rocket.vel.x = Math.random() * 6 - 3;
//        rocket.size = 8;
//        rocket.shrink = 0.999;
//        rocket.gravity = 0.01;
//        rockets.push(rocket);
//    }
//}

//function loop() {
//    // update screen size
//    if (SCREEN_WIDTH != window.innerWidth) {
//        canvas.width = SCREEN_WIDTH = window.innerWidth;
//    }
//    if (SCREEN_HEIGHT != window.innerHeight) {
//        canvas.height = SCREEN_HEIGHT = window.innerHeight;
//    }

//    // clear canvas
//    context.fillStyle = "rgba(0, 0, 0, 0.05)";
//    context.fillRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);

//    var existingRockets = [];

//    for (var i = 0; i < rockets.length; i++) {
//        // update and render
//        rockets[i].update();
//        rockets[i].render(context);

//        // calculate distance with Pythagoras
//        var distance = Math.sqrt(Math.pow(mousePos.x - rockets[i].pos.x, 2) + Math.pow(mousePos.y - rockets[i].pos.y, 2));

//        // random chance of 1% if rockets is above the middle
//        var randomChance = rockets[i].pos.y < (SCREEN_HEIGHT * 2 / 3) ? (Math.random() * 100 <= 1) : false;

//        /* Explosion rules
//                     - 80% of screen
//                    - going down
//                    - close to the mouse
//                    - 1% chance of random explosion
//                */
//        if (rockets[i].pos.y < SCREEN_HEIGHT / 5 || rockets[i].vel.y >= 0 || distance < 50 || randomChance) {
//            rockets[i].explode();
//        } else {
//            existingRockets.push(rockets[i]);
//        }
//    }

//    rockets = existingRockets;

//    var existingParticles = [];

//    for (var i = 0; i < particles.length; i++) {
//        particles[i].update();

//        // render and save particles that can be rendered
//        if (particles[i].exists()) {
//            particles[i].render(context);
//            existingParticles.push(particles[i]);
//        }
//    }

//    // update array with existing particles - old particles should be garbage collected
//    particles = existingParticles;

//    while (particles.length > MAX_PARTICLES) {
//        particles.shift();
//    }
//}

//function Particle(pos) {
//    this.pos = {
//        x: pos ? pos.x : 0,
//        y: pos ? pos.y : 0
//    };
//    this.vel = {
//        x: 0,
//        y: 0
//    };
//    this.shrink = .97;
//    this.size = 2;

//    this.resistance = 1;
//    this.gravity = 0;

//    this.flick = false;

//    this.alpha = 1;
//    this.fade = 0;
//    this.color = 0;
//}

//Particle.prototype.update = function () {
//    // apply resistance
//    this.vel.x *= this.resistance;
//    this.vel.y *= this.resistance;

//    // gravity down
//    this.vel.y += this.gravity;

//    // update position based on speed
//    this.pos.x += this.vel.x;
//    this.pos.y += this.vel.y;

//    // shrink
//    this.size *= this.shrink;

//    // fade out
//    this.alpha -= this.fade;
//};

//Particle.prototype.render = function (c) {
//    if (!this.exists()) {
//        return;
//    }

//    c.save();

//    c.globalCompositeOperation = 'lighter';

//    var x = this.pos.x,
//        y = this.pos.y,
//        r = this.size / 2;

//    var gradient = c.createRadialGradient(x, y, 0.1, x, y, r);
//    gradient.addColorStop(0.1, "rgba(255,255,255," + this.alpha + ")");
//    gradient.addColorStop(0.8, "hsla(" + this.color + ", 100%, 50%, " + this.alpha + ")");
//    gradient.addColorStop(1, "hsla(" + this.color + ", 100%, 50%, 0.1)");

//    c.fillStyle = gradient;

//    c.beginPath();
//    c.arc(this.pos.x, this.pos.y, this.flick ? Math.random() * this.size : this.size, 0, Math.PI * 2, true);
//    c.closePath();
//    c.fill();

//    c.restore();
//};

//Particle.prototype.exists = function () {
//    return this.alpha >= 0.1 && this.size >= 1;
//};

//function Rocket(x) {
//    Particle.apply(this, [{
//        x: x,
//        y: SCREEN_HEIGHT
//    }]);

//    this.explosionColor = 0;
//}

//Rocket.prototype = new Particle();
//Rocket.prototype.constructor = Rocket;

//Rocket.prototype.explode = function () {
//    var count = Math.random() * 10 + 80;

//    for (var i = 0; i < count; i++) {
//        var particle = new Particle(this.pos);
//        var angle = Math.random() * Math.PI * 2;

//        // emulate 3D effect by using cosine and put more particles in the middle
//        var speed = Math.cos(Math.random() * Math.PI / 2) * 15;

//        particle.vel.x = Math.cos(angle) * speed;
//        particle.vel.y = Math.sin(angle) * speed;

//        particle.size = 10;

//        particle.gravity = 0.2;
//        particle.resistance = 0.92;
//        particle.shrink = Math.random() * 0.05 + 0.93;

//        particle.flick = true;
//        particle.color = this.explosionColor;

//        particles.push(particle);
//    }
//};

//Rocket.prototype.render = function (c) {
//    if (!this.exists()) {
//        return;
//    }

//    c.save();

//    c.globalCompositeOperation = 'lighter';

//    var x = this.pos.x,
//        y = this.pos.y,
//        r = this.size / 2;

//    var gradient = c.createRadialGradient(x, y, 0.1, x, y, r);
//    gradient.addColorStop(0.1, "rgba(255, 255, 255 ," + this.alpha + ")");
//    gradient.addColorStop(1, "rgba(0, 0, 0, " + this.alpha + ")");

//    c.fillStyle = gradient;

//    c.beginPath();
//    c.arc(this.pos.x, this.pos.y, this.flick ? Math.random() * this.size / 2 + this.size / 2 : this.size, 0, Math.PI * 2, true);
//    c.closePath();
//    c.fill();

//    c.restore();
//};



//end







$(document).ready(function () {


    loadPropertyDDL();
    // fillOrgDDL();
    loadTenantPaymentDetailsList();
    //initiateDataTable();


    //$('.tbody-employees').on('click','strong', function () {   ////It was for when user click on Employee Number mean tr of first td 

    //    //li
    //    $('#nav-kpi .nav-tabs button').removeClass('active')
    //    $('#nav-kpi .nav-tabs').find('.nav1').addClass('active')

    //    //tab content
    //    $('#nav-kpi .tab-content').find('#nav-add-kpi').removeClass('active show')
    //    $('#nav-kpi .tab-content').find('#nav-add-matrics').removeClass('active show')

    //    $('#nav-kpi .tab-content').find('#nav-add-kpi').addClass('active show')
    //    //
    //    resetControls();      
    //    selEmpNum = this.parentNode.parentNode.children[0].textContent.trim(), selEmpName = this.parentNode.parentNode.children[1].textContent.trim(), selEmpDepart = this.parentNode.parentNode.children[2].textContent.trim(), selEmpOrg = this.parentNode.parentNode.children[3].textContent.trim();

    //    $('#KPIPopupEmployeeLabel').html("Add KPI - " + selEmpName + " - " + selEmpNum + " ( " + selEmpDepart + " / " + selEmpOrg+")");

    //});

    $('#btnSearchDashBoard').on('click', function () {

        objDatatable.destroy();
        $('.ajax-loader').fadeIn(100);

        setTimeout(function () {
            loadTenantPaymentDetailsList('Please wait...');
            $(".ajax-loader").fadeOut(500);
        }, 500);

    });

});

//exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6, 7, 9] }
function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.kpi-user-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                },
                { extend: 'pdf', text: '<i class="fa fa-file-pdf-o" aria-hidden="true" style="font-size: x-large;" title="Export PDF"></i> ', className: 'btn btn-secondary iconClassPdf' }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [2,4,11] },
            { "orderable": true, "targets": [1,,3,5,6,7,8,9,10] }
        ]
    });

    //$('.dataTables_paginate .current').css('background', '#f44336');
    //$('.dataTables_paginate .current').css({ 'background': '#f44336' })

}


function loadTenantPaymentDetailsList(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "TenantPaymentDetails.aspx/GetTenantPaymentDetailsList",
        data: JSON.stringify({ "PaymentStatus": selPayStatus, "PropName": selPropName, "PropType": selPropType }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var ddlId = '';

            

            tenantPayDetailsList = result.d;
            $.each(result.d, function (key, item) {
                var opt = '<option value="-1" > Select Status </option>';
                for (var i = 0; i < item.PaymentStatusesEnum.length; i++) {
                    let selattr = item.PayStatus == item.PaymentStatusesEnum[i].trim() ? 'selected' : '';

                    opt += '<option value=' + item.PaymentStatusesEnum[i].trim() + ' ' + selattr + '> ' + item.PaymentStatusesEnum[i].trim().replaceAll('_', ' ') +'</option>'
                }
               // $('#ddlId').html(opt);
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td > item.PaymentStatusesEnum
                ddlId = 'tps-' + item.PayContractId.trim();
                htm += `  <tr>        
                 <td class="hidden">`+ item.PayContractId + `</td>
                 <td>`+ item.ContractNo + `</td>
            <td>
<ul>
            <li>Mode: <b>`+ item.ModeOfPayment + `</b></li>
            <li>Cheque#: <b>`+ item.ChequeNo + `</b></li>
         </ul>

</td>
                 <td>`+ item.ContractDesc + `</td>                

                 <td> <select class="form-select" id=`+ ddlId + `> ` + opt+`  </select>
                </td>

                 <td>`+ item.PropName + `</td>
                   <td>`+ item.PropType + `</td>

            <td>
<ul>            
            <li>Block: `+ item.BlockDesc + `</li>
            <li>Floor: `+ item.FloorDesc + `</li>
            <li>Room: `+ item.RoomDesc +`</li>
         </ul>

</td>
                 <td>`+ item.ContractFromDate + `</td>
                   <td>`+ item.ContractToDate + `</td>

 <td>`+ item.PayDate + `</td>
                 <td>`;
                htm += `<span style="margin-left: 10%;"> <i class="bx bx-save updatePayStatusIcon" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee" title="Update Contract" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`

                htm += `</td>
      </tr>`;
                //var opt = '<option value="-1" selected> Select Status </option>';
                //for (var i = 0; i < item.PaymentStatusesEnum.length; i++) {
                //    opt += '<option value=' + item.PaymentStatusesEnum[i].trim() + '> </option>'
                //}
                //$('#ddlId').html(opt);

                //$('#ddlId').val(item.PayStatus);

            });

            $('.tbody-employees').html(htm);
            initiateDataTable();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



$('.kpi-user-list-table').on('click','.updatePayStatusIcon', function () {
    var getSelDDLId = '#'+ this.parentNode.parentNode.parentNode.children[4].childNodes[1].id + ' option:selected';

    selPayContractId = this.parentNode.parentNode.parentNode.children[0].textContent.trim();

    selPayStatus = $(getSelDDLId).val();
    $('#payStatusConfirmPopup').modal('show');
});

$('.btn-update-paystatus').on('click', function () {
    updatePaymentStatus();
    $('#payStatusConfirmPopup').modal('hide');
    //toastr.success('KPI Deleted Scuccessfully', '');
});


function updatePaymentStatus() {

    $.ajax({
        url: "TenantPaymentDetails.aspx/UpdatePaymentStatus",
        data: JSON.stringify({ "PayContractId": selPayContractId, 'PayStatus': selPayStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
          
            toastr.success('Payment Status Updated Successfully', '');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//-------------------------------------------------

$('#ddlPaymentStatus').on('change', function () {
    selPayStatus = $('#ddlPaymentStatus option:selected').val().trim();
});
$('#ddlPropertiesName').on('change', function () {
    selPropName = $('#ddlPropertiesName option:selected').val().trim();
});
$('#ddlPropertType').on('change', function () {
    selPropType = $('#ddlPropertType option:selected').val().trim();
});
function loadPropertyDDL() {

    $.ajax({
        url: "Property.aspx/GetAllPropertiesDistinct",
        //data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "divisionName": selDivision }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value="-1"> --- All --- </option>';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.PropName + `" > ` + item.PropName + `</option>`;

            });

            $('#ddlPropertiesName').html(htm);
            selPropName = $('#ddlPropertiesName option:selected').val().trim();
            loadPropertyTypeDDL();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadPropertyTypeDDL() {

    $.ajax({
        url: "Property.aspx/GetAllPropertiesTypeDistinct",
        //data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "divisionName": selDivision }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value="-1"> --- All --- </option>';

            $.each(result.d, function (key, item) {

                htm += `<option value=` + item.PropType + ` > ` + item.PropType + `</option>`;

            });

            $('#ddlPropertType').html(htm);
            selPropType = $('#ddlPropertType option:selected').val().trim();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


//$('#formValidationCheckbox').is(':checked')
//$('#formValidationCheckbox').prop('checked',false)

function FormateDate(dt) {

    var date = dt.getDate();
    var month = dt.getMonth() + 1;
    var year = dt.getFullYear();

    return year + "-" + month + "-" + date;
}

function FormateDateWithTime(dt) {

    var date = dt.getDate();
    var month = dt.getMonth() + 1;
    var year = dt.getFullYear();
    var hour = dt.getHours();
    var Min = dt.getMinutes();

    return year + "-" + month + "-" + date + ' : ' + hour + ' ' + Min;
}
