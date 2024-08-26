

//START-------------------On TOC Side------------------//


var selFpReqId = 0;
var listAllFpReqs = 0;
var isSpecAttached = 0;
var isListofMake = 0;
var isPumpSched = 0;
var listPumpReqs = [];
var objDatatableFPReq = [];
var listPumpReqsView = [];
function selectedReq(selFpReqId) {
    selRequest = selFpReqId;
}

$('.btn-add-firepump').on('click', function () {
    ViewRequests();
    $('#modalAddFirepumpReq').modal('show')
})

$('#btnAddFirePumpItem').on('click', function () {
    ViewRequests();
    createPumpLineHTML();
    $('#btnSaveFirePumpItem').css("display", "");

    $('#btnAddFirePumpItem').css("display", "none");
})
$('#btnSaveFirePumpItem').on('click', function () {
    newPumponLine();
    ViewRequests();
})

$('input[name=isAttached]').on('change', function () {
    if ($("input[name=isAttached]").is(":checked") == true) {
        isSpecAttached = 1
    }
    else {
        isSpecAttached = 0;
    }
})
$('input[name=isListofMake]').on('change', function () {
    if ($("input[name=isListofMake]").is(":checked") == true) {
        isListofMake = 1
    }
    else {
        isListofMake = 0;
    }
})
$('input[name=isPumpSched]').on('change', function () {
    if ($("input[name=isPumpSched]").is(":checked") == true) {
        isPumpSched = 1
    }
    else {
        isPumpSched = 0;
    }
})

