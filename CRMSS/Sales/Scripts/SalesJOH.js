

	//$('#oppInfoModal').modal('show');
//loadAllEmployees

function openPopUpUnderRisk() {
    $('#oppInfoModal').modal('show');
}



function loadAllEmployees() {
    $.ajax({
        url: "../Calendar/CalendarMaster.aspx/GetAllEmployees",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Employee --- </option> ';
            empList = result.d;

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.EmpNo + '"> ' + item.EmpNo + ' | ' + item.EmpName + '</option>';
            });

            $('#ddlEmpListForUnderRisk').html(htm);
            $("#ddlEmpListForUnderRisk").select2({
                dropdownParent: $("#oppInfoModal"),
                width: '100%',
                height: '73%'
            });

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$('#ddlTaggedPerson').on('change', function () {

    let opt = $('#ddlTaggedPerson option:selected').val();
    if (opt == '0') {
        //$('#taTaggedOther').removeClass('hidden');
        $('.ddlEmpListForUnderRiskDiv').removeClass('hidden');
       // loadAllEmployees
    } else {
        //$('#taTaggedOther').addClass('hidden');
        $('.ddlEmpListForUnderRiskDiv').addClass('hidden');
    }
});
function getTaggedPersonByOptNo() {
    $.ajax({
        url: "../Calendar/CalendarMaster.aspx/GetTaggedPersonByOptNo",
        data: JSON.stringify({ 'OptNo': selOptNumber }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.Value + '"> ' + item.Name + ' </option>';
            });

            $('#ddlTaggedPerson').html(htm);
            //$("#ddlTaggedPerson").select2({
            //    dropdownParent: $("#InviReqModal"),
            //    width: '100%',
            //    height: '73%'
            //});

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$('.btnUpdateOppUR').on('click', function () {
    let res = validateControls();
    if (res) {
        if (listRelatedOpp.filter(s => s.Salesman == currUserId && s.OptNo == selOptNumber).length > 0) {
            $('.ajax-loader').fadeIn(100);

            setTimeout(function () {
                updateOppotunity('salesman');
                insertUnderRiskReason();
                $(".ajax-loader").fadeOut(100);
            }, 100);

        }
       
    } else {
        $(".oppInfoModalContent").effect("shake");
    }

});

function insertUnderRiskReason() {
    let empEmail = empList.filter(s => s.EmpNo == $('#ddlEmpListForUnderRisk').val()).length > 0 ? empList.filter(s => s.EmpNo == $('#ddlEmpListForUnderRisk').val())[0].Email : "";
    let ddlActionOwner = $('#ddlTaggedPerson option:selected').val().trim() == '0' ? empEmail : $('#ddlTaggedPerson option:selected').text().trim();
    $.ajax({
        url: "../Calendar/CalendarMaster.aspx/UpdateUnderRiskOppReason",
        data: JSON.stringify({ 'OptNo': selOptNumber, "ActionOwner": ddlActionOwner, "DueDate": $('#dpDueDate').val(), "ActionRequired": $('#taActionRequired').val(), "UserId": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully', '');
            $('#oppInfoModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function validateControls() {
    var isValid = true;

    //if ($('#txtActionOwner').val().trim() == "") {
    //    $('#txtActionOwner').css('border-color', '#ea090970');
    //    isValid = false;

    //}
    //else {
    //    $('#txtActionOwner').css('border-color', 'lightgrey');
    //}
    if ($('#ddlTaggedPerson option:selected').val() == "-1") {
        $('#ddlTaggedPerson').css('border-color', '#ea090970');
        $('#ddlTaggedPerson').css('box-shadow', '0px 1px 2.5px #e36033d9');
        isValid = false;
    }
    else {
        $('#ddlTaggedPerson').css('border-color', 'lightgrey');
        $('#ddlTaggedPerson').css('box-shadow', '');
    }

    if ($('#dpDueDate').val().trim() == "") {
        $('#dpDueDate').css('border-color', '#ea090970');
        $('#dpDueDate').css('box-shadow', '0px 1px 2.5px #e36033d9');
        isValid = false;
    }
    else {
        $('#dpDueDate').css('border-color', 'lightgrey');
        $('#dpDueDate').css('box-shadow', '');
    }

    if ($('#taActionRequired').val().trim() == "") {
        $('#taActionRequired').css('border-color', '#ea090970');
        $('#taActionRequired').css('box-shadow', '0px 1px 2.5px #e36033d9');
        isValid = false;
    }
    else {
        $('#taActionRequired').css('border-color', 'lightgrey');
        $('#taActionRequired').css('box-shadow', '');
    }

    //if ($('#ddlTaggedPerson option:selected').val() == '0') {
    //    if ($('#taTaggedOther').val().trim() == "") {
    //        $('#taTaggedOther').css('border-color', '#ea090970');
    //        $('#taTaggedOther').css('box-shadow', '0px 1px 2.5px #e36033d9');
    //        isValid = false;
    //    }
    //    else {
    //        $('#taTaggedOther').css('border-color', 'lightgrey');
    //        $('#taTaggedOther').css('box-shadow', '');
    //    }
    //}
    if ($('#ddlTaggedPerson option:selected').val() == '0') {
        if ($('#ddlEmpListForUnderRisk').val().trim() == "-1") {
            $('#select2-ddlEmpListForUnderRisk-container').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
            //$('#ddlEmpListForUnderRisk').css('border-color', '#ea090970');
            //$('#ddlEmpListForUnderRisk').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#select2-ddlEmpListForUnderRisk-container').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        }
    }

    return isValid;
}

function updateOppotunity(loggedInUserRole, isURisk) {


    $.ajax({
        url: "../Calendar/CalendarMaster.aspx/UpdateOpportunity",
        data: JSON.stringify({ 'LoggedInUserRole': loggedInUserRole, 'OptNo': selOptNumber, 'Remarks': selOptRemarks, 'Overview': selOptOverview, 'WinPerc': selWinPerc, 'UserId': currUserId, "IsUnderRisk": isURisk, "RolesList": rolesList }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('.tbody-pay-sch tr').length > 0 ? objOptDT.destroy() : '';
            toastr.success('Updated successfully', '');
            loadOppOnly();
            loadOppGrid();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}