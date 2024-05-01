//jQuery.ajaxSettings.traditional = true;
var xhr_GetData;
$(document).ready(function () {

    $('.allowNumberOnly').keypress(function (event) {
        if (event.which === 8 || event.which === 0) {
            return true;
        }
        if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    });
    $('.max99NumericOnly').keypress(function (event) {
        var inputValue = event.which;
        if (inputValue === 8 || event.which === 0) {
            return true;
        }
        if (!(inputValue >= null + 32 && inputValue <= c + 32) && (inputValue != 46 || $(this).val().indexOf('.') != -1) && (inputValue < 48 || inputValue > 57)) {
            return false;
        }
    });


    $('.allowNumberOnlyWithoutDecimalPoint').keypress(function (event) {
        if (event.which === 8 || event.which === 0) {
            return true;
        }
        if ((event.which != 46 || $(this).val().indexOf('.') == -1) && (event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    });



    $('.allowAmountOnly').keypress(function (event) {
        if (event.which === 8 || event.which === 0) {
            return true;
        }
        if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    });


    $('.allowCharacterOnly').keypress(function (event) {
        var inputValue = event.which;
        if (inputValue === 8 || event.which === 0) {
            return true;
        }
        if (!(inputValue >= 65 && inputValue <= 122) && (inputValue != 32 && inputValue != 0)) {
            event.preventDefault();

        }
    });

    $('.allowCharacterOnlyWithComma').keypress(function (event) {
        var inputValue = event.which;
        if (inputValue === 8 || event.which === 0 || inputValue === 44) {
            return true;
        }
        if (!(inputValue >= 65 && inputValue <= 122) && (inputValue != 32 && inputValue != 0)) {
            event.preventDefault();

        }
    });
    $('.restrictSpecialCharacters').keypress(function (event) {
        var inputValue = event.which;
        if (inputValue === 8 || event.which === 0) {
            return true;
        }
        if ((inputValue < 48 || (inputValue > 57 && inputValue < 65) || (inputValue > 90 && inputValue < 97) || inputValue > 122) && inputValue != 32) {
            return false;
        }
    });
    $('.allowSpecialCharactersOnly').keypress(function (event) {
        var inputValue = event.which;
        if (inputValue === 8 || event.which === 0) {
            return true;
        }
        if (!(inputValue < 48 || (inputValue > 57 && inputValue < 65) || (inputValue > 90 && inputValue < 97) || inputValue > 122) && inputValue != 32) {
            return false;
        }
    });
    $('.dataTable').on('click', 'tbody tr', function (event) {
        $(this).addClass('highlight').siblings().removeClass('highlight');
    });
});

function DisplayCommaSeperatedNo(no) {
    var number = parseInt(no);
    //document.body.innerHTML = number.toLocaleString();
    return number.toLocaleString();
}


//Ajax Helpers start
function CommaFormatted(amount) {

    if (amount > 0) {
        var delimiter = ","; // replace comma if desired
        var Amount = amount + '.00';
        var a = Amount.split('.', 2)
        var d = a[1];
        var i = parseInt(a[0]);
        if (isNaN(i)) { return ''; }
        var minus = '';
        if (i < 0) { minus = '-'; }
        i = Math.abs(i);
        var n = new String(i);
        var a = [];
        while (n.length > 3) {
            var nn = n.substr(n.length - 3);
            a.unshift(nn);
            n = n.substr(0, n.length - 3);
        }
        if (n.length > 0) { a.unshift(n); }
        n = a.join(delimiter);
        if (d.length < 1) { amount = n; }
        else { amount = n + '.' + d; }
        amount = minus + amount;
    }

    return amount;
}

function Clear_ddl_Global(ddlID, DefaultLabel) {
    if (DefaultLabel == null || DefaultLabel == "")
        DefaultLabel = "Select";
    $(ddlID).empty().html("<option value=''>" + DefaultLabel + "</option>");
    $(ddlID).html("<option value=''>" + DefaultLabel + "</option>");
}

function Reload_ddl_Global(xhr, ddlID, AjaxURL, AjaxData, DefaultLabel, callback) {

    if (xhr && xhr.readystate != 4) {
        xhr.abort();
    }

    $(ddlID).html("");
    $(ddlID).empty();

    if ($(ddlID).has('option').length === 0) {

        xhr = $.ajax({
            url: AjaxURL,
            traditional: true,
            cache: false,
            data: AjaxData,
            //dataType: "application/json",
            success: function (data) {
                if (data != null && data.Status == "Success") {

                    if (DefaultLabel == null || DefaultLabel == '') {
                        //$(ddlID).html("<option value=''>" + DefaultLabel + "</option>");
                    } else if(DefaultLabel=="Any"){
                        $(ddlID).html("<option value='"+ DefaultLabel +"'>" + DefaultLabel + "</option>");
                }
                else
                        {
                        $(ddlID).html("<option value=''>" + DefaultLabel + "</option>");
                    }

                    var items = eval(data.Data);
                    for (var i = 0; i < items.length; i++) {

                        if ($(ddlID + " option[value='" + items[i].Value + "']").length === 0)
                            $(ddlID).append("<option value='" + items[i].Value + "' " + (items[i].Selected == true ? "selected='selected'" : "") + ">" + items[i].Text + "</option>");
                    }

                    //$(ddlID).change(); // Fire the change event to initiate chained items.

                    if (callback && typeof (callback) === "function") {
                        callback();
                    }

                } else {

                    CustomMessage('', data.Message, "error");
                }
            }
        });
    }
    return xhr;
}


function Reload_ddl_Global_MultipleID(xhr, ddlID, AjaxURL, AjaxData, DefaultLabel, callback) {

    if (xhr && xhr.readystate != 4) {
        xhr.abort();
    }

    var ddlid = ddlID.split(',');
    console.log("ddlid", ddlid);
    console.log("ddlid1", ddlid[0]);
    //$(ddlID).html("");
    //$(ddlID).empty();
    debugger;
    if ($(ddlid[0]).has('option').length === 0) {

        xhr = $.ajax({
            url: AjaxURL,
            traditional: true,
            cache: false,
            data: AjaxData,
            //dataType: "application/json",
            success: function (data) {
                if (data != null && data.Status == "Success") {

                    for (var j = 0; j < ddlid.length; j++) {
                        $(ddlid[j]).html("");
                        $(ddlid[j]).empty();
                        if (DefaultLabel == null || DefaultLabel == '') {
                            //$(ddlID).html("<option value=''>" + DefaultLabel + "</option>");
                        } else {
                            $(ddlid[j]).html("<option value=''>" + DefaultLabel + "</option>");
                        }

                        var items = eval(data.Data);
                        for (var i = 0; i < items.length; i++) {

                            if ($(ddlid[j] + " option[value='" + items[i].Value + "']").length === 0)
                                $(ddlid[j]).append("<option value='" + items[i].Value + "' " + (items[i].Selected == true ? "selected='selected'" : "") + ">" + items[i].Text + "</option>");
                        }

                        //$(ddlID).change(); // Fire the change event to initiate chained items.


                    }

                    if (callback && typeof (callback) === "function") {
                        callback();
                    }

                } else {

                    CustomMessage('', data.Message, "error");
                }
            }
        });
    }
    return xhr;
}

function Reload_ddl_Global_Custom(xhr, ddlID, AjaxURL, AjaxData, DefaultLabel, callback) {

    if (xhr && xhr.readystate != 4) {
        xhr.abort();
    }

    $(ddlID).html("");
    $(ddlID).empty();

    if ($(ddlID).has('option').length === 0) {

        xhr = $.ajax({
            url: AjaxURL,
            traditional: true,
            cache: false,
            data: AjaxData,
            //dataType: "application/json",
            success: function (data) {
                if (data != null && data.Status == "Success") {

                    if (DefaultLabel == null || DefaultLabel == '') {
                        //$(ddlID).html("<option value=''>" + DefaultLabel + "</option>");
                    } else {
                        $(ddlID).html("<option value=''>" + DefaultLabel + "</option>");
                    }

                    var items = eval(data.Data);
                    for (var i = 0; i < items.length; i++) {

                        if ($(ddlID + " option[value='" + items[i].Value + "']").length === 0)
                            $(ddlID).append("<option data-OptionOne='" + items[i].OptionOne + "' value='" + items[i].Value + "' " + (items[i].Selected == true ? "selected='selected'" : "") + ">" + items[i].Text + "</option>");
                    }

                    //$(ddlID).change(); // Fire the change event to initiate chained items.

                    if (callback && typeof (callback) === "function") {
                        callback(items);
                    }

                } else {

                    CustomMessage('', data.Message, "error");
                }
            }
        });
    }
    return xhr;
}

function DualListBoxShiftAtoB(ddlSourseID, ddlDestinationID, IsSourseDelete) {
    var thevalue = $(ddlSourseID).val();

    if (thevalue[0] != null && thevalue[0] != "") {
        if (!(0 != $(ddlDestinationID + " option[value='" + thevalue[0] + "']").length)) {
            $(ddlDestinationID).append("<option value='" + thevalue[0] + "'>" + $(ddlSourseID + " option:selected").text() + "</option>");
            if (IsSourseDelete) $(ddlSourseID + " option[value='" + thevalue[0] + "']").remove();
        }
    }
}

function Reload_lbl_Global(xhr, lblID, AjaxURL, AjaxData, callback) {

    if (xhr && xhr.readystate != 4) {
        xhr.abort();
    }

    $(lblID).html("");
    xhr = $.ajax({
        url: AjaxURL,
        cache: false,
        data: AjaxData,
        //dataType: "application/json",
        success: function (data) {
            if (data != null && data.Status == "Success") {

                var Model = eval(data.Data);

                $(lblID).html(Model.Text);
                $(lblID).attr("data-val", Model.Value);

                if (callback && typeof (callback) === "function") {
                    callback();
                }

            } else {
                CustomMessage('', "Error occured while loading the data.", "error");
            }
        }
    });
}

function ClearTextBox(MyArray) {
    jQuery.each(MyArray, function (i, val) { try { $(val).val(""); } catch (e) { } });
}
//Ajax Helpers end

//Grid Pagination helper start
function LoadGrid(xhr, tableID, AjaxURL, AjaxData, callback) {
    if (xhr && xhr.readystate != 4)
        xhr.abort();
    var ajax = $.ajax({
        url: AjaxURL, data: AjaxData,
        beforeSend: function () {
            $("#wait").show();
        },
        success: function (data) {
            //console.log(data);
            if (data != null && data.Status == "Success") {

                var Model = eval(data.Data);
                loadTable(tableID, Model);
                if (callback && typeof (callback) === "function")
                    callback(Model);
                $("#wait").hide();
                return Model;//for some time requires
            } else
                CustomMessage('', data.Message, "error");
        },
        error: function (ex) {
            //alert("Message: " + ex);
        }
    });
    return ajax;
}
function LoadGridWithPost(xhr, tableID, AjaxURL, AjaxData, callback) {
    if (xhr && xhr.readystate != 4)
        xhr.abort();
    xhr = $.ajax({
        url: AjaxURL, data: AjaxData, type: "POST",
        success: function (data) {
            if (data != null && data.Status == "Success") {

                var Model = eval(data.Data);
                loadTable(tableID, Model);
                if (callback && typeof (callback) === "function")
                    callback(Model);
                return Model;//for some time requires
            } else
                CustomMessage('', data.Message, "error");
        },
        error: function (ex) {
            //alert("Message: " + ex);
        }
    });
}
function LoadGrid_PreCallBack(xhr, tableID, AjaxURL, AjaxData, PreCallback, callback) {
    if (xhr && xhr.readystate != 4)
        xhr.abort();
    xhr = $.ajax({
        url: AjaxURL, data: AjaxData,
        success: function (data) {
            if (data != null && data.Status == "Success") {

                var Model = eval(data.Data);
                if (PreCallback && typeof (PreCallback) === "function")
                    PreCallback(Model);

                loadTable(tableID, Model);

                if (callback && typeof (callback) === "function")
                    callback(Model);
                return Model;//for some time requires
            } else
                CustomMessage('', data.Message, "error");
        },
        error: function (ex) {
            //alert("Message: " + ex);
        }
    });
}
function Refresh_Grid_Pagination(GridId, CurrentPage, TotalPages, PageChangedCallBack) {
    var i = 0; var j = 0;
    var cList = $('#' + GridId + ' ul.pagination');
    cList.html("");

    var li, anchor;

    //First Page Link
    li = $('<li/>').addClass('paginate_button first ' + Is_First_Pagination_Link(CurrentPage)).appendTo(cList);
    anchore = $('<span/>').text("<<").attr("data-val", 1).appendTo(li);

    //Previous Page Link
    li = $('<li/>').addClass('paginate_button previous ' + Is_Previous_Pagination_Link(CurrentPage)).appendTo(cList);
    anchore = $('<span/>').text("<").attr("data-val", (CurrentPage - 1)).appendTo(li);

    for (var i = 1; i <= TotalPages; i++) {


        var li = $('<li/>').addClass('paginate_button ' + Is_Active_Pagination_Link(i, CurrentPage)).appendTo(cList);
        var anchore = $('<span/>').text(i).attr("data-val", i).appendTo(li);
        //if (CurrentPage < 4)
        //{
        //    var li = $('<li/>').addClass('paginate_button ' + Is_Previous_Pagination_Link(1)).appendTo(cList);
        //    var anchore = $('<span/>').text("...").attr("data-val", 0).appendTo(li);

        //    var li = $('<li/>').addClass('paginate_button ' + Is_Previous_Pagination_Link(1)).appendTo(cList);
        //    var anchore = $('<span/>').text(TotalPages).attr("data-val", TotalPages).appendTo(li);
        //    break;
        //}

        //j++;

    }

    //Next Page Link
    li = $('<li/>').addClass('paginate_button next ' + Is_Next_Pagination_Link(CurrentPage, TotalPages)).appendTo(cList);
    anchore = $('<span/>').text(">").attr("data-val", (CurrentPage + 1)).appendTo(li);


    //Last Page Link
    li = $('<li/>').addClass('paginate_button last ' + Is_Last_Pagination_Link(CurrentPage, TotalPages)).appendTo(cList);
    anchore = $('<span/>').text(">>").attr("data-val", TotalPages).appendTo(li);


    //Bind pagination click event

    cList.find("li span").unbind("click");
    cList.find("li span").bind("click", function () {

        if (!$(this).parent("li").hasClass("disabled") && !$(this).parent("li").hasClass("active")) {

            GlobalCurrentPage = $(this).attr("data-val");

            if (PageChangedCallBack && typeof (PageChangedCallBack) === "function") {
                PageChangedCallBack();
            }
        }

    });

}

function Clear_Form_Fields(formId) {

    try {
        $(formId + ' input[type="text"]').each(function () {
            $(this).val("");
        });
    } catch (e) { }

    try {
        $(formId + ' input[type="date"]').each(function () {
            $(this).val("");
        });
    } catch (e) { }

    try {
        $(formId + ' input[type="password"]').each(function () {
            $(this).val("");
        });
    } catch (e) { }

    try {
        $(formId + ' input[type="hidden"]').each(function () {
            $(this).val("");
        });
    } catch (e) { }
    try {
        $(formId + ' input[type="file"]').each(function () {
            $(this).val("");
        });
    } catch (e) { }

    try {
        $(formId + ' textarea').each(function () {
            $(this).val("");
        });
    } catch (e) { }

    try {
        $(formId + ' input[type="radio"]').each(function () {
            $("#" + $(this).attr('id')).prop('checked', false);
        });
    } catch (e) { }

    try {
        $(formId + ' input[type="checkbox"]').each(function () {
            $("#" + $(this).attr('id')).prop('checked', false);
        });
    } catch (e) {
        //alert(e);
    }


    try {
        $(formId + ' input[type="email"]').each(function () {
            $(this).val("");
        });
    } catch (e) { }

    try {
        $(formId + ' select').each(function () {

            //  $("#" + $(this)).find('option:first').attr('selected', 'selected').removeAttr("selected");

            $("#" + $(this).attr('id') + "option:selected").removeAttr("selected");
            $("#" + $(this).attr('id')).prop('selectedIndex', 0);
            //Clear_ddl_Global($(this).attr('id'), "");
        });
    } catch (e) {
    }
    try {
        $(formId + 'select').each(function () {

            //  $("#" + $(this)).find('option:first').attr('selected', 'selected').removeAttr("selected");

            $("#" + $(this).attr('id') + "option:selected").removeAttr("selected");
            $("#" + $(this).attr('id')).prop('selectedIndex', 0);
            //Clear_ddl_Global($(this).attr('id'), "");
        });
    } catch (e) {
    }
    //try {
    //    $(formId + ' input[type="time"]').each(function () {
    //        $(this).val("");
    //    });
    //} catch (e) { }

}

function Is_First_Pagination_Link(CurrentPage) {
    if (CurrentPage == 1) {
        return "disabled";
    }
    else {
        return '';
    }
}

function Is_Previous_Pagination_Link(CurrentPage) {
    if (CurrentPage == 1) {
        return "disabled";
    }
    else {
        return '';
    }
}

function Is_Active_Pagination_Link(iterationId, CurrentPage) {
    if (iterationId == CurrentPage) {
        return "active";
    }
    else {
        return '';
    }
}

function Is_Next_Pagination_Link(CurrentPage, TotalPages) {
    if (CurrentPage >= TotalPages) {
        return "disabled";
    }
    else {
        return '';
    }
}

function Is_Last_Pagination_Link(CurrentPage, TotalPages) {
    if (CurrentPage >= TotalPages) {
        return "disabled";
    }
    else {
        return '';
    }
}

// table sortable
function Bind_Grid_Sortable_Fields(callback) {

    $("th.sortable").click(function () {

        var CurrentStatusIsASC = $(this).hasClass("sorting_asc");

        $("th.sortable").removeClass("sorting_asc").removeClass("sorting_desc").addClass("sorting");

        GlobalSortBy = $(this).attr("data-sortby");
        GlobalSortOrder = CurrentStatusIsASC ? "desc" : "asc";

        $(this).addClass(CurrentStatusIsASC ? "sorting_desc" : "sorting_asc").removeClass("sorting");

        if (callback && typeof (callback) === "function") {
            callback();
        }
    });
}

function Bind_Grid_Sortable_FieldsForAll(tableID, SortBy, SortOrder, callback) {

    $("" + tableID + " th.sortable").click(function () {

        var CurrentStatusIsASC = $(this).hasClass("sorting_asc");

        $("" + tableID + " th.sortable").removeClass("sorting_asc").removeClass("sorting_desc").addClass("sorting");

        $("" + SortBy).val($(this).attr("data-sortby"));
        $("" + SortOrder).val(CurrentStatusIsASC ? "desc" : "asc");

        $(this).addClass(CurrentStatusIsASC ? "sorting_desc" : "sorting_asc").removeClass("sorting");

        if (callback && typeof (callback) === "function") {
            callback();
        }
    });
}

function Bind_Grid_Sortable_Fields2(callback) {

    $("th.sortable").click(function () {

        var CurrentStatusIsASC = $(this).hasClass("sorting_asc");

        $("th.sortable").removeClass("sorting_asc").removeClass("sorting_desc").addClass("sorting");

        GlobalSortByLocation = $(this).attr("data-sortby");
        GlobalSortOrderLocation = CurrentStatusIsASC ? "desc" : "asc";

        $(this).addClass(CurrentStatusIsASC ? "sorting_desc" : "sorting_asc").removeClass("sorting");

        if (callback && typeof (callback) === "function") {
            callback();
        }
    });
}

function Bind_Grid_Sortable_Fields2(callback, GlobalSortBy2, GlobalSortOrder2) {

    $("th.sortable").click(function () {

        var CurrentStatusIsASC = $(this).hasClass("sorting_asc");

        $("th.sortable").removeClass("sorting_asc").removeClass("sorting_desc").addClass("sorting");

        $(GlobalSortBy2).val($(this).attr("data-sortby"));
        $(GlobalSortOrder2).val(CurrentStatusIsASC ? "desc" : "asc");

        $(this).addClass(CurrentStatusIsASC ? "sorting_desc" : "sorting_asc").removeClass("sorting");

        if (callback && typeof (callback) === "function") {
            callback();
        }
    });
}

function Bind_Grid_Sortable_Fields3(callback) {

    $("th.sortable").click(function () {

        var CurrentStatusIsASC = $(this).hasClass("sorting_asc");

        $("th.sortable").removeClass("sorting_asc").removeClass("sorting_desc").addClass("sorting");
        GlobalSortByPriorAttempt = $(this).attr("data-sortby");
        GlobalSortOrderPriorAttempt = CurrentStatusIsASC ? "desc" : "asc";

        $(this).addClass(CurrentStatusIsASC ? "sorting_desc" : "sorting_asc").removeClass("sorting");

        if (callback && typeof (callback) === "function") {
            callback();
        }
    });
}
//Grid Pagination helper end

//Global Validators start
function Validate_Control_NullBlank(ControlId, FieldValue, ErrorMessage, valid) {
    $(".error-msg").show();
    if ($.trim(FieldValue) == null || $.trim(FieldValue) == '' || $.trim(FieldValue) == ',') {
        //$(ControlId).parent().addClass("has-error");
        $(ControlId).addClass("error_border");
        //$(".form-control").siblings("p").addClass("error_msg");
        $(ControlId).parent().find("p").addClass("error-msg").html(ErrorMessage);
        valid = false;
    }
    else {
        $(ControlId).removeClass("error_border");
    }

    return valid;
}
function Validate_Control_NullBlankByParent(ControlId, FieldValue, ErrorMessage, valid) {
    $(".error-msg").show();
    if ($.trim(FieldValue) == null || $.trim(FieldValue) == '' || $.trim(FieldValue) == ',') {
        //$(ControlId).parent().addClass("has-error");
        $(ControlId).addClass("error_border");
        //$(".form-control").siblings("p").addClass("error_msg");
        $(ControlId).parent().parent().find("p").addClass("error-msg").html(ErrorMessage);
        valid = false;
    }

    return valid;
}
function Validate_Control_ComparePassword(ControlId, CompareFromControlId, ErrorMessage, valid) {
    if ($.trim($(ControlId).val()) != $(CompareFromControlId).val()) {
        $(ControlId).parent().addClass("has-error");
        $(ControlId).parent().find("p").html(ErrorMessage);
        valid = false;
    }
    return valid;
}
function Validate_Control_CompareNumber(ControlId, CompareFromControlId, ErrorMessage, valid) {
    if ($.trim($(ControlId).val()) === $(CompareFromControlId).val()) {
        $(ControlId).parent().addClass("has-error");
        $(ControlId).parent().find("p").html(ErrorMessage);
        valid = false;
    }
    return valid;
}
function Validate_Control_ComparePasswordAll(ControlId, CompareFromControlId, CompareFromControlIdFrom, ErrorMessage, valid) {
    if (($.trim($(ControlId).val()) == $(CompareFromControlId).val()) && ($.trim($(ControlId).val()) == $(CompareFromControlIdFrom).val()) && ($.trim($(CompareFromControlId).val()) == $(CompareFromControlIdFrom).val())) {
        $(ControlId).parent().addClass("has-error");
        $(ControlId).parent().find("p").html(ErrorMessage);
        valid = false;
    }
    return valid;
}

function Validate_Control_CompareMinMaxInteger(ControlIdMin, ControlIdMax, CompareFromControlId, CompareToControlId, ErrorMessage, valid) {
    if (($.trim(CompareFromControlId) != null || $.trim(CompareFromControlId) != '') && ((CompareToControlId) != null || $.trim(CompareToControlId) != '')) {
        if (eval(CompareFromControlId) > eval(CompareToControlId)) {
            $(ControlIdMin).parent().addClass("has-error");
            //$(ControlIdMin).parent().parent().find("p").html(ErrorMessage);
            $('#CompairMinMaxhelp-block').html(ErrorMessage);
            $('#CompairMinMaxhelp-block').parent().addClass("has-error");
            valid = false;
        }
    }

    return valid;
}

function Validate_Control_CompareMaxMinInteger(ControlIdMin, ControlIdMax, CompareFromControlId, CompareToControlId, ErrorMessage, valid) {
    if (($.trim(CompareFromControlId) != null || $.trim(CompareFromControlId) != '') && ((CompareToControlId) != null || $.trim(CompareToControlId) != '')) {
        if (eval(CompareFromControlId) < eval(CompareToControlId)) {
            $(ControlIdMin).parent().addClass("has-error");
            //$(ControlIdMin).parent().parent().find("p").html(ErrorMessage);
            $('#CompairMinMaxhelp-block').html(ErrorMessage);
            $('#CompairMinMaxhelp-block').parent().addClass("has-error");
            valid = false;
        }
    }

    return valid;
}

function Validate_Control_NumericOnly(ControlId, FieldValue, ErrorMessage, valid) {
    //if ($.isNumeric(FieldValue) != true || FieldValue.indexOf(".") == 0 || (FieldValue.indexOf(".") + 1) == FieldValue.length) {
    //    $(ControlId).parent().addClass("has-error");
    //    $(ControlId).parent().find("p").html(ErrorMessage);
    //    valid = false;
    //}
    //Write code with RegX - Change RegX
    if (FieldValue.trim() != null && FieldValue.trim() != '') {
        if (/(^\d{5}$)|(^\d{5}-\d{4}$)/.test(FieldValue) != true) {
            $(ControlId).parent().addClass("has-error");
            $(ControlId).parent().find("p").html(ErrorMessage);
            valid = false;
        }
    }
    return valid;
}

function Validate_Control_NumericOrFloat(ControlId, FieldValue, ErrorMessage, valid) {
    //Write code with RegX - Change RegX
    if (FieldValue.trim() != null && FieldValue.trim() != '') {
        if (/^[+-]?\d+(\.\d+)?$/.test(FieldValue) != true) {
            $(ControlId).parent().addClass("has-error");
            $(ControlId).parent().find("p").html(ErrorMessage);
            valid = false;
        }
    }

    return valid;
}

function Validate_Control_US_Zip(ControlId, FieldValue, ErrorMessage, valid) {
    if (FieldValue.trim() != null && FieldValue.trim() != '') {
        if (/(^\d{5}$)|(^\d{5}-\d{4}$)/.test(FieldValue) != true) {
            $(ControlId).parent().addClass("has-error");
            $(ControlId).parent().find("p").html(ErrorMessage);
            valid = false;
        }
    }
    return valid;
}

function Validate_Control_US_Phone(ControlId, FieldValue, ErrorMessage, valid) {
    if (FieldValue.trim() != null && FieldValue.trim() != '') {
        if (/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/.test(FieldValue) != true) {
            $(ControlId).parent().addClass("has-error");
            $(ControlId).parent().find("p").html(ErrorMessage);
            valid = false;
        }
    }
    return valid;
}

function Validate_Control_Email(ControlId, FieldValue, ErrorMessage, valid) {
    var email_Regx = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    if (FieldValue.trim() != null && FieldValue.trim() != '') {
        if (email_Regx.test(FieldValue) != true) {
            $(ControlId).parent().addClass("has-error");
            $(ControlId).parent().find("p").html(ErrorMessage);
            $(ControlId).addClass("error_border");
            $(ControlId).parent().find("p").addClass("error-msg").html(ErrorMessage);
            valid = false;
        }
    }
    return valid;
}

function Validate_Control_DateDDMMYYYY(ControlId, FieldValue, ErrorMessage, valid) {
    var email_Regx = /^(?=\d)(?:(?:31(?!.(?:0?[2469]|11))|(?:30|29)(?!.0?2)|29(?=.0?2.(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(?:\x20|$))|(?:2[0-8]|1\d|0?[1-9]))([-.\/])(?:1[012]|0?[1-9])\1(?:1[6-9]|[2-9]\d)?\d\d(?:(?=\x20\d)\x20|$))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\x20[AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/;

    if (FieldValue.trim() != null && FieldValue.trim() != '') {
        if (email_Regx.test(FieldValue) != true) {
            $(ControlId).parent().addClass("has-error");
            $(ControlId).parent().find("p").html(ErrorMessage);
            valid = false;
        }
    }

    return valid;
}

$(document).ready(function () {
    //Bind the US phone formatter

    $("input[data-format='USphone']").change(function () {
        var FieldValue = $(this).val();
        var phoneRegex = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;

        if (phoneRegex.test(FieldValue) == true) {
            var formattedPhoneNumber = FieldValue.replace(phoneRegex, "($1) $2-$3");
            $(this).val(formattedPhoneNumber);

            $(this).parent().removeClass("has-error");
            $(this).parent().find("p").html("");
        }
    });

    $("input[data-format='USZip']").change(function () {
        var FieldValue = $(this).val();
        var ZipRegex = /(^\d{5}$)|(^\d{5}-\d{4}$)/;

        if (ZipRegex.test(FieldValue) == true) {
            $(this).parent().removeClass("has-error");
            $(this).parent().find("p").html("");
        }
    });
});

function Validate_Control_MaxLengthString(ControlId, FieldValue, MaxLength, ErrorMessage, valid) {
    if (FieldValue != null && FieldValue != '' && FieldValue.length > MaxLength) {
        $(ControlId).parent().addClass("has-error");
        $(ControlId).parent().find("p").html(ErrorMessage);
        valid = false;
    }
    return valid;
}

function Validate_Control_MaxLengthNumeric(ControlId, FieldValue, MaxLength, ErrorMessage, valid) {

    if (FieldValue != null && FieldValue != '' && $.isNumeric(FieldValue) == true && (FieldValue.toString().split('.')[0]).length > MaxLength) {
        $(ControlId).parent().addClass("has-error");
        $(ControlId).parent().find("p").html(ErrorMessage);
        valid = false;
    }

    return valid;
}
function Validate_Control_MaxLengthNum(ControlId, FieldValue, MaxLength, ErrorMessage, valid) {

    if (FieldValue != null && FieldValue != '' && $.isNumeric(FieldValue) == true && (FieldValue.toString().length > MaxLength)) {
        $(ControlId).parent().addClass("has-error");
        $(ControlId).parent().find("p").html(ErrorMessage);
        valid = false;
    }

    return valid;
}

function Validate_Control_MinMaxLengthNum(ControlId, FieldValue, MinLength, MaxLength, ErrorMessage, valid) {

    if (FieldValue != null && FieldValue != '' && $.isNumeric(FieldValue) == true && (FieldValue.toString().trim().length > MaxLength) && (FieldValue.toString().trim().length < MinLength)) {
        $(ControlId).parent().addClass("has-error");
        $(ControlId).parent().find("p").html(ErrorMessage);
        valid = false;
    }

    return valid;
}

function Validate_Control_MinMaxValue(ControlId, FieldValue, MinValue, MaxValue, ErrorMessage, valid) {

    if ($.isNumeric(FieldValue) == false || ((FieldValue > MaxValue) || (FieldValue < MinValue))) {
        $(ControlId).parent().addClass("has-error");
        $(ControlId).parent().find("p").html(ErrorMessage);
        valid = false;
    }

    return valid;
}

function Validate_Control_MaxLengthDecimalPoint(ControlId, FieldValue, MaxLengthBeforeDecimal, MaxLengthAfterDecimal, ErrorMessage, valid) {

    if (FieldValue != null && FieldValue != '') {
        if ($.isNumeric(FieldValue) != true) {
            $(ControlId).parent().addClass("has-error");
            $(ControlId).parent().find("p").html(ErrorMessage);
            valid = false;
        }
        else {
            if (FieldValue.indexOf(".") >= 0) {
                var LL = (FieldValue.toString().split('.')[0]).length;
                var RL = (FieldValue.toString().split('.')[1]).length;
                if (LL == 0 || RL == 0 || LL > MaxLengthBeforeDecimal || RL > MaxLengthAfterDecimal) {
                    $(ControlId).parent().addClass("has-error");
                    $(ControlId).parent().find("p").html(ErrorMessage);
                    valid = false;
                }
            }
        }
    }

    return valid;
}

//Global Validators end

//jAlert start

function jAlert(msg, title, theme) {
    $.jAlert({
        //'title': ((title == null || title == '') ? "Message" : title),
        'content': msg,
        'theme': ((theme == null || theme == '') ? "default" : title),
        'btns': { 'text': 'Ok', 'theme': 'green' }
    });
}

//General Helper Functions

function CSVToArray(strData, strDelimiter) {

    strDelimiter = (strDelimiter || ",");

    // Create a regular expression to parse the CSV values.
    var objPattern = new RegExp(
        (
            // Delimiters.
            "(\\" + strDelimiter + "|\\r?\\n|\\r|^)" +

            // Quoted fields.
            "(?:\"([^\"]*(?:\"\"[^\"]*)*)\"|" +

            // Standard fields.
            "([^\"\\" + strDelimiter + "\\r\\n]*))"
        ),
        "gi"
    );

    var arrData = [[]];
    var arrMatches = null;

    while (arrMatches = objPattern.exec(strData)) {

        // Get the delimiter that was found.
        var strMatchedDelimiter = arrMatches[1];
        if (
            strMatchedDelimiter.length &&
            strMatchedDelimiter !== strDelimiter
        ) {

            arrData.push([]);
        }

        var strMatchedValue;

        if (arrMatches[2]) {

            strMatchedValue = arrMatches[2].replace(
                new RegExp("\"\"", "g"),
                "\""
            );

        } else {
            strMatchedValue = arrMatches[3];
        }
        arrData[arrData.length - 1].push(strMatchedValue);
    }

    return (arrData);
}

function MonthIncrement() {

    if (latest_Month < 12) {
        latest_Month += 1;
    }
    else {
        latest_Year += 1;
        latest_Month = 1;
    }
}

function MonthDecrement() {

    if (latest_Month > 1) {
        latest_Month -= 1;
    }
    else {
        latest_Year -= 1;
        latest_Month = 12;
    }
}

var Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

function GetMonthName(MonthValue) {
    return Months[MonthValue - 1];
}

function DataArrayToViewModel(DataArray, FCVariableId, AppLevelId, CatId, SingleOrDouble, RECTypeId) {

    var ViewModel = { FCVariableId: FCVariableId, ApplicableLevelId: AppLevelId, CategoryId: CatId, SingleOrDoubleValue: SingleOrDouble, RECTypeId: RECTypeId, MonthRows: null };


    var MonthRows = new Array();

    $.each(DataArray, function (i, iRow) {

        var RowItem = {};
        RowItem.CurveData = new Array();

        $.each(Object.keys(iRow), function (j, jKey) {

            if (jKey.match("^CurveData") && iRow[jKey] != null && iRow[jKey] != undefined) {

                var CurveDataItem = {};

                CurveDataItem.PKValue = parseFloat(iRow[jKey].PKValue);
                CurveDataItem.DataVal1 = parseFloat(iRow[jKey].DataVal1);
                if (SingleOrDouble == FCSingleOrDoubleValue.Double.value) {
                    CurveDataItem.DataVal2 = parseFloat(iRow[jKey].DataVal2);
                }

                RowItem.CurveData.push(CurveDataItem);
            }
            else if (jKey == 'MonthValue') {
                RowItem.MonthValue = iRow[jKey];
            }
            else if (jKey == 'YearValue') {
                RowItem.YearValue = iRow[jKey];
            }
        });

        MonthRows.push(RowItem);
    });

    ViewModel.MonthRows = MonthRows;

    return ViewModel;

}

function ViewModelToDataArray(ViewModel, FKArray) {

    var DataArray = new Array();

    $.each(ViewModel, function (i, iRow) {

        var RowItem = {};
        RowItem.MonthValue = latest_Month = iRow.MonthValue;
        RowItem.YearValue = latest_Year = iRow.YearValue;
        RowItem.MonthYearLabel = GetMonthName(iRow.MonthValue) + ' ' + iRow.YearValue;

        MonthIncrement();


        //var RowArray = new Array();
        $.each(FKArray, function (k, kValue) {

            RowItem["CurveData[" + k + "]"] = {};
            RowItem["CurveData[" + k + "]"].PKValue = kValue; //jCurve.PKValue;
            RowItem["CurveData[" + k + "]"].DataVal1 = null;
            RowItem["CurveData[" + k + "]"].DataVal2 = null;

            $.each(iRow.CurveData, function (j, jCurve) {
                if (jCurve.PKValue == kValue) {
                    RowItem["CurveData[" + k + "]"].DataVal1 = jCurve.DataVal1;
                    RowItem["CurveData[" + k + "]"].DataVal2 = jCurve.DataVal2;
                }
            });
        });



        DataArray.push(RowItem);
    });

    return DataArray;
}

function ScreenLock() {
    $("#overlay").show();
    //console.log("screen locked");
}
function ScreenUnlock() {
    $("#overlay").hide();
    //console.log("screen unlocked");
}

$(document).ajaxStart(function () {
    ScreenLock();
});
$(document).ajaxComplete(function () {
    ScreenUnlock();
});

function SmoothScroll(controlId) {
    $('html, body').stop().animate({ 'scrollTop': $(controlId).offset().top }, 900, 'swing', function () { });
}

function CallInternalURL(url) {
    $("#frm").attr("src", url);
}

function OpenURLtoNewTab(url) {
    //var form = document.createElement("form");
    //form.method = "GET";
    //form.action = url;
    //form.target = "_blank";
    //document.body.appendChild(form);
    //form.submit();

    window.open(url, '_blank')
}
Date.prototype.toShortFormat = function () {

    var month_names = ["Jan", "Feb", "Mar",
        "Apr", "May", "Jun",
        "Jul", "Aug", "Sep",
        "Oct", "Nov", "Dec"];

    var day = this.getDate();
    var month_index = this.getMonth();
    var year = this.getFullYear();

    return "" + day + "-" + month_names[month_index] + "-" + year;
};
Date.prototype.mmddyyyy = function () {
    var yyyy = this.getFullYear().toString();
    var mm = (this.getMonth() + 1).toString(); // getMonth() is zero-based
    var dd = this.getDate().toString();
    return (mm[1] ? mm : "0" + mm[0]) + "/" + (dd[1] ? dd : "0" + dd[0]) + "/" + yyyy; // padding
};

function numberWithCommas(x) {
    //if ((x || '').toString().indexOf('0.') == 0)
    //    return (x || '').toString();

    var a = (x || '').toString().split('.');

    var result = a[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");

    if (a[1] != null && a[1] != undefined) {
        result += '.' + a[1];
    }

    return result;
}

function ExportToExcel(tableName, type) {
    $(tableName).tableExport({ type: type, escape: 'false' });
}

function SetSelectedListBox(ControlID) {

    //$options = $("" + ControlID + " option");
    //$options.prop('selected', true);

    $("" + ControlID + " option").each(function () {
        $(this).prop('selected', true);
    });
}

function SetValueToListBox(ControlID, strlist) {

    var selectValues = strlist; //default support comma
    $options = $("" + ControlID + " option"); // options cached here to avoid overhead of fetching inside loop

    // run the loop only for the given values
    for (var i = 0; i < strlist.length; i++) {
        // filter the options with the specific value and select them
        $options.filter('[value="' + strlist[i] + '"]').prop('selected', true);
    }
}

function SetValueToListBoxType(ControlID, strlist, splitChar) {
    try {

        var TypeIDs = strlist.split(splitChar);
        $options = $("" + ControlID + " option"); // options cached here to avoid overhead of fetching inside loop

        // run the loop only for the given values
        for (var i = 0; i < TypeIDs.length; i++) {
            // filter the options with the specific value and select them
            $options.filter('[value="' + TypeIDs[i] + '"]').prop('selected', true);
        }

    } catch (e) {
    }
}

function GetValueToListBoxSelected(ControlID) {
    var returnVal = "";

    $(ControlID + " :selected").each(function (i, selected) {
        returnVal += $(selected).val().toString() + ",";
    });

    return returnVal;
}

function GetValueToListBoxNotSelected(ControlID) {
    var returnVal = '';

    var iddeStatus = $(ControlID).val();
    if ((iddeStatus != null) || (iddeStatus != "")) {
        var unSelected = $(ControlID).find('option').not(':selected');
        for (var i = 0; i < unSelected.length; i++) {
            returnVal += unSelected[i].value + ',';
        }

    } else {
        //alert('else part')
    }

    return returnVal;
}

function GetValueToListBox(ControlID) {
    var returnVal = "";

    $(ControlID + " option").each(function () {
        returnVal += $(this).val().toString() + ",";
    });

    return returnVal;
}

function GetValueToListBoxSelectedCompanyType(ControlID) {
    return GetValueToListBoxSelectedType();
}

function GetValueToListBoxSelectedType(ControlID) {

    var returnVal = "";

    $(ControlID + " :selected").each(function (i, selected) {
        returnVal += $(selected).val().toString() + "#";
    });

    return returnVal;
}

function checkSubmit(e, submitBtnID) {

    $(document).ready(function () {
        if (e && e.keyCode == 13) {
            $(submitBtnID).click();
            //document.forms[0].submit();
        }

    });
}

function Checkddmmyyyy(value) {
    var date = value.split("-");
    var d = parseInt(date[0], 10),
        m = parseInt(date[1], 10),
        y = parseInt(date[2], 10);
    return new Date(y, m - 1, d);
}

function GetTimeInto24Hour(value) {

    //http://stackoverflow.com/questions/15083548/convert-12-hour-hhmm-am-pm-to-24-hour-hhmm

    var time = value.trim();
    var hours = Number(time.match(/^(\d+)/)[1]);
    var minutes = Number(time.match(/:(\d+)/)[1]);
    var AMPM = time.match(/\s(.*)$/)[1];
    if (AMPM == "PM" && hours < 12) hours = hours + 12;
    if (AMPM == "AM" && hours == 12) hours = hours - 12;
    var sHours = hours.toString();
    var sMinutes = minutes.toString();
    if (hours < 10) sHours = "0" + sHours;
    if (minutes < 10) sMinutes = "0" + sMinutes;
    return (sHours + ":" + sMinutes);
}

function GetScreenAccessPermissions(ScreenID) {
    //no such array
    if (!(userScreenInfo.length > 0))
        return;
    var finalArray = [];
    //search array for key
    for (var i = 0; i < userScreenInfo.length; ++i) {
        //if the ScreenID is what we are looking for return it
        if (userScreenInfo[i].ScreenID === ScreenID) {
            finalArray.push(userScreenInfo[i]);
            if (userScreenActionInfo.length > 0 && userScreenActionInfo != null) {
                for (var j = 0; j < userScreenActionInfo.length; ++j) {
                    if (userScreenActionInfo[j].ScreenID === ScreenID) {
                        //$.extend(userScreenInfo[i], userScreenActionInfo[j]);
                        finalArray.push(userScreenActionInfo[j]);
                        //return finalArray;
                    }
                }
                return finalArray;
            }
            else {
                return finalArray;
            }
        }
    }
}

function AllowOnlyNumberOrDecimalValue(MyID) {
    $(MyID).on("input", function (evt) {
        var self = $(this);
        self.val(self.val().replace(/[^0-9\.]/g, ''));
        if ((evt.which != 46 || self.val().indexOf('.') != -1) && (evt.which < 48 || evt.which > 57)) {
            evt.preventDefault();
        }
    });
}

function AllowOnlyNumberValue(MyID) {
    $(MyID).on("input", function (evt) {
        var self = $(this);
        self.val(self.val().replace(/\D/g, ''));
        if ((evt.which != 46 || self.val().indexOf('.') != -1) && (evt.which < 48 || evt.which > 57)) {
            evt.preventDefault();
        }
    });
}

//add days,months in date
Date.isLeapYear = function (year) {
    return (((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0));
};

Date.getDaysInMonth = function (year, month) {
    return [31, (Date.isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month];
};

Date.prototype.isLeapYear = function () {
    return Date.isLeapYear(this.getFullYear());
};

Date.prototype.getDaysInMonth = function () {
    return Date.getDaysInMonth(this.getFullYear(), this.getMonth());
};

Date.prototype.addMonths = function (value) {
    var n = this.getDate();
    this.setDate(1);
    this.setMonth(this.getMonth() + value);
    this.setDate(Math.min(n, this.getDaysInMonth()));
    return this;
};

Date.prototype.addDays = function (days) {
    var dat = new Date(this.valueOf());
    dat.setDate(dat.getDate() + days);
    return dat;
}

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    month = GetMonthShortName(month);
    //if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [day, month, year].join('-');
}

var Month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

function GetMonthShortName(MonthValue) {
    return Month[MonthValue - 1];
}
function BindClientSideData(tableID, model) {
    //JSON data format
    var emps = [
        { RoleID: 1, Name: "John", UserId: 1 },
        { RoleID: 2, Name: "Matthew", UserId: 1 },
        { RoleID: 3, Name: "Emma", UserId: 1 },
        { RoleID: 4, Name: "Sid", UserId: 1 },
        { RoleID: 5, Name: "Tom", UserId: 1 }
    ];
    $('#tblGrid tr:gt(0)').remove();
    $("#tblGrid tbody").append($("#Grid_Data_Template_tblGrid").tmpl(emps));
}
//Bind grid
function loadTable(tableID, model) {
    if ($.fn.DataTable.isDataTable("#" + tableID))
        $("#" + tableID).DataTable().destroy();
    $('#' + tableID + ' tr:gt(0)').remove();
    $('#' + tableID + ' tbody').append($('#Grid_Data_Template_' + tableID).tmpl(model));

}

function FocusOnError(FormID, valid) {
    if (!valid) {
        SmoothScroll(FormID + " .has-error:first");
        $(FormID + " .has-error .form-control:first").focus();
    }
}

function Reset_Form_Errors() {
    $(".form-group").removeClass("error_border");
    $(".form-group p").html("");
}

function Reset_Errors() {
    $(".form-control").removeClass("error_border");
    $(".form-control").parent().find("p").html("");
    $(".form-control").parent().parent().find("p").html("");
    $(".error-msg").hide();
    $('.select2-container').find('.select2-selection--multiple').removeClass("error_border");

    //$(".form-control").siblings("p").removeClass("error-msg");
}

function GetAddButton(divID, action, btnName) {
    var icon = "";
    var btnColor = "";
    var btnClass = "";
    if (divID == "submit") {
        icon = " ";
        btnColor = " ";
        btnClass = "submit ";
    }
    else if (divID == "reject") {
        icon = "icofont icofont-ban ";
        btnColor = "danger";
        btnClass = "reject ";
    }
    else if (divID == "ReOpen") {
        icon = "icofont icofont-refresh ";
        btnColor = "warning";
        btnClass = "reopen ";

    }
    else if (divID == "Revise") {
        icon = "icofont icofont-reply ";
        btnColor = "warning";
        btnClass = "revise ";
    }
    else if (divID == "BlackList") {
        icon = " ";
        btnColor = " ";
        btnClass = "suspend";
    }
    else if (divID == "Hold") {
        icon = "icofont icofont-reply ";
        btnColor = "warning";
        btnClass = "hold ";
    }
    else if (divID == "Delete") {
        icon = " ";
        btnColor = " ";
        btnClass = "btn btn-danger waves-effect waves-light";
    }
    else if (divID == "Save") {
        icon = " ";
        btnColor = " ";
        btnClass = "btn btn_top";
    }
    else {
        icon = "icofont icofont-thumbs-down ";
        btnColor = "danger";
        btnClass = "suspend ";

    }
    // return $(divID).html('<i onclick=' + action + ' style="cursor:pointer; margin-top: 5px;" class="fa fa-plus-circle fa-2x hvr-shrink"></i>');
    //return $('#' + divID).html('<button id="btn' + divID + '" data-key="submit" type="button" style="float:left; margin-right:5px; " class="alpaca-form-button alpaca-form-button-submit' + btnClass + ' btn btn-' + btnColor + '" onclick=' + action + '><span class="' + icon + '"></span>' + "  " + btnName + '<i class="fa fa-angle-double-right"></i></button>');

    return $('#' + divID).html('<button id="btn' + divID + '" data-key="submit" type="button" style="float:left; margin-right:5px; " class="' + btnClass + ' btn " onclick=' + action + '>' + "  " + btnName + '</button>');
}

function GetExportButton(divID, buttonID, tableName, type) {
    var method = "onclick='ExportToExcel(" + tableName + "," + type + ");'";
    return $(divID).html("<a id=" + buttonID + " href='#' style='margin-right: 9px !important;color:#FFF;' class='dt-button buttons-excel' tabindex='0' aria-controls='dynamic-table' " + method + "><i style='font-size: 20px !important;' class='fa fa-file-excel-o bigger-110' title='Export to " + type + "'></i> <span class='hidden'>Export to " + type + "</span></a>");

}

//Load add/update partial view
function LoadAddUpdateView(divID, AjaxURL, callback) {
    $.ajax({
        url: AjaxURL,
        contentType: 'application/html; charset=utf-8',
        type: 'GET',
        dataType: 'html',
        success: function (data) {
            $(divID).html(data);//.show().find(".panel-heading span").html(panelTitle);
            //SmoothScroll(divID);
            if (callback && typeof (callback) === "function")
                callback();
        }
    });
}

function LoadAddUpdateViewWithData(divID, AjaxURL, AjaxData, callback) {
    $.ajax({
        url: AjaxURL,
        data: AjaxData,
        contentType: 'application/html; charset=utf-8',
        type: 'GET',
        dataType: 'html',
        success: function (data) {
            $(divID).html(data);//.show().find(".panel-heading span").html(panelTitle);
            //SmoothScroll(divID);
            if (callback && typeof (callback) === "function")
                callback();
        }
    });
}

function GetDate(jsonDate) {
    if (jsonDate != null) {
        var month_names = ["Jan", "Feb", "Mar",
            "Apr", "May", "Jun",
            "Jul", "Aug", "Sep",
            "Oct", "Nov", "Dec"];
        var date = new Date(parseInt(jsonDate.substr(6)));
        var month = date.getMonth();// ('0' + (date.getMonth() + 1)).slice(-2);

        var d = ('0' + (date.getDate())).slice(-2);
        dt = d + "-" + month_names[month] + "-" + date.getFullYear();
        return dt;
    }
    else {
        return ' ';
    }

}

function GetMonth(jsonDate) {
    if (jsonDate != null) {
        var month_names = ["Jan", "Feb", "Mar",
            "Apr", "May", "Jun",
            "Jul", "Aug", "Sep",
            "Oct", "Nov", "Dec"];
        var date = new Date(parseInt(jsonDate.substr(6)));
        var month = date.getMonth();// ('0' + (date.getMonth() + 1)).slice(-2);
        //var d = ('0' + (date.getDate())).slice(-2);
        dt = month_names[month] + "-" + date.getFullYear();
        return dt;
    }
    else {
        return ' ';
    }

}

//function GetMonth(jsonDate) {
//    if (jsonDate != null) {
//        var month_names = [01, 02, 03,
//            04, 05, 06,
//           07, 08, 09,
//           10, 11, 12];
//       // var date = new Date();
//       //var month = date.getMonth();
//       // var m = ('0' + (date.getMonth() + 1)).slice(-2);
//       // mn = month_names[month];
//       // console.log(mn);
//        var currentDate = new Date();
//        var twoDigitMonth = ((currentDate.getMonth() + 1) >= 10) ? (currentDate.getMonth() + 1) : '0' + (currentDate.getMonth() + 1);  
//               return twoDigitMonth;
//    }
//    else {
//        return '';
//    }

//}

function GetDateTime(jsonDate) {
    var date = new Date(parseInt(jsonDate.substr(6)));
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var d = ('0' + (date.getDate())).slice(-2);
    var H = ('0' + (date.getHours())).slice(-2);
    var M = ('0' + (date.getMinutes())).slice(-2);
    var S = ('0' + (date.getSeconds())).slice(-2);
    dt = date.getFullYear() + "-" + (month) + "-" + (d) + "T" + H + ":" + M;
    return dt;
}
function GetDateMaster(jsonDate) {
    var date = new Date(parseInt(jsonDate.substr(6)));
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var d = ('0' + (date.getDate())).slice(-2);
    // dt = d + "/" + month + "/" + date.getFullYear();
    dt = date.getFullYear() + "-" + (month) + "-" + (d);
    return dt;
}
function GetDateMMDDYYYY(jsonDate) {
    var date = new Date(parseInt(jsonDate.substr(6)));
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var d = ('0' + (date.getDate())).slice(-2);
    // dt = d + "/" + month + "/" + date.getFullYear();
    dt = (month) + "-" + (d) + "-" + date.getFullYear();
    return dt;
}
function CustomMessage(title, message, type) {
    new PNotify({
        title: title,
        text: message,
        type: type,
        delay: 1e3
    });
}

function GetCheckValue(tableId) {
    $("#" + tableId + " tbody tr").each(function () {
        var IsEnabled = $(this).find(".border-checkbox").val();
        if (IsEnabled == "true") {
            $(this).find(".border-checkbox").prop('checked', true);
        }
    });
}
//set checkbox value in grid
function SetCheckboxGrid(tableId, classname) {
    $("#" + tableId + " tbody tr").each(function () {
        var IsEnabled = $(this).find("." + classname).val();
        if (IsEnabled == "true") {
            $(this).find("." + classname).prop('checked', true);
        }
    });
}
//Custom Pagination with responsive variable
function CustomPagination(id, order) {

    //if (typeof responsive === "undefined") {
    //    responsive = true;
    //}
    if (typeof order === "undefined") {
        order = false;
    }

    if (order == true) {
        var table = $("#" + id).DataTable({
            "language": {
                paginate: {
                    // next: 'Next',
                    // previous: 'Prev',
                    next: '<i class="fa fa-chevron-right" style="color:#0073AA"></i>',
                    previous: '<i class="fa fa-chevron-left" style="color:#0073AA"></i>'
                }
            },
            //"pagingType": "simple",
            "pageLength": 10,
            //"responsive": responsive,
            "autoWidth": false,
            "order": [],
            "bSort": false
        });
    }
    else {
        var table = $("#" + id).DataTable({
            "language": {
                paginate: {
                    // next: 'Next',
                    // previous: 'Prev',
                    next: '<i class="fa fa-chevron-right" style="color:#0073AA"></i>',
                    previous: '<i class="fa fa-chevron-left" style="color:#0073AA"></i>'
                }
            },
            //"pagingType": "simple",
            "pageLength": 10,
            //"responsive": responsive,
            "autoWidth": false,
            //"order": [],
        });
    }

    return table;
}

//Custom Pagination for visa renew process
function CustomPagination2(id, statech, responsive) {
    debugger
    if (typeof responsive === "undefined") {
        responsive = true;
    }
    //if (typeof order === "undefined") {
    //    order = false;
    //}

    if (responsive == true) {
        var table = $("#" + id).DataTable({
            "language": {
                paginate: {
                    // next: 'Next',
                    // previous: 'Prev',
                    next: '<i class="fa fa-chevron-right" style="color:#0073AA"></i>',
                    previous: '<i class="fa fa-chevron-left" style="color:#0073AA"></i>'
                }
            },
            //"pagingType": "simple",
            "pageLength": 10,
            //"responsive": responsive,
            "autoWidth": true,
            "order": [],
            "bSort": false,
            //
            "bStateSave": statech,
            "fnStateSave": function (oSettings, oData) {
                localStorage.setItem('offersDataTables', JSON.stringify(oData));
            },
            "fnStateLoad": function (oSettings) {
                return JSON.parse(localStorage.getItem('offersDataTables'));
            }
        });
        $(".row .col-xs-12").addClass("left_table_bar");
        $("#tblGridCalibrationMaster_filter").addClass("data_table_header");

    }
    else {
        var table = $("#" + id).DataTable({
            "language": {
                paginate: {
                    // next: 'Next',
                    // previous: 'Prev',
                    next: '<i class="fa fa-chevron-right" style="color:#0073AA"></i>',
                    previous: '<i class="fa fa-chevron-left" style="color:#0073AA"></i>'
                }
            },
            //"pagingType": "simple",
            "pageLength": 10,
            //"responsive": responsive,
            "autoWidth": true,
            //"order": [],
        });
        $(".row .col-xs-12").addClass("left_table_bar");
        $("#tblGridCalibrationMaster_filter").addClass("data_table_header");
    }

    return table;
}


function CustomPaginationWithSerialNumber(id, order) {

    //if (typeof responsive === "undefined") {
    //    responsive = true;
    //}
    if (typeof order === "undefined") {
        order = false;
    }

    if (order == true) {
        var table = $("#" + id).DataTable({
            "language": {
                paginate: {
                    // next: 'Next',
                    // previous: 'Prev',
                    next: '<i class="fa fa-chevron-right" style="color:#0073AA"></i>',
                    previous: '<i class="fa fa-chevron-left" style="color:#0073AA"></i>'
                }
            },
            //"pagingType": "simple",
            "pageLength": 10,
            //"responsive": true,
            "autoWidth": false,
            "order": []
        });
    }
    else {
        var table = $("#" + id).DataTable({
            "language": {
                paginate: {
                    // next: 'Next',
                    // previous: 'Prev',
                    next: '<i class="fa fa-chevron-right" style="color:#0073AA"></i>',
                    previous: '<i class="fa fa-chevron-left" style="color:#0073AA"></i>'
                }
            },
            //"pagingType": "simple",
            "pageLength": 10,
            //"responsive": true,
            "autoWidth": false
        });
    }




    table.on('order.dt search.dt', function () {
        table.column(1, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1;
        });
    }).draw();

    return table;
}


function CustomPaginationWithSerialNumberFirstColumn(id, order) {

    //if (typeof responsive === "undefined") {
    //    responsive = true;
    //}
    if (typeof order === "undefined") {
        order = false;
    }

    if (order == true) {
        var table = $("#" + id).DataTable({
            "language": {
                paginate: {
                    // next: 'Next',
                    // previous: 'Prev',
                    next: '<i class="fa fa-chevron-right" style="color:#0073AA"></i>',
                    previous: '<i class="fa fa-chevron-left" style="color:#0073AA"></i>'
                }
            },
            //"pagingType": "simple",
            "pageLength": 10,
            //"responsive": true,
            "autoWidth": false,
            "order": []
        });
    }
    else {
        var table = $("#" + id).DataTable({
            "language": {
                paginate: {
                    // next: 'Next',
                    // previous: 'Prev',
                    next: '<i class="fa fa-chevron-right" style="color:#0073AA"></i>',
                    previous: '<i class="fa fa-chevron-left" style="color:#0073AA"></i>'
                }
            },
            //"pagingType": "simple",
            "pageLength": 10,
            //"responsive": true,
            "autoWidth": false
        });
    }




    table.on('order.dt search.dt', function () {
        table.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1;
        });
    }).draw();

    return table;
}
//opens the upload window on file upload
$(document).on('click', '.browse', function () {
    var file = $(this).parent().parent().parent().find('.file');
    file.trigger('click');
});
//onchange functin of filepath
$(document).on('change', '.file', function () {
    //alert(this.files[0].size);
    if (this.files[0].size > 2147483647 ) {//52428800  = 50 MB
        CustomMessage("Error", "Please upload file less than 2 GB!", "error");
    }
    else {
        $(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
    }
});
//document.ready for tooltip
$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
});
//get file name
function GetFileName(filePath) {
    var fileName = filePath.replace(/^.*[\\\/]/, '');
    var newFileName = "";
    var fname = fileName.split('_');
    if (fileName.length > 2) {
        var TempCount = fname.length - 2;
        for (var i = 0; i < TempCount; i++) {
            if (i == TempCount - 1) {
                if (fname[i] == "") {
                }
                else {
                    newFileName = newFileName + fname[i];
                }
            }
            else {
                if (fname[i] == "") {

                }
                else {
                    newFileName = newFileName + fname[i] + "_";
                }
            }
        }
        newFileName = newFileName + fname[fname.length - 1];
    }
    else {
        newFileName = newFileName + fname[1];

    }
    return newFileName;
}
//function for dynamic logo
function GetLogo(_Id, imgTagId) {
    $.ajax({
        url: "/CompanySetup/GetCompany", cache: false, data: { GeneralID: _Id },
        success: function (data) {
            if (data != null && data.Status == "Success") {
                var imgpath = document.getElementById("" + imgTagId);
                imgpath.src = "/Common/Download?fileName= " + data.Data.Logo;
                if (data.Data.Logo == null) {
                    $("#" + imgTagId).css("visibility", "hidden");
                }
                else {
                    $("#" + imgTagId).css("visibility", "visible");
                }
            }
            else {
            }
        }
    });
}
// function use for toggle project list (open)
function OpenProjectList() {
    $("div").on('click', '.open-intro', function () {
        $('.introwrap').animate({
            left: '0',
        }, 1, function () {
            // Animation complete.
        });
        $('.open-intro').hide();
        $('.close-intro').show();
        $('.increasewidthclass').animate({
            left: '0%',
        }, 1, function () {
            // Animation complete.
            $('.projectlistclass').show();
            $('.toggleprojectlist').removeClass("col-sm-1");
            $('.toggleprojectlist').addClass("col-sm-3");
            $('.increasewidthclass').removeClass("col-sm-11");
            $('.headerpanelclass').css("margin-right", "");
            $('.gridlineclass').css("margin-right", "");
            $('.increasewidthclass').addClass("col-sm-9");
        });
    });
}
// function use for toggle project list (close)
function CloseProjectList() {
    $("div").on('click', '.close-intro', function () {
        $('.introwrap').animate({
            left: '-103%',
        }, 1, function () {
            // Animation complete.
            $(this).find('.open-intro').show();
            $('.close-intro').hide();
            $('.increasewidthclass').animate({
                left: '-6.5%',
            }, 1, function () {
                // Animation complete.
                $('.projectlistclass').hide();
                $('.toggleprojectlist').removeClass("col-sm-3");
                $('.toggleprojectlist').addClass("col-sm-1");
                $('.open-intro').addClass("col-sm-1");
                $('.increasewidthclass').removeClass("col-sm-9");
                $('.headerpanelclass').css("margin-right", "-7%");
                $('.gridlineclass').css("margin-right", "-7%");
                $('.increasewidthclass').addClass("col-sm-11");
            });
        });
    });
}
//common download file
function DownloadFile(filename) {
    var Flag = "";
    if (filename != null) {
        $.ajax({
            type: "POST", cache: false, url: "/Common/JsonDataFile/", data: { fileName: filename },
            success: function (data) {
                Flag = data.Data;
                if (data != null) {
                    if (Flag == "True") {
                        window.location.href = "/Common/Download?fileName=" + filename;
                    }
                    if (Flag == "False") {
                        CustomMessage('', "File path does not exist", "error");
                    }
                } else CustomMessage('', data.Message, "error");
            }
        });
    }
    else {
        CustomMessage('', "File Name not found", "error");
    }
}
//Get Current Number Series format
function GetCurrentNumberSeries(documentype, elementid) {
    $.ajax({
        type: "POST", cache: false, url: "/MOM/KickoffMeeting/GetCurrentNumberSeries", data: { DocumentType: documentype },
        success: function (data) {
            if (data != null) {
                if (data.Status == 'Success') {
                    $("#" + elementid).val(data.Data);
                } else CustomMessage('Error !', data.Message, "error");
            } else CustomMessage('Error !', data.Message, "error");
        }
    });
}
//Hides Informative labeles at card header
function setCardHeaderLablesHide(lblId) {
    $.each(lblId, function (i) {
        $("#" + lblId[i]).hide();
        $("#" + lblId[i]).text("");
    });
}
//Set Informative labels with value at card header
function setCardHeaderLableShowWithValue(lblId, lblVal) {
    $.each(lblId, function (i) {
        $("#" + lblId[i]).show();
        document.getElementById("" + lblId[i]).innerHTML = lblVal[i];
    });
}
//CurrentDateFunction for datepicker type date
function GetCurrentDate() {
    var month = new Array();
    month[1] = "Jan";
    month[2] = "Feb";
    month[3] = "Mar";
    month[4] = "Apr";
    month[5] = "May";
    month[6] = "Jun";
    month[7] = "Jul";
    month[8] = "Aug";
    month[9] = "Sep";
    month[10] = "Oct";
    month[11] = "Nov";
    month[12] = "Dec";
    var today = new Date();
    var dd = today.getDate();
    var mm = month[today.getMonth() + 1];
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    //return today = yyyy + '-' + mm + '-' + dd;
    return today = dd + '-' + mm + '-' + yyyy;
}
//Priority Lable Color for Informative Labels
function PriorityLabelColor(DdlId, lblId) {
    var PrVal = $("#" + DdlId + " option:selected").text();
    var PrId = $("#" + DdlId).val();
    if (PrId == 1) {
        $("#" + lblId).removeClass("label label-primary");
        $("#" + lblId).removeClass("label label-success");
        $("#" + lblId).removeClass("label label-warning");
        $("#" + lblId).addClass("label label-danger");
        document.getElementById("" + lblId).innerHTML = PrVal;
    }
    else if (PrId == 2) {
        $("#" + lblId).removeClass("label label-primary");
        $("#" + lblId).removeClass("label label-danger");
        $("#" + lblId).removeClass("label label-success");
        $("#" + lblId).addClass("label label-warning");
        document.getElementById("" + lblId).innerHTML = PrVal;

    } else {
        $("#" + lblId).removeClass("label label-primary");
        $("#" + lblId).removeClass("label label-danger");
        $("#" + lblId).removeClass("label label-warning");
        $("#" + lblId).addClass("label label-success");
        document.getElementById("" + lblId).innerHTML = PrVal;
    }
}
//Clear DataTable Row
function ClearDataTableRow(divId) {
    var datatbl = $('#' + divId).dataTable();
    datatbl.fnClearTable();
}

//CreateForm Creates Blank form
function CreateForm(currentWorkflowID, currentStageID, divId) {
    $.ajax({
        type: "POST",
        cache: false,
        url: "/Common/GetFormDesignMasterListForFormDesign",
        data: { WorkflowID: currentWorkflowID, StageID: currentStageID },
        success: function (data) {

            if (data != null) {
                CreateBlanckForm(divId, data);
            } else CustomMessage('Error !', data.Message, "error");
        }
    });
}
//Create Form
function CreateBlanckForm(div, data) {
    document.getElementById('' + div).innerHTML = "";
    var rejectreasonhtml = '<div class="row" id="divRejectReason"></div>';
    var footerhtml = '<br><div class="row">' +
        '<div class="col-md-12" id="footerbutton">' +
        '<div class="alpaca-form-buttons-container" id="frmButton">' +
        '</div>' +
        '<div class="alpaca-form-buttons-container" id="submit">' +
        '</div>' +
        '<div class="alpaca-form-buttons-container" id="reject">' +
        '</div>' +
        '<div class="alpaca-form-buttons-container" id="ReOpen">' +
        '</div>' +
        '<div class="alpaca-form-buttons-container" id="finalReject">' +
        '</div>' +
        '<div class="alpaca-form-buttons-container" id="frmReviseButton">' +
        '</div>' +
        '</div>' +
        '</div>';
    var CurrentRowSeq = "";
    var rowcols = "rowcols";
    for (var i = 0; i < data.result.length; i++) {
        if (CurrentRowSeq == "") {
            $('#' + div).append('<div id="' + rowcols + data.result[i].RowSeq + '"class="row"></div>');
        }
        else if (CurrentRowSeq != data.result[i].RowSeq) {
            if (data.result[i].InputID == "2" || data.result[i].InputID == "6") {
                $('#' + div).append('<div id="' + rowcols + data.result[i].RowSeq + '"class="row row_auto"></div>');
            }
            else {
                $('#' + div).append('<div id="' + rowcols + data.result[i].RowSeq + '"class="row"></div>');
            }
        }
        if (data.result[i].Visibility == true) {
            if (data.result[i].InputID == "1") {
                if (data.result[i].Readonly == true) {
                    $('#' + rowcols + data.result[i].RowSeq).append('<div class="' + data.result[i].LabelColumn + '" ><label class="form-control-label">' + data.result[i].Label + '</label></div ><div class="' + data.result[i].InputColumn + '"> <input type= "text" readonly class="form-control" id= ' + data.result[i].ElementID + '></div>');
                }
                else {
                    $('#' + rowcols + data.result[i].RowSeq).append('<div class="' + data.result[i].LabelColumn + '" ><label class="form-control-label">' + data.result[i].Label + '</label></div ><div class="' + data.result[i].InputColumn + '"> <input type= "text" class="form-control" id= ' + data.result[i].ElementID + '></div>');
                }
            }
            if (data.result[i].InputID == "2") {
                if (data.result[i].Readonly == true) {
                    $('#' + rowcols + data.result[i].RowSeq).append('<div class="' + data.result[i].LabelColumn + '" ><label class="form-control-label">' + data.result[i].Label + '</label></div ><div class="' + data.result[i].InputColumn + '"> <textarea disabled class="form-control" id= ' + data.result[i].ElementID + '></textarea><br></div>');
                }
                else {
                    $('#' + rowcols + data.result[i].RowSeq).append('<div class="' + data.result[i].LabelColumn + '" ><label class="form-control-label">' + data.result[i].Label + '</label></div ><div class="' + data.result[i].InputColumn + '"> <textarea class="form-control" id= ' + data.result[i].ElementID + '></textarea><br></div>');
                }
            } if (data.result[i].InputID == "3") {
                if (data.result[i].Readonly == true) {
                    $('#' + rowcols + data.result[i].RowSeq).append('<div class="' + data.result[i].LabelColumn + '" ><label class="form-control-label">' + data.result[i].Label + '</label></div ><div class="' + data.result[i].InputColumn + '"> <select disabled id=' + data.result[i].ElementID + ' class="alpaca-control form-control">< option >Select</option ></select ></div>');
                }
                else {
                    $('#' + rowcols + data.result[i].RowSeq).append('<div class="' + data.result[i].LabelColumn + '" ><label class="form-control-label">' + data.result[i].Label + '</label></div ><div class="' + data.result[i].InputColumn + '"> <select id=' + data.result[i].ElementID + ' class="alpaca-control form-control">< option >Select</option ></select ></div>');
                }
            } if (data.result[i].InputID == "4") {
                if (data.result[i].Readonly == true) {
                    $('#' + rowcols + data.result[i].RowSeq).append('<div class="' + data.result[i].LabelColumn + '" ><label class="form-control-label">' + data.result[i].Label + '</label></div ><div class="' + data.result[i].InputColumn + '"><input type="radio" disabled id=' + data.result[i].ElementID + ' class="alpaca-control form-control"></div>');
                }
                else {
                    $('#' + rowcols + data.result[i].RowSeq).append('<div class="' + data.result[i].LabelColumn + '" ><label class="form-control-label">' + data.result[i].Label + '</label></div ><div class="' + data.result[i].InputColumn + '"><input type="radio" id=' + data.result[i].ElementID + ' class="alpaca-control form-control"></div>');
                }
            } if (data.result[i].InputID == "5") {
                if (data.result[i].Readonly == true) {
                    $('#' + rowcols + data.result[i].RowSeq).append('<div class="' + data.result[i].LabelColumn + '" ><label class="form-control-label">' + data.result[i].Label + '</label></div><div class="' + data.result[i].InputColumn + '"><label class="switch1"><input type="checkbox"  style="vertical-align:middle; visibility:hidden;" disabled id=' + data.result[i].ElementID + ' class="border-checkbox"><span class="slider1" style="border-radius: 5px;"></span ></div ></label >');
                }
                else {
                    $('#' + rowcols + data.result[i].RowSeq).append('<div class="' + data.result[i].LabelColumn + '" ><label class="form-control-label">' + data.result[i].Label + '</label></div><div class="' + data.result[i].InputColumn + '"><label class="switch1"><input type="checkbox"  style="vertical-align:middle; visibility:hidden;" id=' + data.result[i].ElementID + ' class="border-checkbox"><span class="slider1" style="border-radius: 5px;"></span ></div ></label >');
                }
            }
            if (data.result[i].InputID == "6") {
                if (data.result[i].Readonly == true) {
                    $('#' + rowcols + data.result[i].RowSeq).append('<div class="' + data.result[i].LabelColumn + '" ><label class="form-control-label">' + data.result[i].Label + '</label></div><div class="' + data.result[i].InputColumn + '"><div class="input-group"><span class="input-group-addon bg-default datepickerHeight"><span class="icofont icofont-ui-calendar"></span></span ><input type="date" class="form-control datepickerHeight" id=' + data.result[i].ElementID + ' disabled ></div></div>');
                }
                else {
                    $('#' + rowcols + data.result[i].RowSeq).append('<div class="' + data.result[i].LabelColumn + '" ><label class="form-control-label">' + data.result[i].Label + '</label></div><div class="' + data.result[i].InputColumn + '"><div class="input-group"><span class="input-group-addon bg-default datepickerHeight"><span class="icofont icofont-ui-calendar"></span></span ><input type="date" class="form-control datepickerHeight" id=' + data.result[i].ElementID + '></div></div>');
                }
            }
            if (data.result[i].InputID == "7") {
                var fileuploadbtn = "";
                if (data.result[i].isUpload == true && data.result[i].isUpload != null) {
                    fileuploadbtn = '<button type="button" class="browse btn-dark input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Upload" id= "' + data.result[i].Uploadbtn + '"><i class="icofont icofont-upload-alt" style="font-size:large;" aria-hidden="true"></i></button>';
                }
                else {
                    fileuploadbtn = fileuploadbtn + "";
                }
                if (data.result[i].isDownload == true && data.result[i].isDownload != null) {
                    if (data.result[i].Downloadbtnfunction != null) {
                        fileuploadbtn = fileuploadbtn + '<button type="button" class="btn-dark input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Download" id= "' + data.result[i].Downloadbtn + '" onclick="' + data.result[i].Downloadbtnfunction + '"><i class="icofont icofont-download-alt" style="font-size:large;" aria-hidden="true"></i></button>'
                    } else {
                        fileuploadbtn = fileuploadbtn + '<button type="button" class="btn-dark input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Download" id= "' + data.result[i].Downloadbtn + '"><i class="icofont icofont-download-alt" style="font-size:large;" aria-hidden="true"></i></button>'
                    }
                }
                else {
                    fileuploadbtn = fileuploadbtn + "";
                }
                if (data.result[i].isClear == true && data.result[i].isClear != null) {
                    if (data.result[i].Clearbtnfunction != null) {
                        fileuploadbtn = fileuploadbtn + '<button type="button" class="btn-dark input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Clear" id="' + data.result[i].Clearbtn + '" onclick="' + data.result[i].Clearbtnfunction + '"><i class="icofont icofont-close" style="font-size:large;" aria-hidden="true"></i></button>'
                    } else {
                        fileuploadbtn = fileuploadbtn + '<button type="button" class="btn-dark input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Clear" id="' + data.result[i].Clearbtn + '"><i class="icofont icofont-close" style="font-size:large;" aria-hidden="true"></i></button>'
                    }
                }
                else {
                    fileuploadbtn = fileuploadbtn + "";
                }
                $('#' + rowcols + data.result[i].RowSeq).append('<div class="' + data.result[i].LabelColumn + '" ><label class="form-control-label">' + data.result[i].Label + '</label></div><div class="' + data.result[i].InputColumn + '"><input type= "file" class="file" id= "' + data.result[i].ElementID + '" multiple= "multiple" > ' +
                    '<div class="input-group">' +
                    '<input type= "text" class="form-control input-lg" id= "' + data.result[i].FileTxt + '" readonly>' +
                    '<span class="input-group-btn">' + fileuploadbtn + '</span></div></div>');
            }
            if (data.result[i].InputID == "8") {
                $('#' + div).append('<input type="hidden" class="form-control"  id=' + data.result[i].ElementID + '>');
            }
            if (data.result[i].InputID == "10") {
                $('#' + rowcols + data.result[i].RowSeq).append('<div class="' + data.result[i].LabelColumn + '" ><label class="form-control-label">' + data.result[i].Label + '</label></div ><div class="' + data.result[i].InputColumn + '"> <img class="form-control"  id=' + data.result[i].ElementID + ' src=" " alt="No Images"></div>');
                //$('#' + div).append('<img class="form-control"  id=' + data.result[i].ElementID + ' src=" " alt="No Images">');
            }
        }
        CurrentRowSeq = data.result[i].RowSeq;
    }
    $('#' + div).append(rejectreasonhtml);
    $('#' + div).append(footerhtml);
}
//Add Update Button for Header panel
function AddUpdateButton(divID, action, btnName) {
    var btnColor = "";
    if (divID == "frmButton") {
        if (btnName == 'Update') {
            btnColor = "success";
        }
        if (btnName == 'Add') {
            btnColor = "primary";
        }

        if (btnName == 'Save') {
            // btnColor = "success";
            return $('#' + divID).html('<button type="button" class="btn btn_top" id="save-btn" onclick=' + action + '>' + "  " + btnName + '</button>');
        }
    }
    else if (divID == "ApprovalFormBtn") {
        if (btnName == 'Update') {
            btnColor = "success";
        }
        if (btnName == 'Add') {
            btnColor = "primary";
        }
    }
    else {
        btnColor = "danger";
    }
    return $('#' + divID).html('<button data-key="submit" type="button" style="float:right" class="alpaca-form-button alpaca-form-button-submit btn btn-' + btnColor + '" id="btn' + divID + '" " onclick=' + action + '>' + "  " + btnName + '</button>');
}
function AddUpdateButtonSave(divID, action, btnName) {
    return $('#' + divID).html('<button type="button" class="btn btn_top" id="save-btn" onclick=' + action + '>' + "  " + btnName + '</button>');
}
//Reject and reopen button for reject and reopen modal
function RejectedReopenButton(divID, action, btnName) {
    var btnColor = "";
    var btnid = "";
    if (divID == "rejectmodalbtn") {
        //btnColor = "danger";
        btnid = "reject";
        return $('#' + divID).html('<button data-key="submit" type="button" class="btn btn_top' + btnColor + '" id="' + btnid + '" onclick=' + action + '>' + "" + btnName + '</button>');

    }
    else if (divID == "reopenmodalbtn") {
        //btnColor = "warning";
        btnid = "ReOpen";
        return $('#' + divID).html('<button data-key="submit" type="button" class="btn btn_top' + btnColor + '" id="' + btnid + '" onclick=' + action + '>' + "" + btnName + '</button>');

    }
    else if (divID == "Blacklistmodalbtn") {
        //btnColor = "warning";
        btnid = "BlackList";
        return $('#' + divID).html('<button data-key="submit" type="button" class="btn btn_top' + btnColor + '" id="' + btnid + '" onclick=' + action + '>' + "" + btnName + '</button>');

    }
    else {
        //btnColor = "danger";
    }
    return $('#' + divID).html('<button data-key="submit" type="button" class="alpaca-form-button alpaca-form-button-submit btn btn-' + btnColor + '" id="' + btnid + '" onclick=' + action + '>' + "" + btnName + '</button>');
}
//Get UserID for UserRoleDropdown
function GetUserIdFromDdl(divId) {
    var usrId = $('#' + divId).val();
    Reload_ddl_Global(xhr_GetData_Dropdown, "#DdlRole", "/Common/GetUserRoleDdl", { UserId: usrId, RoleId: null }, "Select", function () { null });
}

function GetAddButton1(divID, action, btnName) {
    var icon = "";
    var btnColor = "";
    if (divID == "submit1") {
        icon = "icofont icofont-file-text ";
        btnColor = "primary";
    }
    else if (divID == "reject1") {
        icon = "icofont icofont-ban ";
        btnColor = "danger";

    }
    else if (divID == "ReOpen1") {
        icon = "icofont icofont-refresh ";
        btnColor = "warning";

    }
    else {
        icon = "icofont icofont-thumbs-down ";
        btnColor = "danger";

    }
    // return $(divID).html('<i onclick=' + action + ' style="cursor:pointer; margin-top: 5px;" class="fa fa-plus-circle fa-2x hvr-shrink"></i>');
    return $('#' + divID).html('<button id="btn' + divID + '" data-key="submit" type="button" style="float:left; margin-right:5px; " class="alpaca-form-button alpaca-form-button-submit btn btn-' + btnColor + '" onclick=' + action + '><span class="' + icon + '"></span>' + "  " + btnName + '</button>');
}

function SalesStatusLabelColor(DdlId, lblId) {
    var PrVal = $("#" + DdlId + " option:selected").text();
    var PrId = $("#" + DdlId).val();
    if (PrId == 1) {
        $("#" + lblId).removeClass("label label-primary");
        $("#" + lblId).removeClass("label label-success");
        $("#" + lblId).removeClass("label label-danger");
        $("#" + lblId).addClass("label label-warning");
        document.getElementById("" + lblId).innerHTML = PrVal;
    }
    else if (PrId == 2) {
        $("#" + lblId).removeClass("label label-primary");
        $("#" + lblId).removeClass("label label-danger");
        $("#" + lblId).removeClass("label label-warning");
        $("#" + lblId).addClass("label label-success");
        document.getElementById("" + lblId).innerHTML = PrVal;

    } else {
        $("#" + lblId).removeClass("label label-primary");
        $("#" + lblId).removeClass("label label-success");
        $("#" + lblId).removeClass("label label-warning");
        $("#" + lblId).addClass("label label-danger");
        document.getElementById("" + lblId).innerHTML = PrVal;
    }
}
//Get Time
function GetTime(time) {
    var TimeHours = 0;
    var TimeMinutes = 00;
    var TimeSeconds = 00;
    var TimeResult = "";
    TimeHours = time.Hours;
    if (TimeHours < 10) {
        TimeHours = "0" + time.Hours;
    }
    TimeMinutes = time.Minutes;
    if (TimeMinutes < 10) {
        TimeMinutes = "0" + time.Minutes;
    }
    TimeSeconds = time.Seconds;
    if (TimeSeconds < 10) {
        TimeSeconds = "0" + time.Seconds;
    }
    return TimeResult = TimeHours + ':' + TimeMinutes + ':' + TimeSeconds;
}
//Get Time Into 12 hours Formate
function GetTimeInto12hourFormat(time) {
    if (time != null) {
        var hours = Number(time.Hours);
        var minutes = Number(time.Minutes);
        var AMPM = "";
        if (hours < 12) {
            AMPM = "AM";
        }
        if (hours == 00) {
            AMPM = "AM";
        }
        if (hours == 12) {
            AMPM = "PM";
        }
        if (hours > 12) {
            AMPM = "PM";
            hours = hours - 12;
        }
        var sHours = hours.toString();
        var sMinutes = minutes.toString();
        if (hours < 10) sHours = "0" + sHours;
        if (minutes < 10) sMinutes = "0" + sMinutes;
        return (sHours + ":" + sMinutes + " " + AMPM);
    }
    else {
        return "";
    }
}

//Get Attachment File for Single type attachment as well as Multiple type attachment
function GetAttachmentFile(type, action, attchmentId, lineId, headerId) {
    if (type == "Single") {
        var attachfile = document.getElementById('' + attchmentId);
        if (attachfile != null) {
            var file = document.getElementById('' + attchmentId).files[0];
            if (typeof file === "undefined") {
                file = null;
            }
            else {
                return file;
            }
        }
    }
    else if (type == "Multiple") {
        if (action == 'Add') {
            if (attchmentId != "") {
                var attchIdAdd = document.getElementById('' + attchmentId);
                if (attchIdAdd == null) {
                    CustomMessage('Add attachment!', "", "error");
                    return null;
                }
                else {
                    var file1 = document.getElementById('' + attchmentId).files[0];
                    if (typeof file1 === "undefined") {
                        CustomMessage('Add attachment!', "", "error");
                        return null;
                    }
                    else {
                        return file1;
                    }
                }
            }
            else {
                return null;
            }
        }
        if (action == 'Update') {
            if (attchmentId != "" && lineId != "" && headerId != "") {
                var fileid = attchmentId + lineId + headerId;
                var attchIdUpdate = document.getElementById('' + fileid);
                if (attchIdUpdate == null) {
                    file = null;
                }
                else {
                    var file = document.getElementById('' + fileid).files[0];
                    if (typeof file === "undefined") {
                        file = null;
                    }
                    else {
                        return file;
                    }
                }
            }
            else {
                return null;
            }
        }
    }
    else {
        return null;
    }
}

//Reset Input File Id and Clear value
function ResetFileIDandClearValue(fileid) {
    var filepathid = $("[id^='" + fileid + "']");
    $('#' + filepathid[0].id).val('');
    $('#' + filepathid[0].id).attr("id", fileid);
}

//AddUpdateData
function AddUpdateData(Ajaxurl, AjaxData, SuccessCallback, ErrorCallback) {

    $.ajax({
        type: "POST", cache: false, url: Ajaxurl, data: AjaxData,
        success: function (data) {
            if (data != null) {
                if (data.Status == 'Success') {
                    //toastr.success(data.Message);
                    //CustomMessage('Success!', data.Message, "success");

                    if (SuccessCallback && typeof (SuccessCallback) === "function")
                        SuccessCallback(data);
                } else if (data.Status == 'Error') {

                    //if (data.toString().indexOf("LoginBody") >= 0) {
                    //    window.open(ProjectURL.BaseURL, "_self")
                    //}

                    //if ((data.Message.indexOf("Sequence") !== -1))
                    //    CustomMessage('', Resource.SequenceExistMessage, "error");
                    //else toastr.error(data.Message);

                    if (ErrorCallback && typeof (ErrorCallback) === "function")
                        ErrorCallback(data);
                }

            } //else toastr.error(data.Message);
        }
    });
}

//GetAjaxData
function GetAjaxData(Ajaxurl, AjaxData, SuccessCallback, ErrorCallback) {

    $.ajax({
        type: "POST", cache: false, url: Ajaxurl, data: AjaxData,
        success: function (data) {
            if (data != null) {
                if (data.Status == 'Success') {
                    if (SuccessCallback && typeof (SuccessCallback) === "function")
                        SuccessCallback(data);
                } else if (data.Status == 'Error') {

                    if (data.toString().indexOf("LoginBody") >= 0) {
                        window.open(ProjectURL.BaseURL, "_self")
                    }
                    if (ErrorCallback && typeof (ErrorCallback) === "function")
                        ErrorCallback(data);
                } else if (data.toString().indexOf("LoginBody") >= 0) {
                    window.open(ProjectURL.BaseURL, "_self")
                }

            } else toastr.error(data.Message);
        }
    });
}
//Dusable form fields
function Disable_Form_Fields(formId) {
    formId = '';
    try {
        $(formId + ' input[type="text"]').each(function () {
            $(this).attr("disabled", true);
        });
    } catch (e) { }
    try {
        $(formId + ' input[type="date"]').each(function () {
            $(this).attr("disabled", true);
        });
    } catch (e) { }
    try {
        $(formId + ' input[type="password"]').each(function () {
            $(this).attr("disabled", true);
        });
    } catch (e) { }
    try {
        $(formId + ' input[type="hidden"]').each(function () {
            $(this).attr("disabled", true);
        });
    } catch (e) { }
    try {
        $(formId + ' textarea').each(function () {
            $(this).attr("disabled", true);
        });
    } catch (e) { }
    try {
        $(formId + ' input[type="file"]').each(function () {
            $(this).attr("disabled", true);
        });
    } catch (e) { }
    try {
        $(formId + ' input[type="radio"]').each(function () {
            $("#" + $(this).attr('id')).prop('disabled', true);
        });
    } catch (e) { }
    try {
        $(formId + ' input[type="checkbox"]').each(function () {
            $("#" + $(this).attr('id')).prop('disabled', true);

        });
    } catch (e) { }
    try {
        $(formId + ' button').each(function () {
            $("#" + $(this).attr('id')).prop('disabled', true);

        });
    } catch (e) { }
    try {
        $(formId + ' select').each(function () {
            $("#" + $(this).attr('id')).prop('disabled', true);
            Clear_ddl_Global($(this).attr('id'), "");
        });
    } catch (e) { }
}

function Able_Form_Fields(formId) {
    formId = '';
    formId = '';
    try {
        $(formId + ' input[type="text"]').each(function () {
            $(this).removeAttr("disabled");
        });
    } catch (e) { }
    try {
        $(formId + ' input[type="date"]').each(function () {
            $(this).removeAttr("disabled");
        });
    } catch (e) { }
    try {
        $(formId + ' input[type="password"]').each(function () {
            $(this).removeAttr("disabled");
        });
    } catch (e) { }
    try {
        $(formId + ' input[type="hidden"]').each(function () {
            $(this).removeAttr("disabled");
        });
    } catch (e) { }
    try {
        $(formId + ' textarea').each(function () {
            $(this).removeAttr("disabled");
        });
    } catch (e) { }
    try {
        $(formId + ' input[type="file"]').each(function () {
            $(this).removeAttr("disabled");
        });
    } catch (e) { }
    try {
        $(formId + ' input[type="radio"]').each(function () {
            $("#" + $(this).attr('id')).removeAttr("disabled");
        });
    } catch (e) { }
    try {
        $(formId + ' input[type="checkbox"]').each(function () {
            $("#" + $(this).attr('id')).removeAttr("disabled");

        });
    } catch (e) { }
    try {
        $(formId + ' button').each(function () {
            $("#" + $(this).attr('id')).removeAttr("disabled");

        });
    } catch (e) { }
    try {
        $(formId + ' select').each(function () {
            $("#" + $(this).attr('id')).removeAttr("disabled");
        });
    } catch (e) { }
}

function GetTime(jsonDate) {
    var date = new Date(parseInt(jsonDate.substr(6)));

    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    hours = hours < 10 ? '0' + hours : hours;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;

    return strTime;
}

function GetCurrentTime(date) {
    var d = new Date();
    var hours = d.getHours();
    var minutes = d.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    hours = hours < 10 ? '0' + hours : hours;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;

    return strTime;
}

function GetTimeMaster(controlID, jsonDate) {
    var date = new Date(parseInt(jsonDate.substr(6)));

    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'pm' : 'am';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    hours = hours < 10 ? '0' + hours : hours;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;

    $(controlID).attr({ 'value': hours + ':' + minutes });

    return strTime;
}

function GetTim(jsonDate) {
    var date = new Date(parseInt(jsonDate.substr(6)));

    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'pm' : 'am';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    hours = hours < 10 ? '0' + hours : hours;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;

    //$(controlID).attr({ 'value': hours + ':' + minutes });

    return hours;
}

function GetMini(jsonDate) {
    var date = new Date(parseInt(jsonDate.substr(6)));

    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'pm' : 'am';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    hours = hours < 10 ? '0' + hours : hours;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;

    //$(controlID).attr({ 'value': hours + ':' + minutes });

    return minutes;
}

function GetMeri(jsonDate) {
    var date = new Date(parseInt(jsonDate.substr(6)));

    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    hours = hours < 10 ? '0' + hours : hours;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;

    //$(controlID).attr({ 'value': hours + ':' + minutes });

    return ampm;
}

function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

function Validate_Control_Email_ForgotPassword(ControlId, FieldValue, displayerrorid, ErrorMessage, valid) {
    var email_Regx = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    if (FieldValue.trim() != null && FieldValue.trim() != '') {
        if (email_Regx.test(FieldValue) != true) {
            //$(ControlId).parent().addClass("has-error");
            $(ControlId).addClass("error_border");
            //$(".form-control").siblings("p").addClass("error_msg");
            $(displayerrorid).addClass("error-msg").html(ErrorMessage);
            valid = false;
        }
    }
    return valid;
}

function PushNotification(AjaxData, callback) {

    $.ajax({
        type: "POST",
        cache: false,
        url: "/Notification/PushNotification",
        data: AjaxData,
        success: function (data) {
            if (data != null) {
                if (data.Status == 'Success') {

                    var model = eval(data.Data);

                    if (callback && typeof (callback) === "function")
                        callback(model);
                }
                else if (data.Status == 'Error') {
                    CustomMessage('', data.Message, "error");
                }
            }
            else
                CustomMessage('', data.Message, "error");
        }
    });

}


function BindWorkflowGrid(status, tableid, url, data) {
    var table = $('#section-bar-' + status).find('table.display').first();
    var script = $('#section-bar-' + status).find('script').first();
    $(script).attr('id', 'Grid_Data_Template_' + tableid + status);
    $(table).attr('id', tableid + status);
    $('#' + tableid + status + ' tbody').empty();
    LoadGrid(xhr_GetData, tableid + status, url, data, function () {
        CustomPagination(tableid + status);
    });
}

$(function () {
    $('.number-input').on('keydown', function (e) { -1 !== $.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) || /65|67|86|88/.test(e.keyCode) && (!0 === e.ctrlKey || !0 === e.metaKey) || 35 <= e.keyCode && 40 >= e.keyCode || (e.shiftKey || 48 > e.keyCode || 57 < e.keyCode) && (96 > e.keyCode || 105 < e.keyCode) && e.preventDefault() });
});


function CustomPaginationWithSerialNumberForFirstColumn(id, responsive) {

    if (typeof responsive === "undefined") {
        responsive = true;
    }
    var table = $("#" + id).DataTable({
        "language": {
            paginate: {
                // next: 'Next',
                // previous: 'Prev',
                next: '<i class="fa fa-chevron-right" style="color:#0073AA"></i>',
                previous: '<i class="fa fa-chevron-left" style="color:#0073AA"></i>'
            }
        },
        //"pagingType": "simple",
        "pageLength": 10,
        //"responsive": true,
        "autoWidth": false
    });

    table.on('order.dt search.dt', function () {
        table.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1;
        });
    }).draw();

    return table;
}

