

var Type = 0;



$(document).ready(function () {


});

$("#modal-AddNewaccass").on('click', function () {
    $("#accasscreateModal").modal("show");
});



$('.ActionButtons').on('click', '#btnSubmit', function () {
    if (Type == 0) {

        AddAccess();
    }

    else if (Type == 1) {

        AddAsset();
    }

});


function AddAccess() {
    
    $.ajax({
        url: "AllRequests.aspx/setAccess",
        data: JSON.stringify({
             }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d[0].Id != 0) {
                
                toastr.success('Access Request Created Successfully', '');
                RequestID = result.d[0].Id;
                UploadTheFiles();
            }
            else {
                toastr.error(result.d[0].Messsage, '');
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function AddAsset() {

    $.ajax({
        url: "AllRequests.aspx/setAsset",
        data: JSON.stringify({

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d[0].Id != 0) {
                toastr.success('Asset Request Created Successfully', '');
                RequestID = result.d[0].Id;
                UploadTheFiles();
            }
            else {
                toastr.error(result.d[0].Messsage, '');
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadEmployees(Emp) {
    $.ajax({
        url: "AllRequests.aspx/GetAllEmployees",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Employee --- </option> ';
            empList = result.d;

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.EmpNo + '">  ' + item.EmpNo + ` | ` + item.EmpName + '</option>';
            });

            $('#txtEmpName').html(htm);
            $('#txtEmpName').val(Emp)

            $("#txtEmpName").select2({
                dropdownParent: $("#empLeaveModal"),
                width: '100%',
                height: '100%'
            });
            OwnerNo = $('#txtEmpName option:selected').val();
            OwnerName = $('#txtEmpName option:selected').text();


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function GetRefAccNo() {

    $.ajax({
        url: "AllRequests.aspx/GetAccRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('#lblRequestid').html(result.d);


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function GetRefAssNo() {

    $.ajax({
        url: "AllRequests.aspx/GetAssRefNo",
        /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('#lblRequestid').html(result.d);


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadRequestData(loadername) {
    $.ajax({
        url: "AllRequests.aspx/GetDataforTable",
        data: JSON.stringify({
            "UserID": currUserId, "RequestType": $('#ddlRequesttype option:selected').val(),
            "Status": $('#ddlRequestStatus option:selected').val(),
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-accass-req td').length > 0 ? objDatatable.destroy() : '';
            var htm = '';
            var htmlHead = '';

            if ($('#ddlRequesttype option:selected').val() == 0) {
                $.each(result.d, function (key, item) {


                     htm += `  <tr>        
               
                     <td style="text-align:center;display:none;">`+  + `</td>  
                     <td style="text-align:center">`+  + `</td>  
                     <td style="text-align:center">`+  + `</td>     
                     <td style="text-align:center">`+  + `</td>    
                     <td style="text-align:center">`+  + `</td> 
                     <td style="text-align:center">`+  + `</td> 
                     <td style="text-align:center" ><a class="`+  + `">` +  + `</a></td>
                     <td style="text-align:center">
                      <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-leave-req-info" title="Other" data-projid="`+  + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                     </td>

                     </tr>`;

                });

                $('#active-thead').css("display", "block");
                $('#inactive-thead').css("display", "none");
                $('.tbody-accass-req').html(htm);

            }

            else if ($('#ddlRequesttype option:selected').val() == 1) {
                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                     <td style="text-align:center;display:none;">`+  + `</td>  
                     <td style="text-align:center">`+  + `</td>  
                     <td style="text-align:center">`+  + `</td>     
                     <td style="text-align:center">`+  + `</td>    
                     <td style="text-align:center">`+  + `</td> 
                     <td style="text-align:center">`+  + `</td> 
                     <td style="text-align:center" ><a class="`+  + `">` + + `</a></td>
                     <td style="text-align:center">
                      <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-leave-req-info" title="Other" data-projid="`+  + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                     </td>

                     </tr>`;

                });

                $('#active-thead').css("display", "none");
                $('#inactive-thead').css("display", "block");
                $('.tbody-accass-req').html(htm);

            }

            initiateDataTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.requestdetail').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });
}

$('#ddlRequesttype').on('change', function () {

    Type = $('#ddlRequesttype option:selected').val();

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadRequestData('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

$('#ddlRequestStatus').on('change', function () {

    Type = $('#ddlRequests option:selected').val();

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadRequestData('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

$('#modal-AddNewaccass').on('click', function () {
    
    
    if (Type == 0) {
        $('#ddlRequestType').attr('disabled', false);
        $('#ddlRequestType').val('0');
        GetAssRefNo();
    }
    else if (Type == 1) {

        $('#ddlRequestType').attr('disabled', false);
        $('#ddlRequestType').val('1');
        
        GetAccRefNo();
    }

});

//file upload
function RequestFileUpload() {
    
    var formData = new FormData();
    var formData = new FormData();
    var fileUpload = $('#fu-leave-req').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    /*var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/EventDownload.ashx?EventId=' + EventId + '&UserId=' + currUserId + '&Type=' + Type + '&Name=' + $('#txtName').val().trim() + '&Location=' + $('#txtLocation').val().trim() + '&Address=' + $('#txtAddress').val().trim() + '&Remarks=' + $('#txtRemarks').val().trim();    //for Live*/
    //var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/SSHRFileUploadHandler.ashx?fufor=leaveattach&ApplicationId=' + ApplicationId;    // For Development
    var qrystringLocal = 'Services/SSHRFileUploadHandler.ashx?fufor=leaveattach&ApplicationId=' + ReqId + '&Type=' + Type;    // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        async: false,
        success: function (status) {
            if (status != 'error') {

                toastr.success('File has been Uploaded Successfully.', '');

            }
        },
        processData: false,
        contentType: false,
        error: function (errormessage) {
            console.log(errormessage.responseText);
            alert("Whoops something went wrong!");

        }
    });

}
function getFileName() {
    $('.lbl-fufile-count').html($('#fu-leave-req')[0].files.length + " File(s)");

    $('#lblLeaveReqFileName').val($('#fu-leave-req')[0].files[0].name);
}