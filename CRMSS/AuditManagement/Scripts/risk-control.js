var listRiskAct = [], listAddedRiskAct = [];
var objDatatableRiskControl = [], objDatatableAddedRiskControl = [];
var calEventsRisk = [];
var selRiskControlsIds = '';
var selRiskControlsIdsList = [];
var selAddedRiskId = [], selAddedRiskObj = [];
var selPageRiskId = [], selPageRiskObj = [];
$(document).ready(function () {
    
    loadPageRiskList();
    renderPageRiskListTable();

    resetControls();


})


function loadPageRiskList() {
    $.ajax({
        url: "AuditRiskControl.aspx/GetAllRiskList",
        //data: JSON.stringify({ 'AuditId': selAudActObj[0].AuditId }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listRiskAct = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiatePageRiskListDataTable() {
    objDatatableRiskControl = [];
    objDatatableRiskControl = $('.rcm-page-list').DataTable({
        dom: 'lBfrtip',
        "bStateSave": true,
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa-solid fa-file-excel" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '

                }
            ]
        },

        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true
    });

}

function renderPageRiskListTable() {
    var htm = '';
    $('.rcm-page-list-tbody td').length > 0 ? objDatatableRiskControl.destroy() : '';
    //var memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;

    $.each(listRiskAct, function (key, item) {

        htm += `<tr> 
                    <td> <span class="badge badge-for-taskcode"> RC-`+ item.RiskId + ` </span> </td>
                    <td class="rscroll"> <div> `+ item.MajorProcess + `</div></td>
                    <td class="rscroll"> <div> `+ item.ProcessName + ` </div></td>
                    <td class="rscroll"> <div>`+ item.ProcessDesc + ` </div></td>
                    <td class="rscroll"> <div> `+ item.RiskName + ` </div></td>
                    <td class="rscroll"> <div>`  + item.RiskImpact + ` </div></td>
                    <td class="rscroll"> <div>`  + item.RiskLikelihood + ` </div></td>
                    <td class="rscroll"> <div>`  + item.RiskOccResp + `</div> </td>
                    <td class="rscroll"> <div>`  + item.RiskDesc + ` </div></td>
                    <td class="rscroll"> <div>`  + item.ControlName + ` </div></td>
                    <td class="rscroll"> <div>`  + item.ControlObjctv + `</div> </td>
                    <td class="rscroll"> <div>`  + item.ControlDesc + ` </div></td>
                    <td>
                    <span style="margin-left: 4%;"> <i class="bx bxs-edit fa-icon-hover ibtn-risk-edit" title="Edit Risk Control" data-riskid="`+ item.RiskId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                    <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-risk-delete-onpage" title="Delete Risk Control" data-riskid="`+ item.RiskId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
                    
                    </td>`

        htm += `</tr>`
    });
    $('.rcm-page-list-tbody').html(htm);
    initiatePageRiskListDataTable();
    //$(".dataTables_filter").find("label").text() == 'Search:';
    //$(".dataTables_filter label").append("<i class='fa-solid fa-magnifying-glass'></i>");

}

