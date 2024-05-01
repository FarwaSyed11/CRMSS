
var Type = 'Cross Functional';
var objDatatableSurvey = [];
var objDatatableSurveyQuestion = [];
var objDatatableSurveyEmployee = [];
var SurveyId = '';
var QstId = '';
var objDatatableAnswer = [];
var StartDate = [];
var EndDate = [];

var objAddSurvey = [], listSurvey = [];
var selSurveyObj = [];
var ddlListDepartment = [];

var msgForSurveyIfFailed = '';

var listQuestions = [], listQOptions = [], listJusti = [], listLineManagers=[];
var selDeptIdsForSurvey = 0;
var objDatatableEmpsList = [], objDTLMList=[];
var EmpNosForSurvey = '';

$(document).ready(function () {

    fillOrgDDL();
    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

     flatpickr(jQuery("#txtSurveyStartDate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            StartDate = dateStr;
        }
    });
    flatpickr(jQuery("#txtSurveyEndDate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            EndDate = dateStr;
        }
    });


    //function toggleJustiView() {
    //    var x = document.getElementById("togglejusti-ul");
    //    if (x.style.display === "none") {
    //        x.style.display = "block";
    //    } else {
    //        x.style.display = "none";
    //    }
    //}

});

$('#ddlType').on('change', function () {

    Type = $('#ddlType option:selected').val();
    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

$('.survey-admin-ul-main').on('click', 'li', function () {

    let liName = $(this).children().text().trim();

    if (liName == 'Survey') {
        selProjId = -1;
        getAllProjects();
    }
    else if (liName == 'Template') {
        loadAllTemplate();
        getAllQuestions();
    }
    else if (liName == 'Question Master') {
        getAllQuestions();
    }

});

function GetTableDetails(Loader) {

    $.ajax({
        url: "SurveyAdmin.aspx/GeSurveyTableDetails",
        data: JSON.stringify({ "Type": Type }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Survey tr').length > 0 ? objDatatableSurvey.destroy() : '';
            //clearmodal();

            var htm = '';
             listSurvey = result.d;



            $.each(listSurvey, function (key, item) {
                htm += `<tr>        
     
                  
                  <td style="text-align:center;">`+ item.SurveyName + `</td>
                  <td style="text-align:center;"><span class="`+ item.StatusBadge +`">`+ item.Status + `</span></td>
                  <td style="text-align:center;">`+ item.Company + `</td>
                  <td style="text-align:center;">`+ item.SurveyDeptName + `</td>
                  <td style="text-align:center;">`+ item.StartDate + `</td>
                  <td style="text-align:center;">`+ item.EndDate + `</td> 
                  <td style="text-align:center;">
<span>                          <i class="fa fa-duotone fa-eye fa-icon-hover ibtn-survey-view" title="View Survey" data-surveyid="`+ item.SurveyID +`" style="color:#ff4900fa; cursor:pointer;font-size: x-large;"></i> </span>
<span style="margin-left: 4%;"> <i class="bx bxs-edit fa-icon-hover ibtn-survey-edit" title="Edit Survey" data-surveyid="`+ item.SurveyID +`" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>

</td> `;
              /*  <i class="fa-duotone fa-eye"></i>*/
               




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Survey').html(htm);

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


function GetSurveyDetails() {

    $.ajax({
        url: "SurveyAdmin.aspx/GeSurveyDetails",
        data: JSON.stringify({ "SurveyId": SurveyId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
          
            $('#lblSurveyName').val(result.d[0].SurveyName);
            $('#lblSurveyType').val(result.d[0].SurveyType);
            $('#lblStatus1').html(result.d[0].Status);
            $('#lblSurveyDesc').val(result.d[0].SurveyDescription);
            $('#lblCompany').val(result.d[0].Company);
            $('#lblDepartment').val(result.d[0].Department);
           /* $('#lblEmployee').val(result.d[0].Employee);*/
          /*  $('#lblAppId').val(result.d[0].APPID);*/
  /*          $('#lblUpdatedBy').val(result.d[0].UpdatedBy);*/
            $('#lblUpdatedDate').val(result.d[0].UpdatedDate);
            $('#lblStartDate').val(result.d[0].StartDate);
            $('#lblEndDate').val(result.d[0].EndDate);
            $('#lblTempName').val(result.d[0].FeedbackName);
   /*         $('#lblSurveyDep').val(result.d[0].SurveyDept);*/
            $('#lblSurveyDepName').val(result.d[0].SurveyDeptName);
            $('#lblStatus1').addClass(result.d[0].StatusBadge);


           
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
    objDatatableSurvey = [];
    objDatatableSurvey = $('.Survey-list-table').DataTable({
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

function hideShowSurveyDetails() {
    var x = document.getElementById("Survey-details-rectangle-div");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#Survey-details-rectangle-div').show('400');
        $('.Survey-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.Survey-det-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#Survey-details-rectangle-div').hide('400');
        $('.Survey-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.Survey-det-drilldown').addClass('bx bxs-chevron-down');

    }
}


function initiateDataTableQuestion() {
    objDatatableSurveyQuestion = [];
    objDatatableSurveyQuestion = $('.Question-list-table').DataTable({
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

function initiateDataTableEmployee() {
    objDatatableSurveyEmployee = [];
    objDatatableSurveyEmployee = $('.Employee-list-table').DataTable({
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


function SurveyAllDetails() {


    $.ajax({
        url: "SurveyAdmin.aspx/GetAllDetails",
        data: JSON.stringify({ "SurveyId": SurveyId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htme = '';
            $('.tbody-Question-list tr').length > 0 ? objDatatableSurveyQuestion.destroy() : '';
            $('.tbody-Employe-list tr').length > 0 ? objDatatableSurveyEmployee.destroy() : '';


            $.each(result.d[0].QuestionDet, function (key, item) {



                htm += `  <tr>        

                 <td style="display:none;">`+ item.QuestionID + `</td>
                 <td >`+ item.Category + `</td>
                 <td>`+ item.Quesion + `</td>      
                  <td>`+ item.QuestionType + `</td>                   
                   <td style="text-align:center;"> <i class="fa fa-duotone fa-eye View-Answer" title="Edit Task" data-taskid="4" style="color:#ff4900fa; cursor:pointer;font-size: x-large;"></i></td> 
                   </tr>`;

            });
            $.each(result.d[0].EmployeeDet, function (key, item) {



                htme += `  <tr>        
               
                 <td >`+ item.EmpName + `</td>
                 <td>`+ item.Company + `</td>      
                  <td>`+ item.CreatedBy + `</td>  
                  <td>`+ item.CreatedDate + `</td>  
                  <td ><span class="`+ item.StatusBadge + `">`+ item.SurveyStatus + `</span></td>   
                 <td>`+ item.SubmittedOn + `</td>      
                  <td>`+ item.StartDate + `</td>  
                  <td>`+ item.Comments + `</td>  
                 
                   </tr>`;

            });
           
            $('.tbody-Question-list').html(htm);
            initiateDataTableQuestion();
            $('.tbody-Employe-list').html(htme);
            initiateDataTableEmployee();
           

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-Question-list').on('click', '.View-Answer', function () {

    QstId = this.parentNode.parentNode.children[0].textContent;
    GetAnswerDetails();
    $('.tbody-Question-details tr').removeClass('active-tr');
    $('#dvdJustification').css('display', 'none');
    $('#ModalAnswerDetails').modal('show');

});


function GetAnswerDetails() {

    $.ajax({
        url: "SurveyAdmin.aspx/GetAnswerDetails",
        data: JSON.stringify({ "QuestionId": QstId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
         
            $('.tbody-Question-details tr').length > 0 ? objDatatableAnswer.destroy() : '';

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
               

                 <td style="text-align:center;display:none;">`+ item.AnswerID + `</td> 
                  <td style="text-align:center;">`+ item.Answer + `</td>                  
                  <td style="text-align:center;">`+ item.AnswerValue + `</td>`;



                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Question-details').html(htm);

           
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


$('.tbody-Question-details').on('click', 'tr', function () {

    let QAnswerId = this.children[0].textContent.trim();

    $('.tbody-Question-details tr').removeClass('active-tr');

    $(this).addClass('active-tr');

    $.ajax({
        url: "SurveyAdmin.aspx/GetAnswerJustificationDetails",
        data: JSON.stringify({ "AnswerId": QAnswerId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d.length > 0) {
                htm = ` <div style="padding-left: 2%; padding-top: 1%;"> <h5 style="color: #a92828; margin-top:13px">JUSTIFICATIONS</h5></div> `;
                htm += '<ul>';

                $.each(result.d, function (key, item) {

                    htm += '<li style="color:black;">' + item.Justification + '</li>';
                })

                htm += '</ul>'

                $('#dvdJustification').html(htm);
            }

            if (result.d.length > 0) {

                $('#dvdJustification').css('display', 'block');
            }
            else {
                $('#dvdJustification').css('display', 'none');
            }
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


   
})

$('.Add-NewSurvey').on('click', function () {
    resetSurveyControls();
    $('#ddlSurveyTypeModal').prop('disabled', false);

    $('#ModalAddSurvey').modal('show');
    $('.btnAddSurvey').html('Create');
    $('#lblModalAddSurvey').html('Create Survey');
       
});

//------------------------------------------- Anwar Work Start from here ----------------------------------------------------//

$('#ddlOrg').on('change', function () {
    selOrg = $('#ddlOrg option:selected').val().trim();
    fillDepartDDL();
});

function fillOrgDDL() {
    $.ajax({
        url: "SurveyAdmin.aspx/GetOrganizations",
        data: JSON.stringify({ EmpNumber: EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            let res = result.d;
            let htm = '<option value="-1">ALL</option>';

            $.each(res, function (key, item) {
                htm += '<option value="' + item.OrgName + '" >' + item.OrgName + '</option>';
            });

            //$('#ddlManager').html(optManagerddl);
            //$('#ddlHOD').html(optHODddl);
            //$('#ddlDepart').html(optDepartddl);
            $('#ddlOrg').html(htm);          
            fillDepartDDL();
            //loadEmployees();
            //toastr.success('Fecth Successfully', 'Successfull');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function fillDepartDDL() {
    $.ajax({
        url: "SurveyAdmin.aspx/GetDapartments",
        data: JSON.stringify({ orgname: $('#ddlOrg option:selected').val().trim() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
             ddlListDepartment = result.d;

            //let htm = '<option value="-1" >ALL</option>';

            var opt = '';
            var company = ddlListDepartment[0].Company;

            $.each(ddlListDepartment, function (key, item) {
            if (key == 0) {
                opt += '<optgroup style="font-style: italic;" label="' + item.Company + '">';
            }
            else if (company != item.Company) {
                company = item.Company;
                opt += '</optgroup>';
                opt += '<optgroup  style="font-style: italic;" label="' + item.DeptName + '">';
            }
                opt += '<option style="font-style: normal;" value="' + item.DeptId + '" >' + item.DeptName + '</option>';                                
            });

            $('#ddlSurveyDepartment').html(opt);

            $("#ddlSurveyDepartment").select2({
                dropdownParent: $("#ModalAddSurvey"),
                multi: true,
                width: '100%',
                height: '173px'
            });
            $('#select2-ddlSurveyDepartment-container').parent().css('padding', '5px');        
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$('.btn-tag-temp-grid').on('click', function () {

    getAllTemplates();
    getAllQuestionsDetForView();
    $('#tagTempModal').modal('show');

});

$('.btn-tag-emp-grid').on('click', function () {

    //getAllTemplates();
    //getAllQuestionsDetForView();
    loadDepartMuliselect();
    $('#tagEmpModal').modal('show');
});

function loadDepartMuliselect() {

    var opt = '';
    var company = ddlListDepartment[0].Company;

    $.each(ddlListDepartment, function (key, item) {
        if (key == 0) {
            opt += '<optgroup style="font-style:italic;color:#e02d0a!important;" label="' + item.Company + '">';
        }
        else if (company != item.Company) {
            company = item.Company;
            opt += '</optgroup>';
            opt += '<optgroup  style="font-style: italic;" label="' + item.DeptName + '">';
        }
        opt += '<option style="font-style: normal;" value="' + item.DeptId + '" >' + item.DeptName + '</option>';
    });

    $('#ddlDeptList').html(opt);
    //$('#ddlDeptList').multiSelect();
    $("#ddlDeptList").select2({
        dropdownParent: $("#tagEmpModal"),
        multi: true,
        width: '100%',
        height: '173px'
    });
    $('#select2-ddlDeptList-container').parent().css('padding', '5px'); 
}

$('#ddlDeptList').on('change', function () {
    selDeptIdsForSurvey = ''; $('.btn-all-cb').children().prop('checked', false);
    $('#ddlDeptList option:selected').each(function () {
        selDeptIdsForSurvey += $(this).val() + ',';
    });
    selDeptIdsForSurvey = removeCommaFromLast(selDeptIdsForSurvey);
    loadAllEmpsAccToDeptIds()
});

function loadAllEmpsAccToDeptIds() {
    $.ajax({
        url: "SurveyAdmin.aspx/GetEmployeesBasedOnDept",
        data: JSON.stringify({ 'SurveyId': selSurveyObj.SurveyID, "DeptIds": selDeptIdsForSurvey }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            var htm = '';
            $('.tbody-emps-list td').length > 0 ? objDatatableEmpsList.destroy() : '';            

            $.each(result.d, function (key, item) {

                htm += `<tr style="cursor:pointer;" data-empno="` + item.EmpNo + `"> 
<td> 
<div class="form-check form-check-danger">`;
                if (item.IsSurveyAssigned == 'TRUE') {
                    htm += `<input class="form-check-input" id="cbkpi-` + key + `" type="checkbox" name="cb-survey-emp" data-empno="` + item.EmpNo + `" checked />`;
                } else {
                    htm += `<input class="form-check-input" id="cbkpi-` + key + `" type="checkbox" name="cb-survey-emp" data-empno="` + item.EmpNo + `" />`
                }
                htm += `<label class="form-check-label" for="cbkpi-` + key + `"></label>
    </div>
</td>
<td style="text-align:left;"> <span>`+ item.EmpNo + ` </span></td>
                    <td> <span> `+ item.EmpName + ` </span> </td>                    
                    <td> `+ item.Organization + ` </td>
                    <td> `+ item.DepartName + ` </td>  
 </tr>`
            });
            $('.tbody-emps-list').html(htm);
            initiateEmpsListDataTable();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateEmpsListDataTable() {
    objDatatableEmpsList = [];
    objDatatableEmpsList = $('.emps-list-table').DataTable({
        dom: 'lBfrtip',

        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "50px", "targets": 0 },
            { "orderable": false, "targets": [0] },
            { "orderable": true, "targets": [] }
        ],
        paging: false
        //select: true,
        //colReorder: true
    });
}

$('.emps-list-table').on('click', '.btn-all-cb', function () {
    if ($(this).children().is(':checked') == true) {
        $(".tbody-emps-list input[name=cb-survey-emp]").each(function () {
            $(this).prop('checked', true);            
        });
    } else {
        $(".tbody-emps-list input[name=cb-survey-emp]").each(function () {
            $(this).prop('checked', false);            
        });
    }
});

$('.tbody-emps-list').on('click', 'tr', function () {
    let curent = $(this).children().children().eq(0).children().eq(0).is(':checked');
    if (curent) { deleteEmployeeFromSurvey($(this).data('empno'), $(this)); } else { $(this).children().children().eq(0).children().eq(0).prop('checked', true);}
});

$('.btnTagEmp').on('click', function () {
    EmpNosForSurvey = '';
    $(".tbody-emps-list input[name=cb-survey-emp]:checked").each(function () {
        EmpNosForSurvey += $(this).data('empno') +',';
    });
    EmpNosForSurvey = removeCommaFromLast(EmpNosForSurvey);
    TagEmpsIntoSurvey();
});


function TagEmpsIntoSurvey() {
    $.ajax({
        url: "SurveyAdmin.aspx/TagEmployeesIntoSurvey",
        data: JSON.stringify({ 'SurveyId': selSurveyObj.SurveyID, 'EmpNosForSurvey': EmpNosForSurvey, "CreatedDate": getTodayDateNTime(), "CreatedBy": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Employee has been added successfully into Survey.', '');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function deleteEmployeeFromSurvey(empno, cObj) {
    $.ajax({
        url: "SurveyAdmin.aspx/DeleteEmpFromSurvey",
        data: JSON.stringify({ 'SurveyId': selSurveyObj.SurveyID, 'EmpNosForSurvey': empno }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result.d.msgType =='error') {
                toastr.error(result.d.msg, '');
                cObj.children().children().eq(0).children().eq(0).prop('checked', true);
            } else {
                toastr.success(result.d.msg, '');
                cObj.children().children().eq(0).children().eq(0).prop('checked', false);
            }
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#ddlTemplateList').on('change', function () {
    getAllQuestionsDetForView();
});

//--------------------------- LINE MANAGER WORK ----------------------------------//

$('#survey-ul').on('click', 'li', function () {

    let liName = $(this).children().text().trim();

    if (liName == 'Add Line Managers') {
        loadAllLineManagers();
        loadLineManagersForSurvey();
    }
    else if (liName =='Employees Survey Response'){
        SurveyAllDetails();
    }
   

});

function loadAllLineManagers() {
   
    $.ajax({
        url: "SurveyAdmin.aspx/GetAllLineManager",
        //data: JSON.stringify({ 'SurveyId': selSurveyObj.SurveyID, 'EmpNoLM': selVal, 'LMName': selVal, 'CreatedDate': getTodayDateNTime(), 'CreatedBy': currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            let res = result.d;
            let htm = '';
            $.each(res, function (key, item) {
                htm += '<option value="' + item.LMEmpNo + '" >' + item.LMEmpName + ' | ' + item.LMEmpNo + '</option>';
            });

            $('#ddlLM').html(htm); 
            $("#ddlLM").select2({
                dropdownParent: $("#SurveyDetailModal"),
                multi: true,
                width: '100%',
                height: '173px'
            });
            $('#select2-ddlLM-container').parent().css('padding', '5px'); 

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });       
}

function loadLineManagersForSurvey() {
    $.ajax({
        url: "SurveyAdmin.aspx/GetLineManagerListForSurvey",
        data: JSON.stringify({ 'SurveyId': selSurveyObj.SurveyID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.LM-list-table td').length > 0 ? objDTLMList.destroy() : '';
            var htm = '';
            var listLineManagers = result.d;
                       
            $.each(listLineManagers, function (key, item) {
                htm += `<tr> 
                  <td>`+ item.LMEmpNo + `</td> 
                  <td style="text-align:center;">`+ item.LMEmpName + `</td>                  
                  <td style="text-align:center;">`+ item.OrgName + `</td>
                  <td style="text-align:center;">`+ item.DeptName + `</td>
                  <td style="text-align:center;">
<span><i class="bx bx-trash fa-icon-hover ibtn-lm-delete" title="Delete Line Manager" data-empno="`+ item.LMEmpNo + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
</td>`;
                htm += `</tr>`;
            });
            $('.tbody-LM-list').html(htm);
            initiateDataTableLM();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.tbody-LM-list').on('click', 'ibtn-lm-edit,.ibtn-lm-delete', function () {
    let selAction = $(this)[0].title.trim();
        
    if (selAction == "Delete Line Manager") {
        deleteLM($(this).data('empno'), $(this).parent().parent().parent().children().eq(1).text().trim())
    }
   

}); 

function deleteLM(lmEmpNo, lmName) {
    $.ajax({
        url: "SurveyAdmin.aspx/DeleteLM",
        data: JSON.stringify({ 'SurveyId': selSurveyObj.SurveyID, "EmpNoLM": lmEmpNo, "LMName": lmName}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result.d.msgType == 'error') {
                toastr.error(result.d.msg, '');
            } else {
                toastr.success(result.d.msg, '');
                loadLineManagersForSurvey();
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function initiateDataTableLM() {
    objDTLMList = [];
    objDTLMList = $('.LM-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [
            { "orderable": false, "targets": [4] },
            { "orderable": true, "targets": [] }
        ]
        /*   order: [[0, 'ASC']]*/
    });
}

$('.btn-add-lm-grid').on('click', function () {
    var selVal = $('#ddlLM option:selected').val();

    $.ajax({
        url: "SurveyAdmin.aspx/AddLineManager",
        data: JSON.stringify({ 'SurveyId': selSurveyObj.SurveyID, 'EmpNoLM': selVal, 'LMName': $('#ddlLM option:selected').text().split('|')[0].trim(), 'CreatedDate': getTodayDateNTime(), 'CreatedBy': currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result.d.msgType == 'error') {
                toastr.error(result.d.msg, '');                
            } else {
                toastr.success(result.d.msg, '');
                loadLineManagersForSurvey();
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
});

// end here

function getAllTemplates() {

    $.ajax({
        url: "SurveyAdmin.aspx/GetAllTemplates",
        //data: JSON.stringify({ 'data': objAddSurvey }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            let res = result.d;
            let htm = '';

            $.each(res, function (key, item) {
                htm += '<option value="' + item.TId + '" >' + item.TName + '</option>';
            });

            $('#ddlTemplateList').html(htm); 

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getAllQuestionsDetForView() {

    $.ajax({
        url: "SurveyAdmin.aspx/GetAllAboutQuestionsForView",
        data: JSON.stringify({ 'SurveyId': selSurveyObj.SurveyID, 'TempId': $('#ddlTemplateList option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {     
            
            listQuestions = result.d.listQuestions;
            listQOptions = result.d.listQOtions;
            listJusti = result.d.listJusti;
            drawTemplateQuesAns();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function drawTemplateQuesAns() {
    let htm = ''; var firstCategory = '';
    if (listQuestions.length > 0) {
        firstCategory = listQuestions[0].Category;
    }


    $.each(listQuestions, function (key, item) {

        if (key == 0) { htm += `<div style="background: #6b6767;text-align: center;margin-bottom: 12px;font-size: 21px;color: #ffffff;">` + item.Category + `</div>`;}
        else if (firstCategory != item.Category) {            
            firstCategory = item.Category;
            htm += `<div style="background: #6b6767;text-align: center;margin-bottom: 12px;font-size: 21px;color: #ffffff;">` + item.Category + `</div>`;
        }        

        htm += `<h5><i style="color: #f6502c;font-style: normal;">Q` + (key+1) + `. </i>` + item.Quesion + `</h5>`
        htm += `<ul style="padding-left:50px;">`;

        let QOpts = listQOptions.filter(s => s.QId == item.QuestionID); // Question Options
        $.each(QOpts, function (key, item) {
            let justiHtml = ''; let justilist = [];

            if (item.IsJusti == "True") {  // Justifications
                justilist = listJusti.filter(s => s.QOptionId == item.AnswerID);

                justiHtml = '<ul style="background: #fff2f0;border-radius: 11px;color:#cb4400">'
                $.each(justilist, function (key, item) {
                    justiHtml += key == 0 ? '<div style="text-align: center;">Justification</div>' : '';
                    justiHtml += `<li> ` + item.JustiText +` </li>`;                    
                });
                justiHtml += `</ul>`;

                htm += `<li class="toggle-justi-` + item.AnswerID +`" data-qoptid=` + item.AnswerID + ` style="padding-left:12px;margin-top:3px;"> ` + item.Answer + ` ` + justiHtml +` </li>`
            } else {
                htm += `<li data-qoptid=` + item.AnswerID + ` style="padding-left:12px;margin-top:3px;"> ` + item.Answer + `</li>`;        
            }
                        
        });
        
        htm += `</ul>`;
    });

    $('.temp-draw-ques').html(htm);
}


$('.btnTagTemp').on('click', function () {

    $.ajax({
        url: "SurveyAdmin.aspx/UpdateTempIntoSurvey",
        data: JSON.stringify({ 'SurveyId': selSurveyObj.SurveyID, 'TempId': $('#ddlTemplateList option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Template Tagged Successfully', '');
            $('#tagTempModal').modal('hide');            
            //GetTableDetails();
            SurveyAllDetails();
            GetSurveyDetails(); //Abdullah function , capturing header data
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

});


$('.tbody-Survey').on('click', '.ibtn-survey-view,.ibtn-survey-edit', function () {
    resetMainModal();
    SurveyId = $(this).data('surveyid');
    let selAction = $(this)[0].title.trim();

    selSurveyObj = listSurvey.filter(s => s.SurveyID == SurveyId)[0]

    if (selAction == "Edit Survey") {

        $('#ddlSurveyTypeModal').prop('disabled', true);
       // $('#txtProjectName,#taProjDesc,#ddlProjManager,#projStartDate,#projDueDate1').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        $('#txtSurveyName').val(selSurveyObj.SurveyName);
        $('#taSurveyDes').val(selSurveyObj.SurveyDesc);
        $('#ddlSurveyTypeModal').val(selSurveyObj.SurveyType.trim());
        $('#ddlSurveyStatus').val(selSurveyObj.Status.trim());
        //$('#taProjDesc').val(selProjObj.ProjDesc);
        $('#txtSurveyStartDate').val(DateIntoDatePickerFormat(selSurveyObj.StartDate));
        $('#txtSurveyEndDate').val(DateIntoDatePickerFormat(selSurveyObj.EndDate));
        $('#ddlOrg').val(selSurveyObj.Company.trim());
        reloadDepartDDLForUpdate(selSurveyObj.SurveyDept.trim(), 'ddlSurveyDepartment', 'ModalAddSurvey', 'Select Department');


        $('#ModalAddSurvey').modal('show');
        $('.btnAddSurvey').html('Update');
        $('#lblModalAddSurvey').html('Update Survey - ' + selSurveyObj.SurveyName);
        
    }
    else if ("View Survey") {
        GetSurveyDetails();
        SurveyAllDetails();
        $('#SurveyDetailModal').modal('show');
    }
    

});

$('.btnAddSurvey').on('click', function () {
    //let cssClassForStatus = '';
    //let cssClassForPriority = '';

    if (!validateSurveyControls()) {
        toastr.error(msgForSurveyIfFailed, '');
    }
    else {
    //else {
    //    //for Status
    //    if ($('#ddlStatus option:selected').val() == 'Not Started') {
    //        cssClassForStatus = 'task-status-notstarted';
    //    }
    //    else if ($('#ddlStatus option:selected').val() == 'Open') {
    //        cssClassForStatus = 'task-status-open';
    //    }
    //    else if ($('#ddlStatus option:selected').val() == 'Active') {
    //        cssClassForStatus = 'task-status-active';
    //    }
    //    else if ($('#ddlStatus option:selected').val() == 'Completed') {
    //        cssClassForStatus = 'task-status-completed';
    //    }
    //    else if ($('#ddlStatus option:selected').val() == 'Cancelled') {
    //        cssClassForStatus = 'task-status-cancelled';
    //    }

    //    //for priority
    //    if ($('#ddlPriority option:selected').val() == 'Urgent') {
    //        cssClassForPriority = 'task-priority-urgent';
    //    }
    //    else if ($('#ddlPriority option:selected').val() == 'Important') {
    //        cssClassForPriority = 'task-priority-impo';
    //    }
    //    else if ($('#ddlPriority option:selected').val() == 'Medium') {
    //        cssClassForPriority = 'task-priority-medium';
    //    }
    //    else if ($('#ddlPriority option:selected').val() == 'Low') {
    //        cssClassForPriority = 'task-priority-low';
    //    }


    if ($('.btnAddSurvey').text().trim() == 'Update') {
            objAddSurvey = {
                "SurveyId": selSurveyObj.SurveyID,
                "SurveyName": $('#txtSurveyName').val(),
                "SurveyDesc": $('#taSurveyDesc').val(),
                "SurveyType": $('#ddlSurveyTypeModal option:selected').val(),
                "SurveyStatus": $('#ddlSurveyStatus option:selected').val(),
                "Company": $('#ddlOrg option:selected').val().trim(),
                "SurveyForDepart": $('#ddlSurveyDepartment option:selected').val(),
                "StartDate": $('#txtSurveyStartDate').val(),
                "EndDate": $('#txtSurveyEndDate').val(),
                "CreatedBy": selSurveyObj.UpdatedBy,
                "CreatedDate": '',
                "UpdatedBy": currUserId,
                "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()             
            }
            addUpdateSurvey('Survey updated successfully');
        } else {
            objAddSurvey = {
                "SurveyId": 0,
                "SurveyName": $('#txtSurveyName').val(),
                "SurveyDesc": $('#taSurveyDesc').val(),
                "SurveyType": $('#ddlSurveyTypeModal option:selected').val(),
                "SurveyStatus": $('#ddlSurveyStatus option:selected').val(),
                "Company": $('#ddlOrg option:selected').val().trim(),
                "SurveyForDepart": $('#ddlSurveyDepartment option:selected').val(),
                "StartDate": $('#txtSurveyStartDate').val(),
                "EndDate": $('#txtSurveyEndDate').val(),               
                "CreatedBy": currUserId,
                "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
                "UpdatedBy": '',
                "UpdatedDate": ''
            }
            addUpdateSurvey('Survey created successfully');
        }
    }
    

});

function addUpdateSurvey(msg) {

    $.ajax({
        url: "SurveyAdmin.aspx/AddUpdateSurvey",
        data: JSON.stringify({ 'data': objAddSurvey }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success(msg, '');
            $('#ModalAddSurvey').modal('hide');
            //resetProjControls();
            GetTableDetails();
            //if ($('#proj-sub-proj-ul').children().find('.active').text().trim() == "MY PROJECTS") {
            //    getAllProjects();
            //} else {
            //    getAllInvlovedProjects('-1')
            //}
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function reloadDepartDDLForUpdate(departid, ddlId, parentModalFor, firstSelOpt) {
    var opt = '';  //'<option value="-1"> --- ' + firstSelOpt + ' --- </option>';
    var company = ddlListDepartment[0].Company;

    let ddlDepartId = '#' + ddlId;
    let parentModal = '#' + parentModalFor;

    $.each(ddlListDepartment, function (key, item) {
        if (key == 0) {
            opt += '<optgroup style="font-style: italic;" label="' + item.Company + '">';
        }
        else if (company != item.Company) {
            company = item.Company;
            opt += '</optgroup>';
            opt += '<optgroup  style="font-style: italic;" label="' + item.DeptName + '">';
        }
        opt += '<option style="font-style: normal;" value="' + item.DeptId + '" >' + item.DeptName + '</option>';
    });

    $(ddlDepartId).html(opt);

    $(ddlDepartId).val(departid);
    $(ddlDepartId).select2({
        dropdownParent: $(parentModal),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '173px'
    });
    $('#select2-' + ddlId + '-container').parent().css('padding', '5px');
}

function resetSurveyControls() {
    $('#txtSurveyName, #taSurveyDesc').val('');

    $('#ddlSurveyTypeModal,#ddlSurveyStatus,#ddlOrg').prop("selectedIndex", 0).val();

    $('#txtSurveyStartDate').val(getTodayDateForDatePicker());
    $('#txtSurveyEndDate').val(getTodayDateForDatePicker());

    //$("#ddlSurveyDepartment").prop("selectedIndex", 0).val()
    reloadDepartDDLForUpdate($("#ddlSurveyDepartment").prop("selectedIndex", 0).val(), 'ddlSurveyDepartment', 'ModalAddSurvey', 'Select Department');

}


function validateSurveyControls() {

    var isValid = true;
    msgForSurveyIfFailed = 'Please Input the Required Fields';

    if ($('#txtSurveyName').val().trim() == "") {
        $('#txtSurveyName').css({ 'box-shadow': 'rgb(233 10 0 / 85%) 0px 0.5px 2.5px' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtSurveyName').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
   
    if ($('#txtSurveyStartDate').val().trim() == "") {
        $('#txtSurveyStartDate').css({ 'box-shadow': 'rgb(233 10 0 / 85%) 0px 0.5px 2.5px' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtSurveyStartDate').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#txtSurveyEndDate').val().trim() == "") {
        $('#txtSurveyEndDate').css({ 'box-shadow': 'rgb(233 10 0 / 85%) 0px 0.5px 2.5px' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtSurveyEndDate').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    return isValid;
}







// general functions
function resetMainModal() {
    $('#survey-ul button').removeClass('active');
    $('#survey-ul li:eq(0) button').addClass('active');

    $('#SurveyDetailModal .tab-content .tab-pane').removeClass('active show')
    $('#SurveyDetailModal .tab-content .tab-pane:eq(0)').addClass('active show')

}

function DateIntoDatePickerFormat(date) {
    let dt = new Date(date);
    return dt.getFullYear() + "-" + (dt.getMonth()+1) + "-" + dt.getDate();
}
function getTodayDateForDatePicker() {
    let dt = new Date();
    return dt.getFullYear() + "-" + (dt.getMonth()+1) + "-" + dt.getDate();
}
function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}
function getTodayDateNTime() {
    return new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ":" + new Date().getSeconds();
}