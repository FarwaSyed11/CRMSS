var ReqNo = '';
var ScrapReqId = '';
var ItemId = '';
var objDatatableSPRequests = [];
var objDatatableItemDetails = [];
var objDatatableSubmitRequests = [];
var objDatatablRejectedRequests = [];
var ReqStatus = '';
var slideObj = [];
var SupervisorUserId = '';
var ItemDescription = [];

$(document).ready(function () {



    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        GetAllRequests();
        GetSubmitRequests();
        GetRejectedRequests();
        $(".ajax-loader").addClass('hidden');
    }, 500);

});



function GetAllRequests() {

    $.ajax({
        url: "RequestPage.aspx/GetAllRequests",
        data: JSON.stringify({ "UserId": currUserId}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-SPRequests tr').length > 0 ? objDatatableSPRequests.destroy() : '';
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
            $('.tbody-SPRequests').html(htm);

            initiateSPRequests();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateSPRequests() {
    objDatatableSPRequests = [];
    objDatatableSPRequests = $('.SP-Requests-details').DataTable({
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


function GetSubmitRequests() {

    $.ajax({
        url: "RequestPage.aspx/GetSubmitRequests",
        data: JSON.stringify({ "UserId": currUserId, "Status": $('#ddlStatus option:selected').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-SubmitRequest tr').length > 0 ? objDatatableSubmitRequests.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                 <td style="text-align:center;display:none;">` + item.ID + `</td>
                  <td style="text-align:center;">`+ item.RequestNumber + `</td>
                  <td style="text-align:center;">`+ item.SectionName + `</td>
                  <td style="text-align:center;">`+ item.SupervisorName + `</td>
                   <td style="text-align:center;">`+ item.UpdatedDate + `</td>
                   <td style="text-align:center;">
                   <img src="Image/Icon-Eye.png" title="View" class="fa-icon-hover ibtn-SubmitRequest-Details" style="cursor: pointer; width: 28px;"/>
                   </td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-SubmitRequest').html(htm);

            initiateSubmitRequests();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function GetRejectedRequests() {

    $.ajax({
        url: "RequestPage.aspx/GetRejectedRequests",
        data: JSON.stringify({ "UserId": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-QCReject tr').length > 0 ? objDatatablRejectedRequests.destroy() : '';
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
        <image title="Gallery" onclick="GallerySlideView(`+ item.ItemId + `,'` + item.ItemCode + `','` + item.ItemDescription.replaceAll('\"', "&quot;") + `','` + item.Quantity + `','` + item.Reason.replaceAll('\"', "&quot;") + `','` + item.Comments.replaceAll('\"', "&quot;") + `','` + item.SendToScrap + `','` + item.UsedByMe + `','` + item.QCRejectedQuantity +`')" src="Image/icon-Gallery.png" style="width: 40%;" />
        </div>
          </div>
          </div>

    </div>
    </div>

                  </td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-QCReject').html(htm);

            initiateRejectedRequests();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateRejectedRequests() {
    objDatatablRejectedRequests = [];
    objDatatablRejectedRequests = $('.SP-QCReject-details').DataTable({
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

$('.tbody-SubmitRequest').on('click', '.ibtn-SubmitRequest-Details', function () {

    ReqStatus = 2;
    $('.add-button').css('display', 'none');
    $('#btnSubmit').css('display', 'none');
    ScrapReqId = this.parentNode.parentNode.children[0].textContent;
    ReqNo = this.parentNode.parentNode.children[1].textContent;
    GetBasicDetails();
    GetRequestedItems();
    $('#modalItemDetails').modal('show');

});

function initiateSubmitRequests() {
    objDatatableSubmitRequests = [];
    objDatatableSubmitRequests = $('.SP-SubmitRequests-details').DataTable({
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

$('.tbody-SPRequests').on('click', '.ibtn-Request-Details', function () {

    ReqStatus = 1;
    $('.add-button').css('display', '');
    $('#btnSubmit').css('display', '');
    ScrapReqId = this.parentNode.parentNode.children[0].textContent;
    ReqNo = this.parentNode.parentNode.children[1].textContent;
    GetBasicDetails(); 
    GetRequestedItems();
    $('#modalItemDetails').modal('show');

});

$('#AddNewReq').on('click', function () {

    ClearNewRequestForm();
    GetRequestNumber();
    GetSectionDet();
    $('#ModaladdNewRequest').modal('show');

});


function SetRequestDetails() {

    $.ajax({
        url: "RequestPage.aspx/SetRequestDetails",
        data: JSON.stringify({ "UserId": currUserId, "RequestNumber": $('#txtRequestNumb').val(), "SectionName": $('#txtSection').val(), "SuperVisor": SupervisorUserId, "RMAIsEnable": $('#cbRMAIsEnable').is(':checked'), "RMANumber": $('#cbRMAIsEnable').is(':checked') == true ? $('#txtRMANumber').val() : "", "SuperVisorName": $('#txtSupervisor').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully', '');
            GetAllRequests();
            ClearNewRequestForm();

            const ReqVal = result.d.split(',');
            ScrapReqId = ReqVal[0];
            ReqNo = ReqVal[1];
            GetBasicDetails();
            GetRequestedItems();
            $('#modalItemDetails').modal('show');
                
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnCreateRequest').on('click', function () {
    ReqStatus = 1;
    $('.add-button').css('display', '');
    $('#btnSubmit').css('display', '');
    if ($('#cbRMAIsEnable').is(':checked') == true) {
        ValidationOfRMA();
    }
    else {
        SetRequestDetails();
    }
    

});

$("#ModaladdNewItem").on("change", '#fu-Scrap-attach', function () {

    $('.lbl-fufile-count').html($(this)[0].files.length + " File(s)");
    var htm = '';
    for (var i = 0; i < $(this)[0].files.length; i++) {
        htm += $(this)[0].files[i].name + "| ";
    }
    $('#lblFilesName').val(removeCommaFromLast(htm));
});

function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 2);
}

function RequestFileUpload() {
    $('#lblFilesForProfile').val() == "" ? toastr.error('Please select Profile Picture. ', '') : uploadScrapProfile();
    uploadScrapAttach();
}

function uploadScrapAttach() {

    

        var formData = new FormData();
        var fileUpload = $('#fu-Scrap-attach').get(0);
        var files = fileUpload.files;
        for (var i = 0; i < files.length; i++) {
            console.log(files[i].name);
            formData.append(files[i].name, files[i]);
        }

    var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FileUploadForScrapSystem.ashx?ItemId=' + ItemId + '&User=' + currUserId + '&Type=Gallery';    //for Live
    /// var qrystringLocal = '/Services/FileUploadForScrapSystem.ashx?ItemId=' + ItemId + '&User=' + currUserId + '&Type=Gallery';;    // For Development

        let sURL = 'TestFoCalendar.aspx/Upload';

        //var formData = new FormData();
        //formData.append('file', $('#f_UploadImage')[0].files[0]);
        $.ajax({
            type: 'post',
            url: qrystringLocal,
            data: formData,
            //xhr: function () {  // Custom XMLHttpRequest
            //    var myXhr = $.ajaxSettings.xhr();
            //    if (myXhr.upload) { // Check if upload property exists
            //        //update progressbar percent complete
            //        statustxt.html('0%');
            //        // For handling the progress of the upload
            //        myXhr.upload.addEventListener('progress', progressHandlingFunction, false);

            //    }
            //    return myXhr;
            //},
            async: false,
            success: function (status) {
                if (status != 'error') {
                    var my_path = "MediaUploader/" + status;
                    //  $("#myUploadedImg").attr("src", my_path);
                    toastr.success('File has been Uploaded Successfully. ', '');
     
                }
            },
            processData: false,
            contentType: false,
            error: function () {
                alert("Whoops something went wrong!");
            }
        });

    
}

function ClearNewRequestForm() {

    $('#txtRequestNumb').val('');
    $('#txtRequestDate').val('');
    $('#txtSection').val('');
    $('#txtSupervisor').val('');
    $('#cbRMAIsEnable').prop('checked', false);
    $('#txtRMANumber').val('');
    $('.Rma-Enable').css('display', 'none');
   

}


function GetRequestNumber() {

    $.ajax({
        url: "RequestPage.aspx/GetRequestNumber",
        data: JSON.stringify({ "UserId": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            const ReqValue = result.d.split(',');
            let RequestNumber = ReqValue[0];
            let TodayDate = ReqValue[1].split(' ')[0];

            $('#txtRequestNumb').val(RequestNumber);
            $('#txtRequestDate').val(TodayDate);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



    function GetSectionDet() {

        $.ajax({
            url: "RequestPage.aspx/GetSectionDetails",
            data: JSON.stringify({ "UserId": currUserId, }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                const Section = result.d.split(',');

                var SName = Section[1];
                var SupName = Section[0];
                SupervisorUserId = Section[2];

                $('#txtSection').val(SName);
                $('#txtSupervisor').val(SupName);

              
            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }


$('#AddNewItem').on('click', function () {

    ClearItemAdd();
    $('#btnCreateItem').css('display', '');
    $('#btnUpdateItem').css('display', 'none');
    $('#ModaladdNewItem').modal('show');

});

function SetItemDetails() {

    $.ajax({
        url: "RequestPage.aspx/SetItemDetails",
        data: JSON.stringify({ "UserId": currUserId, "RequestId": ScrapReqId, "RequestNo": ReqNo, "ItemCode": $('#txtItemCode').val(), "Description": $('#txtItemDesc').val(), "Quantity": $('#txtQuantity').val(), "Reason": $('#txtReason').val(), "Comment": $('#txtComment').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully', '');
            ItemId = result.d;
            RequestFileUpload();
            GetRequestedItems();
            ClearItemAdd();

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
        url: "RequestPage.aspx/GetRequestedItems",
        data: JSON.stringify({ "UserId": currUserId, "RequestId": ScrapReqId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-ItemDetails tr').length > 0 ? objDatatableItemDetails.destroy() : '';
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
            <image src="`+ item.URL+`" style="width: 93%;height:167px;" />

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
                    <label id="lblGrdItemCode">`+ textview(item.Comments) +`</label>
                </div>

            </div>
        </div>
    
        <div class="col-1" style="align-self: center;">
            <div class="verticalLine"></div>

        </div>
        <div class="col-2" style="padding-top:3%;">
        <div class=row>
        <div style="width:75%">
        <image title="Gallery" onclick="galleryView(`+ item.ItemId + `,'` + item.ItemCode + `','` + item.ItemDescription.replaceAll('\"', "&quot;").replaceAll('\'', "&sbquo").replaceAll('\,', "&#44;") + `','` + item.Quantity + `','` + item.Reason.replaceAll('\"', "&quot;").replaceAll('\'', "&sbquo").replaceAll('\,', "&#44;") + `','` + item.Comments.replaceAll('\"', "&quot;").replaceAll('\'', "&sbquo").replaceAll('\,', "&#44;") + `','` + item.SendToScrap + `','` + item.UsedByMe + `','` + item.QCRejectedQuantity +`')" src="Image/icon-Gallery.png" style="width: 40%;" />
        </div>
          <div style="width:25%" class="Edit-Item-Det">
          <image title="Edit" onclick="EditItem(`+ item.ItemId + `,'` + item.ItemCode + `','` + item.ItemDescription.replaceAll('\"', "&quot;").replaceAll('\'', "&sbquo").replaceAll('\,', "&#44;") + `','` + item.Quantity + `','` + item.Reason.replaceAll('\"', "&quot;").replaceAll('\'', "&sbquo").replaceAll('\,', "&#44;") + `','` + item.Comments.replaceAll('\"', "&quot;").replaceAll('\'', "&sbquo").replaceAll('\,', "&#44;") + `','` + item.FileName +`')" src="Image/icon-Edit.png" style="width: 51%;"/>
          <br/>
          <br/>
          <image title="Delete" onclick="DeleteItem(`+ item.ItemId +`)" src="Image/icon-Delete.png" style="width: 51%;" />
         </div>
          </div>
          </div>

    </div>
    </div>

                  </td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

                

            });
            $('.tbody-ItemDetails').html(htm);

            if (ReqStatus == 1) {
                $('.Edit-Item-Det').css('display', '');
            }

            else if (ReqStatus == 2) {
                $('.Edit-Item-Det').css('display', 'none');
            }

            initiateItemDetails();


           //textview();
            
        },
        

        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


    

}
function textview(itemDesc) {   

    let result = itemDesc.length < 90 ? itemDesc : itemDesc.substring(0, 90) + ' ...';

    return result;
    
}



function galleryView(Id, itemcode, description, quantity, reason, comment, SendToScrap, UsedByQc, QcReject) {

    if (ReqStatus == 1) {
    ItemId = Id;
        GetItemGallery();
        $('#modalItemgallary').modal('show');
    }
    else if (ReqStatus == 2) {
        setTimeout(function () {
            loadSlider(Id);
        }, 400);
        $('.Item-Code').html('Item Code:&nbsp;' + itemcode);
        $('.Item-Desc').html(description);
        $('#txtTotalQuantity').val(quantity);
        $('.Item-Reason').html(reason);
        $('.Item-Comment').html(comment);

        $('#txtApprovedItem').val(SendToScrap);
        $('#txtQCUsedItem').val(UsedByQc);
        $('#txtRejectedItem').val(QcReject);

        $('#modalItemDetailsQC').modal('show');
    }
}

$('.tbody-ItemDetails').on('click', '.ibtn-Delete-Details', function () {

    ItemId = this.parentNode.parentNode.children[0].textContent;
    DeleteItem();
});

//$('.tbody-ItemDetails').on('click', '.ibtn-Edit-Details', function () {

//    ItemId = this.parentNode.parentNode.children[0].textContent;
//    let ItemCode = this.parentNode.parentNode.children[1].textContent;
//    let Description = this.parentNode.parentNode.children[2].textContent;
//    let Quantity = this.parentNode.parentNode.children[3].textContent;
//    let Reason = this.parentNode.parentNode.children[4].textContent;
//    let Comment = this.parentNode.parentNode.children[5].textContent;
//    EditItem(ItemCode, Description, Quantity, Reason, Comment);
//});

function EditItem(Id, ItemCode, Description, Quantity, Reason, Comment,fileName) {
    ItemId = Id;
    $('#imgProfile').attr('src', '../Images/Scrap_Items/' + fileName);

    const filesplit = fileName.split('-');
    let FileNameFinal = '';
    for (i = 1; i < filesplit.length; i++) {

        FileNameFinal += filesplit[i];
        if (i < (filesplit.length - 1)) {
            FileNameFinal += '-';
        }
    }


    $('#lblFilesForProfile').val(FileNameFinal);
    $('#txtItemCode').val(ItemCode);
    $('#txtItemDesc').val(Description);
    $('#txtQuantity').val(Quantity);
    $('#txtReason').val(Reason);
    $('#txtComment').val(Comment);
    $('#lblFilesName').val('');

    $('#btnCreateItem').css('display', 'none');
    $('#btnUpdateItem').css('display', '');
    $('#ModaladdNewItem').modal('show');
}

function initiateItemDetails() {
    objDatatableItemDetails = [];
    objDatatableItemDetails = $('.SCP-Item-details').DataTable({
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

$('.tbody-ItemDetails')

function ClearItemAdd() {

    $('#txtItemCode').val('');
    $('#txtQuantity').val('');
    $('#txtItemDesc').val('');

    $('#txtReason').val('');
    $('#txtComment').val('');

    $('#lblFilesName').val('');
    $('.lbl-fufile-count').html('');
    $('#lblFilesForProfile').val('');
    $("#imgProfile").attr("src", 'Image/product-Profile.png');
}

$('#btnCreateItem').on('click', function () {

    
    SetItemDetails();

});

$('#cbRMAIsEnable').on('click', function () {

    if ($('#cbRMAIsEnable').is(':checked') == true) {

        $('.Rma-Enable').css('display', '');
    }
    else {

        $('.Rma-Enable').css('display', 'none');

    }

});

function ValidationOfRMA() {

    $.ajax({
        url: "RequestPage.aspx/ValidationOfRma",
        data: JSON.stringify({ "UserId": currUserId, "RMANumber": $('#txtRMANumber').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 1) {
                SetRequestDetails();
            }
            else {
                toastr.error('Enter Proper RMA Number', '');
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


function DeleteItem() {

    $.ajax({
        url: "RequestPage.aspx/DeleteItem",
        data: JSON.stringify({ "UserId": currUserId, "ItemId": ItemId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Deleted Successfully', '');
            GetRequestedItems();

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
        url: "RequestPage.aspx/GetBasicDetails",
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
$('#btnUpdateItem').on('click', function () {

    UpdateItemDetails();
});

function UpdateItemDetails() {

    $.ajax({
        url: "RequestPage.aspx/UpdateItemDetails",
        data: JSON.stringify({ "UserId": currUserId, "ItemId": ItemId, "RequestId": ScrapReqId, "RequestNo": ReqNo, "ItemCode": $('#txtItemCode').val(), "Description": $('#txtItemDesc').val(), "Quantity": $('#txtQuantity').val(), "Reason": $('#txtReason').val(), "Comment": $('#txtComment').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully', '');
            RequestFileUpload();
            GetRequestedItems();
            ClearItemAdd();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function hideShowProjDetails() {
    var x = document.getElementById("proj-details-rectangle-div");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#proj-details-rectangle-div').show('400');
        $('.proj-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.proj-det-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#proj-details-rectangle-div').hide('400');
        $('.proj-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.proj-det-drilldown').addClass('bx bxs-chevron-down');

    }
}


function uploadScrapProfile() {


   
    var formData = new FormData();
    var fileUpload = $('#fu-Scrap-Item-Profile').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

   var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FileUploadForScrapSystem.ashx?ItemId=' + ItemId + '&User=' + currUserId +'&Type=Profile';    //for Live
   ///  var qrystringLocal = '/Services/FileUploadForScrapSystem.ashx?ItemId=' + ItemId + '&User=' + currUserId +'&Type=Profile';    // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        //xhr: function () {  // Custom XMLHttpRequest
        //    var myXhr = $.ajaxSettings.xhr();
        //    if (myXhr.upload) { // Check if upload property exists
        //        //update progressbar percent complete
        //        statustxt.html('0%');
        //        // For handling the progress of the upload
        //        myXhr.upload.addEventListener('progress', progressHandlingFunction, false);

        //    }
        //    return myXhr;
        //},
        async: false,
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;
                //  $("#myUploadedImg").attr("src", my_path);
                toastr.success('File has been Uploaded Successfully. ', '');

            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });


}

function getFileName() {
    
 /*   $('.lbl-fufile-count').html($('#fu-Scrap-Item-Profile')[0].files.length + " File(s)");*/
    $('#lblFilesForProfile').val($('#fu-Scrap-Item-Profile')[0].files[0].name);
    var fileUpload = $('#fu-Scrap-Item-Profile').get(0);
    var files = fileUpload.files[0];
    var reader = new FileReader();

    reader.onload = function () {
        $("#imgProfile").attr("src", reader.result);
    }

    reader.readAsDataURL(files);

}


function GetItemGallery() {

    $.ajax({
        url: "RequestPage.aspx/GetItemGallery",
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
                            <img src="`+ result.d[0].URL +`" id="main" width=700 height=400>
                          
                        </div>
                        <div id="thumbnails">`

            $.each(ProjectDetails, function (key, item) {
                htm +=`
                            <img src="`+ item.URL + `" onclick="changeimage('` + item.FileName+`')">
                        `
                   
            });
            htm +=`</div>`
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

$('#btnSubmit').on('click', function () {

    SubmitRequest();

});


function SubmitRequest() {

    $.ajax({
        url: "RequestPage.aspx/SubmitRequest",
        data: JSON.stringify({ "UserId": currUserId, "ReqId": ScrapReqId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully. ', '');
            $('.ajax-loader').removeClass('hidden');

            setTimeout(function () {
                GetAllRequests();
                GetSubmitRequests();
                GetRejectedRequests();
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


function GallerySlideView(Id,itemcode,description,quantity,reason,comment,SendToScrap,UsedByQc,QcReject) {

    setTimeout(function () {
        loadSlider(Id);
    }, 400);
    $('.Item-Code').html('Item Code:&nbsp;'+itemcode);
    $('.Item-Desc').html(description);
    $('#txtTotalQuantity').val(quantity);
    $('.Item-Reason').html(reason);
    $('.Item-Comment').html(comment);
        
    $('#txtApprovedItem').val(SendToScrap);
    $('#txtQCUsedItem').val(UsedByQc);
    $('#txtRejectedItem').val(QcReject);

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

$('#ddlStatus').on('change', function () {


    GetSubmitRequests();

});
