var objDatatablAllitemList = [];
$(document).ready(function () {
   
    ItemCategoryDDL();
    loadAllItems();

});

$('.btn-addNew-Item').on('click', function () {

    $('#ModalCreateNewItem').modal('show');
    getUniqueItemRequestId();
    clearnewitem();
    //ModalItemDetails();
   

});

$('.btn-add-location').on('click', function () {

    $('#ModalItemLocation').modal('show');
    clearnewitemlocation();
    //getUniqueItemRequestId();
    //ModalItemDetails();

});

$('.tbody-allitems-list').on('click', '.ibtn-item-info', function () {

    $('#ModalItemDetails').modal('show');

    ItemID = this.parentNode.parentNode.parentNode.children[0].textContent;
    ShowItemDetails();
    loadAllItemslocation();

});

$('.tbody-ItemLocation').on('click', '.ibtn-addItemDetails', function () {

    $('#ModalUpdateitemdetails').modal('show');
    LocationID = this.parentNode.parentNode.parentNode.children[0].textContent;
    ItemID = this.parentNode.parentNode.parentNode.children[1].textContent;

    locationdetails();
    loadItemsInsiodelocation();
    //ShowItemDetails();
    //loadAllItemslocation();

});


$('#ddlitemcategory').on('change', function () {

    newcategory();

});


function newcategory()
{
    Category = $('#ddlitemcategory option:selected').val();

    if (Category == "7") {

        $('#newitemcategory').removeClass('hidden');
    }

    else {

        $('#newitemcategory').addClass('hidden');
    }
}




function initiateDataTableLoaditemlist() {
    objDatatablAllitemList = [];
    objDatatablAllitemList = $('.Allitem-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[0, 'DESC']]
    });

}


