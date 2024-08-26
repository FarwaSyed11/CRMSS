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
var FloorTypesArr = [];
var checkFlrCount = 0;

var selOldRequestId = 0, selOldStructId = 0;
var listStructureBasicCopy = [];
var listReqStructFloorsCopy = [];
var listAllReqscopy = [];
var oper = 0;

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

$('.btnAddStructure').on('click', function () {
    resetStructureControls();
    selStructId = 0;
    $("#lblModalAddStructure").html('Create Structure Main Details');
    $(".btnSaveItem").html('Create');
    $("#ModalAddStructure").modal('show');
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
        toastr.error("Please input the mandatory field(s)", '');
    }
    else {

        if ($(".btnSaveItem").html().trim() == "Create") {
            AddStructure();
        }
        else if ($(".btnSaveItem").html().trim() == "Update")
        {
            AddStructure();
        }

        

    }
});

function AddStructure() {

    $.ajax({
        url: "EMSItemList.aspx/AddStructure",
        data: JSON.stringify({
            "StructId": selStructId,
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
            toastr.success('Structure added successfully.', '');
            $('#ModalAddStructure').modal('hide');
            selStructId = result.d;
            
            ViewStructure();
            generateHTMLForStruct();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$('#nav-Structure-tab').on('click', function () {
    ViewStructure();
    generateHTMLForStruct();
});
function ViewStructure() {

    $.ajax({
        url: "EMSItemList.aspx/ViewStructure",
        data: JSON.stringify({
            "RequestID": selRequest[0].ReqId,
            "UserId": currUserId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listStructureBasic = result.d.listReqMaster;
            listReqStructFloors = result.d.listReqStructFloors;
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function generateHTMLForStruct(){
    var htm = '';
    //  $('.tbody-Structure td').length > 0 ? objdatatableStructure.destroy() : '';
    var res = listAllReqs.filter(s => s.ReqId == selReqId);
    $.each(listStructureBasic, function (key, item) {


        htm += `<div class="accordion-item">
                            <div class="card">`
        //if (res[0].EstimationStatus.toUpperCase() != "RELEASED") {
        //    htm += `<div class="col-12">
        //                <button type="button" class="btn btn-primary btnAddTypical float-right" style="width: 124px;font-size: 12px;" onclick="openTypicalModal(` + selRequest[0].ReqId + `,` + item.StructureID + `)">Add Typical Floors</button>
        //            </div>`
        //}
        htm +=`<h2 class="card-header" id="heading`+ item.prjNumber + `-` + item.StructureID + `">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse` + item.StructureID + `" aria-expanded="false" aria-controls="collapse` + item.StructureID + `" style="color: #000000;text-transform: capitalize;">` + (key + 1) + `.  ` + item.StructureName + `<span class="position-absolute" style="right: 80px;"> Total Floors:  ` + item.TotalNumberOfFloor + `</span>`
        if (res[0].EstimationStatus.toUpperCase() != "RELEASED") {
            htm += `<span class="position-absolute" style="right: 214px;"> <i class="bx bx-edit-alt struct-edit" style="color:#1eb0d0;font-size: 1.9rem;" onclick="openModalEditStruct(` + item.StructureID + `)"></i></span>`
        }
        htm += `</button> </h2>`

                               htm +=`<div id="collapse` + item.StructureID + `" class="accordion-collapse collapse show" aria-labelledby="heading` + item.prjNumber + `-` + item.StructureID + `" data-bs-parent="#accordionStructure">
                                    <div class="card-body">
                                    
                                        <div class="row">`
        if (res[0].EstimationStatus.toUpperCase() != "RELEASED") {
            htm += `<div class="col-12">
                        <button type="button" class="btn btn-primary btnAddTypical float-right" style="width: 124px;font-size: 12px;" onclick="openTypicalModal(` + selRequest[0].ReqId + `,` + item.StructureID + `)">Add Typical Floors</button>
                    </div>`
        }
                                            

                                            htm +=`<div class="col-1">
                                                <div class="table">
                                                    <table class="table project-table table-Structure">
                                                        <tbody>
                                                            <tr>
                                                                <td class="fw-bold"> Floor Name</td>
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
}
function checkFloorCount() {

    $.ajax({
        url: "EMSItemList.aspx/ValidateStructureEditOption",
        data: JSON.stringify({
            "ReqId": selReqId,
            "StructureId": selStructId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            checkFlrCount = result.d[0].Value;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function openModalEditStruct(strid) {
    resetStructureControls()

    selStructId = strid;

    checkFloorCount();
    if (checkFlrCount > 0) {
        toastr.error('This structure have floor added, Remove floors before edit the structure.', '')
    }
    else {
        var stDets = listStructureBasic.filter(s => s.StructureID == selStructId);
        $("#stcName").val(stDets[0].StructureName);
        $("#stcCount").val(stDets[0].TotalNumberOfFloor);
        $("#stcDesc").val(stDets[0].StructureDesc);

        var floors = listReqStructFloors.filter(s => s.StructureID == selStructId);
        let distinctFloorTypeArr = floors.map(item => item.Type).filter((value, index, self) => self.indexOf(value) === index);

        for (var i = 0; i < distinctFloorTypeArr.length; i++) {
            var res = listReqStructFloors.filter(s => s.Type == distinctFloorTypeArr[i] && s.StructureID == selStructId);
            //var objC = $("#mainFloorTypes .mainFloorSub input[type=checkbox][value=" + res[0].Type + "]").parent().parent().children().eq(1).children();

            $("#mainFloorTypes .mainFloorSub input[type=checkbox][value=" + res[0].Type + "]").prop('checked', true);
            //$(objC).prop('disabled', false)
            $("#mainFloorTypes .mainFloorSub input[type=checkbox][value=" + res[0].Type + "]").parent().parent().children().eq(1).children().prop('disabled', false);
            $("#mainFloorTypes .mainFloorSub input[type=checkbox][value=" + res[0].Type + "]").parent().parent().children().eq(2).children().prop('disabled', false);

            $("#mainFloorTypes .mainFloorSub input[type=checkbox][value=" + res[0].Type + "]").parent().parent().children().eq(1).children().val(res.length);
            $("#mainFloorTypes .mainFloorSub input[type=checkbox][value=" + res[0].Type + "]").parent().parent().children().eq(2).children().val(res[0].OrderNo);
            //$(objC).val(res.length);
            //$(objC).val(res[0].OrderNo);
        }

        $("#lblModalAddStructure").html('Update Structure Main Details');
        $(".btnSaveItem").html('Update');
        $("#ModalAddStructure").modal('show');
    }
    
}
function openTypicalModal(reqid, structid) {

    $("#cbTypicalALL").prop('checked', false)

    selReqId = reqid;
    selStructId = structid;

    var stRes = listReqStructFloors.filter(s => s.StructureID == selStructId);
    let distinctFloorTypeArr = stRes.map(item => item.Type).filter((value, index, self) => self.indexOf(value) === index);
    fillFloorTypeDDL(distinctFloorTypeArr);

    $(".temp-sel-typifloor-table-div").css('border', 'lightgrey');
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
        if ($('#ddlFloorFrom option:eq(' + i + ')').val() != $("#ddlFloorMaster option:selected").val()) {
            filteredRec.push(listReqStructFloors.filter(s => s.StructFloorDetId == $('#ddlFloorFrom option:eq(' + i + ')').val()));
        }
        
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

$("#cbTypicalALL").on('click', function () {
    if ($(this).is(':checked')) {
        $(".tbody-temp-sel-typifloor input[name=cbIsTypical]").prop('checked', true)
    } else {
        $(".tbody-temp-sel-typifloor input[name=cbIsTypical]").prop('checked', false)
    }
})
function generateHTMLforFilteredFloor() {

}

$('.btnUpdateTypicalFloors').on('click', function () {
    let ids = ''; let unSelectIds = '';
    $('.tbody-temp-sel-typifloor input[name=cbIsTypical]:checked').each(function (key, item) {
        ids += item.value + ",";
    });
    ids = removeCommaFromLast(ids);

    $('.tbody-temp-sel-typifloor input[name=cbIsTypical]:not(:checked)').each(function (key, item) {
        unSelectIds += item.value + ",";
    });
    unSelectIds = removeCommaFromLast(unSelectIds);

    if (ids == "") {
        toastr.error("Please select atleast one floor for typical from below grid.", '');
        $(".temp-sel-typifloor-table-div").css('border', '1px solid #ff4e4e');     
    }   
    else {
        updateFloorsAsTypical(ids, unSelectIds == "" ? 0 : unSelectIds);
        $(".temp-sel-typifloor-table-div").css('border', 'lightgrey');
    }
});

function updateFloorsAsTypical(strctids, structidsforunselect) {

    $.ajax({
        url: "EMSItemList.aspx/UpdateFloorsAsTypical",
        data: JSON.stringify({
            "StrctDetIds": strctids,
            "StrctDetIdsForUnSelect": structidsforunselect,
            "MasterFloor": $('#ddlFloorMaster option:selected').text().trim(),
            "FloorType": $('#ddlFloorType option:selected').val().trim()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success("Updated successfully", '');
            ViewStructure();
            generateHTMLForStruct();
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
       
        htm += `
                <tbody class="text-nowrap" style="width:100px;float: left; margin-right:0px">
                    <tr style="width:100px;"><td class="fw-bold" style="width:100px;">`+ item.Name + `</th></tr>
                    <tr style="width:100px;"><td style="width:100px;"> `+ item.Type + `</td></tr>
                    <tr style="width:100px;"><td style="width:100px;"> `+ (item.IsTypical == '' ? '-' : "<i class='bx bx-check' style='color: #38b316;'></i>") + `</td></tr>
                    <tr style="width:100px;"><td style="width:100px;"> `+ (item.TypicalOf == '' ? '-' : item.TypicalOf) + `</td></tr>
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

function OtherFloorType() {
    $("#txtFlrTypeName").val('');
    $("#txtFlrTypeAlias").val('');
    $("#AddFloorTypeModal").modal('show');
}
$("#txtFlrTypeName").on('keyup', function () {
    $("#txtFlrTypeAlias").val($("#txtFlrTypeName").val())
})
function AddMoreFloorType() {
    if ($("#txtFlrTypeName").val().trim() == "" && $("#txtFlrTypeAlias").val().trim() == "") {
        toastr.error("Please input Floor Name and Floor Alias")
    }
    else {
        $.ajax({
            url: "EMSItemList.aspx/AddFloorType",
            data: JSON.stringify({
                "FloorTypeName": $("#txtFlrTypeName").val().trim(),
                "FloorTypeAlias": $("#txtFlrTypeAlias").val().trim(),
                "ReqId": selReqId
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                if (result.d.ErrorType == "error") {
                    toastr.error(result.d.MsgText, '');
                } else {
                    toastr.success(result.d.MsgText, '');
                    getAllFloorTypes();
                    generateHTMLForFlrTypes();
                    openModalEditStruct(selStructId);
                }                
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });      
    }
    
}

function getAllFloorTypes() {
    $.ajax({
        url: "EMSItemList.aspx/GetAllFloorTypes",
        type: "POST",
        data: JSON.stringify({
            "UserId": currUserId,
            "ReqId": selReqId
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            FloorTypesArr = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });  
}
function generateHTMLForFlrTypes() {
    var htm = '';

    $.each(FloorTypesArr, function (key, item) {
        htm +=` <div class="mainFloorSub d-flex">
                                    <div class="form-check col-5 ps-5 ">
                                        <input class="form-check-input" name="cb-floors-type" type="checkbox" value="`+ item.Value + `" id="cbflrtype-` + key +`">
                                        <label class="form-check-label" for="cbflrtype-` + key +`">
                                            `+ item.Text +`
                                        </label>
                                    </div>
                                    <div class="col-4 mb-2">
                                        <input class="form-control" name="txtForFloorsTypes" type="number" min="0"  placeholder="enter floors..." disabled>
                                    </div>
                                    <div class="col-3 mb-2">
                                        <input class="form-control" name="txtForFloorsTypes" type="number" min="0" placeholder="order #..." disabled>
                                    </div>
                                </div>`
    });

    $("#mainFloorTypes").html(htm);
}

$("#mainFloorTypes").on('click','input[name=cb-floors-type]', function () {
        
    if ($(this).is(':checked')) {
        $(this).parent().parent().children().eq(1).children().prop('disabled', false)
        $(this).parent().parent().children().eq(2).children().prop('disabled', false)

        $(this).parent().parent().children().eq(1).children().val('')
        $(this).parent().parent().children().eq(2).children().val('')
    } else {
        $(this).parent().parent().children().eq(1).children().prop('disabled', true)
        $(this).parent().parent().children().eq(2).children().prop('disabled', true)

        $(this).parent().parent().children().eq(1).children().val('')
        $(this).parent().parent().children().eq(2).children().val('')
    }

})


$('.btn-imp-temp-grid').on('click', function () {
    getAllTemplates();
    $("#ImportTemptListModal").modal('show');
});

function getAllTemplates() {
       
        $.ajax({
            url: "EMSItemList.aspx/GetAllTemplates",
            data: JSON.stringify({
                "ReqId": selReqId
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var htm = '';
                $.each(result.d, function (key,item) {
                    htm += '<option value="' + item.Value + '"> ' + item.Text +' </option>'; 
                })
                $("#ddlImpTempList").html(htm);
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    
}

$(".btnImprtTemp").on('click', function () {

    importTemplatesIntoReq();
})

function importTemplatesIntoReq() {

    $.ajax({
        url: "EMSItemList.aspx/ImportTemplate",
        data: JSON.stringify({
            "ReqId": selReqId,
            "UserId": currUserId,
            "ProjNo": $("#txtProjRef").html(),
            "TempId": $("#ddlImpTempList option:selected").val()

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            if (result.d.ErrorType == "error") {
                toastr.error(result.d.MsgText, '');
            } else {
                toastr.success(result.d.MsgText, '');
                $("#ImportTemptListModal").modal('hide');
                ViewStructure();
                generateHTMLForStruct();
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function validateTaskControls() {
    var isValid = true

    //removing css from unchecked  floor type textboxes
    $('#mainFloorTypes input[name=cb-floors-type]').each(function (key, item) {
        let txtTotFloor = $(item).parent().parent().children().eq(1).children();
        let txtOrderNo = $(item).parent().parent().children().eq(2).children();

        txtTotFloor.css('box-shadow', '').css('border-color', 'lightgrey');
        txtOrderNo.css('box-shadow', '').css('border-color', 'lightgrey');
    });

    //checking validation on only checked floor types
    $('#mainFloorTypes input[name=cb-floors-type]:checked').each(function (key, item) {
        let txtTotFloor = $(item).parent().parent().children().eq(1).children();
        let txtOrderNo =  $(item).parent().parent().children().eq(2).children();

        if (txtTotFloor.val().trim() == "") {
            isValid = false;
            txtTotFloor.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        } else {
            txtTotFloor.css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if (txtOrderNo.val().trim() == "") {
            isValid = false;
            txtOrderNo.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        } else {
            txtOrderNo.css('box-shadow', '').css('border-color', 'lightgrey');
        }
    });

    if ($("#stcName").val().trim() == "") {
        isValid = false;
        $("#stcName").css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    } else {
        $("#stcName").css('box-shadow', '').css('border-color', 'lightgrey');
    }

    if ($("#stcCount").val().trim() == "") {
        isValid = false;
        $("#stcCount").css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    } else {
        $("#stcCount").css('box-shadow', '').css('border-color', 'lightgrey');
    }

    if ($("#stcDesc").val().trim() == "") {
        isValid = false;
        $("#stcDesc").css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    } else {
        $("#stcDesc").css('box-shadow', '').css('border-color', 'lightgrey');
    }
       
    return isValid;
}
function resetStructureControls() {
    $("#stcName,#stcCount,#stcDesc").val('');
    $('input[name=cb-floors-type]').prop('checked', false);
    $('.bsmntFloor,.parkFloor,.normalFloor,.terrFloor').val('');

    $("#mainFloorTypes .mainFloorSub input[type=number][name=txtForFloorsTypes]").prop('disabled', true);
    $("#mainFloorTypes .mainFloorSub input[type=number][name=txtForFloorsTypes]").val('');
    $("#mainFloorTypes .mainFloorSub input[type=number][name=txtForFloorsTypes]").css('box-shadow', '').css('border-color', 'lightgrey');
}


//---------------------COPY STRUCTURE-------------------<starts>---//

function ViewCopiedStructure() {

    $.ajax({
        url: "EMSItemList.aspx/ViewCopiedStructure",
        data: JSON.stringify({
            "StructureId": copiedStructID
            //"RequestID": selRequest[0].ReqId,
            //"UserId": currUserId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listStructureBasicCopy = result.d.listReqMaster;
            listReqStructFloorsCopy = result.d.listReqStructFloors;
            selOldRequestId = listStructureBasicCopy[0].ReqID;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getAllExistingStructures() {

    $.ajax({
        url: "EMSItemList.aspx/getAllExistingStructures",
        type: "POST",
        data: JSON.stringify({ "UserId": currUserId }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value="-1" >Select from existing Structures</option>';

            $.each(result.d, function (key, item) {

                htm += '<option value="' + item.Value + '" >' + item.Text + ' </option>'
            });

            $('#ddlCopyStructure').html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$("#ddlCopyStructure").on('change', function () {
    copiedStructID = $('#ddlCopyStructure option:selected').val();
    ViewCopiedStructure(copiedStructID);
    generateHTMLForStructCopy();
    $(".btnAddTypical").css('display', 'none');
    $(".struct-edit").css('display', 'none');
})
$(".btnAddExising").on('click', function () {
    $("#addReqModal").modal('hide');
    $("#modalCopyExisting").modal('show');
    getAllExistingStructures();
})

$("._goBack").on('click', function () {
    $("#addReqModal").modal('show');
    $("#modalCopyExisting").modal('hide');
})
$("#btnConfirm").on('click', function () {
    $("#modalConfirm").modal('show');
})

$("#btnConfirm").on('click', function () {
    $("#modalConfirm").modal('show');
})

$("input[type=radio][name=AddExisting]").on('change', function () {

    oper = $("input[type=radio][name=AddExisting]:checked").val()
})

$(".btnCopyEstimation").on('click', function () {
    $("#modalConfirm").modal('hide');
    $("#modalCopyExisting").modal('hide');
    $("#addReqModal").modal('show');

    AddCopiedEst(oper);
    ViewStructure();
    generateHTMLForStruct();
    getSystemsNItems();


})

function AddCopiedEst(oper) {
    $.ajax({
        url: "EMSItemList.aspx/AddCopiedEst",
        type: "POST",
        data: JSON.stringify({ "UserId": currUserId, "NewRequestId": selReqId, "OldReqId": selOldRequestId, "oper": oper/*"OldStrctId": copiedStructID */ }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Structure and TOC Copied(without items) successfully.', '');
            selStructId = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function AddCopiedEstWithQty() {
    $.ajax({
        url: "EMSItemList.aspx/AddCopiedEstQty",
        type: "POST",
        data: JSON.stringify({/* "UserId": currUserId,*/ "NewRequestId": selReqId, "OldReqId": selOldRequestId }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Structure and TOC Copied(with items) successfully.', '');
            selStructId = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function generateHTMLForStructCopy() {
    var htm = '';
    //  $('.tbody-Structure td').length > 0 ? objdatatableStructure.destroy() : '';
    var res = listAllReqs.filter(s => s.ReqId == selReqId);

    $.each(listStructureBasicCopy, function (key, item) {


        htm += `<div class="accordion-item">
                            <div class="card">`
        htm += `<h2 class="card-header" id="heading` + item.prjNumber + `-` + item.StructureID + `">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse` + item.StructureID + `" aria-expanded="false" aria-controls="collapse` + item.StructureID + `" style="color: #000000;text-transform: capitalize;">` + (key + 1) + `.  ` + item.StructureName + `<span class="position-absolute" style="right: 80px;"> Total Floors:  ` + item.TotalNumberOfFloor + `</span>`
        if (res[0].EstimationStatus.toUpperCase() != "RELEASED") {
            htm += `<span class="position-absolute" style="right: 214px;"> <i class="bx bx-edit-alt struct-edit" style="color:#1eb0d0;font-size: 1.9rem;" onclick="openModalEditStruct(` + item.StructureID + `)"></i></span>`
        }
        htm += `</button> </h2>`

        htm += `<div id="collapse` + item.StructureID + `" class="accordion-collapse collapse show" aria-labelledby="heading` + item.prjNumber + `-` + item.StructureID + `" data-bs-parent="#accordionStructure">
                                    <div class="card-body">
                                    
                                        <div class="row">`
        if (res[0].EstimationStatus.toUpperCase() != "RELEASED") {
            htm += `<div class="col-12">
                        <button type="button" class="btn btn-primary btnAddTypical float-right" style="width: 124px;font-size: 12px;" onclick="openTypicalModal(` + selRequest[0].ReqId + `,` + item.StructureID + `)">Add Typical Floors</button>
                    </div>`
        }


        htm += `<div class="col-1">
                    <div class="table">
                        <table class="table project-table table-Structure">
                            <tbody>
                                <tr>
                                    <td class="fw-bold"> Floor Name</td>
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
                        `+ ViewStructureDeetsCopy(item.StructureID) + `
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
    $('#accordionStructureView').html(htm);
}

function ViewStructureDeetsCopy(strctid) {
    var htm = '';
    var res = listReqStructFloorsCopy.filter(xx => xx.StructureID == strctid);

    $.each(res, function (key, item) {

        htm += `
                <tbody class="text-nowrap" style="width:100px;float: left; margin-right:0px">
                    <tr style="width:100px;"><td class="fw-bold" style="width:100px;">`+ item.Name + `</th></tr>
                    <tr style="width:100px;"><td style="width:100px;"> `+ item.Type + `</td></tr>
                    <tr style="width:100px;"><td style="width:100px;"> `+ (item.IsTypical == '' ? '-' : "<i class='bx bx-check' style='color: #38b316;'></i>") + `</td></tr>
                    <tr style="width:100px;"><td style="width:100px;"> `+ (item.TypicalOf == '' ? '-' : item.TypicalOf) + `</td></tr>
                </tbody>`

        htm += `</tr>`;
    });
    return htm;
}

//---------------------COPY STRUCTURE-------------------<ends>---//