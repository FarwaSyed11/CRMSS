/*
 * *******************************JS TOC <starts> *************************************
 *
 */
var itemlistTOC = [];
var selItemIdTOC = 0;

$(document).ready(function () {

    
})

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
    getAllSystem();
    getCategoryBySystem();
    $('#addUpdateSystemnItems').modal('show');
});

$('#ddlSystem').on('change', function (){
    getCategoryBySystem();
})

$('#btnItemFilterTOC').on('click', function () {
    getItemsForSysCategory();
})


$('.ibtn-addfloor-into-items').on('click', function () {
    $(".tbody-floor-into-item").html('');
    //let selEstiItemId = $(this).data('estiid')
    $('.btnAddFloorsIntoItem').data('estiid', $(this).data('estiid'));    
    $('#btnFloorFilterTOC').data('itemcode', $(this).data('itemcode'));    

    loadStructureDDL();
    loadFloorType();
    loadFloorDDLInTOC();

    $('#tagFloorIntoItems').modal('show')
    //addItemIntoFloor(selEstiItemId);
})
function openAddFloorModal(estiid, itemcode) {
    $(".tbody-floor-into-item").html('');
    //let selEstiItemId = $(this).data('estiid')
    $('.btnAddFloorsIntoItem').data('estiid', estiid);
    $('#btnFloorFilterTOC').data('itemcode', itemcode);

    loadStructureDDL();
    loadFloorType();
    loadFloorDDLInTOC();

    $('#tagFloorIntoItems').modal('show')
}

$('#btnFloorFilterTOC').on('click', function () {
    generateTablesForSelFloor($(this).data('itemcode'));
})

function generateTablesForSelFloor(itemcode) {
    var flrName = $("#ddlFloorTypeTOC option:selected").val() + " " + $("#ddlFloorFromTOC option:selected").val();
    var res = listReqStructFloors.filter(s => s.StructureID == $("#ddlStructNameTOC option:selected").val() && (s.TypicalOf == flrName || s.Name == flrName));

    let selItemCode = itemcode;
    var htm = '';
    $.each(res, function (key,item) { 
        htm += `<tr data-floorid="` + item.StructFloorDetId+`">               
                    <td> `+ selItemCode + ` </td>                 
                    <td> `+ item.Name + `</td>
                    <td> `+ item.Type + `</td>
                    <td> <input class="form-control" name="txtqtyitem" type="number" id="floorItemQty-`+ key + `" placeholder="enter quantity"> </td>`

    htm += `</tr>`;
});
    $('.tbody-floor-into-item').html(htm);

}


$('.btnAddFloorsIntoItem').on('click', function () {
    var subitem = {}; var arrItem = []; var finalParaItem = [];
    var selEstiId = $(this).data('estiid');

    if (!validateQty()) {
        toastr.error('Please input the quantity for selected floor(s).', '');
    }
    else {
        $('.tbody-floor-into-item tr').each(function (key, item) {
            subitem = {};
            subitem["EstiLineId"] = selEstiId;
            subitem["FloorId"] = $(item).data('floorid');
            subitem["FloorName"] = $(item).children().eq(1).text().trim();
            subitem["Quantity"] = $(item).children().eq(3).children().val().trim();
            subitem["CreatedBy"] = currUserId;
            arrItem.push(subitem);           
        });

        finalParaItem = {
            "listFloors": arrItem
        }
        addItemIntoFloor(finalParaItem);
    }
})
function validateQty() {
    var isValid = true;

    $('.tbody-floor-into-item input[name=txtqtyitem]').each(function (key, item) {

        if ($(item).val().trim() == "") {
            isValid = false;
            $(item).css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        } else {
            $(item).css('box-shadow', '').css('border-color', 'lightgrey');
        }
    });

    return isValid;
}

function addItemIntoFloor(paraData) {

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
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}

