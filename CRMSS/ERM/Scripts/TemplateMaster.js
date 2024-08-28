
var _current = 0;
var buildingFloorArr = []; finalPara = [];
var selStructId = 0; 
var FloorTypesArr = [];
var selTempID = 0, selTempRef = '';
var listStructureDeets = [];
var listStructureBasic = [], listReqStructFloors = [];
var objStructure = [], objFloors = [];
$(document).ready(function () {
    $(".next-control").addClass("disabled")

    getAllFloorTypes();
    generateHTMLForFlrTypes();
});
const slider = (function () {

    //const
    const slider = document.getElementById("slider"); // main wrapper
    console.log(slider);
    const sliderContent = document.querySelector(".slider-content"); // wrapper for container of slides and controls
    console.log(sliderContent);
    const sliderWrapper = document.querySelector(".slider-content-wrapper"); // slide container
    const elements = document.querySelectorAll(".slider-content__item"); // slide wrap
    const sliderContentControls = createHTMLElement("div", "slider-content__controls"); // block of controls inside sliderContent
    let dotsWrapper = null; // Wrap dots
    let prevButton = null; // Buttons
    let nextButton = null;
    let autoButton = null;
    let leftArrow = null; // Arrows
    let rightArrow = null;
    let intervalId = null; // id setInterval


    // data
    const itemsInfo = {
        offset: 0, // displacement of the container with slides relative to the starting point (first slide)
        position: {
            current: 0, // current slide number

            min: 0, // first slide

            max: elements.length - 1 // last slide
        },
        intervalSpeed: 2000, // Slide change speed in auto mode

        update: function (value) {
            this.position.current = value;
            this.offset = -value;
        },
        reset: function () {
            this.position.current = 0;
            this.offset = 0;
        }
    };

    const controlsInfo = {
        buttonsEnabled: false,
        dotsEnabled: false,
        prevButtonDisabled: true,
        nextButtonDisabled: false
    };

    // Initializing the slider
    function init(props) {
        // let {buttonsEnabled, dotsEnabled} = controlsInfo;
        let { intervalSpeed, position, offset } = itemsInfo;

        // Checking the presence of markup elements
        if (slider && sliderContent && sliderWrapper && elements) {
            // Checking input parameters
            if (props && props.intervalSpeed) {
                intervalSpeed = props.intervalSpeed;
            }
            if (props && props.currentItem) {
                if (parseInt(props.currentItem) >= position.min && parseInt(props.currentItem) <= position.max) {
                    position.current = props.currentItem;
                    offset = - props.currentItem;
                }
            }
            if (props && props.buttons) {
                controlsInfo.buttonsEnabled = true;
            }
            if (props && props.dots) {
                controlsInfo.dotsEnabled = true;
            }

            _updateControlsInfo();
            _createControls(controlsInfo.dotsEnabled, controlsInfo.buttonsEnabled);
            _render();
        } else {
            console.log("The slider layout is set incorrectly. Check that all required classes are available 'slider/slider-content/slider-wrapper/slider-content__item'");
        }
    }

    // Update control properties
    function _updateControlsInfo() {
        const { current, min, max } = itemsInfo.position;
        controlsInfo.prevButtonDisabled = current > min ? false : true;
        controlsInfo.nextButtonDisabled = current < max ? false : true;
    }

    // Creating markup elements
    function _createControls(dots = false, buttons = false) {

        //Wrapper for controls
        sliderContent.append(sliderContentControls);

        // Controls
        //createArrows();
        buttons ? createButtons() : null;
        dots ? createDots() : null;

        // Arrows function
        function createArrows() {
            const dValueLeftArrow = "M31.7 239l136-136c9.4-9.4 24.6-9.4 33.9 0l22.6 22.6c9.4 9.4 9.4 24.6 0 33.9L127.9 256l96.4 96.4c9.4 9.4 9.4 24.6 0 33.9L201.7 409c-9.4 9.4-24.6 9.4-33.9 0l-136-136c-9.5-9.4-9.5-24.6-.1-34z";
            const dValueRightArrow = "M224.3 273l-136 136c-9.4 9.4-24.6 9.4-33.9 0l-22.6-22.6c-9.4-9.4-9.4-24.6 0-33.9l96.4-96.4-96.4-96.4c-9.4-9.4-9.4-24.6 0-33.9L54.3 103c9.4-9.4 24.6-9.4 33.9 0l136 136c9.5 9.4 9.5 24.6.1 34z";
            const leftArrowSVG = createSVG(dValueLeftArrow);
            const rightArrowSVG = createSVG(dValueRightArrow);
            leftArrow = createHTMLElement("div", "prev-arrow");
            leftArrow.append(leftArrowSVG);
            leftArrow.addEventListener("click", () => updateItemsInfo(itemsInfo.position.current - 1))

            rightArrow = createHTMLElement("div", "next-arrow");
            rightArrow.append(rightArrowSVG);
            rightArrow.addEventListener("click", () => updateItemsInfo(itemsInfo.position.current + 1))

            sliderContentControls.append(leftArrow, rightArrow);
        }

        // SVG function
        function createSVG(dValue, color = "currentColor") {
            const svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
            svg.setAttribute("viewBox", "0 0 256 512");
            const path = document.createElementNS("http://www.w3.org/2000/svg", "path");
            path.setAttribute("fill", color);
            path.setAttribute("d", dValue);
            svg.appendChild(path);
            return svg;
        }

        // Dots function
        function createDots() {
            dotsWrapper = createHTMLElement("div", "dots");
            for (let i = 0; i < itemsInfo.position.max + 1; i++) {
                const dot = document.createElement("div");
                dot.className = "dot";
                dot.addEventListener("click", function () {
                    updateItemsInfo(i);
                })
                dotsWrapper.append(dot);
            }
            sliderContentControls.append(dotsWrapper);
        }

        // Buttons function
        function createButtons() {

            const controlsWrapper = createHTMLElement("div", "slider-controls");
            _current = itemsInfo.position.current + 1;
            prevButton = createHTMLElement("a", "prev-control btn btn-primary me-2 mb-4", "Prev", _current);
            prevButton.addEventListener("click", () => updateItemsInfo(itemsInfo.position.current - 1))

            //autoButton = createHTMLElement("a", "auto-control btn btn-primary disabeld", "Auto");
            //autoButton.addEventListener("click", () => {
            //    intervalId = setInterval(function () {
            //        if (itemsInfo.position.current < itemsInfo.position.max) {
            //            itemsInfo.update(itemsInfo.position.current + 1);
            //        } else {
            //            itemsInfo.reset();
            //        }
            //        _slideItem();
            //    }, itemsInfo.intervalSpeed)
            //})

            nextButton = createHTMLElement("a", "next-control btn btn-primary disabeld mb-4", "Next", _current);
            nextButton.addEventListener("click", () => updateItemsInfo(itemsInfo.position.current + 1))

            //controlsWrapper.append(prevButton, autoButton, nextButton);
            controlsWrapper.append(prevButton, nextButton);
            slider.append(controlsWrapper);
        }
    }

    // Set a class for controls (buttons, arrows)
    function setClass(options) {
        if (options) {
            options.forEach(({ element, className, disabled }) => {
                if (element) {
                    disabled ? element.classList.add(className) : element.classList.remove(className)
                } else {
                    console.log("Error: function setClass(): element = ", element);
                }
            })
        }
    }

    // Update slider values
    function updateItemsInfo(value) {
        itemsInfo.update(value);
        _slideItem(true);
    }

    // Show items
    function _render() {
        const { prevButtonDisabled, nextButtonDisabled } = controlsInfo;
        let controlsArray = [
            { element: leftArrow, className: "d-none", disabled: prevButtonDisabled },
            { element: rightArrow, className: "d-none", disabled: nextButtonDisabled }
        ];
        if (controlsInfo.buttonsEnabled) {
            controlsArray = [
                ...controlsArray,
                { element: prevButton, className: "disabled", disabled: prevButtonDisabled },
                { element: nextButton, className: "disabled", disabled: nextButtonDisabled }
            ];
        }

        // Showing/hiding controls
        setClass(controlsArray);

        // Moving the slider
        sliderWrapper.style.transform = `translateX(${itemsInfo.offset * 100}%)`;

        // Set the active element for points (dot)
        if (controlsInfo.dotsEnabled) {
            if (document.querySelector(".dot--active")) {
                document.querySelector(".dot--active").classList.remove("dot--active");
            }
            dotsWrapper.children[itemsInfo.position.current].classList.add("dot--active");
        }
    }

    // Move slide
    function _slideItem(autoMode = false) {
        if (autoMode && intervalId) {
            clearInterval(intervalId);
        }
        _updateControlsInfo();
        _render();
    }

    // Create HTML markup for an element
    function createHTMLElement(tagName = "div", className, innerHTML, id) {
        const element = document.createElement(tagName);
        className ? element.className = className : null;
        innerHTML ? element.innerHTML = innerHTML : null;
        id ? element.id = id : null;


        return element;
    }

    // Available Methods
    return { init };
}())

