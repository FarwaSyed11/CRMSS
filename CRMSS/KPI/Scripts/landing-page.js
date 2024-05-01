

    var appList = [];
    var appID = '';
        $(document).ready(function () {
        appID = window.location.search.split('?')[1].trim().split('=')[1].trim();
    getImageAndDesc();
});


function getImageAndDesc() {

        $.ajax({
            url: "LandingPage.aspx/GetImgAndDesc",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                appList = result.d;
                var CurrApp = appList.filter(x => x.AppId == appID);
                $('#desctionpara').html(CurrApp[0].Description);
                $('.app-name').html(CurrApp[0].AppName);

                if (appID == 9) {
                    $('.imgAppKPIDiv').removeClass('hidden');
                    $('#imgAppKPI').attr('src', CurrApp[0].ImageUrl);
                } else if (appID == 1) {
                    $('.imgAppCRMDiv').removeClass('hidden');
                    $('#imgAppCRM').attr('src', CurrApp[0].ImageUrl);
                } else if (appID == 2) {
                    $('.imgAppSiteSurveyDiv').removeClass('hidden');
                    $('#imgAppSiteSurvey').attr('src', CurrApp[0].ImageUrl);
                } else if (appID == 6) {
                    $('.imgAppTODODiv').removeClass('hidden');
                    $('#imgAppTODO').attr('src', CurrApp[0].ImageUrl);
                }


            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
    

