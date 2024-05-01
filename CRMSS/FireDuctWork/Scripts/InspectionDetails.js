
var objDatatable = [];
var selId = 0;

var controlListTextBox = [];
var controlListRadio = [];
var finalList = [];
var checklistNameList = [];

var currInsertedInspecId = '', selProjNo = '';

var listInspectResponse = [];
var listInspectResponseForView = [];

var selCheckListIdForImages = 0;
var recentClickedUploaderID = '';
var selInspectIdForView = 0;
$(document).ready(function () {

    loadInspectionProjects();

    $('.SiteInspection-table').on('click', '.iconAddChecklist', function () {

        resetAccordion();

        selId = this.parentNode.parentNode.children[0].textContent.trim();
        selProjNo = this.parentNode.parentNode.children[1].textContent.trim()
        loadCheckList();
        getBasicPrjDetails();
    })

    $('.tab-Inspections').on('click', 'li', function () {

        let liName = $(this).text().trim();
        if (liName == "Existing") {
            loadInspectionsOfProject();
        } else {

        }
        //alert('sada');
    });

    $('.tbody-InspectProject').on('click', 'tr', function () {

        $('.tbody-InspectProject tr').removeClass('active-tr');

        $(this).addClass('active-tr');
        selInspectIdForView = $(this).data('inspectid');
        getAllCheckListResponsesForView();
        //alert('sada');
    });
    //$('.kpi-user-list-table').on('click', '.iconAddChecklist', function () {
    //    selId = this.parentNode.parentNode.children[0].textContent.trim();
    //    //showModal
    //})

    $('.btnObbCheck').on('click', function () {
        controlListTextBox = [];
        controlListRadio = [];
        finalList = [];
        checklistNameList = [];
       
            var count = 0;
            $(".tbody-checklist tr").each(function () {

                let $inputs2 = $("input[type = 'radio']:checked", this);
                controlListRadio.push({ "Id": $inputs2[0].id, "Value": $inputs2.val() })

                let $inputs3 = $("input[type = 'text']", this);
                for (var i = 0; i < $inputs3.length; i++) {
                    controlListTextBox.push({ "Id": $inputs3[i].id, "Value": $('#' + $inputs3[i].id).val() })
                }

                checklistNameList.push({ "Id": $('.tbody-checklist tr:eq(' + count + ') td:eq(3) button').data('checklistid'), "Value": $('.tbody-checklist tr:eq(' + count + ') td:eq(1)').text().trim() }); //getting all checklist text
                count++;
            });


            // "InspecId": currInsertedInspecId,
            finalList.push({
                "InspecId": currInsertedInspecId,
                "ProjNumber": selProjNo,
                "InspectNumber": $('#txtInspectionNumber').val(),                
                "Radio": controlListRadio,
                "Textbox": controlListTextBox,
                checklistNames: checklistNameList
            });
            insertCheckListResponses();
                
    });



   
    
});



function initiateDataTableInspection() {
    objDatatable = [];
    objDatatable = $('.SiteInspection-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 }, +
            { "orderable": false, "targets": [10] },
            { "orderable": true, "targets": [] }
        ]
    });

    //$('.dataTables_paginate .current').css('background', '#f44336');
    //$('.dataTables_paginate .current').css({ 'background': '#f44336' })

}