function CustomPagination1(id, responsive) {

    if (typeof responsive === "undefined") {
        responsive = false;
    }
    var table = $("#" + id).DataTable({
        "language": {
            paginate: {
                next: '<i class="fa fa-chevron-right" style="color:#0073AA"></i>',
                previous: '<i class="fa fa-chevron-left" style="color:#0073AA"></i>'
            }
        },
        "paging": true,
        "bLengthChange": true,
        "bFilter": true,
        "bSort": true,
        "bInfo": true,
        "order": []
    });

    $(".row .col-xs-12").addClass("left_table_bar");
    $("#tblGridCalibrationMaster_filter").addClass("data_table_header");
    //var tbl = $("#" + id + '>thead>tr');
    //tbl.remove();
    return table;

}

function CustomPaginationColumn(id, responsive) {


    if (typeof responsive === "undefined") {
        responsive = false;
    }

    var table = $("#" + id).DataTable({

        "language": {
            paginate: {
                next: '<i class="fa fa-chevron-right" style="color:#0073AA"></i>',
                previous: '<i class="fa fa-chevron-left" style="color:#0073AA"></i>'
            }
        },

        "paging": true,
        "bLengthChange": true,
        "bFilter": true,
        "bSort": true,
        "bInfo": true,
        "order": []
    });

    $(".row .col-xs-12").addClass("left_table_bar");
    $("#tblGridCalibrationMaster_filter").addClass("data_table_header");

    /*---------------Hide/Show datatable columns ---------------*/
    $('.checkbox input[type=checkbox]').on('change', function (e) {
        e.preventDefault();
        var dataCol = $(this).attr("value");
        // Get the column API object
        var column = table.column(dataCol);
        // Toggle the visibility
        column.visible(!column.visible());
    });
    return table;
}


