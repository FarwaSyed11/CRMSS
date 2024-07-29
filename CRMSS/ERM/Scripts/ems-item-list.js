﻿
var listForecast = [], listItems = [], listAllReqs = [];
var objDTWS = [], objDTFCastTrans = [];
var listOpp = [], listRev = [], listForecastReq = [];
var selForecastQuartId = 0, selForecastQuartTransId = 0, selOppId = 0, selRevId = 0, selReqId = 0;
var filterDpIdsList = ['dtFromDate', 'dtToDate', 'dtReqdate']

var monthsNameByNo = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
var quarterDateArr = [
    {
        "Date": new Date().getFullYear() + "-01-01",
        "Name": "Q1"
    },
    {
        "Date": new Date().getFullYear() + "-04-01",
        "Name": "Q2"
    },
    {
        "Date": new Date().getFullYear() + "-07-01",
        "Name": "Q3"
    },
    {
        "Date": new Date().getFullYear() + "-10-01",
        "Name": "Q4"
    }
]
var objAddForeCastQuarter = [];
var achieveperchart = [], projpercchart = [];
var selSalesmanUserId = 0;
var ItemsCodes = ''; var itemCodeArrForAdd = [];
var finalDataParaForReq = [];
var objDTRRF = [], objDTReqs = [];

$(document).ready(function () {

    loadCompany();
    fillYearDDL();

    getAllRequests();
    getAllInvItems();
    // loadOpt('WorkingSheet');
    //$('#rrfDetailsModal').modal('show');

    for (var i = 0; i < filterDpIdsList.length; i++) {
        initiateFilterDatePicker(filterDpIdsList[i]);
    }

    function initiateFilterDatePicker(id) {
        let cbId = '#' + id;
        flatpickr(jQuery(cbId), {
            "disable": [function (date) {
                //return (date.getDay() != 0);      // to enbale sunday only  
                //return date < new Date(AddDays(new Date(), -1));  // desabling all dates before today date                
            }],
            defaultDate: "today",
            enableTime: false,
            noCalendar: false,
            minDate: '0',
            onChange: function (selectedDates, dateStr, instance) {

                // selActFromDate = dateStr;
            }
        });
    }

    //Manager datepicker
    inititateManagerDatepicker();
    //initAchievePercChart(0);
    //initProjPercChart(0);
    var progressBar = {
        Bar: $('#progress-bar'),
        Reset: function () {
            if (this.Bar) {
                this.Bar.find('li').removeClass('active');
                this.Bar.find('li').removeClass('show');
            }
        },
        Next: function () {
            $('#progress-bar li:not(.active):first').addClass('active');
            $('.nav-link li:not(.active):first').addClass('active');
            $('.tab-pane li:not(.active):first').addClass('active');
            $('.tab-pane li:not(.show):first').addClass('show');
        },
        Back: function () {
            $('#progress-bar li.active:last').removeClass('active');
            $('.nav-link li.active:last').removeClass('active');
            $('.tab-pane li.active:last').removeClass('active');
            $('.tab-pane li.show:last').removeClass('show');
        }
    }

    progressBar.Reset();

    ////
    $("#Next").on('click', function () {
        progressBar.Next();

    })
    $("#Back").on('click', function () {

        progressBar.Back();
    })
    $("#Reset").on('click', function () {
        progressBar.Reset();
    });

    $("#nav-Details-tab").on('click', function () {

        $('#progress-bar li:not(.active):first').addClass('active');
        $('.nav-link li:not(.active):first').addClass('active');

        $("#nav-Details-tab").addClass('active');
        $("#nav-Details-tab").addClass('show');

        $("#nav-Structure-tab").removeClass('active');
        $("#nav-Structure-tab").removeClass('show');
        $("#nav-TOC-tab").removeClass('active');
        $("#nav-TOC-tab").removeClass('show');
        $("#nav-Summary-tab").removeClass('active');
        $("#nav-Summary-tab").removeClass('show');
    });
    $("#nav-Structure-tab").on('click', function () {
        $('#progress-bar li.active:first').addClass('active');
        $('.nav-link li.active:first').addClass('active');
        $('#progress-bar li.active:nth-child(2)').addClass('active');
        $('.nav-link li.active:nth-child(2)').addClass('active');

        $("#nav-Structure-tab").addClass('active');
        $("#nav-Structure-tab").addClass('show');

        $("#nav-Details--tab").removeClass('active');
        $("#nav-Details-tab").removeClass('show');
        $("#nav-TOC-tab").removeClass('active');
        $("#nav-TOC-tab").removeClass('show');
        $("#nav-Summary-tab").removeClass('active');
        $("#nav-Summary-tab").removeClass('show');
    });
    $("#nav-TOC-tab").on('click', function () {
        $('#progress-bar li.active:first').addClass('active');
        $('.nav-link li.active:first').addClass('active');
        $('#progress-bar li.active:nth-child(2)').addClass('active');
        $('.nav-link li.active:nth-child(2)').addClass('active');
        $('#progress-bar li.active:nth-child(3)').addClass('active');
        $('.nav-link li.active:nth-child(3)').addClass('active');

        $("#nav-TOC-tab").addClass('active');
        $("#nav-TOC-tab").addClass('show');

        $("#nav-Structure-tab").removeClass('active');
        $("#nav-Structure-tab").removeClass('show');
        $("#nav-Details-tab").removeClass('active');
        $("#nav-Details-tab").removeClass('show');
        $("#nav-Summary-tab").removeClass('active');
        $("#nav-Summary-tab").removeClass('show');

    });
    $("#nav-Summary-tab").on('click', function () {
        $('#progress-bar li.active:first').addClass('active');
        $('.nav-link li.active:first').addClass('active');
        $('#progress-bar li.active:nth-child(2)').addClass('active');
        $('.nav-link li.active:nth-child(2)').addClass('active');
        $('#progress-bar li.active:nth-child(3)').addClass('active');
        $('.nav-link li.active:nth-child(3)').addClass('active');
        $('#progress-bar li.active:nth-child(4)').addClass('active');
        $('.nav-link li.active:nth-child(4)').addClass('active');

        $("#nav-Summary-tab").addClass('active');
        $("#nav-Summary-tab").addClass('show');

        $("#nav-Structure-tab").removeClass('active');
        $("#nav-Structure-tab").removeClass('show');
        $("#nav-TOC-tab").removeClass('active');
        $("#nav-TOC-tab").removeClass('show');
        $("#nav-Details-tab").removeClass('active');
        $("#nav-Details-tab").removeClass('show');
    });

    //const progressBar = document.querySelectorAll(".progress-bar")[0];
    //const StatusBar = document.querySelectorAll(".status-bar")[0];

    //const circles = document.querySelectorAll(".circle");
    //const previousBtn = document.querySelector(".prev-btn");
    //const nextBtn = document.querySelector(".next-btn");
    //const submitBtn = document.querySelector(".submit");

    //let activeStepperIndex = 0;

    //previousBtn.addEventListener("click", function () {
    //    previousBtn.disabled = activeStepperIndex === 0;

    //    activeStepperIndex = Math.max(activeStepperIndex - 1, 0);
    //    const percentageWidth =
    //        (activeStepperIndex / (circles.length - 1)) * 100;
    //    StatusBar.style.width = percentageWidth + "%";
    //    StatusBar.style.backgroundColor = "green";
    //    updateStepper();
    //});

    //nextBtn.addEventListener("click", function () {
    //    activeStepperIndex++;
    //    console.log(activeStepperIndex);
    //    previousBtn.addEventListener("click", function () { });
    //    const percentageWidth =
    //        (activeStepperIndex / (circles.length - 1)) * 100;
    //    StatusBar.style.width = percentageWidth + "%";
    //    StatusBar.style.backgroundColor = "green";

    //    updateStepper();
    //});

    //    function updateStepper() {
    //        previousBtn.disabled = activeStepperIndex === 0;

    //        circles.forEach((circle, index) => {
    //            const checkIcon = circle.querySelector("i");

    //            console.log(index);

    //            if (index === activeStepperIndex) {

    //                checkIcon.style.display = "block";
    //                circle.classList.add("animate");
    //            }
    //            if (activeStepperIndex === circles.length - 1) {
    //                nextBtn.style.display = "none";
    //                submitBtn.style.display = "block";
    //            }

    //            if (index > activeStepperIndex) {
    //                circle.classList.remove("animate")

    //            }
    //            if (!(activeStepperIndex === circles.length - 1)) {
    //                nextBtn.style.display = "block";
    //                submitBtn.style.display = "none";
    //            }

    //        });
    //    }
})

