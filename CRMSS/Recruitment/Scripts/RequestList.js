
var YesVal = '';
var RRFId = '';
var Status = '';
var objDatatableRRFRequest = [];

$(document).ready(function () {

    LoadJobTitle();
    LoadEducation();
    LoadNationality();
    LoadLanguages();

    RRFRequestDetails();
});


$('#btnModalCall').on('click', function () {

    $('.div-RRF-form').css('display', 'none');

    $('#btnCreateRRF').css('display', '');
    $('.div-update-btn').css('display', 'none');


    $('#mpCreateNewRRF').modal('show');

    

});


function LoadJobTitle() {

    $.ajax({
        url: "RequestList.aspx/GetJobTitle",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            /* if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }*/

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlRRFJobTitle').html(htm);
          
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadEducation() {

    $.ajax({
        url: "RequestList.aspx/GetEducation",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            /* if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }*/

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlQLEducation').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadNationality() {

    $.ajax({
        url: "RequestList.aspx/GetNationality",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            /* if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }*/

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlQLNationality').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function LoadLanguages() {

    $.ajax({
        url: "RequestList.aspx/GetLanguages",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            /* if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }*/

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlQLLanguages').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


$('#btnAddJobTitle').on('click', function () {

    YesVal = 'Job_Title';
    $('#txtAddOption').val('');
    $('#ConfirmActivityPopup').modal('show');
});

$('#btnYes').on('click', function () {

    if (YesVal == 'Job_Title') {

        AddJobTitle();
    }
    else if (YesVal == 'Education') {

        AddEducation();
    }
    else if (YesVal == 'Nationality') {

        AddNationality();

    }
    else if (YesVal == 'Languages') {

        AddLanguages();
    }

});

function AddJobTitle() {
    if ($('#txtAddOption').val() == '') {

        toastr.error('Enter the JobTitle', '');

    }

    else {
    $.ajax({
        url: "RequestList.aspx/AddJobTitle",
        data: JSON.stringify({ "UserID": currUserId, "JobTitle": $('#txtAddOption').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
           
            toastr.success('Update Details Sucessfully..', '');
            LoadJobTitle();
            $('#ddlRRFJobTitle').val($('#txtAddOption').val());
            $('#txtAddOption').val('');
           
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


function AddEducation() {
    if ($('#txtAddOption').val() == '') {

        toastr.error('Enter the Education', '');

    }

    else {
        $.ajax({
            url: "RequestList.aspx/AddEducation",
            data: JSON.stringify({ "UserID": currUserId, "Education": $('#txtAddOption').val(), }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                toastr.success('Update Details Sucessfully..', '');
                LoadEducation();
                $('#ddlQLEducation').val($('#txtAddOption').val());
                $('#txtAddOption').val('');
                
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


function AddNationality() {
    if ($('#txtAddOption').val() == '') {

        toastr.error('Enter the Nationality', '');

    }

    else {
        $.ajax({
            url: "RequestList.aspx/AddNationality",
            data: JSON.stringify({ "UserID": currUserId, "Nationality": $('#txtAddOption').val(), }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                toastr.success('Update Details Sucessfully..', '');
                LoadNationality();
                $('#ddlQLNationality').val($('#txtAddOption').val());
                $('#txtAddOption').val('');
               
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


function AddLanguages() {
    if ($('#txtAddOption').val() == '') {

        toastr.error('Enter the Languages', '');

    }

    else {
        $.ajax({
            url: "RequestList.aspx/AddLanguages",
            data: JSON.stringify({ "UserID": currUserId, "Languages": $('#txtAddOption').val(), }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                toastr.success('Update Details Sucessfully..', '');
                LoadLanguages();
                $('#ddlQLLanguages').val($('#txtAddOption').val());
                $('#txtAddOption').val('');

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

$('#btnAddEducation').on('click', function () {

    YesVal = 'Education';
    $('#txtAddOption').val('');
    $('#ConfirmActivityPopup').modal('show');

});

$('#btnAddNationality').on('click', function () {

    YesVal = 'Nationality';
    $('#txtAddOption').val('');
    $('#ConfirmActivityPopup').modal('show');

});

$('#btnAddLanguages').on('click', function () {

    YesVal = 'Languages';
    $('#txtAddOption').val('');
    $('#ConfirmActivityPopup').modal('show');

});

function getFileName() {

    /*   $('.lbl-fufile-count').html($('#fu-Scrap-Item-Profile')[0].files.length + " File(s)");*/
    $('#lblFilesForRRF').val($('#fu-RRF-Request-Attachment')[0].files[0].name);
    var fileUpload = $('#fu-RRF-Request-Attachment').get(0);
    var files = fileUpload.files[0];
    var reader = new FileReader();

    reader.onload = function () {
        $("#imgRRF").attr("src", reader.result);
    }

    reader.readAsDataURL(files);

}


function AddRRF() {
    
        $.ajax({
            url: "RequestList.aspx/CreateRRF",
            data: JSON.stringify({
                "UserID": currUserId, "Department": $('#txtRRFDepartment').val(),"NoOfPos": $('#txtRRFNoOfPosition').val(), "ReportsTo": $('#txtRRFReportsTo').val(),
                "JobTitle": $('#ddlRRFJobTitle option:selected').val(), "RRFSalary": $('#txtRRFSalaryRange').val(), "Location": $('#txtRRFLocation').val(), "AgeRange": $('#txtRRFAgeRange').val(), "ReasonForHiring": $('#txtRRFReasonForHiring').val(),
                "EmployeeID": $('#txtRRFEmployeeId').val(), "Status": Status,
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                toastr.success('Update Details Sucessfully..', '');
                RRFId = result.d;
                $('.div-RRF-form').css('display', 'block');

                $('#btnCreateRRF').css('display', 'none');
                $('.div-update-btn').css('display', '');

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
   
}

$('#btnCreateRRF').on('click', function () {

    Status = 'DRAFT';
    AddRRF();

});


function RRFRequestDetails() {

    $.ajax({
        url: "RequestList.aspx/GetRRFTableDetails",
        data: JSON.stringify({ "UserId": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-RRFRequest tr').length > 0 ? objDatatableRRFRequest.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                 <td class="hidden" style="text-align:center;">` + item.RequestId + `</td>
                  <td style="text-align:center;">`+ item.Department + `</td>
                  <td style="text-align:center;">`+ item.JobTitle + `</td>
                    <td style="text-align:center;">`+ item.NUmbOfPosition + `</td>
                   <td style="text-align:center;">`+ item.ReasonForHiring + `</td>
                  <td style="text-align:center;">`+ item.ReportsTo + `</td>
                  <td style="text-align:center;">`+ item.Status + `</td>
                   <td style="text-align:center;">
                    <img src="Images/icon-eye.png" title="View" class="fa-icon-hover ibtn-RRF-Details" style="cursor: pointer; width: 34px;"/>
                    </td>`;


                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-RRFRequest').html(htm);

            initiateRRFRequest();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-RRFRequest').on('click', '.ibtn-RRF-Details', function () {

    RRFId = this.parentNode.parentNode.children[0].textContent;
    Status = this.parentNode.parentNode.children[6].textContent;
    RRFReqAllInfo();

    if (Status == 'DRAFT') {
        $('.div-RRF-form').css('display', '');

        $('#btnCreateRRF').css('display', 'none');
        $('.div-update-btn').css('display', '');


        $('#mpCreateNewRRF').modal('show');
    }
    else {

        BasicInfo();
        $('#mpMoreData').modal('show');
    }


});

function initiateRRFRequest() {
    objDatatableRRFRequest = [];
    objDatatableRRFRequest = $('.RRF-Requests-details').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /*   order: [[0, 'ASC']]*/
    });
}


function RRFReqAllInfo() {

    $.ajax({
        url: "RequestList.aspx/GetAllDetails",
        data: JSON.stringify({ "UserId": currUserId, "RRFId": RRFId,}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

       
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {

                $('#txtRRFDepartment').val(result.d[0].Department);
                $('#txtRRFNoOfPosition').val(result.d[0].NUmbOfPosition);
                $('#txtRRFReportsTo').val(result.d[0].ReportsTo);
                $('#ddlRRFJobTitle').val(result.d[0].JobTitle);
                $('#txtRRFSalaryRange').val(result.d[0].SalaryRange);
                $('#txtRRFLocation').val(result.d[0].Location);
                $('#txtRRFAgeRange').val(result.d[0].AgeRange);
                $('#txtRRFReasonForHiring').val(result.d[0].ReasonForHiring);
                $('#txtRRFEmployeeId').val(result.d[0].EmployeeId);

            });

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


$('#btnSaveRRF').on('click', function () {

    Status = 'DRAFT';
    SaveAndSubmitRRF();

});

$('#btnSubmitRRF').on('click', function () {

    Status = 'SUBMIT';
    SaveAndSubmitRRF();

});

function SaveAndSubmitRRF() {

    $.ajax({
        url: "RequestList.aspx/SaveAndUpdateRRF",
        data: JSON.stringify({
            "UserID": currUserId, "RRFId": RRFId, "Department": $('#txtRRFDepartment').val(), "NoOfPos": $('#txtRRFNoOfPosition').val(), "ReportsTo": $('#txtRRFReportsTo').val(),
            "JobTitle": $('#ddlRRFJobTitle option:selected').val(), "RRFSalary": $('#txtRRFSalaryRange').val(), "Location": $('#txtRRFLocation').val(), "AgeRange": $('#txtRRFAgeRange').val(), "ReasonForHiring": $('#txtRRFReasonForHiring').val(),
            "EmployeeID": $('#txtRRFEmployeeId').val(), "Status": Status,

            "Education": $('#ddlQLEducation option:selected').val(), "Nationality": $('#ddlQLNationality option:selected').val(), "YearsOfExp": $('#txtQLYearsOfExp').val(), "Gender": $('#ddlQLGender option:selected').val(), "Languages": $('#ddlQLLanguages option:selected').val(), "DrivingLicense": $('#cbDrivingLicense').is(':checked'),
            "ComputerSkills": $('#txtQLComputerSkills').val(), "TechnicalSkills": $('#txtQLTechnicalSkills').val(),
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Update Details Sucessfully..', '');

            if (Status == 'SUBMIT') {

                RRFRequestDetails();
                $('#mpCreateNewRRF').modal('hide');
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


function BasicInfo() {

    $.ajax({
        url: "RequestList.aspx/GetAllDetails",
        data: JSON.stringify({ "UserId": currUserId, "RRFId": RRFId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {


            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {

                $('#lblDepartment').html(result.d[0].Department);
                $('#lblNoOfPos').html(result.d[0].NUmbOfPosition);
                $('#lblReportsTo').html(result.d[0].ReportsTo);
                $('#lblJobTitle').html(result.d[0].JobTitle);
                $('#lblLocation').html(result.d[0].SalaryRange);
                $('#lblSalaryRange').html(result.d[0].Location);
                $('#lblCreatedDate').html(result.d[0].AgeRange);
                $('#lblEmpId').html(result.d[0].EmployeeId);
                $('#lblRemarks').html(result.d[0].ReasonForHiring);
                $('#lblReqStatus').html(result.d[0].Status);


            });

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}