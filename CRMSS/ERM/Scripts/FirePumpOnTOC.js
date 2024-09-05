//---------
//---------
//START-------------------On TOC Side------------------//


$(document).ready(function () {

    

});


var selFpReqId = 0;
var listAllFpReqs = 0;
var isSpecAttached = 0;
var isListofMake = 0;
var isPumpSched = 0;
var listPumpReqs = [];
var objDatatableFPReq = [];
var listPumpReqsView = [];
var objDTViewReq = [];
var PumpMainReqID = 0, ItemID =0;
function selectedReq(selFpReqId) {
    selRequest = selFpReqId;
}

$('.btn-add-firepump').on('click', function () {
    $('#modalAddFirepumpReq').modal('show');
    
    if (myroleList.includes("14213")) {
        $("#btnAddFirePumpItem").addClass("hidden");
    }
    //initiateDataTableFPRequests();
    var htm = '';
    $(".pumpLine").html(htm);
    $('#btnSaveFirePumpItem').css("display", "none");
    $('#btnClose').css("display", "none");
    ViewRequests();
    GetFPumpAttachDetails()
    $('.tbody-added-firepumpreqs tr td:eq(0)').length == 0 ? $(".fpumpFilesDiv").addClass('hidden') : $(".fpumpFilesDiv").removeClass('hidden');
})
$('#btnSubmit').on('click', function () {
    $('#btnAddFirePumpItem').addClass("hidden");
    $('#btnSubmit').addClass("disabled");
    $('#btnSubmit').text("Request Submitted");
    Submitted();
    toastr.success('This request is submitted to the FIRE PUMP TEAM, Successfully');
})
$('#btnClose').on('click', function () {
    var htm = '';
    $(".pumpLine").html(htm);
    $('#btnSaveFirePumpItem').css("display", "none");
    $('#btnClose').css("display", "none");
    ViewRequests();
})

$('#btnAddFirePumpItem').on('click', function () {
    ViewRequests();
    createPumpLineHTML();
    $('#btnSaveFirePumpItem').css("display", "");
    $('#btnClose').css("display", "");

    $('#btnAddFirePumpItem').addClass("hidden");
})
$('#btnSaveFirePumpItem').on('click', function () {
    newPumponLine();
    //initiateDataTableFPRequests();
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
            "Description": $(".pumpLine #ddlPumpTypeDesc option:selected").val(),//$("input[name=desc]").val(),
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
            "PumpSpecs": ($("input[name=isAttached]").is(":checked") ? 1 : 0) ,
            "ListofMake": ($("input[name=isListofMake]").is(":checked") ? 1 : 0),
            "PumpSched": ($("input[name=isPumpSched]").is(":checked") ? 1 : 0),
            "PumpApproval": $('input[name=rdPumpApproval]:checked').val()
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#btnAddFirePumpItem').removeClass("hidden");
            $('#btnSaveFirePumpItem').css("display", "none");
            $('#btnClose').css("display", "none");
            $(".pumpLine").html('');
            toastr.success("Pump Requested Successfully!");
            ViewRequests();
            $('.tbody-added-firepumpreqs tr td:eq(0)').length == 0 ? $(".fpumpFilesDiv").addClass('hidden') : $(".fpumpFilesDiv").removeClass('hidden')
        },
        error: function (errormessage) {
        }
    });
}

function Submitted() {

    if ($(".tbody-added-firepumpreqs tr").length == 0) {
        toastr.error('Please add item first','')
    }
    else {
        PumpMainReqID = $(".tbody-added-firepumpreqs tr td:eq(0)").text().trim()
        $.ajax({
            url: "EMSItemList.aspx/ChangeStatusToSubmit",
            type: "POST",
            data: JSON.stringify({
                "RequstId": PumpMainReqID,
                "UserId": currUserId,
            }),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

            },
            error: function (errormessage) {
            }
        });
    }
    
}