$('#dtFromDate,#dtToDate,#ddlExpiredDaysSalesman').on('change', function () {
    inititateSalesmanDatepicker()
});
$('#ddlExpiredDaysSManager').on('change', function () {
    inititateManagerDatepicker()
});

$('.btnAddStructure').on('click', function () {
    $("#ModalAddStructure").modal('show');
});

function inititateSalesmanDatepicker() {

    flatpickr(jQuery("#dtDueDateSalesman"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);      // to enbale sunday only  
            //return date < new Date(AddDays(new Date(), -1));  // desabling all dates before today date
        }],
        defaultDate: AddDays($('#dtFromDate').val(), $('#ddlExpiredDaysSalesman option:selected').val()),
        enableTime: false,
        noCalendar: false,
        minDate: '0',
        onChange: function (selectedDates, dateStr, instance) {

            // selActFromDate = dateStr;
        }
    });

    flatpickr(jQuery("#dtDueDateManager"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);      // to enbale sunday only  
            //return date < new Date(AddDays(new Date(), -1));  // desabling all dates before today date
        }],
        defaultDate: AddDays($('#dtDueDateSalesman').val(), $('#ddlExpiredDaysSManager option:selected').val()),
        enableTime: false,
        noCalendar: false,
        minDate: '0',
        onChange: function (selectedDates, dateStr, instance) {

            // selActFromDate = dateStr;
        }
    });

}

function inititateManagerDatepicker() {

    flatpickr(jQuery("#dtDueDateManager"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);      // to enbale sunday only  
            //return date < new Date(AddDays(new Date(), -1));  // desabling all dates before today date
        }],
        defaultDate: AddDays($('#dtDueDateSalesman').val(), $('#ddlExpiredDaysSManager option:selected').val()),
        enableTime: false,
        noCalendar: false,
        minDate: '0',
        onChange: function (selectedDates, dateStr, instance) {

            // selActFromDate = dateStr;
        }
    });

}

function fillQuarterDDL(quart, val) {
    var htm = '';
    if (quart == 'Q1') {
        htm += val == 1 ? '<option value="1" selected> 1</option>' : '<option value="1"> 1</option>';
        htm += val == 2 ? '<option value="2" selected> 2</option>' : '<option value="2"> 2</option>';
        htm += val == 3 ? '<option value="3" selected> 3</option>' : '<option value="3"> 3</option>';
    }
    else if (quart == 'Q2') {
        htm += val == 4 ? '<option value="4" selected> 4</option>' : '<option value="4"> 4</option>';
        htm += val == 5 ? '<option value="5" selected> 5</option>' : '<option value="5"> 5</option>';
        htm += val == 6 ? '<option value="6" selected> 6</option>' : '<option value="6"> 6</option>';
    }
    else if (quart == 'Q3') {
        htm += val == 7 ? '<option value="7" selected> 7</option>' : '<option value="7"> 7</option>';
        htm += val == 8 ? '<option value="8" selected> 8</option>' : '<option value="8"> 8</option>';
        htm += val == 9 ? '<option value="9" selected> 9</option>' : '<option value="9"> 9</option>';
    }
    else if (quart == 'Q4') {
        htm += val == 10 ? '<option value="10" selected> 10</option>' : '<option value="10"> 10</option>';
        htm += val == 11 ? '<option value="11" selected> 11</option>' : '<option value="11"> 11</option>';
        htm += val == 12 ? '<option value="12" selected> 12</option>' : '<option value="12"> 12</option>';
    }

    return htm;

}




