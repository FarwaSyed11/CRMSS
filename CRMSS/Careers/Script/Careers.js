$(document).ready(function () {
    $(".ajax-loader").fadeOut(500);
	$('#btnSave').on('click', function () {

		if ($("#txtName").val() == "") {
			toastr.error("Please Enter Your Name");
			$("#txtName").focus();
		}
		else if ($("#ddlQualification").val() == "-1") {
			toastr.error("Please Select the Qualification");
			$("#ddlQualification").focus();
		}
		else if ($("#txtSubject").val() == "") {
			toastr.error("Please Enter the Subject/Major");
			$("#txtSubject").focus();
		}
		else if ($("#txtUniversity").val() == "") {
			toastr.error("Please Enter the University Name");
			$("#txtUniversity").focus();
		}
		else if ($("#txtYear").val() == "") {
			toastr.error("Please Enter the Graduation Year");
			$("#txtYear").focus();
		}
		else if ($("#ddlEmirate").val() == "-1") {
			toastr.error("Please Select the Emirate");
			$("#ddlEmirate").focus();
		}
		else if ($("#ddlAvailability").val() == "-1") {
			toastr.error("Please Select the Availability");
			$("#ddlAvailability").focus();
		}
		else if ($("#txtContactNumber").val() == "" || $("#txtContactNumber").val().length < 10) {
			toastr.error("Please Enter Your Contact Number");
			$("#txtContactNumber").focus();
		}
		else if ($('#txtFileUpload')[0].files.length == 0) {
			toastr.error('Please select CV to upload. ', '')
		}
		else {
		    $('.ajax-loader').fadeIn(100);
		    setTimeout(function () {
		        SaveApllicationData();
		    }, 500);


		}

	

	});
});
function SaveApllicationData() {


        var formData = new FormData();
    var fileUpload = $('#txtFileUpload').get(0);
        var files = fileUpload.files;
        for (var i = 0; i < files.length; i++) {
            console.log(files[i].name);
            formData.append(files[i].name, files[i]);
        }

        var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Careers/Service/FileUpload.ashx?ApplicantName=' + $("#txtName").val() + '&Qualification=' + $("#ddlQualification").val() + '&Gender=' + $("#ddlgender").val() + '&Subject=' + $("#txtSubject").val() + '&University=' + $("#txtUniversity").val() + '&YearOfGraduation=' + $("#txtYear").val() + '&YearOFExp=' + $("#txtYearofExp").val() + '&Emirates=' + $("#ddlEmirate").val() + '&Availability=' + $("#ddlAvailability").val() + '&CanWorkFactory=' + $("#ddlCanWorkInFactory").val() + '&DrivingLicense=' + $("#ddlDrivingLicense").val() + '&ContactNumber=' + $("#txtContactNumber").val() + '&Email=' + $("#txtEmail").val();  // For Production
			//var qrystringLocal = 'Service/FileUpload.ashx?ApplicantName=' + $("#txtName").val() + '&Qualification=' + $("#ddlQualification").val() + '&Subject=' + $("#txtSubject").val() + '&University=' + $("#txtUniversity").val() + '&YearOfGraduation=' + $("#txtYear").val() + '&YearOFExp=' + $("#txtYearofExp").val() + '&Emirates=' + $("#ddlEmirate").val() + '&Availability=' + $("#ddlAvailability").val() + '&CanWorkFactory=' + $("#ddlCanWorkInFactory").val() + '&DrivingLicense=' + $("#ddlDrivingLicense").val() + '&ContactNumber=' + $("#txtContactNumber").val() + '&Email=' + $("#txtEmail").val();  // For Development

				//let sURL = 'TestFoCalendar.aspx/Upload';

        //var formData = new FormData();
        //formData.append('file', $('#f_UploadImage')[0].files[0]);
        $.ajax({
            type: 'post',
            url: qrystringLocal,
            data: formData,
       
            success: function (status) {
                if (status != 'error') {
                    $(".ajax-loader").fadeOut(500);
                    window.location.href = "https://crmss.naffco.com/CRMSS/Careers/messageurl.aspx";
                    
                    //toastr.success('File has been Uploaded Successfully. ', '');

                   

                    ////loadAttachsOfChat();
					//$('#txtFileUpload').val("");
					//$('#txtName').val("");
					//$('#txtSubject').val("");
					//$('#txtYear').val("");
					//$('#txtYearofExp').val("");
					//$('#txtContactNumber').val("");
					//$('#txtEmail').val("");


                }
            },
            processData: false,
            contentType: false,
            error: function () {
                alert("Whoops something went wrong!");
            }
        });
    



}