function newPumponLine() {
    $.ajax({
        url: "EMSItemList.aspx/InsertPumpMainReq",
        type: "POST",
        data: JSON.stringify({
            "RequstId": selReqId,
            "UserId": currUserId,
            "Description": $("input[name=desc]").val(),
            "Area": $("input[name=area]").val(),
            "Quantity": $("input[name=qty]").val(),
            "ECapacity": $("input[name=capacity1]").val(),
            "DCapacity": $("input[name=capacity2]").val(),
            "JCapacity": $("input[name=capacity3]").val(),
            "EBars": $("input[name=bars1]").val(),
            "DBars": $("input[name=bars2]").val(),
            "JBars": $("input[name=bars3]").val(),
            "EQTY": $("input[name=qty1]").val(),
            "DQTY": $("input[name=qty2]").val(),
            "JQTY": $("input[name=qty3]").val(),
            "Direction": $("input[name=TypeofPump]").val(),
            "PumpSpecs": isSpecAttached,
            "ListofMake": isListofMake,
            "PumpSched": isPumpSched
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#btnAddFirePumpItem').css("display", "");
            $('#btnSaveFirePumpItem').css("display", "none");
            $(".pumpLine").html('');
            toastr.success("Pump Requested Successfully!");
            ViewRequests();
        },
        error: function (errormessage) {
        }
    });
}
function ViewRequests() {
    $.ajax({
        url: "EMSItemList.aspx/ViewFirePumpReq",
        type: "POST",
        data: JSON.stringify({
            "RequstId": selReqId,
            "UserId": currUserId,
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            listPumpReqs = result.d;

            $('.tbody-added-firepumpreqs tr').length > 0 ? objDatatableFPReq.destroy() : '';

            $.each(listPumpReqs, function (key, item) {

                htm += `<tr>  
                 
                  <td style="text-align:center;">`+ item.SlNO + `</td>
                   <td style="text-align:center;display:none;">` + item.ItemID + `</td>
                  <td style="text-align:center;">`+ item.Area + `</td>
                  <td style="text-align:center;">`+ item.Description + `</td>
                  <td style="text-align:center;">`+ item.QTY + `</td> 
                  <td style="text-align:center;">`+ item.TypeOfPump + `</td> 
                  <td style="text-align:center;">
                  <svg xmlns="http://www.w3.org/2000/svg" class="view-FP-details" width="2rem" height="2rem" viewBox="0 0 24 24" title="View More">
                        <g fill="none" stroke="#b22e35">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.009m3.996 0h.008m3.978 0H16" />
                            <circle cx="12" cy="12" r="10" stroke-width="1.5" />
                        </g>
                  </svg>
                  </td>`;

                htm += `</tr>`;

            });

            $('.tbody-added-firepumpreqs').html(htm);
            initiateDataTableItems();

        },
        error: function (errormessage) {
        }
    });
}

function initiateDataTableFPRequests() {
    objDatatableFPReq = [];
    objDatatableFPReq = $('.table-added-firepumpreqs').DataTable({
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

$('.table-added-firepumpreqs').on('click', '.view-FP-details', function () {

    ItemID = this.parentNode.parentNode.children[1].textContent;
    $('#modalViewFirepumpReqDeets').modal('show');
    ViewFirePumpReqDetails();
});


function ViewFirePumpReqDetails() {
    $.ajax({
        url: "EMSItemList.aspx/ViewFirePumpReqDetails",
        type: "POST",
        data: JSON.stringify({
            "PumpReqId": ItemID,
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = ``;
            listPumpReqsView = result.d;


            htm += `<div class="row mx-3 py-3">`;

            if (listPumpReqsView[0].PumpSpecs == "False") {
                htm += `<div class="form-check col-3">
                            <input class="form-check-input" type="checkbox" value=""  name="isAttached" style="pointer-events: none;">
                            <label class="form-check-label" for="">
                                Specifications Attached
                            </label>
                        </div>`;
            }
            else {
                htm += `<div class="form-check col-3">
                            <input class="form-check-input" type="checkbox" value=""  name="isAttached" checked style="pointer-events: none;">
                            <label class="form-check-label" for="">
                                Specifications Attached
                            </label>
                        </div>`
            }

            if (listPumpReqsView[0].ListofMake == "False") {
                htm += `<div class="form-check col-3">
                            <input class="form-check-input" type="checkbox" value=""  name="isListofMake" style="pointer-events: none;">
                            <label class="form-check-label" for="">
                                List of Make
                            </label>
                        </div>`;
            }
            else {
                htm += `<div class="form-check col-3">
                            <input class="form-check-input" type="checkbox" value=""  name="isListofMake" checked style="pointer-events: none;">
                            <label class="form-check-label" for="">
                                List of Make
                            </label>
                        </div>`
            }

            if (listPumpReqsView[0].PumpSched == "False") {
                htm += `<div class="form-check col-3">
                            <input class="form-check-input" type="checkbox" value=""  name="isPumpSched" style="pointer-events: none;">
                            <label class="form-check-label" for="">
                                Pump Schedule
                            </label>
                        </div>`;
            }
            else {
                htm += `<div class="form-check col-3">
                            <input class="form-check-input" type="checkbox" value=""  name="isPumpSched" checked style="pointer-events: none;">
                            <label class="form-check-label" for="">
                               Pump Schedule
                            </label>
                        </div></div>`
            }



            htm += `<div class="row mt-1">

                        <table class="">
                            <thead>
                                <tr class="">
                                    <th style="width: 230px !important">Pump Set</th>
                                    <th style="width: 290px !important">Capacity</th>
                                    <th style="width: 100px !important">Bars</th>
                                    <th style="width: 100px !important">QTY</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="">
                                    <td>Electrical Pump Set</td>
                                    <td class="position-relative" style="">
                                        <label class="">`+ listPumpReqsView[0].ECapacity +`@GPM</label></td>
                                    <td class="position-relative" style="">
                                        <label class="">`+ listPumpReqsView[0].EBars +`Bars</label></td>
                                    <td class="position-relative" style="">
                                        <label class="">`+ listPumpReqsView[0].EQTY +`Set</label></td>
                                </tr>
                                <tr class="">
                                    <td>Diesel Pump Set</td>
                                    <td class="position-relative">
                                        <label class="">`+ listPumpReqsView[0].DCapacity +`@GPM</label></td>
                                    <td class="position-relative">
                                        <label class="">`+ listPumpReqsView[0].DBars +`Bars</label></td>
                                    <td class="position-relative">
                                        <label class="">`+ listPumpReqsView[0].DQTY +`Set</label></td>
                                </tr>
                                <tr class="">
                                    <td>Jockey Pump Set</td>
                                    <td class="position-relative">
                                        <label class="">`+ listPumpReqsView[0].JCapacity +`@GPM</label></td>
                                    <td class="position-relative">
                                        <label class="">`+ listPumpReqsView[0].JBars +`Bars</label></td>
                                    <td class="position-relative">
                                        <label class="">`+ listPumpReqsView[0].JQTY +`Set</label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>`


            $(".pumpLineView").html(htm)
                        
        },
        error: function (errormessage) {
        }
    });
}

function createPumpLineHTML() {
    var htm = '';
    htm += ` <div class="row mx-3 py-3">
                <div class="form-check col-3">
                    <input class="form-check-input" type="checkbox" value=""  name="isAttached">
                    <label class="form-check-label" for="">
                        Specifications Attached
                    </label>
                </div>
                <div class="form-check col-2">
                    <input class="form-check-input" type="checkbox" value=""  name="isListofMake">
                    <label class="form-check-label" for="">
                        List of Make
                    </label>
                </div>
                <div class="form-check col-3">
                    <input class="form-check-input" type="checkbox" value=""  name="isPumpSched">
                    <label class="form-check-label" for="">
                        Pump Schedule
                    </label>
                </div>
            </div>
            <div class="row mt-1">

                <table class="table table-fpreq" style="width: 100%;">
                    <thead style="position: sticky; top: -3px;">
                        <tr class="">
                            <th style="width: 52px !important">No.</th>
                            <th style="width: 52px !important">Area (Floor Desc)</th>
                            <th style="width: 52px !important">Description</th>
                            <th style="width: 52px !important">QTY</th>
                            <th style="width: 52px !important">Type of Pump</th>
                        </tr>
                    </thead>

                    <tbody class="tbody-fpreq">
                        <tr>
                            <td>1</td>
                            <td>
                                <input type="text" name="area" class="form-control mx-2" placeholder="basement" /></td>
                            <td>
                                <input type="text"  name="desc" class="form-control mx-2" placeholder="basement pump description" /></td>
                            <td>
                                <input type="number"  name="qty" class="form-control mx-2" placeholder="2" /></td>
                            <td>
                                <input type="text"  name="TypeofPump" class="form-control mx-2" placeholder="Horizontal Split"></td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <table class="">
                                    <thead>
                                        <tr class="">
                                            <th style="width: 230px !important">Pump Set</th>
                                            <th style="width: 290px !important">Capacity</th>
                                            <th style="width: 100px !important">Bars</th>
                                            <th style="width: 100px !important">QTY</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="">
                                            <td>Electrical Pump Set</td>
                                            <td class="position-relative" style="">
                                                <input type="number"  name="capacity1" class="form-control mx-2" /><label class="static-value">@GPM</label></td>
                                            <td class="position-relative" style="">
                                                <input type="number"  name="bars1" class="form-control mx-2"><label class="static-value">Bars</label></td>
                                            <td class="position-relative" style="">
                                                <input type="number"  name="qty1" class="form-control mx-2"><label class="static-value">Set</label></td>
                                        </tr>
                                        <tr class="">
                                            <td>Diesel Pump Set</td>
                                            <td class="position-relative">
                                                <input type="number"  name="capacity2" class="form-control mx-2"><label class="static-value">@GPM</label></td>
                                            <td class="position-relative">
                                                <input type="number"  name="bars2" class="form-control mx-2"><label class="static-value">Bars</label></td>
                                            <td class="position-relative">
                                                <input type="number"  name="qty2" class="form-control  mx-2"><label class="static-value">Set</label></td>
                                        </tr>
                                        <tr class="">
                                            <td>Jockey Pump Set</td>
                                            <td class="position-relative">
                                                <input type="number"  name="capacity3" class="form-control mx-2"><label class="static-value">@GPM</label></td>
                                            <td class="position-relative">
                                                <input type="number"  name="bars3" class="form-control mx-2"><label class="static-value">Bars</label></td>
                                            <td class="position-relative">
                                                <input type="number"  name="qty3" class="form-control mx-2"><label class="static-value">Set</label></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>`;
    $(".pumpLine").html(htm)

}





//END-------------------On TOC Side------------------//
//-------
//-------
//-------
//START-------------------On Fire Pump Side------------------// 

function ViewpumpRequestDetails() {
    $('#modalFPDetails').modal('show');
}

var objDatatable = [], objDatatableItems = [];
var ReqID = '';
var EstID = '';
var ItemID = '';
$(document).ready(function () {

    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        AllRequests('Please Wait..');
        $(".ajax-loader").addClass('hidden');
    }, 500);
});

function AllRequests(loader) {

    $.ajax({
        url: "FirePump.aspx/getAllRequests",
        data: JSON.stringify({ "UserId": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var htmen = '';
            $('.tbody-Firepump-list-table tr').length > 0 ? objDatatable.destroy() : '';
            var selvalue = '';
            var htmDrop = '';

            $.each(ProjectDetails, function (key, item) {

                htm += `<tr>  
                  <td style="text-align:center;display:none;">` + item.ReqID + `</td>
                  <td style="text-align:center;display:none;">` + item.EstimationID + `</td>
                  <td style="text-align:center;">`+ item.RefNo + `</td>
                  <td style="text-align:center;">`+ item.RevNo + `</td>
                  <td style="text-align:center;">`+ item.ContABBR + `</td>
                  <td style="text-align:center;">`+ item.Year + `</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                  <td style="text-align:center;">`+ item.ProjectNumber + `</td>
                  <td style="text-align:center;">`+ item.ProjectName + `</td>
                  <td style="text-align:center;">`+ item.Estimator + `</td>
                  <td style="text-align:center;">`+ item.CreatedDate + `</td>
                  <td style="text-align:center;">
                  <img src="images/icon-View.png" title="View" class="fa-icon-hover View-Request-Details" style="cursor: pointer; width: 24px;" />&nbsp;
                    </td>`;
                htm += `</tr>`;

            });
            $('.tbody-Firepump-list-table').html(htm);
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

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.Firepump-list-table').DataTable({
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

$('.tbody-Firepump-list-table').on('click', '.View-Request-Details', function () {

    ReqID = this.parentNode.parentNode.children[0].textContent;
    EstID = this.parentNode.parentNode.children[1].textContent;
    EstimationDetails();
    AllItemdetails();
    $('#modalFPDetails').modal('show');
});
function EstimationDetails() {

    $.ajax({
        url: "FirePump.aspx/GetAllestimationdetails",
        data: JSON.stringify({ "UserId": currUserId, "EstID": EstID, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#SummarytxtEstRef').html(result.d[0].RefNo);
            $('#SummarytxtPrjName').html(result.d[0].ProjectName);
            $('#SummarytxtProjRef').html(result.d[0].ProjectNumber);
            $('#SummarytxtOppRef').html(result.d[0].OPTNumber);
            $('#SummarytxtRevision').html(result.d[0].RevNo);
            $('#SummarytxtEstYear').html(result.d[0].Year);
            $('#SummarytxtPrjMEPContr').html(result.d[0].MEPContractor);
            $('#SummarytxtPrjConsultant').html(result.d[0].Consultant);
            $('#SummarytxtContrAbbr').html(result.d[0].ContABBR);
            $('#SummarytxtPrjMainContr').html(result.d[0].MainContractor);
            $('#SummarytxtPrjClient').html(result.d[0].Client);
            $('#SummarytxtPrjLocation').html(result.d[0].Location);
            $('#SummarytxtPrjContactPerson').html(result.d[0].ContactName);
            $('#SummarytxtPrjWinningPerc').html(result.d[0].WinPerc);
            $('#SummarytxtPrjBudget').html(result.d[0].Budget);
            $('#SummarytxtPrjURL').html(result.d[0].URL);
            $('#SummaryddlEstimationTeamOrg').html(result.d[0].EstimationOrg);
            $('#SummarytxtSalesman').html(result.d[0].Salesman);
            $('#SummarytxtMarketing').html(result.d[0].Marketing);

            if (result.d[0].Stage == 'TENDER') {
                $('#Radio1').prop('checked', true);
            }
            else if (result.d[0].Stage == 'J.O.H') {
                $('#Radio2').prop('checked', true);
            }

            if (result.d[0].Scope == 'SUPPLY') {
                $('#Radio3').prop('checked', true);
            }
            else if (result.d[0].Scope == 'SUPPLY AND INSTALLATION') {
                $('#Radio4').prop('checked', true);
            }

            if (result.d[0].QuotationType == 'SMART QTNG') {
                $('#Radio5').prop('checked', true);
            }
            else if (result.d[0].QuotationType == 'AS PER DRAWING AND SPECIFICATION') {
                $('#Radio6').prop('checked', true);
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


function AllItemdetails() {

    $.ajax({
        url: "FirePump.aspx/getItemDetails",
        data: JSON.stringify({ "UserId": currUserId, "ReqID": ReqID, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var htmen = '';
            $('.tbody-FP-Requests tr').length > 0 ? objDatatableItems.destroy() : '';
            var selvalue = '';
            var htmDrop = '';

            $.each(ProjectDetails, function (key, item) {

                htm += `<tr>  
                 
                  <td style="text-align:center;">`+ item.SlNO + `</td>
                   <td style="text-align:center;display:none;">` + item.ItemID + `</td>
                  <td style="text-align:center;">`+ item.Area + `</td>
                  <td style="text-align:center;">`+ item.Description + `</td>
                  <td style="text-align:center;">`+ item.QTY + `</td> 
                  <td style="text-align:center;">
                  <img src="images/icon-View.png" title="View" class="fa-icon-hover View-Item-Details" style="cursor: pointer; width: 24px;" />&nbsp;
                  </td>`;

                htm += `</tr>`;

            });

            $('.tbody-FP-Requests').html(htm);
            initiateDataTableItems();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateDataTableItems() {
    objDatatableItems = [];
    objDatatableItems = $('.table-FP-Requests').DataTable({
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

$('.tbody-FP-Requests').on('click', '.View-Item-Details', function () {

    ItemID = this.parentNode.parentNode.children[1].textContent;
    $('#modalNewPumpUpdate').modal('show');
});

function AddPumpDetails() {

    $.ajax({
        url: "FirePump.aspx/setPumpDet",
        data: JSON.stringify({ "UserId": currUserId, "ItemID": ItemID, "PumpName": $('#txtPumpName').val(), "Value": $('#txtPumpValue').val(), "QTY": $('#txtPumpQTY').val(), "MoreInfo": $('#txtPumpMoreInfo').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully..', '');
            $('#modalNewPumpUpdate').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#btnAddPumpInfo').on('click', function () {

    AddPumpDetails();

});

function PumpInfo() {

    $.ajax({
        url: "FirePump.aspx/getPumpInformation",
        data: JSON.stringify({ "UserId": currUserId, "ItemID": ItemID, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtPumpName').val(result.d[0].Name);
            $('#txtPumpValue').val(result.d[0].Value);
            $('#txtPumpQTY').val(result.d[0].PumpQTY);
            $('#txtPumpMoreInfo').val(result.d[0].MoreInformation);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//END-------------------On Fire Pump Side------------------// 