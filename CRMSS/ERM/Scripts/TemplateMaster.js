
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
        url: "EMSItemList.aspx/GetAllFloorTypes",
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
        htm += '<option value="' + item.StructFloorDetId + '"> ' + (key + 1) + ' </option>'
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

    let start = $('#ddlFloorFrom option:selected').text().trim() - 1;
    let end = $('#ddlFloorTo option:selected').text().trim() - 1;
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

        $(this).parent().parent().children().eq(1).children().val('')
        $(this).parent().parent().children().eq(2).children().val('')
    } else {
        $(this).parent().parent().children().eq(1).children().prop('disabled', true)
        $(this).parent().parent().children().eq(2).children().prop('disabled', true)

        $(this).parent().parent().children().eq(1).children().val('')
        $(this).parent().parent().children().eq(2).children().val('')
    }

})


function validateTaskControls() {
    var isValid = true

    //removing css from unchecked  floor type textboxes
    $('#mainFloorTypes input[name=cb-floors-type]').each(function (key, item) {
        let txtTotFloor = $(item).parent().parent().children().eq(1).children();
        let txtOrderNo = $(item).parent().parent().children().eq(2).children();

        txtTotFloor.css('box-shadow', '').css('border-color', 'lightgrey');
        txtOrderNo.css('box-shadow', '').css('border-color', 'lightgrey');
    });

    //checking validation on only checked floor types
    $('#mainFloorTypes input[name=cb-floors-type]:checked').each(function (key, item) {
        let txtTotFloor = $(item).parent().parent().children().eq(1).children();
        let txtOrderNo = $(item).parent().parent().children().eq(2).children();

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