function loadInspectionProjects() {
    $.ajax({
        url: "InspectionDetails.aspx/GetInspectionProjects",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>  

                 <td style="display:none">`+ item.Mid + `</td>
                 <td>`+ item.SLNo + `</td>
                 <td>`+ item.CreatedDate.split(' ')[0] + `</td>               

                 <td>`+ item.CustomerNumber + `</td>
                 <td>`+ item.CustomerName + `</td>
                 <td>`+ item.ProjectName + `</td>
                 <td>`+ item.Location + ` </td>
                  
                <td>`+ item.Consultant + `</td>
                <td>`+ item.MainContractor + `</td>
                <td>`+ item.MEPContractor + `</td>
                <td>`+ item.DeliveryDate.split(' ')[0] + `</td>
                
                <td> <button type="button" data-bs-toggle="modal" data-bs-target="#ModalInspectionDetails" class="btn rounded-pill btn-outline-secondary iconAddChecklist" data-bs-toggle="modal" data-bs-target="#FRDaddProjectstatus" title="Status" >
                    <span class="tf-icons bx bx-plus"></span>
                </button></td>`;




                htm += `</tr>`;

            });

            $('.tbody-siteinspection').html(htm);

            initiateDataTableInspection();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function loadCheckList() {
    $.ajax({
        url: "InspectionDetails.aspx/GetCheckLists",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                 <td>`+ item.Id + `</td>
                 <td>`+ item.CheckList + `</td>   

                <td>   
                    
                    <div class="form-check form-check-inline mt-3">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions-`+ key + `" id="rbYes-` + key + `" value="Yes-` + key + `" />
                        <label class="form-check-label" for="inlineRadio`+ key + `">Yes</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions-`+ key + `" id="rbNo-` + key + `" value="No-` + key + `" />
                        <label class="form-check-label" for="inlineRadio`+ key + `">No</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions-`+ key + `" id="rbNA-` + key + `" value="N/A-` + key + `" checked="checked" />
                        <label class="form-check-label" for="inlineRadio`+ key + `">N/A</label>
                    </div> 

                </td>



                
               <td style="display: inline-flex;">

               <div class="icon-uploadtick-`+ key +`"  style="text-align:center;padding-top: 10px;padding-right: 10px;display:none"> 
               <span style="margin-left: 4%;"> <i class="fa fa-check" title="Other" style="color:#50d02a; cursor:pointer;font-size: x-large;"></i></span>
               </div>

                 <div class='file file--upload'>
                    <label for='input-file-`+ key +`'> <i class="fa fa-upload" aria-hidden="true"></i>Upload</label>
                   <input type='file' id='input-file-`+ key +`' class="uploader-clist" multiple />
                 </div>

                  <div>

                     <button type="button"  class="btn rounded-pill btn-outline-secondary btnSaveAttach" data-checklistId=`+item.Id+` style="margin-left: 11px;">
                     Save
                    </button>
                  </div>
             </td>
             
         
             

                <td><input type="text" class="form-control" id="txtChecklistComm`+ key + `" placeholder="Enter your Comment" aria-describedby="defaultFormControlHelp" /> </td>

                <td><input type="text" class="form-control" id="txtChecklistActionReq`+ key + `" placeholder="Enter Your Action" aria-describedby="defaultFormControlHelp" /> </td>`;


                htm += `</tr>
                    `;

            });

            $('.tbody-checklist').html(htm);

            $('.btnSaveAttach').unbind('click');
            $('.btnSaveAttach').on('click', function () {
                selCheckListIdForImages = $(this).data('checklistid');
                recentClickedUploaderID = $(this).parent().parent().find('.uploader-clist')[0].id;
                uploadFilesForCheckList(recentClickedUploaderID);
                $(this).parent().parent().children().eq(0).css('display', 'block');
            });
            //initiateDataTable();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function getBasicPrjDetails() {


    $.ajax({
        url: "InspectionDetails.aspx/getPrjInspectionDetails",
        data: JSON.stringify({ 'selId': selId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#txtprojNumber').val(result.d.SLNo);
            $('#txtprojName').val(result.d.ProjectName);
            $('#txtcustomerName').val(result.d.CustomerName);
            $('#txtmainContractor').val(result.d.MainContractor);
            $('#txtMEPcontractor').val(result.d.MEPContractor);
            $('#txtFRDlocation').val(result.d.Location);

            //, 'TextboxActionRequired': controlListTextBoxActionReq
            //testAjax();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



function insertCheckListResponses() {

    $.ajax({
        url: "InspectionDetails.aspx/InsertUpdateChecklist",
        data: JSON.stringify({ "data": finalList }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //loadAllProjects();            
            toastr.success('Successfully Submit Your Inspection Details', '');
            getAllCheckListResponses();
            //$('#accordionTwo').removeClass('show');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
           
        }
    });

}

function getAllCheckListResponses() {
    
    $.ajax({
        url: "InspectionDetails.aspx/GetInspectResponse",
        data: JSON.stringify(
            {
                "InspectId": currInsertedInspecId
            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-checklist').html('');

            listInspectResponse = result.d;
            var htm = '';           
            $.each(listInspectResponse, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                 <td>`+ (key +1) + `</td>
                 <td>`+ item.CheckList + `</td>   

                <td>   
                    
                    <div class="form-check form-check-inline mt-3">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions-`+ key + `" id="rbYes-` + key + `" value="Yes-` + key + `" />
                        <label class="form-check-label" for="inlineRadio`+ key + `">Yes</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions-`+ key + `" id="rbNo-` + key + `" value="No-` + key + `"/>
                        <label class="form-check-label" for="inlineRadio`+ key + `">No</label>
                    </div>
                     <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions-`+ key + `" id="rbNA-` + key + `" value="N/A-` + key + `" checked="checked"/>
                        <label class="form-check-label" for="inlineRadio`+ key + `">N/A</label>
                    </div>
                   

                </td>

                  

               <td style="display: inline-flex;">
                 <div class='file file--upload'>
                    <label for='input-file-`+ key +`'> <i class="fa fa-upload" aria-hidden="true"></i>Upload</label>
                  <input type='file' id='input-file-`+key+`' class="uploader-clist" multiple />
                 </div>

                  <div>

                     <button type="button"  class="btn rounded-pill btn-outline-secondary btnSaveAttach" data-checklistId=`+ item.Id +` style="margin-left: 11px;">
                     Save
                    </button>
                  </div>
             </td>

                <td><input type="text" class="form-control" id="txtChecklistComm`+ key + `" placeholder="Enter your Comment" aria-describedby="defaultFormControlHelp" /> </td>

                <td><input type="text" class="form-control" id="txtChecklistActionReq`+ key + `" placeholder="Enter Your Action" aria-describedby="defaultFormControlHelp" /> </td>`;

                htm += `</tr>
                    `;
               
            });
            $('.tbody-checklist').html(htm);

            $.each(listInspectResponse, function (key, item) {

                $(".tbody-checklist tr").find('#' + item.CommId).val(item.Comm);
                $(".tbody-checklist tr").find('#' + item.ActionReqId).val(item.ActionReq);
                $(".tbody-checklist tr").find('#' + item.StatusId).prop('checked', true);

            });
            //$(".tbody-checklist tr").find('#txtChecklistComm2').val(1212)
            $('.btnSaveAttach').unbind('click');
            $('.btnSaveAttach').on('click', function () {
                selCheckListIdForImages = $(this).data('checklistid');
                recentClickedUploaderID = $(this).parent().parent().find('.uploader-clist')[0].id;
                uploadFilesForCheckList(recentClickedUploaderID);
            });

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function uploadFilesForCheckList(fileId) {

    var formData = new FormData();
    var fileUpload = $('#' + fileId).get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }
    let con = selCheckListIdForImages;

   let sURL = 'https://crmss.naffco.com/CRMSS/Services/UploadForCheckList.ashx?Id='+ selCheckListIdForImages;
   // let sURL = '/Services/UploadForCheckList.ashx?Id=' + selCheckListIdForImages;

    $.ajax({
        type: 'post',
        url: sURL,
        data: formData,
        success: function (status) {
            toastr.success('Uploaded Successfully', '');

            $('.icon-uploadtick').css("display", 'block');

        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });

}



function loadInspectionsOfProject() {

    $.ajax({
        url: "InspectionDetails.aspx/GetAllInspectionsOfProject",
        data: JSON.stringify(
            {
                "ProjNo": selProjNo
            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
           // $('.tbody-checklist').html('');                                     
            var res = result.d;
            var htm = '';

            $.each(res, function (key, item) {
                htm += `<tr data-InspectId=` + item.InspectId +`>  
                    <td>`+ item.ProjectNumber + ` </td>
                    <td>`+ item.ProjectName + ` </td>
                    <td> `+ item.CustomerName + `</td>
                    <td> `+ item.InspectionNumber + `</td>

                    
                    </tr>`;

            });

            $('.tbody-InspectProject').html(htm);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function getAllCheckListResponsesForView() {

    $.ajax({
        url: "InspectionDetails.aspx/GetInspectResponse",
        data: JSON.stringify(
            {
                "InspectId": selInspectIdForView
            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //$('.tbody-checklistForView').html('');

            listInspectResponseForView = result.d;
            var htm = '';
            $.each(listInspectResponseForView, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                 <td>`+ (key + 1) + `</td>
                 <td>`+ item.CheckList + `</td>   

                <td>   
                    
                    <div class="form-check form-check-inline mt-3">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions-`+ key + `" id="rbYes-` + key + `" value="Yes-` + key + `" />
                        <label class="form-check-label" for="inlineRadio`+ key + `">Yes</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions-`+ key + `" id="rbNo-` + key + `" value="No-` + key + `" />
                        <label class="form-check-label" for="inlineRadio`+ key + `">No</label>
                    </div>

                     <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions-`+ key + `" id="rbN/A-` + key + `" value="N/A-` + key + `" checked="checked" />
                        <label class="form-check-label" for="inlineRadio`+ key + `">N/A</label>
                    </div>
                   

                </td>

                <td style="display: inline-flex;">

                 <ul>
                     <li>
                         Image Name
                     </li>
                  </ul>

                </td>

                  

              

                <td><input type="text" class="form-control" id="txtChecklistComm`+ key + `" placeholder="Enter your Comment" aria-describedby="defaultFormControlHelp" /> </td>

                <td><input type="text" class="form-control" id="txtChecklistActionReq`+ key + `" placeholder="Enter Your Action" aria-describedby="defaultFormControlHelp" /> </td>`;

                htm += `</tr>
                    `;

            });
            $('.tbody-checklistForView').html(htm);

            $.each(listInspectResponseForView, function (key, item) {

                $(".tbody-checklistForView tr").find('#' + item.CommId).val(item.Comm);
                $(".tbody-checklistForView tr").find('#' + item.ActionReqId).val(item.ActionReq);
                $(".tbody-checklistForView tr").find('#' + item.StatusId).prop('checked', true);

            });
         

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



function AddInspectnDetl() {
 
    if (validateIns() == false) {
        toastr.error('Please fill the fields..', '');
    }
    else {
        $.ajax({
            url: "InspectionDetails.aspx/AddInspectionBasicDetails",
            data: JSON.stringify(
                {
                    "ProjectNumber": $('#txtprojNumber').val(),
                    "ProjectName": $('#txtprojName').val(),
                    "Location": $('#txtFRDlocation').val(),
                    "CustomerName": $('#txtcustomerName').val(),
                    "MainContractor": $('#txtmainContractor').val(),
                    "MEPContractor": $('#txtMEPcontractor').val(),
                    "OrderNumber": $('#txtodredNumber').val(),
                    "DrawingNumber": $('#txtdrawingNo').val(),
                    "InspectionDate": $('#txtinsptionDate').val(),
                    "InstallationCompletion": $('#txtinstallnCompltd').val(),
                    "FRDModelNumber": $('#txtfrdmodelnumber').val(),
                    "InspectionNumber": $('#txtInspectionNumber').val(),
                    "InspectionLocation": $('#textinspectionlocation').val(),
                    "Status": $('#ddlinspectionstatus').val(),
                    "UpdatedBy": currUserId
                    //"Observation": $('#txtaObservations').val()


                }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                //loadAllProjects();
                currInsertedInspecId = result.d;

                $('#accordionOne').removeClass('show');
                $('#accordionTwo').addClass('show');

                /*          $('.btnObbCheck').trigger('click');*/

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }
}

function validateIns() {

    var isValid = true;

    if ($('#ddlinspectionstatus').val().trim() == "") {
        $('#ddlinspectionstatus').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#ddlinspectionstatus').css('border-color', 'lightgrey');
    }

    if ($('#textinspectionlocation').val().trim() == "") {
        $('#textinspectionlocation').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#textinspectionlocation').css('border-color', 'lightgrey');
    }

    return isValid;

}

function resetAccordion() {
    $('#accordionOne').addClass('show');
    $('#accordionTwo').removeClass('show');
}
function observation() {
   /* $('.btnObbCheck').trigger('click');*/
 
        $('.InspArea').css('display', 'none');
        $('#btnOk').css('display', 'block');
        $('#modalObservation').modal('show');

}

function InspDet() {
    $('#btnOk').css('display', 'none');
    $('.InspArea').css('display', 'block');
}

function UpdateInspectionDet() {
    
    $.ajax({

       
        url: "InspectionDetails.aspx/AddInspectionDet",
        data: JSON.stringify(
            {
                "Observation": $('#txtObservation').val(),
                "InspName": $('#txtInspName').val(),
                "ClientName": $('#txtClient').val(),
                "InspDes": $('#txtInspDesignation').val(),
                "ClientDes": $('#txtClientDesignation').val(),
                "InspMob": $('#txtInspMob').val(),
                "ClientMob": $('#txtClientMob').val(),
                "ProjNumber": selProjNo,
                "InspId": currInsertedInspecId
                //"InspectSign": $('#inspectSignedDiv img').length > 0 ? $('#inspectSignedDiv img')[0].src : '',
                //"CustSign": $('#custSignedDiv img').length > 0 ? $('#custSignedDiv img')[0].src : ''
            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Successfully Submit Your Inspection Details', '');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function InspDetSave() {
/*    $('.btnObbCheck').trigger('click');*/
    if (validate()) {
        if ($('#inspectSignedDiv img').length > 0) {
            UpdateInspectionDet();
            $('#modalObservation').modal('hide');
        }
        else {
            toastr.error('Inspector Signature is mandatory', '');
        } 
    }
    else {
        toastr.error('Please fill all mandatory fields', '');
    }
          
}


function validate() {

    var isValid = true;
    if ($('#txtInspName').val().trim() == "") {
        $('#txtInspName').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#txtInspName').css('border-color', 'lightgrey');
    }

    if ($('#txtClient').val().trim() == "") {
        $('#txtClient').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#txtClient').css('border-color', 'lightgrey');
    }

    if ($('#txtInspDesignation').val().trim() == "") {
        $('#txtInspDesignation').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#txtInspDesignation').css('border-color', 'lightgrey');
    }

    if ($('#txtClientDesignation').val().trim() == "") {
        $('#txtClientDesignation').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#txtClientDesignation').css('border-color', 'lightgrey');
    }

    if ($('#txtInspMob').val().trim() == "") {
        $('#txtInspMob').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#txtInspMob').css('border-color', 'lightgrey');
    }

    if ($('#txtClientMob').val().trim() == "") {
        $('#txtClientMob').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#txtClientMob').css('border-color', 'lightgrey');
    }
    
    return isValid;

}


// E signature work

var isSign = false;
var leftMButtonDown = false;

jQuery(function () {
    //Initialize sign pad
    $('.btn-cust-grid').on('click', function () {
        $('#eSignCustomerModal').modal('show');
        init_Sign_Canvas('canvasCustomer');
    })

    $('.btn-inspect-grid').on('click', function () {
        $('#eSignInspectorModal').modal('show');
        init_Sign_Canvas('canvasInspector');
    })

});


function fun_submit_customer() {
    if (isSign) {
        
        var canvas = $("#canvasCustomer").get(0);
        var imgData = canvas.toDataURL();
        jQuery('#custSignedDiv').find('p').remove();
        jQuery('#custSignedDiv').find('img').remove();
        jQuery('#custSignedDiv').append(jQuery('<p>Your Sign:</p>'));
        jQuery('#custSignedDiv').append($('<img/>').attr('src', imgData));

        $('#eSignCustomerModal').modal('hide');

        $.ajax({
            url: "InspectionDetails.aspx/ConvertBase64ToImg",
            data: JSON.stringify({ 'imgStr': canvas.toDataURL('data:image/png;base64'), 'EmpNo': EmpNo, 'ProjNo': selProjNo, 'InspectReqId': currInsertedInspecId, 'SignFrom': 'Customer' }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    } else {
        toastr.error('Please sign', '');
    }
}

function fun_submit_inspector() {
    if (isSign) {
        
        var canvas = $("#canvasInspector").get(0);
        var imgData = canvas.toDataURL();
        jQuery('#inspectSignedDiv').find('p').remove();
        jQuery('#inspectSignedDiv').find('img').remove();
        jQuery('#inspectSignedDiv').append(jQuery('<p>Your Sign:</p>'));
        jQuery('#inspectSignedDiv').append($('<img/>').attr('src', imgData));
        $('#eSignInspectorModal').modal('hide');

        $.ajax({
            url: "InspectionDetails.aspx/ConvertBase64ToImg",
            data: JSON.stringify({ 'imgStr': canvas.toDataURL('data:image/png;base64'), 'EmpNo': EmpNo, 'ProjNo': selProjNo, 'InspectReqId': currInsertedInspecId, 'SignFrom':'Inspector' }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    } else {
        toastr.error('Please sign', '');
    }
}

function init_Sign_Canvas(forWhomId) {
    isSign = false;
    leftMButtonDown = false;

    //Set Canvas width
    var sizedWindowWidth = 401;   //$(window).width();
    if (sizedWindowWidth > 700)
        sizedWindowWidth = $(window).width() / 2;
    else if (sizedWindowWidth > 400)
        sizedWindowWidth = sizedWindowWidth - 100;
    else
        sizedWindowWidth = sizedWindowWidth - 50;

    var canvasId = '#' + forWhomId;
    $(canvasId).width(sizedWindowWidth);
    $(canvasId).height(200);
    // $("#canvas").css("border", "1px solid #000");

    var canvas = $(canvasId).get(0);

    canvasContext = canvas.getContext('2d');

    if (canvasContext) {
        canvasContext.canvas.width = sizedWindowWidth;
        canvasContext.canvas.height = 200;

        canvasContext.fillStyle = "#fff";
        canvasContext.fillRect(0, 0, sizedWindowWidth, 200);

        canvasContext.moveTo(50, 150);
        canvasContext.lineTo(sizedWindowWidth - 50, 150);
        canvasContext.stroke();

        canvasContext.fillStyle = "#000";
        canvasContext.font = "20px Arial";
        canvasContext.fillText("x", 40, 155);
    }
    // Bind Mouse events
    $(canvas).on('mousedown', function (e) {
        if (e.which === 1) {
            leftMButtonDown = true;
            canvasContext.fillStyle = "#000";
            var x = e.pageX - $(e.target).offset().left;
            var y = e.pageY - $(e.target).offset().top;

            canvasContext.moveTo(x, y);
        }
        e.preventDefault();
        return false;
    });

    $(canvas).on('mouseup', function (e) {
        if (leftMButtonDown && e.which === 1) {
            leftMButtonDown = false;
            isSign = true;
        }
        e.preventDefault();
        return false;
    });

    // draw a line from the last point to this one
    $(canvas).on('mousemove', function (e) {
        if (leftMButtonDown == true) {
            canvasContext.fillStyle = "#000";
            var x = e.pageX - $(e.target).offset().left;
            var y = e.pageY - $(e.target).offset().top;
            canvasContext.lineTo(x, y);
            canvasContext.stroke();
        }
        e.preventDefault();
        return false;
    });

    //bind touch events
    $(canvas).on('touchstart', function (e) {
        leftMButtonDown = true;
        canvasContext.fillStyle = "#000";
        var t = e.originalEvent.touches[0];
        var x = t.pageX - $(e.target).offset().left;
        var y = t.pageY - $(e.target).offset().top;
        canvasContext.moveTo(x, y);

        e.preventDefault();
        return false;
    });

    $(canvas).on('touchmove', function (e) {
        canvasContext.fillStyle = "#000";
        var t = e.originalEvent.touches[0];
        var x = t.pageX - $(e.target).offset().left;
        var y = t.pageY - $(e.target).offset().top;
        canvasContext.lineTo(x, y);
        canvasContext.stroke();

        e.preventDefault();
        return false;
    });

    $(canvas).on('touchend', function (e) {
        if (leftMButtonDown) {
            leftMButtonDown = false;
            isSign = true;
        }

    });
}




//end here 