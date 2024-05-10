

var AssetID = '';
var objDatatable = [];

$(document).ready(function () {

    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        LoadRequestData('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
});


$('#modal-AddNewAsset').on('click', function () {

    ClearCreateAsset();
    EnableAreas();
    $('.Asset-Create-Buttons').css('display', '');
    $('#ModalNewAssets').modal('show');

});
function LoadRequestData(loadername) {
    $.ajax({
        url: "AssetMaster.aspx/GetDataforTable",
        data: JSON.stringify({
            "UserID": currUserId, 
           
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Asset-Det td').length > 0 ? objDatatable.destroy() : '';
            var htm = '';
            var htmlHead = '';

            $.each(result.d, function (key, item) {
                htm += `  <tr>        
               
                     <td style="text-align:center;display:none;">`+ item.AssetID + `</td>  
                     <td style="text-align:center">`+ item.SlNo + `</td>     
                     <td style="text-align:center">`+ item.Name + `</td>    
                     <td style="text-align:center">`+ item.Description + `</td> 
                     <td style="text-align:center">`+ item.Remarks + `</td> 
                     <td style="text-align:center">`+ item.MoreInformation + `</td> 
                     <td style="text-align:center">`+ item.Department + `</td> 
                     <td style="text-align:center">
                      <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-Asset-Det" title="View" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                     </td>

                     </tr>`;

                
            });
            $('.tbody-Asset-Det').html(htm);
            initiateDataTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.Asset-Details').DataTable({
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

$('.tbody-Asset-Det').on('click', '.ibtn-Asset-Det', function () {

    AssetID = this.parentNode.parentNode.parentNode.children[0].textContent;
    ClearCreateAsset();
    $('#txtAssetName').val(this.parentNode.parentNode.parentNode.children[2].textContent);
    $('#txtDepartment').val(this.parentNode.parentNode.parentNode.children[6].textContent);
    $('#txtRemark').val(this.parentNode.parentNode.parentNode.children[4].textContent);
    $('#txtDescription').val(this.parentNode.parentNode.parentNode.children[3].textContent);
    $('#txtMoreInfo').val(this.parentNode.parentNode.parentNode.children[5].textContent);
    DisableAreas();
    $('.Asset-Create-Buttons').css('display', 'none');
    $('#ModalNewAssets').modal('show');

});

function ClearCreateAsset() {

    $('#txtAssetName').val('');
    $('#txtDepartment').val('');
    $('#txtRemark').val('');
    $('#txtDescription').val('');
    $('#txtMoreInfo').val('');
   
}

function CreateAssets() {

    if ($('#txtAssetName').val() != '' && $('#txtDepartment').val() != '') {

        $.ajax({
            url: "AssetMaster.aspx/setAssets",
            data: JSON.stringify({
                "UserId": currUserId, 'Name': $('#txtAssetName').val(), 'Department': $('#txtDepartment').val(), "Desription": $('#txtDescription').val(),
                "Remarks": $('#txtRemark').val(), "MoreInfo": $('#txtMoreInfo').val(),
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                if (result.d == 0) {
                    toastr.error('Asset is Already Exist.', '');
                }
                else {
                    toastr.success('Updated Successfully.', '');
                    ClearCreateAsset();
                    $('.ajax-loader').removeClass('hidden');
                    setTimeout(function () {
                        LoadRequestData('Please Wait...');
                        $(".ajax-loader").addClass('hidden');
                    }, 500);
                }

            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
    else {
        toastr.error('Fill All Area.', '');
    }
}

$('#btnCreate').on('click', function () {

    CreateAssets();
});

function DisableAreas() {

    $('#txtAssetName').attr('disabled', true);
    $('#txtDepartment').attr('disabled', true);
    $('#txtRemark').attr('disabled', true);
    $('#txtDescription').attr('disabled', true);
    $('#txtMoreInfo').attr('disabled', true);
   
}

function EnableAreas() {

    $('#txtAssetName').attr('disabled', false);
    $('#txtDepartment').attr('disabled', false);
    $('#txtRemark').attr('disabled', false);
    $('#txtDescription').attr('disabled', false);
    $('#txtMoreInfo').attr('disabled', false);
}

function loadAssetName() {

    $.ajax({
        url: "AssetMaster.aspx/GetAllAssetName",
        data: JSON.stringify({ 'UserId': currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var opt = '';
            listLeaveType = result.d;

            $.each(listLeaveType, function (key, item) {
                opt += '<option value="' + item.Id + '" >' + item.Value + '</option>';
            });
            $('#txtNameDrop').html(opt);
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

