/*
 * ******************************JS structure <starts>*************************************
 *
 */
var selRequest = [];
var objStructure = [], objFloors = [];
var floortypecount = 0;
var objdatatableStructure = [];
var selStructId = 0;
var listStructureDeets = [], listStructureBasic = [];
var listStructureBasic = [], listReqStructFloors = [];

$(document).ready(function () {

});

function selectedReq(selReqId) {
    selRequest = selReqId;
}

$('#flexCheckBasement').on('change', function () {

    if ($("#flexCheckBasement").is(':checked') == true) {
        $(".bsmntFloor").removeAttr('disabled');
        $(".bsmntFloor").attr('checked');
        floortypecount = floortypecount + 1;
    }
    else {
        $("#flexCheckBasement").attr('unchecked');
        $(".bsmntFloor").prop('disabled', true);
        floortypecount = floortypecount - 1;
    }
});

$('#flexCheckParking').on('change', function () {

    if ($("#flexCheckParking").is(':checked') == true) {
        $(".parkFloor").removeAttr('disabled');
        floortypecount = floortypecount + 1;
    }
    else {
        $("#flexCheckParking").attr('unchecked');
        $(".parkFloor").prop('disabled', true);
        floortypecount = floortypecount - 1;
    }
});

$('#flexCheckNormal').on('change', function () {

    if ($("#flexCheckNormal").is(':checked') == true) {
        $(".normalFloor").removeAttr('disabled');
        floortypecount = floortypecount + 1;
    }
    else {
        $("#flexCheckNormal").attr('unchecked');
        $(".normalFloor").prop('disabled', true);
        floortypecount = floortypecount - 1;
    }
});

$('#flexCheckTerrace').on('change', function () {

    if ($("#flexCheckTerrace").is(':checked') == true) {
        $(".terrFloor").removeAttr('disabled');
        floortypecount = floortypecount + 1;
    }
    else {
        $("#flexCheckTerrace").attr('unchecked');
        $(".terrFloor").prop('disabled', true);
        floortypecount = floortypecount - 1;
    }
});


var buildingFloorArr = []; finalPara = [];
$('.btnSaveItem').on('click', function () {
    buildingFloorArr = [];
    $('#mainFloorTypes .mainFloorSub input[type=checkbox]:checked').each(function (key, item) {
        let bItem = {};
        bItem["FloorType"] = item.value;
        bItem["NoOfFloors"] = $(item).parent().parent().children().eq(1).children().val()
        bItem["OrderNo"] = $(item).parent().parent().children().eq(2).children().val()

        buildingFloorArr.push(bItem);
    });

    finalPara = {
        'oListBuilFloor': buildingFloorArr
    }

    if (!validateTaskControls()) {
        toastr.error(msgIfValidFailed, '');
    }
    else {
        AddStructure();

    }
});

