/***************************/
//@Author: Adrian "yEnS" Mato Gondelle
//@website: www.yensdesign.com
//@email: yensamg@gmail.com
//@license: Feel free to use it, but keep this credits please!					
/***************************/

//SETTING UP OUR POPUP
//0 means disabled; 1 means enabled;
var studentPopupStatus = 0;

//loading popup with jQuery magic!
function loadStudentPopup(){
	//loads popup only if it is disabled
    if (studentPopupStatus == 0) {
		$("#bgPopup").css({
			"opacity": "0.7"
		});
		$("#bgPopup").fadeIn("slow");
		$("#studentPopupBox").fadeIn("slow");
		studentPopupStatus = 1;
		var hiddenControl = "MainPlaceHolder_PageContentPlaceHolder_hfStudentPopup";
		document.getElementById(hiddenControl).value = '1';
	}
}

//disabling popup with jQuery magic!
function disableStudentPopup(){
	//disables popup only if it is enabled
    if (studentPopupStatus == 1) {
		$("#bgPopup").fadeOut("slow");
		$("#studentPopupBox").fadeOut("slow");
		studentPopupStatus = 0;
		var hiddenControl = "MainPlaceHolder_PageContentPlaceHolder_hfStudentPopup";
		document.getElementById(hiddenControl).value = '0';
	}
}

//centering popup
function centerStudentPopup(){
	//request data for centering
	var windowWidth = document.documentElement.clientWidth;
	var windowHeight = document.documentElement.clientHeight;
	var popupHeight = $("#studentPopupBox").height();
	var popupWidth = $("#studentPopupBox").width();
	//centering
	$("#studentPopupBox").css({
		"position": "absolute",
		"top": windowHeight/2-popupHeight/2,
		"left": windowWidth/2-popupWidth/2
	});
	//only need force for IE6
	
	$("#bgPopup").css({
		"height": windowHeight
	});

}

function showStudentPopup() {
    var hiddenControl = "MainPlaceHolder_PageContentPlaceHolder_hfStudentPopup";
    if (document.getElementById(hiddenControl).value == '1') {
        centerStudentPopup();
        loadStudentPopup();
    }
}


//CONTROLLING EVENTS IN jQuery
$(document).ready(function () {

    //LOADING POPUP
    //Click the button event!
    $("#lnkFinalise").click(function () {
        //centering with css
        centerStudentPopup();
        //load popup
        loadStudentPopup();
    });

    //CLOSING POPUP
    //Click the x event!
    $("#studentPopupClose").click(function () {
        disableStudentPopup();
    });
    //Click out event!
    $("#bgPopup").click(function () {
        disableStudentPopup();
    });
    //Press Escape event!
    $(document).keypress(function (e) {
        if (e.keyCode == 27 && studentPopupStatus == 1) {
            disableStudentPopup();
        }
    });

});