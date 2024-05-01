function GetPushNotification() {
    var modname = $("#hfSessionNotificationModule").val();
    //alert(modname);
    $.ajax({
        url: "/Notification/GetDashboardNotificationList", cache: false, data: { MODULE_NAME: modname},
        success: function (data) {
            if (data != null && data != "") {
                var model = eval(data.Data);
                BindNotification(model);

                if (model.length === 0 || model == undefined) {
                    $("#divNotificationFooter").attr("style", "display:none;");
                    $("#divNotificationTitle").html("You have " + model.length + " notification.");
                    $("#spnNotification").html(model.length);
                }
                else {
                    $("#divNotificationFooter").removeAttr("style");
                    $("#divNotificationTitle").html("You have " + model.length + " new notification(s).");
                    $("#spnNotification").html(model.length);
                }
            }
            else {
                //$('#LeaveReqVal').text('');
            }
        }
    });
}
function BindNotification(model) {
    $.each(model, function (i, e) {
        if (e.AREA_NAME != null && e.SCREEN_ID != null && e.MENU_ID != null) {
            if (e.CONTROLLER_NAME === "DocumentManagement") {
                $("#divNotification").append('<li>' +
                    '   <a class="app-notification__item" href="/' + e.AREA_NAME + '/' + e.CONTROLLER_NAME + '/Index?MenuId=' + e.MENU_ID + '&ScreenId=' + e.SCREEN_ID + '&ID=' + e.RECORD_ID + '&DOCUMENTTYPE=' + e.NOTIFICATION_DOC_TYPE +'">' +
                    //'   <a class="app-notification__item" href="/' + e.AREA_NAME + '/' + e.CONTROLLER_NAME + '/Index?MenuId='+ e.MENU_ID + '&ScreenId=' + e.SCREEN_ID + '>' +
                    //'   <a class="app-notification__item" href="#">' +
                    '       <span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>' +
                    '       <div>' +
                    '           <p class="app-notification__message">' + e.MESSAGE + '</p>' +
                    '       </div>' +
                    '   </a>' +
                    '</li>');
            }
            else {
                $("#divNotification").append('<li>' +
                    '   <a class="app-notification__item" href=/' + e.AREA_NAME + '/' + e.CONTROLLER_NAME + '/Index?MenuId=' + e.MENU_ID + '&ScreenId=' + e.SCREEN_ID + '&ID=' + e.RECORD_ID + '>' +
                    //'   <a class="app-notification__item" href="/' + e.AREA_NAME + '/' + e.CONTROLLER_NAME + '/Index?MenuId='+ e.MENU_ID + '&ScreenId=' + e.SCREEN_ID + '>' +
                    //'   <a class="app-notification__item" href="#">' +
                    '       <span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>' +
                    '       <div>' +
                    '           <p class="app-notification__message">' + e.MESSAGE + '</p>' +
                    '       </div>' +
                    '   </a>' +
                    '</li>');
            }
            
        }
        else if (e.SCREEN_ID != null && e.MENU_ID != null) {
            $("#divNotification").append('<li>' +
                '   <a class="app-notification__item" href="/' + e.CONTROLLER_NAME + '/Index?MenuId="' + e.MENU_ID + '&ScreenId=' + e.SCREEN_ID + '&ID=' + e.RECORD_ID +'>' +
                '   <a class="app-notification__item" href="#">' +
                '       <span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>' +
                '       <div>' +
                '           <p class="app-notification__message">' + e.MESSAGE + '</p>' +
                '       </div>' +
                '   </a>' +
                '</li>');
        }
        else {
            $("#divNotification").append('<li>' +
                //'   <a class="app-notification__item" href="/' + e.CONTROLLER_NAME + '/Index">' +
                '   <a class="app-notification__item" href="#">' +
                '       <span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>' +
                '       <div>' +
                '           <p class="app-notification__message">' + e.MESSAGE + '</p>' +
                '       </div>' +
                '   </a>' +
                '</li>');
        }
    });
}