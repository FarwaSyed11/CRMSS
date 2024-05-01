$(document).ready( function () {
    // $('#table_id').DataTable();




    $('.nav_part ul li.Menuli').click(function () {
        var liID = $(this)[0].id;
        $.each($('.nav_part ul li.Menuli'), function (i,e) {
            if (e.id !== liID)
                $(this).removeClass("active");
        })

        var currentID = $(this).find(".dropdown_outer")[0].id;
        $.each($('.nav_part ul li').find(".dropdown_outer"), function (i,e) {
            if (e.id !== currentID)
                $(this).hide();
        });

        $(this).toggleClass('active');
        $(this).find(".dropdown_outer").slideToggle();
    });




});