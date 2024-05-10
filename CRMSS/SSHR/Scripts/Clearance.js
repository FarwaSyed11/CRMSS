var objDatatable = [];
var EmpNo = '';
var objDatatableAssetAccess = [];
var EmpName = '';
var Email = '';
var Department = '';

var day = ["Sun", "Mon", "Tues", "Wed", "Thu", "Fri", "Sat"];
var monthsbyName = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
var listAssetnAccess = [];


$(document).ready(function () {

    LoadDepartmentDDL();
    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        LoadRequestData('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
});


function LoadRequestData(loadername) {
    $.ajax({
        url: "Clearance.aspx/GetDataforTable",
        data: JSON.stringify({
            "UserID": currUserId, "Department": $('#ddlDepartment option:selected').val().trim(),
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Clearance-Det td').length > 0 ? objDatatable.destroy() : '';
            var htm = '';
            var htmlHead = '';

            $.each(result.d, function (key, item) {
                htm += `  <tr>        
               
                     <td style="text-align:center;display:none;">`+ item.User_Id + `</td>  
                     <td style="text-align:center">`+ item.EmpNo + `</td>     
                     <td style="text-align:center">`+ item.EmpName + `</td>    
                     <td style="text-align:center">`+ item.JOB_Name + `</td> 
                     <td style="text-align:center">`+ item.DeptName + `</td> 
                     <td style="text-align:center">`+ item.Email_Id + `</td> 
                     <td style="text-align:center">
                      <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-Clearance-Det" title="View" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                     </td>

                     </tr>`;


            });
            $('.tbody-Clearance-Det').html(htm);
            initiateDataTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.tbody-Clearance-Det').on('click', '.ibtn-Clearance-Det', function () {

    EmpNo = this.parentNode.parentNode.parentNode.children[1].textContent;
    EmpName = this.parentNode.parentNode.parentNode.children[2].textContent;
    Email = this.parentNode.parentNode.parentNode.children[5].textContent;
    Department = this.parentNode.parentNode.parentNode.children[4].textContent;

    $('#lblRequestNumber').html(EmpNo);
    $('#proj-details-rectangle-div').css("height", "210px");
    $('#empimgvatar').removeClass('w-px-85');
    $('#empimgvatar').addClass('w-px-120');
    $('.divimage').css("width", "12%");
    $('.empMoreInfor').css("display", "");
    $('#empheading').html("Basic Info");
    $('.empMainInfo').css("padding-top", "0px");

    $('.proj-det-drilldown').removeClass('bx bxs-chevron-down');
    $('.proj-det-drilldown').addClass('bx bxs-chevron-up');
    GetBasicEmpDet();
    validationForClearance();
    validationDoneButton();
    LoadAssetAccess();
    $('#empClearanceForm').modal('show');

});

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.Clearance-Info').DataTable({
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

function GetBasicEmpDet() {

    $.ajax({
        url: "Clearance.aspx/GetBasicDetails",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(datedayformat(result.d[0].VisaExpiryDate));
            $('#lblPassExpDate').html(datedayformat(result.d[0].PassportExpireDate));
            $('#lblDateOfJoin').html(datedayformat(result.d[0].JoiningDate));
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(datedayformat(result.d[0].EmiratesExpDate));


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function datedayformat(dt) {
    if (dt != null && dt != '') {
        return day[new Date(dt).getDay()] + ', ' + monthsbyName[new Date(dt).getMonth()] + ' ' + new Date(dt).getDate() + ', ' + new Date(dt).getFullYear();
    }
    else {
        return '';
    }
}


function LoadAssetAccess() {
    $.ajax({
        url: "Clearance.aspx/getAssetAccess",
        data: JSON.stringify({
            "UserID": currUserId, "EmpNo": EmpNo,
            
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-AssetAndAccess-Det td').length > 0 ? objDatatableAssetAccess.destroy() : '';
            var htm = '';
            listAssetnAccess = result.d;
                $.each(result.d, function (key, item) {
                    htm += `  <tr>        
               
                     <td style="text-align:center;display:none;">`+ item.ID + `</td>  
                     <td style="text-align:center;display:none;">`+ item.TypeId + `</td>  
                     <td style="text-align:center">`+ item.RefNo + `</td>     
                     <td style="text-align:center">`+ item.TypeName + `</td>    
                     <td style="text-align:center">`+ item.Name + `</td> 
                     <td style="text-align:center">`+ item.Description + `</td> 
                     <td style="text-align:center">`+ item.AssBy + `</td> 
                     <td style="text-align:center">`+ item.AssignedTo + `</td> 
                     <td style="text-align:center">`+ datedayformat(item.AssignedOn) + `</td> 
                     <td style="text-align:center">`+ item.Remarks + `</td> 
                      <td style="text-align:center"><span style="color:`+item.StatusClass+`">`+ item.Status + `</span></td> 
                     </tr>`;


                });
               
            $('.tbody-AssetAndAccess-Det').html(htm);
          
            initiateDataTableAssetAccess();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateDataTableAssetAccess() {
    objDatatableAssetAccess = [];
    objDatatableAssetAccess = $('.AssetAndAccess-Table').DataTable({
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

function RequestForClearance() {

            $.ajax({
                url: "Clearance.aspx/SetClearance",
                data: JSON.stringify({
                    "UserId": currUserId, "EmpNo": EmpNo, 
                }),
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                async: false,
                success: function (result) {

                    toastr.success("Requested For Clearance");
                    validationForClearance();
                    validationDoneButton();
                },
                error: function (errormessage) {
                    alert(errormessage.responseText);
                }
            });
}

function validationForClearance() {
    $.ajax({
        url: "Clearance.aspx/ValidateForClearance",
        data: JSON.stringify({
            "UserId": currUserId, "EmpNo": EmpNo,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 0) {

                $('#btnClearance').css('display', 'none');
            }
            else {
                $('#btnClearance').css('display', '');
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function validationDoneButton() {
    $.ajax({
        url: "Clearance.aspx/ValidateForDone",
        data: JSON.stringify({
            "UserId": currUserId, "EmpNo": EmpNo,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 0) {

                $('.btnDone-Clearance').css('display','');
            }
            else {
                $('.btnDone-Clearance').css('display','none');
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function AllCleared() {
    $.ajax({
        url: "Clearance.aspx/SetAllCleared",
        data: JSON.stringify({
            "UserId": currUserId, "EmpNo": EmpNo, "EmpName": EmpName, "Email": Email, "Department": Department,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success("Updated Successfully");
            $('.ajax-loader').removeClass('hidden');
            setTimeout(function () {
                LoadRequestData('Please Wait...');
                $(".ajax-loader").addClass('hidden');
            }, 500);
            $('#empClearanceForm').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnClearance').on('click', function () {

    RequestForClearance();
});

$('.btnDone-Clearance').on('click', function () {

    AllCleared();

});

function hideShowProjDetails() {
    var x = document.getElementById("proj-details-rectangle-div");
    if (x.style.height == "110px") {
        // x.style.display = "block";
        //$('#proj-details-rectangle-div').show('400');
        $('#proj-details-rectangle-div').css("height", "210px");
        $('#empimgvatar').removeClass('w-px-85');
        $('#empimgvatar').addClass('w-px-120');
        $('.divimage').css("width", "12%");
        $('.empMoreInfor').css("display", "");
        $('#empheading').html("Basic Info");
        $('.empMainInfo').css("padding-top", "0px");

        $('.proj-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.proj-det-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#proj-details-rectangle-div').css("height", "110px");
        // $('#proj-details-rectangle-div').hide('400');
        $('.empMoreInfor').css("display", "none");
        $('.divimage').css("width", "9%");
        $('#empimgvatar').addClass('w-px-85');
        $('#empimgvatar').removeClass('w-px-120');
        $('.empMainInfo').css("padding-top", "10px");
        $('#empheading').html("");
        $('.proj-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.proj-det-drilldown').addClass('bx bxs-chevron-down');

    }
}

function LoadDepartmentDDL() {

    $.ajax({
        url: "Clearance.aspx/GetDepartmentDDL",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlDepartment').html(htm);
          
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlDepartment').on('change', function () {
    $('.ajax-loader').removeClass('hidden');
    setTimeout(function() {
        LoadRequestData('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
   

});