slider.init({
    // intervalSpeed: 1000,
    currentItem: 0,
    buttons: true,
    dots: true
});



function insertTemplate() {
    $.ajax({
        url: "TemplateMaster.aspx/AddUpdateTemplate",
        data: JSON.stringify({
            "TmptID": selTempID,
            "Code": selTempRef,
            "TName": $("#TempName").val(),
            "TDesc": $("#TempDesc").val(),
            "UserId": currUserId,
            "EmpNo": EmpNo
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Template has been added successfully');
            _goNext();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function _goNext() {
    $(".next-control").removeClass("disabled")
}
function getLastTempID() {
    $.ajax({
        url: "TemplateMaster.aspx/getLastTempID",
        data: JSON.stringify({ /*"UserID": currUserId, "TmptID": selTempID*/ }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            selTempID = result.d[0].ID;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function getLastREF() {
    $.ajax({
        url: "TemplateMaster.aspx/getLastREF",
        data: JSON.stringify({ "TmptID": selTempID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            selTempRef = result.d[0].RefNo;
            $("#RefNo").html(selTempRef);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$("#TempName, #TempDesc").on('change', function () {
    _nextbtnvalidation()
});

$("#stcName, #stcCount, #stcDesc").on('change', function () {
    _nextbtnvalidation()
});
function _nextbtnvalidation() {
    
    if ($("#TempName").val() != '' && $("#TempDesc").val() != '') {
        $("._createTemplate").removeClass("disabled")
    }
    else {
        $("._createTemplate").addClass("disabled");
    }

    if ($("#stcName").val() != '' && $("#stcCount").val() != '' && $("#stcDesc").val() != '') {
        $(".btnSaveItem").removeClass("disabled");
    }
    else {
        $(".btnSaveItem").addClass("disabled");
    }

}

//$(".next-control").on('click', function () {
//    slider.init._createControls.createButtons({
//    });
//});

$("._createTemplate").on('click', function () {
    insertTemplate();
});

$(".pill-temp-create-tab").on('click', function () {
    $(".next-control").addClass("disabled")
});

$("#_startbtn").on('click', function () {
    getLastTempID();
    getLastREF();
    
    $("#_startbtn").addClass("disabled");
    $("#refDone").removeClass("hidden");
    _goNext();
});
$(".btnSaveItem").on('click', function () {
    $(".next-control").removeClass("disabled")
});
$(".next-control").on('click', function () {
    $(".next-control").addClass("disabled")
});



//================== STRUCTURE WORK ===========================//


var buildingFloorArr = []; finalPara = [];

$('.btnSaveItem').on('click', function () {
    buildingFloorArr = [];
    $('#mainFloorTypes .mainFloorSub input[type=checkbox]:checked').each(function (key, item) {
        let bItem = {};
        bItem["FloorType"] = item.value;
        bItem["NoOfFloors"] = $(item).parent().parent().children().eq(1).children().val()
        bItem["OrderNo"] = $(item).parent().parent().children().eq(2).children().val()
        bItem["StartFrom"] = $(item).parent().parent().children().eq(3).children().val()

        buildingFloorArr.push(bItem);
    });

    finalPara = {
        'oListBuilFloor': buildingFloorArr
    }

    if (!validateTaskControls()) {
        toastr.error("Please input the mandatory field(s)", '');
    }
    else {

        if ($(".btnSaveItem").html().trim() == "Create") {
            AddStructure();
        }
        else if ($(".btnSaveItem").html().trim() == "Update") {
            AddStructure();
        }

    }
});

function AddStructure() {

    $.ajax({
        url: "TemplateMaster.aspx/AddStructure",
        data: JSON.stringify({
            "StructId": selStructId,
            "TmptID": selTempID,
            "UserID": currUserId,
            "Name": $('#stcName').val().trim(),
            "Desc": $('#stcDesc').val().trim(),
            "TotalNumberofFloor": $('#stcCount').val().trim(),
            'data': finalPara
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Structure added successfully.', '');

            selStructId = result.d;

            ViewStructure();
            generateHTMLForStruct();
            $(".btnSaveItem").addClass("disabled");
            _goNext();

            getAllSystem('');
            getCategoryBySystem($('#ddlSystem option:selected').val(), '');
            $('#btnItemFilterTOC').trigger('click');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function ViewStructure() {

    $.ajax({
        url: "TemplateMaster.aspx/ViewStructure",
        data: JSON.stringify({
            "TmptID": selTempID,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listStructureBasic = result.d.listReqMaster;
            listReqStructFloors = result.d.listReqStructFloors;

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function generateHTMLForStruct() {
    var htm = '';
    //  $('.tbody-Structure td').length > 0 ? objdatatableStructure.destroy() : '';

    $.each(listStructureBasic, function (key, item) {


        htm += `<div class="accordion-item">
                            <div class="card">
                                <h2 class="card-header" id="heading`+ item.prjNumber + `-` + item.StructureID + `">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse` + item.StructureID + `" aria-expanded="false" aria-controls="collapse` + item.StructureID + `" style="color: #000000;text-transform: capitalize;">` + (key + 1) + `.  ` + item.StructureName + `<span class="position-absolute" style="right: 80px;"> Total Floors:  ` + item.TotalNumberOfFloor + `</span></button>
                                 </h2>

                                 <div id="collapse` + item.StructureID + `" class="accordion-collapse collapse show" aria-labelledby="heading` + item.prjNumber + `-` + item.StructureID + `" data-bs-parent="#accordionStructure">
                                    <div class="card-body">
                                    
                                        <div class="row">

                                            <div class="col-12">
                                                <button type="button" class="btn btn-primary btnAddTypical float-right" style="" onclick="openTypicalModal(` + selTempID + `,` + item.StructureID + `)">Add Typical Floors</button>
                                            </div>

                                            <div class="col-1">
                                                <div class="table">
                                                    <table class="table project-table table-Structure">
                                                        <tbody>
                                                            <tr>
                                                                <td  class="fw-bold"> Floor Name</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="fw-bold"> Floor Type</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="fw-bold"> Typical</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="fw-bold"> Typical Of</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="col-11">
                                                <div class="table" style="overflow-x: scroll;">
                                                    <table class="table project-table d-flex">
                                                    `+ ViewStructureDeets(item.StructureID) + `
                                                    </table>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                        
                        </div>`

        // htm += `</tr>`;
    });
    $('#accordionStructure').html(htm);
}
function ViewStructureDeets(strctid) {
    var htm = '';
    //$('.tbody-Structure td').length > 0 ? objdatatableStructure.destroy() : '';

    var res = listReqStructFloors.filter(xx => xx.StructureID == strctid);

    $.each(res, function (key, item) {

        htm += `
                <tbody class="text-nowrap" style="width:100px;float: left; margin-right:0px">
                    <tr style="width:100px;"><td class="fw-bold" style="width:100px;">`+ item.Name + `</th></tr>
                    <tr style="width:100px;"><td style="width:100px;"> `+ item.Type + `</td></tr>
                    <tr style="width:100px;"><td style="width:100px;"> `+ (item.IsTypical == '' ? '-' : "<i class='bx bx-check' style='color: #38b316;'></i>") + `</td></tr>
                    <tr style="width:100px;"><td style="width:100px;"> `+ (item.TypicalOf == '' ? '-' : item.TypicalOf) + `</td></tr>
                </tbody>`

        htm += `</tr>`;
    });
    return htm;

    //$('.tbody-Structure').html(htm);


}
function AddMoreFloorType() {
    if ($("#txtFlrTypeName").val().trim() == "" && $("#txtFlrTypeAlias").val().trim() == "") {
        toastr.error("Please input Floor Name and Floor Alias")
    }
    else {
        $.ajax({
            url: "EMSItemList.aspx/AddFloorType",
            data: JSON.stringify({
                "FloorTypeName": $("#txtFlrTypeName").val().trim(),
                "FloorTypeAlias": $("#txtFlrTypeAlias").val().trim()
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                if (result.d.ErrorType == "error") {
                    toastr.error(result.d.MsgText, '');
                } else {
                    toastr.success(result.d.MsgText, '');
                    getAllFloorTypes();
                    generateHTMLForFlrTypes();
                    openModalEditStruct(selStructId);
                }
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

}

function getAllFloorTypes() {
    $.ajax({
        url: "TemplateMaster.aspx/GetAllFloorTypes",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            FloorTypesArr = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function generateHTMLForFlrTypes() {
    var htm = '';

    $.each(FloorTypesArr, function (key, item) {
        htm += ` <div class="mainFloorSub d-flex">
                    <div class="form-check col-5 ps-5 ">
                        <input class="form-check-input" name="cb-floors-type" type="checkbox" value="`+ item.Value + `" id="cbflrtype-` + key + `">
                        <label class="form-check-label" for="cbflrtype-` + key + `">
                            `+ item.Text + `
                        </label>
                    </div>
                    <div class="col-4 mb-2">
                        <input class="form-control" name="txtForFloorsTypes" type="number"  placeholder="enter floors..." disabled>
                    </div>
                    <div class="col-3 mb-2">
                        <input class="form-control" name="txtForFloorsTypes" type="number" placeholder="order #..." disabled>
                    </div>
                    <div class="col-2 mb-2">
                         <input class="form-control" name="txtForFloorsTypes" type="number" value="1" min="0" placeholder="Start From" disabled>
                    </div>
                </div>`
    });

    $("#mainFloorTypes").html(htm);
}

function openTypicalModal(reqid, structid) {

    $("#cbTypicalALL").prop('checked', false)

    selTempID = reqid;
    selStructId = structid;

    var stRes = listReqStructFloors.filter(s => s.StructureID == selStructId);
    let distinctFloorTypeArr = stRes.map(item => item.Type).filter((value, index, self) => self.indexOf(value) === index);
    fillFloorTypeDDL(distinctFloorTypeArr);

    $(".temp-sel-typifloor-table-div").css('border', 'lightgrey');
    $('#tagFloorTypical').modal('show');
    $('#tagFloorTypicalLabel').html('Typical Floor - ' + listStructureBasic.filter(s => s.StructureID == selStructId)[0].StructureName);

}
$('#cbIsTypical').on('click', function () {
    // $('#cbIsTypical').is(':checked') == true ? $('#ddlFloorMaster').prop('disabled', false) : $('#ddlFloorMaster').prop('disabled', true);

    var ids = '';
    let start = $('#ddlFloorFrom option:selected').text().trim() - 1;
    let end = $('#ddlFloorTo option:selected').text().trim() - 1;
    for (var i = start; i <= end; i++) {
        ids += $('#ddlFloorFrom option:eq(' + i + ')').val() + ",";
    }
    ids = removeCommaFromLast(ids);

});
function fillFloorTypeDDL(typeArr) {
    var htm = '';
    $.each(typeArr, function (key, item) {
        htm += '<option value="' + item + '"> ' + item + ' </option>'
    });
    $('#ddlFloorType').html(htm);
    $('#ddlFloorType').trigger('change');
}
$('#ddlFloorType').on('change', function (a, b) {

    let selFlrType = $('#ddlFloorType option:selected').val();
    var res = listReqStructFloors.filter(s => s.StructureID == selStructId && s.Type == selFlrType);

    var htm = '';
    $.each(res, function (key, item) {
        let cnt = (item.StartFrom == "" || item.StartFrom == 1) ? (key + 1) : (parseInt(item.StartFrom) + key)
        htm += '<option value="' + item.StructFloorDetId + '"> ' + cnt + ' </option>'
    });
    $('#ddlFloorFrom').html(htm);
    $('#ddlFloorTo').html(htm);
    $('#ddlFloorMaster').html(htm);

    $('#ddlFloorTo').val($('#ddlFloorTo option:eq(' + ($('#ddlFloorTo option').length - 1) + ')').val());

    $('#ddlFloorFrom').trigger('change');
  
});


$('#ddlFloorFrom,#ddlFloorTo,#ddlFloorMaster').on('change', function (a, b) {
    let selFlrType = $('#ddlFloorType option:selected').val();
    var filteredRec = [];

    let start = $("#ddlFloorFrom  option:selected").index();
    let end = $("#ddlFloorTo  option:selected").index();
    for (var i = start; i <= end; i++) {
        if ($('#ddlFloorFrom option:eq(' + i + ')').val() != $("#ddlFloorMaster option:selected").val()) {
            filteredRec.push(listReqStructFloors.filter(s => s.StructFloorDetId == $('#ddlFloorFrom option:eq(' + i + ')').val()));
        }

    }

    var htm = '';
    $.each(filteredRec, function (key, item) {
        let attr = item[0].IsTypical == "True" ? "checked" : "";
        htm += `<tr>
                    <td> 
                        <div style="display: flex;justify-content: center;">
                            <input class="form-check-input position-relative" type="checkbox" name="cbIsTypical" value="`+ item[0].StructFloorDetId + `" id="cbTypical-` + item[0].StructFloorDetId + `" ` + attr + `> 
                        </div>
                    </td>                 
                    <td> `+ item[0].Name + ` </td>                 
                    <td> `+ item[0].Type + `</td>
                    <td> `+ item[0].TypicalOf + `</td>`

        htm += `</tr>`;
    });
    $('.tbody-temp-sel-typifloor').html(htm);

});

$("#cbTypicalALL").on('click', function () {
    if ($(this).is(':checked')) {
        $(".tbody-temp-sel-typifloor input[name=cbIsTypical]").prop('checked', true)
    } else {
        $(".tbody-temp-sel-typifloor input[name=cbIsTypical]").prop('checked', false)
    }
})

$('.btnUpdateTypicalFloors').on('click', function () {
    let ids = ''; let unSelectIds = '';
    $('.tbody-temp-sel-typifloor input[name=cbIsTypical]:checked').each(function (key, item) {
        ids += item.value + ",";
    });
    ids = removeCommaFromLast(ids);

    $('.tbody-temp-sel-typifloor input[name=cbIsTypical]:not(:checked)').each(function (key, item) {
        unSelectIds += item.value + ",";
    });
    unSelectIds = removeCommaFromLast(unSelectIds);

    if (ids == "") {
        toastr.error("Please select atleast one floor for typical from below grid.", '');
        $(".temp-sel-typifloor-table-div").css('border', '1px solid #ff4e4e');
    }
    else {
        updateFloorsAsTypical(ids, unSelectIds == "" ? 0 : unSelectIds);
        $(".temp-sel-typifloor-table-div").css('border', 'lightgrey');
    }
    _goNext();
});
function updateFloorsAsTypical(strctids, structidsforunselect) {

    $.ajax({
        url: "TemplateMaster.aspx/UpdateFloorsAsTypical",
        data: JSON.stringify({
            "StrctDetIds": strctids,
            "StrctDetIdsForUnSelect": structidsforunselect,
            "MasterFloor": $('#ddlFloorMaster option:selected').text().trim(),
            "FloorType": $('#ddlFloorType option:selected').val().trim()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success("Updated successfully", '');
            ViewStructure();
            generateHTMLForStruct();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
$("#mainFloorTypes").on('click', 'input[name=cb-floors-type]', function () {

    if ($(this).is(':checked')) {
        $(this).parent().parent().children().eq(1).children().prop('disabled', false)
        $(this).parent().parent().children().eq(2).children().prop('disabled', false)
        $(this).parent().parent().children().eq(3).children().prop('disabled', false)

        $(this).parent().parent().children().eq(1).children().val('')
        $(this).parent().parent().children().eq(2).children().val('')
        $(this).parent().parent().children().eq(3).children().val('')
    } else {
        $(this).parent().parent().children().eq(1).children().prop('disabled', true)
        $(this).parent().parent().children().eq(2).children().prop('disabled', true)
        $(this).parent().parent().children().eq(3).children().prop('disabled', true)

        $(this).parent().parent().children().eq(1).children().val('')
        $(this).parent().parent().children().eq(2).children().val('')
        $(this).parent().parent().children().eq(3).children().val('')
    }

})


function validateTaskControls() {
    var isValid = true

    //removing css from unchecked  floor type textboxes
    $('#mainFloorTypes input[name=cb-floors-type]').each(function (key, item) {
        let txtTotFloor = $(item).parent().parent().children().eq(1).children();
        let txtOrderNo = $(item).parent().parent().children().eq(2).children();
        let txtStartFrom = $(item).parent().parent().children().eq(3).children();

        txtTotFloor.css('box-shadow', '').css('border-color', 'lightgrey');
        txtOrderNo.css('box-shadow', '').css('border-color', 'lightgrey');
        txtStartFrom.css('box-shadow', '').css('border-color', 'lightgrey');
    });

    //checking validation on only checked floor types
    $('#mainFloorTypes input[name=cb-floors-type]:checked').each(function (key, item) {
        let txtTotFloor = $(item).parent().parent().children().eq(1).children();
        let txtOrderNo = $(item).parent().parent().children().eq(2).children();
        let txtStartFrom = $(item).parent().parent().children().eq(3).children();

        if (txtTotFloor.val().trim() == "") {
            isValid = false;
            txtTotFloor.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        } else {
            txtTotFloor.css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if (txtOrderNo.val().trim() == "") {
            isValid = false;
            txtOrderNo.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        } else {
            txtOrderNo.css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if (txtStartFrom.val().trim() == "") {
            isValid = false;
            txtStartFrom.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        } else {
            txtStartFrom.css('box-shadow', '').css('border-color', 'lightgrey');
        }
    });

    if ($("#stcName").val().trim() == "") {
        isValid = false;
        $("#stcName").css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    } else {
        $("#stcName").css('box-shadow', '').css('border-color', 'lightgrey');
    }

    if ($("#stcCount").val().trim() == "") {
        isValid = false;
        $("#stcCount").css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    } else {
        $("#stcCount").css('box-shadow', '').css('border-color', 'lightgrey');
    }

    if ($("#stcDesc").val().trim() == "") {
        isValid = false;
        $("#stcDesc").css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    } else {
        $("#stcDesc").css('box-shadow', '').css('border-color', 'lightgrey');
    }

    return isValid;
}
function resetStructureControls() {
    $("#stcName,#stcCount,#stcDesc").val('');
    $('input[name=cb-floors-type]').prop('checked', false);
    $('.bsmntFloor,.parkFloor,.normalFloor,.terrFloor').val('');

    $("#mainFloorTypes .mainFloorSub input[type=number][name=txtForFloorsTypes]").prop('disabled', true);
    $("#mainFloorTypes .mainFloorSub input[type=number][name=txtForFloorsTypes]").val('');
    $("#mainFloorTypes .mainFloorSub input[type=number][name=txtForFloorsTypes]").css('box-shadow', '').css('border-color', 'lightgrey');
}



//TOC

$('#ddlStructNameTOC').on('change', function () {
    loadFloorType();
    loadFloorDDLInTOC();
})
$('#ddlFloorTypeTOC').on('change', function () {
    loadFloorDDLInTOC();
})
$('#ddlFloorFromTOC').on('change', function () {
    //loadFloorDDLInTOC();
})
function loadStructureDDL() {

    var htm = '';
    $.each(listStructureBasic, function (key, item) {
        htm += '<option value="' + item.StructureID + '"> ' + item.StructureName + ' </option>'
    });
    $('#ddlStructNameTOC').html(htm);
}

function loadFloorType() {

    var stRes = listReqStructFloors.filter(s => s.StructureID == $('#ddlStructNameTOC option:selected').val());
    let distinctFloorTypeArr = stRes.map(item => item.Type).filter((value, index, self) => self.indexOf(value) === index);

    var htm = '';
    $.each(distinctFloorTypeArr, function (key, item) {
        htm += '<option value="' + item + '"> ' + item + ' </option>'
    });
    $('#ddlFloorTypeTOC').html(htm);
}


function loadFloorDDLInTOC() {

    let strctid = $('#ddlStructNameTOC option:selected').val();
    var res = listReqStructFloors.filter(s => s.StructureID == strctid && s.IsTypical != "True" && s.Type == $('#ddlFloorTypeTOC option:selected').val());

    var htm = '';
    $.each(res, function (key, item) {
        htm += '<option value="' + item.NoOfFloors + '"> ' + item.NoOfFloors + ' </option>'
    });
    $('#ddlFloorFromTOC').html(htm);
}

$('.addFloorIntoItems').on('click', function () {

    loadStructureDDL();
    loadFloorType();
    loadFloorDDLInTOC();

    $('#tagFloorIntoItems').modal('show')
})



$('.btn-add-item-toc-grid').on('click', function () {
    getAllSystem('');
    getCategoryBySystem($('#ddlSystem option:selected').val(), '');
    $('#btnItemFilterTOC').trigger('click');
    $('#addUpdateSystemnItems').modal('show');
});

$('#btnAddItemFromOracle-grid').on('click', function () {
    $("#txtItemCodeForOracle").val('');

    getAllSystem('for oracle');
    getCategoryBySystem($('#ddlSystemForOracle option:selected').val(), 'for oracle');
    $('#addUpdateItemsOracle').modal('show');
});

$("#btnOracleItemFilterTOC").on("click", function () {
    if ($("#txtItemCodeForOracle").val().trim() == "") {
        toastr.error("Please input the <b>Item code</b> or <b>Item Description</b>")
        $("#txtItemCodeForOracle").css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    }
    else {
        $("#txtItemCodeForOracle").css('box-shadow', '').css('border-color', 'lightgrey');

        $('.ajax-loader').removeClass('hidden');
        setTimeout(function () {
            getItemsForSysCategoryFromOracle();
            $(".ajax-loader").addClass('hidden');
        }, 500);

    }

})

$('#ddlSystem').on('change', function () {
    getCategoryBySystem($('#ddlSystem option:selected').val(), '');
    $('.tbody-items-toc').html('');
})
$('#ddlCategory').on('change', function () {
    $('.tbody-items-toc').html('');
})
$('#ddlSystemForOracle').on('change', function () {
    getCategoryBySystem($('#ddlSystemForOracle option:selected').val(), 'for oracle');
})

$('#btnItemFilterTOC').on('click', function () {
    if ($("#ddlCategory option:selected").val() == "PIPES") {
        $(".col-for-pipe-category").removeClass('hidden');
        $(".col-for-all-category").addClass('hidden');
    }
    else {
        $(".col-for-pipe-category").addClass('hidden');
        $(".col-for-all-category").removeClass('hidden');
    }
    getItemsForSysCategory();
})



function openAddFloorModal(estiid, itemcode, cat) {
    $(".tbody-floor-into-item").html('');
    $("#txtQuantityTOC").val('');
    $('.btnAddFloorsIntoItem').data('estiid', estiid);
    $('.btnAddFloorsIntoItem').data('itemcode', itemcode);
    //$('#btnFloorFilterTOC').data('itemcode', itemcode);
    selCatNameTOC = cat;
    //if (selCatNameTOC == "PIPES") { $(".col-for-pipe-category").removeClass(); } else { $(".col-for-pipe-category").addClass(); } 


    loadStructureDDL();
    loadFloorType();
    loadFloorDDLInTOC();

    loadItemsHaveQTY(itemcode, estiid);

    $('#tagFloorIntoItems').modal('show')
}

function loadItemsHaveQTY(itmcode, estiid) {
    $.ajax({
        url: "TemplateMaster.aspx/GetItemsWhichHaveQTY",
        type: "POST",
        data: JSON.stringify({
            'EstiLineId': estiid
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            var htm = '';
            $.each(result.d, function (key, item) {
                htm += `<tr data-floorid="` + item.FloorId + `">               
                    <td> `+ itmcode + ` </td>                 
                    <td> `+ item.FloorName + `</td>
                    <td> `+ item.Quantity + `</td>`

                htm += `</tr>`;
            });
            $('.tbody-floor-into-item').html(htm);
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}


//$('#btnFloorFilterTOC').on('click', function () {
//    generateTablesForSelFloor($(this).data('itemcode'));
//})

//function generateTablesForSelFloor(itemcode) {
//    var flrName = $("#ddlFloorTypeTOC option:selected").val() + " " + $("#ddlFloorFromTOC option:selected").val();
//    var res = listReqStructFloors.filter(s => s.StructureID == $("#ddlStructNameTOC option:selected").val() && (s.TypicalOf == flrName || s.Name == flrName));

//    let selItemCode = itemcode;
//    var htm = '';
//    $.each(res, function (key, item) {
//        htm += `<tr data-floorid="` + item.StructFloorDetId + `">               
//                    <td> `+ selItemCode + ` </td>                 
//                    <td> `+ item.Name + `</td>
//                    <td> `+ item.Type + `</td>`
//        //if (selCatNameTOC == "PIPES") { 
//        //    htm += `<td> <input class="form-control" name="txtpipeunitprice" type="number" id="floorItemQty-` + key + `" placeholder="enter unit price"> </td>
//        //        <td> <input class="form-control" name="txtfittingsperc" type="number" id="floorItemQty-`+ key + `" placeholder="enter fitting %"> </td>
//        //        <td> <input class="form-control" name="txtinstallunitprice" type="number" id="floorItemQty-`+ key + `" placeholder="enter installation unit price"> </td>`
//        //}

//    htm += `</tr>`;
//});
//    $('.tbody-floor-into-item').html(htm);

//}


$('.btnAddFloorsIntoItem').on('click', function () {
    var subitem = {}; var arrItem = []; var finalParaItem = [];
    var selEstiId = $(this).data('estiid');
    var selItemCode = $(this).data('itemcode');

    if (!validateQty()) {
        toastr.error('Please input the mandatory for selected floor(s).', '');
    }
    else {

        var flrName = $("#ddlFloorTypeTOC option:selected").val() + " " + $("#ddlFloorFromTOC option:selected").val();
        var res = listReqStructFloors.filter(s => s.StructureID == $("#ddlStructNameTOC option:selected").val() && (s.TypicalOf == flrName || s.Name == flrName));

        $.each(res, function (key, item) {
            subitem = {};
            subitem["EstiLineId"] = selEstiId;
            subitem["FloorId"] = item.StructFloorDetId;
            subitem["FloorName"] = item.Name;
            subitem["Quantity"] = $("#txtQuantityTOC").val().trim();
            subitem["CreatedBy"] = currUserId;
            arrItem.push(subitem);
        })

        //$('.tbody-floor-into-item tr').each(function (key, item) {
        //    subitem = {};
        //    subitem["EstiLineId"] = selEstiId;
        //    subitem["FloorId"] = $(item).data('floorid');
        //    subitem["FloorName"] = $(item).children().eq(1).text().trim();
        //    subitem["Quantity"] = $("#txtQuantityTOC").val().trim();
        //    //subitem["PipeUnitPrice"] = $(item).children().eq(3).children().val() == undefined ? 0 : $(item).children().eq(3).children().val().trim();
        //    //subitem["FittingsPerc"] = $(item).children().eq(4).children().val() == undefined ? 0 : $(item).children().eq(4).children().val().trim();
        //    //subitem["InstallUnitPrice"] = $(item).children().eq(5).children().val() == undefined ? 0 : $(item).children().eq(5).children().val().trim();
        //    subitem["CreatedBy"] = currUserId;
        //    arrItem.push(subitem);           
        //});

        finalParaItem = {
            "listFloors": arrItem
        }
        addItemIntoFloor(finalParaItem, selEstiId, selItemCode);
    }
})

function addItemIntoFloor(paraData, estiId, itemcode) {

    $.ajax({
        url: "TemplateMaster.aspx/AddItemIntoFloor",
        type: "POST",
        data: JSON.stringify({
            'data': paraData
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Saved successfully.', '');
            getSystemsNItems();
            loadItemsHaveQTY(itemcode, estiId);
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}

function validateQty() {
    var isValid = true;

    $('.tbody-floor-into-item input[name=txtpipeunitprice]').each(function (key, item) {

        if ($(item).val().trim() == "") {
            isValid = false;
            $(item).css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        } else {
            $(item).css('box-shadow', '').css('border-color', 'lightgrey');
        }
    });

    $('.tbody-floor-into-item input[name=txtfittingsperc]').each(function (key, item) {

        if ($(item).val().trim() == "") {
            isValid = false;
            $(item).css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        } else {
            $(item).css('box-shadow', '').css('border-color', 'lightgrey');
        }
    });

    $('.tbody-floor-into-item input[name=txtinstallunitprice]').each(function (key, item) {

        if ($(item).val().trim() == "") {
            isValid = false;
            $(item).css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        } else {
            $(item).css('box-shadow', '').css('border-color', 'lightgrey');
        }
    });

    if ($("#txtQuantityTOC").val().trim() == "") {
        isValid = false;
        $("#txtQuantityTOC").css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    }
    else {
        $("#txtQuantityTOC").css('box-shadow', '').css('border-color', 'lightgrey');
    }

    return isValid;
}


function getSystemsNItems() {

    $.ajax({
        url: "TemplateMaster.aspx/GetSystemsNItems",
        type: "POST",
        data: JSON.stringify({ "ReqId": selReqId, "UserID": currUserId }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htm1 = '';

            var listSystems = result.d.listSystems;
            var listSystemsItems = result.d.listItems;
            var listAlternateItems = result.d.listAlternateItems;

            var firstSysName = listSystems.length > 0 ? listSystems[0].SysName : '';
            var AllCategoryForSys = [];

            var selReqObj = listAllReqs.filter(s => s.ReqId == selReqId);

            $.each(listSystems, function (key, item) {
                if (key == 0) { // for first record only
                    htm += `<div class="col-md-12 mt-3">`;
                    htm += `<div style="z-index:10;position: sticky;top: 1px;background: #fcfafa; text-align: center; border: 1px solid #b70000; color: black; border-radius: 20px 20px 3px 3px; font-weight: 600; padding: 15px 0px 15px 0px;">` + item.SysName
                    if (selReqObj[0].EstimationStatus.toUpperCase() != "RELEASED" && (selReqObj[0].Engineering != '' && selReqObj[0].TestnCommision != '')) {
                        htm += `<span style="float: right;margin-right: 35px;cursor:pointer;" title="Engineering and Test and Commission Added">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 2048 2048" onclick='openEngrNTestCommisionModal("` + item.SysName + `")'>
                                        <path fill="#4db700" d="M2048 384v1024h-128V839l-640 321v120H768v-120L128 839v697h1152v128H0V384h640V256q0-27 10-50t27-40t41-28t50-10h512q27 0 50 10t40 27t28 41t10 50v128zm-1280 0h512V256H768zm384 640H896v128h256zm768-327V512H128v185l640 319V896h512v120zm-128 839h256v128h-256v256h-128v-256h-256v-128h256v-256h128z" />
                                    </svg>
                                </span>`
                    }
                    else {
                        htm += `<span style="float: right;margin-right: 35px;cursor:pointer;" title="Add Engineering and Test and Commission">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 2048 2048" onclick='openEngrNTestCommisionModal("` + item.SysName + `")'>
                                        <path fill="#ffb400" d="M2048 384v1024h-128V839l-640 321v120H768v-120L128 839v697h1152v128H0V384h640V256q0-27 10-50t27-40t41-28t50-10h512q27 0 50 10t40 27t28 41t10 50v128zm-1280 0h512V256H768zm384 640H896v128h256zm768-327V512H128v185l640 319V896h512v120zm-128 839h256v128h-256v256h-128v-256h-256v-128h256v-256h128z" />
                                    </svg>
                                </span>`
                    }
                    htm += `</div>`;

                    AllCategoryForSys = listSystemsItems.filter(x => x.System == item.SysName).map(ss => ss.Category).filter((value, index, self) => self.indexOf(value) === index);
                }

                if (firstSysName != item.SysName) {
                    htm += `<div class="col-md-12 mt-3">`;
                    htm += `<div style="z-index:10;position: sticky;top: 1px;background: #fcfafa; text-align: center; border: 1px solid #b70000; color: black; border-radius: 20px 20px 3px 3px; font-weight: 600; padding: 15px 0px 15px 0px;">` + item.SysName
                    if (selReqObj[0].EstimationStatus.toUpperCase() != "RELEASED" && (selReqObj[0].Engineering != '' && selReqObj[0].TestnCommision != '')) {
                        htm += `<span style="float: right;margin-right: 35px;cursor:pointer;" title="Engineering and Test and Commission Added">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 2048 2048" onclick='openEngrNTestCommisionModal("` + item.SysName + `")'>
                                        <path fill="#4db700" d="M2048 384v1024h-128V839l-640 321v120H768v-120L128 839v697h1152v128H0V384h640V256q0-27 10-50t27-40t41-28t50-10h512q27 0 50 10t40 27t28 41t10 50v128zm-1280 0h512V256H768zm384 640H896v128h256zm768-327V512H128v185l640 319V896h512v120zm-128 839h256v128h-256v256h-128v-256h-256v-128h256v-256h128z" />
                                    </svg>
                                </span>`
                    }
                    else {
                        htm += `<span style="float: right;margin-right: 35px;cursor:pointer;" title="Add Engineering and Test and Commission">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 2048 2048" onclick='openEngrNTestCommisionModal("` + item.SysName + `")'>
                                        <path fill="#ffb400" d="M2048 384v1024h-128V839l-640 321v120H768v-120L128 839v697h1152v128H0V384h640V256q0-27 10-50t27-40t41-28t50-10h512q27 0 50 10t40 27t28 41t10 50v128zm-1280 0h512V256H768zm384 640H896v128h256zm768-327V512H128v185l640 319V896h512v120zm-128 839h256v128h-256v256h-128v-256h-256v-128h256v-256h128z" />
                                    </svg>
                                </span>`
                    }
                    htm += `</div>`;

                    AllCategoryForSys = listSystemsItems.filter(x => x.System == item.SysName).map(ss => ss.Category).filter((value, index, self) => self.indexOf(value) === index);
                }



                for (var i = 0; i < AllCategoryForSys.length; i++) {
                    var res = listSystemsItems.filter(x => x.Category == AllCategoryForSys[i]).filter(x => x.System == item.SysName);

                    htm += `<div class="category my-2" style="font-size: 12px">` + (i + 1) + `. ` + res[0].Category + `</div>`
                    htm += ` <div class="table mt-2" style="overflow-y: auto;">
                                                            <table class="table project-table" style="width: 100%;">
                                                                <thead style="position: sticky; top: -3px;">
                                                                    <tr class="Head-tr">                                                                        
                                                                        <th style="width:240px">Item Code</th>
                                                                        <th style="width: 889px;">Item Desc</th>
                                                                        <th>Quantity</th>`
                    if (res[0].Category == "PIPES") {
                        htm += `<th>Pipe Unit Price</th>
                                <th>Fittings %</th>
                                <th>Installation Unit Price</th>`
                    }

                    htm += `<th>Spare QTY</th>
                                                                          <th>Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class=""> `;
                    let isOpt = '';
                    $.each(res, function (k, CatItem) {
                        isOpt = CatItem.Isoptional == 'True' ? '<span>(Optional)</span>' : '';
                        let optcls = CatItem.Isoptional == 'True' ? 'badge badge-optional' : 'badge badge-dark';
                        htm += `<tr>`

                        htm += `<td> <span class="` + optcls + ` fs-6">` + CatItem.ItemCode + ` <svg class="" xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 24 24">
                                         <g fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5">
                                             <path d="m17.524 17.524l-2.722 2.723a2.567 2.567 0 0 1-3.634 0L4.13 13.209A3.852 3.852 0 0 1 3 10.487V5.568A2.568 2.568 0 0 1 5.568 3h4.919c1.021 0 2 .407 2.722 1.13l7.038 7.038a2.567 2.567 0 0 1 0 3.634z" />
                                             <path d="M9.126 11.694a2.568 2.568 0 1 0 0-5.137a2.568 2.568 0 0 0 0 5.137m3.326 4.392l3.634-3.634" />
                                         </g>
                                     </svg></span> `+ isOpt + `<div>` + getAlternateItemsDet(1, CatItem.AlternateFromItem, listAlternateItems) + `</div></td>                
                                  <td> `+ CatItem.ItemDesc + `. <div style="margin-top: 22px;">` + getAlternateItemsDet(2, CatItem.AlternateFromItem, listAlternateItems) + `</div></td>                                                                      
                                  <td> `+ numberWithCommas(parseInt(CatItem.Quantity)) + `<div style="margin-top: 22px;"> ` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? CatItem.Quantity : "") + `</div></td>`
                        if (res[0].Category == "PIPES") {
                            htm += `<td> ` + numberWithCommas(fixedtwo(CatItem.PipeUnitPrice)) + `<div style="margin-top: 22px;"> ` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? CatItem.PipeUnitPrice : "") + `</div></td>
                                    <td> `+ numberWithCommas(fixedtwo(CatItem.FittingsPerc)) + `<div style="margin-top: 22px;">` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? CatItem.FittingsPerc : "") + `</div></td > 
                                    <td> `+ numberWithCommas(fixedtwo(CatItem.InstallUnitPrice)) + `<div style="margin-top: 22px;">` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? CatItem.InstallUnitPrice : "") + `</div></td>`
                        }

                        htm += `<td> ` + numberWithCommas(parseInt(CatItem.SpareQuantity)) + `<div style="margin-top: 22px;"> ` + ((CatItem.AlternateFromItem != "" && CatItem.AlternateFromItem != "-1") ? CatItem.SpareQuantity : "") + `</div></td>`
                        if (selReqObj[0].EstimationStatus.toUpperCase() != "RELEASED") {
                            htm += `<td> <a class="ibtn-addfloor-into-items" title="Add Floors" data-estiid="` + CatItem.EstiLineId + `" data-itemcode="` + CatItem.ItemCode + `"> <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24" onclick="openAddFloorModal(` + CatItem.EstiLineId + `,` + CatItem.ItemCode + `,'` + CatItem.Category + `')">
                                              <path fill="#a92828" d="M12 9v2h2v2h-2v2h2v2h-2v2h4v-4h4V9zm6 4h-2v-2h2z" opacity="0.3" />
                                              <path fill="#a92828" d="M12 7V3H2v18h14v-2h-4v-2h2v-2h-2v-2h2v-2h-2V9h8v6h2V7zM6 19H4v-2h2zm0-4H4v-2h2zm0-4H4V9h2zm0-4H4V5h2zm4 12H8v-2h2zm0-4H8v-2h2zm0-4H8V9h2zm0-4H8V5h2zm14 12v2h-2v2h-2v-2h-2v-2h2v-2h2v2zm-6-8h-2v2h2zm0 4h-2v2h2z" />
                                          </svg> </a>
                                        <span><i class="bx bxs-trash ibtn-delete-itemtoc" style="font-size: 1.6rem;color: #d64e4e;cursor:pointer;" title="Delete Item" data-estiid="`+ CatItem.EstiLineId + `" data-itemcode="` + CatItem.ItemCode + `"></i></span>
              

                                  </td>`
                        }

                        htm += `</tr>`
                    })

                    htm += `     </tbody>
                             </table>
                          </div>`
                }

                if (key == 0) { `</div>` }
                if (firstSysName != item.SysName && key != 0) { `</div>` }



            });

            $('.system-div-parent').html(htm);
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });

}

function getAlternateItemsDet(col, itmcode, listAlternateItems) {
    var htm = '';

    if (listAlternateItems.length > 0) {
        var res = listAlternateItems.filter(s => s.ItemCode == itmcode)
        if (res.length > 0) {
            if (col == 1) {
                htm = `<span class="badge badge-alternate fs-6 mt-1">` + res[0].ItemCode + ` <svg class="" xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 24 24">
                                         <g fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5">
                                             <path d="m17.524 17.524l-2.722 2.723a2.567 2.567 0 0 1-3.634 0L4.13 13.209A3.852 3.852 0 0 1 3 10.487V5.568A2.568 2.568 0 0 1 5.568 3h4.919c1.021 0 2 .407 2.722 1.13l7.038 7.038a2.567 2.567 0 0 1 0 3.634z" />
                                             <path d="M9.126 11.694a2.568 2.568 0 1 0 0-5.137a2.568 2.568 0 0 0 0 5.137m3.326 4.392l3.634-3.634" />
                                         </g>
                                     </svg> </span> <span> (Alternate)</span>`
            }
            else if (col == 2) {
                htm = `<span>` + res[0].ItemDesc + `</span>`
            }
        }

    }

    return htm;
}


$(".system-div-parent").on('click', '.ibtn-delete-itemtoc', function (key, item) {
    let itemcode = $(this).data('itemcode');

    $('.cItemTOC').html('you want to delete the item <b> ' + itemcode + ' </b> ?')
    $(".btn-del-itemtoc-yes").data('estiid', $(this).data('estiid'))
    $("#delItemTOCModal").modal('show');
})
$(".btn-del-itemtoc-yes").on('click', function (key, item) {
    let estilineid = $(this).data('estiid');

    $.ajax({
        url: "TemplateMaster.aspx/DeleteItemFromTOC",
        type: "POST",
        data: JSON.stringify({ "EstiLineId": estilineid }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Item deleted successfully', '');
            $('#delItemTOCModal').modal('hide');
            getSystemsNItems();
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
})

function getAllSystem(forwhom) {

    $.ajax({
        url: "TemplateMaster.aspx/GetAllSystems",
        type: "POST",
        data: JSON.stringify({ "UserId": currUserId, "ReqId": selReqId }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.Value + '" >' + item.Text + ' </option>'
            });

            if (forwhom == 'for oracle') { $('#ddlSystemForOracle').html(htm); }
            else { $('#ddlSystem').html(htm); }

            //compId = $('#selectTypeOpt option:selected').val();
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });

}

function getCategoryBySystem(paraSysName, forwhom) {

    $.ajax({
        url: "TemplateMaster.aspx/GetCategoryBySys",
        type: "POST",
        //data: JSON.stringify({ "SysName": $('#ddlSystem option:selected').val() }),
        data: JSON.stringify({ "SysName": paraSysName }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.Value + '" >' + item.Text + ' </option>'
            });

            if (forwhom == 'for oracle') { $('#ddlCategoryForOracle').html(htm); }
            else { $('#ddlCategory').html(htm); }

            //compId = $('#selectTypeOpt option:selected').val();
        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });

}

$(".tbody-items-toc").on('click', 'input[type=checkbox][name=cbIsOptional]', function () {
    if ($(this).is(":checked")) {
        $(this).parent().parent().parent().children().eq(0).children().children().prop('checked', true)
    } else {
        $(this).parent().parent().parent().children().eq(0).children().children().prop('checked', false)
    }
});


function getItemsForSysCategory() {

    $.ajax({
        url: "TemplateMaster.aspx/GetItemsForSysCategory",
        type: "POST",
        data: JSON.stringify({
            "SysName": $('#ddlSystem option:selected').val(),
            "Category": $('#ddlCategory option:selected').val(),
            "ItemCode": $('#txtItemCode').val().trim() == '' ? '-1' : $('#txtItemCode').val().trim()
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            itemlistTOC = result.d;
            var htm = '';
            $.each(itemlistTOC, function (key, item) {
                let attr = "";//item[0].IsTypical == "True" ? "checked" : "";
                let optDDL = '<option value="-1"> No Item Selected </option>';
                let filteredRes = itemlistTOC.filter(s => s.ItemCode != item.ItemCode);
                for (var i = 0; i < filteredRes.length; i++) {
                    optDDL += '<option value="' + filteredRes[i].ItemCode + '"> ' + filteredRes[i].ItemCode + ' | ' + filteredRes[i].ItemDesc + '</option>'
                }


                htm += `<tr>
                    <td> 
                        <div style="display: flex;justify-content: center;">
                            <input class="form-check-input position-relative" type="checkbox" name="cbIsTypical" value="`+ item.ItemId + `" id="cbTypical-` + item.ItemId + `" data-itemid=` + item.ItemId + ` ` + attr + ` /> 
                        </div>
                    </td>  
                    <td>
                        <div style="display: flex;justify-content: center;">
                            <input class="form-check-input position-relative" type="checkbox" name="cbIsOptional" value="`+ item.ItemId + `" id="cbOptional-` + item.ItemId + `" data-itemid=` + item.ItemId + ` ` + attr + ` /> 
                        </div>
                    </td> 
                    <td> `+ item.ItemCode + ` </td>                 
                    <td> `+ item.ItemDesc + `</td>
                    <td> `+ item.System + `</td>
                    <td> `+ item.Category + `</td>`

                if ($("#ddlCategory option:selected").val() == "PIPES") {
                    htm += `<td> <input class="form-control" name="txtpipeunitprice" type="number" id="floorItemQty-` + key + `" placeholder="enter unit price" min="0"> </td>
                            <td> <input class="form-control" name="txtfittingsperc" type="number" id="floorItemQty-`+ key + `" placeholder="enter fitting %" min="0"> </td>
                            <td> <input class="form-control" name="txtinstallunitprice" type="number" id="floorItemQty-`+ key + `" placeholder="enter installation unit price" min="0"> </td>`
                } else {
                    htm += `<td> <input class="form-control" name="txtinstallunitprice" type="number" id="floorItemQty-` + key + `" value="0" placeholder="enter installation unit price" min="0"> </td>`
                }
                htm += `<td> <input class="form-control" name="txt_item_into_cat_qty" type="number" id="ItemQty-` + key + `" placeholder="enter quantity" min="0"> </td>`
                htm += `<td> <select id="ddlAlternateItem-` + key + `" class="form-select color-dropdown">` + optDDL + ` </select> </td>`
                //htm +=`<td> <a href="#" class="btn" style="background-color: #f8f9fa; border-color: #ddd; color: #444;" id="t" style="margin-top: 30px;">Select Item</a> </td>`

                htm += `</tr>`;
            });
            $('.tbody-items-toc').html(htm);

        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}

function getItemsForSysCategoryFromOracle() {

    $.ajax({
        url: "TemplateMaster.aspx/GetItemsForSysCategoryFromOracle",
        type: "POST",
        data: JSON.stringify({
            "ItemCode": $('#txtItemCodeForOracle').val().trim() == '' ? '-1' : $('#txtItemCodeForOracle').val().trim()
        }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            itemlistFromoracleTOC = result.d;
            var htm = result.d.length == 0 ? '<tr style="text-align:center;"><td colspan="3">No Data(s) Available</td></tr>' : '';

            $.each(itemlistFromoracleTOC, function (key, item) {
                let attr = "";//item[0].IsTypical == "True" ? "checked" : "";
                htm += `<tr>
                    <td> 
                        <div style="display: flex;justify-content: center;">
                            <input class="form-check-input position-relative" type="checkbox" name="cbIsTypical" value="`+ item.OracleItemId + `" id="cbTypical-` + item.OracleItemId + `" data-oracleitemid=` + item.OracleItemId + ` ` + attr + ` /> 
                        </div>
                    </td>                 
                    <td> `+ item.ItemCode + ` </td>                 
                    <td> `+ item.Desc + `</td>`
                htm += `</tr>`;
            });
            $('.tbody-items-toc-fromoracle').html(htm);

        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}

$('.btnAddItemsFromOracleTOC').on('click', function () {

    if (!validateItemFromOracle()) {
        toastr.error("Please select any item(s) from the list", '');
    } else {
        var selItemsArr = [];

        $(".tbody-items-toc-fromoracle input[name=cbIsTypical]:checked").each(function () {

            let subitem = {};
            var res = itemlistFromoracleTOC.filter(x => x.OracleItemId == $(this).data('oracleitemid'));

            subitem["OracleItemId"] = res[0].OracleItemId;
            subitem["ReqId"] = selReqId;
            subitem["ItemCode"] = res[0].ItemCode;
            subitem["ItemDesc"] = res[0].Desc;
            subitem["System"] = $("#ddlSystemForOracle option:selected").val();
            subitem["Category"] = $("#ddlCategoryForOracle option:selected").val();
            subitem["CreatedBy"] = currUserId;
            selItemsArr.push(subitem);

        });

        var finalSelItemPara = { 'listItemsTOC': selItemsArr };

        selItemsArr.length == 0 ? toastr.error("Please select any item(s)", '') : addItemsFromOracleTOC(finalSelItemPara);
    }

    // DrawTableForSelectedItems();

    // $('#addItemsListModal').modal('hide');
});
function addItemsFromOracleTOC(paraItems) {

    $.ajax({
        url: "TemplateMaster.aspx/AddItemsFromOracleTOC",
        data: JSON.stringify({
            'data': paraItems
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            if (result.d.ErrorType == 'error') {
                toastr.error(result.d.MsgText, '');
            } else {
                toastr.success(result.d.MsgText, '');
                $('#addUpdateItemsOracle').modal('hide');
                $('.btn-add-item-toc-grid').trigger('click');
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function validateItemFromOracle() {
    var isValid = true;

    if ($('.tbody-items-toc-fromoracle input[name=cbIsTypical]:checked').length == 0) {
        isValid = false
    }


    return isValid;
}


function validateItemIntoCategoryQty() {
    var isValid = true;


    if ($("#ddlCategory option:selected").val() == "PIPES") {
        $('.tbody-items-toc input[name=cbIsTypical]:checked').each(function (key, item) {
            let txtPipeUnit = $(item).parent().parent().parent().children().eq(6).children();
            let txtFittingPerc = $(item).parent().parent().parent().children().eq(7).children();
            let txtInstallUnitProce = $(item).parent().parent().parent().children().eq(8).children();

            if (txtPipeUnit.val().trim() == "") {
                isValid = false;
                txtPipeUnit.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            } else {
                txtPipeUnit.css('box-shadow', '').css('border-color', 'lightgrey');
            }

            if (txtFittingPerc.val().trim() == "") {
                isValid = false;
                txtFittingPerc.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            } else {
                txtFittingPerc.css('box-shadow', '').css('border-color', 'lightgrey');
            }

            if (txtInstallUnitProce.val().trim() == "") {
                isValid = false;
                txtInstallUnitProce.css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            } else {
                txtInstallUnitProce.css('box-shadow', '').css('border-color', 'lightgrey');
            }
        });
    }

    return isValid;
}


$('.btnAddItemsTOC').on('click', function () {

    if (!validateItemIntoCategoryQty()) {
        toastr.error("Please input the quantity for the selected item(s)", '');
    } else {
        var selItemsArr = [];

        $(".tbody-items-toc input[name=cbIsTypical]:checked").each(function () {

            let qty = $("#ddlCategory option:selected").val() == "PIPES" ? $(this).parent().parent().parent().children().eq(9).children().val().trim() : $(this).parent().parent().parent().children().eq(7).children().val().trim();
            let subitem = {};
            var res = itemlistTOC.filter(x => x.ItemId == $(this).data('itemid'));

            subitem["ReqId"] = selReqId;
            subitem["ItemId"] = res[0].ItemId;
            subitem["ItemCode"] = res[0].ItemCode;
            subitem["ItemDesc"] = res[0].ItemDesc;
            subitem["System"] = res[0].System;
            subitem["Category"] = res[0].Category;
            subitem["CreatedBy"] = currUserId;
            subitem["Quantity"] = qty == "" ? 0 : qty;
            subitem["IsOptional"] = $(this).parent().parent().parent().children().eq(1).children().children().is(':checked') ? 1 : 0;

            if ($("#ddlCategory option:selected").val() == "PIPES") {
                subitem["AlternateFromItemCode"] = $(this).parent().parent().parent().children().eq(10).children().val();
                subitem["PipeUnitPrice"] = $(this).parent().parent().parent().children().eq(6).children().val() == undefined ? 0 : $(this).parent().parent().parent().children().eq(6).children().val().trim();
                subitem["FittingsPerc"] = $(this).parent().parent().parent().children().eq(7).children().val() == undefined ? 0 : $(this).parent().parent().parent().children().eq(7).children().val().trim();
                subitem["InstallUnitPrice"] = $(this).parent().parent().parent().children().eq(8).children().val() == undefined ? 0 : $(this).parent().parent().parent().children().eq(8).children().val().trim();
            }
            else {
                subitem["PipeUnitPrice"] = 0;
                subitem["FittingsPerc"] = 0;
                subitem["InstallUnitPrice"] = $(this).parent().parent().parent().children().eq(6).children().val();
                subitem["AlternateFromItemCode"] = $(this).parent().parent().parent().children().eq(8).children().val();
            }

            selItemsArr.push(subitem);

        });

        var finalSelItemPara = { 'listItemsTOC': selItemsArr };

        selItemsArr.length == 0 ? toastr.error("Please select any item(s)", '') : addItemsTOC(finalSelItemPara);
    }

    // DrawTableForSelectedItems();

    // $('#addItemsListModal').modal('hide');
});

function addItemsTOC(paraItems) {

    $.ajax({
        url: "TemplateMaster.aspx/AddItemsTOC",
        data: JSON.stringify({
            'data': paraItems
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success("Item added successfully", '');
            $('#addUpdateSystemnItems').modal('hide');
            getSystemsNItems();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



function openEngrNTestCommisionModal(sysName) {
    $(".btnAddEngrTestnCommision").data("sysname", sysName)
    $("#txtEngineering,#txtTestnCommision").val(0);
    $("#engrNTestCommisoinModal").modal('show');
    GetEngnTest(sysName);
}
$(".btnAddEngrTestnCommision").on('click', function () {

    AddEngrnCommision($(this).data('sysname'))
})

function AddEngrnCommision(pSysName) {
    $.ajax({
        url: "TemplateMaster.aspx/AddEngrNTestCommision",
        data: JSON.stringify({
            'ReqId': selReqId,
            'SystemName': pSysName,
            'Engineering': $("#txtEngineering").val().trim(),
            'TestnCommision': $("#txtTestnCommision").val().trim()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success("Updated successfully", '');
            $("#engrNTestCommisoinModal").modal('hide');
            getSystemsNItems();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetEngnTest(pSysName) {
    $.ajax({
        url: "TemplateMaster.aspx/GetEngnTest",
        data: JSON.stringify({
            'ReqId': selReqId,
            'SystemName': pSysName
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            ListEngnComm = result.d;
            $("#txtEngineering").val(result.d[0].Engineering);
            $("#txtTestnCommision").val(result.d[0].TestnComm);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}