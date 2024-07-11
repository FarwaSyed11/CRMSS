<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/EconnectNew.master" CodeFile="FinanceDashboard.aspx.cs" Inherits="CRMSDashboards_FinanceDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">

    <link href="bootstrap-5.2.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="../Dashboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .width-13 {
            width: 13.75%;
        }

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

        .profile-user-img {
            border: 1px solid #ffffff;
            margin: 0 0;
            box-shadow: 2px 2px 5px 3px #dfdfdf;
            padding: 1px;
        }

        .img-circle {
            border-radius: 50%;
        }

        .img-fluid {
            max-width: 100%;
            height: auto;
        }


        .inforow {
            display: flex;
        }

        .infocards {
            font-size: 11px;
            text-align: center;
            padding: 10px;
            border: 1px solid #e4e4e4;
            margin: 5px;
            position: relative;
            width: -webkit-fill-available;
        }

        .totalentered {
            border-top: 1px solid #fe8c3a;
        }

        .totalbooked {
            border-top: 1px solid #2ADCA6;
        }

        .totalclosed {
            border-top: 1px solid #FF233D;
        }

        .value {
            right: 8px;
            font-weight: 600;
            top: 42px;
        }
    </style>

    <div class="container-fluid" style="margin-top: 1%; width: 98%;">
        <div class="card">
            <div class="row m-2" style="">

                <div class="col-4">
                    <div style="color: black; font-size: 26px; font-weight: 400; word-wrap: break-word; margin: 10px 0">Dashboard</div>
                </div>
                <div class="col-8 mb-2 ptfilter">
                    <div class="row">
                        <div class="width-18">
                            <span class="form-label">Territory</span>
                            <select class="form-select" id="territoryFilter" placeholder="Select Authority">
                                <option value="-1">terriroty</option>
                            </select>
                        </div>
                        <div class="width-18">
                            <span class="form-label">Company</span>
                            <select class="form-select" id="companyFilter" placeholder="Select Authority" multiple>
                                <option value="-1">company</option>
                            </select>
                        </div>
                        <div class="width-18">
                            <span class="form-label">Manager</span>
                            <select class="form-select" id="managerFilter" placeholder="Select Authority">
                                <option value="-1">manager</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="width-18">
                            <span class="form-label">Salesman</span>
                            <select class="form-select" id="salesmanFilter" placeholder="Select Authority">
                                <option value="-1">salesman</option>
                            </select>
                        </div>
                        <%--<div class="width-13">
                            <span class="form-label">Year to Date</span>
                            <select class="form-select" id="yeardateFilter" placeholder="Select Authority">
                                <option value="-1">year to date</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>--%>
                        <div class="width-18">
                            <span class="form-label">Year</span>
                            <select class="form-select" id="yearFilter" placeholder="Select Authority">
                            </select>
                        </div>
                        <%-- <div class="width-13">
                            <span class="form-label">Month</span>
                            <select class="form-select" id="monthFilter" placeholder="Select Authority">
                                <option value="-1">month</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>--%>
                        <div class="" style="width: 1%">
                            <button type="button" class="btn btn-primary mt-4" id="btngoFilter">
                                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 16 16">
                                    <path fill="#ffffff" d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0a5.5 5.5 0 0 1 11 0" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="">
            <div class="col-6">
                <div class="card p-3 d-flex flex-row justify-content-between" style="height: 280px;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-4">
                                <div class="d-flex">
                                    <div class="d-flex flex-column align-items-center pe-5 border-end" style="">
                                        <img class="profile-user-img img-fluid img-circle image--cover" id="imgUser2" style="height: 120px; width: 120px;"
                                            src="" <%--<img src="" class="image--cover"  id="imgUser" /--%> alt="User profile picture">
                                        <div class="d-flex flex-column align-items-center mt-3 " style="">
                                            <h6 class="profile-username text-center" id="lbFirstName"></h6>
                                            <p class="text-muted" id="" style="">Have a good day!</p>
                                            <%--<p class="text-muted" id="lbProfPosition" style=""></p>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-8">
                                <h6 class="text-center">Your Performance</h6>
                                <div style="width: 90%;">
                                    <div style="width: 100%; height: 50px; position: relative">
                                        <div style="width: 30%; height: 50px; left: 0px; top: 0px; position: absolute; background: #DA0D0D; border-top-left-radius: 50px; border-bottom-left-radius: 50px;">
                                            <div style="left: 32%; top: 13.78px; position: absolute; color: white;">Very Bad</div>
                                        </div>
                                        <div style="width: 20%; height: 50px; left: 30%; top: 0px; position: absolute">
                                            <div style="width: 100%; height: 50px; left: 0px; top: 0px; position: absolute; background: #F21818"></div>
                                            <div style="left: 34%; top: 13.78px; position: absolute; color: white;">Bad</div>
                                        </div>
                                        <div style="width: 20%; height: 50px; left: 50%; top: 0px; position: absolute">
                                            <div style="width: 100%; height: 50px; left: 0px; top: 0px; position: absolute; background: #FFE601"></div>
                                            <div style="left: 34%; top: 13.78px; position: absolute; color: white;">Med</div>
                                        </div>
                                        <div style="width: 20%; height: 50px; left: 70%; top: 0px; position: absolute">
                                            <div style="width: 100%; height: 50px; left: 0px; top: 0px; position: absolute; background: rgba(126.82, 185.94, 67.71, 0.70)"></div>
                                            <div style="height: 27.56px; left: 30%; top: 13.78px; position: absolute; color: white;">Good</div>
                                        </div>
                                        <div style="width: 10%; height: 50px; left: 90%; top: 0px; position: absolute">
                                            <div style="width: 100%; height: 50px; left: 0px; top: 0px; position: absolute; background: #7FBA44; border-bottom-right-radius: 50px; border-top-right-radius: 50px"></div>
                                            <div style="height: 1.56px; left: 18%; top: 5.78px; position: absolute; color: white; font-size: small;">Very Good</div>
                                        </div>
                                    </div>
                                </div>
                                <div id="MeterPerf" style="width: 100%">
                                    <img src="image/perfindicator.svg" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-2">
                <div class="card p-3 d-flex flex-row justify-content-between" style="height: 280px;">
                    <div class="card-body">
                        Sales Order <b>%</b>
                        <div id="SOperc"></div>
                        <div class="row">
                            <div class="col-6 border-end">
                                <div class="text-center " style="font-size: 10px;">
                                    Achievement
                                    <div class="text-danger fs-6" id="valSOAchievement">--</div>
                                </div>

                            </div>
                            <div class="col-6">
                                <div class="text-center " style="font-size: 10px;">
                                    Target
                                    <div class="text-success  fs-6" id="valSOTarget">--</div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="row">
                            <div class="col-6 border-end">
                                <div class="text-center" style="font-size: 10px;">
                                    <div class="text-muted fs-5">--</div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="text-center" style="font-size: 10px;">
                                    <div class="text-muted fs-5" id="valOverallSO">--</div>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
            <div class="col-2">
                <div class="card p-3 d-flex flex-row justify-content-between" style="height: 280px;">
                    <div class="card-body">
                        Invoice  <b>%</b>
                        <div id="InvcPerc"></div>
                        <div class="row">
                            <div class="col-6 border-end">
                                <div class="text-center" style="font-size: 10px;">
                                    Achievement
                                    <div class="text-danger fs-6" id="valINVAchievement">--</div>
                                </div>

                            </div>
                            <div class="col-6">
                                <div class="text-center" style="font-size: 10px;">
                                    Target
                                    <div class="text-success fs-6" id="valINVTarget">--</div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="row">
                            <div class="col-12">
                                <div class="text-center" style="font-size: 10px;">
                                    <div class="text-muted fs-5" id="valOverallINV">--</div>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
            <div class="col-2">
                <div class="card p-3 d-flex flex-row justify-content-between" style="height: 280px;">
                    <div class="card-body">
                        Collection  <b>%</b>
                        <div id="CollectPerc"></div>
                        <div class="row">
                            <div class="col-6 border-end">
                                <div class="text-center" style="font-size: 10px;">
                                    Achievement
                                    <div class="text-danger fs-6" id="valCOAchievement">--</div>
                                </div>

                            </div>
                            <div class="col-6">
                                <div class="text-center" style="font-size: 10px;">
                                    Target
                                    <div class="text-success fs-6" id="valCOTarget">--</div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="row">
                            <div class="col-12">
                                <div class="text-center" style="font-size: 10px;">
                                    <div class="text-muted fs-5" id="valOverallCollection">--</div>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-4">
                <div class="card" style="height: 330px;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6">
                                <div class="float-start">Year To Date Sales Order</div>
                            </div>
                            <div class="col-6">
                                <div class="float-end border rounded-2 bg-light bg-gradient px-2 fs-6">This Year VS Last Year</div>
                            </div>
                        </div>
                        <div class="text-danger position-relative mt-2">
                            <h5 id="valSOYTD">--</h5>
                            <div class="position-absolute" style="top: 14px; font-size: 10px; left: 69px;">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="inforow">
                                            <div class="infocards totalentered">
                                                <div>
                                                    <img src="image/ydsTotEntered.svg" />
                                                </div>
                                                <div class="me-2 my-1">Total Entered</div>
                                                <div class="value position-absolute"></div>
                                                <div id="valTotEntered">--</div>
                                            </div>
                                            <div class="infocards totalbooked">
                                                <div>
                                                    <img src="image/ydsTotBooked.svg" />
                                                </div>
                                                <div class="me-2 my-1">Total Booked</div>
                                                <div class="value position-absolute"></div>
                                                <div id="valTotBooked">--</div>
                                            </div>
                                            <div class="infocards totalclosed">
                                                <div>
                                                    <img src="image/ydsTotClosed.svg" />
                                                </div>
                                                <div class="me-2 my-1">Total Closed</div>
                                                <div class="value position-absolute"></div>
                                                <div id="valTotClosed">--</div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="col-12 mt-2">
                                        Confirm Order
                                        <table class="" style="font-size: 12px; background: rgb(70 181 141 / 30%) !important;">
                                            <tbody>
                                                <tr style="background: rgb(70 181 141 / 30%) !important; font-weight: 600;">
                                                    <td style="padding: 10px !important;">Info</td>
                                                    <td style="padding: 10px !important;">Invoice Amount</td>
                                                    <td style="padding: 10px !important;">Pending For Invoice</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 10px !important; font-weight: 600;">Value</td>
                                                    <td style="padding: 10px !important;" id="valInvAmount">--</td>
                                                    <td style="padding: 10px !important;" id="valPendingInv">--</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-4">
                                <div id="salesorderrange"></div>
                                <div class="row">
                                    <div class="col-6 border-end">
                                        <div class="text-center " style="font-size: 10px;">
                                            This Year
                                            <div class="text-danger fs-6" id="valSOThisYear">--</div>
                                        </div>

                                    </div>
                                    <div class="col-6">
                                        <div class="text-center " style="font-size: 10px;">
                                            Last Year
                                            <div class="text-success  fs-6" id="valSOLastYear">--</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card" style="height: 330px;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6">
                                <div class="float-start">Year To Date Invoice</div>
                            </div>
                            <div class="col-6">
                                <div class="float-end border rounded-2 bg-light bg-gradient px-2 fs-6">This Year VS Last Year</div>
                            </div>
                        </div>
                        <div class="text-danger position-relative mt-2">
                            <h5 id="valInvoiceYTD">--</h5>
                            <div class="position-absolute" style="top: 14px; font-size: 10px; left: 69px;">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="inforow">
                                            <div class="infocards totalentered">
                                                <div>
                                                    <img src="image/ydiCollected.svg" />
                                                </div>
                                                <div class="me-2 my-1">Collected</div>
                                                <div id="valCollected">--</div>
                                            </div>
                                            <div class="infocards totalclosed">
                                                <div>
                                                    <img src="image/ydiNotCollected.svg" />
                                                </div>
                                                <div class="me-2 my-1">Not Collected</div>
                                                <div id="valNotCollected">--</div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="col-12 mt-2">
                                        Pending For Collection
                                        <table class="" style="font-size: 12px; background: rgb(220 204 255 / 30%) !important">
                                            <tbody>
                                                <tr style="background: rgb(220 204 255 / 80%) !important; font-weight: 600;">
                                                    <td style="padding: 10px !important;">Info</td>
                                                    <td style="padding: 10px !important;">Pending Due</td>
                                                    <td style="padding: 10px !important;">Pending Not due</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 10px !important; font-weight: 600;">Value</td>
                                                    <td style="padding: 10px !important;" id="valPendingDue">--</td>
                                                    <td style="padding: 10px !important;" id="valPendingNotDue">--</td>

                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-4">
                                <div id="invoicerange"></div>
                                <div class="row">
                                    <div class="col-6 border-end">
                                        <div class="text-center" style="font-size: 10px;">
                                            This Year
                                            <div class="text-danger fs-6" id="valINVThisYear">--</div>
                                        </div>

                                    </div>
                                    <div class="col-6">
                                        <div class="text-center" style="font-size: 10px;">
                                            Last Year
                                            <div class="text-success fs-6" id="valINVLastYear">--</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card" style="height: 330px;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6">
                                <div class="float-start">Year To Date Collection</div>
                            </div>
                            <div class="col-6">
                                <div class="float-end border rounded-2 bg-light bg-gradient px-2 fs-6">This Year VS Last Year</div>
                            </div>
                        </div>
                        <div class="text-danger position-relative mt-2">
                            <h5 id="valCOYTD">--</h5>
                            <div class="position-absolute" style="top: 14px; font-size: 10px; left: 69px;">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="inforow">
                                            <div class="infocards totalentered">
                                                <div>
                                                    <img src="image/ydcCleared.svg" />
                                                </div>
                                                <div class="me-2 my-1">Cleared</div>
                                                <div id="valCleared">--</div>
                                            </div>
                                            <div class="infocards totalbooked">
                                                <div>
                                                    <img src="image/ydcremitted.svg" />
                                                </div>
                                                <div class="me-2 my-1">Remitted</div>
                                                <div id="valRemitted">--</div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="col-12 mt-2">
                                        Pending For Collection
                                        <table class="" style="font-size: 12px; background: #BBE3FF !important">
                                            <tbody>
                                                <tr style="background: #84CCFF !important; font-weight: 600;">
                                                    <td style="padding: 10px !important;">Info</td>
                                                    <td style="padding: 10px !important;">Matured</td>
                                                    <td style="padding: 10px !important;">Not Matured</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 10px !important; font-weight: 600;">Value</td>
                                                    <td style="padding: 10px !important;" id="valMatured">--</td>
                                                    <td style="padding: 10px !important;" id="valNotMatured">--</td>

                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-4">
                                <div id="collectionrange"></div>
                                <div class="row">
                                    <div class="col-6 border-end">
                                        <div class="text-center" style="font-size: 10px;">
                                            This Year
                                            <div class="text-danger fs-6" id="valCOThisYear">--</div>
                                        </div>

                                    </div>
                                    <div class="col-6">
                                        <div class="text-center" style="font-size: 10px;">
                                            Last Year
                                            <div class="text-success fs-6" id="valCOLastYear">--</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-4">
                <div class="card" style="height: 480px;">
                    <div class="card-body">
                        <div class="dashcard">
                            <nav class="nav-tab">
                                <ul class="nav nav-pills" id="pills-tab-salesgrwoth" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="pill-sales-order-tab" data-bs-toggle="pill" data-bs-target="#sales-order-tab" type="button" role="tab" aria-controls="sales-order-tab" aria-selected="true">Sales Order</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="pill-invoice-tab" data-bs-toggle="pill" data-bs-target="#Invoice-tab" type="button" role="tab" aria-controls="Invoice-tab" aria-selected="false">Invoice</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="pill-collection-tab" data-bs-toggle="pill" data-bs-target="#pill-collection" type="button" role="tab" aria-controls="pill-collection" aria-selected="false">Collection</button>
                                    </li>
                                </ul>
                            </nav>
                            <div class="tab-content" id="pills-sgContent">
                                <div class="tab-pane fade show active" id="sales-order-tab" role="tabpanel" aria-labelledby="pill-sales-order-tab">
                                    <div class="" id="sg-SalesOrder"></div>
                                    <p class="text-center text-muted">Sales Growth</p>
                                </div>
                                <div class="tab-pane fade" id="Invoice-tab" role="tabpanel" aria-labelledby="pill-invoice-tab">
                                    <div class="" id="sg-Invoice"></div>
                                    <p class="text-center text-muted">Sales Growth</p>
                                </div>
                                <div class="tab-pane fade" id="pill-collection" role="tabpanel" aria-labelledby="pill-collection-tab">
                                    <div class="" id="sg-Collection"></div>
                                    <p class="text-center text-muted">Sales Growth</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-5">
                <div class="card" style="height: 480px;">
                    <div class="card-body">
                        <div class="dashcard">
                            <nav id="nav-tab">
                                <ul class="nav nav-pills" id="pills-tab-currentvsprev" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="cppill-sales-order-tab" data-bs-toggle="pill" data-bs-target="#cp-sales-order-tab" type="button" role="tab" aria-controls="cp-sales-order-tab" aria-selected="true">Sales Order</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="cppill-invoice-tab" data-bs-toggle="pill" data-bs-target="#cp-Invoice-tab" type="button" role="tab" aria-controls="cp-Invoice-tab" aria-selected="false">Invoice</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="cppill-collection-tab" data-bs-toggle="pill" data-bs-target="#cp-pill-collection" type="button" role="tab" aria-controls="cp-pill-collection" aria-selected="false">Collection</button>
                                    </li>
                                </ul>
                            </nav>
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="cp-sales-order-tab" role="tabpanel" aria-labelledby="cppill-sales-order-tab">
                                    <div class="" id="cp-SalesOrder"></div>
                                    <p class="text-center text-muted">Current Year VS Previous Year</p>
                                </div>
                                <div class="tab-pane fade" id="cp-Invoice-tab" role="tabpanel" aria-labelledby="cppill-invoice-tab">
                                    <div class="" id="cp-Invoice"></div>
                                    <p class="text-center text-muted">Current Year VS Previous Year</p>
                                </div>
                                <div class="tab-pane fade" id="cp-pill-collection" role="tabpanel" aria-labelledby="cppill-collection-tab">
                                    <div class="" id="cp-Collection"></div>
                                    <p class="text-center text-muted">Current Year VS Previous Year</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="card" style="height: 480px;">
                    <div class="card-body">
                        Aging by Entered Sales Order
                        <div style="position: relative; margin-top: 15px;">
                            <div style="">
                                <div class="lowest" style="width: 80%; margin-left: 10px; height: 80px;"></div>
                                <div class="low" style="width: 80%; height: 80px; left: 10px; top: 100%; position: absolute;"></div>
                                <div class="med" style="width: 80%; height: 80px; left: 10px; top: 200%; position: absolute;"></div>
                                <div class="high" style="width: 80%; height: 80px; left: 10px; top: 300%; position: absolute;"></div>
                                <div class="highest" style="width: 80%; height: 80px; left: 10px; top: 400%; position: absolute;"></div>
                            </div>
                            <div style="left: 26px; bottom: 99px; position: relative;">
                                <div style="width: 12%; right: 44px; top: 43px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; word-wrap: break-word">less than a month</div>
                                <div style="right: 44px; top: 122px; width: 53px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; word-wrap: break-word">less than 3 months</div>
                                <div style="right: 38px; width: 58px; top: 205px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; word-wrap: break-word">less than 6 months</div>
                                <div style="right: 44px; width: 52px; top: 285px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; word-wrap: break-word">less than a year</div>
                                <div style="right: 26px; top: 363px; width: 70px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; word-wrap: break-word">greater than a year</div>
                                <div id="divoneTofive" style="width: 20%; l; left: 35%; top: 35px; position: absolute; color: #343434; font-size: 13px; font-weight: bold; word-wrap: break-word">-</div>
                                <div id="divoneTofiveval" style="width: 20%; l; left: 35%; top: 50px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">--</div>
                                <div id="divdixToten" style="width: 20%; left: 35%; top: 115px; position: absolute; color: #343434; font-size: 14px; font-weight: bold; word-wrap: break-word">-</div>
                                <div id="divdixTotenval" style="width: 20%; left: 35%; top: 130px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">--</div>
                                <div id="divlevenToFifteen" style="width: 20%; left: 35%; top: 195px; position: absolute; color: #343434; font-size: 14px; font-weight: bold; word-wrap: break-word">-</div>
                                <div id="divlevenToFifteenval" style="width: 20%; left: 35%; top: 210px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">--</div>
                                <div id="divsixteenToTwenty" style="width: 20%; left: 35%; top: 276px; position: absolute; color: #343434; font-size: 14px; font-weight: bold; word-wrap: break-word">-</div>
                                <div id="divsixteenToTwentyval" style="width: 20%; left: 35%; top: 290px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">--</div>
                                <div id="divtwentyToTwefive" style="width: 20%; left: 35%; top: 355px; position: absolute; color: #343434; font-size: 14px; font-weight: bold; word-wrap: break-word">-</div>
                                <div id="divtwentyToTwefiveval" style="width: 20%; left: 35%; top: 370px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">--</div>

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
        var rolesList = '';


        var loggedInUserName = '';
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';
        });
    </script>

    <script src="script/FinanceDashboard.js"></script>
    <link rel="stylesheet" href="css/FinalisedDashboard.css" />
    <script src="bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>

    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

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

    <script src="script/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />
</asp:Content>
