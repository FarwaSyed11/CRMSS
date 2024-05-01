var SurveyorID, SurveyID;
var objDatatable = [], objDatatableProjects = [];
var CRMProjectNumber="";
$(document).ready(function () {


    var htmdrop = '';
    
    if (myroleList.includes("2061")) {
        htmdrop += `<option value="-1" >ALL</option>`;
        htmdrop += `<option value="PENDING" >PENDING</option>`;
        htmdrop += `<option value="VALIDATED" >VALIDATED</option>`;
        htmdrop += `<option value="AUDITED" >AUDITED</option>`;
    }
  
    else if (myroleList.includes("8140")) {

        htmdrop += `<option value="VALIDATED" >VALIDATED</option>`;
        htmdrop += `<option value="AUDITED" >AUDITED</option>`;
    }

    $('#ddlStatus').html(htmdrop);
    LoadSurveyor();

    const timeElapsed = Date.now();
    const today = new Date(timeElapsed);

    $('#txtDate').val(formatDate(today, 'yyyy-mm-dd'));
    $('#txtToDate').val(formatDate(today, 'yyyy-mm-dd'));
    $('.ajax-loader').fadeIn(100);
    setTimeout(function () {
        GetTableDetails('Please wait...');
       
    }, 500);
  
});

$('#btnSearch').on('click', function () {
    $('.ajax-loader').fadeIn(100);
    setTimeout(function () {
        GetTableDetails('Please wait...');
        
    }, 500);
  
});

