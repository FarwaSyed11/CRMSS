var EventId = '';
var objDatatable = [];
var dpEventStart = [];
var dpEventEnd = [];
var dpEventBuildUp = [];
var dpDesignDeadline = [];
var selActFromDate = '';
var selActToDate = '';
var selActBuildUp = '';
var selDesignDeadline = '';
var SumSpAndStCost = '';
var SumMktOrAd = '';
var SumVisaAndTrv = '';
var SumOperExp = '';
var GrandSum = '';
var TextBoxId = ''
var CheckBoxId = '';

var ActualSumSpAndStCost = '';
var ActualSumMktOrAd = '';
var ActualSumVisaAndTrv = '';
var ActualSumOperExp = '';
var ActualGrandSum = '';
var ActualTextBoxId = ''
var ActualCheckBoxId = '';
var ApproveStatus = '';
var ReqStatus = '';
var RoleId = '';
var ddListEmp = [], selEmpNos = '';
var existingAttendees = [];
var TempId = '';

$(document).ready(function () {

    if (myroleList.includes("8131")) {
        $('#btnAddNewEvent').css('display', '');
        
    }
    else {
        $('#btnAddNewEvent').css('display', 'none');
    }

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {

        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);


   
    document.getElementById("txtDateFrom").valueAsDate = new Date();
    document.getElementById("txtDateTo").valueAsDate = new Date();
    document.getElementById("txtBuilUpDate").valueAsDate = new Date();
    document.getElementById("txtDesignDeadLine").valueAsDate = new Date();

});

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.Event-table-details').DataTable({
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


