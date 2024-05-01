<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="Requisition.aspx.cs" Inherits="Recruitment_Requisition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="../Template/assets/vendor/libs/richtexteditor/richtext.css" />
    <link href="Assets/css/RecruitmentCss.css?v=1.1" rel="stylesheet" />

    <style type="text/css">
        .navnew {
            vertical-align: top !important;
            display: inline-block !important;
            border-radius: 6px !important;
            width: max-content !important;
            padding-top: 1% !important;
            padding-left: 0px !important;
            font-size: 14px !important;
        }

        .rrf-table .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .rrf-table th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .rrf-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .iconClassExcel {
            margin-left: 8px;
            /* background: #933737; */
            color: #b12020db;
            background-color: #ffffff;
            border: #f9bfa8 1px solid;
            box-shadow: 0 0.125rem 0.25rem 0 rgba(133, 146, 163, 0.4);
        }

        .label-custom {
            color: #d4432c !important;
            font-weight: 400 !important;
            text-transform: none;
            /* padding-top: 3px; */
        }

        .activestep {
            /*box-shadow: 0rem 0 0 0.4rem rgb(13 169 239 / 61%);*/
            box-shadow: 0rem 0 0 0.4rem #ef5c0d78;
        }

        .padding-row {
            padding-bottom: 17px;
        }

        .tbody-rrf, .tbody-rrfreq-attach,.tbody-rrfreq-attach-viewonly,.tbody-CandiShorlisted,.tbody-interview,.tbody-candiselected,.tbody-history,.tbody-Approval td {
            text-align: center;
        }

            .tbody-rrf tr:hover {
                background: #ce420014;
            }

        table.dataTable.no-footer {
            border-bottom: 1px solid #fcfcfc !important;
        }

        .position-info-div label {
            float: right;
        }

        /*.select2-dropdown > .select2-results > #select2-ddlFilterAssignedToMeTask-results{
      background-color: white;
    border: 1px solid #e44c1666;
    border-radius: 4px;
    box-sizing: border-box;
    display: block;
    position: absolute;
    /* left: -100000px; 
    /*width: 100%;
    z-index: 1051;
    width: 436.211px !important;
    margin: -26px 0px 0px -26px;
  }
          .select2-container--default .select2-selection--multiple .select2-selection__choice__display {
    cursor: default;
    padding-left: 12px !important;
    padding-right: 5px;
    color: #ffffff !important;
}*/
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%; zoom: 90%;">

        <div style="padding-left: 2%; padding-top: 1%;">
            <h5 style="color: #a92828; margin-top: 13px">Request Recruitment List</h5>
        </div>

        <div class="card-body" style="margin-top: -1%;">


            <div class="row">
                <%--style="display: flex;justify-content: flex-end;"--%>

                <div class="col-md-3">

                    <div class="row" style="/*display: flex; justify-content: flex-end; margin-top: -25px; */">

                        <div class="col-md-3">
                            <label><i class="bx bx-search-alt-2" style="margin-top: -7px; font-size: 26px; color: #7fa3ff;"></i></label>
                            <label for="html5-number-input" class="col-form-label label-custom">RRF Status</label>
                        </div>
                        <div class="col-md-9">
                            <select id="ddlFilterAssignedToMeTask" class="form-select color-dropdown"></select>
                        </div>
                    </div>

                </div>

                <div class="col-md-2">
                    <%--   <div class="row">
                                        <div class="col-md-3"> <label for="html5-number-input" class="col-form-label label-custom">From Date</label> </div>
                                        <div class="col-md-9"> <input type="text" id="filterStDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly"> </div>
                                   </div>--%>
                </div>

                <div class="col-md-2">
                    <%-- <div class="row">
                                        <div class="col-md-3"> <label for="html5-number-input" class="col-form-label label-custom">To Date</label> </div>
                                        <div class="col-md-9"> <input type="text" id="filterEndDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly"> </div>
                                   </div>--%>
                </div>

                <div class="col-md-2"></div>
                <div class="col-md-3">
                    <a href="#" class="btn btn-primary hidden" id="btn-add-rff-grid" style="float: right;"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add RRF</a>

                </div>

            </div>

            <div class="" style="margin-top: 1%;">

                <table class="table rrf-table" style="width: 100%;">

                    <thead>
                        <tr class="Head-tr">
                            <%--<th>Id</th>--%>
                            <th>RRF#</th>
                            <th>Dept</th>
                            <th>No. Of Position</th>
                            <th>Report To</th>
                            <th>Job Tilte</th>
                            <th>Requested Date</th>
                            <th>Updated Date</th>

                            <th>Status</th>
                            <th>Location</th>
                            <th>Action</th>
                        </tr>
                    </thead>


                    <tbody class="tbody-rrf">
                    </tbody>
                </table>
            </div>
        </div>
    </div>




    <div class="modal fade" id="addRFFModal" tabindex="-1" data-bs-backdrop="static" style="background-color: rgba(0, 0, 0, 0.44);" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header" style="border-bottom: 0px;">

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body" style="margin-top: -55px; padding-bottom: 0;">

                    <div class="container padding-bottom-3x mb-1">
                        <div class="card mb-3">
                            <div class="p-4 text-center text-white text-lg bg-dark rounded-top">
                                <span class="text-uppercase">Recruitment Request Form </span>
                                <span class="text-uppercase">- (Ref# : <b class="generated-ref-no">-</b>) </span>
                            </div>
                            <%-- <div class="d-flex flex-wrap flex-sm-nowrap justify-content-between py-3 px-2 bg-secondary">
            <div class="w-100 text-center py-1 px-2"><span class="text-medium">Shipped Via:</span> UPS Ground</div>
            <div class="w-100 text-center py-1 px-2"><span class="text-medium">Status:</span> Checking Quality</div>
            <div class="w-100 text-center py-1 px-2"><span class="text-medium">Expected Date:</span> SEP 09, 2017</div>
          </div>--%>
                            <div class="card-body step-div-parent" style="min-height: 56vh;">

                                <div class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between padding-top-2x padding-bottom-1x">

                                    <div class="step st-1 completed">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon activestep"><i class="fa fa-user-o" aria-hidden="true"></i></div>
                                        </div>
                                        <h4 class="step-title">Position Info</h4>
                                    </div>

                                    <div class="step st-2 completed">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon "><i class="fa fa-graduation-cap" aria-hidden="true"></i></div>
                                        </div>
                                        <h4 class="step-title">Qualification</h4>
                                    </div>

                                    <div class="step st-3 completed">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon"><i class="fa fa-file-text-o" aria-hidden="true"></i></div>
                                        </div>
                                        <h4 class="step-title">Attachment</h4>
                                    </div>

                                    <div class="step st-4 ">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon"><i class='bx bx-file-find' style="font-size: 3rem;"></i></div>
                                        </div>
                                        <h4 class="step-title">Choose Template</h4>
                                    </div>

                                    <div class="step st-5">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon"><i class="pe-7s-home"></i></div>
                                        </div>
                                        <h4 class="step-title">Finish</h4>
                                    </div>

                                </div>

                                <div class="tab-content-parent-div">
                                    <%--POSITION INFO TAB--%>
                                    <div class="position-info-div tab-content tb-1 ">

                                        <div class="row padding-row">
                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Department <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <select id="ddlDepartment" class="form-select color-dropdown"></select>  
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Division/Section <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <select id="ddlDivision" class="form-select color-dropdown"> </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row padding-row">
                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Report To <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <%--<input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtReportTo">--%>
                                                        <select id="ddlReportTo" class="form-select color-dropdown"> </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Job Title <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtJobTitle">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row padding-row">
                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Salary Range <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtSalaryRange">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Location <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="form-control" type="text" placeholder="Enter Amount" value="" id="txtLocation">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row padding-row">
                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Age Range <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtAgeRange">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                 <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">No. of Position(s) <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="form-control" type="number" placeholder="Enter Amount" value="" id="txtPositions">
                                                    </div>
                                                </div>
                                               
                                            </div>
                                        </div>

                                        <div class="row padding-row ">
                                             <div class="col-6">
                                                 <div class="row">
                                                     <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Reason for Hiring <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <select id="ddlReasonHiring" class="form-select color-dropdown">
                                                            <option value="Replacement">Replacement</option>
                                                            <option value="New (Existing Job Role)" selected="selected">New (Existing Job Role)</option>
                                                            <option value="New (New Job Role)">New (New Job Role)</option>
                                                        </select>
                                                    </div>
                                                 </div>   
                                             </div>

                                            <div class="col-6 replaceEmpDiv">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Replacee Employee No. <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtReplaceeEmpNo">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>

                                    <%--POSITION INFO END--%>


                                    <%--QUALIFICATION TABE--%>

                                    <div class="qualification-div tab-content tb-2 hidden">

                                        <div class="row padding-row">
                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Education <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <%--<select id="ddlEducation" class="form-select color-dropdown">                                               
                                                <option value="Urgent" selected=""> BS (Software Engineering)</option>
                                                <option value="Important"> BS (Computer Science)</option>
                                                <option value="Medium"> BE (Computer Engineering)</option>
                                            </select>--%>
                                                        <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtEducation">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Nationality <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <select id="ddlNationality" class="form-select color-dropdown">
                                                            <%--   <option value="Urgent" selected=""> Software Developer</option>
                                                <option value="Important">  Senior Software Developer</option>
                                                <option value="Medium">  Technical Team Lead</option>
                                                <option value="Low">  Project Manager</option>--%>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row padding-row">
                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Year of Exp. <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtYearOfExp">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Gender <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <select id="ddlGender" class="form-select color-dropdown">
                                                            <option value="Male" selected>Male</option>
                                                            <option value="Female">Female</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row padding-row">
                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Languages <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <select id="ddlLanguages" class="form-select color-dropdown" multiple>
                                                            <%--  <option value="Arabic" selected=""> Arabic</option>
                                                <option value="English" > English</option>
                                                <option value="Urdu" > Urdu</option>
                                                <option value="Hindi" > Hindi</option>
                                                <option value="Malayalam"> Malayalam</option> --%>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">UAE Driving License <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <div class="netliva-switch">
                                                            <input type="checkbox" id="cbDrivingLics" netliva-switch="OK">
                                                            <label for="cbDrivingLics" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row padding-row">
                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Computer Skills <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtComputerSkills">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Technical Skills <span style="color: red;">*</span></label>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtTechSkills">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row padding-row">
                                            <div class="col-12">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Brief Job Description <span style="color: red;">*</span></label>
                                                    <div>
                                                        <input class="form-control taBriefJobDesc" type="text" placeholder="Enter Project Name" value="" id="taBriefJobDesc">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>

                                    <%--QUALIFICATION TABE END--%>


                                    <%--ATTACHMENT TAB--%>

                                    <div class="attachment-div tab-content tb-3 hidden">

                                        <div class="row">

                                            <div class="col-md-6">
                                                <label for="html5-number-input" class="col-form-label label-custom">Remarks <span style="color: red;">*</span></label>
                                                <div>
                                                    <textarea id="taRRFAttach" class="form-control taEmployeeCommentC" placeholder="Type your Remarks…." aria-describedby="basic-icon-default-message2"></textarea>
                                                </div>
                                            </div>


                                            <div class=" insert-Attachment col-md-3">

                                                <label for="html5-number-input" class="col-form-label label-custom">Select File/Docs <span style="color: red;">*</span></label>

                                                <div>
                                                    <input class="form-control" type="file" id="fu-rrf-req" title="Leave Request" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getFileName()">
                                                    <label class="input-group-text ml-3" for="fu-rrf-req" style="border: transparent;">

                                                        <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover rrf-fu-image" style="cursor: pointer; width: 49px; margin-top: -10px;">
                                                    </label>
                                                    <input type="text" id="lblRRFReqFileName" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                                                </div>
                                            </div>

                                            <div class="col-md-2" style="padding-top: 45px;">
                                                <a href="#" id="btnRRFReqFU" class="btn btn-primary d-block" style="font-size: small"><i class='bx bx-upload'></i>Upload</a>
                                                <%--<input type="button" id="btnRRFReqFU" value="Upload" class="btn btn-primary d-block" style="font-size: small">--%>
                                            </div>

                                        </div>



                                        <div>
                                            <table class="table table-bordered table-striped nowrap tablepopup tbl-rrfreq-attach" style="width: 100%; zoom: 94%;">
                                                <thead>
                                                    <tr>
                                                        <th>File Name</th>
                                                        <th>Reamrks</th>
                                                        <th>Created Date</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="tbody-rrfreq-attach">
                                                </tbody>
                                            </table>
                                        </div>




                                    </div>

                                    <%--ATTACHMENT TAB END--%>


                                    <%--TEMPLATE TAB--%>

                                    <div class="template-div tab-content tb-4 hidden">
                                        STEP 4        
                                    </div>

                                    <%--TEMPLATE TAB END--%>


                                    <%--FINISH TAB--%>

                                    <div class="finish-div tab-content tb-5 hidden">
                                        <h3 style="text-align: center;">You have completed steps. Please Submit it to proceed further.</h3>

                                        <div style="display: flex; justify-content: center;">
                                            <button id="btnSubmitRRF" type="button" class="btn btn-primary btnSubmitRRF" style=""><i class="bx bxs-check-circle me-3"></i>Submit</button>
                                            <%--<button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class="bx bxs-save me-3"></i>Save as Draft</button>--%>
                                        </div>

                                    </div>

                                    <%--FINISH TAB END--%>
                                </div>



                            </div>
                        </div>
                        <%-- <div class="d-flex flex-wrap flex-md-nowrap justify-content-center justify-content-sm-between align-items-center">
          <div class="custom-control custom-checkbox mr-3">
            <input class="custom-control-input" type="checkbox" id="notify_me" checked="">
            <label class="custom-control-label" for="notify_me">Notify me when order is delivered</label>
          </div>
          <div class="text-left text-sm-right"><a class="btn btn-outline-primary btn-rounded btn-sm" href="orderDetails" data-toggle="modal" data-target="#orderDetails">View Order Details</a></div>
        </div>--%>
                    </div>



                </div>

                <div class="modal-footer" style="justify-content: flex-start;">
                    <button type="button" class="btn btn-label-secondary btnPrev"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp; Prev</button>
                    <button type="button" class="btn btn-label-secondary btnNext">Next &nbsp; <i class="fa fa-arrow-right" aria-hidden="true"></i></button>
                </div>
            </div>
        </div>
    </div>



    <%--Add Candidate Modal--%>

    <div class="modal fade" id="addCandidateModal" tabindex="-1" data-bs-backdrop="static" style="background-color: rgba(0, 0, 0, 0.44); z-index: 9999" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header" style="border-bottom: 0px;">

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body" style="margin-top: -55px; padding-bottom: 0;">

                    <div class="container padding-bottom-3x mb-1">
                        <div class="card mb-3">
                            <div class="p-4 text-center text-white text-lg bg-dark rounded-top">
                             
                                <span class="text-uppercase" style="float:left">Add Candidate </span>

                                <span style="float:right" class="candi-apprrej-btn-div"> 
                                    <select id="ddlCandiAppRej" class="form-select color-dropdown">
                                                            <option value="-1" selected="" disabled>Actions</option>
                                                            <option value="Shortlisted">Shortlisted</option>
                                                            <option value="Keep For Futur">Keep For Futur</option>
                                                            <option value="Declined">Declined</option>
                                                        </select></span>
                            </div>

                            <div class="card-body step-can-div-parent" style="min-height: 56vh;">

                                <div class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between padding-top-2x padding-bottom-1x" style="zoom:81%;">

                                    <div class="step st-1 completed">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon activestep"><i class="fa fa-user-o" aria-hidden="true"></i></div>
                                        </div>
                                        <h4 class="step-title">Personal Info</h4>
                                    </div>

                                    <div class="step st-2">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon "><i class="pe-7s-id"></i></div>
                                        </div>
                                        <h4 class="step-title">More Details</h4>
                                    </div>

                                    <div class="step st-3">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon"><i class="pe-7s-paperclip" aria-hidden="true"></i></div>
                                        </div>
                                        <h4 class="step-title">Attachment</h4>
                                    </div>

                                    <div class="step st-4">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon"><i class="pe-7s-like2"></i></div>
                                        </div>
                                        <h4 class="step-title">Finish</h4>
                                    </div>

                                </div>

                                <div class="tab-content-parent-can-div">
                                    <%--POSITION INFO TAB--%>
                                    <div class="position-info-div tab-content tb-1 ">

                                        <div class="row padding-row">
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">First Name <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <input class="form-control" type="text" placeholder="Enter First Name" value="" id="txtFirstName">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Last Name <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <input class="form-control" type="text" placeholder="Enter Last Name" value="" id="txtLastName">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Personal Email <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtPersonalEmail">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row padding-row">
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Available to Join <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <select id="ddlAvailToJoin" class="form-select color-dropdown">
                                                            <option value="Immediate" selected="">Immediate</option>
                                                            <option value="30 days">30 days</option>
                                                            <option value="45 days">45 days</option>
                                                            <option value="60 days">60 days</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Gender <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <select id="ddlCanGender" class="form-select color-dropdown">
                                                            <option value="Male" selected="">Male</option>
                                                            <option value="Female">Female</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Marital Status <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <select id="ddlMariStatus" class="form-select color-dropdown">
                                                            <option value="Single" selected="">Single</option>
                                                            <option value="Married">Married</option>
                                                            <option value="Male">Widowed</option>
                                                            <option value="Male">Separated</option>
                                                            <option value="Male">Divorced</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>

                                        <div class="row padding-row">
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Date of Birth <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <input class="form-control" type="text" placeholder="Enter D.O.B"  style="background-color: white;" id="txtDateOfBirth">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Country of Birth <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <select id="ddlCountryBirth" class="form-select color-dropdown"></select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Nationality<span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <select id="ddlCanNationality" class="form-select color-dropdown"></select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row padding-row">
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Religion <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <input class="form-control" type="text" placeholder="Enter Religion" value="" id="txtReligion">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Contact No. <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <input class="form-control" type="number" placeholder="Enter Contact No." value="" id="txtContactNo">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                    <%--POSITION INFO END--%>


                                    <%--QUALIFICATION TABE--%>

                                    <div class="qualification-div tab-content tb-2 hidden">
                                        STEP 2
                                    </div>

                                    <%--QUALIFICATION TABE END--%>


                                    <%--ATTACHMENT TAB--%>

                                    <div class="attachment-Candi-div tab-content tb-3 hidden">

                                        <div class="row">

                                            <div class="col-md-6">
                                                <label for="html5-number-input" class="col-form-label label-custom">Remarks <span style="color: red;">*</span></label>
                                                <div>
                                                    <textarea id="taCanAttach" class="form-control taEmployeeCommentC" placeholder="Type your Remarks…." aria-describedby="basic-icon-default-message2"></textarea>
                                                </div>
                                            </div>


                                            <div class=" insert-Attachment col-md-3">

                                                <label for="html5-number-input" class="col-form-label label-custom">Select File/Docs <span style="color: red;">*</span></label>

                                                <div>
                                                    <input class="form-control" type="file" id="fu-add-can" title="Leave Request" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getCandiFileName()">
                                                    <label class="input-group-text ml-3" for="fu-add-can" style="border: transparent;">

                                                        <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover can-image" style="cursor: pointer; width: 49px; margin-top: -10px;">
                                                    </label>
                                                    <input type="text" id="lblAddCanFileName" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                                                </div>
                                            </div>

                                            <div class="col-md-2" style="padding-top: 45px;">
                                                <a href="#" id="btnAddCanFU" class="btn btn-primary d-block" style="font-size: small"><i class='bx bx-upload'></i>Upload</a>
                                            </div>

                                        </div>



                                        <div>
                                            <table class="table table-bordered table-striped nowrap tablepopup tbl-candi-attach" style="width: 100%; zoom: 94%;">
                                                <thead>
                                                    <tr>
                                                        <th>File Name</th>
                                                        <th>Reamrks</th>
                                                        <th>Created Date</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="tbody-candi-attach">
                                                </tbody>
                                            </table>
                                        </div>




                                    </div>

                                    <%--ATTACHMENT TAB END--%>
                                    

                                    <%--FINISH TAB--%>

                                    <div class="finish-div tab-content tb-4 hidden">
                                        <h3 style="text-align: center;">You have completed steps. Please Submit it to proceed further...</h3>

                                        <div style="display: flex; justify-content: center;">
                                            <button id="btnSubmitCandidate" type="button" class="btn btn-primary btnSubmitRRF" style=""><i class="bx bxs-check-circle me-3"></i>Submit</button>
                                            <%--<button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class="bx bxs-save me-3"></i>Save as Draft</button>--%>
                                        </div>

                                    </div>

                                    <%--FINISH TAB END--%>
                                </div>



                            </div>
                    </div>

                </div>



            </div>

            <div class="modal-footer" style="justify-content: flex-start;">
                <button type="button" class="btn btn-label-secondary btnCanPrev"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp; Prev</button>
                <button type="button" class="btn btn-label-secondary btnCanNext">Next &nbsp; <i class="fa fa-arrow-right" aria-hidden="true"></i></button>
            </div>
        </div>
    </div>
    </div>

    <%--End Here--%>

    <%--RRF Details Modal--%>
    <div class="modal fade" id="rrfDetailsModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row" style="width:100%">
                        <div class="col-9">
                            <h5 class="modal-title rrfreq-det-modaltitle">Request Details</h5>
                        </div>
                        <div class="col-3 apptrack-pagelink-div">
                            <h6 style="float: right;color: #696cff;cursor:pointer;" id="redirectToAppTrack">go to Applicant track <i class="pe-7s-exapnd2" style="color: #d54832;"></i></h6>
                        </div>
                        
                        
                        
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                    
                    
                </div>
                <div class="modal-body">

                    <div class="Opt-All-Info">
                        <div style="margin-top: -13px; position: absolute; width: 96%;">
                            <div style="text-align: right;">
                                <i class="bx bxs-chevron-down Opt-det-drilldown" onclick="hideShowOptDetails()"></i>
                            </div>
                        </div>


                        <div id="OptDetailsRowDiv" style="border-left: 5px solid red; height: 150px;">
                            <div class="row cardtitle" style="display: none">

                                <div>
                                    <img src="Images/documents.png" height="20" width="20" style="float: left" />
                                </div>
                                <h5>Requested Job Summary</h5>
                            </div>
                            <div class="row sec" style="display: flex">

                                <div style="width: 17%; border-right: 1px solid #d6d6d6; margin-right: 30px;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                                    <div class="">

                                        <%--<input class="form-control" type="text" id="txtDepartment" readonly />--%>
                                        <label id="lblDepart" style="font-size: 12px;">IT</label>
                                    </div>
                                </div>

                                <div style="width: 17%; border-right: 1px solid #d6d6d6; margin-right: 30px;">
                                    <label for="html5-number-input" class="col-form-label label-custom">No.of Position</label>
                                    <div class="">
                                        <%-- <input class="form-control" type="text" id="txtNoOfPos" readonly />--%>
                                        <label id="lblNoOfPos" style="font-size: 12px;">12</label>

                                    </div>
                                </div>
                                <div style="width: 17%; border-right: 1px solid #d6d6d6; margin-right: 30px;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Reports to</label>
                                    <div class="">

                                        <%-- <input class="form-control" type="text" id="txtReportsTo" readonly />--%>
                                        <label id="lblReportsTo" style="font-size: 12px;">NAVAS</label>
                                    </div>
                                </div>

                                <div style="width: 17%; border-right: 1px solid #d6d6d6; margin-right: 30px;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Job Title</label>
                                    <div class="">

                                        <%--   <input class="form-control" type="text" id="txtJobTitle" readonly />--%>
                                        <label id="lblJobTitle" style="font-size: 12px;">SOFTWARE DEVELOPER</label>
                                    </div>
                                </div>

                                <div style="width: 17%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Location</label>
                                    <div class="">

                                        <%--<input class="form-control" type="text" id="txtLocation" readonly />--%>
                                        <label id="lblLocation" style="font-size: 12px;">JABEL ALI</label>
                                    </div>
                                </div>
                            </div>


                            <div class="row sec" style="display: flex">

                                <div style="width: 17%; border-right: 1px solid #d6d6d6; margin-right: 30px;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Salary Range</label>
                                    <div class="">

                                        <%-- <input class="form-control" type="text" id="txtSalaryRange" readonly />--%>
                                        <label id="lblSalaryRange" style="font-size: 12px;">5000</label>
                                    </div>
                                </div>

                                <div style="width: 17%; border-right: 1px solid #d6d6d6; margin-right: 30px;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Created Date</label>
                                    <div class="">

                                        <%--<input class="form-control" type="text" id="txtCreatedDate" readonly />--%>
                                        <label id="lblCreatedDate" style="font-size: 12px;">12/08/2018</label>
                                    </div>
                                </div>

                                <div style="width: 17%; border-right: 1px solid #d6d6d6; margin-right: 30px;">
                                    <label for="html5-number-input" class="col-form-label label-custom">EmployeeId</label>
                                    <div class="">

                                        <%-- <input class="form-control" type="text" id="txtSubmittedBy" readonly />--%>
                                        <label id="lblEmpId" style="font-size: 12px;">NAVAS</label>
                                    </div>
                                </div>

                                <div style="width: 17%; border-right: 1px solid #d6d6d6; margin-right: 30px;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Status</label>
                                    <div class="">

                                        <%-- <input class="form-control" type="text" id="txtReqStatus" readonly />--%>
                                        <label id="lblReqStatus" style="font-size: 12px;">SUBMIT</label>
                                    </div>
                                </div>
                                <div style="width: 21%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Remarks</label>
                                    <div class="">

                                        <%-- <input class="form-control" type="text" id="txtRemarks" readonly />--%>
                                        <label id="lblRemarks" style="font-size: 12px;">TEST</label>
                                    </div>
                                </div>

                            </div>


                        </div>

                        <div class="" style="margin-top: 1%;">



                            <div class="nav-align-top">
                                <ul class="nav nav-tabs" role="tablist">

                                     <li class="nav-item">
                                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Approval" aria-controls="tab-Approval" aria-selected="false">Approval &nbsp;<i class="fa fa-check-square-o"></i></button>
                                    </li>

                                    <li class="nav-item">
                                        <button type="button" class="nav-link " role="tab" data-bs-toggle="tab" data-bs-target="#tab-ViewQualification" aria-controls="tab-ViewQualification" aria-selected="false">Qualification &nbsp;<i class="fa fa-graduation-cap"></i></button>
                                    </li>

                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ViewQuestion" aria-controls="tab-ViewQuestion" aria-selected="true">Question &nbsp;<i class="fa fa-question"></i></button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ViewAttachment" aria-controls="tab-ViewAttachment" aria-selected="true">Attachment &nbsp;<i class="	fa fa-thumb-tack"></i></button>
                                    </li>


                                   

<%--                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-AllCandidates" aria-controls="tab-AllCandidates" aria-selected="true">All Candidated &nbsp;<i class="fa fa-user-circle"></i></button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Shortlisted" aria-controls="tab-Shortlisted" aria-selected="true">Shortlisted &nbsp;<i class="fa fa-sort"></i></button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ForInterview" aria-controls="tab-ForInterview" aria-selected="true">For Interview &nbsp;<i class="fa fa-users"></i></button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Selected" aria-controls="tab-Selected" aria-selected="false">Selected &nbsp;<i class="fa fa-check"></i></button>
                                    </li>--%>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-History" aria-controls="tab-History" aria-selected="false">History &nbsp;<i class="fa fa-history"></i></button>
                                    </li>

                                </ul>
                                <div class="tab-content">


                                    <div class="tab-pane fade" id="tab-ViewQualification" role="tabpanel">
                                        <div class="row">

                                            <div style="width: 33.33%;">
                                                <div class="row">
                                                    <div style="width: 90%;">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Education</label>
                                                        <div class="">
                                                            <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtEducation1">
                                                        </div>
                                                    </div>

                                                    <%-- <div style="width: 5%; padding-top: 8%; padding-left: 0%;">

                                                    <img id="btnAddEducation" src="Images/Add-Icon.png" title="Add" class="fa-icon-hover" style="cursor: pointer; width: 26px;" />


                                                </div>--%>
                                                </div>
                                            </div>

                                            <div style="width: 33.33%;">
                                                <div class="row">
                                                    <div style="width: 90%;">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Nationality</label>
                                                        <div class="">
                                                            <select id="ddlNationality1" class="form-select color-dropdown"></select>
                                                        </div>
                                                    </div>
                                                    <%--   <div style="width: 5%; padding-top: 8%; padding-left: 0%;">

                                                    <img id="btnAddNationality" src="Images/Add-Icon.png" title="Add" class="fa-icon-hover" style="cursor: pointer; width: 26px;" />


                                                </div>--%>
                                                </div>
                                            </div>

                                            <div style="width: 33.33%;">
                                                <label for="html5-number-input" class="col-form-label label-custom">Years of Experience</label>
                                                <div class="">
                                                    <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtYearOfExp1">
                                                </div>
                                            </div>

                                        </div>


                                        <div class="row">

                                            <div style="width: 33.33%;">
                                                <label for="html5-number-input" class="col-form-label label-custom">Gender</label>
                                                <div class="">
                                                    <select id="ddlGender1" class="form-select color-dropdown">
                                                        <option value="Male" selected="">Male</option>
                                                        <option value="Female">Female</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div style="width: 33.33%;">
                                                <div class="row">
                                                    <div style="width: 90%;">
                                                        <label for="html5-number-input" class="col-form-label label-custom">Languages</label>
                                                        <div class="">
                                                            <select id="ddlLanguages1" class="form-select color-dropdown" multiple></select>
                                                        </div>
                                                    </div>

                                                    <%-- <div style="width: 5%; padding-top: 8%; padding-left: 0%;">

                                                    <img id="btnAddLanguages" src="Images/Add-Icon.png" title="Add" class="fa-icon-hover" style="cursor: pointer; width: 26px;" />


                                                </div>--%>
                                                </div>
                                            </div>

                                            <div style="width: 33.33%;">
                                                <label for="html5-number-input" class="col-form-label label-custom">UAE Driving License</label>
                                                <div class="">

                                                    <%--  <select class="form-control" id="ddlQLYearsOfExp" style="border-color: lightgrey;">
                                                    </select>--%>

                                                    <div class="netliva-switch">
                                                        <input type="checkbox" id="cbDrivingLics1" netliva-switch="OK">
                                                        <label for="cbDrivingLics1" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>


                                        <div class="row">

                                            <div style="width: 33.33%;">
                                                <label for="html5-number-input" class="col-form-label label-custom">Computer Skills</label>
                                                <div class="">
                                                    <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtComputerSkills1">
                                                </div>
                                            </div>

                                            <div style="width: 33.33%;">
                                                <label for="html5-number-input" class="col-form-label label-custom">Technical Skills</label>
                                                <div class="">
                                                    <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtTechSkills1">
                                                </div>
                                            </div>

                                            <%--  <div style="width: 33.33%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Category</label>
                                            <div class="">

                                                <select class="form-control" id="ddlViewQLCategory" style="border-color: lightgrey;">
                                                </select>
                                            </div>
                                        </div>--%>
                                        </div>

                                        <div class="row padding-row">
                                            <div class="col-12">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Brief Job Description <span style="color: red;">*</span></label>
                                                    <div>
                                                        <input class="form-control taBriefJobDesc" type="text" placeholder="Enter Project Name" value="" id="taBriefJobDesc1">
                                                        <%--<textarea id="taBriefJobDesc1" class="form-control taBriefJobDesc1" aria-describedby="basic-icon-default-message2"></textarea>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>



                                    <div class="tab-pane fade" id="tab-ViewQuestion" role="tabpanel">

                                        <div class="row">
                                            <div style="width: 33.33%;">
                                                <label for="html5-number-input" class="col-form-label label-custom">Template</label>
                                                <div class="">

                                                    <select class="form-control" id="ddlViewQSTemplate" style="border-color: lightgrey;">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade show" id="tab-ViewAttachment" role="tabpanel">
                                        <div>
                                            <table class="table table-bordered table-striped nowrap tablepopup tbl-rrfreq-attach-viewonly" style="width: 100%; zoom: 94%;">
                                                <thead>
                                                    <tr>
                                                        <th>File Name</th>
                                                        <th>Reamrks</th>
                                                        <th>Created Date</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="tbody-rrfreq-attach-viewonly">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>


                                    <div class="tab-pane fade show active" id="tab-Approval" role="tabpanel">

                                        <div class="row">
                                            <div class="col-md-4">
                                                <h4 style="color: #a92828; margin-top: 13px">Approver Authority List</h4>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="pull-right rrfreq-approve-div hidden">
                                                    <a href="#" class="btn btn-success btn-approve-rrfreq" title="Approve" style="padding: 3px 12px; background: #98ca3c; border-color: #98ca3c; border-radius: 5px;"><i class="bx bx-check"></i>Approve</a>
                                                    <a href="#" class="btn btn-danger  btn-reject-rrfreq" title="Reject" style="padding: 3px 9px; border-radius: 5px;"><i class="bx bx-x"></i>Reject</a>
                                                </div>
                                            </div>

                                        </div>

                                        <table class="table table-bordered table-striped  nowrap tablepopup" style="zoom: 90%;">
                                            <thead>
                                                <tr>
                                                    <th>Job Title</th>
                                                    <th>Approve Name</th>
                                                    <th>Approved Date</th>
                                                    <th>Remarks</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Approval">
                                            </tbody>
                                        </table>

                                    </div>



                                <%--    <div class="tab-pane fade" id="tab-AllCandidates" role="tabpanel">

                                        <div class="row">
                                            <div><a href="#" class="btn btn-primary pull-right btn-add-candi-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Candidate</a></div>
                                        </div>

                                        <div class="row" style="margin-top:12px">
                                            <table class="table table-bordered table-striped nowrap tablepopup tbl-candidate" style="width:100%;">
                                                <thead>
                                                    <tr>                                                        
                                                        <th>Name</th>
                                                        <th>Updated Date</th>
                                                        <th>Updated By</th>
                                                        <th>Remarks</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="tbody-candidate" style="text-align:center;">
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                    <div class="tab-pane fade show" id="tab-Shortlisted" role="tabpanel">

                                        <table class="table table-bordered table-striped  nowrap tablepopup tbl-CandiShorlisted" style="width:100%">

                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Updated Date</th>
                                                    <th>Updated By</th>
                                                    <th>Remarks</th>
                                                    <th>Action</th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-CandiShorlisted">
                                            </tbody>
                                        </table>


                                    </div>
                                    <div class="tab-pane fade show" id="tab-ForInterview" role="tabpanel">

                                        <table class="table table-bordered table-striped  nowrap tablepopup tbl-interview" style="width:100%">

                                            <thead>
                                                <tr>



                                                    <th>Name</th>
                                                    <th>Updated Date</th>
                                                    <th>Updated By</th>
                                                    <th>Status</th>

                                                    <th>Action</th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-interview">
                                            </tbody>
                                        </table>


                                    </div>
                                    <div class="tab-pane fade" id="tab-Selected" role="tabpanel">
                                        <table class="table table-bordered table-striped  nowrap tablepopup tbl-candiselected" style="width:100%;">

                                            <thead>
                                                <tr>

                                                    <th>Name </th>
                                                    <th>Updated Date</th>
                                                    <th>Updated By</th>
                                                    <th>Status</th>
                                                    <th>Action</th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-candiselected">
                                            </tbody>
                                        </table>
                                    </div>--%>



                                    <div class="tab-pane fade" id="tab-History" role="tabpanel">
                                        <table class="table table-bordered table-striped  tablepopup tbl-history" style="width:100%;">

                                            <thead>
                                                <tr>

                                                    <th>Action Date</th>
                                                    <th>Action Name</th>
                                                    <th>Action Taken By</th>
                                                    <th>Remarks</th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-history">
                                            </tbody>
                                        </table>
                                    </div>



                                </div>
                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <%--end--%>



    <%--MODAL WORK STARTS--%>

    <%--INTERVIEW SCHEDULE MODAL--%>
    
    <div class="modal fade" id="interviewSchModal" tabindex="-1" style="background-color:#00000070; " aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lblInterviewSchModal">Interview Request</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          
          <div class="row">
             <div class="col-md-6">
               <label for="html5-number-input" class="col-form-label label-custom">Request For <span style="color: red;">*</span></label>
               <div class="col-12">
                   <select id="ddlInterviewType" class="form-select color-dropdown">
                       <option value="-1" selected="selected" disabled>---Select Interview Type---</option>
                       <option value="Online Interview">Online Interview</option>
                       <option value="In Person Interview">In Person Interview</option>                                                            
                   </select>
               </div>
            </div>

              <div class="col-md-3">
                        <label for="html5-number-input" class="col-form-label label-custom" >Interview Date <span style="color: red;">*</span></label>
                        <div class="col-12">
                            <input class="form-control" type="text" placeholder="Enter D.O.B"  style="background-color: white;" id="txtInterviewDate">
                        </div>
               </div>
                <div class="col-md-3">
                        <label for="html5-number-input" class="col-form-label label-custom">Interview Time <span style="color: red;">*</span></label>
                        <div class="col-12">
                            <input class="form-control" type="time" value="12:30:00" id="txtInterviewTime">
                        </div>
               </div>

       </div>


         

            <div class="row">
               <div class="col-md-6">
                        <label for="html5-number-input" class="col-form-label label-custom">Location <span style="color: red;">*</span></label>
                        <div class="col-12">
                           <input class="form-control" type="text" placeholder="Enter D.O.B" value="" id="txtInterviewLocation">
                        </div>
               </div>
                <div class="col-md-6">
                        <label for="html5-number-input" class="col-form-label label-custom">Map URL<span style="color: red;">*</span></label>
                        <div class="col-12">
                            <input class="form-control" type="text" placeholder="Enter D.O.B" value="" id="txtMapLink">
                        </div>
               </div>
       </div>

          <div style="text-align: center;margin-top: 10px;font-size: large; text-decoration: underline;"><i class="pe-7s-paperclip" aria-hidden="true"></i> Attachment</div>
       <div class="row">

                <div class="col-md-6">
                    <label for="html5-number-input" class="col-form-label label-custom">Remarks <span style="color: red;">*</span></label>
                    <div>
                        <textarea id="taIntrvw" class="form-control " placeholder="Type your Remarks…." aria-describedby="basic-icon-default-message2"></textarea>
                    </div>
                </div>
        
        
                <div class=" insert-Attachment col-md-3">
        
                    <label for="html5-number-input" class="col-form-label label-custom">Select File/Docs <span style="color: red;">*</span></label>
        
                    <div>
                        <input class="form-control" type="file" id="fu-interview" title="Leave Request" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getInterviewAttachFileName()">
                        <label class="input-group-text ml-3" for="fu-interview" style="border: transparent;">
        
                            <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover rrf-fu-image" style="cursor: pointer; width: 49px; margin-top: -10px;">
                        </label>
                        <input type="text" id="lblIntrvwFileName" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                    </div>
                </div>
        
                <div class="col-md-2" style="padding-top: 45px;">
                    <a href="#" id="btnInterviewFU" class="btn btn-primary d-block" style="font-size: small"><i class='bx bx-upload'></i>Upload</a>
                    <%--<input type="button" id="btnRRFReqFU" value="Upload" class="btn btn-primary d-block" style="font-size: small">--%>
                </div>
        
            </div>       
        
            <div>
                <table class="table table-bordered table-striped nowrap tablepopup tbl-interview-attach" style="width: 100%; zoom: 94%;">
                    <thead>
                        <tr>
                            <th>File Name</th>
                            <th>Reamrks</th>
                            <th>Created Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody class="tbody-interview-attach">
                    </tbody>
                </table>
            </div>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btnSubmitInterview">Submit</button>
      </div>
    </div>
  </div>
</div>

    <%--INTERVIEW SCHEDULE MODAL END--%>





    <%--MODAL EVALUATION FORM--%>
    <div class="modal fade" id="ModalEvelutionForm" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
         <div class="modal-dialog modal-xl" role="document" style="background:white;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Interview Evelution Form</h5>
                    <button type="button" class="btn-close btn-close-task-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                     <div id="EvelutionFormRowDiv" style="background: #e8b79c3b; padding: 17px; border-radius: 12px; border: 2px solid #f9bfa86b; box-shadow: 0px 0px 13px -7px #d84d1a;">
                        <div class="row">

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Applicant Name</label>
                                    <div class="">

                                        <%--<input class="form-control" type="text" id="txtDepartment" readonly />--%>
                                        <label id="lblApplicantName" style="font-size: 12px;">-</label>
                                    </div>
                                </div>

                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                                    <div class="">
                                       <%-- <input class="form-control" type="text" id="txtNoOfPos" readonly />--%>
                                         <label id="lblEvelutionDepartment" style="font-size: 12px;">Information Technology</label>

                                    </div>
                                </div>
                                <div style="width: 25%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">Position Applied For</label>
                                    <div class="">

                                       <%-- <input class="form-control" type="text" id="txtReportsTo" readonly />--%>
                                        <label id="lblPosAppliedFor" style="font-size: 12px;">NAVAS</label>
                                    </div>
                                </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Interviewer</label>
                                <div class="">

                                    <input class="form-control" type="text" id="txtInterviewer" readonly disabled />
                                    <%-- <label id="lblInterviewer" style="font-size: 12px;">SOFTWARE DEVELOPER</label>--%>
                                    <%-- <select class="form-control" id="ddlInterviewer" style="border-color: lightgrey;">
                                             </select>--%>
                                </div>
                            </div>

                               
                            </div>
                         </div>
                    <div style="padding-top: 1%;">
                        <div class="row" style="padding-top: 1%; text-align: center; background-color: #c92121;">
                            <h5 class="modal-title" style="color: white;">INTERVIEW INFORMATION</h5>
                        </div>
                    </div>



                     <div class="row" style="padding-top:1%;">

                                <div class="row">
                                    <div class="col-2">
                                    <label for="html5-number-input" class="col-form-label label-custom">Interview Date:</label>
                                        </div>
                                    <div class="col-2" style="padding-top: 6px;">

                                        <label id="lblInterviewDate" style="font-size: 12px;">Candidate Name</label>
                                    </div>

                                     <div class="col-1">
                                         </div>

                                     <div class="col-2">
                                    <label for="html5-number-input" class="col-form-label label-custom">Interview Location:</label>
                                        </div>
                                     <div class="col-2" style="padding-top: 6px;">

                                        <label id="lblInterviewLocation" style="font-size: 12px;">Candidate Name</label>
                                    </div>

                                </div>

                                <div class="row" style="padding-top:1%;">
                                    <div class="col-2">
                                    <label for="html5-number-input" class="col-form-label label-custom">Interview Type:</label>
                                        </div>
                                    <div class="col-2">

                                       <%-- <label id="lblInterviewType1" style="font-size: 12px;">Candidate Name</label>--%>
                                           <select class="form-control" id="ddlInterviewType1" style="border-color: lightgrey;" disabled>
                                             </select>
                                    </div>

                                     <div class="col-1">
                                      </div>

                                   
                                     <div class="col-2">

                                       <%-- <label id="lblInterviewType2" style="font-size: 12px;">Candidate Name</label>--%>
                                            <select class="form-control" id="ddlInterviewType2" style="border-color: lightgrey;" disabled>
                                             </select>
                                     </div>

                                </div>

                               
                            </div>
                    <div style="padding-top: 1%;">

                        <div class="tab-pane fade show active" id="tab-SOItemEntered" role="tabpanel">

                            <div class="" style="margin-top: 1%;">

                                <table class="table table-bordered InterviewInfo-Details-table" style="width: 100%;">


                                    <thead>
                                        <tr class="Head-tr">
                                            <%--<th>Id</th>--%>
                                            <th style="width:60%;">COMPETENCIES</th>
                                            <th style="width:10%;">EXCELLENT</th>
                                            <th style="width:10%;">GOOD</th>
                                            <th style="width:10%;">AVERAGE</th>
                                            <th style="width:10%;">POOR</th>
                                            </tr>
                                           <tr class="tr-jobknow">
                                            <td>Job Knowledge</td>
                                            <td style="text-align:center;"><input type="radio" id="rdJK_Excellent" name="Job_Knowledge" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdJK_Good" name="Job_Knowledge" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdJK_Average" name="Job_Knowledge" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdJK_Poor" name="Job_Knowledge" value="POOR"></td>
                                          </tr>
                                          <tr class="tr-edu">
                                            <td>Education</td>
                                            <td style="text-align:center;"><input type="radio" id="rdEd_Excellent" name="Education" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdEd_Good" name="Education" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdEd_Average" name="Education" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdEd_Poor" name="Education" value="POOR"></td>
                                          </tr>

                                        <tr class="tr-exp">
                                            <td>Experience</td>
                                            <td style="text-align:center;"><input type="radio" id="rdExp_Excellent" name="Experience" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdExp_Good" name="Experience" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdExp_Average" name="Experience" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdExp_Poor" name="Experience" value="POOR"></td>
                                          </tr>

                                        <tr class="tr-comm">
                                            <td>Communication</td>
                                            <td style="text-align:center;"><input type="radio" id="rdComm_Excellent" name="Communication" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdComm_Good" name="Communication" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdComm_Average" name="Communication" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdComm_Poor" name="Communication" value="POOR"></td>
                                          </tr>

                                         <tr class="tr-perso">
                                            <td>Personality</td>
                                            <td style="text-align:center;"><input type="radio" id="rdPrs_Excellent" name="Personality" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPrs_Good" name="Personality" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPrs_Average" name="Personality" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPrs_Poor" name="Personality" value="POOR"></td>
                                          </tr>

                                         <tr class="tr-att">
                                            <td>Attittude</td>
                                            <td style="text-align:center;"><input type="radio" id="rdAtt_Excellent" name="Attittude" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdAtt_Good" name="Attittude" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdAtt_Average" name="Attittude" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdAtt_Poor" name="Attittude" value="POOR"></td>
                                          </tr>

                                        <tr class="tr-motiv">
                                            <td>Motivation</td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtv_Excellent" name="Motivation" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtv_Good" name="Motivation" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtv_Average" name="Motivation" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtv_Poor" name="Motivation" value="POOR"></td>
                                          </tr>

                                         <tr class="tr-matu">
                                            <td>Maturity</td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtr_Excellent" name="Maturity" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtr_Good" name="Maturity" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtr_Average" name="Maturity" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdMtr_Poor" name="Maturity" value="POOR"></td>
                                          </tr>

                                         <tr class="tr-persua">
                                            <td>Persuasiveness</td>
                                            <td style="text-align:center;"><input type="radio" id="rdPer_Excellent" name="Persuasiveness" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPer_Good" name="Persuasiveness" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPer_Average" name="Persuasiveness" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPer_Poor" name="Persuasiveness" value="POOR"></td>
                                          </tr>

                                        <tr class="tr-perfapptitude">
                                            <td>Performance on Aptitude Test</td>
                                            <td style="text-align:center;"><input type="radio" id="rdPOAT_Excellent" name="Performance_on_Aptitude_Test" value="EXCELLENT"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPOAT_Good" name="Performance_on_Aptitude_Test" value="GOOD"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPOAT_Average" name="Performance_on_Aptitude_Test" value="AVERAGE"></td>
                                            <td style="text-align:center;"><input type="radio" id="rdPOAT_Poor" name="Performance_on_Aptitude_Test" value="POOR"></td>
                                          </tr>


                                     <%--   <tr>
                                            <td>Experience</td>
                                            <td><input type="radio" id="rdExp_Excellent" name="Experience" value="EXCELLENT"></td>
                                            <td><input type="radio" id="rdExp_Good" name="Experience" value="GOOD"></td>
                                            <td><input type="radio" id="rdExp_Average" name="Experience" value="AVERAGE"></td>
                                            <td><input type="radio" id="rdExp_Poor" name="Experience" value="POOR"></td>
                                          </tr>
                                        --%>
                                    </thead>


                                    <tbody class="tbody-InterviewInfo">
                                    </tbody>
                                </table>
                            </div>

                            <div class="modal-footer" style="justify-content: flex-end;">
                               <%--<button type="button" class="btn btn-label-secondary btnPrev"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp; Prev</button>--%>
                               <button type="button" class="btn btn-primary btnSubmitEvaluation">Submit</button>
                           </div>

                        </div>

                    </div>

                </div>
            </div>
        </div>
 </div>


    <%--MODAL EVALUATION FORM END--%>

    <%--FINAL SELECTEION POPUP--%>
    <div class="modal fade" id="candiSelectionModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lblCandiSelectionModal">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
          <div class="row">
              <div class="col-md-4"><input type="radio" id="rbCandiSelected" name="Attittude" value="Selected"> Selected</div>
              <div class="col-md-4"><input type="radio" id="rbCandiOnHold" name="Attittude" value="On Hold"> On Hold</div>
              <div class="col-md-4"><input type="radio" id="rbCandiRejected" name="Attittude" value="Rejected">Rejected</div>
            </div>

          <div class="row" style="margin-top: 38px;">
              <div class="col-md-4">  Proposed Salary   </div>
              <div class="col-md-6">   <input class="form-control" type="number" placeholder="Enter Salary" value="" id="txtCandiSalary">  </div>
          </div>

          <div class="row" style="margin-top: 17px;">
              <div class="col-md-4">  Final Job Title    </div>
              <div class="col-md-6">  <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtCandiJobTitle">  </div>
          </div>

            <div class="row" style="margin-top: 17px;">
                <div class="col-md-4">  Work Location   </div>
                <div class="col-md-6"> <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtCandiWorkLoc">   </div>
            </div>

      </div>
      <div class="modal-footer">
        <%--<button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>--%>
        <button type="button" class="btn btn-primary btnSubmitCandiSalary">Submit</button>
      </div>
    </div>
  </div>
</div>
    <%--FINAL SELECTEION POPUP END--%>





      <%--Shortlist/Declined CONFIMATION MODAL FOR RRF--%>
        <div class="modal fade" id="confirmForRRFCandiModal" style="background-color:#00000070; z-index:999999" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <%--<div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>--%>
          <div><i class="pe-7s-info fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #4b81e1;"></i></div>
          <div><h3>Are you sure?</h3></div>
        <span class="cRRFCandiText">- </span> 
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-approve-rej-yes" data-bs-dismiss="modal">Confirm</button>
          </div>
      </div>
    </div>
  </div>
</div>


    <%--APPROVE/REJECT RRF By APPROVER AUTHORITIES--%>

    <div class="modal fade" id="appRejCommentModal" style="background-color:#00000070;" tabindex="-1" aria-hidden="true">
       <div class="modal-dialog" role="document">
         <div class="modal-content">
           <div class="modal-header">
             <h5 class="modal-title" id="lblappRejCommentModal"></h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
             <div class="row">
                 <div class="col-md-3">Remarks</div>
                 <div class="col-md-9">
                     <textarea class="form-control" id="taAppRejRemarks" rows="4" placeholder="Enter Your Remarks"></textarea>
                 </div>
             </div>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
             <button type="button" class="btn btn-primary btnAppRejRRF">Approve</button>
           </div>
         </div>
       </div>
</div>

    <%--APPROVE/REJECT RRF By APPROVER AUTHORITIES END--%>


    <script type="text/javascript">
        var currUserId = '';
        var EmpNo = '';
        var myrole = '';
        var overAllPerfo = 0;
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';

        });

    </script>

    <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>


    <script src="Scripts/requisition.js?v=1.1"></script>


    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />


    <link href="Assets/css/stepper.css" rel="stylesheet" />


    <link href="../TODONew/Asset/css/select2.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/select2.js"></script>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

    <script src="../Template/assets/vendor/libs/richtexteditor/jquery.richtext.js"></script>

</asp:Content>

