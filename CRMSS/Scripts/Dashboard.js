var xhr_GetData_Dropdown;
var xhr_getData_For_Edit;
var xhr_GetData_Bind;
var xhr_GetData_ExitType;
var xhr;

var DashBoardCount = {
    CreateBlanckForm: function (data) {
        var count = 0;
        for (var i = 0; i < data.Data.length; i++) {            
            if (data.Data[i].CATEGORY == "News & Circulars") {
                $('#catg1').text(data.Data[i].CATEGORY);
                if (data.Data[i].FIELD_NAME != null && data.Data[i].FILE_TYPE != null) {
                    $('#Newsdiv').append(
                            '<li>' +
                                '<img id="NewsCirculars' + data.Data[i].ID + data.Data[i].FIELD_NAME + '" alt="Expandable Input" load=' + DashBoardCount.GetIconImg(data.Data[i].ID, "SSHR_EVENTS", data.Data[i].FIELD_NAME, data.Data[i].FILE_TYPE, "News & Circulars") + ' /><a>' + data.Data[i].HEADING + '</a>' +
                                '<p>' + GetDate(data.Data[i].CONTENTDATE) + '<br />' + data.Data[i].CONTENT + '<br> <a target="_blank" href="' + data.Data[i].HYPERLINK + '" class="know">Know More</a>' +
                                '</p>' +
                            '</li>');
                }
                else {
                    $('#Newsdiv').append(
                            '<li>' +
                            '<a href="#">' + data.Data[i].HEADING + '</a>' +
                                '<p>' + '<strong>' + GetDate(data.Data[i].CONTENTDATE) + '</strong>' + '<br />' + data.Data[i].CONTENT + '<br> <a target="_blank" href="' + data.Data[i].HYPERLINK + '" class="know">Know More</a>' +
                                '</p>' +
                            '</li>');
                }
            }

            if (data.Data[i].CATEGORY == "Current Openings") {
                $('#catg2').text(data.Data[i].CATEGORY);
                $('#CurrenOpdiv').append(
                            '<li>' +
                                '<a> ' + data.Data[i].HEADING + '</a>' +
                                '<p>' + data.Data[i].CONTENT + '<br> <a target="_blank" href="' + data.Data[i].HYPERLINK + '" class="know">Know More</a></p>' +
                            '</li>');
            }

            if (data.Data[i].CATEGORY == "Employee of the month") {
                $('#catg3').text(data.Data[i].CATEGORY);                
                DashBoardCount.BindEmpOfTheMonth(data.Data[i].ATTR1, count);
                count = count + 1;
            }
        }

    },
    GetImageData: function (imgid, Eid) {
        $.ajax({
            url: "/NaffcoGate/GetImage", cache: false,
            data: { Eid: Eid },
            success: function (data) {
                if (data != null && data != "") {
                    $("#" + imgid).attr("src", "/NaffcoGate/GetImage");
                } else {
                    $("#" + imgid).attr("src", "/Theme/naffco/images/no-image.jpg");
                }
            }
        });
    },
    BindEmpOfTheMonth: function (Eid, count) {
        xhr = $.ajax({
            url: "/NaffcoGate/GetEmployeeDetails", cache: false, data: { Eid: Eid },
            success: function (data) {
                if (data != null && data.Data.length > 0) {
                    var FULL_NAME = data.Data[0].FULL_NAME;
                    var DEPARTMENT = data.Data[0].DEPARTMENT;
                    var POSITION = data.Data[0].POSITION;
                    var LOCATION = data.Data[0].LOCATION;

                    var str;
                    if (count == 0)
                        str = '<div class="carousel-item active">';
                    else
                        str = '<div class="carousel-item">';

                    $.ajax({
                        url: "/NaffcoGate/GetImage", cache: false,
                        data: { Eid: Eid },
                        success: function (data) {
                            if (data != null && data != "") {
                                //$("#" + imgid).attr("src", "/NaffcoGate/GetImage");
                                $('#emp').append(str +
                                   '<div class="carousel-caption">' +
                                       '<div class="row">' +
                                           '<div class="col-md-12">' +
                                               '<div class="pull-left profile-header-img">' +
                                                   '<img id="emp' + Eid + '" class="img-circle" src="/NaffcoGate/GetImage?Eid=' + Eid + '"/>' +
                                               '</div>' +
                                            '</div>' +
                                            '<div class="col-sm-12 text-center">' +
                                                '<h3>' + FULL_NAME + '</h3>' +
                                                '<span>' + POSITION + '<br>' + DEPARTMENT + '</span><br>' +
                                                '<b class="smallest mute"><strong>' + LOCATION + '</strong></b>' +
                                            '</div>' +
                                      '</div>' +
                                  '</div>' +
                              '</div>');
                            } else {
                                //$("#" + imgid).attr("src", "/Theme/naffco/images/no-image.jpg");
                                $('#emp').append(str +
                                   '<div class="carousel-caption">' +
                                       '<div class="row">' +
                                           '<div class="col-md-12">' +
                                               '<div class="pull-left profile-header-img">' +
                                                   '<img id="emp' + Eid + '" class="img-circle" src="/Theme/naffco/images/no-image.jpg"/>' +
                                               '</div>' +
                                            '</div>' +
                                            '<div class="col-sm-12 text-center">' +
                                                '<h3>' + FULL_NAME + '</h3>' +
                                                '<span>' + POSITION + '<br>' + DEPARTMENT + '</span><br>' +
                                                '<b class="smallest mute"><strong>' + LOCATION + '</strong></b>' +
                                            '</div>' +
                                      '</div>' +
                                  '</div>' +
                              '</div>');
                            }
                        }
                    });

                   
                }
                else {
                    CustomMessage('Error', data.Message, "error");
                    $("#hf_BankId").val("");
                }
            }
        });
    },
    GetIconImg: function (recordid, tablename, fieldname, contentType, Category) {
        $.ajax({
            url: "/Admin/Events/ShowImg", cache: false,
            data: { recordid: recordid, tablename: tablename, fieldname: fieldname, contentType: contentType },
            success: function (data) {
                if (Category == 'News & Circulars') {
                    if (data != null && data != "") {
                        $("#NewsCirculars" + recordid + fieldname).attr("src", "/Admin/Events/ShowImg?recordid=" + recordid + "&tablename=" + tablename + "&fieldname=" + fieldname + "&contentType=" + contentType + "");
                    } else {
                        $("#NewsCirculars" + recordid + fieldname).attr("src", "/Theme/naffco/images/no-image.jpg");
                    }
                }
            }
        });
    },
}
