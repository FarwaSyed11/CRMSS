
var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
var monthname = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
var monthsNameByNo = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
var odd = [1,3,5,7,9,11,13,15,17,19,21,23];
var even = [2, 4, 8, 10, 12, 14,16,18,20,22,24];
var Listitems = [], objDatatableAccnAss = [];

$(document).ready(function () {
    loadEmpImage();
    LoadJobDesc();
    loadEmpDetails();
    LoadSkillsDDL();
    LoadSkills();
    loadAccnAssDetails();
    renderAccnAsstTable();
    completionperc();
});

$('.jobdesc').on('click', function () {
    $("#btnEditJobPurpose").css('visibility', 'visible');
    $("#btnViewSalarySlip").css('visibility', 'hidden');
});

$('.salaryinfo').on('click', function () {
    $("#btnViewSalarySlip").css('visibility', 'visible');
    $("#btnEditJobPurpose").css('visibility', 'hidden');
});

$('.more').on('click', function () {
    $("#btnViewSalarySlip").css('visibility', 'hidden');
    $("#btnEditJobPurpose").css('visibility', 'hidden');
});

$('#btnEditJobPurpose').on('click', function () {

    /*  $('#txtJobPurpose').val() == '' ? $('#txtJobPurpose').val('⇨') : '';*/


    LoadJobDesc();
    $('#modalEditJobPurpose').modal('show');


});

$('#btnViewSalarySlip').on('click', function () {
    $('#modalShowSalarySlip').modal('show');
});

$('#viewslip').on('click', function () {
    $('#divToExport').removeClass('hidden');
    loadEmpDetailsInSlip();
    //$('#exportSlip').addClass('hidden');
})

//insert skills

$('#modal-btnaddskill').on('click', function () {
    $('#modalAddSkills').modal('show');

});

