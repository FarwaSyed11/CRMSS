

var objDatatablesugg = [];
var  objDatatableProj = [];
var  objDatatableProjEnhance = [];
var objDatatableProjIssues = [];
var objDatatablesuggstatus = [];
var StatusVal = -1;

$(document).ready(function () {

    loadAllSuggestions();
    loadProjSuggestions();
    loadEnhanceSugg();
    loadIssuesSuggestions();
    loadUsersuggstatus();
   

    //UpdateSuggStatus();
    $('.btnSugg').on('click', function(){       
        $('#basicModal').modal('show');
        clearsuggection();
    });

    //$('.btnSugg').on('click', function(){
    //    clearsuggection();
    //    basicModal
    //});
});

$('#basicModal').on('click', 'li', function () {
    loadUsersuggstatus();
})






function initiateDataTablealSugg() {
    objDatatablesugg = [];
    objDatatablesugg = $('.suggestion-list-table').DataTable({
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
            { "orderable": false, "targets": [8] },
            { "orderable": true, "targets": [] }
        ]
    });



}

function initiateDataTablealSuggProj()
{
    objDatatableProj = [];
    objDatatableProj = $('.project-sugg-table').DataTable({
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
            { "orderable": false, "targets": [6] },
            { "orderable": true, "targets": [] }
        ]
    });

}


function initiateDataTablealSuggEnhance() {
    objDatatableProjEnhance = [];
    objDatatableProjEnhance = $('.suggestion-enhance-table').DataTable({
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
            { "orderable": false, "targets": [6] },
            { "orderable": true, "targets": [] }
            
        ]
    });

}

function initiateDataTablealSuggIssues() {
    objDatatableProjIssues = [];
    objDatatableProjIssues = $('.suggestion-issues-table').DataTable({
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
            { "orderable": false, "targets": [6] },
            { "orderable": true, "targets": [] }
        ]
    });

}

function initiateDataTablesuggstatus() {
    objDatatablesuggstatus = [];
    objDatatablesuggstatus = $('.userSuggection-table').DataTable({
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
            { "orderable": false, "targets": [4] },
            { "orderable": true, "targets": [] }
        ]
    });



}


$(document).ready(function () {
    loadModulesNameForDDL();

    $('.txtprojectnameDiv').removeClass('hidden');
    $('.txtsuggmoduleDiv').addClass('hidden');      

    $('input[type=radio][name=inlineRadioOptions]').click(function () {

        if ($(this).parent().children()[1].textContent.trim()  == "New Project") {

            $('.txtprojectnameDiv').removeClass('hidden');
            $('.txtsuggmoduleDiv').addClass('hidden');      
            $('.discriptionDiv').removeClass('hidden');
            $('.multiplefileuploadDiv').removeClass('hidden');
        
            

        }
        
        else if ($(this).parent().children()[1].textContent.trim() == "Enhancement") {

            $('.txtprojectnameDiv').addClass('hidden');

            $('.txtsuggmoduleDiv').removeClass('hidden');
            $('.discriptionDiv').removeClass('hidden');
            $('.multiplefileuploadDiv').removeClass('hidden');
                       
        }
        else if ($(this).parent().children()[1].textContent.trim() == "Issues") {

            $('.txtprojectnameDiv').addClass('hidden');
           ;
            $('.txtsuggmoduleDiv').removeClass('hidden');
            $('.discriptionDiv').removeClass('hidden');
            $('.multiplefileuploadDiv').removeClass('hidden');

        }
       
        
        
    });
});

$('#ddlStatus').on('change', function () {

    StatusVal = $('#ddlStatus option:selected').val().trim();
    loadAllSuggestions();
    loadEnhanceSugg();
    loadIssuesSuggestions();
    loadProjSuggestions();
});