function CustomPaginationWithExportBtn(id, filename) {

    if (typeof responsive === "undefined") {
        responsive = true;
    }
    var table = $("#" + id).DataTable({
        "dom": 'flBrtpi',
        "buttons": [
            {
                extend: 'excel',
                title: filename
            },
        ],
        "language": {
            paginate: {
                // next: 'Next',
                // previous: 'Prev',
                next: '<i class="fa fa-chevron-right" style="color:#0073AA"></i>',
                previous: '<i class="fa fa-chevron-left" style="color:#0073AA"></i>'
            }
        },
        //"pagingType": "simple",
        "pageLength": 10,
        //"responsive": responsive,
        "autoWidth": false,
        "order": [],
        "bSort": false
    });


    $('.checkbox input[type=checkbox]').on('change', function (e) {
        e.preventDefault();
        var dataCol = $(this).attr("value");
        // Get the column API object
        var column = table.column(dataCol);
        // Toggle the visibility
        column.visible(!column.visible());
    });

    return table;
}

function removeURLParameter() {
    var url = window.location.href;
    var parameter = 'MenuId';
    var urlparts = url.split('?');
    if (urlparts.length >= 2) {

        var prefix = encodeURIComponent(parameter) + '=';

        var pars = urlparts[1].split(/[&;]/g);

        //reverse iteration as may be destructive
        for (var i = pars.length; i-- > 0;) {
            //idiom for string.startsWith
            if (pars[i].lastIndexOf(prefix, 0) !== -1) {
                pars.splice(i, 1);
            }
        }
    }
    window.open(urlparts[0], "_self");
}

