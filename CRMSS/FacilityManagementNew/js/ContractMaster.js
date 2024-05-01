var objDatatableContract1 = [];
var objDatatablePendingContract = [];
var objDatatableInactiveContract = [];
var objDtableFinalApprovedContract = [];
var objDtableMyRequest = [];
var PropertyID = '-1';
var BlockId = '';
var UnitId = '';
var srcImg = '';
var iterSrcImgab = '';
var UnitVal = '';
var selTabColor = '#b12b0df7';
var FloorId = '';
var DocChListID = 0;
var docId = '';
var propcol = '4px solid' + selTabColor;
var sec = 0;
var AttachDetailsList = [];
var ContractID = '';
var SubmitVal = '';


$(document).ready(function () {

   
    loadAllContractDetails();

    loadInactiveContracts();

    loadMycontractRequest();

    ShowPendingContract();

    //ShowDocumentDetails();

    tabAcess();

    contracthidden();
    

    GetPropertyDetailsModal();

    
});


function contracthidden()
{
    const MyArray = myroleList.split(",");

    if (MyArray.filter(s => s == 8119).length > 0) {

        $('#id_btncontractAdd').addClass('hidden');
    }

    else if (MyArray.filter(s => s == 8120 || s == 8118).length > 0) {

        $('#id_btncontractAdd').removeClass('hidden');
    }


 
}

//function renewContractaBtn() {

//    const MyArray = myroleList.split(",");

//    if (MyArray.filter(s => s == 8119 || s == 8118).length > 0) {

//        $('#btn-addRenewal-contract').addClass('hidden');
//        $('#btn-contract-termination').addClass('hidden');
//    }

//    else if (MyArray.filter(s => s == 8120).length > 0) {

//        $('#btn-addRenewal-contract').removeClass('hidden');
//        $('#btn-contract-termination').removeClass('hidden');
//    }

//}

function tabAcess() {

    const MyArray = myroleList.split(",");


    if (MyArray.filter(s => s == 8118 || s == 8119).length > 0) {

        $('#contract-tabs-ul li button').removeClass('active')
        $('#contract-tabs-ul').parent().children().eq(1).find('.tab-pane').removeClass('active show')

        $('#tabpendingContra').removeClass('hidden');
        $('#tabmyrequest').addClass('hidden');
        $('#listallcontract').removeClass('hidden');
        $('#inactiveContract').removeClass('hidden');
                
        $('#tabpendingContra').addClass('active');
        $('#navs-top-pending-Contracts').addClass('show active');

    } else if (MyArray.filter(s => s == 8120).length > 0) {
        $('#contract-tabs-ul li button').removeClass('active')
        $('#contract-tabs-ul').parent().children().eq(1).find('.tab-pane').removeClass('active show')

        $('#tabpendingContra').removeClass('hidden');
        $('#tabmyrequest').addClass('hidden');
        $('#listallcontract').removeClass('hidden');
        $('#inactiveContract').removeClass('hidden');



        $('#tabpendingContra').addClass('active');
        $('#navs-top-pending-Contracts').addClass('show active');

        //$('#tabmyrequest').addClass('hidden');
        //$('#tab-MyContractRequest').removeClass('hidden');
    }

    //for (var i = 0; i < MyArray.length; i++) {

    //    if ((MyArray[i] == 8120 || MyArray[i] == 8119)) {            

    //        $('#contract-tabs-ul li button').removeClass('active')
    //        $('#contract-tabs-ul').parent().children().eq(1).find('.tab-pane').removeClass('active show')

    //        $('#tabpendingContra').addClass('hidden');
    //        $('#tabmyrequest').removeClass('hidden');
    //        $('#listallcontract').removeClass('hidden');
    //        $('#inactiveContract').removeClass('hidden');

    //        $('#tabmyrequest').addClass('active');
    //        $('#tab-MyContractRequest').addClass('show active');

    //    }

    //    if (MyArray[i] == 8120) {                       

    //        $('#contract-tabs-ul li button').removeClass('active')
    //        $('#contract-tabs-ul').parent().children().eq(1).find('.tab-pane').removeClass('active show')

    //        $('#tabpendingContra').removeClass('hidden');
    //        $('#tabmyrequest').addClass('hidden');
    //        $('#listallcontract').removeClass('hidden');
    //        $('#inactiveContract').removeClass('hidden');

    //        $('#tabpendingContra').addClass('active');
    //        $('#navs-top-pending-Contracts').addClass('show active');
    //        //$('#tabpendingContra').addClass('active');
    //        //$('#tab-navs-top-Contracts').addClass('show active');

    //        //$('#tabmyrequest').removeClass('active');
    //        //$('#tab-MyContractRequest').removeClass('show active');

    //        //$('#listallcontract').removeClass('active');
    //        //$('#navs-top-Contracts').removeClass('show active');

    //        //$('#inactiveContract').removeClass('active');
    //        //$('#navs-top-inactive-Contracts').removeClass('show active');
    //    }

    //}

}

    //$('.docDownloadIcon').on('click', function () {
    //    $('#aDOcFile').attr('href', srcImg);
    //});
    $('.tbody-documents-list').on('click', '#btnsaveDocuments', function () {

        // $('#fu-docment-attach')[0].files.length == 0 ? toastr.error('Please select file to upload. ', '') : uploadDocumentAttach();



        DocChListID = this.parentNode.parentNode.parentNode.children[0].textContent;

    });

    $('.tbody-documetlist').on('click', '.deleteIcon', function () {
        DocumetID = this.parentElement.parentElement.parentElement.children[0].textContent.trim();
        docContractID = this.parentElement.parentElement.parentElement.children[2].textContent.trim();
        $('#delAttachModal').modal('show');
    });


    $('.tbody-documetlist').on('click', '.showFileIcon', function () {

        $('#Modalfordocview').modal('show');
        DocumetID = this.parentElement.parentElement.parentElement.children[0].textContent.trim();
        //var qrystringLocal = '/Services/FMDocDownload.ashx?documentid=' + DocumetID

        //var qrystringLocal = '/Services/FMDocDownload.ashx?'

        $('#docImagePreview').attr('src', srcImg);


    });



    //$('#contract-details-modal-ul').on('click', 'li', function () {

    //    $('.proj-main-parent-div ul li').find('.active').css({ 'border-left': '0px', 'color': '' });    
    //    $('#contract-details-modal-ul button').css({ 'border-bottom': '0px', 'color': '' });
    //    $(this).find('.active').css({ 'border-bottom': propcol, 'color': selTabColor });

    //    let liName = $(this).children().text().trim();

    //    if (liName == 'Contract Documents') {
    //        selProjId = -1;
    //        ShowDocumentDetails();
    //        ShowDocumetsCount();
    //    }
    //    else if (liName == 'Payment Details') {
    //        ShowPaymentDetails('');
    //    }
    //    else if (liName == 'MoveIn Final Approvel') {
    //        ShowMoveinFinalDocApproved('');
    //    }

    //    else if (liName == 'Renewal Confirmation') {

    //        ShowRenewalstage1Doc();
    //    }

    //    else if (liName == 'Termination Confirmation') {
    //        ShowTerminationDocs('');
    //    }

    //    else if (liName == 'Initial MoveOut') {
    //        ShowMovOutStage1Docs();
    //    }

    //    else if (liName == 'Final MoveOut') {
    //        ShowFinalMoveoutDocList();
    //    }

    //    else if (liName == 'Maintenance Estimation') {
    //        ShowFinalEstimationDocList();
    //    }
    //    else if (liName == 'Security Deposit Refund') {
    //        ShowSecurityDepositRefundDocList();
    //    }


    //});




    $('.btn-add-contracts').on('click', function () {

        /* LoadPropertyDDL();*/
        SubmitVal = 1;
        $('#ModalAddContracts').modal('show');
        //$('#add-contract').addClass('hidden');

        $("#renewal-contract").addClass('hidden');
        $("#add-contract").addClass('hidden');
        getUniqueContractNo();
       // clearContracts();
        LoadPropertyAddDet();

    });

    $('.btn-addrenewal-contracts').on('click', function () {

        SubmitVal = 2;
        $('#ModalAddContracts').modal('show');


        $("#renewal-contract").addClass('hidden');
        $("#add-contract").addClass('hidden');

        getUniqueContractNo();
        clearContracts();
        LoadPropertyAddDet();


    });


    $('.classinitate-moveout').on('click', function () {

        $('#ModaldocuploadInitatMoveout').modal('show');

        ShowInitateMoveoutStage1Docs();
        ShowMovOutStage1Docs();
        $("#btn-initate-moveout").addClass('hidden');
        $("#btn-cancel-termination").addClass('hidden');


        //clearContracts();
        //LoadPropertyAddDet();


    });


    //$('.btncontract-Renew').on('click', function () {
    //    $('#ModalUploadRenewalConfrmMail').modal('show');

    //    ShowRenewalstage1Doc();
    //})

    $('.btn-rejected').on('click', function () {

        $('#Modalrejectreason').modal('show');

    });

$('.modalrefresh').on('click', function () {

    loadAllContractDetails();
    ShowContractDetailsModal();
    ShowTenantDetails();
    ShowPaymentDetails();
    ShowDocumentDetails();
    ShowDocumetsCount();

});



$('.submitmoveinstage2doc').on('click', function () {

    
    ShowDocumentDetails();
    ShowDocumetsCount();

    ShowMoveinFinalDocApproved();
    ShowMoveinFinalDocumetsCount();

});

    $('.btn-doc-rejected').on('click', function () {

        $('#ModaDocjectreason').modal('show');

    });

    $('.btn-add-tenant-grid').on('click', function () {
        $('#ModalAddtenant').modal('show');
        tenentclearform();
    })


$('.btn-add-paymentdetls').on('click', function () {
    
    $('#ModalAddContractPaymentDetails').modal('show');
    PaymentMethodsFields();

    paymentclearform();
       
    })

    $('.btn-add-documents').on('click', function () {
        $('#ModalAddContractDocument').modal('show');
        ShowTenantdocuments();
    })

    $('.btn-add-moveinFinalDoc').on('click', function () {
        $('#ModalAddMoveInFinalContract').modal('show');
        ShowMoveinFinalDocuments();
    })



    $('.btncontract-RenewStage1').on('click', function () {
        $('#ModaluploadRenewalConfrmMail').modal('show');
        $("#btn-contract-termination").addClass('hidden');
        //$("#btn-contract-renewal").addClass('hidden');



        ShowRenewalstage1Documents();
        ShowRenewalstage1Doc();
        ShowRenewalStage1Acess();


    });

    $('.btn-contractRenewalAmount').on('click', function () {

        $('#ModalRenewaldetails ').modal('show');

    });

    $('.btncontract-termination').on('click', function () {
        $('#ModaluploadTerminationConfrmMail').modal('show');
        $("#btn-contract-renewal").addClass('hidden');
        $("#btn-Renewalstage1-submit1").addClass('hidden');

        ShowTerminationDocuments();
        ShowTerminationDocs();
        ShowTerminationButtonAcess();
        

    });

    $('.classfinalmoveoutdocs').on('click', function () {


        $('#ModaldocuploadFinalMoveout').modal('show');
        $("#btn-cancel-termination").addClass('hidden');

        ShowFinalMoveoutDocs();
        ShowFinalMoveoutDocList();

    });

    $('.classfinalmoveoutEstimation').on('click', function () {


        $('#ModaldocuploadFinalEstimation').modal('show');

        ShowFinalEstimation();
        ShowFinalEstimationDocList();


    });

    $('.clsSecuritydepositRefund').on('click', function () {


        $('#ModalSecurityDepositRefund').modal('show');

        ShowSecurityDepositRefund();
        ShowSecurityDepositRefundDocList();


    });







    //$('#contract-tabs-ul').on('click', 'li', function () {

    //    //$('.proj-main-parent-div ul li').find('.active').css({ 'border-left': '0px', 'color': '' });    
    //    $('#contract-tabs-ul button').css({ 'border-bottom': '0px', 'color': '' });
    //    $(this).find('.active').css({ 'border-bottom': propcol, 'color': selTabColor });

    //    let liName = $(this).children().text().trim();

    //    if (liName == 'Active') {
    //        selProjId = -1;
    //        loadAllContractDetails();
    //    }
    //    else if (liName == 'Pending') {
    //        loadInactiveContracts(); ('-1');
    //    }
    //    else if (liName == 'In active') {
    //        loadInactiveContracts();
    //    }

    //    else if (liName == 'Final Checklist') {
    //        loadMoveinFinalApprovelContracts();
    //    }
    //});

    $('.tbody-Contract-list').on('click', '.ibtn-contract-info', function () {


        //DocChListID = this.parentNode.parentNode.parentNode.children[0].textContent;
        RoomID = this.parentNode.parentNode.parentNode.children[3].textContent;
        ContractID = this.parentNode.parentNode.parentNode.children[4].textContent;

        loadAllContractDetails();
        ShowContractDetailsModal();
        ShowTenantDetails();
        ShowPaymentDetails();
        ShowPaymentMethodsActv();
        ShowDocumentDetails();
        ShowDocumetsCount();
       
        ShowMoveinFinalDocApproved();
        ShowMoveinFinalDocumetsCount();

        BtnRenewalAndTermination();

        ShowRenewalStage1Acess();

        //BtnAcessAddRewedContract();
        //renewContractaBtn();



        //BtnAcessAddRewedContract();
       

        //ShowRenewalStage1Acess();
        ShowRenewalstage1Doc();
        ShowTerminationButtonAcess();
        ShowTerminationDocs();
        ShowMoveOutStage1ButtonAcess();
        ShowMovOutStage1Docs();
        ShowFinalMoveoutButtonAcess();
        ShowFinalMoveoutDocList();
        ShowFinalEstimationButtonAcess();
        ShowFinalEstimationDocList();
        ShowSecurityDEpositRefundButtonAcess();
        ShowSecurityDepositRefundDocList();

        //IsTenentUnderWorkOrder();
        //IsAddTenantPaymentdetails();
        
        //BtnAcessAddRewedContract();
        //BtnAcesssubmittermination();
        //Renewalbutton();

        //ContractRenewal();

    });


$('.tbody-Contract-inactivelist').on('click', '.ibtn-contract-info1', function () {

    RoomID = this.parentNode.parentNode.parentNode.children[2].textContent;
    ContractID = this.parentNode.parentNode.parentNode.children[3].textContent;
    $('#ModalContractDetails').modal('show');
    $("#Contractdoctabs").addClass('hidden');
    $('#contractflowbttns').addClass('hidden');
    ShowContractDetailsModal();

});

$('.tbody-myContractRequest').on('click', '.ibtn-contract-info', function () {

    
    RoomID = this.parentNode.parentNode.parentNode.children[3].textContent;
    ContractID = this.parentNode.parentNode.parentNode.children[4].textContent;

   

    $('#ModalContractDetails').modal('show');
   
    $("#Contractdoctabs").addClass('hidden');
    $('#contractflowbttns').addClass('hidden');
    $('#textstatus').addClass('hidden');
    $('#lblcontractstatus').addClass('hidden');
    ShowContractDetailsModal();

    ShowPendingContractActions();

});



    function tabMoveinFinalApprove() {

        var Moveinfinal = $('#textmoveinstageapprovel').val()

        if (Moveinfinal == 'APPROVED') {

            $("#tabmoveinfinal").removeClass('hidden');

            //ShowRenewalStage1Acess();
            //ShowMoveinFinalDocApproved();
            //ShowMoveinFinalDocumetsCount()

            /*btnRenewalAndTermination();*/

        }

        else {
            $("#tabmoveinfinal").addClass('hidden');
        }
    }

    //function btnRenewalAndTermination() {
    //    var contractApprovel = $('#textContractApprovel').val();
    //    var movingStage1Approvel= $('#textmoveinstageapprovel').val();
    //    var movingStage2Approvel = $('#textMovingStage2Appeovel').val();
    //    var renuwalsatge1approvel = $('#textrenewalstage1approvel').val();
    //    var terminationapprovel = $('#textterminationapprovel').val();

    //    if (contractApprovel == 'APPROVED' && movingStage1Approvel == 'APPROVED' && movingStage2Approvel == 'APPROVED') {

    //        $("#btn-contract-renewal").removeClass('hidden');
    //        $("#btn-contract-termination").removeClass('hidden');
    //        $("#btn-Renewalstage1-submit").addClass('hidden');
    //       /* $("#btn-Submit-termidocs").addClass('hidden');*/
    //        $("#btn-addRenewal-contract").addClass('hidden');

    //    }

    //    else if (contractApprovel == 'APPROVED' && movingStage1Approvel == 'APPROVED' && movingStage2Approvel == 'APPROVED' && terminationapprovel =='SUBMIT')
    //    {
    //        $("#btn-contract-renewal").addClass('hidden');
    //        $("#btn-contract-termination").addClass('hidden');
    //    }

    //   //else if (contractApprovel == 'APPROVED' && movingStage1Approvel == 'APPROVED' && movingStage2Approvel == 'APPROVED' && renuwalsatge1approvel == 'APPROVED') {



    //   //     $("#btn-contract-renewal").addClass('hidden');
    //   //     $("#btn-addRenewal-contract").removeClass('hidden');
    //   //     $("#btn-Renewalstage1-submit").addClass('hidden');
    //   //     $("#btn-contract-termination").addClass('hidden');

    //   // }

    //    else {

    //        $("#btn-contract-renewal").addClass('hidden');
    //        $("#btn-contract-termination").addClass('hidden');
    //        $("#btn-Renewalstage1-submit").addClass('hidden');
    //        //$("#btn-Submit-termidocs").addClass('hidden');
    //        $("#btn-addRenewal-contract").addClass('hidden');

    //    }
    //}




