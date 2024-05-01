
var objDtableAllscraplist = [];
var slideObj = [];
var GetQuant = '';
var ItemId = '';
var MarketingId = '';

$(document).ready(function () {

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        ViewAllItems();      
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

function loadSlider(id) {

    $.ajax({
        url: "scrapMarket.aspx/LoadSlider",
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
    //$("#content-slider").lightSlider({
    //    loop: true,
    //    keyPress: true
    //});
    slideObj.length != 0 ? slideObj.destroy() : '';

   slideObj =  $('#image-gallery').lightSlider({
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

function ItemGallary1(LineID,id,itemcode,description,quantity,reason,comment) {


    MarketingId = LineID;
    ItemId = id;
    $('.Item-Code').html('Item Code:&nbsp;' + itemcode);
    $('.Item-Description').html(description);
    $('#txtTotalQuantity').val('1');
    $('#txtTotalQuantity').css({ 'color': '' });
    $('#lblStockQuant').css('display', 'none');
    $('#txtOutOfQuant').html(quantity);
    GetQuant = quantity;
    $('.Item-Reason').html(reason);
    $('.Item-Comment').html(comment);
    $('#modalItemDetails').modal('show');
    setTimeout(function () {        
        loadSlider(id);
    }, 400);

    
    
}
function DTableAllScrapItemList() {
    objDtableAllscraplist = [];
    objDtableAllscraplist = $('.AllScrapeItems').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
       /* order: [[0, 'desc']],*/
        "columnDefs": [

            { "orderable": false, "targets": [0,1,2,3,4,5,6] },
            
        ],
        /*   order: [[0, 'ASC']]*/
    });
}

function ViewAllItems() {

    $.ajax({
        url: "ScrapMarket.aspx/GetAllItems",
        data: JSON.stringify({ "UserId": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-AllItemList tr').length > 0 ? objDtableAllscraplist.destroy() : '';
            //clearmodal();

           /* $('.tbody-AllItemList').html('');*/
            var htm = '';
            var ProjectDetails = result.d;


            var nextLine = 0;
            $.each(ProjectDetails, function (key, item) {

                if (parseInt(key % 7) == 0) {
                    htm += `<tr>`;
                    nextLine = key;
                }

                htm += `                 
                <td style="width:14.2%;">
                
            <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;"onclick="ItemGallary1(`+ item.LineID + `,`+ item.ItemId + `,'` + item.ItemCode + `','` + item.ItemDescription.replaceAll('\"', "&quot;").replaceAll('\'', "&sbquo") + `','` + item.Quantity + `','` + item.Reason.replaceAll('\"', "&quot;").replaceAll('\'', "&sbquo") + `','` + item.Comments.replaceAll('\"', "&quot;").replaceAll('\'', "&sbquo") +`')">


             <div class="row"style= "display:flex"> 
                <div class="col-12">
                  <div class="card">
                    <img class="card-img-top" src="`+ item.URL + `" alt="Card image cap"  style="width:100%;height:167px!important;/>
                    <div class="card-body">
                      <h6 id="lblGrdItemCode" class="card-title txtitmcode">Item Code- `+ item.ItemCode + `</h5>
                        <h5 class="card-title txtquty">QTY- `+ item.Quantity + `</h5>
                      <p class="card-text" style="padding:10px;height:66px;">
                        `+ textview(item.ItemDescription) + `
                      </p>
                     
                    </div>
                  </div>
                </div>
            <div>            

            </div>
            

                  </td>`;

                if ((parseInt(nextLine) + 6) == key) {
                    htm += `</tr>`;
                }
                else if ((ProjectDetails.length - 1) == key) {
                    for (var i = (ProjectDetails.length == 1 ? 1 : (key+1)); i%7 != 0 ; i++) {
                        htm += '<td> </td>';
                    }
                    htm += `</tr>`;
                }


            });
            $('.tbody-AllItemList').html(htm);

            DTableAllScrapItemList();
           // textview();
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

    let result = itemDesc.length < 30 ? itemDesc : (itemDesc.substring(0, 30,) + ' ...');

    return result;
}

$('#btnPlus').on('click', function () {
    let value = parseInt($('#txtTotalQuantity').val()) + 1;
    $('#txtTotalQuantity').val(value);
    if (value > GetQuant) {
        $('#txtTotalQuantity').css({ 'color': 'red' });
        $('#lblStockQuant').css('display', '');
    }
    else {
        $('#txtTotalQuantity').css({ 'color': '' });
        $('#lblStockQuant').css('display', 'none');
    }

});

$('#btnMinus').on('click', function () {
    let value = '';
    if ($('#txtTotalQuantity').val() == 1) {
        $('#txtTotalQuantity').val(1);
    }
   else { 
    value = parseInt($('#txtTotalQuantity').val()) - 1;
    $('#txtTotalQuantity').val(value);
    }
    if (value > GetQuant) {
        $('#txtTotalQuantity').css({ 'color': 'red' });
        $('#lblStockQuant').css('display', '');
    }
    else {
        $('#txtTotalQuantity').css({ 'color': '' });
        $('#lblStockQuant').css('display', 'none');
    }

});

$('#txtTotalQuantity').keyup(function () {


    
     if (parseInt($('#txtTotalQuantity').val()) > GetQuant) {
        $('#txtTotalQuantity').css({ 'color': 'red' });
        $('#lblStockQuant').css('display', '');
    }
    else {
        $('#txtTotalQuantity').css({ 'color': '' });
        $('#lblStockQuant').css('display', 'none');
    }   
});

$('#btnunitReqGet').on('click', function () {

    if (parseInt($('#txtTotalQuantity').val()) > GetQuant || parseInt($('#txtTotalQuantity').val()) < 1) {

        toastr.error('Enter the valid Quantity. ', '');
    }
    else {
        MarketGetItem();

    }


});



function MarketGetItem() {

    $.ajax({
        url: "scrapMarket.aspx/GetItem",
        data: JSON.stringify({ "LineId": MarketingId, "ItemId": ItemId, "UserId": currUserId, "Quantity": $('#txtTotalQuantity').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 0) {
                toastr.error('selected Quantity is not available..Please Check again.', '');
                ViewAllItems();
                $('#modalItemDetails').modal('hide');
               
            }
            else {
                toastr.success('Updated Successfully.', '');
                ViewAllItems();
                $('#modalItemDetails').modal('hide');
               

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

$('#btnunitNotInterest').on('click', function () {

    NotInterest();

});

function NotInterest() {

    $.ajax({
        url: "scrapMarket.aspx/SetNotInterest",
        data: JSON.stringify({ "LineID": MarketingId, "ItemId": ItemId, "UserId": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 0) {
                toastr.error('selected Quantity is not available..Please Check again.', '');
                $('#modalItemDetails').modal('hide');
                ViewAllItems();
            }
            else {
                toastr.success('Updated Successfully.', '');
                $('#modalItemDetails').modal('hide');
                ViewAllItems();

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


