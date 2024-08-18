
var selReqId = 0;

$(document).ready(function () {

    flatpickr(jQuery("#txtDate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActFromDate = dateStr;
        }
    });
    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {

        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

function GetTableDetails(Loader) {

    $.ajax({
        url: "Quotation.aspx/GetRequestDetails",
        data: JSON.stringify({ "UserId": currUserId, "Status": $('#ddlRequestStatus').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-main-table tr').length > 0 ? objDatatable.destroy() : '';
            //clearmodal();

            var htm = '';
            var RequestDetails = result.d;



            $.each(RequestDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.RequestID + `</td>
                  <td style="text-align:center;">`+ item.EstimationNo + `</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                  <td style="text-align:center;">`+ item.ProjectNumber + `</td>
                  <td style="text-align:center;">`+ item.ProjectName + `</td>
                  <td style="text-align:center;">`+ item.Customer + `</td>
                  <td style="text-align:center;">`+ item.Salesman + `</td>
                   <td style="text-align:center;">`+ item.DueDate + `</td>
                   <td style="text-align:center;">`+ item.Status + `</td>
                    <td style="text-align:center;vertical-align:middle;"><a style="margin-left: 4%;" class="image-change">
                    <img src="images/icon-View.png" title="View" class="fa-icon-hover ibtn-Request-Details" data-reqid=`+ item.RequestID +` style="cursor: pointer; width: 24px;" />
                    </a></td>`;


                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-main-table').html(htm);

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

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.thead-main-table').DataTable({
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




$('.tbody-main-table').on('click','.ibtn-Request-Details', function () {

    var selAction = $(this)[0].title.trim();
    selReqId = $(this).data('reqid');

    if (selAction == "View") {
        getQuotaionHeaderData();
        $('#NewQuotation').modal('show');
    }
    
});


//Anwar Work

$('#NewQuotation ul li').on('click', function () {
    var res = $(this).text().trim();
    if (res == 'Quotation Header') {
        //loadHistoryForRRF();
    }
    else if (res == 'Item Details') {
        loadQuotItemsDets();
    }
    else if (res == 'Reports') {

    }
    // $('#rrfDetailsModal ul li').find('.active').text().trim()
})




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

function loadQuotItemsDets(tabname) {
   // let res = listForecastQuarters.filter(s => s.ForecastQuartId == selForecastQuartId)
    $.ajax({
        url: "Quotation.aspx/GetSystemsNItems",
        //data: JSON.stringify({ 'UserId': currUserId, 'ReqId': selReqId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            var listSystems = result.d.listSystems;
            var listSystemsItems = result.d.listItems;
            //var listAlternateItems = result.d.listAlternateItems;

            var firstSysName = listSystems.length > 0 ? listSystems[0].SysName : '';
            var AllCategoryForSys = [];


            //listOpp = result.d.listOpp;
            //listRev = result.d.listRev;

            var htm = '<tr style="text-align:center;"><td colspan=6> No Data Available</td> </tr>';

            if (listSystemsItems.length != 0) {
                htm = '';
                $.each(listSystems, function (key, item) {
                    //let rev = listRev.filter(xx => xx.OppId == item.OppId);
                    AllCategoryForSys = listSystemsItems.filter(x => x.System == item.SysName).map(ss => ss.Category).filter((value, index, self) => self.indexOf(value) === index);
                    if (AllCategoryForSys.length > 0) {

                        htm += `<tr onclick="showHideRow('hidden_row` + key + `','tbody-itemDetails');"> 
                    <td style="text-align: left;">  <span><h5>`+(key+1)+`. `+ item.SysName + `</h6></span> </td>`                 
                    //<td> `+ item.OppName + `</td>
                    //<td> `+ item.Customer + ` </td>                          
                    //<td> `+ item.Consultant + ` </td>                          
                    //<td> `+ item.Marketing + ` </td>`
                      
                    //htm +=`<td class="riskActions" style="text-align:right;"> `
                    //    if (selForecastQuartObj[0].Status == "PENDING SALESMEN") {
                    //        htm += `<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-wsheetopp-delete" title="Delete Opp" data-oppid="` + item.OppId + `" data-currtr="hidden_row` + key + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`
                    //    }
                    //    htm += `</td>`

                        htm += `</tr>`

                                                
                        $.each(AllCategoryForSys, function (key1, itm) {
                            htm += `<tr class="hidden_row` + key + ` hidden"><td colspan="7">` + itm + `</td> </tr>`
                            //if (key1==0) {
                                htm += `<tr class="hidden_row` + key + ` hidden">
                                        <td colspan="6">
                                        <table style="width:100%;">
                                        <tr class="hidden_row` + key + ` sub-tabl-bg" style="text-align:center;"> <td>S.No</td> <td>Item Code</td> <td>Item Desc</td> <td>QTY</td> <td>Unit Price</td> <td>Total</td> <td>Action</td> </tr>`;
                          //  }          

                            var ress = listSystemsItems.filter(s => s.Category == itm);
                            
                            $.each(ress, function (key11,catitem) {
                                htm += `<tr style="text-align:center;" id="hidden_row` + key + ` accordian-info" class="hidden_row` + key + ` hidden">`
                                htm += `<td>` + (key11 + 1) + `</td>
                                <td>` + catitem.ItemCode + `</td>
                                <td>`+ catitem.ItemDesc + `</td> 
                                <td>`+ parseInt(catitem.Quantity).toLocaleString("en-US") + `</td> 
                                <td>`+ parseInt(catitem.PipeUnitPrice).toLocaleString("en-US") + `</td> 
                                <td> `+ (parseInt(catitem.Quantity) * parseFloat(catitem.PipeUnitPrice).toFixed(1)) + ` </td>  
                                <td>`
                                //if (selForecastQuartObj[0].Status == "PENDING SALESMEN") {
                                //    htm += `<span style="margin-left: 4%;"><i class="bx bxs-save fa-icon-hover ibtn-wsheetrev-save"   title="Save Rev"   data-revid="` + item.RevId + `" data-oppid="` + item.OppId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
                                //            <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-wsheetrev-delete" title="Delete Rev" data-revid="`+ item.RevId + `" data-oppid="` + item.OppId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`
                                //}
                                htm += `</td></tr>`;
                            })
                            htm += `</table> </td></tr>`;
                        });
                        //htm += `</table> </td></tr>`;
                    }
                    

                });
            }

            //$('.tbody-worksheet').html(htm);
            $('.tbody-itemDetails').html(htm);
            //initiateRRFDT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}





function getQuotaionHeaderData() {

    $.ajax({
        url: "Quotation.aspx/GetQuotaionHeaderData",
        data: JSON.stringify({ 'UserId': currUserId, 'ReqId': selReqId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            var objQuotHeader = result.d.listEstiHeader;
            var objQuotHeaderGrid = result.d.listEstiHeaderGrid;           
            bindValueForHeader(objQuotHeader);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function bindValueForHeader(data) {

    $('#txtEstRef').html(data[0].RefNo);
    $('#txtRevision').html(data[0].RevNo)
    $('#txtContrAbbr').html(data[0].ContABBR)
    $('#txtEstYear').html(data[0].Year)
    $('#txtOppRef').html(data[0].OptNo)
    $('#txtProjRef').html(data[0].ProjectNumber)

    $('#txtPrjName').val(data[0].ProjectName)
    $('#txtPrjLocation').html(data[0].Location)
    $('#txtPrjClient').html(data[0].Client)
    $('#txtPrjConsultant').html(data[0].Consultant)
    $('#txtPrjMainContr').html(data[0].MainContractor)
    $('#txtPrjMEPContr').html(data[0].MEPContractor)
    $('#txtPrjContactPerson').html(data[0].ContactID)
    $('#txtPrjWinningPerc').html(data[0].WinPerc)
    $('#txtPrjBudget').html(data[0].Budget)
    $('#txtPrjURL').html(data[0].URL)
    $('#ddlEstimationTeamOrg').html(data[0].EstimationOrg)
    $('#txtSalesman').html(data[0].Salesman)
    $('#txtMarketing').html(data[0].Marketing)

    $("input[name=Stage][value='" + data[0].Stage + "']").attr('Checked', true)
    $("input[name=Supply][value='" + data[0].Scope + "']").attr('Checked', true)
    $("input[name=Quotation][value='" + data[0].QuotationType + "']").attr('Checked', true)
}



//End