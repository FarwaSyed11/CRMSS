﻿var selRequest = [];

var listSummaryReports = [];
var listItemViseReports = [];
var AllItemCategory = [];
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
                                            
                                            `+ SummaryReports() +`
                                            </tbody>
                                        </table>
                                        <table>
                                            <div class="float-right w-50">
                                                <div class="p-0"><label class="border w-50 m-0 p-3">Total Cost</label> <label class="border w-50 p-3 m-0 float-right"></label></div>
                                                <div class="p-0"><label class="border w-50 m-0 p-3">Over Head (15%)</label> <label class="border w-50 p-3 m-0 float-right"></label></div>
                                                <div class="p-0"><label class="border w-50 m-0 p-3">Profit Margin (       %)</label> <label class="border w-50 m-0 p-3 float-right"></label></div>
                                                <div class="p-0"><label class="border w-50 m-0 p-3">(         %)  Discount</label> <label class="border w-50 m-0 p-3 float-right"></label></div>
                                                <div class="p-0"><label class="border w-50 m-0 p-3">Net Amount</label> <label class="border w-50 p-3 m-0 float-right"></label></div>
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
    $.ajax({
        url: "EMSItemList.aspx/Reports",
        type: "POST",
        data: JSON.stringify({ "RequstId": selReqId }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listSummaryReports = [];
            listSummaryReports = result.d.listSummary;
            var htm = '';
            
            $.each(listSummaryReports, function (key, item) {
                htm += `<tbody class="summary-tbody"><tr>
                <td>`+ item.Name + `</td>
                <td>`+ item.Equipment + `</td>
                <td>`+ numberWithCommas(parseInt(item.PipeFittings)) + `</td>
                <td>`+ numberWithCommas(parseInt(item.Installation)) + `</td>
                <td>`+ numberWithCommas(parseInt(item.Engineering)) + `</td>
                <td>`+ numberWithCommas(parseInt(item.TestingnCommissioning)) + `</td>
                <td>`+ item.OverHead + `</td>
                <td>`+ item.Total + `</td>`
                htm += `</tr><tbody>`

            });
            htm2return += htm;
        },
        
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
        data: JSON.stringify({ "RequstId": selReqId }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listItemViseReports = [];
            listItemViseReports = result.d.listItemSummary;

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
                    htmLi +=`
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pill-` + stritem + `-tab" data-bs-toggle="pill" data-bs-target="#` + stritem + `-tab" type="button" role="tab" aria-controls="` + stritem + `-tab" aria-selected="false">` + item + `</button>
                            </li>`
                    htmTab += `
                            <div class="tab-pane fade" id="` + stritem + `-tab" role="tabpanel" aria-labelledby="pill-` + stritem + `-tab">
                                                       
                                    <div class="table">
                                        <table class="table project-table w-100 table-responsive" style="height: 540px;overflow-x: hidden;">
                                            <thead style="position: sticky; top: 0;">
                                                <tr>
                                                    <th style="width: 230px !important;" class="align-middle">Category</th>
                                                    <th class="align-middle">Item Code</th>
                                                    <th class="align-middle">Description</th>
                                                    <th class="align-middle">Qty</th>
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
                                <button class="nav-link" id="pill-` + stritem + `-tab" data-bs-toggle="pill" data-bs-target="#` + stritem + `-tab" type="button" role="tab" aria-controls="` + stritem + `-tab" aria-selected="false">` + item + `</button>
                            </li>`
                    htmTab +=  `
                                <div class="tab-pane fade" id="` + stritem + `-tab" role="tabpanel" aria-labelledby="pill-` + stritem + `-tab">
                                                       
                                    <div class="table">
                                        <table class="table project-table w-100 table-responsive" style="height: 540px;overflow-x: hidden;">
                                            <thead style="position: sticky; top: 0;">
                                                <tr>
                                                    <th style="width: 230px !important;" class="align-middle">Category</th>
                                                    <th class="align-middle">Item Code</th>
                                                    <th class="align-middle">Description</th>
                                                    <th class="align-middle">Qty</th>
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
    var htmTfooter = '';
    var Engineering = 0;
    var TestnComm = 0;
    for (var i = 0; i < AllItemCategory.length; i++) {

        var res = listItemViseReports.filter(x => x.Category == AllItemCategory[i] && x.Name == item);

        htm += `<tbody><tr><td><b>` + (i + 1) + `. ` + res[0].Category + `</b></td></tr>`
        $.each(res, function (k, sysItem) {
            
            if ($.trim(sysItem) == "" || $.trim(sysItem) == "null" || $.trim(sysItem) == null || $.trim(sysItem) == undefined) {
                $.trim(sysItem) = `-`;
            }
            htm += `<tr>
                    <td></td>
                    <td> <span class="badge badge-dark fs-6">`+ sysItem.ItemCode + ` <svg class="" xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 24 24">
                            <g fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5">
                                <path d="m17.524 17.524l-2.722 2.723a2.567 2.567 0 0 1-3.634 0L4.13 13.209A3.852 3.852 0 0 1 3 10.487V5.568A2.568 2.568 0 0 1 5.568 3h4.919c1.021 0 2 .407 2.722 1.13l7.038 7.038a2.567 2.567 0 0 1 0 3.634z" />
                                <path d="M9.126 11.694a2.568 2.568 0 1 0 0-5.137a2.568 2.568 0 0 0 0 5.137m3.326 4.392l3.634-3.634" />
                            </g>
                        </svg></span>
                    </td>
                    <td>`+ sysItem.Desc + `</td>
                    <td>`+ parseInt(sysItem.Quantity) + `</td>
                    <td class="text-center">`+ numberWithCommas(parseInt(sysItem.PipeFittingsUP)) + `</td>
                    <td class="text-center">`+ numberWithCommas(parseInt(sysItem.TOTPipeFittings)) + `</td>
                    <td class="text-center">`+ numberWithCommas(parseInt(sysItem.Installation)) + `</td>
                    <td class="text-center">`+ numberWithCommas(parseInt(sysItem.TOTInstallation)) + `</td>
                    <td class="text-center">`+ numberWithCommas((parseInt(sysItem.TOTInstallation) + parseInt(sysItem.TOTPipeFittings))) + `</td></tr>
                    `
            totpf = (parseInt(sysItem.TOTPipeFittings) == undefined ? 0 : parseInt(sysItem.TOTPipeFittings)) + parseInt(totpf);
            totins = (parseInt(sysItem.TOTInstallation) == undefined ? 0 : parseInt(sysItem.TOTInstallation)) + parseInt(totins);
            Engineering = parseInt(sysItem.Engineering);
            TestnComm = parseInt(sysItem.TestingnCommissioning);  
            
        });
        allTOT = totpf + totins;
        
        //allTOT = totpf + totins;
    }
    htm += `` + summaryHTMLfooter(Engineering, TestnComm, allTOT) + ``
    return htm;
  
}
function summaryHTMLfooter(Engineering, TestnComm, allTOT) {
    htmTfooter = `<tr><table><div class="float-right w-50" style="font-size:14px">
                        <div class=""><label class="border w-50 m-0 p-3">Engineering</label> <label class="border w-50 p-3 m-0 float-right">`+ numberWithCommas(Engineering) + ` </label></div>
                        <div class=""><label class="border w-50 m-0 p-3"> Test and Commission </label> <label class="border m-0 w-50 p-3 float-right">`+ numberWithCommas(TestnComm) + `</label></div>
                        <div class=""><label class="border w-50 m-0 p-3">Total</label> <label class="border w-50 p-3 m-0 float-right">` + numberWithCommas(allTOT) + `</label></div>
                      </div>
                  </table></tr>
                 `
    //$('#summaryFooter').html(htmTfooter);
    return htmTfooter;
}

