var selRequest = [];

var listSummaryReports = [];
var listItemViseReports = [];
var AllItemCategory = [];
var listAlternateItems = [];
var sysTotPipeFittings = 0, sysTotInstallation = 0, sysTotEngineering = 0, sysTotTestnComm = 0;
var sysMaterial = 0;
var sysInstall = 0;
var listSummaryAdditional = [];
var htmforAdditional = '';

function summaryThead() {

    var summaryTheadd = ``;
    summaryTheadd = `<div class="tab-pane fade show active" id="summary-report-tab" role="tabpanel" aria-labelledby="pill-summary-report-tab">
                                    <div class="mt-3 table">
                                        <table class="table project-table">
                                            <thead style="position: sticky; top: 0;">
                                                <tr>
                                                    <th>System</th>
                                                    <th>Equipments</th>
                                                    <th>Consumables Pipes & Fittings</th>
                                                    <th>Installation Labor Charge</th>
                                                    <th>Engineering</th>
                                                    <th>Testing & Commssioning</th>
                                                    <th>Over Head 15%</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            
                                            `+ SummaryReports() + `
                                            </tbody>
                                        </table>
                                        <h5 class="my-2">Additional Items</h5>
                                        <table class="table project-table">
                                            <thead style="position: sticky; top: 0;">
                                                <tr>
                                                    <th>Name/Description</th>
                                                    <th>Price</th>
                                                    <th>Comments</th>
                                                    <th>Optional</th>
                                                </tr>
                                            </thead>

                                            `+ AdditionalItems() + `
    
                                        </table>
                                        <table>
                                            <div class="float-right w-50">
                                                <div class="p-0"><label class="border w-50 m-0 p-3">Total Consumables</label> <label class="border w-50 p-3 m-0 float-right">`+ numberWithCommas(fixedtwo(sysTotPipeFittings)) + `</label></div>
                                                <div class="p-0"><label class="border w-50 m-0 p-3">Total Installation</label> <label class="border w-50 p-3 m-0 float-right">`+ numberWithCommas(fixedtwo(sysTotInstallation)) + `</label></div>
                                                <div class="p-0"><label class="border w-50 m-0 p-3">Total Engineering</label> <label class="border w-50 m-0 p-3 float-right">`+ numberWithCommas(fixedtwo(sysTotEngineering)) + `</label></div>
                                                <div class="p-0"><label class="border w-50 m-0 p-3">Total Testing & Commssioning</label> <label class="border w-50 m-0 p-3 float-right">`+ numberWithCommas(fixedtwo(sysTotTestnComm)) + `</label></div>
                                            </div>
                                        </table>
                                    </div>
                                </div>`;
    return summaryTheadd;
}
function summaryLi() {
    var summaryLi = ``;
    summaryLi = `<li class="nav-item" role="presentation">
                            <button class="nav-link active show" id="pill-summary-report-tab" data-bs-toggle="pill" data-bs-target="#summary-report-tab" type="button" role="tab" aria-controls="summary-report-tab" aria-selected="true">System Summary</button>
                        </li>`;
    return summaryLi;
}

$(document).ready(function () {

});

function selectedReq(selReqId) {
    selRequest = selReqId;
}

function SummaryReports() {
    var htm2return = ``;
    var sysPipenFittings = 0;
    var sysInstallation = 0;
    var sysEngineering = 0;
    var sysTestnComm = 0;
    var totMaterialCost = 0;
    var totInstallationCost = 0;
    $.ajax({
        url: "EMSItemList.aspx/Reports",
        type: "POST",
        data: JSON.stringify({
            "RequstId": selReqId,
            "UserId": currUserId
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listSummaryReports = [];
            listSummaryReports = result.d.listSummary;
            var htm = '';
            sysTotPipeFittings = 0, sysTotInstallation = 0, sysTotEngineering = 0, sysTotTestnComm = 0;
            sysMaterial = 0;
            sysInstall = 0;
            $.each(listSummaryReports, function (key, item) {
                htm += `<tbody class="summary-tbody"><tr>
                <td>`+ item.Name + `</td>
                <td>`+ item.Equipment + `</td>`

                htm += `<td>` + numberWithCommas(fixedtwo(parseFloat(item.PipeFittings) + parseFloat(item.MaterialCost))) + `</td>`
                htm += `<td>` + numberWithCommas(fixedtwo(parseFloat(item.Installation) + parseFloat(item.InstallationCost))) + `</td>`
                htm += `<td>` + numberWithCommas(fixedtwo(item.Engineering)) + `</td>
                <td>`+ numberWithCommas(fixedtwo(item.TestingnCommissioning)) + `</td>
                <td></td>`

                htm += `<td>` + numberWithCommas(fixedtwo(parseFloat(item.PipeFittings) + parseFloat(item.Installation) + parseFloat(item.Engineering) + parseFloat(item.TestingnCommissioning) + parseFloat(item.MaterialCost) + parseFloat(item.InstallationCost))) + `</td>`


                htm += `</tr><tbody>`
                sysTotPipeFittings += parseFloat(item.PipeFittings);
                sysTotInstallation += parseFloat(item.Installation);
                sysTotEngineering += parseFloat(item.Engineering);
                sysTotTestnComm += parseFloat(item.TestingnCommissioning);
                sysMaterial += parseFloat(item.MaterialCost);
                sysInstall += parseFloat(item.InstallationCost);
            });
            sysTotPipeFittings = sysTotPipeFittings + parseFloat(sysMaterial);
            sysTotInstallation = sysTotInstallation + parseFloat(sysInstall);
            //InstallationCost = parseFloat(sysItem.InstallationCost) == undefined ? 0 : parseFloat(sysItem.InstallationCost);
            htm2return += htm;
            sysInstall = 0;
        },
        // <td>`+ item.OverHead + `</td>
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }

    });
    return htm2return;
}

