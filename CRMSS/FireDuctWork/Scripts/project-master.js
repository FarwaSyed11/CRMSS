

var objDatatableProj = [];
var objDatatable = [];
var objDatatableReqSiteVisit = [];


$(document).ready(function () {

    loadAllProjects();
    loadAInstallationRequestedProjects();
    loadSiteVisitRequest();
});


$('.tbody-employees').on('click', '.ibtn-request-info', function () {

    $('#ModalProjectDetails').modal('show');

    Id = this.parentNode.parentNode.parentNode.children[0].textContent;
   
    GetmdlProjectdetails();
});


function initiateDataTableNewProj() {
    objDatatableProj = [];
    objDatatableProj = $('.project-list-table').DataTable({
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
        ],
         order: [[0, 'DESC']]
    });

  

}

function initiateDataTableInstallReq() {
    objDatatable = [];
    objDatatable = $('.frdInstald-table').DataTable({
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
            { "orderable": false, "targets": [10] },
            { "orderable": true, "targets": [] }
        ]
    });

}


function initiateDataTableReqSitevisit() {
    objDatatableReqSiteVisit = [];
    objDatatableReqSiteVisit = $('.siteVisitReq-table').DataTable({
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
            { "orderable": false, "targets": [10] },
            { "orderable": true, "targets": [] }
        ]
    });

}

function addProject() {
    if (validateProj() == false) {
        toastr.error('Please fill the fields..', '');
        $('#FRDaddProject').modal('show');
    }
    else {

        $.ajax({
            url: "ProjectMaster.aspx/AddTask",
            data: JSON.stringify(
                {
                    "SLNo": $('#txtSLNo').val(),
                    "CreatedDate": $('#projectdate').val(),
                    "CustomerNumber": $('#customernumber').val(),
                    "CustomerName": $('#customername').val(),
                    "ProjectName": $('#projectname').val(),
                    "Location": $('#projectlocation').val(),
                    "Consultant": $('#projectconsultant').val(),
                    "MainContractor": $('#projectmaincontractor').val(),
                    "MEPContractor": $('#projectMEPcontractor').val(),
                    "DeliveryDate": $('#deliverydate').val(),
                    "UpdatedBy": currUserId,

                }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                if (result.d == 0) {
                    getUniqueRequestId();
                    toastr.warning('Your RequestId is Revised! Please Save Again ...', '');
                }
                else {
                    toastr.success('New Project Created.', '')
                    $('#FRDaddProject').modal('hide');
                  
                    loadAllProjects();
                }
            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }
}


function validateProj() {

    var isValid = true;

    if ($('#projectname').val().trim() == "") {
        $('#projectname').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#projectname').css('border-color', 'lightgrey');
    }

    if ($('#projectlocation').val().trim() == "") {
        $('#projectlocation').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#projectlocation').css('border-color', 'lightgrey');
    }

    return isValid;

}
function clearmodal() {

    $('#projectdate').val('')
    $('#customernumber').val('')
    $('#customername').val('')
    $('#projectname').val('')
    $('#projectlocation').val('')
    $('#projectconsultant').val('')
    $('#projectmaincontractor').val('')
    $('#projectMEPcontractor').val('')
    $('#deliverydate').val('')

}


function loadAllProjects() {

    $.ajax({
        url: "ProjectMaster.aspx/GetAllProjects",        
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",       
        success: function (result) {

            $('.tbody-employees tr').length > 0 ? objDatatableProj.destroy() : '';
            clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        

                 <td style="display:none">`+ item.Id + `</td>
                 <td>`+ item.SLNo + `</td>
                 
                 <td>`+ item.CustomerName + `</td>
                 <td>`+ item.ProjectName + `</td>
                 <td>`+ item.Location + ` </td>
                 <td><span class="`+ item.StatusClass+`">` + item.CreatedBy +`</span></td>
                 
                 <td>`+ item.DeliveryDate.split(' ')[0] + `</td>
              
                 <td><span class="`+ item.InStatusClass + `">` + item.Status +`</span></td>
                 <td style="text-align:center;"> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-request-info" title="Other" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td>`; 


                htm += `</tr>`;

            });

            $('.tbody-employees').html(htm);

            initiateDataTableNewProj();
        },
        
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
   

}



function loadAInstallationRequestedProjects() {

    $.ajax({
        url: "ProjectMaster.aspx/GetInstallationReqstedProjects",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('.tbody-installationReq tr').length > 0 ? objDatatable.destroy() : '';
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
                <td>`+ item.DeliveryDate.split(' ')[0] + `</td>
                
                <td><button type="button" id="IMsendtoCust" class="btn requset-instll"  onclick="IMsendToCustomer(`+ item.Id + `)">Done</button></td>`;

                
                

                htm += `</tr>`;

            });

            $('.tbody-installationReq').html(htm);

            initiateDataTableInstallReq();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}




function loadSiteVisitRequest() {

    $.ajax({
        url: "ProjectMaster.aspx/GetSitevisitRequestedList",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('.tbody-sitevisitReq tr').length > 0 ? objDatatableReqSiteVisit.destroy() : '';
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
                <td>`+ item.MainContractor + `</td>
                <td>`+ item.MEPContractor + `</td>
                <td>`+ item.DeliveryDate.split(' ')[0] + `</td>
                
                <td><button type="button" id="IMsendtoCust" class="btn requset-instll"  onclick="SiteVisitApprovel(`+ item.Id + `)">Approved</button></td>`;

                
                htm += `</tr>`;

            });

            $('.tbody-sitevisitReq').html(htm);

            initiateDataTableReqSitevisit();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}




function getUniqueFRDId() {


    $.ajax({
        url: "ProjectMaster.aspx/GetUniqueId",     
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#txtSLNo').val(result.d[0].SLNo);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function IMsendToCustomer(projId) {

    $.ajax({
        url: "ProjectMaster.aspx/IMsendToCustomer",
        data: JSON.stringify(
            {
                "PId": projId,
                

            }),


        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            //objDatatable.destroy();
            toastr.success('Installation Method Submitted', '')
            loadAInstallationRequestedProjects();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function SiteVisitApprovel(projId) {

    $.ajax({
        url: "ProjectMaster.aspx/SitevisitApprovel",
        data: JSON.stringify(
            {
                "PId": projId,
                
            }),


        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            toastr.success('Site Visit Approved..', '')
            loadSiteVisitRequest();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



function GetmdlProjectdetails() {


    $.ajax({
        url: "ProjectMaster.aspx/Getmdlprojectdetails",
        data: JSON.stringify({ 'Id': Id }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#textfrdId').val(result.d.Id);
            $('#textfrdprjnumber').val(result.d.SLNo);
            $('#textprojectname').val(result.d.ProjectName);
            $('#textcustomewrname').val(result.d.CustomerName);
            $('#textcustomernumber').val(result.d.CustomerNumber);
            $('#textlocation').val(result.d.Location);

            $('#textconsultant').val(result.d.Consultant);
            $('#textmaincontractor').val(result.d.MainContractor);
            $('#textmepcontractor').val(result.d.MEPContractor);
            $('#textstatus').val(result.d.Status);
            $('#textcreateddate').val(result.d.CreatedDate);
            $('#textdeliverydate').val(result.d.DeliveryDate);
            $('#textCreatedby').val(result.d.CreatedBy);

        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}



