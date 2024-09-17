

//-------
//-------
//-------
//START-------------------On Fire Pump Side------------------// 

function ViewpumpRequestDetails() {
    $('#modalFPDetails').modal('show');
}

var objDatatable = [], objDatatableItems = [];
var ReqID = '';
var EstID = '';
var ItemID = '';
var PumpClass = '';
var Status = '';
$(document).ready(function () {

    UserBase();
    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        AllRequests('Please Wait..');
        $(".ajax-loader").addClass('hidden');
    }, 500);
});


function initiateRichText() {

    var richTextObj = $('.ritext-tech-remarks-div #taTechRemarks').richText({
        saveCallback: function (obj, a, b) {
            var a = '';
        },
        // text formatting
        bold: true,
        italic: true,
        underline: true,

        // text alignment
        leftAlign: true,
        centerAlign: true,
        rightAlign: true,
        justify: true,

        // lists
        ol: true,
        ul: true,

        // title
        heading: true,

        // fonts
        fonts: true,
        fontList: ["Arial",
            "Arial Black",
            "Comic Sans MS",
            "Courier New",
            "Geneva",
            "Georgia",
            "Helvetica",
            "Impact",
            "Lucida Console",
            "Tahoma",
            "Times New Roman",

            "Verdana"
        ],
        fontColor: true,
        backgroundColor: true,
        fontSize: true,

        // uploads
        imageUpload: false,
        fileUpload: false,
        videoEmbed: false,
        // media
        //<a href = "https://www.jqueryscript.net/tags.php?/video/" > video</a> Embed: true,

        // link
        urls: false,

        // tables
        table: true,

        // code
        removeStyles: true,
        code: false,

        // colors
        colors: [],

        // dropdowns
        fileHTML: '',
        imageHTML: '',

        // translations
        translations: {
            'title': 'Title',
            'white': 'White',
            'black': 'Black',
            'brown': 'Brown',
            'beige': 'Beige',
            'darkBlue': 'Dark Blue',
            'blue': 'Blue',
            'lightBlue': 'Light Blue',
            'darkRed': 'Dark Red',
            'red': 'Red',
            'darkGreen': 'Dark Green',
            'green': 'Green',
            'purple': 'Purple',
            'darkTurquois': 'Dark Turquois',
            'turquois': 'Turquois',
            'darkOrange': 'Dark Orange',
            'orange': 'Orange',
            'yellow': 'Yellow',
            'imageURL': 'Image URL',
            'fileURL': 'File URL',
            'linkText': 'Link text',
            'url': 'URL',
            'size': 'Size',
            'responsive': '<a href="https://www.jqueryscript.net/tags.php?/Responsive/">Responsive</a>',
            'text': 'Text',
            'openIn': 'Open in',
            'sameTab': 'Same tab',
            'newTab': 'New tab',
            'align': 'Align',
            'left': 'Left',
            'justify': 'Justify',
            'center': 'Center',
            'right': 'Right',
            'rows': 'Rows',
            'columns': 'Columns',
            'add': 'Add',
            'pleaseEnterURL': 'Please enter an URL',
            'videoURLnotSupported': 'Video URL not supported',
            'pleaseSelectImage': 'Please select an image',
            'pleaseSelectFile': 'Please select a file',
            'bold': 'Bold',
            'italic': 'Italic',
            'underline': 'Underline',
            'alignLeft': 'Align left',
            'alignCenter': 'Align centered',
            'alignRight': 'Align right',
            'addOrderedList': 'Ordered list',
            'addUnorderedList': 'Unordered list',
            'addHeading': 'Heading/title',
            'addFont': 'Font',
            'addFontColor': 'Font color',
            'addBackgroundColor': 'Background color',
            'addFontSize': 'Font size',
            'addImage': 'Add image',
            'addVideo': 'Add video',
            'addFile': 'Add file',
            'addURL': 'Add URL',
            'addTable': 'Add table',
            'removeStyles': 'Remove styles',
            'code': 'Show HTML code',
            'undo': 'Undo',
            'redo': 'Redo',
            'save': 'Save',
            'close': 'Close'
        },

        // privacy
        youtubeCookies: false,

        // preview
        preview: false,

        // placeholder
        placeholder: '',

        // dev settings
        useSingleQuotes: false,
        height: 620,
        heightPercentage: 0,
        adaptiveHeight: false,
        id: "",
        class: "",
        useParagraph: false,
        maxlength: 0,
        maxlengthIncludeHTML: false,
        callback: undefined,
        useTabForNext: false,
        save: false,
        saveCallback: undefined,
        saveOnBlur: 0,
        undoRedo: true

    });
}