function showHideRow(row, tbodyClass) {
    let id = "." + tbodyClass + " ." + row

    if ($(id).hasClass('hidden') == true) {
        $(id).removeClass('hidden');

        //below line is because of filter, once we apply filter so it will show and hide when we select data
        $(id).css('display', '');
        $(id).css('display', '')
    }
    else {
        $(id).addClass('hidden');

        //below line is because of filter, once we apply filter so it will show and hide when we select data
        $(id).css('display', 'none');
        $(id).css('display', 'none')
    }
}

function fillYearDDL() {

    var htm = '';
    for (var i = 0; i < 3; i++) {
        let year = new Date().getFullYear() - i;
        htm += '<option value="' + year + '">' + year + '</option>';
    }
    $('#ddlYear').html(htm);
}

function loadCompany() {

    $.ajax({
        url: "EMSItemList.aspx/LoadCompanyDropdown",
        type: "POST",
        //data: JSON.stringify({ "userId": currUserId.val() }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            companyList = '';

            $.each(result.d, function (key, item) {
                if (item.CompanyName == 'Local Sales') {
                    companyList += '<option value="' + item.CompanyName + '" selected>' + item.CompanyName + ' </option>';
                }
                else {
                    companyList += '<option value="' + item.CompanyName + '">' + item.CompanyName + ' </option>';
                }
            });

            $('#ddlCompany').html(companyList);
            //compId = $('#selectTypeOpt option:selected').val();
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}


function initAchievePercChart(value) {

    var options = {
        chart: {
            height: 90,
            type: "radialBar",
            width: 100
        },

        series: [value],
        colors: ["#FF7C88"],
        plotOptions: {
            radialBar: {
                hollow: {
                    margin: 5,
                    size: "40%",
                    background: "#fff"
                },
                track: {
                    background: '#D2D4D4',
                },
                dataLabels: {
                    name: {
                        show: false,
                    },
                    value: {
                        color: "#555",
                        fontSize: "9px",
                        show: true,
                        offsetY: 5
                    }
                }
            }
        },
        fill: {
            type: "gradient",
            gradient: {
                shade: "dark",
                type: "vertical",
                gradientToColors: ["#FE5F8F"],
                stops: [0, 100]
            }
        },
        stroke: {
            lineCap: "straight"
        }
    };

    achieveperchart = new ApexCharts(document.querySelector("#AchievePercChart"), options);
    achieveperchart.render();
}

function initProjPercChart(value) {

    var options = {
        chart: {
            height: 90,
            type: "radialBar",
            width: 100
        },

        series: [value],
        colors: ["#FF7C88"],
        plotOptions: {
            radialBar: {
                hollow: {
                    margin: 5,
                    size: "40%",
                    background: "#fff"
                },
                track: {
                    background: '#D2D4D4',
                },
                dataLabels: {
                    name: {
                        show: false,
                    },
                    value: {
                        color: "#555",
                        fontSize: "9px",
                        show: true,
                        offsetY: 5
                    }
                }
            }
        },
        fill: {
            type: "gradient",
            gradient: {
                shade: "dark",
                type: "vertical",
                gradientToColors: ["#FE5F8F"],
                stops: [0, 100]
            }
        },
        stroke: {
            lineCap: "straight"
        }
    };

    projpercchart = new ApexCharts(document.querySelector("#ProjPercChart"), options);
    projpercchart.render();
}


$('#btn-add-req-grid').on('click', function () {
    selForecastQuartId = 0;
    $('.item-table-viewonly').addClass('hidden');
    clearReqControls();

    $('.btnSubmit').addClass('hidden');
    $('#addReqModal').modal('show');

})


function getAllRequests() {

    $.ajax({
        url: "EMSItemList.aspx/GetAllReqs",
        data: JSON.stringify({ 'UserId': currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listAllReqs = result.d;

            var htm = '';
            $('.tbody-esti-req td').length > 0 ? objDTReqs.destroy() : '';

            $.each(listAllReqs, function (key, item) {

                htm += `<tr> 
                    <td> <span style="color:#1ca9ef;cursor:pointer;"> `+ item.OptNo + ` </span> </td>
                    <td> `+ item.RefNo + `</td>                 
                    <td> `+ item.CreatedDate + `</td>
                    <td> `+ item.Status + `</td>
                    <td> `+ item.CreatedDate + `</td>
                    <td> `+ item.CreatorName + `</td>`

                htm += `<td class="riskActions" style="text-align:right;">`
                htm += `<span style="margin-left: 4%;"><i class="bx bxs-info-circle fa-icon-hover ibtn-estireq-details" title="Details Estimation Request" data-optno="` + item.OptNo + `" data-reqid="` + item.ReqId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>`
                htm += `</td>`
                htm += `</tr>`;
            });
            $('.tbody-esti-req').html(htm);
            initiateReqDT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateReqDT() {
    objDTReqs = [];
    objDTReqs = $('.esti-req-table').DataTable({
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
            { width: "120px", targets: [0] },
            { orderable: false, targets: [6] }
        ],
        //select: true,
        //colReorder: true
    });

}






function DrawTableForSelectedItems() {
    $('.item-table-viewonly').removeClass('hidden');
    var htm = '';

    $.each(ItemsCodes.split(','), function (key, item) {
        var res = listItems.filter(x => x.ItemCode == item);
        if (res.length > 0) {
            //htm += `<tr> 
            //        <td style="width:52px !important">
            //            <div for="cbItem-` + key + `"> <i class="fa fa-times" aria-hidden="true" style="color: #ff4c4c;font-size: 21px;" data-itemcode="` + res[0].ItemCode + `"></i> </div>
            //        </td>
            //        <td> <span style="color:#1ca9ef;cursor:pointer;">`+ res[0].ItemCode + `</span> </td>                 
            //        <td> `+ res[0].Desc + `</td>`
            //htm += `</tr>`;

            htm += `<tr> 
                    <td style="width:52px !important">
                         <div for="cbItem-` + key + `"> <i class="fa fa-times" aria-hidden="true" style="color: #ff4c4c;font-size: 21px;" data-itemcode="` + res[0].ItemCode + `"></i> </div>
                    </td>
                    <td> <span style="color:#1ca9ef;cursor:pointer;">`+ res[0].ItemCode + `</span> </td>                 
                    <td> <input class="txtCustomClass" type="text" placeholder="Enter amount" value="" id="txtqtyvalue-`+ key + `" maxlength="12" onkeypress='return event.charCode >= 48 && event.charCode <= 57'> </td>
                    <td> `+ res[0].Desc + `</td> 
                    <td class="hidden"> `+ res[0].InvItemId + `</td> 
                    <td class="hidden"> `+ res[0].PrimaryUOMCode + `</td>`
            htm += `</tr>`;
        }
    })
    $('.tbody-items-list-viewonly').html(htm);
}


$('.btn-item-list').on('click', function () {
    $('#addItemsListModal').modal('show');
})

$('.btnSaveItem').on('click', function () {
    ItemsCodes = '';
    $(".tbody-items-list input[name=cb-items]:checked").each(function () {
        ItemsCodes += $(this).data('itemcode') + ',';
    });
    ItemsCodes = removeCommaFromLast(ItemsCodes);
    DrawTableForSelectedItems();

    $('#addItemsListModal').modal('hide');
});

function getAllInvItems() {

    $.ajax({
        url: "EMSItemList.aspx/GetAllInvItems",
        data: JSON.stringify({ 'UserId': currUserId, 'Status': 'ALL' }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listItems = result.d;

            var htm = '';
            $('.tbody-items-list td').length > 0 ? objDTRRF.destroy() : '';

            $.each(listItems, function (key, item) {

                htm += `<tr> 
                    <td style="width:52px !important">
                        <div for="cbItem-` + key + `" style="display: flex;justify-content: center;"> <input class="form-check-input" type="checkbox" name="cb-items" value="" id="cbItem-` + key + `" data-itemcode="` + item.ItemCode + `" /> </div>
                    </td>
                    <td> <span style="color:#1ca9ef;cursor:pointer;">`+ item.ItemCode + `</span> </td>                 
                    <td> `+ item.Desc + `</td>`

                htm += `</tr>`;
            });
            $('.tbody-items-list').html(htm);
            initiateRRFDT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateRRFDT() {
    objDTRRF = [];
    objDTRRF = $('.item-table').DataTable({
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

$('.tbody-esti-req').on('click', '.ibtn-fcastquart-edit,.ibtn-estireq-details', function () {

    let selAction = $(this)[0].title.trim();
    selReqId = $(this).data('reqid');
    let selOptNo = $(this).data('optno');
    
    var res = listAllReqs.filter(s => s.ReqId == selReqId);

    selectedReq(res);
    if (selAction == "Edit ForecastQuarter") {
        $('.btnSubmit').removeClass('hidden')
        $('#dtFromDate').val(res[0].FromDate.split(" ")[0])
        $('#dtToDate').val(res[0].ToDate.split(" ")[0])
        $('#ddlQuarter').val(res[0].Quarter)
        $('#ddlCompany').val(res[0].Company)

        $('#ddlExpiredDaysSalesman').val(res[0].DueDaysSalesman)
        $('#dtDueDateSalesman').val(AddDays(res[0].DueDateSalesman, 0))

        $('#ddlExpiredDaysSManager').val(res[0].DueDaysSalesManager)
        $('#dtDueDateManager').val(AddDays(res[0].DueDateSalesManager, 0))


        $('#addReqModal').modal('show');
    }
    else if (selAction == "Details Estimation Request") {

        bindValueForLabels(res);
        $('#addReqModal').modal('show');
        $('.ajax-loader').removeClass('hidden');
        setTimeout(function () {
            //loadForecastRequests(res[0].Company);
            $(".ajax-loader").addClass('hidden');
        }, 200);
    }

});

function bindValueForLabels(data) {

    $('#txtEstRef').html(data[0].RefNo);
    $('#txtRevision').html(data[0].RevNo)
    $('#txtContrAbbr').html(data[0].ContABBR)
    $('#txtEstYear').html(data[0].Year)
    $('#txtOppRef').html(data[0].OptNo)
    $('#txtProjRef').html(data[0].ProjectNumber)
       
    $('#txtPrjName').html(data[0].ProjectName)
    $('#txtPrjLocation').html(data[0].Location)
    $('#txtPrjClient').html(data[0].Client)
    $('#txtPrjConsultant').html(data[0].Consultant)
    $('#txtPrjMainContr').html(data[0].MainContractor)
    $('#txtPrjMEPContr').html(data[0].MEPContractor)
    $('#txtPrjContactPerson').html(data[0].ContactID)
    $('#txtPrjWinningPerc').html(data[0].WinPerc)
    $('#txtPrjBudget').html(data[0].Budget)
    $('#txtPrjURL').html(data[0].URL)
    $('#ddlEstimationTeamOrg').val(data[0].EstimationOrg)
    $('#txtSalesman').html(data[0].Salesman)
    $('#txtMarketing').html(data[0].Marketing)

    $("input[name=Stage][value='"+ data[0].Stage + "']").attr('Checked', true)
    $("input[name=Supply][value='"+ data[0].Scope + "']").attr('Checked', true)
    $("input[name=Quotation][value='" + data[0].QuotationType + "']").attr('Checked', true)


}


$('.btnAddUpdateReq').on('click', function () {

    itemCodeArrForAdd = [];

    //$.each(ItemsCodes.split(','), function (key, item) {
    //    var dataItem = {};

    //    var res = listItems.filter(x => x.ItemCode == item);
    //    dataItem["InvItemId"] = res[0].InvItemId;
    //    dataItem["Desc"] = res[0].Desc;
    //    dataItem["ItemCode"] = res[0].ItemCode;
    //    dataItem["PrimaryUOMCode"] = res[0].PrimaryUOMCode;
    //    itemCodeArrForAdd.push(dataItem);
    //})

    //finalDataParaForReq = {  
    //    'listInv': itemCodeArrForAdd
    //}

    $('.tbody-items-list-viewonly tr').each(function () {

        var dataItem = {};

        dataItem["InvItemId"] = $(this).children().eq(4).text().trim();
        dataItem["Desc"] = $(this).children().eq(3).text().trim();
        dataItem["ItemCode"] = $(this).children().eq(1).text().trim();
        dataItem["PrimaryUOMCode"] = $(this).children().eq(5).text().trim();
        dataItem["Quantity"] = $(this).children().eq(2).children().eq(0).val().trim();
        itemCodeArrForAdd.push(dataItem);
    })
    finalDataParaForReq = {
        'listInv': itemCodeArrForAdd
    }


    var btnClicked = $(this).text().trim();

    if (btnClicked == "Create") {
        if (selForecastQuartId == 0) {
            addUpdateReq('Request created successfully');
        }
        else {
            objAddForeCastQuarter = {
                "ForecastQuartId": selForecastQuartId,
                "Status": 'DRAFT',
                "Year": $('#ddlYear option:selected').val(),
                "FromDate": $('#dtFromDate').val(),
                "ToDate": AddDays(quarterDateArr.filter(s => s.Name == $('#ddlQuarter option:selected').val())[0].Date, 90),
                "Quarter": $('#ddlQuarter option:selected').val()
            }
            addUpdateReq('Request updated successfully');
        }

    }



});

function addUpdateReq(msg) {

    $.ajax({
        url: "EMSItemList.aspx/AddUpdateReq",
        data: JSON.stringify({
            'data': finalDataParaForReq,
            'OptNo': $('#txtOPTNo').val(),
            'ReqNo': $('#txtReqNo').val(),
            'ReqDate': $('#dtReqdate').val(),
            'UserId': currUserId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success(msg, '');

            selForecastQuartId = result.d;
            getAllRequests();
            $('#addReqModal').modal('hide');
            //getAllProjects();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function clearReqControls() {
    $('#txtOPTNo,#txtReqNo,#dtReqdate').val('');
    $('.tbody-items-list-viewonly').html('');
    $('.tbody-items-list [name=cb-items]').prop('checked', false);
}


function loadForecastRequests(pCompany) {
    $.ajax({
        url: "EMSItemList.aspx/GetAllForecastReqs",
        data: JSON.stringify({
            'UserId': currUserId,
            'Status': 'ALL',
            'Quarter': '-1',
            'Year': -1,
            'Company': pCompany
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('.tbody-forecast-req td').length > 0 ? objDTFCastTrans.destroy() : '';
            listForecastReq = result.d;

            var htm = '';
            $.each(listForecastReq, function (key, item) {
                //<i class='bx bx-plus drilldown-td'></i>
                htm += `<tr> 
                    <td style="text-align: left;"> `+ item.Salesman + `</td>                 
                    <td> `+ item.Company + `</td>
                    <td> `+ item.Status + ` </td>                          
                    <td> `+ item.Quarter + ` </td>                          
                    <td> `+ getDateInWordsFormat(item.FromDate.split(" ")[0]) + ` - ` + getDateInWordsFormat(item.ToDate.split(" ")[0]) + ` </td>                        
                    <td> `+ item.Manager + ` </td>                        
                    <td> `+ item.CreatedBy + ` </td>                        
                                           
                    <td class="riskActions" style="text-align:right;"> `

                htm += `<span style="margin-left: 4%;">
<i class="bx bx-trending-up fa-icon-hover ibtn-forecasttrans-details" title="Forecast Details" data-userid="`+ item.SalesmanUserId + `" data-fcastquarterid="` + item.ForecastQuartId + `" data-fcasttransid="` + item.ForecastQuartTransId + `" style="color:#249af5; cursor:pointer;font-size: x-large;"></i> 
</span>`
                if (item.Status == "APPROVED" || item.Status == "PENDING MANAGER") {
                    htm += `<span style="margin-left: 4%;">
<i class="bx bx-repost fa-icon-hover ibtn-forecasttrans-reopen" title="Forecast Reopen" data-userid="`+ item.SalesmanUserId + `" data-fcastquarterid="` + item.ForecastQuartId + `" data-fcasttransid="` + item.ForecastQuartTransId + `" style="color:#f5242fd9; cursor:pointer;font-size: x-large;"></i> 
</span>`;
                }
                htm += `</td></tr>`

            });
            $('.tbody-forecast-req').html(htm);
            initiateFCastDT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateFCastDT() {
    objDTFCastTrans = [];
    objDTFCastTrans = $('.tbl-forecast-req').DataTable({
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
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [7] }
        ]
        //select: true,
        //colReorder: true
    });

}

$('.tbody-forecast-req').on('click', '.ibtn-forecasttrans-details,.ibtn-forecasttrans-reopen', function () {

    let selAction = $(this)[0].title.trim();

    selSalesmanUserId = $(this).data('userid')
    selForecastQuartId = $(this).data('fcastquarterid')
    selForecastQuartTransId = $(this).data('fcasttransid')

    if (selAction == 'Forecast Details') {

        loadOptForForecasted('Forecasted');
        ResetModal('rrfDetailsModal');

        ResetModal("rrfDetailsModal");
        let res = listForecastReq.filter(s => s.ForecastQuartTransId == selForecastQuartTransId)
        $('.rrfreq-det-modaltitle').html(res[0].Quarter + "/" + res[0].Year + " - " + res[0].Salesman)
        $('#rrfDetailsModal').modal('show');
    }
    else if (selAction == 'Forecast Reopen') {

        $('#ForecastReopenModal').modal('show');
    }

})

$('.btnReopenForecast').on('click', function () {

    var selAction = $('input[name="cb_reopenforecast"]:checked')[0].title;

    if (selAction == 'Reopen For Sales Manager') {
        ReopenForecastRequest('Request Re-Open for Manager Successfully', 'PENDING MANAGER')
    }
    else if (selAction == 'Reopen For Salesman') {
        ReopenForecastRequest('Request Re-Open for Salesman Successfully', 'PENDING SALESMEN')
    }
})


function ReopenForecastRequest(msg, st) {
    let res = listItems.filter(s => s.ForecastQuartId == selForecastQuartId)

    //'UserId': currUserId,
    //'Quarter': res[0].Quarter,
    //'Year': res[0].Year,

    $.ajax({
        url: "EMSItemList.aspx/ReOpenForecastRequest",
        data: JSON.stringify({
            'ForecastTransId': selForecastQuartTransId,
            'Status': st
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success(msg, '');
            $('#ForecastReopenModal').modal('hide');

            loadForecastRequests(res[0].Company);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}










function loadOpt(tabname) {
    let res = listItems.filter(s => s.ForecastQuartId == selForecastQuartId)
    $.ajax({
        url: "EMSItemList.aspx/GetAllOppnRev",
        data: JSON.stringify({ 'UserId': selSalesmanUserId, 'Status': 'ALL', 'TabName': tabname, 'Quarter': res[0].Quarter, 'Year': res[0].Year }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            listOpp = result.d.listOpp;
            listRev = result.d.listRev;

            var htm = '';
            $.each(listOpp, function (key, item) {
                //<i class='bx bx-plus drilldown-td'></i>
                htm += `<tr onclick="showHideRow('hidden_row` + key + `','tbody-worksheet');"> 
                    <td style="text-align: left;">  <span class="badge task-status-cancelled">`+ item.OppNo + `</span> </td>                 
                    <td> `+ item.OppName + `</td>
                    <td> `+ item.Customer + ` </td>                          
                    <td> `+ item.Consultant + ` </td>                          
                    <td> `+ item.Marketing + ` </td>                        
                                           
                    <td class="riskActions" style="text-align:right;"> `

                //htm += `<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-wsheetopp-delete" title="Delete Opp" data-oppid="` + item.OppId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`
                htm += `</td></tr>`

                let rev = listRev.filter(xx => xx.OppId == item.OppId);
                if (rev.length > 0) {

                    htm += `<tr class="hidden_row` + key + ` hidden">
                            <td colspan="6">
                            <table style="width:100%;">
                            <tr class="hidden_row` + key + ` sub-tabl-bg" style="text-align:center;"> <td>S.No</td> <td>Product</td> <td>Sub Stage</td> <td>Qouted Value</td> <td>Forecast Value</td> <td>Month</td> <td>Action</td> </tr>`;
                    $.each(rev, function (key1, item) {

                        htm += `<tr style="text-align:center;" id="hidden_row` + key + ` accordian-info" class="hidden_row` + key + ` hidden">`
                        htm += `<td>` + (key1 + 1) + `</td>
                                <td>` + item.ProductName + `</td>
                                <td>`+ item.SubStage + `</td> 
                                <td>`+ parseInt(item.Value).toLocaleString("en-US") + `</td> 
                                <td> <input class="txtCustomClass" type="text" placeholder="Enter amount" value="" id="txtvalue-`+ key1 + `" maxlength="12" onkeypress='return event.charCode >= 48 && event.charCode <= 57'></td>
                                <td> <select id="ddlmonth-`+ key1 + `" class="ddlCustomClass color-dropdown"> ` + fillQuarterDDL(res[0].Quarter, 0) + `</select> </td>  
                                <td>
</td>`;
                        //<span style="margin-left: 4%;"><i class="bx bxs-save fa-icon-hover ibtn-wsheetrev-save" title="Save Opp" data-revid="`+ item.RevId + `" data-oppid="` + item.OppId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
                        //    <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-wsheetrev-delete" title="Delete Opp" data-revid="`+ item.RevId + `" data-oppid="` + item.OppId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>

                        htm += `</tr>`;
                    });
                    htm += `</table> </td></tr>`;
                }
                else {

                    htm += `<tr id="hidden_row` + key + ` accordian-info" class="hidden_row` + key + ` hidden">                                                 
                                 <td>No Revenue(s) Found!</td>
                     </tr>`
                }

            });
            $('.tbody-worksheet').html(htm);
            //initiateRRFDT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function loadOptForForecasted(tabname) {

    let res = listItems.filter(s => s.ForecastQuartId == selForecastQuartId)
    $.ajax({
        url: "EMSItemList.aspx/GetAllOppnRev",
        data: JSON.stringify({ 'UserId': selSalesmanUserId, 'Status': 'ALL', 'TabName': tabname, 'Quarter': res[0].Quarter, 'Year': res[0].Year }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            listOpp = result.d.listOpp;
            listRev = result.d.listRev;

            var htm = '';
            $.each(listOpp, function (key, item) {
                //<i class='bx bx-plus drilldown-td'></i>
                htm += `<tr onclick="showHideRow('hidden_row` + key + `', 'tbody-forecasted');"> 
                    <td style="text-align: left;">  <span class="badge task-status-cancelled">`+ item.OppNo + `</span> </td>                 
                    <td> `+ item.OppName + `</td>
                    <td> `+ item.Customer + ` </td>                          
                    <td> `+ item.Consultant + ` </td>                          
                    <td> `+ item.Marketing + ` </td>                        
                                           
                    <td class="riskActions" style="text-align:right;"> `

                //htm += `<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-wsheetopp-delete" title="Delete Opp" data-oppid="` + item.OppId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`
                htm += `</td></tr>`

                let rev = listRev.filter(xx => xx.OppId == item.OppId);
                if (rev.length > 0) {

                    htm += `<tr class="hidden_row` + key + ` hidden">
                            <td colspan="6">
                            <table style="width:100%;">
                            <tr class="hidden_row` + key + ` sub-tabl-bg" style="text-align:center;"> <td>S.No</td> <td>Product</td> <td>Sub Stage</td> <td>Qouted Value</td> <td>Forecast Value</td> <td>Month</td> <td>Action</td> </tr>`;
                    $.each(rev, function (key1, item) {

                        htm += `<tr style="text-align:center;" id="hidden_row` + key + ` accordian-info" class="hidden_row` + key + ` hidden">`
                        htm += `<td>` + (key1 + 1) + `</td>
                                <td>` + item.ProductName + `</td>
                                <td>`+ item.SubStage + `</td> 
                                <td>`+ parseInt(item.Value).toLocaleString("en-US") + `</td> 
                                <td> <input class="txtCustomClass" type="text" placeholder="Enter amount" value="`+ parseInt(item.ForecastTransValue).toLocaleString("en-US") + `" id="txtvalue-` + key1 + `" maxlength="12" onkeypress='return event.charCode >= 48 && event.charCode <= 57'></td>
                                <td> <select id="ddlmonth-`+ key1 + `" class="ddlCustomClass color-dropdown"> ` + fillQuarterDDL(res[0].Quarter, item.ForecastTransMonth) + `</select> </td>  
                                <td></td>`;
                        //<span style="margin-left: 4%;"><i class="bx bxs-save fa-icon-hover ibtn-wsheetrev-save" title="Save Opp" data-revid="`+ item.RevId + `" data-oppid="` + item.OppId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
                        //    <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-wsheetrev-delete" title="Delete Opp" data-revid="`+ item.RevId + `" data-oppid="` + item.OppId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
                        htm += `</tr>`;
                    });
                    htm += `</table> </td></tr>`;
                }
                else {

                    htm += `<tr id="hidden_row` + key + ` accordian-info" class="hidden_row` + key + ` hidden">                                                 
                                 <td>No Revenue(s) Found!</td>
                     </tr>`
                }

            });
            $('.tbody-forecasted').html(htm);
            //initiateRRFDT();
            loadFrecastedBoxCountnValues();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function loadOptForNotForecasted(tabname) {

    let res = listItems.filter(s => s.ForecastQuartId == selForecastQuartId)
    $.ajax({
        url: "EMSItemList.aspx/GetAllOppnRev",
        data: JSON.stringify({ 'UserId': selSalesmanUserId, 'Status': 'ALL', 'TabName': tabname, 'Quarter': res[0].Quarter, 'Year': res[0].Year }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            listOpp = result.d.listOpp;
            listRev = result.d.listRev;

            var htm = '';
            $.each(listOpp, function (key, item) {
                //<i class='bx bx-plus drilldown-td'></i>
                htm += `<tr onclick="showHideRow('hidden_row` + key + `','tbody-notforecasted');"> 
                    <td style="text-align: left;">  <span class="badge task-status-cancelled">`+ item.OppNo + `</span> </td>                 
                    <td> `+ item.OppName + `</td>
                    <td> `+ item.Customer + ` </td>                          
                    <td> `+ item.Consultant + ` </td>                          
                    <td> `+ item.Marketing + ` </td>                        
                                           
                    <td class="riskActions" style="text-align:right;"> `

                // htm += `<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-wsheetopp-delete" title="Delete Opp" data-oppid="` + item.OppId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`
                htm += `</td></tr>`

                let rev = listRev.filter(xx => xx.OppId == item.OppId);
                if (rev.length > 0) {

                    htm += `<tr class="hidden_row` + key + ` hidden">
                            <td colspan="6">
                            <table style="width:100%;">
                            <tr class="hidden_row` + key + ` sub-tabl-bg" style="text-align:center;"> <td>S.No</td> <td>Product</td> <td>Sub Stage</td> <td>Qouted Value</td> <td>Forecast Value</td> <td>Month</td> <td>Action</td> </tr>`;
                    $.each(rev, function (key1, item) {

                        htm += `<tr style="text-align:center;" id="hidden_row` + key + ` accordian-info" class="hidden_row` + key + ` hidden">`
                        htm += `<td>` + (key1 + 1) + `</td>
                                <td>` + item.ProductName + `</td>
                                <td>`+ item.SubStage + `</td> 
                                <td>`+ parseInt(item.Value).toLocaleString("en-US") + `</td> 
                                <td> <input class="ddlCustomClass" type="text" placeholder="Enter amount" value="`+ parseInt(item.ForecastTransValue).toLocaleString("en-US") + `" id="txtvalue-` + key1 + `" maxlength="12" onkeypress='return event.charCode >= 48 && event.charCode <= 57'></td>
                                <td> <select id="ddlmonth-`+ key1 + `" class="ddlCustomClass color-dropdown"> ` + fillQuarterDDL(res[0].Quarter, item.ForecastTransMonth) + `</select> </td>  
                                <td></td>`;
                        //<span style="margin-left: 4%;"><i class="bx bxs-save fa-icon-hover ibtn-wsheetrev-save" title="Save Opp" data-revid="`+ item.RevId + `" data-oppid="` + item.OppId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
                        //    <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-wsheetrev-delete" title="Delete Opp" data-revid="`+ item.RevId + `" data-oppid="` + item.OppId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
                        htm += `</tr>`;
                    });
                    htm += `</table> </td></tr>`;
                }
                else {

                    htm += `<tr id="hidden_row` + key + ` accordian-info" class="hidden_row` + key + ` hidden">                                                 
                                 <td>No Revenue(s) Found!</td>
                     </tr>`
                }

            });
            $('.tbody-notforecasted').html(htm);
            //initiateRRFDT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadFrecastedBoxCountnValues() {
    let res = listForecastReq.filter(s => s.ForecastQuartTransId == selForecastQuartTransId)
    $.ajax({
        url: "ForecastSalesman.aspx/GetCountValForForecasted",
        data: JSON.stringify({ 'UserId': selSalesmanUserId, 'Quarter': res[0].Quarter, 'Year': res[0].Year, 'PageName': 'ForecastSalesman', 'ForecastQuartTransId': selForecastQuartTransId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.fctd-box-totaltarget,.fctd-box-YODT,.fctd-box-achievement,.fctd-box-remaintarget,.fctd-box-forecastedvalue,.fctd-box-projachievement').html('-')
            if (result.d.length > 0) {
                $('.fctd-box-totaltarget').html(nFormatter(result.d[0].Target));
                $('.fctd-box-YODT').html(nFormatter(result.d[0].YODTarget));
                $('.fctd-box-achievement').html(nFormatter(result.d[0].Achievement));
                $('.fctd-box-remaintarget').html(nFormatter(result.d[0].RemainingTarget));
                $('.fctd-box-forecastedvalue').html(nFormatter(result.d[0].ForecastValue));
                $('.fctd-box-projachievement').html(nFormatter(result.d[0].ProjectedAchievement));
            }

            achieveperchart.destroy()
            projpercchart.destroy()
            initAchievePercChart(parseFloat(result.d[0].AchievementPerc).toFixed(1));
            initProjPercChart(parseFloat(result.d[0].ProjectedPerc).toFixed(1));
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.tbody-worksheet').on('click', '.ibtn-wsheetopp-delete', function () {
    alert('1');
})

$('.tbody-worksheet').on('click', '.ibtn-wsheetrev-save,.ibtn-wsheetrev-delete', function () {

    selOppId = $(this).data('oppid')
    selRevId = $(this).data('revid')

    let amount = $(this).parent().parent().parent().children().eq(3).children().val();
    let month = $(this).parent().parent().parent().children().eq(4).children().val();

    if (amount != "" && month != "") {
        addOppRevAsForecasted(amount, month, $(this));
    }
    else {
        toastr.error('Please input the amount & month before save.', '');
    }
})

$("#txtFilterWorkSht").on("keyup", function () {
    var value = $(this).val().toLowerCase();
    $("#tab-WorkingSheet .tbl-worksheet tr").filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
});

$('.ul-forecast').on('click', 'li', function () {
    let liName = $(this).children().text().trim();

    if (liName == 'Working Sheet') {
        loadOpt('WorkingSheet')
    }
    else if (liName == 'Forecasted') {
        loadOptForForecasted('Forecasted')

        let res = listItems.filter(s => s.ForecastQuartId == selForecastQuartId)

        if (listOpp.length == 0 || listRev.length == 0 || res[0].Status == 'APPROVED' || res[0].Status == 'REJECTED') {
            $('#btn-submit-forecasted-opp').addClass('hidden');
        } else {
            $('#btn-submit-forecasted-opp').removeClass('hidden');
        }

    }
    else if (liName == 'Not Forecasted') {
        loadOptForNotForecasted('NotForecasted')
    }


});

/*
 * ******************JS Stepper <starts> *************************************
 *
 */


/*
 * ******************JS Stepper <ends> *************************************
 *
 */




//Common function
function getStatusCss(st) {
    var cssClassForStatus = '';

    if (st == 'DRAFT' || st == 'SUBMITTED') {
        cssClassForStatus = 'rrf-status-draft';
    }
    else if (st == 'Completed' || st == 'APPROVED') {
        cssClassForStatus = 'rrf-status-approve';
    }
    else if (st == 'Cancelled' || st == 'REJECTED') {
        cssClassForStatus = 'rrf-status-reject';
    }
    else {
        cssClassForStatus = 'rrf-status-pending';
    }
    return cssClassForStatus;
}

function getDateInWordsFormat(dt) {
    return monthsNameByNo[new Date(dt).getMonth()] + ', ' + new Date(dt).getDate() + ' ' + new Date(dt).getFullYear();
}
function getTodayDate() {
    return new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate();
}

function ResetModal(modId) {

    let modalid = "#" + modId;

    $(modalid + ' button').removeClass('active');
    $(modalid + ' li:eq(0) button').addClass('active');

    $(modalid + ' .tab-content .tab-pane').removeClass('active show')
    $(modalid + ' .tab-content .tab-pane:eq(0)').addClass('active show')

}

function AddDays(dt, nod) {
    let finalDate = new Date(new Date(dt).setDate(new Date(dt).getDate() + (nod == "" ? 0 : parseInt(nod))));
    return finalDate.getFullYear() + '-' + ((finalDate.getMonth() + 1) < 10 ? ("0" + (finalDate.getMonth() + 1)) : (finalDate.getMonth() + 1)) + '-' + finalDate.getDate();
}
function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}
function nFormatter(num) {

    if (num >= 1000000000000) {
        return (num / 1000000000000).toFixed(1).replace(/\.0$/, '') + 'T';
    }
    else if (num >= 1000000000) {
        return (num / 1000000000).toFixed(1).replace(/\.0$/, '') + 'B';
    }
    else if (num >= 1000000) {
        return (num / 1000000).toFixed(1).replace(/\.0$/, '') + 'M';
    }
    else if (num >= 1000) {
        return (num / 1000).toFixed(1).replace(/\.0$/, '') + 'K';
    }
    return num;
}
