
var objDatatablenewReq = [];
var objDatatableImSubited = [];
var objDatatablecocrequest = [];
var objDatatableSiteInsp = [];
var selProjId = 0;
var ProjNo = '';
selInspectIdForReport = '';

$(document).ready(function () {

    loadNewProjects();
    loadImSubmitedProjects();
    loadRequestForCOC();
    loadInspectionProjects();
});

function initiateDataTableqcNewproject() {
    objDatatablenewReq = [];
    objDatatablenewReq = $('.newProjectsQc-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });

    //$('.dataTables_paginate .current').css('background', '#f44336');
    //$('.dataTables_paginate .current').css({ 'background': '#f44336' })

}

function initiateDataTableImSubmited() {
    objDatatableImSubited = [];
    objDatatableImSubited = $('.im-submited-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });

    //$('.dataTables_paginate .current').css('background', '#f44336');
    //$('.dataTables_paginate .current').css({ 'background': '#f44336' })

}

function initiateDataTableCOCrequest(){
    objDatatablecocrequest = [];
    objDatatablecocrequest = $('.reust-coc-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });

    
}
function initiateDataTableInspection() {
    objDatatableSiteInsp = [];
    objDatatableSiteInsp = $('.SiteInspection-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 }, +
            { "orderable": false, "targets": [10] },
            { "orderable": true, "targets": [] }
        ]
    });

    //$('.dataTables_paginate .current').css('background', '#f44336');
    //$('.dataTables_paginate .current').css({ 'background': '#f44336' })

}



function loadNewProjects() {
    $.ajax({
        url: "ProjectsQCview.aspx/GetNewProjects",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {
            $('.tbody-FRDprojectqc tr').length > 0 ? objDatatablenewReq.destroy() : '';

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                 <td>`+ item.SLNo + `</td>
                 
                 <td>`+ item.CreatedDate.split(' ')[0] + `</td>

                 <td>`+ item.CustomerNumber + `</td>
                 <td>`+ item.CustomerName + `</td>
                 <td>`+ item.ProjectName + `</td>
                 <td>`+ item.Location + ` </td>
                   
                <td>`+ item.Consultant + `</td>
                <td>`+ item.MainContractor + `</td>
                <td>`+ item.MEPContractor + `</td>
                <td style="display:none">`+ item.DeliveryDate + `</td>
                 
                <td> <button type="button" class="btn requset-instll btnIntall" data-bs-toggle="modal" data-mid=`+ item.Mid + ` data-bs-target="#ModalDeliveryDate">Request to Install</button>`;
            
               

                
                htm += `</tr>`;

            });

            $('.tbody-FRDprojectqc').html(htm);

            initiateDataTableqcNewproject();
        },

         //< td > <button type="button" id="BtnReqToInstall" class="btn requset-instll" data-bs-toggle="modal" data-mid=`+ item.Mid +` data - bs - target="#ModalDeliveryDate" onclick = "InstallReq2(`+ item.Mid + `)" > Request to Install</button ></td >`;

          // < td > <button type="button" id="BtnReqToInstall" class="btn requset-instll" onclick="InstallReq(`+ item.Mid + `)">Request to Install</button></td >`;
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.tbody-siteinspection').on('click', '.prjectNo', function () {
   ProjNo = this.parentNode.parentNode.children[1].textContent.trim();
    loadInspectionsOfProject();
});

function loadImSubmitedProjects() {
    $.ajax({
        url: "ProjectsQCview.aspx/GetImSubmitedProjects",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {

            $('.tbody-imSubmited tr').length > 0 ? objDatatableImSubited.destroy() : '';

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
               
                htm += `  <tr>        
                 <td>`+ item.SLNo + `</td>
                 
                 <td>`+ item.CreatedDate.split(' ')[0] + `</td>

                 <td>`+ item.CustomerNumber + `</td>
                 <td>`+ item.CustomerName + `</td>
                 <td>`+ item.ProjectName + `</td>
                 <td>`+ item.Location + ` </td>
                   
                <td>`+ item.Consultant + `</td>
                <td style="display:none">`+ item.MainContractor + `</td>
                <td style="display:none">`+ item.MEPContractor + `</td>
                <td>`+ item.DeliveryDate.split(' ')[0] + `</td>
                 
                <td> <button type="button" class="btn requset-instll"  onclick="SitevisitReq(` + item.Mid + `)">Request To Site Visit</button></td>`;

                
                htm += `</tr>`;

            });

            $('.tbody-imSubmited').html(htm);

            initiateDataTableImSubmited();
        },

        // < td > <button type="button" id="BtnReqToInstall" class="btn requset-instll" onclick="InstallReq(`+ item.Mid + `)">Request to Install</button></td >`;
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadInspectionProjects() {
    $.ajax({
        url: "ProjectsQCview.aspx/GetInspectionProjects",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>  

                 <td style="display:none">`+ item.Mid + `</td>
                 <td>`+ item.SLNo + `</td>
                 <td>`+ item.CreatedDate.split(' ')[0] + `</td>               

                 <td>`+ item.CustomerNumber + `</td>
                 <td>`+ item.CustomerName + `</td>
                 <td>`+ item.ProjectName + `</td>
                 <td>`+ item.Location + ` </td>
                  
                <td>`+ item.Consultant + `</td>
                <td>`+ item.MainContractor + `</td>
                <td>`+ item.MEPContractor + `</td>
                <td>`+ item.DeliveryDate.split(' ')[0] + `</td>
                
                <td>  <button type="button" class="btn requset-instll prjectNo" data-bs-toggle="modal" data-bs-target="#ModalInspectionDetails">
                    <span class="fa fa-eye"></span>
                </button> </td >`;




                htm += `</tr>`;

            });

            $('.tbody-siteinspection').html(htm);

            initiateDataTableInspection();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadRequestForCOC() {
    $.ajax({
        url: "ProjectsQCview.aspx/GetRequestCOCProjects",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('.tbody-reqtococ tr').length > 0 ? objDatatablecocrequest.destroy() : '';

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {

                htm += `  <tr>        
                 <td>`+ item.SLNo + `</td>
                 
                 <td>`+ item.CreatedDate.split(' ')[0] + `</td>

                 <td>`+ item.CustomerNumber + `</td>
                 <td>`+ item.CustomerName + `</td>
                 <td>`+ item.ProjectName + `</td>
                 <td>`+ item.Location + ` </td>
                   
                <td>`+ item.Consultant + `</td>
                <td style="display:none">`+ item.MainContractor + `</td>
                <td style="display:none">`+ item.MEPContractor + `</td>
                <td>`+ item.DeliveryDate.split(' ')[0] + `</td>
                 
                <td> <button type="button" id="BtnReqsitevisit"  class="btn requset-instll"  onclick="COCrequest(` + item.Mid + `)">Request To COC</button></td>`;


                htm += `</tr>`;

            });

            $('.tbody-reqtococ').html(htm);

            initiateDataTableCOCrequest();
        },

        // < td > <button type="button" id="BtnReqToInstall" class="btn requset-instll" onclick="InstallReq(`+ item.Mid + `)">Request to Install</button></td >`;
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}




$('.tbody-FRDprojectqc').on('click', '.btnIntall', function () {

    selProjId = $(this).data('mid');
});

function InstallReq(projId) {

    $.ajax({
        url: "ProjectsQCview.aspx/InstallRequest",
        data: JSON.stringify(
            {
                "PId": selProjId,
                'DDate': $('#projectdate').val()

            }),

       
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            //objDatatable.destroy();
            toastr.success('Requested To Installation', '')
            loadNewProjects();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function SitevisitReq(projId) {

    $.ajax({
        url: "ProjectsQCview.aspx/SiteVisitRequested",
        data: JSON.stringify(
            {
                "PId": projId,


            }),


        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            //objDatatableImSubited.destroy();
            toastr.success('Requested To Site Visit/FRD Inspection', '')
            loadImSubmitedProjects();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function COCrequest(projId) {

    $.ajax({
        url: "ProjectsQCview.aspx/RequestForCOC",
        data: JSON.stringify(
            {
                "PId": projId,


            }),


        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            //objDatatableImSubited.destroy();
            toastr.success('Requested To  release COC', '')
            loadRequestForCOC();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadInspectionsOfProject() {
    $('.ReportView').css('display', 'none');
    $.ajax({
        url: "ProjectsQCview.aspx/GetAllInspectionsOfProject",
        data: JSON.stringify(
            {
                "ProjNo": ProjNo
            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            // $('.tbody-checklist').html('');                                     
            var res = result.d;
            var htm = '';

            $.each(res, function (key, item) {
                htm += `<tr data-InspectId=` + item.InspectId + `>  
                    <td>`+ item.ProjectNumber + ` </td>
                    <td>`+ item.ProjectName + ` </td>
                    <td> `+ item.CustomerName + `</td>
                    <td> `+ item.InspectionNumber + `</td>

                    
                    </tr>`;

            });

            $('.tbody-InspectProject').html(htm);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.tbody-InspectProject').on('click', 'tr', function () {
    $('.ReportView').css('display', 'block');

    $('.tbody-InspectProject tr').removeClass('active-tr');

    $(this).addClass('active-tr');
    selInspectIdForReport = $(this).data('inspectid');

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src = "../FireDuctWork/FRDReports.aspx?oper=1&id=" + selInspectIdForReport + "&pno=" + ProjNo;

        //$(".ajax-loader").fadeOut(500);
    }, 100);
    $('#FRDaddRMAReport').modal('show');

    $(".ajax-loader").fadeOut(100);

    //alert('sada');
});

function generateFRDPDF() {
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src = "../FireDuctWork/FRDReports.aspx?oper=2&id=" + selInspectIdForReport + "&pno=" + ProjNo;

        //$(".ajax-loader").fadeOut(500);
    }, 100);

    $(".ajax-loader").fadeOut(100);
}


