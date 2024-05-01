

function activeCurrentPage(pageName) {
    $('.navnew li').css('border-bottom', '4px #aaa solid');
    $('.navnew li a').css('color', 'white');

    $.each($('.navnew li'), function (key, item) {
        if (item.textContent.trim().toUpperCase() == pageName.toUpperCase()) {
            $('.navnew li:eq(' + key + ')').css('border-bottom', '4px #eee249 solid');
            $('.navnew li:eq(' + key + ') a').css('color', '#eee249');
        }
    });

}

function activeCurrentPage(pageName,parentul, childli) {
    $('.navnew li').css('border-bottom', '4px #aaa solid');
    $('.navnew li:eq(' + parentul +') ul li a').css('color', 'white');

    $.each($('.navnew li:eq(' + parentul +') ul li'), function (key, item) {
        if (item.textContent.trim().toUpperCase() == pageName.toUpperCase()) {
            $('.navnew li:eq(' + key + ')').css('border-bottom', '4px #eee249 solid');
            $('.navnew li:eq(' + key + ') a:eq(0)').css('color', '#eee249');
            $('.navnew li:eq(' + parentul +') ul li:eq(' + childli + ') a').css('color', '#eee249')
            //$('.navnew li:eq(' + key + ') a:eq(' + innerAnchor + ')').css('color', '#eee249');
        }
    });
}