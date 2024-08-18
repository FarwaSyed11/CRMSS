<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="Quotation.aspx.cs" Inherits="ERM_Quotation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <!-- Flatpicker Datepicker JS/CSS file-->
    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div class="card-body">
            <div>
                <h3 class="mb-3" style="">Quotation</h3>
            </div>

            <div class="card-body" style="margin-top: -1%;">

                <div class="tblfilter" runat="server" id="tbltopsearch">
                    <div class="row">
                        <div class="col-6 d-flex">
                            <div class="input-group">
                                <label class="input-group-text" for="">
                                    <asp:Label ID="Label1" Text="Status" runat="server" />
                                </label>
                                <select id="ddlRequestStatus" class="form-select color-dropdown">
                                       <option value="Pending">Pending Request</option>
                                        <option value="WorkingON">Working On</option>
                                       <option value="Released">Quoted</option>
                                </select>
                            </div>
                        </div>
                      
                    </div>
                </div>


                <div class="ajax-loader loader-bg-blur">
                    <div class="custom-loader ">
                        <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
                        <h4>Loading Data...</h4>
                    </div>
                </div>
                <div class="" style="margin-top: 1%;">
                    <table class="table thead-main-table">

                        <thead>
                            <tr>

                                <th style="display: none">ID</th>
                                <th>EST. Ref</th>
                                <th>Opportunity Number</th>
                                <th>Project Number</th>
                                <th>Name</th>
                                <th>Customer</th>
                                <th>Salesman</th>
                                <th>Due Date</th>
                                 <th>Status</th>
                                <th>view</th>

                            </tr>

                        </thead>
                        <tbody class="tbody-main-table">
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>



    <div class="modal fade" id="NewQuotation" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 97vw!important; max-height: 100vh">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eventModalHeading">Quotation</h5>

                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">

                    <div class="nav-align-left">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-home" id="btnQtnDetails">Quotation Header</button>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-profile" id="btnItemDetails">Item Details</button>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-messages" id="btnReport">Reports</button>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="navs-left-align-home">
                                <div>
                                    <div class="row">
                                         <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Request No</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtRequestNumber" readonly="readonly" />
                                            </div>
                                        </div>
                                        <div class="col-2">
                                           <%-- <label for="html5-number-input" class="col-form-label label-custom">Estimation No</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtEstnumber" readonly="readonly" />
                                            </div>--%>
                                        </div>

                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Quotation No</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtQTNNumber" readonly="readonly" />
                                            </div>
                                        </div>

                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Quotation Date</label>
                                            <i class="icontransform deleteQuotation fa fa-trash" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Submit"></i>

                                            <div class="">
                                                <input type="text" id="txtDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
                                            </div>
                                        </div>




                                    </div>
                                </div>
                                <hr />

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
                                                            <div style="width:100%;">
                                                                <label for="html5-number-input" class="  label-custom">Project Name </label>
                                                                <div class="">
                                                                    <%--<label id="txtPrjName" value="" class="form-control noborderbg" style="">Proposed G+2P+9Typ+HC Bldg Plot#248-428 @ Al Qusais</label>--%>
                                                                    <input type="text" id="txtPrjName"  class="form-control noborderbg" style="background: white;" readonly/>
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

                                                        <div style="padding-top: 2%">

                                                        <table class="table Product-list-table" style="width: 100%;">
                                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                                            <thead>
                                                                <tr style="text-align: center;">
                                                                    <td class="hidden">ReqID</td>
                                                                    <th>Product</th>
                                                                    <th>Remarks</th>
                                                                    <th>Estimation Team</th>
                                                                    <td class="hidden">EH</td>
                                                                    <th>Estimator</th>
                                                                    <td class="hidden">ES</td>
                                                                    <th>Due Date</th>
                                                                    <th>Status</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody class="tbody-Product-list" style="text-align: center;">
                                                            </tbody>
                                                        </table>

                                                    </div>
                                                    <%--<button type="button" class="btn btn-primary btnAddUpdateReq">Start</button>--%>
                                                </div>
                                <%--<div>
                                    <div class="row">
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Client</label>
                                            <div class="">
                                                <div class="input-group">

                                                    <input class="form-control" type="text" value="" id="txtClient" disabled />
                                                  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <label class="col-form-label label-custom" for="basic-default-name">OPT Number</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtOptNumber" disabled />

                                            </div>
                                        </div>
                                        <div class="col-1" style="margin-top: 36px">
                                            <input type="button" id="btnGetOPT" value="Get" class="btn btn-primary d-block" style="font-size: small; display: none !important" />

                                        </div>


                                        <div class="col-3">
                                            <label class="col-form-label label-custom" for="basic-default-name">Project</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtProjectName" />
                                            </div>
                                        </div>

                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Location</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtProjectLocation" />

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Contact</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtAttentionTo" />

                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Address</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtAddress" />
                                            </div>
                                        </div>

                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Tel</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtTel" />
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Email</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtEmail" />
                                            </div>
                                        </div>



                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Price Validity</label>
                                            <div class="">
                                                <select id="ddlPriceValidity" class="form-select color-dropdown">
                                                </select>

                                            </div>
                                        </div>
                                        <div class="col-1" style="margin-top: 36px">
                                            <input type="button" id="btnAddPriceValidity" value="Other" class="btn btn-primary " style="font-size: small;" />

                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Delivery</label>
                                            <div class="">
                                                <select id="ddlDelivery" class="form-select color-dropdown">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-1" style="margin-top: 36px">
                                            <input type="button" id="AddDelivery" value="Other" class="btn btn-primary " style="font-size: small;" />

                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Payment Term</label>
                                            <div class="">
                                                <select id="ddlPaymentTerm" class="form-select color-dropdown">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-1" style="margin-top: 36px">
                                            <input type="button" id="AddPayment" value="Other" class="btn btn-primary " style="font-size: small" />

                                        </div>




                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Bidder Name</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtBidderName" />

                                            </div>
                                        </div>

                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Bank</label>
                                            <div class="">
                                                <div class="list-group" id="BankList" style="height: 100px; overflow-y: scroll">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Speacial Note</label>
                                            <div class="">
                                                <textarea id="txtSpecialNote" class="form-control"></textarea>

                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Cover Page Desc</label>
                                            <div class="">
                                                <textarea id="txtCoverpageDesc" class="form-control"></textarea>

                                            </div>
                                        </div>





                                    </div>
                                    <div class="row">

                                        <div class="col-1">
                                            <label class="col-form-label label-custom" for="basic-default-name">Total Amount</label>
                                            <div class="">
                                                <input type="number" id="txtTotalAmount" class="form-control" value="0.000" readonly>
                                            </div>
                                        </div>


                                        <div class="col-1">
                                            <label for="html5-number-input" class="col-form-label label-custom">Discount</label>
                                            <div class="">
                                                <input type="number" id="txtDiscount" class="form-control" value="0.000" onfocus="Focus(this.id,'0.000')" onblur="Blur(this.id,'0.000')">
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Charges(1) Desc</label>
                                            <div class="">
                                                <input type="text" id="txtFreightChargesDesc" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-1">
                                            <label for="html5-number-input" class="col-form-label label-custom">Amount</label>
                                            <div class="">
                                                <input type="number" id="txtCharges" class="form-control" value="0.000" onfocus="Focus(this.id,'0.000')" onblur="Blur(this.id,'0.000')">
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Charges(2) Desc</label>
                                            <div class="">
                                                <input type="text" id="txtVATDesc" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-1">
                                            <label for="html5-number-input" class="col-form-label label-custom">Amount</label>
                                            <div class="">
                                                <input type="number" id="txtVat" class="form-control" value="0.000" onfocus="Focus(this.id,'0.000')" onblur="Blur(this.id,'0.000')">
                                            </div>
                                        </div>
                                        <div class="col-1">
                                            <label for="html5-number-input" class="col-form-label label-custom">Net Amount</label>
                                            <div class="">
                                                <input type="number" id="txtNetAmount" class="form-control" value="0.000" readonly>
                                            </div>
                                        </div>

                                        <div class="col-2" style="width: 250px;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Total Amount Desc</label>
                                            <div class="">
                                                <input type="text" id="txtTotalAmountDescription" class="form-control">
                                            </div>
                                        </div>






                                    </div>
                                    <div class="row">

                                        <div class="col-12">
                                            <i class="icontransform saveqtnHeader fa fa-floppy-o" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer; margin-left: 15px;" title="Save Header Data"></i>

                                            <i class="icontransform SubmitQuotation fa fa-paper-plane" aria-hidden="true" style="margin-left: 11px; float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Submit"></i>
                                            <i class="icontransform CopyQuotation fa fa-files-o" aria-hidden="true" style="margin-left: 11px; float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Copy"></i>
                                            <i class="icontransform RevisedQuot fa fa-retweet" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Revision"></i>

                                        </div>
                                    </div>

                                </div>--%>

                            </div>

                            <div class="tab-pane fade" id="navs-left-align-profile">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="">
                                            <span><i class="icontransform UploadExcel fa fa-upload" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer; margin-left: 15px" title="Upload Excel"></i></span>
                                            <span><i class="icontransform AddNewItem fa fa-plus" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Add an item"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-1">
                                        <label class="col-form-label label-custom" for="basic-default-name">Total Amount</label>
                                        <div class="">
                                            <input type="number" id="txtTotalAmountview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>


                                    <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Discount</label>
                                        <div class="">
                                            <input type="number" id="txtDiscountview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <label for="html5-number-input" class="col-form-label label-custom">Charges(1) Desc</label>
                                        <div class="">
                                            <input type="text" id="txtFreightChargesDescview" class="form-control" readonly>
                                        </div>
                                    </div>
                                    <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Amount</label>
                                        <div class="">
                                            <input type="number" id="txtChargesview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <label for="html5-number-input" class="col-form-label label-custom">Charges(2) Desc</label>
                                        <div class="">
                                            <input type="text" id="txtVATDescview" class="form-control" readonly>
                                        </div>
                                    </div>
                                    <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Amount</label>
                                        <div class="">
                                            <input type="number" id="txtVatview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>
                                    <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Net Amount</label>
                                        <div class="">
                                            <input type="number" id="txtNetAmountview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>

                                    <div class="col-2" style="width: 250px;">
                                        <label for="html5-number-input" class="col-form-label label-custom">Total Amount Desc</label>
                                        <div class="">
                                            <input type="text" id="txtTotalAmountDescriptionview" class="form-control" readonly>
                                        </div>
                                    </div>






                                </div>



                           <div class="mt-4" style="font-size: 1.3rem;">System(s) List</div>
                                <div class="" style="margin-top: 1%;">
                                    <table class="table table-bordered table-striped table-itemList" style="width: 100%">

                                        <%--<thead style="background-color: #a62b2b">
                                            <tr style="height: 50px">
                                                <th class="hidden" style="width: 5%; text-align: center; vertical-align: middle">Line ID</th>
                                                <th class="hidden" style="width: 5%; text-align: center; vertical-align: middle">ORDER NO</th>
                                                <th class="hidden" style="width: 5%; text-align: center; vertical-align: middle">Group NO</th>
                                                <th style="width: 5%; text-align: center; vertical-align: middle">SL NO</th>
                                                <th class="hidden" style="width: 5%; text-align: center; vertical-align: middle">Parant SL NO</th>
                                                <th style="width: 10%; text-align: center; vertical-align: middle">CRM Product Group</th>
                                                <th style="width: 12%; text-align: center; vertical-align: middle">DESCRIPTION</th>
                                                <th style="width: 7%; text-align: center; vertical-align: middle">BRAND</th>
                                                <th style="width: 6%; text-align: center; vertical-align: middle">MODEL</th>
                                                <th style="width: 5%; text-align: center; vertical-align: middle">AVAILABILITY / COO</th>
                                                <th style="width: 5%; text-align: center; vertical-align: middle">UNIT WEIGHT</th>
                                                <th style="width: 6%; text-align: center; vertical-align: middle">UOM</th>
                                                <th style="width: 6%; text-align: center; vertical-align: middle">QTY</th>
                                                <th style="width: 7%; text-align: center; vertical-align: middle">UNIT PRICE (AED)</th>
                                                <th style="width: 7%; text-align: center; vertical-align: middle">UNIT PRICE</th>
                                                <th style="width: 6%; text-align: center; vertical-align: middle">MARGIN</th>
                                                <th style="width: 8%; text-align: center; vertical-align: middle">AMOUNT</th>
                                                <th style="width: 10%; text-align: center; vertical-align: middle">ACTIONS</th>
                                               
                                            </tr>
                                        </thead>--%>
                                        <tbody class="tbody-itemDetails" style="font-size: smaller;">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="navs-left-align-messages">
                                <div class="row">
                                    <div class="col-3">
                                        <select id="ddlReportType" class="form-select color-dropdown">
                                            <option value="1">General Quotation</option>
                                            <option value="2">General Quotation With Availibility</option>
                                            <option value="3">General Quotation Without Model</option>
                                            <option value="4">Summary</option>
                                            <option value="5">Detailed</option>
                                            <option value="6">Test</option>
                                        </select>
                                    </div>
                                    <div class="col-1">
                                        <input type="button" id="btnLoadReport" value="Load" class="btn btn-primary d-block" style="font-size: small" />
                                    </div>
                                    <div class="col-1">
                                        <input type="button" id="btnDownloadReport" value="Download" class="btn btn-primary d-block" style="font-size: small" />
                                    </div>
                                    <div class="col-1">
                                        <input type="button" id="btnExportExcel" value="Export Excel" class="btn btn-primary d-block" style="font-size: small" />
                                    </div>
                                </div>

                                <iframe id="myIframe" src="" style="height: 1300px; width: 841px;"></iframe>



                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>






    <script type="text/javascript">
        var currUserId = '';
        var EmpNo = '';
        var myrole = '';
        var myrole = '';
        var overAllPerfo = 0;
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';
        });

    </script>

    <!-- Bootstrap JS/CSS file-->
    <link href="bootstrap-5.2.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>

    <!-- Toaster JS/CSS file-->
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>



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

    <!-- Page JS/CSS file -->
    <script src="Scripts/Quotation.js?v=1"></script>

    <script src="script/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />

      <script src="Assets/Js/multiple-select.js"></script>
      <link href="../sitesurvey/Assets/Css/multiple-select.css" rel="stylesheet" />


</asp:Content>