function GetTableDetails(Loader) {

    $.ajax({
        url: "BriefForm.aspx/GetTableBasicDetails",
        data: JSON.stringify({ "UserId": currUserId,}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Event tr').length > 0 ? objDatatable.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.ReferenceNumb + `</td>
                  <td style="text-align:center;">`+ item.EventName + `</td>
                  <td style="text-align:center;">`+ item.Venue + `</td>
                  <td style="text-align:center;">`+ item.ShowDateFrom + `</td>
                  <td style="text-align:center;">`+ item.ShowDateTo + `</td>
                  <td style="text-align:center;">`+ item.HallAndStandNumb + `</td>
                   <td style="text-align:center;"><span class="`+ item.StatusClass + `" style="cursor:pointer;" onclick=statusview(` + item.Id + `,"` + item.Status+`")>` + item.Status + `</span></td>
                   <td style="text-align:center;">`+ item.CreatedBy + `</td>
                   <td style="text-align:center;">`+ item.CreatedDate + `</td>
                   <td style="text-align:center;display:none;">`+ item.RoleID + `</td>
                    <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                    <img src="Images/icon-eye.png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" />
                    </a></td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Event').html(htm);

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

$('.tbody-Event').on('click', '.ibtn-Request-Details', function () {

    ClearEventbasicDetails();
    $('.Update-Basic_Info').css('display', 'none');
    EventId = this.parentNode.parentNode.parentNode.children[0].textContent;
    RoleId = this.parentNode.parentNode.parentNode.children[10].textContent;
    GetEventBasicDet();
    SetForm();
    BudgetFormate();
    SubmitValidation();
    EventSDFormDetails();
    SetButtonFormateIntially();
    setFormForSubmit();
    GetRequestAccess();
    GetApprovalStatusDet();
    $('.Template-Image').css('display', 'none');
    GetTemlateDet();
    $('.More-Det').css('display', '');
    $('#ModalBriefForm').modal('show');

});
function SetButtonFormateIntially() {
    $('#btnSDinfo').addClass('active');
    $('#tab-SDInform').addClass('show active');
    $('#btnProductOrItem').removeClass('active');
    $('#tab-ProductOrItem').removeClass('show active');

    $('#btnAppStatus').removeClass('active');
    $('#tab-AppStatus').removeClass('show active');

    $('#btnTemplate').removeClass('active');
    $('#tab-Template').removeClass('show active');

    $('#btnBudgetReq').removeClass('active');
    $('#tab-Budget').removeClass('show active');
    $('#btnAttendees').removeClass('active');
    $('#tab-Attendees').removeClass('show active');

    $('#btnSaveStndDesignInfo').css('display', 'block');
    $('#btnSaveBudgetReq').css('display', 'none');
    $('#btnSaveAttendees').css('display', 'none');
}

function GetEventBasicDet() {

    $.ajax({
        url: "BriefForm.aspx/GetEventBasicDetails",
        data: JSON.stringify({ "EventId": EventId, "User": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtRefNo').val(result.d[0].ReferenceNumb);
            $('#txtEventName').val(result.d[0].EventName);
            $('#txtVenue').val(result.d[0].Venue);
            $('#txtDateFrom').val(result.d[0].ShowDateFrom);
            $('#txtDateTo').val(result.d[0].ShowDateTo);
            $('#txtDiLx').val(result.d[0].Length);
            $('#txtDiWx').val(result.d[0].Width);
            $('#txtDiH').val(result.d[0].Height);
            $('#txtHallAndStnd').val(result.d[0].HallAndStandNumb);
            $('#txtBuilUpDate').val(result.d[0].BuildUpDate);
            $('#txtDesignDeadLine').val(result.d[0].DesignDeadline);
            $('#txtContactPerson').val(result.d[0].ContactPerson);
            $('#txtEmailAddress').val(result.d[0].EmailAddress);
            $('#txtOrganizers').val(result.d[0].Organizers);
            $('#txtOrgContactDet').val(result.d[0].OrganizersContactDetails);

            //document.getElementById("txtDateFrom").valueAsDate = result.d[0].ShowDateFrom;
            //document.getElementById("txtDateTo").valueAsDate = new Date();
            //document.getElementById("txtBuilUpDate").valueAsDate = new Date();
            //document.getElementById("txtDesignDeadLine").valueAsDate = new Date();

            ReqStatus = result.d[0].Status;
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function GetRefNo() {

    $.ajax({
        url: "BriefForm.aspx/GetRefNumb",
      /*  data: JSON.stringify({  }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtRefNo').val(result.d);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function AddBasicDet() {

    $.ajax({
        url: "BriefForm.aspx/SetBasicDet",
        data: JSON.stringify({
            "RefNo": $('#txtRefNo').val(), "EventName": $('#txtEventName').val(), "Venue": $('#txtVenue').val(), "DAteFrom": $('#txtDateFrom').val(), "DateTo": $('#txtDateTo').val(), "Length": $('#txtDiLx').val(), "Width": $('#txtDiWx').val(),
            "Height": $('#txtDiH').val(), "HallAndStandNo": $('#txtHallAndStnd').val(), "BuildUpDate": $('#txtBuilUpDate').val(), "Deadline": $('#txtDesignDeadLine').val(), "ContactPerson": $('#txtContactPerson').val(), "EmailAddress": $('#txtEmailAddress').val(),
            "Organizers": $('#txtOrganizers').val(), "OrgContact": $('#txtOrgContactDet').val(), "User": currUserId,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 0) {

                GetRefNo();
                $('#btnSubmitBasicDet').trigger('click');
            }
            else {
                toastr.success('Updated Successfully','');
                EventId = result.d;
                $('.Update-Basic_Info').css('display', 'none');
                hideShowEventInfo();
                SetButtonFormateIntially();
                GetEventBasicDet();
                SubmitValidation();
                setFormForSubmit();
              
                $('.More-Det').css('display', '');   

                setTimeout(function () {

                    GetTableDetails('Please wait...');
                    $(".ajax-loader").addClass('hidden');
                }, 500);

               

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

$('#btnSubmitBasicDet').on('click', function () {

   
    AddBasicDet();
    BudgetFormate();
});


function hideShowEventInfo() {
    var x = document.getElementById("EventInfoDetailsRowDiv");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#EventInfoDetailsRowDiv').show('400');
        $('.Detail-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.Detail-det-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#EventInfoDetailsRowDiv').hide('400');
        $('.Detail-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.Detail-det-drilldown').addClass('bx bxs-chevron-down');

    }
}

$('#btnAddNewEvent').on('click', function () {

    $('#EventInfoDetailsRowDiv').show('');
    $('.Detail-det-drilldown').removeClass('bx bxs-chevron-down');
    $('.Detail-det-drilldown').addClass('bx bxs-chevron-up');


    ReqStatus = '';
    $('#btnSubmitRequest').css('display', 'none');
    ClearEventbasicDetails();
    $('.Update-Basic_Info').css('display', '');
    SetForm();
    GetRefNo();
    $('.More-Det').css('display','none');   
    $('#ModalBriefForm').modal('show');

});




function slide(link) {

    var down = function (callback, time) {
        var subMenu = link.nextElementSibling;
        var height = subMenu.clientHeight;
        var part = height / 100;

        var paddingTop = parseInt(window.getComputedStyle(subMenu, null).getPropertyValue('padding-top'));
        var paddingBottom = parseInt(window.getComputedStyle(subMenu, null).getPropertyValue('padding-bottom'));
        var paddingTopPart = parseInt(paddingTop) / 50;
        var paddingBottomPart = parseInt(paddingBottom) / 30;

        (function innerFunc(i, t, b) {

            subMenu.style.height = i + 'px';

            i += part;

            if (t < paddingTop) {

                t += paddingTopPart;
                subMenu.style.paddingTop = t + 'px';

            } else if (b < paddingBottom) {

                b += paddingBottomPart;
                subMenu.style.paddingBottom = b + 'px';
            }

            if (i < height) {

                setTimeout(function () {

                    innerFunc(i, t, b);

                }, time / 100);

            } else {

                subMenu.removeAttribute('style');
                callback();
            }

        })(0, 0, 0);
    },

        up = function (callback, time) {

            var subMenu = link.nextElementSibling;
            var height = subMenu.clientHeight;
            var part = subMenu.clientHeight / 100;
            var paddingTop = parseInt(window.getComputedStyle(subMenu).paddingTop);
            var paddingBottom = parseInt(window.getComputedStyle(subMenu).paddingBottom);
            var paddingTopPart = parseInt(paddingTop) / 30;
            var paddingBottomPart = parseInt(paddingBottom) / 50;

            (function innerFunc(i, t, b) {

                subMenu.style.height = i + 'px';

                i -= part;
                i = i.toFixed(2);

                if (b > 0) {

                    b -= paddingBottomPart;
                    b = b.toFixed(1);
                    subMenu.style.paddingBottom = b + 'px';

                } else if (t > 0) {

                    t -= paddingTopPart;
                    t = t.toFixed(1);
                    subMenu.style.paddingTop = t + 'px';
                }

                if (i > 0) {

                    setTimeout(function () {

                        innerFunc(i, t, b);

                    }, time / 100);

                } else {

                    subMenu.removeAttribute('style');
                    callback();
                }

            })(height, paddingTop, paddingBottom);
        }

    return {
        down: down,
        up: up
    }
}

var accordion = (function () {

    var menu = document.querySelectorAll('.accordion');
    var activeClass = 'accordion__link_active';
    var arr = [];
    var timer = 100;

    for (let i = 0; i < menu.length; i++) {

        for (let p = 0; p < menu[i].children.length; p++) {

            var link = menu[i].children[p].firstElementChild;

            if (link.classList.contains(activeClass)) {
                arr[i] = link;
            }
        }
    }

    function accordionInner(i) {

        var clicked = false;

        menu[i].addEventListener('click', function (e) {

            if (e.target.tagName === 'A' && !clicked) {

                clicked = true;

                if (e.target.classList.contains(activeClass)) {

                    slide(e.target).up(function () {

                        clicked = false;

                        e.target.classList.remove(activeClass);

                        console.log('slide up of accordion ' + i + ' is done');

                    }, timer);

                } else {

                    if (arr.length > 0) {

                        slide(arr[i - 1]).up(function () {

                            arr[i - 1].classList.remove(activeClass);

                            arr[i - 1] = e.target;

                            console.log('slide up of accordion ' + i + ' is done');

                        }, timer);
                    }

                    e.target.classList.add(activeClass);

                    slide(e.target).down(function () {

                        clicked = false;

                        arr[i - 1] = e.target;

                        console.log('slide down of accordion ' + i + ' is done');

                    }, timer);
                }
            }
        });

        i++;

        if (i < menu.length) { accordionInner(i); }

    } accordionInner(0);
})();

function SumSpaceAndStand() {

    SumSpAndStCost = parseFloat($('#txtStandCost').val() == '' ? 0.00 : $('#txtStandCost').val()) + parseFloat($('#txtSpaceRental').val() == '' ? 0.00 : $('#txtSpaceRental').val()) + parseFloat($('#txtElectricity').val() == '' ? 0.00 : $('#txtElectricity').val()) + parseFloat($('#txtRigging').val() == '' ? 0.00 : $('#txtRigging').val()) + parseFloat($('#txtInternet').val() == '' ? 0.00 : $('#txtInternet').val()) + parseFloat($('#txtSpaceStandOthers').val() == '' ? 0.00 : $('#txtSpaceStandOthers').val());
    $('#txtSpaceStandSubTotal').val(SumSpAndStCost + '  AED');
    GrandSum = parseFloat(SumSpAndStCost == '' ? 0.00 : SumSpAndStCost) + parseFloat(SumMktOrAd == '' ? 0.00 : SumMktOrAd) + parseFloat(SumVisaAndTrv == '' ? 0.00 : SumVisaAndTrv) + parseFloat(SumOperExp == '' ? 0.00 : SumOperExp);
    $('#txtGrandTotalTotal').val(GrandSum + '   AED ');
}

$('#ModalBriefForm').find('input[name=NmSpcAndStnd]').on('change', function () {

    SumSpaceAndStand();
});


function SumMktOrAdv() {

    SumMktOrAd = parseFloat($('#txtSponserShip').val() == '' ? 0.00 : $('#txtSponserShip').val()) + parseFloat($('#txtMgOrDrsctoryad').val() == '' ? 0.00 : $('#txtMgOrDrsctoryad').val()) + parseFloat($('#txtOnSiteBranding').val() == '' ? 0.00 : $('#txtOnSiteBranding').val()) + parseFloat($('#txtTechnology').val() == '' ? 0.00 : $('#txtTechnology').val()) + parseFloat($('#txtEntertainment').val() == '' ? 0.00 : $('#txtEntertainment').val()) + parseFloat($('#txtCatelogues').val() == '' ? 0.00 : $('#txtCatelogues').val()) + parseFloat($('#txtGiftItems').val() == '' ? 0.00 : $('#txtGiftItems').val()) + parseFloat($('#txtMktOrAdOthers').val() == '' ? 0.00 : $('#txtMktOrAdOthers').val());
    $('#txtMktOrAdSubTotal').val(SumMktOrAd + '  AED');
    GrandSum = parseFloat(SumSpAndStCost == '' ? 0.00 : SumSpAndStCost) + parseFloat(SumMktOrAd == '' ? 0.00 : SumMktOrAd) + parseFloat(SumVisaAndTrv == '' ? 0.00 : SumVisaAndTrv) + parseFloat(SumOperExp == '' ? 0.00 : SumOperExp);
    $('#txtGrandTotalTotal').val(GrandSum + '   AED ');
}

$('#ModalBriefForm').find('input[name=nmMktOrAd]').on('change', function () {

    SumMktOrAdv();
});

function SumVisaAndExpens() {

    SumVisaAndTrv = parseFloat($('#txtVisa').val() == '' ? 0.00 : $('#txtVisa').val()) + parseFloat($('#txtAirFare').val() == '' ? 0.00 : $('#txtAirFare').val()) + parseFloat($('#txtLogiStics').val() == '' ? 0.00 : $('#txtLogiStics').val()) + parseFloat($('#txtVisaTravelOthers').val() == '' ? 0.00 : $('#txtVisaTravelOthers').val());
    $('#txtVisaTravelSubTotal').val(SumVisaAndTrv + '  AED');
    GrandSum = parseFloat(SumSpAndStCost == '' ? 0.00 : SumSpAndStCost) + parseFloat(SumMktOrAd == '' ? 0.00 : SumMktOrAd) + parseFloat(SumVisaAndTrv == '' ? 0.00 : SumVisaAndTrv) + parseFloat(SumOperExp == '' ? 0.00 : SumOperExp);
    $('#txtGrandTotalTotal').val(GrandSum + '   AED ');
}

$('#ModalBriefForm').find('input[name=NmVisaAndTrvl]').on('change', function () {

    SumVisaAndExpens();
});


function SumoperExpens() {

    SumOperExp = parseFloat($('#txtMealAndTrans').val() == '' ? 0.00 : $('#txtMealAndTrans').val()) + parseFloat($('#txtPantryMet').val() == '' ? 0.00 : $('#txtPantryMet').val()) + parseFloat($('#txtFlowersEtc').val() == '' ? 0.00 : $('#txtFlowersEtc').val()) + parseFloat($('#txtOperationExpOthers').val() == '' ? 0.00 : $('#txtOperationExpOthers').val());
    $('#txtOperationExpSubTotal').val(SumOperExp +'  AED');
    GrandSum = parseFloat(SumSpAndStCost == '' ? 0.00 : SumSpAndStCost) + parseFloat(SumMktOrAd == '' ? 0.00 : SumMktOrAd) + parseFloat(SumVisaAndTrv == '' ? 0.00 : SumVisaAndTrv) + parseFloat(SumOperExp == '' ? 0.00 : SumOperExp);
    $('#txtGrandTotalTotal').val(GrandSum + '   AED ');
}

$('#ModalBriefForm').find('input[name=NmOperExp]').on('change', function () {

    SumoperExpens();
});


$('#ModalBriefForm').find('input[name=EventCb]').on('change', function () {

    CheckBoxId = this.id; 
    const TextId = CheckBoxId.split('-');
    TextBoxId = 'txt' + TextId[1];
    if ($('#' + CheckBoxId).is(':checked') == true) {


        $('#' + TextBoxId).css('display', 'block');
    }
    else {
        $('#' + TextBoxId).css('display', 'none');
        $('#' + TextBoxId).val('');

    }
});

function SetForm() {

    $('#ddlCarpetColour').val('None');

    $('#ModalBriefForm').find('input[name=EventCb]').prop('checked', false);
    $('#ModalBriefForm').find('input[name=EventText]').css('display', 'none');
    $('#ModalBriefForm').find('input[name=NmAllEventCb]').prop('checked', false);
    $('#ModalBriefForm').find('input[name=FloorPlan]').prop('checked', false);
    $('#ModalBriefForm').find('input[name=NmAllEventText]').val('');
    $('#ModalBriefForm').find('textarea[name=NmAllEventText]').val('');
    $('#ModalBriefForm').find('input[name=EventText]').val('');
}

$('#btnAddNewItem').on('click', function () {

    ClearNewProductDet();
    $('#modalAddNewProduct').modal('show');
});

function hideShowStandDesign1() {
    var x = document.getElementById("div-StandDesign1");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#div-StandDesign1').show('400');
        $('.StandDesign1-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.StandDesign1-det-drilldown').addClass('bx bxs-chevron-up');
        $('#headSGI1').removeClass('header-Bg-NotActive');
        $('#headSGI1').addClass('header-Bg-Active');
    } else {
        //x.style.display = "none";
        $('#div-StandDesign1').hide('400');
        $('.StandDesign1-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.StandDesign1-det-drilldown').addClass('bx bxs-chevron-down');
        $('#headSGI1').removeClass('header-Bg-Active');
        $('#headSGI1').addClass('header-Bg-NotActive');

    }
}

function hideShowBudgeReq() {
    var x = document.getElementById("div-BudgetReq");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#div-BudgetReq').show('400');
        $('.BudgetReq-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.BudgetReq-det-drilldown').addClass('bx bxs-chevron-up');
        $('#headBRE').removeClass('header-Bg-NotActive');
        $('#headBRE').addClass('header-Bg-Active');
    } else {
        //x.style.display = "none";
        $('#div-BudgetReq').hide('400');
        $('.BudgetReq-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.BudgetReq-det-drilldown').addClass('bx bxs-chevron-down');
        $('#headBRE').removeClass('header-Bg-Active');
        $('#headBRE').addClass('header-Bg-NotActive');

    }
}

function hideShowStandDesign2() {
    var x = document.getElementById("div-StandDesign2");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#div-StandDesign2').show('400');
        $('.StandDesign2-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.StandDesign2-det-drilldown').addClass('bx bxs-chevron-up');
        $('#headSGI2').removeClass('header-Bg-NotActive');
        $('#headSGI2').addClass('header-Bg-Active');
    } else {
        //x.style.display = "none";
        $('#div-StandDesign2').hide('400');
        $('.StandDesign2-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.StandDesign2-det-drilldown').addClass('bx bxs-chevron-down');
        $('#headSGI2').removeClass('header-Bg-Active');
        $('#headSGI2').addClass('header-Bg-NotActive');

    }
}

function ActualSumSpaceAndStand() {

    ActualSumSpAndStCost = parseFloat($('#txtActualStandCost').val() == '' ? 0.00 : $('#txtActualStandCost').val()) + parseFloat($('#txtActualSpaceRental').val() == '' ? 0.00 : $('#txtActualSpaceRental').val()) + parseFloat($('#txtActualElectricity').val() == '' ? 0.00 : $('#txtActualElectricity').val()) + parseFloat($('#txtActualRigging').val() == '' ? 0.00 : $('#txtActualRigging').val()) + parseFloat($('#txtActualInternet').val() == '' ? 0.00 : $('#txtActualInternet').val()) + parseFloat($('#txtActualSpaceStandOthers').val() == '' ? 0.00 : $('#txtActualSpaceStandOthers').val());
    $('#txtActualSpaceStandSubTotal').val(ActualSumSpAndStCost + '  AED');
    ActualGrandSum = parseFloat(ActualSumSpAndStCost == '' ? 0.00 : ActualSumSpAndStCost) + parseFloat(ActualSumMktOrAd == '' ? 0.00 : ActualSumMktOrAd) + parseFloat(ActualSumVisaAndTrv == '' ? 0.00 : ActualSumVisaAndTrv) + parseFloat(ActualSumOperExp == '' ? 0.00 : ActualSumOperExp);
    $('#txtActualGrandTotalTotal').val(ActualGrandSum + '   AED ');
}

$('#ModalBriefForm').find('input[name=NmActualSpcAndStnd]').on('change', function () {

    ActualSumSpaceAndStand();
});

function ActualSumMktOrAdv() {

    ActualSumMktOrAd = parseFloat($('#txtActualSponserShip').val() == '' ? 0.00 : $('#txtActualSponserShip').val()) + parseFloat($('#txtActualMgOrDrsctoryad').val() == '' ? 0.00 : $('#txtActualMgOrDrsctoryad').val()) + parseFloat($('#txtActualOnSiteBranding').val() == '' ? 0.00 : $('#txtActualOnSiteBranding').val()) + parseFloat($('#txtActualTechnology').val() == '' ? 0.00 : $('#txtActualTechnology').val()) + parseFloat($('#txtActualEntertainment').val() == '' ? 0.00 : $('#txtActualEntertainment').val()) + parseFloat($('#txtActualCatelogues').val() == '' ? 0.00 : $('#txtActualCatelogues').val()) + parseFloat($('#txtActualGiftItems').val() == '' ? 0.00 : $('#txtActualGiftItems').val()) + parseFloat($('#txtActualMktOrAdOthers').val() == '' ? 0.00 : $('#txtActualMktOrAdOthers').val());
    $('#txtActualMktOrAdSubTotal').val(ActualSumMktOrAd + '  AED');
    ActualGrandSum = parseFloat(ActualSumSpAndStCost == '' ? 0.00 : ActualSumSpAndStCost) + parseFloat(ActualSumMktOrAd == '' ? 0.00 : ActualSumMktOrAd) + parseFloat(ActualSumVisaAndTrv == '' ? 0.00 : ActualSumVisaAndTrv) + parseFloat(ActualSumOperExp == '' ? 0.00 : ActualSumOperExp);
    $('#txtActualGrandTotalTotal').val(ActualGrandSum + '   AED ');
}

$('#ModalBriefForm').find('input[name=nmActualMktOrAd]').on('change', function () {

    ActualSumMktOrAdv();
});


function ActualSumVisaAndExpens() {

    ActualSumVisaAndTrv = parseFloat($('#txtActualVisa').val() == '' ? 0.00 : $('#txtActualVisa').val()) + parseFloat($('#txtActualAirFare').val() == '' ? 0.00 : $('#txtActualAirFare').val()) + parseFloat($('#txtActualLogiStics').val() == '' ? 0.00 : $('#txtActualLogiStics').val()) + parseFloat($('#txtActualVisaTravelOthers').val() == '' ? 0.00 : $('#txtActualVisaTravelOthers').val());
    $('#txtActualVisaTravelSubTotal').val(ActualSumVisaAndTrv + '  AED');
    ActualGrandSum = parseFloat(ActualSumSpAndStCost == '' ? 0.00 : ActualSumSpAndStCost) + parseFloat(ActualSumMktOrAd == '' ? 0.00 : ActualSumMktOrAd) + parseFloat(ActualSumVisaAndTrv == '' ? 0.00 : ActualSumVisaAndTrv) + parseFloat(ActualSumOperExp == '' ? 0.00 : ActualSumOperExp);
    $('#txtActualGrandTotalTotal').val(ActualGrandSum + '   AED ');
}

$('#ModalBriefForm').find('input[name=NmActualVisaAndTrvl]').on('change', function () {

    ActualSumVisaAndExpens();
});

function ActualSumoperExpens() {

    ActualSumOperExp = parseFloat($('#txtActualMealAndTrans').val() == '' ? 0.00 : $('#txtActualMealAndTrans').val()) + parseFloat($('#txtActualPantryMet').val() == '' ? 0.00 : $('#txtActualPantryMet').val()) + parseFloat($('#txtActualFlowersEtc').val() == '' ? 0.00 : $('#txtActualFlowersEtc').val()) + parseFloat($('#txtActualOperationExpOthers').val() == '' ? 0.00 : $('#txtActualOperationExpOthers').val());
    $('#txtActualOperationExpSubTotal').val(ActualSumOperExp + '  AED');
    ActualGrandSum = parseFloat(ActualSumSpAndStCost == '' ? 0.00 : ActualSumSpAndStCost) + parseFloat(ActualSumMktOrAd == '' ? 0.00 : ActualSumMktOrAd) + parseFloat(ActualSumVisaAndTrv == '' ? 0.00 : ActualSumVisaAndTrv) + parseFloat(ActualSumOperExp == '' ? 0.00 : ActualSumOperExp);
    $('#txtActualGrandTotalTotal').val(ActualGrandSum + '   AED ');
}

$('#ModalBriefForm').find('input[name=NmActualOperExp]').on('change', function () {

    ActualSumoperExpens();
});


function ClearEventbasicDetails() {

    $('#txtRefNo').val('');
    $('#txtEventName').val('');
    $('#txtVenue').val('');
    $('#txtDiLx').val('');
    $('#txtDiWx').val('');
    $('#txtDiH').val('');
    $('#txtHallAndStnd').val('');
    $('#txtContactPerson').val('');
    $('#txtEmailAddress').val('');
    $('#txtOrganizers').val('');
    $('#txtOrgContactDet').val('');


    document.getElementById("txtDateFrom").valueAsDate = new Date();
    document.getElementById("txtDateTo").valueAsDate = new Date();
    document.getElementById("txtBuilUpDate").valueAsDate = new Date();
    document.getElementById("txtDesignDeadLine").valueAsDate = new Date();


    
}


function AddStandDesignInfo() {

    $.ajax({
        url: "BriefForm.aspx/SetStdDesignInfo",
        data: JSON.stringify({
            "EventId": EventId
            ,"CarpetColor": $('#ddlCarpetColour option:selected').val(), "GlassUnderLF": $('#cbGlUnderFlr').is(':checked'), "WoodenParquet": $('#cbWoodenParquet').is(':checked'), "WoodLF": $('#txtWdLaminatedFlr').val(), "CombOfWAndG": $('#cbCombWdAndGlass').is(':checked'), "FPComments": $('#txtFlrPreferenceComment').val(), "NumbOfCounters": $('#txtNumbOfCount').val(),
            "Storage": $('#cbStorage').is(':checked'), "BarStoolForC": $('#cbBarStlForCount').is(':checked'), "RAComments": $('#txtReceptionAreaComment').val(), "Vip": $('#txtVip').val(), "TotallyClosedArea": $('#txtTotClosedArea').val(), "SemiClosedArea": $('#txtSemiCloseArea').val(),
            "OpenArea": $('#txtOpenArea').val(), "CoffeTable": $('#txtCoffeTabe').val(), "BarStool": $('#txtBarStool').val(), "Chairs": $('#txtChairs').val(), "Sofa": $('#txtSofa').val(), "MAComments": $('#txtMeetingAreaComment').val(),

            "NumbOfTv": $('#txtNUmbTvWithSize').val(), "NumbOfLaptop": $('#txtNumbOfLap').val(), "VideoWall": $('#txtVideoWall').val(), "SpecialElement": $('#txtSpcElement').val(), "NumbOfWorkStation": $('#txtNumbOfWrkStation').val(), "NumbOfTvScreen": $('#txtNumbOfTvScrn').val(),
            "ASComments": $('#txtAudioVisualComments').val(),"WSComments": $('#txtWorkStationComment').val(), "NumbOfPodium": $('#txtNumbOfPodium').val(), "NumbOfDisplayStand": $('#txtNumbOfDsplyStands').val(), "NumbOfBouchR": $('#txtNumbOfBchrRacks').val(), "StorageRoom": $('#cbStorageRoom').is(':checked'), "NumbOfShelves": $('#txtNumbOfShelves').val(),

            "Modern": $('#cbModern').is(':checked'), "HiTech": $('#cbHiTech').is(':checked'), "Heritage": $('#cbHeritage').is(':checked'), "Traditional": $('#cbTraditional').is(':checked'), "Classic": $('#cbClassic').is(':checked'), "Corporate": $('#cbCorporate').is(':checked'),
            "HangingStructure": $('#cbHangingStructure').is(':checked'), "ThemeStyleComments": $('#txtThemeAndStyleComment').val(),

            "AppMinimum": $('#txtAppMinimum').val(), "AppMaximum": $('#txtAppMaximum').val(), "LISpendOnStandCons": $('#txtSpntOnConstruction').val(),

            "Catalogue": $('#cbCatelogues').is(':checked'), "GiftItem": $('#cbGiftItems').is(':checked'), "CAFComments": $('#txtMeterialRequest').val(), "EmailSignature": $('#cbEmailSignature').is(':checked'), "SocialMediaPost": $('#cbSMPost').is(':checked'), "InvitEmailToClient": $('#cbEmailToClient').is(':checked'), "DPComments": $('#txtDigitalPresence').val(),
            "FloorPlan": $('#ModalBriefForm').find('input[name=FloorPlan]:checked').val(),
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

          
          
            toastr.success('Updated Successfully','');
            SubmitValidation();
               

               

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnSaveStndDesignInfo').on('click', function () {

    AddStandDesignInfo();

});

function EventSDFormDetails() {

    $.ajax({
        url: "BriefForm.aspx/GetEventSDFormDet",
        data: JSON.stringify({ "EventId": EventId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#ddlCarpetColour').val(result.d[0].CarpetColor);
            $('#txtWdLaminatedFlr').val(result.d[0].WoodLF); 
            $('#txtFlrPreferenceComment').val(result.d[0].FPComments);
            $('#txtNumbOfCount').val(result.d[0].NumbOfCounters);
            $('#txtReceptionAreaComment').val(result.d[0].RAComments);
            $('#txtMeetingAreaComment').val(result.d[0].MAComments);
            $('#txtAudioVisualComments').val(result.d[0].ASComments);
            $('#txtWorkStationComment').val(result.d[0].WSComments);
            $('#txtThemeAndStyleComment').val(result.d[0].ThemeStyleComments); 
            $('#txtAppMinimum').val(result.d[0].AppMinimum); 
            $('#txtAppMaximum').val(result.d[0].AppMaximum); 
            $('#txtSpntOnConstruction').val(result.d[0].LISpendOnStandCons); 
            $('#txtMeterialRequest').val(result.d[0].CAFComments); 
            $('#txtDigitalPresence').val(result.d[0].DPComments); 

            if (result.d[0].GlassUnderLF=='True') {
                $('#cbGlUnderFlr').prop('checked', true);
            }
            if (result.d[0].WoodenParquet == 'True') {
                $('#cbWoodenParquet').prop('checked', true);
            }
            if (result.d[0].CombOfWAndG == 'True') {
                $('#cbCombWdAndGlass').prop('checked', true);
            }

            if (result.d[0].Storage == 'True') {
                $('#cbStorage').prop('checked', true);
            }
            if (result.d[0].BarStoolForC == 'True') {
                $('#cbBarStlForCount').prop('checked', true);
            }
            if (result.d[0].StorageRoom == 'True') {
                $('#cbStorageRoom').prop('checked', true);
            }

            if (result.d[0].Modern == 'True') {
                $('#cbModern').prop('checked', true);
            }
            if (result.d[0].HiTech == 'True') {
                $('#cbHiTech').prop('checked', true);
            }
            if (result.d[0].Heritage == 'True') {
                $('#cbHeritage').prop('checked', true);
            }

            if (result.d[0].Traditional == 'True') {
                $('#cbTraditional').prop('checked', true);
            }
            if (result.d[0].Classic == 'True') {
                $('#cbClassic').prop('checked', true);
            }
            if (result.d[0].Corporate == 'True') {
                $('#cbCorporate').prop('checked', true);
            }

            if (result.d[0].HangingStructure == 'True') {
                $('#cbHangingStructure').prop('checked', true);
            }
            if (result.d[0].Catalogue == 'True') {
                $('#cbCatelogues').prop('checked', true);
            }
            if (result.d[0].GiftItem == 'True') {
                $('#cbGiftItems').prop('checked', true);
            }

            if (result.d[0].EmailSignature == 'True') {
                $('#cbEmailSignature').prop('checked', true);
            }
            if (result.d[0].SocialMediaPost == 'True') {
                $('#cbSMPost').prop('checked', true);
            }
            if (result.d[0].InvitEmailToClient == 'True') {
                $('#cbEmailToClient').prop('checked', true);
            }


            $('#txtVip').val(result.d[0].Vip); 
            if (result.d[0].Vip != '0') {
                $('#cb-Vip').prop('checked', true);
                $('#txtVip').css('display', 'block');
            }

            $('#txtTotClosedArea').val(result.d[0].TotallyClosedArea);
            if (result.d[0].TotallyClosedArea != '0') {
                $('#cb-TotClosedArea').prop('checked', true);
                $('#txtTotClosedArea').css('display', 'block');
            }

            $('#txtSemiCloseArea').val(result.d[0].SemiClosedArea);
            if (result.d[0].SemiClosedArea != '0') {
                $('#cb-SemiCloseArea').prop('checked', true);
                $('#txtSemiCloseArea').css('display', 'block');
            }

            $('#txtOpenArea').val(result.d[0].OpenArea);
            if (result.d[0].OpenArea != '0') {
                $('#cb-OpenArea').prop('checked', true);
                $('#txtOpenArea').css('display', 'block');
            }

            $('#txtCoffeTabe').val(result.d[0].CoffeTable);
            if (result.d[0].CoffeTable != '0') {
                $('#cb-CoffeTabe').prop('checked', true);
                $('#txtCoffeTabe').css('display', 'block');
            }

            $('#txtBarStool').val(result.d[0].BarStool);
            if (result.d[0].BarStool != '0') {
                $('#cb-BarStool').prop('checked', true);
                $('#txtBarStool').css('display', 'block');
            }

            $('#txtChairs').val(result.d[0].Chairs);
            if (result.d[0].Chairs != '0') {
                $('#cb-Chairs').prop('checked', true);
                $('#txtChairs').css('display', 'block');
            }

            $('#txtSofa').val(result.d[0].Sofa);
            if (result.d[0].Sofa != '0') {
                $('#cb-Sofa').prop('checked', true);
                $('#txtSofa').css('display', 'block');
            }

            $('#txtNUmbTvWithSize').val(result.d[0].NumbOfTv);
            if (result.d[0].NumbOfTv != '') {
                $('#cb-NUmbTvWithSize').prop('checked', true);
                $('#txtNUmbTvWithSize').css('display', 'block');
            }

            $('#txtNumbOfLap').val(result.d[0].NumbOfLaptop);
            if (result.d[0].NumbOfLaptop != '0') {
                $('#cb-NumbOfLap').prop('checked', true);
                $('#txtNumbOfLap').css('display', 'block');
            }

            $('#txtVideoWall').val(result.d[0].VideoWall);
            if (result.d[0].VideoWall != '0') {
                $('#cb-VideoWall').prop('checked', true);
                $('#txtVideoWall').css('display', 'block');
            }

            $('#txtSpcElement').val(result.d[0].SpecialElement);
            if (result.d[0].SpecialElement != '') {
                $('#cb-SpcElement').prop('checked', true);
                $('#txtSpcElement').css('display', 'block');
            }

            $('#txtNumbOfWrkStation').val(result.d[0].NumbOfWorkStation);
            if (result.d[0].NumbOfWorkStation != '0') {
                $('#cb-NumbOfWrkStation').prop('checked', true);
                $('#txtNumbOfWrkStation').css('display', 'block');
            }

            $('#txtNumbOfTvScrn').val(result.d[0].NumbOfTvScreen);
            if (result.d[0].NumbOfTvScreen != '0') {
                $('#cb-NumbOfTvScrn').prop('checked', true);
                $('#txtNumbOfTvScrn').css('display', 'block');
            }

            $('#txtNumbOfPodium').val(result.d[0].NumbOfPodium);
            if (result.d[0].NumbOfPodium != '0') {
                $('#cb-NumbOfPodium').prop('checked', true);
                $('#txtNumbOfPodium').css('display', 'block');
            }

            $('#txtNumbOfDsplyStands').val(result.d[0].NumbOfDisplayStand);
            if (result.d[0].NumbOfDisplayStand != '0') {
                $('#cb-NumbOfDsplyStands').prop('checked', true);
                $('#txtNumbOfDsplyStands').css('display', 'block');
            }

            $('#txtNumbOfBchrRacks').val(result.d[0].NumbOfBouchR);
            if (result.d[0].NumbOfBouchR != '0') {
                $('#cb-NumbOfBchrRacks').prop('checked', true);
                $('#txtNumbOfBchrRacks').css('display', 'block');
            }



            $('#txtNumbOfShelves').val(result.d[0].NumbOfShelves);
            if (result.d[0].NumbOfShelves != '0') {
                $('#cb-NumbOfShelves').prop('checked', true);
                $('#txtNumbOfShelves').css('display', 'block');
            }

            $('#ModalBriefForm').find('input[value=' + result.d[0].FloorPlan + ']').prop('checked', true);

           

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('#btnSDinfo').on('click', function () {

    if (ReqStatus == 'DRAFT') {
    $('#btnSaveStndDesignInfo').css('display', 'block');
    $('#btnSaveBudgetReq').css('display', 'none');
    $('#btnSaveAttendees').css('display', 'none');
    }


});

$('#btnProductOrItem').on('click', function () {

    if (ReqStatus == 'DRAFT') {
        $('#btnSaveStndDesignInfo').css('display', 'none');
        $('#btnSaveBudgetReq').css('display', 'none');
        $('#btnSaveAttendees').css('display', 'none');
    }
    $('#txtProductName').val('');
    $('#txtProductDesc').val('');
    GetProductDet();
    GetItemDescr();

});

$('#btnBudgetReq').on('click', function () {

        if (ReqStatus == 'DRAFT') {
        $('#btnSaveStndDesignInfo').css('display', 'none');
        $('#btnSaveBudgetReq').css('display', 'block');
            $('#btnSaveAttendees').css('display', 'none');

    }

    ShowBudgetDetails();

});

$('#btnAttendees').on('click', function () {

    if (ReqStatus == 'DRAFT') {
        $('#btnSaveStndDesignInfo').css('display', 'none');
        $('#btnSaveBudgetReq').css('display', 'none');
        $('#btnSaveAttendees').css('display', 'block');
    }

});

function ClearNewProductDet() {

    $('#txtItemOrDesc').val('');
    $('#txtWidth').val('');
    $('#txtLength').val('');
    $('#txtHeight').val('');
    $('#txtWeight').val('');
    $('#txtWeight').val('');
    $('#txtElectricalRequirement').val('');
    $('#txtProductRemarks').val('');
}


function AddProductDet() {

    $.ajax({
        url: "BriefForm.aspx/SetProductDetails",
        data: JSON.stringify({ "EventId": EventId, "ProductName": $('#txtProductName').val(), "Remarks": $('#txtProductDesc').val(), "RefNo": $('#txtRefNo').val(), "User": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
         
            toastr.success('Updated Successfully','');
            $('#txtProductName').val('');
            $('#txtProductDesc').val('');
            GetProductDet();
            SubmitValidation();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function GetProductDet() {

    $.ajax({
        url: "BriefForm.aspx/GetProductDetails",
        data: JSON.stringify({ "EventId": EventId,"RefNo": $('#txtRefNo').val(), "User": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.ProductName + `</td>
                  <td style="text-align:center;">`+ item.Comments + `</td>`;

                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Product').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnAddProduct').on('click', function () {

    AddProductDet();

});


function AddItemOrDescr() {

    $.ajax({
        url: "BriefForm.aspx/SetItemOrDescrp",
        data: JSON.stringify({ "EventId": EventId, "ItemOrDesc": $('#txtItemOrDesc').val(), "Width": $('#txtWidth').val(), "Length": $('#txtLength').val(), "Height": $('#txtHeight').val(), "Weight": $('#txtWeight').val(), "Remarks": $('#txtProductRemarks').val(), "ElectricalRequirement": $('#txtElectricalRequirement').val(), "RefNo": $('#txtRefNo').val(), "User": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully','');
            ClearNewProductDet();
            GetItemDescr();
            SubmitValidation();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function GetItemDescr() {

    $.ajax({
        url: "BriefForm.aspx/GetItemDescr",
        data: JSON.stringify({ "EventId": EventId, "RefNo": $('#txtRefNo').val(), "User": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.ItemOrDescription + `</td>
                  <td style="text-align:center;">`+ item.Width + `</td>
                  <td style="text-align:center;">`+ item.Length + `</td>
                  <td style="text-align:center;">`+ item.Height + `</td>
                  <td style="text-align:center;"> `+ item.Weight + `</td >
                  <td style="text-align:center;">`+ item.ElectricalRequirement + `</td>
                  <td style="text-align:center;">`+ item.Remarks + `</td> `;

                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Item').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('#btnSubmitProductDet').on('click', function () {

    AddItemOrDescr();
    $('#modalAddNewProduct').modal('hide');

});

function BudgetFormate() {

    $('#ModalBriefForm').find('input[name=NmActualSpcAndStnd]').attr('disabled', true);
    $('#ModalBriefForm').find('input[name=nmActualMktOrAd]').attr('disabled', true);
    $('#ModalBriefForm').find('input[name=NmActualVisaAndTrvl]').attr('disabled', true);
    $('#ModalBriefForm').find('input[name=NmActualOperExp]').attr('disabled', true);

    $('#ModalBriefForm').find('input[name=NmActualSpcAndStnd]').val('');
    $('#ModalBriefForm').find('input[name=nmActualMktOrAd]').val('');
    $('#ModalBriefForm').find('input[name=NmActualVisaAndTrvl]').val('');
    $('#ModalBriefForm').find('input[name=NmActualOperExp]').val('');

    $('#ModalBriefForm').find('input[name=NmSpcAndStnd]').val('');
    $('#ModalBriefForm').find('input[name=nmMktOrAd]').val('');
    $('#ModalBriefForm').find('input[name=NmVisaAndTrvl]').val('');
    $('#ModalBriefForm').find('input[name=NmOperExp]').val('');

    $('#txtSpaceStandSubTotal').val('');
    $('#txtActualSpaceStandSubTotal').val('');

    $('#txtMktOrAdSubTotal').val('');
    $('#txtActualMktOrAdSubTotal').val('');

    $('#txtVisaTravelSubTotal').val('');
    $('#txtActualVisaTravelSubTotal').val('');

    $('#txtOperationExpSubTotal').val('');
    $('#txtActualOperationExpSubTotal').val('');



    $('#txtGrandTotalTotal').val('');
    $('#txtActualGrandTotalTotal').val('');


    SumSpAndStCost = '';
    SumMktOrAd = '';
    SumVisaAndTrv = '';
    SumOperExp = '';
    GrandSum = '';

    ActualSumSpAndStCost = '';
    ActualSumMktOrAd = '';
    ActualSumVisaAndTrv = '';
    ActualSumOperExp = '';
    ActualGrandSum = '';




}

function AddExpectedBudget() {

    $.ajax({
        url: "BriefForm.aspx/SetExpectedBudget",
        data: JSON.stringify({
            "EventId": EventId, "RefNo": $('#txtRefNo').val(), "User": currUserId, "StandCost": $('#txtStandCost').val(), "SpaceRental": $('#txtSpaceRental').val(), "Electricity": $('#txtElectricity').val(), "Rigging": $('#txtRigging').val(), "Internet": $('#txtInternet').val(), "AACOthers": $('#txtSpaceStandOthers').val(),
            "sponsership": $('#txtSponserShip').val(), "MagazineOrAd": $('#txtMgOrDrsctoryad').val(), "OnSiteBranding": $('#txtOnSiteBranding').val(), "Technology": $('#txtTechnology').val(), "Entertainment": $('#txtEntertainment').val(), "catalogues": $('#txtCatelogues').val(), "GiftItems": $('#txtGiftItems').val(), "MACOthers": $('#txtMktOrAdOthers').val(),
            "Visa": $('#txtVisa').val(), "AirFare": $('#txtAirFare').val(), "Logistic": $('#txtLogiStics').val(), "VTEOthers": $('#txtVisaTravelOthers').val(), 
            "MealAndTransp": $('#txtMealAndTrans').val(), "PantryMet": $('#txtPantryMet').val(), "FlowersEtc": $('#txtFlowersEtc').val(), "OEOthers": $('#txtOperationExpOthers').val(),
             }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully','');
            SubmitValidation();
           
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnSaveBudgetReq').on('click', function () {

    AddExpectedBudget();

});


function ShowBudgetDetails() {

    $.ajax({
        url: "BriefForm.aspx/GetBudgetDet",
        data: JSON.stringify({ "EventId": EventId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtStandCost').val(result.d[0].ExpectStandCost);
            $('#txtSpaceRental').val(result.d[0].ExpectSpaceRental);
            $('#txtElectricity').val(result.d[0].ExpectElectricity);
            $('#txtRigging').val(result.d[0].ExpectRigging);
            $('#txtInternet').val(result.d[0].ExpectInternet);
            $('#txtSpaceStandOthers').val(result.d[0].ExpectSpaceAndStandOthers);

            $('#txtSponserShip').val(result.d[0].ExpectSponsership);
            $('#txtMgOrDrsctoryad').val(result.d[0].ExpectMagazineOrDirectoryAd);
            $('#txtOnSiteBranding').val(result.d[0].ExpectOnSiteBranding);
            $('#txtTechnology').val(result.d[0].ExpectTechnology);
            $('#txtEntertainment').val(result.d[0].ExpectEntertainment);
            $('#txtCatelogues').val(result.d[0].Expectcatalogues);
            $('#txtGiftItems').val(result.d[0].ExpectGiftItems);
            $('#txtMktOrAdOthers').val(result.d[0].ExpectMarketingOrAdOthers);

            $('#txtVisa').val(result.d[0].ExpectVisa);
            $('#txtAirFare').val(result.d[0].ExpectAirFare);
            $('#txtLogiStics').val(result.d[0].ExpectLogistic);
            $('#txtVisaTravelOthers').val(result.d[0].ExpectVisaAndTravelOthers);

            $('#txtMealAndTrans').val(result.d[0].ExpectMealAndTrasportation);
            $('#txtPantryMet').val(result.d[0].ExpectPentryMaterials);
            $('#txtFlowersEtc').val(result.d[0].ExpectFlowersEtc);
            $('#txtOperationExpOthers').val(result.d[0].ExpectOperationsExpenceOthers);



            $('#txtActualStandCost').val(result.d[0].ActualStandCost);
            $('#txtActualSpaceRental').val(result.d[0].ActualSpaceRental);
            $('#txtActualElectricity').val(result.d[0].ActualElectricity);
            $('#txtActualRigging').val(result.d[0].ActualRigging);
            $('#txtActualInternet').val(result.d[0].ActualInternet);
            $('#txtActualSpaceStandOthers').val(result.d[0].ActualSpaceAndStandOthers);

            $('#txtActualSponserShip').val(result.d[0].ActualSponsership);
            $('#txtActualMgOrDrsctoryad').val(result.d[0].ActualMagazineOrDirectoryAd);
            $('#txtActualOnSiteBranding').val(result.d[0].ActualOnSiteBranding);
            $('#txtActualTechnology').val(result.d[0].ActualTechnology);
            $('#txtActualEntertainment').val(result.d[0].ActualEntertainment);
            $('#txtActualCatelogues').val(result.d[0].Actualcatalogues);
            $('#txtActualGiftItems').val(result.d[0].ActualGiftItems);
            $('#txtActualMktOrAdOthers').val(result.d[0].ActualMarketingOrAdOthers);

            $('#txtActualVisa').val(result.d[0].ActualVisa);
            $('#txtActualAirFare').val(result.d[0].ActualAirFare);
            $('#txtActualLogiStics').val(result.d[0].ActualLogistic);
            $('#txtActualVisaTravelOthers').val(result.d[0].ActualVisaAndTravelOthers);

            $('#txtActualMealAndTrans').val(result.d[0].ActualMealAndTrasportation);
            $('#txtActualPantryMet').val(result.d[0].ActualPentryMaterials);
            $('#txtActualFlowersEtc').val(result.d[0].ActualFlowersEtc);
            $('#txtActualOperationExpOthers').val(result.d[0].ActualOperationsExpenceOthers);






            $('#txtSpaceStandSubTotal').val(result.d[0].ExpectSpaceAndStandTotal + '  AED');
            $('#txtMktOrAdSubTotal').val(result.d[0].ExpectMarketingOrAdTotal + '  AED');
            $('#txtVisaTravelSubTotal').val(result.d[0].ExpectVisaAndTravelTotal + '  AED');
            $('#txtOperationExpSubTotal').val(result.d[0].ExpectOperationExpenceTotal + '  AED');

            $('#txtActualSpaceStandSubTotal').val(result.d[0].ActualSpaceAndStandTotal + '  AED');
            $('#txtActualMktOrAdSubTotal').val(result.d[0].ActualMarketingOrAdTotal + '  AED');
            $('#txtActualVisaTravelSubTotal').val(result.d[0].ActualVisaAndTravelTotal + '  AED');
            $('#txtActualOperationExpSubTotal').val(result.d[0].ActualOperationExpenceTotal + '  AED');


            $('#txtGrandTotalTotal').val(result.d[0].ExpectedGrandTotal + '   AED ');
            $('#txtActualGrandTotalTotal').val(result.d[0].ActualGrandTotal + '   AED ');

            SumSpAndStCost = $('#txtSpaceStandSubTotal').val();
            SumMktOrAd = $('#txtMktOrAdSubTotal').val();
            SumVisaAndTrv = $('#txtVisaTravelSubTotal').val();
            SumOperExp = $('#txtOperationExpSubTotal').val();

            ActualSumSpAndStCost = $('#txtActualSpaceStandSubTotal').val();
            ActualSumMktOrAd = $('#txtActualMktOrAdSubTotal').val();
            ActualSumVisaAndTrv = $('#txtActualVisaTravelSubTotal').val();
            ActualSumOperExp = $('#txtActualOperationExpSubTotal').val();

            GrandSum = $('#txtGrandTotalTotal').val();
            ActualGrandSum = $('#txtActualGrandTotalTotal').val();



        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function AddActualBudget() {

    $.ajax({
        url: "BriefForm.aspx/SetActualBudget",
        data: JSON.stringify({
            "EventId": EventId, "RefNo": $('#txtRefNo').val(), "User": currUserId, "StandCost": $('#txtActualStandCost').val(), "SpaceRental": $('#txtActualSpaceRental').val(), "Electricity": $('#txtActualElectricity').val(), "Rigging": $('#txtActualRigging').val(), "Internet": $('#txtActualInternet').val(), "AACOthers": $('#txtActualSpaceStandOthers').val(),
            "sponsership": $('#txtActualSponserShip').val(), "MagazineOrAd": $('#txtActualMgOrDrsctoryad').val(), "OnSiteBranding": $('#txtActualOnSiteBranding').val(), "Technology": $('#txtActualTechnology').val(), "Entertainment": $('#txtActualEntertainment').val(), "catalogues": $('#txtActualCatelogues').val(), "GiftItems": $('#txtActualGiftItems').val(), "MACOthers": $('#txtActualMktOrAdOthers').val(),
            "Visa": $('#txtActualVisa').val(), "AirFare": $('#txtActualAirFare').val(), "Logistic": $('#txtActualLogiStics').val(), "VTEOthers": $('#txtActualVisaTravelOthers').val(),
            "MealAndTransp": $('#txtActualMealAndTrans').val(), "PantryMet": $('#txtActualPantryMet').val(), "FlowersEtc": $('#txtActualFlowersEtc').val(), "OEOthers": $('#txtActualOperationExpOthers').val(),
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function SubmitValidation() {

    $.ajax({
        url: "BriefForm.aspx/GetSubmitValidation",
        data: JSON.stringify({ "EventId": EventId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 1) {

                $('#btnSubmitRequest').css('display', '');
            }
            else {
                $('#btnSubmitRequest').css('display', 'none');
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


function SubmitReq() {

    $.ajax({
        url: "BriefForm.aspx/SubmitReq",
        data: JSON.stringify({ "EventId": EventId, "User": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully', '');
            ReqStatus = result.d;
            SubmitValidation();
            setFormForSubmit();
            $('#btnSaveStndDesignInfo').css('display', 'none');
            $('#btnSaveBudgetReq').css('display', 'none');
            $('#btnAddNewItem').css('display', 'none');
            $('#btnAddProduct').css('display', 'none');
            $('.ajax-loader').removeClass('hidden');

            setTimeout(function () {

                GetTableDetails('Please wait...');
                $(".ajax-loader").addClass('hidden');
            }, 500);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnSubmitRequest').on('click', function () {

    SubmitReq();

});

function setFormForSubmit() {

    if (ReqStatus != 'DRAFT' && myroleList.includes("8131")) {

        $('#ddlCarpetColour').attr('disabled', true);
        $('#ModalBriefForm').find('input[name=EventCb]').attr('disabled', true);
        $('#ModalBriefForm').find('input[name=EventText]').attr('disabled', true);
        $('#ModalBriefForm').find('input[name=NmAllEventCb]').attr('disabled', true);
        $('#ModalBriefForm').find('input[name=NmAllEventText]').attr('disabled', true);
        $('#ModalBriefForm').find('textarea[name=NmAllEventText]').attr('disabled', true); 
        $('#ModalBriefForm').find('input[name=FloorPlan]').attr('disabled', true);
        $('#ddlAttendeesMulti').attr('disabled', true);

        $('#btnSaveStndDesignInfo').css('display', 'none');
        $('#btnSaveBudgetReq').css('display', 'none');
        $('#btnAddNewItem').css('display', 'none');
        $('#btnAddProduct').css('display', 'none');


        $('.product-Add-det').css('display', 'none');


        $('#ModalBriefForm').find('input[name=NmSpcAndStnd]').attr('disabled', true);
        $('#ModalBriefForm').find('input[name=NmActualSpcAndStnd]').attr('disabled', true);

        $('#ModalBriefForm').find('input[name=nmMktOrAd]').attr('disabled', true);
        $('#ModalBriefForm').find('input[name=nmActualMktOrAd]').attr('disabled', true);

        $('#ModalBriefForm').find('input[name=NmVisaAndTrvl]').attr('disabled', true);
        $('#ModalBriefForm').find('input[name=NmActualVisaAndTrvl]').attr('disabled', true);

        $('#ModalBriefForm').find('input[name=NmOperExp]').attr('disabled', true);
        $('#ModalBriefForm').find('input[name=NmActualOperExp]').attr('disabled', true);



    }
    else {

        $('#ddlCarpetColour').attr('disabled', false);
        $('#ModalBriefForm').find('input[name=EventCb]').attr('disabled', false);
        $('#ModalBriefForm').find('input[name=EventText]').attr('disabled', false);
        $('#ModalBriefForm').find('input[name=NmAllEventCb]').attr('disabled', false);
        $('#ModalBriefForm').find('input[name=NmAllEventText]').attr('disabled', false);
        $('#ModalBriefForm').find('textarea[name=NmAllEventText]').attr('disabled', false);
        $('#ModalBriefForm').find('input[name=FloorPlan]').attr('disabled', false);
        $('#ddlAttendeesMulti').attr('disabled', false);

        $('#btnSaveStndDesignInfo').css('display', '');
        $('#btnAddNewItem').css('display', '');
        $('#btnAddProduct').css('display', '');

        $('.product-Add-det').css('display', '');




        $('#ModalBriefForm').find('input[name=NmSpcAndStnd]').attr('disabled', false);
      /*  $('#ModalBriefForm').find('input[name=NmActualSpcAndStnd]').attr('disabled', false);*/

        $('#ModalBriefForm').find('input[name=nmMktOrAd]').attr('disabled', false);
     /*   $('#ModalBriefForm').find('input[name=nmActualMktOrAd]').attr('disabled', false);*/

        $('#ModalBriefForm').find('input[name=NmVisaAndTrvl]').attr('disabled', false);
      /*  $('#ModalBriefForm').find('input[name=NmActualVisaAndTrvl]').attr('disabled', false);*/

        $('#ModalBriefForm').find('input[name=NmOperExp]').attr('disabled', false);
      /*  $('#ModalBriefForm').find('input[name=NmActualOperExp]').attr('disabled', false);*/

        if (myroleList.includes("8132") || myroleList.includes("8133")) {

          
            $('#ModalBriefForm').find('input[name=NmActualSpcAndStnd]').attr('disabled', false);
            $('#ModalBriefForm').find('input[name=nmActualMktOrAd]').attr('disabled', false);
            $('#ModalBriefForm').find('input[name=NmActualVisaAndTrvl]').attr('disabled', false);
            $('#ModalBriefForm').find('input[name=NmActualOperExp]').attr('disabled', false);

            $('#btnSaveStndDesignInfo').css('display', 'none');
            $('#btnSaveBudgetReq').css('display', 'none');
            //$('#btnAddNewItem').css('display', 'none');
            //$('#btnAddProduct').css('display', 'none');


        }


    }
}

    $('#btnApprove').on('click', function () {

        ApproveStatus = "APPROVE";
        AddStandDesignInfo();
        AddExpectedBudget();
        AddActualBudget();
        Actions();
        GetRequestAccess();

    });

$('#btnApprove').on('click', function () {

    ApproveStatus = "REJECT";
});

    function GetStatusHistory() {

        $.ajax({
            url: "BriefForm.aspx/GetStatusHistory",
            data: JSON.stringify({ "EventId": EventId, }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                //clearmodal();

                var htm = '';
                var ProjectDetails = result.d;



                $.each(ProjectDetails, function (key, item) {
                    htm += `<tr>        
     
                 
                  <td style="text-align:center;">`+ item.stage + `</td>
                  <td style="text-align:center;"><span class="`+ item.StatusClasss + `">` + item.status + `</td>`;

                    htm += `</tr>`;
                    /*    <i class="fa-solid fa-eye"></i>*/

                });
                $('.tbody-StatusHistory').html(htm);


            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    function statusview(Id, Btnstatus) {
        if (Btnstatus == "DRAFT") {
            EventId = Id
            GetStatusHistory();
            $('#ModalStatusHitory').modal('show');
        }

    }


    function GetRequestAccess() {

        $.ajax({
            url: "BriefForm.aspx/GetReqAccess",
            data: JSON.stringify({ "EventId": EventId, "RoleId": RoleId, "User": currUserId }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                if (result.d == "APPROVE" || result.d == "VALIDATE") {

                    $('#btnReject').css('display', '');
                    $('#btnApprove').css('display', '');

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


    function Actions() {

        $.ajax({
            url: "BriefForm.aspx/SetActions",
            data: JSON.stringify({ "EventId": EventId, "RoleId": RoleId, "User": currUserId, "status": ApproveStatus }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {


                $('#ModalBriefForm').modal('hide');
                $('.ajax-loader').removeClass('hidden');

                setTimeout(function () {

                    GetTableDetails('Please wait...');
                    $(".ajax-loader").addClass('hidden');
                }, 500);

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

}


function GetApprovalStatusDet() {

    $.ajax({
        url: "BriefForm.aspx/GetApprovalStatus",
        data: JSON.stringify({ "EventId": EventId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                 
                  <td style="text-align:center;">`+ item.Role + `</td>
                   <td style="text-align:center;">`+ item.User + `</td>
                  <td style="text-align:center;"><span class="`+ item.Statusclass + `">` + item.Status + `</td>
                   <td style="text-align:center;">`+ item.UpdatedOn + `</td>`;

                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-ApprovalStatus').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


//Attendees Tab Work

$('.tab-Inspections ul li').on('click', function () {
    if ($('.tab-Inspections ul li').find('.active').text().trim() == 'Attendees') {
        
        $('.ajax-loader').removeClass('hidden');
       
        setTimeout(function () {           
            fillDepartDDL();
            GetAttendees();   
            $(".ajax-loader").addClass('hidden');
        }, 500);
       
    }

});

function fillDepartDDL() {
    $.ajax({
        url: "BriefForm.aspx/GetAllEmployees",
        //data: JSON.stringify({ orgname: $('#ddlOrg option:selected').val().trim() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {
            ddListEmp = result.d;

            var opt = '';

            $.each(ddListEmp, function (key, item) {
                opt += '<option style="font-style: normal;" value="' + item.EmpNo + '" >' + item.EmpName + ` - ` + item.EmpNo + '</option>';
            });

            $('#ddlAttendeesMulti').html(opt);

            $("#ddlAttendeesMulti").select2({
                dropdownParent: $("#ModalBriefForm"),
                multi: true,
                width: '100%',
                height: '173px'
            });
            $('#select2-ddlAttendeesMulti-container').parent().css('padding', '5px');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadAttendeesMuliselect() {

    var opt = '';
    
    $.each(ddListEmp, function (key, item) {
        opt += '<option style="font-style: normal;" value="' + item.EmpNo + '" >' + item.EmpName + ` - ` + item.EmpNo + '</option>';
    });
         
    $('#ddlAttendeesMulti').html(opt);

    $.each(existingAttendees, function (i, e) {
        $("#ddlAttendeesMulti option[value='" + e.EmpNo + "']").prop("selected", true);
    });


    //$('#ddlDeptList').multiSelect();
    $("#ddlAttendeesMulti").select2({
        dropdownParent: $("#ModalBriefForm"),
        multi: true,
        width: '100%',
        height: '173px'
    });
    $('#select2-ddlAttendeesMulti-container').parent().css('padding', '5px');
}

$('#ddlAttendeesMulti').on('change', function () {
    selEmpNos = ''; //$('.btn-all-cb').children().prop('checked', false);
    $('#ddlAttendeesMulti option:selected').each(function () {
        selEmpNos += $(this).val() + ',';
    });
    selEmpNos = removeCommaFromLast(selEmpNos);
    addAttendees();
});

function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}


function addAttendees() {
    $.ajax({
        url: "BriefForm.aspx/AddAttendees",
        data: JSON.stringify({ 'RefNo': $('#txtRefNo').val(), 'BrandMasterId': EventId, 'AttendeesEmpNos': selEmpNos }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            GetAttendees();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}




function GetAttendees() {
    $.ajax({
        url: "BriefForm.aspx/GetAttendees",
        data: JSON.stringify({'BrandMasterId': EventId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            existingAttendees = result.d;
            $.each(result.d, function (key, item) {
                htm += `<tr>        
                      
                  <td style="text-align:center;">`+ item.RefNo + `</td>
                   <td style="text-align:center;">`+ item.BrandId + `</td>
                  <td style="text-align:center;">` + item.EmpNo + `</td>
                   <td style="text-align:center;">`+ item.EmpName + `</td>`;

                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Attendees').html(htm);
            loadAttendeesMuliselect();
            SubmitValidation();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//end here

function GetTemlateDet() {

    $.ajax({
        url: "BriefForm.aspx/TemplateDet",
        data: JSON.stringify({ "UserId": currUserId, "EventId": EventId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
           
          

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.Description + `</td>
                   <td style="text-align:center;">`+ item.FileName + `</td>
                    <td style="text-align:center;display:none">`+ item.Url + `</td>
                     <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                    <img src="Images/Icon-gif.png" title="View" class="fa-icon-hover Save-Request-Details" style="cursor: pointer; width: 34px;" />
                     &nbsp;&nbsp;<img src="Images/Tick-Icon.png" title="View" class="fa-icon-hover" style="cursor: pointer; width: 34px;display:`+item.Selected+`" />
                    </a></td>`; 
                 




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Template').html(htm);
           
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-Template').on('click', 'tr', function () {

    $('.tbody-Template tr').removeClass('active-tr');
    $(this).addClass('active-tr');
    $('.Template-Image').css('display', '');
    $('#imgTemplate').attr('src',this.children[3].textContent);


});


$('.tbody-Template').on('click', '.Save-Request-Details', function () {

    TempId = this.parentNode.parentNode.parentNode.children[0].textContent;
    UpdateTemplate();
    GetTemlateDet();


});

function UpdateTemplate() {
    $.ajax({
        url: "BriefForm.aspx/UpdateTemplateId",
        data: JSON.stringify({ 'TempId': TempId, "EventId": EventId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('File has been Uploaded Successfully. ', '');


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#btnTemplate').on('click', function () {

    $('.Template-Image').css('display', 'none');
});