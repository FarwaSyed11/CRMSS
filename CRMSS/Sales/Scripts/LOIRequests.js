
var SelCustomerId;
var objCustomerList = [];
var objOPTList = [];
var objRevList = [];
var SelOPT;
var selListItems = "";
var ReqNumber = "";
var ReqType = "";
var ISURLFROMMENU = ''

$(document).ready(function () {
    LoadCompanyDDL();
    ISURLFROMMENU = window.location.search;
    if (ISURLFROMMENU != '') {
        ISURLFROMMENU = (window.location.search.split('?')[1].trim()).split('&')[0].split('=')[1];
        var htmdt = '';

        var htmdrop = '';

        if (ISURLFROMMENU == "SO") {
            htmdt += `<option value="SO">SO</option>`
            ReqType = "SO";
            $('#RequestHeader').html("SO REQUEST");

            $("#txtDocumentNo").css("display", "none");
            $("#txtDocumentDate").css("display", "none");
            $(".divLoidata").css("display", "none");
            if (myroleList.includes("8135")) {

                $(".AddnewRquests").css("display", "block");
                htmdrop += `<option value="ALL" >ALL</option>`;
                htmdrop += `<option value="DRAFT" >DRAFT</option>`;
                htmdrop += `<option value="SUBMIT" >PENDING FROM CRM</option>`;
                htmdrop += `<option value="APPROVED BY CRM" >PENDING FROM QT</option>`;
                htmdrop += `<option value="APPROVED BY QT" >PENDING FROM DT</option>`;
                htmdrop += `<option value="APPROVED BY DT">APPROVED</option>`;
                htmdrop += `<option value="REJECTED" >REJECTED</option>`;
            }
            else if (myroleList.includes("2066")) {

                $(".AddnewRquests").css("display", "none");
                htmdrop += `<option value="ALL" >ALL</option>`;
                htmdrop += `<option value="DRAFT" >DRAFT</option>`;
                htmdrop += `<option value="SUBMIT" >PENDING FROM CRM</option>`;
                htmdrop += `<option value="APPROVED BY CRM" >PENDING FROM QT</option>`;
                htmdrop += `<option value="APPROVED BY QT" >PENDING FROM DT</option>`;
                htmdrop += `<option value="APPROVED BY DT">APPROVED</option>`;
                htmdrop += `<option value="REJECTED" >REJECTED</option>`;
            }
            else

                if (myroleList.includes("8106")) {

                $(".AddnewRquests").css("display", "none");
                htmdrop += `<option value="APPROVED BY CRM" >PENDING</option>`;
                htmdrop += `<option value="APPROVED BY QT" >APPROVED</option>`;
                htmdrop += `<option value="REJECTED BY QT" >REJECTED</option>`;
            }
            //else if (myroleList.includes("8107")) {
            //    $(".AddnewRquests").css("display", "none");
            //    htmdrop += `<option value="APPROVED BY QT" >PENDING</option>`;
            //    htmdrop += `<option value="APPROVED BY FT" >APPROVED</option>`;
            //    htmdrop += `<option value="REJECTED BY FT" >REJECTED</option>`;

            //}
            //else if (myroleList.includes("8108")) {
            //    $(".AddnewRquests").css("display", "none");
            //    htmdrop += `<option value="APPROVED BY FT" >PENDING</option>`;
            //    htmdrop += `<option value="APPROVED BY DT" >APPROVED</option>`;
            //    htmdrop += `<option value="REJECTED BY DT" >REJECTED</option>`;

            //}
            else if (myroleList.includes("8108")) {
                $(".AddnewRquests").css("display", "none");
                htmdrop += `<option value="APPROVED BY QT" >PENDING</option>`;
                htmdrop += `<option value="APPROVED BY DT" >APPROVED</option>`;
                htmdrop += `<option value="REJECTED BY DT" >REJECTED</option>`;

            }
            else {
                $(".AddnewRquests").css("display", "block");
                htmdrop += `<option value="ALL" >ALL</option>`;
                htmdrop += `<option value="DRAFT" >DRAFT</option>`;
                htmdrop += `<option value="SUBMIT" >PENDING FROM CRM</option>`;
                htmdrop += `<option value="APPROVED BY CRM" >PENDING FROM QT</option>`;
                htmdrop += `<option value="APPROVED BY QT" >PENDING FROM DT</option>`;
                htmdrop += `<option value="APPROVED BY DT">APPROVED</option>`;
                htmdrop += `<option value="REJECTED" >REJECTED</option>`;
            }

        }
        else {
            htmdt += `<option value="LOI" >LOI</option>`;
            htmdt += `<option value="LPO" >LPO</option>`;
            htmdt += `<option value="CONTRACT" >CONTRACT</option>`;
            ReqType = "LOI";
            $('#RequestHeader').html("LOI REQUEST");
            $("#txtDocumentNo").css("display", "block");
            $("#txtDocumentDate").css("display", "block");
            $(".divLoidata").css("display", "block");

            if (myroleList.includes("2066")) {

                $(".AddnewRquests").css("display", "none");
                htmdrop += `<option value="ALL" >ALL</option>`;
                htmdrop += `<option value="DRAFT" >DRAFT</option>`;
                htmdrop += `<option value="SUBMIT" >PENDING FROM QT</option>`;
                htmdrop += `<option value="APPROVED BY QT" >PENDING FROM CRM</option>`;
                htmdrop += `<option value="APPROVED BY CRM" >APPROVED</option>`;
                htmdrop += `<option value="REJECTED" >REJECTED</option>`;
            }
            else
                if (myroleList.includes("8135")) {

                    $(".AddnewRquests").css("display", "block");
                    htmdrop += `<option value="ALL" >ALL</option>`;
                    htmdrop += `<option value="DRAFT" >DRAFT</option>`;
                    htmdrop += `<option value="SUBMIT" >PENDING FROM QT</option>`;
                    htmdrop += `<option value="APPROVED BY QT" >PENDING FROM CRM</option>`;
                    htmdrop += `<option value="APPROVED BY CRM" >APPROVED</option>`;
                    htmdrop += `<option value="REJECTED" >REJECTED</option>`;
                }

            else
                if (myroleList.includes("8106")) {

                $(".AddnewRquests").css("display", "none");
                htmdrop += `<option value="SUBMIT" >PENDING</option>`;
                htmdrop += `<option value="APPROVED BY QT" >APPROVED</option>`;
                htmdrop += `<option value="REJECTED BY QT" >REJECTED</option>`;
            }
            else if (myroleList.includes("8107")) {
                $(".AddnewRquests").css("display", "none");
                htmdrop += `<option value="APPROVED BY QT" >PENDING</option>`;
                htmdrop += `<option value="APPROVED BY FT" >APPROVED</option>`;
                htmdrop += `<option value="REJECTED BY FT" >REJECTED</option>`;

            }
            else if (myroleList.includes("8108")) {
                $(".AddnewRquests").css("display", "none");
                htmdrop += `<option value="APPROVED BY FT" >PENDING</option>`;
                htmdrop += `<option value="APPROVED BY DT" >APPROVED</option>`;
                htmdrop += `<option value="REJECTED BY DT" >REJECTED</option>`;

            }
            else {
                $(".AddnewRquests").css("display", "block");
                htmdrop += `<option value="ALL" >ALL</option>`;
                htmdrop += `<option value="DRAFT" >DRAFT</option>`;
                htmdrop += `<option value="SUBMIT" >PENDING FROM QT</option>`;
                htmdrop += `<option value="APPROVED BY QT" >PENDING FROM CRM</option>`;
                htmdrop += `<option value="APPROVED BY CRM" >APPROVED</option>`;
                htmdrop += `<option value="REJECTED" >REJECTED</option>`;



            }


        }
        $('#ddlDocumentType').html(htmdt);

    } else {

        
    }
  
    
        //$(".ajax-loader").fadeOut(500);
   
    $('#ddlStatus').html(htmdrop);
    LoadRequestedList();

});
function LoadCompanyDDL() {
    debugger;
    $.ajax({
        url: "LOIRequests.aspx/GetCompanyDDL",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            htm += `<option value="-1" >ALL</option>`;
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlCompany').html(htm);
            
         
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function LoadSOTeamOrg() {
    debugger;
    $.ajax({
        url: "LOIRequests.aspx/LoadSOTeamOrg",
        data: JSON.stringify({ "OPTNumber": $("#txtOPTNumber").val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
         
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlSoTeam').html(htm);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function LoadRequestedList() {
        debugger;
    $.ajax({
        url: "LOIRequests.aspx/RequestedList",
        data: JSON.stringify({ "UserID": currUserId, "Status": $('#ddlStatus').val(), "ReqType": ReqType, "company": $('#ddlCompany option:selected').val().trim()  }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $('.tbody-RequestedList td').length > 0 ? objDatatable.destroy() : '';
            $(".ajax-loader").fadeOut(500);
            $.each(result.d, function (key, item) {
                
               
                htm += `<tr>        
               
                 <td>`+ item.ReqNumber + `</td>
           
                  <td>`+ item.OPTNumber + `</td>  
                  <td>`+ item.Name + `</td>  
                  <td>`+ item.MEPContractor + `</td>  
                  <td>`+ item.Owner + `</td>
                  <td>`+ item.MEPConsultant + `</td>      
                  <td>`+ item.Marketing + `</td>      
                   <td>`+ item.FinalizedValue + `</td>`
                if (item.Status == "SUBMIT") {
                    htm += ` 
                   <td><a class="badge bg-label-info me-1">`+ item.Status + `</td>`;
                }
                else if (item.Status == "APPROVED BY QT") {
                    htm += ` 
                   <td><a class="badge bg-label-gray me-1">`+ item.Status + `</td>`;
                }
                else if (item.Status == "APPROVED BY DT") {
                    htm += ` 
                   <td><a class="badge bg-label-success me-1">`+ item.Status + `</td>`;
                }
                else if (item.Status == "APPROVED BY CRM" && ReqType=="LOI") {
                    htm += ` 
                   <td><a class="badge bg-label-success me-1">`+ item.Status + `</td>`;
                }
                else if (item.Status.includes("REJECT")) {
                    htm += ` 
                   <td><a class="badge bg-label-danger me-1">`+ item.Status + `</td>`;
                }
                else {
                    htm += ` 
                   <td><a class="badge bg-label-gray me-1">`+ item.Status + `</td>`;
                }
                
                htm += `<td style="text-align:center"><span style = "margin-left: 10%;" > <i class="fa fa-eye ViewRequestData" title="CreateAccount" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>
               &nbsp;&nbsp;
               <a href="#" onclick="ReqHistory(`+ item.ReqNumber +`)"><i class="fa fa-history" title="History" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></a>
               <a style = "margin-left: 10%;"  href="#" onclick="ApprovalStatus(`+ item.ReqNumber +`)"><i class="fa fa-location-arrow" title="ApprovalStatus" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></a>                      

                        </td>`

                htm += `</tr>`;

            });

            $('.tbody-RequestedList').html(htm);
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

function ReqHistory(Id) {
    ReqNumber = Id;
    RequestHistory();
    $('#ModalHistory').modal('show');

}
function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.kpi-user-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[0, 'desc']]
    });
}

$('.AddnewRquests').on('click', function () {
    $('.ajax-loader').fadeIn(100);
    $('.Customer-List td').length > 0 ? objCustomerList.destroy() : '';

    $.ajax({
        url: "LOIRequests.aspx/GetMyCustomerList",
        data: JSON.stringify({
            "UserId": currUserId

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            $.each(result.d, function (key, item) {
                htm += `<tr>        
               
                 <td class="hidden">`+ item.CRMAccountId + `</td>
                 <td style="text-align:left">`+ item.AccountName + `</td>      
                  <td style="text-align:center">`+ item.OwnerName + `</td>  
                  <td style="text-align:center">`+ item.Phone + `</td>  
                  <td style="text-align:center">`+ item.Email + `</td>   

                                 <td style="text-align:center">`+ item.URL + `</td>      
                  <td style="text-align:center">`+ item.Country + `</td>  
                    `;

                htm += `</tr>`;


            });
            $('.tbody-CutomerList').html(htm);

            initiateDataTableForCustomerList();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


    $('#mpSearchCustomer').modal('show');

});
function initiateDataTableForCustomerList() {
    objCustomerList = [];
    objCustomerList = $('.Customer-List').DataTable({
       
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[0, 'desc']]
    });
}

$('.tbody-CutomerList').on('click', 'tr', function () {
    let Id = this.children[0].textContent;
   
    SelCustomerId = Id
    $('.OPT-List td').length > 0 ? objOPTList.destroy() : '';

    $.ajax({
        url: "LOIRequests.aspx/GetOPTList",
        data: JSON.stringify({
            "UserId": currUserId,
            "CustomerID": Id,

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            $.each(result.d, function (key, item) {
                htm += `<tr>        
               
                 <td class="hidden">`+ item.OPTID + `</td>
                 <td style="text-align:center">`+ item.OPTNumber + `</td>      
                  <td style="text-align:left">`+ item.Name + `</td>  
                  <td style="text-align:center">`+ item.Owner + `</td>  
                  <td style="text-align:center">`+ item.Country + `</td>   

                                 <td style="text-align:center">`+ item.Stage + `</td>      
                  <td style="text-align:center">`+ item.Status + `</td>  
                    `;

                htm += `</tr>`;


            });
            $('.tbody-OPTLIST').html(htm);

            initiateDataTableForOPTList();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


    $('#mpSearchOPT').modal('show');
});
function initiateDataTableForOPTList() {
    objOPTList = [];
    objOPTList = $('.OPT-List').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[0, 'desc']]
    });
}

$('.tbody-OPTLIST').on('click', 'tr', function () {
    let Id = this.children[0].textContent;
    SelOPT = this.children[1].textContent;
    $('.Revenue-List td').length > 0 ? objRevList.destroy() : '';

    $.ajax({
        url: "LOIRequests.aspx/GetREVList",
        data: JSON.stringify({
            "UserId": currUserId,
            "OPTID": Id,

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            $.each(result.d, function (key, item) {
                htm += `<tr>        
               
                 <td class="hidden">`+ item.RevId + `</td>
                 <td style="text-align:center">`+ item.ProductType + `</td>      
                  <td style="text-align:left">`+ item.VLStatus + `</td>  
                  <td style="text-align:center">`+ item.SubStage + `</td>  
                  <td style="text-align:center">`+ item.RevenueAmount + `</td>   
                    <td style="text-align:center">
                     <div class="form-check">
                         <input style="float: none;" class="form-check-input cbSelItemclass" type="checkbox" name="cbSelItem" value="" id="defaultCheck-`+ key + `"  />
                           
                     </div>
                    
                </td> 
                    `;

                htm += `</tr>`;


            });
            $('.tbody-RevenueList').html(htm);

            initiateDataTableForRevenueList();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    selListItems = "";

    $('#mpRevenueList').modal('show');
   

});

function initiateDataTableForRevenueList() {
    objRevList = [];
    objRevList = $('.Revenue-List').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[0, 'desc']]
    });
}

$('#CreateRequest').on('click', function () {

    if ($('#cbLumpsumAmount').is(':checked')) {
        $("#txtFinalizedAmount").removeAttr("disabled");

    }
    else {
        $("#txtFinalizedAmount").attr("disabled", "disabled");

    }

    if (selListItems == "") {
        toastr.error("Please Select Product For LOI")
    }
    else {

        SaveLOIRequest();
        GetTheAccess(ReqNumber);

        LoadSOTeamOrg();
        $('#mpSearchCustomer').modal('hide');
        $('#mpSearchOPT').modal('hide');
        $('#mpRevenueList').modal('hide');
        $('#mpLOIrequest').modal('show');

    }

});

function SaveLOIRequest() {

    $.ajax({
        url: "LOIRequests.aspx/SaveRequestData",
        data: JSON.stringify({
            "UserId": currUserId,
            "OPTNumber": SelOPT,
            "Products": selListItems,
            "ReqType": ReqType,

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);
            var cbLumpsumAmount = document.getElementById('cbLumpsumAmount');
            $.each(result.d[0].OpportunityDetails, function (key, item) {
                
                $('#txtOPTNumber').val(item.OPTNumber);
                $('#txtOPTName').val(item.Name);
                $('#txtClient').val(item.Client);
                $('#txtCustomer').val(item.Customer);
                $('#txtOwner').val(item.Owner);
                $('#txtConsultant').val(item.Consultant);
                $('#txtFinalizedAmount').val(item.FinalizedValue);
                cbLumpsumAmount.checked = (item.LumpSum == "True" ? true : false);
                $('#ddlDocumentType').val(item.DocumentType);

                $('#txtDocumentNo').val(item.DocumentNumber);
                $('#txtDocumentDate').val(item.DocumentDate);
                

            });
            $.each(result.d[0].Products, function (key, item) {
                ReqNumber = item.RequestNumber;
                txtFinalValue = 'Phone-' + item.RevId.trim();
                htm += `<tr>        
               
                 <td class="hidden">`+ item.RequestNumber + `</td>
                 <td  class="hidden" style="text-align:center">`+ item.RevId + `</td>      
                  <td style="text-align:left">`+ item.ProductType + `</td>  
                  <td style="text-align:left">`+ item.SubStage + `</td>  
                  <td style="text-align:center">`+ parseInt(item.RevenueAmount.toString().replaceAll(',', '')).toLocaleString("en-US") + `</td>  
                  <td style="text-align:center"> <input class="RevFinalizationValue form-control" onfocus="Focus(this.id,'0.00')" onblur="Blur(this.id,'0.00')" type="text" id=`+ txtFinalValue + ` value="` + item.FinalizedValue + `"></input></td>   
                     <td class="solnumber" style="text-align:center"> <input class="RevSoNumber form-control"  type="text" id=`+ txtSoNumber + ` value="` + item.SONumber + `"></input></td>   
                    `;

                htm += `</tr>`;

            });
            $('.tbody-revenue').html(htm);
            if (ReqType == "SO" && (myroleList.includes("8108"))) {
                $(".solnumber").css("display", "block");
                $(".bIsReqLeveldiv").css("display", "block");
                $("#txtSoReqLevel").css("display", "block");
            }

            else {
                $(".solnumber").css("display", "none");
                $(".bIsReqLeveldiv").css("display", "none");
                $("#txtSoReqLevel").css("display", "none");
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

$('.tbody-RevenueList').on('click','.cbSelItemclass', function () {

    if ($('#' + this.id).is(':checked')) {
        selListItems = selListItems + this.parentNode.parentNode.parentNode.children[0].textContent + ",";
    } 

});

$('.cbLumpSumClass').on('click', function () {

    if ($('#cbLumpsumAmount').is(':checked')) {
        $("#txtFinalizedAmount").removeAttr("disabled"); 
        $('.RevFinalizationValue').attr("disabled", "true");
      
    }
    else {
        $("#txtFinalizedAmount").attr("disabled", "disabled"); 
        $(".RevFinalizationValue").removeAttr("disabled"); 
     
    }

    

});


$('.cbIsReqLevel').on('click', function () {

    if ($('#cbIsReqLevelId').is(':checked')) {
        $("#txtSoReqLevel").removeAttr("disabled");
        $('.RevSoNumber').attr("disabled", "true");

    }
    else {
        $("#txtSoReqLevel").attr("disabled", "disabled");
        $(".RevSoNumber").removeAttr("disabled");

    }



});

function Focus(objname, waterMarkText) {
    obj = document.getElementById(objname);
    if (obj.value == waterMarkText) {
        obj.value = "";
        obj.className = "RevFinalizationValue NormalTextBox form-control";
    }
}
function Blur(objname, waterMarkText) {
    obj = document.getElementById(objname);
    if (obj.value == "") {
        obj.value = waterMarkText;
        obj.className = "RevFinalizationValue WaterMarkedTextBox form-control";
    }
    else {
        obj.className = "RevFinalizationValue NormalTextBox form-control";
    }

}
$('#btnSaveFinalizedValue').on('click', function () {

    
    if ($("#txtDocumentDate").val() == "" && ReqType == "LOI") {
        toastr.error("Please Enter The Document Date");
    }
    else if ($("#txtDocumentNo").val() == "" && ReqType == "LOI") {
        toastr.error("Please Enter The Document Number");
    }
    else if ($('#cbLumpsumAmount').is(':checked')) {
        if (parseInt($("#txtFinalizedAmount").val()) == 0) {
            toastr.error("Please Enter The Finalized Value");


        }

        else {
            SaveFinalizedValueHeaderLevel(ReqNumber, $("#txtFinalizedAmount").val(), $('#cbLumpsumAmount').is(':checked'), $("#ddlDocumentType").val(), $("#txtDocumentNo").val(), $("#txtDocumentDate").val(), $("#ddlSoTeam").val())
        }

    }

    else {

        for (var i = 0; i < $('.tbody-revenue tr').length; i++) {

            let txtRowId = '#' + $('.tbody-revenue tr')[i].children[5].children[0].id.trim();
            let txtvalue = $(txtRowId).val();
            if (parseInt(txtvalue) == 0) {
                toastr.error("Please Enter The Finalized Value");
                return false;
            }

        }

        SaveFinalizedValueHeaderLevel(ReqNumber, $("#txtFinalizedAmount").val(), $('#cbLumpsumAmount').is(':checked'), $("#ddlDocumentType").val(), $("#txtDocumentNo").val(), $("#txtDocumentDate").val(), $("#ddlSoTeam").val())
    }
});

$('#btnSubmitFinalizedValue').on('click', function () {



        if ($('#cbLumpsumAmount').is(':checked')) {
        if (parseInt($("#txtFinalizedAmount").val()) ==0) {
            toastr.error("Please Enter The Finalized Value");
            return false;
            }
            if ($("#txtDocumentDate").val() == "" && ReqType == "LOI") {
                toastr.error("Please Enter The Document Date");
                return false;
            }
            else if ($("#txtDocumentNo").val() == "" && ReqType == "LOI") {
                toastr.error("Please Enter The Document Number");
                return false;
            }


            SaveFinalizedValueHeaderLevel(ReqNumber, $("#txtFinalizedAmount").val(), $('#cbLumpsumAmount').is(':checked'), $("#ddlDocumentType").val(), $("#txtDocumentNo").val(), $("#txtDocumentDate").val(), $("#ddlSoTeam").val())
        UpdateTheStatus(ReqNumber, 'SUBMIT');
        GetTheAccess(ReqNumber);
        $('#mpLOIrequest').modal('hide');
        objDatatable.destroy();
        $('.ajax-loader').fadeIn(100);
        LoadRequestedList('Please wait...');
    }

    else {
            if ($("#txtDocumentDate").val() == "" && ReqType == "LOI") {
                toastr.error("Please Enter The Document Date");
                return false;
            }
            else if ($("#txtDocumentNo").val() == "" && ReqType == "LOI") {
                toastr.error("Please Enter The Document Number");
                return false;
            }
        for (var i = 0; i < $('.tbody-revenue tr').length; i++) {

            let txtRowId = '#' + $('.tbody-revenue tr')[i].children[5].children[0].id.trim();
            let txtvalue = $(txtRowId).val();
            if (parseInt(txtvalue) == 0) {
                toastr.error("Please Enter The Finalized Value");
                return false;
            }

        }

            SaveFinalizedValueHeaderLevel(ReqNumber, $("#txtFinalizedAmount").val(), $('#cbLumpsumAmount').is(':checked'), $("#ddlDocumentType").val(), $("#txtDocumentNo").val(), $("#txtDocumentDate").val(),$("#ddlSoTeam").val())
        UpdateTheStatus(ReqNumber, 'SUBMIT');
        GetTheAccess(ReqNumber);
        $('#mpLOIrequest').modal('hide');
        objDatatable.destroy();
        $('.ajax-loader').fadeIn(100);


        LoadRequestedList('Please wait...');
    }
});

function SaveFinalizedValueHeaderLevel(RequestNumber, FinalizedValue, Islumpsum, DocumentType, DocumentNumber, DocumentDate, SoTeamOrg) {

    $.ajax({
        url: "LOIRequests.aspx/SaveHeaderLevelFinalizedValue",
        data: JSON.stringify({
            "RequestNumber": RequestNumber,
            "FinalizedValue": FinalizedValue,
            "Islumpsum": Islumpsum,
            "UserID": currUserId,
            "DocumentType": DocumentType,
            "DocumentNumber": DocumentNumber,
            "DocumentDate": DocumentDate,
            "ReqType": ReqType,
            "SoTeamOrg": SoTeamOrg,

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            if (result.d == "SUCCESS") {
                toastr.success("Header Data Updated Successfully");

                for (var i = 0; i < $('.tbody-revenue tr').length; i++) {
                    let FinalizedValuetxtID = '#' + $('.tbody-revenue tr')[i].children[5].children[0].id.trim();
                    let txtFinalizedValue = $(FinalizedValuetxtID).val();

                    SaveFinalizedValueLineLevel($('.tbody-revenue tr')[i].children[0].textContent, txtFinalizedValue, $('.tbody-revenue tr')[i].children[2].textContent)
                   
                }

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

function UpdateTheStatus(RequestNumber, Status) {

    $.ajax({
        url: "LOIRequests.aspx/UpdateStatus",
        data: JSON.stringify({
            "RequestNumber": RequestNumber,
            "Status": Status,
            "UserID": currUserId,
            "ReqType": ReqType,
            "comments": $('#txtActionComments').val(),

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            if (result.d == "SUCCESS") {
                toastr.success(Status+" Successfully");
                GetTheAccess(ReqNumber);

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
function UpdatetheSO(RequestNumber,SONumber) {

    $.ajax({
        url: "LOIRequests.aspx/UpdatetheSO",
        data: JSON.stringify({
            "RequestNumber": RequestNumber,
            "SONumber": SONumber,
            "UserID": currUserId

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            if (result.d == "SUCCESS") {
                toastr.success(Status + " Successfully");
                GetTheAccess(ReqNumber);

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



function SaveFinalizedValueLineLevel(RequestNumber, FinalizedValue, ProductType) {

    $.ajax({
        url: "LOIRequests.aspx/SaveLineLevelFinalizedValue",
        data: JSON.stringify({
            "RequestNumber": RequestNumber,
            "FinalizedValue": FinalizedValue,
            "ProductType": ProductType,
            "UserID": currUserId

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            if (result.d == "SUCCESS") {
                toastr.success(ProductType+" Updated Success fully");
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
function LoadRequestLOIDetails(_reqNumber) {

    $.ajax({
        url: "LOIRequests.aspx/GetLOIRequestDetails",
        data: JSON.stringify({
            "RequestNumber": _reqNumber,
            "Status": $('#ddlStatus').val(),
            "ReqType": ReqType,
            "UserID": currUserId,


        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            var htm = '';
            $(".ajax-loader").fadeOut(500);
            var cbLumpsumAmount = document.getElementById('cbLumpsumAmount');

            $.each(result.d[0].OpportunityDetails, function (key, item) {
                $("#txtSoReqLevel").val("");
                $('#txtOPTNumber').val(item.OPTNumber);
                $('#txtOPTName').val(item.Name);
                $('#txtClient').val(item.Client);
                $('#txtCustomer').val(item.Customer);
                $('#txtOwner').val(item.Owner);
                $('#txtConsultant').val(item.Consultant);
                $('#txtFinalizedAmount').val(item.FinalizedValue);
                cbLumpsumAmount.checked = (item.LumpSum == "True" ? true : false);
                $('#ddlDocumentType').val(item.DocumentType);
                $('#txtDocumentNo').val(item.DocumentNumber);
                $('#txtDocumentDate').val(item.DocumentDate);

                LoadSOTeamOrg();
                $('#ddlSoTeam').val(item.SoTeamOrg);





            });
            $.each(result.d[0].Products, function (key, item) {
                ReqNumber = item.RequestNumber;
                txtFinalValue = 'Phone-' + item.RevId.trim();
                txtSoNumber = 'SO-' + item.RevId.trim();
                htm += `<tr>        
               
                 <td class="hidden">`+ item.RequestNumber + `</td>
                 <td  class="hidden" style="text-align:center">`+ item.RevId + `</td>      
                  <td style="text-align:left">`+ item.ProductType + `</td>  
                  <td style="text-align:left">`+ item.SubStage + `</td>  
                  <td style="text-align:center">`+ parseInt(item.RevenueAmount.toString().replaceAll(',', '')).toLocaleString("en-US") + `</td>  
                  <td style="text-align:center"> <input class="RevFinalizationValue form-control" onfocus="Focus(this.id,'0.00')" onblur="Blur(this.id,'0.00')" type="text" id=`+ txtFinalValue + ` value="` + item.FinalizedValue + `"></input></td>   
                  <td class="solnumber" style="text-align:center"> <input class="RevSoNumber form-control"  type="text" id=`+ txtSoNumber + ` value="` + item.SONumber + `"></input></td>   
                    
                    `;

                htm += `</tr>`;

            });
            $('.tbody-revenue').html(htm);

            if (ReqType == "SO" && ((myroleList.includes("8108")) || (myroleList.includes("8135"))) ) {
                $(".solnumber").css("display", "block");
                $(".bIsReqLeveldiv").css("display", "block");
                $("#txtSoReqLevel").css("display", "block");
            }
            else {
                $(".solnumber").css("display", "none");
                $(".bIsReqLeveldiv").css("display", "none");
                $("#txtSoReqLevel").css("display", "none");
            }

            GetTheAccess(ReqNumber);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
   
}
$('.kpi-user-list-table').on('click', '.ViewRequestData', function () {

    $('#mpSearchCustomer').modal('hide');
    $('#mpSearchOPT').modal('hide');
    $('#mpRevenueList').modal('hide');

    $('#mpLOIrequest').modal('show');
    LoadRequestLOIDetails(this.parentNode.parentNode.parentNode.children[0].textContent.trim());
    if ($('#cbLumpsumAmount').is(':checked')) {
        $("#txtFinalizedAmount").removeAttr("disabled");
        $('.RevFinalizationValue').attr("disabled", "true");

    }
    else {
        $("#txtFinalizedAmount").attr("disabled", "disabled");
        $(".RevFinalizationValue").removeAttr("disabled");

    }

});

$('#txtFinalizedAmount').on('change', function () {

    var Sumofrev = 0;
    var HeaderLevelFinalizedValue = 0
    HeaderLevelFinalizedValue = $('#txtFinalizedAmount').val().replaceAll(',', '')
    for (var i = 0; i < $('.tbody-revenue tr').length; i++) {
        //let FinalizedValuetxtID = '#' + $('.tbody-revenue tr')[i].children[4].children[0].id.trim();
        Sumofrev = Sumofrev + parseInt($('.tbody-revenue tr')[i].children[4].textContent.trim().replaceAll(',', ''));
      
    }
    let perc = HeaderLevelFinalizedValue / Sumofrev;
    for (var i = 0; i < $('.tbody-revenue tr').length; i++) {
        let FinalizedValuetxtID = '#' + $('.tbody-revenue tr')[i].children[5].children[0].id.trim();
        let txtFinalizedValue = $(FinalizedValuetxtID).val();
        let value = perc * parseInt($('.tbody-revenue tr')[i].children[4].textContent.trim().replaceAll(',', ''));
        $(FinalizedValuetxtID).val(parseInt(value.toString().replaceAll(',', '')).toLocaleString("en-US"));

    }
    
            //SaveFinalizedValueLineLevel($('.tbody-revenue tr')[i].children[1].textContent, txtFinalizedValue, $('.tbody-revenue tr')[i].children[2].textContent)
   
});


$('#txtSoReqLevel').on('change', function () {
    for (var i = 0; i < $('.tbody-revenue tr').length; i++) {
        let txtsoNumber = '#' + $('.tbody-revenue tr')[i].children[6].children[0].id.trim();
    
        $(txtsoNumber).val($('#txtSoReqLevel').val());

    }

    //SaveFinalizedValueLineLevel($('.tbody-revenue tr')[i].children[1].textContent, txtFinalizedValue, $('.tbody-revenue tr')[i].children[2].textContent)

});


$('#mpLOIrequest').on('change', '.RevFinalizationValue', function () {

    var Sumofrev = 0;
    var SUmifLineLevelFinalizedValue = 0
    
   
    
    for (var i = 0; i < $('.tbody-revenue tr').length; i++) {
        let FinalizedValuetxtID = '#' + $('.tbody-revenue tr')[i].children[5].children[0].id.trim();
        let txtFinalizedValue = $(FinalizedValuetxtID).val();
        SUmifLineLevelFinalizedValue = SUmifLineLevelFinalizedValue + parseInt(txtFinalizedValue.replaceAll(',', ''));
       // $(FinalizedValuetxtID).val(parseInt(value.toString().replaceAll(',', '')).toLocaleString("en-US"));

    }
    $('#txtFinalizedAmount').val(parseInt(SUmifLineLevelFinalizedValue.toString().replaceAll(',', '')).toLocaleString("en-US"))
    //SaveFinalizedValueLineLevel($('.tbody-revenue tr')[i].children[1].textContent, txtFinalizedValue, $('.tbody-revenue tr')[i].children[2].textContent)

});


$('#mpLOIrequest').on('keyup', 'input[type=text]', function () {

    if (this.value == '') {
        $('#' + this.id).val('');
    }
    else {
        //if (this.id == 'txtAchievementTrans' || this.id == 'txtTargetTrans') {
        if (this.classList[0].trim() == 'RevFinalizationValue' || this.id =="txtFinalizedAmount") {
            //$('#' + this.id).val(parseInt(this.value.replaceAll(',', '')) == 'NaN' ? '' : parseInt(this.value.replaceAll(',', '')).toLocaleString("en-US"));
            $('#' + this.id).val(parseInt(this.value.replaceAll(',', '')).toLocaleString("en-US"));
        }
    }

})
$('.AddNewComment').on('click', function () {

    $('#hfdRequestNumber').val(ReqNumber);
    $('#txtComments').val("");
    $('#mpAddComments').modal('show');
});

$('.SaveComments').on('click', function () {
    if ($('#txtComments').val() == "") {
        toastr.error("Please Enter Your Comments");
    }
    else {
        SaveComments();
    }
});

function SaveComments() {
    $.ajax({
        url: "LOIRequests.aspx/AddComments",
        data: JSON.stringify({
            "RequestNumber": ReqNumber,
            "Comments": $('#txtComments').val(),
            "UserID": currUserId

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            if (result.d == "SUCCESS") {
                toastr.success("Comments Updated Success fully");
                GetComments();
                $('#mpAddComments').modal('hide');
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


function GetComments() {
    $.ajax({
        url: "LOIRequests.aspx/GetComments",
        data: JSON.stringify({
            "RequestNumber": ReqNumber,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);
            $.each(result.d, function (key, item) {
                htm += `<tr>        
               
                 <td class="hidden">`+ item.ID + `</td>
                 <td style="text-align:center">`+ item.SLNO + `</td>      
                  <td style="text-align:center">`+ item.Comment + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>   
                    `;

                htm += `</tr>`;


            });
            $('.tbody-Comments').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
$('.LOIComments').on('click', function () {
    GetComments();
});
$('.LOIDocuments').on('click', function () {
    BindSupportedDocuments();
});

$('#btnSearch').on('click', function () {
    //objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);

  
    LoadRequestedList('Please wait...');
       
    
});

$('#btnApprove').on('click', function () {
    if (ReqType == "SO" && (myroleList.includes("8108"))) {
        //for (var i = 0; i < $('.tbody-revenue tr').length; i++) {

        //    let txtRowId = '#' + $('.tbody-revenue tr')[i].children[6].children[0].id.trim();
        //    let txtvalue = $(txtRowId).val();
        //    if (txtvalue == "") {
        //        toastr.error("Please Enter The SO Value");
        //        return false;
        //    }

        //    UpdatetheSO(ReqNumber, $('#txtSoNumber').val());
        //    GetTheAccess(ReqNumber);
        //    $('#mpLOIrequest').modal('hide');

        //}
        for (var i = 0; i < $('.tbody-revenue tr').length; i++) {

            let txtSoNumber = '#' + $('.tbody-revenue tr')[i].children[6].children[0].id.trim();
            let txtSoNumberValue = $(txtSoNumber).val();

            SaveSonumberLineLevel($('.tbody-revenue tr')[i].children[0].textContent, $('.tbody-revenue tr')[i].children[2].textContent, txtSoNumberValue)

        }
        UpdatetheSO(ReqNumber, $('#txtSoReqLevel').val());
        GetTheAccess(ReqNumber);
        $('#mpLOIrequest').modal('hide');



    }
    else {

        $('#mpActionComments').modal('show');
      
        $('#hfdAction').val('APPROVED');
        $('#txtActionComments').val('');
      //  UpdateTheStatus(ReqNumber, 'APPROVED');
        $('#mpLOIrequest').modal('hide');
        //$('.ajax-loader').fadeIn(100);
        //LoadRequestedList('Please wait...');
        //GetTheAccess(ReqNumber);
    }
   
});

$('#btnSaveAction').on('click', function () {

    if ($('#txtActionComments').val() == "") {
        toastr.error("Please add the comments");
    }
    else {

        UpdateTheStatus(ReqNumber, $('#hfdAction').val());
        GetTheAccess(ReqNumber);
        $('#mpLOIrequest').modal('hide');
        $('.ajax-loader').fadeIn(100);
        LoadRequestedList('Please wait...');
    }

});



function SaveSonumberLineLevel(RequestNumber,ProductType,SONumber) {

    $.ajax({
        url: "LOIRequests.aspx/SaveLineLevelSONumber",
        data: JSON.stringify({
            "RequestNumber": RequestNumber,
            "ProductType": ProductType,
            "DocumentNumber": SONumber

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            if (result.d == "SUCCESS") {
                toastr.success(ProductType + " Updated Success fully");
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

$('#btnReject').on('click', function () {

    //UpdateTheStatus(ReqNumber, 'REJECTED');
    //GetTheAccess(ReqNumber);
    //$('#mpLOIrequest').modal('hide');
    //$('.ajax-loader').fadeIn(100);
    //LoadRequestedList('Please wait...');

    $('#mpActionComments').modal('show');
    $('#txtActionComments').val('');
    $('#hfdAction').val('REJECTED');
    $('#txtActionComments').val('');
    //  UpdateTheStatus(ReqNumber, 'APPROVED');
    $('#mpLOIrequest').modal('hide');
    

});
$('#btnSaveSalesorder').on('click', function () {
    if ($('#txtSoNumber').val() == "") {
        toastr.error("Please Enter The SO Number in Order To Approve");
       
    }
    else {

        UpdatetheSO(ReqNumber, $('#txtSoNumber').val());
        GetTheAccess(ReqNumber);
        $('#mpLOIrequest').modal('hide');
    }
});

function GetTheAccess(RequestNumber) {

    $.ajax({
        url: "LOIRequests.aspx/GettheAccess",
        data: JSON.stringify({
            "RequestNumber": ReqNumber,
            "UserID": currUserId,
            "ReqType": ReqType
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);
            $("#txtFinalizedAmount").removeAttr("disabled");
            $("#cbLumpsumAmount").removeAttr("disabled");
            $(".RevFinalizationValue").removeAttr("disabled");
            if (result.d == "APPROVE") {
                $("#btnSubmitFinalizedValue").css("display", "none");
                $("#btnSaveFinalizedValue").css("display", "none");

                $("#btnReject").css("display", "block");
                $("#btnApprove").css("display", "block");
                   
                    $("#txtFinalizedAmount").attr("disabled", "disabled");
                    $('.RevFinalizationValue').attr("disabled", "true");
                    $('#cbLumpsumAmount').attr("disabled", "true");
                $("#ddlSoTeam").attr("disabled", "disabled");

            }
            else if (result.d == "SUBMIT") {
                $("#btnSubmitFinalizedValue").css("display", "block");
                $("#btnSaveFinalizedValue").css("display", "block");
                $("#ddlSoTeam").removeAttr("disabled");

                $("#btnReject").css("display", "none");
                $("#btnApprove").css("display", "none");

                if ($('#cbLumpsumAmount').is(':checked')) {
                    $("#txtFinalizedAmount").removeAttr("disabled");
                    $('.RevFinalizationValue').attr("disabled", "true");

                }
                else {
                    $("#txtFinalizedAmount").attr("disabled", "disabled");
                    $(".RevFinalizationValue").removeAttr("disabled");

                }

                
            }
            else {
                $("#btnSubmitFinalizedValue").css("display", "none");
                $("#btnSaveFinalizedValue").css("display", "none");
                $("#btnReject").css("display", "none");
                $("#btnApprove").css("display", "none");

                $("#txtFinalizedAmount").attr("disabled", "disabled");
                $('.RevFinalizationValue').attr("disabled", "true");
                $('#cbLumpsumAmount').attr("disabled", "true");
                $("#ddlSoTeam").attr("disabled", "disabled");
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


$('.UploadNewDocument').on('click', function () {
    $('#mpUploadFile').modal('show');
});

$('.UploadSupportDocument').on('click', function () {
    if ($('#txtFileName').val() == "" || $('#txtDescription').val() == "" || $('#fuDocument').val() == "") {
        toastr.error("Please Fill All the Information");
    }
    else {
        SaveDocuments();
    }
    
});


function SaveDocuments() {

    

    var formData = new FormData();
    var fileUpload = $('#fuDocument').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    
    var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/LOIDocuments.ashx?userid=' + currUserId + '&RequestNumber=' + ReqNumber + '&FileName=' + $('#txtFileName').val() + '&Description=' + $('#txtDescription').val();  // for production
   // var qrystringLocal = 'http://localhost:22622/CRMSS/Services/LOIDocuments.ashx?userid=' + currUserId + '&RequestNumber=' + ReqNumber + '&FileName=' + $('#txtFileName').val() + '&Description=' + $('#txtDescription').val();  // for development 
    
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
                toastr.success("Document Uploaded Successfully");
                $('#txtFileName').val("");
                $('#txtDescription').val("");
                $('#fuDocument').val("");
                $('#mpUploadFile').modal('hide');

                BindSupportedDocuments();
            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });

}
function BindSupportedDocuments() {

    $.ajax({
        url: "LOIRequests.aspx/GetSupportedDocuments",
        data: JSON.stringify({
            "RequestNumber": ReqNumber
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var urlService='';

            $(".ajax-loader").fadeOut(500);
            $.each(result.d, function (key, item) {
                urlService = 'https://crmss.naffco.com/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + item.URL;  // for production
                //urlService = 'http://localhost:22622/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + item.URL;   // for development
                htm += `<tr>  

                 <td class="hidden">`+ item.URL + `</td>
                 <td class="hidden">`+ item.ID + `</td>
                 <td style="text-align:center">`+ item.SLNO + `</td>      
                  <td style="text-align:center">`+ item.FileName + `</td>  
                  <td style="text-align:center">`+ item.Description + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>   
                        <td style="text-align:center">
                            <a href="`+ urlService + `"> <i class="fa fa-download" aria-hidden="true" style="padding-left: 75px;"></i></a>
                </td>`;

                htm += `</tr>`;


            });
            $('.tbody-Documents').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


async function downloadFile(url, filename) {
    try {
        // Fetch the file
        const response = await fetch(url);

        // Check if the request was successful
        if (response.status== 200) {
            throw new Error(`Unable to download file. HTTP status: ${response.status}`);
        }

        // Get the Blob data
        const blob = await response.blob();

        // Create a download link
        const downloadLink = document.createElement('a');
        downloadLink.href = URL.createObjectURL(blob);
        downloadLink.download = filename;

        // Trigger the download
        document.body.appendChild(downloadLink);
        downloadLink.click();

        // Clean up
        setTimeout(() => {
            URL.revokeObjectURL(downloadLink.href);
            document.body.removeChild(downloadLink);
        }, 100);
    } catch (error) {
        console.error('Error downloading the file:', error.message);
    }
}

function RequestHistory() {

    $.ajax({
        url: "LOIRequests.aspx/getHistory",
        data: JSON.stringify(
            {
                "Id": ReqNumber,
           

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = "";
            for (let i = 0; i < result.d.length; i++) {

                if (i % 2 == 0) {

                    htm += `   <div class=" timeline-component timeline-content">
                    <h3 style="color:blue;">`+ result.d[i].Type + `</h3>
                    <p style="color:black;">UpdatedBy:&nbsp;&nbsp;<label class="col-form-label" style="color:green;font-size:20px;">`+ result.d[i].User + `</label> </p>
                    <p style="color:black;">UpdatedDate:&nbsp;&nbsp<label class="col-form-label" style="color:red;font-size:18px;">`+ result.d[i].Date + `</label></p>
                    <p style="color:black;">Status:&nbsp;&nbsp<label class="col-form-label" style="color:#ff21e4;font-size:18px;">`+ result.d[i].Status + `</label></p>
                     </div>
                        <div class="timeline-middle">
                      <div class="timeline-circle"></div>
                    </div>
                    <div class="timeline-empty">
                    </div>`

                }
                else {
                    htm += `<div class="timeline-empty">
                  </div>

                    <div class="timeline-middle">
                   <div class="timeline-circle"></div>
                    </div>
                    <div class=" timeline-component timeline-content">
                    <h3 style="color:blue;">`+ result.d[i].Type + `</h3>
                   <p style="color:black;">UpdatedBy:&nbsp;&nbsp;<label class="col-form-label" style="color:green;font-size:20px;">`+ result.d[i].User + `</label> </p>
                   <p style="color:black;">UpdatedDate:&nbsp;&nbsp<label  class="col-form-label" style="color:red;font-size:18px;">`+ result.d[i].Date + `</label></p>
                    <p style="color:black;">Status:&nbsp;&nbsp<label class="col-form-label" style="color:#ff21e4;font-size:18px;">`+ result.d[i].Status + `</label></p>
                    </div>`


                }

            }



            $('#timelineHistory').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function ApprovalStatus(ReqNumber) {

    $.ajax({
        url: "LOIRequests.aspx/GetApprovalDetails",
        data: JSON.stringify(
            {
                "Id": ReqNumber,
                "ReqType": ReqType,
            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            $.each(result.d, function (key, item) {
                htm += `<tr>        
               
                 <td style="text-align:center">`+ item.ROLE + `</td>
                 <td style="text-align:center">`+ item.ACTIONBY + `</td>      
                  <td style="text-align:center">`+ item.ACTIONDATE + `</td>  
                  <td style="text-align:center">`+ item.COMMENTS + `</td>  `
                if (item.STATUS == "SUBMIT") {
                    htm += ` 
                   <td style="text-align:center"><a class="badge bg-label-info me-1">`+ item.STATUS + `</td>`;
                }
                else if (item.STATUS == "APPROVED") {
                    htm += ` 
                  <td style="text-align:center"><a class="badge bg-label-success me-1">`+ item.STATUS + `</td>`;
                }
                else if (item.STATUS =="REJECTED") {
                    htm += ` 
                   <td style="text-align:center"><a class="badge bg-label-danger me-1">`+ item.STATUS + `</td>`;
                }
                else {
                    htm += ` 
                    <td style="text-align:center"><a class="badge bg-label-gray me-1">`+ item.STATUS + `</td>`;
                }

            

                htm += `</tr>`;


            });
            $('.tbody-ApprovalList').html(htm);
            $('#mdRequestStatus').modal('show');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}