$("#progress-bar li").on('click', function () {

    var selTab = $(this).text().trim();
    if (selTab == "Create TOC") {
        getSystemsNItems()
    }
})
//$("#progress-bar").find('.active').text().trim()
function getSystemsNItems() {

    $.ajax({
        url: "EMSItemList.aspx/GetSystemsNItems",
        type: "POST",
        //data: JSON.stringify({ "userId": currUserId.val() }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htm1 = '';

            var listSystems = result.d.listSystems;
            var listSystemsItems = result.d.listItems;

            var firstSysName = listSystems.length > 0 ? listSystems[0].SysName : '';                      
            var AllCategoryForSys = [];

            $.each(listSystems, function (key, item) {
                if (key == 0) { // for first record only
                    htm += `<div class="col-md-12 mt-3">`;
                    htm += `<div style="background: #fcfafa; text-align: center; border: 1px solid #b70000; color: black; border-radius: 20px 20px 3px 3px; font-weight: 600; padding: 15px 0px 15px 0px;">` + item.SysName + `</div>`;
                  
                    AllCategoryForSys = listSystemsItems.filter(x => x.System == item.SysName).map(ss => ss.Category).filter((value, index, self) => self.indexOf(value) === index);
                }

                if (firstSysName != item.SysName) {
                    htm += `<div class="col-md-12 mt-3">`;
                    htm += `<div style="background: #fcfafa; text-align: center; border: 1px solid #b70000; color: black; border-radius: 20px 20px 3px 3px; font-weight: 600; padding: 15px 0px 15px 0px;">` + item.SysName + `</div>`;
                   
                    AllCategoryForSys = listSystemsItems.filter(x => x.System == item.SysName).map(ss => ss.Category).filter((value, index, self) => self.indexOf(value) === index);
                }



                for (var i = 0; i < AllCategoryForSys.length; i++) {
                    var res = listSystemsItems.filter(x => x.Category == AllCategoryForSys[i]);

                    htm += `<div class="category my-2" style="font-size: 12px">` + (i + 1) + `. ` + res[0].Category + `</div>`
                    htm += ` <div class="table mt-2" style="overflow-y: auto; max-height: 800px;">
                                                            <table class="table project-table" style="width: 100%;">
                                                                <thead style="position: sticky; top: -3px;">
                                                                    <tr class="Head-tr">                                                                        
                                                                        <th>Item Code</th>
                                                                        <th>Item Desc</th>
                                                                        <th>Quantity</th>
                                                                        <th>Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class=""> `

                    $.each(res, function (k,CatItem) {
                        htm += `<tr>                                                                                        
                                                                         <td> <span class="badge badge-dark fs-6">`+ CatItem.ItemCode +` <svg class="" xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 24 24">
                                                                                <g fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5">
                                                                                    <path d="m17.524 17.524l-2.722 2.723a2.567 2.567 0 0 1-3.634 0L4.13 13.209A3.852 3.852 0 0 1 3 10.487V5.568A2.568 2.568 0 0 1 5.568 3h4.919c1.021 0 2 .407 2.722 1.13l7.038 7.038a2.567 2.567 0 0 1 0 3.634z" />
                                                                                    <path d="M9.126 11.694a2.568 2.568 0 1 0 0-5.137a2.568 2.568 0 0 0 0 5.137m3.326 4.392l3.634-3.634" />
                                                                                </g>
                                                                            </svg></span></td>                
                                                                         <td> `+ CatItem.ItemDesc +`</td>                                                                      
                                                                         <td> 50</td>
                                                                         <td> <a class="ibtn-addfloor-into-items" data-estiid="`+ CatItem.EstiLineId + `" data-itemcode="` + CatItem.ItemCode + `"> <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24" onclick="openAddFloorModal(` + CatItem.EstiLineId + `,` + CatItem.ItemCode+`)">
                                                                                    <path fill="#a92828" d="M12 9v2h2v2h-2v2h2v2h-2v2h4v-4h4V9zm6 4h-2v-2h2z" opacity="0.3" />
                                                                                    <path fill="#a92828" d="M12 7V3H2v18h14v-2h-4v-2h2v-2h-2v-2h2v-2h-2V9h8v6h2V7zM6 19H4v-2h2zm0-4H4v-2h2zm0-4H4V9h2zm0-4H4V5h2zm4 12H8v-2h2zm0-4H8v-2h2zm0-4H8V9h2zm0-4H8V5h2zm14 12v2h-2v2h-2v-2h-2v-2h2v-2h2v2zm-6-8h-2v2h2zm0 4h-2v2h2z" />
                                                                                </svg> </a></td>
                                                                    </tr>`
                    })

                    htm +=`     </tbody>
                             </table>
                          </div>`
                }

                if (key == 0) { `</div>` }
                if (firstSysName != item.SysName && key != 0) { `</div>` }
                            


            });

            $('.system-div-parent').html(htm);
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });

}


