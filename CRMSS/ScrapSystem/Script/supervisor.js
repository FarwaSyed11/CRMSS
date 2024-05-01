
var objDatatableSupRequests = [];
var objDatatableSupItemDetails = [];

var objDTsupApprovedRequests = [];

var objDTqcRejectedRequests = [];

var slideObj = [];
var ScrapReqId = '';
var ReqStatus = '';

$(document).ready(function () {



    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        GetAllSupRequests();
        GetApprovedReq();
        GetQCRejectedReq();
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

$('.tbody-PendingRequest').on('click', '.ibtn-Request-Details', function () {

    //ReqStatus = 1;
    //$('.add-button').css('display', '');
    //$('#btnSubmit').css('display', '');
    ReqStatus = 0;
    ScrapReqId = this.parentNode.parentNode.children[0].textContent;
    ReqNo = this.parentNode.parentNode.children[1].textContent;
    GetBasicDetails();
    GetRequestedItems();
    $('.Request-Status').css('display', '');
    $('#modalItemDetails').modal('show');

});

function initiatePendingRequest() {
    objDatatableSupRequests = [];
    objDatatableSupRequests = $('.pendingRequest-Table').DataTable({
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

function initiateSupItemDetails() {
    objDatatableSupItemDetails = [];
    objDatatableSupItemDetails = $('.Sup-Item-details').DataTable({
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


function initiateQCRejectdRequests() {
    objDTqcRejectedRequests = [];
    objDTqcRejectedRequests = $('.QCReject-Items').DataTable({
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
function initiateSupApproveddRequests() {
    objDTsupApprovedRequests = [];
    objDTsupApprovedRequests = $('.SupApproved-table').DataTable({
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
function GetAllSupRequests() {

    $.ajax({
        url: "ScrapSupervisor.aspx/GetAllSupRequests",
        data: JSON.stringify({ "UserId": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-PendingRequest tr').length > 0 ? objDatatableSupRequests.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                 <td style="text-align:center;display:none;">` + item.ID + `</td>
                  <td style="text-align:center;">`+ item.RequestNumber + `</td>
                  <td style="text-align:center;">`+ item.SectionName + `</td>
                  <td style="text-align:center;">`+ item.SupervisorName + `</td>
                   <td style="text-align:center;">`+ item.CreatedBy + `</td>
                   <td style="text-align:center;">`+ item.CreatedDate + `</td>
                   <td style="text-align:center;">
                   <img src="Image/Icon-Eye.png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 28px;"/>
                   </td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-PendingRequest').html(htm);

            initiatePendingRequest();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetBasicDetails() {

    $.ajax({
        url: "ScrapSupervisor.aspx/GetBasicDetails",
        data: JSON.stringify({ "UserId": currUserId, "RequestId": ScrapReqId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#lblRequestNumb').val(result.d[0].RequestNumber);
            $('#lblSection').val(result.d[0].SectionName);
            $('#lblSuperVisor').val(result.d[0].SupervisorName);
            $('#lblRequestBy').val(result.d[0].CreatedBy);
            $('#lblRequestedDate').val(result.d[0].CreatedDate);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetRequestedItems() {

    $.ajax({
        url: "ScrapSupervisor.aspx/GetSupRequestedItems",
        data: JSON.stringify({ "UserId": currUserId, "RequestId": ScrapReqId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-SupItemDetails tr').length > 0 ? objDatatableSupItemDetails.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `
                <tr>    
                <td>
     <div class="card">
                <div class="row">
        <div class="col-2">
            <image src="`+ item.URL + `" style="width: 93%;height:167px;" />

        </div>

        
   
        <div class="col-7">
            <div class="row" style="padding-top:1%;"> 
                <div class="col-2">
                    <label class="grid-text-header">Item Code</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9">
                    <label id="lblGrdItemCode" class="bg-Badge-Item">`+ item.ItemCode + `</label>
                </div>

                <div class="col-2">
                    <label class="grid-text-header">Description :</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9" style="padding-top: 3px;">
                    <label id="lblGrdDescription" style="color: #2b2bb7;font-size: 16px;">`+ textview(item.ItemDescription) + `</label>
                   
                </div>

                <div class="col-2">
                    <label class="grid-text-header">Quantity :</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9" style="padding-top: 3px;">
                    <label id="lblGrdItemCode" style="color: red;font-weight: bold;">`+ item.Quantity + `</label>
                </div>

                <div class="col-2">
                    <label class="grid-text-header">Reason :</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9" style="padding-top: 3px;">
                    <label id="lblGrdItemCode">`+ textview(item.Reason) + `</label>
                </div>

                <div class="col-2">
                    <label class="grid-text-header">Comment :</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9" style="padding-top: 3px;">
                    <label id="lblGrdItemCode">`+ textview(item.Comments) + `</label>
                </div>

            </div>
        </div>
    
        <div class="col-1" style="align-self: center;">
            <div class="verticalLine"></div>

        </div>
        <div class="col-2" style="padding-top:3%;">
        <div class=row>
        <div style="width:75%">
        <image title="Gallery" onclick="galleryView(`+ item.ItemId + `)" src="Image/icon-Gallery.png" style="width: 40%;" />
        </div>
       
          </div>
          </div>

    </div>
    </div>

                  </td>`;




                htm += `</tr>`;
                

            });
            $('.tbody-SupItemDetails').html(htm);

            initiateSupItemDetails();

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function textview(itemDesc) {

    let result = itemDesc < 90 ? itemDesc : itemDesc.substring(0, 90) + ' ...';

    return result;

}

function galleryView(Id) {

    ItemId = Id;
    GetItemGallery();
    $('#modalItemgallary').modal('show');

}

function GetItemGallery() {

    $.ajax({
        url: "ScrapSupervisor.aspx/GetItemGallery",
        data: JSON.stringify({ "UserId": currUserId, "ItemId": ItemId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;

            htm += ` <div>
                            <img src="`+ result.d[0].URL + `" id="main" width=700 height=400>
                          
                        </div>
                        <div id="thumbnails">`

            $.each(ProjectDetails, function (key, item) {
                htm += `
                            <img src="`+ item.URL + `" onclick="changeimage('` + item.FileName + `')">
                        `

            });
            htm += `</div>`
            $('.modal-gallery-view').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function changeimage(FileName) {

    $('#main').attr('src', '../Images/Scrap_Items/' + FileName);


}

function GetApprovedReq() {

    $.ajax({
        url: "ScrapSupervisor.aspx/GetApprovedReq",
        data: JSON.stringify({ "UserId": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-SupApproved tr').length > 0 ? objDTsupApprovedRequests.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                 <td style="text-align:center;display:none;">` + item.ID + `</td>
                  <td style="text-align:center;">`+ item.RequestNumber + `</td>
                  <td style="text-align:center;">`+ item.SectionName + `</td>
                  <td style="text-align:center;">`+ item.SupervisorName + `</td>
                   <td style="text-align:center;">`+ item.CreatedBy + `</td>
                   <td style="text-align:center;">`+ item.CreatedDate + `</td>
                   <td style="text-align:center;">`+ item.SupervisorUpdateDate + `</td>
                   <td style="text-align:center;">
                   <img src="Image/Icon-Eye.png" title="View" class="fa-icon-hover ibtn-ApprovedRequest-Details" style="cursor: pointer; width: 28px;"/>
                   </td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-SupApproved').html(htm);

            initiateSupApproveddRequests();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-SupApproved').on('click', '.ibtn-ApprovedRequest-Details', function () {

    //ReqStatus = 1;
    //$('.add-button').css('display', '');
    //$('#btnSubmit').css('display', '');
    ReqStatus = 0;
    ScrapReqId = this.parentNode.parentNode.children[0].textContent;
    ReqNo = this.parentNode.parentNode.children[1].textContent;
    GetBasicDetails();
    GetRequestedItems();
    $('.Request-Status').css('display', 'none');
    $('#modalItemDetails').modal('show');

});

function GallerySlideView(Id, itemcode, description, quantity, reason, comment) {

    setTimeout(function () {
        loadSlider(Id);
    }, 400);
    $('.Item-Code').html('Item Code:&nbsp;' + itemcode);
    $('.Item-Desc').html(description);
    $('#txtTotalQuantity').val(quantity);
    $('.Item-Reason').html(reason);
    $('.Item-Comment').html(comment);


    $('#modalItemDetailsQC').modal('show');


}
function GallerySlideViewRej(Id, itemcode, description, quantity, reason, comment) {

    setTimeout(function () {
        loadSlider(Id);
    }, 400);
    $('.Item-Code').html('Item Code:&nbsp;' + itemcode);
    $('.Item-Desc').html(description);
    $('#txtTotalQuantity').val(quantity);
    $('.Item-Reason').html(reason);
    $('.Item-Comment').html(comment);


    $('#modalItemDetailsQC').modal('show');


}

function loadSlider(id) {
    //$("#content-slider").lightSlider({
    //    loop: true,
    //    keyPress: true
    //});

    $.ajax({
        url: "RequestPage.aspx/LoadSlider",
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

function GetQCRejectedReq() {

    $.ajax({
        url: "ScrapSupervisor.aspx/GetQCrejectedReq",
        data: JSON.stringify({ "UserId": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-QCRejectedItems tr').length > 0 ? objDTqcRejectedRequests.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `
                <tr>    
                <td>
     <div class="card">
                <div class="row">
        <div class="col-2">
            <image src="`+ item.URL + `" style="width: 93%;height:167px;" />

        </div>

        
   
        <div class="col-7">
            <div class="row" style="padding-top:1%;"> 
                <div class="col-2">
                    <label class="grid-text-header">Item Code</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9">
                    <label id="lblRejectedItemCode" class="bg-Badge-Item">`+ item.ItemCode + `</label>
                </div>

                <div class="col-2">
                    <label class="grid-text-header">Description :</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9" style="padding-top: 3px;">
                    <label id="lblRejectedDescription" style="color: #2b2bb7;font-size: 16px;">`+ textview(item.ItemDescription) + `</label>
                   
                </div>

                <div class="col-2">
                    <label class="grid-text-header">Quantity :</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9" style="padding-top: 3px;">
                    <label id="lblRejectedItemCode" style="color: red;font-weight: bold;">`+ item.Quantity + `</label>
                </div>

                <div class="col-2">
                    <label class="grid-text-header">Reason :</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9" style="padding-top: 3px;">
                    <label id="lblRejectedItemCode">`+ textview(item.Reason) + `</label>
                </div>

                <div class="col-2">
                    <label class="grid-text-header">Comment :</label>
                </div>
                <div class="col-1" style="text-align-last:end;"><label class="grid-text-header">:</label> </div>
                <div class="col-9" style="padding-top: 3px;">
                    <label id="lblRejectedItemCode">`+ textview(item.Comments) + `</label>
                </div>

            </div>
        </div>
    
        <div class="col-1" style="align-self: center;">
            <div class="verticalLine"></div>

        </div>
        <div class="col-2" style="padding-top:3%;">
        <div class=row>
        <div style="width:75%">
        <image title="Gallery" onclick="GallerySlideViewRej(`+ item.ItemId + `,'` + item.ItemCode + `','` + item.ItemDescription.replaceAll('\"', "&quot;").replaceAll('\'', "&sbquo") + `','` + item.Quantity + `','` + item.Reason.replaceAll('\"', "&quot;").replaceAll('\'', "&sbquo") + `','` + item.Comments.replaceAll('\"', "&quot;").replaceAll('\'', "&sbquo") + `')" src="Image/icon-Gallery.png" style="width: 40%;" />
        </div>
          </div>
          </div>

    </div>
    </div>

                  </td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-QCRejectedItems').html(htm);

            initiateQCRejectdRequests();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnIdApproved').on('click', function () {

    ApproveReq();

});

function ApproveReq() {

    $.ajax({
        url: "ScrapSupervisor.aspx/setApproveReq",
        data: JSON.stringify({ "UserId": currUserId, "ReqId": ScrapReqId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully. ', '');
            $('.ajax-loader').removeClass('hidden');

            setTimeout(function () {
                GetAllSupRequests();
                GetApprovedReq();
                $(".ajax-loader").addClass('hidden');
            }, 500);
            $('#modalItemDetails').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}