$('.tbody-pending-contract').on('click', '.ibtn-pending-contrractDtls', function () {


        $('#ModalPendingContractDetails').modal('show');

        ContractID = this.parentNode.parentNode.parentNode.children[4].textContent;

        UnitID = this.parentNode.parentNode.parentNode.children[2].textContent;




        ShowPendingContractDtlsModal();

    ShowPaymentMethodsDiv();
        TenantDetailsApprovel();
        PaymentDetailsApprovels();

        ShowPendingContractActions();

        PendingContractButtonAcess();


        if (curr_user_role.toUpperCase() == "VERIFY") {
            $('.btn-verified').removeClass('hidden');
            $('.btn-rejected').removeClass('hidden');
            $('.btn-approved').addClass('hidden');
        } else if (curr_user_role.toUpperCase() == "APPROVE") {
            $('.btn-verified').addClass('hidden');
            $('.btn-rejected').removeClass('hidden');
            $('.btn-approved').removeClass('hidden');
        } else if (curr_user_role.toUpperCase() == "COMPLETED") {
            $('.btn-verified').addClass('hidden');
            $('.btn-rejected').addClass('hidden');
            $('.btn-approved').addClass('hidden');
        }

    });

    function initiateDataTableUnitRequestAction() {
        objDatatableUnitReqAction = [];
        objDatatableUnitReqAction = $('.Inactive-contracts-table').DataTable({
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

    function initiateDataTableInactiveContracts() {
        objDatatableInactiveContract = [];
        objDatatableInactiveContract = $('.Inactive-contracts-table').DataTable({
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


    function initiateDataTableUnitDetailsall() {
        objDatatableContract1 = [];
        objDatatableContract1 = $('.Contract-list-table').DataTable({
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



    function initiateDataTablePendingContract() {
        objDatatablePendingContract = [];
        objDatatablePendingContract = $('.Pending-Contract-table').DataTable({
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
    function initiateDTableMoveInFinalApprovel() {
        objDtableFinalApprovedContract = [];
        objDtableFinalApprovedContract = $('.moveIn-final-approvel-table').DataTable({
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

    function initiateDataTableyContractRequest() {
        objDtableMyRequest = [];
        objDtableMyRequest = $('.MycontractRequest-table').DataTable({
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


    function loadAllContractDetails() {

        $.ajax({
            url: "ContractMaster.aspx/GetAllContractDetails",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                $('.tbody-Contract-list tr').length > 0 ? objDatatableContract1.destroy() : '';
                //clearmodal();

                var htm = '';
                var ProjectDetails = result.d;



                $.each(ProjectDetails, function (key, item) {
                    //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                    htm += `  <tr>        

                 <td style="text-align:center;">`+ item.ContractNo + `</td>
                 <td style="text-align:center;display:none">`+ item.PropertyID + `</td>

                  <td style="text-align:center;display:none">`+ item.BlockID + `</td> 
                  <td style="text-align:center;display:none">`+ item.RoomID + `</td>
                  <td style="text-align:center;display:none">`+ item.ContractID + `</td>                  
                  <td style="text-align:center;">`+ item.PropertyName + `</td>
                  <td style="text-align:center;display:none">`+ item.BlockName + `</td>
                  <td style="text-align:center;">`+ item.RoomName + `</td>
                  <td style="text-align:center;">`+ item.Status + `</td>  
                   <td style="text-align:center;">`+ item.NoOfMonths + `</td>  
                 <td style="text-align:center;">`+ item.StartDate.split(' ')[0] + `</td>
                 <td style="text-align:center;">`+ item.EndDate.split(' ')[0] + `</td>
                  

                 <td style="text-align:center;"> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-contract-info" title="Other" data-unitreqid="`+ item.ContractID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td>`;




                    htm += `</tr>`;

                });

                $('.tbody-Contract-list').html(htm);

                initiateDataTableUnitDetailsall();
            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }


    function loadMycontractRequest() {

        $.ajax({
            url: "ContractMaster.aspx/GetMycontractRequest",
            data: JSON.stringify({ 'UserID': currUserId }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                $('.tbody-myContractRequest tr').length > 0 ? objDtableMyRequest.destroy() : '';
                //clearmodal();

                var htm = '';
                var ProjectDetails = result.d;



                $.each(ProjectDetails, function (key, item) {
                    //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                    htm += `  <tr>        

                 <td style="text-align:center;">`+ item.ContractNo + `</td>
                 <td style="text-align:center;display:none">`+ item.PropertyID + `</td>

                  <td style="text-align:center;display:none">`+ item.BlockID + `</td> 
                  <td style="text-align:center;display:none">`+ item.RoomID + `</td>
                  <td style="text-align:center;display:none">`+ item.ContractID + `</td>                  
                  <td style="text-align:center;">`+ item.PropertyName + `</td>
                  <td style="text-align:center;display:none">`+ item.BlockName + `</td>
                  <td style="text-align:center;">`+ item.RoomName + `</td>
                  <td style="text-align:center;">`+ item.Status + `</td>  
                   <td style="text-align:center;">`+ item.NoOfMonths + `</td>  
                 <td style="text-align:center;">`+ item.StartDate.split(' ')[0] + `</td>
                 <td style="text-align:center;">`+ item.EndDate.split(' ')[0] + `</td>
                  

                 <td style="text-align:center;"> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-contract-info" title="Other" data-unitreqid="`+ item.ContractID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td>`;




                    htm += `</tr>`;

                });

                $('.tbody-myContractRequest').html(htm);

                initiateDataTableyContractRequest();
            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }

    function loadMoveinFinalApprovelContracts() {

        $.ajax({
            url: "ContractMaster.aspx/GetMoveInfinalApprovelContracts",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                $('.tbody-movein-finalapprovel tr').length > 0 ? objDtableFinalApprovedContract.destroy() : '';
                //clearmodal();

                var htm = '';
                var ContractDetails = result.d;



                $.each(ContractDetails, function (key, item) {


                    htm += `  <tr>        
                 <td style="text-align:center;display:none">`+ item.PropertyID + `</td>

                  <td style="text-align:center;display:none">`+ item.BlockID + `</td> 
                  <td style="text-align:center;display:none">`+ item.RoomID + `</td>
                  <td style="text-align:center;display:none">`+ item.ContractID + `</td>
                  <td style="text-align:center;">`+ item.PropertyName + `</td>
                  <td style="text-align:center;">`+ item.BlockName + `</td>
                  <td style="text-align:center;">`+ item.RoomName + `</td>
                  <td style="text-align:center;">`+ item.PropertyUsage + `</td>
                  <td style="text-align:center;">`+ item.ContractValue + `</td> 
                 <td style="text-align:center;">`+ item.SecurityDeposit + `</td>
                 <td style="text-align:center;">`+ item.ModeOfPayment + `</td>
                 <td style="text-align:center;">`+ item.StartDate.split(' ')[0] + `</td>
                 <td style="text-align:center;">`+ item.EndDate.split(' ')[0] + `</td>

                 <td style="text-align:center;"> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-preApproved-contract-info" title="Other" data-unitreqid="`+ item.ContractID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td>`;

                    htm += `</tr>`;

                });

                $('.tbody-movein-finalapprovel').html(htm);

                initiateDTableMoveInFinalApprovel();
            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }


    function loadInactiveContracts() {

        $.ajax({
            url: "ContractMaster.aspx/GetInactiveContracts",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                $('.tbody-Contract-inactivelist tr').length > 0 ? objDatatableInactiveContract.destroy() : '';
                //clearmodal();

                var htm = '';
                var ProjectDetails = result.d;



                $.each(ProjectDetails, function (key, item) {
                    //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                    htm += `  <tr>        
                 <td style="text-align:center;display:none">`+ item.PropertyID + `</td>

                  <td style="text-align:center;display:none">`+ item.BlockID + `</td> 
                  <td style="text-align:center;display:none">`+ item.RoomID + `</td>
                  <td style="text-align:center;display:none">`+ item.ContractID + `</td>
                  <td style="text-align:center;">`+ item.PropertyName + `</td>
                  <td style="text-align:center;">`+ item.BlockName + `</td>
                  <td style="text-align:center;">`+ item.RoomName + `</td>
                  <td style="text-align:center;">`+ item.PropertyUsage + `</td>
                  <td style="text-align:center;">`+ item.ContractValue + `</td> 
                 <td style="text-align:center;">`+ item.SecurityDeposit + `</td>
                 <td style="text-align:center;">`+ item.ModeOfPayment + `</td>
                 <td style="text-align:center;">`+ item.StartDate.split(' ')[0] + `</td>
                 <td style="text-align:center;">`+ item.EndDate.split(' ')[0] + `</td>

                 <td style="text-align:center;"> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-contract-info1" title="Other" data-unitreqid="`+ item.ContractID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td>`;




                    htm += `</tr>`;

                });

                $('.tbody-Contract-inactivelist').html(htm);

                initiateDataTableInactiveContracts();
            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }


    function LoadPropertyAddDet() {

        $.ajax({
            url: "ContractMaster.aspx/GetPropertyDDL",
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

                $('#ddlPropertyAdd').html(htm);
                PropertyID = $('#ddlPropertyAdd option:selected').val().trim();
                LoadBlockAdd();
            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    function LoadBlockAdd() {

        $.ajax({
            url: "ContractMaster.aspx/GetBlock",
            data: JSON.stringify({ "PropertyID": PropertyID, }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var htm = '';
                if (result.d.length >= 1) { htm = '<option value="-1"> --- All --- </option>'; }
                htm += '<option value="-2">NOT APPLICABLE</option>';
                $.each(result.d, function (key, item) {

                    if (key == -1) {
                        htm = '<option value="-2" selected>NOT APPLICABLE</option>';
                    }
                    else {

                        htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;
                    }
                });

                $('#ddlBlockAdd').html(htm);
                BlockId = $('#ddlBlockAdd option:selected').val() == undefined ? -2 : $('#ddlBlockAdd option:selected').val();
                LoadFloor();
                LoadUnit();
                /*LoadUnit();*/
            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }


    function LoadAddFloor() {

        debugger;
        $.ajax({
            url: "ContractMaster.aspx/GetFloor",
            data: JSON.stringify({ 'BlockID': $('#ddlBlockAdd option:selected').val(), 'PropertyID': PropertyID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var htm = '';
                /*    if (result.d.length == 0) { htm = '<option value="-1">NOT APPLICABLE</option>'; }*/
                htm = '<option value="-2">NOT APPLICABLE</option>';
                /* if (result.d.length > 1) { htm = '<option value="-1"> --- select --- </option>'; }*/

                $.each(result.d, function (key, item) {
                    if (key == -1) {
                        htm = '<option value="-2" selected>NOT APPLICABLE</option>';
                    }
                    else {

                        htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;
                    }

                });

                $('#ddlfloor').html(htm);
                $("#ddlfloor").trigger('change');

                LoadUnit();
            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

$('#txtContractPeriodFrom').on('change', function () {

  $enddate=  AddDays($('#txtContractPeriodFrom').val(), 365)

});

$('#ddlfloor').on('change', function () {

    FloorId = $('#ddlfloor option:selected').val();
});

    //function LoadUnit() {

    //    $.ajax({
    //        url: "ContractMaster.aspx/GetUnit",
    //        data: JSON.stringify({ "BlockID": BlockId, "PropertyID": PropertyID }),
    //        type: "POST",
    //        contentType: "application/json;charset=utf-8",
    //        dataType: "json",
    //        async: false,
    //        success: function (result) {
    //            /*if (UnitVal = 0) { $('#ddlUnitAdd').val('') }*/
    //                  var htm = '';
    //            if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }


    //            $.each(result.d, function (key, item) {

    //                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

    //            });

    //            $('#ddlUnitAdd').html(htm);
    //            UnitID = $('#ddlUnitAdd option:selected').val();


    //        },
    //        //complete: function () {
    //        //    $('.ajax-loader').hide();
    //        //},
    //        error: function (errormessage) {
    //            alert(errormessage.responseText);
    //        }
    //    });

    //}

    function LoadUnit() {

        $.ajax({
            url: "ContractMaster.aspx/GetUnit",
            data: JSON.stringify({ "BlockID": BlockId, "PropertyID": PropertyID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var htm = '';
                if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }


                $.each(result.d, function (key, item) {

                    htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

                });

                $('#ddlUnitAdd').html(htm);
                UnitID = $('#ddlUnitAdd option:selected').val();

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
        var x = document.getElementById("ContractDetailsRowDiv");
        if (x.style.display === "none") {
            // x.style.display = "block";
            $('#ContractDetailsRowDiv').show('400');
            $('.contract-det-drilldown').removeClass('bx bxs-chevron-down');
            $('.contract-det-drilldown').addClass('bx bxs-chevron-up');
        } else {
            //x.style.display = "none";
            $('#ContractDetailsRowDiv').hide('400');
            $('.contract-det-drilldown').removeClass('bx bxs-chevron-up');
            $('.contract-det-drilldown').addClass('bx bxs-chevron-down');

        }
    }


    $(document).ready(function () {
        $("#btn").click(function () {
            $("#Create").toggle();
        });
    });



    //$('#ddlProperty').on('change', function () {
    //    PropertyID = $('#ddlProperty option:selected').val().trim();
    //    LoadBlock();

    //});
    //$('#ddlBlock').on('change', function () {
    //    BlockId = $('#ddlBlock option:selected').val().trim();

    ///*    LoadUnit();*/
    //});
    //$('#ddlUnit').on('change', function () {
    //    UnitID = $('#ddlUnit option:selected').val().trim();
    //});





    $('#ddlPropertyAdd').on('change', function () {
        PropertyID = $('#ddlPropertyAdd option:selected').val().trim();
        LoadBlockAdd();
        GetPropertyDetailsModal();
    });

    $('#ddlBlockAdd').on('change', function () {
        BlockId = $('#ddlBlockAdd option:selected').val().trim();
        LoadFloor();
        LoadUnit();

    });


    function LoadFloor() {

        debugger;
        $.ajax({
            url: "ContractMaster.aspx/GetFloor",
            data: JSON.stringify({ 'BlockID': BlockId, 'PropertyID': PropertyID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var htm = '';
                /*    if (result.d.length == 0) { htm = '<option value="-1">NOT APPLICABLE</option>'; }*/
                htm = '<option value="-2">NOT APPLICABLE</option>';
                /* if (result.d.length > 1) { htm = '<option value="-1"> --- select --- </option>'; }*/

                $.each(result.d, function (key, item) {
                    if (key == -1) {
                        htm = '<option value="-2" selected>NOT APPLICABLE</option>';
                    }
                    else {

                        htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;
                    }

                });

                $('#ddlfloor').html(htm);
                $("#ddlfloor").trigger('change');

                LoadUnit();
            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    $('#ddlUnitAdd').on('change', function () {
        UnitID = $('#ddlUnitAdd option:selected').val().trim();
    });


    function GetPropertyDetailsModal() {

        $.ajax({
            url: "ContractMaster.aspx/GetProperyDetailsModal",
            data: JSON.stringify({ "PropertyID": PropertyID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                //$('#txtprojNumber').val(result.d.SLNo);
                $('#txtOwnerShip').val(result.d.Ownership);
                $('#txtLocation').val(result.d.Location);

                $('#txtLandLordName').val(result.d.LandlordsName);
                $('#txtEmail').val(result.d.LandlordsEmail);
                $('#txtPhone').val(result.d.LandlordsPhone);
                $('#txtPropertyType').val(result.d.Type);

                $('#txtNoOfRooms').val(result.d.NoOfRoom);
                $('#txtPropertyUsage').val(result.d.PropertyUsage);

                $('#txtPremiseNo').val(result.d.PremiseNo);

            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
function saveContract() {


    $.ajax({
        url: "ContractMaster.aspx/SaveContractDetails",
        data: JSON.stringify(
            {
                "ContractNo": $('#txtContractNo').val(),
                "PropertyID": PropertyID,
                "BlockID": $('#ddlBlockAdd').val(),
                "FloorID": $('#ddlfloor').val(),
                "UnitID": UnitID,

                "PropertyName": $('#ddlPropertyAdd').val(),
                "RoomName": $('#ddlUnitAdd').val(),
                "ContractValue": $('#txtContractValue').val(),
                "SecurityDeposit": $('#txtSecurityDepAmount').val(),
                //"ModeOfPayment": $('#ddlModeOfPayment').val(),
                //"NoOfPayments": $('#textnumberofpayments').val(),

                "StartDate": $('#txtContractPeriodFrom').val(),
                "EndDate": $('#txtContractPeriodTo').val(),
                "NoOfMonths": $('#txtNoOfMonths').val(),

                "Description": $('#txtDescription').val(),
                "Status": $('#ddlActive').val(),
                "CreatedBy": currUserId,

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Contract Saved ...', '')

            $('#Contracttenantdetails').removeClass('hidden');
            $('#btnsavecontract').addClass('hidden');

            //loadMycontractRequest();
            //loadAllContractDetails();
            //ShowPendingContract();
            //add a if statemet and check  2 button new  and renew ******// if itis renewal add RenewedContractID*************//


            if (SubmitVal == 1) {
                ContractID = result.d[0].ContractID;
                UnitID = result.d[0].UnitId;
            }

            else if (SubmitVal == 2) {
                RenewedContractID = result.d[0].ContractID;
                UnitID = result.d[0].UnitId;
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
    function addContract() {


        $.ajax({
            url: "ContractMaster.aspx/CreateContractDetails",
            data: JSON.stringify(
                {
                    "ContractNo": $('#txtContractNo').val(),
                    "PropertyID": PropertyID,
                    "BlockID": $('#ddlBlockAdd').val(),
                    "FloorID": $('#ddlfloor').val(),
                    "UnitID": UnitID,

                    "PropertyName": $('#ddlPropertyAdd').val(),
                    "RoomName": $('#ddlUnitAdd').val(),
                    "ContractValue": $('#txtContractValue').val(),
                    "SecurityDeposit": $('#txtSecurityDepAmount').val(),
                    //"ModeOfPayment": $('#ddlModeOfPayment').val(),
                    //"NoOfPayments": $('#textnumberofpayments').val(),

                    "StartDate": $('#txtContractPeriodFrom').val(),
                    "EndDate": $('#txtContractPeriodTo').val(),
                    "NoOfMonths": $('#txtNoOfMonths').val(),

                    "Description": $('#txtDescription').val(),
                    "Status": $('#ddlActive').val(),
                    "CreatedBy": currUserId,

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('New Contract Added ...', '')
                ShowPendingContract();
                loadMycontractRequest();
                


            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function ShowContractDetailsModal() {


        $.ajax({
            url: "ContractMaster.aspx/GetContractDetails",
            data: JSON.stringify({ 'RoomID': RoomID, 'ContractID': ContractID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                $('#textcontractid').val(result.d.ContractID);
                $('#txtpropertyidmdl').val(result.d.PropertyID);
                $('#textunitidmdl').val(result.d.UnitID);
                $('#textpropertynamemdl').val(result.d.PropertyName);

                $('#textblocknamemdl').val(result.d.BlockName);
                $('#textunitnamemdl').val(result.d.RoomName);
                $('#textpropertyusagemdl').val(result.d.PropertyUsage);
                $('#textnumberofpaymentsmdl').val(result.d.NoOfPayments);
                $('#textcontractvalmdl').val(result.d.ContractValue);
                $('#textsecdepositmdl').val(result.d.SecurityDeposit);

                $('#textmodeofpayment').val(result.d.ModeOfPayment);
                $('#textbenefrybankmdl').val(result.d.BeneficiearyBank);
                $('#textstartdatemdl').val(result.d.StartDate);
                $('#textcontraenddatemld').val(result.d.EndDate);
                $('#textnoOfmnthmdl').val(result.d.NoOfMonths);
                $('#textdescmdl').val(result.d.Description);
                $('#textstatus').val(result.d.Status);
                $('#textContractApprovel').val(result.d.ApprovedStatus);
                $('#textmoveinstageapprovel').val(result.d.MoveInStage1Approvel);
                $('#textMovingStage2Appeovel').val(result.d.MoveInStage2Approvel);
                $('#textrenewalstage1approvel').val(result.d.RenewalStage1Approvel);
                $('#textterminationapprovel').val(result.d.TerminationApprovel);
                $('#textRevenewamount').val(result.d.RenewalAmount);
                $('#textcreatedBy').val(result.d.CreatedBy);


            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }

        });
    }





    function ShowPendingContract() {

        $.ajax({
            url: "ContractMaster.aspx/GetPendingContract",
            data: JSON.stringify({ 'UserID': currUserId }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                $('.tbody-pending-contract tr').length > 0 ? objDatatablePendingContract.destroy() : '';
                //clearmodal();

                var htm = '';
                var ProjectDetails = result.d;
                $.each(ProjectDetails, function (key, item) {
                    //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                    htm += `  <tr>

                 <td style="text-align:center;">`+ item.ContractNo + `</td>
                 <td style="text-align:center;display:none">`+ item.PropertyID + `</td>
                   <td style="text-align:center;display:none">`+ item.RoomID + `</td>
                  <td style="text-align:center;display:none">`+ item.BlockID + `</td> 
                  
                  <td style="text-align:center;display:none">`+ item.ContractID + `</td>  
                
                  <td style="text-align:center;">`+ item.PropertyName + `</td>
                  <td style="text-align:center;display:none">`+ item.BlockName + `</td>
                  <td style="text-align:center;">`+ item.RoomName + `</td>
                  <td style="text-align:center;">`+ item.Status + `</td>  
                   <td style="text-align:center;">`+ item.NoOfMonths + `</td>  
                 <td style="text-align:center;">`+ item.StartDate.split(' ')[0] + `</td>
                 <td style="text-align:center;">`+ item.EndDate.split(' ')[0] + `</td>

                 <td style="text-align:center;"> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-pending-contrractDtls" title="Other" data-unitreqid="`+ item.ContractID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td>`;


                    htm += `</tr>`;

                });

                $('.tbody-pending-contract').html(htm);

                initiateDataTablePendingContract();
            },


            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }

    function ShowPendingContractDtlsModal() {


        $.ajax({
            url: "ContractMaster.aspx/GetPendingContractDetails",
            data: JSON.stringify({ 'UnitID': UnitID, 'ContractID': ContractID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                $('#textcontractid1').val(result.d.ContractID);
                $('#txtpropertyidmdl1').val(result.d.PropertyID);
                $('#textunitidmdl1').val(result.d.UnitID);
                $('#textpropertynamemdl1').val(result.d.PropertyName);

                $('#textblocknamemdl1').val(result.d.BlockName);
                $('#textunitnamemd1l').val(result.d.RoomName);
                $('#textpropertyusagemdl1').val(result.d.PropertyUsage);
                $('#textchilleraccNomdl1').val(result.d.ChillerAccountNumber);
                $('#textcontractvalmdl1').val(result.d.ContractValue);
                $('#textsecdepositmdl1').val(result.d.SecurityDeposit);

                //$('#textmodeofpayment1').val(result.d.ModeOfPayment);
                $('#textbenefrybankmdl1').val(result.d.BeneficiearyBank);
                $('#textstartdatemdl1').val(result.d.StartDate);
                $('#textcontraenddatemld1').val(result.d.EndDate);
                $('#textnoOfmnthmdl1').val(result.d.NoOfMonths);
                $('#textdescmdl1').val(result.d.Description);
                $('#textstatus1').val(result.d.Status);

            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }

        });
    }

    function ShowPendingContractActions() {

        $.ajax({
            url: "ContractMaster.aspx/GetpendingContraAction",
            data: JSON.stringify({ 'ContractID': ContractID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                $('.tbody-unitreq-actions tr').length > 0 ? objDatatableUnitReqAction.destroy() : '';
                //clearmodal();

                var htm = '';
                var ProjectDetails = result.d;
                $.each(ProjectDetails, function (key, item) {
                    //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                    htm += `  <tr>
                
                 <td>`+ item.Role_Name + `</td>
                 
                 <td>`+ item.UAliasName + `</td>

                 <td>`+ item.UpdatedDate + `</td>
                 <td>`+ item.Comments + `</td>
                 <td>`+ item.Status + `</td>`;

                    htm += `</tr>`;

                });

                $('.tbody-pendingContra-Action').html(htm);

                //initiateDataTableUnitRequestAction();
            },


            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }

    function PendingContractButtonAcess() {

        $.ajax({
            url: "ContractMaster.aspx/GetPendingContractButtonAcess",
            data: JSON.stringify({ 'UserID': currUserId, 'ContractID': ContractID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                curr_user_role = result.d.Role_Name;

            },


            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }

    function pendingStatusUpdate(status) {

        $.ajax({
            url: "ContractMaster.aspx/UpdatePendingStatusApproved",
            data: JSON.stringify({ 'UserID': currUserId, 'ContractID': ContractID, 'Status': status }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                //objDatatable.destroy();


                if (status == "APPROVED") {
                    $('#btnunitReqApproved').addClass('hidden');
                    $('#btnUnitReqVerified').addClass('hidden');
                    $('#btnunitReqRejected').addClass('hidden');

                    toastr.success('Status Updated..', '')
                }


                else if (status == "REJECTED") {
                    $('#btnunitReqRejected').addClass('hidden');
                    $('#btnunitReqApproved').addClass('hidden');
                    $('#btnUnitReqVerified').addClass('hidden');
                }


                ShowPendingContractActions();
                loadAllContractDetails();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }


    function RejectReason() {
        $.ajax({
            url: "ContractMaster.aspx/UpdatRejectReason",

            data: JSON.stringify(

                {

                    "myroleList": myroleList,
                    "ContractID": ContractID,
                    "UserID": currUserId,

                    "Comments": $('#textreasonforrejection').val(),



                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Request Rejected..!', '')
                /*  GetAllfloorDDL();*/

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
    function ShowTenantdocuments() {

        $.ajax({
            url: "ContractMaster.aspx/GetTenantDocumentslist",
            data: JSON.stringify({ 'ContractID': ContractID }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                //$('.tbody-unitreq-actions tr').length > 0 ? objDatatableUnitReqAction.destroy() : '';
                //clearmodal();

                var htm = '';
                var ProjectDetails = result.d;
                //if (result.d.length = 0) {

                //    $('.btn-docsubmit').prop("disabled", false);


                //}
                //else {
                $.each(ProjectDetails, function (key, item) {


                    htm += `  <tr>
                
                 <td>`+ item.Id + `</td>
                 
                 <td>`+ item.DocumentName + `</td>

                
                <td style="display:inline-flex;width:95%">

                    


                     <div class="input-group" style="width:75%" id="btn-documetuploaded">        
                             <label style="margin-right: 10px;display:none;" class="lbl-fufile-count"></label>
                             <input class="form-control" type="file" id="fu-docment-attach" accept=".doc,.docx,.pdf,.png,.jpeg" style="display:none;" multiple="">
                             <label class="input-group-text ml-3" for="fu-docment-attach"><i class="fa fa-upload " title="Upload File" style="color: #2196F3; cursor: pointer; font-size: large;"></i></label>

                            <a href="#" id="btnsaveDocuments" class="btn btn-upload" style="margin-left: 4px;border-radius: 10px;" onclick=uploadDocumentAttach(`+ item.Id + `,false)>Upload </a>
                                                       
                             <input type="text" id="lblFilesName" value="" style= "background: #80808000; border:; color: #697a8d; border: none; margin-left:10px;" readonly="">

                           
                        </div>
                    <div class="form-check">
                              <input class="form-check-input check-Notapplicable" id=checknotapplicable-`+ item.Id + ` type="checkbox" value="Not Applicable" /> 
                               <label class="form-check-label" for="defaultCheck3">Not Applicable</label
                             <div>


                </td>
              
               `;



                    htm += `</tr>`;

                });
                //}
                $('.tbody-documents-list').html(htm);


            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }



    $('.tbody-documents-list').on('change', '.check-Notapplicable', function () {

        if ($(this).is(':checked')) {
            sec = 1;
            uploadDocumentAttach(this.parentNode.parentNode.parentNode.children[0].textContent, $(this).is(':checked'));
        }
        else {
            sec = 0;
        }
    });

    //$('.tbody-Docmovein-final').on('change', '.check-Notapplicablefinal', function () {

    //    if ($(this).is(':checked')) {
    //        sec = 1;
    //        uploadDocumentAttach(this.parentNode.parentNode.parentNode.children[0].textContent, $(this).is(':checked'));
    //    }
    //    else {
    //        sec = 0;
    //    }
    //});





    function uploadDocumentAttach(docId, cb) {

        if ($('#fu-docment-attach')[0].files.length == 0 && !cb) {
            toastr.error('Please select file to upload. ', '')
        }
        //else if ($("#checknotapplicable-" + docId).is(':checked'))
        //{

        //}
        else {

            var formData = new FormData();
            var fileUpload = $('#fu-docment-attach').get(0);
            var files = fileUpload.files;
            for (var i = 0; i < files.length; i++) {
                console.log(files[i].name);
                formData.append(files[i].name, files[i]);
            }

           //var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FMContractDocument.ashx?contractid=' + ContractID + '&crdate=' + getDateWithTime() + '&crby=' + currUserId + '&unitid=' + RoomID + '&docchlistid=' + docId + '&nacheckbox=' + cb;   //for Live
            var qrystringLocal = '/Services/FMContractDocument.ashx?contractid=' + ContractID + '&crdate=' + getDateWithTime() + '&crby=' + currUserId + '&unitid=' + RoomID + '&docchlistid=' + docId + '&nacheckbox=' + cb;  // For Development

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
                        //  $("#myUploadedImg").attr("src", my_path);
                        toastr.success('File has been Uploaded Successfully. ', '');

                        ShowMoveinFinalDocumetsCount();
                        ShowTenantdocuments();
                        ShowRenewalstage1Doc();
                        ShowDocumentDetails();
                        ShowTerminationDocs();
                        ShowMovOutStage1Docs();
                        ShowInitateMoveoutStage1Docs();
                        ShowFinalMoveoutDocs();
                        ShowFinalMoveoutDocList();
                        ShowFinalEstimationDocList();
                        ShowSecurityDepositRefund();
                        ShowSecurityDepositRefundDocList();


                        //loadAttachsOfChat();
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
        return new Date().getFullYear() + '-' + new Date().getMonth() + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes()
    }


    function ShowMoveinFinalDocuments() {

        $.ajax({
            url: "ContractMaster.aspx/GetMoveInFinalDoc",
            data: JSON.stringify({ 'ContractID': ContractID }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {


                var htm = '';
                var ProjectDetails = result.d;

                $.each(ProjectDetails, function (key, item) {


                    htm += `  <tr>
                
                 <td>`+ item.Id + `</td>
                 
                 <td>`+ item.DocumentName + `</td>

                
                <td style="display:inline-flex;width:95%">

                    


                     <div class="input-group" style="width:75%" id="btn-documetuploaded">        
                             <label style="margin-right: 10px;display:none;" class="lbl-fufile-count"></label>
                             <input class="form-control" type="file" id="final-docment-attach" accept=".doc,.docx,.pdf,.png,.jpeg" style="display:none;" multiple="">
                             <label class="input-group-text ml-3" for="final-docment-attach"><i class="fa fa-upload " title="Upload File" style="color: #2196F3; cursor: pointer; font-size: large;"></i></label>

                            <a href="#" id="btnsavefinalDocuments" class="btn btn-upload" style="margin-left: 4px;border-radius: 10px;" onclick=uploadDocumentAttachFinalApprovl(`+ item.Id + `,false)>Upload </a>
                                                       
                             <input type="text" id="lblFilesName" value="" style= "background: #80808000; border:; color: #697a8d; border: none; margin-left:10px;" readonly="">

                           
                        </div>
                   


                    <div class="form-check" style="display:none">
                              <input class="form-check-input check-Notapplicablefinal" id=checknotapplicablefinal-`+ item.Id + ` type="checkbox" value="Not Applicable" /> 
                               <label class="form-check-label" for="defaultCheck3">Not Applicable</label
                             <div>


                </td>  `;



                    htm += `</tr>`;

                });

                $('.tbody-Docmovein-final').html(htm);


            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }
    function uploadDocumentAttachFinalApprovl(docId, cb) {

        if ($('#final-docment-attach')[0].files.length == 0 && !cb) {
            toastr.error('Please select file to upload. ', '')
        }
        //else if ($("#checknotapplicable-" + docId).is(':checked'))
        //{

        //}
        else {

            var formData = new FormData();
            var fileUpload = $('#final-docment-attach').get(0);
            var files = fileUpload.files;
            for (var i = 0; i < files.length; i++) {
                console.log(files[i].name);
                formData.append(files[i].name, files[i]);
            }

           //var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FMContractDocument.ashx?contractid=' + ContractID + '&crdate=' + getDateWithTime() + '&crby=' + currUserId + '&unitid=' + RoomID + '&docchlistid=' + docId + '&nacheckbox=' + cb;   //for Live
           var qrystringLocal = '/Services/FMContractDocument.ashx?contractid=' + ContractID + '&crdate=' + getDateWithTime() + '&crby=' + currUserId + '&unitid=' + RoomID + '&docchlistid=' + docId + '&nacheckbox=' + cb;  // For Development

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
                        //  $("#myUploadedImg").attr("src", my_path);
                        toastr.success('File has been Uploaded Successfully. ', '');
                        ShowMoveinFinalDocApproved();
                        ShowMoveinFinalDocuments();

                        //loadAttachsOfChat();
                        $('#lblFilesName').val('');
                        $('.lbl-fufile-count').html('');
                        $('#final-docment-attach').val('');


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

    function addTenant() {


        $.ajax({
            url: "ContractMaster.aspx/CreateTenantDetails",
            data: JSON.stringify(
                
                {

                    "ContractID": ContractID,
                    "UnitID": UnitID,
                    "TenantType": $('#textenanttype').val(),
                    "ENumber": $('#textemporpassNo').val(),
                    "Name": $('#texttenantname').val(),
                    "Email": $('#texttenantemaiul').val(),
                    "PhoneNumber": $('#texttenantphnumber').val(),
                    "CreatedBy": currUserId,
                    "LastUpdatedBy": currUserId,
                    


                }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('New Tenant Created..!', '')
                ShowTenantDetails();
                //IsTenentUnderWorkOrder();

            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function ShowTenantDetails() {

        $.ajax({
            url: "ContractMaster.aspx/GetTenantdetails",
            data: JSON.stringify({ 'ContractID': ContractID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                var htm = '';
                var ProjectDetails = result.d;
                $.each(ProjectDetails, function (key, item) {


                    htm += `  <tr>

                 <td style="display:none">`+ item.TenantID + `</td>
                 <td style="display:none">`+ item.ContractID + `</td>
                 
                 <td style="display:none">`+ item.UnitID + `</td>

                 <td>`+ item.TenantType + `</td>
                 <td>`+ item.ENumber + `</td>
                  <td>`+ item.Name + `</td>
                 <td>`+ item.Email + `</td>
                 <td>`+ item.PhoneNumber + `</td>
                 <td style="display:none">`+ item.CreatedDate + `</td>`;

                    htm += `</tr>`;

                });

                $('.tbody-tenant-details').html(htm);


                //initiateDataTableUnitRequestAction();
            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


}

function TenantDetailsApprovel() {

    $.ajax({
        url: "ContractMaster.aspx/TenantDetailsApprovel",
        data: JSON.stringify({ 'ContractID': ContractID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {


                htm += `  <tr>

                 <td style="display:none">`+ item.TenantID + `</td>
                 <td style="display:none">`+ item.ContractID + `</td>
                 
                 <td style="display:none">`+ item.UnitID + `</td>

                 <td>`+ item.TenantType + `</td>
                 <td>`+ item.ENumber + `</td>
                  <td>`+ item.Name + `</td>
                 <td>`+ item.Email + `</td>
                 <td>`+ item.PhoneNumber + `</td>
                 <td style="display:none">`+ item.CreatedDate + `</td>`;

                htm += `</tr>`;

            });

            $('.tbody-tenantDetails').html(htm);


            //initiateDataTableUnitRequestAction();
        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

    function addPaymentDetails() {


        $.ajax({
            url: "ContractMaster.aspx/CreatePaymentDetails",
            data: JSON.stringify(

                {

                    "ContractID": ContractID,
                    "UnitID": UnitID,
                    "PaymentMethod": $('#ddlModeOfPayment').val(),
                    "PayeeName": $('#textpayeename').val(),
                    "BankName": $('#textbankname').val(),
                    "CashAmount": $('#textamount').val(),
                    "PaymentDate": $('#textpaymentdate').val(),
                    "ChequeNumber": $('#textchequenumber').val(),
                    /*"ChequeAmount": $('#textchequeamount').val(),*/

                    "PaymentStatus": $('#ddlpaymentstatus').val(),

                    "CreatedBy": currUserId,
                    "LastUpdatedBy": currUserId,


                }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('New Payment Details Added..!', '')

                if (SubmitVal == 1) {
                    $('#add-contract').removeClass('hidden');
                    $('#renewal-contract').addClass('hidden');
                }
                else if (SubmitVal == 2) {
                    $('#add-contract').addClass('hidden');
                    $('#renewal-contract').removeClass('hidden');
                }
                //IsAddTenantPaymentdetails();
                ShowPaymentDetails();
                ShowPaymentMethods();

                //BtnAcessAddRewedContract();

            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }


    function ShowPaymentDetails() {

        $.ajax({
            url: "ContractMaster.aspx/Getpaymentdetails",
            data: JSON.stringify({ 'ContractID': ContractID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                var htm = '';
                var ProjectDetails = result.d;
                $.each(ProjectDetails, function (key, item) {


                    htm += `  <tr>

                 <td style="display:none">`+ item.PaymentDetailsID + `</td>
                 <td style="display:none">`+ item.ContractID + `</td>
                 
                 <td style="display:none">`+ item.UnitID + `</td>
                 <td>`+ item.PaymentMethod + `</td>
                 <td>`+ item.PayeeName + `</td>
                 <td>`+ item.BankName + `</td>
                 <td>`+ item.CashAmount + `</td>
                 <td>`+ item.PaymentDate + `</td>
                 <td>`+ item.ChequeNumber + `</td>
                
                   <td>`+ item.PaymentStatus + `</td>`;

                    htm += `</tr>`;

                });

                $('.tbody-payment-Details').html(htm);


                //initiateDataTableUnitRequestAction();
            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


}

function PaymentDetailsApprovels() {

    $.ajax({
        url: "ContractMaster.aspx/PaymentDetailsApprovels",
        data: JSON.stringify({ 'ContractID': ContractID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {


                htm += `  <tr>

                 <td style="display:none">`+ item.PaymentDetailsID + `</td>
                 <td style="display:none">`+ item.ContractID + `</td>
                 
                 <td style="display:none">`+ item.UnitID + `</td>
                 <td>`+ item.PaymentMethod + `</td>
                 <td>`+ item.PayeeName + `</td>
                 <td>`+ item.BankName + `</td>
                 <td>`+ item.CashAmount + `</td>
                 <td>`+ item.PaymentDate + `</td>
                 <td>`+ item.ChequeNumber + `</td>
               
                 <td>`+ item.PaymentStatus + `</td>`;

                htm += `</tr>`;

            });

            $('.tbody-paymentDetails').html(htm);


            //initiateDataTableUnitRequestAction();
        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

    function ShowDocumentDetails() {



        $.ajax({
            url: "ContractMaster.aspx/GetDocumentDetails",
            data: JSON.stringify({ 'ContractID': ContractID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                var htm = '';
                AttachDetailsList = result.d;
                $.each(AttachDetailsList, function (key, item) {

                    //let iterSrcImg = 'https://egate.naffco.com:8585/Common/DownloadFile?filePath=' + item.ImageURL.replaceAll(' ', '%20');

                   // let iterSrcImg = '/Services/FMDocDownload.ashx?FileName=' + item.FileName;

                    let iterSrcImg = 'https://crmss.naffco.com/CRMSS/Services/FMDocDownload.ashx?FileName=' + item.FileName;


                    htm += `  <tr>
                <td class="hidden" data-filepath="`+ item.FilePath + `">` + item.DocumetID + `</td>
                 <td style="display:none">`+ item.DocumetID + `</td>
                 <td style="display:none">`+ item.ContractID + `</td>
                 
                 <td style="display:none">`+ item.UnitID + `</td>
                 <td style="display:none">`+ item.DocChListID + `</td>
                 <td>`+ item.DocumentName + `</td>
                 <td style="display:none">`+ item.ImageURL + `</td>
                 <td>`+ item.FileName + `</td>
                 <td>`+ item.Stage + `</td>
                 <td>`+ item.Status + `</td>  

                <td> 
                    <span style="margin-left: 5%;">  <i class="fa fa-trash deleteIcon fa-icon-hover" aria-hidden="true" style='color:#2196F3; cursor:pointer;font-size: x-large;'></i> </span>
                   
                    <span style="margin-left: 5%;"><a href="`+ iterSrcImg + `"> <i class="fa fa-download docDownloadIcon fa-icon-hover" title="` + item.FileName + `" style="color:#2196F3; cursor:pointer;font-size: x-large;"></i></a></span>

                </td> `;

                    htm += `</tr>`;

                });

                $('.tbody-documetlist').html(htm);


                //initiateDataTableUnitRequestAction();
            },

            //<span style="margin-left: 5%;"> <i class="fa fa-eye showFileIcon fa-icon-hover" title="View File" style="color:#2196F3; cursor:pointer;font-size: x-large;"></i></span>
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });



    }



    function ShowDocumetsCount() {

        $.ajax({
            url: "ContractMaster.aspx/GetDocumentCount",
            data: JSON.stringify({ 'ContractID': ContractID, 'UserID': currUserId }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                /* var htm = '';*/
                /* var AttachDetailsList = result.d;*/

                if (result.d.length == 0) {
                    $('.btn-add-documents').css("display", 'none');
                    $('.btn-submit-dcocument').css("display", 'none');
                    $('.btn-doc-approved').css("display", 'none');
                    $('.btn-doc-verified').css("display", 'none');
                    $('.btn-doc-rejected').css("display", 'none');
                    $('.btn-contractRenewalAmount').css('display', 'none');
                    //$('#ModalContractDetails').modal('show');
                }
                else {
                    if (result.d[0].DocCount != 0) {


                        $('.btn-add-documents').css("display", 'block');
                        $('.btn-submit-dcocument').css("display", 'none');
                        $('.btn-doc-approved').css("display", 'none');
                        $('.btn-doc-verified').css("display", 'none');
                        $('.btn-doc-rejected').css("display", 'none');
                        $('.btn-contractRenewalAmount').css('display', 'none');



                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MoveinStage1Approval == "PENDING") {

                        //result.d[0].MoveinStage1Approval == "REJECTED")
                        $('.btn-add-documents').css("display", 'none');
                        $('.btn-submit-dcocument').css("display", 'block');
                        $('.btn-doc-approved').css("display", 'none');
                        $('.btn-doc-verified').css("display", 'none');
                        $('.btn-doc-rejected').css("display", 'none');
                        $('.btn-contractRenewalAmount').css('display', 'none');
                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MoveinStage1Approval == "VERIFY") {

                        $('.btn-add-documents').css("display", 'none');
                        $('.btn-submit-dcocument').css("display", 'none');
                        $('.btn-doc-approved').css("display", 'none');
                        $('.btn-doc-verified').css("display", 'block');
                        $('.btn-doc-rejected').css("display", 'block');
                        $('.btn-contractRenewalAmount').css('display', 'none');
                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MoveinStage1Approval == "APPROVE") {

                        $('.btn-add-documents').css("display", 'none');
                        $('.btn-submit-dcocument').css("display", 'none');
                        $('.btn-doc-approved').css("display", 'block');
                        $('.btn-doc-verified').css("display", 'none');
                        $('.btn-doc-rejected').css("display", 'block');
                        $('.btn-contractRenewalAmount').css('display', 'none');
                    }

                    else if (result.d[0].DocCount == 0 && result.d[0].MoveinStage1Approval == "APPROVED") {

                        $('.btn-add-documents').css("display", 'none');
                        $('.btn-submit-dcocument').css("display", 'none');
                        $('.btn-doc-approved').css("display", 'none');
                        $('.btn-doc-verified').css("display", 'none');
                        $('.btn-doc-rejected').css("display", 'none');
                        $('.btn-contractRenewalAmount').css('display', 'none');
                    }
                    else {

                        $('.btn-add-documents').css("display", 'none');
                        $('.btn-submit-dcocument').css("display", 'none');
                        $('.btn-doc-approved').css("display", 'none');
                        $('.btn-doc-verified').css("display", 'none');
                        $('.btn-doc-rejected').css("display", 'none');
                        $('.btn-contractRenewalAmount').css('display', 'none');
                    }
                }



            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });



    }

    function ShowMoveinFinalDocumetsCount() {

        $.ajax({
            url: "ContractMaster.aspx/GetMoveInFinalDocCount",
            data: JSON.stringify({ 'ContractID': ContractID, 'UserID': currUserId }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                /* var htm = '';*/
                /* var AttachDetailsList = result.d;*/

                if (result.d.length == 0) {

                    $('.btn-add-moveinFinalDoc').css("display", 'none');
                    $('.btn-submit-finalDoc').css("display", 'none')
                    $('.btnMovinFinaleReqApproved').css("display", 'none');
                    $('.btnMovinFinalReqVerified').css("display", 'none');
                    $('.btnMoveinfinalReqRejected').css("display", 'none');
                    //$('.btn-addrenewal-contracts').css("display", 'none');

                }
                else {
                    if (result.d[0].DocCount != 0) {


                        $('.btn-add-moveinFinalDoc').css("display", 'block');
                        $('.btn-submit-finalDoc').css("display", 'none')

                        $('.btnMovinFinaleReqApproved').css("display", 'none');
                        $('.btnMovinFinalReqVerified').css("display", 'none');
                        $('.btnMoveinfinalReqRejected').css("display", 'none');
                        //$('.btn-addrenewal-contracts').css("display", 'none');

                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MoveinStage2Approval == "PENDING") {


                        $('.btn-add-moveinFinalDoc').css("display", 'none');
                        $('.btn-submit-finalDoc').css("display", 'block');
                        $('.btnMovinFinaleReqApproved').css("display", 'none');
                        $('.btnMovinFinalReqVerified').css("display", 'none');
                        $('.btnMoveinfinalReqRejected').css("display", 'none');
                        //$('.btn-addrenewal-contracts').css("display", 'none');
                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MoveinStage2Approval == "VERIFY") {

                        $('.btn-add-moveinFinalDoc').css("display", 'none');
                        $('.btn-submit-finalDoc').css("display", 'none');
                        $('.btnMovinFinaleReqApproved').css("display", 'none');
                        $('.btnMovinFinalReqVerified').css("display", 'block');
                        $('.btnMoveinfinalReqRejected').css("display", 'block');
                        //$('.btn-addrenewal-contracts').css("display", 'none');
                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MoveinStage2Approval == "APPROVE") {

                        $('.btn-add-moveinFinalDoc').css("display", 'none');
                        $('.btn-submit-finalDoc').css("display", 'none');
                        $('.btnMovinFinaleReqApproved').css("display", 'block');
                        $('.btnMovinFinalReqVerified').css("display", 'none');
                        $('.btnMoveinfinalReqRejected').css("display", 'block');
                        //$('.btn-addrenewal-contracts').css("display", 'none');

                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MoveinStage2Approval == "APPROVED") {


                        //$('.btncontract-RenewStage1').css("display", 'block');
                        //$('.btncontract-termination').css("display", 'block');
                        //$('.btn-addrenewal-contracts').css("display", 'none');


                        $('.btn-add-moveinFinalDoc').css("display", 'none');
                        $('.btn-submit-finalDoc').css("display", 'none');
                        $('.btnMovinFinaleReqApproved').css("display", 'none');
                        $('.btnMovinFinalReqVerified').css("display", 'none');
                        $('.btnMoveinfinalReqRejected').css("display", 'none');
                        //$('.btn-addrenewal-contracts').css("display", 'none');

                    }
                    else {

                        $('.btn-add-moveinFinalDoc').css("display", 'none');
                        $('.btn-submit-finalDoc').css("display", 'none');
                        $('.btnMovinFinaleReqApproved').css("display", 'none');
                        $('.btnMovinFinalReqVerified').css("display", 'none');
                        $('.btnMoveinfinalReqRejected').css("display", 'none');
                        //$('.btn-addrenewal-contracts').css("display", 'none');
                    }
                }

                $('#ModalContractDetails').modal('show');

            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });



    }

    function Stage1ApprovelStatusUpdate() {
        $.ajax({
            url: "ContractMaster.aspx/addStage1ApprovelDetails",

            data: JSON.stringify(

                {

                    "myroleList": myroleList,
                    "ContractID": ContractID,
                    "UserID": currUserId,
                    "CreatedBy": $('#textcreatedBy').val(),


                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Document Submitted..!', '')
                /*  GetAllfloorDDL();*/

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }


    function Stage2ApprovelStatusUpdate() {
        $.ajax({
            url: "ContractMaster.aspx/addStage2ApprovelDetails",

            data: JSON.stringify(

                {

                    "myroleList": myroleList,
                    "ContractID": ContractID,
                    "UserID": currUserId,

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Document Submitted..!', '')
                /*  GetAllfloorDDL();*/

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }


    function ContractDocPreApprovel(status) {

        $.ajax({
            url: "ContractMaster.aspx/updateContractDocPreApprovel",
            data: JSON.stringify({ 'UserID': currUserId, 'ContractID': ContractID, 'Status': status }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                if (status == "APPROVED") {

                    $('.btn-doc-rejected').css("display", 'none');
                    $('.btn-doc-verified').css("display", 'none');
                    $('.btn-doc-approved').css("display", 'none');

                    toastr.success('Status Updated..', '')
                }


                else if (status == "REJECTED") {
                    //$('.btnDocReqApproved').css("display", 'none');
                    //$('.btnDocReqRejected').css("display", 'none');
                    //$('.btnDocReqVerified').css("display", 'none');
                }

                //$('#ModalContractDetails').modal('show');
                //$(#ModalContractDetails).hide().show();
                //ShowPendingContractActions();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }


    function MoveinfinalApprovel(status) {

        $.ajax({
            url: "ContractMaster.aspx/updateMovinFinalApprovel",
            data: JSON.stringify({ 'UserID': currUserId, 'ContractID': ContractID, 'Status': status }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                if (status == "APPROVED") {
                    $('.btnMovinFinalReqVerified').css("display", 'none');
                    $('.btnMovinFinaleReqApproved').css("display", 'none');
                    $('.btnMoveinfinalReqRejected').css("display", 'none');


                    toastr.success('Status Updated..', '')
                }


                else if (status == "REJECTED") {
                    //$('#MovinFinaleReqApproved').addClass('hidden');

                    //$('#MovinFinalReqVerified').addClass('hidden');
                    //$('#MoveinfinalReqRejected').addClass('hidden');

                }

                //$('#ModalContractDetails').modal('show');
                //$(#ModalContractDetails).hide().show();
                //ShowPendingContractActions();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }


    function DocumentRejectReason(status) {
        $.ajax({
            url: "ContractMaster.aspx/UpdatDocRejectReason",

            data: JSON.stringify(

                {

                    "myroleList": myroleList,
                    "ContractID": ContractID,
                    "UserID": currUserId,

                    "Comments": $('#textdocrjection').val(),





                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                toastr.success('Request Rejected..!', '')



                $('.btnDocReqApproved').css("display", 'none');
                $('.btnDocReqRejected').css("display", 'none');
                $('.btnDocReqVerified').css("display", 'none');

                //$(#ModalContractDetails).hide().show();

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }


    function ShowMoveinFinalDocApproved() {

        $.ajax({
            url: "ContractMaster.aspx/GetMoveInApprovedDoc",
            data: JSON.stringify({ 'ContractID': ContractID, 'DocChListID': DocChListID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                var htm = '';
                AttachDetailsList = result.d;
                $.each(AttachDetailsList, function (key, item) {

                    //let iterSrcImg = '/Services/FMDocDownload.ashx?FileName=' + item.FileName;

                    let iterSrcImg = 'https://crmss.naffco.com/CRMSS/Services/FMDocDownload.ashx?FileName=' + item.FileName;

                    htm += `  <tr>

                 <td style="display:none">`+ item.DocumetID + `</td>
                 <td style="display:none">`+ item.ContractID + `</td>
                 
                 <td style="display:none">`+ item.UnitID + `</td>
                 <td>`+ item.DocChListID + `</td>
                 <td>`+ item.DocumentName + `</td>
                 <td style="display:none">`+ item.ImageURL + `</td>
                 <td>`+ item.FileName + `</td>
                 <td style="display:none">`+ item.Stage + `</td>
                 <td>`+ item.Status + `</td>

                 <td>
                    
                     <span style="margin-left: 5%;">  <i class="fa fa-trash deleteIcon fa-icon-hover" aria-hidden="true" style='color:#2196F3; cursor:pointer;font-size: x-large;'></i> </span>
                    
                    <span style="margin-left: 5%;"><a href="`+ iterSrcImg + `"> <i class="fa fa-download docDownloadIcon fa-icon-hover" title="` + item.FileName + `" style="color:#2196F3; cursor:pointer;font-size: x-large;"></i></a></span>

                 </td>`;

                    htm += `</tr>`;

                });

                $('.tbody-movein-finaldoc').html(htm);


                //initiateDataTableUnitRequestAction();
            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }
    $('.btn-delstage1-attach-yes').on('click', function () {

        $.ajax({
            url: "ContractMaster.aspx/DeleteAttachStage1Doc",
            data: JSON.stringify({ "ContractID": docContractID, "DocumetID": DocumetID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Deleted Successfully', '');
                //$('.document-upload-details td').length > 0 ? objDatatablePaySch.destroy() : '';
                $('#delAttachModal').modal('hide');
                ShowDocumentDetails();
                ShowDocumetsCount();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    });


    function ShowRenewalstage1Documents() {

        $.ajax({
            url: "ContractMaster.aspx/GetRenewalstage1doclist",
            data: JSON.stringify({ 'ContractID': ContractID }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                //$('.tbody-unitreq-actions tr').length > 0 ? objDatatableUnitReqAction.destroy() : '';
                //clearmodal();

                var htm = '';
                var ProjectDetails = result.d;
                //if (result.d.length = 0) {

                //    $('.btn-docsubmit').prop("disabled", false);


                //}
                //else {
                $.each(ProjectDetails, function (key, item) {


                    htm += `  <tr>
                
                 <td style="display:none">`+ item.Id + `</td>
                 
                 <td>`+ item.DocumentName + `</td>

                
                <td style="display:inline-flex;width:95%">

                    
                     <div class="input-group" style="width:75%" id="btn-documetuploaded">        
                             <label style="margin-right: 10px;display:none;" class="lbl-fufile-count"></label>
                             <input class="form-control" type="file" id="fu-docment-attach" accept=".doc,.docx,.pdf,.png,.jpeg" style="display:none;" multiple="">
                             <label class="input-group-text ml-3" for="fu-docment-attach"><i class="fa fa-upload " title="Upload File" style="color: #2196F3; cursor: pointer; font-size: large;"></i></label>

                            <a href="#" id="btnsaveDocuments" class="btn btn-upload" style="margin-left: 4px;border-radius: 10px;" onclick=uploadDocumentAttach(`+ item.Id + `,false)>Upload </a>
                                                       
                             <input type="text" id="lblFilesName" value="" style= "background: #80808000; border:; color: #697a8d; border: none; margin-left:10px;" readonly="">

                           
                        </div>
                    <div class="form-check" style="display:none">
                              <input class="form-check-input check-Notapplicable" id=checknotapplicable-`+ item.Id + ` type="checkbox" value="Not Applicable" /> 
                               <label class="form-check-label" for="defaultCheck3">Not Applicable</label
                             <div>


                </td>
              
               `;



                    htm += `</tr>`;

                });
                //}
                $('.tbody-Doc-renewal-stage1').html(htm);

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }

    function ShowRenewalstage1Doc() {

        $.ajax({
            url: "ContractMaster.aspx/GetRenewalstage1Doc",
            data: JSON.stringify({ 'ContractID': ContractID, 'DocChListID': DocChListID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                var htm = '';
                AttachDetailsList = result.d;
                $.each(AttachDetailsList, function (key, item) {

                    //let iterSrcImg = '/Services/FMDocDownload.ashx?FileName=' + item.FileName;
                    let iterSrcImg = 'https://crmss.naffco.com/CRMSS/Services/FMDocDownload.ashx?FileName=' + item.FileName;

                    htm += `  <tr>

                 <td style="display:none">`+ item.DocumetID + `</td>
                 <td style="display:none">`+ item.ContractID + `</td>
                 
                 <td style="display:none">`+ item.UnitID + `</td>
                 <td style="display:none">`+ item.DocChListID + `</td>
                 <td>`+ item.DocumentName + `</td>
                 <td style="display:none">`+ item.ImageURL + `</td>
                 <td>`+ item.FileName + `</td>
                 <td>`+ item.Stage + `</td>
                 <td>`+ item.Status + `</td>

                 <td>
                    
                     
                   
                    <span style="margin-left: 5%;"><a href="`+ iterSrcImg + `"> <i class="fa fa-download docDownloadIcon fa-icon-hover" title="` + item.FileName + `" style="color:#2196F3; cursor:pointer;font-size: x-large;"></i></a></span>

                 </td>`;

                    htm += `</tr>`;

                });

                $('.tbody-renewal-stage1').html(htm);

                $('#btn-contract-renewal').addClass('hidden');
                $('#btn-Renewalstage1-submit').removeClass('hidden');

                //initiateDataTableUnitRequestAction();
            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    function RenewalStage1docSubmit() {
        $.ajax({
            url: "ContractMaster.aspx/RenewalStage1Approvel",

            data: JSON.stringify(

                {

                    "myroleList": myroleList,
                    "ContractID": ContractID,
                    "UserID": currUserId,

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Document Submitted..!', '')
                $('.btncontract-RenewStage1').css("display", 'none');
                $('.btncontract-termination').css("display", 'none');

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }


    function ShowRenewalStage1Acess() {

        $.ajax({
            url: "ContractMaster.aspx/GetShowRenewalStage1Acess",
            data: JSON.stringify({ 'ContractID': ContractID, 'UserID': currUserId }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                /* var htm = '';*/
                /* var AttachDetailsList = result.d;*/

                if (result.d.length == 0) {
                    ////$('.btn-addrenewal-contracts').css("display", 'none');
                    $('.btncontract-RenewStage1').css("display", 'none');
                    $('.btncontract-termination').css("display", 'none');
                    $('.btnRenewalstage1Verify').css("display", 'none');
                    $('.btnRenewalStageReject').css("display", 'none');
                   

                }
                else {
                    if (result.d[0].DocCount != 0) {

                        //$('.btn-addrenewal-contracts').css("display", 'none');
                        //$('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');

                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btnRenewalstage1Verify').css("display", 'none');
                        $('.btnRenewalStageReject').css("display", 'none');
                        
                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].RenewalStage1Approvel == "PENDING") {


                        $('.btncontract-RenewStage1').css("display", 'block');
                        $('.btn-addrenewal-contracts').css("display", 'none');
                        $('.btncontract-termination').css("display", 'block')
                        //$('.btnRenewalstage1Approvel').css("display", 'none');
                        $('.btnRenewalstage1Verify').css("display", 'none');
                        $('.btnRenewalStageReject').css("display", 'none');
                        
                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].RenewalStage1Approvel == "SUBMIT") {

                        $('.btn-addrenewal-contracts').css("display", 'none');
                        //$('.btn-submit-finalDoc').css("display", 'none');

                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.btnRenewalstage1Approvel').css("display", 'none');
                        $('.btnRenewalstage1Verify').css("display", 'none');
                        $('.btnRenewalStageReject').css("display", 'none');

                        //$('.btn-submit-RenueStage1').css("display", 'none');
                    }

                    else if (result.d[0].DocCount == 0 && result.d[0].RenewalStage1Approvel == "VERIFY") {

                        $('.btn-addrenewal-contracts').css("display", 'none');


                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.btnRenewalstage1Approvel').css("display", 'none');
                        $('.btnRenewalstage1Verify').css("display", 'block');
                        $('.btnRenewalStageReject').css("display", 'block');

                        //$('.btnTerminationVerify').css("display", 'none');
                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].RenewalStage1Approvel == "APPROVE") {

                        $('.btn-addrenewal-contracts').css("display",'none')
                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.btnRenewalstage1Approvel').css("display", 'block');
                        $('.btnRenewalstage1Verify').css("display", 'none');
                        $('.btnRenewalStageReject').css("display", 'block');
                    }

                    else if (result.d[0].DocCount == 0 && result.d[0].RenewalStage1Approvel == "APPROVED") {

                        $('.btn-addrenewal-contracts').css("display", 'block')
                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'block');
                        $('.btnRenewalstage1Approvel').css("display", 'none');
                        $('.btnRenewalstage1Verify').css("display", 'none');
                        $('.btnRenewalStageReject').css("display", 'none');

                    }

                    else {

                      
                        //$('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.btnRenewalstage1Approvel').css("display", 'none');
                        $('.btnRenewalstage1Verify').css("display", 'none');
                        $('.btnRenewalStageReject').css("display", 'none');
                        $('.btn-addrenewal-contracts').css("display", 'none');
                    }
                }

                //$('#ModalContractDetails').modal('show');

            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });



    }

    function RenewalStage1Approvel(status) {

        $.ajax({
            url: "ContractMaster.aspx/updateRenewalStage1Approvel",
            data: JSON.stringify({ 'UserID': currUserId, 'ContractID': ContractID, 'Status': status }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                if (status == "APPROVED") {
                    
                    $('.btncontract-RenewStage1').css("display", 'none');
                    $('.btncontract-termination').css("display", 'none');

                    $('.btnRenewalstage1Approvel').css("display", 'none');
                    $('.btnRenewalStageReject').css("display", 'none');

                    $('.btnRenewalstage1Verify').css("display", 'none');



                    toastr.success('Status Updated..', '')
                }


                else if (status == "REJECTED") {

                    //$('#RenewalStage1Approvel').addClass('hidden');
                    //$('#RenewalStage1Verify').addClass('hidden');
                    //$('#RenewalStage1Rejected').addClass('hidden');

                }

                //ShowContractDetailsModal();


            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
    function RenewalContract() {


        $.ajax({
            url: "ContractMaster.aspx/RenewContractDetails",
            data: JSON.stringify(
                {
                    "ContractNo": $('#txtContractNo').val(),
                    "PropertyID": PropertyID,
                    "BlockID": $('#ddlBlockAdd').val(),
                    "FloorID": $('#ddlfloor').val(),
                    "UnitID": UnitID,
                    "PropertyUsage": $('#txtPropertyUsage').val(),
                    "PropertyName": $('#ddlPropertyAdd').val(),


                    "RoomName": $('#ddlUnitAdd').val(),


                    "ContractValue": $('#txtContractValue').val(),
                    "SecurityDeposit": $('#txtSecurityDepAmount').val(),
                    "ModeOfPayment": $('#ddlModeOfPayment').val(),
                    
                   
                    "StartDate": $('#txtContractPeriodFrom').val(),
                    "EndDate": $('#txtContractPeriodTo').val(),
                    "NoOfMonths": $('#txtNoOfMonths').val(),

                    "Description": $('#txtDescription').val(),
                    "Status": $('#ddlActive').val(),
                    "CreatedBy": currUserId,
                    "RenewedContractID": RenewedContractID,
                    "RenewedBy": currUserId,
                    "ContractID": ContractID,


                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('New Contract Added ...', '')
                loadAllContractDetails();
                loadInactiveContracts();

                //$('.btn-addrenewal-contracts').css("display", 'none');

                //$('.btncontract-RenewStage1').css("display", 'block');


                ShowPendingContract();


            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }


    function ShowTerminationDocuments() {

        $.ajax({
            url: "ContractMaster.aspx/GetTerminationdoclist",
            data: JSON.stringify({ 'ContractID': ContractID }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                var htm = '';
                var ProjectDetails = result.d;

                $.each(ProjectDetails, function (key, item) {


                    htm += `  <tr>
                
                 <td style="display:none">`+ item.Id + `</td>
                 
                 <td>`+ item.DocumentName + `</td>

                
                <td style="display:inline-flex;width:95%">

                    
                     <div class="input-group" style="width:75%" id="btn-documetuploaded">        
                             <label style="margin-right: 10px;display:none;" class="lbl-fufile-count"></label>
                             <input class="form-control" type="file" id="fu-docment-attach" accept=".doc,.docx,.pdf,.png,.jpeg" style="display:none;" multiple="">
                             <label class="input-group-text ml-3" for="fu-docment-attach"><i class="fa fa-upload " title="Upload File" style="color: #2196F3; cursor: pointer; font-size: large;"></i></label>

                            <a href="#" id="btnsaveDocuments" class="btn btn-upload" style="margin-left: 4px;border-radius: 10px;" onclick=uploadDocumentAttach(`+ item.Id + `,false)>Upload </a>
                                                       
                             <input type="text" id="lblFilesName" value="" style= "background: #80808000; border:; color: #697a8d; border: none; margin-left:10px;" readonly="">

                           
                        </div>
                    <div class="form-check" style="display:none">
                              <input class="form-check-input check-Notapplicable" id=checknotapplicable-`+ item.Id + ` type="checkbox" value="Not Applicable" /> 
                               <label class="form-check-label" for="defaultCheck3">Not Applicable</label
                             <div> </td>`;



                    htm += `</tr>`;

                });

                $('.tbody-Doc-termination').html(htm);

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }

    function ShowTerminationDocs() {

        $.ajax({
            url: "ContractMaster.aspx/GetTerminationDocs",
            data: JSON.stringify({ 'ContractID': ContractID, 'DocChListID': DocChListID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                var htm = '';
                AttachDetailsList = result.d;
                $.each(AttachDetailsList, function (key, item) {


                    //let iterSrcImg = '/Services/FMDocDownload.ashx?FileName=' + item.FileName;
                    let iterSrcImg = 'https://crmss.naffco.com/CRMSS/Services/FMDocDownload.ashx?FileName=' + item.FileName;

                    htm += `  <tr>

                 <td style="display:none">`+ item.DocumetID + `</td>
                 <td style="display:none">`+ item.ContractID + `</td>
                 
                 <td style="display:none">`+ item.UnitID + `</td>
                 <td style="display:none">`+ item.DocChListID + `</td>
                 <td>`+ item.DocumentName + `</td>
                 <td style="display:none">`+ item.ImageURL + `</td>
                 <td>`+ item.FileName + `</td>
                 <td>`+ item.Stage + `</td>
                 <td>`+ item.Status + `</td>

                 <td>
                    
                     
                    
                    <span style="margin-left: 5%;"><a href="`+ iterSrcImg + `"> <i class="fa fa-download docDownloadIcon fa-icon-hover" title="` + item.FileName + `" style="color:#2196F3; cursor:pointer;font-size: x-large;"></i></a></span>

                 </td>`;

                    htm += `</tr>`;

                });

                $('.tbody-termination').html(htm);

                $("#btn-Submit-termidocs").removeClass('hidden');
                //$("#btn-contract-termination").addClass('hidden');
                //initiateDataTableUnitRequestAction();
            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }
    //<span style="margin-left: 5%;"> <i class="fa fa-eye showFileIcon fa-icon-hover" title="View File" style="color:#2196F3; cursor:pointer;font-size: x-large;"></i></span>
    function SubmitTerminationDoc() {
        $.ajax({
            url: "ContractMaster.aspx/SubmitTerminationDoc",

            data: JSON.stringify(

                {

                    "myroleList": myroleList,
                    "ContractID": ContractID,
                    "UserID": currUserId,

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Document Submitted..!', '')

                $("#btn-Submit-termidocs").addClass('hidden');

                $("#btn-contract-termination").addClass('hidden');

                //BtnAcesssubmittermination();
            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function ShowTerminationButtonAcess() {

        $.ajax({
            url: "ContractMaster.aspx/GetTerminationButtonAcess",
            data: JSON.stringify({ 'ContractID': ContractID, 'UserID': currUserId }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                /* var htm = '';*/
                /* var AttachDetailsList = result.d;*/

                if (result.d.length == 0) {

                    $('.btncontract-RenewStage1').css("display", 'none');
                    $('.btncontract-termination').css("display", 'none');
                    $('.btnTerminationApprovel').css("display", 'none')
                    $('.btnTerminationVerify').css("display", 'none');
                    $('.btnTerminationRejected').css("display", 'none');
                    $('.classinitate-moveout').css("display", 'none');
                    $('.btn-cancel-termination').css("display", 'none')

                }
                else {
                    if (result.d[0].DocCount != 0) {

                        $('.classinitate-moveout').css("display", 'none');
                        $('.btn-cancel-termination').css("display", 'none')
                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.btnTerminationApprovel').css("display", 'none')
                        $('.btnTerminationVerify').css("display", 'none');
                        $('.btnTerminationRejected').css("display", 'none');
                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].TerminationApprovel == "PENDING") {

                        $('.classinitate-moveout').css("display", 'none');
                        $('.btn-cancel-termination').css("display", 'none')
                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.btnTerminationApprovel').css("display", 'none')
                        $('.btnTerminationVerify').css("display", 'none');
                        $('.btnTerminationRejected').css("display", 'none');
                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].TerminationApprovel == "SUBMIT") {

                        $('.classinitate-moveout').css("display", 'none');
                        $('.btn-cancel-termination').css("display", 'none')
                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.btnTerminationApprovel').css("display", 'none')
                        $('.btnTerminationVerify').css("display", 'none');
                        $('.btnTerminationRejected').css("display", 'none');
                    }

                    else if (result.d[0].DocCount == 0 && result.d[0].TerminationApprovel == "VERIFY") {
                        $('.classinitate-moveout').css("display", 'none');
                        $('.btn-cancel-termination').css("display", 'none')
                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.btnTerminationApprovel').css("display", 'none')
                        $('.btnTerminationVerify').css("display", 'block');
                        $('.btnTerminationRejected').css("display", 'block');
                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].TerminationApprovel == "APPROVE") {
                        $('.classinitate-moveout').css("display", 'none');
                        $('.btn-cancel-termination').css("display", 'none')
                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.btnTerminationApprovel').css("display", 'block');
                        $('.btnTerminationVerify').css("display", 'none');
                        $('.btnTerminationRejected').css("display", 'block');
                    }

                    else if (result.d[0].DocCount == 0 && result.d[0].TerminationApprovel == "APPROVED") {

                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.classinitate-moveout').css("display", 'block');
                        $('.btn-cancel-termination').css("display", 'block')
                        $('.btnTerminationApprovel').css("display", 'none');
                        $('.btnTerminationVerify').css("display", 'none');
                        $('.btnTerminationRejected').css("display", 'none');
                    }
                    else {
                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.btnTerminationApprovel').css("display", 'none')
                        $('.btnTerminationVerify').css("display", 'none');
                        $('.btnTerminationRejected').css("display", 'none');
                         $('.classinitate-moveout').css("display", 'none');
                        $('.btn-cancel-termination').css("display", 'none')
                    }
                }

                //$('#ModalContractDetails').modal('show');

            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    function TerminationApprovel(status) {

        $.ajax({
            url: "ContractMaster.aspx/updateTerminationApprovel",
            data: JSON.stringify({ 'UserID': currUserId, 'ContractID': ContractID, 'Status': status }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                if (status == "APPROVED") {
                    $('.btnTerminationApprovel').css("display", 'none');
                    $('.btnTerminationRejected').css("display", 'none');

                    $('.btnTerminationVerify').css("display", 'none');



                    toastr.success('Status Updated..', '')
                }


                else if (status == "REJECTED") {

                    //$('#RenewalStage1Approvel').addClass('hidden');
                    //$('#RenewalStage1Verify').addClass('hidden');
                    //$('#RenewalStage1Rejected').addClass('hidden');

                }

                //ShowTerminationButtonAcess();
                //ShowContractDetailsModal();


            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function ShowInitateMoveoutStage1Docs() {

        $.ajax({
            url: "ContractMaster.aspx/GetInitateMoveoutStage1doc",
            data: JSON.stringify({ 'ContractID': ContractID }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                var htm = '';
                var ProjectDetails = result.d;

                $.each(ProjectDetails, function (key, item) {


                    htm += `  <tr>
                
                 <td style="display:none">`+ item.Id + `</td>
                 
                 <td>`+ item.DocumentName + `</td>

                
                <td style="display:inline-flex;width:95%">

                    
                     <div class="input-group" style="width:75%" id="btn-documetuploaded">        
                             <label style="margin-right: 10px;display:none;" class="lbl-fufile-count"></label>
                             <input class="form-control" type="file" id="fu-docment-attach" accept=".doc,.docx,.pdf,.png,.jpeg" style="display:none;" multiple="">
                             <label class="input-group-text ml-3" for="fu-docment-attach"><i class="fa fa-upload " title="Upload File" style="color: #2196F3; cursor: pointer; font-size: large;"></i></label>

                            <a href="#" id="btnsaveDocuments" class="btn btn-upload" style="margin-left: 4px;border-radius: 10px;" onclick=uploadDocumentAttach(`+ item.Id + `,false)>Upload </a>
                                                       
                             <input type="text" id="lblFilesName" value="" style= "background: #80808000; border:; color: #697a8d; border: none; margin-left:10px;" readonly="">

                           
                        </div>
                     </td>`;



                    htm += `</tr>`;

                });

                $('.tbody-Doc-initate-moveout1').html(htm);

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }
    function ShowMovOutStage1Docs() {

        $.ajax({
            url: "ContractMaster.aspx/GetShowMovOutStage1Docs",
            data: JSON.stringify({ 'ContractID': ContractID, 'DocChListID': DocChListID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                var htm = '';
                AttachDetailsList = result.d;
                $.each(AttachDetailsList, function (key, item) {
                    //let iterSrcImg = '/Services/FMDocDownload.ashx?FileName=' + item.FileName;
                    let iterSrcImg = 'https://crmss.naffco.com/CRMSS/Services/FMDocDownload.ashx?FileName=' + item.FileName;

                    htm += `  <tr>

                 <td style="display:none">`+ item.DocumetID + `</td>
                 <td style="display:none">`+ item.ContractID + `</td>
                 
                 <td style="display:none">`+ item.UnitID + `</td>
                 <td style="display:none">`+ item.DocChListID + `</td>
                 <td>`+ item.DocumentName + `</td>
                 <td style="display:none">`+ item.ImageURL + `</td>
                 <td>`+ item.FileName + `</td>
                 <td>`+ item.Stage + `</td>
                 <td>`+ item.Status + `</td>

                 <td>
                    
                     
                   
                    <span style="margin-left: 5%;"><a href="`+ iterSrcImg + `"> <i class="fa fa-download docDownloadIcon fa-icon-hover" title="` + item.FileName + `" style="color:#2196F3; cursor:pointer;font-size: x-large;"></i></a></span>

                 </td>`;

                    htm += `</tr>`;

                });

                $('.tbody-IniMoveout-Stage1doc').html(htm);

                $("#btn-Submit-termidocs").removeClass('hidden');
                //$("#btn-contract-termination").addClass('hidden');
                //initiateDataTableUnitRequestAction();
            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    function ShowMoveOutStage1ButtonAcess() {

        $.ajax({
            url: "ContractMaster.aspx/GetMoveOutStage1ButtonAcess",
            data: JSON.stringify({ 'ContractID': ContractID, 'UserID': currUserId }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                /* var htm = '';*/
                /* var AttachDetailsList = result.d;*/

                if (result.d.length == 0) {

                    $('.classinitate-moveout').css("display", 'none');
                    $('.cancel-termination').css("display", 'none');
                    $('.GetMoveOutStage1ButtonAcess').css("display", 'none');

                    
                    $('.classmoveoutstage1Approvel').css("display", 'none');
                    $('.classmoveoutstage1Verify').css("display", 'none');
                    $('.classmoveoueRej').css("display", 'none');
                    $('.classfinalmoveoutdocs').css("display", 'none');



                }
                else {
                    if (result.d[0].DocCount != 0) {


                        $('.classinitate-moveout').css("display", 'none');
                        $('.cancel-termination').css("display", 'none');
                        $('.GetMoveOutStage1ButtonAcess').css("display", 'none');

                        $('.classfinalmoveoutdocs').css("display", 'none');
                        $('.classmoveoutstage1Approvel').css("display", 'none');
                        $('.classmoveoutstage1Verify').css("display", 'none');
                        $('.classmoveoueRej').css("display", 'none');

                    }
                    else if (result.d[0].DocCount !== 0 && result.d[0].MoveOutStage1Approvel == "PENDING") {

                        $('.classinitate-moveout').css("display", 'none');
                        $('.cancel-termination').css("display", 'none');
                        $('.GetMoveOutStage1ButtonAcess').css("display", 'none');

                        $('.classfinalmoveoutdocs').css("display", 'none');
                        $('.classmoveoutstage1Approvel').css("display", 'none');
                        $('.classmoveoutstage1Verify').css("display", 'none');
                        $('.classmoveoueRej').css("display", 'none');
                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MoveOutStage1Approvel == "SUBMIT") {

                        $('.classinitate-moveout').css("display", 'none');
                        $('.cancel-termination').css("display", 'none');

                        $('.GetMoveOutStage1ButtonAcess').css("display", 'none');

                        $('.classfinalmoveoutdocs').css("display", 'none');
                        $('.classmoveoutstage1Approvel').css("display", 'none');
                        $('.classmoveoutstage1Verify').css("display", 'none');
                        $('.classmoveoueRej').css("display", 'none');

                    }

                    else if (result.d[0].DocCount == 0 && result.d[0].MoveOutStage1Approvel == "VERIFY") {

                        $('.classfinalmoveoutdocs').css("display", 'none');
                        $('.classmoveoutstage1Approvel').css("display", 'none');
                        $('.classmoveoutstage1Verify').css("display", 'block');
                        $('.classmoveoueRej').css("display", 'block');

                        $('.classinitate-moveout').css("display", 'none');
                        $('.cancel-termination').css("display", 'none');
                        $('.GetMoveOutStage1ButtonAcess').css("display", 'none');
                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MoveOutStage1Approvel == "APPROVE") {

                        $('.classinitate-moveout').css("display", 'none');
                        $('.cancel-termination').css("display", 'none');

                        $('.classfinalmoveoutdocs').css("display", 'none');
                        $('.classmoveoutstage1Approvel').css("display", 'block');
                        $('.classmoveoutstage1Verify').css("display", 'none');
                        $('.classmoveoueRej').css("display", 'block');
                        $('.GetMoveOutStage1ButtonAcess').css("display", 'none');

                    }

                    else if (result.d[0].DocCount == 0 && result.d[0].MoveOutStage1Approvel == "APPROVED") {

                        $('.classinitate-moveout').css("display", 'none');
                        $('.cancel-termination').css("display", 'none');
                        $('.GetMoveOutStage1ButtonAcess').css("display", 'block');


                        $('.classfinalmoveoutdocs').css("display", 'block');
                        $('.classmoveoutstage1Approvel').css("display", 'none');
                        $('.classmoveoutstage1Verify').css("display", 'none');
                        $('.classmoveoueRej').css("display", 'none');
                    }


                    else {

                        $('.classinitate-moveout').css("display", 'none');
                        $('.cancel-termination').css("display", 'none');
                        $('.GetMoveOutStage1ButtonAcess').css("display", 'none');

                        $('.classfinalmoveoutdocs').css("display", 'none');
                        $('.classmoveoutstage1Approvel').css("display", 'none');
                        $('.classmoveoutstage1Verify').css("display", 'none');
                        $('.classmoveoueRej').css("display", 'none');
                    }
                }

                //$('#ModalContractDetails').modal('show');

            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }
    function SubmitInitateMoveout() {
        $.ajax({
            url: "ContractMaster.aspx/SubmitInitateMoveDoc",

            data: JSON.stringify(

                {

                    "myroleList": myroleList,
                    "ContractID": ContractID,
                    "UserID": currUserId,

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Document Submitted..!', '')

                ShowMoveOutStage1ButtonAcess();

                //$("#btn-Submit-termidocs").addClass('hidden');

                //$("#btn-contract-termination").addClass('hidden');


            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
    function MovepotApprovelstage1(status) {

        $.ajax({
            url: "ContractMaster.aspx/updateMovepotApprovelstage1",
            data: JSON.stringify({ 'UserID': currUserId, 'ContractID': ContractID, 'Status': status }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                if (status == "APPROVED") {

                    $('.classmoveoutstage1Verify').css("display", 'none');
                    $('.classmoveoueRej').css("display", 'none');
                    $('.classmoveoutstage1Approvel').css("display", 'none');



                    toastr.success('Status Updated..', '')
                }


                else if (status == "REJECTED") {

                    //$('#RenewalStage1Approvel').addClass('hidden');
                    //$('#RenewalStage1Verify').addClass('hidden');
                    //$('#RenewalStage1Rejected').addClass('hidden');

                }

                //ShowTerminationButtonAcess();
                //ShowContractDetailsModal();


            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function ShowFinalMoveoutDocs() {

        $.ajax({
            url: "ContractMaster.aspx/GetShowFinalMoveoutDocs",
            data: JSON.stringify({ 'ContractID': ContractID }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                var htm = '';
                var ProjectDetails = result.d;

                $.each(ProjectDetails, function (key, item) {


                    htm += `  <tr>
                
                 <td style="display:none">`+ item.Id + `</td>
                 
                 <td>`+ item.DocumentName + `</td>

                
                <td style="display:inline-flex;width:95%">

                    
                     <div class="input-group" style="width:75%" id="btn-documetuploaded">        
                             <label style="margin-right: 10px;display:none;" class="lbl-fufile-count"></label>
                             <input class="form-control" type="file" id="fu-docment-attach" accept=".doc,.docx,.pdf,.png,.jpeg" style="display:none;" multiple="">
                             <label class="input-group-text ml-3" for="fu-docment-attach"><i class="fa fa-upload " title="Upload File" style="color: #2196F3; cursor: pointer; font-size: large;"></i></label>

                            <a href="#" id="btnsaveDocuments" class="btn btn-upload" style="margin-left: 4px;border-radius: 10px;" onclick=uploadDocumentAttach(`+ item.Id + `,false)>Upload </a>
                                                       
                             <input type="text" id="lblFilesName" value="" style= "background: #80808000; border:; color: #697a8d; border: none; margin-left:10px;" readonly="">

                           
                        </div>
                    
                             </td>`;



                    htm += `</tr>`;

                });

                $('.tbody-FinalMoveout').html(htm);

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }

    function ShowFinalMoveoutDocList() {

        $.ajax({
            url: "ContractMaster.aspx/GetFinalMoveoutDocList",
            data: JSON.stringify({ 'ContractID': ContractID, 'DocChListID': DocChListID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                var htm = '';
                AttachDetailsList = result.d;
                $.each(AttachDetailsList, function (key, item) {

                    //let iterSrcImg = '/Services/FMDocDownload.ashx?FileName=' + item.FileName;

                    let iterSrcImg = 'https://crmss.naffco.com/CRMSS/Services/FMDocDownload.ashx?FileName=' + item.FileName;

                    htm += `  <tr>

                 <td style="display:none">`+ item.DocumetID + `</td>
                 <td style="display:none">`+ item.ContractID + `</td>
                 
                 <td style="display:none">`+ item.UnitID + `</td>
                 <td style="display:none">`+ item.DocChListID + `</td>
                 <td>`+ item.DocumentName + `</td>
                 <td style="display:none">`+ item.ImageURL + `</td>
                 <td>`+ item.FileName + `</td>
                 <td>`+ item.Stage + `</td>
                 <td>`+ item.Status + `</td>

                 <td>
                    
                     
                   
                    <span style="margin-left: 5%;"><a href="`+ iterSrcImg + `"> <i class="fa fa-download docDownloadIcon fa-icon-hover" title="` + item.FileName + `" style="color:#2196F3; cursor:pointer;font-size: x-large;"></i></a></span>

                 </td>`;

                    htm += `</tr>`;

                });

                $('.tbody-finalmoneoutDoc').html(htm);

                $("#btn-Submit-termidocs").removeClass('hidden');
                //$("#btn-contract-termination").addClass('hidden');
                //initiateDataTableUnitRequestAction();
            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    function ShowFinalMoveoutButtonAcess() {

        $.ajax({
            url: "ContractMaster.aspx/GetFinalMoveoutButtonAcess",
            data: JSON.stringify({ 'ContractID': ContractID, 'UserID': currUserId }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                /* var htm = '';*/
                /* var AttachDetailsList = result.d;*/

                if (result.d.length == 0) {

                    $('.btncontract-RenewStage1').css("display", 'none');
                    $('.btncontract-termination').css("display", 'none');
                    

                    $('.classfinalmoveoutdocs').css("display", 'none');
                    $('.moveoutFinalApprovel').css("display", 'none');
                    $('.moveoutFinalVerify').css("display", 'none');
                    $('.moveoutFinalRejection').css("display", 'none');
                    $('.classfinalmoveoutEstimation').css("display", 'none');


                }
                else {
                    if (result.d[0].DocCount != 0) {
                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        

                        $('.classfinalmoveoutdocs').css("display", 'none');
                        $('.moveoutFinalApprovel').css("display", 'none');
                        $('.moveoutFinalVerify').css("display", 'none');
                        $('.moveoutFinalRejection').css("display", 'none');
                        $('.classfinalmoveoutEstimation').css("display", 'none');

                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MoveOutfinalApprovel == "PENDING") {

                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                       

                        $('.classfinalmoveoutdocs').css("display", 'none');
                        $('.moveoutFinalApprovel').css("display", 'none');
                        $('.moveoutFinalVerify').css("display", 'none');
                        $('.moveoutFinalRejection').css("display", 'none');
                        $('.classfinalmoveoutEstimation').css("display", 'none');
                        
                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MoveOutfinalApprovel == "SUBMIT") {

                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');

                        

                        $('.classfinalmoveoutdocs').css("display", 'none');
                        $('.moveoutFinalApprovel').css("display", 'none');
                        $('.moveoutFinalVerify').css("display", 'none');
                        $('.moveoutFinalRejection').css("display", 'none');
                        $('.classfinalmoveoutEstimation').css("display", 'none');
                        

                    }


                    else if (result.d[0].DocCount == 0 && result.d[0].MoveOutfinalApprovel == "VERIFY") {

                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.GetFinalMoveoutButtonAcess').css("display", 'none');

                        $('.classfinalmoveoutdocs').css("display", 'none');
                        $('.moveoutFinalApprovel').css("display", 'none');
                        $('.moveoutFinalVerify').css("display", 'block');
                        $('.moveoutFinalRejection').css("display", 'block');
                        $('.classfinalmoveoutEstimation').css("display", 'none');


                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MoveOutfinalApprovel == "APPROVE") {

                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.GetFinalMoveoutButtonAcess').css("display", 'none');

                        $('.classfinalmoveoutdocs').css("display", 'none');
                        $('.moveoutFinalApprovel').css("display", 'block');
                        $('.moveoutFinalVerify').css("display", 'none');
                        $('.moveoutFinalRejection').css("display", 'block');
                        $('.classfinalmoveoutEstimation').css("display", 'none');
                    }

                    else if (result.d[0].DocCount == 0 && result.d[0].MoveOutfinalApprovel == "APPROVED") {

                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.GetFinalMoveoutButtonAcess').css("display", 'none');

                        $('.classfinalmoveoutdocs').css("display", 'none');
                        $('.moveoutFinalApprovel').css("display", 'none');
                        $('.moveoutFinalVerify').css("display", 'none');
                        $('.moveoutFinalRejection').css("display", 'none');
                        $('.classfinalmoveoutEstimation').css("display", 'block');

                    }
                    else {

                        $('.btncontract-RenewStage1').css("display", 'none');
                        $('.btncontract-termination').css("display", 'none');
                        $('.GetFinalMoveoutButtonAcess').css("display", 'none');

                        $('.classfinalmoveoutdocs').css("display", 'none');

                        $('.moveoutFinalApprovel').css("display", 'none');
                        $('.moveoutFinalVerify').css("display", 'none');
                        $('.moveoutFinalRejection').css("display", 'none');
                        $('.classfinalmoveoutEstimation').css("display", 'none');
                    }
                }

                //$('#ModalContractDetails').modal('show');

            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }
    function SubmitfinalMoveout() {
        $.ajax({
            url: "ContractMaster.aspx/SubmitfinalMoveoutDocs",

            data: JSON.stringify(

                {

                    "myroleList": myroleList,
                    "ContractID": ContractID,
                    "UserID": currUserId,

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Document Submitted..!', '')

                //$("#btn-Submit-final-moveout").addClass('hidden');

                //$("#btn-finalmoveout-docs").addClass('hidden');
                ShowFinalMoveoutButtonAcess();

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function FinalmoveoutApprovel(status) {

        $.ajax({
            url: "ContractMaster.aspx/UpdateFinalMoveoutApprovel",
            data: JSON.stringify({ 'UserID': currUserId, 'ContractID': ContractID, 'Status': status }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                if (status == "APPROVED") {

                    $('.moveoutFinalVerify').css("display", 'none');
                    $('.moveoutFinalRejection').css("display", 'none');
                    $('.moveoutFinalApprovel').css("display", 'none');



                    toastr.success('Status Updated..', '')
                }


                else if (status == "REJECTED") {

                    //$('#RenewalStage1Approvel').addClass('hidden');
                    //$('#RenewalStage1Verify').addClass('hidden');
                    //$('#RenewalStage1Rejected').addClass('hidden');

                }

                //ShowTerminationButtonAcess();
                //ShowContractDetailsModal();


            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function ShowFinalEstimation() {

        $.ajax({
            url: "ContractMaster.aspx/GetFinalEstimationDocs",
            data: JSON.stringify({ 'ContractID': ContractID }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                var htm = '';
                var ProjectDetails = result.d;

                $.each(ProjectDetails, function (key, item) {


                    htm += `  <tr>
                
                 <td style="display:none">`+ item.Id + `</td>
                 
                 <td>`+ item.DocumentName + `</td>

                
                <td style="display:inline-flex;width:95%">

                    
                     <div class="input-group" style="width:75%" id="btn-documetuploaded">        
                             <label style="margin-right: 10px;display:none;" class="lbl-fufile-count"></label>
                             <input class="form-control" type="file" id="fu-docment-attach" accept=".doc,.docx,.pdf,.png,.jpeg" style="display:none;" multiple="">
                             <label class="input-group-text ml-3" for="fu-docment-attach"><i class="fa fa-upload " title="Upload File" style="color: #2196F3; cursor: pointer; font-size: large;"></i></label>

                            <a href="#" id="btnsaveDocuments" class="btn btn-upload" style="margin-left: 4px;border-radius: 10px;" onclick=uploadDocumentAttach(`+ item.Id + `,false)>Upload </a>
                                                       
                             <input type="text" id="lblFilesName" value="" style= "background: #80808000; border:; color: #697a8d; border: none; margin-left:10px;" readonly="">

                           
                        </div>
                   

                             </td>`;



                    htm += `</tr>`;

                });

                $('.tbody-Finalestimation').html(htm);

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }

    function ShowFinalEstimationDocList() {

        $.ajax({
            url: "ContractMaster.aspx/GetFinalEstimationDocList",
            data: JSON.stringify({ 'ContractID': ContractID, 'DocChListID': DocChListID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                var htm = '';
                AttachDetailsList = result.d;
                $.each(AttachDetailsList, function (key, item) {
                    //let iterSrcImgab = 'https://egate.naffco.com:8585/Common/DownloadFile?filePath=' + item.ImageURL.replaceAll(' ', '%20');

                    let iterSrcImg = 'https://crmss.naffco.com/CRMSS/Services/FMDocDownload.ashx?FileName=' + item.FileName;

                    htm += `  <tr>

                 <td style="display:none">`+ item.DocumetID + `</td>
                 <td style="display:none">`+ item.ContractID + `</td>
                 
                 <td style="display:none">`+ item.UnitID + `</td>
                 <td style="display:none">`+ item.DocChListID + `</td>
                 <td>`+ item.DocumentName + `</td>
                 <td style="display:none">`+ item.ImageURL + `</td>
                 <td>`+ item.FileName + `</td>
                 <td>`+ item.Stage + `</td>
                 <td>`+ item.Status + `</td>

                 <td>
                    
                     

                    <span style="margin-left: 5%;"><a href="`+ iterSrcImg + `"> <i class="fa fa-download docDownloadIcon fa-icon-hover" title="` + item.FileName + `" style="color:#2196F3; cursor:pointer;font-size: x-large;"></i></a></span>

                 </td>`;

                    htm += `</tr>`;

                });

                $('.tbody-finalestimation-doclist').html(htm);

                //$("#btn-Submit-termidocs").removeClass('hidden');
                //$("#btn-contract-termination").addClass('hidden');
                //initiateDataTableUnitRequestAction();
            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }
    function ShowFinalEstimationButtonAcess() {

        $.ajax({
            url: "ContractMaster.aspx/GetFinalEstimationButtonAcess",
            data: JSON.stringify({ 'ContractID': ContractID, 'UserID': currUserId }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                /* var htm = '';*/
                /* var AttachDetailsList = result.d;*/

                if (result.d.length == 0) {

                    $('.classfinalmoveoutEstimation').css("display", 'none');
                   $('.btnsubmit-finalestimation').css("display", 'none');

                    $('.finalestimationApprovel').css("display", 'none');
                    $('.finalestimationVerify').css("display", 'none');
                    $('.finalestimationrejected').css("display", 'none');



                }
                else {
                  if (result.d[0].DocCount != 0) {

                      $('.classfinalmoveoutEstimation').css("display", 'none');
                        $('.btnsubmit-finalestimation').css("display", 'none');

                        $('.finalestimationApprovel').css("display", 'none');
                        $('.finalestimationVerify').css("display", 'none');
                        $('.finalestimationrejected').css("display", 'none');

                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MaintenanceEstimationApprovel == "PENDING") {

                      $('.classfinalmoveoutEstimation').css("display", 'block');
                        $('.btnsubmit-finalestimation').css("display", 'block');

                        $('.finalestimationApprovel').css("display", 'none');
                        $('.finalestimationVerify').css("display", 'none');
                        $('.finalestimationrejected').css("display", 'none');


                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MaintenanceEstimationApprovel == "SUBMIT") {

                        $('.classfinalmoveoutEstimation').css("display", 'none');
                      $('.btnsubmit-finalestimation').css("display", 'none');

                        $('.finalestimationApprovel').css("display", 'none');
                        $('.finalestimationVerify').css("display", 'none');
                        $('.finalestimationrejected').css("display", 'none');


                    }


                    else if (result.d[0].DocCount == 0 && result.d[0].MaintenanceEstimationApprovel == "VERIFY") {

                        $('.classfinalmoveoutEstimation').css("display", 'none');
                      $('.btnsubmit-finalestimation').css("display", 'none');

                        $('.finalestimationApprovel').css("display", 'none');
                        $('.finalestimationVerify').css("display", 'block');
                        $('.finalestimationrejected').css("display", 'block');



                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].MaintenanceEstimationApprovel == "APPROVE") {

                        $('.classfinalmoveoutEstimation').css("display", 'none');
                      $('.btnsubmit-finalestimation').css("display", 'none');

                        $('.finalestimationApprovel').css("display", 'block');
                        $('.finalestimationVerify').css("display", 'none');
                        $('.finalestimationrejected').css("display", 'block');
                    }

                    else if (result.d[0].DocCount == 0 && result.d[0].MaintenanceEstimationApprovel == "APPROVED") {

                        $('.classfinalmoveoutEstimation').css("display", 'none');
                      $('.btnsubmit-finalestimation').css("display", 'none');

                        $('.finalestimationApprovel').css("display", 'none');
                        $('.finalestimationVerify').css("display", 'none');
                        $('.finalestimationrejected').css("display", 'none');
                        $('.clsSecuritydepositRefund').css("display", 'block');

                    }
                    else {


                        $('.classfinalmoveoutEstimation').css("display", 'none');


                        $('.finalestimationApprovel').css("display", 'none');
                        $('.finalestimationVerify').css("display", 'none');
                        $('.finalestimationrejected').css("display", 'none');
                    }
                }

                //$('#ModalContractDetails').modal('show');

            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    function SubmitfinalEstimation() {
        $.ajax({
            url: "ContractMaster.aspx/SubmitfinalEstimation",

            data: JSON.stringify(

                {

                    "myroleList": myroleList,
                    "ContractID": ContractID,
                    "UserID": currUserId,

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Document Submitted..!', '')

                ShowFinalEstimationButtonAcess();
              


            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
}

function MOFinalEstimationApprovel(status) {

    $.ajax({
        url: "ContractMaster.aspx/UpdateMOFinalEstimationApprovel",
        data: JSON.stringify({ 'UserID': currUserId, 'ContractID': ContractID, 'Status': status }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            if (status == "APPROVED") {

                $('.finalestimationVerify').css("display", 'none');
                $('.finalestimationApprovel').css("display", 'none');
                $('.finalestimationrejected').css("display", 'none');



                toastr.success('Status Updated..', '')
            }


            else if (status == "REJECTED") {

                //$('.finalestimationVerify').css("display", 'none');
                //$('.finalestimationApprovel').css("display", 'none');
                //$('.finalestimationrejected').css("display", 'none');

            }

            //ShowTerminationButtonAcess();
            //ShowContractDetailsModal();


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
    function SecurityDepositRefundApprovel(status) {

        $.ajax({
            url: "ContractMaster.aspx/UpdateSErefundApprovel",
            data: JSON.stringify({ 'UserID': currUserId, 'ContractID': ContractID, 'Status': status }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                if (status == "APPROVED") {
                    
                    $('.securityDepoditRefundApprovel  ').css("display", 'none');
                    $('.securityDepositRefundVerify ').css("display", 'none');
                    $('.securityDepositRefundRejected').css("display", 'none');



                    toastr.success('Status Updated..', '')
                }


                else if (status == "REJECTED") {

                    //$('#RenewalStage1Approvel').addClass('hidden');
                    //$('#RenewalStage1Verify').addClass('hidden');
                    //$('#RenewalStage1Rejected').addClass('hidden');

                }

                //ShowTerminationButtonAcess();
                //ShowContractDetailsModal();


            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function ShowSecurityDepositRefund() {

        $.ajax({
            url: "ContractMaster.aspx/GetSecurityDepositRefund",
            data: JSON.stringify({ 'ContractID': ContractID }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                var htm = '';
                var ProjectDetails = result.d;

                $.each(ProjectDetails, function (key, item) {


                    htm += `  <tr>
                
                 <td style="display:none">`+ item.Id + `</td>
                 
                 <td>`+ item.DocumentName + `</td>

                
                <td style="display:inline-flex;width:95%">

                    
                     <div class="input-group" style="width:75%" id="btn-documetuploaded">        
                             <label style="margin-right: 10px;display:none;" class="lbl-fufile-count"></label>
                             <input class="form-control" type="file" id="fu-docment-attach" accept=".doc,.docx,.pdf,.png,.jpeg" style="display:none;" multiple="">
                             <label class="input-group-text ml-3" for="fu-docment-attach"><i class="fa fa-upload " title="Upload File" style="color: #2196F3; cursor: pointer; font-size: large;"></i></label>

                            <a href="#" id="btnsaveDocuments" class="btn btn-upload" style="margin-left: 4px;border-radius: 10px;" onclick=uploadDocumentAttach(`+ item.Id + `,false)>Upload </a>
                                                       
                             <input type="text" id="lblFilesName" value="" style= "background: #80808000; border:; color: #697a8d; border: none; margin-left:10px;" readonly="">

                           
                        </div>
                    <div class="form-check">
                              <input class="form-check-input check-Notapplicable" id=checknotapplicable-`+ item.Id + ` type="checkbox" value="Not Applicable" /> 
                               <label class="form-check-label" for="defaultCheck3">Not Applicable</label
                             <div> </td>`;



                    htm += `</tr>`;

                });

                $('.tbody-sdRefundDoc').html(htm);

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }

    function ShowSecurityDepositRefundDocList() {

        $.ajax({
            url: "ContractMaster.aspx/GetSecurityDepositRefundDocList",
            data: JSON.stringify({ 'ContractID': ContractID, 'DocChListID': DocChListID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                var htm = '';
                AttachDetailsList = result.d;
                $.each(AttachDetailsList, function (key, item) {
                    //let iterSrcImgab = 'https://egate.naffco.com:8585/Common/DownloadFile?filePath=' + item.ImageURL.replaceAll(' ', '%20');

                    let iterSrcImg = 'https://crmss.naffco.com/CRMSS/Services/FMDocDownload.ashx?FileName=' + item.FileName;


                    htm += `  <tr>

                 <td style="display:none">`+ item.DocumetID + `</td>
                 <td style="display:none">`+ item.ContractID + `</td>
                 
                 <td style="display:none">`+ item.UnitID + `</td>
                 <td style="display:none">`+ item.DocChListID + `</td>
                 <td>`+ item.DocumentName + `</td>
                 <td style="display:none">`+ item.ImageURL + `</td>
                 <td>`+ item.FileName + `</td>
                 <td>`+ item.Stage + `</td>
                 <td>`+ item.Status + `</td>

                 <td>
                    
                     
                  
                    <span style="margin-left: 5%;"><a href="`+ iterSrcImg + `"> <i class="fa fa-download docDownloadIcon fa-icon-hover" title="` + item.FileName + `" style="color:#2196F3; cursor:pointer;font-size: x-large;"></i></a></span>

                 </td>`;

                    htm += `</tr>`;

                });

                $('.tbody-sdRefund-doclist').html(htm);

                //$("#btn-Submit-termidocs").removeClass('hidden');
                //$("#btn-contract-termination").addClass('hidden');
                //initiateDataTableUnitRequestAction();
            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    function ShowSecurityDEpositRefundButtonAcess() {

        $.ajax({
            url: "ContractMaster.aspx/GetSecurityDEpositRefundButtonAcess",
            data: JSON.stringify({ 'ContractID': ContractID, 'UserID': currUserId }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                /* var htm = '';*/
                /* var AttachDetailsList = result.d;*/

                if (result.d.length == 0) {

                    $('.clsSecuritydepositRefund ').css("display", 'none');
                    $('.securityDepoditRefundApprovel').css("display", 'none');
                    $('.securityDepositRefundVerify').css("display", 'none');
                    $('.securityDepositRefundRejected').css("display", 'none');



                }
                else {
                    if (result.d[0].DocCount != 0) {

                        
                        $('.clsSecuritydepositRefund ').css("display", 'none');


                        $('.securityDepoditRefundApprovel').css("display", 'none');
                        $('.securityDepositRefundVerify').css("display", 'none');
                        $('.securityDepositRefundRejected').css("display", 'none');
                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].SecurityDepositRefundApprovel == "PENDING") {


                        $('.clsSecuritydepositRefund ').css("display", 'block');


                        $('.securityDepoditRefundApprovel').css("display", 'none');
                        $('.securityDepositRefundVerify').css("display", 'none');
                        $('.securityDepositRefundRejected').css("display", 'none');


                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].SecurityDepositRefundApprovel == "SUBMIT") {



                        $('.clsSecuritydepositRefund ').css("display", 'none');


                        $('.securityDepoditRefundApprovel').css("display", 'none');
                        $('.securityDepositRefundVerify').css("display", 'none');
                        $('.securityDepositRefundRejected').css("display", 'none');


                    }


                    else if (result.d[0].DocCount == 0 && result.d[0].SecurityDepositRefundApprovel == "VERIFY") {

                        $('.clsSecuritydepositRefund ').css("display", 'none');


                        $('.securityDepoditRefundApprovel').css("display", 'none');
                        $('.securityDepositRefundVerify').css("display", 'block');
                        $('.securityDepositRefundRejected').css("display", 'block');



                    }
                    else if (result.d[0].DocCount == 0 && result.d[0].SecurityDepositRefundApprovel == "APPROVE") {

                        $('.clsSecuritydepositRefund ').css("display", 'none');


                        $('.securityDepoditRefundApprovel').css("display", 'block');
                        $('.securityDepositRefundVerify').css("display", 'none');
                        $('.securityDepositRefundRejected').css("display", 'block');
                    }

                    else if (result.d[0].DocCount == 0 && result.d[0].SecurityDepositRefundApprovel == "APPROVED") {

                        $('.clsSecuritydepositRefund ').css("display", 'none');


                        $('.securityDepoditRefundApprovel').css("display", 'none');
                        $('.securityDepositRefundVerify').css("display", 'none');
                        $('.securityDepositRefundRejected').css("display", 'none');

                    }
                    else {


                        $('.clsSecuritydepositRefund ').css("display", 'none');


                        $('.securityDepoditRefundApprovel').css("display", 'none');
                        $('.securityDepositRefundVerify').css("display", 'none');
                        $('.securityDepositRefundRejected').css("display", 'none');
                    }
                }

                //$('#ModalContractDetails').modal('show');

            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }
    function SubmitSDrefund() {
        $.ajax({
            url: "ContractMaster.aspx/SubmitSDrefund",

            data: JSON.stringify(

                {

                    "myroleList": myroleList,
                    "ContractID": ContractID,
                    "UserID": currUserId,

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Document Submitted..!', '')

                ShowSecurityDEpositRefundButtonAcess();

                //$("#btn-finalmoveOutEstimation").addClass('hidden');

                //$("#btn-Submit-final-Estimation").addClass('hidden');


            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function getUniqueContractNo() {


        $.ajax({
            url: "ContractMaster.aspx/GetUniqueContractNo",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                $('#txtContractNo').val(result.d[0].ContractNo);

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
    function IsTenentUnderWorkOrder() {

        $.ajax({
            url: "ContractMaster.aspx/GetIsTenentUnderWorkOrder",
            data: JSON.stringify({ 'ContractID': ContractID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {


                if (result.d == 1) {

                    $('.btn-add-tenant-grid').css('display', 'none');

                }

                else {

                    $('.btn-add-tenant-grid').css('display', 'block');

                }

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    function IsAddTenantPaymentdetails() {

        $.ajax({
            url: "ContractMaster.aspx/GetIsAddTenantPaymentdetails",
            data: JSON.stringify({ 'ContractID': ContractID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {


                if (result.d == 1) {

                    $('.btn-add-paymentdetls').css('display', 'none');

                }

                else {

                    $('.btn-add-paymentdetls').css('display', 'block');

                }

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

}
$('#ddlModeOfPayment').on('change', function () {
    PaymentMethodsFields();

});
    function PaymentMethodsFields() {

        PMethods = $('#ddlModeOfPayment option:selected').val();

       
        if (PMethods == "Cash") {

            $('#textpayeename').attr('disabled','disabled');
            $('#textbankname').attr('disabled', 'disabled');
            $('#textchequeamount').removeAttr('disabled');
            $('#textpaymentdate').removeAttr('disabled');
            $('#textchequenumber').attr('disabled', 'disabled');
            $('#ddlpaymentstatus').removeAttr('disabled');


            $('#valcleared').removeClass('hidden');
            $('#valpendingdue').addClass('hidden');
            $('#pendingNodue').addClass('hidden');


            //$('#divpayeename').addClass('hidden');
            //$('#divbankname').addClass('hidden');
            //$('#divamount').removeClass('hidden');
            //$('#divpaymentdate').removeClass('hidden');
            //$('#divcheqnumber').addClass('hidden');
            //$('#divpaymentstatus').removeClass('hidden');
            //$('#input1').attr('disabled', 'disabled');
        }

           
        

        else if (PMethods == "Bank Transfer") {
            

            $('#textpayeename').removeAttr('disabled');
            $('#textbankname').removeAttr('disabled');
            $('#textchequeamount').removeAttr('disabled');
            $('#textpaymentdate').removeAttr('disabled');
            $('#textchequenumber').attr('disabled','disabled');
            $('#ddlpaymentstatus').removeAttr('disabled');

            $('#valcleared').addClass('hidden');
            $('#valpendingdue').removeClass('hidden');
            $('#pendingNodue').removeClass('hidden');

           
        }
        else if (PMethods == "Cheques") {
            

            $('#textpayeename').removeAttr('disabled');
            $('#textbankname').removeAttr('disabled');
            $('#textchequeamount').removeAttr('disabled', );
            $('#textpaymentdate').removeAttr('disabled');
            $('#textchequenumber').removeAttr('disabled');
            $('#ddlpaymentstatus').removeAttr('disabled');

            $('#valcleared').addClass('hidden');
            $('#valpendingdue').removeClass('hidden');
            $('#pendingNodue').removeClass('hidden');

        }
       
        else {

            $('#textpayeename').removeAttr('disabled');
            $('#textbankname').removeAttr('disabled');
            $('#textchequeamount').removeAttr('disabled',);
            $('#textpaymentdate').removeAttr('disabled');
            $('#textchequenumber').removeAttr('disabled');
            $('#ddlpaymentstatus').removeAttr('disabled');

            $('#valcleared').addClass('hidden');
            $('#valpendingdue').removeClass('hidden');
            $('#pendingNodue').removeClass('hidden');
            
             }


    }

    function BtnRenewalAndTermination() {

        //RewAmount = $('#textRevenewamount').val()
        $.ajax({
            url: "ContractMaster.aspx/GetBtnRenewalAndTermination",
            data: JSON.stringify({ 'ContractID': ContractID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            async: false,
            dataType: "json",
            success: function (result) {


                if (result.d == 1) {

                    $('.btn-contractRenewalAmount').css("display", 'block');
                    $('.btncontract-RenewStage1').css("display", 'none');
                    $('.btncontract-termination').css("display", 'none');

                }

                else if (result.d == 0) {

                    $('.btncontract-RenewStage1').css("display", 'block');
                    $('.btncontract-termination').css("display", 'block');
                    $('.btn-contractRenewalAmount').css("display", 'none');

                }

                else {

                    $('.btncontract-RenewStage1').css("display", 'none');
                    $('.btncontract-termination').css("display", 'none');
                    $('.btn-contractRenewalAmount').css("display", 'none');


                     }

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

}



    //function Renewalbutton() {
    //    RewAmount = $('#textRevenewamount').val()

    //    if (RewAmount == null || RewAmount == "") {
    //        $('.btn-contractRenewalAmount').css("display", 'block');
    //        $('.btncontract-RenewStage1').css("display", 'none');
    //        $('.btncontract-termination').css("display", 'block');


    //    }
    //    else {
    //        $('.btn-contractRenewalAmount').css("display", 'none');
    //        $('.btncontract-RenewStage1').css("display", 'block');
    //        $('.btncontract-termination').css("display", 'block');


    //    }

    //}

    function UpdateRenewalDetails() {

        $.ajax({
            url: "ContractMaster.aspx/UpdateRenewalDetails",

            data: JSON.stringify(

                {

                    "ContractID": $('#textcontractid').val(),

                    "RenewalAmount": $('#textrenewakamount').val(),
                    "RewContractStartDate": $('#textcontractrenewalstatrt').val(),
                    "RewContractEndDate": $('#textcontractrewalend').val(),

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Update Renewal Details..!', '')

                BtnRenewalAndTermination();
                //$('.btn-contractRenewalAmount').css('display', 'none');
                //$('.btn-addrenewal-contracts').css('display', 'block');
                //$("#renewal-contract").removeClass('hidden');
                //RenewalContract();
                //ShowDocumetsCount();
               // BtnAcessAddRewedContract();
            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

}


function BtnAcessAddRewedContract() {

    //RewAmount = $('#textRevenewamount').val()
    $.ajax({
        url: "ContractMaster.aspx/GetBtnAcessAddRewedContract",
        data: JSON.stringify({ 'ContractID': ContractID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        async: false,
        dataType: "json",
        success: function (result) {


            if (result.d == 1) {

                $('.btn-addrenewal-contracts').css("display", 'none');

                $('.btncontract-termination').css("display", 'none');

                //$('.btn-contractRenewalAmount').css("display", 'block');
                //$('.btncontract-RenewStage1').css("display", 'none');

                //$('#add-contract').removeClass('hidden');


            }

            else if (result.d == 0) {

                $('.btn-addrenewal-contracts').css("display", 'block');

                $('.btncontract-termination').css("display", 'none');

                //$('#add-contract').addClass('hidden');

            }

            else {
                $('.btncontract-RenewStage1').css("display", 'none');
                $('.btncontract-termination').css("display", 'none');
                $('.btn-contractRenewalAmount').css("display", 'none');
                $('.btn-addrenewal-contracts').css("display", 'none');
            }

           

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function BtnAcesssubmittermination() {

    $.ajax({
        url: "ContractMaster.aspx/BtnAcesssubmittermination",
        data: JSON.stringify({ 'ContractID': ContractID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        async: false,
        dataType: "json",
        success: function (result) {


            if (result.d == 1) {

                $('.btncontract-termination').css("display", 'none');
                $('.btn-addrenewal-contracts').css("display", 'none');
                //$('.btn-addrenewal-contracts').css("display", 'none');


            }

            else if (result.d == 0) {

                $('.btncontract-termination').css("display", 'block');
                //$('.btn-addrenewal-contracts').css("display", 'none');
                $('.btn-addrenewal-contracts').css("display", 'block');



            }

            else {
                $('.btncontract-termination').css("display", 'none');
                $('.btn-addrenewal-contracts').css("display", 'none');
                //$('.btn-addrenewal-contracts').css("display", 'none');
            }



        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function ShowPaymentMethods() {

    $.ajax({
        url: "ContractMaster.aspx/GetPaymentMethods",
        data: JSON.stringify({ "ContractID": ContractID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var Paymeth = '';
            var paycount = 0;
            $.each(result.d, function (key, item) {
                Paymeth += item.PaymentMethod + '/';
                paycount += parseInt(item.Count)
            });

            $('#txtmodeofpayment').val(Paymeth);
            $('#txtgetnumberofpayments').val(paycount);

          
            //$('#txtmodeofpayment').val(result.d.Type);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function ShowPaymentMethodsDiv() {

    $.ajax({
        url: "ContractMaster.aspx/GetPaymentMethodsDiv",
        data: JSON.stringify({ "ContractID": ContractID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var Paymeth = '';
            var paycount = 0;
            $.each(result.d, function (key, item) {
                Paymeth += item.PaymentMethod + '/';
                //paycount += parseInt(item.Count)
            });

            $('#textmodeofpayment1').val(Paymeth);
            //$('#txtgetnumberofpayments').val(paycount);


            //$('#txtmodeofpayment').val(result.d.Type);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function ShowPaymentMethodsActv() {

    $.ajax({
        url: "ContractMaster.aspx/GetPaymentMethodsActv",
        data: JSON.stringify({ "ContractID": ContractID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var Paymeth = '';
            var paycount = 0;
            $.each(result.d, function (key, item) {
                Paymeth += item.PaymentMethod + '/';
                //paycount += parseInt(item.Count)
            });

            $('#textmodeofpaymentsdiv').val(Paymeth);
            //$('#txtgetnumberofpayments').val(paycount);


            //$('#txtmodeofpayment').val(result.d.Type);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


    function clearContracts() {



       
        $('#ddlBlockAdd').val('-1');
        $('#ddlUnitAdd').val('-1');
        $('#txtPropertyUsage').val('');

        $('#txtChillerAccNo').val('');
        $('#txtContractValue').val('');
        $('#txtSecurityDepAmount').val('');
        $('#ddlModeOfPayment').val('');
        $('#txtBeneficiearyBank').val('');
        $('#txtContractPeriodFrom').val('')
        $('#txtContractPeriodTo').val('');
        $('#txtNoOfMonths').val('');
        $('#txtDescription').val('');


}


function tenentclearform() {


    $('#textemporpassNo').val('');

    $('#texttenantphnumber').val('');

    $('#texttenantname').val('');

    $('#texttenantemaiul').val('');
    
}


function paymentclearform() {


    $('#textpayeename').val('');

    $('#textbankname').val('');

    $('#textbankname').val('');

    $('#textpaymentdate').val('');

    $('#textchequenumber').val('');
  

}