$('.rcm-page-list-tbody').on('click', '.ibtn-risk-edit,.ibtn-risk-delete-onpage', function () {

    let selPageRiskId = $(this).data('riskid');
    selPageRiskObj = listRiskAct.filter(s => s.RiskId == selPageRiskId);

    let selAction = $(this)[0].title.trim();

    if (selAction == "Delete Risk Control") {
        $('#deleteModal').modal('show');
        $('.btn-delete-y').text("Delete Risk Control");
        $('.dSentence').html('Do you want to delete risk control : <b>' + selPageRiskObj[0].RiskName + "</b> ?");
        $('.btn-delete-y').on('click', function () {
            DeleteRiskonPage(selPageRiskObj);
        });
    }
    else if (selAction == "Edit Risk Control") {

        $('#txtMajPrc,#txtPrcName,#taPrcDesc,#txtRiskName,#taRiskDesc,#txtRiskOccRes,#ddlRiskImpact,#ddlRiskLikelihood,#txtContName,#txtContObj,#taContDesc').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });

        $('#txtMajPrc').val(selPageRiskObj[0].MajorProcess);
        $('#txtPrcName').val(selPageRiskObj[0].ProcessName);
        $('#taPrcDesc').val(selPageRiskObj[0].ProcessDesc);
        $('#txtRiskName').val(selPageRiskObj[0].RiskName);
        $('#taRiskDesc').val(selPageRiskObj[0].RiskDesc);
        $('#txtRiskOccRes').val(selPageRiskObj[0].RiskOccResp);
        $('#ddlRiskImpact').val(selPageRiskObj[0].RiskImpact);
        $('#ddlRiskLikelihood').val(selPageRiskObj[0].RiskLikelihood);
        $('#txtContName').val(selPageRiskObj[0].ControlName);
        $('#txtContObj').val(selPageRiskObj[0].ControlObjctv);
        $('#taContDesc').val(selPageRiskObj[0].ControlDesc);

        $('#CreateRiskModal').modal('show');
        $('.btnCreateRisk').html('Update');
        $('#lblcreateriskModal').html('Update Risk');

    }
})


function loadRiskList() {
    $.ajax({
        url: "AuditRiskControl.aspx/GetAllRiskList",
        //data: JSON.stringify({ 'AuditId': selAudActObj[0].AuditId }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listRiskAct = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateRiskListDataTable() {
    objDatatableRiskControl = [];
    objDatatableRiskControl = $('.rcm-list').DataTable({
        dom: 'lBfrtip',
        "bStateSave": true,
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa-solid fa-file-excel" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '

                }
            ]
        },

        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true
    });

}

function renderRiskListTable() {
    var htm = '';
    $('.rcm-list-tbody td').length > 0 ? objDatatableRiskControl.destroy() : '';
    //var memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;

    $.each(listRiskAct, function (key, item) {

        htm += `<tr> 
                    <td><input type='checkbox' class="cbcontrolid" data-riskcontrolid=`+ item.RiskId + ` value='` + item.RiskId + `'></input></td>
                    <td> <span class="badge badge-for-taskcode"> `+ item.RCMRefCode + ` </span> </td>
                    
                    <td class="rscroll"> <div>  `+ item.RiskName + ` </div></td>
                    <td class="rscroll"> <div> `  + item.RiskDesc + ` </div></td>
                    <td class="rscroll"> <div> `  + item.RiskImpact + ` </div></td>
                    <td class="rscroll"> <div> `  + item.RiskLikelihood + ` </div></td>
                    <td class="rscroll"> <div> `  + item.RiskOccResp + ` </div></td>
                    <td class="rscroll"> <div> `  + item.ControlName + ` </div></td>
                    <td class="rscroll"> <div> `  + item.ControlDesc + ` </div></td>
                    <td class="rscroll"> <div> `  + item.ControlObjctv + ` </div></td>`

        htm += `</tr>`
    });
    $('.rcm-list-tbody').html(htm);
    initiateRiskListDataTable();
    //$(".dataTables_filter").find("label").text() == 'Search:';
    //$(".dataTables_filter label").append("<i class='fa-solid fa-magnifying-glass'></i>");

}


function AddRisk() {
    selRiskControlsIdsList = [];
    $('#AddRiskModal').modal('show');
    $('.btnAddAuditRisk').html('Add');
    $('#lbladdRiskModal').html('Add New Risk');
}
$('.btn-add-risk-grid').on('click', function () {
    selRiskControlsIdsList = [];
    $('#AddRiskModal').modal('show');
    $('.btnAddAuditRisk').html('Add');
    $('#lbladdRiskModal').html('Add New Risk');
})

$('.rcm-list-tbody').on('click', '.cbcontrolid', function () {
    selRiskControlsIds = '';

    if ($(this).is(':checked')) {
        selRiskControlsIdsList.push($(this).val());
        $.each(selRiskControlsIdsList, function (key, item) {
            selRiskControlsIds += item + ',';
        });
        selRiskControlsIds = removeCommaFromLast(selRiskControlsIds)
    } else {

        var removeItem = $(this).val();
        selRiskControlsIdsList = jQuery.grep(selRiskControlsIdsList, function (value) {
            return value != removeItem;
        });

        $.each(selRiskControlsIdsList, function (key, item) {
            selRiskControlsIds += item + ',';
        });
        selRiskControlsIds = removeCommaFromLast(selRiskControlsIds)
    }

})

