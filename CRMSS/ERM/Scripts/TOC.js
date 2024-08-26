/*
 * *******************************JS TOC <starts> *************************************
 *
 */
var itemlistTOC = [], itemlistFromoracleTOC = [];
var selItemIdTOC = 0, selCatNameTOC='';

$(document).ready(function () {

    
})

function initiateRichText() {
    
    var richTextObj = $('.ritext-tech-remarks-div #taTechRemarks').richText({
        saveCallback: function (obj, a, b) {
            var a = '';
        },
        // text formatting
        bold: true,
        italic: true,
        underline: true,

        // text alignment
        leftAlign: true,
        centerAlign: true,
        rightAlign: true,
        justify: true,

        // lists
        ol: true,
        ul: true,

        // title
        heading: true,

        // fonts
        fonts: true,
        fontList: ["Arial",
            "Arial Black",
            "Comic Sans MS",
            "Courier New",
            "Geneva",
            "Georgia",
            "Helvetica",
            "Impact",
            "Lucida Console",
            "Tahoma",
            "Times New Roman",
            "Verdana"
        ],
        fontColor: true,
        backgroundColor: true,
        fontSize: true,

        // uploads
        imageUpload: false,
        fileUpload: false,
        videoEmbed: false,
        // media
        //<a href = "https://www.jqueryscript.net/tags.php?/video/" > video</a> Embed: true,

        // link
        urls: false,

        // tables
        table: true,

        // code
        removeStyles: true,
        code: false,

        // colors
        colors: [],

        // dropdowns
        fileHTML: '',
        imageHTML: '',

        // translations
        translations: {
            'title': 'Title',
            'white': 'White',
            'black': 'Black',
            'brown': 'Brown',
            'beige': 'Beige',
            'darkBlue': 'Dark Blue',
            'blue': 'Blue',
            'lightBlue': 'Light Blue',
            'darkRed': 'Dark Red',
            'red': 'Red',
            'darkGreen': 'Dark Green',
            'green': 'Green',
            'purple': 'Purple',
            'darkTurquois': 'Dark Turquois',
            'turquois': 'Turquois',
            'darkOrange': 'Dark Orange',
            'orange': 'Orange',
            'yellow': 'Yellow',
            'imageURL': 'Image URL',
            'fileURL': 'File URL',
            'linkText': 'Link text',
            'url': 'URL',
            'size': 'Size',
            'responsive': '<a href="https://www.jqueryscript.net/tags.php?/Responsive/">Responsive</a>',
            'text': 'Text',
            'openIn': 'Open in',
            'sameTab': 'Same tab',
            'newTab': 'New tab',
            'align': 'Align',
            'left': 'Left',
            'justify': 'Justify',
            'center': 'Center',
            'right': 'Right',
            'rows': 'Rows',
            'columns': 'Columns',
            'add': 'Add',
            'pleaseEnterURL': 'Please enter an URL',
            'videoURLnotSupported': 'Video URL not supported',
            'pleaseSelectImage': 'Please select an image',
            'pleaseSelectFile': 'Please select a file',
            'bold': 'Bold',
            'italic': 'Italic',
            'underline': 'Underline',
            'alignLeft': 'Align left',
            'alignCenter': 'Align centered',
            'alignRight': 'Align right',
            'addOrderedList': 'Ordered list',
            'addUnorderedList': 'Unordered list',
            'addHeading': 'Heading/title',
            'addFont': 'Font',
            'addFontColor': 'Font color',
            'addBackgroundColor': 'Background color',
            'addFontSize': 'Font size',
            'addImage': 'Add image',
            'addVideo': 'Add video',
            'addFile': 'Add file',
            'addURL': 'Add URL',
            'addTable': 'Add table',
            'removeStyles': 'Remove styles',
            'code': 'Show HTML code',
            'undo': 'Undo',
            'redo': 'Redo',
            'save': 'Save',
            'close': 'Close'
        },

        // privacy
        youtubeCookies: false,

        // preview
        preview: false,

        // placeholder
        placeholder: '',

        // dev settings
        useSingleQuotes: false,
        height: 620,
        heightPercentage: 0,
        adaptiveHeight: false,
        id: "",
        class: "",
        useParagraph: false,
        maxlength: 0,
        maxlengthIncludeHTML: false,
        callback: undefined,
        useTabForNext: false,
        save: false,
        saveCallback: undefined,
        saveOnBlur: 0,
        undoRedo: true

    });
}

$('#ddlStructNameTOC').on('change', function () {
    loadFloorType();
    loadFloorDDLInTOC();
})
$('#ddlFloorTypeTOC').on('change', function () {
    loadFloorDDLInTOC();
})
$('#ddlFloorFromTOC').on('change', function () {
    //loadFloorDDLInTOC();
})
function loadStructureDDL() {
    
    var htm = '';
    $.each(listStructureBasic, function (key, item) {
        htm += '<option value="' + item.StructureID + '"> ' + item.StructureName + ' </option>'
    });
    $('#ddlStructNameTOC').html(htm);
}

function loadFloorType() {

    var stRes = listReqStructFloors.filter(s => s.StructureID == $('#ddlStructNameTOC option:selected').val());
    let distinctFloorTypeArr = stRes.map(item => item.Type).filter((value, index, self) => self.indexOf(value) === index);
   
    var htm = '';
    $.each(distinctFloorTypeArr, function (key, item) {
        htm += '<option value="' + item + '"> ' + item + ' </option>'
    });
    $('#ddlFloorTypeTOC').html(htm);
}


function loadFloorDDLInTOC() {

    let strctid = $('#ddlStructNameTOC option:selected').val();
    var res = listReqStructFloors.filter(s => s.StructureID == strctid && s.IsTypical != "True" && s.Type == $('#ddlFloorTypeTOC option:selected').val());

    var htm = '';
    $.each(res, function (key, item) {
        htm += '<option value="' + item.NoOfFloors + '"> ' + item.NoOfFloors + ' </option>'
    });
    $('#ddlFloorFromTOC').html(htm);
}

$('.addFloorIntoItems').on('click', function () {

    loadStructureDDL();
    loadFloorType();
    loadFloorDDLInTOC();

    $('#tagFloorIntoItems').modal('show')
})



$('.btn-add-item-toc-grid').on('click', function () {
    getAllSystem('');
    getCategoryBySystem($('#ddlSystem option:selected').val(),'');
    $('#btnItemFilterTOC').trigger('click');
    $('#addUpdateSystemnItems').modal('show');
});

$('#btnAddItemFromOracle-grid').on('click', function () {
    $("#txtItemCodeForOracle").val('');

    getAllSystem('for oracle');
    getCategoryBySystem($('#ddlSystemForOracle option:selected').val(),'for oracle');    
    $('#addUpdateItemsOracle').modal('show');

    $('#ddlSystemForOracle').val($("#ddlSystem option:selected").val());
    getCategoryBySystem($("#ddlSystem option:selected").val(), 'for oracle');
    $('#ddlCategoryForOracle').val($('#ddlCategory option:selected').val())
});

$("#btnOracleItemFilterTOC").on("click", function () {
    if ($("#txtItemCodeForOracle").val().trim() == "") {
        toastr.error("Please input the <b>Item code</b> or <b>Item Description</b>")
        $("#txtItemCodeForOracle").css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    }
    else {
        $("#txtItemCodeForOracle").css('box-shadow', '').css('border-color', 'lightgrey');

        $('.ajax-loader').removeClass('hidden');
        setTimeout(function () {
            getItemsForSysCategoryFromOracle();
            $(".ajax-loader").addClass('hidden');
        }, 500);
        
    }
    
})

$('#ddlSystem').on('change', function (){
    getCategoryBySystem($('#ddlSystem option:selected').val(), '');
    $('.tbody-items-toc').html('');
})
$('#ddlCategory').on('change', function (){
    $('.tbody-items-toc').html('');
})
$('#ddlSystemForOracle').on('change', function () {
    getCategoryBySystem($('#ddlSystemForOracle option:selected').val(), 'for oracle');    
})