function LoadSurveyor() {

    $.ajax({
        url: "SiteSurveyValidation.aspx/GetAllSurveyor",
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

            $('#ddlSurveyor').html(htm);
            SurveyorID = $('#ddlSurveyor option:selected').val().trim();
            

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function formatDate(date, format) {
    const map = {
        mm: String(date.getMonth() + 1).padStart(2, '0') ,
        dd: String(date.getDate()).padStart(2, '0'),
        //yy: date.getFullYear().toString().slice(-2),
        yyyy: date.getFullYear()

    }
    

    return format.replace(/mm|dd|yyyy/gi, matched => map[matched])
}

function GetTableDetails(Loader) {

    $.ajax({
        url: "SiteSurveyValidation.aspx/GetSurveyList",
        data: JSON.stringify({ "Date": $("#txtDate").val(), "ToDate": $("#txtToDate").val(), "Surveyor": $("#ddlSurveyor").val(), "ValidateStatus": $("#ddlStatus").val(), "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-maindata tr').length > 0 ? objDatatable.destroy() : '';
            //clearmodal();

            var htm = '';
            var DatList = result.d;

            $(".ajax-loader").fadeOut(500);

            $.each(DatList, function (key, item) {
                htm += `<tr>        
     
                  <td class="hidden" style="text-align:center;">` + item.SurveyId + `</td>
                  <td style="text-align:center;">`+ item.Date + `</td>
                  <td style="text-align:center;">`+ item.ProjectNo + `</td>
                  <td style="text-align:center;">`+ item.ProjectName + `</td>
                  <td style="text-align:center;">`+ item.Client + `</td>
                  <td style="text-align:center;">`+ item.MEPConsultant + `</td>
                  <td style="text-align:center;">`+ item.PlotNumber + `</td>
                   <td style="text-align:center;">`+ item.CurrentStatus + `</td>
                  <td style="text-align:center;">`+ item.UpdatedBy + `</td>
                   <td style="text-align:center;">`+ item.Comments + `</td>`;

                if (item.Status == "PENDING") {
                    htm += ` 
                   <td><a class="badge bg-label-danger me-1">`+ item.Status + `</td>`;
                }
                else if (item.Status == "VALIDATED") {
                    htm += ` 
                   <td><a class="badge bg-label-gray me-1">`+ item.Status + `</td>`;
                }
                else if (item.Status == "AUDITED") {
                    htm += ` 
                   <td><a class="badge bg-label-success me-1">`+ item.Status + `</td>`;
                }
                

//<td style="text-align:center;">`+ item.Status + `</td>


                    htm+=`<td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                    <img src="../icons/newicons/icons8-view-48 (1).png" title="View" class="fa-icon-hover ibtn-Details" style="cursor: pointer; width: 34px;" />
                    </a></td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-maindata').html(htm);

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
    objDatatable = $('.maindata-list-table').DataTable({
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
$('.tbody-maindata').on('click', '.ibtn-Details', function () {
  
    SurveyID = this.parentNode.parentNode.parentNode.children[0].textContent;
  
    GetSurveryDetails();
    getSiteSurveyImages();
    $('#mdDetailView').modal('show');

});

function GetSurveryDetails(Loader) {

    $.ajax({
        url: "SiteSurveyValidation.aspx/GetSurveyDetails",
        data: JSON.stringify({ "SurveyID": SurveyID, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            var DatList = result.d;
            $.each(DatList, function (key, item) {
                $('#lbProjectNumber').val(result.d[0].ProjectNo);
                $('#lbName').val(result.d[0].ProjectName);

                $('#lbClient').val(result.d[0].Client);
                $('#lbConsultant').val(result.d[0].MEPConsultant);
                $('#lbPlotNumber').val(result.d[0].PlotNumber);
                $('#lbCurrentStatus').val(result.d[0].CurrentStatus);
                $('#lbSurveyor').val(result.d[0].UpdatedBy);
                $('#lbComments').val(result.d[0].Comments);
                $('#lbSurveyDate').val(result.d[0].Date);
                $('#lbStatus').val(result.d[0].Status);

                if (result.d[0].Status == "VALIDATED" || result.d[0].Status == "AUDITED") {

                    $('#txtProjectNumber').val(result.d[0].VDProjectNumber);
                    $('#txtProjectName').val(result.d[0].VDProjectName);
                    $('#txtClient').val(result.d[0].VDClient);
                    $('#txtStage').val(result.d[0].VDStage);
                    $('#txtConsultant').val(result.d[0].VDConsultant);
                    $('#txtPlotNumber').val(result.d[0].vDPlotNumber);
                    $('#txtMarketing').val(result.d[0].VDmarketing);
                    $('#txtMainContractor').val(result.d[0].VDMainContractor);
                    $('#txtProjectStatus').val(result.d[0].VDStatus);

                    $(".masterProjectLink").html("<a href=" + result.d[0].MasterProjectLink + " id='txtMasterProjectName' target=_blank>" + result.d[0].MasterProject + "</a>")


                    $('#txtCRMComments').val(result.d[0].CRMComments);
                    $('#ddlCount').val(result.d[0].VDCountStatus);
                    $('#txtReason').val(result.d[0].VDCountReason);

                    if ($("#ddlCount").val() == "NO") {
                        $(".ReasonforNotCount").css("display", "block");
                    }
                    else {
                        $(".ReasonforNotCount").css("display", "none");
                    }

                    $('#chkNewProject').prop('checked', false);
                    $('#chkNewConsultant').prop('checked', false);
                    $('#chkNewContractor').prop('checked', false);
                    $('#chkMainContractorAwarded').prop('checked', false);
                    $('#chkJOH').prop('checked', false);
                    $('#chkLost').prop('checked', false);
                    $('#chkHold').prop('checked', false);
                    $('#chkContractorChanged').prop('checked', false);
                    $('#chkConsultantChanged').prop('checked', false);
                    $('#chkRestarted').prop('checked', false);
                    $('#chkReTender').prop('checked', false);

                    $('#chkLead').prop('checked', false);
                    $('#chkOpportunity').prop('checked', false);
                    $('#chkCompleted').prop('checked', false);
                    $('#chkFencingOnly').prop('checked', false);
                    $('#chkVilla').prop('checked', false);
                    $('#chkMosque').prop('checked', false);
                    $('#chkNoFireScope').prop('checked', false);


                    if (result.d[0].IsNewProject=="true")
                        $('#chkNewProject').prop('checked', true);

                    if (result.d[0].IsNewConsultant == "true")
                        $('#chkNewConsultant').prop('checked', true);

                    if (result.d[0].IsNewContractor == "true")
                        $('#chkNewContractor').prop('checked', true);

                    if (result.d[0].IsMainContractorAwarded == "true")
                        $('#chkMainContractorAwarded').prop('checked', true);

                    if (result.d[0].IsJOH == "true")
                        $('#chkJOH').prop('checked', true);

                    if (result.d[0].IsLost == "true")
                        $('#chkLost').prop('checked', true);

                    if (result.d[0].IsHold == "true")
                        $('#chkHold').prop('checked', true);

                    if (result.d[0].IsContractorChanged == "true")
                        $('#chkConsultantChanged').prop('checked', true);

                    if (result.d[0].IsConsultantChanged == "true")
                        $('#chkLost').prop('checked', true);

                    if (result.d[0].IsRestarted == "true")
                        $('#chkRestarted').prop('checked', true);

                    if (result.d[0].IsReTender == "true")
                        $('#chkReTender').prop('checked', true);

                    if (result.d[0].IsLead == "true")
                        $('#chkLead').prop('checked', true);

                    if (result.d[0].IsNewOPT == "true")
                        $('#chkOpportunity').prop('checked', true);

                    if (result.d[0].IsVilla == "true")
                        $('#chkVilla').prop('checked', true);

                    if (result.d[0].IsNoFireScope == "true")
                        $('#chkNoFireScope').prop('checked', true);

                    if (result.d[0].IsMosque == "true")
                        $('#chkMosque').prop('checked', true);

                    if (result.d[0].IsFencingOnly == "true")
                        $('#chkFencingOnly').prop('checked', true);

                    if (result.d[0].IsCompleted == "true")
                        $('#chkCompleted').prop('checked', true);


                
                    $(".AuditInfo").css("display", "block");
                    $("#dvValidation :input").attr("disabled", false);
                    $("#dvAudit :input").attr("disabled", false);

                    if (myroleList.includes("2061")) {

                        $("#dvValidation :input").attr("disabled", false);
                        $("#dvAudit :input").attr("disabled", true);
                        $(".SaveValidatedData").html("<a href=# id='btNSave' class='btn btn-primary' style='float:left;'><i class='fa fa-save aria-hidden=true'></i>&nbsp;Save</a>")

                    }
                    else {
                        $(".SaveValidatedData").html("")

                    }


                    if (myroleList.includes("8140")) {
                        $("#dvAudit :input").attr("disabled", false);
                        $("#dvValidation :input").attr("disabled", true);
                        $(".AuditSave").html("<a href=# id='btnSaveAudit' class='btn btn-primary' style='float:left;'><i class='fa fa-save aria-hidden=true'></i>&nbsp;Save</a>")

                    }
                    else
                    {
                        $(".AuditSave").html("")

                    }


                    if (result.d[0].Status == "AUDITED") {
                        $("#dvAudit :input").attr("disabled", true);
                        $("#dvValidation :input").attr("disabled", true);


                        $('#ddlAuditCount').val(result.d[0].VDCountStatus);
                        $('#txtAuditReason').val(result.d[0].VDCountReason);

                        

                        $(".AuditSave").html("");

                        $(".SaveValidatedData").html("")


                        $("#dvValidation :input").attr("disabled", true);


                    }
                   


                }
                else {


                    $('#chkNewProject').prop('checked', false);
                    $('#chkNewConsultant').prop('checked', false);
                    $('#chkNewContractor').prop('checked', false);
                    $('#chkMainContractorAwarded').prop('checked', false);
                    $('#chkJOH').prop('checked', false);
                    $('#chkLost').prop('checked', false);
                    $('#chkHold').prop('checked', false);
                    $('#chkContractorChanged').prop('checked', false);
                    $('#chkConsultantChanged').prop('checked', false);
                    $('#chkRestarted').prop('checked', false);
                    $('#chkReTender').prop('checked', false);
                    $('#chkLead').prop('checked', false);
                    $('#chkOpportunity').prop('checked', false);
                    $('#chkVilla').prop('checked', false);
                    $('#chkNoFireScope').prop('checked', false);
                    $('#chkMosque').prop('checked', false);
                    $('#chkFencingOnly').prop('checked', false);
                    $('#chkCompleted').prop('checked', false);

                    $('#txtProjectNumber').val("");
                    $('#txtProjectName').val("");
                    $('#txtClient').val("");
                    $('#txtStage').val("");
                    $('#txtConsultant').val("");
                    $('#txtPlotNumber').val("");
                    $('#txtMarketing').val("");
                    $('#txtMainContractor').val("");
                    $('#txtProjectStatus').val("");

                    $(".masterProjectLink").html("")


                    $('#txtCRMComments').val("");
                    $('#ddlCount').val("-1");
                    $('#txtReason').val("");
                    $(".ReasonforNotCount").css("display", "none");

                   



                    $('#ddlAuditCount').val("-1");
                    $('#txtAuditReason').val("");
                    //$(".AuditReasonforNotCount").css("display", "none");

                    $(".AuditInfo").css("display", "none");
                    $("#dvValidation :input").attr("disabled", false);

                    if (myroleList.includes("2061")) {
                        $(".SaveValidatedData").html("<a href=# id='btNSave' class='btn btn-primary' style='float:left;'><i class='fa fa-save aria-hidden=true'></i>&nbsp;Save</a>")
                    }
                    else {
                        $(".SaveValidatedData").html("")

                    }
                  
                    


                }
                

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


$('#txtProjectNumber').on('click', function () {

      
    if (myroleList.includes("2061")) {
        $("#txtSearch").val("");
        $('#mdProjectDetails').modal('show');
    }

});
$('#btnSearchProjectDetails').on('click', function () {


    if (myroleList.includes("2061")) {
        $('.ajax-loader').fadeIn(100);
        setTimeout(function () {
            GetProjectDetails('Please wait...');

        }, 500);
        $('#mdProjectDetails').modal('show');
    }

});
function GetProjectDetails(Loader) {
    let SearchType;
    if ($('#chkNewProject').is(':checked')) {
        SearchType = "PROJECT";
    }
    else if ($('#chkLead').is(':checked')) {
        SearchType = "LEAD";
    }
    else if ($('#chkOpportunity').is(':checked')) {
        SearchType = "OPPORTUNITY";
    }

    $.ajax({
        url: "SiteSurveyValidation.aspx/GetProjectDetails",
        data: JSON.stringify({ "UserID": currUserId, "SearchWord": $("#txtSearch").val(), "RefType": SearchType, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $(".ajax-loader").fadeOut(500);
            var htm = '';
            $('.tbody-ProjectList tr').length > 0 ? objDatatableProjects.destroy() : '';
            var DatList = result.d;
            $.each(DatList, function (key, item) {
                htm += `<tr>        
     
                  <td class="hidden" style="text-align:center;">` + item.ProjectId + `</td>
                  <td style="text-align:center;">`+ item.ProjectNo + `</td>
                  <td style="text-align:center;">`+ item.ProjectName + `</td>
                  <td style="text-align:center;">`+ item.Client + `</td>
                  <td style="text-align:center;">`+ item.MEPConsultant + `</td>
                  <td style="text-align:center;">`+ item.Marketing + `</td>
                   <td style="text-align:center;">`+ item.PlotNo + `</td>
 <td class="hidden" style="text-align:center;">` + item.MainContractorName + `</td>
 <td class="hidden" style="text-align:center;">` + item.Stage + `</td>
 <td class="hidden" style="text-align:center;">` + item.ProjectStatus + `</td>
 <td class="hidden" style="text-align:center;">` + item.MasterProject + `</td>
 <td class="hidden" style="text-align:center;">` + item.MasterProjectLink + `</td>
                 `;
            });
            $('.tbody-ProjectList').html(htm);
            initiateDataTableProjects();

        },

        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function initiateDataTableProjects() {
    objDatatableProjects = [];
    objDatatableProjects = $('.Project-item-list-table').DataTable({
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


$('.Project-item-list-table').on('click', 'tr', function () {

    $("#ddlCount").val("-1");
    $(".ReasonforNotCount").css("display", "none");

    CRMProjectNumber = this.children[1].textContent;
    $("#txtProjectNumber").val(CRMProjectNumber);
    $("#txtProjectName").val(this.children[2].textContent);
    $("#txtClient").val(this.children[3].textContent);
    $("#txtConsultant").val(this.children[4].textContent);
    $("#txtPlotNumber").val(this.children[6].textContent);
    $("#txtMarketing").val(this.children[5].textContent);
    $("#txtMainContractor").val(this.children[7].textContent);
    $("#txtStage").val(this.children[8].textContent);
    $("#txtProjectStatus").val(this.children[9].textContent);
    $('#mdProjectDetails').modal('hide');
    $(".masterProjectLink").html("<a href=" + this.children[11].textContent + " id='txtMasterProjectName' target=_blank>" + this.children[10].textContent +"</a>")


});
$('#ddlCount').on('change', function () {
    if ($("#ddlCount").val() == "NO") {
        $(".ReasonforNotCount").css("display", "block");
    }
    else {
        $(".ReasonforNotCount").css("display", "none");
    }
});

$('#mdDetailView').on('click', '#btNSave', function () {
   
    if ($('#chkNewProject').is(':checked')) {
        if ($("#ddlCount").val() == "-1") {
            toastr.error("Please select Is this Counted or not");
            return;
        }
        else if ($("#ddlCount").val() == "NO" && $("#txtReason").val() == "") {
            toastr.error("Please Select the reason for not count");
            return;
        }

    }
    else if ($("#ddlCount").val() == "NO") {
        if ($("#txtReason").val() == "") {
            toastr.error("Please Select the reason for not count");
            return;
        }


    }
   
    
    SaveSurveyValidation();
    $('.ajax-loader').fadeIn(100);
    setTimeout(function () {
        GetTableDetails('Please wait...');

    }, 500);
    $('#mdDetailView').modal('hide');
    
    
});




function SaveSurveyValidation(Loader) {

    $.ajax({
        url: "SiteSurveyValidation.aspx/SaveSurveyValidation",
        data: JSON.stringify({
            "SurveyID": SurveyID, "ProjectNumber": CRMProjectNumber, "CrmComments": $("#txtCRMComments").val(), "CountStatus": $("#ddlCount").val(), "Reason": $("#txtReason").val(),
            "IsNewProject": $('#chkNewProject').is(':checked'),
            "IsNewConsultant": $('#chkNewConsultant').is(':checked'),
            "IsNewContractor": $('#chkNewContractor').is(':checked'),
            "IsMainContractorAwarded": $('#chkMainContractorAwarded').is(':checked'),
            "IsJOH": $('#chkJOH').is(':checked'),
            "IsLost": $('#chkLost').is(':checked'),
            "IsHold": $('#chkHold').is(':checked'),
            "IsContractorChanged": $('#chkContractorChanged').is(':checked'),
            "IsConsultantChanged": $('#chkConsultantChanged').is(':checked'),
            "IsRestarted": $('#chkRestarted').is(':checked'),
            "IsReTender": $('#chkReTender').is(':checked'),
            "IsLead": $('#chkLead').is(':checked'),
            "IsNewOPT": $('#chkOpportunity').is(':checked'),
            "IsVilla": $('#chkVilla').is(':checked'),
            "IsNoFireScope": $('#chkNoFireScope').is(':checked'),
            "IsMosque": $('#chkMosque').is(':checked'),
            "IsFencingOnly": $('#chkFencingOnly').is(':checked'),
            "IsCompleted": $('#chkCompleted').is(':checked'),
            "CreatedBy": currUserId,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $(".ajax-loader").fadeOut(500);
           
            toastr.success("Successfully Updated The Details");

        },

        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


$('#mdDetailView').on('click', '#btnSaveAudit', function () {
  
    if ($("#ddlAuditCount").val() == "NO") {
        if ($("#txtAuditReason").val() == "") {
            toastr.error("Please Select the reason for not count");
            return;
        }


    }


    UpdateAuditStatus();
    $('.ajax-loader').fadeIn(100);
    setTimeout(function () {
        GetTableDetails('Please wait...');

    }, 500);
    $('#mdDetailView').modal('hide');

});




function UpdateAuditStatus(Loader) {

    $.ajax({
        url: "SiteSurveyValidation.aspx/UpdateAuditStatus",
        data: JSON.stringify({
            "SurveyID": SurveyID, "CountStatus": $("#ddlAuditCount").val(), "Reason": $("#txtAuditReason").val(),
            "userID": currUserId,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $(".ajax-loader").fadeOut(500);

            toastr.success("Successfully Updated The Details");


        },

        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function getSiteSurveyImages() {

    $.ajax({
        url: "SiteSurveyValidation.aspx/getSiteSurveyImages",
        data: JSON.stringify({
            "SurveyID": SurveyID, 
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var DatList = result.d;
            $.each(DatList, function (key, item) {

                htm +=`<div class="col-md-4" style="margin-top:5px;">
                                             <img class="imageview" src="`+ item.FileData + `" alt="` + item.FileName+`"  height="500" />
                                         </div>`
            });

            $(".SiteSurveyimages").html(htm);
        },

        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#chkLead').on('change', function () {
    if ($('#chkNewProject').is(':checked')) {
        $('#chkNewProject').prop('checked', false);
    }
    if ($('#chkOpportunity').is(':checked')) {
        $('#chkOpportunity').prop('checked', false);
    }

});

$('#chkNewProject').on('change', function () {
    if ($('#chkLead').is(':checked')) {
        $('#chkLead').prop('checked', false);
    }
    if ($('#chkOpportunity').is(':checked')) {
        $('#chkOpportunity').prop('checked', false);
    }

});

$('#chkOpportunity').on('change', function () {
    if ($('#chkLead').is(':checked')) {
        $('#chkLead').prop('checked', false);
    }
    if ($('#chkNewProject').is(':checked')) {
        $('#chkNewProject').prop('checked', false);
    }

});


