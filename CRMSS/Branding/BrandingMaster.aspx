<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="BrandingMaster.aspx.cs" Inherits="Branding_BrandingMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />



    <style type="text/css">
        /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
        .kpi-user-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .overClass {
            overflow-y: auto;
            height: 54%;
        }


        ::-webkit-scrollbar {
            width: 4px;
        }

        /* Track */
        /* Track */
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #888;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #555;
            }

        .overFlowNavKpi {
            overflow-y: auto;
            height: 565px;
        }

        .accordion li {
            font-size: small;
        }

        .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
            background-color: #e14b4b;
            border-color: #e14b4b;
            box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%);
        }
        /*Custom Menu Anwar*/
        .container {
            border-radius: 3px;
            padding: 5px;
            width: 60%;
            margin: 0 auto;
        }

        h2 {
            font-weight: normal;
            font-size: 25px;
        }

            h2:hover {
                cursor: pointer;
            }

        .modal-dialog-centered {
            min-height: calc(100% - 22.5rem);
        }

        .modal-header {
            /*display: -webkit-box;
    display: -ms-flexbox;*/
            display: flex;
            -webkit-box-align: start;
            -ms-flex-align: start;
            /*align-items: flex-start;*/
            -webkit-box-pack: justify;
            /*-ms-flex-pack: justify;*/
            justify-content: space-between;
            padding: 1rem;
            border-bottom: 1px solid #98a2af !important;
            border-top-left-radius: 0.3rem;
            border-top-right-radius: 0.3rem;
        }

        .btn-primary:hover {
            color: #ffffff;
            background-color: #ed974e !important;
            border-color: #ed974e !important;
            transform: translateY(-1px);
        }
        /*#DataTables_Table_0_paginate a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}*/

        #DataTables_Table_0_paginate .current {
            color: white !important;
            background: #a92828 !important;
        }

        .table td {
            color: #333333 !important;
        }

        .custom-loader {
            text-align: center;
            top: 40%;
            left: 44%;
            position: fixed;
            z-index: 99999999;
            box-shadow: 2px 2px 17px #e14b4b;
            border-radius: 20px;
            background: white;
            width: 10%;
            padding: 10px;
        }

        .loader-bg-blur {
            height: 100%;
            z-index: 9999999;
            position: fixed;
            background: #c3d3ce6b;
            width: 100%;
        }

        .hidden {
            display: none !important;
        }

        .iconClassExcel {
            margin-left: 8px;
            background: #933737;
        }

        .iconClassPdf {
            background: #933737;
        }

        .iconClassExcel:hover {
            background: #a54141;
        }

        .iconClassPdf:hover {
            background: #a54141;
        }

        .tablepopup th {
            background-color: #a92828;
            color: white !important;
            text-align: center;
        }

        .tablepopup td {
            text-align: center;
        }

        .tablepopup {
            width: 100%;
        }

        .modal-xl {
            max-width: 1400px !important;
        }

        .btn-primary {
            color: #fff;
            background-color: #a62b2b;
            border-color: #a62b2b;
        }

            .btn-primary:hover {
                color: #ffffff;
                background-color: #76dd4b !important;
                border-color: #7bdd59 !important;
                transform: translateY(-1px) !important;
            }

            .btn-check:focus + .btn-primary, .btn-primary:focus {
                color: #ffffff;
                background-color: #76dd4b;
                border-color: #7bdd59;
                transform: translateY(-1px);
            }

        .label-custom {
            color: #d4432c !important;
            font-weight: 500 !important;
            text-transform: capitalize;
            /*padding-top: 3px;*/
        }
        /*.tab-content
        {
            background: #d7d6d6 !important;
        }*/
        hr {
            margin: 1rem 0;
            color: #565656;
            background-color: currentColor;
            border: 0;
            opacity: 1;
        }

        .Survey-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Survey-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .Question-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Question-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .question-master-list-table th {
            /*text-align: center;*/
            color: white !important;
            background-color: #d54832;
        }

        .Template-table-details .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .Template-table-details th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .Template-table-details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .Item-table-details th {
            text-align: center;
            color: white !important;
            background-color: #af1a1a;
            vertical-align: middle;
        }

        .Item-table-details td {
            border-bottom: 1px solid #96a2ab45 !important;
            font-size: 16px !important;
            background-color: white !important;
        }

        .stage-Details-table th {
            text-align: center;
            color: white !important;
            background-color: #a16363;
        }

        .stage-Details-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }


        .Authority-Details-table th {
            text-align: center;
            color: white !important;
            background-color: #a16363;
        }

        .Authority-Details-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .employee-Details-table th {
            text-align: center;
            color: white !important;
            background-color: #a16363;
        }

        .employee-Details-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .Answer-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Answer-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        table.dataTable.no-footer {
            border-bottom: 1px solid #aeddff73 !important;
        }

        .table-Costomer-Details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Event-det-drilldown {
            font-weight: 800;
            color: #ffffff;
            border: 1px solid #b8adad;
            width: 3%;
            cursor: pointer;
            margin-top: 6px;
            position: inherit;
            background: #d54832e8;
            border-radius: 13px;
            text-align: center;
        }

        .Head-det-drilldown {
            font-weight: 800;
            color: #ffffff;
            /* border: 1px solid #b8adad;*/
            width: 3%;
            cursor: pointer;
            margin-top: 6px;
            position: inherit;
            /* background: #d54832e8;*/
            /* border-radius: 13px;*/
            text-align: center;
        }

        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link.active {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link:hover {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        /*.nav-tabs .nav-item .nav-link:not(.active) {
            color: black;
            background-color: #b4b9bf;
        }*/
        .nav-tabs .nav-item .nav-link:not(.active) {
            color: #a92828;
            background-color: #e5bbbb;
        }

        table.dataTable tbody tr:hover {
            background-color: #ff6f591a !important;
            border-right: 5px solid #db7e2f !important;
        }

        .Survey-status-Draft {
            background-color: #fff2d6 !important;
            color: #ffab00 !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #ffab00;
        }

        .Survey-status-completed {
            /*background-color: #e8fadf !important;
    color: #48a516 !important;
    letter-spacing: 0.5px;
    box-shadow: 0px 0px 3px 0px #48a516;
    min-width: 52%;
    text-align: center;*/
            background-color: #d7f5fc !important;
            color: #03c3ec !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #03c3ec;
        }

        .Survey-status-NotActive {
            background-color: #ffe0db !important;
            color: #ff3e1d !important;
            letter-spacing: 0.5px;
            box-shadow: 0px 0px 3px 0px #ff3e1d;
            min-width: 52%;
            text-align: center;
        }


        .Survey-det-drilldown {
            font-weight: 800;
            color: #ffffff;
            border: 1px solid #b8adad;
            width: 3%;
            cursor: pointer;
            margin-top: 6px;
            position: inherit;
            background: #d54832e8;
            border-radius: 13px;
            text-align: center;
        }

        .active-tr {
            border-left: 7px solid #db7e2f !important;
        }

        .form-control:focus, .form-select:focus {
            border-color: #ff9869 !important;
        }

        .select2-container--default .select2-selection--multiple .select2-selection__choice__display {
            cursor: default;
            padding-left: 12px !important;
            padding-right: 5px;
            color: #e02d0a;
        }

        .emps-list-table th {
            background: #ffe7e0;
            position: sticky;
            top: -10px;
            border-bottom: 1px solid #fff !important;
        }

        .select2-results__options li strong {
            color: rgb(242 71 71);
        }

        .LM-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        table tbody tr:hover {
            background-color: #ff6f591a !important;
            border-right: 5px solid #db7e2f !important;
        }

        .badge {
            text-transform: uppercase;
            line-height: 0.75;
        }

        .taDiv:focus {
            outline: none;
        }

        .modal-xxl {
            max-width: 1854px !important;
        }

        ::-webkit-scrollbar {
            height: 8px; /* height of horizontal scrollbar ← You're missing this */
            width: 4px; /* width of vertical scrollbar */
            border: 1px solid #d5d5d5;
        }

        .active-ass {
            /*background-color:#e6eeff !important;*/
            background-color: #ffede6 !important;
        }

        .tbody-quesopt-list tr:hover {
            cursor: pointer;
        }

        #lblEmpName, #lblDesignation, #lblDepart, #lblLeaveReqFileName:focus {
            outline: none;
        }

        .proj-det-drilldown {
            font-weight: 800;
            color: #ffffff;
            border: 1px solid #b8adad;
            width: 1.5%;
            cursor: pointer;
            margin-top: 6px;
            position: inherit;
            background: #d54832e8;
            /*border-radius: 13px;*/
            text-align: center;
        }

        .proj-det-drillup {
            font-weight: 800;
            color: #ffffff;
            border: 1px solid #b8adad;
            width: 1.5%;
            cursor: pointer;
            margin-top: 6px;
            position: inherit;
            background: #d54832e8;
            /*border-radius: 13px;*/
            text-align: center;
        }

        .proj-det-drillup, .proj-det-drilldown:hover {
            background-color: #c52a11;
        }

        .textbox-border-color {
            border-bottom: 4px solid #fc71224a;
        }

        #proj-details-rectangle-div {
            padding: 17px;
            background: #e8b79c3b;
            border-radius: 12px;
            border: 4px solid #f9bfa86b;
            box-shadow: 0px 0px 13px -7px #d84d1a;
        }

        .tbody-Temblate .ibtn-Request-Details:hover {
            content: url("Images/Edit-Gif.gif");
        }
        /*        .WFAdd
        {
       background: repeating-linear-gradient(45deg, #652525, #d54832 100px) !important;
       }

        .WFAdd:hover
        {
      color: ghostwhite !important;
    background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px);
    background: linear-gradient(-30deg, #4f8539 50%, #4a6a15 50%);
       }

        .Popup-Add
        {
            background: repeating-linear-gradient(45deg, #692020, #a16363 100px) !important;
        }

        .Popup-Add:hover
        {
           color: ghostwhite !important;
    background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px);
    background: linear-gradient(-30deg, #4f8539 50%, #4a6a15 50%);
        }*/


        .active-tr {
            border-left: 7px solid #db7e2f !important;
        }


        .animated-button1:hover {
            color: ghostwhite !important;
            background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px);
        }

        .animated-button4:hover {
            color: ghostwhite !important;
            background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px);
        }

        .submit-req {
            background: linear-gradient(40deg, #855b5b, #e70000 100px) !important;
        }

        .animated-button2:hover {
            color: ghostwhite !important;
            background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px);
        }

        .submit-req:hover {
            color: ghostwhite !important;
            background: repeating-linear-gradient(45deg, #4a6a15, #4f8539 100px) !important;
        }

        .accordion,
        .sub-accordion {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .accordion__item {
            background: rgb(117 75 51 / 9%);
            border-radius: 20px;
            margin-bottom: 5px;
            /*padding: 17px;*/
            /* border-radius: 12px;*/
            border: 1px solid rgb(0 0 0 / 17%);
            box-shadow: rgb(117 75 51 / 9%)
        }
        /* 
*	Стили для заголовка меню 
*/

        .navigation {
            font-weight: 300;
            font-size: 0.9375rem;
            max-width: 460px;
            min-width: 216px;
            margin: 0 auto;
            color: #696666;
        }

        .accordion__item:nth-child(odd) > :first-child:not(.accordion__link_active) {
            color: #ffffff;
            background: #696666;
        }

        .accordion__link {
            font-weight: 500;
            font-size: 1rem;
            position: relative;
            color: #696666;
            text-decoration: none;
            border-radius: 20px;
            display: block;
            padding: 12px 50px 12px 20px;
        }

            .accordion__link:not(.accordion__link_active):after {
                position: absolute;
                content: "";
                border-top: 12px #ff8663 solid;
                border-left: 7px solid transparent;
                border-right: 7px solid transparent;
                right: 22px;
                top: 50%;
                transform: translatey(-6px);
            }

            .accordion__link:not(.accordion__link_active):hover {
                opacity: .8;
                color: #fff;
                background: #B8B8B8;
            }

                .accordion__link:not(.accordion__link_active):hover:after {
                    border-top: 12px #ffffff solid;
                }
        /* 
*	Стили для подменю 
*/
        .sub-accordion {
            padding: 5px 20px;
            display: none;
            height: 0;
            overflow: hidden;
        }

        .sub-accordion__item {
            padding: 5px 0;
        }
        /* 
*	Стили для октивного подменю 
*/
        .accordion__link_active {
            color: #ffffff;
            /*background-color: #914040e0;   */
            background: repeating-linear-gradient(180deg, #5a3b3bf2, #e5a4a4e0 100px);
        }

            .accordion__link_active:after {
                position: absolute;
                content: "";
                border-bottom: 12px #fff solid;
                border-left: 7px solid transparent;
                border-right: 7px solid transparent;
                right: 22px;
                top: 50%;
                transform: translatey(-6px);
            }

            .accordion__link_active + ul {
                display: block;
                height: 100%;
            }

        a:not([href]) {
            text-decoration: none;
            color: white;
        }

            a:not([href]):hover {
                color: #c1bcbc;
                text-decoration: none;
            }

        .header-Bg-Active {
            /* background-color: #8d0000f2;*/
            border-radius: 20px;
            position: relative;
            background: repeating-linear-gradient(182deg, #e97878e3, #a31700b5 100px);
        }

        .header-Bg-NotActive {
            background-color: #696666;
            border-radius: 20px;
            position: relative;
        }

 .flatpickr-calendar{
            zoom:85%;
        }

        .Submit-AllDet:hover {
            content: url("Images/gif-Submit.gif");
        }

        .fa-icon-hover:hover {
            transform: scale(1.1) !important;
        }

        .bg-primary {
            background-color: #fff2d6 !important;
            color: #ffab00 !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #ffab00;
        }

        .bg-Approve {
            background-color: #c9f9cf !important;
            color: #02e128 !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #03d91d;
        }

        .bg-success {
            background-color: #d7f5fc !important;
            color: #03c3ec !important;
            letter-spacing: 1px;
            box-shadow: 0px 0px 3px 0px #03c3ec;
        }

        .add-new-icon:hover {
            content: url("Images/gif-AddNew.gif")
        }

        .flatpickr-input .active  {
            top: 212.746px !important;
            left: auto !important;
            right: 193.8714px !important;
        }

        input[type="radio"] {
	appearance: none;
	-webkit-appearance: none;
	width: 20px;
	height: 20px;
	border: 1px solid #ff8318;
	border-radius: 50%;
	margin-right: 10px;
	background-color: transparent;
	position: relative;
	top: 6px;
}

      input[type="radio"]:checked::before {
	content: "";
	display: block;
	width: 12px;
	height: 12px;
	background-color: #ca8489;
	border-radius: 50%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	animation: appear 0.8s;
}

      .attendees-table th {
            text-align: center;
            color: white !important;
            background-color: #af1a1a;
            vertical-align: middle;
        }

        .attendees-table td {
            border-bottom: 1px solid #96a2ab45 !important;
            font-size: 16px !important;
            background-color: white !important;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

   <%-- <div class="ajax-loader loader-bg-blur">
        <div class="custom-loader ">
            <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
            <h4>Loading Data...</h4>
        </div>
    </div>--%>


    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div style="padding-left: 2%; padding-top: 1%;">
            <h5 style="color: #a92828; margin-top: 13px">EXHIBITION / EVENT</h5>
        </div>

        <div class="card-body" style="margin-top: -1%; zoom: 90%;">
            <div style="padding-bottom: 2%;">
                <a href="#" id="btnAddNewImage" class="animated-button1" style="float: right; font-size: smaller;"><%--<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;--%><span></span><span></span><span></span><span></span><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add New</a>
            </div>

            <%--SSHR Work--%>

            <div class="" style="margin-top: 1%;">

                <table class="table Template-table-details" style="width: 100%;">

                    <thead>
                        <tr class="Head-tr">
                            <th style="display: none;">Id</th>
                            <th>Description</th>
                            <th>File Name</th>
                            <th>Status</th>
                            <th>Action</th>
                           
                    </thead>
                    <tbody class="tbody-Temblate">
                    </tbody>
                </table>
            </div>



        </div>
        <%--card-body end--%>
    </div>

      <div class="modal fade" id="modalAddDesign" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="width: 30%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">UPLOAD IMAGES</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div style="background: #dbdbdb17; padding: 17px; border-radius: 12px; border: 1px solid #dbd7d6; box-shadow: 0px 0px 13px -7px #444444;">

                        <div class="row">
                           
                                <div class="">
                                    <label for="html5-number-input" class="col-form-label label-custom">Description</label>
                                    <div>
                                        <input type="text" id="txtDescription" class="form-control textbox-border-color" />
                                    </div>
                                
                            </div>

                         <%--   <div style="width: 50%">
                                <div class="">
                                    <label for="html5-number-input" class="col-form-label label-custom">Location</label>
                                    <div>
                                        <input type="text" id="txtLocation" class="form-control textbox-border-color" />
                                    </div>
                                </div>
                            </div>--%>

                        </div>

                         <div class="row">
                        <div class="div-ActiveStatus">
                            <label for="html5-number-input" class="col-form-label label-custom">Is Enable</label>
                            <div>
                                <div class="netliva-switch">
                                    <input type="checkbox" id="cbIsEnabled" netliva-switch="OK">
                                    <label for="cbIsEnabled" data-active-text="Enable" data-passive-text="disable" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696;max-width:55%"></label>
                                </div>
                            </div>
                        </div>
                    </div>


                       <%-- <div class="row">
                            <div style="width: 50%;">
                               <div class="col mb-3 discriptionDiv">
                                     <label for="nameBasic" class="col-form-label label-custom">Address </label>
                                     <textarea  id="txtAddress" rows="3" class="form-control textbox-border-color" placeholder="Enter the Address"></textarea>
                                 </div>
                            </div>

                            <div style="width: 50%;">
                                 <div class="col mb-3 discriptionDiv">
                                     <label for="nameBasic" class="col-form-label label-custom">Remarks </label>
                                     <textarea  id="txtRemarks" rows="3" class="form-control textbox-border-color" placeholder="Enter the Remarks"></textarea>
                                 </div>
                            </div>
                        </div>--%>

                      



                        <div class="row" style="padding-top: 1%;">
                             <div class="col-8 pull-left upload-Attatchment" style="display:block">
                                <div class="input-group mb-3" style="position: relative; top: 10px;">                                   
                                    <input class="form-control UploadFile" type="file" id="colFileUpload"  accept=".pdf,.png,.jpeg" multiple >
                                    <label class="input-group-text UploadFile" for="inputGroupFile02"><i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i></label>

                                   
                                </div>
                              </div>
                             <div class="col-4" style="padding-top:12px;">
                                        <a href="#" id="btnSaveDet" class=" btn btn-primary" style="float: right; width: 95px;">Save</a>
                                    </div>
                        </div>

                      <%--  <div class="row" style="padding-top:1%;">
                            <div class="col-10">
                                </div>

                            <div class="col-2">
                             <a href="#" ID="btnSaveDet" Class=" btn btn-primary" style="float:left;width:95px;">Save</a> 
                                </div>
                        </div>--%>

                    </div>



                </div>
                <div class="modal-footer">
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
    <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />


    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>
    <%--    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>   
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.print.min.js"></script>--%>

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
    <%--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.13.1/datatables.min.css"/>--%>

    <%--     
    <script src="Datatable/js/jquery.dataTables.min.js"></script>--%>

    <%--    <script src="Scripts/SurveyAdmin.js?v=0.7"></script>--%>
    <script src="Js/BrandingMaster.js?v=0.5"></script>

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

 <%--   <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />--%>



    <link href="Css/Style.css" rel="stylesheet" />

    <%--  <link href="Css/Badges.scss" rel="stylesheet" />--%>
    <%--<link href="Css/Badges.scss"/>--%>

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>



  <%--  <link href="../Dashboard/assets/multiselect/example-styles.css" rel="stylesheet" />
    <script src="../Dashboard/assets/multiselect/jquery.multi-select.js"></script>--%>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

</asp:Content>