// show always first tab
function ShowFirstTab() {
    $(".tab-content").find(".active").prop('aria-expanded', false);
    $(".tab-content").find(".active").css('display', 'none');
    $(".tab-content").find(".active").removeClass('active');
    $(".nav-tabs").find(".active").removeClass('active');
    $(".currentTab").addClass('active');
    $(".currentTab").css('display', 'block');
}

function multiSelete_Validate_Control_NullBlank(ControlId, FieldValue, ErrorMessage, valid) {
    $(".error-msg").show();
    if ($.trim(FieldValue) == null || $.trim(FieldValue) == '' || $.trim(FieldValue) == ',') {
        //$(ControlId).parent().addClass("has-error");
        //$(ControlId).addClass("error_border");
        $(ControlId).siblings('.select2-container').find('.select2-selection--multiple').addClass("error_border");
        //$(".form-control").siblings("p").addClass("error_msg");
        //$(ControlId).parent().find("p").addClass("error-msg").html(ErrorMessage);
        valid = false;
    }

    return valid;
}

function ShowHelpDoc(controlID) {

    debugger;
    var filepath = $(controlID).attr("filepath");

    $("#iFrameHelpDoc").attr("src", filepath);

    $('#HelpDocModal').modal('show');
}


function GetNCRObservationPendingCount(sourceNo, pendingId, TotalId, PendingSpanId, sourceController) {
    $.ajax({
        type: "POST", cache: false, url: "/Common/GetNCRObservationPendingCount", data: { sourceNo: sourceNo, sourceController: sourceController },
        success: function (data) {
            if (data.Data != null) {
                if (data.Status == 'Success') {
                    var result = data.Data;
                    var pendingCount = 0;
                    var totalCount = 0;
                    var pendingSpan = "badge-success";

                    if (result.PENDING_COUNT != null) {
                        pendingCount = result.PENDING_COUNT;
                    }
                    $("#" + pendingId).text(pendingCount);

                    if (result.TOTAL_COUNT != null) {
                        totalCount = result.TOTAL_COUNT;
                    }
                    $("#" + TotalId).text(totalCount);

                    $("#" + PendingSpanId).removeClass("badge-warning");
                    $("#" + PendingSpanId).removeClass("badge-success");
                    if (result.BADGE_COLOR != null) {
                        pendingSpan = result.BADGE_COLOR;
                    }
                    $("#" + PendingSpanId).addClass(pendingSpan);

                } else CustomMessage('Error !', data.Message, "error");
            } else CustomMessage('Error !', data.Message, "error");
        }
    });
}



