<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="EMSItemList.aspx.cs" Inherits="Sales_EMSItemList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" href="../Template/assets/vendor/libs/richtexteditor/richtext.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <link rel="stylesheet" href="../Template/assets/vendor/libs/richtexteditor/richtext.css" />

    <style type="text/css">
        .nav .nav-link:hover, .nav .nav-link:focus {
            color: #9d0000a3 !important;
        }

        .nav-pills .nav-link.active, .nav-pills .nav-link.active:hover, .nav-pills .nav-link.active:focus {
            background-color: #ffdddd54 !important;
            color: #000000 !important;
            box-shadow: none !important;
        }

        .nav-pills .nav-link.active, .nav-pills .show > .nav-link {
            color: #000 !important;
            background-color: #ededed !important;
        }

        .nav-pills .nav-link {
            font-size: 12px;
        }

        .tab-content {
            padding: 10px 0px !important;
        }

        input[type="radio"] {
            -webkit-appearance: none;
            width: 25px;
            height: 25px;
            border: 1px solid #b70000;
            border-radius: 50%;
            margin-right: 15px;
            background-color: transparent;
            position: relative;
            top: 8px;
        }

            input[type="radio"]:checked::before {
                content: "";
                display: block;
                width: 25px;
                height: 25px;
                background-color: #b70000;
                border-radius: 50%;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                animation: linear 1s;
                animation-delay: 1.5s;
            }

        .table.project-table {
            border-radius: 20px;
            background-color: white !important;
        }

            .table.project-table thead tr {
                border-bottom-width: 0px !important;
                border: none !important;
            }

            .table.project-table tbody {
                border-top: none !important;
            }

            .table.project-table thead th {
                vertical-align: bottom;
                border: none !important;
                font-size: 10px;
                text-align: left;
                border-bottom: none !important;
                text-transform: capitalize;
                background: rgb(228 235 241 / 50%) !important;
                padding: 12px !important;
            }

            .table.project-table th:first-child {
                border-radius: 10px 0 0 10px;
            }

            .table.project-table th:last-child {
                border-radius: 0 10px 10px 0;
            }

            .table.project-table tbody td {
                padding: 14px !important
            }

        .project-table tbody, .project-table td, .project-table tfoot {
            font-size: 12px !important;
            background-color: white;
        }

            .project-table tbody tr {
                border-bottom: 1px solid #e4e4e4;
            }

        .tabstyle {
            width: 25% !important;
            border: none !important;
            box-shadow: none !important;
        }

        .noborderbg {
            MARGIN: 0;
            border: none;
            background: none;
            background-color: transparent !important;
            padding: 0;
            font-weight: 400 !important;
            font-size: 14px;
        }

        .txtCustomClass {
            border: #cdcdcd 1px solid;
            padding: 5px;
            border-radius: 4px;
            margin-top: 5px;
        }

        .ddlCustomClass {
            border: #cdcdcd 1px solid;
            padding: 4px 11px 7px 23px;
            border-radius: 4px;
            margin-top: 5px;
        }

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
            color: #000000 !important;
            font-weight: 600 !important;
            text-transform: none;
            font-size: 11px;
            margin: 0;
        }

        .activestep {
            /*box-shadow: 0rem 0 0 0.4rem rgb(13 169 239 / 61%);*/
            box-shadow: 0rem 0 0 0.4rem #ef5c0d78;
        }

        .padding-row {
            padding-bottom: 17px;
        }

        .tbody-rrf, .tbody-rrfreq-attach, .tbody-rrfreq-attach-viewonly, .tbody-CandiShorlisted, .tbody-interview, .tbody-candiselected, .tbody-history, .tbody-Approval td {
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

        .sub-tabl-bg {
            background-color: #faa46d96 !important;
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
        .nav-tabs .nav-link.active {
            font-size: 15px !important;
            color: #9d0000a3 !important;
        }

        .fcast-quarter-table thead tr th:first-child {
            width: 50px !important;
        }

        .progressbar {
            padding-bottom: 10px;
            margin: 10px 0px 60px 0px;
            counter-reset: step;
            width: 135%;
        }

            .progressbar li {
                list-style-type: none;
                width: 25%;
                float: left;
                font-size: 12px;
                position: relative;
                text-align: center;
                text-transform: uppercase;
                color: #7d7d7d;
            }

                .progressbar li:before {
                    width: 25px;
                    height: 25px;
                    content: '';
                    line-height: 30px;
                    border: 2px solid #7d7d7d;
                    background-color: #7d7d7d;
                    display: block;
                    text-align: center;
                    margin: 0 auto 10px auto;
                    border-radius: 50%;
                    transition: all .8s;
                }

                .progressbar li:after {
                    width: 100%;
                    height: 4px;
                    content: '';
                    position: absolute;
                    background-color: #7d7d7d;
                    top: 18px;
                    left: 0%;
                    transition: all .8s;
                }

                .progressbar li:last-child:after {
                    width: 50%;
                    height: 4px;
                    content: '';
                    position: absolute;
                    background-color: #7d7d7d;
                    top: 18px;
                    left: 0%;
                    transition: all .8s;
                }

                .progressbar li:first-child:after {
                    width: 50%;
                    left: 50%;
                    content: '';
                }

                .progressbar li.active:before {
                    border-color: #a92828;
                    background-color: #a92828;
                    transition: all .8s;
                }

                .progressbar li.active:after {
                    background-color: #a9282873;
                    transition: all .8s;
                }



        .btn:hover {
            color: white;
        }

        .btn:focus {
            color: white;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            width: 100%;
            position: absolute;
            bottom: 0;
        }

        .struct-edit:hover {
            color: #55cee9 !important;
        }


        /*.progress-container {
            width: 100%;
            display: flex;
            justify-content: space-between;
            margin: 50px auto;
            position: relative;
            margin-bottom: 100px;
        }

        .progress-bar {
            width: 99%;
            height: 5px;
            background-color: grey;
            position: absolute;
            top: 50%;
            left: 0;
            
        }

        .status-bar {
            width: 100%;
            height: 5px;
            background-color: transparent;
            position: absolute;
            top: 50%;
            left: 0;
           
        }

        .circle {
            width: 50px;
            height: 50px;
            background-color: white;
            border-radius: 50%;
            position: relative;
        }

            .circle span {
                position: absolute;
                top: 150%;
                left: 9%;
                color: #141d0d;
            }

            .circle i {
                position: absolute;
                top: 35%;
                left: 35%;
                display: none;
            }

            .circle.active i {
                display: block;
            }

        .active {
            display: block;
            background-color: #43880f;
        }

        .animate {
            animation: fill 0.5s ease-in-out 0.4s forwards;
        }

        .buttons {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .button {
            color: white;
            width: 100px;
            padding: 10px 20px;
            margin: 20px auto;
            border-radius: 3px;
            background-color: #43880f;
            border: none;
        }

        .next {
            color: white;
        }

        .submit {
            display: none;
        }

        button:disabled {
            cursor: not-allowed;
            background-color: gray;
        }

        .message {
            width: 500px;
            height: 300px;
            border-radius: 5px;
            border: 2px solid;
            gap: 10px;
            display: block;
            text-align: center;
            padding: 100px 5px;
            display: none;
        }

            .message i {
                margin-bottom: 50px;
                font-size: 25px;
                padding: 20px 20px;
                background-color: rgb(230, 111, 196);
                border-radius: 50%;
                animation: fillIcon 0.8s ease alternate;
            }

        @keyframes fill {
            100% {
                box-shadow: inset 0px 0px 0px 30px #43880f;
            }
        }

        @keyframes fillIcon {
            0% {
                transform: scale(1);
            }

            100% {
                transform: scale(1.2);
            }
        }*/
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div style="">
            <h5 style="">Estimation List</h5>
        </div>

        <div class="row" style="/*display: flex; justify-content: flex-end; margin-top: -25px; */">

            <div class="col-md-1">
                <label><i class="bx bx-search-alt-2" style="margin-top: -7px; font-size: 26px; color: #7fa3ff;"></i></label>
                <label for="html5-number-input" class="col-form-label label-custom">Estimator Status</label>
            </div>
            <div class="col-md-2">
                <select id="ddlFilterStatus" class="form-select color-dropdown">
                    <option value="-1">All</option>
<option value="PENDING FOR APPROVAL" selected>Pending For Approval</option>
<option value="UNDER ESTIMATION" >Under Estimation</option>
<%--<option value="ESTIMATED" >Completed</option>--%>
<option value="RELEASED" >Released</option>
<option value="REJECTED" >Rejected</option>
                </select>
            </div>
            <%--<div class="col-md-1"> <input type="button" id="btnSearchTask" value="Search" class="btn btn-primary d-block" style="font-size:small"> </div>--%>
        </div>


        <div class="card-body" style="margin-top: 0%;">
            <div>
                <table class="mt-1 table esti-req-table" style="width: 100%;">

                    <thead>
                        <tr class="Head-tr">
                            <%--<th>Id</th>--%>
                            <th>OPT No.</th>
                            <th>Request No.</th>
                            <th>Request Date</th>
                            <th>Status</th>
                            <th>Created Date</th>
                            <th>Created By</th>
                            <th>Estimation Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody class="tbody-esti-req">
                    </tbody>
                </table>
            </div>
        </div>
    </div>



    <%--MODAL WORK STARTS--%>

    <div class="modal fade" id="addReqModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document" style="min-width: 98%; height: 90%;">
            <div class="modal-content" style="height: 100%;">
                <div class="modal-header">

                    <div class="d-flex " style="width: 43%;">
                        <div class="me-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="3rem" height="3rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 9h14M5 15h14M11 4L7 20M17 4l-4 16" />
                            </svg>
                        </div>
                        <div>
                            <label for="html5-number-input" class="  label-custom">Estimation No.</label>
                            <div class="">
                                <label id="txtESTNumber" value="" class="form-control noborderbg"></label>
                            </div>
                        </div>
                    </div>

                    <h5 class="modal-title" id="addReqModalLabel">Create Estimation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="nav-align-top">
                                <div class="row">
                                    <div class="col-12">
                                        <ul class="nav nav-tabs progressbar d-flex flex-row" id="progress-bar" role="tablist">
                                            <li class="nav-link active tabstyle" id="nav-Details-tab" data-bs-toggle="tab" data-bs-target="#nav-Details" type="button" role="tab" aria-controls="nav-Details" aria-selected="true">View All Details</li>
                                            <li class="nav-link tabstyle" id="nav-Structure-tab" data-bs-toggle="tab" data-bs-target="#nav-Structure" type="button" role="tab" aria-controls="nav-Structure" aria-selected="false" aria-disabled="true">Create Structure</li>
                                            <li class="nav-link tabstyle" id="nav-TOC-tab" data-bs-toggle="tab" data-bs-target="#nav-TOC" type="button" role="tab" aria-controls="nav-TOC" aria-selected="false" aria-disabled="true">Create TOC</li>
                                            <%--<li class="nav-link tabstyle" id="nav-Summary-tab" data-bs-toggle="tab" data-bs-target="#nav-Summary" type="button" role="tab" aria-controls="nav-Summary" aria-selected="false" aria-disabled="true">Summary</li>--%>
                                            <%--<li><button class="nav-link active" id="nav-Details-tab" data-bs-toggle="tab" data-bs-target="#nav-Details" type="button" role="tab" aria-controls="nav-Details" aria-selected="true">View All Details</button></li>--%>
                                            <%--<li><button class="nav-link" id="nav-Structure-tab" data-bs-toggle="tab" data-bs-target="#nav-Structure" type="button" role="tab" aria-controls="nav-Structure" aria-selected="false">Create Structure</button></li>--%>
                                            <%--<li><button class="nav-link" id="nav-TOC-tab" data-bs-toggle="tab" data-bs-target="#nav-TOC" type="button" role="tab" aria-controls="nav-TOC" aria-selected="false">Create TOC</button></li>
                                            <li><button class="nav-link" id="nav-Summary-tab" data-bs-toggle="tab" data-bs-target="#nav-Summary" type="button" role="tab" aria-controls="nav-Summary" aria-selected="false">Summary</button></li>--%>
                                        </ul>
                                    </div>

                                    <div class="col-12" style="max-height: 700px; overflow-y: auto;">
                                        <div class="tab-content" id="nav-tabContent">
                                            <div class="tab-pane fade show active" id="nav-Details" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div id="Estimation-details-rectangle-divS" style="">
                                                    <div class="row mt-4 mb-4" style="">
                                                        <h5 class="fw-bold prpmdl-hed border-bottom" id="" style="">Details</h5>
                                                    </div>
                                                    <div class="row ">
                                                        <div class="d-flex" style="width: 25%;">
                                                            <div class="me-2 mt-2 align-items-center ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                                    <path fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 9h14M5 15h14M11 4L7 20M17 4l-4 16"></path>
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Request ID</label>
                                                                <div class="">
                                                                    <label id="txtEstRef" value="" class="form-control noborderbg">EMS.0015</label>
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="d-flex" style="width: 25%;">
                                                            <div class="me-2 mt-2 align-items-center ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 32 32">
                                                                    <path fill="#a92828" d="M16 20h14v2H16zm0 4h14v2H16zm0 4h7v2h-7z"></path>
                                                                    <path fill="#a92828" d="M14 26H4V6h7.17l3.42 3.41l.58.59H28v8h2v-8a2 2 0 0 0-2-2H16l-3.41-3.41A2 2 0 0 0 11.17 4H4a2 2 0 0 0-2 2v20a2 2 0 0 0 2 2h10Z"></path>
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Project Name </label>
                                                                <div class="">
                                                                    <label id="txtPrjName" value="" class="form-control noborderbg" style="">Proposed G+2P+9Typ+HC Bldg Plot#248-428 @ Al Qusais</label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-flex" style="width: 12%;">
                                                            <div class="me-2 mt-2 align-items-center ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                                    <path fill="#a92828" d="M20 18H4V8h16m0-2h-8l-2-2H4c-1.11 0-2 .89-2 2v12a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8a2 2 0 0 0-2-2m-1 6v-1h-1.5l.5-2h-1l-.5 2h-2l.5-2h-1l-.5 2H12v1h1.25l-.5 2H11v1h1.5l-.5 2h1l.5-2h2l-.5 2h1l.5-2H18v-1h-1.25l.5-2zm-3.25 2h-2l.5-2h2z"></path>
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Project Ref</label>
                                                                <div class="">
                                                                    <label id="txtProjRef" value="" class="form-control noborderbg">16051</label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-flex" style="width: 13%;">
                                                            <div class="me-2 mt-2 align-items-center ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 48 48">
                                                                    <g fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="4">
                                                                        <path d="M40 23v-9L31 4H10a2 2 0 0 0-2 2v36a2 2 0 0 0 2 2h12m4-12h14m-14 6h14M30 28v14m6-14v14"></path>
                                                                        <path d="M30 4v10h10"></path>
                                                                    </g>
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Opportunity Ref</label>
                                                                <div class="">
                                                                    <label id="txtOppRef" value="" class="form-control noborderbg">1024070249</label>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="d-flex" style="width: 10.5%;">
                                                            <div class="me-2 mt-2 align-items-center ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                                    <path fill="#a92828" d="M12.8 22H6c-1.1 0-2-.9-2-2V4c0-1.1.9-2 2-2h8l6 6v3.5c-.6-.3-1.3-.4-2-.5V9h-5V4H6v16h5.5c.3.7.8 1.4 1.3 2M17 12l-2.2 2.2l2.2 2.2V15c1.4 0 2.5 1.1 2.5 2.5c0 .4-.1.8-.3 1.1l1.1 1.1c.4-.6.7-1.4.7-2.2c0-2.2-1.8-4-4-4zm2.2 8.8L17 18.5V20c-1.4 0-2.5-1.1-2.5-2.5c0-.4.1-.8.3-1.1l-1.1-1.1c-.4.6-.7 1.4-.7 2.2c0 2.2 1.8 4 4 4V23z"></path>
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Revision </label>
                                                                <div class="">
                                                                    <label id="txtRevision" value="" class="form-control noborderbg">1</label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-flex" style="width: 12%;">
                                                            <div class="me-2 mt-2 align-items-center ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 20 20">
                                                                    <path fill="#a92828" d="M1 4c0-1.1.9-2 2-2h14a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2zm2 2v12h14V6zm2-6h2v2H5zm8 0h2v2h-2zM5 9h2v2H5zm0 4h2v2H5zm4-4h2v2H9zm0 4h2v2H9zm4-4h2v2h-2zm0 4h2v2h-2z"></path>
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Year</label>
                                                                <div class="">
                                                                    <label id="txtEstYear" value="" class="form-control noborderbg">2024</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row mt-2" style="">
                                                        <div class="d-flex" style="width: 25%;">
                                                            <div class="me-2 align-items-center ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2.5rem" height="2.5rem" viewBox="0 0 48 48">
                                                                    <g fill="none">
                                                                        <path d="M0 0h48v48H0z" />
                                                                        <path fill="#a92828" fill-rule="evenodd" d="M21.058 7.52c-2.698.984-4.814 3.285-5.659 6.174C13.898 14.464 13 15.44 13 16.5c0 1.198 1.144 2.287 3.01 3.093Q16 19.795 16 20a8 8 0 1 0 15.99-.407C33.856 18.787 35 17.698 35 16.5c0-1.061-.898-2.036-2.4-2.806c-.844-2.89-2.96-5.19-5.658-6.175A2 2 0 0 0 25 6h-2a2 2 0 0 0-1.942 1.52M22 12a1 1 0 0 0 1-1V8h2v3a1 1 0 1 0 2 0V9.722c1.587.81 2.868 2.253 3.525 4.056l-.008.035a1.4 1.4 0 0 1-.157.107c-.286.17-.758.356-1.412.526c-1.293.337-3.081.554-4.948.554s-3.655-.217-4.948-.554c-.654-.17-1.126-.356-1.412-.526a1.4 1.4 0 0 1-.157-.107l-.002-.009l-.006-.026c.657-1.803 1.938-3.247 3.525-4.056V11a1 1 0 0 0 1 1m-5.656 3.458l-.033.016c-.607.311-.974.607-1.167.828a.8.8 0 0 0-.138.198c.021.048.082.152.249.314c.313.303.871.668 1.724 1.017C18.675 18.525 21.157 19 24 19s5.325-.475 7.02-1.17c.854-.348 1.412-.713 1.725-1.016c.167-.162.228-.266.249-.314a.8.8 0 0 0-.138-.198c-.193-.221-.56-.517-1.167-.828l-.033-.016a3 3 0 0 1-.272.18c-.517.308-1.195.552-1.933.744C27.961 16.77 26 17 24 17s-3.961-.23-5.451-.618c-.738-.192-1.416-.436-1.933-.745a3 3 0 0 1-.272-.18m16.66 1.07L33 16.52zm0-.058q-.002 0-.003.01l.002-.008zm-18.006.006l-.001-.006l.002.01zm0 .048v-.005v.003l-.001.006zm14.996 3.75C28.27 20.734 26.21 21 24 21s-4.27-.267-5.994-.726a6 6 0 0 0 11.988 0m4.691 6.32a1 1 0 0 0-1.274-1.25A6.502 6.502 0 0 0 32 36.977V41a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1v-4.022a6.502 6.502 0 0 0-1.411-11.635a1 1 0 0 0-1.274 1.251l.022.082l.557 2.6a1.425 1.425 0 1 1-2.788 0l.557-2.6zm4.164 2.263l-.1-.472a4.5 4.5 0 0 1-1.205 7.125a1 1 0 0 0-.545.93l.001.06V40h-3v-3.508l.001-.052a1 1 0 0 0-.544-.93a4.5 4.5 0 0 1-1.205-7.125l-.101.472a3.425 3.425 0 1 0 6.698 0m-20.496-.249L23 32.222v3.675c.205.052.525.103 1 .103s.795-.05 1-.103V32l2-1.5V42H6v-6c0-3.661 6.52-6.273 12.353-7.392m-3.878 7.66L21 35.181V40h-8v-7.82a31 31 0 0 1 3.35-1.07zM8 40h3v-6.921l-.074.039c-1.064.564-1.842 1.139-2.332 1.68C8.114 35.33 8 35.723 8 36zm16-2q-.566-.002-1-.067V40h2v-2.067q-.434.065-1 .067m-3.05-4.839l-2.508-1.95l-.917 2.521z" clip-rule="evenodd" />
                                                                    </g>
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Contr ABBR </label>
                                                                <div class="">
                                                                    <label id="txtContrAbbr" value="" class="form-control noborderbg" style=""></label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex" style="width: 25%;">
                                                            <div class="me-2">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2.5rem" height="2.5rem" viewBox="0 0 48 48">
                                                                    <g fill="none">
                                                                        <path d="M0 0h48v48H0z" />
                                                                        <path fill="#a92828" fill-rule="evenodd" d="m33.219 13.21l-.09-.07c-.173-1.314-.802-2.683-1.784-3.837C29.75 7.428 27.15 6 23.67 6c-3.43 0-5.847 1.564-7.273 3.503A8.2 8.2 0 0 0 15 12.51a7 7 0 0 0-.112.616l-.108.083c-1.124.871-1.949 1.927-1.753 3.138c.188 1.17 1.246 1.882 2.23 2.317q.376.166.807.312a8 8 0 1 0 15.87 0q.431-.145.807-.312c.984-.435 2.041-1.147 2.23-2.317c.196-1.211-.629-2.267-1.753-3.138m-16.274 1.462c-.13-.374-.164-.975.005-1.718c.166-.725.51-1.52 1.05-2.256V13.5a1 1 0 1 0 2 0V8.91c.823-.468 1.818-.795 3-.885V11.5a1 1 0 1 0 2 0V8.087a8.1 8.1 0 0 1 3 1V13.5a1 1 0 1 0 2 0v-2.682c1.105 1.416 1.364 2.944 1.053 3.861a1 1 0 0 0 1.759.905c.197.275.19.421.186.444c-.013.08-.166.41-1.065.808c-.39.172-.854.327-1.375.464l-.024.006c-.565.146-1.194.27-1.867.372a31 31 0 0 1-3.767.31a36 36 0 0 1-2.6-.028a30 30 0 0 1-2.976-.284a18 18 0 0 1-1.858-.37l-.024-.006a9 9 0 0 1-1.375-.464c-.899-.398-1.052-.728-1.065-.808c-.004-.023-.011-.169.186-.444a1 1 0 0 0 1.757-.912m1.077 4.809q.499.097 1.028.177c1.068.16 2.218.262 3.388.31a38 38 0 0 0 3.13 0c1.164-.048 2.31-.15 3.373-.31q.534-.078 1.037-.177a6 6 0 1 1-11.956 0" clip-rule="evenodd" />
                                                                        <path fill="#a92828" fill-rule="evenodd" d="M29 28.49c.658.115 1.328.249 2 .402C36.443 30.135 42 32.62 42 36v6H6v-6c0-3.38 5.557-5.865 11-7.108a40 40 0 0 1 2-.402V33h10zm-14 3c.654-.2 1.325-.381 2-.544V35h14v-4.053a33 33 0 0 1 3 .868V40h2v-7.403q.436.194.838.399c1.137.578 1.98 1.174 2.514 1.744c.525.56.648.973.648 1.26v4H8v-4c0-.287.123-.7.648-1.26c.534-.57 1.377-1.166 2.514-1.744c.569-.29 1.186-.562 1.838-.815V40h2z" clip-rule="evenodd" />
                                                                    </g>
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Main Contractor </label>
                                                                <div class="">
                                                                    <label id="txtPrjMainContr" value="" class="form-control noborderbg" style=""></label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex" style="width: 25%;">
                                                            <div class="me-2">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2.5rem" height="2.5rem" viewBox="0 0 48 48">
                                                                    <g fill="none">
                                                                        <path d="M0 0h48v48H0z" />
                                                                        <path fill="#a92828" fill-rule="evenodd" d="M24 6a1 1 0 0 1 1 1v.068c2.798.292 4.933 1.495 6.323 3.026c.956 1.053 1.589 2.308 1.788 3.532l.108.083c1.124.871 1.949 1.927 1.753 3.138c-.189 1.17-1.246 1.882-2.23 2.317a9 9 0 0 1-.76.296q.018.267.018.54a8 8 0 1 1-15.982-.54a9 9 0 0 1-.76-.296c-.984-.435-2.041-1.147-2.23-2.317c-.196-1.211.629-2.267 1.753-3.138l.127-.098a6 6 0 0 1 .096-.474a7.6 7.6 0 0 1 1.411-2.853C17.755 8.576 19.948 7.196 23 7.02V7a1 1 0 0 1 1-1m7.66 10.44a1 1 0 0 0 1.152-.356c.197.275.19.421.186.444c-.013.08-.166.41-1.065.808c-1.049.464-2.627.8-4.437.99a3.5 3.5 0 0 0-6.992 0c-1.81-.19-3.388-.526-4.437-.99c-.899-.398-1.052-.728-1.065-.808c-.004-.023-.011-.168.186-.444a1 1 0 0 0 1.75-.931c-.12-.324-.157-.861.009-1.543a5.6 5.6 0 0 1 1.042-2.091l.011-.014V13.5a1 1 0 1 0 2 0V9.846c.822-.435 1.817-.739 3-.823V11.5a1 1 0 1 0 2 0V9.081c1.17.147 2.168.482 3 .93V13.5a1 1 0 1 0 2 0v-1.881c1.116 1.327 1.352 2.731 1.06 3.541a1 1 0 0 0 .6 1.28m-10.193 4.475a28 28 0 0 1-3.448-.435a6 6 0 0 0 11.962 0c-1.06.208-2.234.352-3.448.435A3.5 3.5 0 0 1 24 22a3.5 3.5 0 0 1-2.533-1.085M25.5 18.5a1.5 1.5 0 1 1-3 0a1.5 1.5 0 0 1 3 0" clip-rule="evenodd" />
                                                                        <path fill="#a92828" d="M24 39a2 2 0 1 0 0-4a2 2 0 0 0 0 4" />
                                                                        <path fill="#a92828" fill-rule="evenodd" d="M19.534 28.4L23 31h2l3.466-2.6C34.561 29.376 42 32.09 42 36v6H6v-6c0-3.91 7.439-6.624 13.534-7.6m6.133 4.6l3.31-2.483c1.003.184 2.024.415 3.023.686V40h2v-8.185c.7.24 1.371.501 2 .782V40H12v-7.403c.629-.28 1.3-.542 2-.782V40h2v-8.797c.999-.271 2.02-.502 3.023-.686L22.333 33zm13.638 1.69c.564.584.695 1.015.695 1.31v4h-2v-6.344c.54.346.976.694 1.305 1.035m-30.61 0c.33-.34.766-.688 1.305-1.034V40H8v-4c0-.295.13-.726.695-1.31" clip-rule="evenodd" />
                                                                    </g>
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">MEP Contractor </label>
                                                                <div class="">
                                                                    <label id="txtPrjMEPContr" value="" class="form-control noborderbg" style=""></label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex" style="width: 25%;">
                                                            <div class="me-2 mt-2 align-items-center ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                                    <path fill="#a92828" d="M12 2.5a1.5 1.5 0 0 0-1.376.9l-.262.6H4.5v16h15V4h-5.862l-.262-.6A1.5 1.5 0 0 0 12 2.5M9.128 2A3.5 3.5 0 0 1 12 .5c1.19 0 2.24.594 2.872 1.5H21.5v20h-19V2zM12 8a1.5 1.5 0 1 0 0 3a1.5 1.5 0 0 0 0-3M8.5 9.5a3.5 3.5 0 1 1 7 0a3.5 3.5 0 0 1-7 0M6 18a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v1h-2v-1a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v1H6z" />
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Consultant</label>
                                                                <div class="">
                                                                    <label id="txtPrjConsultant" value="" class="form-control noborderbg" style=""></label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div class="row mt-3">

                                                        <div class="d-flex" style="width: 25%;">
                                                            <div class="me-2 mt-2 align-items-center ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                                    <g fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5">
                                                                        <circle cx="12" cy="9.1" r="2.5" />
                                                                        <path d="M17 19.2c-.317-6.187-9.683-6.187-10 0" />
                                                                        <path d="M9.713 3.64c.581-.495.872-.743 1.176-.888a2.577 2.577 0 0 1 2.222 0c.304.145.595.393 1.176.888c.599.51 1.207.768 2.007.831c.761.061 1.142.092 1.46.204c.734.26 1.312.837 1.571 1.572c.112.317.143.698.204 1.46c.063.8.32 1.407.83 2.006c.496.581.744.872.889 1.176c.336.703.336 1.52 0 2.222c-.145.304-.393.595-.888 1.176a3.306 3.306 0 0 0-.831 2.007c-.061.761-.092 1.142-.204 1.46a2.577 2.577 0 0 1-1.572 1.571c-.317.112-.698.143-1.46.204c-.8.063-1.407.32-2.006.83c-.581.496-.872.744-1.176.889a2.577 2.577 0 0 1-2.222 0c-.304-.145-.595-.393-1.176-.888a3.306 3.306 0 0 0-2.007-.831c-.761-.061-1.142-.092-1.46-.204a2.577 2.577 0 0 1-1.571-1.572c-.112-.317-.143-.698-.204-1.46a3.305 3.305 0 0 0-.83-2.006c-.496-.581-.744-.872-.89-1.176a2.577 2.577 0 0 1 .001-2.222c.145-.304.393-.595.888-1.176c.52-.611.769-1.223.831-2.007c.061-.761.092-1.142.204-1.46a2.577 2.577 0 0 1 1.572-1.571c.317-.112.698-.143 1.46-.204a3.305 3.305 0 0 0 2.006-.83" />
                                                                    </g>
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Client </label>
                                                                <div class="">
                                                                    <label id="txtPrjClient" value="" class="form-control noborderbg" style=""></label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex" style="width: 25%;">
                                                            <div class="me-2 mt-2 align-items-center ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                                    <path fill="#a92828" d="M8.75 10a3.25 3.25 0 1 1 6.5 0a3.25 3.25 0 0 1-6.5 0" />
                                                                    <path fill="#a92828" fill-rule="evenodd" d="M3.774 8.877a8.038 8.038 0 0 1 8.01-7.377h.432a8.038 8.038 0 0 1 8.01 7.377a8.693 8.693 0 0 1-1.933 6.217L13.5 20.956a1.937 1.937 0 0 1-3 0l-4.792-5.862a8.693 8.693 0 0 1-1.934-6.217M12 5.25a4.75 4.75 0 1 0 0 9.5a4.75 4.75 0 0 0 0-9.5" clip-rule="evenodd" />
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Location </label>
                                                                <div class="">
                                                                    <label id="txtPrjLocation" value="" class="form-control noborderbg" style=""></label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-flex" style="width: 25%;">
                                                            <div class="me-2">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                                    <path fill="#a92828" d="m18.308 17.423l1.615-1.615l-1.23-1.654h-1.728q-.188-.566-.269-1.078T16.616 12t.08-1.051t.27-1.103h1.726l1.231-1.654l-1.615-1.615q-1.216.992-1.897 2.413q-.68 1.42-.68 3.01t.68 3.01t1.897 2.413M1 19.616V4.385h22v15.23zm13.785-1H22V5.385H2v13.23h1.216q1.05-1.355 2.553-2.177T9 15.616t3.23.822t2.555 2.178M8.998 14.23q1.04 0 1.771-.729t.731-1.769t-.728-1.771t-1.77-.731t-1.771.728t-.731 1.77t.729 1.771t1.769.73M4.55 18.617h8.9q-.87-.95-2.025-1.475T9 16.616q-1.275 0-2.425.525T4.55 18.616M9 13.23q-.617 0-1.059-.441q-.441-.442-.441-1.06t.441-1.058T9 10.231t1.059.441t.441 1.059t-.441 1.059q-.442.44-1.059.44M12 12" />
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Contact Person With Phone </label>
                                                                <div class="">
                                                                    <label id="txtPrjContactPerson" value="" class="form-control noborderbg" style="" placeholder="-----Click to select Customer-----"></label>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="d-flex div-win" style="width: 10.5%;">
                                                            <div class="me-2 ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 256 256">
                                                                    <path fill="#a92828" d="M244 56v64a12 12 0 0 1-24 0V85l-75.51 75.52a12 12 0 0 1-17 0L96 129l-63.51 63.49a12 12 0 0 1-17-17l72-72a12 12 0 0 1 17 0L136 135l67-67h-35a12 12 0 0 1 0-24h64a12 12 0 0 1 12 12" />
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Winning % </label>
                                                                <div class="">
                                                                    <label id="txtPrjWinningPerc" value="" class="form-control noborderbg" style=""></label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-flex div-budge" style="width: 10.5%;">
                                                            <div class="me-2">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                                    <path fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m3.75 9v7.5m2.25-6.466a9 9 0 0 0-3.461-.203c-.536.072-.974.478-1.021 1.017a5 5 0 0 0-.018.402c0 .464.336.844.775.994l2.95 1.012c.44.15.775.53.775.994q0 .204-.018.402c-.047.539-.485.945-1.021 1.017a9.1 9.1 0 0 1-3.461-.203M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9" />
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Budget </label>
                                                                <div class="">
                                                                    <label id="txtPrjBudget" value="" class="form-control noborderbg" style=""></label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row mt-3">

                                                        <div class="d-flex" style="width: 25%;">
                                                            <div class="me-2 mt-2 align-items-center ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                                    <g fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5">
                                                                        <path d="M3.338 17A10 10 0 0 0 12 22a10 10 0 0 0 8.662-5M3.338 7A10 10 0 0 1 12 2a10 10 0 0 1 8.662 5" />
                                                                        <path d="M13 21.95s1.408-1.853 2.295-4.95M13 2.05S14.408 3.902 15.295 7M11 21.95S9.592 20.098 8.705 17M11 2.05S9.592 3.902 8.705 7M9 10l1.5 5l1.5-5l1.5 5l1.5-5M1 10l1.5 5L4 10l1.5 5L7 10m10 0l1.5 5l1.5-5l1.5 5l1.5-5" />
                                                                    </g>
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">URL </label>
                                                                <div class="">
                                                                    <label id="txtPrjURL" value="" class="form-control noborderbg" style=""></label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-flex" style="width: 25%;">
                                                            <div class=" me-2 mt-2 align-items-center ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                                    <path fill="#a92828" d="M12 11a5 5 0 0 1 5 5v6h-2v-6a3 3 0 0 0-2.824-2.995L12 13a3 3 0 0 0-2.995 2.824L9 16v6H7v-6a5 5 0 0 1 5-5m-6.5 3q.42.001.81.094a6 6 0 0 0-.301 1.575L6 16v.086a1.5 1.5 0 0 0-.356-.08L5.5 16a1.5 1.5 0 0 0-1.493 1.355L4 17.5V22H2v-4.5A3.5 3.5 0 0 1 5.5 14m13 0a3.5 3.5 0 0 1 3.5 3.5V22h-2v-4.5a1.5 1.5 0 0 0-1.355-1.493L18.5 16q-.264.001-.5.085V16c0-.666-.108-1.306-.308-1.904c.258-.063.53-.096.808-.096m-13-6a2.5 2.5 0 1 1 0 5a2.5 2.5 0 0 1 0-5m13 0a2.5 2.5 0 1 1 0 5a2.5 2.5 0 0 1 0-5m-13 2a.5.5 0 1 0 0 1a.5.5 0 0 0 0-1m13 0a.5.5 0 1 0 0 1a.5.5 0 0 0 0-1M12 2a4 4 0 1 1 0 8a4 4 0 0 1 0-8m0 2a2 2 0 1 0 0 4a2 2 0 0 0 0-4" />
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Estimation Team Org </label>
                                                                <div class="">
                                                                    <label id="ddlEstimationTeamOrg" class="form-control noborderbg"></label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-flex" style="width: 25%;">
                                                            <div class=" me-2 mt-2 align-items-center ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 32 32">
                                                                    <path fill="#a92828" d="M30 6V4h-3V2h-2v2h-1c-1.103 0-2 .898-2 2v2c0 1.103.897 2 2 2h4v2h-6v2h3v2h2v-2h1c1.103 0 2-.897 2-2v-2c0-1.102-.897-2-2-2h-4V6zm-6 14v2h2.586L23 25.586l-2.292-2.293a1 1 0 0 0-.706-.293H20a1 1 0 0 0-.706.293L14 28.586L15.414 30l4.587-4.586l2.292 2.293a1 1 0 0 0 1.414 0L28 23.414V26h2v-6zM4 30H2v-5c0-3.86 3.14-7 7-7h6c1.989 0 3.89.85 5.217 2.333l-1.49 1.334A5 5 0 0 0 15 20H9c-2.757 0-5 2.243-5 5zm8-14a7 7 0 1 0 0-14a7 7 0 0 0 0 14m0-12a5 5 0 1 1 0 10a5 5 0 0 1 0-10" />
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Salesman</label>
                                                                <div class="">
                                                                    <label id="txtSalesman" value="" class="form-control noborderbg" style=""></label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-flex" style="width: 25%;">
                                                            <div class=" me-2 mt-2 align-items-center ">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                                    <path fill="#a92828" d="M17 3h-3v2h3v16H7V5h3V3H7a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2m-5 4a2 2 0 0 1 2 2a2 2 0 0 1-2 2a2 2 0 0 1-2-2a2 2 0 0 1 2-2m4 8H8v-1c0-1.33 2.67-2 4-2s4 .67 4 2zm0 3H8v-1h8zm-4 2H8v-1h4zm1-15h-2V1h2z" />
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <label for="html5-number-input" class="  label-custom">Marketing</label>
                                                                <div class="">
                                                                    <label id="txtMarketing" value="" class="form-control noborderbg" style=""></label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row mt-3">
                                                        <div class="col-md-4 px-3">
                                                            <b>Stage :
                                                            </b>
                                                            <input type="radio" id="rdStgTender" name="Stage" value="TENDER" style="margin-left: 5%" disabled>TENDER 
                                                            <input type="radio" id="rdStgJOH" name="Stage" value="J.O.H" style="margin-left: 5%" disabled>JOH
                                                        </div>
                                                        <div class="col-md-4">
                                                            <b>Scope :
                                                            </b>
                                                            <input type="radio" id="rdSp" name="Supply" value="SUPPLY" style="margin-left: 5%" disabled>SUPPLY
                                                            <input type="radio" id="rdSpInstall" name="Supply" value="SUPPLY AND INSTALLATION" style="margin-left: 5%" disabled>SUPPLY & INSTALLATION
                                                        </div>
                                                        <div class="col-md-4">
                                                            <b>Quotation :
                                                            </b>
                                                            <input type="radio" id="rdQtSmart" name="Quotation" value="SMART QTNG" style="margin-left: 5%" disabled>SMART QTNG
                                                            <input type="radio" id="rdQtAndSp" name="Quotation" value="AS PER DRAWING AND SPECIFICATION" style="margin-left: 5%" disabled>AS PER DRAWING & SPECIFICATION
 
                                                            <%-- <a href="#" id="btnSubmitOptDet" class="btn btn-primary" style="float:right;">Submit</a>--%>
                                                        </div>
                                                    </div>

                                                    <%--<button type="button" class="btn btn-primary btnAddUpdateReq">Start</button>--%>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="nav-Structure" role="tabpanel" aria-labelledby="nav-Structure-tab">
                                                <div class="row mt-4 mb-4" style="">
                                                    <h5 class="fw-bold prpmdl-hed border-bottom" id="" style="">Structure</h5>
                                                </div>
                                                <div id="div-structure">
                                                    <div class="row">
                                                        <div class="col-12 mb-3">
                                                            <button type="button" class="btn btn-primary btnAddStructure float-right hide-control-bos" style="">Add New Structure</button>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="accordion" id="accordionStructure">
                                                                <%--          <div class="accordion-item">
                                                                    <h2 class="accordion-header" id="headingOne">
                                                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                                            Structure #1
                                                                            Description
                                                                            Total no. of Floors
                                                                        </button>
                                                                    </h2>
                                                                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionStructure">
                                                                        <div class="accordion-body">
                                                                            <div class="row">
                                                                                <div class="col-7 px-3 border-end">
                                                                                    <div class="table">
                                                                                        <table class="table table-Structure">
                                                                                            <thead class="">
                                                                                                <tr>
                                                                                                    <th>Floor Name</th>
                                                                                                    <th>Type</th>
                                                                                                    <th>Typical</th>
                                                                                                    <th>Typical Of</th>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody class="tbody-Structure">
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-5">
                                                                                    <div class="table">

                                                                                        <button type="button" class="btn btn-primary btnAddTypical float-right" style="">Add</button>

                                                                                        <table class="table">
                                                                                            <thead class="">
                                                                                                <tr>
                                                                                                    <th>Is Typical</th>
                                                                                                    <th>Master Floor</th>
                                                                                                    <th>Floor Name</th>
                                                                                                    <th>Floor Type</th>
                                                                                                    <th>Action</th>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody class="">
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="nav-TOC" role="tabpanel" aria-labelledby="nav-TOC-tab">
                                                <div class="row mt-4 mb-4" style="">
                                                    <h5 class="fw-bold prpmdl-hed border-bottom" id="" style="">TOC</h5>
                                                </div>
                                                <div class="">
                                                    <button type="button" class="btn btn-primary btn-req-complete-grid">
                                                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="1.5rem" height="1.5rem" viewBox="0 0 300 300">
                                                            <g fill="#f8f8f8" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal">
                                                                <g transform="scale(5.12,5.12)">
                                                                    <path d="M25,2c-12.683,0 -23,10.317 -23,23c0,12.683 10.317,23 23,23c12.683,0 23,-10.317 23,-23c0,-4.56 -1.33972,-8.81067 -3.63672,-12.38867l-1.36914,1.61719c1.895,3.154 3.00586,6.83148 3.00586,10.77148c0,11.579 -9.421,21 -21,21c-11.579,0 -21,-9.421 -21,-21c0,-11.579 9.421,-21 21,-21c5.443,0 10.39391,2.09977 14.12891,5.50977l1.30859,-1.54492c-4.085,-3.705 -9.5025,-5.96484 -15.4375,-5.96484zM43.23633,7.75391l-19.32227,22.80078l-8.13281,-7.58594l-1.36328,1.46289l9.66602,9.01563l20.67969,-24.40039z"></path>
                                                                </g>
                                                            </g>
                                                        </svg>
                                                        Complete Request</button>

                                                    <button type="button" class="btn btn-success btn-approve-req" onclick='ChangeRequestStatus("RELEASED")'>
                                                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="1.5rem" height="1.5rem" viewBox="0 0 300 300">
                                                            <g fill="#f8f8f8" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal">
                                                                <g transform="scale(5.12,5.12)">
                                                                    <path d="M25,2c-12.683,0 -23,10.317 -23,23c0,12.683 10.317,23 23,23c12.683,0 23,-10.317 23,-23c0,-4.56 -1.33972,-8.81067 -3.63672,-12.38867l-1.36914,1.61719c1.895,3.154 3.00586,6.83148 3.00586,10.77148c0,11.579 -9.421,21 -21,21c-11.579,0 -21,-9.421 -21,-21c0,-11.579 9.421,-21 21,-21c5.443,0 10.39391,2.09977 14.12891,5.50977l1.30859,-1.54492c-4.085,-3.705 -9.5025,-5.96484 -15.4375,-5.96484zM43.23633,7.75391l-19.32227,22.80078l-8.13281,-7.58594l-1.36328,1.46289l9.66602,9.01563l20.67969,-24.40039z"></path>
                                                                </g>
                                                            </g>
                                                        </svg>
                                                        Release</button>

                                                    <button type="button" class="btn btn-danger btn-rej-req" onclick='ChangeRequestStatus("REJECTED")'>
                                                       <i class='bx bx-x' style="font-size: 1.5rem;"></i>
                                                        Reject</button>
                                                    <span style="border: 1px solid #cbcbcb;margin-right: 7px;"></span>

                                                    <button type="button" class="btn btn-primary btn-generate-summary">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 24 24">
                                                            <path fill="#ffffff" d="M11.5 20h-6a1 1 0 0 1-1-1V5a1 1 0 0 1 1-1h5v3a3 3 0 0 0 3 3h3v5a1 1 0 0 0 2 0V8.94a1.3 1.3 0 0 0-.06-.27v-.09a1 1 0 0 0-.19-.28l-6-6a1 1 0 0 0-.28-.19a.3.3 0 0 0-.1 0a1.1 1.1 0 0 0-.31-.11H5.5a3 3 0 0 0-3 3v14a3 3 0 0 0 3 3h6a1 1 0 0 0 0-2m1-14.59L15.09 8H13.5a1 1 0 0 1-1-1ZM7.5 14h6a1 1 0 0 0 0-2h-6a1 1 0 0 0 0 2m4 2h-4a1 1 0 0 0 0 2h4a1 1 0 0 0 0-2m-4-6h1a1 1 0 0 0 0-2h-1a1 1 0 0 0 0 2m13.71 6.29a1 1 0 0 0-1.42 0l-3.29 3.3l-1.29-1.3a1 1 0 0 0-1.42 1.42l2 2a1 1 0 0 0 1.42 0l4-4a1 1 0 0 0 0-1.42" />
                                                        </svg>
                                                        Generate Summary</button>
                                                    <button type="button" class="btn btn-primary btn-add-item-toc-grid float-right hide-control-bos">
                                                        <svg class="me-3" xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 16 16">
                                                            <path fill="#fff" d="M11 11H9v1h2v2h1v-2h2v-1h-2V9h-1zM7.758 9a4.5 4.5 0 1 1-.502 4H6v-1h1.027a4.55 4.55 0 0 1 .23-2H6V9zM2 4V3h2v1zm4 0V3h8v1zm0 3V6h8v1zM2 7V6h2v1zm0 3V9h2v1zm0 3v-1h2v1z" />
                                                        </svg>
                                                        Add Item(s)</button>
                                                </div>

                                                <div class="row system-div-parent">
                                                    <%--  <div class="col-md-12 mt-3">
                                                        <div style="background: #fcfafa; text-align: center; border: 1px solid #b70000; color: black; border-radius: 20px 20px 3px 3px; font-weight: 600; padding: 15px 0px 15px 0px;">SPRINKLER SYSTEM</div>
                                                        <div class="category my-2" style="font-size: 12px"><b>1. SPRINKLER HEAD</b> </div>

                                                        <div class="table mt-2" style="overflow-y: auto; max-height: 800px;">
                                                            <table class="table project-table item-toc-table" style="width: 100%;">
                                                                <thead style="position: sticky; top: -3px;">
                                                                    <tr class="Head-tr">
                                                                        <th>Item Code</th>
                                                                        <th>Item Desc</th>
                                                                        <th>Quantity</th>
                                                                        <th>Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="tbody-items-toc1">
                                                                    <tr>
                                                                        <td><span class="badge badge-dark fs-6">10551022279                                                                            
                                                                            <svg class="" xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 24 24">
                                                                                <g fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5">
                                                                                    <path d="m17.524 17.524l-2.722 2.723a2.567 2.567 0 0 1-3.634 0L4.13 13.209A3.852 3.852 0 0 1 3 10.487V5.568A2.568 2.568 0 0 1 5.568 3h4.919c1.021 0 2 .407 2.722 1.13l7.038 7.038a2.567 2.567 0 0 1 0 3.634z" />
                                                                                    <path d="M9.126 11.694a2.568 2.568 0 1 0 0-5.137a2.568 2.568 0 0 0 0 5.137m3.326 4.392l3.634-3.634" />
                                                                                </g>
                                                                            </svg></span>
                                                                        </td>
                                                                        <td>Sprinkler Head 79 Deg. Upright, 1/2" NPT, Chrome Finish, Standard Response, UL/ULC/FM/Watermark Approved, Model: SD1015SR, Shield</td>
                                                                        <td>50</td>
                                                                        <td>
                                                                            <a class="ibtn-addfloor-into-items" data-estiid="1" data-itemcode="10551022279">
                                                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                                                    <path fill="#a92828" d="M12 9v2h2v2h-2v2h2v2h-2v2h4v-4h4V9zm6 4h-2v-2h2z" opacity="0.3" />
                                                                                    <path fill="#a92828" d="M12 7V3H2v18h14v-2h-4v-2h2v-2h-2v-2h2v-2h-2V9h8v6h2V7zM6 19H4v-2h2zm0-4H4v-2h2zm0-4H4V9h2zm0-4H4V5h2zm4 12H8v-2h2zm0-4H8v-2h2zm0-4H8V9h2zm0-4H8V5h2zm14 12v2h-2v2h-2v-2h-2v-2h2v-2h2v2zm-6-8h-2v2h2zm0 4h-2v2h2z" />
                                                                                </svg>
                                                                            </a>
                                                                        </td>

                                                                    </tr>

                                                                    <tr>
                                                                        <td>
                                                                            <span class="badge badge-dark fs-6">10551023358                                                                            
                                                                            <svg class="" xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 24 24">
                                                                                <g fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5">
                                                                                    <path d="m17.524 17.524l-2.722 2.723a2.567 2.567 0 0 1-3.634 0L4.13 13.209A3.852 3.852 0 0 1 3 10.487V5.568A2.568 2.568 0 0 1 5.568 3h4.919c1.021 0 2 .407 2.722 1.13l7.038 7.038a2.567 2.567 0 0 1 0 3.634z" />
                                                                                    <path d="M9.126 11.694a2.568 2.568 0 1 0 0-5.137a2.568 2.568 0 0 0 0 5.137m3.326 4.392l3.634-3.634" />
                                                                                </g>
                                                                            </svg></span>
                                                                        </td>
                                                                        <td>Sprinkler Head 79 Deg. Upright, 1/2" NPT, Chrome Finish, Standard Response, UL/ULC/FM/Watermark Approved, Model: SD1015SR, Shield</td>
                                                                        <td>50</td>
                                                                        <td><a class="ibtn-addfloor-into-items" data-estiid="2" data-itemcode="10551023358">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                                                <path fill="#a92828" d="M12 9v2h2v2h-2v2h2v2h-2v2h4v-4h4V9zm6 4h-2v-2h2z" opacity="0.3" />
                                                                                <path fill="#a92828" d="M12 7V3H2v18h14v-2h-4v-2h2v-2h-2v-2h2v-2h-2V9h8v6h2V7zM6 19H4v-2h2zm0-4H4v-2h2zm0-4H4V9h2zm0-4H4V5h2zm4 12H8v-2h2zm0-4H8v-2h2zm0-4H8V9h2zm0-4H8V5h2zm14 12v2h-2v2h-2v-2h-2v-2h2v-2h2v2zm-6-8h-2v2h2zm0 4h-2v2h2z" />
                                                                            </svg>

                                                                        </a></td>
                                                                    </tr>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>--%>
                                                </div>

                                            </div>

                                            <%--<div class="tab-pane fade" id="nav-Summary" role="tabpanel" aria-labelledby="nav-Summary-tab">
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button type="button" class="btn btn-primary btnAddUpdateReq" style="display: none">Create</button>

                    </div>
                </div>

                <div class="modal-footer">
                    <div class="row">
                    </div>

                    <%--  <div class="btn-container">
                        <a href="#" class="btn" id="Next">Next</a>
                        <a href="#" class="btn" id="Back">Back</a>
                        <a href="#" class="btn" id="Reset">Reset</a>
                    </div>--%>
                    <%--<button type="button" class="btn btn-primary btnSubmit hidden">Publish</button>--%>
                </div>
            </div>
        </div>
    </div>


    <%--MODAL Structure LIST--%>

    <div class="modal fade" id="ModalAddStructure" tabindex="-1" style="background: #a9a9a996;" aria-hidden="true">
        <div class="modal-dialog modal-md modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lblModalAddStructure">Structure Main Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="">
                    <div class="row">
                        <div class="col-6 mb-3">
                            <label>Structure Name</label>
                            <input class="form-control" type="text" id="stcName" placeholder="enter structure name...">
                        </div>
                        <div class="col-6">
                            <label>Total No. of Floors</label>
                            <input class="form-control" type="number" id="stcCount" placeholder="enter total floors...">
                        </div>
                        <div class="col-12 mb-3">
                            <label>Structure Description</label>
                            <textarea id="stcDesc" rows="3" class="form-control" style="overflow-y: scroll;" placeholder="enter structure description..."></textarea>

                        </div>
                        <div class="col-12">
                            <label>Type of Floors</label><br />
                            <span class="ms-3 me-5 fw-bold">Floor Type</span>
                            <span class="ms-5 me-5 fw-bold">Total Floors</span>
                            <span class="ms-2 fw-bold">Order No.</span>
                            <div class="row pt-2 mt-2 border-top" id="mainFloorTypes" style="max-height: 300px; overflow-y: auto;">


                                <%--<div class="mainFloorSub d-flex">
                                    <div class="form-check col-5 ps-5 ">
                                        <input class="form-check-input" name="cb-floors-type" type="checkbox" value="Base" id="flexCheckBasement">
                                        <label class="form-check-label" for="flexCheckBasement">
                                            Basement
                                        </label>
                                    </div>
                                    <div class="col-4 mb-2">
                                        <input class="form-control bsmntFloor" name="txtForFloorsTypes" type="number"  placeholder="enter floors..." disabled>
                                    </div>
                                    <div class="col-3 mb-2">
                                        <input class="form-control bsmntFloor" name="txtForFloorsTypes" type="number" placeholder="order #..." disabled>
                                    </div>
                                </div>

                                <div class="mainFloorSub d-flex">
                                    <div class="form-check col-5 ps-5">
                                        <input class="form-check-input" name="cb-floors-type" type="checkbox" value="Park" id="flexCheckParking">
                                        <label class="form-check-label" for="flexCheckParking">
                                            Parking
                                        </label>
                                    </div>
                                    <div class="col-4 mb-2">
                                        <input class="form-control parkFloor" name="txtForFloorsTypes" type="number" id="" placeholder="enter floors..." disabled>
                                    </div>
                                    <div class="col-3 mb-2">
                                        <input class="form-control parkFloor" name="txtForFloorsTypes" type="number" id="" placeholder="order #..." disabled>
                                    </div>
                                </div>


                                <div class="mainFloorSub d-flex">
                                    <div class="form-check col-5 ps-5">
                                        <input class="form-check-input" name="cb-floors-type" type="checkbox" value="FLR" id="flexCheckNormal">
                                        <label class="form-check-label" for="flexCheckNormal">
                                            Floor
                                        </label>
                                    </div>
                                    <div class="col-4 mb-2">
                                        <input class="form-control normalFloor" name="txtForFloorsTypes" type="number" id="" placeholder="enter floors..." disabled>
                                    </div>
                                    <div class="col-3 mb-2">
                                        <input class="form-control normalFloor" name="txtForFloorsTypes" type="number" id="" placeholder="order #..." disabled>
                                    </div>
                                </div>
                                <div class="mainFloorSub d-flex">
                                    <div class="form-check col-5 ps-5">
                                        <input class="form-check-input" name="cb-floors-type" type="checkbox" value="Roof" id="flexCheckTerrace">
                                        <label class="form-check-label" for="flexCheckTerrace">
                                            Roof
                                        </label>
                                    </div>
                                    <div class="col-4 mb-2">
                                        <input class="form-control terrFloor" name="txtForFloorsTypes" type="number" id="" placeholder="enter floors..." disabled>
                                    </div>
                                    <div class="col-3 mb-2">
                                        <input class="form-control terrFloor" name="txtForFloorsTypes" type="number" id="" placeholder="order #..." disabled>
                                    </div>
                                </div>--%>
                            </div>


                            <a href="#" class="addOther" onclick="OtherFloorType()">
                                <svg xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 24 24">
                                    <g fill="#a92828" fill-rule="evenodd" clip-rule="evenodd">
                                        <path d="M2 12C2 6.477 6.477 2 12 2s10 4.477 10 10s-4.477 10-10 10S2 17.523 2 12m10-8a8 8 0 1 0 0 16a8 8 0 0 0 0-16" />
                                        <path d="M13 7a1 1 0 1 0-2 0v4H7a1 1 0 1 0 0 2h4v4a1 1 0 1 0 2 0v-4h4a1 1 0 1 0 0-2h-4z" />
                                    </g>
                                </svg>
                            </a>

                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btnSaveItem">Add</button>
                    <%--<button type="button" class="btn btn-primary btnSubmit hidden">Publish</button>--%>
                </div>
            </div>
        </div>
    </div>


    <%--Tag/Update Floor as Typical--%>
    <div class="modal fade" id="tagFloorTypical" tabindex="-1" aria-hidden="true" style="background: #adacaca3;">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="tagFloorTypicalLabel">Typical Floor</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="zoom: 85%;">

                    <div class="row">
                        <div class="col-md-3">
                            <label>Floor Type</label>
                            <select id="ddlFloorType" class="form-select color-dropdown"></select>
                        </div>
                        <div class="col-md-2 adv-filter ">
                            <label>From</label>
                            <select id="ddlFloorFrom" class="form-select color-dropdown"></select>
                        </div>
                        <div class="col-md-2 adv-filter ">
                            <label>To</label>
                            <select id="ddlFloorTo" class="form-select color-dropdown"></select>
                        </div>
                        <%-- <div class="col-md-2 adv-filter ">
                            <label>Is Typical</label>
                            <div style="display: flex; justify-content: center;">
                                <input class="form-check-input" type="checkbox" value="Base" id="cbIsTypical">
                            </div>
                        </div>--%>
                        <div class="col-md-3 "></div>
                        <div class="col-md-2 adv-filter ">
                            <label>Master Floor</label>
                            <select id="ddlFloorMaster" class="form-select color-dropdown"></select>
                        </div>
                    </div>



                    <div class="table mt-5 temp-sel-typifloor-table-div" style="overflow-y: auto; max-height: 800px;">
                        <table class="table temp-sel-typifloor-table" style="width: 100%;">

                            <thead style="position: sticky; top: -3px;">
                                <tr class="Head-tr">
                                    <th style="width: 99px !important">
                                        <span>Select All</span>
                                        <div style="display: flex; justify-content: center;">
                                            <input class="form-check-input position-relative" type="checkbox" value="-1" id="cbTypicalALL" style="width: 25px; height: 23px;" />
                                        </div>
                                    </th>
                                    <th>Floor Name</th>
                                    <th>Floor Type</th>
                                    <th>Master Floor</th>
                                </tr>
                            </thead>

                            <tbody class="tbody-temp-sel-typifloor">
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btnUpdateTypicalFloors">Save </button>
                    <%--<button type="button" class="btn btn-primary btnSubmit hidden">Publish</button>--%>
                </div>
            </div>
        </div>
    </div>


    <%--ADD/UPDATE System & Items--%>
    <div class="modal fade" id="addUpdateSystemnItems" tabindex="-1" style="background: #a9a9a996;" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addUpdateSystemnItemsLabel">Add Item(s)</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="zoom: 85%;">

                    <div class="row mt-1">
                        <div class="col-md-3">
                            <label>System</label>
                            <select id="ddlSystem" class="form-select color-dropdown"></select>
                        </div>
                        <div class="col-md-3">
                            <label>Category</label>
                            <select id="ddlCategory" class="form-select color-dropdown"></select>
                        </div>
                        <div class="col-md-2">
                            <label>Item Code</label>
                            <input class="form-control" type="text" placeholder="Enter Item Code" style="background-color: white;" id="txtItemCode">
                        </div>
                        <div class="col-md-1">
                            <a href="#" class="btn" id="btnItemFilterTOC" style="margin-top: 30px;">Search</a>
                        </div>
                        <div class="col-md-3" style="display: flex; justify-content: flex-end">
                            <a href="#" class="btn btn-primary" id="btnAddItemFromOracle-grid" style="margin-top: 30px;"><i class="fa fa-plus" aria-hidden="true"></i>Add From Oracle</a>
                        </div>

                    </div>


                    <div class="table mt-2" style="overflow-y: auto; max-height: 800px;">
                        <table class="table item-toc-table" style="width: 100%;">

                            <thead style="position: sticky; top: -3px;">
                                <tr class="Head-tr">
                                    <th style="width: 52px !important">Select</th>
                                    <th style="width: 52px !important">Optional</th>
                                    <th>Item Code</th>
                                    <th>Item Desc</th>
                                    <th>System</th>
                                    <th>Category</th>
                                    <th class="col-for-pipe-category hidden">Pipe Unit Price</th>
                                    <th class="col-for-pipe-category hidden">Fittings %</th>
                                    <th class="col-for-pipe-category hidden">Installation Unit Price</th>
                                    <th class="col-for-all-category hidden">Installation Unit Price</th>
                                    <th>Spare QTY</th>
                                    <th>Alternate Item</th>
                                </tr>
                            </thead>

                            <tbody class="tbody-items-toc">
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btnAddItemsTOC">Select </button>
                    <%--<button type="button" class="btn btn-primary btnSubmit hidden">Publish</button>--%>
                </div>
            </div>
        </div>
    </div>



    <%--MODAL ITEMS LIST--%>

    <div class="modal fade" id="addItemsListModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addItemsListModalLabel">Add Request</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="zoom: 85%;">

                    <div class="table" style="overflow-y: auto; max-height: 800px;">
                        <table class="table item-table" style="width: 100%;">

                            <thead style="position: sticky; top: -3px;">
                                <tr class="Head-tr">
                                    <th style="width: 52px !important">Select</th>
                                    <th>Item Code</th>
                                    <th>Item Desc</th>
                                </tr>
                            </thead>

                            <tbody class="tbody-items-list">
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btnSaveItem">Select </button>
                    <%--<button type="button" class="btn btn-primary btnSubmit hidden">Publish</button>--%>
                </div>
            </div>
        </div>
    </div>


    <!-- Add More Floor Types in Structure -->

    <div class="modal fade" id="AddFloorTypeModal" tabindex="-1" style="background: #a9a9a996;" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addFloorTypeLabel">Add Floor Type</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="zoom: 85%;">

                    <div class="row">
                        <div class="col mb-6">
                            <label for="nameBackdrop" class="form-label">Floor Type Name</label>
                            <input type="text" id="txtFlrTypeName" class="form-control" placeholder="eg: Floor">
                        </div>
                        <div class="col mb-6">
                            <label for="nameBackdrop" class="form-label">Floor Type Alias</label>
                            <input type="text" id="txtFlrTypeAlias" class="form-control" placeholder="eg: FLR">
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btnAddMoreFlrType" onclick="AddMoreFloorType()">Add </button>
                </div>
            </div>
        </div>
    </div>



    <%--TOC WORK--%>
    <%--Tag Floor With The Items in TOC--%>
    <div class="modal fade" id="tagFloorIntoItems" tabindex="-1" aria-hidden="true" style="background: #adacaca3;">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="tagFloorIntoItemsLabel">Floor</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="zoom: 85%;">
                    <div class="row">
                        <div class="col-md-3">
                            <label>Structure Name</label>
                            <select id="ddlStructNameTOC" class="form-select color-dropdown"></select>
                        </div>
                        <div class="col-md-2">
                            <label>Floor Type</label>
                            <select id="ddlFloorTypeTOC" class="form-select color-dropdown"></select>
                        </div>
                        <div class="col-md-2 adv-filter ">
                            <label>Floor No.</label>
                            <select id="ddlFloorFromTOC" class="form-select color-dropdown"></select>
                        </div>
                        <div class="col-md-2">
                            <%--<a href="#" class="btn" id="btnFloorFilterTOC" style="margin-top: 30px;">Search</a>--%>
                        </div>

                        <div class="col-md-1"></div>

                        <div class="col-md-2">
                            <label>Quantity</label>
                            <input class="form-control" type="number" id="txtQuantityTOC" placeholder="enter quantity">
                        </div>
                        <%--  <div class="col-md-2 adv-filter ">
                            <label>Is Typical</label>
                            <div style="display: flex; justify-content: center;">
                                <input class="form-check-input" type="checkbox" value="Base" id="cbIsTypical"></div>
                        </div>--%>
                        <%--    <div class="col-md-3 adv-filter ">
                            <label>Master Floor</label>
                            <select id="ddlFloorMaster" class="form-select color-dropdown"></select>
                        </div>--%>
                    </div>
                    <div class="table mt-5" style="overflow-y: auto; max-height: 800px;">
                        <table class="table floor-into-item-table" style="width: 100%;">
                            <thead style="position: sticky; top: -3px;">
                                <tr class="Head-tr">
                                    <th>Item Code</th>
                                    <th>Floor Name</th>
                                    <th>Quantity</th>

                                </tr>
                            </thead>
                            <tbody class="tbody-floor-into-item">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btnAddFloorsIntoItem">Save </button>
                    <%--<button type="button" class="btn btn-primary btnSubmit hidden">Publish</button>--%>
                </div>
            </div>
        </div>
    </div>


    <%--Tag Floor With The Items in TOC--%>
    <div class="modal fade" id="ReqTechRemarksModal" tabindex="-1" aria-hidden="true" style="background: #adacaca3;">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ReqTechRemarksModalLabel">Technical Remarks</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="zoom: 85%; min-height: 670px;">
                    <div class="row">
                        <label for="html5-number-input" class="col-form-label label-custom">Technical Remarks Description <span style="color: red;">*</span></label>
                        <div class="ritext-tech-remarks-div" style="min-height: 670px;">
                            <%--<input class="form-control " type="text" placeholder="" value="" id="taTechRemarks">--%>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btnAddTechRemarks">Save & Complete </button>
                </div>
            </div>
        </div>
    </div>



    <%--ADD/UPDATE Items from Oracle--%>
    <div class="modal fade" id="addUpdateItemsOracle" tabindex="-1" style="background: #a9a9a996;" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lbladdUpdateItemsOracle">Add Item(s) from Oracle</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="zoom: 85%;">

                    <div class="row mt-1">
                        <div class="col-md-9">
                            <label>Search with <b>Item Code</b> or <b>Item Description</b> </label>
                            <input class="form-control" type="text" placeholder="Enter Item Code" style="background-color: white;" id="txtItemCodeForOracle">
                        </div>
                        <div class="col-md-3">
                            <a href="#" class="btn" id="btnOracleItemFilterTOC" style="margin-top: 30px;">Search</a>
                        </div>
                    </div>

                    <div class="mt-3 row">
                        <div>
                            <label>Select System & Category</label>
                            <span style="color: #d54832">*</span>
                        </div>
                        <div class="col-md-3">
                            <label>System</label>
                            <select id="ddlSystemForOracle" class="form-select color-dropdown"></select>
                        </div>
                        <div class="col-md-3">
                            <label>Category</label>
                            <select id="ddlCategoryForOracle" class="form-select color-dropdown"></select>
                        </div>
                    </div>


                    <div class="table mt-2" style="overflow-y: auto; max-height: 800px;">
                        <table class="table item-toc-table-fromoracle" style="width: 100%;">

                            <thead style="position: sticky; top: -3px;">
                                <tr class="Head-tr">
                                    <th style="width: 52px !important">Select</th>
                                    <th>Item Code</th>
                                    <th>Item Desc</th>
                                    <%--<th>System</th>
                                    <th>Category</th>
                                    <th class="col-for-pipe-category hidden">Pipe Unit Price</th>
                                    <th class="col-for-pipe-category hidden">Fittings %</th>
                                    <th class="col-for-pipe-category hidden">Installation Unit Price</th>
                                    <th>Spare QTY</th>--%>
                                </tr>
                            </thead>

                            <tbody class="tbody-items-toc-fromoracle">
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btnAddItemsFromOracleTOC">Select </button>
                    <%--<button type="button" class="btn btn-primary btnSubmit hidden">Publish</button>--%>
                </div>
            </div>
        </div>
    </div>


    <%-- Adding Engineering and TEstCommisioning in TOC --%>
    <div class="modal fade" id="engrNTestCommisoinModal" tabindex="-1" aria-hidden="true" style="background: #adacaca3;">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="engrNTestCommisoinlabel">Update Engineering and Test Commisioning</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="zoom: 90%;">
                    <div class="row">
                        <div class="col-md-4">
                            <label>Engineering</label>
                            <input class="form-control" type="number" id="txtEngineering">
                        </div>
                        <div class="col-md-4">
                            <label>Test and Commsioning</label>
                            <input class="form-control" type="number" id="txtTestnCommision">
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btnAddEngrTestnCommision">Save </button>
                    <%--<button type="button" class="btn btn-primary btnSubmit hidden">Publish</button>--%>
                </div>
            </div>
        </div>
    </div>


    <%--TOC End--%>

    <%--Generate Summary--%>
    <div class="modal fade" id="modalSummary" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true" style="background: #adacaca3; overflow: scroll !important;">
    <div class="modal-dialog modal-lg" role="document" style="min-width: 85%; height: 90%;">
        <div class="modal-content" style="zoom: 110%;">
            <div class="modal-header">
                <h5 class="modal-title" id="">Summary Reports</h5>
                <button type="button" class="btn-close _goBack" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div id="Estimation-details-rectangle-div" style="">
                    
                    <div class="row border">
                        <div class="py-1 border-bottom border-right" style="width: 10%;">
                            <label for="html5-number-input" class="  label-custom">Request ID:</label>
                            <label id="SummarytxtEstRef" value="" class="noborderbg">EMS.0004</label>
                        </div>

                        <div class="py-1 border-bottom border-right" style="width: 27%;">
                            <span for="html5-number-input" class="  label-custom">Project Name: </span>
                            <span id="SummarytxtPrjName" value="" class="noborderbg" style="">Prop Commercial/ Residential Building G+7+R at Warsan Fourth 624 on Plot # IC3-58-03, Dubai</span>
                        </div>

                        <div class="py-1 border-bottom border-right" style="width: 12%;">
                            <label for="html5-number-input" class="  label-custom">Project Ref#:</label>
                            <label id="SummarytxtProjRef" value="" class="noborderbg">1006240212</label>
                        </div>

                        <div class="py-1 border-bottom border-right" style="width: 13%;">
                            <label for="html5-number-input" class="  label-custom">Opportunity Ref#:</label>
                            <label id="SummarytxtOppRef" value="" class="noborderbg">1024060210</label>
                        </div>


                        <div class="py-1 border-bottom border-right" style="width: 6%;">
                            <label for="html5-number-input" class="  label-custom">Revision: </label>
                            <label id="SummarytxtRevision" value="" class="noborderbg">1</label>
                        </div>

                        <div class="py-1 border-bottom border-right" style="width: 6%;">
                            <label for="html5-number-input" class="  label-custom">Year:</label>
                            <label id="SummarytxtEstYear" value="" class="noborderbg">2024</label>
                        </div>
                        <div class="py-1 border-bottom border-right" style="width: 13%;">
                            <label for="html5-number-input" class="  label-custom">MEP Contractor: </label>
                            <label id="SummarytxtPrjMEPContr" value="" class="noborderbg" style="">Grans Contlc</label>
                        </div><div class="py-1 border-bottom" style="width: 13%;">
                            <label for="html5-number-input" class="  label-custom">Consultant:</label>
                            <label id="SummarytxtPrjConsultant" value="" class="noborderbg" style="">Adnan Saffarini</label>
                        </div><div class="py-1 border-bottom border-right" style="width: 14%;">
                            <label for="html5-number-input" class="  label-custom">Contr ABBR: </label>
                            <label id="SummarytxtContrAbbr" value="" class="noborderbg" style=""></label>
                        </div>

                        <div class="py-1 border-bottom border-right" style="width: 15%;">
                            <label for="html5-number-input" class="  label-custom">Main Contractor: </label>
                            <label id="SummarytxtPrjMainContr" value="" class="noborderbg" style=""></label>
                        </div>

                        

                        
                        <div class="py-1 border-bottom border-right" style="width: 20%;">
                            <label for="html5-number-input" class="  label-custom">Client: </label>
                            <label id="SummarytxtPrjClient" value="" class="noborderbg" style=""></label>
                        </div>

                        <div class="py-1 border-bottom border-right" style="width: 12%;">
                            <label for="html5-number-input" class="  label-custom">Location: </label>
                            <label id="SummarytxtPrjLocation" value="" class="noborderbg" style=""></label>
                        </div>

                        <div class="py-1 border-bottom border-right" style="width: 13%;">
                            <label for="html5-number-input" class="  label-custom">Contact Person: </label>
                            <label id="SummarytxtPrjContactPerson" value="" class="noborderbg" style="" placeholder="-----Click to select Customer-----">19048</label>
                        </div>

                        <div class="py-1 border-bottom border-right div-win" style="width: 7%;">
                            <label for="html5-number-input" class="  label-custom">Winning %: </label>
                            <label id="SummarytxtPrjWinningPerc" value="" class="noborderbg" style="">0</label>
                        </div>

                        <div class="py-1 border-bottom  border-right div-budge" style="width: 7%;">
                            <label for="html5-number-input" class="  label-custom">Budget: </label>
                            <label id="SummarytxtPrjBudget" value="" class="noborderbg" style="">0</label>
                        </div>
                        <div class="py-1 border-bottom" style="width: 12%;">
                            <label for="html5-number-input" class="  label-custom">URL: </label>
                            <label id="SummarytxtPrjURL" value="" class="noborderbg" style=""></label>
                        </div>

                        <div class="py-1 border-right " style="width: 20%;">
                            <label for="html5-number-input" class="  label-custom">Estimation Team Org: </label>
                            <label id="SummaryddlEstimationTeamOrg" class="noborderbg">Local Sales</label>
                        </div>

                        <div class="py-1 border-right" style="width: 21%;">
                            <label for="html5-number-input" class="  label-custom">Salesman:</label>
                            <label id="SummarytxtSalesman" value="" class="noborderbg" style="">Altaf M A Mannan Ahmed</label>
                        </div>

                        <div class="py-1 border-right" style="width: 20%;">
                            <label for="html5-number-input" class="  label-custom">Marketing:</label>
                            <label id="SummarytxtMarketing" value="" class="noborderbg" style="">Mohammad Attaya</label>
                        </div>
                    </div>

                    <div class="row m1-2 fs-6 mb-4 border" style="">
                        <div class="col-md-3 px-3 pb-2 border-right">
                            <b>Stage :
                            </b>
                            <input type="radio" id="" name="SummaryStage" value="TENDER" style="margin-left: 5%" disabled="" class="fs-6" checked="Checked">TENDER 
                            <input type="radio" id="" name="SummaryStage" value="J.O.H" style="margin-left: 5%" disabled="">JOH
                        </div>
                        <div class="col-md-4 border-right">
                            <b>Scope :
                            </b>
                            <input type="radio" id="" name="SummarySupply" value="SUPPLY" style="margin-left: 5%" disabled="">SUPPLY
                            <input type="radio" id="" name="SummarySupply" value="SUPPLY AND INSTALLATION" style="margin-left: 5%" disabled="" checked="Checked">SUPPLY &amp; INSTALLATION
                        </div>
                        <div class="col-md-5">
                            <b>Quotation :
                            </b>
                            <input type="radio" id="" name="SummaryQuotation" value="SMART QTNG" style="margin-left: 5%" disabled="">SMART QTNG
                            <input type="radio" id="" name="SummaryQuotation" value="AS PER DRAWING AND SPECIFICATION" style="margin-left: 5%" disabled="" checked="Checked">AS PER DRAWING &amp; SPECIFICATION
 
        
                        </div>
                    </div>
                </div>

                <nav class="nav-tab border-bottom">
                    <ul class="nav nav-pills" id="pills-tab-repots" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active show" id="pill-summary-report-tab" data-bs-toggle="pill" data-bs-target="#summary-report-tab" type="button" role="tab" aria-controls="summary-report-tab" aria-selected="true">System Summary</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pill-sprinkler-tab" data-bs-toggle="pill" data-bs-target="#sprinkler-tab" type="button" role="tab" aria-controls="sprinkler-tab" aria-selected="false">Product Summary</button>
                        </li>

                    </ul>
                </nav>
                <div class="tab-content" id="pills-repocontent">
                    <div class="tab-pane fade show active" id="summary-report-tab" role="tabpanel" aria-labelledby="pill-summary-report-tab">

                        <div class="table">
                            <table class="table project-table summary-table">
                                <thead style="position: sticky; top: 0;">
                                    <tr>
                                        <th>System</th>
                                        <th>Equipments</th>
                                        <th>Consumables Pipes & Fittings</th>
                                        <th>Installation Labor Charge</th>
                                        <th>Engineering</th>
                                        <th>Testing & Commssioning</th>
                                        <th>Over Head 15%</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody class="summary-tbody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="sprinkler-tab" role="tabpanel" aria-labelledby="pill-sprinkler-tab">

                        <div class=" table">
                            <table class="table project-table">
                                <thead style="position: sticky; top: 0;">
                                    <tr>
                                        <th style="width: 200px !important;" class="align-middle">Category</th>
                                        <th class="align-middle">Item Code</th>
                                        <th class="align-middle">Description</th>
                                        <th class="align-middle">Qty</th>
                                        <th class="text-center">Pipes & Fittings Unit Price</th>
                                        <th class="text-center">Total Pipes & Fittings</th>
                                        <th class="text-center">Installation Unit Price</th>
                                        <th class="text-center">Total Installation</th>
                                        <th class="align-middle text-center">Total</th>
                                    </tr>
                                </thead>
                                <tbody class="itemsummary-tbody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            
        </div>
    </div>
</div>


    <%--DELETE CONFIMATION MODAL FOR ITEM in TOC --%>
    <div class="modal fade" id="delItemTOCModal" style="background-color: #00000070;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;"></i></div>
                    <div>
                        <h3>Are you sure?</h3>
                    </div>
                    <span class="cItemTOC">Do you want to delete the Item?</span>
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btn-del-itemtoc-yes" data-bs-dismiss="modal">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>




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

    <!-- Page JS/CSS file -->
    <script src="Scripts/common.js?v=4.4"></script>
    <script src="Scripts/ems-item-list.js?v=4.4"></script>
    <script src="Scripts/Structure.js?v=4.4"></script>
    <script src="Scripts/TOC.js?v=4.4"></script>
    <script src="Scripts/SummaryReports.js?v=4.4"></script>

    <link href="css/RecruitmentCss.css?v=4.4" rel="stylesheet" />

    <!-- Bootstrap JS/CSS file-->
    <link href="bootstrap-5.2.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>

    <!-- Toaster JS/CSS file-->
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

    <!-- Flatpicker Datepicker JS/CSS file-->
    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

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

    <!-- Select/Multiselect Dropdown JS/CSS file -->
    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>
    <%--<script src="script/multiple-select.js"></script>
        <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />--%>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

    <script src="../Template/assets/vendor/libs/richtexteditor/jquery.richtext.js"></script>
    <script src="../Dashboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <script src="../Template/assets/vendor/libs/richtexteditor/jquery.richtext.js"></script>

</asp:Content>