function ItemCategoryDDL() {

    debugger;
    $.ajax({
        url: "ItemMaster.aspx/GetItemCategoryDDL",

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1"> --- Select --- </option>'; }
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlitemcategory').html(htm);


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function getUniqueItemRequestId() {


    $.ajax({
        url: "ItemMaster.aspx/GetUiqueItemRequstId",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#textitemcode').val(result.d[0].ItemCode);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function addItem() {


    $.ajax({
        url: "ItemMaster.aspx/CreateItems",
        data: JSON.stringify(
            {
                
                "ItemCode": $('#textitemcode').val(),
                "CategoryValue": $('#ddlitemcategory option:selected').val(),
                "ItemName": $('#textitemname').val(), 
                "CategoryName": $('#ddlitemcategory option:selected').text().trim(),
                "Category": $('#textnewcategory').val(),
                "UnitMeasurement": $('#textunitofmeasurement').val(),
                "ItemSize": $('#textitemsize').val(),

               
                "ItemDescription": $('#txtitemDescription').val(),
                
                "CreatedBy": currUserId,

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('New Item Added ...', '')
           
            loadAllItems();

        },
        
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadAllItems() {

    $.ajax({
        url: "ItemMaster.aspx/GetAllItems",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-allitems-list tr').length > 0 ? objDatatablAllitemList.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                 <td>`+ item.ItemID + `</td>

                  <td>`+ item.ItemCode + `</td> 
                  <td>`+ item.CategoryName + `</td>
                  <td>`+ item.ItemName + `</td>
                  <td>` + item.ItemDescription +`</td>
                
                  
                 <td style="text-align:center;"> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-item-info" title="Other" data-unitreqid="`+ item.ItemID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td>`;


                htm += `</tr>`;

            });

            $('.tbody-allitems-list').html(htm);

            initiateDataTableLoaditemlist();
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


} 

function ShowItemDetails() {


    $.ajax({
        url: "ItemMaster.aspx/GetItemDetails",
        data: JSON.stringify({ 'ItemID': ItemID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtitemid').val(result.d.ItemID);
            $('#txtitemcode').val(result.d.ItemCode);
            $('#txtcategoryname').val(result.d.CategoryName);
            $('#txtitemname').val(result.d.ItemName);
            $('#currentstock').val(result.d.ItemQty);
           /* $('#txtunitprice').val(result.d.UnitPrice);*/

            $('#textdesc').val(result.d.ItemDescription);
           
            
        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
} 

function ShowTotelStock() {


    $.ajax({
        url: "ItemMaster.aspx/GetTotelstock",
        data: JSON.stringify({ 'ItemID': ItemID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtitemid').val(result.d.ItemID);
           


        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
} 

function addItemLocation() {


    $.ajax({
        url: "ItemMaster.aspx/CreateItemlocation",
        data: JSON.stringify(
            {
                "ItemID": $('#txtitemid').val(),
                "ItemCode": $('#txtitemcode').val(), 

                "ItemName": $('#txtitemname').val(),
               
                "Location": $('#ddlitemlocation option:selected').val(),
                "Description": $('#textitemdescription').val(),

               
                "CreatedBy": currUserId,

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Item Location Added ...', '')
            loadAllItemslocation();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadAllItemslocation() {

    $.ajax({
        url: "ItemMaster.aspx/GetAllitemlocation",
        data: JSON.stringify({ 'ItemID': ItemID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            //$('.tbody-WorkOrder-details tr').length > 0 ? objDatatableAllworkorder.destroy() : '';
            

            var htm = '';
            var ProjectDetails = result.d;

            $.each(ProjectDetails, function (key, item) {
               

                htm += `  <tr>   
                  <td style="display:none">`+ item.LocationID + `</td>
                  <td style="display:none">`+ item.ItemID + `</td>
                  <td  style="display:none">`+ item.ItemCode + `</td>
                  <td>`+ item.ItemName + `</td> 
                  <td>`+ item.Location + `</td>
                  <td>`+ item.Description + `</td>
                   <td>`+ item.ItemQty + `</td>
                  
                 
                  

                 
                 <td style="text-align:center;"> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-addItemDetails" title="Other" data-unitreqid="`+ item.ItemID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td>`;


                htm += `</tr>`;

            });

            $('.tbody-ItemLocation').html(htm);

            //initiateDataTableallWorkOrder(); //<td class="`+ item.LowQuantity +`">`+ item.ItemQuantity + `</td>
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


} 




function UpdateItemDetails() {


    $.ajax({
        url: "ItemMaster.aspx/UpdateItemdetails",
        data: JSON.stringify(
            {
                "ItemID": ItemID ,
                "LocationID": LocationID,
              
                "ItemQuantity": $('#textItemQuantity').val(),
                "UnitPrtice": $('#textunitprice').val(),
               
                "MinimumStock": $('#minimumstock').val(),
                "PurcheseDate": $('#purchesedate').val(),


                "Remarks": $('#textattachementremarks').val(),

                "CreatedBy": currUserId,

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Update Item Details..', '')
            loadAllItemslocation();
            loadItemsInsiodelocation();
            ShowItemDetails();
            locationdetails();
            UpdateItemStock();
            loadAllItems();

            //loadAllItemslocation();
            ShowItemDetails();

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function UpdateItemStock() {


    $.ajax({
        url: "ItemMaster.aspx/UpdateItemStock",
        data: JSON.stringify(
            {
                "ItemID": ItemID,

                

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Update Item Details..', '')

            //loadAllItems();

            //loadAllItemslocation();


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function uploadDocumentAttach() {

    if ($('#fu-docment-attach')[0].files.length == 0) {
        toastr.error('Please select file to upload. ', '')
    }

    else {

        var formData = new FormData();
        var fileUpload = $('#fu-docment-attach').get(0);
        var files = fileUpload.files;
        for (var i = 0; i < files.length; i++) {
            console.log(files[i].name);
            formData.append(files[i].name, files[i]);
        }

       // var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FMWorkOrderAttachemnets.ashx?itemid=' + ItemID + '&crdate=' + getDateWithTime() + '&crby=' + currUserId//for Live
       var qrystringLocal = '/Services/FMItemMasterAttachements.ashx?itemid=' + ItemID + '&crdate=' + getDateWithTime() + '&crby=' + currUserId   // For Development

        let sURL = 'TestFoCalendar.aspx/Upload';

        //var formData = new FormData();
        //formData.append('file', $('#f_UploadImage')[0].files[0]);
        $.ajax({
            type: 'post',
            url: qrystringLocal,
            data: formData,

            success: function (status) {
                if (status != 'error') {
                    var my_path = "MediaUploader/" + status;
                    //  $("#myUploadedImg").attr("src", my_path);
                    toastr.success('File has been Uploaded Successfully. ', '');
                    //loadWOAttachementslist();


                    $('#lblFilesName').val('');
                    $('.lbl-fufile-count').html('');
                    $('#fu-docment-attach').val('');


                }
            },
            processData: false,
            contentType: false,
            error: function () {
                alert("Whoops something went wrong!");
            }
        });
    }

}

function getDateWithTime() {
    return new Date().getFullYear() + '/' + (
        new Date().getMonth() + 1) + '/' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes()
}



function loadItemsInsiodelocation() {

    $.ajax({
        url: "ItemMaster.aspx/GetAllitemsInLocation",
        data: JSON.stringify({ 'ItemID': ItemID, "LocationId": LocationID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            //$('.tbody-WorkOrder-details tr').length > 0 ? objDatatableAllworkorder.destroy() : '';


            var htm = '';
            var ProjectDetails = result.d;

            $.each(ProjectDetails, function (key, item) {

                //let iterSrcImg = '/Services/FMDocDownload.ashx?FileName=' + item.FileName;

                let iterSrcImg = 'https://crmss.naffco.com/CRMSS/Services/FMDocDownload.ashx?FileName=' + item.FileName;

                htm += `  <tr>   
                  <td>`+ item.LocationID + `</td>
                 <td>`+ item.ItemID + `</td>
                 
                  <td>`+ item.ItemQuantity + `</td>
                  
                  <td>`+ item.UnitPrtice + `</td>
                  <td>`+ item.MinimumStock + `</td>
                  <td>`+ item.PurcheseDate +`</td>
                    <td style="display:none">`+ item.FileName + `</td>

                 <td

                <span style="margin-left: 5%;"><a href="`+ iterSrcImg + `"> <i class="fa fa-download docDownloadIcon fa-icon-hover" title="` + item.FileName + `" style="color:#2196F3; cursor:pointer;font-size: x-large;"></i></a></span>

                </td>`;

                htm += `</tr>`;

            });

            $('.tbody-ItemINLocation').html(htm);

            //initiateDataTableallWorkOrder();
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


} 

function clearnewitem() {
    $('#textitemname').val('');
    $('#textunitofmeasurement').val('');
    $('#textitemsize').val('');
    $('#txtitemDescription').val('');
   
}

function clearnewitemlocation() {
    $('#textitemdescription').val('');
   
}


function locationdetails() {
    $('#textItemQuantity').val('');
    $('#textunitprice').val('');
    $('#minimumstock').val('');
    $('#purchesedate').val('');
    $('#textattachementremarks').val('');
   
}