function OpenImagePDF(path, name) {
    var image_path = path;
    var image_name = name;


    if (isValidCode(image_name)) {
        $('#pdf_DocumentPrev').hide();
        $('#modalDialogue').removeClass('modal-lg');



        $('#docImagePreview').attr('src', '/Common/DownloadFile?filePath=' + image_path);
        $('#docImagePreview').show();
    }
    else {
        $('#docImagePreview').hide();
        $('#modalDialogue').addClass('modal-lg');
        $('#pdf_DocumentPrev').css('display', 'block');
        $('#pdf_DocumentPrev').attr('src', '/Common/GetPdf?filePath=' + image_path);
    }
    //$('#docImagePreview').attr('src', '/Common/DownloadFile?filePath=' + image_path);
    $('#Preview-Image-Modal').modal('show');
    $('#Preview-Image-Modal').modal('toggle');
}
function isValidCode(code) {
    var codes = ["png", "PNG", "jpg", "JPG", "JPEG", "jpeg"];
    var fileextension = code.split('.').pop();
    var test = ($.inArray(fileextension, codes) > -1);
    return test;
}
function isValidFile(code) {
    var codes = ["png", "PNG", "jpg", "JPG", "JPEG", "jpeg", "pdf", "PDF"];
    var fileextension = code.split('.').pop();
    var test = ($.inArray(fileextension, codes) > -1);
    return test;
}

function GetStageInfo(workflowId, stageId) {

}