$('#ddlRequestStatus').on('change', function () {
    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        AllRequests('Please Wait..');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});
function AllRequests(loader) {

    $.ajax({
        url: "FirePump.aspx/getAllRequests",
        data: JSON.stringify({ "UserId": currUserId, "Status": $('#ddlRequestStatus option:selected').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var htmen = '';
            $('.tbody-Firepump-list-table tr').length > 0 ? objDatatable.destroy() : '';
            var selvalue = '';
            var htmDrop = '';

            $.each(ProjectDetails, function (key, item) {

                htm += `<tr>  
                  <td style="text-align:center;display:none;">` + item.ReqID + `</td>
                  <td style="text-align:center;display:none;">` + item.EstimationID + `</td>
                  <td style="text-align:center;">`+ item.RefNo + `</td>
                  <td style="text-align:center;">`+ item.RevNo + `</td>
                  <td style="text-align:center;">`+ item.ContABBR + `</td>
                  <td style="text-align:center;">`+ item.Year + `</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                  <td style="text-align:center;">`+ item.ProjectNumber + `</td>
                  <td style="text-align:center;">`+ item.ProjectName + `</td>
                  <td style="text-align:center;">`+ item.Estimator + `</td>
                  <td style="text-align:center;">`+ item.CreatedDate + `</td>
                   <td style="text-align:center;display:none;">`+ item.Status + `</td>
                  <td style="text-align:center;">
                  <img src="images/icon-View.png" title="View" class="fa-icon-hover View-Request-Details" style="cursor: pointer; width: 24px;" />&nbsp;
                </td>`;
                htm += `</tr>`;

            });
            $('.tbody-Firepump-list-table').html(htm);
            initiateDataTable();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.Firepump-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /*   order: [[0, 'ASC']]*/
    });
}

$('.tbody-Firepump-list-table').on('click', '.View-Request-Details', function () {

    ReqID = this.parentNode.parentNode.children[0].textContent;
    EstID = this.parentNode.parentNode.children[1].textContent;
    Status = this.parentNode.parentNode.children[11].textContent;
    EstimationDetails();
    loadestimator();
    ApprovalBtn();
    AllItemdetails();
    GetAttachmentDet();
    $('#modalFPDetails').modal('show');
});
function EstimationDetails() {

    $.ajax({
        url: "FirePump.aspx/GetAllestimationdetails",
        data: JSON.stringify({ "UserId": currUserId, "EstID": EstID, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#SummarytxtEstRef').html(result.d[0].RefNo);
            $('#SummarytxtPrjName').html(result.d[0].ProjectName);
            $('#SummarytxtProjRef').html(result.d[0].ProjectNumber);
            $('#SummarytxtOppRef').html(result.d[0].OPTNumber);
            $('#SummarytxtRevision').html(result.d[0].RevNo);
            $('#SummarytxtEstYear').html(result.d[0].Year);
            $('#SummarytxtPrjMEPContr').html(result.d[0].MEPContractor);
            $('#SummarytxtPrjConsultant').html(result.d[0].Consultant);
            $('#SummarytxtContrAbbr').html(result.d[0].ContABBR);
            $('#SummarytxtPrjMainContr').html(result.d[0].MainContractor);
            $('#SummarytxtPrjClient').html(result.d[0].Client);
            $('#SummarytxtPrjLocation').html(result.d[0].Location);
            $('#SummarytxtPrjContactPerson').html(result.d[0].ContactName);
            $('#SummarytxtPrjWinningPerc').html(result.d[0].WinPerc);
            $('#SummarytxtPrjBudget').html(result.d[0].Budget);
            $('#SummarytxtPrjURL').html(result.d[0].URL);
            $('#SummaryddlEstimationTeamOrg').html(result.d[0].EstimationOrg);
            $('#SummarytxtSalesman').html(result.d[0].Salesman);
            $('#SummarytxtMarketing').html(result.d[0].Marketing);

            $('select[name=Supply]').val(result.d[0].Scope);
            $('select[name=Stage]').val(result.d[0].Stage);
            $('select[name=Quotation]').val(result.d[0].QuotationType);



            if (result.d[0].PumpSpecification == 'True') {
                $('#chSpecification').prop('checked', true);
            }
            else {
                $('#chSpecification').prop('checked', false);
            }

            if (result.d[0].ListOfMakes == 'True') {
                $('#chListOfMake').prop('checked', true);
            }
            else {
                $('#chListOfMake').prop('checked', false);
            }

            if (result.d[0].PumpShedule == 'True') {
                $('#chPumpshedule').prop('checked', true);
            }
            else {
                $('#chPumpshedule').prop('checked', false);
            }

            if (result.d[0].PumpApproval == 'UL & FM APPROVED') {
                $('#rdUlFmApproved').prop('checked', true);
            }
            else if (result.d[0].PumpApproval == 'NON LISTED') {
                $('#rdNonListed').prop('checked', true);
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


function AllItemdetails() {

    $.ajax({
        url: "FirePump.aspx/getItemDetails",
        data: JSON.stringify({ "UserId": currUserId, "ReqID": ReqID, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var htmen = '';
            var selvalue = '';
            var htmDrop = '';
            PumpClass = '';
            $.each(ProjectDetails, function (key, item) {

                htm += `<tr>  
                 
                  <td style="text-align:center;" class="pump-row" title="`+ item.ItemID + `">` + item.SlNO + `</td>
                   <td style="text-align:center;display:none;">` + item.ItemID + `</td>
                  <td style="text-align:center;" class="pump-row" title="`+ item.ItemID + `">` + item.Area + `</td>
                  <td style="text-align:center;" class="pump-row" title="`+ item.ItemID + `">` + item.Description + `</td>
                  <td style="text-align:center;" class="pump-row" title="`+ item.ItemID + `">` + item.QTY + `</td> 
                  <td style="text-align:center;" class="pump-row" title="`+ item.ItemID + `">` + item.TypeOfPump + `</td> 
                  <td style="text-align:center;"x>
                  <img src="images/icon-View.png" title="View" class="fa-icon-hover View-Item-Details" style="cursor: pointer; width: 24px;" />&nbsp;
                </td>`;

                htm += `</tr>`;
                htm += ` <tr class="hidden_row` + item.ItemID + ` hidden">
                         <td colspan="6">
                          <table class="table table-WL-Details" style="width: 100%;">
                                <thead>
                                    <tr style="text-align: center;">
                                        <th style="background-color: #d20909 !important;color: white !important;">Description</th>
                                        <th style="background-color: #d20909 !important;color: white !important;">Capasity</th>
                                        <th style="background-color: #d20909 !important;color: white !important;">Bars</th>
                                        <th style="background-color: #d20909 !important;color: white !important;">QTY</th>
                                    </tr>
                                </thead>
                                <tbody class="tbody-FP-PumpDet" style="">
                                </tbody>
                            </table>
                            </td>

                </tr>`;


            });

            $('.tbody-FP-Requests').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
$('.tbody-FP-Requests').on('click', '.pump-row', function () {
    ItemID = this.title;
    if (PumpClass != 'hidden_row' + ItemID) {
        if (PumpClass != '') {
            $('.' + PumpClass + '').addClass('hidden');
        }
    }
    PumpClass = 'hidden_row' + ItemID;

    AllPumpdetails();
    if ($('.hidden_row' + ItemID + '').hasClass('hidden') == true) {
        $('.hidden_row' + ItemID + '').removeClass('hidden');
    }
    else {
        $('.hidden_row' + ItemID + '').addClass('hidden');
    }
});


function initiateDataTableItems() {
    objDatatableItems = [];
    objDatatableItems = $('.table-FP-Requests').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /*   order: [[0, 'ASC']]*/
    });
}

$('.tbody-FP-Requests').on('click', '.View-Item-Details', function () {

    ItemID = this.parentNode.parentNode.children[1].textContent;
    PumpInfo();
    $('#modalNewPumpUpdate').modal('show');
});

function AddPumpDetails() {

    $.ajax({
        url: "FirePump.aspx/setPumpDet",
        data: JSON.stringify({ "UserId": currUserId, "ItemID": ItemID, "PumpName": $('#txtPumpName').val(), "Value": $('#txtPumpValue').val(), "QTY": $('#txtPumpQTY').val(), "MoreInfo": $('#txtPumpMoreInfo').val(), "Comments": $('#txtPumpComments').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully..', '');
            $('#modalNewPumpUpdate').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#btnAddPumpInfo').on('click', function () {

    AddPumpDetails();

});

function PumpInfo() {

    $.ajax({
        url: "FirePump.aspx/getPumpInformation",
        data: JSON.stringify({ "UserId": currUserId, "ItemID": ItemID, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtPumpName').val(result.d[0].Name);
            $('#txtPumpValue').val(result.d[0].Value);
            $('#txtPumpQTY').val(result.d[0].PumpQTY);
            $('#txtPumpMoreInfo').val(result.d[0].MoreInformation);
            $('#txtPumpComments').val(result.d[0].Comments);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function AllPumpdetails() {

    $.ajax({
        url: "FirePump.aspx/getPumpDetails",
        data: JSON.stringify({ "UserId": currUserId, "ItemID": ItemID, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var htmen = '';

            $.each(ProjectDetails, function (key, item) {

                htm += `<tr>  
                 
                  <td style="text-align:center;">`+ item.PumpName + `</td>
                  <td style="text-align:center;">`+ item.capasity + `</td>
                  <td style="text-align:center;">`+ item.Bars + `</td>
                  <td style="text-align:center;">`+ item.QTY + `</td>  `;



                htm += `</tr>`;


            });

            $('.tbody-FP-PumpDet').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadestimator() {
    $.ajax({
        url: "FirePump.aspx/GetAllestimator",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Estimator --- </option> ';
            empList = result.d;

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.User_Id + '">  ' + item.EmpNo + ` | ` + item.EmpName + '</option>';
            });

            $('#ddlAssignTo').html(htm);
            $("#ddlAssignTo").select2({
                dropdownParent: $("#modalFPDetails"),
                width: '100%',
                height: '73%'
            });

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function UserBase() {
    var htm = '';
    if (myroleList.includes("15217") || myroleList.includes("8123") || myroleList.includes("14214") || myroleList.includes("14213")) {

        htm += `<option style="font-style: normal;" value="SUBMITTED"> PENDING </option>
                <option style = "font-style: normal;" value = "ASSIGNED">ASSIGNED</option>
                <option style = "font-style: normal;" value = "COMPLETE">COMPLETE</option>`;

    }
    else if (myroleList.includes("15218")) {
        htm += `<option style="font-style: normal;" value="ASSIGNED">PENDING</option>
                <option style = "font-style: normal;" value = "COMPLETE">COMPLETE</option>
                <option style = "font-style: normal;" value = "RELEASED">RELEASED</option>`
            ;

    }
    else if (myroleList.includes("16220")) {
        htm += `<option style="font-style: normal;" value="COMPLETE">PENDING</option>
                <option style = "font-style: normal;" value = "RELEASED">RELEASED</option>`;
    }
    $('#ddlRequestStatus').html(htm);


    if (myroleList.includes("15217") || myroleList.includes("8123") || myroleList.includes("14214")) {

        $('#btnAddPumpInfo').css('display', 'none');

    }
    else if (myroleList.includes("15218")) {
        $('#btnAddPumpInfo').css('display', '');
    }

}

$('#btnAssignTo').on('click', function () {
    if ($('#ddlAssignTo option:selected').val() == '-1') {
        toastr.error('Please Select estimator..', '');
    }
    else {
        AssignedTo();
    }
});

function AssignedTo() {
    $.ajax({
        url: "FirePump.aspx/setAssignTo",
        data: JSON.stringify({ "UserId": currUserId, "AssignedTo": $('#ddlAssignTo option:selected').val(), "ReqID": ReqID, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            toastr.success('Updated Successfully..', '');
            $('.ajax-loader').removeClass('hidden');
            setTimeout(function () {
                AllRequests('Please Wait..');
                $(".ajax-loader").addClass('hidden');
            }, 500);
            $('#modalFPDetails').modal('hide');

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function ApprovalBtn() {

    if ((myroleList.includes("15217")) && Status == 'SUBMITTED') {

        $('#btnAddPumpInfo').css('display', 'none');
        $('.div-assign').css('display', '');
        $('.div-Complete').css('display', 'none');
        $('.div-Release').css('display', 'none');
        $('.div-TechnicalNote').css('display', 'none');
        $('.btnAddAddiItemsTOC').css('display', 'none');
        $('.ibtn-delete-addiitemtoc').css('display', 'none');


    }
    else if (myroleList.includes("15218") && Status == 'ASSIGNED') {
        $('.div-assign').css('display', 'none');
        $('.div-Complete').css('display', '');
        $('.div-Release').css('display', 'none');
        $('.div-TechnicalNote').css('display', 'none');
        $('.btnAddAddiItemsTOC').css('display', '');
        $('.ibtn-delete-addiitemtoc').css('display', '');
        $('#btnAddPumpInfo').css('display', '');
    }
    else if ((myroleList.includes("16220")) && Status == 'COMPLETE') {

        $('#btnAddPumpInfo').css('display', 'none');
        $('.div-assign').css('display', 'none');
        $('.div-Complete').css('display', 'none');
        $('.div-Release').css('display', '');
        $('.div-TechnicalNote').css('display', '');
        $('.btnAddAddiItemsTOC').css('display', 'none');
        $('.ibtn-delete-addiitemtoc').css('display', 'none');


    }

    else {
        $('.div-assign').css('display', 'none');
        $('.div-Complete').css('display', 'none');
        $('.div-Release').css('display', 'none');
        $('.div-TechnicalNote').css('display', '');
        $('#btnAddPumpInfo').css('display', 'none');
        $('.btnAddAddiItemsTOC').css('display', 'none');
        $('.ibtn-delete-addiitemtoc').css('display', 'none');
    }
}


$('#btnComplete').on('click', function () {
    $("#ReqTechRemarksModal").modal('show');
    $(".ritext-tech-remarks-div").html('<input class="form-control " type="text" placeholder="" value="" id="taTechRemarks">');
    initiateRichText();
    $(".btnAddTechRemarks").removeClass("hidden");
    //Complete();
});


$('#btnTechnicalNote').on('click', function () {
    $("#ReqTechRemarksModal").modal('show');
    
    $.ajax({
        url: "FirePump.aspx/GetTechnicalNote",
        data: JSON.stringify({ "UserId": currUserId, "ReqID": ReqID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $(".ritext-tech-remarks-div").html('<input class="form-control " type="text" placeholder="" value="' + result.d +'" id="taTechRemarks">');
            //$(".ritext-tech-remarks-div").find('#taTechRemarks').html(result.d);
            initiateRichText();

            $(".btnAddTechRemarks").addClass("hidden");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


 
    
    //Complete();
});


function Complete() {
    $.ajax({
        url: "FirePump.aspx/setComplete",
        data: JSON.stringify({ "UserId": currUserId, "ReqID": ReqID, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == 0) {
                toastr.error('Please fill the Item Details..', '');
            }
            else {
                toastr.success('Updated Successfully..', '');
                $('.ajax-loader').removeClass('hidden');
                setTimeout(function () {
                    AllRequests('Please Wait..');
                    $(".ajax-loader").addClass('hidden');
                }, 500);
                $('#modalFPDetails').modal('hide');
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function GetAttachmentDet() {

    $.ajax({
        url: "FirePump.aspx/AttachmentDet",
        data: JSON.stringify({ "UserId": currUserId, "ReqID": ReqID, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var urlService = '';


            $.each(ProjectDetails, function (key, item) {

                urlService = 'Services/DownloadFile.ashx?attachurl=' + item.URL;  // for production
                htm += `<tr>        
               

                  <td style="text-align:center;display:none;">`+ item.ID + `</td>
                  <td style="text-align:center;">`+ item.FileName + `</td>
                  <td style="text-align:center;">`+ item.Comments + `</td>
                   <td style="text-align:center;display:none">`+ item.URL + `</td>
                   <td style="text-align:center;">
                   <a href="`+ urlService + `" download="` + item.FileName + `" type="button" class="AttatchmentDownload" title="Download" >
                   <img src="images/icons8-download-48.png" title="Download" class="fa-icon-hover ibtn-Download-Details" style="cursor: pointer; width: 34px;" />
                </a></td>`;



                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Attachment-list').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnNewAttacment').on('click', function () {

    ClearAttachment();
    $('#ModalPumpAttachment').modal('show');

});

function ClearAttachment() {
    $('#txtAttachmentComment').val('');
    $('#colFileUpload').val('');
}

$('#btnUpload1').on('click', function () {
    if ($('#colFileUpload').val().trim() != "" && $('#txtAttachmentComment').val().trim() != "") {
        ERMFileUpload();
    } else {
        toastr.error('Required All Fields. ', '');
    }

});


function ERMFileUpload() {




    var formData = new FormData();
    var formData = new FormData();
    var fileUpload = $('#colFileUpload').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }


    var qrystringLocal = 'https://crmss.naffco.com/CRMSS/ERM/Services/FirePumpUpload.ashx?ReqID=' + ReqID + '&UserId=' + currUserId + '&Comments=' + $('#txtAttachmentComment').val();    // For Development
    /* var qrystringLocal = '../ERM/Services/FirePumpUpload.ashx?ReqID=' + ReqID + '&UserId=' + currUserId + '&Comments=' + $('#txtAttachmentComment').val();*/    // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        async: false,
        success: function (status) {
            if (status != 'error') {

                toastr.success("Updated Successfully");
                GetAttachmentDet();
                $('#ModalPumpAttachment').modal('hide');

            }
        },
        processData: false,
        contentType: false,
        error: function (errormessage) {
            console.log(errormessage.responseText);
            alert("Whoops something went wrong!");

        }
    });

}



$(".btnAddTechRemarks").on('click', function () {

    if ($("#taTechRemarks").val().trim() == "" || $("#taTechRemarks").val().trim().length < 10) {
        toastr.error("Please input the Technical remarks", '');
    }
    else {

        $.ajax({
            url: "FirePump.aspx/setComplete",
            data: JSON.stringify({
                "UserId": currUserId, "ReqID": ReqID,
                "TechNotes": $("#taTechRemarks").val()
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                if (result.d == 0) {
                    toastr.error('Please fill the Item Details..', '');
                }
                else {
                    toastr.success('Updated Successfully..', '');
                    $('.ajax-loader').removeClass('hidden');
                    setTimeout(function () {
                        AllRequests('Please Wait..');
                        $(".ajax-loader").addClass('hidden');
                    }, 500);
                    $('#modalFPDetails').modal('hide');
                }

            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }
});



$("#btnRelease").on('click', function () {

   
        $.ajax({
            url: "FirePump.aspx/ReleasePumpEstimation",
            data: JSON.stringify({
                "UserId": currUserId, "ReqID": ReqID
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                if (result.d) {
                    toastr.success('Updated Successfully..', '');
                    $('.ajax-loader').removeClass('hidden');
                    setTimeout(function () {
                        AllRequests('Please Wait..');
                        $(".ajax-loader").addClass('hidden');
                    }, 500);
                    $('#modalFPDetails').modal('hide');
                }

            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

});





$('.btn-add-additionalitems').on('click', function () {
    loadAllAddedPumps();
    getAllEMSProductsByReqId();
    $('#addiItemsInTOC').modal('show');
    resetEMSProdControls()
});



function getAllEMSProductsByReqId() {

    $.ajax({
        url: "FirePump.aspx/GetAllEMSProductsByReqId",
        type: "POST",
        data: JSON.stringify({
            "UserId": currUserId,
            "ReqId": ReqID
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $('.tbody-addiitems-toc td').length > 0 ? objDTEMSProd.destroy() : '';
            $.each(result.d, function (key, item) {
                htm += `<tr>               
                    <td> `+ item.EMSProd + ` </td>                 
                    <td> `+ item.Price + `</td>
                    <td> `+ (item.Optional == "False" ? '-' : '<i class="bx bx-check" style="color: #38b316;"></i>') + `</td>
                    <td> `+ item.Desc + `</td>
                    <td> `+ item.Comment + `</td>
                    <td> `+ item.CreatedBy + `</td>
                      <td> <span><i class="bx bxs-trash ibtn-delete-addiitemtoc hide-control-bos" style="font-size: 1.6rem;color: #d64e4e;cursor:pointer;" title="Delete Item" onclick="deleteAddiItem(` + item.ID + `)"></i></span></td>`


                htm += `</tr>`;
            });
            $('.tbody-addiitems-toc').html(htm);
            initiateEMSProdDT()
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });

}
function initiateEMSProdDT() {
    objDTEMSProd = [];
    objDTEMSProd = $('.item-emsprod-table').DataTable({
        dom: 'lBfrtip',
        "bStateSave": true,
        buttons: {
            buttons: []
        },

        "columnDefs": [
            { width: "120px", targets: [0] },
            { orderable: false, targets: [] }
        ],
        //select: true,
        //colReorder: true
    });

}
function deleteAddiItem(additemid) {
    $.ajax({
        url: "FirePump.aspx/DeleteAddiItem",
        type: "POST",
        data: JSON.stringify({
            "AddItemId": additemid
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Item Deleted Successfully', '')
            getAllEMSProductsByReqId();
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}


function resetEMSProdControls() {
    $("#txtPrice").val('0')
    $("#taAddiDesc,#taAddiComments").val('')
    $("#cbAddiIsOptional").prop('checked', false)
    $("#taAddiDesc,#taAddiComments,#txtPrice").css('box-shadow', '').css('border-color', 'lightgrey');
}

$(".btnAddAddiItemsTOC").on('click', function () {
    if (!validateEMSProdControls()) {
        toastr.error('Please input the mandatory field(s)')
    }
    else {
        $.ajax({
            url: "FirePump.aspx/AddAdditionalItemInTOC",
            type: "POST",
            data: JSON.stringify({
                "UserId": currUserId,
                "Product": 'Fire Fighting',
                "Price": $("#txtPrice").val(),
                "IsOptional": ($("#cbAddiIsOptional").is(':checked') ? 1 : 0),
                "Desc": $("#taAddiDesc").val(),
                "AdditionalComm": $("#taAddiComments").val(),
                "ReqId": ReqID,
                "Name": $("#ddlEMSFirePumps option:selected").text()
            }),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                toastr.success('Additional Item Added Successfully');
                getAllEMSProductsByReqId()

            },
            error: function (errormessage) {
                ////alert(errormessage.responseText);
            }
        });
    }


})

function validateEMSProdControls() {

    var isValid = true;

    if ($("#txtPrice").val().trim() == "") {
        isValid = false;
        $("#txtPrice").css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    } else {
        $("#txtPrice").css('box-shadow', '').css('border-color', 'lightgrey');
    }
    if ($("#taAddiDesc").val().trim() == "") {
        isValid = false;
        $("#taAddiDesc").css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    } else {
        $("#taAddiDesc").css('box-shadow', '').css('border-color', 'lightgrey');
    }
    if ($("#taAddiComments").val().trim() == "") {
        isValid = false;
        $("#taAddiComments").css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    } else {
        $("#taAddiComments").css('box-shadow', '').css('border-color', 'lightgrey');
    }
    return isValid;
}


//$.fn.modal.Constructor.prototype.enforceFocus = function () { };
function loadAllAddedPumps() {

    $.ajax({
        url: "EMSItemList.aspx/loadAllAddedPumps",
        type: "POST",
        data: JSON.stringify({ "id": ReqID }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var _allpumps = '';

             _allpumps += '<option value = "-1" >-- All --</option>'
            $.each(result.d, function (key, item) {
                _allpumps += '<option value = "' + item.Value + '" > ' + item.Name + '</option> ';
            });

            $('#ddlEMSFirePumps').html(_allpumps);
           
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}


//END-------------------On Fire Pump Side------------------// 