function ViewRequests() {
    $.ajax({
        url: "EMSItemList.aspx/ViewFirePumpReq",
        type: "POST",
        data: JSON.stringify({
            "RequstId": selReqId,
            /*"UserId": currUserId,*/
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            listPumpReqs = result.d;
            $('#btnAddFirePumpItem').removeClass("hidden");
            //$('.tbody-added-firepumpreqs tr').length > 0 ? objDTViewReq.destroy() : '';
            if (listPumpReqs.length > 0) {
                if (listPumpReqs[0].Status == "CREATED") {
                    $('#btnSubmit').removeClass("disabled");

                    
                }
                else {
                    $('#btnSubmit').addClass("disabled");
                    $('#btnSubmit').text("Request Submitted");
                    $('#btnAddFirePumpItem').addClass("hidden");
                    
                }
            } else {
                $('#btnSubmit').addClass("disabled"); 
                $('#btnSubmit').text("Submit");
                $('#btnAddFirePumpItem').removeClass("hidden");
                
            }
           
            $.each(listPumpReqs, function (key, item) {

                htm += `<tr>  
                 <td style="text-align:center;display:none;">` + item.ReqID + `</td>
                  <td style="text-align:center;">`+ item.SlNO + `</td>
                   <td style="text-align:center;display:none;">` + item.ItemID + `</td>
                  <td style="text-align:center;">`+ item.Area + `</td>
                  <td style="text-align:center;">`+ item.Description + `</td>
                  <td style="text-align:center;">`+ item.QTY + `</td> 
                  <td style="text-align:center;">`+ item.TypeOfPump + `</td> 
                  <td style="text-align:center;">
                  <svg xmlns="http://www.w3.org/2000/svg" class="view-FP-details" width="2rem" height="2rem" viewBox="0 0 24 24" title="View More" style="cursor: pointer;">
                        <g fill="none" stroke="#b22e35">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.009m3.996 0h.008m3.978 0H16" />
                            <circle cx="12" cy="12" r="10" stroke-width="1.5" />
                        </g>
                  </svg>
                    <span class="position-absolute ml-1 deletePumpRequest"> <i class="bx bxs-trash struct-edit hide-control-bos" style="color:#d54832;font-size: 1.9rem;" onclick="openModDelDeleteFP(` + item.ItemID + `,`+item.ReqID+`)"></i></span>
                  </td>`;

                htm += `</tr>`;
            });
            $('.tbody-added-firepumpreqs').html(htm);



            if (listPumpReqs.length > 0) {
                if (listPumpReqs[0].Status == "CREATED") {
                    $('.deletePumpRequest').removeClass("disabled");
                }
                else {
                  
                    $('.deletePumpRequest').addClass("hidden");
                    
                }
            } else {
                $('.deletePumpRequest').removeClass("disabled");
                
            }

            //initiateDataTableFPRequests();
        },
        error: function (errormessage) {
        }
    });
}

function initiateDataTableFPRequests() {
    objDTViewReq = [];
    objDTViewReq = $('.table-added-firepumpreqs').DataTable({
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

function openModDelDeleteFP(itemidPk, pumpReqId) {
    $("#deleteFPReqModal").modal('show');
    $(".btn-del-fpump-yes").data('itemid', itemidPk);
    $(".btn-del-fpump-yes").data('pumpreqid', pumpReqId);
}
$(".btn-del-fpump-yes").on('click', function () {

    deletePumpRec($(this).data('itemid'), $(this).data('pumpreqid'))
})

function deletePumpRec(itmid, pumpreqid) {
    $.ajax({
        url: "EMSItemList.aspx/DeletePumpMainReq",
        type: "POST",
        data: JSON.stringify({
            "PumpItemId": itmid,
            "PumpReqId": pumpreqid,
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Pump deleted successfully','')
            ViewRequests()
            $('.tbody-added-firepumpreqs tr td:eq(0)').length == 0 ? $(".fpumpFilesDiv").addClass('hidden') : $(".fpumpFilesDiv").removeClass('hidden');
        },
        error: function (errormessage) {
        }
    });
}

$('.table-added-firepumpreqs').on('click', '.view-FP-details', function () {
    PumpMainReqID = this.parentNode.parentNode.children[0].textContent;
    ItemID = this.parentNode.parentNode.children[2].textContent;
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
            htm += `<div class="row mx-3">`;

            if (listPumpReqsView[0].PumpApproval == 'UL & FM APPROVED') {
               
                htm += `<div class="form-check col-12 ms-3 mb-4">
                <b>PUMP APPROVAL :
                    </b>
                    <input type="radio" name="rdPumpApproval" value="UL & FM APPROVED" style="margin-left: 5%;pointer-events: none;" checked/>UL & FM APPROVED
                     
                 <input type="radio" name="rdPumpApproval" value="NON LISTED" style="margin-left: 5%;pointer-events: none;" />NON LISTED

                 </div></div>`;
            }
            else {
                htm += `<div class="form-check col-12 ms-3 mb-4">
                <b>PUMP APPROVAL :
                    </b>
                    <input type="radio" name="rdPumpApproval" value="UL & FM APPROVED" style="margin-left: 5%;pointer-events: none;" />UL & FM APPROVED
                     
                 <input type="radio" name="rdPumpApproval" value="NON LISTED" style="margin-left: 5%;pointer-events: none;" checked/>NON LISTED
                </div></div>`;
            }

            htm += `<div class="row mx-3">`;

    

            if (listPumpReqsView[0].PumpSpecs == "False") {
                htm += `<div class="form-check col-4 ms-3 mb-4">
                            <input class="form-check-input" type="checkbox" value=""  name="isAttached" style="pointer-events: none;">
                            <label class="form-check-label" for="">
                                Specifications Attached
                            </label>
                        </div>`;
            }
            else {
                htm += `<div class="form-check col-4 ms-3 mb-4">
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



            htm += `<div class="row mt-1" style="text-align: center;">

                        <table class="">
                            <thead>
                                <tr class="">
                                    <th style="width: 230px !important">Pump Set</th>
                                    <th style="width: 290px !important">Capacity (GPM)</th>
                                    <th style="width: 100px !important">Pressure (Bars)</th>
                                    <th style="width: 100px !important">QTY</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="">
                                    <td>Electrical Pump Set</td>
                                    <td class="position-relative" style="">
                                        <label class="">`+ listPumpReqsView[0].ECapacity + `</label></td>
                                    <td class="position-relative" style="">
                                        <label class="">`+ listPumpReqsView[0].EBars + `</label></td>
                                    <td class="position-relative" style="">
                                        <label class="">`+ listPumpReqsView[0].EQTY + `</label></td>
                                </tr>
                                <tr class="">
                                    <td>Diesel Pump Set</td>
                                    <td class="position-relative">
                                        <label class="">`+ listPumpReqsView[0].DCapacity + `</label></td>
                                    <td class="position-relative">
                                        <label class="">`+ listPumpReqsView[0].DBars + `</label></td>
                                    <td class="position-relative">
                                        <label class="">`+ listPumpReqsView[0].DQTY + `</label></td>
                                </tr>
                                <tr class="">
                                    <td>Jockey Pump Set</td>
                                    <td class="position-relative">
                                        <label class="">`+ listPumpReqsView[0].JCapacity + `</label></td>
                                    <td class="position-relative">
                                        <label class="">`+ listPumpReqsView[0].JBars + `</label></td>
                                    <td class="position-relative">
                                        <label class="">`+ listPumpReqsView[0].JQTY + `</label></td>
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
 var SysNameList = listSystemsItems.filter(s => s.ReqId == selReqId && s.EMSProductOrderNo == 1).map(ss => ss.System).filter((value, index, self) => self.indexOf(value) === index);
    var htmForDDL = SysNameList.length == 0 ? `<option value="-1"> No System Available </option>` :``;
    $.each(SysNameList, function (key, sysname) {
        htmForDDL += `<option value="` + sysname + `"> ` + sysname +` </option>`;
    })

    //<input type="text"  name="desc" class="form-control mx-2" placeholder="basement pump description" /></td>
    htm += ` <div class="row mx-3 py-3">
                <div class="form-check">
                      <b>PUMP APPROVAL :
                                </b>
                                <input type="radio" name="rdPumpApproval" value="UL & FM APPROVED" style="margin-left: 5%" />UL AND FM APPROVED
                     
                             <input type="radio" name="rdPumpApproval" value="NON LISTED" style="margin-left: 5%" />NON LISTED

                </div>
                           <br />
                             <br />
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

                <table class="table table-fpreq project-table" style="width: 100%;">
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
                                <select id="ddlPumpTypeDesc" class="form-select color-dropdown">`+ htmForDDL +`</select></td>
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
                                            <th style="width: 290px !important">Capacity (GPM)</th>
                                            <th style="width: 100px !important">Pressure (Bars)</th>
                                            <th style="width: 100px !important">QTY</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="">
                                            <td>Electrical Pump Set</td>
                                            <td class="position-relative" style="">
                                                <input type="number" value="0" name="capacity1" class="form-control mx-2" /></td>
                                            <td class="position-relative" style="">
                                                <input type="number" value="0"  name="bars1" class="form-control mx-2"></td>
                                            <td class="position-relative" style="">
                                                <input type="number" value="0" name="qty1" class="form-control mx-2"></td>
                                        </tr>
                                        <tr class="">
                                            <td>Diesel Pump Set</td>
                                            <td class="position-relative">
                                                <input type="number" value="0" name="capacity2" class="form-control mx-2"></td>
                                            <td class="position-relative">
                                                <input type="number"  value="0" name="bars2" class="form-control mx-2"></td>
                                            <td class="position-relative">
                                                <input type="number"  value="0" name="qty2" class="form-control  mx-2"></td>
                                        </tr>
                                        <tr class="">
                                            <td>Jockey Pump Set</td>
                                            <td class="position-relative">
                                                <input type="number"  value="0" name="capacity3" class="form-control mx-2"></td>
                                            <td class="position-relative">
                                                <input type="number"  value="0" name="bars3" class="form-control mx-2"></td>
                                            <td class="position-relative">
                                                <input type="number"  value="0" name="qty3" class="form-control mx-2"></td>
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




// Firepump File upload

$('#btnAddAttachFPump-Grid').on('click', function () {

    ClearAttachment();
    $('#FPumpFileUploadModal').modal('show');

});
function ClearAttachment() {
    $('#txtAttachmentComment').val('');
    $('#FUFPumpAttach').val('');
}

$('#btnUploadFPump').on('click', function () {
    if ($('#FUFPumpAttach')[0].files.length != 0 && $('#txtCommFpump').val().trim() != "") {
        uploadTaskAttach();
    } else {
        toastr.error('Required All Fields. ', '');
    }

});


function uploadTaskAttach() {

    var formData = new FormData();
    var fileUpload = $('#FUFPumpAttach').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }
    let comment = $("#txtCommFpump").val();
    let aaa = 33;

    var reqid = $('.tbody-added-firepumpreqs tr td:eq(0)').length == 0 ? 0 : $('.tbody-added-firepumpreqs tr td:eq(0)').text().trim()

    var qrystringLocal = 'https://crmss.naffco.com/CRMSS/ERM/Services/FileUploadEMSReq.ashx?fufor=firepumpfromtoc&reqid=' + reqid + '&userid=' + currUserId + '&comment=' + comment;
   // var qrystringLocal = '../ERM/Services/FileUploadEMSReq.ashx?fufor=firepumpfromtoc&reqid=' + $('.tbody-added-firepumpreqs tr td:eq(0)').text().trim() + '&userid=' + currUserId + '&comment=' + comment;    

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
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;
                toastr.success('File has been Uploaded Successfully. ', '');
                GetFPumpAttachDetails();
                $("#FPumpFileUploadModal").modal('hide');
            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });

}


function GetFPumpAttachDetails() {

    var reqid = $('.tbody-added-firepumpreqs tr td:eq(0)').length == 0 ? 0 : $('.tbody-added-firepumpreqs tr td:eq(0)').text().trim()
    $.ajax({
        url: "EMSItemList.aspx/GetFPumpAttachDetails",
        data: JSON.stringify({ "ReqId": reqid }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            var htm = '';
            var ProjectDetails = result.d;
            var urlService = '';


            $.each(ProjectDetails, function (key, item) {

                urlService = 'Services/DownloadFile.ashx?attachurl=' + item.URL;  // for production
                htm += `<tr>        
               

                  <td style="text-align:center;display:none;">`+ item.ID + `</td>
                  <td style="text-align:center;">`+ item.FileName + `</td>
                  <td style="text-align:center;">`+ item.AttachComment + `</td>
                   <td style="text-align:center;display:none">`+ item.URL + `</td>
                   <td style="text-align:center;">
                   <a href="`+ urlService + `" download="` + item.FileName + `" type="button" class="AttatchmentDownload" title="Download" >
                   <img src="images/icons8-download-48.png" title="Download" class="fa-icon-hover ibtn-Download-Details" style="cursor: pointer; width: 34px;" />
                </a></td>`;



                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-FPumpAttach-list').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}




//END-------------------On TOC Side------------------//