function ItemviseReports() {

    $.ajax({
        url: "EMSItemList.aspx/ItemviseReports",
        type: "POST",
        data: JSON.stringify({
            "RequstId": selReqId,
            "UserId": currUserId
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listItemViseReports = [];
            listItemViseReports = result.d.listItemSummary;
            listAlternateItems = result.d.listAlternateItems;

            var distSystems = listItemViseReports.map(ss => ss.Name).filter((value, index, self) => self.indexOf(value) === index);
            var htmLi = '';
            var htmTab = '';
            var SysName = listItemViseReports.length > 0 ? listItemViseReports[0].Name : '';
            AllItemCategory = [];
            AllItems = [];
            var stritem = '';

            htmLi += summaryLi();
            htmTab += summaryThead();

            $.each(distSystems, function (key, item) {
                stritem = removeSpace(item);
                AllItemCategory = listItemViseReports.filter(x => x.Name == item).map(ss => ss.Category).filter((value, index, self) => self.indexOf(value) === index);
                if (key == 0 && SysName == item) {//for first time only
                    htmLi += `
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pillsumm-` + key + `-li" data-bs-toggle="pill" data-bs-target="#pillsumm-` + key + `-tab" type="button" role="tab" aria-controls="pillsumm-` + key + `-tab" aria-selected="false">` + item + `</button>
                            </li>`
                    htmTab += `
                            <div class="tab-pane fade" id="pillsumm-` + key + `-tab" role="tabpanel" aria-labelledby="pillsumm-` + key + `-tab">
                                                       
                                    <div class="table">
                                        <table class="table project-table w-100 table-responsive" style="height: 540px;overflow-x: hidden;">
                                            <thead style="z-index:10;position: sticky; top: 0;">
                                                <tr>
                                                    <th style="width: 230px !important;" class="align-middle">Category</th>
                                                    <th class="align-middle">Item Code</th>
                                                    <th class="align-middle">Description</th>
                                                    <th class="align-middle">Qty</th>
                                                    <th class="align-middle">Spare</th>
                                                    <th class="text-center">Pipes & Fittings Unit Price</th>
                                                    <th class="text-center">Total Pipes & Fittings</th>
                                                    <th class="text-center">Installation Unit Price</th>
                                                    <th class="text-center">Total Installation</th>
                                                    <th class="align-middle text-center">Total</th>
                                                </tr>
                                            </thead>
                                            `+ strItemDeets(item) + `
                                        </table>
                                    </div>
                                </div>`
                }

                if (SysName != item) {
                    AllItemCategory = listItemViseReports.filter(x => x.Name == item).map(ss => ss.Category).filter((value, index, self) => self.indexOf(value) === index);

                    htmLi += `
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pillsumm-` + key + `-li" data-bs-toggle="pill" data-bs-target="#pillsumm-` + key + `-tab" type="button" role="tab" aria-controls="pillsumm-` + key + `-tab" aria-selected="false">` + item + `</button>
                            </li>`
                    htmTab += `
                                <div class="tab-pane fade" id="pillsumm-` + key + `-tab" role="tabpanel" aria-labelledby="pillsumm-` + key + `-tab">
                                                       
                                    <div class="table">
                                        <table class="table project-table w-100 table-responsive" style="height: 540px;overflow-x: hidden;">
                                            <thead style="z-index:10;position: sticky; top: 0;">
                                                <tr>
                                                    <th style="width: 230px !important;" class="align-middle">Category</th>
                                                    <th class="align-middle">Item Code</th>
                                                    <th class="align-middle">Description</th>
                                                    <th class="align-middle">Qty</th>
                                                    <th class="align-middle">Spare</th>
                                                    <th class="text-center">Pipes & Fittings Unit Price</th>
                                                    <th class="text-center">Total Pipes & Fittings</th>
                                                    <th class="text-center">Installation Unit Price</th>
                                                    <th class="text-center">Total Installation</th>
                                                    <th class="align-middle text-center">Total</th>
                                                </tr>
                                            </thead>
                                            `+ strItemDeets(item) + `
                                        </table>
                                    </div>
                                </div>`
                }


            });

            $('#pills-repocontent').html(htmTab);
            $('#pills-tab-repots').html(htmLi);
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });

}

$('#nav-Summary-tab').on('click', function () {


});

$('.btn-generate-summary').on('click', function () {

    $("#modalSummary").modal("show");
    $("#addReqModal").modal("hide");
    ItemviseReports();
    SummaryReports();
    bindValueForLabelsinSummary(selRequest);
});
$('._goBack').on('click', function () {
    $("#addReqModal").modal("show");
});


function strItemDeets(item) {
    var totpf = 0, totins = 0;
    var htm = '';
    var Installation = 0;
    var Engineering = 0;
    var TestnComm = 0;
    var MaterialCost = 0;
    var InstallationCost = 0;
    for (var i = 0; i < AllItemCategory.length; i++) {

        var res = listItemViseReports.filter(x => x.Category == AllItemCategory[i] && x.Name == item);

        htm += `<tbody><tr><td><b>` + (i + 1) + `. ` + res[0].Category + `</b></td></tr>`
        let isOpt = '';
        let optcls = '';
        $.each(res, function (k, sysItem) {
            isOpt = sysItem.IsOptional == 'True' ? '<span>(Optional)</span>' : '';
            optcls = sysItem.Isoptional == 'True' ? 'badge badge-optional' : 'badge badge-dark';

            if ($.trim(sysItem) == "" || $.trim(sysItem) == "null" || $.trim(sysItem) == null || $.trim(sysItem) == undefined) {
                $.trim(sysItem) = `-`;
            }
            htm += `<tr>
                    <td></td>
                    <td> <span class="` + optcls + ` fs-6">` + sysItem.ItemCode + ` <svg class="" xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 24 24">
                            <g fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5">
                                <path d="m17.524 17.524l-2.722 2.723a2.567 2.567 0 0 1-3.634 0L4.13 13.209A3.852 3.852 0 0 1 3 10.487V5.568A2.568 2.568 0 0 1 5.568 3h4.919c1.021 0 2 .407 2.722 1.13l7.038 7.038a2.567 2.567 0 0 1 0 3.634z" />
                                <path d="M9.126 11.694a2.568 2.568 0 1 0 0-5.137a2.568 2.568 0 0 0 0 5.137m3.326 4.392l3.634-3.634" />
                            </g>
                        </svg></span> `+ isOpt + ` <div>` + getAlternateItemsDetReport(1, sysItem.AlternateFromItem, listAlternateItems) + `</div>
                    </td>
                    <td>`+ sysItem.Desc + `. <div style="margin-top: 12px;">` + getAlternateItemsDetReport(2, sysItem.AlternateFromItem, listAlternateItems) + `</div></td>
                    
                    <td>`+ parseInt(sysItem.Quantity) + `</td>
                    <td>`+ parseInt(sysItem.Spare) + `</td>
                    <td class="text-center">`+ numberWithCommas(fixedtwo(sysItem.PipeFittingsUP)) + `</td>
                    <td class="text-center">`+ numberWithCommas(fixedtwo(sysItem.TOTPipeFittings)) + `</td>
                    <td class="text-center">`+ numberWithCommas(fixedtwo(sysItem.Installation)) + `</td>
                    <td class="text-center">`+ numberWithCommas(fixedtwo(sysItem.TOTInstallation)) + `</td>
                    <td class="text-center">`+ numberWithCommas(fixedtwo((sysItem.TOTInstallation) + (sysItem.TOTPipeFittings))) + `</td></tr>
                    `
            MaterialCost = parseFloat(sysItem.MaterialCost) == undefined ? 0 : parseFloat(sysItem.MaterialCost);
            InstallationCost = parseFloat(sysItem.InstallationCost) == undefined ? 0 : parseFloat(sysItem.InstallationCost);
            totpf = (parseFloat(sysItem.TOTPipeFittings) == undefined ? 0 : parseFloat(sysItem.TOTPipeFittings)) + parseFloat(totpf);
            totins = (parseFloat(sysItem.TOTInstallation) == undefined ? 0 : parseFloat(sysItem.TOTInstallation)) + parseFloat(totins);
            Engineering = parseFloat(sysItem.Engineering);
            Installation = (parseFloat(sysItem.TOTInstallation) == undefined ? 0 : parseFloat(sysItem.TOTInstallation)) + parseFloat(Installation);
            TestnComm = parseFloat(sysItem.TestingnCommissioning);
            //if (item == 'Additional Accessories for Fire Pump') {
            //    MaterialCost = parseFloat(sysItem.MaterialCost) == undefined ? 0 : parseFloat(sysItem.MaterialCost);
            //    InstallationCost = parseFloat(sysItem.InstallationCost) == undefined ? 0 : parseFloat(sysItem.InstallationCost);
            //}
        });

        //allTOT = totpf + totins;
    }
    //if (item == 'Additional Accessories for Fire Pump') {
    //    totpf = totpf + MaterialCost;
    //    Installation = totins + InstallationCost
    //}
    totpf = totpf + parseFloat(MaterialCost);
    Installation = Installation + parseFloat(InstallationCost);
    allTOT = totpf + Installation + Engineering + TestnComm;
    htm += `` + summaryHTMLfooter(Engineering, TestnComm, allTOT, Installation, totpf) + ``
    return htm;

}

function getAlternateItemsDetReport(col, itmcode, listAlternateItems) {
    var htm = '';

    if (listAlternateItems.length > 0) {
        var res = listAlternateItems.filter(s => s.ItemCode == itmcode)
        if (res.length > 0) {
            if (col == 1) {
                htm = `<span class="badge badge-alternate fs-6 mt-1">` + res[0].ItemCode + ` <svg class="" xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 24 24">
                                         <g fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5">
                                             <path d="m17.524 17.524l-2.722 2.723a2.567 2.567 0 0 1-3.634 0L4.13 13.209A3.852 3.852 0 0 1 3 10.487V5.568A2.568 2.568 0 0 1 5.568 3h4.919c1.021 0 2 .407 2.722 1.13l7.038 7.038a2.567 2.567 0 0 1 0 3.634z" />
                                             <path d="M9.126 11.694a2.568 2.568 0 1 0 0-5.137a2.568 2.568 0 0 0 0 5.137m3.326 4.392l3.634-3.634" />
                                         </g>
                                     </svg> </span> <span> (Alternate)</span>`
            }
            else if (col == 2) {
                htm = `<span>` + res[0].Desc + `</span>`
            }
        }

    }

    return htm;
}

function summaryHTMLfooter(Engineering, TestnComm, allTOT, Installation, totpf) {
    htmTfooter = `<tr><table><div class="float-right w-50" style="font-size:14px">
                        <div class=""><label class="border w-50 m-0 p-3">Engineering</label> <label class="border w-50 p-3 m-0 float-right">`+ numberWithCommas(fixedtwo(Engineering)) + ` </label></div>
                        <div class=""><label class="border w-50 m-0 p-3"> Test and Commission </label> <label class="border m-0 w-50 p-3 float-right">`+ numberWithCommas(fixedtwo(TestnComm)) + `</label></div>
                        <div class=""><label class="border w-50 m-0 p-3"> Total Installation  </label> <label class="border m-0 w-50 p-3 float-right">`+ numberWithCommas(fixedtwo(Installation)) + `</label></div>
                        <div class=""><label class="border w-50 m-0 p-3">Total Consumables</label> <label class="border w-50 p-3 m-0 float-right">` + numberWithCommas(fixedtwo(totpf)) + `</label></div>
                        <div class=""><label class="border w-50 m-0 p-3">Total</label> <label class="border w-50 p-3 m-0 float-right">` + numberWithCommas(fixedtwo(allTOT)) + `</label></div>
                      </div>
                  </table></tr>
                 `
    //$('#summaryFooter').html(htmTfooter);
    return htmTfooter;
}


function printDiv(divID) {
    $(".project-table").css('height', 'max-content');
    var divElements = document.getElementById(divID).innerHTML;
    var oldPage = document.body.innerHTML;
    document.body.innerHTML =
        "<html><head><title>Print</title></head><body>" +
        divElements + "</body>";
    window.print();
    document.body.innerHTML = oldPage;

    location.reload();
    $('#addReqModal').modal('show');

}


function AdditionalItems() {
    htmforAdditional = '';
    $.ajax({
        url: "EMSItemList.aspx/AdditionalItems",
        type: "POST",
        data: JSON.stringify({
            "RequstId": selReqId,
            "UserId": currUserId
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listSummaryAdditional = [];
            listSummaryAdditional = result.d.listAdditionalItem;
            
            $.each(listSummaryAdditional, function (key, item) {
                isOpt = item.IsOptional == 'True' ? '<span><b>Optional</b></span>' : '';
                htmforAdditional += `<tbody class=""><tr>
                <td>`+ item.Name + `</td>
                <td>`+ numberWithCommas(fixedtwo(item.Price)) + `</td>
                <td>`+ item.Comments + `</td>
                <td>`+ isOpt + `</td>`

                htmforAdditional += `</tr></tbody>`
                });
        },
        // <td>`+ item.OverHead + `</td>
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }

    });
    return htmforAdditional;
}