function saveSuggestions() {

    var seloption = $('input[name="inlineRadioOptions"]:checked')[0].title;

    let paraProjName = $('#txtsuggprojectname').val();
    let paraSuggType = $('input[name="inlineRadioOptions"]:checked')[0].title


    //var seloption = $('input[name="inlineRadioOptions"]:checked').val().trim();

    //let paraProjName = $('#txtsuggprojectname').val();
    //let paraSuggType = $('input[name=inlineRadioOptions]:checked').val()
    let paraModName = $('#ddlsuggmoduleName').val();

    if (seloption == 'New Project') {
        paraModName = '';
    }
    else if (seloption = 'Enhancement') {
        paraProjName = '';
    }

    else if (seloption = 'Issues') {
        paraProjName = '';
    }

    var formData = new FormData();
    var fileUpload = $('#suggestionfileupload').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    //let sURL = '/Services/eConnectService.asmx/Upload';
    //var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FileUploaderSuggestion.ashx?userid=' + loggedInUserId + '&empname=' + currEmpName + '&empno=' + currEmpNo + '&suggtype=' + paraSuggType + '&projname=' + $('#txtsuggprojectname').val() + '&appname=' + $('#ddlsuggmoduleName').val() + '&desc=' + $('#txtsuggDescription').val();
    var qrystringLocal = '/Services/FileUploaderSuggestion.ashx?userid=' + loggedInUserId + '&empname=' + currEmpName + '&empno=' + currEmpNo + '&suggtype=' + paraSuggType  + '&projname=' + $('#txtsuggprojectname').val() + '&appname=' + $('#ddlsuggmoduleName').val() + '&desc=' + $('#txtsuggDescription').val();

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
                toastr.success('Your Suggestion has been submitted, Thank you! ', '');
                //sendEmail();
            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });

    function sendEmail() {
        $.ajax({
            type: 'post',
            url: "Econnect.aspx/SuggestionCreationMail",
            data: formData,
            success: function (status) {
              
                 
                
            },
            processData: false,
            contentType: false,
            error: function () {
                alert("Whoops something went wrong!");
            }
        });
    }
    
    //$.ajax({
    //    url: "Econnect.aspx/AddSuggestion",
    //    data: JSON.stringify(
    //        {
    //            "UserID": loggedInUserId,
    //            "EmployeeName": currEmpName ,
    //            "EmployeeNumber": currEmpNo ,

    //            "TypeOfSuggestion": $('input[name=inlineRadioOptions]:checked').val(),
    //            "ProjectName": $('#txtsuggprojectname').val() ,
    //            "ApplicationName": $('#ddlsuggmoduleName').val(),
               
    //            "Descrption": $('#txtsuggDescription').val(),
             
    //        }),
    //    type: "POST",
    //    //"ProjectName": $('#txtsuggprojectname').val() == '' ? '' : $('#txtsuggprojectname').val(),
    //    contentType: "application/json;charset=utf-8",
    //    dataType: "json",
    //    async: false,
    //    success: function (result) {
    //        clearsuggection();

    //        //alert(sucessmessage.responseText);
    //        //loadAllProjects();

    //    },
    //    //complete: function () {
    //    //    $('.ajax-loader').hide();
    //    //},
    //    error: function (errormessage) {
    //        alert(errormessage.responseText);
    //    }
    //});
}