function AddStructure() {

    $.ajax({
        url: "EMSItemList.aspx/AddStructure",
        data: JSON.stringify({
            "ReqID": selRequest[0].ReqId,
            "UserID": currUserId,
            "prjNumber": selRequest[0].ProjectNumber,
            "Name": $('#stcName').val().trim(),
            "Desc": $('#stcDesc').val().trim(),
            "TotalNumberofFloor": $('#stcCount').val().trim(),
            'data': finalPara
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //toastr.success(msg, '');s
            //$('#addReqModal').modal('hide');
            selStructId = result.d;
            restControls();
            ViewStructure();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$('#nav-Structure-tab').on('click', function () {
    ViewStructure();
});
function ViewStructure() {

    $.ajax({
        url: "EMSItemList.aspx/ViewStructure",
        data: JSON.stringify({
            "RequestID": selRequest[0].ReqId,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listStructureBasic = result.d.listReqMaster;
            listReqStructFloors = result.d.listReqStructFloors;

            var htm = '';
            //  $('.tbody-Structure td').length > 0 ? objdatatableStructure.destroy() : '';

            $.each(listStructureBasic, function (key, item) {


                htm += `<div class="accordion-item">
                            <div class="card">
                                <h2 class="card-header" id="heading`+ item.prjNumber + `-` + item.StructureID + `">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse` + item.StructureID + `" aria-expanded="false" aria-controls="collapse` + item.StructureID + `" style="color: #000000;text-transform: capitalize;">` + (key + 1) + `.  ` + item.StructureName + `<span class="position-absolute" style="right: 80px;"> Total Floors:  ` + item.TotalNumberOfFloor + `</span></button>
                                 </h2>

                                 <div id="collapse` + item.StructureID + `" class="accordion-collapse collapse show" aria-labelledby="heading` + item.prjNumber + `-` + item.StructureID + `" data-bs-parent="#accordionStructure">
                                    <div class="card-body">
                                    
                                        <div class="row">

                                            <div class="col-12">
                                                <button type="button" class="btn btn-primary btnAddTypical float-right" style="" onclick="openTypicalModal(` + selRequest[0].ReqId + `,` + item.StructureID + `)">Add Typical Floors</button>
                                            </div>

                                            <div class="col-1">
                                                <div class="table">
                                                    <table class="table project-table table-Structure">
                                                        <tbody>
                                                            <tr>
                                                                <td  class="fw-bold"> Floor Name</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="fw-bold"> Floor Type</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="fw-bold"> Typical</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="fw-bold"> Typical Of</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="col-11">
                                                <div class="table" style="overflow-x: scroll;">
                                                    <table class="table project-table d-flex">
                                                    `+ ViewStructureDeets(item.StructureID) + `
                                                    </table>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                        
                        </div>`
                
                // htm += `</tr>`;
            });
            $('#accordionStructure').html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function openTypicalModal(reqid, structid) {

    selReqId = reqid;
    selStructId = structid;

    var stRes = listReqStructFloors.filter(s => s.StructureID == selStructId);
    let distinctFloorTypeArr = stRes.map(item => item.Type).filter((value, index, self) => self.indexOf(value) === index);
    fillFloorTypeDDL(distinctFloorTypeArr);


    $('#tagFloorTypical').modal('show');
    $('#tagFloorTypicalLabel').html('Typical Floor - ' + listStructureBasic.filter(s => s.StructureID == selStructId)[0].StructureName);

}
$('#cbIsTypical').on('click', function () {
    // $('#cbIsTypical').is(':checked') == true ? $('#ddlFloorMaster').prop('disabled', false) : $('#ddlFloorMaster').prop('disabled', true);

    var ids = '';
    let start = $('#ddlFloorFrom option:selected').text().trim() - 1;
    let end = $('#ddlFloorTo option:selected').text().trim() - 1;
    for (var i = start; i <= end; i++) {
        ids += $('#ddlFloorFrom option:eq(' + i + ')').val() + ",";
    }
    ids = removeCommaFromLast(ids);

})

function fillFloorTypeDDL(typeArr) {
    var htm = '';
    $.each(typeArr, function (key, item) {
        htm += '<option value="' + item + '"> ' + item + ' </option>'
    });
    $('#ddlFloorType').html(htm);
    $('#ddlFloorType').trigger('change');
}

$('#ddlFloorType').on('change', function (a, b) {

    let selFlrType = $('#ddlFloorType option:selected').val();
    var res = listReqStructFloors.filter(s => s.StructureID == selStructId && s.Type == selFlrType);

    var htm = '';
    $.each(res, function (key, item) {
        htm += '<option value="' + item.StructFloorDetId + '"> ' + (key + 1) + ' </option>'
    });
    $('#ddlFloorFrom').html(htm);
    $('#ddlFloorTo').html(htm);
    $('#ddlFloorMaster').html(htm);

    $('#ddlFloorTo').val($('#ddlFloorTo option:eq(' + ($('#ddlFloorTo option').length - 1) + ')').val());

    $('#ddlFloorFrom').trigger('change');
});

$('#ddlFloorFrom,#ddlFloorTo,#ddlFloorMaster').on('change', function (a, b) {
    let selFlrType = $('#ddlFloorType option:selected').val();
    var filteredRec = [];

    let start = $('#ddlFloorFrom option:selected').text().trim() - 1;
    let end = $('#ddlFloorTo option:selected').text().trim() - 1;
    for (var i = start; i <= end; i++) {
        filteredRec.push(listReqStructFloors.filter(s => s.StructFloorDetId == $('#ddlFloorFrom option:eq(' + i + ')').val()));
    }

    var htm = '';
    $.each(filteredRec, function (key, item) {
        let attr = item[0].IsTypical == "True" ? "checked" : "";
        htm += `<tr>
                    <td> 
                        <div style="display: flex;justify-content: center;">
                            <input class="form-check-input position-relative" type="checkbox" name="cbIsTypical" value="`+ item[0].StructFloorDetId + `" id="cbTypical-` + item[0].StructFloorDetId + `" ` + attr + `> 
                        </div>
                    </td>                 
                    <td> `+ item[0].Name + ` </td>                 
                    <td> `+ item[0].Type + `</td>
                    <td> `+ item[0].TypicalOf + `</td>`

        htm += `</tr>`;
    });
    $('.tbody-temp-sel-typifloor').html(htm);

});

function generateHTMLforFilteredFloor() {

}

$('.btnUpdateTypicalFloors').on('click', function () {
    let ids = '';
    $('.tbody-temp-sel-typifloor input[name=cbIsTypical]:checked').each(function (key, item) {
        ids += item.value + ",";
    });
    ids = removeCommaFromLast(ids);
    updateFloorsAsTypical(ids);
});

function updateFloorsAsTypical(strctids) {

    $.ajax({
        url: "EMSItemList.aspx/UpdateFloorsAsTypical",
        data: JSON.stringify({
            "StrctDetIds": strctids,
            "MasterFloor": $('#ddlFloorMaster option:selected').text().trim(),
            "FloorType": $('#ddlFloorType option:selected').val().trim()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//function generateHTMLForStruct() {
//    var htm = '';
//    //$('.tbody-Structure td').length > 0 ? objdatatableStructure.destroy() : '';

//    var res = listReqStructFloors.filter(xx => xx.StructureID == strctid);
//    $.each(res, function (key, item) {

//        htm += `<tr>
//                    <td> `+ item.Name + ` </td>                 
//                    <td> `+ item.Type + `</td>
//                    <td> `+ item.IsTypical + `</td>
//                    <td> `+ item.TypicalOf + `</td>`

//        htm += `</tr>`;
//    });
//    $('.tbody-Structure').html(htm);

//}

function ViewStructureDeets(strctid) {
    var htm = '';
    //$('.tbody-Structure td').length > 0 ? objdatatableStructure.destroy() : '';

    var res = listReqStructFloors.filter(xx => xx.StructureID == strctid);

    $.each(res, function (key, item) {
        if (item.IsTypical == '') {
            item.IsTypical = '-'
        }
        if (item.TypicalOf == '') {
            item.TypicalOf = '-'
        }
        htm += `
                <tbody class="text-nowrap" style="width:100px;float: left; margin-right:0px">
                    <tr style="width:100px;"><td class="fw-bold" style="width:100px;">`+ item.Name + `</th></tr>
                    <tr style="width:100px;"><td style="width:100px;"> `+ item.Type + `</td></tr>
                    <tr style="width:100px;"><td style="width:100px;"> `+ item.IsTypical + `</td></tr>
                    <tr style="width:100px;"><td style="width:100px;"> `+ item.TypicalOf + `</td></tr>
                </tbody>`

        htm += `</tr>`;
    });
    return htm;

    //$('.tbody-Structure').html(htm);


}

function datatableStructure() {
    objdatatableStructure = [];
    objdatatableStructure = $('.table-Structure').DataTable({
        dom: 'lBfrtip',
        "bStateSave": true,
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },

        "columnDefs": [
            { width: "50px", targets: [0] },
            { orderable: false, targets: [0] }
        ],
        paging: false
        //select: true,
        //colReorder: true
    });
}

function validateTaskControls() {
    var msgIfValidFailed = true
    return msgIfValidFailed;
}
function restControls() {
    return true;

}