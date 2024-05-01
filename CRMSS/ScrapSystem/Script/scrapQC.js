var ItemId = '';
var objDtableAllscraplistqc = [];
var slideObj = [];
var ItemStatus = '';
var RoleBase = '';
var MarketingId = '';
$(document).ready(function () {
    if (myroleList.includes("12147")) {

        ItemStatus = 'QC-APPROVED';
        RoleBase = 1;
        $('.ManagerStage-ddl').css('display', '');
        $('.Director-ddl').css('display', 'none');
    }
    if (myroleList.includes("12149")) {

        ItemStatus = 'APPROVED_BY_SV';
        RoleBase = 0;
        $('.ManagerStage-ddl').css('display', 'none');
        $('.Director-ddl').css('display', 'none');
    }
    if (myroleList.includes("12148")) {

        ItemStatus = 'MANAGER-APPROVED';
        RoleBase = 2;
        $('.ManagerStage-ddl').css('display', 'none');
        $('.Director-ddl').css('display', '');
    }

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        ViewAllItemsqc();


        $(".ajax-loader").addClass('hidden');
    }, 500);

});

function loadSlider(id) {
    //$("#content-slider").lightSlider({
    //    loop: true,
    //    keyPress: true
    //});

    $.ajax({
        url: "ScrapQC.aspx/LoadSlider",
        data: JSON.stringify({ "ItemId": id }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            var htm = '';
            var ProjectDetails = result.d;
           
            $.each(ProjectDetails, function (key, item) {

                htm += `                        

                                                            <li data-thumb="`+ item.URL + `">
                                                                <img src="`+ item.URL + `" width=800 height=533 />
                                                            </li>
                                                       `
            });
          
            $('.gallery-slide-view').html(htm);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    slideObj.length != 0 ? slideObj.destroy() : '';

    slideObj = $('#image-gallery').lightSlider({
        gallery: true,
        item: 1,
        thumbItem: 9,
        slideMargin: 0,
        speed: 500,
        auto: true,
        loop: true,
        onSliderLoad: function () {
            $('#image-gallery').removeClass('cS-hidden');
        }
    });

}

function ItemGallaryQC(LineId, id, itemcode, description, quantity, reason, comment) {

    MarketingId = LineId;
    ItemId = id;

    $('.Item-Code').html('Item Code:&nbsp;' + itemcode);
    $('.Item-Description').html(description);
    $('#txtTotalQuantity').val(quantity);
    $('.Item-Reason').html(reason);
    $('.Item-Comment').html(comment);


    if (RoleBase == 0) {
        $('.item-qc-details').css('display', '');
        $('.item-Market-details').css('display', 'none');
        $('#ddlUsedMeQuantity').css('display', '');
        $('#txtUsedMeQuant').css('display', 'none'); 
        $('.section-tab').css('display', 'none');
        $('#tab-Items').addClass('show active');
        $('#tab-Section').removeClass('show active');

        $('#btnunitReqApproved').css('display', '');
        $('#btnManagerApproved').css('display', 'none');
        LoadQuantity(id);
        CountOfRejected();
        $('#modalItemDetailsQC').modal('show');
        setTimeout(function () {
            loadSlider(id);
        }, 400);
    }
    else if (RoleBase == 1) {
        $('.item-qc-details').css('display', '');
        $('.item-Market-details').css('display', 'none');
        $('#ddlUsedMeQuantity').css('display', 'none');
        $('#txtUsedMeQuant').css('display', '');
        $('.section-tab').css('display', 'none');
        $('#tab-Items').addClass('show active');
        $('#tab-Section').removeClass('show active');

        $('#btnunitReqApproved').css('display', '');
        $('#btnManagerApproved').css('display', 'none');
        LoadQCApprovedQuantity();
        $('#modalItemDetailsQC').modal('show');
        setTimeout(function () {
            loadSlider(id);
        }, 400);
    }
    else if (RoleBase == 2) {

        $('.item-qc-details').css('display', 'none');
        $('.item-Market-details').css('display', '');
        $('.section-Name-div').css('display', '');
        $('.section-tab').css('display', 'none');

        $('#btnunitReqApproved').css('display', 'none');
        $('#btnManagerApproved').css('display', '');
        $('#tab-Items').addClass('show active');
        $('#tab-Section').removeClass('show active');
        AllQTYDetails();
        $('#modalItemDetailsQC').modal('show');
        setTimeout(function () {
            loadSlider(id);
        }, 400);
        
    }

    else if (RoleBase == 3) {   

        $('.item-qc-details').css('display', 'none');
        $('.item-Market-details').css('display', '');
        $('.section-Name-div').css('display', 'none');
        $('#modalItemDetailsQC').modal('show');
        $('.section-tab').css('display', '');
        AllQTYDetailsForNotInterest();
        SectionDetails();
        $('#btnunitReqApproved').css('display', 'none');
        $('#btnManagerApproved').css('display', '');
        setTimeout(function () {
            loadSlider(id);
        }, 400);

    }

    
}

 


function DTableAllScrapItemListqc() {
    objDtableAllscraplistqc = [];
    objDtableAllscraplistqc = $('.AllScrapeItemsqc').DataTable({
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



function ViewAllItemsqc() {

    $.ajax({
        url: "ScrapQC.aspx/GetAllItemsqc",
        data: JSON.stringify({ "Status": ItemStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-AllItemListqc tr').length > 0 ? objDtableAllscraplistqc.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `
                <tr>    
                <td>
     <div class="card" style="border:1px Solid;border-color: #9ea7ad;">
                <div class="row">
        <div class="col-2">
            <image src="`+ item.URL + `" style="width: 93%;height:167px;" />

        </div>

        
   
        <div class="col-8">
            <div class="row" style="padding-top:1%;"> 
                <div class="col-2">
                    <label class="grid-text-header">Item Code</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9">
                    <label id="lblGrdItemCode" class="bg-Badge-Item">`+ item.ItemCode + `</label>
                </div>

                <div class="col-2">
                    <label class="grid-text-header">Description</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9" style="padding-top: 3px;">
                    <label id="lblGrdItemCode" style="color: #2b2bb7;font-size: 16px;">`+ textviewqc(item.ItemDescription) + `</label>
                </div>

                <div class="col-2">
                    <label class="grid-text-header">Quantity</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9" style="padding-top: 3px;">
                    <label id="lblGrdItemCode" style="color: red;font-weight: bold;">`+ item.Quantity + `</label>
                </div>`
                if (ItemStatus =='PURCHASED') {

                    htm += `<div class="col-2">
                    <label class="grid-text-header">Requested QTY</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9" style="padding-top: 3px;">
                    <label id="lblGrdItemCode" style="color: green;font-weight: bold;">`+ item.QTY + `</label>
                </div>`
                }
                

                htm += `<div class="col-2">
                    <label class="grid-text-header">Reason</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9" style="padding-top: 3px;">
                    <label id="lblGrdItemCode">`+ textviewqc(item.Reason) + `</label>
                </div>

                <div class="col-2">
                    <label class="grid-text-header">Comment</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9" style="padding-top: 3px;">
                    <label id="lblGrdItemCode">`+ textviewqc(item.Comments) + `</label>
                </div>

            </div>
        </div>
    
        <div class="col-1" style="align-self: center;">
            <div class="verticalLine"></div>

        </div>
        <div class="col-1" style="padding-top:3%;"><image title="Gallery" class="ItemGallary" onclick="ItemGallaryQC('`+ item.LineId + `',`+ item.ItemId + `,'` + item.ItemCode + `','` + item.ItemDescription.replaceAll('\"', "&quot;").replaceAll('\'', "&sbquo") + `','` + item.Quantity + `','` + item.Reason.replaceAll('\"', "&quot;").replaceAll('\'', "&sbquo") + `','` + item.Comments.replaceAll('\"', "&quot;").replaceAll('\'',"&sbquo") +`')" src="Image/icon-Gallery.png" style="width: 55%;" /></div>
    </div>
    </div>

                  </td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-AllItemListqc').html(htm);

            DTableAllScrapItemListqc();
            //textviewqc();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function textviewqc(itemDesc, ItemReason, ItemComment) {




    let result = itemDesc < 90 ? itemDesc : itemDesc.substring(0, 90) + ' ...';

    return result;

    let Reason = ItemReason < 90 ? ItemReason : ItemReason.substring(0, 90) + ' ...';
    return Reason;

    let Comment = ItemComment < 90 ? ItemComment : ItemComment.substring(0, 90) + ' ...';
    return Comment;

}

function LoadQuantity(id) {

    $.ajax({
        url: "ScrapQC.aspx/LoadQuantity",
        data: JSON.stringify({ "ItemId": id }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 0) { htm = '<option value="0"> --- Select Quqantity --- </option>'; }

            $('#txtTotalQuantity').val(result.d[0].ddlValue);
            $.each(result.d, function (key, item) {

                for (i = 1; i <= item.ddlValue; i++) {

                    htm += `<option value="` + i + `" > ` + i + `</option>`;
                }

            });

            $('#ddlAcceptedQuantity').html(htm);
            $('#ddlUsedMeQuantity').html(htm);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function CountOfRejected() {

    let Tot = $('#txtTotalQuantity').val();
    let Accepted = $('#ddlAcceptedQuantity option:selected').val();
    let Rejected = $('#ddlUsedMeQuantity option:selected').val();

    parseInt($('#txtRejectQuantity').val(parseInt(Tot) - (parseInt(Accepted) + parseInt(Rejected))));

    if ($('#txtRejectQuantity').val() < 0) {

        $('#txtRejectQuantity').css({ 'color': 'red' });
    }
    else {
        $('#txtRejectQuantity').css({ 'color': 'green' });
    }
}

$('#ddlAcceptedQuantity').on('change', function () {
    if (RoleBase == 0) {
        AcceptedQuantityChange();
    }
    else if (RoleBase == 1) {
        UsedByQC();
    }
    
});

function AcceptedQuantityChange() {
    let BfSelected = $('#ddlUsedMeQuantity option:selected').val();
    var htm = '<option value="0"> --- Select Quqantity --- </option>';
    let Quant = parseInt($('#txtTotalQuantity').val()) - parseInt($('#ddlAcceptedQuantity option:selected').val());
    for (i = 1; i <= Quant; i++) {
        htm += `<option value="` + i + `" > ` + i + `</option>`;
    }
    $('#ddlUsedMeQuantity').html(htm);
    $('#ddlUsedMeQuantity').val(BfSelected);

    CountOfRejected();
}


$('#ddlUsedMeQuantity').on('change', function () {
    if (RoleBase == 0) {
        QCUsedMeQuantityChange();
    }
});

function QCUsedMeQuantityChange()
{
    let BfSelected = $('#ddlAcceptedQuantity option:selected').val();

    var htm = '<option value="0"> --- Select Quqantity --- </option>';
    let Quant = parseInt($('#txtTotalQuantity').val()) - parseInt($('#ddlUsedMeQuantity option:selected').val());
    for (i = 1; i <= Quant; i++) {
        htm += `<option value="` + i + `" > ` + i + `</option>`;
    }
    $('#ddlAcceptedQuantity').html(htm);
    $('#ddlAcceptedQuantity').val(BfSelected);

    CountOfRejected();
}


function Approved() {

    $.ajax({
        url: "ScrapQC.aspx/setApprovedDet",
        data: JSON.stringify({ "ItemId": ItemId, "SendToScrap": $('#ddlAcceptedQuantity option:selected').val(), "UsedByMe": $('#ddlUsedMeQuantity option:selected').val(), "Rejected": $('#txtRejectQuantity').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully. ', '');
            ViewAllItemsqc();
            $('#modalItemDetailsQC').modal('hide');
          
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#btnunitReqApproved').on('click', function () {
    if (RoleBase == 0) {
        Approved();
    }
    else if (RoleBase == 1) {

        ApprovedByManager();
    }
});


//function Rejected() {

//    $.ajax({
//        url: "ScrapQC.aspx/setRejectDet",
//        data: JSON.stringify({ "ItemId": ItemId, "RejectQnt": $('#txtTotalQuantity').val(), }),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        async: false,
//        success: function (result) {
//            toastr.success('Updated Successfully. ', '');
//            $('#modalItemDetailsQC').modal('hide');

//        },
//        //complete: function () {
//        //    $('.ajax-loader').hide();
//        //},
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//}


//$('#btnunitReqRejected').on('click', function () {

//    Rejected();
//});


function LoadQCApprovedQuantity() {

    $.ajax({
        url: "ScrapQC.aspx/LoadQCApprovedQuantity",
        data: JSON.stringify({ "ItemId": ItemId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            let ApprovedQuant = parseInt(result.d[0].Quantity) - parseInt(result.d[0].QCRejectedQuantity);

            for (i = 1; i <= ApprovedQuant; i++) {

                htm += `<option value="` + i + `" > ` + i + `</option>`;
            }

            $('#ddlAcceptedQuantity').html(htm);
            $('#ddlAcceptedQuantity').val(result.d[0].SendToScrap);

            $('#txtUsedMeQuant').val(result.d[0].UsedByMe);
            $('#txtRejectQuantity').val(result.d[0].QCRejectedQuantity);
           
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function UsedByQC() {

    let UsedByQc = parseInt($('#txtTotalQuantity').val()) - (parseInt($('#ddlAcceptedQuantity option:selected').val()) + parseInt($('#txtRejectQuantity').val()));

    parseInt($('#txtUsedMeQuant').val(UsedByQc));
}


function ApprovedByManager() {

    $.ajax({
        url: "ScrapQC.aspx/setApprovedByManager",
        data: JSON.stringify({ "UserId": currUserId, "ItemId": ItemId, "SendToScrap": $('#ddlAcceptedQuantity option:selected').val(), "UsedByMe": $('#txtUsedMeQuant').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully. ', '');
            ViewAllItemsqc();
            $('#modalItemDetailsQC').modal('hide');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#ddlStage').on('change', function () {
    if ($('#ddlStage').val() == 1) {

        ItemStatus = 'QC-APPROVED';
        RoleBase = 1;
    }

    else if ($('#ddlStage').val() == 2) {

        ItemStatus = 'PURCHASED';
        RoleBase = 2;
    }

    else if ($('#ddlStage').val() == 3) {

        ItemStatus = 'SCRAP';
        RoleBase = 3;
    }
    ViewAllItemsqc();
});


function AllQTYDetails() {

    $.ajax({
        url: "ScrapQC.aspx/getAllQTYDetails",
        data: JSON.stringify({ "UserId": currUserId, "LineId": MarketingId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtApprovedQTY').val(result.d[0].SendToScrap);
            $('#txtUsedByQC').val(result.d[0].UsedByMe);
            $('#txtRejectQTY').val(result.d[0].QCRejectedQuantity);
            $('#txtsectionName').css('display', '');
            $('#txtsectionName').val(result.d[0].Section);
            $('#txtPurchasedQTY').val(result.d[0].QTY);
            $('#txtScrapQTY').val(result.d[0].ScrapQTY);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
$('#btnManagerApproved').on('click', function () {

    if (RoleBase == 2 && ItemStatus == 'PURCHASED') {

        ManagerPurchaseItemApprove();
    }

    else if (RoleBase == 2 && ItemStatus == 'MANAGER-APPROVED') {

        DirectorPurchaseItemApprove();
    }

    else if (RoleBase == 3 && ItemStatus == 'SCRAP') {

        NotInterestItemApprove();
    }

    else if (RoleBase == 3 && ItemStatus == 'MANAGER-SCRAP') {

        NotInterestItemApprove();
    }

});

function ManagerPurchaseItemApprove() {


    $.ajax({
        url: "ScrapQC.aspx/setManagerPurchaseApprove",
        data: JSON.stringify({ "UserId": currUserId, "LineId": MarketingId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully. ', '');
           
            $('#modalItemDetailsQC').modal('hide');
            ViewAllItemsqc();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function NotInterestItemApprove() {


    $.ajax({
        url: "ScrapQC.aspx/setManagerNotInterestApprove",
        data: JSON.stringify({ "UserId": currUserId, "ItemId": ItemId, "Status": ItemStatus,"QTY": $('#txtScrapQTY').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully. ', '');

            $('#modalItemDetailsQC').modal('hide');
            ViewAllItemsqc();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


$('#btnManagerRejected').on('click', function () {

    if (RoleBase == 2 && ItemStatus == 'PURCHASED') {

        ManagerPurchaseItemReject();
    }

    else if (RoleBase == 2 && ItemStatus == 'MANAGER-APPROVED') {

        DirectorPurchaseItemReject();
    }

    else if (RoleBase == 3 && ItemStatus == 'SCRAP') {

        NoteInterestItemReject();
    }

    else if (RoleBase == 3 && ItemStatus == 'MANAGER-SCRAP') {

        NoteInterestItemReject();
    }

});

function ManagerPurchaseItemReject() {


    $.ajax({
        url: "ScrapQC.aspx/setManagerPurchaseReject",
        data: JSON.stringify({ "UserId": currUserId, "LineId": MarketingId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully. ', '');
            $('#modalItemDetailsQC').modal('hide');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function NoteInterestItemReject() {


    $.ajax({
        url: "ScrapQC.aspx/setNoteInterestItemReject",
        data: JSON.stringify({ "UserId": currUserId, "ItemId": ItemId, "Status": ItemStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully. ', '');
            $('#modalItemDetailsQC').modal('hide');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


$('#ddlStageDir').on('change', function () {
   
    if ($('#ddlStageDir').val() == 2) {

        ItemStatus = 'MANAGER-APPROVED';
        RoleBase = 2;
    }

    else if ($('#ddlStageDir').val() == 3) {

        ItemStatus = 'MANAGER-SCRAP';
        RoleBase = 3;
    }
    ViewAllItemsqc();
});


function DirectorPurchaseItemApprove() {


    $.ajax({
        url: "ScrapQC.aspx/setDirectorPurchaseApprove",
        data: JSON.stringify({ "UserId": currUserId, "LineId": MarketingId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully. ', '');
            $('#modalItemDetailsQC').modal('hide');
            ViewAllItemsqc();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function DirectorPurchaseItemReject() {


    $.ajax({
        url: "ScrapQC.aspx/setDirectorPurchaseReject",
        data: JSON.stringify({ "UserId": currUserId, "LineId": MarketingId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully. ', '');
            $('#modalItemDetailsQC').modal('hide');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function AllQTYDetailsForNotInterest() {

    $.ajax({
        url: "ScrapQC.aspx/getAllQTYDetailsForNotInterest",
        data: JSON.stringify({ "UserId": currUserId, "ItemId": ItemId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtApprovedQTY').val(result.d[0].SendToScrap);
            $('#txtUsedByQC').val(result.d[0].UsedByMe);
            $('#txtRejectQTY').val(result.d[0].QCRejectedQuantity);
            $('#txtsectionName').css('display', 'none');
            $('#txtPurchasedQTY').val(result.d[0].QTY);
            $('#txtScrapQTY').val(result.d[0].ScrapQTY);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


function SectionDetails() {

    $.ajax({
        url: "ScrapQC.aspx/getSectionDetails",
        data: JSON.stringify({ "UserId": currUserId, "ItemId": ItemId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            var htm = '';
            var htmdrop = '';
            var x = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {

                if (key + 1 % 3 == 1) {

                    x = 'color-bg-1'
                }
                else if (key + 1 % 3 == 2) {
                    x ='color-bg-2'
                }
                else if (key + 1 % 3 == 0) {
                    x = 'color-bg-3'
                }
                
                htm += `
            <div class="ag-courses_item">
                                                            <a href="#" class="ag-courses-item_link">
                                                                <div class=`+x+`></div>

                                                                <div class="ag-courses-item_title">
                                                                    `+ item.Section+`
                                                                </div>

                                                                <div class="ag-courses-item_date-box">
                                                                    Quantity:
          <span class="ag-courses-item_date"><select id="ddl`+ item.LineId + `" type="text" style="border:none;width: 90px;background-color: #d9d9d9;color: #ff0000;">`

                for (i = 1; i <= item.QTY; i++) {
                    let selval = (i == item.QTY) ? 'selected' : '';
                        htm += `<option value="` + i + `"` + selval +` > ` + i + `</option>`;
                }


                htm += ` </select >
                <img src="Image/Save-info.png" style="width: 23px;float:right;" title="Update" id="btnUpdateQTY" onclick="UpdateSectionQTY(`+ item.LineId+`)"/>
          </span >
                                                                </div>
                                                            </a>
                                                        </div>`
         

                

               
                $('#ddl' + item.LineId).val(item.QTY);
                
            });
            $('.section-details').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


function UpdateSectionQTY(Id) {

    $.ajax({
        url: "ScrapQC.aspx/setUpdateSectionQTY",
        data: JSON.stringify({ "UserId": currUserId, "Id": Id, "Quantity": $('#ddl' + Id + ' option:selected').val(), "Status": ItemStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully. ', '');
            AllQTYDetailsForNotInterest();
           

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}