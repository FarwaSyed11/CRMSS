$(document).ready(function () {

  
        //const theModal = $('#youTubeModal'),
        //    videoSRC = "https://crmss.naffco.com/crmss/wish/Ramadan%20kareem.mp4?autoplay=1"
        //    videoSRCauto = `${videoSRC}`,
        //    modalVideo = document.getElementById(`22`);
        //if (modalVideo) {
        //    modalVideo.setAttribute('src', videoSRCauto);

        
    Greetingvideo();
         
            


   // }
});
function Greetingvideo() {
    debugger;
    $.ajax({
        url: "Econnect.aspx/Greeting",
        data: JSON.stringify({ "UserID": currUserId.val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == "1") {
                $('#youTubeModal').modal('show');
            }
            else {
                $('#22').prop('src', '');
            }

          

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

//const autoPlayYouTubeModal = function () {
//    const modalTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="modal"]'));
//    modalTriggerList.map(function (modalTriggerEl) {
//        modalTriggerEl.onclick = function () {
           
//        };
//    });
//};

// Calling function on load