$('.btnAddAuditRisk').on('click', function () {
    AddRiskIds();
})

function AddRiskIds() {
    $.ajax({
        url: "AuditRiskControl.aspx/SetAllRiskIds",
        data: JSON.stringify({ 'AuditId': selAudActObj[0].AuditId, 'RiskId': selRiskControlsIds }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Risk(s) has been added successfully');
            $('#AddRiskModal').modal('hide');
            loadAddedRiskList();
            renderAddedRiskListTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadAddedRiskList() {
    $.ajax({
        url: "AuditRiskControl.aspx/GetAllRiskIds",
        data: JSON.stringify({ 'AuditId': selAudActObj[0].AuditId }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listAddedRiskAct = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function initiateAddedRiskListDataTable() {
    objDatatableAddedRiskControl = [];
    objDatatableAddedRiskControl = $('.rcm-added-list').DataTable({
        dom: 'lBfrtip',
        "bStateSave": true,
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa-solid fa-file-excel" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },

        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true
    });

}

function renderAddedRiskListTable() {
    var htm = '';
    $('.rcm-added-list-tbody td').length > 0 ? objDatatableAddedRiskControl.destroy() : '';
    //var memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;

    $.each(listAddedRiskAct, function (key, item) {

        htm += `<tr> 
                    <td> <span class="badge badge-for-taskcode"> `+ item.RCMRefCode + ` </span> </td>
                    <td class="rscroll"> <div>  `+ item.MajorProcess + ` </div></td>
                    <td class="rscroll"> <div>  `+ item.ProcessName + ` </div></td>
                    <td class="rscroll"> <div>  `+ item.ProcessDesc + ` </div></td>
                    <td class="rscroll"> <div>  `+ item.RiskName + ` </div></td>
                    <td class="rscroll"> <div> `  + item.RiskDesc + ` </div></td>
                    <td class="rscroll"> <div> `  + item.RiskImpact + ` </div></td>
                    <td class="rscroll"> <div> `  + item.RiskLikelihood + ` </div></td>
                    <td class="rscroll"> <div> `  + item.RiskOccResp + ` </div></td>
                    <td class="rscroll"> <div> `  + item.ControlName + ` </div></td>
                    <td class="rscroll"> <div> `  + item.ControlDesc + ` </div></td>
                    <td class="rscroll"> <div> `  + item.ControlObjctv + ` </div></td>
                    <td>
                    <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-risk-delete" title="Delete Risk" data-riskid="`+ item.RiskId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
                    </td>`

        htm += `</tr>`
    });
    $('.rcm-added-list-tbody').html(htm);
    initiateAddedRiskListDataTable();
    //$(".dataTables_filter").find("label").text() == 'Search:';
    //$(".dataTables_filter label").append("<i class='fa-solid fa-magnifying-glass'></i>");

}

$('.rcm-added-list-tbody').on('click', '.ibtn-risk-delete', function () {

    let selAddedRiskId = $(this).data('riskid');
    selAddedRiskObj = listAddedRiskAct.filter(s => s.RiskId == selAddedRiskId);

    let selAction = $(this)[0].title.trim();

    if (selAction == "Delete Risk") {
        deletebyModule("Delete Risk");
    }
})

function Faddedrisk(AddedtoAuditid){
    $('#deleteModal').modal('show');
    $('.btn-delete-y').text("Delete Risk");
    $('.dSentence').html('Do you want to delete risk : <b>' + selAddedRiskObj[0].RiskName + "</b> ?");
    $('.btn-delete-y').on('click', function () {
        deleteAddedRisk(selAddedRiskObj, AddedtoAuditid);
    });
}

function deleteAddedRisk(selAddedRiskObj, AddedtoAuditid) {
    $.ajax({
        url: "AuditRiskControl.aspx/DeleteAddedRisk",
        data: JSON.stringify({ 'RiskId': selAddedRiskObj[0].RiskId, 'AuditId': AddedtoAuditid }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            
            toastr.success('Risk Deleted from the Audit Successfully');
            $('#deleteModal').modal('hide');
            loadAddedRiskList();
            renderAddedRiskListTable();
            $('.btn-delete-y').unbind();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#btncreateriskgrid').on('click', function () {
    $('#CreateRiskModal').modal('show');
    $('.btnCreateRisk').html('Create');
    $('#lblcreateriskModal').html('Create New Risk');
    resetControls();
})

$('.btnCreateRisk').on('click', function () {

    if (!validateTaskControlsforRisk()) {
        toastr.error(msgForTaskIfValidFailed, '');
    }
    else {

        if ($('.btnCreateRisk').text().trim() == 'Update') {
            objCreateRiskControl = {
                "RiskId": selPageRiskObj[0].RiskId,
                "RCMRefCode": selPageRiskObj[0].RCMRefCode,
                "MajorProcess": $('#txtMajPrc').val().trim(),
                "ProcessName": $('#txtPrcName').val().trim(),
                "ProcessDesc": $('#taPrcDesc').val().trim(),
                "RiskName": $('#txtRiskName').val().trim(),
                "RiskDesc": $('#taRiskDesc').val().trim(),
                "RiskOccResp": $('#txtRiskOccRes').val().trim(),
                "RiskImpact": $('#ddlRiskImpact option:selected').val() == undefined ? "" : $('#ddlRiskImpact option:selected').val(),
                "RiskLikelihood": $('#ddlRiskLikelihood option:selected').val() == undefined ? "" : $('#ddlRiskLikelihood option:selected').val(),
                "ControlName": $('#txtContName').val().trim(),
                "ControlObjctv": $('#txtContObj').val().trim(),
                "ControlDesc": $('#taContDesc').val().trim(),
                "USerID": currUserId,
                "CreatedBy": selPageRiskObj[0].OwnerEmpNo,
                "CreatedDate": selPageRiskObj[0].CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selPageRiskObj[0].CreatedDate.replaceAll('/', '-').split(':')[1],
                "UpdatedBy": EmpNo,
                "UpdatedDate": getCurrentDate()

             
            }
            CreateRiskonPage('Risk Control Updated Successfully');
        } else {
            objCreateRiskControl = {
                "RiskId": 0,
                "RCMRefCode": '',
                "MajorProcess": $('#txtMajPrc').val().trim(),
                "ProcessName": $('#txtPrcName').val().trim(),
                "ProcessDesc": $('#taPrcDesc').val().trim(),
                "RiskName": $('#txtRiskName').val().trim(),
                "RiskDesc": $('#taRiskDesc').val().trim(),
                "RiskOccResp": $('#txtRiskOccRes').val().trim(),
                "RiskImpact": $('#ddlRiskImpact option:selected').val() == undefined ? "" : $('#ddlRiskImpact option:selected').val(),
                "RiskLikelihood": $('#ddlRiskLikelihood option:selected').val() == undefined ? "" : $('#ddlRiskLikelihood option:selected').val(),
                "ControlName": $('#txtContName').val().trim(),
                "ControlObjctv": $('#txtContObj').val().trim(),
                "ControlDesc": $('#taContDesc').val().trim(),
                "USerID": currUserId,
                "CreatedBy": EmpNo,
                "CreatedDate": getCurrentDate(),
                "UpdatedBy": '',
                "UpdatedDate": ''
            }
            CreateRiskonPage('Risk Control Created Successfully');
        }

    }

});

function CreateRiskonPage(msg) {
    $.ajax({
        url: "AuditRiskControl.aspx/createUpdateAuditRisk",
        data: JSON.stringify({ 'data': objCreateRiskControl }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success(msg);
            $('#CreateRiskModal').modal('hide');
            loadPageRiskList();
            renderPageRiskListTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function DeleteRiskonPage(selPageRiskObj) {
    $.ajax({
        url: "AuditRiskControl.aspx/deleteRiskControl",
        data: JSON.stringify({ 'RiskId': selPageRiskObj[0].RiskId }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
           
            toastr.success('Risk Deleted from the Risk Control, Successfully');
            $('#deleteModal').modal('hide');
            loadPageRiskList();
            renderPageRiskListTable();
            $('.btn-delete-y').unbind();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function validateTaskControlsforRisk() {

    var isValid = true;
    msgForTaskIfValidFailed = 'Please Fill the Required Fields';

    if ($('#txtMajPrc').val().trim() == "") {
        $('#txtMajPrc').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtMajPrc').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#txtPrcName').val().trim() == "") {
        $('#txtPrcName').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtPrcName').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#taPrcDesc').val().trim() == "") {
        $('#taPrcDesc').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#taPrcDesc').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#ddlRiskImpact option:selected').val() == "None") {
        $('#ddlRiskImpact').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#ddlRiskImpact').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#ddlRiskLikelihood option:selected').val() == "None") {
        $('#ddlRiskLikelihood').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#ddlRiskLikelihood').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#txtRiskName').val().trim() == "") {
        $('#txtRiskName').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtRiskName').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#taRiskDesc').val().trim() == "") {
        $('#taRiskDesc').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#taRiskDesc').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#txtRiskOccRes').val().trim() == "") {
        $('#txtRiskOccRes').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtRiskOccRes').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#txtContName').val().trim() == "") {
        $('#txtContName').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtContName').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#txtContObj').val().trim() == "") {
        $('#txtContObj').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtContObj').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#taContDesc').val().trim() == "") {
        $('#taContDesc').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#taContDesc').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    return isValid;
}

function resetControls() {
    
    //create risk controls
    $('#txtMajPrc, #txtPrcName, #taPrcDesc, #txtRiskName, #taRiskDesc, #txtRiskOccRes, #txtContName, #txtContObj, #taContDesc').val('');
    $("#ddlRiskImpact").val($("#ddlRiskImpact option:first").val());
    $("#ddlRiskLikelihood").val($("#ddlRiskLikelihood option:first").val());

    selDatesArr = '';
    resetModal();
    resetAllControls();
}

function resetAllControls() {
    $('#txtMajPrc').css('border-color', 'lightgrey'); $('#txtMajPrc').css('box-shadow', '');
    $('#txtPrcName').css('border-color', 'lightgrey'); $('#txtPrcName').css('box-shadow', '');
    $('#taPrcDesc').css('box-shadow', ''); $('#taPrcDesc').css('border-color', 'lightgrey');
    $('#txtRiskName').css('border-color', 'lightgrey'); $('#txtRiskName').css('box-shadow', '');
    $('#taRiskDesc').css('box-shadow', ''); $('#taRiskDesc').css('border-color', 'lightgrey');
    $('#txtRiskOccRes').css('border-color', 'lightgrey'); $('#txtRiskOccRes').css('box-shadow', '');
    $('#txtContName').css('box-shadow', ''); $('#txtContName').css('border-color', 'lightgrey');
    $('#txtContObj').css('border-color', 'lightgrey'); $('#txtContObj').css('box-shadow', '');
    $('#taContDesc').css('box-shadow', ''); $('#taContDesc').css('border-color', 'lightgrey');
    $('#ddlRiskImpact').css('border-color', 'lightgrey'); $('#ddlRiskImpact').css('box-shadow', '');
    $('#ddlRiskLikelihood').css('box-shadow', ''); $('#ddlRiskLikelihood').css('border-color', 'lightgrey');
}

function resetModal() {

    $('#EventModal li button').removeClass('active')
    $('#EventModal li:eq(0) button').addClass('active')


    $('#EventModal .tab-content .tab-pane').removeClass('active show')
    $('#EventModal .tab-content .tab-pane:eq(0)').addClass('active show')
}

function removeCommaFromLast(sValue) {
    if (sValue.length == 1) {
        return sValue;
    } else {
        return sValue.substr(0, sValue.length - 1);
    }

}

function getCurrentDate() {
    return new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate()
}