$('#btnItemFilterTOC').on('click', function () {
    if ($("#ddlCategory option:selected").val() == "PIPES") {
        $(".col-for-pipe-category").removeClass('hidden');
        $(".col-for-all-category").addClass('hidden');
    }
    else {
        $(".col-for-pipe-category").addClass('hidden');
        $(".col-for-all-category").removeClass('hidden');
    } 
    getItemsForSysCategory();
})



function openAddFloorModal(estiid, itemcode,cat) {
    $(".tbody-floor-into-item").html('');    
    $("#txtQuantityTOC").val('');    
    $('.btnAddFloorsIntoItem').data('estiid', estiid);
    $('.btnAddFloorsIntoItem').data('itemcode', itemcode);
    //$('#btnFloorFilterTOC').data('itemcode', itemcode);
    selCatNameTOC = cat;
    //if (selCatNameTOC == "PIPES") { $(".col-for-pipe-category").removeClass(); } else { $(".col-for-pipe-category").addClass(); } 


    loadStructureDDL();
    loadFloorType();
    loadFloorDDLInTOC();

    loadItemsHaveQTY(itemcode, estiid);

    $('#tagFloorIntoItems').modal('show')
}

function loadItemsHaveQTY(itmcode, estiid){
    $.ajax({
        url: "EMSItemList.aspx/GetItemsWhichHaveQTY",
        type: "POST",
        data: JSON.stringify({
            'EstiLineId': estiid
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            var htm = '';
            $.each(result.d, function (key, item) {
                htm += `<tr data-floorid="` + item.FloorId + `">               
                    <td> `+ itmcode + ` </td>                 
                    <td> `+ item.FloorName + `</td>
                    <td> <input class="form-control" type="number" id="txtItem-Qty-`+ key + `" value=` + parseInt(item.Quantity) + ` placeholder="enter quantity" min="0"></td>
                    <td> `+ item.StructName + `</td>
                    <td>
                        <span> <i class='bx bxs-save ibtn-update-itmqty' title="Update Item Qty" data-itemqtylineid=`+ item.ItemIntoFloorId + `       data-estiid="` + item.EstiLineId + `"  data-itemcode="` + itmcode +`" style="font-size: 1.7rem; color: #3099dc;cursor:pointer;"></i> </span> 
                        <span> <i class='bx bxs-trash ibtn-delete-itmqty' title="Delete Item Quantity" data-itemqtylineid=`+ item.ItemIntoFloorId + ` data-estiid="` + item.EstiLineId + `" data-itemcode="` + itmcode +`" style="font-size: 1.7rem; color: #a92828;cursor:pointer;"></i> </span> 
                    </td>`

                htm += `</tr>`;
            });
            $('.tbody-floor-into-item').html(htm);
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}

$('.tbody-floor-into-item').on('click', '.ibtn-update-itmqty,.ibtn-delete-itmqty', function () {
    var selAction = $(this)[0].title;
    let selqtyLineId = $(this).data('itemqtylineid');
    let estiid = $(this).data('estiid');
    let itmCode = $(this).data('itemcode');
    let QtyVal = $(this).parent().parent().parent().children().eq(2).children().val();

    if (selAction == "Update Item Qty") {
        updateQtyOnLineLevel(selqtyLineId, QtyVal);
    }
    else if (selAction == "Delete Item Quantity") {
        deleteQtyOnLineLevel(selqtyLineId, QtyVal, estiid, itmCode);
    }
})


function updateQtyOnLineLevel(qtyLineId,qty) {
    $.ajax({
        url: "EMSItemList.aspx/UpdateQtyOnLineLevel",
        type: "POST",
        data: JSON.stringify({
            'QtyLineLevelId': qtyLineId,
            'Qty': qty
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Quantity Updated Successfully');
            if ($("#TOCTabsOfAddingDivParent li").find('.active').text().trim() == "TOC by Item") {
                getSystemsNItems();
            } else {
                getAllSystemsNItems();
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function deleteQtyOnLineLevel(qtyLineId, qty, estiid, itemCode) {
    $.ajax({
        url: "EMSItemList.aspx/DeleteQtyOnLineLevel",
        type: "POST",
        data: JSON.stringify({
            'QtyLineLevelId': qtyLineId,
            'Qty': qty
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Quantity Deleted from Floor Successfully');
            if ($("#TOCTabsOfAddingDivParent li").find('.active').text().trim() == "TOC by Item") {
                getSystemsNItems();
            } else {
                getAllSystemsNItems();
            }
            loadItemsHaveQTY(itemCode, estiid);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//$('#btnFloorFilterTOC').on('click', function () {
//    generateTablesForSelFloor($(this).data('itemcode'));
//})

//function generateTablesForSelFloor(itemcode) {
//    var flrName = $("#ddlFloorTypeTOC option:selected").val() + " " + $("#ddlFloorFromTOC option:selected").val();
//    var res = listReqStructFloors.filter(s => s.StructureID == $("#ddlStructNameTOC option:selected").val() && (s.TypicalOf == flrName || s.Name == flrName));

//    let selItemCode = itemcode;
//    var htm = '';
//    $.each(res, function (key, item) {
//        htm += `<tr data-floorid="` + item.StructFloorDetId + `">               
//                    <td> `+ selItemCode + ` </td>                 
//                    <td> `+ item.Name + `</td>
//                    <td> `+ item.Type + `</td>`
//        //if (selCatNameTOC == "PIPES") { 
//        //    htm += `<td> <input class="form-control" name="txtpipeunitprice" type="number" id="floorItemQty-` + key + `" placeholder="enter unit price"> </td>
//        //        <td> <input class="form-control" name="txtfittingsperc" type="number" id="floorItemQty-`+ key + `" placeholder="enter fitting %"> </td>
//        //        <td> <input class="form-control" name="txtinstallunitprice" type="number" id="floorItemQty-`+ key + `" placeholder="enter installation unit price"> </td>`
//        //}

//    htm += `</tr>`;
//});
//    $('.tbody-floor-into-item').html(htm);

//}


$('.btnAddFloorsIntoItem').on('click', function () {
    var subitem = {}; var arrItem = []; var finalParaItem = [];
    var selEstiId = $(this).data('estiid');
    var selItemCode = $(this).data('itemcode');

    if (!validateQty()) {
        toastr.error('Please input the mandatory for selected floor(s).', '');
    }
    else {

        var flrName = $("#ddlFloorTypeTOC option:selected").val() + " " + $("#ddlFloorFromTOC option:selected").val();
        var res = listReqStructFloors.filter(s => s.StructureID == $("#ddlStructNameTOC option:selected").val() && (s.TypicalOf == flrName || s.Name == flrName));

        $.each(res, function (key, item) {
            subitem = {};
            subitem["EstiLineId"] = selEstiId;
            subitem["FloorId"] = item.StructFloorDetId;
            subitem["FloorName"] = item.Name;
            subitem["Quantity"] = $("#txtQuantityTOC").val().trim();
            subitem["CreatedBy"] = currUserId;
            arrItem.push(subitem);   
        })

        //$('.tbody-floor-into-item tr').each(function (key, item) {
        //    subitem = {};
        //    subitem["EstiLineId"] = selEstiId;
        //    subitem["FloorId"] = $(item).data('floorid');
        //    subitem["FloorName"] = $(item).children().eq(1).text().trim();
        //    subitem["Quantity"] = $("#txtQuantityTOC").val().trim();
        //    //subitem["PipeUnitPrice"] = $(item).children().eq(3).children().val() == undefined ? 0 : $(item).children().eq(3).children().val().trim();
        //    //subitem["FittingsPerc"] = $(item).children().eq(4).children().val() == undefined ? 0 : $(item).children().eq(4).children().val().trim();
        //    //subitem["InstallUnitPrice"] = $(item).children().eq(5).children().val() == undefined ? 0 : $(item).children().eq(5).children().val().trim();
        //    subitem["CreatedBy"] = currUserId;
        //    arrItem.push(subitem);           
        //});

        finalParaItem = {
            "listFloors": arrItem
        }
        addItemIntoFloor(finalParaItem, selEstiId, selItemCode);
    }
})

function addItemIntoFloor(paraData, estiId,itemcode) {

    $.ajax({
        url: "EMSItemList.aspx/AddItemIntoFloor",
        type: "POST",
        data: JSON.stringify({
            'data': paraData
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Saved successfully.', '');
            
            if ($("#TOCTabsOfAddingDivParent li").find('.active').text().trim() == "TOC by Item") {
                getSystemsNItems();
            } else {
                getAllSystemsNItems();
            }
            loadItemsHaveQTY(itemcode, estiId);
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}

function validateQty() {
    var isValid = true;

    $('.tbody-floor-into-item input[name=txtpipeunitprice]').each(function (key, item) {

        if ($(item).val().trim() == "") {
            isValid = false;
            $(item).css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        } else {
            $(item).css('box-shadow', '').css('border-color', 'lightgrey');
        }
    });

    $('.tbody-floor-into-item input[name=txtfittingsperc]').each(function (key, item) {

        if ($(item).val().trim() == "") {
            isValid = false;
            $(item).css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        } else {
            $(item).css('box-shadow', '').css('border-color', 'lightgrey');
        }
    });

    $('.tbody-floor-into-item input[name=txtinstallunitprice]').each(function (key, item) {

        if ($(item).val().trim() == "") {
            isValid = false;
            $(item).css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        } else {
            $(item).css('box-shadow', '').css('border-color', 'lightgrey');
        }
    });

    if ($("#txtQuantityTOC").val().trim() == "") {
        isValid = false;
        $("#txtQuantityTOC").css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    }
    else {
        $("#txtQuantityTOC").css('box-shadow', '').css('border-color', 'lightgrey');
    }

    return isValid;
}

$(".btn-req-complete-grid").on('click', function () {
    $("#ReqTechRemarksModal").modal('show');
    getTechNotesTemplate();
})

function getTechNotesTemplate() {
    $.ajax({
        url: "EMSItemList.aspx/GetTechTemplate",
        type: "POST",
        data: JSON.stringify({
            "UserId": currUserId,
            "ReqId": selReqId,
            "EmpNo": EmpNo
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            if (result.d.length > 0) {
                $(".ritext-tech-remarks-div").html('<input class="form-control " type="text" placeholder="" value="" id="taTechRemarks">');
                $("#taTechRemarks").val(result.d[0].TechNotesTemplate);
                initiateRichText();
            } else {
                $(".ritext-tech-remarks-div").html('<input class="form-control " type="text" placeholder="" value="" id="taTechRemarks">');
                $(".#taTechRemarks").val('<b> No Template Available </b>')
                initiateRichText();
            }
            
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}


$("#progress-bar li").on('click', function () {

    var selTab = $(this).text().trim();
    if (selTab == "Create TOC") {        
        getSystemsNItems();
        $(".ritext-tech-remarks-div").html('<input class="form-control " type="text" placeholder="" value="" id="taTechRemarks">');
        initiateRichText();
        ResetModal("TOCTabsOfAddingDivParent")
    }
})
$(".btnAddTechRemarks").on('click', function () {

    if ($("#taTechRemarks").val().trim() == "") {
        toastr.error("Please input the Technical remarks", '');
    }
    else {
        $.ajax({
            url: "EMSItemList.aspx/UpdateRequestAsCompleted",
            type: "POST",
            data: JSON.stringify({
                "EmpNo": EmpNo,
                "ReqId": selReqId,
                "TechRemarks": $("#taTechRemarks").val()
            }),
            contentType: "application/json;charset=utf-8",
            dataType: "json",            
            success: function (result) {
                toastr.success("Technical Notes Updated Successfully.")
                $("#ReqTechRemarksModal").modal('hide');
            },
            error: function (errormessage) {
                ////alert(errormessage.responseText);
            }
        });
    }
})


$(".btn-submit-req-final").on('click', function () {

    //if ($("#taTechRemarks").val().trim() == "") {
    //    toastr.error("Please input the Technical remarks", '');
    //}
    //else {
        $.ajax({
            url: "EMSItemList.aspx/SubmitRequestFinal",
            type: "POST",
            data: JSON.stringify({
                "EmpNo": EmpNo,
                "ReqId": selReqId
            }),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success("Request Submitted Successfully.")
                getAllRequests();
                $("#addReqModal").modal('hide');
            },
            error: function (errormessage) {
                ////alert(errormessage.responseText);
            }
        });
    //}
})



function getSystemsNItems() {

    $.ajax({
        url: "EMSItemList.aspx/GetSystemsNItems",
        type: "POST",
        data: JSON.stringify({ "ReqId": selReqId,"UserID": currUserId }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htm1 = '';

            var listSystems = result.d.listSystems;
            var listSystemsItems = result.d.listItems;
            var listAlternateItems = result.d.listAlternateItems;

            var firstSysName = listSystems.length > 0 ? listSystems[0].SysName : '';                      
            var AllCategoryForSys = [];

            var selReqObj = listAllReqs.filter(s => s.ReqId == selReqId);

            $.each(listSystems, function (key, item) {
                if (key == 0) { // for first record only
                    htm += `<div class="col-md-12 mt-3">`;
                    htm += `<div style="z-index:10;position: sticky;top: -9px;background: #fcfafa; text-align: center; border: 1px solid #b70000; color: black; border-radius: 20px 20px 3px 3px; font-weight: 600; padding: 15px 0px 15px 0px;">` + item.SysName 
                    if (selReqObj[0].EstimationStatus.toUpperCase() != "RELEASED" && (selReqObj[0].Engineering != '' && selReqObj[0].TestnCommision != '')) {
                        htm += `<span style="float: right;margin-right: 35px;cursor:pointer;" title="Engineering and Test and Commission Added">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 2048 2048" onclick='openEngrNTestCommisionModal("` + item.SysName + `")'>
                                        <path fill="#4db700" d="M2048 384v1024h-128V839l-640 321v120H768v-120L128 839v697h1152v128H0V384h640V256q0-27 10-50t27-40t41-28t50-10h512q27 0 50 10t40 27t28 41t10 50v128zm-1280 0h512V256H768zm384 640H896v128h256zm768-327V512H128v185l640 319V896h512v120zm-128 839h256v128h-256v256h-128v-256h-256v-128h256v-256h128z" />
                                    </svg>
                                </span>`
                    }
                    else {
                        htm += `<span style="float: right;margin-right: 35px;cursor:pointer;" title="Add Engineering and Test and Commission">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 2048 2048" onclick='openEngrNTestCommisionModal("` + item.SysName + `")'>
                                        <path fill="#ffb400" d="M2048 384v1024h-128V839l-640 321v120H768v-120L128 839v697h1152v128H0V384h640V256q0-27 10-50t27-40t41-28t50-10h512q27 0 50 10t40 27t28 41t10 50v128zm-1280 0h512V256H768zm384 640H896v128h256zm768-327V512H128v185l640 319V896h512v120zm-128 839h256v128h-256v256h-128v-256h-256v-128h256v-256h128z" />
                                    </svg>
                                </span>`
                    }                  
                    htm += `</div>`;
                  
                    AllCategoryForSys = listSystemsItems.filter(x => x.System == item.SysName).map(ss => ss.Category).filter((value, index, self) => self.indexOf(value) === index);
                }

                if (firstSysName != item.SysName) {
                    htm += `<div class="col-md-12 mt-3">`;
                    htm += `<div style="z-index:10;position: sticky;top: -9px;background: #fcfafa; text-align: center; border: 1px solid #b70000; color: black; border-radius: 20px 20px 3px 3px; font-weight: 600; padding: 15px 0px 15px 0px;">` + item.SysName
                    if (selReqObj[0].EstimationStatus.toUpperCase() != "RELEASED" && (selReqObj[0].Engineering != '' && selReqObj[0].TestnCommision != '')) {
                        htm += `<span style="float: right;margin-right: 35px;cursor:pointer;" title="Engineering and Test and Commission Added">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 2048 2048" onclick='openEngrNTestCommisionModal("` + item.SysName + `")'>
                                        <path fill="#4db700" d="M2048 384v1024h-128V839l-640 321v120H768v-120L128 839v697h1152v128H0V384h640V256q0-27 10-50t27-40t41-28t50-10h512q27 0 50 10t40 27t28 41t10 50v128zm-1280 0h512V256H768zm384 640H896v128h256zm768-327V512H128v185l640 319V896h512v120zm-128 839h256v128h-256v256h-128v-256h-256v-128h256v-256h128z" />
                                    </svg>
                                </span>`
                    }
                    else {
                        htm += `<span style="float: right;margin-right: 35px;cursor:pointer;" title="Add Engineering and Test and Commission">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 2048 2048" onclick='openEngrNTestCommisionModal("` + item.SysName + `")'>
                                        <path fill="#ffb400" d="M2048 384v1024h-128V839l-640 321v120H768v-120L128 839v697h1152v128H0V384h640V256q0-27 10-50t27-40t41-28t50-10h512q27 0 50 10t40 27t28 41t10 50v128zm-1280 0h512V256H768zm384 640H896v128h256zm768-327V512H128v185l640 319V896h512v120zm-128 839h256v128h-256v256h-128v-256h-256v-128h256v-256h128z" />
                                    </svg>
                                </span>`
                    }                    
                    htm +=`</div>`;
                   
                    AllCategoryForSys = listSystemsItems.filter(x => x.System == item.SysName).map(ss => ss.Category).filter((value, index, self) => self.indexOf(value) === index);
                }



                for (var i = 0; i < AllCategoryForSys.length; i++) {
                    var res = listSystemsItems.filter(x => x.Category == AllCategoryForSys[i]).filter(x=>x.System==item.SysName);

                    htm += `<div class="category my-2" style="font-size: 12px">` + (i + 1) + `. ` + res[0].Category + `</div>`
                    htm += ` <div class="table mt-2" style="overflow-y: auto;">
                                                            <table class="table project-table" style="width: 100%;">
                                                                <thead style="position: sticky; top: -3px;">
                                                                    <tr class="Head-tr">                                                                        
                                                                        <th style="width:240px">Item Code</th>
                                                                        <th style="width: 889px;">Item Desc</th>
                                                                        <th>Quantity</th>`
                    if (res[0].Category == "PIPES") {
                        htm += `<th>Pipe Unit Price</th>
                                <th>Fittings %</th>
                                <th>Installation Unit Price</th>`
                    } 

                    htm += `<th>Spare QTY</th>
                                                                          <th>Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class=""> `;
                    let isOpt = '';
                    $.each(res, function (k, CatItem) {
                        isOpt = CatItem.Isoptional == 'True' ? '<span>(Optional)</span>' : '';
                        let optcls = CatItem.Isoptional == 'True' ? 'badge badge-optional' : 'badge badge-dark';
                        htm += `<tr>`

                        htm += `<td> <span class="` + optcls + ` fs-6">` + CatItem.ItemCode + ` <svg class="" xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 24 24">
                                         <g fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5">
                                             <path d="m17.524 17.524l-2.722 2.723a2.567 2.567 0 0 1-3.634 0L4.13 13.209A3.852 3.852 0 0 1 3 10.487V5.568A2.568 2.568 0 0 1 5.568 3h4.919c1.021 0 2 .407 2.722 1.13l7.038 7.038a2.567 2.567 0 0 1 0 3.634z" />
                                             <path d="M9.126 11.694a2.568 2.568 0 1 0 0-5.137a2.568 2.568 0 0 0 0 5.137m3.326 4.392l3.634-3.634" />
                                         </g>
                                     </svg></span> `+ isOpt + `<div>` + getAlternateItemsDet(1, CatItem.AlternateFromItem, listAlternateItems) + `</div></td>                
                                  <td> `+ CatItem.ItemDesc + `. <div style="margin-top: 22px;">` + getAlternateItemsDet(2, CatItem.AlternateFromItem, listAlternateItems) + `</div></td>                                                                      
                                  <td> `+ numberWithCommas(parseInt(CatItem.Quantity)) + `<div style="margin-top: 22px;"> ` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? CatItem.Quantity : "") + `</div></td>`
                        if (res[0].Category == "PIPES") {
                            htm += `<td> ` + numberWithCommas(fixedtwo(CatItem.PipeUnitPrice)) + `<div style="margin-top: 22px;"> ` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? CatItem.PipeUnitPrice : "") + `</div></td>
                                    <td> `+ numberWithCommas(fixedtwo(CatItem.FittingsPerc)) + `<div style="margin-top: 22px;">` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? CatItem.FittingsPerc : "") + `</div></td > 
                                    <td> `+ numberWithCommas(fixedtwo(CatItem.InstallUnitPrice)) + `<div style="margin-top: 22px;">` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? CatItem.InstallUnitPrice : "") + `</div></td>`
                                    }

                        htm += `<td> ` + numberWithCommas(parseInt(CatItem.SpareQuantity)) + `<div style="margin-top: 22px;"> ` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? CatItem.SpareQuantity : "") + `</div></td>`
                        if (selReqObj[0].EstimationStatus.toUpperCase() != "RELEASED") {
                            htm += `<td> <a class="ibtn-addfloor-into-items" title="Add Floors" data-estiid="` + CatItem.EstiLineId + `" data-itemcode="` + CatItem.ItemCode + `"> <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24" onclick="openAddFloorModal(` + CatItem.EstiLineId + `,` + CatItem.ItemCode + `,'` + CatItem.Category + `')">
                                              <path fill="#a92828" d="M12 9v2h2v2h-2v2h2v2h-2v2h4v-4h4V9zm6 4h-2v-2h2z" opacity="0.3" />
                                              <path fill="#a92828" d="M12 7V3H2v18h14v-2h-4v-2h2v-2h-2v-2h2v-2h-2V9h8v6h2V7zM6 19H4v-2h2zm0-4H4v-2h2zm0-4H4V9h2zm0-4H4V5h2zm4 12H8v-2h2zm0-4H8v-2h2zm0-4H8V9h2zm0-4H8V5h2zm14 12v2h-2v2h-2v-2h-2v-2h2v-2h2v2zm-6-8h-2v2h2zm0 4h-2v2h2z" />
                                          </svg> </a>
                                        <span><i class="bx bxs-trash ibtn-delete-itemtoc" style="font-size: 1.6rem;color: #d64e4e;cursor:pointer;" title="Delete Item" data-estiid="`+ CatItem.EstiLineId + `" data-itemcode="` + CatItem.ItemCode + `"></i></span>
              

                                  </td>`
                        }

                        htm += `</tr>`
                    })

                    htm +=`     </tbody>
                             </table>
                          </div>`
                }

                if (key == 0) { htm += `</div>` }
                if (firstSysName != item.SysName && key != 0) { htm +=`</div>` }
                            


            });

            $('.system-div-parent').html(htm);
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });

}

function getAlternateItemsDet(col, itmcode,listAlternateItems) {
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
                htm = `<span>` + res[0].ItemDesc + `</span>`
            }
        }         
       
    }

    return htm;
}


$("#TOCTabsOfAddingDivParent li").on('click', function () {

    var selTab = $(this).text().trim();
    if (selTab == "TOC by Item") {
        $('.system-div-parent-for-byfloor').html('')
        $(".ddl-struct-filter-div").addClass('hidden');
        getSystemsNItems();
    }
    else if (selTab == "TOC by Floor") {
        $(".ddl-struct-filter-div").removeClass('hidden');
        loadStructureDDLTOCFilter();

        $('.ajax-loader').removeClass('hidden');
        setTimeout(function () {
            getAllSystemsNItems();   
            $('.ajax-loader').addClass('hidden');
        }, 500);
             
        //$('#ddlStructNameTOCFilter').trigger('change');
    }
})

function loadStructureDDLTOCFilter() {
    var htm = '';
    $.each(listStructureBasic, function (key, item) {
        htm += '<option value="' + item.StructureID + '"> ' + item.StructureName + ' </option>'
    });
    $('#ddlStructNameTOCFilter').html(htm);
}

$('#ddlStructNameTOCFilter').on('change', function () {    
    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        getAllSystemsNItems();
        $('.ajax-loader').addClass('hidden');
    }, 500);
})

function generateFloorsAginstItemsTOC(EstiLineId, flrColNames, colVal) {

    let strctid = $('#ddlStructNameTOCFilter option:selected').val();
    var res = listReqStructFloors.filter(s => s.StructureID == strctid && s.IsTypical != "True");

    //var htm = `<div class="table" style="overflow-x: scroll;"><table class="table project-table d-flex">`;    
    //$.each(res, function (key, item) {
    //    htm += `<tbody class="text-nowrap" style=";float: left; margin-right:0px">`;
    //    if (rowno == 0) { htm += `<tr> <td class="fw-bold">` + item.Name + `</td> </tr>` };
    //    htm += `<tr> <td><input class="form-control" type="text" id="txtTOCbyFlr-` + key + `" placeholder="enter structure name..."></td> </tr>`;       
    //    htm += `</tbody>`;
    //}); 
    //htm += `</table> </div>`;
    //return htm;
    var flrNameString = removeCommaFromLast(flrColNames);
    var wdth = 100/parseFloat(res.length)
    var htm = '<div class="d-flex" style="overflow-x:auto; max-width: calc(100vw - 690px);">';
    $.each(flrNameString.split(','), function (key, item) {

        htm += `<div class="mr-1">
                    <span style="width:80px"><label>`+ item + `</label></span>
                    <span style="width:80px;display: flex;"><input class="form-control" name="txtqtyTOCbyFlr" type="text" value="`+ parseInt(colVal.split(',')[key]) + `" data-estid=` + EstiLineId + ` data-strid=` + $("#ddlStructNameTOCFilter option:selected").val() + ` data-flrname="` + item + `" placeholder="enter QTY" onkeypress='return event.charCode >= 48 && event.charCode <= 57' /></span>
                </div>`;
        //htm += `<span style="width:100px"><input class="form-control" type="text" id="txtTOCbyFlr-` + key + `" placeholder="enter structure name..."></span>`;
        //htm += `<span style="width:100px"><input class="form-control" type="text" id="txtTOCbyFlr-` + key + `" placeholder="enter structure name..."></span>`;
    }); 
    htm += '</div>'
    return htm;


    //$('#ddlStructNameTOCFilter').html(htm);
}

$('.system-div-parent-for-byfloor').on('focusout','input[type=text][name=txtqtyTOCbyFlr]', function () {
    let qtyVal = $(this).val();
    let estiLineId = $(this).data('estid');
    let stId = $(this).data('strid');
    let flrName = $(this).data('flrname');

    qtyVal == "" || qtyVal == undefined ? "" : TOCByFloorItemUpdate(estiLineId, stId, flrName, qtyVal);

})

function TOCByFloorItemUpdate(estilineid, stid,flrname,qtyVal) {
    $.ajax({
        url: "EMSItemList.aspx/AddUpdateQtyTOCByFloor",
        type: "POST",
        data: JSON.stringify({ "EstiLineId": estilineid, "StructId": stid, "FlrName": flrname, "ReqId": selReqId, "Quantity": qtyVal }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Quantity saved successfully', '');            
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}

function getAllSystemsNItems() {

    $.ajax({
        url: "EMSItemList.aspx/GetAllSystemsNItems",
        type: "POST",
        data: JSON.stringify({ "ReqId": selReqId, "UserID": currUserId, "StructId": $("#ddlStructNameTOCFilter option:selected").val() }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htm1 = '';
                        
            var listSystemsItems = result.d.listItems;
            var listSystems = listSystemsItems.filter(x => x.System).map(ss => ss.System).filter((value, index, self) => self.indexOf(value) === index);
            var listAlternateItems = result.d.listAlternateItems;

            var firstSysName = listSystems.length > 0 ? listSystems[0] : '';
            var AllCategoryForSys = [];

            var selReqObj = listAllReqs.filter(s => s.ReqId == selReqId);

            $.each(listSystems, function (key, item) {
                if (key == 0) { // for first record only                    
                    htm += `<div class="col-md-12 mt-3">`;
                    htm += `<div style="z-index:10;position: sticky;top: -9px;background: #fcfafa; text-align: center; border: 1px solid #b70000; color: black; border-radius: 20px 20px 3px 3px; font-weight: 600; padding: 15px 0px 15px 0px;">` + item
                    if (selReqObj[0].EstimationStatus.toUpperCase() != "RELEASED" && (selReqObj[0].Engineering != '' && selReqObj[0].TestnCommision != '')) {
                        htm += `<span style="float: right;margin-right: 35px;cursor:pointer;" title="Engineering and Test and Commission Added">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 2048 2048" onclick='openEngrNTestCommisionModal("` + item + `")'>
                                        <path fill="#4db700" d="M2048 384v1024h-128V839l-640 321v120H768v-120L128 839v697h1152v128H0V384h640V256q0-27 10-50t27-40t41-28t50-10h512q27 0 50 10t40 27t28 41t10 50v128zm-1280 0h512V256H768zm384 640H896v128h256zm768-327V512H128v185l640 319V896h512v120zm-128 839h256v128h-256v256h-128v-256h-256v-128h256v-256h128z" />
                                    </svg>
                                </span>`
                    }
                    else {
                        htm += `<span style="float: right;margin-right: 35px;cursor:pointer;" title="Add Engineering and Test and Commission">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 2048 2048" onclick='openEngrNTestCommisionModal("` + item + `")'>
                                        <path fill="#ffb400" d="M2048 384v1024h-128V839l-640 321v120H768v-120L128 839v697h1152v128H0V384h640V256q0-27 10-50t27-40t41-28t50-10h512q27 0 50 10t40 27t28 41t10 50v128zm-1280 0h512V256H768zm384 640H896v128h256zm768-327V512H128v185l640 319V896h512v120zm-128 839h256v128h-256v256h-128v-256h-256v-128h256v-256h128z" />
                                    </svg>
                                </span>`
                    }
                    htm += `</div>`;

                    AllCategoryForSys = listSystemsItems.filter(x => x.System == item).map(ss => ss.Category).filter((value, index, self) => self.indexOf(value) === index);
                }

                if (firstSysName != item) {                    
                    htm += `<div class="col-md-12 mt-3">`;
                    htm += `<div style="z-index:10;position: sticky;top: -9px;background: #fcfafa; text-align: center; border: 1px solid #b70000; color: black; border-radius: 20px 20px 3px 3px; font-weight: 600; padding: 15px 0px 15px 0px;">` + item
                    if (selReqObj[0].EstimationStatus.toUpperCase() != "RELEASED" && (selReqObj[0].Engineering != '' && selReqObj[0].TestnCommision != '')) {
                        htm += `<span style="float: right;margin-right: 35px;cursor:pointer;" title="Engineering and Test and Commission Added">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 2048 2048" onclick='openEngrNTestCommisionModal("` + item + `")'>
                                        <path fill="#4db700" d="M2048 384v1024h-128V839l-640 321v120H768v-120L128 839v697h1152v128H0V384h640V256q0-27 10-50t27-40t41-28t50-10h512q27 0 50 10t40 27t28 41t10 50v128zm-1280 0h512V256H768zm384 640H896v128h256zm768-327V512H128v185l640 319V896h512v120zm-128 839h256v128h-256v256h-128v-256h-256v-128h256v-256h128z" />
                                    </svg>
                                </span>`
                    }
                    else {
                        htm += `<span style="float: right;margin-right: 35px;cursor:pointer;" title="Add Engineering and Test and Commission">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 2048 2048" onclick='openEngrNTestCommisionModal("` + item + `")'>
                                        <path fill="#ffb400" d="M2048 384v1024h-128V839l-640 321v120H768v-120L128 839v697h1152v128H0V384h640V256q0-27 10-50t27-40t41-28t50-10h512q27 0 50 10t40 27t28 41t10 50v128zm-1280 0h512V256H768zm384 640H896v128h256zm768-327V512H128v185l640 319V896h512v120zm-128 839h256v128h-256v256h-128v-256h-256v-128h256v-256h128z" />
                                    </svg>
                                </span>`
                    }
                    htm += `</div>`;

                    AllCategoryForSys = listSystemsItems.filter(x => x.System == item).map(ss => ss.Category).filter((value, index, self) => self.indexOf(value) === index);
                }



                for (var i = 0; i < AllCategoryForSys.length; i++) {
                    
                    var res = listSystemsItems.filter(x => x.Category == AllCategoryForSys[i]).filter(x => x.System == item);
                    let flrDivWdth = res[0].Category == "PIPES" ? "40%" : "55%";

                    htm += `<div class="category my-2" style="font-size: 12px">` + (i + 1) + `. ` + res[0].Category + `</div>`
                        //start
                    htm += ` <div class="table mt-2">
                                                            <table class="table project-table" style="width: 100%;">
                                                                <thead style="position: sticky; top: -3px;">
                                                                    <tr class="Head-tr">                
                                                                        <th style="width:5%;">Action</th>
                                                                        <th style="width:10%;">Item Code</th>
                                                                        <th style="width: 20%;">Item Desc</th>
                                                                        <th style="width: 5%;">Quantity</th>`
                    if (res[0].Category == "PIPES") {
                        htm += `<th style="width: 5%;">Pipe Unit Price</th>
                                <th style="width: 5%;">Fittings %</th>
                                <th style="width: 5%;">Installation Unit Price</th>`
                    }

                    htm += `<th style="width: 5%;">Spare QTY</th>
                            <th style="width: `+ flrDivWdth+`;"> Floors </th>
                            
                                                                    </tr>
                                                                </thead>
                                                                <tbody class=""> `;
                    let isOpt = '';
                    $.each(res, function (k, CatItem) {
                        isOpt = CatItem.Isoptional == 'True' ? '<span>(Optional)</span>' : '';
                        let optcls = CatItem.Isoptional == 'True' ? 'badge badge-optional' : 'badge badge-dark';
                        htm += `<tr>`
                        htm += `<td class="d-flex"> <a class="ibtn-addfloor-into-items" title="Add Floors" data-estiid="` + CatItem.EstiLineId + `" data-itemcode="` + CatItem.ItemCode + `"> <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24" onclick="openAddFloorModal(` + CatItem.EstiLineId + `,` + CatItem.ItemCode + `,'` + CatItem.Category + `')">
                                              <path fill="#a92828" d="M12 9v2h2v2h-2v2h2v2h-2v2h4v-4h4V9zm6 4h-2v-2h2z" opacity="0.3" />
                                              <path fill="#a92828" d="M12 7V3H2v18h14v-2h-4v-2h2v-2h-2v-2h2v-2h-2V9h8v6h2V7zM6 19H4v-2h2zm0-4H4v-2h2zm0-4H4V9h2zm0-4H4V5h2zm4 12H8v-2h2zm0-4H8v-2h2zm0-4H8V9h2zm0-4H8V5h2zm14 12v2h-2v2h-2v-2h-2v-2h2v-2h2v2zm-6-8h-2v2h2zm0 4h-2v2h2z" />
                                          </svg> </a>
                                        <span><i class="bx bxs-trash ibtn-delete-itemtoc" style="font-size: 1.6rem;color: #d64e4e;cursor:pointer;" title="Delete Item" data-estiid="`+ CatItem.EstiLineId + `" data-itemcode="` + CatItem.ItemCode + `"></i></span>              
                                   </td>`

                        htm += `<td> <span class="` + optcls + ` fs-6">` + CatItem.ItemCode + ` <svg class="" xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 24 24">
                                         <g fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5">
                                             <path d="m17.524 17.524l-2.722 2.723a2.567 2.567 0 0 1-3.634 0L4.13 13.209A3.852 3.852 0 0 1 3 10.487V5.568A2.568 2.568 0 0 1 5.568 3h4.919c1.021 0 2 .407 2.722 1.13l7.038 7.038a2.567 2.567 0 0 1 0 3.634z" />
                                             <path d="M9.126 11.694a2.568 2.568 0 1 0 0-5.137a2.568 2.568 0 0 0 0 5.137m3.326 4.392l3.634-3.634" />
                                         </g>
                                     </svg></span> `+ isOpt + `<div>` + getAlternateItemsDet(1, CatItem.AlternateFromItem, listAlternateItems) + `</div></td>                
                                  <td> <div style="max-height:75px;overflow-y:auto;overflow-x:auto;min-width:200px;">`+ CatItem.ItemDesc + `.</div> <div style="margin-top: 22px;">` + getAlternateItemsDet(2, CatItem.AlternateFromItem, listAlternateItems) + `</div></td>                                                                      
                                  <td> `+ numberWithCommas(SumOfCommaSepVal(CatItem.Quantity)) + `<div style="margin-top: 22px;"> ` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? SumOfCommaSepVal(CatItem.Quantity) : "") + `</div></td>`
                        if (res[0].Category == "PIPES") {
                            htm += `<td> ` + numberWithCommas(fixedtwo(CatItem.PipeUnitPrice)) + `<div style="margin-top: 22px;"> ` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? CatItem.PipeUnitPrice : "") + `</div></td>
                                    <td> `+ numberWithCommas(fixedtwo(CatItem.FittingsPerc)) + `<div style="margin-top: 22px;">` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? CatItem.FittingsPerc : "") + `</div></td > 
                                    <td> `+ numberWithCommas(fixedtwo(CatItem.InstallUnitPrice)) + `<div style="margin-top: 22px;">` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? CatItem.InstallUnitPrice : "") + `</div></td>`
                        }

                        htm += `<td> ` + numberWithCommas(parseInt(CatItem.SpareQuantity)) + `<div style="margin-top: 22px;"> ` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? CatItem.SpareQuantity : "") + `</div></td>`
                        htm += `<td>` + generateFloorsAginstItemsTOC(CatItem.EstiLineId, CatItem.FloorsNameString, CatItem.Quantity) + `</td>`;

                        //if (selReqObj[0].EstimationStatus.toUpperCase() != "RELEASED") {
                            //htm += `<td> <a class="ibtn-addfloor-into-items" title="Add Floors" data-estiid="` + CatItem.EstiLineId + `" data-itemcode="` + CatItem.ItemCode + `"> <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24" onclick="openAddFloorModal(` + CatItem.EstiLineId + `,` + CatItem.ItemCode + `,'` + CatItem.Category + `')">
                            //                  <path fill="#a92828" d="M12 9v2h2v2h-2v2h2v2h-2v2h4v-4h4V9zm6 4h-2v-2h2z" opacity="0.3" />
                            //                  <path fill="#a92828" d="M12 7V3H2v18h14v-2h-4v-2h2v-2h-2v-2h2v-2h-2V9h8v6h2V7zM6 19H4v-2h2zm0-4H4v-2h2zm0-4H4V9h2zm0-4H4V5h2zm4 12H8v-2h2zm0-4H8v-2h2zm0-4H8V9h2zm0-4H8V5h2zm14 12v2h-2v2h-2v-2h-2v-2h2v-2h2v2zm-6-8h-2v2h2zm0 4h-2v2h2z" />
                            //              </svg> </a>
                            //            <span><i class="bx bxs-trash ibtn-delete-itemtoc" style="font-size: 1.6rem;color: #d64e4e;cursor:pointer;" title="Delete Item" data-estiid="`+ CatItem.EstiLineId + `" data-itemcode="` + CatItem.ItemCode + `"></i></span>              
                            //       </td>`
                     //   }

                        htm += `</tr>`
                    })

                    htm += `</tbody></table>`
                    htm += `</div>`; //end
                }

                if (key == 0) { htm += `</div>` }
                if (key != 0) { htm += `</div>` }



            });

            $('.system-div-parent-for-byfloor').html(htm);
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}

function SumOfCommaSepVal(paraVal) {
    var finalVal = 0;
    $.each(removeCommaFromLast(paraVal).split(','), function (k,item) {
        finalVal += parseInt(item)
    });
    return parseInt(finalVal);
}

$(".btn-close-mainreq-modal").on('click', function () {
    $('.system-div-parent-for-byfloor').html('')
})

$(".system-div-parent,.system-div-parent-for-byfloor").on('click', '.ibtn-delete-itemtoc', function (key, item) {
    let itemcode = $(this).data('itemcode');

    $('.cItemTOC').html('you want to delete the item <b> ' + itemcode +' </b> ?')
    $(".btn-del-itemtoc-yes").data('estiid', $(this).data('estiid'))
    $("#delItemTOCModal").modal('show');
})
$(".btn-del-itemtoc-yes").on('click', function (key, item) {
    let estilineid = $(this).data('estiid');

    $.ajax({
        url: "EMSItemList.aspx/DeleteItemFromTOC",
        type: "POST",
        data: JSON.stringify({ "EstiLineId": estilineid }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Item deleted successfully','');
            $('#delItemTOCModal').modal('hide');
            if ($("#TOCTabsOfAddingDivParent li").find('.active').text().trim() == "TOC by Item") {
                getSystemsNItems();
            } else {
                getAllSystemsNItems();
            }
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
})

function getAllSystem(forwhom) {

    $.ajax({
        url: "EMSItemList.aspx/GetAllSystems",
        type: "POST",
        data: JSON.stringify({ "UserId": currUserId, "ReqId": selReqId }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {               
                htm += '<option value="' + item.Value + '" >' + item.Text + ' </option>'
            });

            if (forwhom == 'for oracle') { $('#ddlSystemForOracle').html(htm); }
            else { $('#ddlSystem').html(htm); } 
                        
            //compId = $('#selectTypeOpt option:selected').val();
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });

}

function getCategoryBySystem(paraSysName, forwhom) {

    $.ajax({
        url: "EMSItemList.aspx/GetCategoryBySys",
        type: "POST",
        //data: JSON.stringify({ "SysName": $('#ddlSystem option:selected').val() }),
        data: JSON.stringify({ "SysName": paraSysName }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.Value + '" >' + item.Text + ' </option>'
            });

            if (forwhom == 'for oracle') { $('#ddlCategoryForOracle').html(htm);  }
            else { $('#ddlCategory').html(htm); } 
            
            //compId = $('#selectTypeOpt option:selected').val();
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
    
}

$(".tbody-items-toc").on('click','input[type=checkbox][name=cbIsOptional]', function () {
    if ($(this).is(":checked")) {        
        $(this).parent().parent().parent().children().eq(0).children().children().prop('checked', true)
    } else {
        $(this).parent().parent().parent().children().eq(0).children().children().prop('checked', false)
    }
});


function getItemsForSysCategory() {

    $.ajax({
        url: "EMSItemList.aspx/GetItemsForSysCategory",
        type: "POST",
        data: JSON.stringify({
            "SysName": $('#ddlSystem option:selected').val(),
            "Category": $('#ddlCategory option:selected').val(),
            "ItemCode": $('#txtItemCode').val().trim() == '' ? '-1' : $('#txtItemCode').val().trim(),
            "ReqId": selReqId
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            itemlistTOC = result.d;
            var htm = '';
            $.each(itemlistTOC, function (key, item) {
                let attr = "";//item[0].IsTypical == "True" ? "checked" : "";
                let optDDL = '<option value="-1"> No Item Selected </option>';
                let filteredRes = itemlistTOC.filter(s => s.ItemCode != item.ItemCode);
                for (var i = 0; i < filteredRes.length; i++) {
                    optDDL += '<option value="' + filteredRes[i].ItemCode + '"> ' + filteredRes[i].ItemCode + ' | ' + filteredRes[i].ItemDesc +'</option>'
                }


                htm += `<tr>
                    <td> 
                        <div style="display: flex;justify-content: center;">
                            <input class="form-check-input position-relative" type="checkbox" name="cbIsTypical" value="`+ item.ItemId + `" id="cbTypical-` + item.ItemId + `" data-itemid=` + item.ItemId +` ` + attr + ` /> 
                        </div>
                    </td>  
                    <td>
                        <div style="display: flex;justify-content: center;">
                            <input class="form-check-input position-relative" type="checkbox" name="cbIsOptional" value="`+ item.ItemId + `" id="cbOptional-` + item.ItemId + `" data-itemid=` + item.ItemId + ` ` + attr + ` /> 
                        </div>
                    </td> 
                    <td> `+ item.ItemCode + ` </td>                 
                    <td> `+ item.ItemDesc + `</td>
                    <td> `+ item.System + `</td>
                    <td> `+ item.Category + `</td>`

                if ($("#ddlCategory option:selected").val() == "PIPES") {
                    htm += `<td> <input class="form-control" name="txtpipeunitprice" type="number" id="floorItemQty-` + key + `" placeholder="enter unit price" min="0"> </td>
                            <td> <input class="form-control" name="txtfittingsperc" type="number" id="floorItemQty-`+ key + `" placeholder="enter fitting %" min="0"> </td>
                            <td> <input class="form-control" name="txtinstallunitprice" type="number" id="floorItemQty-`+ key + `" placeholder="enter installation unit price" min="0"> </td>`
                } else {
                    htm += `<td> <input class="form-control" name="txtinstallunitprice" type="number" id="floorItemQty-` + key + `" value="0" placeholder="enter installation unit price" min="0"> </td>`
                }
                htm += `<td> <input class="form-control" name="txt_item_into_cat_qty" type="number" id="ItemQty-` + key + `" placeholder="enter quantity" min="0"> </td>`
                htm += `<td> <select id="ddlAlternateItem-` + key + `" class="form-select color-dropdown">` + optDDL + ` </select> </td>`
                //htm +=`<td> <a href="#" class="btn" style="background-color: #f8f9fa; border-color: #ddd; color: #444;" id="t" style="margin-top: 30px;">Select Item</a> </td>`

                htm += `</tr>`;
            });
            $('.tbody-items-toc').html(htm);

        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}

function getItemsForSysCategoryFromOracle() {

    $.ajax({
        url: "EMSItemList.aspx/GetItemsForSysCategoryFromOracle",
        type: "POST",
        data: JSON.stringify({            
            "ItemCode": $('#txtItemCodeForOracle').val().trim() == '' ? '-1' : $('#txtItemCodeForOracle').val().trim()
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            itemlistFromoracleTOC = result.d;
            var htm = result.d.length == 0 ? '<tr style="text-align:center;"><td colspan="3">No Data(s) Available</td></tr>' : '';

            $.each(itemlistFromoracleTOC, function (key, item) {
                let attr = "";//item[0].IsTypical == "True" ? "checked" : "";
                htm += `<tr>
                    <td> 
                        <div style="display: flex;justify-content: center;">
                            <input class="form-check-input position-relative" type="checkbox" name="cbIsTypical" value="`+ item.OracleItemId + `" id="cbTypical-` + item.OracleItemId + `" data-oracleitemid=` + item.OracleItemId + ` ` + attr + ` /> 
                        </div>
                    </td>                 
                    <td> `+ item.ItemCode + ` </td>                 
                    <td> `+ item.Desc + `</td>`
                htm += `</tr>`;
            });
            $('.tbody-items-toc-fromoracle').html(htm);

        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}

$('.btnAddItemsFromOracleTOC').on('click', function () {

    if (!validateItemFromOracle()) {
        toastr.error("Please select any item(s) from the list", '');
    } else {
        var selItemsArr = [];

        $(".tbody-items-toc-fromoracle input[name=cbIsTypical]:checked").each(function () {
                        
            let subitem = {};
            var res = itemlistFromoracleTOC.filter(x => x.OracleItemId == $(this).data('oracleitemid'));

            subitem["OracleItemId"] = res[0].OracleItemId;
            subitem["ReqId"] = selReqId;
            subitem["ItemCode"] = res[0].ItemCode;
            subitem["ItemDesc"] = res[0].Desc;
            subitem["System"] = $("#ddlSystemForOracle option:selected").val();
            subitem["Category"] = $("#ddlCategoryForOracle option:selected").val();
            subitem["CreatedBy"] = currUserId;    
            selItemsArr.push(subitem);

        });

        var finalSelItemPara = { 'listItemsTOC': selItemsArr };

        selItemsArr.length == 0 ? toastr.error("Please select any item(s)", '') : addItemsFromOracleTOC(finalSelItemPara);
    }

    // DrawTableForSelectedItems();

    // $('#addItemsListModal').modal('hide');
});
function addItemsFromOracleTOC(paraItems) {

    $.ajax({
        url: "EMSItemList.aspx/AddItemsFromOracleTOC",
        data: JSON.stringify({
            'data': paraItems
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            if (result.d.ErrorType == 'error') {
                toastr.error(result.d.MsgText, '');
            } else {
                toastr.success(result.d.MsgText, '');
                $('#addUpdateItemsOracle').modal('hide');
                $('.btn-add-item-toc-grid').trigger('click');
            }
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function validateItemFromOracle() {
    var isValid = true;

    if ($('.tbody-items-toc-fromoracle input[name=cbIsTypical]:checked').length ==0) {
        isValid = false
    } 
    //$('.tbody-items-toc-fromoracle input[name=cbIsTypical]:checked').each(function (key, item) {
    //        let txtPipeUnit = $(item).parent().parent().parent().children().eq(5).children();
    //        let txtFittingPerc = $(item).parent().parent().parent().children().eq(6).children();
    //        let txtInstallUnitProce = $(item).parent().parent().parent().children().eq(7).children();

    //        if (txtPipeUnit.val().trim() == "") {
    //            isValid = false;
    //            txtPipeUnit.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    //        } else {
    //            txtPipeUnit.css('box-shadow', '').css('border-color', 'lightgrey');
    //        }

    //        if (txtFittingPerc.val().trim() == "") {
    //            isValid = false;
    //            txtFittingPerc.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    //        } else {
    //            txtFittingPerc.css('box-shadow', '').css('border-color', 'lightgrey');
    //        }

    //        if (txtInstallUnitProce.val().trim() == "") {
    //            isValid = false;
    //            txtInstallUnitProce.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    //        } else {
    //            txtInstallUnitProce.css('box-shadow', '').css('border-color', 'lightgrey');
    //        }
    //    });
    

    return isValid;
}


function validateItemIntoCategoryQty() {
    var isValid = true;

    //$('.tbody-items-toc input[name=cbIsTypical]:checked').each(function (key, item) {
    //    let cObj = $(item).parent().parent().parent().children().eq(5).children();

    //    if (cObj.val().trim() == "") {
    //        isValid = false;
    //        cObj.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    //    } else {
    //        cObj.css('box-shadow', '').css('border-color', 'lightgrey');
    //    }
    //});
    if ($("#ddlCategory option:selected").val() =="PIPES") {
        $('.tbody-items-toc input[name=cbIsTypical]:checked').each(function (key, item) {
            let txtPipeUnit = $(item).parent().parent().parent().children().eq(6).children();
            let txtFittingPerc = $(item).parent().parent().parent().children().eq(7).children();
            let txtInstallUnitProce = $(item).parent().parent().parent().children().eq(8).children();

            if (txtPipeUnit.val().trim() == "") {
                isValid = false;
                txtPipeUnit.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            } else {
                txtPipeUnit.css('box-shadow', '').css('border-color', 'lightgrey');
            }

            if (txtFittingPerc.val().trim() == "") {
                isValid = false;
                txtFittingPerc.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            } else {
                txtFittingPerc.css('box-shadow', '').css('border-color', 'lightgrey');
            }

            if (txtInstallUnitProce.val().trim() == "") {
                isValid = false;
                txtInstallUnitProce.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            } else {
                txtInstallUnitProce.css('box-shadow', '').css('border-color', 'lightgrey');
            }
        });
    }
   
    return isValid;
}


$('.btnAddItemsTOC').on('click', function () {
    
    if (!validateItemIntoCategoryQty()) {
        toastr.error("Please input the quantity for the selected item(s)", '');
    } else {
        var selItemsArr = [];

        $(".tbody-items-toc input[name=cbIsTypical]:checked").each(function () {
            
            let qty = $("#ddlCategory option:selected").val() == "PIPES" ? $(this).parent().parent().parent().children().eq(9).children().val().trim() : $(this).parent().parent().parent().children().eq(7).children().val().trim();
            let subitem = {};
            var res = itemlistTOC.filter(x => x.ItemId == $(this).data('itemid'));

            subitem["ReqId"] = selReqId;
            subitem["ItemId"] = res[0].ItemId;
            subitem["ItemCode"] = res[0].ItemCode;
            subitem["ItemDesc"] = res[0].ItemDesc;
            subitem["System"] = res[0].System;
            subitem["Category"] = res[0].Category;
            subitem["CreatedBy"] = currUserId;
            subitem["Quantity"] = qty == "" ? 0 : qty;
            subitem["IsOptional"] = $(this).parent().parent().parent().children().eq(1).children().children().is(':checked') ? 1 : 0;
            
            if ($("#ddlCategory option:selected").val() == "PIPES") {
                subitem["AlternateFromItemCode"] = $(this).parent().parent().parent().children().eq(10).children().val();
                subitem["PipeUnitPrice"] =    $(this).parent().parent().parent().children().eq(6).children().val() == undefined ? 0 : $(this).parent().parent().parent().children().eq(6).children().val().trim();
                subitem["FittingsPerc"] =     $(this).parent().parent().parent().children().eq(7).children().val() == undefined ? 0 : $(this).parent().parent().parent().children().eq(7).children().val().trim();
                subitem["InstallUnitPrice"] = $(this).parent().parent().parent().children().eq(8).children().val() == undefined ? 0 : $(this).parent().parent().parent().children().eq(8).children().val().trim();
            }
            else {
                subitem["PipeUnitPrice"] = 0;
                subitem["FittingsPerc"] = 0;
                subitem["InstallUnitPrice"] = $(this).parent().parent().parent().children().eq(6).children().val();
                subitem["AlternateFromItemCode"] = $(this).parent().parent().parent().children().eq(8).children().val();
            }

            selItemsArr.push(subitem);

        });

        var finalSelItemPara = { 'listItemsTOC': selItemsArr };

        selItemsArr.length == 0 ? toastr.error("Please select any item(s)", '') : addItemsTOC(finalSelItemPara);
    }
    
   // DrawTableForSelectedItems();

   // $('#addItemsListModal').modal('hide');
});

function addItemsTOC(paraItems) {

    $.ajax({
        url: "EMSItemList.aspx/AddItemsTOC",
        data: JSON.stringify({
            'data': paraItems
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success("Item added successfully", '');
            $('#addUpdateSystemnItems').modal('hide');
            getSystemsNItems();
                      
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



function openEngrNTestCommisionModal(sysName) {
    $(".btnAddEngrTestnCommision").data("sysname", sysName)
    $("#txtEngineering,#txtTestnCommision").val(0);
    $("#engrNTestCommisoinModal").modal('show');
    GetEngnTest(sysName);
}
$(".btnAddEngrTestnCommision").on('click', function () {

    AddEngrnCommision($(this).data('sysname'))
})

function AddEngrnCommision(pSysName) {
    $.ajax({
        url: "EMSItemList.aspx/AddEngrNTestCommision",
        data: JSON.stringify({
            'ReqId': selReqId,
            'SystemName': pSysName,
            'Engineering': $("#txtEngineering").val().trim(),
            'TestnCommision': $("#txtTestnCommision").val().trim()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success("Updated successfully", '');
            $("#engrNTestCommisoinModal").modal('hide');
            getSystemsNItems();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function GetEngnTest(pSysName) {
    $.ajax({
        url: "EMSItemList.aspx/GetEngnTest",
        data: JSON.stringify({
            'ReqId': selReqId,
            'SystemName': pSysName
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            ListEngnComm = result.d;
            $("#txtEngineering").val(result.d[0].Engineering);
            $("#txtTestnCommision").val(result.d[0].TestnComm);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
//function getAllSystemsNItemsByRequest() {

//    $.ajax({
//        url: "EMSItemList.aspx/GetAllSystemsNItemsByRequest",
//        type: "POST",
//        data: JSON.stringify({
//            "SysName": $('#ddlSystem option:selected').val(),
//            "Category": $('#ddlCategory option:selected').val(),
//            "ReqId": selReqId
//        }),
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        async: true,
//        success: function (result) {
//            itemlistTOC = result.d;
//            var htm = '';
//            $.each(itemlistTOC, function (key, item) {
//                let attr = "";//item[0].IsTypical == "True" ? "checked" : "";
//                htm += `<tr>
//                    <td> 
//                        <div style="display: flex;justify-content: center;">
//                            <input class="form-check-input position-relative" type="checkbox" name="cbIsTypical" value="`+ item.ItemId + `" id="cbTypical-` + item.ItemId + `" data-itemid=` + item.ItemId + ` ` + attr + ` /> 
//                        </div>
//                    </td>                 
//                    <td> `+ item.ItemCode + ` </td>                 
//                    <td> `+ item.ItemDesc + `</td>
//                    <td> `+ item.System + `</td>
//                    <td> `+ item.Category + `</td>`

//                htm += `</tr>`;
//            });
//            $('.tbody-items-toc').html(htm);

//        },
//        error: function (errormessage) {
//            ////alert(errormessage.responseText);
//        }
//    });
//}

