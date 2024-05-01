var Type = '';
var EventId = '';


$(document).ready(function () {

    if (myroleList.includes("8131")) {
        $('#btnAddNewEvent').css('display', '');

    }
    else {
        $('#btnAddNewEvent').css('display', 'none');
    }

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {

        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);



   

});



function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.Event-table-details').DataTable({
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


function GetTableDetails(Loader) {

    $.ajax({
        url: "Event.aspx/GetTableBasicDetails",
        data: JSON.stringify({ "UserId": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Event tr').length > 0 ? objDatatable.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.ReferenceNumb + `</td>
                  <td style="text-align:center;">`+ item.EventName + `</td>
                  <td style="text-align:center;">`+ item.Venue + `</td>
                  <td style="text-align:center;">`+ item.ShowDateFrom + `</td>
                  <td style="text-align:center;">`+ item.ShowDateTo + `</td>
                  <td style="text-align:center;">`+ item.HallAndStandNumb + `</td>
                   <td style="text-align:center;"><span class="`+ item.StatusClass + `" style="cursor:pointer;" onclick=statusview(` + item.Id + `,"` + item.Status + `")>` + item.Status + `</span></td>
                   <td style="text-align:center;">`+ item.CreatedBy + `</td>
                   <td style="text-align:center;">`+ item.CreatedDate + `</td>
                   <td style="text-align:center;display:none;">`+ item.RoleID + `</td>
                    <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                    <img src="Images/icon-eye.png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" />
                    </a></td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Event').html(htm);

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

function GetEventBasicDet() {

    $.ajax({
        url: "BriefForm.aspx/GetEventBasicDetails",
        data: JSON.stringify({ "EventId": EventId, "User": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtRefNo').val(result.d[0].ReferenceNumb);
            $('#txtEventName').val(result.d[0].EventName);
            $('#txtVenue').val(result.d[0].Venue);
            $('#txtDateFrom').val(result.d[0].ShowDateFrom);
            $('#txtDateTo').val(result.d[0].ShowDateTo);
            $('#txtDiLx').val(result.d[0].Length);
            $('#txtDiWx').val(result.d[0].Width);
            $('#txtDiH').val(result.d[0].Height);
            $('#txtHallAndStnd').val(result.d[0].HallAndStandNumb);
            $('#txtBuilUpDate').val(result.d[0].BuildUpDate);
            $('#txtDesignDeadLine').val(result.d[0].DesignDeadline);
            $('#txtContactPerson').val(result.d[0].ContactPerson);
            $('#txtEmailAddress').val(result.d[0].EmailAddress);
            $('#txtOrganizers').val(result.d[0].Organizers);
            $('#txtOrgContactDet').val(result.d[0].OrganizersContactDetails);

            //document.getElementById("txtDateFrom").valueAsDate = result.d[0].ShowDateFrom;
            //document.getElementById("txtDateTo").valueAsDate = new Date();
            //document.getElementById("txtBuilUpDate").valueAsDate = new Date();
            //document.getElementById("txtDesignDeadLine").valueAsDate = new Date();

            ReqStatus = result.d[0].Status;
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function hideShowEventInfo() {
    var x = document.getElementById("EventInfoDetailsRowDiv");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#EventInfoDetailsRowDiv').show('400');
        $('.Detail-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.Detail-det-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#EventInfoDetailsRowDiv').hide('400');
        $('.Detail-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.Detail-det-drilldown').addClass('bx bxs-chevron-down');

    }
}


$('.tbody-Event').on('click', '.ibtn-Request-Details', function () {


    $('#btnNewClient').addClass('active');
    $('#tab-NewClient').addClass('show active');

    $('#btnNewinquiry').removeClass('active');
    $('#tab-Newinquiry').removeClass('show active');

    $('#btnNewLead').removeClass('active');
    $('#tab-NewLead').removeClass('show active');


    Type = 'CLIENT';
    ClearEventbasicDetails();
    EventId = this.parentNode.parentNode.parentNode.children[0].textContent;
    GetEventBasicDet();
    GetNewClient();
    $('#ModalBriefForm').modal('show');

});
$('#btnNewClient').on('click', function () {

    Type = 'CLIENT';
    GetNewClient();
});

$('#btnNewinquiry').on('click', function () {

    Type = 'INQUIRY';
    GetNewInquiry();

});
$('#btnNewLead').on('click', function () {

    Type = 'LEAD';
    GetNewLead();

});

function ClearEventbasicDetails() {

    $('#txtRefNo').val('');
    $('#txtEventName').val('');
    $('#txtVenue').val('');
    $('#txtDiLx').val('');
    $('#txtDiWx').val('');
    $('#txtDiH').val('');
    $('#txtHallAndStnd').val('');
    $('#txtContactPerson').val('');
    $('#txtEmailAddress').val('');
    $('#txtOrganizers').val('');
    $('#txtOrgContactDet').val('');


    document.getElementById("txtDateFrom").valueAsDate = new Date();
    document.getElementById("txtDateTo").valueAsDate = new Date();
    document.getElementById("txtBuilUpDate").valueAsDate = new Date();
    document.getElementById("txtDesignDeadLine").valueAsDate = new Date();



}


function GetNewClient() {

    $.ajax({
        url: "Event.aspx/GetAllInformation",
        data: JSON.stringify({ "UserId": currUserId, "Type": Type, "EventId": EventId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;

            

            $.each(ProjectDetails, function (key, item) {
                var imagepath = 'https://crmss.naffco.com/CRMSS/Services/EventDownload.ashx?FileName=' + item.FileName;    // For Development
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.Name + `</td>
                  <td style="text-align:center;">`+ item.Location + `</td>
                  <td style="text-align:center;">`+ item.Address + `</td>
                  <td style="text-align:center;">`+ item.Remarks + `</td>
                  <td style="text-align:center;display:none;">`+ item.AttachmentURL + `</td>
                  <td style="text-align:center;"><a href="`+ imagepath +`"  class="AttatchmentDownload" title="Download" >
                   <img src="Images/icons8-download-48.png" title="Download" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" /></a>
                 
                    </td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-NewClient').html(htm);

          
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function GetNewLead() {

    $.ajax({
        url: "Event.aspx/GetAllInformation",
        data: JSON.stringify({ "UserId": currUserId, "Type": Type, "EventId": EventId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;

           

            $.each(ProjectDetails, function (key, item) {
                var imagepath = 'https://crmss.naffco.com/CRMSS/Services/EventDownload.ashx?FileName=' + item.FileName;    // For Development
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.Name + `</td>
                  <td style="text-align:center;">`+ item.Location + `</td>
                  <td style="text-align:center;">`+ item.Address + `</td>
                  <td style="text-align:center;">`+ item.Remarks + `</td>
                  <td style="text-align:center;display:none;">`+ item.AttachmentURL + `</td>
                   <td style="text-align:center;"><a href="`+ imagepath +`" type="button" class="AttatchmentDownload" title="Download" >
                   <img src="Images/icons8-download-48.png" title="Download" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" /></a>
                 
                    </td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-NewLead').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function GetNewInquiry() {

    $.ajax({
        url: "Event.aspx/GetAllInformation",
        data: JSON.stringify({ "UserId": currUserId, "Type": Type, "EventId": EventId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
          


            $.each(ProjectDetails, function (key, item) {
                var imagepath = 'https://crmss.naffco.com/CRMSS/Services/EventDownload.ashx?FileName=' + item.FileName;    // For Development
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.Name + `</td>
                  <td style="text-align:center;">`+ item.Location + `</td>
                  <td style="text-align:center;">`+ item.Address + `</td>
                  <td style="text-align:center;">`+ item.Remarks + `</td>
                  <td style="text-align:center;display:none;">`+ item.AttachmentURL + `</td>
                   <td style="text-align:center;"><a href="`+ imagepath +`" type="button" class="AttatchmentDownload" title="Download" >
                   <img src="Images/icons8-download-48.png" title="Download" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" /></a>
                 
                    </td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-NewInquiry').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnAddNewClient').on('click', function () {

    $('#modalAddInfo').modal('show');
    ClearFillDetails();
});

$('#btnAddNewInquiry').on('click', function () {

    $('#modalAddInfo').modal('show');
    ClearFillDetails();
});

$('#btnAddNewLead').on('click', function () {

    $('#modalAddInfo').modal('show');
    ClearFillDetails();
});


function ClearFillDetails() {
    $('#txtName').val('');
    $('#txtLocation').val('');
    $('#txtAddress').val('');
    $('#txtRemarks').val(''); 
    $('#colFileUpload').val('');
}

$('#btnSaveDet').on('click', function () {

    if ($('#txtName').val().trim() != "" && $('#txtRemarks').val().trim() != "" && $('#txtAddress').val().trim() != "" && $('#colFileUpload').val().trim() != "") {
        uploadMultiFilesByAjax();
    } else {
        toastr.error('Required All Fields. ', '');
    }

});


function uploadMultiFilesByAjax() {

    //var seloption = $('input[name="inlineRadioOptions"]:checked').val().trim();


    //let paraProjName = $('#txtsuggprojectname').val();
    //let paraSuggType = $('input[name=inlineRadioOptions]:checked').val()
    //let paraModName = $('#ddlsuggmoduleName').val();



    var formData = new FormData();
    var fileUpload = $('#colFileUpload').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    /*var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/EventDownload.ashx?EventId=' + EventId + '&UserId=' + currUserId + '&Type=' + Type + '&Name=' + $('#txtName').val().trim() + '&Location=' + $('#txtLocation').val().trim() + '&Address=' + $('#txtAddress').val().trim() + '&Remarks=' + $('#txtRemarks').val().trim();    //for Live*/
    var qrystringLocal = '/Services/ForBrandingEvent.ashx?EventId=' + EventId + '&UserId=' + currUserId + '&Type=' + Type + '&Name=' + $('#txtName').val().trim() + '&Location=' + $('#txtLocation').val().trim() + '&Address=' + $('#txtAddress').val().trim() + '&Remarks=' + $('#txtRemarks').val().trim();    // For Development

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
                toastr.success('File has been Uploaded Successfully. ', '');
                //$('.WO-Root-Casuse-table td').length > 0 ? objDatatablePaySch.destroy() : '';
                $('#colFileUpload').val('');
               /* $('#txtAttachmentComment').val('');*/
                /*  GetAttachmentDet();*/
                if (Type == "CLIENT") { GetNewClient(); }
                else if (Type == "INQUIRY") { GetNewInquiry(); }
                else if (Type == "LEAD") { GetNewLead(); }
                $('#modalAddInfo').modal('hide');
          
                

            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });

}

function DownloadAttachment(FileName) {

    /*var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FUForRMA.ashx?EventId=' + EventId + '&UserId=' + currUserId + '&Type=' + Type + '&Name=' + $('#txtName').val().trim() + '&Location=' + $('#txtLocation').val().trim() + '&Address=' + $('#txtAddress').val().trim() + '&Remarks=' + $('#txtRemarks').val().trim();    //for Live*/
    var qrystringLocal = '/Services/EventDownload.ashx?FileName=' + FileName ;    // For Development
}
