﻿/***************************/
//@Author: Adrian "yEnS" Mato Gondelle
//@website: www.yensdesign.com
//@email: yensamg@gmail.com
//@license: Feel free to use it, but keep this credits please!					
/***************************/

//SETTING UP OUR POPUP
//0 means disabled; 1 means enabled;
var popupStatus = 0;

//loading popup with jQuery magic!
function loadPopup(){
	//loads popup only if it is disabled
	if(popupStatus==0){
		$("#bgPopup").css({
			"opacity": "0.7"
		});
		$("#bgPopup").fadeIn("slow");
		$("#popupBox").fadeIn("slow");
		popupStatus = 1;
		var hiddenControl = "MainPlaceHolder_PageContentPlaceHolder_hfMediaPopup";
		document.getElementById(hiddenControl).value = '1';
	}
}

//disabling popup with jQuery magic!
function disablePopup(){
	//disables popup only if it is enabled
	if(popupStatus==1){
		$("#bgPopup").fadeOut("slow");
		$("#popupBox").fadeOut("slow");
		popupStatus = 0;
		var hiddenControl = "MainPlaceHolder_PageContentPlaceHolder_hfMediaPopup";
		document.getElementById(hiddenControl).value = '0';
	}
}

//centering popup
function centerPopup(){
	//request data for centering
	var windowWidth = document.documentElement.clientWidth;
	var windowHeight = document.documentElement.clientHeight;
	var popupHeight = $("#popupBox").height();
	var popupWidth = $("#popupBox").width();
	//centering
	$("#popupBox").css({
		"position": "absolute",
		"top": windowHeight/2-popupHeight/2,
		"left": windowWidth/2-popupWidth/2
	});
	//only need force for IE6
	
	$("#bgPopup").css({
		"height": windowHeight
	});

}

function showPopup() {
    var hiddenControl = "MainPlaceHolder_PageContentPlaceHolder_hfMediaPopup";
    if (document.getElementById(hiddenControl).value == '1') {
        centerPopup();
        loadPopup();
    }
}


//CONTROLLING EVENTS IN jQuery
$(document).ready(function () {

    //LOADING POPUP
    //Click the button event!
    $("#lnkFinalise").click(function () {
        //centering with css
        centerPopup();
        //load popup
        loadPopup();
    });

    //CLOSING POPUP
    //Click the x event!
    $("#popupClose").click(function () {
        disablePopup();
    });
    //Click out event!
    $("#bgPopup").click(function () {
        disablePopup();
    });
    //Press Escape event!
    $(document).keypress(function (e) {
        if (e.keyCode == 27 && popupStatus == 1) {
            disablePopup();
        }
    });

});