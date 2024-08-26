
var selReqId = 0;
var selQuotationID = 0;

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
$('#ddlRequestStatus').on('change', function () {
    
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
            var htmhead = '';
            var RequestDetails = result.d;

            if($('#ddlRequestStatus').val()=='Pending')
            {
                htmhead += `<tr>    
                     <th style="display: none">ID</th>
                     <th style="display: none">Status</th>
                       
                                <th>EMS Req Number</th>
                                <th>OPT Number</th>
                                <th>PRJ Number</th>
                                <th>Name</th>
                                <th>Customer</th>
                                <th>Salesman</th>
                                 <th>Status</th>
                                <th>view</th>
                    </tr>`;

            

                $.each(RequestDetails, function (key, item) {
                    htm += `<tr>        
                           <td style="text-align:center;display:none;">` + item.RequestID + `</td>
                        <td style="text-align:center;display:none;">` + item.Status + `</td>
                   
                           
                      <td style="text-align:center;">`+ item.EMSRequestNumber + `</td>
                      <td style="text-align:center;">`+ item.OPTNumber + `</td>
                      <td style="text-align:center;">`+ item.ProjectNumber + `</td>
                      <td style="text-align:center;">`+ item.ProjectName + `</td>
                      <td style="text-align:center;">`+ item.Customer + `</td>
                       <td style="text-align:center;">`+ item.Salesman + `</td>
                       <td style="text-align:center;">`+ item.Status + `</td>
                        <td style="text-align:center;vertical-align:middle;"><a style="margin-left: 4%;" class="image-change">
                        <img src="images/icon-View.png" title="View" class="fa-icon-hover ibtn-Request-Details" data-reqid=`+ item.RequestID +` style="cursor: pointer; width: 24px;" />
                        </a></td>`;


                    htm += `</tr>`;
                    /*    <i class="fa-solid fa-eye"></i>*/

                });
            }
            else 
            {
                htmhead += `<tr>   
                      <th style="display: none">QuotationID</th>
                    <th style="display: none">Status</th>
                  
                    
                        
                                <th>Quotation No</th>
                                <th>EMS Req Number</th>
                                <th>OPT Number</th>
                                <th>PRJ Number</th>
                                <th>Name</th>
                                <th>Customer</th>
                                <th>Salesman</th>
                                <th>Quotation Date</th>
                                 <th>Status</th>
                                <th>view</th>
                    </tr>`;

            

                $.each(RequestDetails, function (key, item) {
                    htm += `<tr>        
                         <td style="text-align:center;display:none;">` + item.QuotationID + `</td>
                        <td style="text-align:center;display:none;">` + item.Status + `</td>
                     
                          <td style="text-align:center;">`+ item.QuotationNo + `</td>
                      <td style="text-align:center;">`+ item.EMSRequestNumber + `</td>
                      <td style="text-align:center;">`+ item.OPTNumber + `</td>
                      <td style="text-align:center;">`+ item.ProjectNumber + `</td>
                      <td style="text-align:center;">`+ item.ProjectName + `</td>
                      <td style="text-align:center;">`+ item.Customer + `</td>
                       <td style="text-align:center;">`+ item.Salesman + `</td>
                       <td style="text-align:center;">`+ item.QuotationDate + `</td>
                       <td style="text-align:center;">`+ item.Status + `</td>
                        <td style="text-align:center;vertical-align:middle;"><a style="margin-left: 4%;" class="image-change">
                        <img src="images/icon-View.png" title="View" class="fa-icon-hover ibtn-Request-Details" data-reqid=`+ item.RequestID +` style="cursor: pointer; width: 24px;" />
                        </a></td>`;


                    htm += `</tr>`;
                    /*    <i class="fa-solid fa-eye"></i>*/

                });
            }
            $('.thead-main-table').html(htmhead);
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
    objDatatable = $('.table-main-table').DataTable({
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
    if ($('#ddlRequestStatus').val() == "Pending") {

        selReqId = $(this).data('reqid');

        if (selAction == "View") {
            GetEMSRequestDetails();
            $('#NewQuotation').modal('show');
        }
    }
    else 
    {
        selReqId = $(this).data('reqid');

        selQuotationID = this.parentNode.parentNode.parentNode.children[0].textContent;

        if (selAction == "View") {
            GetQuotationDetails();
            $('#NewQuotation').modal('show');
        }
    }
    
    
});


function GetEMSRequestDetails() {

    $.ajax({
        url: "Quotation.aspx/GetEMSRequestDetails",
        data: JSON.stringify({ 'UserId': currUserId, 'ReqId': selReqId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {


            $('#txtEstRef').val(result.d[0].RefNo);
            $('#txtOppRef').val(result.d[0].OPTNumber);
            $('#txtProjRef').val(result.d[0].ProjectNumber);

            $('#txtPrjName').val(result.d[0].ProjectName);
            $('#txtPrjLocation').val(result.d[0].Location);
            $('#txtPrjClient').val(result.d[0].Client);
            $('#txtPrjConsultant').val(result.d[0].Consultant);
            $('#txtPrjMainContr').val(result.d[0].MainContractor);
            $('#txtPrjMEPContr').val(result.d[0].MEPContractor);
            $('#txtPrjContactPerson').val(result.d[0].ContactName);
            $('#txtPrjWinningPerc').val(result.d[0].WinPerc);
            $('#txtPrjBudget').val(result.d[0].Budget);
            $('#txtSalesman').val(result.d[0].Salesman);
            $('#txtMarketing').val(result.d[0].Marketing);

            $("input[name=Stage][value='" + result.d[0].Stage + "']").attr('Checked', true);
            $("input[name=Supply][value='" + result.d[0].Scope + "']").attr('Checked', true);
            $("input[name=Quotation][value='" + result.d[0].QuotationType + "']").attr('Checked', true);

            var ProductList =result.d[0].EMSRequestProducts;



            var htm='';
            $.each(ProductList, function (key, item) {

                htm += `<tr>        
                       <td style="text-align:center;display:none;">` + item.ReqID + `</td>
                <td style="text-align:center;">` + item.Product + `</td>
                <td style="text-align:center;">` + item.Remarks + `</td>
                <td style="text-align:center;">` + item.EstimationTeam + `</td>
                <td style="text-align:center;">` + item.EstimationNo + `</td>
                <td style="text-align:center;">` + item.QTStatus + `</td>

                </tr>`;

                
            });
            $(".Quotation").css("display","none");
            $(".div-btn-GenerateQuotation").css("display","");
            $(".tbody-Product-list").html(htm);
            $("#btnItemDetails").prop("disabled", true);
            $("#btnReport").prop("disabled", true);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetQuotationDetails() {

    $.ajax({
        url: "Quotation.aspx/GetQuotaionHeaderData",
        data: JSON.stringify({ 'UserId': currUserId, 'QuotationID': selQuotationID, 'ReqId': selReqId}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtQTNNumber').val(result.d[0].QuotationNo);
            $('#txtDate').val(result.d[0].QuotationDate);
            $('#txtQuotationDesc').val(result.d[0].QuotationDesc);

            $('#txtEstRef').val(result.d[0].RefNo);
            $('#txtOppRef').val(result.d[0].OPTNumber);
            $('#txtProjRef').val(result.d[0].ProjectNumber);

            $('#txtPrjName').val(result.d[0].ProjectName);
            $('#txtPrjLocation').val(result.d[0].Location);
            $('#txtPrjClient').val(result.d[0].Client);
            $('#txtPrjConsultant').val(result.d[0].Consultant);
            $('#txtPrjMainContr').val(result.d[0].MainContractor);
            $('#txtPrjMEPContr').val(result.d[0].MEPContractor);
            $('#txtPrjContactPerson').val(result.d[0].ContactName);
            $('#txtPrjWinningPerc').val(result.d[0].WinPerc);
            $('#txtPrjBudget').val(result.d[0].Budget);
            $('#txtSalesman').val(result.d[0].Salesman);
            $('#txtMarketing').val(result.d[0].Marketing);
            $('#txtTotalAmountview').val(result.d[0].TotalAmount);

            $("input[name=Stage][value='" + result.d[0].Stage + "']").attr('Checked', true);
            $("input[name=Supply][value='" + result.d[0].Scope + "']").attr('Checked', true);
            $("input[name=Quotation][value='" + result.d[0].QuotationType + "']").attr('Checked', true);

            var ProductList =result.d[0].EMSRequestProducts;

            var htm='';
            $.each(ProductList, function (key, item) {

                htm += `<tr>        
                       <td style="text-align:center;display:none;">` + item.ReqID + `</td>
                <td style="text-align:center;">` + item.Product + `</td>
                <td style="text-align:center;">` + item.Remarks + `</td>
                <td style="text-align:center;">` + item.EstimationTeam + `</td>
                <td style="text-align:center;">` + item.EstimationNo + `</td>
                <td style="text-align:center;">` + item.QTStatus + `</td>

                </tr>`;

                
            });
            $(".Quotation").css("display","");
            $(".div-btn-GenerateQuotation").css("display","none");
            
            $(".tbody-Product-list").html(htm);
            $("#btnItemDetails").prop("disabled", false);
            $("#btnReport").prop("disabled", false);
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GenerateQuotation()
{
    var ProductList='';
    $('.tbody-Product-list tr').each(function (key, item) {
        ProductList = ProductList+';'+item.children[1].textContent.trim();
       
    });


    $.ajax({
        url: "Quotation.aspx/GenerateQuotation",
        data: JSON.stringify({ 'UserId': currUserId, 'ReqId': selReqId, 'ProductList': ProductList, 'OPTNumber': $("#txtOppRef").val().trim()}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Quotation Generated Successfully', '');
            selQuotationID=result.d;

            GetQuotationDetails();
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


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
        document.getElementById('myIframe').src="";
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
        data: JSON.stringify({ 'UserId': currUserId, 'QuotationID': selQuotationID }),
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

                                        var ress = listSystemsItems.filter(s => s.Category == itm).filter(s => s.System == item.SysName);
                            
                            $.each(ress, function (key11,catitem) {
                                htm += `<tr style="text-align:center;" id="hidden_row` + key + ` accordian-info" class="hidden_row` + key + ` hidden">`
                                htm += `<td>` + (key11 + 1) + `</td>
                                <td>` + catitem.ItemCode + `</td>
                                <td>`+ catitem.ItemDesc + `</td> 
                                <td>`+ parseInt(catitem.Quantity).toLocaleString("en-US") + `</td> 
                                <td><input class="form-control" type="number" value="`+ parseFloat(catitem.UnitPrice).toString() + `" id="txtUnitPrice-`+catitem.LineID+`"  onchange="UpdateTotalAmount('txtUnitPrice-`+catitem.LineID+`','`+catitem.LineID+`','txtTotalAmount-`+catitem.LineID+`','`+catitem.Quantity+`')" style="text-align:right" /></td> 
                                  <td><input class="form-control" type="text" value="`+ parseFloat(catitem.TotalAmount).toLocaleString("en-US") + `" id="txtTotalAmount-`+catitem.LineID+`"  disabled style="text-align:right"/></td> 
                                    
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

function UpdateTotalAmount(txtUnitprice,QuotationLineID,txtTotalAmount,Quantity)
{
    $.ajax({
        url: "Quotation.aspx/UpdateUnitprice",
        data: JSON.stringify({ 'UserId': currUserId, 'QuotationLineID': QuotationLineID,"UnitPrice":$("#"+txtUnitprice+"").val() , 'QuotationID': selQuotationID}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
        
            
                toastr.success('UnitPrice Updated Successfully', '');

                let UnitPrice=parseFloat($("#"+txtUnitprice+"").val());
                let QTY=parseFloat(Quantity);

                $("#"+txtTotalAmount+"").val(((UnitPrice*QTY).toLocaleString('en-US', { minimumFractionDigits: 2 })).toString());
            
                $("#txtTotalAmountview").val(result.d);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


const toDecimalMark = num => num.toLocaleString('en-US');

//End




$('#btnLoadReport').on('click', function () {

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src="../ERM/Services/QuotationCrystalReport.aspx?oper=0&id="+selQuotationID;
       
        //$(".ajax-loader").fadeOut(500);
    }, 500);

    $(".ajax-loader").fadeOut(21000);
   

  

});
$('#btnDownloadReport').on('click', function () {

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src="../ERM/Services/QuotationCrystalReport.aspx?oper=1&id="+selQuotationID;
       
        //$(".ajax-loader").fadeOut(500);
    }, 500);
    
    $(".ajax-loader").fadeOut(21000);
   

  

});

function UpdateQuotationDate()
{

    $.ajax({
        url: "Quotation.aspx/UpdateQuotationDate",
        data: JSON.stringify({ 'UserId': currUserId, 'QuotationID': selQuotationID,'QuotationDate':$("#txtDate").val()}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
        
            if(result.d)
            {
                toastr.success('Quotation Date Updated Successfully', '');
            }
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function UpdateQuotationDesc()
{

    $.ajax({
        url: "Quotation.aspx/UpdateQuotationDesc",
        data: JSON.stringify({ 'UserId': currUserId, 'QuotationID': selQuotationID,'QuotationDesc':$("#txtQuotationDesc").val()}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
        
            if(result.d)
            {
                toastr.success('Quotation Desc Updated Successfully', '');
            }
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}