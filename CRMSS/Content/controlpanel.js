$(document).ready(function () {
    $(".pearl").click(function () {
        $('.pearl').removeClass('current-step next-step previous-step');
        $(this).addClass("current-step");
        $(this).nextAll('.pearl').addClass("next-step");
        $(this).prevAll('.pearl').addClass("previous-step");
    });
    $(".pearl-number")[0].click();

    //For horizontal scroll of control panel
    $('.ControlPanelScroll').hScroll(60);
});


jQuery(function ($) {
    $.fn.hScroll = function (amount) {
        amount = amount || 120;
        $(this).bind("DOMMouseScroll mousewheel", function (event) {
            var oEvent = event.originalEvent,
                direction = oEvent.detail ? oEvent.detail * -amount : oEvent.wheelDelta,
                position = $(this).scrollLeft();
            position += direction > 0 ? -amount : amount;
            $(this).scrollLeft(position);
            event.preventDefault();
        })
    };
});