function UpdateSuggStatus(id, status) {


    $.ajax({
        url: "SuggestionMaster.aspx/Updatestatus",
        data: JSON.stringify(
            {

                "Id": id,
                "Status": status,
                //"UserID": loggedInUserId,
                //"EmployeeName": currEmpName,
                

            }),
        type: "POST",
       
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //clearsuggection();
            toastr.success('Update Details Sucessfully..', '');
            loadAllSuggestions();
            loadProjSuggestions();
            loadEnhanceSugg();
            loadIssuesSuggestions();

        },
        
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}




function loadModulesNameForDDL() {


    $.ajax({
        url: "Econnect.aspx/GetModuleNamesForDDL",
        data: JSON.stringify(
            {
                "UserID": loggedInUserId     

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            var htm = ' <option value = "-1"> </option>';
            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.Name + '"> ' + item.Name +'</option>';

            });

            $('#ddlsuggmoduleName').html(htm);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function loadAllSuggestions() {

    $.ajax({
        url: "SuggestionMaster.aspx/GetAllSuggestions",
        data: JSON.stringify(
            {
                "status": StatusVal,

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-suggestion tr').length > 0 ? objDatatablesugg.destroy() : '';
             //clearsuggection();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
              

                htm += `  <tr>        
                 
                 <td>`+ item.EmpName + `</td>                
                 <td>`+ item.EmpNo + `</td>
                 <td>`+ item.TypeOfSuggestion + `</td>
                 <td>`+ item.ProjectName + `</td>
                 <td>`+ item.ApplicationName + ` </td>
                  <td>`+ item.Descrption + `</td>   
                  <td> <a href="`+ item.AttachUrl +`"> <i class="fa fa-download"  aria-hidden="true" style="padding-left: 75px;" ></i></a> </td> 

                 <td>`+ item.Date.split(' ')[0] + `</td>
                  <td>`+ item.Status + `</td>   
               
                <td><button type="button"  class="dropdown btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown" ><i class="bx bx-dots-vertical-rounded" style="padding-left: 75px;"></i></button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item"  onclick="UpdateSuggStatus(`+ item.Id + `, 'Under Review')"><i class='bx bx-revision me-2'></i>Under Review</a>
                        <a class="dropdown-item"  onclick="UpdateSuggStatus(`+ item.Id + `,'Scheduled')"><i class='bx bx-alarm-add me-2' ></i></i>Scheduled</a>
                         <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `, 'Working On')"><i class='bx bx-devices me-2'></i></i>Working On</a>
                         <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Completed')"><i class='bx bx-time-five me-2'></i></i>Completed</a>
                         <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Major Application')"><i class='bx bx-devices me-2' ></i></i>Major Application</a>
                        <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Not Applicable')"><i class='bx bx-block me-2'></i></i>Not Applicable</a>
                  

                    </div>
                </td>`;

                
                    //<div class="dropdown">
                    //    <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
                    //    <div class="dropdown-menu">
                    //        <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-edit-alt me-2"></i>Edit</a>
                    //        <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-trash me-2"></i>Delete</a>
                    //    </div>
                    //</div>
                



                htm += `</tr>`;

            });

            $('.tbody-suggestion').html(htm);

            initiateDataTablealSugg();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}




function loadProjSuggestions() {

    $.ajax({
        url: "SuggestionMaster.aspx/GetProjSuggestions",
        data: JSON.stringify(
            {
                "status": StatusVal,

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('.tbody-Projsugg tr').length > 0 ? objDatatableProj.destroy() : '';
            // clearsuggection();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {


                htm += `  <tr>        
                 
                 <td>`+ item.EmpName + `</td>                
                 <td>`+ item.EmpNo + `</td>
                
                 <td>`+ item.ProjectName + `</td>
                
                 <td>`+ item.Descrption + `</td>     
                 <td>`+ item.Date.split(' ')[0] + `</td>
                  <td>`+ item.Status + `</td>
               
                <td><button type="button" class="dropdown btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown" ><i class="bx bx-dots-vertical-rounded" style="padding-left: 75px;"></i></button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `, 'Under Review')"><i class='bx bx-revision me-2'></i>Under Review</a>
                        <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Scheduled')"><i class='bx bx-alarm-add me-2' ></i></i>Scheduled</a>
                    <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `, 'Working On')"><i class='bx bx-devices me-2'></i></i>Working On</a>
                    <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Completed')"><i class='bx bx-time-five me-2'></i></i>Completed</a >
                        <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Major Application')"><i class='bx bx-devices me-2' ></i></i>Major Application</a >
                       <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Not Applicable')"><i class='bx bx-block me-2'></i></i>Not Applicable</a>
                  

                    </div >
                </td >`;
                
                htm += `</tr>`;

            });

            $('.tbody-Projsugg').html(htm);

            initiateDataTablealSuggProj();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function loadEnhanceSugg() {

    $.ajax({
        url: "SuggestionMaster.aspx/GetEnhanceSuggestions",
        data: JSON.stringify(
            {
                "status": StatusVal,

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('.tbody-sugg-enhance tr').length > 0 ? objDatatableProjEnhance.destroy() : '';
            // clearsuggection();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {


                htm += `  <tr>        
                 
                 <td>`+ item.EmpName + `</td>                
                 <td>`+ item.EmpNo + `</td>
                <td>`+ item.ApplicationName + ` </td>
                <td>`+ item.Descrption + `</td>     
                <td>`+ item.Date.split(' ')[0] + `</td>
                 <td>`+ item.Status + `</td>     
                
              
                <td><button type="button" class="dropdown btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown" ><i class="bx bx-dots-vertical-rounded" style="padding-left: 75px;"></i></button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `, 'Under Review')"><i class='bx bx-revision me-2'></i>Under Review</a>
                        <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Scheduled')"><i class='bx bx-alarm-add me-2' ></i></i>Scheduled</a>
                    <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `, 'Working On')"><i class='bx bx-devices me-2'></i></i>Working On</a>
                    <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Completed')"><i class='bx bx-time-five me-2'></i></i>Completed</a >
                        <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Major Application')"><i class='bx bx-devices me-2' ></i></i>Major Application</a >
                       <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Not Applicable')"><i class='bx bx-block me-2'></i></i>Not Applicable</a>
                  

                    </div >
                </td >`;        
                
                htm += `</tr>`;

            });

            $('.tbody-sugg-enhance').html(htm);

            initiateDataTablealSuggEnhance();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


function loadIssuesSuggestions() {

    $.ajax({
        url: "SuggestionMaster.aspx/GetIssuesSuggestions",
        data: JSON.stringify(
            {
                "status": StatusVal,

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('.tbody-sugg-issues tr').length > 0 ? objDatatableProjIssues.destroy() : '';
            // clearsuggection();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {


                htm += `  <tr>        
                 
                 <td>`+ item.EmpName + `</td>                
                 <td>`+ item.EmpNo + `</td>
                <td>`+ item.ApplicationName + ` </td>
                <td>`+ item.Descrption + `</td>     
                <td>`+ item.Date.split(' ')[0] + `</td>
                 <td>`+ item.Status + `</td>     
                <td><button type="button" class="dropdown btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown" ><i class="bx bx-dots-vertical-rounded" style="padding-left: 75px;"></i></button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `, 'Under Review')"><i class='bx bx-revision me-2'></i>Under Review</a>
                        <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Scheduled')"><i class='bx bx-alarm-add me-2' ></i></i>Scheduled</a>
                        <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `, 'Working On')"><i class='bx bx-devices me-2'></i></i>Working On</a>
                        <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Completed')"><i class='bx bx-time-five me-2'></i></i>Completed</a >
                        <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Major Application')"><i class='bx bx-devices me-2' ></i></i>Major Application</a >
                        <a class="dropdown-item" onclick="UpdateSuggStatus(`+ item.Id + `,'Not Applicable')"><i class='bx bx-block me-2'></i></i>Not Applicable</a>
                  

                    </div >
                </td >`;
                
                htm += `</tr>`;

            });

            $('.tbody-sugg-issues').html(htm);

            initiateDataTablealSuggIssues();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function loadUsersuggstatus() {

    $.ajax({
        url: "Econnect.aspx/Getsuggestatus",
        data: JSON.stringify({
            'UserID': loggedInUserId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",  
        dataType: "json",
        async: false,
        success: function (result) {

            //$('.tbody-sugg-status tr').length > 0 ? objDatatablesuggstatus.destroy() : '';
            // clearsuggection();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {


                htm += `  <tr>        
                 
                 <td>`+ item.TypeOfSuggestion + `</td>                
                 <td>`+ item.ProjectName + `</td>
                <td>`+ item.ApplicationName + ` </td>          
                <td>`+ item.Date.split(' ')[0] + `</td>
                <td>`+ item.Status + `</td>   `;




                htm += `</tr>`;

            });

            $('.tbody-sugg-status').html(htm);

            //initiateDataTablesuggstatus();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}



function clearsuggection() {

    $('#radioNewproject').val('')
    $('#radioEnhancement').val('')
    $('#txtsuggprojectname').val('')
    //$('input[name=inlineRadioOptions]').prop('checked', false);
    $('#projectname').val('')
    $('#ddlsuggmoduleName').val('')


    $('#txtsuggDescription').val('')
   


}
