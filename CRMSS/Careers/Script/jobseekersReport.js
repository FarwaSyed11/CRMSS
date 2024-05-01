var company = "-1";
var manager = -1;
var marketing = -1;

var objDatatable=[];

$(document).ready(function () {

    setTimeout(function () {
        LoadData('Please wait...');
        //$(".ajax-loader").fadeOut(500);
    }, 500);

});


$('#btnSearch').on('click', function () {

    $('.ajax-loader').fadeIn(100);
    setTimeout(function () {
        LoadData('Please wait...');
        //$(".ajax-loader").fadeOut(500);
    }, 500);

});

function LoadData(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "JobseekersReport.aspx/GettableData",
        data: JSON.stringify({ "Emirates": $("#ddlEmirate").val(), "Gender": $("#ddlgender").val(), "Qualification": $("#ddlQualification").val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '';
            $('.tbody-maintableData td').length > 0 ? objDatatable.destroy() : '';
            $(".ajax-loader").fadeOut(500);

            const finalResult = [];
            const map = new Map();
            var urlService = '';
            var ddlStatus = '';

            

            $.each(result.d, function (key, item) {
                urlService = 'https://crmss.naffco.com/CRMSS/Careers/Service/DownloadFileHandler.ashx?attachurl=' + item.CVLink+'&ContentType='+item.ContentType;  // for production
                //urlService = 'http://localhost:49753/Services/DownloadFileHandler.ashx?attachurl=' + item.CVLink;   // for development
                var opt = '';
                 ddlStatus = 'ddlStatus-' + item.ID;
                if (item.Status =="SUBMIT")
                    opt += '<option value="SUBMIT" selected>SUBMIT</option>';
                else
                    opt += '<option value="SUBMIT">SUBMIT</option>';

                if (item.Status == "OFFER ACCEPTED")
                    opt += '<option value="OFFER ACCEPTED" selected>OFFER ACCEPTED</option>';
                else
                    opt += '<option value="OFFER ACCEPTED">OFFER ACCEPTED</option>';

                if (item.Status == "INTERVIEWED")
                    opt += '<option value="INTERVIEWED" selected>INTERVIEWED</option>';
                else
                    opt += '<option value="INTERVIEWED">INTERVIEWED</option>';

                if (item.Status == "SHORT LISTED")
                    opt += '<option value="SHORT LISTED" selected>SHORT LISTED</option>';
                else
                    opt += '<option value="SHORT LISTED">SHORT LISTED</option>';

            



                htm += `<tr>`;
                htm += `<td style="text-align:center;" class="hidden">` + item.ID + `</td> 
                        <td style="text-align:center;">` + item.ApplicantName + `</td>   
                        <td style = "text-align:center;" > ` + item.Gender + `</td >
                      <td style = "text-align:center;" > ` + item.Qualification + `</td >
                    <td style = "text-align:center;" > ` + item.Subject + `</td >
                        <td style="text-align:center;">` + item.University + `</td> 
                        <td style="text-align:center;">` + item.YearOfgraduation + `</td> 
                        <td style="text-align:center;">` + item.YearOfExp + `</td> 
                <td style = "text-align:center;" > ` + item.Emirates + `</td >
                <td style = "text-align:center;" > ` + item.Availability + `</td >
                <td style = "text-align:center;" > ` + item.CanWorkFactory + `</td >
                <td style = "text-align:center;" > ` + item.DrivingLicense + `</td >
                <td style = "text-align:center;" > ` + item.ContactNumber + `</td >
                <td style = "text-align:center;" > ` + item.Email + `</td >
                 <td style="text-align:center;">
                  <a href="`+ urlService + `"> 
                   <img src="images/icons8-download-48.png" title="Download" class="fa-icon-hover ibtn-attchment" style="cursor: pointer; width: 34px;"/></a>
                </td>
                   <td style="text-align:center;"> <select style="font-size:12px;"  class="form-select StatusUpdate" id=`+ ddlStatus + `> ` + opt + `  </select> </td >  
                <td class="hidden" style = "text-align:center;" > ` + item.ContentType + `</td >
`;
                      
                   


                htm += `</tr>`;

            });



            $('.tbody-maintableData').html(htm);
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

//$('.tbody-maintableData').on('click', '.AttatchmentDownload', function () {
//    //var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Careers/Service/FileUpload.ashx?ApplicantName=' + $("#txtName").val() + '&Qualification=' + $("#ddlQualification").val() + '&Gender=' + $("#ddlgender").val() + '&Subject=' + $("#txtSubject").val() + '&University=' + $("#txtUniversity").val() + '&YearOfGraduation=' + $("#txtYear").val() + '&YearOFExp=' + $("#txtYearofExp").val() + '&Emirates=' + $("#ddlEmirate").val() + '&Availability=' + $("#ddlAvailability").val() + '&CanWorkFactory=' + $("#ddlCanWorkInFactory").val() + '&DrivingLicense=' + $("#ddlDrivingLicense").val() + '&ContactNumber=' + $("#txtContactNumber").val() + '&Email=' + $("#txtEmail").val();  // For Production
//			var qrystringLocal = 'Service/FileUpload.ashx?ApplicantName=' + $("#txtName").val() + '&Qualification=' + $("#ddlQualification").val() + '&Subject=' + $("#txtSubject").val() + '&University=' + $("#txtUniversity").val() + '&YearOfGraduation=' + $("#txtYear").val() + '&YearOFExp=' + $("#txtYearofExp").val() + '&Emirates=' + $("#ddlEmirate").val() + '&Availability=' + $("#ddlAvailability").val() + '&CanWorkFactory=' + $("#ddlCanWorkInFactory").val() + '&DrivingLicense=' + $("#ddlDrivingLicense").val() + '&ContactNumber=' + $("#txtContactNumber").val() + '&Email=' + $("#txtEmail").val();  // For Development

//    $.ajax({
//        type: 'post',
//        url: qrystringLocal,
//        data: formData,

//        success: function (status) {
//            if (status != 'error') {

//                toastr.success('File has been Uploaded Successfully. ', '');




//                //loadAttachsOfChat();
//                $('#txtFileUpload').val('');
//                $('#txtName').val('');
//                $('#txtSubject').val('');
//                $('#txtYear').val('');
//                $('#txtYearofExp').val('');
//                $('#txtContactNumber').val('');
//                $('#txtEmail').val('');


//            }
//        },
//        processData: false,
//        contentType: false,
//        error: function () {
//            alert("Whoops something went wrong!");
//        }
//    });
//});

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.maintableData').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });
}

$('.tbody-maintableData').on('change', '.StatusUpdate', function () {
    let id = this.parentNode.parentNode.children[0].textContent;
    var ddlStatus = '#' + this.parentNode.parentNode.children[15].childNodes[1].id + ' option:selected';
    let Status = $(ddlStatus).val();
   


    $.ajax({
        url: "JobseekersReport.aspx/UpdateStatus",
        data: JSON.stringify({ "ID": id, "Status": Status }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {

            
            toastr.success('Updated Successfully. ', '');

        },
        
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

});
