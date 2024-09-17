
var selReqId = 0;
var selQuotationID = 0;
var QtnStatus='';
var AssignedTo='-1';

$(document).ready(function () {

    LoadStatus();

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

function LoadStatus()
{
    var htmdrop='';
    if (myroleList.includes("16217")) {
      
        htmdrop += `<option value="Pending" >Pending Request</option>`;
        htmdrop += `<option value="SUBMIT" >Pending For Approval</option>`;
        htmdrop += `<option value="ASSIGNED" >Assigned</option>`;
        htmdrop += `<option value="RELEASED">Released</option>`;
        htmdrop += `<option value="REJECTED">Rejected</option>`;
        htmdrop += `<option value="DRAFT" >DRAFT</option>`;
    
    }
    else if (myroleList.includes("16216")) {
        htmdrop += `<option value="ASSIGNED" >Pending</option>`;
        htmdrop += `<option value="SUBMIT" >Pending For Approval</option>`;
        htmdrop += `<option value="RELEASED">Released</option>`;
        htmdrop += `<option value="REJECTED">Rejected</option>`;
    }
    else 
    {
        htmdrop += `<option value="Pending" >Pending Request</option>`;
        htmdrop += `<option value="SUBMIT" >Pending For Approval</option>`;
        htmdrop += `<option value="ASSIGNED" >Assigned</option>`;
        htmdrop += `<option value="RELEASED">Rejected</option>`;
    
    }

    $('#ddlRequestStatus').html(htmdrop);
}

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
    LoadQTTeamMember();
    
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


            $(".div-btn-GenerateQuotation").css("display","");
            var htm='';
            $.each(ProductList, function (key, item) {

                htm += `<tr>        
                       <td style="text-align:center;display:none;">` + item.ReqID + `</td>
                <td style="text-align:center;">` + item.Product + `</td>
                <td style="text-align:center;">` + item.Remarks + `</td>
                <td style="text-align:center;">` + item.EstimationTeam + `</td>
                <td style="text-align:center;">` + item.EstimationNo + `</td>
                       <td style="text-align:center;">` + item.EstimationStatus + `</td>
                <td style="text-align:center;">` + item.QTStatus + `</td>
                  

                </tr>`;

                if(item.EstimationStatus=="UNDER ESTIMATION")
                {
                    $(".div-btn-GenerateQuotation").css("display","none");
                }
            });
            $(".Quotation").css("display","none");
         
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
            QtnStatus='';
            AssignedTo='';
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
            $('#txtMargineForALLItem').val(result.d[0].OverAllMargin);
            $('#txtDiscountForAllItem').val(result.d[0].OverAllDiscount);
            $('#txtNetAmount').val(result.d[0].NetAmount);
            $('#txtSupply').val(result.d[0].SupplyAmount);

            QtnStatus=result.d[0].Status;
            AssignedTo=result.d[0].AssignedTo;
            $("#ddlAssignedQT option:selected").val(result.d[0].AssignedTo);

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
                     <td style="text-align:center;">` + item.EstimationStatus + `</td>
                <td style="text-align:center;">` + item.QTStatus + `</td>

                </tr>`;

                
            });
            $(".Quotation").css("display","");
            $(".div-btn-GenerateQuotation").css("display","none");
            
            $(".tbody-Product-list").html(htm);
            $("#btnItemDetails").prop("disabled", false);
            $("#btnReport").prop("disabled", false);


            $(".dvAssign").css("display","none");
            $("#ddlAssignedQT").prop("disabled", true);
            $(".btn-Submit").addClass('hidden');
            $(".btn-Reject").addClass('hidden');
            $(".btn-Release").addClass('hidden');
            $(".qtnfiled").prop("disabled", false);
            $(".qtnDiscountField").prop("disabled", true);

            if(result.d[0].Status=='DRAFT')
            {
                $(".dvAssign").css("display","");
                $("#ddlAssignedQT").prop("disabled", false);

            }
            else if(result.d[0].Status=="REJECTED" && AssignedTo==currUserId)
            {
                $(".btn-Submit").removeClass('hidden');
            }
            else if(result.d[0].Status=="ASSIGNED" && AssignedTo==currUserId)
            {
                $(".btn-Submit").removeClass('hidden');
            }
            else if(result.d[0].Status=="SUBMIT" && myroleList.includes("16217"))
            {
                $(".btn-Reject").removeClass('hidden');
                $(".btn-Release").removeClass('hidden');
                $(".qtnDiscountField").prop("disabled", false);
            }
            else if(result.d[0].Status=="ASSIGNED" && myroleList.includes("16217"))
            {
                $(".qtnfiled").prop("disabled", false);
                $(".qtnDiscountField").prop("disabled", false);
            }

            else 
            {
                $(".qtnfiled").prop("disabled", true);
            }
            
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
            LoadQTTeamMember();
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
        CheckFields();
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
            var htm='';
            var listSystems = result.d.listSystems;
            var listSystemsItems = result.d.listItems;
            //var listAlternateItems = result.d.listAlternateItems;

            var firstSysName = listSystems.length > 0 ? listSystems[0].SysName : '';
            var AllCategoryForSys = [];


            //listOpp = result.d.listOpp;
            //listRev = result.d.listRev;

             htm = '<tr style="text-align:center;"><td colspan=6> No Data Available</td> </tr>';

            if (listSystemsItems.length != 0) {
                htm = '';
                $.each(listSystems, function (key, item) {
                    //let rev = listRev.filter(xx => xx.OppId == item.OppId);
                    AllCategoryForSys = listSystemsItems.filter(x => x.System == item.SysName).map(ss => ss.Category).filter((value, index, self) => self.indexOf(value) === index);
                    if (AllCategoryForSys.length > 0) {

                        htm += `<tr onclick="showHideRow('hidden_row` + key + `','tbody-itemDetails');"> 
                    <td style="text-align: left;cursor: pointer;">  <span><h5>`+(key+1)+`. `+ item.SysName + `</h6></span> </td>`                 
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
                            htm += `<tr class="hidden_row` + key + ` showrow hidden"><td colspan="7">` + itm + `</td> </tr>`
                            //if (key1==0) {
                                htm += `<tr class="hidden_row` + key + ` showrow hidden">
                                        <td colspan="6">
                                        <table style="width:100%;">
                                        <tr class="hidden_row` + key + ` sub-tabl-bg" style="text-align:center;"> <td>S.No</td> <td style="width:100px">Item Code</td> <td style="width: 750px;">Item Desc</td> <td>QTY</td> <td>UOM</td> <td>Unit Price</td> <td>Margin %</td> <td>Discount %</td>  <td>Unit Selling Price</td>   <td>Total</td> </tr>`;
                          //  }          

                                        var ress = listSystemsItems.filter(s => s.Category == itm).filter(s => s.System == item.SysName);
                            
                            $.each(ress, function (key11,catitem) {
                                htm += `<tr style="text-align:center;background: white;" id="hidden_row` + key + ` accordian-info" class="hidden_row` + key + ` showrow hidden">`
                                htm += `<td>` + (key11 + 1) + `</td>
                                <td>` + catitem.ItemCode + `</td>
                                <td>`+ catitem.ItemDesc + `</td> 
                                <td>`+ parseInt(catitem.Quantity).toLocaleString("en-US") + `</td> 
                                <td>`+ catitem.UOM + `</td> 
                                <td><input class="form-control qtnfiled" type="number" value="`+ parseFloat(catitem.UnitPrice).toString() + `" id="txtUnitPrice-`+catitem.LineID+`"  onchange="UpdateTotalAmount('`+catitem.LineID+`','`+catitem.Quantity+`')" style="text-align:right" /></td> 
                                <td><input class="form-control qtnfiled" type="text" value="`+ parseFloat(catitem.Margine).toLocaleString("en-US") + `" id="txtMargine-`+catitem.LineID+`"  onchange="UpdateTotalAmount('`+catitem.LineID+`','`+catitem.Quantity+`')"  style="text-align:right"/></td> 
                                <td><input class="form-control qtnfiled qtnDiscountField" type="text" value="`+ parseFloat(catitem.Discount).toLocaleString("en-US") + `" id="txtDiscount-`+catitem.LineID+`"  onchange="UpdateTotalAmount('`+catitem.LineID+`','`+catitem.Quantity+`')"  style="text-align:right"/></td> 
                                <td><input class="form-control" type="text" value="`+ parseFloat(catitem.UnitSellingPrice).toLocaleString("en-US") + `" id="txtUnitSellingPrice-`+catitem.LineID+`"  disabled style="text-align:right"/></td> 
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

function UpdateTotalAmount(QuotationLineID,Quantity)
{
    $.ajax({
        url: "Quotation.aspx/UpdateUnitprice",
        data: JSON.stringify({ 'UserId': currUserId
                ,'QuotationLineID': QuotationLineID
                ,'UnitPrice':$("#txtUnitPrice-"+QuotationLineID).val()  
                ,'QuotationID': selQuotationID
                ,'Margine': $("#txtMargine-"+QuotationLineID).val()
                ,'Discount': $("#txtDiscount-"+QuotationLineID).val()
        
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
        
            
                toastr.success('UnitPrice Updated Successfully', '');

                let UnitPrice=parseFloat($("#txtUnitPrice-"+QuotationLineID).val());

                let QTY=parseFloat(Quantity);
                let Margine=parseFloat($("#txtMargine-"+QuotationLineID).val());
                let Discount=parseFloat($("#txtDiscount-"+QuotationLineID).val());

                let SellingUnitPrice=UnitPrice+(UnitPrice*Margine/100)-(UnitPrice*Discount/100);

                $("#txtUnitSellingPrice-"+QuotationLineID).val(SellingUnitPrice.toLocaleString('en-US', { minimumFractionDigits: 2 }).toString());

                $("#txtTotalAmount-"+QuotationLineID).val(((SellingUnitPrice*QTY).toLocaleString('en-US', { minimumFractionDigits: 2 })).toString());
            
                $('#txtTotalAmountview').val(result.d[0].TotalAmount);
                $('#txtMargineForALLItem').val(result.d[0].OverAllMargin);
                $('#txtDiscountForAllItem').val(result.d[0].OverAllDiscount);
                $('#txtNetAmount').val(result.d[0].NetAmount);
                $('#txtSupply').val(result.d[0].SupplyAmount);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


function UpdateMargineAndDiscountOverAll()
{
    $.ajax({
        url: "Quotation.aspx/UpdateMarginAndDiscountOverAll",
        data: JSON.stringify({ 'UserId': currUserId  
                ,'QuotationID': selQuotationID
                ,'OverAllMargin': $("#txtMargineForALLItem").val()
                ,'OverAllDiscount': $("#txtDiscountForAllItem").val()
        
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
        
            loadQuotItemsDets();
            toastr.success('UnitPrice Updated Successfully', '');
            $('#txtTotalAmountview').val(result.d[0].TotalAmount);
            $('#txtMargineForALLItem').val(result.d[0].OverAllMargin);
            $('#txtDiscountForAllItem').val(result.d[0].OverAllDiscount);
            $('#txtNetAmount').val(result.d[0].NetAmount);
            $('#txtSupply').val(result.d[0].SupplyAmount);
            $(".showrow").removeClass('hidden');

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

$('.btn-MoreInfo').on('click', function () {


    $.ajax({
        url: "Quotation.aspx/GetQuotationMoreInfo",
        data: JSON.stringify({ 'UserId': currUserId  
                ,'QuotationID': selQuotationID
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtMethodOfPayment').val(result.d[0].MothodOfPayment);
            $('#txtValidity').val(result.d[0].Validity);
            $('#txtMoreInfo').val(result.d[0].MoreInfo);

            CheckFields();
          
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

    $('#MoreInfoModal').modal('show');
  
});


$('#btnSaveMoreInfo').on('click', function () {

    $.ajax({
        url: "Quotation.aspx/UpdateQuotationMoreInfo",
        data: JSON.stringify({ 'UserId': currUserId  
                ,'QuotationID': selQuotationID
                ,'MothodOfPayment': $("#txtMethodOfPayment").val()
                ,'Validity': $("#txtValidity").val()
                ,'MoreInfo': $("#txtMoreInfo").val()
        
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
        
            toastr.success('Updated Successfully', '');
            $('#txtMethodOfPayment').val(result.d[0].MothodOfPayment);
            $('#txtValidity').val(result.d[0].Validity);
            $('#txtMoreInfo').val(result.d[0].MoreInfo);
          
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

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



$('#btnDownlodTechNote').on('click', function () {

    $.ajax({
        url: "Quotation.aspx/GetTechnicalNote",
        data: JSON.stringify({ 'UserId': currUserId, 'QuotationID': selQuotationID}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
        
            window.open('Services/DownloadFile.ashx?attachurl=' + result.d); 

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

  

});



function LoadQTTeamMember() {

    $.ajax({
        url: "Quotation.aspx/LoadQTTeamMember",
        data: JSON.stringify({ "ReqID": selReqId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlAssignedQT').html(htm);
            $('#ddlAssignedQT').val(AssignedTo);
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}




function AssignedToTeam()
{

    $.ajax({
        url: "Quotation.aspx/AssignedToTeam",
        data: JSON.stringify({ 'UserId': currUserId, 'QuotationID': selQuotationID,'AssignedToEmpNo':$("#ddlAssignedQT").val()}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
        
            if(result.d)
            {
                toastr.success('Quotation Assigned Updated Successfully', '');
            }
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function ChangeStatus(str)
{
    $.ajax({
        url: "Quotation.aspx/UpdateStatus",
        data: JSON.stringify({ 'UserId': currUserId, 'QuotationID': selQuotationID,'Status':str}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
        
            if(result.d)
            {
                GetQuotationDetails();
                toastr.success('Quotation '+str+'  Successfully', '');
            }
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function CheckFields(){

    $(".qtnfiled").prop("disabled", true);
    $(".qtnDiscountField").prop("disabled", true);
    $("#btnSaveMoreInfo").css("display","none");
    if(QtnStatus=='DRAFT')
    {
        $(".qtnfiled").prop("disabled", false);
        $(".qtnDiscountField").prop("disabled", true);
        $("#btnSaveMoreInfo").css("display","");
    }
    else if(QtnStatus=="REJECTED" && AssignedTo==currUserId)
    {
        $(".qtnfiled").prop("disabled", false);
        $(".qtnDiscountField").prop("disabled", true);
        $("#btnSaveMoreInfo").css("display","");
    }
    else if(QtnStatus=="ASSIGNED" && AssignedTo==currUserId)
    {
        $(".qtnfiled").prop("disabled", false);
        $(".qtnDiscountField").prop("disabled", true);
        $("#btnSaveMoreInfo").css("display","");
    }
    else if(QtnStatus=="SUBMIT" && myroleList.includes("16217"))
    {
        $(".qtnfiled").prop("disabled", false);
        $(".qtnDiscountField").prop("disabled", false);
        $("#btnSaveMoreInfo").css("display","");

    }
    else if(QtnStatus=="ASSIGNED" && myroleList.includes("16217"))
    {
        $(".qtnfiled").prop("disabled", false);
        $(".qtnDiscountField").prop("disabled", false);
        $("#btnSaveMoreInfo").css("display","");
    }
    else 
    {
        $(".qtnfiled").prop("disabled", true);
    
    }

}


$('#btnDownloadBOQ').on('click', function () {

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src="../ERM/Services/QuotationCrystalReport.aspx?oper=2&id="+selQuotationID;
       
        //$(".ajax-loader").fadeOut(500);
    }, 500);
    
    $(".ajax-loader").fadeOut(21000);
   

  

});

$('#btnBOQWithoutPrice').on('click', function () {

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src="../ERM/Services/QuotationCrystalReport.aspx?oper=3&id="+selQuotationID;
       
        //$(".ajax-loader").fadeOut(500);
    }, 500);
    
    $(".ajax-loader").fadeOut(21000);
   

  

});


$('#btnAddNewItem').on('click', function () {
  
    getAllSystem('');
    getCategoryBySystem($('#ddlSystem option:selected').val(),'');
   
    $('#addUpdateSystemnItems').modal('show');
});



function getAllSystem() {

    $.ajax({
        url: "EMSItemList.aspx/GetAllSystems",
        type: "POST",
        data: JSON.stringify({ "UserId": currUserId}),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {               
                htm += '<option value="' + item.Value + '" >' + item.Text + ' </option>'
            });
            $('#ddlCategory').html(htm);
            getCategoryBySystem();
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
        //data: JSON.stringify({ "SysName": $('#ddlSystem option:selected').val() }),
        data: JSON.stringify({ "SysName": $("#ddlCategory").val(),"UserId":currUserId }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.Value + '" >' + item.Text + ' </option>'
            });

        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
    
}
