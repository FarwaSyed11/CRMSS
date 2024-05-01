var objDatatable = [];
var TempId = '';
var SaveVal = '';

$(document).ready(function () {

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {

        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});


function GetTableDetails(Loader) {

    $.ajax({
        url: "BrandingMaster.aspx/GetTableBasicDetails",
        data: JSON.stringify({ "UserId": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Temblate tr').length > 0 ? objDatatable.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.Description + `</td>
                   <td style="text-align:center;">`+ item.FileName + `</td>
                  <td style="text-align:-webkit-center">  <span class="netliva-switch">
                 <input type="checkbox" `+ item.CheckClass +`> 
                 <label for="cbIsEnabled" data-active-text="Enable" data-passive-text="Disable" style="width: 160px; --switch-active-color: #e38671; --switch-passive-color: #66666696;max-width:55%;cursor:not-allowed"></label>
                  </span>    </td>  
                    <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                    <img src="Images/Edit-Icon.png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" onclick=EditDet(`+ item.Id + `,'` + item.Description + `','` + item.CheckClass+`') />
                    </a></td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Temblate').html(htm);

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

function EditDet(Id,Desc,Class){

    ClearDetails();
    SaveVal = 2;
    TempId = Id;
    $('#txtDescription').val(Desc);
    if (Class == "checked") {
        $('#cbIsEnabled').prop('checked', true);
    }
    else {
        $('#cbIsEnabled').prop('checked', false);
    }
    $('.UploadFile').css('display', 'none');

    $('#modalAddDesign').modal('show');
}

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.Template-table-details').DataTable({
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

$('#btnAddNewImage').on('click', function () {

    ClearDetails();
    SaveVal = 1;
    $('.UploadFile').css('display', '');
    $('#modalAddDesign').modal('show');

});


function uploadMultiFilesByAjax() {

    //var seloption = $('input[name="inlineRadioOptions"]:checked').val().trim();


    //let paraProjName = $('#txtsuggprojectname').val();
    //let paraSuggType = $('input[name=inlineRadioOptions]:checked').val()
    //let paraModName = $('#ddlsuggmoduleName').val();



    var formData = new FormData();
    var fileUpload = $('#colFileUpload').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/ForBrandingMaster.ashx?Description=' + $('#txtDescription').val() + '&UserId=' + currUserId + '&IsEnable=' + $('#cbIsEnabled').is(':checked');
    //var qrystringLocal = '/Services/ForBrandingMaster.ashx?Description=' + $('#txtDescription').val() + '&UserId=' + currUserId + '&IsEnable=' + $('#cbIsEnabled').is(':checked');     // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;
                //  $("#myUploadedImg").attr("src", my_path);
                toastr.success('File has been Uploaded Successfully. ', '');
                //$('.WO-Root-Casuse-table td').length > 0 ? objDatatablePaySch.destroy() : '';
                $('#colFileUpload').val('');
                /* $('#txtAttachmentComment').val('');*/
                /*  GetAttachmentDet();*/
                $('#modalAddDesign').modal('hide');
                $('.ajax-loader').removeClass('hidden');

                setTimeout(function () {

                    GetTableDetails('Please wait...');
                    $(".ajax-loader").addClass('hidden');
                }, 500);
   



            }
        },
        processData: false,
        contentType: false,
        error: function (errormessage) {
            alert("Whoops something went wrong!");
            console.log(errormessage.responseText);
        }
    });

}

$('#btnSaveDet').on('click', function () {

    if (SaveVal == 1) {
        uploadMultiFilesByAjax();

    }

    if (SaveVal == 2) {
        UpdateTemplate();
    }

});

function ClearDetails() {
    $('#txtDescription').val('');
    $('#cbIsEnabled').prop('checked', true);
    $('#colFileUpload').val('');
}



function UpdateTemplate() {

    $.ajax({
        url: "BrandingMaster.aspx/UpdateTemplateDet",
        data: JSON.stringify({ "TempId": TempId, "Description": $('#txtDescription').val(), "IsEnable": $('#cbIsEnabled').is(':checked'), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('File has been Uploaded Successfully. ', '');
            $('#modalAddDesign').modal('hide');
            $('.ajax-loader').removeClass('hidden');

            setTimeout(function () {

                GetTableDetails('Please wait...');
                $(".ajax-loader").addClass('hidden');
            }, 500);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}