
var selOrgBu = 0, selDepBu = 0, selDivisionBu = 0;


$(document).ready(function () {

    fillOrgDDL_BU();

    $('#ddlOrgBU').on('change', function () {
        selOrgBU = $('#ddlOrg option:selected').val().trim();
        fillDepartDDL_BU();
    });

    $('#ddlDepartBU').on('change', function () {
        selDepBU = $('#ddlDepart option:selected').val().trim();
        //fillDivision();
    });

    //$('#ddlDivisionBU').on('change', function () {
    //    selDivisionBU = $('#ddlDivision option:selected').val().trim();
    //});
    $('#btnSearchDashBoardBU').on('click', function () {

        objDatatable.destroy();
        $('.ajax-loader').fadeIn(100);

        setTimeout(function () {
            loadHODList('Please wait...');
            $(".ajax-loader").fadeOut(500);
        }, 500);

    });


})




function fillOrgDDL_BU() {

      let htm = '<option value="-1">ALL</option>';
         $.each(ddlListOrg, function (key, item) {
          htm += '<option value="' + item.OrgName + '" >' + item.OrgName + '</option>';
        });

      $('#ddlOrgBU').html(htm);
      selOrgBu = $('#ddlOrgBU option:selected').val().trim();
      fillDepartDDL_BU();            
}

function fillDepartDDL_BU() {        
      let htm = '<option value="-1" >ALL</option>';

       $.each(ddlListDepart, function (key, item) {
          htm += '<option value="' + item.DeptId + '" >' + item.DeptName + '</option>';
      });

      $('#ddlDepartBU').html(htm);
      selDepBu = $('#ddlDepartBU option:selected').val().trim();
      //fillDivision();
}

//function fillDivision() {

//     HODListByFilter = [];

//     let res = result.d;
//     HODListByFilter = res;
//     let htm = '<option value="-1" >ALL</option>';

//     $.each(res, function (key, item) {
//         htm += '<option value="' + item.DivisionName + '" >' + item.DivisionName + '</option>';
//     });


//     $('#ddlDivision').html(htm);
//     selDivision = $('#ddlDivision option:selected').val().trim();
      
//}

function loadHODList(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "KPIAdminNew.aspx/GetHODList",
        data: JSON.stringify({ "orgName": selOrg, "deptId": selDep }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            allEmpList = result.d;
            $.each(result.d, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >
                htm += `  <tr>        
                 <td>`+ item.EmpNo + `</td>
                 <td>`+ item.EmpName + `</td>                

                 <td>`+ item.DepartName + `</td>
                 <td>`+ item.DivisionName + `</td>
                   <td>`+ item.Organization + `</td>
                 <td>`;
                //<span><i class="fa fa-eye viewKPIByIcon" aria-hidden="true" id="viewKPIByIcon" data-bs-toggle="modal" data-bs-target="#viewKPIPopup"></i> </span>
                htm += `<span style="margin-left: 10%;"> <i class="bx bxs-file-plus addKPIByIcon" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee" title="Add/Update KPI & Metrics" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`
                htm += item.IsKPIAssigned == 'TRUE' ? `<span style="margin-left: 10%;"> <i class="bx bx-check checkTest" style="color: green;"></i></span>  <span style="margin-left: 10%;"> <i class='bx bx-copy-alt copyKpiToOthers' title="Copy KPI For Others" style='color:#d33a3a; cursor:pointer;'></i></span>` : '';

                htm += `</td>
      </tr>`;

            });

            $('.tbody-hod').html(htm);
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


function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.kpi-hod-list-table').DataTable({
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [5] },
            { "orderable": true, "targets": [0, 1, 2, 3, 4] }
        ]
    });

    //$('.dataTables_paginate .current').css('background', '#f44336');
    //$('.dataTables_paginate .current').css({ 'background': '#f44336' })

}