$('#btnaddskill').on('click', function () {

    
    $.ajax({
        url: "Profile.aspx/addSkills",
        data: JSON.stringify({
            "EmpNo": EmpNo,
            "SkillId": $('#ddlSkills option:selected').val()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result.d.MessageType =='error') {
                toastr.error(result.d.Message, '');
            } else {
                toastr.success(result.d.Message, '');
                LoadSkills();
                $('#modalAddSkills').modal('hide');
            }                       


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
})

function LoadSkills() {

    $.ajax({
        url: "Profile.aspx/GetEmpSkills",
        data: JSON.stringify({
            "EmpNo": EmpNo
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            var res = result.d;

            var htm = '';

            $.each(result.d, function (key, item) {
                htm += '<div class="skilltag"> ' + item.KeySkills + ' </div>'
            })
            $('.allskillsec').html(htm);
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function LoadSkillsDDL() {

    $.ajax({
        url: "Profile.aspx/GetSkills",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            var htm = '';

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.ID + '"> ' + item.Value + ' </option>'
            })
            $('#ddlSkills').html(htm);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function AddJobdescDetails() {

    $.ajax({
        url: "Profile.aspx/SetJobDescDet",
        data: JSON.stringify({
            'EmpNo': EmpNo, "EmpName": $('#lblName').html(), "JobPurpose": $('#txtJobPurpose').val(), "KeyAccountAbilities": $('#txtKeyAccountAblities').val(),
            "AdditionalResponsibilities": $('#txtAdditionalRespons').val(), "Qualifications": $('#txtQualification').val()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            toastr.success('Updated Successfully', '');
            $('#modalEditJobPurpose').modal('hide');
            LoadJobDesc();


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


$('#btnSaveJobDesc').on('click', function () {

    AddJobdescDetails();

});


function LoadJobDesc() {

    $.ajax({
        url: "Profile.aspx/GetJobDesc",
        data: JSON.stringify({
            'EmpNo': EmpNo,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            var jpHtmeven = '';
            var jpHtmodd = '';
            var jpHtm = '';
            var KrHtmeven = '';
            var KrHtmodd = '';
            var KrHtm = '';
            var KsHtm = '';
            var AsHtmodd = '';
            var AsHtmeven = '';
            var AsHtm = '';
            var QlHtmodd = '';
            var QlHtmeven = '';
            var QlHtm = '';
            var i = 0;
            $.each(result.d[0].JobPurpose.split('⇨'), function (key, item) {
                if (key != 0) {
                    if (odd.includes(key) == true) {
                        jpHtmeven += '<li class="arrow list odd">' + item + '</li>';
                        $('.job-purpose-ulodd').html(jpHtmeven);
                    }
                    else if (even.includes(key) == true) {
                        jpHtmodd += '<li class="arrow list even">' + item + '</li>';
                        $('.job-purpose-uleven').html(jpHtmodd);
                    }
                } else if (result.d[0].JobPurpose.split('⇨').length == 1) {
                    $(".norecordjob").css("visibility", "visible");
                    jpHtm += '<label style="color: #6a6565;font-weight: bold;">No Records</label>';
                    $('.norecordjob').html(jpHtm);
                }
            });
            
            

            $.each(result.d[0].KeyAccountAbilities.split('⇨'), function (key, item) {
                if (key != 0) {
                    if (odd.includes(key) == true) {
                        KrHtmodd += '<li class="arrow list odd">' + item + '</li>';
                        $('.Key-Responsibilitiesodd').html(KrHtmodd);
                    }
                    else if (even.includes(key) == true) {
                        KrHtmeven += '<li class="arrow list even">' + item + '</li>';
                        $('.Key-Responsibilitieseven').html(KrHtmeven);
                    }
                } else if (result.d[0].KeyAccountAbilities.split('⇨').length == 1) {
                    $(".norecordresp").css("visibility", "visible");
                    KrHtm += '<label style="color: #6a6565;font-weight: bold;">No Records</label>';
                    $('.norecordresp').html(KrHtm);
                }
            });

            

            //$.each(result.d[0].KeySkills.split('⇨'), function (key, item) {
            //    if (key != 0) { KsHtm += '<li class="arrow list">' + item + '</li>'; }
            //    else if (result.d[0].KeySkills.split('⇨').length == 1) { KsHtm += '<label style="color: #6a6565;font-weight: bold;">No Records</label>' }
            //});
            //$('.Key-Skills').html(KsHtm);

            $.each(result.d[0].AdditionalResponsibilities.split('⇨'), function (key, item) {
                if (key != 0) {
                    if (odd.includes(key) == true) {
                        AsHtmodd += '<li class="arrow list odd">' + item + '</li>';
                        $('.Additional-Responsibilitiesodd').html(AsHtmodd);
                    }
                    else if (even.includes(key) == true) {
                        AsHtmeven += '<li class="arrow list even">' + item + '</li>';
                        $('.Additional-Responsibilitieseven').html(AsHtmeven);
                    }
                } else if (result.d[0].AdditionalResponsibilities.split('⇨').length == 1) {
                    $(".norecordaddresp").css("visibility", "visible");
                    AsHtm += '<label style="color: #6a6565;font-weight: bold;">No Records</label>';
                    $('.norecordaddresp').html(AsHtm);
                }
                //if (key != 0) { AsHtm += '<li class="arrow list">' + item + '</li>'; }
                //else if (result.d[0].AdditionalResponsibilities.split('⇨').length == 1) { AsHtm += '<label style="color: #6a6565;font-weight: bold;">No Records</label>' }
            });

            $.each(result.d[0].Qualifications.split('⇨'), function (key, item) {

                if (key != 0) {
                    if (odd.includes(key) == true) {
                        QlHtmodd += '<li class="arrow list odd">' + item + '</li>';
                        $('.Qalificationodd').html(QlHtmodd);
                    }
                    else if (even.includes(key) == true) {
                        QlHtmeven += '<li class="arrow list even">' + item + '</li>';
                        $('.Qalificationeven').html(QlHtmeven);
                    }
                } else if (result.d[0].Qualifications.split('⇨').length == 1) {
                    $(".norecordqual").css("visibility", "visible");
                    QlHtm += '<label style="color: #6a6565;font-weight: bold;">No Records</label>';
                    $('.norecordqual').html(QlHtm);
                }

                //if (key != 0) { QlHtm += '<li class="arrow list">' + item + '</li>'; }
                //else if (result.d[0].Qualifications.split('⇨').length == 1) { QlHtm += '<label style="color: #6a6565;font-weight: bold;">No Records</label>' }
            });

            $('#txtJobPurpose').val(result.d[0].JobPurpose);
            $('#txtKeyAccountAblities').val(result.d[0].KeyAccountAbilities);
            $('#txtKeySkills').val(result.d[0].KeySkills);
            $('#txtAdditionalRespons').val(result.d[0].AdditionalResponsibilities);
            $('#txtQualification').val(result.d[0].Qualifications);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function loadEmpDetails() {

    $.ajax({
        url: "Profile.aspx/GetEmpInfo",
        data: JSON.stringify({ "EmpNo": EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#lblName').html(result.d[0].FULL_NAME);
            $('#lbProfPosition').html(result.d[0].POSITION);

            $('#lbPhoneNumber').html(result.d[0].MOBILE_PHONE);
            $('#lbTeleNumber').html(result.d[0].WORK_PHONE);

            $('#lbEmpNumber').html(result.d[0].EMPLOYEE_NUMBER);
            $('#lbTitle').html(result.d[0].TITLE);
            $('#lbFirstName').html(result.d[0].FIRST_NAME);
            $('#lbMiddleName').html(result.d[0].MIDDLE_NAMES);
            $('#lbLastName').html(result.d[0].LAST_NAME);

            $('#lbEmergencyPhone').html(result.d[0].EMERGENCY_PHONE);
            $('#lbAddress').html(result.d[0].ADDRESS_LINE1);
            $('#lbCountry').html(result.d[0].COUNTRY);
            $('#lbEmail').html(result.d[0].EMAIL_ADDRESS);
            $('#lbPosition').html(result.d[0].POSITION);
            $('#lbReligion').html(result.d[0].RELIGION);
            $('#lbBirthDate').html(result.d[0].DATE_OF_BIRTH);
            $('#lbGender').html(result.d[0].SEX);
            $('#lbMeterialStatus').html(result.d[0].MARITAL_STATUS);
            $('#lbEducation').html(result.d[0].EDUCATION);
            $('#lbNationality').html(result.d[0].NATIONALITY);

            $('#lbPassportNumber').html(result.d[0].PPNO);
            $('#lbPTCountry').html(result.d[0].COUNTRY);
            $('#lbPTCustody').html(result.d[0].PPCUSTODY);
            $('#lbPTPlaceOfIssue').html(result.d[0].PPCONTRYISSUE);
            $('#lbPTExpiriDate').html(getDateInWordsFormat(result.d[0].PPDTEXPIRY));
            $('#lbPTIssueDate').html(result.d[0].PPDTISSUE);
            $('#lbPTUpdateStatus').html("N/A");

            $('#lbVIAuthority').html(result.d[0].VVVISAISSUEAUTH);
            $('#lbVINumber').html(result.d[0].VVNO);
            $('#lbVIType').html(result.d[0].VVVISATYPE);
            $('#lbVIPosition').html(result.d[0].VVVISAPOSITION);
            $('#lbVIExpDate').html(getDateInWordsFormat(result.d[0].VVDTEXPIRY));
            $('#lbVIIssueCompany').html(result.d[0].VVVISAISSUECO);
            $('#lbVIIssueDate').html(result.d[0].VVDTISSUE);
            $('#lbVIUidNo').html(result.d[0].VVUIDNO);
            $('#lbVIMolNo').html("N/A");

            $('#lbTKClass').html(result.d[0].TKTRATETYP);
            $('#lbTKFamilyEligble').html(result.d[0].FAMELIG);
            $('#lbTKNoOfChildrens').html(result.d[0].NOOFCHILD);
            $('#lbTKFamilyClass').html(result.d[0].FAMCLASS);
            $('#lbTKNoOfAdults').html(result.d[0].NOOFADULTS);
            $('#lbTKDestination').html("N/A");
            $('#lbTKTerm').html(result.d[0].EMPPERIOD);

            $('#lbSLBasic').html(result.d[0].BASIC);
            $('#lbSLMobile').html(result.d[0].MOBALW);
            $('#lbSLOther').html(result.d[0].OTHALW);
            $('#lbSLFood').html(result.d[0].FOODALW);
            $('#lbSLHousingProvided').html(result.d[0].HOUSING);
            $('#lbSLCar').html(result.d[0].CARALW);

            if (result.d[0].TransProvided == 'checked') {

                $('#cbTransportProv').prop('checked', true);
            }
            else {
                $('#cbTransportProv').prop('checked', false);
            } 
            if (result.d[0].FAMELIG == 'Y') {

                $('#lbTKFamilyEligble').prop('checked', true);
            }
            else {
                $('#lbTKFamilyEligble').prop('checked', false);
            }

            $('#lbSLTransport').html(result.d[0].TRANSALW);
            $('#lbSLHRA').html(result.d[0].HRAA);
            $('#lbSLCompanyCar').html("N/A");
            $('#lbSLLastSal').html("N/A");
            let gross = parseInt(result.d[0].TRANSALW) + parseInt(result.d[0].BASIC) + parseInt(result.d[0].MOBALW) + parseInt(result.d[0].FOODALW) + parseInt(result.d[0].HOUSING) + parseInt(result.d[0].CARALW) + parseInt(result.d[0].OTHALW);
                $('#lbSLGrossSal').html(gross);

            $('#lbBNKPayement').html(result.d[0].PAYMETHOD);
            $('#lbBNKBranch').html(result.d[0].BANKBRANCH);
            $('#lbBNKName').html(result.d[0].BANKNAME);
            $('#lbBNKIban').html(result.d[0].IBANNUMBER);
            $('#lbBNKAccntNo').html(result.d[0].ACCOUNTNUMBER);
            $('#basic-default-password12').val(result.d[0].LDpassword);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



function loadEmpImage() {

    $.ajax({
        url: "Profile.aspx/GetEmpImage",
        data: JSON.stringify({ "EmpNo": EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#imgUser').attr('src', result.d);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function KeyForPoint(txtId) {


    if (this.event.keyCode == 13) {
        let tId = '#' + txtId
        txtval = $(tId).val();
        //txtval += '>';
        txtval += '⇨';
        $(tId).val(txtval)
    }
}

function EnterFirst(txtId) {
    let tId = '#' + txtId;

    if ($(tId).val() == '') {
        $(tId).val('⇨');
    }
}

$('#btnEditPhoneNumber').on('click', function () {

    $('#txtEditphoneNo').val($('#lbPhoneNumber').html());
    $('#lbPhoneNumber').css('display', 'none');
    $('#txtEditphoneNo').css('display', '');
    $('#btnEditPhoneNumber').css('display', 'none');
    $('#btnUpdatePhoneNumber').css('display', '');

});

$('#btnUpdatePhoneNumber').on('click', function () {
    $('#lbPhoneNumber').html($('#txtEditphoneNo').val());
    $('#lbPhoneNumber').css('display', '');
    $('#txtEditphoneNo').css('display', 'none');
    $('#btnEditPhoneNumber').css('display', '');
    $('#btnUpdatePhoneNumber').css('display', 'none');

});


$('#btnEditTeleNumber').on('click', function () {

    $('#txtEditTeleNo').val($('#lbTeleNumber').html());
    $('#lbTeleNumber').css('display', 'none');
    $('#txtEditTeleNo').css('display', '');
    $('#btnEditTeleNumber').css('display', 'none');
    $('#btnUpdateTeleNumber').css('display', '');

});

$('#btnUpdateTeleNumber').on('click', function () {
    $('#lbTeleNumber').html($('#txtEditTeleNo').val());
    $('#lbTeleNumber').css('display', '');
    $('#txtEditTeleNo').css('display', 'none');
    $('#btnEditTeleNumber').css('display', '');
    $('#btnUpdateTeleNumber').css('display', 'none');

});

$('#btnedprofile').on('click', function () {
    $('#btnedprofile').css('display', 'none');
    $('#btnsaveprofile').css('display', '');

    $('#txtEditphoneNo').val($('#lbPhoneNumber').html());
    $('#lbPhoneNumber').css('display', 'none');
    $('#txtEditphoneNo').css('display', '');

    $('#txtEditTeleNo').val($('#lbTeleNumber').html());
    $('#lbTeleNumber').css('display', 'none');
    $('#txtEditTeleNo').css('display', '');

    $('#basic-default-password12').attr('readonly', false);

});

$('#btnsaveprofile').on('click', function () {
    SetProfile();
});

$('#btnHide').on('click', function () {

    var x = document.getElementById("basic-default-password12");
    if (x.type == "password") {
        x.type = "text";
        $('#btnUpdatePassword').css('display', '');
    } else {
        x.type = "password";
        $('#btnUpdatePassword').css('display', 'none');

    }
});


function SetProfile() {

    $.ajax({
        url: "Profile.aspx/UpdateProfile",
        data: JSON.stringify({ "EmpNo": EmpNo, "MobileNumb": $('#txtEditphoneNo').val(), "TeleNumb": $('#txtEditTeleNo').val(), "PassWord": $('#basic-default-password12').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Basic Info Updated Successfully', '');
            $('#btnedprofile').css("display", "");
            $('#btnsaveprofile').css('display', 'none');

            $('#lbPhoneNumber').css('display', '');
            $('#txtEditphoneNo').css('display', 'none');

            $('#lbTeleNumber').css('display', '');
            $('#txtEditTeleNo').css('display', 'none');

            $('#lbPhoneNumber').html($('#txtEditphoneNo').val());
            $('#lbTeleNumber').html($('#txtEditTeleNo').val());
            $('#basic-default-password12').html($('basic-default-password12').val());
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function SetMobile() {

    $.ajax({
        url: "Profile.aspx/UpdateMobile",
        data: JSON.stringify({ "EmpNo": EmpNo, "MobileNumb": $('#txtEditphoneNo').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            /*toastr.success('Updated Successfully', '');*/

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function SetTeleNumb() {

    $.ajax({
        url: "Profile.aspx/UpdatTeleNumb",
        data: JSON.stringify({ "EmpNo": EmpNo, "TeleNumb": $('#txtEditTeleNo').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            /*toastr.success('Updated Successfully', '');*/

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function SetPassword() {

    $.ajax({
        url: "Profile.aspx/UpdatePassword",
        data: JSON.stringify({ "EmpNo": EmpNo, "PassWord": $('#basic-default-password12').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            /*toastr.success('Updated Successfully', '');*/

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



$('#btnUpdatePhoneNumber').on('click', function () {

    SetMobile();

});

$('#btnUpdateTeleNumber').on('click', function () {

    SetTeleNumb();

});

$('#btnUpdatePassword').on('click', function () {

    SetPassword();

});


function generatePDF() {


    var element = document.getElementById('divToExport');
    element.style.width = '700px';
    element.style.height = '100%';
    element.style.fontSize = '13px';
    //element.style.border = '0.5px';
    //element.style.borderColor = '#020202';


    var opt = {
        margin: 0.5,
        //border:3.8,

        filename: 'Inspectionetet.pdf',
        image: { type: 'jpeg', quality: 1 },
        html2canvas: {
            scale: 3,
            border: 3.8,

            //allowTaint: true,
            //dpi: 300,

        },


        jsPDF: { unit: 'in', format: 'a4', orientation: 'portrait', precision: '12' }
    };

    var doc = new jsPDF();



    //doc.rect(20, 20, doc.internal.pageSize.width - 40, doc.internal.pageSize.height - 40, 'S');



    // choose the element and pass it to html2pdf() function and call the save() on it to save as pdf.
    html2pdf().set(opt).from(element).save();


}

function loadEmpDetailsInSlip() {

    $.ajax({
        url: "Profile.aspx/GetEmpInfo",
        data: JSON.stringify({ "EmpNo": EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#tdempName').html(result.d[0].FULL_NAME);
            $('#tdEmpNo').html(result.d[0].EMPLOYEE_NUMBER);
            $('#tdposition').html(result.d[0].POSITION);
            $('#tdbankname').html(result.d[0].BANKNAME);
            $('#tdaccNo').html(result.d[0].ACCOUNTNUMBER);


            $('#tdbasic').html(result.d[0].BASIC);
            $('#tdhra').html(result.d[0].HRAA);
            $('#tdothers').html(result.d[0].OTHALW);

            $('#tdgtotalSalary').html(result.d[0].Gross_salary);
            $('#tdvisaexp').html(result.d[0].VVDTEXPIRY);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadAccnAssDetails() {
    $.ajax({
        url: "Profile.aspx/GetAssetDetails",
        data: JSON.stringify({ "EmpNo": EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,

        success: function (result) {
            Listitems = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateAccnAsstDataTable() {
    objDatatableAccnAss = [];
    objDatatableAccnAss = $('.accnass-table').DataTable({
        dom: 'lBfrtip',
        "bStateSave": true,
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa-solid fa-file-excel" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '

                }
            ]
        },

        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true
    });

}

function renderAccnAsstTable() {
    var htm = '';
    $('.accnass-tbody td').length > 0 ? objDatatableAccnAss.destroy() : '';
    //var memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;

    $.each(Listitems, function (key, item) {

        htm += `<tr> 
                    <td style="text-align: center;" > <span class="badge badge-for-taskcode"> ` + item.TypeName + ` </span> </td>
                    <td> `+ item.RefNo + ` </td>
                    <td> `+ item.Name + ` </td>
                    <td> `+ item.Description + ` </td>
                    <td> `+ item.AssignedBy + ` </td>
                    <td> `+ item.AssignedOn + ` </td>
                    <td> `+ item.Remarks + ` </td>
                    <td> `+ item.Attachment + ` </td>
                    <td> `+ item.Status + ` </td>`


        //    <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-mstone-delete" title="Delete Milestone" data-mstoneid="`+ item.MStoneId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`

        htm += `</tr>`

    });
    $('.accnass-tbody').html(htm);
    initiateAccnAsstDataTable();
    //<td style="text-align:left;"> <i class="fa fa-circle `+ item.PriorityCss + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
    //                <td style="text-align: center;"> <span class="badge `+ item.StatusCss + `">` + item.Status + ` </span></td>
    //                <td style="text-align:center"> `+ item.NoOfDays + ` </td>
    //                <td>`  + item.StartDate + ` </td>
    //                <td>`  + item.EndDate + ` </td>
    //                <td style="text-align: center;">
    //                <span style="margin-left: 4%;"> <i class="bx bxs-edit fa-icon-hover ibtn-audit-edit" title="Edit Audit" data-audid="`+ item.AuditId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
    //                <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-audit-info" title="Other" data-audid="`+ item.AuditId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span> 
    //                </td>`
}

//Common Functions------------------------------------

function getDateInWordsFormat(dt) {
    return monthsNameByNo[new Date(dt).getMonth()] + ', ' + new Date(dt).getDate() + ' ' + new Date(dt).getFullYear();
}

function completionperc() {
    if (($('#lbPhoneNumber').text() != '') && ($('#lbTeleNumber').text() != '') && ($('.job-purpose-ulodd', '.Key-Responsibilitiesodd', '.Additional-Responsibilitiesodd', '.Qalificationodd').text() != ''))
    {
        $('.percmain').css("width", "100%"); 
        $('.perclabel').html("100%");
    }
    else if (($('#lbPhoneNumber').text() == '') && ($('#lbTeleNumber').text() != '') && ($('.job-purpose-ulodd', '.Key-Responsibilitiesodd', '.Additional-Responsibilitiesodd', '.Qalificationodd').text() != '')) {
        $('.percmain').css("width", "90%")
        $('.perclabel').html("90%");
    }
    else if (($('#lbPhoneNumber').text() != '') && ($('#lbTeleNumber').text() == '') && ($('.job-purpose-ulodd', '.Key-Responsibilitiesodd', '.Additional-Responsibilitiesodd', '.Qalificationodd').text() != '')) {
        $('.percmain').css("width", "90%")
        $('.perclabel').html("90%");
    }
    else if (($('#lbPhoneNumber').text() == '') && ($('#lbTeleNumber').text() == '') && ($('.job-purpose-ulodd', '.Key-Responsibilitiesodd', '.Additional-Responsibilitiesodd', '.Qalificationodd').text() != '')) {
        $('.percmain').css("width", "80%")
        $('.perclabel').html("80%");
    }
    else if (($('#lbPhoneNumber').text() != '') && ($('#lbTeleNumber').text() == '') && ($('.job-purpose-ulodd', '.Key-Responsibilitiesodd', '.Additional-Responsibilitiesodd', '.Qalificationodd').text() == '')) {
        $('.percmain').css("width", "50%")
        $('.perclabel').html("50%");
    }
    else if (($('#lbPhoneNumber').text() == '') && ($('#lbTeleNumber').text() != '') && ($('.job-purpose-ulodd', '.Key-Responsibilitiesodd', '.Additional-Responsibilitiesodd', '.Qalificationodd').text() == '')) {
        $('.percmain').css("width", "50%");
        $('.perclabel').html("50%");
    }
    else if (($('#lbPhoneNumber').text() != '') && ($('#lbTeleNumber').text() != '') && ($('.job-purpose-ulodd', '.Key-Responsibilitiesodd', '.Additional-Responsibilitiesodd', '.Qalificationodd').text() == '')) {
        $('.percmain').css("width", "40%");
        $('.perclabel').html("40%");
    }
}