function getAllSystem() {

    $.ajax({
        url: "EMSItemList.aspx/GetAllSystems",
        type: "POST",
        //data: JSON.stringify({ "userId": currUserId.val() }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {               
                htm += '<option value="' + item.Value + '" selected>' + item.Text + ' </option>'
            });

            $('#ddlSystem').html(htm);
            //compId = $('#selectTypeOpt option:selected').val();
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });

}

function getCategoryBySystem() {

    $.ajax({
        url: "EMSItemList.aspx/GetCategoryBySys",
        type: "POST",
        data: JSON.stringify({ "SysName": $('#ddlSystem option:selected').val() }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.Value + '" selected>' + item.Text + ' </option>'
            });

            $('#ddlCategory').html(htm);
            //compId = $('#selectTypeOpt option:selected').val();
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
    
}


function getItemsForSysCategory() {

    $.ajax({
        url: "EMSItemList.aspx/GetItemsForSysCategory",
        type: "POST",
        data: JSON.stringify({
            "SysName": $('#ddlSystem option:selected').val(),
            "Category": $('#ddlCategory option:selected').val(),
            "ItemCode": $('#txtItemCode').val().trim() == '' ? '-1' : $('#txtItemCode').val().trim()
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            itemlistTOC = result.d;
            var htm = '';
            $.each(itemlistTOC, function (key, item) {
                let attr = "";//item[0].IsTypical == "True" ? "checked" : "";
                htm += `<tr>
                    <td> 
                        <div style="display: flex;justify-content: center;">
                            <input class="form-check-input position-relative" type="checkbox" name="cbIsTypical" value="`+ item.ItemId + `" id="cbTypical-` + item.ItemId + `" data-itemid=` + item.ItemId +` ` + attr + ` /> 
                        </div>
                    </td>                 
                    <td> `+ item.ItemCode + ` </td>                 
                    <td> `+ item.ItemDesc + `</td>
                    <td> `+ item.System + `</td>
                    <td> `+ item.Category + `</td>`

                htm += `</tr>`;
            });
            $('.tbody-items-toc').html(htm);

        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}

$('.btnAddItemsTOC').on('click', function () {
    //selItemIdTOC = $(this).data('itemid');
    var selItemsArr = [];
    var ItemIds = '';

    $(".tbody-items-toc input[name=cbIsTypical]:checked").each(function () {
        //ItemIds += $(this).data('itemid') + ',';
        let subitem = {};
        var res = itemlistTOC.filter(x => x.ItemId == $(this).data('itemid'));

        subitem["ReqId"] = selReqId;
        subitem["ItemId"] = res[0].ItemId;
        subitem["ItemCode"] = res[0].ItemCode;
        subitem["ItemDesc"] = res[0].ItemDesc;
        subitem["System"] = res[0].System;
        subitem["Category"] = res[0].Category;
        subitem["CreatedBy"] = currUserId;

        selItemsArr.push(subitem);

    });

    var finalSelItemPara = { 'listItemsTOC': selItemsArr};
    addItemsTOC(finalSelItemPara);

    
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

